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
			<div class="box-header" style="display:flex; justify-content: flex-start;">
				<div>
					<h3 class="box-title"> ▶ ${comMenuVO.menuNm}</h3>
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="button" class="btn btn-sm btn-outline-danger">조회</sbux-button>
					<sbux-button id="btnSave" name="btnSave" uitype="button" class="btn btn-sm btn-outline-danger">저장</sbux-button>
					<sbux-button id="btnDelete" name="btnDelete" uitype="button" class="btn btn-sm btn-outline-danger">삭제</sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
				<!--[pp] 검색 -->
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
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
						<col style="width: 6%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg">입고일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-strtWrhsYmd" name="srch-dtp-strtWrhsYmd" class="form-control pull-right input-sm">
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker uitype="popup" id="srch-dtp-endWrhsYmd" name="srch-dtp-endWrhsYmd" class="form-control pull-right input-sm">
							</td>
							<td>&nbsp;</td>
							<th scope="row" class="th_bg">품목/품종</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-vrtyCd" name="srch-slt-vrtyCd" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComVrty"></sbux-select>
							</td>
							<td>&nbsp;</td>
						    <th scope="row" class="th_bg">생산자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 기능입니다."
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
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
							<td>&nbsp;</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">창고</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select uitype="single" id="srch-slt-warehouseSeCd" name="srch-slt-warehouseSeCd" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComWarehouse"></sbux-select>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>투입대상 내역</span></li>
					</ul>
				</div>
				<div class="sbt-wrap-body">
					<div class="sbt-grid">
						<div id="inptTrgtDsctnGridArea" style="height:300px;"></div>
					</div>
				</div>
				<br/>
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 9%">
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 9%">
							<col style="width: 7%">
							<col style="width: 6%">
							<col style="width: 9%">
					</colgroup>
					<tr>
						<th scope="row" class="th_bg">지시일자</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-datepicker uitype="popup" id="srch-dtp-cmndYmd" name="srch-dtp-cmndYmd" class="form-control pull-right input-sm" class="form-control pull-right input-sm"/>
						</td>
						<td>&nbsp;</td>
						<th scope="row" class="th_bg">투입설비</th>
						<td class="td_input" style="border-right: hidden;">
							<sbux-select uitype="single" id="srch-slt-inptFclt" name="srch-slt-inptFclt" class="form-control input-sm" unselected-text="선택" jsondata-ref="jsonComFclt"></sbux-select>
						</td>
						<td colspan="4">&nbsp;</td>
					</tr>
				</table>
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>선별지시 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btnInsert" name="btnInsert" uitype="button" class="btn btn-sm btn-outline-danger">등록</sbux-button>
						<sbux-button id="btnDelete" name="btnDelete" uitype="button" class="btn btn-sm btn-outline-danger">삭제</sbux-button>
					</div>
				</div>
                <div class="sbt-wrap-body">
                    <div class="sbt-grid">
                        <div id="inptCmndDsctnGridArea" style="height:340px;"></div>
                    </div>
               	</div>
			</div>
		</div>
	</section>

    <!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" style="width:1100px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">

	var jsonComItem			= [];	// 품목 		itemCd		검색
	var jsonComVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComWarehouse	= [];	// 창고 		warehouseSeCd	검색
	var jsonComFclt			= [];	// 설비 		fcltCd		검색

    var jsonDataPrdcr = [];
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

	const fn_initSBSelect = async function() {

		// 검색 SB select
	 	await gfn_setComCdSBSelect('srch-slt-warehouseSeCd', 	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd);	// 창고
	 	await gfn_setComCdSBSelect('srch-slt-inptFclt', 		jsonComFclt, 		'FCLT_CD', gv_selectedApcCd);			// 설비
	 	await gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonComItem, gv_selectedApcCd);				// 품목
	 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_selectedApcCd);		// 품종
	}

	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		//gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonComVrty, gv_selectedApcCd, itemCd);		// 품종
	}

	// only document
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_createGrid1();
		fn_createGrid2();

		let today = new Date();
		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2)
		let day = ('0' + today.getDate()).slice(-2)
