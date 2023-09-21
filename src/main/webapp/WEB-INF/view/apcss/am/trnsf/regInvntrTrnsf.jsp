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
					<h3 class="box-title">▶ 재고이송등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
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
							<th scope="row" class="th_bg" >APC명</th>
							<td colspan= "4" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" class="form-control input-sm" disabled/>
							</td>
							<td colspan="8">&nbsp;</td>
						</tr>

						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-item" name="srch-slt-item" class="form-control input-sm"/>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-vrty" name="srch-slt-vrty" class="form-control input-sm"/>
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spcfct" name="srch-slt-warehouseSe" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-warehouseSe" name="srch-slt-warehouseSe" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
						</tr>

						<tr>
							<th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-prcdcr" name="srch-inp-prcdcr" class="form-control input-sm"/>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="srch-btn-prdcr" name="srch-btn-prdcr" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-prdcr" onclick="fn_modalPrdcr"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">상품구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-gdsSe" name="srch-slt-gdsSe" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">입고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-wrhsSe" name="srch-slt-wrhsSe" class="form-control input-sm"/>
							</td>
							<td colspan="2">&nbsp;</td>
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
                        <div id="inptCmndDsctnGridArea" style="height:300px;"></div>
                    </div>
               	</div>
				</div>
				<!--[pp] //검색결과 -->
			</div>
	</section>
</body>
<script type="text/javascript">
var jsonComMsgKnd = [];	// srch.select.comMsgKnd

var jsonComItem			= [];	// 품목 	itemCd			검색
var jsonComVrty			= [];	// 품종 	vrtyCd			검색
var jsonSpcfct			= [];	// 규격 	spcfctCd		검색
var jsonComWarehouse	= [];	// 창고 	warehouseSeCd	검색
var jsonComWrhsSeCd		= [];	// 창고 	warehouseSeCd	검색
var jsonComFcltCd		= [];	// 선별기 	fcltCd		검색
var jsonComGdsSeCd		= [];	// 상품구분 gdsSeCd		검색
var jsonComWrhsSeCd		= [];	// 입고구분 wrhsSeCd		검색

/*생산자 팝업 및 초성검색 */
var jsonDataPrdcr = [];
var jsonPrdcr			= [];
var jsonPrdcrAutocomplete = [];
var autoCompleteDataJson = [];

const fn_initSBSelect = async function() {
	let itemCd = SBUxMethod.get("srch-slt-itemCd");
	let rst = await Promise.all([
		gfn_setComCdSBSelect('srch-slt-warehouseSe', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
		gfn_setComCdSBSelect('srch-slt-wrhsSeCd', 		jsonComWrhsSeCd, 	'WRHS_SE_CD'),							// 창고
	 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),						// 품목
	 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_selectedApcCd),						// 품종
	 	gfn_setComCdSBSelect('srch-slt-fcltCd', 		jsonComFcltCd, 		'FCLT_CD',   	gv_selectedApcCd),		// 선벌기
	 	gfn_setComCdSBSelect('srch-slt-gdsSe', 			jsonComGdsSeCd, 	'GDS_SE_CD', 	gv_selectedApcCd),		// 상품구분
	 	gfn_setComCdSBSelect('srch-slt-wrhsSe', 		jsonComWrhsSeCd, 	'WRHS_SE_CD',	gv_selectedApcCd),		// 입고구분
	 	gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonSpcfct, gv_selectedApcCd, itemCd, gv_selectedApcCd)	// 규격
	])
	SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true');

	fn_getPrdcrs();
}
	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	var checkSection = 0;
	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_sample1();
		checkSection = 1;
