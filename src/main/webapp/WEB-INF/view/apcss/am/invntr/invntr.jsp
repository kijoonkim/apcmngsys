<%
/**
 * @Class Name : invntr.jsp
 * @Description : 재고정보조회 화면
 * @author SI개발부
 * @since 2023.10.23
 * @version 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      	수정내용
 * @ ----------	----------	---------------------------
 * @ 2023.10.23   	김호			최초 생성
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
	<section>
		<div class="box box-solid"">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 재고정보조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger" onclick="fn_selectGridList()">조회</sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<!--[APC] START -->
				<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
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
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required" ></span>기준일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-crtrYmd" name="srch-dtp-crtrYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btnSrchPrdcr"
									name="btnSrchPrdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기"
									uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm"
									unselected-text="전체"
									jsondata-ref="jsonComItem"
									onchange="fn_selectItem"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" class="form-control input-sm" maxlength="33" show-clear-button="true" readonly></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
						</tr>

						<tr>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-spcfctCd"
									name="srch-slt-spcfctCd"
									class="form-control input-sm"
									jsondata-ref="jsonComSpcfct"
								/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-warehouseSe"
									name="srch-slt-warehouseSe"
									class="form-control input-sm"
									jsondata-ref="jsonComWarehouse"
								/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">상품구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-gdsSeCd" name="srch-slt-gdsSeCd" class="form-control input-sm" jsondata-ref="jsonComGdsSeCd"/>
							</td>
							<td colspan="3">&nbsp;</td>
						</tr>

						<tr>
							<th scope="row" class="th_bg">입고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-wrhsSeCd"
									name="srch-slt-wrhsSeCd"
									class="form-control input-sm"
									jsondata-ref="jsonComWrhsSeCd"
								/>
							</td>
							<td class="td_input" colspan="2" style="border-right: hidden;"></td>
							<th scope="row" class="th_bg">비고</th>
							<td class="td_input" colspan="3">
								<sbux-input uitype="text" id="srch-inp-rmrk" name="srch-inp-rmrk" class="form-control input-sm"/>
							</td>
						</tr>
					</tbody>
				</table>


				<div class="ad_tbl_toplist">
						<sbux-button uitype="normal" id="srch-btn-rawmtrInvntrDsctn" name="srch-btn-rawmtrInvntrDsctn" class="btn btn-sm btn-outline-danger" text="원물재고 내역" onclick="fn_sample1()"></sbux-button>
						<sbux-button uitype="normal" id="srch-btn-sortInvntrDsctn" name="srch-btn-sortInvntrDsctn" class="btn btn-sm btn-outline-danger" text="선별재고 내역" onclick="fn_sample2()"></sbux-button>
						<sbux-button uitype="normal" id="srch-btn-gdsInvntrDsctn" name="srch-btn-gdsInvntrDsctn" class="btn btn-sm btn-outline-danger" text="상품재고 내역" onclick="fn_sample3()"></sbux-button>
				</div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="rawMtrInvntrGridArea" style="height:506px;"></div>
                    <div id="sortInvntrGridArea" style="height:506px;"></div>
                    <div id="gdsInvntrGridArea" style="height:506px;"></div>
                </div>
			</div>
		</div>
	</section>
	<!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" header-is-close-button="false" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
    <!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

	var jsonComItem			= [];	// 품목 		itemCd			검색
	var jsonComSpcfct		= [];	// 규격 		spcfctCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouseSeCd	검색
	var jsonComWrhsSeCd		= [];	// 창고 		warehouseSeCd	검색
	var jsonComFcltCd		= [];	// 선별기 	fcltCd			검색
	var jsonComGdsSeCd		= [];	// 상품구분 	gdsSeCd			검색
	var jsonComWrhsSeCd		= [];	// 입고구분 	wrhsSeCd		검색

	/*생산자 팝업 및 초성검색 */
	var jsonDataPrdcr = [];
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];
    var autoCompleteDataJson = [];

	const fn_initSBSelect = async function() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSe', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
		 	gfn_setComCdSBSelect('srch-slt-wrhsSeCd', 		jsonComWrhsSeCd, 	'WRHS_SE_CD'),							// 입고구분
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),						// 품목
		 	gfn_setComCdSBSelect('srch-slt-fcltCd', 		jsonComFcltCd, 		'FCLT_CD',   	gv_selectedApcCd),		// 선벌기
		 	gfn_setComCdSBSelect('srch-slt-gdsSeCd', 		jsonComGdsSeCd, 	'GDS_SE_CD', 	gv_selectedApcCd)		// 상품구분
		])
		SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true');

		fn_getPrdcrs();
	}

	var checkSection = 1;


	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_sample1();
		SBUxMethod.set("srch-dtp-crtrYmd", gfn_dateToYmd(new Date()));
		fn_initSBSelect();
	});

	var rawMtrInvntrGrid; // 그리드를 담기위한 객체 선언
	var sortInvntrGrid; // 그리드를 담기위한 객체 선언
	var gdsInvntrGrid; // 그리드를 담기위한 객체 선언
	function fn_sample1(){
		// "srch-slt-spcfctCd"
		SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true')

		$("#srch-btn-rawmtrInvntrDsctn").css({"background-color":"#149FFF","color":"white"});
		$("#srch-btn-sortInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-gdsInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#rawMtrInvntrGridArea").show();
		$("#sortInvntrGridArea").hide();
		$("#gdsInvntrGridArea").hide();
		fn_createGrid1();
	}
	function fn_sample2(){
		$("#srch-btn-rawmtrInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-sortInvntrDsctn").css({"background-color":"#149FFF","color":"white"});
		$("#srch-btn-gdsInvntrDsctn").css({"background-color":"white","color":"black"});
		SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false');
		$("#rawMtrInvntrGridArea").hide();
		$("#sortInvntrGridArea").show();
		$("#gdsInvntrGridArea").hide();
		fn_createGrid2();
	}
	function fn_sample3(){
		$("#srch-btn-rawmtrInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-sortInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-gdsInvntrDsctn").css({"background-color":"#149FFF","color":"white"});
		SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false');
		$("#rawMtrInvntrGridArea").hide();
		$("#sortInvntrGridArea").hide();
		$("#gdsInvntrGridArea").show();
		fn_createGrid3();
	}

	var jsonRawMtrInvntr = [];
	function fn_createGrid1() {
		checkSection = 1;
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'rawMtrInvntrGridArea';
	    SBGridProperties.id = 'rawMtrInvntrGrid';
	    SBGridProperties.jsonref = 'jsonRawMtrInvntr';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList1;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
	        {caption: ["입고번호","입고번호"],		ref: 'wrhsno',      type:'output', hidden: true},
	        {caption: ["팔레트번호","팔레트번호"],	ref: 'pltno',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["입고일자","입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'90px',    style:'text-align:center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["생산자","생산자"],			ref: 'prdcrNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["품목","품목"],				ref: 'itemNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["품종","품종"],				ref: 'vrtyNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["상품","상품"],				ref: 'gdsSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["입고","입고"],				ref: 'wrhsSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["운송","운송"],				ref: 'trsprtSeNm',      type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["창고","창고"],				ref: 'warehouseSeNm',   type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["입고","수량"],				ref: 'wrhsQntt',      	type:'output',  width:'85px',    style:'text-align:center'},
	        {caption: ["입고","중량"],				ref: 'wrhsWght',      	type:'output',  width:'85px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["투입","수량"],				ref: 'inptQntt',      	type:'output',  width:'85px',    style:'text-align:center'},
	        {caption: ["투입","중량"],				ref: 'inptWght',      	type:'output',  width:'85px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["현 재고","수량"],			ref: 'invntrQntt',      type:'output',  width:'85px',    style:'text-align:center'},
	        {caption: ["현 재고","중량"],			ref: 'invntrWght',      type:'output',  width:'85px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["비고","비고"],				ref: 'rmrk',      		type:'output',  width:'90px',    style:'text-align:center'}
	    ];

	    rawMtrInvntrGrid = _SBGrid.create(SBGridProperties);
	    rawMtrInvntrGrid.bind( "beforepagechanged" , "fn_pagingGrd" );

		fn_selectGridList();
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
            "callback": fn_personalSave1,		//콜백함수명
        },
        "personalLoad" : {
        	"name": "개인화 호출",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "l",					//단축키
            "callback": fn_personalLoad1,		//콜백함수명
        },
        "colHidden" : {
        	"name": "열 숨기기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "h",					//단축키
            "callback": fn_colHidden1,			//콜백함수명
        },
        "colShow" : {
        	"name": "열 보이기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "w",					//단축키
            "callback": fn_colShow1,			//콜백함수명
        }
    };

    // 엑셀 다운로드
    function fn_excelDwnld1() {
   	 rawMtrInvntrGrid.exportLocalExcel("원물재고", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave1(){
   	 rawMtrInvntrGrid.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad1(){
   	 rawMtrInvntrGrid.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden1(){
   	 rawMtrInvntrGrid.setColHidden(rawMtrInvntrGrid.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow1(){
    	for(let i = rawMtrInvntrGrid.getFixedCols(); i < rawMtrInvntrGrid.getCols()-1; i++) {
    		rawMtrInvntrGrid.setColHidden(i, false);
    	}
	}

	//조회
    const fn_selectGridList = async function() {
    	var inptCmndDsctnList;
    	if(checkSection == 1 ){
    		inptCmndDsctnList = rawMtrInvntrGrid;
    	}else if(checkSection == 2){
    		inptCmndDsctnList = sortInvntrGrid;
    	}else if(checkSection == 3){
    		inptCmndDsctnList = gdsInvntrGrid;
    	}
    	inptCmndDsctnList.rebuild();
    	let pageSize = inptCmndDsctnList.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsonRawMtrInvntr.length = 0;
    	jsonSortInvntr.length = 0;
    	jsonGdsInvntr.length = 0;
    	inptCmndDsctnList.clearStatus();

    	//검색조건
    	let crtrYmd  = SBUxMethod.get("srch-dtp-crtrYmd");	//기준일자

    	if(checkSection == 1 ){
    		fn_callSelectGrid1List(pageSize, pageNo);
    	}else if(checkSection == 2){
    		fn_callSelectGrid2List(pageSize, pageNo);
    	}else if(checkSection == 3){
    		fn_callSelectGrid3List(pageSize, pageNo);
    	}
	}
    var newSortInptPrfmncGridData = [];
	const fn_callSelectGrid1List = async function(pageSize, pageNo) {

		let crtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let gdsSeCd = SBUxMethod.get("srch-slt-gdsSeCd");
		let wrhsSeCd = SBUxMethod.get("srch-slt-wrhsSeCd");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSe");
		let url = "";
		if(crtrYmd == gfn_dateToYmd(new Date()) || crtrYmd == null){
			url = "/am/invntr/selectRawMtrInvntrList.do";
			crtrYmd = "";
		}else{
			// 재고 이력 테이블
			url = "/am/invntr/selectDailyRawMtrInvntrList.do";
		}

		const postJsonPromise1 = gfn_postJSON(url, {
			  apcCd					: gv_selectedApcCd
			, crtrYmd				: crtrYmd
			, itemCd				: itemCd
			, vrtyCd				: vrtyCd
			, prdcrCd				: prdcrCd
			, gdsSeCd				: gdsSeCd
			, wrhsSeCd				: wrhsSeCd
			, warehouseSeCd			: warehouseSeCd
          	// pagination
  	  		, pagingYn 				: 'Y'
  	  		, currentPageNo 		: pageNo
  	  		, recordCountPerPage 	: pageSize

  		});

        let data1 = await postJsonPromise1;

  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonRawMtrInvntr.length = 0;
          	data1.resultList.forEach((item, index) => {
          		const rawMtrInvntr = {
       				wrhsno			: item.wrhsno
       			  , pltno			: item.pltno
       			  , wrhsYmd			: item.wrhsYmd
       			  , prdcrNm			: item.prdcrNm
       			  , itemNm			: item.itemNm
       			  , vrtyNm			: item.vrtyNm
       			  , gdsSeNm			: item.gdsSeNm
       			  , wrhsSeNm		: item.wrhsSeNm
       			  , trsprtSeNm		: item.trsprtSeNm
       			  , warehouseSeNm	: item.warehouseSeNm
       			  , bxknd			: item.bxknd
       			  , grdNm			: item.grdNm
       			  , wrhsQntt		: item.wrhsQntt
       			  , wrhsWght		: item.wrhsWght
       			  , inptQntt		: item.inptQntt
       			  , inptWght		: item.inptWght
       			  , invntrQntt		: item.invntrQntt
       			  , invntrWght		: item.invntrWght
       			  , rmrk			: item.rmrk
  				}
          		jsonRawMtrInvntr.push(rawMtrInvntr);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
          	if (jsonRawMtrInvntr.length > 0) {
          		if(rawMtrInvntrGrid.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			rawMtrInvntrGrid.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			rawMtrInvntrGrid.rebuild();
  				}else{
  					rawMtrInvntrGrid.refresh();
  				}
          	} else {
          		rawMtrInvntrGrid.setPageTotalCount(totalRecordCount);
          		rawMtrInvntrGrid.rebuild();
          	}

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
    }
	//원물재고 내역 조회 끝

	var jsonSortInvntr = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid2() {
		checkSection = 2;
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sortInvntrGridArea';
	    SBGridProperties.id = 'sortInvntrGrid';
	    SBGridProperties.jsonref = 'jsonSortInvntr';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList2;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
	        {caption: ["선별번호","선별번호"],		ref: 'sortno',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["등급","등급"],				ref: 'grdNm',      		type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["투입일자","투입일자"],		ref: 'inptYmd',      	type:'output',  width:'105px',    style:'text-align:center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["설비","설비"],				ref: 'fcltNm',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],			ref: 'prdcrNm',      	type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["품목","품목"],				ref: 'itemNm',     		type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["품종","품종"],				ref: 'vrtyNm',      	type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["규격","규격"],				ref: 'spcfctNm',      	type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["창고","창고"],				ref: 'warehouseSeNm',   type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["선별","수량"],				ref: 'sortQntt',      	type:'output',  width:'85px',    style:'text-align:center'},
	        {caption: ["선별","중량"],				ref: 'sortWght',      	type:'output',  width:'85px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["포장","수량"],				ref: 'pckgQntt',      	type:'output',  width:'85px',    style:'text-align:center'},
	        {caption: ["포장","중량"],				ref: 'pckgWght',     	type:'output',  width:'85px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["현 재고","수량"],			ref: 'invntrQntt',      type:'output',  width:'85px',    style:'text-align:center'},
	        {caption: ["현 재고","중량"],			ref: 'invntrWght',      type:'output',  width:'85px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["비고","비고"],				ref: 'rmrk',      		type:'output',  width:'105px',    style:'text-align:center'}
	    ];

	    sortInvntrGrid = _SBGrid.create(SBGridProperties);
	    sortInvntrGrid.bind( "beforepagechanged" , "fn_pagingGrd" );

	    fn_selectGridList();
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
        },
        "personalSave" : {
        	"name": "개인화 저장",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "s",					//단축키
            "callback": fn_personalSave2,		//콜백함수명
        },
        "personalLoad" : {
        	"name": "개인화 호출",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "l",					//단축키
            "callback": fn_personalLoad2,		//콜백함수명
        },
        "colHidden" : {
        	"name": "열 숨기기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "h",					//단축키
            "callback": fn_colHidden2,			//콜백함수명
        },
        "colShow" : {
        	"name": "열 보이기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "w",					//단축키
            "callback": fn_colShow2,			//콜백함수명
        }
    };
     
    // 엑셀 다운로드
    function fn_excelDwnld2() {
    	sortInvntrGrid.exportLocalExcel("선별재고", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave2(){
    	sortInvntrGrid.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad2(){
    	sortInvntrGrid.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden2(){
    	sortInvntrGrid.setColHidden(sortInvntrGrid.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow2(){
    	for(let i = sortInvntrGrid.getFixedCols(); i < sortInvntrGrid.getCols()-1; i++) {
    		sortInvntrGrid.setColHidden(i, false);
    	}
	}
	
	const fn_callSelectGrid2List = async function(pageSize, pageNo) {
		let crtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let gdsSeCd = SBUxMethod.get("srch-slt-gdsSeCd");
		let wrhsSeCd = SBUxMethod.get("srch-slt-wrhsSeCd");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSe");

		let url = "";
		if(crtrYmd == gfn_dateToYmd(new Date())){
			url = "/am/invntr/selectSortInvntrDsctnList.do";
			crtrYmd = "";
		}else{
			// 재고 이력 테이블
			url = "/am/invntr/selectDailySortInvntrList.do";
		}

		const postJsonPromise2 = gfn_postJSON(url, {
			apcCd				: gv_selectedApcCd
		  ,	crtrYmd				: crtrYmd
		  ,	itemCd				: itemCd
		  ,	vrtyCd				: vrtyCd
		  ,	spcfctCd			: spcfctCd
		  ,	prdcrCd				: prdcrCd
		  ,	gdsSeCd				: gdsSeCd
		  ,	wrhsSeCd			: wrhsSeCd
		  ,	warehouseSeCd		: warehouseSeCd
          	// pagination
  	  	  ,	pagingYn 			: 'Y'
  	      ,	currentPageNo 		: pageNo
  	      , recordCountPerPage 	: pageSize
  		});

        let data2 = await postJsonPromise2;

  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonSortInvntr.length = 0;
          	data2.resultList.forEach((item, index) => {
          		const sortInvntr = {
          			sortno			: item.sortno
       			  ,	grdNm			: item.grdNm
       			  ,	inptYmd			: item.inptYmd
       			  ,	fcltNm			: item.fcltNm
       			  ,	prdcrNm			: item.prdcrNm
       			  ,	itemNm			: item.itemNm
       			  ,	vrtyNm			: item.vrtyNm
       			  ,	spcfctNm		: item.spcfctNm
       			  ,	warehouseSeNm	: item.warehouseSeNm
       			  ,	sortQntt		: item.sortQntt
       			  ,	sortWght		: item.sortWght
       			  ,	pckgQntt		: item.pckgQntt
       			  ,	pckgWght		: item.pckgWght
       			  ,	invntrQntt		: item.invntrQntt
       			  ,	invntrWght		: item.invntrWght
       			  ,	rmrk			: item.rmrk

  				}
          		jsonSortInvntr.push(sortInvntr);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
          	if (jsonSortInvntr.length > 0) {
          		if(sortInvntrGrid.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			sortInvntrGrid.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			sortInvntrGrid.rebuild();
  				}else{
  					sortInvntrGrid.refresh();
  				}
          	} else {
          		sortInvntrGrid.setPageTotalCount(totalRecordCount);
          		sortInvntrGrid.rebuild();
          	}

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
    }
	//선별재고 내역 조회 끝

	var jsonGdsInvntr = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid3() {
		checkSection = 3;
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'gdsInvntrGridArea';
	    SBGridProperties.id = 'gdsInvntrGrid';
	    SBGridProperties.jsonref = 'jsonGdsInvntr';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'sortmove';			// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList3;	// 우클릭 메뉴 리스트
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		};
	    SBGridProperties.columns = [
	        {caption: ["포장번호","포장번호"],		ref: 'pckgno',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["순번","순번"],				ref: 'pckgSn',      	type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["포장일자","포장일자"],		ref: 'pckgYmd',      	type:'output',  width:'105px',    style:'text-align:center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["설비","설비"],				ref: 'fcltNm',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],			ref: 'prdcrNm',      	type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["품목","품목"],				ref: 'itemNm',      	type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["품종","품종"],				ref: 'vrtyNm',      	type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["규격","규격"],				ref: 'spcfctNm',      	type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["등급","등급"],				ref: 'gdsGrdNm',      	type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["창고","창고"],				ref: 'warehouseSeNm',   type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["포장","수량"],				ref: 'pckgQntt',      	type:'output',  width:'85px',    style:'text-align:center'},
	        {caption: ["포장","중량"],				ref: 'pckgWght',      	type:'output',  width:'85px',    style:'text-align:center',
	        	format : {type:'number', 			rule:'#,### Kg'}
	        },
	        {caption: ["출하","수량"],				ref: 'spmtQntt',      	type:'output',  width:'85px',    style:'text-align:center'},
	        {caption: ["출하","중량"],				ref: 'spmtWght',      	type:'output',  width:'85px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["현 재고","수량"],			ref: 'invntrQntt',      type:'output',  width:'85px',    style:'text-align:center'},
	        {caption: ["현 재고","중량"],			ref: 'invntrWght',      type:'output',  width:'85px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["비고","비고"],				ref: 'rmrk',      		type:'output',  width:'105px',    style:'text-align:center'}
	    ];

	    gdsInvntrGrid = _SBGrid.create(SBGridProperties);
	    gdsInvntrGrid.bind( "beforepagechanged" , "fn_pagingGrd" );

	    fn_selectGridList();
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList3 = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld3,			//콜백함수명
        },
        "personalSave" : {
        	"name": "개인화 저장",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "s",					//단축키
            "callback": fn_personalSave3,		//콜백함수명
        },
        "personalLoad" : {
        	"name": "개인화 호출",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "l",					//단축키
            "callback": fn_personalLoad3,		//콜백함수명
        },
        "colHidden" : {
        	"name": "열 숨기기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "h",					//단축키
            "callback": fn_colHidden3,			//콜백함수명
        },
        "colShow" : {
        	"name": "열 보이기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "w",					//단축키
            "callback": fn_colShow3,				//콜백함수명
        }
    };
     
    // 엑셀 다운로드
    function fn_excelDwnld3() {
    	gdsInvntrGrid.exportLocalExcel("상품재고", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave3(){
    	gdsInvntrGrid.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad3(){
    	gdsInvntrGrid.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden3(){
    	gdsInvntrGrid.setColHidden(gdsInvntrGrid.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow3(){
    	for(let i = gdsInvntrGrid.getFixedCols(); i < gdsInvntrGrid.getCols()-1; i++) {
    		gdsInvntrGrid.setColHidden(i, false);
    	}
	}

	const fn_callSelectGrid3List = async function(pageSize, pageNo) {

     	let crtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let gdsSeCd = SBUxMethod.get("srch-slt-gdsSeCd");
		let wrhsSeCd = SBUxMethod.get("srch-slt-wrhsSeCd");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSe");

		let url = "";
		if(crtrYmd == gfn_dateToYmd(new Date())){
			url = "/am/invntr/selectGdsInvntrList.do";
			crtrYmd = "";
		}else{
			// 재고 이력 테이블
			url = "/am/invntr/selectDailyGdsInvntrList.do";
		}

// 		selectUpdateGdsInvntrList
		const postJsonPromise = gfn_postJSON(url, {
			 apcCd				: gv_selectedApcCd
		   , itemCd				: itemCd
		   , vrtyCd				: vrtyCd
		   , spcfctCd			: spcfctCd
		   , rprsPrdcrCd		: prdcrCd
		   , gdsSeCd			: gdsSeCd
		   , wrhsSeCd			: wrhsSeCd
		   , warehouseSeCd		: warehouseSeCd
		   , crtrYmd			: crtrYmd
          	// pagination
  	  	   , pagingYn 			: 'Y'
  	  	   , currentPageNo 		: pageNo
  	  	   , recordCountPerPage : pageSize
  		});

        let data = await postJsonPromise;
  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonGdsInvntr.length = 0;
          	data.resultList.forEach((item, index) => {
          		const gdsInvntr = {
          				pckgno			: item.pckgno
          			  , pckgSn			: item.pckgSn
          			  , pckgYmd			: item.pckgYmd
       				  , fcltNm			: item.fcltNm
       				  , itemNm			: item.itemNm
       				  , vrtyNm			: item.vrtyNm
       				  , spcfctNm		: item.spcfctNm
       				  , gdsGrdNm		: item.gdsGrdNm
       				  , warehouseSeNm	: item.warehouseSeNm
       				  , pckgQntt		: item.pckgQntt
       				  , pckgWght		: item.pckgWght
       				  , spmtQntt		: item.spmtQntt
       				  , spmtWght		: item.spmtWght
       				  , invntrQntt		: item.invntrQntt
       				  , invntrWght		: item.invntrWght
       				  , rmrk			: item.rmrk
       				  , prdcrNm 		: item.prdcrNm
  				}
          		jsonGdsInvntr.push(gdsInvntr);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
          	if (jsonGdsInvntr.length > 0) {
          		if(gdsInvntrGrid.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			gdsInvntrGrid.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			gdsInvntrGrid.rebuild();
  				}else{
  					gdsInvntrGrid.refresh();
  				}
          	} else {
          		gdsInvntrGrid.setPageTotalCount(totalRecordCount);
          		gdsInvntrGrid.rebuild();
          	}

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
    }
	//상품재고 내역 조회 끝

// 	function fn_closeModal(modalId){
// 		SBUxMethod.closeModal(modalId);
// 	}

	//modal

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
		if (gfn_isEmpty(itemCd)) {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonComSpcfct, 	"");
		} else {
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonComSpcfct, 	gv_selectedApcCd, itemCd);				// 규격
		}
		fn_getPrdcrs();

		if(checkSection == 1){
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonComSpcfct, 	"");
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true')
		}else{
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false')
		}
	}

	const fn_modalVrty = async function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

	const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, vrty.itemCd);
		}
		if(checkSection == 1){
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',	jsonComSpcfct, 	"");
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true')
		}else{
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false')
		}
	}

    const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyCd = [];
			var _vrtyNm = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtyCd.push(vrtys[i].vrtyCd);
				_vrtyNm.push(vrtys[i].vrtyNm);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, '');
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonComSpcfct, gv_selectedApcCd, vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCd.join(','));
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNm.join(','));
		}
	}


 // 공통코드 페이징
    const fn_pagingGrd = async function(){
    	var inptCmndDsctnList;
    	if(checkSection == 1 ){
    		inptCmndDsctnList = rawMtrInvntrGrid;
    	}else if(checkSection == 2){
    		inptCmndDsctnList = sortInvntrGrid;
    	}else if(checkSection == 3){
    		inptCmndDsctnList = gdsInvntrGrid;
    	}
    	let pageSize = inptCmndDsctnList.getPageSize();   			// 몇개의 데이터를 가져올지 설정
    	let pageNo = inptCmndDsctnList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    	if(checkSection == 1 ){
    		fn_callSelectGrid1List(pageSize, pageNo);
    	}else if(checkSection == 2){
    		fn_callSelectGrid2List(pageSize, pageNo);
    	}else if(checkSection == 3){
    		fn_callSelectGrid3List(pageSize, pageNo);
    	}
    }

    /* 생산자 팝업 호출 필수 function  */
 	/* Start */
 	/**
 	 * @name fn_getPrdcrs
 	 * @description 생산자 리스트 호출
 	 */
 	const fn_getPrdcrs = async function() {
 		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
 		jsonPrdcr = gfn_setFrst(jsonPrdcr);
 	}
 	/**
 	 * @name fn_choicePrdcr
 	 * @description 생산자 팝업 호출
 	 */
 	const fn_choicePrdcr = function() {
 		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
 	}

 	/**
 	 * @name fn_setPrdcr
 	 * @description 생산자 선택 callback
 	 */
 	const fn_setPrdcr = function(prdcr) {
 		if (!gfn_isEmpty(prdcr)) {
 			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);		// callBack input
 			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);		// callBack input
 			SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);	// 대표 품목코드
 			SBUxMethod.set("srch-inp-vrtyCd", prdcr.rprsVrtyCd);	// 대표 품종코드
 			SBUxMethod.set("srch-inp-vrtyNm", prdcr.rprsVrtyNm);	// 대표 품종명
 			SBUxMethod.set("srch-slt-gdsSeCd", prdcr.gdsSeCd);		// 상품구분
 			SBUxMethod.set("srch-slt-wrhsSeCd", prdcr.trsprtSeCd);	// 입고구분
 			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");
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
 		SBUxMethod.set("srch-inp-prdcrCd", value);
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
 	}
 	/* End */

	$(function(){
		$(".glyphicon").on("click", function(){
			SBUxMethod.set("srch-inp-vrtyNm", "");
			SBUxMethod.set("srch-inp-vrtyCd", "");
		})
	})
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>