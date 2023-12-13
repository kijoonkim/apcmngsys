<%
/**
 * @Class Name : regInvntrTrnsf.jsp
 * @Description : 재고이송등록 화면
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : 재고이송등록</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 재고이송등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_selectGridList"></sbux-button>
				</div>
			</div>
			<div class="box-body">
			<!--[APC] START -->
				<%@ include file="../../../frame/inc/apcSelect.jsp" %>
			<!--[APC] END -->
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
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm"
									jsondata-ref="jsonComItem"
									onchange="fn_selectItem"
								></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm"
									unselected-text="선택"
									jsondata-ref="jsonComVrty"
									onchange="fn_selectVrty"
								></sbux-select>
							</td>
							<td>&nbsp;</td>
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
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-gdsSe"
									name="srch-slt-gdsSe"
									class="form-control input-sm"
									jsondata-ref="jsonComGdsSeCd"
								/>
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
				<div class="ad_tbl_top2">
				 	<div class="ad_tbl_toplist_datepk">
				 		<table class="table table-bordered tbl_fixed">
				 			<caption>검색 조건 설정</caption>
							<colgroup>
								<col style="width: 91px">
								<col style="width: 91px">
								<col style="width: 91px">
								<col style="width: auto">
								<col style="width: 70px">
								<col style="width: 220px">
							</colgroup>
							<tbody>
								<tr>
									<td class="td_input td_input_dtl"><sbux-button uitype="normal" id="srch-btn-rawmtrInvntrDsctn" name="srch-btn-rawmtrInvntrDsctn" class="btn btn-sm btn-outline-danger" text="원물재고 내역" onclick="fn_sample1()"></sbux-button></td>
									<td class="td_input td_input_dtl"><sbux-button uitype="normal" id="srch-btn-sortInvntrDsctn" name="srch-btn-sortInvntrDsctn" class="btn btn-sm btn-outline-danger" text="선별재고 내역" onclick="fn_sample2()"></sbux-button></td>
									<td class="td_input td_input_dtl"><sbux-button uitype="normal" id="srch-btn-gdsInvntrDsctn" name="srch-btn-gdsInvntrDsctn" class="btn btn-sm btn-outline-danger" text="상품재고 내역" onclick="fn_sample3()"></sbux-button></td>
									<td style="border-left:hidden"></td>
									<td style="border-left:hidden">
										<h5 style="float:left; color:black;">이송APC</h5>
									</td>
									<td class="td_input" style="border-right:hidden; border-left:hidden" >
										<sbux-select
											unselected-text="선택"
											uitype="single"
											id="dtl-slt-trnsfApcCd"
											name="dtl-slt-trnsfApcCd"
											class="form-control input-sm"
											jsondata-ref="jsonTrnsfApcCd"
											style="float: right"
										/>
									</td>
								</tr>
							</tbody>
				 		</table>
					</div>
				</div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="inptCmndDsctnGridArea" style="height:541px;"></div>
                </div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
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
	var jsonComSpcfct		= [];	// 규격 	spcfctCd		검색
	var jsonComWarehouse	= [];	// 창고 	warehouseSeCd	검색
	var jsonComWrhsSeCd		= [];	// 창고 	warehouseSeCd	검색
	var jsonComGdsSeCd		= [];	// 상품구분 gdsSeCd			검색
	var jsonComWrhsSeCd		= [];	// 입고구분 wrhsSeCd		검색
	var jsonTrnsfApcCd		= [];	// 이송APC  상세

	/*생산자 팝업 및 초성검색 */
	var jsonDataPrdcr = [];
	var jsonPrdcr			= [];
	var jsonPrdcrAutocomplete = [];
	var autoCompleteDataJson = [];

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_sample1();
		checkSection = 1;

		SBUxMethod.set("srch-dtp-crtrYmd", gfn_dateToYmd(new Date()));

		fn_initSBSelect();
	});

	const fn_initSBSelect = async function() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let rst = await Promise.all([
			gfn_setApcInfoSBSelect('dtl-slt-trnsfApcCd', 	jsonTrnsfApcCd, 	gv_selectedApcCd),	// 이송APC
			gfn_setComCdSBSelect('srch-slt-warehouseSe', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('srch-slt-wrhsSeCd', 		jsonComWrhsSeCd, 	'WRHS_SE_CD'),							// 입고구분
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 		gv_selectedApcCd),						// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 		gv_selectedApcCd),						// 품종
		 	gfn_setComCdSBSelect('srch-slt-gdsSe', 			jsonComGdsSeCd, 	'GDS_SE_CD', 	gv_selectedApcCd),		// 상품구분
		])

		if(checkSection == 1 || checkSection == 0){
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true');
    	}else if(checkSection == 2 || checkSection == 3){
    		SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false');
    	}

		fn_getPrdcrs();
		fn_getComData();
	}

	const fn_getComData = async function() {
		let result = await Promise.all([
			gfn_getComCdDtls('WAREHOUSE_SE_CD', gv_selectedApcCd),
			gfn_getComCdDtls('GDS_GRD'),
		]);
		jsonComWarehouse = result[0];
		jsonComGdsGrd = result[1];
	}

	const fn_selectItem = async function(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");

		if(gfn_isEmpty(itemCd)){

			jsonComSpcfct.length = 0;
			SBUxMethod.refresh("srch-slt-spcfctCd");
			let rst = await Promise.all([
				gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 				jsonComVrty, 				gv_selectedApcCd, itemCd),	// 품종
			])
		}else{
			let rst = await Promise.all([
				gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 				jsonComVrty, 				gv_selectedApcCd, itemCd),	// 품종
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',			jsonComSpcfct, 				gv_selectedApcCd, itemCd),	// 규격
			])
		}

		if(checkSection == 1){
			jsonComSpcfct.length = 0;
			SBUxMethod.refresh("srch-slt-spcfctCd");
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true')
		}else{
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false')
		}

	}

	const fn_selectVrty = async function(){
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let itemCd = "";
		for(i=0;i<jsonComVrty.length;i++){
			if(jsonComVrty[i].value == vrtyCd){
				itemCd = jsonComVrty[i].mastervalue;
			}
		}
		SBUxMethod.set("srch-slt-itemCd", itemCd);
		if(checkSection == 2 || checkSection == 3){
			if(gfn_isEmpty(itemCd)){
				jsonComSpcfct.length = 0;
				SBUxMethod.refresh("srch-slt-spcfctCd");
			}else{
				let rst = await Promise.all([
					gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 	jsonComSpcfct, 		gv_selectedApcCd, itemCd),					// 규격
				])
				SBUxMethod.refresh("srch-slt-spcfctCd");
			}
			SBUxMethod.refresh("srch-slt-spcfctCd");
    	}

		if(checkSection == 1){
			jsonComSpcfct.length = 0;
			SBUxMethod.refresh("srch-slt-spcfctCd");
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true')
		}else{
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false')
		}
	}

	var jsonComMsgKnd = [];	// srch.select.comMsgKnd
	var checkSection = 0;

	var inptCmndDsctnList = []; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언

	function fn_sample1(){
		fn_initSBSelect();

		$("#srch-btn-rawmtrInvntrDsctn").css({"background-color":"#149FFF","color":"white"});
		$("#srch-btn-sortInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-gdsInvntrDsctn").css({"background-color":"white","color":"black"});
		_SBGrid.destroy('inptCmndDsctnList');

		checkSection = 1;
		fn_createGrid1();
	}
	function fn_sample2(){
		fn_initSBSelect();
		$("#srch-btn-rawmtrInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-sortInvntrDsctn").css({"background-color":"#149FFF","color":"white"});
		$("#srch-btn-gdsInvntrDsctn").css({"background-color":"white","color":"black"});
		_SBGrid.destroy('inptCmndDsctnList');
		checkSection = 2;
		fn_createGrid2();
	}
	function fn_sample3(){
		fn_initSBSelect();
		$("#srch-btn-rawmtrInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-sortInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-gdsInvntrDsctn").css({"background-color":"#149FFF","color":"white"});
		_SBGrid.destroy('inptCmndDsctnList');
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
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.oneclickedit = true;
		SBGridProperties.frozencols = 4;
	    SBGridProperties.columns = [
	    	{
	    		caption: ["전체","<input type='checkbox' onchange='fn_checkAll(inptCmndDsctnList, this);'>"],
	    		ref: 'checkBox',      	type:'checkbox',  	width:'50px',
	    		style:'text-align:center',
	    		typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
	    	},
	        {caption: ["입고번호","입고번호"],		ref: 'wrhsno',      		type:'output',  width:'110px',    style:'text-align:center'},
	        {caption: ["팔레트번호","팔레트번호"],	ref: 'pltno',      			type:'output',  width:'110px',    style:'text-align:center'},
	        {caption: ["입고일자","입고일자"],		ref: 'wrhsYmd',      		type:'output',  width:'110px',    style:'text-align:center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["생산자","생산자"],			ref: 'prdcrNm',      		type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["품목","품목"],				ref: 'itemNm',      		type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["품종","품종"],				ref: 'vrtyNm',      		type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["상품","상품"],				ref: 'gdsSeNm',      		type:'output',  width:'80px',    style:'text-align:center'},
	        {caption: ["입고","입고"],				ref: 'wrhsSeNm',     		type:'output',  width:'60px',    style:'text-align:center'},
	        {caption: ["운송","운송"],				ref: 'trsprtSeNm',      	type:'output',  width:'60px',    style:'text-align:center'},
	        {caption: ["현물창고","현물창고"],		ref: 'warehouseSeNm',      	type:'output',  width:'110px',    style:'text-align:center'},
	        {caption: ["재고","수량"],				ref: 'invntrQntt',      	type:'output',  width:'60px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### '}},
	        {caption: ["재고","중량"],				ref: 'invntrWght',      	type:'output',  width:'80px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}},
	        {caption: ["이송","수량"],				ref: 'trnsfQntt',      		type:'input',  width:'60px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,###'}, typeinfo : {mask : {alias : '#', repeat: '*'}}},
	        {caption: ["이송","중량"],				ref: 'trnsfWght',      		type:'input',  width:'80px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}, typeinfo : {mask : {alias : '#', repeat: '*'}}},
	        {caption: ["비고","비고"],				ref: 'rmrk',      			type:'output',  width:'110px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
	    inptCmndDsctnList.bind('valuechanged', 'fn_grdTrnsfQnttValueChanged');
	    inptCmndDsctnList.bind('select', 'fn_setValue');
	    inptCmndDsctnList.bind('deselect', 'fn_delValue');

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
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{
	    		caption: ["전체","<input type='checkbox' onchange='fn_checkAll(inptCmndDsctnList, this);'>"],
	    		ref: 'checkBox',      	type:'checkbox',  	width:'50px',
	    		style:'text-align:center',
	    		typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
	    	},
	        {caption: ["선별번호","선별번호"],	ref: 'sortno',      	type:'output',  	width:'110px',    style:'text-align:center'},
	        {caption: ["등급","등급"],			ref: 'grdNm',      		type:'output',  	width:'80px',    style:'text-align:center'},
	        {caption: ["투입일자","투입일자"],	ref: 'inptYmd',      	type:'output',  	width:'100px',    style:'text-align:center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["설비","설비"],			ref: 'fcltNm',      	type:'output',  	width:'100px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],		ref: 'prdcrNm',      	type:'output',  	width:'80px',    style:'text-align:center'},
	        {caption: ["품목","품목"],			ref: 'itemNm',      	type:'output',  	width:'80px',    style:'text-align:center'},
	        {caption: ["품종","품종"],			ref: 'vrtyNm',      	type:'output',  	width:'80px',    style:'text-align:center'},
	        {caption: ["규격","규격"],			ref: 'spcfctNm',      	type:'output',  	width:'80px',    style:'text-align:center'},
	        {caption: ["현물창고","현물창고"],	ref: 'warehouseSeNm',      		type:'output',  width:'110px',    style:'text-align:center'},
	        {caption: ["재고","수량"],			ref: 'invntrQntt',      	type:'output',  width:'60px',    style:'text-align:center'},
	        {caption: ["재고","중량"],			ref: 'invntrWght',      	type:'output',  width:'80px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["이송","수량"],				ref: 'trnsfQntt',      		type:'input',  width:'60px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,###'}, typeinfo : {mask : {alias : '#', repeat: '*'}}},
	        {caption: ["이송","중량"],				ref: 'trnsfWght',      		type:'input',  width:'80px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}, typeinfo : {mask : {alias : '#', repeat: '*'}}
	        },
	        {caption: ["비고","비고"],			ref: 'rmrk',      			type:'output',  width:'110px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
	    inptCmndDsctnList.bind('valuechanged', 'fn_grdTrnsfQnttValueChanged');
	    inptCmndDsctnList.bind('select', 'fn_setValue');
	    inptCmndDsctnList.bind('deselect', 'fn_delValue');

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
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.explorerbar = 'move';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.scrollbubbling = false;
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.columns = [
	    	{
	    		caption: ["전체","<input type='checkbox' onchange='fn_checkAll(inptCmndDsctnList, this);'>"],
	    		ref: 'checkBox',      	type:'checkbox',	width:'50px',
	    		style:'text-align:center',
	    		typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
	    	},
	        {caption: ["포장번호","포장번호"],		ref: 'pckgno',      	type:'output',  width:'110px',	style:'text-align:center'},
	        {caption: ["순번","순번"],				ref: 'pckgSn',      	type:'output',  width:'50px',   style:'text-align:center'},
	        {caption: ["포장일자","포장일자"],		ref: 'pckgYmd',      	type:'output',  width:'110px',  style:'text-align:center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
	        {caption: ["설비","설비"],				ref: 'fcltNm',      	type:'output',  width:'110px',  style:'text-align:center'},
	        {caption: ["생산자","생산자"],			ref: 'rprsPrdcrNm',     type:'output',  width:'80px',   style:'text-align:center'},
	        {caption: ["품목","품목"],				ref: 'itemNm',      	type:'output',  width:'80px',   style:'text-align:center'},
	        {caption: ["품종","품종"],				ref: 'vrtyNm',      	type:'output',  width:'80px',   style:'text-align:center'},
	        {caption: ["규격","규격"],				ref: 'spcfctNm',      	type:'output',  width:'80px',   style:'text-align:center'},
	        {caption: ["등급","등급"],				ref: 'gdsGrdNm',      	type:'output',  width:'80px',   style:'text-align:center'},
	        {caption: ["현물창고","현물창고"],		ref: 'warehouseSeNm',   type:'output',  width:'110px',  style:'text-align:center'},
	        {caption: ["재고","수량"],				ref: 'invntrQntt',    	type:'output',  width:'60px',   style:'text-align:center',
	        	format : {type:'number', rule:'#,###'}},
	        {caption: ["재고","중량"],				ref: 'invntrWght',    	type:'output',  width:'80px',   style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}
	        },
	        {caption: ["이송","수량"],				ref: 'trnsfQntt',      	type:'input',  width:'60px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,###'}, typeinfo : {mask : {alias : '#', repeat: '*'}}},
	        {caption: ["이송","중량"],				ref: 'trnsfWght',      	type:'input',  width:'80px',    style:'text-align:center',
	        	format : {type:'number', rule:'#,### Kg'}, typeinfo : {mask : {alias : '#', repeat: '*'}}
	        },
	        {caption: ["비고","비고"],				ref: 'rmrk',      		type:'output',  width:'110px',  style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
	    inptCmndDsctnList.bind('valuechanged', 'fn_grdTrnsfQnttValueChanged');
	    inptCmndDsctnList.bind('select', 'fn_setValue');
	    inptCmndDsctnList.bind('deselect', 'fn_delValue');

	    fn_selectGridList();

	}

	const fn_setValue = function(){
		let nRow = inptCmndDsctnList.getRow();
    	let nCol = inptCmndDsctnList.getCol();
    	if(nCol == 0){

    		let rowData = inptCmndDsctnList.getRowData(nRow);

    		let invntrQntt = rowData.invntrQntt;
    		let invntrWght = rowData.invntrWght;

    		let trnsfQnttQnttCol = inptCmndDsctnList.getColRef("trnsfQntt");
			let trnsfWghtQnttCol = inptCmndDsctnList.getColRef("trnsfWght");

			inptCmndDsctnList.setCellData(nRow, trnsfQnttQnttCol, invntrQntt);
			inptCmndDsctnList.setCellData(nRow, trnsfWghtQnttCol, invntrWght);

    	}
	}

	const fn_delValue = function(){
		let nRow = inptCmndDsctnList.getRow();
    	let trnsfQnttQnttCol = inptCmndDsctnList.getColRef("trnsfQntt");
		let trnsfWghtQnttCol = inptCmndDsctnList.getColRef("trnsfWght");

		inptCmndDsctnList.setCellData(nRow, trnsfQnttQnttCol, 0);
		inptCmndDsctnList.setCellData(nRow, trnsfWghtQnttCol, 0);
	}

	const fn_grdTrnsfQnttValueChanged = function(){

		let nRow = inptCmndDsctnList.getRow();
		let nCol = inptCmndDsctnList.getCol();
		let trnsfQnttQnttCol = inptCmndDsctnList.getColRef("trnsfQntt");
		let trnsfWghtQnttCol = inptCmndDsctnList.getColRef("trnsfWght");
		switch (nCol) {
		case trnsfQnttQnttCol:	// checkbox
			fn_checkInptQntt();
			break;
		case trnsfWghtQnttCol:	// checkbox
			fn_checkInptWght();
			break;
		default:
			return;
		}
	}

	const fn_checkInptQntt = function(){
		let nRow = inptCmndDsctnList.getRow();
		let trnsfQnttQnttCol = inptCmndDsctnList.getColRef("trnsfQntt");
		let trnsfWghtQnttCol = inptCmndDsctnList.getColRef("trnsfWght");
		let checkedYnCol 	= inptCmndDsctnList.getColRef("checkBox");

		let rowData = inptCmndDsctnList.getRowData(nRow);

		let invntrQntt = rowData.invntrQntt;
		let invntrWght = rowData.invntrWght;
		let trnsfQntt = rowData.trnsfQntt;
		let trnsfWght = rowData.trnsfWght;

		if(trnsfQntt > invntrQntt){
			inptCmndDsctnList.setCellData(nRow, trnsfQnttQnttCol, 0);
			inptCmndDsctnList.setCellData(nRow, trnsfWghtQnttCol, 0);
			inptCmndDsctnList.setCellData(nRow, checkedYnCol, 'N');
			gfn_comAlert("W0008", "재고수량", "이송수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			return;
		}else if(trnsfQntt == 0){
			inptCmndDsctnList.setCellData(nRow, trnsfQnttQnttCol, 0);
			inptCmndDsctnList.setCellData(nRow, trnsfWghtQnttCol, 0);
			inptCmndDsctnList.setCellData(nRow, checkedYnCol, 'N');
		}else if(trnsfQntt <= invntrQntt ){
			let wght = Math.round(invntrWght / invntrQntt)
			inptCmndDsctnList.setCellData(nRow, trnsfQnttQnttCol, trnsfQntt);
			inptCmndDsctnList.setCellData(nRow, trnsfWghtQnttCol, trnsfQntt*wght);
			inptCmndDsctnList.setCellData(nRow, checkedYnCol, 'Y');
		}
	}

	const fn_checkInptWght = function(){
		let nRow = inptCmndDsctnList.getRow();
		let trnsfQnttQnttCol = inptCmndDsctnList.getColRef("trnsfQntt");
		let trnsfWghtQnttCol = inptCmndDsctnList.getColRef("trnsfWght");
		let checkedYnCol 	= inptCmndDsctnList.getColRef("checkBox");

		let rowData = inptCmndDsctnList.getRowData(nRow);

		let invntrQntt = rowData.invntrQntt;
		let invntrWght = rowData.invntrWght;
		let trnsfQntt = rowData.trnsfQntt;
		let trnsfWght = rowData.trnsfWght;

		if(trnsfWght > invntrWght){
			inptCmndDsctnList.setCellData(nRow, trnsfQnttQnttCol, 0);
			inptCmndDsctnList.setCellData(nRow, trnsfWghtQnttCol, 0);
			inptCmndDsctnList.setCellData(nRow, checkedYnCol, 'N');
			gfn_comAlert("W0008", "재고중량", "이송중량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			return;
		}else if(trnsfWght == 0){
			inptCmndDsctnList.setCellData(nRow, trnsfQnttQnttCol, 0);
			inptCmndDsctnList.setCellData(nRow, trnsfWghtQnttCol, 0);
			inptCmndDsctnList.setCellData(nRow, checkedYnCol, 'N');
		}
	}

	//그리드 체크박스 전체 선택
    function fn_checkAll(grid, obj) {
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        //체크박스 열 index
        var getColRef = grid.getColRef("checkBox");
    	var getRow = grid.getRow();
    	var getCol = grid.getCol();
        for (var i=0; i<gridList.length; i++) {
        	grid.setCol(getColRef);
        	grid.clickCell(i+2, getColRef);
            grid.setCellData(i+2, getColRef, checkedYn, true, false);
        }
    	grid.clickCell(getRow, getCol);
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
    		fn_callSelectGrid1List();
    	}else if(checkSection == 2){
    		fn_callSelectGrid2List();
    	}else if(checkSection == 3){
    		fn_callSelectGrid3List();
    	}
	}

    var newSortInptPrfmncGridData = [];
	const fn_callSelectGrid1List = async function() {

		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let gdsSeCd = SBUxMethod.get("srch-slt-gdsSe");
		let wrhsSeCd = SBUxMethod.get("srch-slt-wrhsSeCd");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSe");

	    jsoninptCmndDsctnList = []; //원물 재고 첫번째 그리드 data

		const postJsonPromise1 = gfn_postJSON("/am/trnsf/selectTrnsfRawMtrInvntrList.do", {
			apcCd		:  gv_selectedApcCd,
			itemCd:itemCd,
			vrtyCd: vrtyCd,
			spcfctCd: spcfctCd,
			prdcrCd: prdcrCd,
			gdsSeCd: gdsSeCd,
			wrhsSeCd: wrhsSeCd,
			warehouseSeCd: warehouseSeCd,
  		});

        let data1 = await postJsonPromise1;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {

      		jsoninptCmndDsctnList.length = 0;
          	data1.resultList.forEach((item, index) => {
          		if(item.psbltyInvntrQntt > 0){
          			const rawMtrInvntr = {
              				  wrhsno			: item.wrhsno
              				, pltno				: item.pltno
              				, grdCd				: item.grdCd
              				, wrhsYmd			: item.wrhsYmd
              				, prdcrNm			: item.prdcrNm
              				, prdcrCd			: item.prdcrCd
              				, itemNm			: item.itemNm
              				, itemCd			: item.itemCd
              				, vrtyNm			: item.vrtyNm
              				, vrtyCd			: item.vrtyCd
              				, gdsSeNm			: item.gdsSeNm
              				, gdsSeCd			: item.gdsSeCd
              				, wrhsSeNm			: item.wrhsSeNm
              				, wrhsSeCd			: item.wrhsSeCd
              				, trsprtSeNm		: item.trsprtSeNm
              				, trsprtSeCd		: item.trsprtSeCd
              				, warehouseSeNm		: item.warehouseSeNm
              				, warehouseSeCd		: item.warehouseSeCd
              				, psbltyInvntrQntt	: item.psbltyInvntrQntt
              				, psbltyInvntrWght	: item.psbltyInvntrWght
              				, invntrQntt		: item.invntrQntt
              				, invntrWght		: item.invntrWght
              				, trnsfQntt			: item.trnsfQntt
              				, trnsfWght			: item.trnsfWght
              				, rmrk				: item.rmrk
              				, apcCd				: item.apcCd
      				}
	          		jsoninptCmndDsctnList.push(Object.assign({}, rawMtrInvntr));
          		}


  			});
          	inptCmndDsctnList.rebuild();

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }
	//원물재고 내역 조회 끝

	var newSortInptPrfmncGridData = [];
	const fn_callSelectGrid2List = async function() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let gdsSeCd = SBUxMethod.get("srch-slt-gdsSe");
		let wrhsSeCd = SBUxMethod.get("srch-slt-wrhsSeCd");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSe");

		const postJsonPromise2 = gfn_postJSON("/am/trnsf/selectTrnsfSortInvntrDsctnList.do", {
			apcCd		:  gv_selectedApcCd,
			itemCd:itemCd,
			vrtyCd: vrtyCd,
			spcfctCd: spcfctCd,
			prdcrCd: prdcrCd,
			gdsSeCd: gdsSeCd,
			wrhsSeCd: wrhsSeCd,
			warehouseSeCd: warehouseSeCd,
  		});

        let data2 = await postJsonPromise2;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {

      		jsoninptCmndDsctnList2.length = 0;
          	data2.resultList.forEach((item, index) => {
          		if(item.psbltyInvntrQntt > 0){
	          		const rawMtrInvntr2 = {
	          				  sortno			: item.sortno
	          				, sortSn			: item.sortSn
	          				, grdNm				: item.grdNm
	          				, grdCd				: item.grdCd
	          				, inptYmd			: item.inptYmd
	          				, fcltNm			: item.fcltNm
	          				, fcltCd			: item.fcltCd
	          				, prdcrNm			: item.prdcrNm
	          				, prdcrCd			: item.prdcrCd
	          				, itemNm			: item.itemNm
	          				, itemCd			: item.itemCd
	          				, vrtyNm			: item.vrtyNm
	          				, vrtyCd			: item.vrtyCd
	          				, spcfctNm			: item.spcfctNm
	          				, spcfctCd			: item.spcfctCd
	          				, warehouseSeNm		: item.warehouseSeNm
	          				, warehouseSeCd		: item.warehouseSeCd
	          				, invntrQntt		: item.psbltyInvntrQntt
	          				, invntrWght		: item.psbltyInvntrWght
	          				, trnsfQntt			: item.trnsfQntt
	          				, trnsfWght			: item.trnsfWght
	          				, apcCd				: item.apcCd
	  				}
	          		jsoninptCmndDsctnList2.push(rawMtrInvntr2);
          		}

          	});
          	inptCmndDsctnList.rebuild();

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }
	//선별재고 내역 조회 끝

	var newSortInptPrfmncGridData = [];
	const fn_callSelectGrid3List = async function(pageSize, pageNo) {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let gdsSeCd = SBUxMethod.get("srch-slt-gdsSe");
		let wrhsSeCd = SBUxMethod.get("srch-slt-wrhsSeCd");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSe");
		const postJsonPromise3 = gfn_postJSON("/am/trnsf/selectUpdateTrnsfGdsInvntrList.do", {
			apcCd		:  gv_selectedApcCd,
			itemCd:itemCd,
			vrtyCd: vrtyCd,
			spcfctCd: spcfctCd,
			prdcrCd: prdcrCd,
			gdsSeCd: gdsSeCd,
			wrhsSeCd: wrhsSeCd,
  		});

        let data3 = await postJsonPromise3;
        newSortInptPrfmncGridData = [];
        sortInptPrfmncGridData = [];

  		try {

      		jsoninptCmndDsctnList3.length = 0;
          	data3.resultList.forEach((item, index) => {
          		if(item.psbltyInvntrQntt > 0){

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
	          				, gdsNm				: item.gdsGrdNm
	          				, gdsCd				: item.gdsGrd
	          				, warehouseSeNm		: item.warehouseSeNm
	          				, warehouseSeCd		: item.warehouseSeCd
	          				, invntrQntt		: item.psbltyInvntrQntt
	          				, invntrWght		: item.psbltyInvntrWght
	          				, trnsfWarehouse	: item.trnsfWarehouse
	          				, trnsfQntt			: item.trnsfQntt
	          				, trnsfWght			: item.trnsfWght
	          				, apcCd				: item.apcCd
	  				}
	          		jsoninptCmndDsctnList3.push(rawMtrInvntr3);
				}

          	});
          	inptCmndDsctnList.rebuild();

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
	        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }

	//	fn_updataList
	//	저장 버튼
	// grdUserAprv -> 그리드 아이디
	// userAprvList ->
	const fn_save = async function() {

		let trnsfApcCd = SBUxMethod.get("dtl-slt-trnsfApcCd");

		if(gfn_isEmpty(trnsfApcCd)){
			gfn_comAlert("W0002", "이송APC");		//	W0002	{0}을/를 선택하세요.
			return;
		}

		let grdRows = inptCmndDsctnList.getCheckedRows(0);
		let saveList = [];

		if(grdRows.length == 0){
    		gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

		for(var i=0; i< grdRows.length; i++){
    		let nRow = grdRows[i];
    		let rowData = inptCmndDsctnList.getRowData(nRow)
    		let trnsfQntt = rowData.trnsfQntt
    		let trnsfWght = rowData.trnsfWght;
    		let invntrQntt = rowData.invntrQntt;
    		let invntrWght = rowData.invntrWght;

    		if(trnsfQntt == 0 || gfn_isEmpty(trnsfQntt)){
    			gfn_comAlert("W0001", "이송수량");		//	W0001	{0}이/가 없습니다.
    			return;
    		}
    		if(trnsfWght == 0 || gfn_isEmpty(trnsfWght)){
    			gfn_comAlert("W0001", "이송중량");		//	W0001	{0}이/가 없습니다.
    			return;
    		}

    		rowData.invntrQntt = invntrQntt - trnsfQntt;
    		rowData.invntrWght = invntrWght - trnsfWght;
    		rowData.rowSts = 'U';
    		rowData.trnsfApcCd  = trnsfApcCd;
    		if(checkSection == 1){
    			rowData.invntrSeCd = "1"
    		}
    		if(checkSection == 2){
    			rowData.invntrSeCd = "2"
    		}
    		if(checkSection == 3){
    			rowData.invntrSeCd = "3"
    		}

    		saveList.push(rowData);
    	}

		let regMsg = "저장 하시겠습니까?";
		if(confirm(regMsg)){
			let postJsonPromise;
			if(checkSection == 1){
				postJsonPromise = gfn_postJSON("/am/trnsf/saveTrnsfRawMtrInvntrList.do", saveList);
			}
			if(checkSection == 2){
				postJsonPromise = gfn_postJSON("/am/trnsf/saveTrnsfSortInvntrList.do", saveList);
    		}
    		if(checkSection == 3){
    			postJsonPromise = gfn_postJSON("/am/trnsf/saveTrnsfGdsInvntrList.do", saveList);
    		}

	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	       			if(checkSection == 1){
	       				fn_sample1()
	    			}
	    			if(checkSection == 2){
	    				fn_sample2()
	        		}
	        		if(checkSection == 3){
	        			fn_sample3()
	        		}
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	       		}else{
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
 			SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);	// callBack input
 			SBUxMethod.set("srch-slt-vrtyCd", prdcr.rprsVrtyCd);	// callBack input
 			SBUxMethod.set("srch-slt-gdsSe", prdcr.gdsSeCd);		// callBack input
 			SBUxMethod.set("srch-slt-wrhsSeCd", prdcr.trsprtSeCd);	// callBack input

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
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>