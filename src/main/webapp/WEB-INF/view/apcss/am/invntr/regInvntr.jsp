 <%
 /**
  * @Class Name : regInvntr.jsp
  * @Description : 재고정보등록 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	김호			최초 생성
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
								<sbux-select
									uitype="single"
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									class="form-control input-sm input-sm-ast"
									unselected-text="전체"
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
								<sbux-select id="srch-slt-spcfctCd"
									name="srch-slt-spcfctCd"
									uitype="single"
									unselected-text="전체"
									class="form-control input-sm"
									jsondata-ref="jsonComSpcfct"
								></sbux-select>
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
								<col style="width: 70px">
								<col style="width: 220px">
								<col style="width: 75px">
								<col style="width: 65px">
							</colgroup>
							<tbody>
								<tr>
									<td class="td_input td_input_dtl"><sbux-button uitype="normal" id="srch-btn-rawmtrInvntrDsctn" name="srch-btn-rawmtrInvntrDsctn" class="btn btn-sm btn-outline-danger" text="원물재고 내역" onclick="fn_rawMtrInvntr()"></sbux-button></td>
									<td class="td_input td_input_dtl"><sbux-button uitype="normal" id="srch-btn-sortInvntrDsctn" name="srch-btn-sortInvntrDsctn" class="btn btn-sm btn-outline-danger" text="선별재고 내역" onclick="fn_sortInvntr()"></sbux-button></td>
									<td class="td_input td_input_dtl"><sbux-button uitype="normal" id="srch-btn-gdsInvntrDsctn" name="srch-btn-gdsInvntrDsctn" class="btn btn-sm btn-outline-danger" text="상품재고 내역" onclick="fn_gdsInvntr()"></sbux-button></td>
									<td style="border-left:hidden"></td>
									<td style="border-left:hidden">
										<h5 style="float:left; color:black;">재고구분</h5>
									</td>
									<td class="td_input" style="border-right:hidden; border-left:hidden" >
										<sbux-select
											unselected-text="선택"
											uitype="single"
											id="dtl-slt-invntrSeCd"
											name="dtl-slt-invntrSeCd"
											class="form-control input-sm"
											jsondata-ref="jsonComInvntrSeCd"
											onchange="fn_changeInvntrSeCd"
										/>
									</td>
									<td style="border-left:hidden">
										<sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="서식받기" class="btn btn-sm btn-outline-danger" onclick="fn_dwnld" style="float: right;">서식받기</sbux-button>
									</td>
									<td class="td_input" style="border-right:hidden; border-left:hidden" >
										<sbux-button id="btnUp" name="btnUp" uitype="normal" text="올리기" class="btn btn-sm btn-outline-danger" onclick="fn_uld" style="float: right;"></sbux-button>
									</td>
								</tr>
							</tbody>
					 		</table>
						</div>
					</div>
					<div class="exp-div-excel" style="display: none;width: 1000px;">
						<div id="sbexp-area-grdExpRawMtr" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpSort" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpGds" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpItem" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpVrty" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpPrdcr" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpSpcfct" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpGdsGrd" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpWarehouseSe" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpWrhsSeCd" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpGdsSeCd" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpTrsprtSeCd" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpStdGrd" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpStdGrdDtl" style="height:1px; width: 100%;"></div>
						<div id="sbexp-area-grdExpSpmtPckgUnit" style="height:1px; width: 100%;"></div>
						<sbux-select id="excel-slt-gdsGrd"
								name="excel-slt-gdsGrd"
								uitype="single"
								unselected-text="전체"
								class="form-control input-sm"
								jsondata-ref="jsonExeclComGdsGrd"
						></sbux-select>
						<sbux-select id="excel-slt-trsprtSeCd"
								name="excel-slt-trsprtSeCd"
								uitype="single"
								unselected-text="전체"
								class="form-control input-sm"
								jsondata-ref="jsonExeclComGdsGrd"
						></sbux-select>
						<sbux-select id="excel-slt-spmtPckgUnit"
								name="excel-slt-spmtPckgUnit"
								uitype="single"
								unselected-text="전체"
								class="form-control input-sm"
								jsondata-ref="jsonExeclComSpmtPckgUnit"
						></sbux-select>
						<jsp:include page="../../am/popup/apcStdGrdSelect.jsp"></jsp:include>
						<input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="importExcelData(event)">
					</div>
               	</div>
                    <div class="sbt-grid">
                        <div id="inptCmndDsctnGridArea" style="height:524px;"></div>
                    </div>
               	</div>
				<!--[pp] //검색결과 -->
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
    <div>
		<sbux-modal id="modal-excel-gdsInvntr" name="modal-excel-gdsInvntr"
			uitype="middle"
			header-title="재고등록"
			body-html-id="body-modal-excelGds" f
			ooter-is-close-button="false"
			header-is-close-button="false"
			style="width:1000px"
		></sbux-modal>
	</div>
    <div id="body-modal-excelGds">
    	<jsp:include page="../../am/popup/invntrExcelPopup.jsp"></jsp:include>
    </div>
    <sbux-button id="btnGdsInvntrPopup" name="btnGdsInvntrPopup" uitype="modal" text="엑셀등록" style="width:100%; display:none" class="btn btn-sm btn-outline-dark" target-id="modal-excel-gdsInvntr"></sbux-button>
	<!-- importExcelPopup -->
</body>

<script type="text/javascript">

	var jsonComItem					= [];	// 품목 	itemCd			검색
	var jsonComVrty					= [];	// 품종 	vrtyCd			검색
	var jsonComSpcfct				= [];	// 규격 	spcfctCd		검색
	var jsonComWarehouse			= [];	// 창고 	warehouseSeCd	검색
	var jsonComGdsSeCd				= [];	// 상품구분 gdsSeCd			검색
	var jsonComWrhsSeCd				= [];	// 입고구분 wrhsSeCd		검색
	var jsonGrdwarehouseSeCd		= [];	// 창고 	warehouseSeCd	검색
	var jsonComInvntrSeCd			= [];	// 재고구분	invntrSeCd	검색

	var jsonExeclComGdsGrd			= [];	// 엑셀	공통등급
	var jsonExeclComSortGrdCd		= [];	// 엑셀	공통등급
	var jsonExeclComTrsprtSeCd		= [];	// 엑셀	운송구분
	var jsonExeclComSpmtPckgUnit	= [];	// 엑셀	포장구분


	/*생산자 팝업 및 초성검색 */
	var jsonDataPrdcr 		= [];
	var jsonPrdcr			= [];
	var jsonPrdcrAutocomplete = [];
	var autoCompleteDataJson = [];


	const fn_initSBSelect = async function() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let rst = await Promise.all([
			gfn_setComCdSBSelect('srch-slt-warehouseSe', 	jsonComWarehouse, 		'WAREHOUSE_SE_CD', 	gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('srch-slt-wrhsSeCd', 		jsonComWrhsSeCd, 		'WRHS_SE_CD'),							// 창고
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, 			gv_selectedApcCd),						// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, 			gv_selectedApcCd),						// 품종
		 	gfn_setComCdSBSelect('srch-slt-gdsSe', 			jsonComGdsSeCd, 		'GDS_SE_CD', 		gv_selectedApcCd),	// 상품구분
			gfn_setComCdSBSelect('inptCmndDsctnList', 		jsonGrdwarehouseSeCd, 	'WAREHOUSE_SE_CD', 	gv_selectedApcCd),	// 창고
			gfn_setComCdSBSelect('dtl-slt-invntrSeCd', 		jsonComInvntrSeCd, 		'INVNTR_SE_CD'),						// 재고구분

			gfn_setComCdSBSelect('excel-slt-gdsGrd', 		jsonExeclComGdsGrd,		'GDS_GRD'),								// 엑셀 등급
			gfn_setComCdSBSelect('excel-slt-trsprtSeCd', 	jsonExeclComTrsprtSeCd,	'TRSPRT_SE_CD'),						// 엑셀 등급
		])
		SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true');

		fn_getPrdcrs();
	}


	var checkSection = 0;

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_rawMtrInvntr();
		checkSection = 1;

		SBUxMethod.set("srch-dtp-crtrYmd", gfn_dateToYmd(new Date()));

		fn_initSBSelect();
	});

	const fn_selectItem = async function() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");

		if(gfn_isEmpty(itemCd)){

			jsonComSpcfct.length = 0;
			SBUxMethod.refresh("srch-slt-spcfctCd");
			let rst = await Promise.all([
				gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 				jsonComVrty, 				gv_selectedApcCd, itemCd),	// 품종
				stdGrdSelect.setStdGrd(gv_selectedApcCd, _GRD_SE_CD_WRHS, itemCd)
			]);

		}else{
			let rst = await Promise.all([
				gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 				jsonComVrty, 				gv_selectedApcCd, itemCd),	// 품종
				gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd',			jsonComSpcfct, 				gv_selectedApcCd, itemCd),	// 규격
				stdGrdSelect.setStdGrd(gv_selectedApcCd, _GRD_SE_CD_WRHS, itemCd)
			]);
		}

		if (checkSection == 1) {
			jsonComSpcfct.length = 0;
			SBUxMethod.refresh("srch-slt-spcfctCd");
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true')
		} else {
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false')
		}

	}

	const fn_selectVrty = async function(){
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let itemCd = "";
		for( i=0; i<jsonComVrty.length; i++ ){
			if(jsonComVrty[i].value == vrtyCd){
				itemCd = jsonComVrty[i].mastervalue;
			}
		}
		SBUxMethod.set("srch-slt-itemCd", itemCd);
		let rst = await Promise.all([
			gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', 			jsonComSpcfct, 				gv_selectedApcCd, itemCd),	// 규격
			gfn_setSpmtPckgUnitSBSelect('excel-slt-spmtPckgUnit', 	jsonExeclComSpmtPckgUnit, 	gv_selectedApcCd, itemCd),	// 포장구분
			stdGrdSelect.setStdGrd(gv_selectedApcCd, _GRD_SE_CD_WRHS, itemCd)
		])

		if(checkSection == 1){
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true')
		}else{
			SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false')
		}
	}

	const fn_changeInvntrSeCd = async function(){
		let invntrSeCd = SBUxMethod.get("dtl-slt-invntrSeCd")
		if(invntrSeCd == "1"){
			fn_rawMtrInvntr()
		}else if(invntrSeCd == "2"){
			fn_sortInvntr()
		}else if(invntrSeCd == "3"){
			fn_gdsInvntr();
		}
	}

	var inptCmndDsctnList = []; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언

	const fn_rawMtrInvntr = async function(){
		SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'true')

		$("#srch-btn-rawmtrInvntrDsctn").css({"background-color":"#149FFF","color":"white"});
		$("#srch-btn-sortInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-gdsInvntrDsctn").css({"background-color":"white","color":"black"});
		_SBGrid.destroy('inptCmndDsctnList');

		checkSection = 1;
		SBUxMethod.set("dtl-slt-invntrSeCd", "1")
		fn_createGridRawMtr();
	}
	const fn_sortInvntr = async function(){

		$("#srch-btn-rawmtrInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-sortInvntrDsctn").css({"background-color":"#149FFF","color":"white"});
		$("#srch-btn-gdsInvntrDsctn").css({"background-color":"white","color":"black"});
		_SBGrid.destroy('inptCmndDsctnList');
		SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false')
		checkSection = 2;
		SBUxMethod.set("dtl-slt-invntrSeCd", "2")
		fn_createGridSort();
	}
	const fn_gdsInvntr = async function(){

		$("#srch-btn-rawmtrInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-sortInvntrDsctn").css({"background-color":"white","color":"black"});
		$("#srch-btn-gdsInvntrDsctn").css({"background-color":"#149FFF","color":"white"});
		_SBGrid.destroy('inptCmndDsctnList');
		SBUxMethod.attr('srch-slt-spcfctCd', 'disabled', 'false')
		checkSection = 3;
		SBUxMethod.set("dtl-slt-invntrSeCd", "3")
		fn_createGridGds();
	}
	const fn_createGridRawMtr = async function () {
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
	        {caption: ["입고일자","입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'105px',    style:'text-align:center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
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
	        {caption: ["변경사항","변경사항"],		ref: 'chgRmrk',      type:'input',  width:'105px',    style:'text-align:center'},
	        {caption: ["창고구분코드","창고구분코드"],		ref: 'warehouseSeCd', 	type:'output',	hidden: true}
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
	    inptCmndDsctnList.bind('valuechanged', 'fn_grdTrnsfQnttValueChanged');

	    fn_selectGridList();
	}
// 	var inptCmndDsctnList2; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList2 = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGridSort() {
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
	        {caption: ["투입일자","투입일자"],	ref: 'inptYmd',      	type:'output',  	width:'105px',    style:'text-align:center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
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
	        {caption: ["변경사항","변경사항"],	ref: 'chgRmrk',      		type:'input',  		width:'105px',    	style:'text-align:center'},
            {caption: ["선별순번"],		ref: 'sortSn', 			type:'output',  hidden: true},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
	    inptCmndDsctnList.bind('valuechanged', 'fn_grdTrnsfQnttValueChanged');

	    fn_selectGridList();

	}
// 	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList3 = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGridGds() {
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
	        {caption: ["포장일자","포장일자"],	ref: 'pckgYmd',      	type:'output',  width:'105px',    style:'text-align:center',
	        	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
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
	        {caption: ["변경사항","변경사항"],	ref: 'chgRmrk',      	type:'input',  		width:'105px',    	style:'text-align:center'},
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
       				, originWarehouseSeCd	: item.warehouseSeCd
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
      				, chgRmrk			: ""
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
       				, originWarehouseSeCd	: item.warehouseSeCd
       				, sortQntt			: item.sortQntt
       				, sortWght			: item.sortWght
       				, pckgQntt			: item.pckgQntt
       				, pckgWght			: item.pckgWght
       				, invntrQntt		: item.invntrQntt
       				, invntrWght		: item.invntrWght
       				, originInvntrQntt	: item.invntrQntt
      				, originInvntrWght	: item.invntrWght
      				, chgRmrk			: ""
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
          				, originWarehouseSeCd	: item.warehouseSeCd
          				, invntrQntt		: item.invntrQntt
          				, invntrWght		: item.invntrWght
          				, trnsfWarehouse	: item.trnsfWarehouse
          				, apcCd				: item.apcCd
          				, originInvntrQntt	: item.invntrQntt
          				, originInvntrWght	: item.invntrWght
          				, chgRmrk			: ""
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
    		let rmrk = rowData.chgRmrk;

    		let originWarehouseSeCd = rowData.originWarehouseSeCd
    		let warehouseSeCd = rowData.warehouseSeCd;

    		if(originWarehouseSeCd == warehouseSeCd){
    			gfn_comAlert("W0007", "재고창고", "변경창고");		// W0007 {0}와/과 {1}이/가 같습니다.
    			return;
    		}

			if (rowSts === 2){
				rowData.apcCd = gv_selectedApcCd;
				rowData.rowSts = "U";
				rowData.rmrk = rmrk;
				updateList.push(rowData);
			} else {
				continue;
			}
		}

		if (updateList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
	    	return;
	    }

		let postUrl = "";

		switch(checkSection) {
			case 1:
				postUrl = "/am/invntr/mulitSaveRawMtrInvntrList.do";
				break;
			case 2:
				postUrl = "/am/invntr/multiSaveSortInvntrList.do";
				break;
			case 3:
				postUrl = "/am/invntr/multiSaveGdsInvntrList.do";
				break;
			default:
				return;
		}

		let postJsonPromise = gfn_postJSON(postUrl, updateList);

    	const data = await postJsonPromise;

    	try {
    		if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_selectGridList();
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
 			SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);	// 대표 품목코드
 			SBUxMethod.set("srch-slt-vrtyCd", prdcr.rprsVrtyCd);	// 대표 품종코드
 			SBUxMethod.set("srch-slt-gdsSe", prdcr.gdsSeCd);		// 상품구분
 			SBUxMethod.set("srch-slt-wrhsSeCd", prdcr.trsprtSeCd);	// 입고구분
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
	var jsonExpSltItem 			= [];	// 품목
	var jsonExpSltVrty 			= [];	// 품종
	var jsonExpSltSpcfct 		= [];	// 규격
	var jsonExpSltGdsGrd 		= [];	// 상품등급
	var jsonExpSltPrdcr 		= [];	// 생산자
	var jsonExpSltWarehouseSe 	= [];	// 창고
	var jsonExpSltGdsSeCd 		= [];	// 상품구분
	var jsonExpSltWrhsSeCd 		= [];	// 입고구분
	var jsonExpSltTrsprtSeCd 	= [];	// 운송구분
	var jsonExpStdGrd  			= []; 	// 원물등급
	var jsonExpStdGrdDtl 		= [];	// 원물등급상세
	var jsonExpSpmtPckgUnit 	= [];	// 포장구분상세

	var grdExpRawMtr;				// 엑셀 원물재고그리드
	var grdExpSort;					// 엑셀 선별재고그리드
	var grdExpGds;					// 엑셀 상품재고그리드
	var grdExpItem;					// 엑셀 품목그리드
	var grdExpVrty;					// 엑셀 품종그리드
	var grdExpGdsGrd				// 엑셀 등급그리드
	var grdExpSpcfct;				// 엑셀 규격그리드
	var grdExpPrdcr;				// 엑셀 생산자그리드
	var grdExpWarehouseSe;			// 엑셀 창고그리드
	var grdExpGdsSeCd;				// 엑셀 상품구분그리드
	var grdExpWrhsSeCd;				// 엑셀 입고구분그리드
	var grdExpTrsprtSeCd;			// 엑셀 운송구분그리드
	var grdExpStdGrd;				// 엑셀 원물등급그리드
	var grdExpStdGrdDtl;			// 엑셀 원물등급상세그리드
	var grdExpSpmtPckgUnit;			// 엑셀 포장구분그리드

	var jsonExpRawMtr 		= [];	// 엑셀 원물재고Json
	var jsonExpSort 		= [];	// 엑셀 선별재고Json
	var jsonExpGds 			= [];	// 엑셀 상품재고Json
	var jsonExpItem 		= [];	// 엑셀 품목Json
	var jsonExpVrty 		= [];	// 엑셀 품종Json
	var jsonExpGdsGrd 		= [];	// 엑셀 등급Json
	var jsonExpSpcfct 		= [];	// 엑셀 규격Json
	var jsonExpPrdcr 		= [];	// 엑셀 생산자Json
	var jsonExpWarehouseSe 	= [];	// 엑셀 창고Json
	var jsonExpGdsSeCd 		= [];	// 엑셀 상품구분Json
	var jsonExpWrhsSeCd 	= [];	// 엑셀 입고구분Json
	var jsonExpTrsprtSeCd 	= [];	// 엑셀 운송구분Json
	var jsonExpStdGrd 		= [];	// 엑셀 원물등급Json
	var jsonExpStdGrdDtl 	= [];	// 엑셀 원물등급상세Json
	var jsonExpSpmtPckgUnit = [];	// 엑셀 포장구분Json

	const fn_getExpColumns = function() {
		const _columns = [];

		let invntrSeCd = SBUxMethod.get("dtl-slt-invntrSeCd")
		if(invntrSeCd == "1"){
			_columns.push(
					{caption: ["운송구분"], 		ref: 'trsprtSeCd',   		type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonExpSltTrsprtSeCd', displayui : false,	itemcount: 10, label:'label', value:'value'}},
				);
		}
		if(invntrSeCd == "1" || invntrSeCd == "2"){
			_columns.push(
					{caption: ["입고구분"], 		ref: 'whsSeCd',   		type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonExpSltWrhsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
					{caption: ["상품구분"], 		ref: 'gdsSeCd',   		type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonExpSltGdsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
				);

		}
		_columns.push(
			{caption: ["품목"], 		ref: 'itemCd',   		type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품종"], 		ref: 'vrtyCd',   		type:'combo',  width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltVrty', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
		);

		if(invntrSeCd == "2" || invntrSeCd == "3"){
			_columns.push(
					{caption: ["규격"], 		ref: 'spcfctCd',   		type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonExpSltSpcfct', displayui : false,	itemcount: 10, label:'SpcfctNm', value:'SpcfctCd'}},
				);
		}

		if(invntrSeCd == "1"){
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

		    columnsStdGrd.forEach((item) => {
		    	_columns.push(item);
			});
		}
		if(invntrSeCd == "2" || invntrSeCd == "3"){
			_columns.push(
					{caption: ["등급"], 		ref: 'gdsGrd',   		type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonExpSltGdsGrd', displayui : false,	itemcount: 10, label:'SpcfctNm', value:'SpcfctCd'}},
					{caption: ["포장구분"], 	ref: 'spmtPckgUnitCd',   		type:'combo',  width:'80px',    style:'text-align:center',
						typeinfo : {ref:'jsonExpSpmtPckgUnit', displayui : false,	itemcount: 10, label:'SpcfctNm', value:'SpcfctCd'}},
			);
		}
		_columns.push(
				{caption: ["생산자"], 		ref: 'prdcrCd',   		type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonExpSltPrdcr', 	displayui : false,	itemcount: 10, label:'prdcrNm', value:'prdcrCd'}},
		        {caption: ["보관창고"],		ref: 'warehouseSeCd',	type:'combo',  width:'80px',    style:'text-align:center',
					typeinfo : {ref:'jsonExpSltWarehouseSe', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
		        {caption: ["수량"],			ref: 'invntrQntt',      type:'output',  width:'60px',    style:'text-align:right'},
		        {caption: ["중량 Kg"],		ref: 'invntrWght',    	type:'output',  width:'60px',    style:'text-align:right'},
		        {caption: ["비고"],			ref: 'rmrk',      		type:'output',  width:'300px',    style:'text-align:center'},
			);

		return _columns;
	}


	const fn_setSltJson = async function() {
		// 첫 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// set exp/imp combo json
		jsonExpSltItem 			= gfn_cloneJson(jsonComItem);				// 품목
		jsonExpSltVrty 			= gfn_cloneJson(jsonComVrty);				// 품종
		jsonExpSltSpcfct 		= gfn_cloneJson(jsonComSpcfct);				// 규격
		jsonExpSltGdsGrd 		= gfn_cloneJson(jsonExeclComGdsGrd);		// 상품등급
		jsonExpSltPrdcr 		= gfn_cloneJson(jsonPrdcr);					// 생산자
		jsonExpSltWarehouseSe 	= gfn_cloneJson(jsonComWarehouse);			// 보관창고
		jsonExpSltGdsSeCd 		= gfn_cloneJson(jsonComGdsSeCd);			// 상품구분
		jsonExpSltWrhsSeCd 		= gfn_cloneJson(jsonComWrhsSeCd);			// 입고구분
		jsonExpSltTrsprtSeCd 	= gfn_cloneJson(jsonExeclComTrsprtSeCd);	// 운송구분
		jsonExpSltStdGrd 			= gfn_cloneJson(gjsonStdGrdObjKnd);			// 원물등급
		jsonExpSltStdGrdDtl 		= gfn_cloneJson(gjsonStdGrdObjDtl);			// 원물등급상세
		jsonExpSltSpmtPckgUnit 	= gfn_cloneJson(jsonExeclComSpmtPckgUnit);	// 포장구분
	}

	const fn_setExpJson = async function() {
		// 첫 시트가 아닌 다른 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// export grid data
		jsonExpRawMtr.length = 0;
		jsonExpSort.length = 0;
		jsonExpGds.length = 0;

		jsonExpItem 		= gfn_cloneJson(jsonComItem);				// 엑셀 품목Json
		jsonExpVrty 		= gfn_cloneJson(jsonComVrty);				// 엑셀 품종Json
		jsonExpGdsGrd 		= gfn_cloneJson(jsonExeclComGdsGrd);		// 엑셀 등급Json
		jsonExpSpcfct 		= gfn_cloneJson(jsonComSpcfct);				// 엑셀 규격Json
		jsonExpPrdcr 		= gfn_cloneJson(jsonPrdcr);					// 엑셀 생산자Json
		jsonExpWarehouseSe 	= gfn_cloneJson(jsonComWarehouse);			// 엑셀 창고Json
		jsonExpGdsSeCd 		= gfn_cloneJson(jsonComGdsSeCd);			// 엑셀 상품구분Json
		jsonExpWrhsSeCd 	= gfn_cloneJson(jsonComWrhsSeCd);			// 엑셀 입고구분Json
		jsonExpTrsprtSeCd 	= gfn_cloneJson(jsonExeclComTrsprtSeCd);	// 엑셀 운송구분Json
		jsonExpStdGrd 		= gfn_cloneJson(gjsonStdGrdObjKnd);			// 엑셀 입고구분Json
		jsonExpStdGrdDtl 	= gfn_cloneJson(gjsonStdGrdObjDtl);			// 원물등급상세
		jsonExpSpmtPckgUnit = gfn_cloneJson(jsonExeclComSpmtPckgUnit);	// 포장구분

	}

	const fn_createExpGrid = async function(_expObjList) {
		_expObjList.forEach((exp, idx) => {
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
		});
	}

	const fn_dwnld = async function(){

		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let invntrSeCd = SBUxMethod.get("dtl-slt-invntrSeCd");

		if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0001", "품목");			//	W0001	{0}을/를 선택하세요.
            return;
    	}
		if(gfn_isEmpty(invntrSeCd)){
    		gfn_comAlert("W0001", "재고구분");		//	W0001	{0}을/를 선택하세요.
            return;
    	}

		await fn_setSltJson();
		await fn_setExpJson();

		const expColumns = fn_getExpColumns();
		const expObjList = [];

		if(invntrSeCd == "1"){
			expObjList.push(
					{
				        sbGrid: grdExpRawMtr,
				        parentid: "sbexp-area-grdExpRawMtr",
				        id: "grdExpRawMtr",
				        jsonref: "jsonExpRawMtr",
						columns: expColumns,
				        sheetName: "원물재고등록정보",
				        title: "",
				        unit: ""
					},{
				        sbGrid: grdExpItem,
				        parentid: "sbexp-area-grdExpTrsprtSeCd",
				        id: "grdExpTrsprtSeCd",
				        jsonref: "jsonExpTrsprtSeCd",
						columns: [
					    	{caption: ["운송구분코드"],     ref: 'value',  type:'output',  width:'100px',    style:'text-align:center'},
					        {caption: ["운송구분명칭"],     ref: 'text',  type:'output',  width:'100px',    style:'text-align:center'}
						],
				        sheetName: "운송구분",
				        title: "",
				        unit: ""
				    },
			)
		}else if(invntrSeCd == "2"){
			expObjList.push(
					{
				        sbGrid: grdExpSort,
				        parentid: "sbexp-area-grdExpSort",
				        id: "grdExpSort",
				        jsonref: "jsonExpSort",
						columns: expColumns,
				        sheetName: "선별재고등록정보",
				        title: "",
				        unit: ""
					},
			)
		}else if(invntrSeCd == "3"){
			expObjList.push(
					{
				        sbGrid: grdExpGds,
				        parentid: "sbexp-area-grdExpGds",
				        id: "grdExpGds",
				        jsonref: "jsonExpGds",
						columns: expColumns,
				        sheetName: "상품재고등록정보",
				        title: "",
				        unit: ""
				    },
			)
		}

		if(invntrSeCd == "1" || invntrSeCd == "2"){
			expObjList.push(
					{
				        sbGrid: grdExpItem,
				        parentid: "sbexp-area-grdExpWrhsSeCd",
				        id: "grdExpWrhsSeCd",
				        jsonref: "jsonExpWrhsSeCd",
						columns: [
					    	{caption: ["입고구분코드"],     ref: 'value',  type:'output',  width:'100px',    style:'text-align:center'},
					        {caption: ["입고구분명칭"],     ref: 'text',  type:'output',  width:'100px',    style:'text-align:center'}
						],
				        sheetName: "입고구분",
				        title: "",
				        unit: ""
				    },{
				        sbGrid: grdExpItem,
				        parentid: "sbexp-area-grdExpGdsSeCd",
				        id: "grdExpGdsSeCd",
				        jsonref: "jsonExpGdsSeCd",
						columns: [
					    	{caption: ["상품구분코드"],     ref: 'value',  type:'output',  width:'100px',    style:'text-align:center'},
					        {caption: ["상품구분명칭"],     ref: 'text',  type:'output',  width:'100px',    style:'text-align:center'}
						],
				        sheetName: "상품구분",
				        title: "",
				        unit: ""
				    },
				)
		}

		expObjList.push(
				{
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
						{caption: ["품종코드"],    	ref: 'vrtyCd',  type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["품종명칭"],    	ref: 'vrtyNm',  type:'output',  width:'100px',    style:'text-align:center'}
					],
			        sheetName: "품종",
			        title: "",
			        unit: ""
			    },
		)

		if(invntrSeCd == "2" || invntrSeCd == "3"){
			expObjList.push(
					{
				        sbGrid: grdExpSpcfct,
				        parentid: "sbexp-area-grdExpSpcfct",
				        id: "grdExpSpcfct",
				        jsonref: "jsonExpSpcfct",
						columns: [
					    	{caption: ["규격코드"],   	ref: 'spcfctCd',  	type:'output',  width:'100px',    style:'text-align:center'},
					    	{caption: ["규격명"],    	ref: 'spcfctNm',  	type:'output',  width:'100px',    style:'text-align:center'}
						],
				        sheetName: "규격",
				        title: "",
				        unit: ""
				    },
				)
		}

		if(invntrSeCd == "1"){
			expObjList.push(
				{
			        sbGrid: grdExpStdGrd,
			        parentid: "sbexp-area-grdExpStdGrd",
			        id: "grdExpStdGrd",
			        jsonref: "jsonExpStdGrd",
					columns: [
				    	{caption: ["품목코드"],   	ref: 'itemCd',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["품목명"],   	ref: 'itemNm',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["등급코드"],   	ref: 'grdKnd',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["등급코드명"],  	ref: 'grdKndNm',  	type:'output',  width:'100px',    style:'text-align:center'},
					],
			        sheetName: "등급",
			        title: "",
			        unit: ""
			    }, {
			        sbGrid: grdExpStdGrdDtl,
			        parentid: "sbexp-area-grdExpStdGrdDtl",
			        id: "grdExpStdGrdDtl",
			        jsonref: "jsonExpStdGrdDtl",
					columns: [
						{caption: ["품목코드"],		ref: 'itemCd',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["품목명"],   	ref: 'itemNm',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["등급코드"],   	ref: 'grdKnd',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["등급명"],   	ref: 'grdKndNm',  	type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["등급상세코드"], 	ref: 'grdCd',  		type:'output',  width:'100px',    style:'text-align:center'},
				    	{caption: ["등급상세명"],  	ref: 'grdNm',  		type:'output',  width:'100px',    style:'text-align:center'},
					],
			        sheetName: "등급상세",
			        title: "",
			        unit: ""
			    },
			)

		}
		else if(invntrSeCd == "2" || invntrSeCd == "3"){
			expObjList.push(
				    {
				        sbGrid: grdExpGdsGrd,
				        parentid: "sbexp-area-grdExpGdsGrd",
				        id: "grdExpGdsGrd",
				        jsonref: "jsonExpGdsGrd",
						columns: [
					    	{caption: ["등급코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
					    	{caption: ["등급명"],    	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'}
						],
				        sheetName: "등급",
				        title: "",
				        unit: ""
				    },{
				        sbGrid: grdExpGdsGrd,
				        parentid: "sbexp-area-grdExpSpmtPckgUnit",
				        id: "grdExpSpmtPckgUnit",
				        jsonref: "jsonExpSpmtPckgUnit",
						columns: [
					    	{caption: ["포장코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
					    	{caption: ["포장단위명"],   ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'}
						],
				        sheetName: "포장구분",
				        title: "",
				        unit: ""
				    },
				)
		}

		expObjList.push(
		    {
		        sbGrid: grdExpPrdcr,
		        parentid: "sbexp-area-grdExpPrdcr",
		        id: "grdExpPrdcr",
		        jsonref: "jsonExpPrdcr",
				columns: [
			    	{caption: ["생산자코드"],   ref: 'prdcrCd',  	type: 'output', width:'100px',    style:'text-align:center'},
			    	{caption: ["생산자명"],    	ref: 'prdcrNm',  	type: 'output', width:'100px',    style:'text-align:center'},
			    	{caption: ['대표품목'],		ref: 'rprsItemCd', 	type: 'output', width: '80px', style: 'text-align:center'},
			        {caption: ['대표품종'], 	ref: 'rprsVrtyCd', 	type: 'output', width: '80px', style: 'text-align:center'}
				],
		        sheetName: "생산자",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpWarehouseSe,
		        parentid: "sbexp-area-grdExpWarehouseSe",
		        id: "grdExpWarehouseSe",
		        jsonref: "jsonExpWarehouseSe",
				columns: [
			    	{caption: ["창고코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["창고코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "창고",
		        title: "",
		        unit: ""
		    }
		);


		await fn_createExpGrid(expObjList); // fn_createExpGrid함수에 expObjList를 담아서 보내주는 코드

		//exportExcel();
	    gfn_exportExcelMulti("재고정보(샘플).xlsx", expObjList); // gfn_exportExcelMulti함수에 파일 이름, 오브젝트 리스트를 보내주는 코드
	}

	const gfn_exportExcelMulti = function(_fileName, _objList) {

// 		엑셀 정보를 담는 변수
		var objExcelInfo = {
			strFileName : _fileName,
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

		//넘어온 오브젝트를 이용한 forEach문으로 타이틀리스트에 title을 넣고 unitList에 unit을 넣는 포이치문
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

	// 	excel모달을 열기위한 함수
	const importExcelData = function (e){

		SBUxMethod.openModal('modal-excel-gdsInvntr');
    	fn_createGridGdsPopup();
    	jsonExcelGdsInvntrPopup = 0;
    	grdExcelGdsInvntrPopup.rebuild();

    	grdExcelGdsInvntrPopup.importExcelData(e);
     }

    const fn_uld = async function() {

    	let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let invntrSeCd = SBUxMethod.get("dtl-slt-invntrSeCd");

		if(gfn_isEmpty(itemCd)){
    		gfn_comAlert("W0001", "품목");			//	W0001	{0}을/를 선택하세요.
            return;
    	}
		if(gfn_isEmpty(invntrSeCd)){
    		gfn_comAlert("W0001", "재고구분");		//	W0001	{0}을/를 선택하세요.
            return;
    	}

		document.querySelector("#btnFileUpload").value = "";

		$("#btnFileUpload").click();

    }


</script>
</html>