<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnDocRawMtrWgh" name="btnDocRawMtrWgh" uitype="normal" text="계량확인서" class="btn btn-sm btn-primary"></sbux-button>
					<sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"></sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger"></sbux-button>
				</div>
			</div>
			<div></div>
			<div class="box-body">
				<!--[APC] START -->			
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<sbux-input id="inp-prdcrCd" name="inp-prdcrCd" uitype="hidden"></sbux-input>
				<!--[pp] 검색 -->
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
						<col style="width: 6%">
						<col style="width: 4%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 1%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 2%">
						<col style="width: 3%">
						<col style="width: 5%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 11%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">생산자</th>
							<td colspan="6" class="td_input"  style="border-right: hidden;">
<!-- 								<sbux-input id="inp-prdcrNm" name="inp-prdcrNm" uitype="text" class="form-control input-sm"> -->
								<sbux-input
									uitype="text"
									id="dtl-inp-prdcrNm"
									name="dtl-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 기능입니다."
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(dtl-inp-prdcrNm)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							<td colspan="2" class="td_input"  style="border-right: hidden;">
								<sbux-button 
									id="btnSrchPrdcrCd" 
									name="btnSrchPrdcrCd" 
									uitype="modal" 
									class="btn btn-xs btn-outline-dark" 
									text="찾기" target-id="modal-prdcr" 
									onclick="fn_choicePrdcr">
								</sbux-button>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td colspan="2"class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-itemCd" name="dtl-slt-itemCd" uitype="single" jsondata-ref="jsonApcItem" unselected-text="전체" class="form-control input-sm" onchange="fn_onChangeSrchItemCd(this)" ></sbux-select>
<!-- 								<sbux-select id="select-itemCd" name="select-itemCd" uitype="single" jsondata-ref="jsonComItemCd" unselected-text="단일선택" class="form-control input-sm"></sbux-select> -->
							</td>
							<td colspan="4"class="td_input" style="border-right: hidden;">
								<sbux-select id="dtl-slt-vrtyCd" name="dtl-slt-vrtyCd" uitype="single" jsondata-ref="jsonApcVrty" unselected-text="선택" class="form-control input-sm"></sbux-select>
<!-- 								<sbux-select id="select-vrtyCd" name="select-vrtyCd" uitype="single" jsondata-ref="jsonComVrtyCd" unselected-text="단일선택" class="form-control input-sm"></sbux-select> -->
							</td>
							<td colspan="3"class="td_input"  style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox id="chk-fxng" name="chk-fxng" uitype="normal"></sbux-checkbox>
									<label class="check_label" for="check_default" >고정</label>
								</p>
							</td>
							<td colspan="4" style="border-right: hidden;"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">계량일자</th>
							<td colspan="6" class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="dtl-dtp-wrhsYmd" name="dtl-dtp-wrhsYmd" uitype="popup" class="form-control input-sm"></sbux-datepicker>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td colspan="5"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">차량번호/성명</th>
							<td class="td_input">
								<sbux-input
									uitype="text"
									id="dtl-inp-vhclno"
									name="dtl-inp-vhclno"
									class="form-control input-sm"
									autocomplete-ref="jsonVhclAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpVhclno(dtl-inp-vhclno)"
    								autocomplete-select-callback="fn_onSelectVhclno"
   								></sbux-input>
