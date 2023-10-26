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
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3><!-- 재고정보등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger" onclick="fn_selectGridList();">조회</sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="button" class="btn btn-sm btn-outline-danger" onclick="fn_updataList();">저장</sbux-button>
				</div>
			</div>

			<div class="box-body">
			<!--[APC] START -->
				<%@ include file="../../../frame/inc/apcSelect.jsp" %>
			<!--[APC] END --
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
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm input-sm" unselected-text="전체" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" class="form-control input-sm" jsondata-ref="jsonComVrty"/>
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg">규격</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-spcfctCd" name="srch-slt-spcfctCd" class="form-control input-sm" jsondata-ref="jsonSpcfct"/>
							</td>
							<td colspan="2">&nbsp;</td>

							<th scope="row" class="th_bg">창고구분</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-warehouseSe" name="srch-slt-warehouseSe" class="form-control input-sm" jsondata-ref="jsonComWarehouse"/>
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
								<sbux-select unselected-text="전체" uitype="single" id="srch-slt-gdsSe" name="srch-slt-gdsSe" class="form-control input-sm" jsondata-ref="jsonComGdsSeCd"/>
							</td>
							<td colspan="2">&nbsp;</td>
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
							<td colspan="2">&nbsp;</td>
						</tr>
					</tbody>
				</table>


				<div class="sbt-wrap-body">
					<div class="ad_tbl_top2 ad_tbl_top3">
					 	<div class="ad_tbl_toplist_datepk">
					 		<table class="table table-bordered tbl_fixed">
					 			<caption>검색 조건 설정</caption>
							<colgroup>
								<col style="width: 91px">
								<col style="width: 91px">
								<col style="width: 91px">
								<col style="width: auto">
								<col style="width: 65px">
								<col style="width: 65px">
							</colgroup>
							<tbody>
								<tr>
									<td class="td_input td_input_dtl"><sbux-button uitype="normal" id="srch-btn-rawmtrInvntrDsctn" name="srch-btn-rawmtrInvntrDsctn" class="btn btn-sm btn-outline-danger" text="원물재고 내역" onclick="fn_sample1()"></sbux-button></td>
									<td class="td_input td_input_dtl"><sbux-button uitype="normal" id="srch-btn-sortInvntrDsctn" name="srch-btn-sortInvntrDsctn" class="btn btn-sm btn-outline-danger" text="선별재고 내역" onclick="fn_sample2()"></sbux-button></td>
									<td class="td_input td_input_dtl"><sbux-button uitype="normal" id="srch-btn-gdsInvntrDsctn" name="srch-btn-gdsInvntrDsctn" class="btn btn-sm btn-outline-danger" text="상품재고 내역" onclick="fn_sample3()"></sbux-button></td>
									<td style="border-left:hidden"></td>
									<td style="border-left:hidden">
										<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="내려받기" class="btn btn-sm btn-outline-danger" onclick="fn_dwnld" style="float: right;">내려받기</sbux-button>
									</td>
									<td class="td_input" style="border-right:hidden; border-left:hidden" >
										<sbux-button id="btnUp" name="btnUp" uitype="normal" text="올리기" class="btn btn-sm btn-outline-danger" style="float: right;"></sbux-button>
									</td>
								</tr>
							</tbody>
					 		</table>
						</div>
					</div>
					<div class="exp-div-excel" style="display: none;width: 1000px;">
						<div id="sbexp-area-grdExpRawMtrWrhs" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpItem" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpVrty" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpPrdcr" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpSpcfct" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpWrhsSeCd" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpGdsSeCd" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpTrsprtSeCd" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpWarehouseSeCd" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpBxKnd" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpStdGrd" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpStdGrdDtl" style="height:1px; width: 100%;"></div>
						<input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="importExcelData(event)">
					</div>
               	</div>
                    <div class="sbt-grid">
                        <div id="inptCmndDsctnGridArea" style="height:540px;"></div>
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
    <!-- 원물입고 엑셀 등록 Modal -->
    <div>
        <sbux-modal
        	id="modal-imp"
        	name="modal-imp"
        	uitype="middle"
        	header-title="원물입고등록(Excel)"
        	body-html-id="body-modal-imp"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
		></sbux-modal>
    </div>
    <div id="body-modal-imp">
    	<jsp:include page="../../am/popup/importExcelPopup.jsp"></jsp:include>
    </div>

    <div>
        <sbux-modal id="modal-excel" name="modal-excel" uitype="middle" header-title="원물입고등록" body-html-id="body-modal-excel" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-excel">
    	<jsp:include page="../../am/popup/rawMtrWrhsPrfmncPopup.jsp"></jsp:include>
    </div>
    <sbux-button id="btnRawMtrWrhsfmncPopup" name="btnRawMtrWrhsfmncPopup" uitype="modal" text="엑셀등록" style="width:100%; display:none" class="btn btn-sm btn-outline-dark" target-id="modal-excel" onclick="fn_modal('btnSpmtSlsUntprcReg')"></sbux-button>
	<!-- importExcelPopup -->