// 		fn_createGrid2();
// 		fn_createGrid3();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
		SBUxMethod.set("srch-dtp-crtrYmd", year+month+day);
		SBUxMethod.set("srch-inp-apcNm", gv_apcNm);
		
		fn_initSBSelect();
	});

	var inptCmndDsctnList = []; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언

	function fn_sample1(){
		SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true')

		$("#srch-btn-rawmtrInvntrDsctn").css({"background-color":"#149FFF","color":"white"});
		$("#srch-btn-sortInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-gdsInvntrDsctn").css({"background-color":"white","color":"black"});
		_SBGrid.destroy('inptCmndDsctnList');
		
		checkSection = 1;
		fn_createGrid1();
	}
	function fn_sample2(){

		$("#srch-btn-rawmtrInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-sortInvntrDsctn").css({"background-color":"#149FFF","color":"white"});
		$("#srch-btn-gdsInvntrDsctn").css({"background-color":"white","color":"black"});
		_SBGrid.destroy('inptCmndDsctnList');
		SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false')
		checkSection = 2;
		fn_createGrid2();
	}
	function fn_sample3(){

		$("#srch-btn-rawmtrInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-sortInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-gdsInvntrDsctn").css({"background-color":"#149FFF","color":"white"});
		_SBGrid.destroy('inptCmndDsctnList');
		SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false')
		checkSection = 3;
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
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
	    	{caption: ["선택","선택"],				ref: 'checkBox',      		type:'checkbox',  width:'50px',    style:'text-align:center', typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
	        {caption: ["입고번호","입고번호"],		ref: 'wrhsno',      		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["팔레트번호","팔레트번호"],	ref: 'pltno',      			type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["입고일자","입고일자"],		ref: 'wrhsYmd',      		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],			ref: 'prdcrNm',      		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품목","품목"],				ref: 'itemNm',      		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품종","품종"],				ref: 'vrtyNm',      		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["상품","상품"],				ref: 'gdsSeNm',      		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["입고","입고"],				ref: 'wrhsSeNm',     		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["운송","운송"],				ref: 'trsprtSeNm',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["현물창고","현물창고"],		ref: 'warehouse',      		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["재고","수량"],				ref: 'invntrQntt',      	type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["재고","중량"],				ref: 'invntrWght',      	type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["이송창고","이송창고"],		ref: 'trnsfWarehouse',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["이송","수량"],				ref: 'mvmnQntt',      		type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["이송","중량"],				ref: 'mvmnWght',      		type:'output',  width:'55px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
		
	    fn_selectGridList();
	}
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
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
	    	{caption: ["선택","선택"],			ref: 'checkBox',      	type:'checkbox',  	width:'55px',    style:'text-align:center', typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
	        {caption: ["선별번호","선별번호"],	ref: 'sortno',      	type:'output',  	width:'105px',    style:'text-align:center'},
	        {caption: ["등급","등급"],			ref: 'grdNm',      		type:'output',  	width:'105px',    style:'text-align:center'},
	        {caption: ["투입일자","투입일자"],	ref: 'inptYmd',      	type:'output',  	width:'105px',    style:'text-align:center'},
	        {caption: ["설비","설비"],			ref: 'fcltNm',      	type:'output',  	width:'105px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],		ref: 'prdcrNm',      	type:'output',  	width:'105px',    style:'text-align:center'},
	        {caption: ["품목","품목"],			ref: 'itemNm',      	type:'output',  	width:'105px',    style:'text-align:center'},
	        {caption: ["품종","품종"],			ref: 'vrtyNm',      	type:'output',  	width:'105px',    style:'text-align:center'},
	        {caption: ["규격","규격"],			ref: 'spcfctNm',      	type:'output',  	width:'105px',    style:'text-align:center'},
	        {caption: ["현물창고","현물창고"],		ref: 'warehouse',      		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["재고","수량"],				ref: 'invntrQntt',      	type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["재고","중량"],				ref: 'invntrWght',      	type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["이송창고","이송창고"],		ref: 'trnsfWarehouse',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["이송","수량"],				ref: 'mvmnQntt',      		type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["이송","중량"],				ref: 'mvmnWght',      		type:'output',  width:'55px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
	    
	    fn_selectGridList();

	}
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
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.paging = {
			'type' : 'page',
		  	'count' : 5,
		  	'size' : 20,
		  	'sorttype' : 'page',
		  	'showgoalpageui' : true
	    };
	    SBGridProperties.columns = [
	    	{caption: ["선택","선택"],		ref: 'checkBox',      type:'checkbox',  width:'50px',    style:'text-align:center', typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
	        {caption: ["포장번호","포장번호"],		ref: 'pckgno',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["순번","순번"],		ref: 'pckgSn',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["포장일자","포장일자"],		ref: 'pckgYmd',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["설비","설비"],		ref: 'fcltNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],		ref: 'rprsPrdcrNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품목","품목"],		ref: 'itemNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품종","품종"],		ref: 'vrtyNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["규격","규격"],		ref: 'spcfctNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["등급","등급"],		ref: 'grdNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["현물창고","현물창고"],		ref: 'warehouse',      		type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["재고","수량"],				ref: 'invntrQntt',      	type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["재고","중량"],				ref: 'invntrWght',      	type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["이송창고","이송창고"],		ref: 'trnsfWarehouse',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["이송","수량"],				ref: 'mvmnQntt',      		type:'output',  width:'55px',    style:'text-align:center'},
	        {caption: ["이송","중량"],				ref: 'mvmnWght',      		type:'output',  width:'55px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
	    
	    fn_selectGridList();

	}
	//조회
    const fn_selectGridList = async function() {
		console.log('fn_selectGridList','fn_selectGridList');
    	inptCmndDsctnList.rebuild();
    	let pageSize = inptCmndDsctnList.getPageSize();
    	let pageNo = 1;

    	// grid clear
    	jsoninptCmndDsctnList.length = 0;
    	jsoninptCmndDsctnList2.length = 0;
    	jsoninptCmndDsctnList3.length = 0;
    	inptCmndDsctnList.clearStatus();

    	//검색조건
//     	let crtrYmd  = SBUxMethod.get("srch-dtp-crtrYmd");	//기준일자
    	if(checkSection == 1 ){
    		fn_callSelectGrid1List(pageSize, pageNo);
    	}else if(checkSection == 2){
//     		fn_callSelectGrid2List(pageSize, pageNo);
    	}else if(checkSection == 3){
//     		fn_callSelectGrid3List(pageSize, pageNo);
    	}
	}
	
    var newSortInptPrfmncGridData = [];
	const fn_callSelectGrid1List = async function(pageSize, pageNo) {

		let crtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");
		let invntrySe = SBUxMethod.get("srch-slt-invntrySe");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let prdcr = SBUxMethod.get("srch-inp-prdcrCd");
		let gdsSe = SBUxMethod.get("srch-slt-gdsSe");
		let wrhsSe = SBUxMethod.get("srch-slt-wrhsSeCd");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSe");

	    jsoninptCmndDsctnList = []; //첫번째 그리드 data

		const postJsonPromise1 = gfn_postJSON("/am/invntr/selectRawMtrInvntrList.do", {
			apcCd		:  gv_selectedApcCd,
			crtrYmd: crtrYmd,
			invntrySe: invntrySe,
			itemCd:itemCd,
			vrtyCd: vrtyCd,
			spcfctCd: spcfctCd,
			prdcr: prdcr,
			gdsSe: gdsSe,
			wrhsSe: wrhsSe,
			warehouseSeCd: warehouseSeCd,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        let data1 = await postJsonPromise1;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsoninptCmndDsctnList.length = 0;
          	data1.resultList.forEach((item, index) => {
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
          				warehouse: item.warehouse,
          				invntrQntt: item.invntrQntt,
          				invntrWght: item.invntrWght,
          				trnsfWarehouse: item.trnsfWarehouse,
          				mvmnQntt: item.mvmnQntt,
          				mvmnWght: item.mvmnWght

  				}
//   				jsoninptCmndDsctnList.push(rawMtrInvntr);

          		jsoninptCmndDsctnList.push(Object.assign({}, rawMtrInvntr));
//           		newJsoninptCmndDsctnList.push(Object.assign({}, rawMtrInvntr));

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
          	inptCmndDsctnList.rebuild();
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
	
	var newSortInptPrfmncGridData = [];
	const fn_callSelectGrid2List = async function(pageSize, pageNo) {
//     	let startsortYmd  = SBUxMethod.get("srch-inp-startsortYmd");
		let crtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");
		let invntrySe = SBUxMethod.get("srch-slt-invntrySe");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let gdsSeCd = SBUxMethod.get("srch-slt-gdsSe");
		let wrhsSeCd = SBUxMethod.get("srch-slt-wrhsSeCd");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSe");

		const postJsonPromise2 = gfn_postJSON("/am/invntr/selectSortInvntrDsctnList.do", {
			apcCd		:  gv_selectedApcCd,
			crtrYmd: crtrYmd,
			invntrySe: invntrySe,
			itemCd:itemCd,
			vrtyCd: vrtyCd,
			spcfctCd: spcfctCd,
			prdcrCd: prdcrCd,
			gdsSeCd: gdsSeCd,
			wrhsSeCd: wrhsSeCd,
			warehouseSeCd: warehouseSeCd,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        let data2 = await postJsonPromise2;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsoninptCmndDsctnList2.length = 0;
          	data2.resultList.forEach((item, index) => {
          		const rawMtrInvntr2 = {
          				sortno: item.sortno,
          				grdNm: item.grdNm,
          				nptYmd: item.nptYmd,
          				fcltNm: item.fcltNm,
          				prdcrNm: item.prdcrNm,
          				itemNm: item.itemNm,
          				vrtyNm: item.vrtyNm,
          				spcfctNm: item.spcfctNm,
          				warehouse: item.warehouse,
          				invntrQntt: item.invntrQntt,
          				invntrWght: item.invntrWght,
          				trnsfWarehouse: item.trnsfWarehouse,
          				mvmnQntt: item.mvmnQntt,
          				mvmnWght: item.mvmnWght
  				}
          		jsoninptCmndDsctnList2.push(rawMtrInvntr2);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
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
// 	function fn_closeModal(modalId){
// 		SBUxMethod.closeModal(modalId);
// 	}
</script>

</html>