<!-- 								<sbux-input uitype="text" id="inp-vhclno" name="inp-vhclno" class="form-control input-sm"></sbux-input> -->
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVhclNo" name="btnSrchVhclNo" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vhcl" onclick="fn_modalVhcl"></sbux-button>
							</td>
							<td colspan="4"class="td_input" >
								<sbux-input uitype="text" id="inp-drvrNm" name="inp-drvrNm" class="form-control input-sm" disabled></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">전체/공차증량</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-wholWght" name="inp-wholWght" class="form-control input-sm" onchange="fn_onChange(inp-wholWght)"></sbux-input>
							</td>
							<td colspan="3"class="td_input"  style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-emptVhclWght" name="inp-emptVhclWght" class="form-control input-sm" onchange="fn_onChange(inp-emptVhclWght)"></sbux-input>
							</td>
							<td colspan="2"class="td_input" style="border-right: hidden;"><label class="bold">감량 %</label></td>
							<td class="td_input">
								<sbux-input uitype="text" id="inp-rdctRt" name="inp-rdctRt" class="form-control input-sm" init="0" onchange="fn_onChangeRdctRt(inp-rdctRt)"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<p class="ad_input_row">
									<sbux-checkbox id="rdctRt-chk-fxng" name="rdctRt-chk-fxng" uitype="normal" onchange="fn_changeRdctRtChkFxng(rdctRt-chk-fxng)"></sbux-checkbox>
									<label class="check_label" for="check_default" >고정</label>
								</p>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td style="border-right: hidden;" class="td_input"><label class="bold">감량 Kg</label></td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-rdcdWght" name="inp-rdcdWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td style="border-right: hidden;">&nbsp;</td>
							<td class="td_input"><label class="bold">실중량 Kg</label></td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-actlWght" name="inp-actlWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" >입고창고</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-select id="dtl-slt-warehouseSeCd" name="dtl-slt-warehouseSeCd" uitype="single" jsondata-ref="jsonComWarehouse" unselected-text="선택" class="form-control input-sm"></sbux-select>