</body>

<script type="text/javascript">

	var jsonComMsgKnd = [];	// srch.select.comMsgKnd

	var jsonComItem				= [];	// 품목 	itemCd			검색
	var jsonComVrty				= [];	// 품종 	vrtyCd			검색
	var jsonSpcfct				= [];	// 규격 	spcfctCd		검색
	var jsonComWarehouse		= [];	// 창고 	warehouseSeCd	검색
	var jsonComFcltCd			= [];	// 선별기 	fcltCd		검색
	var jsonComGdsSeCd			= [];	// 상품구분 gdsSeCd		검색
	var jsonComWrhsSeCd			= [];	// 입고구분 wrhsSeCd		검색
	var jsonGrdwarehouseSeCd	= [];	// 창고 	warehouseSeCd	검색

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
		 	//gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonSpcfct, gv_selectedApcCd, itemCd, gv_selectedApcCd)	// 규격
			gfn_setComCdSBSelect('inptCmndDsctnList', 		jsonGrdwarehouseSeCd, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
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

		SBUxMethod.set("srch-dtp-crtrYmd", gfn_dateToYmd(new Date()));

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
	        {caption: ["창고","창고"],				ref: 'originWarehouseSeNm',  	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["현 재고","수량"],			ref: 'invntrQntt',      type:'input',  	width:'85px',    style:'text-align:center'
	        	, format : {type:'number', rule:'#,###'}},
	        {caption: ["현 재고","중량"],		ref: 'invntrWght',      type:'input',  	width:'85px',    style:'text-align:center'
	        	, format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["변경창고", "변경창고"], 	ref: 'warehouseSeCd',   	type:'combo',  width:'120px',    style:'text-align:center;',
				typeinfo : {ref:'jsonGrdwarehouseSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value', unselect: {label : '선택', value: ''}}},
	        {caption: ["변경사항","변경사항"],		ref: 'chgPo',      type:'input',  width:'105px',    style:'text-align:center'},
	        {caption: ["창고구분코드","창고구분코드"],		ref: 'warehouseSeCd', 	type:'output',	hidden: true}
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
	    inptCmndDsctnList.bind('valuechanged', 'fn_grdTrnsfQnttValueChanged');

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
	        {caption: ["창고","창고"],			ref: 'originWarehouseSeNm',  	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["현 재고","수량"],		ref: 'invntrQntt',      type:'input',  	width:'85px',    style:'text-align:center'
	        	, format : {type:'number', rule:'#,###'}},
	        {caption: ["현 재고","중량"],		ref: 'invntrWght',      type:'input',  	width:'85px',    style:'text-align:center'
	        	, format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["변경창고", "변경창고"], ref: 'warehouseSeCd',   	type:'combo',  width:'120px',    style:'text-align:center;',
				typeinfo : {ref:'jsonGrdwarehouseSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value', unselect: {label : '선택', value: ''}}},
	        {caption: ["변경사항","변경사항"],	ref: 'chgPo',      		type:'input',  		width:'105px',    	style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
	    inptCmndDsctnList.bind('valuechanged', 'fn_grdTrnsfQnttValueChanged');

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
	    	{caption: ["선택","선택"],			ref: 'checkBox',      	type:'checkbox',  width:'50px',    style:'text-align:center', typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}},
	        {caption: ["포장번호","포장번호"],	ref: 'pckgno',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["순번","순번"],			ref: 'pckgSn',      	type:'output',  width:'85px',    style:'text-align:center'},
	        {caption: ["포장일자","포장일자"],	ref: 'pckgYmd',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["설비","설비"],			ref: 'fcltNm',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],		ref: 'rprsPrdcrNm',     type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품목","품목"],			ref: 'itemNm',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["품종","품종"],			ref: 'vrtyNm',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["규격","규격"],			ref: 'spcfctNm',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["등급","등급"],			ref: 'gdsGrdNm',      	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["창고","창고"],			ref: 'originWarehouseSeNm',  	type:'output',  width:'105px',    style:'text-align:center'},
	        {caption: ["현 재고","수량"],		ref: 'invntrQntt',      type:'input',  	width:'85px',    style:'text-align:center'
	        	, format : {type:'number', rule:'#,###'}},
	        {caption: ["현 재고","중량"],		ref: 'invntrWght',      type:'input',  	width:'85px',    style:'text-align:center'
	        	, format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["변경창고", "변경창고"], ref: 'warehouseSeCd',   	type:'combo',  width:'120px',    style:'text-align:center;',
				typeinfo : {ref:'jsonGrdwarehouseSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value', unselect: {label : '선택', value: ''}}},
	        {caption: ["변경사항","변경사항"],	ref: 'chgPo',      	type:'input',  		width:'105px',    	style:'text-align:center'},
	        {caption: ["창고구분코드","창고구분코드"],		ref: 'warehouseSeCd', 	type:'output',	hidden: true}
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
	    inptCmndDsctnList.bind('valuechanged', 'fn_grdTrnsfQnttValueChanged');

	    fn_selectGridList();

	}

	const fn_grdTrnsfQnttValueChanged = function(){

		let nRow = inptCmndDsctnList.getRow();
		let nCol = inptCmndDsctnList.getCol();
		let invntrQnttQnttCol = inptCmndDsctnList.getColRef("invntrQntt");
		let invntrWghtQnttCol = inptCmndDsctnList.getColRef("invntrWght");
		switch (nCol) {
		case invntrQnttQnttCol:	// checkbox
			fn_checkInptQntt();
			break;
		case invntrQnttQnttCol:	// checkbox
			fn_checkInptWght();
			break;
		default:
			return;
		}
	}

	const fn_checkInptQntt = function(){
		let nRow = inptCmndDsctnList.getRow();
		let invntrQnttQnttCol = inptCmndDsctnList.getColRef("invntrQntt");
		let invntrWghtQnttCol = inptCmndDsctnList.getColRef("invntrWght");
		let checkedYnCol 	= inptCmndDsctnList.getColRef("checkBox");

		let rowData = inptCmndDsctnList.getRowData(nRow);

		let invntrQntt = rowData.invntrQntt;
		let invntrWght = rowData.invntrWght;
		let originInvntrQntt = rowData.originInvntrQntt;
		let originInvntrWght = rowData.originInvntrWght;

		if(invntrQntt > 0){
			let wght = parseInt(Math.round(parseInt(originInvntrWght) / parseInt(originInvntrQntt)));
			inptCmndDsctnList.setCellData(nRow, invntrWghtQnttCol, invntrQntt*wght);
			inptCmndDsctnList.setCellData(nRow, checkedYnCol, "Y");
		}
		if(invntrQntt == 0){
			inptCmndDsctnList.setCellData(nRow, invntrWghtQnttCol, 0);
			inptCmndDsctnList.setCellData(nRow, checkedYnCol, "Y");
		}
	}

	const fn_checkInptWght = function(){
		let nRow = inptCmndDsctnList.getRow();
		let invntrQnttQnttCol = inptCmndDsctnList.getColRef("invntrQntt");
		let invntrWghtQnttCol = inptCmndDsctnList.getColRef("invntrWght");
		let checkedYnCol 	= inptCmndDsctnList.getColRef("checkBox");

		let invntrQntt = rowData.invntrQntt;
		let invntrWght = rowData.invntrWght;
		let originInvntrQntt = rowData.originInvntrQntt;
		let originInvntrWght = rowData.originInvntrWght;

		if(invntrWght > 0){

		}
		if(invntrWght == 0){
			inptCmndDsctnList.setCellData(nRow, invntrQnttQnttCol, 0);
			inptCmndDsctnList.setCellData(nRow, checkedYnCol, "Y");
		}
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
       				  wrhsno			: item.wrhsno
       				, pltno				: item.pltno
       				, wrhsYmd			: item.wrhsYmd
       				, prdcrNm			: item.prdcrNm
       				, itemNm			: item.itemNm
       				, vrtyNm			: item.vrtyNm
       				, gdsSeNm			: item.gdsSeNm
       				, wrhsSeNm			: item.wrhsSeNm
       				, trsprtSeNm		: item.trsprtSeNm
       				, originWarehouseSeNm	: item.warehouseSeNm
       				, bxknd				: item.bxknd
       				, grdNm				: item.grdNm
       				, wrhsQntt			: item.wrhsQntt
       				, wrhsWght			: item.wrhsWght
       				, inptQntt			: item.inptQntt
       				, inptWght			: item.inptWght
       				, invntrQntt		: item.invntrQntt
       				, invntrWght		: item.invntrWght
       				, sortcmndNo		: item.sortcmndNo
       				, fcltNm			: item.fcltNm
       				, originInvntrQntt	: item.invntrQntt
      				, originInvntrWght	: item.invntrWght
  				}

          		jsoninptCmndDsctnList.push(Object.assign({}, rawMtrInvntr));

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
          			  sortno			: item.sortno
          			, sortSn			: item.sortSn
       				, grdNm				: item.grdNm
       				, inptYmd			: item.inptYmd
       				, fcltNm			: item.fcltNm
       				, prdcrNm			: item.prdcrNm
       				, itemNm			: item.itemNm
       				, vrtyNm			: item.vrtyNm
       				, spcfctNm			: item.spcfctNm
       				, originWarehouseSeNm	: item.warehouseSeNm
       				, sortQntt			: item.sortQntt
       				, sortWght			: item.sortWght
       				, pckgQntt			: item.pckgQntt
       				, pckgWght			: item.pckgWght
       				, invntrQntt		: item.invntrQntt
       				, invntrWght		: item.invntrWght
       				, originInvntrQntt	: item.invntrQntt
      				, originInvntrWght	: item.invntrWght
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
		let crtrYmd = SBUxMethod.get("srch-dtp-crtrYmd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let gdsSeCd = SBUxMethod.get("srch-slt-gdsSe");
		let wrhsSeCd = SBUxMethod.get("srch-slt-wrhsSeCd");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSe");
		const postJsonPromise3 = gfn_postJSON("/am/trnsf/selectUpdateTrnsfGdsInvntrList.do", {
			apcCd		:  gv_selectedApcCd,
			crtrYmd: crtrYmd,
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

        let data3 = await postJsonPromise3;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {
          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsoninptCmndDsctnList3.length = 0;
          	data3.resultList.forEach((item, index) => {
          		const rawMtrInvntr3 = {
          				  pckgno			: item.pckgno
          				, pckgSn			: item.pckgSn
          				, pckgYmd			: item.pckgYmd
          				, fcltNm			: item.fcltNm
          				, fcltCd			: item.fcltCd
          				, rprsPrdcrNm		: item.prdcrNm
          				, rprsPrdcrCd		: item.rprsPrdcrCd
          				, itemNm			: item.itemNm
          				, itemCd			: item.itemCd
          				, vrtyNm			: item.vrtyNm
          				, vrtyCd			: item.vrtyCd
          				, spcfctNm			: item.spcfctNm
          				, spcfctCd			: item.spcfctCd
          				, gdsGrdNm			: item.gdsGrdNm
          				, gdsGrd			: item.gdsGrd
          				, originWarehouseSeNm	: item.warehouseSeNm
          				, invntrQntt		: item.invntrQntt
          				, invntrWght		: item.invntrWght
          				, trnsfWarehouse	: item.trnsfWarehouse
          				, apcCd				: item.apcCd
          				, originInvntrQntt	: item.invntrQntt
          				, originInvntrWght	: item.invntrWght
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
		let grdRows = inptCmndDsctnList.getCheckedRows(0);
		let updateList = [];
		for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData = inptCmndDsctnList.getRowData(nRow)
			let rowSts = inptCmndDsctnList.getRowStatus(nRow);

			if (rowSts === 2){
				rowData.apcCd = gv_selectedApcCd;
				rowData.rowSts = "U";
				updateList.push(rowData);
			} else {
				continue;
			}
		}
		if (updateList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){

			let postJsonPromise;
			if(checkSection == 1){
				postJsonPromise = gfn_postJSON("/am/invntr/updateRawMtrInvntrList.do", updateList);
			}
			if(checkSection == 2){
				postJsonPromise = gfn_postJSON("/am/invntr/updateSortInvntrList.do", updateList);
			}
			if(checkSection == 3){
				postJsonPromise = gfn_postJSON("/am/invntr/updateGdsInvntrList.do", updateList);
			}

	    	const data = await postJsonPromise;

	    	try{
	       		if(data.errMsg == null){
	       			fn_selectGridList
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	       		}else{
	       			gfn_comAlert("E0001");					// E0001 오류가 발생하였습니다.
	       		}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
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

 	// 엑셀다운로드
	// exp combo
	var jsonExpSltItem = [];
	var jsonExpSltVrty = [];
	var jsonExpSltPrdcr = [];
	var jsonExpSltSpcfct = [];
	var jsonExpSltWrhsSeCd = [];
	var jsonExpSltGdsSeCd = [];
	var jsonExpSltTrsprtSeCd = [];
	var jsonExpSltWarehouseSeCd = [];
	var jsonExpSltBxKnd = [];

	var grdExpRawMtrWrhs;
	var grdExpItem;
	var grdExpVrty;
	var grdExpPrdcr;
	var grdExpSpcfct;
	var grdExpWrhsSeCd;
	var grdExpGdsSeCd;
	var grdExpTrsprtSeCd;
	var grdExpWarehouseSeCd;
	var grdExpBxKnd;
	var grdExpStdGrd;
	var grdExpStdGrdDtl;
	// exp grid json
	var jsonExpRawMtrWrhs = [];
	var jsonExpItem = [];
	var jsonExpVrty = [];
	var jsonExpPrdcr = [];
	var jsonExpSpcfct = [];
	var jsonExpWrhsSeCd = [];
	var jsonExpGdsSeCd = [];
	var jsonExpTrsprtSeCd = [];
	var jsonExpWarehouseSeCd = [];
	var jsonExpBxKnd = [];
	var jsonExpStdGrd = [];
	var jsonExpStdGrdDtl = [];

	const fn_getExpColumns = function() {
		const _columns = []
		_columns.push(
			{caption: ["입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'100px',    style:'text-align:center'},
			{caption: ["품목"], 		ref: 'itemCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품종"], 		ref: 'vrtyCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["생산자"], 		ref: 'prdcrCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltPrdcr', 	displayui : false,	itemcount: 10, label:'prdcrNm', value:'prdcrCd'}},
			{caption: ["규격"], 		ref: 'spcfctCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltSpcfct', 	displayui : false,	itemcount: 10, label:'SpcfctNm', value:'SpcfctCd'}},
// 			{caption: ["입고구분"], 	ref: 'wrhsSeCd',   	type:'combo',  width:'80px',    style:'text-align:center',
// 				typeinfo : {ref:'jsonExpSltWrhsSeCd', 	displayui : false,	itemcount: 10, label:'wrhsSeNm', value:'wrhsSeCd'}},
	        {caption: ["상품구분"], 	ref: 'gdsSeCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltGdsSeCd', 	displayui : false,	itemcount: 10, label:'gdsSeNm', value:'gdsSeCd'}},
	        {caption: ["운송구분"], 	ref: 'trsprtSeCd',   	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltTrsprtSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["보관창고"],		ref: 'warehouseSeCd',	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltWarehouseSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["박스"],		ref: 'pltBxCd ',	type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltBxKnd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["생산연도"],		ref: 'prdctnYr',    	type:'output',  width:'80px',    style:'text-align:left'},
	        {caption: ["차량번호"],		ref: 'vhclno',      type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["박스수량"],		ref: 'bxQntt',      type:'output',  width:'60px',    style:'text-align:right'},
	        {caption: ["중량 Kg"],	ref: 'wrhsWght',    type:'output',  width:'60px',    style:'text-align:right'}
		);

		const columnsStdGrd = [];
	    gjsonStdGrdObjKnd.forEach((item, index) => {
			const grd = {
				caption: ["등급:" + item.grdKndNm],
				ref: gStdGrdObj.colPrfx + item.grdKnd,
				type:'combo',
				width:'80px',
				style: 'text-align:center;background-color:#FFF8DC;',
				userattr: {colNm: "stdGrd"},
				typeinfo: {ref: item.jsonId, label:'grdNm', value:'grdCd', displayui : false, oneclickedit: true}
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
			_columns.push(jgmtGrd);
		}

	    columnsStdGrd.forEach((item) => {
	    	_columns.push(item);
		});

	    _columns.push(
			{caption: ["비고"],		ref: 'rmrk',      	type:'output',  width:'200px',    style:'text-align:left'}
	    );

	    return _columns;
	}

	const fn_setSltJson = async function() {
		// set exp/imp combo json
		// 품목
		jsonExpSltItem = gfn_cloneJson(jsonComItem);
		// 품종
		jsonExpSltVrty = gfn_cloneJson(jsonComVrty);
		// 생산자
		jsonExpSltPrdcr = gfn_cloneJson(jsonPrdcr);
		//규격
		jsonExpSltSpcfct = gfn_cloneJson(jsonSpcfct);
		// 입고구분
// 		jsonExpSltWrhsSeCd = gfn_cloneJson(jsonComWrhsSeCd);
		// 상품구분
		jsonExpSltGdsSeCd = gfn_cloneJson(jsonComGdsSeCd);
		// 보관창고
		jsonExpSltWarehouseSeCd = gfn_cloneJson(jsonComWarehouse);
	}
	const fn_setExpJson = async function() {
		// export grid data
		jsonExpRawMtrWrhs.length = 0;
		jsonExpItem = gfn_cloneJson(jsonComItem);
		jsonExpVrty = gfn_cloneJson(jsonComVrty);
		jsonExpPrdcr = gfn_cloneJson(jsonPrdcr);
		jsonExpSpcfct = gfn_cloneJson(jsonSpcfct);
		jsonExpWrhsSeCd = gfn_cloneJson(jsonComWrhsSeCd);
		jsonExpGdsSeCd = gfn_cloneJson(jsonComGdsSeCd);
		jsonExpWarehouseSeCd = gfn_cloneJson(jsonComWarehouse);
		jsonExpStdGrd = gfn_cloneJson(gjsonStdGrdObjKnd);
		jsonExpStdGrdDtl = gfn_cloneJson(gjsonStdGrdObjDtl);
	}
	const fn_createExpGrid = async function(_expObjList) {
		_expObjList.forEach( (exp, idx) => {
			var SBGridProperties = {};
			SBGridProperties.parentid = exp.parentid;
			SBGridProperties.id = exp.id;
			SBGridProperties.jsonref = exp.jsonref;
			SBGridProperties.emptyrecords = '데이터가 없습니다.';;
			SBGridProperties.selectmode = 'byrow';
			SBGridProperties.extendlastcol = 'none';
			SBGridProperties.columns = exp.columns;

			exp.sbGrid = _SBGrid.create(SBGridProperties);
			exp.sbGrid.addRow(true);
			/*
			if (idx === 0) {
				exp.sbGrid.addRow(true, {
				   	wrhsYmd 		: gfn_dateToYmd(new Date())
			      , itemCd			: "0101"
			      , vrtyCd			: "2000"
			      , prdcrCd			: "0001"
			      , wrhsSeCd		: "1"
			      , gdsSeCd			: "1"
			      , trsprtSeCd		: "1"
			      , warehouseSeCd 	: "01"
			      , pltBxCd 		: "0001"
			      , prdctnYr		: "2023"
			      , stdGrd			: "01"
			      , stdGrdDtl		: "01"
			      , bxQntt    		: "5"
			      , wrhsWght		: "500"
			      , rmrk			: "비고"
				});
			}
			*/
		});
	}

	const fn_dwnld = async function(){

		await fn_setSltJson();
		await fn_setExpJson();

		const expColumns = fn_getExpColumns();

		const expObjList = [
		    {
		        sbGrid: grdExpRawMtrWrhs,
		        parentid: "sbexp-area-grdExpRawMtrWrhs",
		        id: "grdExpRawMtrWrhs",
		        jsonref: "jsonExpRawMtrWrhs",
				columns: expColumns,
		        sheetName: "재고정보내역",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpItem,
		        parentid: "sbexp-area-grdExpItem",
		        id: "grdExpItem",
		        jsonref: "jsonExpItem",
				columns: [
			    	{caption: ["품목코드"],     ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
			        {caption: ["품목명칭"],     ref: 'itemNm',  type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "품목",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpVrty,
		        parentid: "sbexp-area-grdExpVrty",
		        id: "grdExpVrty",
		        jsonref: "jsonExpVrty",
				columns: [
					{caption: ["품목코드"],		ref: 'itemCd',  type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품목명"],		ref: 'itemNm',  type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품종코드"],    ref: 'vrtyCd',  type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["품종명칭"],    ref: 'vrtyNm',  type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "품종",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpSpcfct,
		        parentid: "sbexp-area-grdExpSpcfct",
		        id: "grdExpSpcfct",
		        jsonref: "jsonExpSpcfct",
				columns: [
			    	{caption: ["규격코드"],   ref: 'spcfctCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["규격명"],    	ref: 'spcfctNm',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "규격",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpWarehouseSeCd,
		        parentid: "sbexp-area-grdExpWarehouseSeCd",
		        id: "grdExpWarehouseSeCd",
		        jsonref: "jsonExpWarehouseSeCd",
				columns: [
			    	{caption: ["창고코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["창고코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "창고",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpPrdcr,
		        parentid: "sbexp-area-grdExpPrdcr",
		        id: "grdExpPrdcr",
		        jsonref: "jsonExpPrdcr",
				columns: [
			    	{caption: ["생산자코드"],   ref: 'prdcrCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["생산자명"],    	ref: 'prdcrNm',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ['대표품목'],		ref: 'rprsItemCd', 	type: 'output', width: '80px', style: 'text-align:center'},
			        {caption: ['대표품종'], 	ref: 'rprsVrtyCd', 	type: 'output', width: '80px', style: 'text-align:center'}
				],
		        sheetName: "생산자",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpGdsSeCd,
		        parentid: "sbexp-area-grdExpGdsSeCd",
		        id: "grdExpGdsSeCd",
		        jsonref: "jsonExpGdsSeCd",
				columns: [
			    	{caption: ["상품구분코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["상품구분코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "상품구분",
		        title: "",
		        unit: ""
		    }, {
		    	sbGrid: grdExpWrhsSeCd,
		        parentid: "sbexp-area-grdExpWrhsSeCd",
		        id: "grdExpWrhsSeCd",
		        jsonref: "jsonExpWrhsSeCd",
				columns: [
			    	{caption: ["입고구분코드"],   	ref: 'cdVl',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["입고구분코드명"],  	ref: 'cdVlNm',  	type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "입고구분",
		        title: "",
		        unit: ""
		    }
		];

		await fn_createExpGrid(expObjList);

		//exportExcel();
	    gfn_exportExcelMulti("재고정보(샘플).xlsx", expObjList);
	}

	const gfn_exportExcelMulti = function(_fileName, _objList) {

		var objExcelInfo = {
			strFileName : _fileName,
			//strAction : "/saveExcel.do",
			strAction : "/am/excel/saveMultiExcel",
			bIsStyle: true,
			bIsMerge: true,
			bUseFormat: false,
			bIncludeData: true,
			bUseCompress: false
		};

		var dataList = [];
		var sheetNameList = [];
		var titleList = [];
		var unitList = [];
		var arrAdditionalData = [];

		_objList.forEach((item, index) => {
			sheetNameList.push(item.sheetName);
			titleList.push(item.title);
			unitList.push(item.unit);

			if (index > 0) {
				var data = item.sbGrid.exportExcel(objExcelInfo, "return");
				dataList.push(data);
			}
		});

		arrAdditionalData.push(
           {"name": "arrSheetData", "value": JSON.stringify(dataList)},
           {"name": "arrSheetName", "value": JSON.stringify(sheetNameList)},
           {"name": "arrTitle", "value": JSON.stringify(titleList)},
           {"name": "arrUnit", "value": JSON.stringify(unitList)}
		);

		objExcelInfo.arrAdditionalData = arrAdditionalData;
		_objList[0].sbGrid.exportExcel(objExcelInfo);
	}


	const importExcelData = function (e){
    	 SBUxMethod.openModal('modal-excel');
    	 fn_createGridPopup();
    	 jsonExcelRawMtrWrhsPopup = 0;
    	 grdExcelRawMtrWrhsPopup.rebuild();

    	 grdExcelRawMtrWrhsPopup.importExcelData(e);
     }
</script>
</html>