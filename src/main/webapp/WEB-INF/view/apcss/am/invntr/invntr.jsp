<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title">▶ 재고정보조회</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger" onclick="fn_selectGridList()">조회</sbux-button>
				</div>
			</div>
			<div class="box-body">
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
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">APC명</th>
							<td colspan= "3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" class="form-control input-sm" disabled/>
							</td>
							<td colspan="9">&nbsp;</td>
						</tr>

						<tr>
							<th scope="row" class="th_bg">기준일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-crtrYmd" name="srch-dtp-crtrYmd" class="form-control pull-right input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">재고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-invntrySe" name="srch-slt-invntrySe" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm input-sm" unselected-text="전체" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" class="form-control input-sm" ></sbux-input>
							</td>
							<td class="td_input">
								<sbux-button id="srch-btn-vrtySrch" name="srch-btn-vrtySrch" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
						</tr>

						<tr>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" class="form-control input-sm" jsondata-ref="jsonSpcfct"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-warehouseSe" name="srch-slt-warehouseSe" class="form-control input-sm" jsondata-ref="jsonComWarehouse"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-prcdcr" name="srch-inp-prcdcr" class="form-control input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-prdcr" name="srch-btn-prdcr" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"/>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>

						<tr>
							<th scope="row" class="th_bg">상품구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-gdsSe" name="srch-slt-gdsSe" class="form-control input-sm" jsondata-ref="jsonComGdsSeCdPrdcrPop"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">입고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-wrhsSe" name="srch-slt-wrhsSe" class="form-control input-sm" jsondata-ref="jsonComWrhsSeCdPrdcrPop"/>
							</td>
							<td colspan="7">&nbsp;</td>
						</tr>
					</tbody>
				</table>


				<div class="sbt-wrap-body">
					<div class="ad_tbl_toplist">
							<sbux-button uitype="normal" id="srch-btn-rawmtrInvntrDsctn" name="srch-btn-rawmtrInvntrDsctn" class="btn btn-sm btn-outline-danger" text="원물재고 내역" onclick="fn_sample1()"></sbux-button>
							<sbux-button uitype="normal" id="srch-btn-sortInvntrDsctn" name="srch-btn-sortInvntrDsctn" class="btn btn-sm btn-outline-danger" text="선별재고 내역" onclick="fn_sample2()"></sbux-button>
							<sbux-button uitype="normal" id="srch-btn-gdsInvntrDsctn" name="srch-btn-gdsInvntrDsctn" class="btn btn-sm btn-outline-danger" text="상품재고 내역" onclick="fn_sample3()"></sbux-button>
					</div>
                    <div class="sbt-grid">
                        <div id="inptCmndDsctnGridArea" style="height:450px;"></div>
                    </div>
               	</div>
			</div>
		</div>
	</section>
	<!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	
	var jsonComItem			= [];	// 품목 	itemCd			검색
	var jsonComVrty			= [];	// 품종 	vrtyCd			검색
	var jsonSpcfct			= [];	// 규격 	spcfctCd		검색
	var jsonComWarehouse	= [];	// 창고 	warehouseSeCd	검색
	var jsonComFcltCd		= [];	// 선별기 	fcltCd		검색
	var jsonComGdsSeCdPrdcrPop		= [];	// 상품구분 gdsSeCd	Grid
	var jsonComWrhsSeCdPrdcrPop		= [];	// 입고구분 wrhsSeCd	Grid
	var jsonPrdcr			= [];
	
	const fn_initSBSelect = async function() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSe', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),						// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_selectedApcCd),						// 품종
		 	gfn_setComCdSBSelect('srch-slt-fcltCd', 		jsonComFcltCd, 		'FCLT_CD',		  gv_selectedApcCd),		// 선벌기
		 	gfn_setComCdSBSelect('srch-slt-gdsSe', 			jsonComGdsSeCdPrdcrPop, 'GDS_SE_CD', gv_selectedApcCd),						// 상품구분
		 	gfn_setComCdSBSelect('srch-slt-wrhsSe', jsonComWrhsSeCdPrdcrPop, 'WRHS_SE_CD',gv_selectedApcCd),		// 입고구분
		 	gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonSpcfct, gv_selectedApcCd, itemCd, gv_selectedApcCd)	// 규격
		])
	}
	
	var checkSection = 1;

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid1();
// 		fn_createGrid2();
// 		fn_createGrid3();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-crtrYmd", year+month+day);
		
		fn_initSBSelect();
	});

	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언
	function fn_sample1(){
		_SBGrid.destroy('inptCmndDsctnList');
		inptCmndDsctnList = [];
		fn_createGrid1();
	}
	function fn_sample2(){
		_SBGrid.destroy('inptCmndDsctnList');
		inptCmndDsctnList = [];
		fn_createGrid2();
	}
	function fn_sample3(){
		_SBGrid.destroy('inptCmndDsctnList');
		inptCmndDsctnList = [];
		fn_createGrid3();
	}
	function fn_createGrid1() {
		checkSection = 1;
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'inptCmndDsctnList';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
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
	        {caption: ["입고번호","입고번호"],		ref: 'wrhsno',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["팔레트번호","팔레트번호"],	ref: 'pltno',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["입고일자","입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],			ref: 'prdcrNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품목","품목"],				ref: 'itemNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품종","품종"],				ref: 'vrtyNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["상품","상품"],				ref: 'gdsSeNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["입고","입고"],				ref: 'wrhsSeNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["운송","운송"],				ref: 'trsprtSeNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["창고","창고"],				ref: 'warehouseSeNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["입고","수량"],				ref: 'wrhsQntt',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["입고","중량"],				ref: 'wrhsWght',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["투입","수량"],				ref: 'inptQntt',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["투입","중량"],				ref: 'inptWght',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","수량"],			ref: 'invntrQntt',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","중량"],			ref: 'invntrWght',      type:'output',  width:'55px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
		
		fn_selectGridList();
	}
	
	//조회
    const fn_selectGridList = async function() {
    	inptCmndDsctnList.rebuild();
    	let pageSize = inptCmndDsctnList.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsoninptCmndDsctnList.length = 0;
    	jsoninptCmndDsctnList2.length = 0;
    	jsoninptCmndDsctnList3.length = 0;
    	inptCmndDsctnList.clearStatus();
    	
    	//검색조건
    	let crtrYmd  = SBUxMethod.get("srch-dtp-crtrYmd");	//기준일자
    	
    	if(checkSection == 1 ){
    		fn_callSelectGrid1List(pageSize, pageNo);
    	}else if(checkSection == 2){
    		fn_callSelectGrid2List(pageSize, pageNo);
    	}else if(checkSection == 3){
    		fn_callSelectGrid3List(pageSize, pageNo);
    	}else{
			console.log('checkSection', checkSection);
    	}
	}
    var newSortInptPrfmncGridData = [];
	const fn_callSelectGrid1List = async function(pageSize, pageNo) {
//     	let startsortYmd  = SBUxMethod.get("srch-inp-startsortYmd");
		
		const postJsonPromise2 = gfn_postJSON("/am/invntr/selectRawMtrInvntrList.do", {
			apcCd		:  '8888',
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

		console.log('test','test');
        let data = await postJsonPromise2;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {
			console.log('try','try');
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsoninptCmndDsctnList.length = 0;
          	data.resultList.forEach((item, index) => {
          		const rawMtrInvntr = {
       				wrhsno: item.wrhsno,
       				pltno: item.pltno,
       				wrhsYmd: item.wrhsYmd,
       				prdcrNm: item.prdcrNm,
       				itemNm: item.itemNm,
       				vrtyNm: item.vrtyNm,
       				gdsSeNm: item.gdsSeNm,
       				wrhsSeNm: item.wrhsSeNm,
       				trsprtSeNm: item.trsprtSeNm,
       				warehouseSeNm: item.warehouseSeNm,
       				bxknd: item.bxknd,
       				grdNm: item.grdNm,
       				wrhsQntt: item.wrhsQntt,
       				wrhsWght: item.wrhsWght,
       				inptQntt: item.inptQntt,
       				inptWght: item.inptWght,
       				invntrQntt: item.invntrQntt,
       				invntrWght: item.invntrWght,
       				sortcmndNo: item.sortcmndNo,
       				fcltNm: item.fcltNm
  				}
  				jsoninptCmndDsctnList.push(rawMtrInvntr);
          		console.log('rawMtrInvntr',rawMtrInvntr);
          		console.log('jsoninptCmndDsctnList',jsoninptCmndDsctnList);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
			console.log('jsoninptCmndDsctnList',jsoninptCmndDsctnList);
			console.log('jsoninptCmndDsctnList.length',jsoninptCmndDsctnList.length);
          	if (jsoninptCmndDsctnList.length > 0) {
          		if(inptCmndDsctnList.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			inptCmndDsctnList.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			inptCmndDsctnList.rebuild();
  				}else{
  					inptCmndDsctnList.refresh();
  				}
          	} else {
          		inptCmndDsctnList.setPageTotalCount(totalRecordCount);
          		inptCmndDsctnList.rebuild();
          	}

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
    }
	//원물재고 내역 조회 끝
	
// 	var inptCmndDsctnList2; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList2 = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid2() {
		checkSection = 2;
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'inptCmndDsctnList';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList2';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
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
	        {caption: ["선별번호","선별번호"],		ref: 'wghno',      		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["등급","등급"],				ref: 'grdCd',      		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["투입일자","투입일자"],		ref: 'wghYmd',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["설비","설비"],				ref: 'vhclno',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],			ref: 'prdcrCd',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품목","품목"],				ref: 'itemNm',     		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품종","품종"],				ref: 'vrtyNm',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["규격","규격"],				ref: 'spcfctNm',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["창고","창고"],				ref: 'warehouseSeNm',   type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["선별","수량"],				ref: 'sortQntt',      	type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["선별","중량"],				ref: 'sortWght',      	type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["포장","수량"],				ref: 'pckgQntt',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["포장","중량"],				ref: 'pckgWght',     type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","수량"],			ref: 'invntrQntt',      		type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","중량"],			ref: 'invntrWght',      	type:'output',  width:'55px',    style:'text-align:center'}
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
	    
	    fn_selectGridList();
	}
    var newSortInptPrfmncGridData = [];
	const fn_callSelectGrid2List = async function(pageSize, pageNo) {
//     	let startsortYmd  = SBUxMethod.get("srch-inp-startsortYmd");
		
		const postJsonPromise2 = gfn_postJSON("/am/invntr/selectSortInvntrDsctnList.do", {
			apcCd		:  '9999',
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

		console.log('test','test');
        let data = await postJsonPromise2;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {
			console.log('try','try');
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsoninptCmndDsctnList.length = 0;
          	data.resultList.forEach((item, index) => {
          		const rawMtrInvntr = {
       				wghno: item.wghno,
       				grdCd: item.grdCd,
       				wghYmd: item.wghYmd,
       				vhclno: item.vhclno,
       				prdcrCd: item.prdcrCd,
       				itemNm: item.itemNm,
       				vrtyNm: item.vrtyNm,
       				spcfctNm: item.spcfctNm,
       				warehouseSeNm: item.warehouseSeNm,
       				sortQntt: item.sortQntt,
       				sortWght: item.sortWght,
       				pckgQntt: item.pckgQntt,
       				pckgWght: item.pckgWght,
       				invntrQntt: item.invntrQntt,
       				invntrWght:item.invntrWght
  				}
          		jsoninptCmndDsctnList2.push(rawMtrInvntr);
          		console.log('rawMtrInvntr',rawMtrInvntr);
          		console.log('jsoninptCmndDsctnList2',jsoninptCmndDsctnList2);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
			console.log('jsoninptCmndDsctnList2',jsoninptCmndDsctnList2);
			console.log('jsoninptCmndDsctnList2.length',jsoninptCmndDsctnList2.length);
          	if (inptCmndDsctnList.length > 0) {
          		if(inptCmndDsctnList.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			inptCmndDsctnList.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			inptCmndDsctnList.rebuild();
  				}else{
  					inptCmndDsctnList.refresh();
  				}
          	} else {
          		inptCmndDsctnList.setPageTotalCount(totalRecordCount);
          		inptCmndDsctnList.rebuild();
          	}

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
    }
	//선별재고 내역 조회 끝
	
// 	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList3 = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid3() {
		checkSection = 3;
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'inptCmndDsctnList';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList3';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.explorerbar = 'sortmove';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
	        {caption: ["포장번호","포장번호"],		ref: 'pckgno',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["순번","순번"],		ref: 'pckgSn',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["포장일자","포장일자"],		ref: 'pckgYmd',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["설비","설비"],		ref: 'fcltNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],		ref: 'rprsPrdcrNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품목","품목"],		ref: 'itemNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품종","품종"],		ref: 'vrtyNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["규격","규격"],		ref: 'spcfctNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["등급","등급"],		ref: 'grdNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["창고","창고"],		ref: 'warehouseSeNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["포장","수량"],		ref: 'pckgQntt',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["포장","중량"],		ref: 'pckgWght',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["출하","수량"],		ref: 'spmtQntt',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["출하","중량"],		ref: 'spmtWght',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","수량"],		ref: 'invntrQntt',      type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","중량"],		ref: 'invntrWght',      type:'output',  width:'55px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
		
	    fn_selectGridList();
	}
	
	var newSortInptPrfmncGridData = [];
	const fn_callSelectGrid3List = async function(pageSize, pageNo) {
//     	let startsortYmd  = SBUxMethod.get("srch-inp-startsortYmd");
		
		const postJsonPromise = gfn_postJSON("/am/invntr/selectGdsInvntrList.do", {
			apcCd		:  '9999',
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

		console.log('test','test');
        let data = await postJsonPromise;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {
			console.log('try','try');
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsoninptCmndDsctnList3.length = 0;
          	data.resultList.forEach((item, index) => {
          		const rawMtrInvntr = {
       				pckgno: item.pckgno,
       				pckgSn: item.pckgSn,
       				pckgYmd: item.pckgYmd,
       				fcltNm: item.fcltNm,
       				rprsPrdcrNm: item.rprsPrdcrNm,
       				itemNm: item.itemNm,
       				vrtyNm: item.vrtyNm,
       				spcfctNm: item.spcfctNm,
       				grdNm: item.grdNm,
       				warehouseSeNm: item.warehouseSeNm,
       				pckgQntt: item.pckgQntt,
       				pckgWght: item.pckgWght,
       				spmtQntt: item.spmtQntt,
       				spmtWght: item.spmtWght,
       				invntrQntt: item.invntrQntt,
       				invntrWght: item.invntrWght
  				}
          		jsoninptCmndDsctnList3.push(rawMtrInvntr);
          		console.log('rawMtrInvntr',rawMtrInvntr);
          		console.log('jsoninptCmndDsctnList3',jsoninptCmndDsctnList3);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
			console.log('jsoninptCmndDsctnList3',jsoninptCmndDsctnList3);
			console.log('jsoninptCmndDsctnList3.length',jsoninptCmndDsctnList3.length);
          	if (jsoninptCmndDsctnList3.length > 0) {
          		if(inptCmndDsctnList.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			inptCmndDsctnList.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			inptCmndDsctnList.rebuild();
  				}else{
  					inptCmndDsctnList.refresh();
  				}
          	} else {
          		inptCmndDsctnList.setPageTotalCount(totalRecordCount);
          		inptCmndDsctnList.rebuild();
          	}

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
    }
	//선별재고 내역 조회 끝

// 	function fn_closeModal(modalId){
// 		SBUxMethod.closeModal(modalId);
// 	}
	
	//modal

	async function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonSpcfct, gv_selectedApcCd, itemCd);	// 규격
		console.log(jsonSpcfct);
		fn_getPrdcrs();
	}
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}
	
	const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

     const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyNm);
		}
	}
     const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			for(var i=0;i<vrtys.length;i++){
				_vrtys.push(vrtys[i].vrtyNm);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtys.join(','));
		}
	}
</script>

</html>