<!-- 								<sbux-select id="select-warehouseSeCd" name="select-warehouseSeCd" uitype="single" jsondata-ref="jsonComWarehouseSeCd" unselected-text="선택" class="form-control input-sm"></sbux-select> -->
							</td>
							<td colspan="14"class="td_input" >
								<p class="ad_input_row">
									<sbux-checkbox id="warehouseSeCd-chk-fxng" name="warehouseSeCd-chk-fxng" uitype="normal" ></sbux-checkbox>
									<label class="check_label" for="check_default" >고정</label>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg" style="border-right: hidden;">팔레트/박스</th>
						 	<td style="border-right: hidden;">
						 		<sbux-button id="btnSrchPltBx" name="btnSrchPltBx" class="btn btn-xs btn-outline-dark" text="입력" uitype="modal" target-id="modal-pltBx" onclick="fn_modalPltBx"></sbux-button>
						 	</td>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-pltWght" name="inp-pltWght" class="form-control input-sm" onclick="test" disabled></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;"><label class="bold">Kg</label></td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-bxWght" name="inp-bxWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="8" class="td_input" ><label class="bold">Kg</label></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">입고등급</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select id="select-grdCd" name="select-grdCd" uitype="single" jsondata-ref="jsonComGrdCd" unselected-text="선택" class="form-control input-sm"></sbux-select>
							</td>
							<td colspan="14"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">정산중량</th>
							<td class="td_input"  style="border-right: hidden;">
								<sbux-input uitype="text" id="inp-clclnWght" name="inp-clclnWght" class="form-control input-sm" disabled></sbux-input>
							</td>
							<td colspan="14" class="td_input" ><label class="bold">Kg</label></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<div class="ad_tbl_top">
						<ul class="ad_tbl_count">
							<li><span>계량등록 내역</span></li>
						</ul>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdWghPrfmnc" style="width:100%;height:200px;"></div>
				</div>

				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>

    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>

    <!-- 팔레트/박스 선택 Modal -->
    <div>
        <sbux-modal id="modal-pltBx" name="modal-pltBx" uitype="middle" header-title="원물입고 팔레트/박스 입고등록" body-html-id="body-modal-pltBx" footer-is-close-button="false" style="width:1200px"></sbux-modal>
    </div>
    <div id="body-modal-pltBx">
    	<jsp:include page="../../am/popup/pltBxPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonApcGrd			= [];	// 등급 		vrtyCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouse	검색
	var autoCompleteDataJson = [];
	
	var jsonDataPrdcr = [];
	var jsonPrdcr			= [];
	var jsonPrdcrAutocomplete = [];
	
	var jsonVhcl			= [];
	var jsonVhclAutocomplete = [];
	
	var jsonPlt = null;
	var jsonBx = null;
	var pltBxData = null;
	
	var defaultRdctRtChkFxng = "0";
	
    /* SBGrid */
    var grdWghPrfmnc;	// 계량실적조회
    
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_reset();
		fn_createWghPrfmncGrid();
		
		SBUxMethod.set('inp-rdctRt', defaultRdctRtChkFxng);
		fn_initSBSelect();
		fn_clearForm();
		fn_getPrdcrs();
		fn_getVhcls();
	})
	
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}
	
	const fn_getVhcls = async function() {
		jsonVhcl = await gfn_getVhcls(gv_selectedApcCd);
		jsonVhcl = gfn_setFrst(jsonVhcl);
		console.log("jsonVhcl", jsonVhcl)
	}
	
    /**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
			gfn_setComCdSBSelect('dtl-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
		 	gfn_setApcItemSBSelect('dtl-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
		]);
	}
	
	/**
	 * @name fn_onChangeSrchItemCd
	 * @description 품목 선택 변경 event
	 */
	const fn_onChangeSrchItemCd = async function(obj) {
		let itemCd = obj.value;	//SBUxMethod.get("srch-slt-itemCd");
		let result = await Promise.all([
			gfn_setApcVrtySBSelect('dtl-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),	// 품종
			gfn_setApcGrdsSBSelect('dtl-slt-grdCd', jsonApcGrd, gv_selectedApcCd, itemCd)		// 등급
		]);
	}
	
	var jsonWghPrfmnc = [];

	function fn_createWghPrfmncGrid() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWghPrfmnc';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.paging = {
				'type' : 'page',
			  	'count' : 5,
			  	'size' : 20,
			  	'sorttype' : 'page',
			  	'showgoalpageui' : true
		    };
	    SBGridProperties.columns = [
	        {caption: ['계량일자'], ref: 'wghno', width: '100px', type: 'output'},
	        {caption: ['순번'], ref: 'wghSn', width: '100px', type: 'output'},
	        {caption: ['생산자'], ref: 'prdcrNm', width: '100px', type: 'output'},
	        {caption: ['품목'], ref: 'itemNm', width: '100px', type: 'output'},
	        {caption: ['품종'], ref: 'vrtyNm', width: '100px', type: 'output'},
	        {caption: ['차량번호'], ref: 'vhclno', width: '100px', type: 'output'},
	        {caption: ['기사명'], ref: 'drvrNm', width: '100px', type: 'output'},
	        {caption: ['전체중량'], ref: 'wholWght', width: '100px', type: 'output'},
	        {caption: ['공차중량'], ref: 'emptVhclWght', width: '100px', type: 'output'},
	        {caption: ['감량Kg'], ref: 'rdcdWght', width: '100px', type: 'output'},
	        {caption: ['실중량'], ref: 'actlWght', width: '100px', type: 'output'},
	        {caption: ['정산중량'], ref: 'clclnWght', width: '100px', type: 'output'},
	        {caption: ['창고'], ref: 'warehouseSeNm', width: '100px', type: 'output'},
	        {caption: ['비고'], ref: 'rmrk', width: '100px', type: 'output'}
	    ];
	    grdWghPrfmnc = _SBGrid.create(SBGridProperties);
	}

	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}
	var regex = /[^0-9]/g;
	function fn_onChange(id){
		var emptVhclWght = SBUxMethod.get("inp-emptVhclWght").replace(regex, "");
		var wholWght = SBUxMethod.get("inp-wholWght").replace(regex, "");
		
		SBUxMethod.set("inp-emptVhclWght", emptVhclWght);
		SBUxMethod.set("inp-wholWght", wholWght);
		
		if(Number(emptVhclWght) > Number(wholWght)){
			alert("공차중량은 전체중량보다 큰 값을 가질 수 없습니다.");
			SBUxMethod.set("inp-emptVhclWght", "");
			SBUxMethod.set("inp-wholWght", "");
		}
		calKg();
		fn_setClclnWght();
	}
	
	function fn_onChangeRdctRt(id){
		var RdctRt = SBUxMethod.get("inp-rdctRt").replace(regex, "");
		SBUxMethod.set("inp-rdctRt", RdctRt);
		if (RdctRt < 0 || RdctRt > 100){
			alert("0~100 사이의 값을 입력해야합니다.");
			SBUxMethod.set("inp-rdctRt", 0);
		}
		calKg();
		fn_setClclnWght();
	}
	
	function fn_changeRdctRtChkFxng(id){
		if(SBUxMethod.get("rdctRt-chk-fxng")["rdctRt-chk-fxng"] == false){
			SBUxMethod.attr('inp-rdctRt', 'readonly', 'false')
		}
		else{
			SBUxMethod.attr('inp-rdctRt', 'readonly', 'true')
			defaultRdctRtChkFxng = SBUxMethod.get("inp-rdctRt");
		}
	}
	
	function calKg(){
		var emptVhclWght = Number(SBUxMethod.get("inp-emptVhclWght"));
		var wholWght = Number(SBUxMethod.get("inp-wholWght"));
		
		var RdctRt = Number(SBUxMethod.get("inp-rdctRt"));
		
		SBUxMethod.set("inp-rdcdWght", (wholWght-emptVhclWght)*((100-RdctRt)/100));
		SBUxMethod.set("inp-actlWght", (wholWght-emptVhclWght));
	}
	
	const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}
	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			// 생산자 set
			SBUxMethod.set("dtl-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("dtl-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
			
			// 품목/품종 set
			SBUxMethod.set("dtl-slt-itemCd", prdcr.rprsItemCd);
			SBUxMethod.set("dtl-slt-vrtyCd", prdcr.rprsVrtyCd);

 			// 차량번호/성명 set
			SBUxMethod.set("dtl-inp-vhclno", prdcr.vhclno);
			fn_setDrvrNm(prdcr.vhclno);
		}
	}
	const fn_modalPltBx = function() {
		popPltBx.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPltBx, pltBxData);
	}
	const fn_setPltBx = function(pltBxData) {
		if (!gfn_isEmpty(pltBxData)) {
			// 팔레트/박스 Kg set
			SBUxMethod.set("inp-pltWght", pltBxData.totalPltWght);
			SBUxMethod.set("inp-bxWght", pltBxData.totalBxWght);
			//정산중량 Kg set
			fn_setClclnWght();
		}
	}

	/**
	 * @name fn_onKeyUpPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onKeyUpPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
    	SBUxMethod.changeAutocompleteData('dtl-inp-prdcrNm', true);
    }

	/**
	 * @name fn_clearPrdcr
	 * @description 생산자 폼 clear
	 */
	const fn_clearPrdcr = async function() {
		SBUxMethod.set("dtl-inp-prdcrCd", null);
		SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
		if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
			document.getElementById('btnSrchPrdcrCd').click();
		}
		else{
			SBUxMethod.set("dtl-inp-prdcrCd", value);
			SBUxMethod.attr("dtl-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

	/**
	 * @name fn_onKeyUpVhclno
	 * @description 차량번호 입력 시 event : autocomplete
	 */
	const fn_onKeyUpVhclno = function(vhclno){
// 		fn_clearVhclno();
		jsonVhclAutocomplete = gfn_filterFrst(vhclno, jsonVhcl);
    	SBUxMethod.changeAutocompleteData('dtl-inp-vhclno', true);
    }

	/**
	 * @name fn_clearVhclno
	 * @description 차량번호 폼 clear
	 */
	const fn_clearVhclno = async function() {
		SBUxMethod.set("dtl-inp-vhclno", null);
		SBUxMethod.attr("dtl-inp-vhclno", "style", "background-color:''");
	}

	/**
	 * @name fn_onSelectVhclno
	 * @description 차량번호 autocomplete 선택 callback
	 */
	function fn_onSelectVhclno(value, label, item) {
		SBUxMethod.set("dtl-inp-vhclno", value);
		SBUxMethod.attr("dtl-inp-vhclno", "style", "background-color:aquamarine");	//skyblue
		fn_setDrvrNm(value);
	}
	
	function fn_setDrvrNm(vhclno){
		for(var i=0; i<jsonVhcl.length; i++){
			if(jsonVhcl[i].vhclno === vhclno){
				SBUxMethod.set("inp-drvrNm", jsonVhcl[i].drvrNm);
				break;
			}
		}
	}

	
	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = async function() {
    	fn_clearForm();
	}
	
	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {

		// 계량일자
		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2);
		let day = ('0' + today.getDate()).slice(-2);
		let ymd = year + month + day;

		SBUxMethod.set("dtl-dtp-wrhsYmd", ymd);

// 		// 생산자
// 		SBUxMethod.set("dtl-inp-prdcrCd", null);
		SBUxMethod.set("dtl-inp-prdcrNm", null);

// 		// 품목
// 		SBUxMethod.set("dtl-slt-itemCd", null);
// 		// 품종
// 		SBUxMethod.set("dtl-slt-vrtyCd", null);
		// 입고구분
// 		SBUxMethod.set("dtl-rdo-wrhsSeCd", "3");
// 		// 상품구분
// 		SBUxMethod.set("dtl-rdo-gdsSeCd", "1");
// 		// 운송구분
// 		SBUxMethod.set("dtl-rdo-trsprtSeCd", "1");

// 		// 전체중량
// 		SBUxMethod.set("dtl-inp-wholWght", null);
// 		// 공차중량
// 		SBUxMethod.set("dtl-inp-emptVhclWght", null);
// 		// 감량 (%)
// 		SBUxMethod.set("dtl-inp-rdctRt", null);
// 		// 감량kg
// 		SBUxMethod.set("dtl-inp-rdcdWght", null);
// 		// 실중량
// 		SBUxMethod.set("dtl-inp-actlWght", null);
// 		// 차량번호
		SBUxMethod.set("dtl-inp-vhclno", null);
	}
	
	/** 차량정보 */
	/**
	 * @name fn_getvhcls
	 * @description  APC별 차량 목록 가져오기
	 * @function
	 * @param {string} _apcCd		APC코드
	 * @returns {any[]}
	 */
	const gfn_getVhcls = async function(_apcCd) {
		const postJsonPromise = gfn_postJSON(URL_WRHS_VHCL, {apcCd: _apcCd, delYn: "N"});
		const data = await postJsonPromise;
		const sourceJson = [];
		data.resultList.forEach((item) => {
				sourceJson.push({
					vhclno: item.vhclno,
					drvrNm: item.drvrNm,
					name: item.vhclno,
 					value: item.vhclno
				});
			});
		return sourceJson;
	}
	
	 /**
    * @name fn_search
    * @description 조회 버튼
    */
   const fn_search = async function() {
	
	       // set pagination
	   	grdWghPrfmnc.rebuild();
	   	let pageSize = grdWghPrfmnc.getPageSize();
	   	let pageNo = 1;
	
	   	// grid clear
	   	jsonWghPrfmnc.length = 0;
	   	grdWghPrfmnc.clearStatus();
	   	fn_setGrdWghPrfmnc(pageSize, pageNo);
	}
	 /**
     * @name fn_setGrdComAuth
     * @description 계량실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdWghPrfmnc = async function(pageSize, pageNo) {

  		let wrhsYmd = SBUxMethod.get("dtl-dtp-wrhsYmd");	// 계량일자
  		let prdcrCd = SBUxMethod.get("dtl-inp-prdcrCd");	// 생산자
  		let itemCd = SBUxMethod.get("dtl-slt-itemCd");	// 품목
  		let vrtyCd = SBUxMethod.get("dtl-slt-vrtyCd");	// 품종
//   		let wrhsSeCd = SBUxMethod.get("dtl-rdo-wrhsSeCd");	// 입고구분
//   		let gdsSeCd = SBUxMethod.get("dtl-rdo-gdsSeCd");	// 상품구분
//   		let trsprtSeCd = SBUxMethod.get("dtl-rdo-trsprtSeCd");	// 운송구분

		const postJsonPromise = gfn_postJSON("/am/wgh/selectWghPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			wrhsYmd: wrhsYmd,
			prdcrCd: prdcrCd,
			itemCd: itemCd,
			vrtyCd: vrtyCd,
// 			wrhsSeCd: wrhsSeCd,
// 			gdsSeCd: gdsSeCd,
// 			trsprtSeCd: trsprtSeCd,

          	// pagination
  	  		pagingYn : 'Y',
  			currentPageNo : pageNo,
   		  	recordCountPerPage : pageSize
  		});

        const data = await postJsonPromise;

  		try {

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonWghPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
  				const wghPrfmnc = {
  						rowSeq: item.rowSeq,
  						apcCd: item.apcCd,
  						wghno: item.wghno,
  						wghYmd: item.wghYmd,
  						vhclno: item.vhclno,
  						prdcrCd: item.prdcrCd,
  						itemCd: item.itemCd,
  						itemNm: item.itemNm,
  						vrtyCd: item.vrtyCd,
  						vrtyNm: item.vrtyNm,	
  						wholWght: item.wholWght,
  						emptVhclWght: item.emptVhclWght,
  						rdcdRt: item.rdcdRt,
  						rdcdWght: item.rdcdWght,
  						wrhsWght: item.wrhsWght,
  						rmrk: item.rmrk,
  						apcNm: item.apcNm,
  						prdcrNm: item.prdcrNm,
  						grdCd: item.grdCd,
  						grdNm: item.grdNm,
  						pltWght: item.pltWght,
  						bxWght: item.bxWght,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm,
  						gdsSeCd: item.gdsSeCd,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeCd: item.wrhsSeCd,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeCd: item.trsprtSeCd,
  						trsprtSeNm: item.trsprtSeNm
  				}
  				jsonWghPrfmnc.push(wghPrfmnc);

  				if (index === 0) {
  					totalRecordCount = item.totalRecordCount;
  				}
  			});

          	if (jsonWghPrfmnc.length > 0) {
          		if(grdWghPrfmnc.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          			grdWghPrfmnc.setPageTotalCount(totalRecordCount); 	// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          			grdWghPrfmnc.rebuild();
  				}else{
  					grdWghPrfmnc.refresh();
  				}
          	} else {
          		grdWghPrfmnc.setPageTotalCount(totalRecordCount);
          		grdWghPrfmnc.rebuild();
          	}

          	document.querySelector('#listCount').innerText = totalRecordCount;

          } catch (e) {
      		if (!(e instanceof Error)) {
      			e = new Error(e);
      		}
      		console.error("failed", e.message);
          }
	}
    
 	function fn_setClclnWght() {
 		let actlWght = gfn_isEmpty(SBUxMethod.get("inp-actlWght")) ? 0 : SBUxMethod.get("inp-actlWght");
 		let pltWght = gfn_isEmpty(SBUxMethod.get("inp-pltWght")) ? 0 : SBUxMethod.get("inp-pltWght");
 		let bxWght = gfn_isEmpty(SBUxMethod.get("inp-bxWght")) ? 0 : SBUxMethod.get("inp-bxWght");
//  		console.log(SBUxMethod.get("inp-pltWght"));
//  		console.log(SBUxMethod.get("inp-bxWght"));
		//정산중량 Kg set
		SBUxMethod.set("inp-clclnWght", actlWght - pltWght - bxWght);
	}

 	
	 
	
</script>
</html>