// 		SBUxMethod.set("srch-dtp-strtWrhsYmd", year+month+day);
// 		SBUxMethod.set("srch-dtp-endWrhsYmd", year+month+day);
		SBUxMethod.set("srch-dtp-cmndYmd", year+month+day);

		fn_initSBSelect();
		fn_getPrdcrs();
	});

	var inptTrgtDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptTrgtDsctnList = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid1() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptTrgtDsctnGridArea';
	    SBGridProperties.id = 'inptTrgtDsctnList';
	    SBGridProperties.jsonref = 'jsoninptTrgtDsctnList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'byrow';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.columns = [
	        {caption: ["선택","선택"],		ref: 'msgKey',      type:'output',  width:'50px',    style:'text-align:center'},
	        {caption: ["입고일자","입고일자"], 	ref: 'msgCn',     	type:'output',  width:'90px',    style:'text-align:left'},
	        {caption: ["팔레트번호","팔레트번호"],  	ref: 'msgKndNm',    type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],  	ref: 'msgKndNm',    type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["품종","품종"],  	ref: 'msgKndNm',    type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["창고","창고"],  	ref: 'msgKndNm',    type:'output',  width:'90px',    style:'text-align:center'},
	        {caption: ["입고","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["입고","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["재고","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["재고","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["지시","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["지시","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["비고","비고"],  	ref: 'msgKndNm',    type:'output',  width:'90px',    style:'text-align:center'},
	    ];

	    inptTrgtDsctnList = _SBGrid.create(SBGridProperties);
	    inptTrgtDsctnList.addRow(true);

	}

	var inptCmndDsctnList; // 그리드를 담기위한 객체 선언
	var jsoninptCmndDsctnList = []; // 그리드의 참조 데이터 주소 선언

	function fn_createGrid2() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'inptCmndDsctnGridArea';
	    SBGridProperties.id = 'inptCmndDsctnList';
	    SBGridProperties.jsonref = 'jsoninptCmndDsctnList';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
<!-- 	    SBGridProperties.selectmode = 'byrow'; -->
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
	        {caption: ["선택","선택"],		ref: 'msgKey',      type:'checkbox',  width:'50px',    style:'text-align:center'},
	        {caption: ["지시번호","지시번호"], 	ref: 'msgCn',     	type:'output',  width:'130px',    style:'text-align:left'},
	        {caption: ["지시일자","지시일자"],  	ref: 'msgKndNm',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["투입설비","투입설비"],  	ref: 'msgKndNm',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["생산자","생산자"],  	ref: 'msgKndNm',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["품종","품종"],  	ref: 'msgKndNm',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["창고","창고"],  	ref: 'msgKndNm',    type:'output',  width:'130px',    style:'text-align:center'},
	        {caption: ["팔레트번호","팔레트번호"],  	ref: 'msgKndNm',    type:'output',  width:'130px',    style:'text-align:center'},
// 	        {caption: ["입고","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
// 	        {caption: ["입고","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
// 	        {caption: ["재고","수량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
// 	        {caption: ["재고","중량"],  	ref: 'msgKndNm',    type:'output',  width:'70px',    style:'text-align:center'},
	        {caption: ["지시","수량"],  	ref: 'msgKndNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["지시","중량"],  	ref: 'msgKndNm',    type:'output',  width:'100px',    style:'text-align:center'},
	        {caption: ["비고","비고"],  	ref: 'msgKndNm',    type:'output',  width:'130px',    style:'text-align:center'},
	    ];

	    inptCmndDsctnList = _SBGrid.create(SBGridProperties);
	    inptCmndDsctnList.addRow(true);

	}


	function fn_closeModal(modalId){
		SBUxMethod.closeModal(modalId);
	}


	const fn_onChangeApc = async function() {
		fn_clearPrdcr();
		fn_initSBSelect();
		fn_getPrdcrs();
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
		SBUxMethod.set("srch-inp-prdcrCd", null);
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


    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr);
	}

	const fn_setPrdcr = function(prdcr) {
		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
		}
	}

</script>

</html>