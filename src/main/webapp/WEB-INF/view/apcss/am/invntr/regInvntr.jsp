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
					<h3 class="box-title">▶ 재고정보등록</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger" onclick="fn_selectGridList();">조회</sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="button" class="btn btn-sm btn-outline-danger" onclick="fn_updataList();">저장</sbux-button>
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
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>

						<tr>
							<th scope="row" class="th_bg">APC명</th>
							<td colspan= "3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="srch-inp-apcNm" name="srch-inp-apcNm" class="form-control input-sm" disabled/>
							</td>
							<td colspan="8">&nbsp;</td>
						</tr>

						<tr>
							
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm input-sm" unselected-text="전체" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-vrtyNm" name="srch-slt-vrtyNm" class="form-control input-sm" jsondata-ref="jsonComVrty"/>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden" class="form-control input-sm" ></sbux-input>
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-spcfct" name="srch-slt-spcfct" class="form-control input-sm" jsondata-ref="jsonSpcfct"/>
							</td>
							<td colspan="2">&nbsp;</td>
						
							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-warehouseSe" name="srch-slt-warehouseSe" class="form-control input-sm" jsondata-ref="jsonComWarehouse"/>
							</td>
							<td colspan="2">&nbsp;</td>
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
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
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
							<td>&nbsp;</td>
							<th scope="row" class="th_bg">상품구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="선택" uitype="single" id="srch-slt-gdsSe" name="srch-slt-gdsSe" class="form-control input-sm" jsondata-ref="jsonComGdsSeCd"/>
							</td>
							<td colspan="2">&nbsp;</td>
							<th scope="row" class="th_bg">입고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="선택"
									uitype="single"
									id="srch-slt-wrhsSeCd"
									name="srch-slt-wrhsSeCd"
									class="form-control input-sm"
									jsondata-ref="jsonComWrhsSeCd"
								/>
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
                        <div id="inptCmndDsctnGridArea" style="height:450px;"></div>
                    </div>
               	</div>

				<!--[pp] //검색결과 -->
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
    <!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
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
	        {caption: ["선택","선택"],				ref: 'checkBox',      type:'checkbox',  width:'50px',    style:'text-align:center', typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
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
	        {caption: ["현 재고","수량"],			ref: 'invntrQntt',      type:'input',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","중량"],			ref: 'invntrWght',      type:'input',  width:'55px',    style:'text-align:center'},
	        {caption: ["변경사항","변경사항"],		ref: 'chgPo',      type:'input',  width:'105px',    style:'text-align:center'},
	        {caption: ["창고구분코드","창고구분코드"],		ref: 'warehouseSeCd', 	type:'output',	hidden: true}
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
	        {caption: ["창고","창고"],			ref: 'warehouseSeNm',   type:'output',  	width:'105px',    style:'text-align:center'},
	        {caption: ["현 재고","수량"],		ref: 'invntrQntt',      type:'input',  		width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","중량"],		ref: 'invntrWght',      type:'input', 		width:'55px',    style:'text-align:center'},
	        {caption: ["변경사항","변경사항"],	ref: 'chgPo',      		type:'input',  		width:'105px',    	style:'text-align:center'},
// 	        hidden으로 창고구분코드 추가해주기
// 	        {caption: ["창고구분코드","창고구분코드"],		ref: 'warehouseSeCd', 	type:'output',	hidden: true}
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
	        {caption: ["창고","창고"],		ref: 'warehouseSeNm',      type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["현 재고","수량"],		ref: 'invntrQntt',      type:'input',  width:'55px',    style:'text-align:center'},
	        {caption: ["현 재고","중량"],		ref: 'invntrWght',      type:'input',  width:'55px',    style:'text-align:center'},
	        {caption: ["변경사항","변경사항"],	ref: 'chgPo',      	type:'input',  		width:'105px',    	style:'text-align:center'},
	        {caption: ["창고구분코드","창고구분코드"],		ref: 'warehouseSeCd', 	type:'output',	hidden: true}
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
    		fn_callSelectGrid2List(pageSize, pageNo);
    	}else if(checkSection == 3){
    		fn_callSelectGrid3List(pageSize, pageNo);
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
       				fcltNm: item.fcltNm,
       				warehouseSeCd: item.warehouseSeCd
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


		const postJsonPromise2 = gfn_postJSON("/am/invntr/selectSortInvntrDsctnList.do", {
			apcCd		:  gv_selectedApcCd,
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
       				inptYmd: item.inptYmd,
       				fcltNm: item.fcltNm,
       				prdcrNm: item.prdcrNm,
       				itemNm: item.itemNm,
       				vrtyNm: item.vrtyNm,
       				spcfctNm: item.spcfctNm,
       				warehouseSeNm: item.warehouseSeNm,
       				sortQntt: item.sortQntt,
       				sortWght: item.sortWght,
       				pckgQntt: item.pckgQntt,
       				pckgWght: item.pckgWght,
       				invntrQntt: item.invntrQntt,
       				invntrWght: item.invntrWght
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

	var newSortInptPrfmncGridData = [];
	const fn_callSelectGrid3List = async function(pageSize, pageNo) {
//     	let startsortYmd  = SBUxMethod.get("srch-inp-startsortYmd");

		const postJsonPromise3 = gfn_postJSON("/am/invntr/selectUpdateGdsInvntrList.do", {
			apcCd		:  gv_selectedApcCd,
          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        let data3 = await postJsonPromise3;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsoninptCmndDsctnList3.length = 0;
          	data3.resultList.forEach((item, index) => {
          		const rawMtrInvntr3 = {
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
          		jsoninptCmndDsctnList3.push(rawMtrInvntr3);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});
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
	//상품재고 내역 조회 끝

// 	function fn_closeModal(modalId){
// 		SBUxMethod.closeModal(modalId);
// 	}

	//fn_updataList
	//저장 버튼
	// grdUserAprv -> 그리드 아이디
	// userAprvList ->
	const fn_updataList = async function() {
		let postJsonPromise_udpate = [];
		const updateList = [];
		const rawMtrInvntrList = [];
		const sortInvntrList = [];
		let allData1 = inptCmndDsctnList.getGridDataAll();

		for ( let i=1; i<=allData1.length; i++ ){
			const rowData1 = inptCmndDsctnList.getRowData(i);
			const rowSts1 = inptCmndDsctnList.getRowStatus(i);


			if (rowSts1 === 2){
				rowData1.apcCd = gv_selectedApcCd;
				rowData1.rowSts = "U";
// 				rowData1.resultStatus = "S";
				updateList.push(rowData1);
			} else {
				continue;
			}
			if (updateList.length == 0){
				gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
	            return;
			}
		}
		
		if(checkSection == 1){
			postJsonPromise_udpate = gfn_postJSON("/am/invntr/updateRawMtrInvntrList.do", updateList);	// 프로그램id 추가
    		const data = await postJsonPromise_udpate;

// 			console.log('_.isEqual("S", data.resultStatus)',_.isEqual("S", data.resultStatus));
    		if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        	} else {
        		gfn_comAlert("E0001");	// E0001	오류가 발생하였습니다.
        	}
        	fn_selectGridList();
		}
		else if(checkSection == 2){
			postJsonPromise_udpate = gfn_postJSON("/am/invntr/updateSortInvntrDsctnList.do", updateList);	// 프로그램id 추가
    		const data = await postJsonPromise_udpate;

// 			console.log('_.isEqual("S", data.resultStatus)',_.isEqual("S", data.resultStatus));
    		if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        	} else {
        		gfn_comAlert("E0001");	// E0001	오류가 발생하였습니다.
        	}
        	fn_selectGridList();
		}
		else if(checkSection == 3){
			postJsonPromise_udpate = gfn_postJSON("/am/invntr/updateGdsInvntrList.do", updateList);	// 프로그램id 추가
    		const data = await postJsonPromise_udpate;

// 			console.log('_.isEqual("S", data.resultStatus)',_.isEqual("S", data.resultStatus));
    		if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        	} else {
        		gfn_comAlert("E0001");	// E0001	오류가 발생하였습니다.
        	}
        	fn_selectGridList();
		}
	}
	
	//modal

	async function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		await gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonSpcfct, gv_selectedApcCd, itemCd);	// 규격
		fn_getPrdcrs();
	}
	const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

     const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.setValue('srch-inp-vrtyCd', '');
			SBUxMethod.setValue('srch-inp-vrtyCd', vrty.vrtyCd);
			SBUxMethod.set('srch-inp-vrtyNm', '');
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
		}
	}
     const fn_setVrtys = function(vrtys) {
    	 console.log("vrtys", vrtys);
		if (!gfn_isEmpty(vrtys)) {
			var _vrtys = [];
			var _vrtyCds = [];
			for(var i=0;i<vrtys.length;i++){
				_vrtys.push(vrtys[i].vrtyNm);
				_vrtyCds.push(vrtys[i].vrtyCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', '');
			SBUxMethod.set('srch-inp-vrtyNm', _vrtys.join(','));
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCds.join(','));
		}
	}

    /* 생산자 팝업 호출 필수 function  */
 	/* Start */
 	/**
 	 * @name fn_onKeyUpPrdcrNm
 	 * @description 생산자 리스트 호출
 	 */
 	const fn_getPrdcrs = async function() {
 		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
 		jsonPrdcr = gfn_setFrst(jsonPrdcr);
 	}
 	/**
 	 * @name fn_onKeyUpPrdcrNm
 	 * @description 생산자 팝업 호출
 	 */
 	const fn_choicePrdcr = function() {
 		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
 	}

 	/**
 	 * @name fn_onKeyUpPrdcrNm
 	 * @description 생산자 선택 callback
 	 */
 	const fn_setPrdcr = function(prdcr) {
 		if (!gfn_isEmpty(prdcr)) {
 			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);		// callBack input
 			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);		// callBack input
 			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");
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
</script>
</html>