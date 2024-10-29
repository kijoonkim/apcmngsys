<%
 /**
  * @Class Name : wghRcptReg.jsp
  * @Description : 계량접수등록 화면
  * @author SI개발부
  * @since 2024.10.23
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.10.23   	김호 			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 계량정보관리</title>
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 계량접수등록 -->
                    <sbux-label id="lbl-wghno" name="lbl-wghno" uitype="normal" text="">
                    </sbux-label>
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnReset"
						name="btnReset"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_reset"
						text="초기화"
					></sbux-button>
					<sbux-button
                            id="btn-srch-apcLinkPop"
                            name="btn-srch-apcLinkPop"
                            class="btn btn-sm btn-outline-danger"
                            text="연계요청"
                            uitype="modal"
                            target-id="modal-apcLinkPop"
                            onclick="fn_popApcLink"
                    ></sbux-button>
					<sbux-button
						id="btnSave"
						name="btnSave"
						uitype="normal"
						class="btn btn-sm btn-primary"
						onclick="fn_save"
						text="저장"
					></sbux-button>
					<sbux-button
						id="btnSearch"
						name="btnSearch"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						onclick="fn_search"
						text="조회"
					></sbux-button>
				</div>
			</div>

			<div class="box-body srch-keyup-area">
				<!--[APC] START -->
					<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->

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
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg" ><span class="data_required" ></span>계량일자</th>
							<td class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wghYmd"
									name="srch-dtp-wghYmd"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
								></sbux-datepicker>
							</td>
							<td colspan="3" style="border-right: hidden"></td>
							<th scope="row" class="th_bg"><span class="data_required" ></span>구분</th>
							<td colspan="" class="td_input" style="border-right: hidden;border-top: hidden">
								<sbux-select
									id="srch-slt-wrhsSpmtType"
									name="srch-slt-wrhsSpmtType"
									uitype="single"
									jsondata-ref="jsonComWrhsSpmtType"
									unselected-text="선택"
									class="form-control input-sm"
									onchange="fn_wrhsSpmtTypeChange(srch-slt-wrhsSpmtType)"
								></sbux-select>
							</td>
							<td colspan="3"></td>
							<th scope="row" class="th_bg">게량대 구분</th>
							<td colspan="2" class="td_input" style="border-right: hidden;border-top: hidden">
								<sbux-select
									id="srch-slt-fcltCd"
									name="srch-slt-fcltCd"
									uitype="single"
									jsondata-ref="jsonComFcltCd"
									unselected-text="전체"
									class="form-control input-sm"
								></sbux-select>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
							<td colspan="" class="td_input" style="border-right: hidden;border-top: hidden">
								<sbux-select
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									uitype="single"
									jsondata-ref="jsonApcItem"
									unselected-text="전체"
									class="form-control input-sm"
									onchange="fn_onChangeSrchItemCd(srch-slt-itemCd)"
								></sbux-select>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									unselected-text="전체"
									uitype="single"
									id="srch-slt-vrtyCd"
									name="srch-slt-vrtyCd"
									class="form-control input-sm input-sm-ast"
									jsondata-ref="jsonApcVrty"
									jsondata-value="itemVrtyCd"
									onchange="fn_onChangeSrchVrtyCd(this)"
								/>
							</td>
							<td colspan="" class="td_input" style="border-right: hidden;border-top: hidden" >
							<th class="ta_r th_bg td_prdcr_area">
								<sbux-label id="srch-lab-prdcrNm" name="srch-lab-prdcrNm" uitype="normal" text="생산자"></sbux-label>
							</th>
							<td class="td_input td_prdcr_area" style="border-right: hidden;">
								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
									autocomplete-height="270px"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td class="td_input td_prdcr_area" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrIdentno"
									name="srch-inp-prdcrIdentno"
									class="form-control input-sm"
									maxlength="2"
									autocomplete="off"
									onchange="fn_onChangeSrchPrdcrIdentno(this)"
								/>
							</td>
							<td class="td_input td_prdcr_area" style="border-right: hidden;">
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
						</tr>
					</tbody>
				</table>

				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>계량정보 상세</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdWghPrfmnc" style="width:100%;height:401px;"></div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal
        	id="modal-prdcr"
        	name="modal-prdcr"
        	uitype="middle"
        	header-title="생산자 선택"
        	body-html-id="body-modal-prdcr"
        	footer-is-close-button="false"
        	header-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    <div>
        <sbux-modal
            id="modal-apcLinkPop"
            name="modal-apcLinkPop"
            uitype="middle"
            header-title="계량연계수신"
            body-html-id="body-modal-apcLinkPop"
            header-is-close-button="false"
            footer-is-close-button="false"
            style="width:800px"
        ></sbux-modal>
    </div>
    <div id="body-modal-apcLinkPop">
        <jsp:include page="../../am/popup/apcLinkPopup.jsp"></jsp:include>
     </div>

</body>
<script type="text/javascript">

	/**
	 * 공통버튼 연계처리
	 */
	async function cfn_init() {
		await fn_reset();
	}
	async function cfn_add() {

	}
	async function cfn_del() {
		await fn_delete();
	}
	async function cfn_save() {
		await fn_save();
	}
	async function cfn_search() {
		await fn_search();
	}


	let prvRowNum = -1;

	var jsonApcItem			= [];	// 품목 		itemCd		검색
	var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
	var jsonComWrhsSpmtType	= [];	// 입고출고구분 wghSpmtType	검색
	var jsonGrdWrhsSpmtType	= [];	// 입고출고구분 wghSpmtType	그리드
	var jsonComFcltCd		= [];	// 설비 		fcltCd		검색
	var jsonGrdFcltCd		= [];	// 설비 		fcltCd		그리드

	var jsonDataPrdcr 		= [];
    var jsonPrdcr			= [];
    var jsonGrdPrdcr		= [];
    var jsonPrdcrAutocomplete = [];

    /* SBGrid */
    var grdWghPrfmnc;	// 계량실적조회

    /* SBGrid Data (JSON) */
    var jsonWghPrfmnc = [];


    /**
     * 조회 조건 select combo 설정
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, 			gv_selectedApcCd),	// 품목
		 	gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, 			gv_selectedApcCd),	// 품종
		 	gfn_setComCdSBSelect('srch-slt-wrhsSpmtType',	jsonComWrhsSpmtType, 	'WRHS_SPMT_TYPE'),	// 입고출고유형
		 	gfn_setComCdGridSelect('grdWghPrfmnc',			jsonGrdWrhsSpmtType, 	'WRHS_SPMT_TYPE'),	// 입고출고유형
		 	gfn_setComCdSBSelect('srch-slt-fcltCd',			jsonComFcltCd, 			'WGH_FCLT_CD', 		gv_selectedApcCd),	// 설비
		 	gfn_setComCdGridSelect('grdWghPrfmnc',			jsonGrdFcltCd, 			'WGH_FCLT_CD', 		gv_selectedApcCd),	// 설비
		 	gfn_setPrdcrSBSelect('grdWghPrfmnc',			jsonGrdPrdcr, 			gv_selectedApcCd),	// 생산자
		]);

		jsonComWrhsSpmtType = jsonComWrhsSpmtType.filter(item => item.value !== 'TF');
		jsonGrdWrhsSpmtType = jsonGrdWrhsSpmtType.filter(item => item.value !== 'TF');

		grdWghPrfmnc.refresh({"combo":true});

		SBUxMethod.refresh("srch-slt-wrhsSpmtType");


		if (jsonApcItem.length == 1) {
			let itemCd = jsonApcItem[0].value;
			SBUxMethod.set("srch-slt-itemCd", itemCd);
		}


		fn_getPrdcrs();

	}

	window.addEventListener('DOMContentLoaded', function(e) {

		SBUxMethod.set('srch-dtp-wghYmd',gfn_dateToYmd(new Date()));
		fn_init();
	});

	const fn_init = async function() {

		fn_reset();
		fn_createWghPrfmncGrid();
		fn_initSBSelect();
	};

	const fn_createWghPrfmncGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWghPrfmnc';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
        SBGridProperties.columns = [
        	{caption: ["처리"], 		ref: 'addYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
            {caption: ['계량대'], 		ref: 'fcltCd', 		width: '80px', type:'combo',  	style:'text-align:center;',
    			typeinfo : {ref:'jsonGrdFcltCd', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['구분'], 		ref: 'wrhsSpmtType', width: '60px', type:'combo',  	style:'text-align:center;',
    			typeinfo : {ref:'jsonGrdWrhsSpmtType', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['입고일자'], 	ref: 'wghYmd', 		width: '80px', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}, style:'text-align:center'},
            {caption: ['차량번호'], 	ref: 'vhclno', 		width: '80px', type: 'input', style:'text-align:center'},
            {caption: ['생산자'], 		ref: 'prdcrCd', 	width: '120px', type:'inputcombo',  	style:'text-align:center;',
    			typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['품목'], 		ref: 'itemCd', 		width: '80px', type:'combo',  	style:'text-align:center;',
    			typeinfo : {ref:'jsonApcItem', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['품종'], 		ref: 'vrtyCd', 		width: '80px', type:'combo',  	style:'text-align:center;',
    			typeinfo : {ref:'jsonApcVrty', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['실중량'], 		ref: 'actlWght', 	width: '70px', type: 'input', style:'text-align:right', format : {type:'number', rule:'#,### '}},
            {caption: ['입고가구'], 	ref: 'wrhsQntt', 	width: '60px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['입고팔레트'], 	ref: 'pltQntt', 	width: '70px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['대'], 			ref: 'grd1Qntt', 	width: '50px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['특'], 			ref: 'grd2Qntt', 	width: '50px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['중'], 			ref: 'grd3Qntt', 	width: '50px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['기타'], 		ref: 'grd4Qntt', 	width: '50px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['타출고처'], 	ref: 'oinstSpmtNm', 	width: '70px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['출고가구'], 	ref: 'shpgotVhclQntt', 	width: '60px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['출고팔레트'], 	ref: 'shpgotVhclPltQntt', 	width: '70px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['기사명'], 		ref: 'drvrNm', 		width: '60px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['연락처'], 		ref: 'telno', 		width: '80px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['작업자'], 		ref: 'oprtr', 		width: '60px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['비고'], 		ref: 'rmrk', 		width: '300px', type: 'input'},
            {caption: ['APC코드'], 		ref: 'apcCd', 		hidden: true},
            {caption: ['추가여부'], 	ref: 'addYn', 		hidden: true},
        ];
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);

    }

	/**
     * @name fn_procRow
     * @description 그리드 추가, 삭제 이벤트
     */
     const fn_procRow = function (gubun, nRow, nCol) {

		if (gubun == "ADD") {

			let apcCdCol = grdWghPrfmnc.getColRef("apcCd");
			let addYnCol = grdWghPrfmnc.getColRef("addYn");
			let wrhsSpmtTypeCol = grdWghPrfmnc.getColRef("wrhsSpmtType");
			let wghYmdCol = grdWghPrfmnc.getColRef("wghYmd");

			if (!gfn_isEmpty(SBUxMethod.get("srch-slt-fcltCd"))) {
				let fcltCdCol = grdWghPrfmnc.getColRef("fcltCd");
				grdWghPrfmnc.setCellData(nRow, fcltCdCol, SBUxMethod.get("srch-slt-fcltCd"), true);
			}

			if (!gfn_isEmpty(SBUxMethod.get("srch-slt-itemCd"))) {
				let itemCdCol = grdWghPrfmnc.getColRef("itemCd");
				grdWghPrfmnc.setCellData(nRow, itemCdCol, SBUxMethod.get("srch-slt-itemCd"), true);
			}

			if (!gfn_isEmpty(SBUxMethod.get("srch-slt-vrtyCd"))) {
				let vrtyCol = grdWghPrfmnc.getColRef("vrtyCd");
				grdWghPrfmnc.setCellData(nRow, vrtyCol, SBUxMethod.get("srch-slt-vrtyCd").substr(4,4), true);
			}

			grdWghPrfmnc.setCellData(nRow, nCol, "N", true);
			grdWghPrfmnc.setCellData(nRow, apcCdCol, gv_selectedApcCd, true);
			grdWghPrfmnc.setCellData(nRow, wrhsSpmtTypeCol, SBUxMethod.get("srch-slt-wrhsSpmtType"), true);
			grdWghPrfmnc.setCellData(nRow, wghYmdCol, SBUxMethod.get("srch-dtp-wghYmd"), true);
			grdWghPrfmnc.setCellData(nRow, addYnCol, "N", true);
			grdWghPrfmnc.addRow(true);

			grdWghPrfmnc.setCellDisabled(0, 0, grdWghPrfmnc.getRows() -1, grdWghPrfmnc.getCols() -1, false);
			grdWghPrfmnc.setCellDisabled(grdWghPrfmnc.getRows() -1, 0, grdWghPrfmnc.getRows() -1, grdWghPrfmnc.getCols() -1, true);

		} else if (gubun == "DEL") {

			if(grdWghPrfmnc.getRowStatus(nRow) == 0 || grdWghPrfmnc.getRowStatus(nRow) == 2){
        		if(gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
        			var wghPrfmncVO = grdWghPrfmnc.getRowData(nRow);
        			fn_deleteWghPrfmnc(wghPrfmncVO, nRow);
        		}
        	}else{
        		grdWghPrfmnc.deleteRow(nRow);
        	}
		}

	}


	const fn_wrhsSpmtTypeChange = function (type) {

		let prdcrCol = grdWghPrfmnc.getColRef("prdcrCd");

		if (type == "DT") {
			SBUxMethod.set("srch-lab-prdcrNm", "거래처")
			grdWghPrfmnc.setCellData(0, prdcrCol, "거래처", true)
		} else {
			SBUxMethod.set("srch-lab-prdcrNm", "생산자")
			grdWghPrfmnc.setCellData(0, prdcrCol, "생산자", true)
		}
	}


	const fn_onChangeSrchItemCd = async function (obj) {
		let itemCd = obj.value;
		const itemInfo = _.find(jsonApcItem, {value: itemCd});

		let result = await Promise.all([
			gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd)			// 품종
		]);
	}


	/**
	 * @name fn_onChangeSrchVrtyCd
	 * @description 품종 선택 변경 event
	 */
	const fn_onChangeSrchVrtyCd = async function(obj) {
		let vrtyCd = obj.value;
		const itemCd = vrtyCd.substring(0,4);

		const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
		if(!gfn_isEmpty(vrtyCd)){
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			await fn_onChangeSrchItemCd({value: itemCd});
			SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
		}
	}


	/**
     * @name fn_grdStrgLoctnChanged
     * @description 열, 행, 단 변경 이벤트
     */
	const fn_grdStrgLoctnChanged = function () {

		let nCol = grdWghPrfmnc.getCol();
		let nRow = grdWghPrfmnc.getRow();

		let strgLoctnRowCol = grdWghPrfmnc.getColRef("strgLoctnRow");
		let strgLoctnColCol = grdWghPrfmnc.getColRef("strgLoctnCol");
		let strgLoctnLvlCol = grdWghPrfmnc.getColRef("strgLoctnLvl");
		let rdcdRtCol = grdWghPrfmnc.getColRef("rdcdRt");
		let acptnWghtCol = grdWghPrfmnc.getColRef("acptnWght");
		let wrhsWghtCol = grdWghPrfmnc.getColRef("wrhsWght");
		let checkedYnCol = grdWghPrfmnc.getColRef("checkedYn");

		if (nCol == strgLoctnRowCol || nCol == strgLoctnColCol || nCol == strgLoctnLvlCol) {

			let rowData = grdWghPrfmnc.getRowData(nRow);
			let strgLoctnCd = rowData.strgLoctnCd;

			let strgLoctnRow = rowData.strgLoctnRow;
			let strgLoctnCol = rowData.strgLoctnCol;
			let strgLoctnLvl = rowData.strgLoctnLvl;

			if (strgLoctnCd == (strgLoctnRow + strgLoctnCol + strgLoctnLvl)) {
				grdWghPrfmnc.setCellData(nRow, checkedYnCol, "N");
			} else {
				grdWghPrfmnc.setCellData(nRow, checkedYnCol, "Y");
			}
		}

		if (nCol == rdcdRtCol) {
			let rowData = grdWghPrfmnc.getRowData(nRow);

			let actlWght = rowData.actlWght;
			let rdcdRt = rowData.rdcdRt;

			if (!gfn_isEmpty(rdcdRt)) {

				let acptnWght = Math.round(parseFloat(actlWght) * ((100 - parseFloat(rdcdRt)) / 100), 0)
			    grdWghPrfmnc.setCellData(nRow, acptnWghtCol, acptnWght);
			    grdWghPrfmnc.setCellData(nRow, wrhsWghtCol, acptnWght);
			} else {
				grdWghPrfmnc.setCellData(nRow, acptnWghtCol, actlWght);
				grdWghPrfmnc.setCellData(nRow, wrhsWghtCol, actlWght);
			}
		}

	}



	/** common button action */


	/**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = async function() {
    	fn_clearForm();
	}


	/**
     * @name fn_save
     * @description 저장 버튼
     */
	const fn_save = async function() {

		let checkedYnCol = grdWghPrfmnc.getColRef("checkedYn");
		let checkedRows = grdWghPrfmnc.getCheckedRows(checkedYnCol, true);

		if(checkedRows.length == 0){
    		gfn_comAlert("W0003", "저장");			// W0003	{0}할 대상이 없습니다.
    		return;
    	}

		let saveList = [];

		for (var i=0; i<checkedRows.length; i++) {

			let rowData = grdWghPrfmnc.getRowData(checkedRows[i]);
			rowData.strgLoctnCd = rowData.strgLoctnRow + rowData.strgLoctnCol + rowData.strgLoctnLvl
			rowData.rdcdWght = parseInt(rowData.actlWght) - parseInt(rowData.acptnWght)

			saveList.push(rowData);
		}

		if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/wgh/updateStrgLoctnCdList.do", saveList);
	    	const data = await postJsonPromise;

	    	try{
	    		if (_.isEqual("S", data.resultStatus)) {
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
	        	}
	        }catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}
	}

	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

		if (gfn_isEmpty(SBUxMethod.get("srch-dtp-wghYmd"))) {
    		gfn_comAlert("W0001", "계량일자");		//	W0002	{0}을/를 입력하세요.
            return;
    	}
    	// grid clear
    	jsonWghPrfmnc.length = 0;
    	fn_setGrdWghPrfmnc();
	}

	/**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
	const fn_clearForm = function() {

	}


    /**
     * @name fn_setGrdWghPrfmnc
     * @description 계량실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdWghPrfmnc = async function() {

  		let wghYmd = SBUxMethod.get("srch-dtp-wghYmd");		// 계량일자
  		let itemCd 	= SBUxMethod.get("srch-slt-itemCd");	// 품목

		const postJsonPromise = gfn_postJSON("/am/wgh/selectWghPrfmncList.do", {
			apcCd: gv_selectedApcCd,
			wghYmd: wghYmd,
			itemCd : itemCd,
  		});

  		try {

  			const data = await postJsonPromise;

	        if (!_.isEqual("S", data.resultStatus)) {
	        	gfn_comAlert(data.resultCode, data.resultMessage);
	        	return;
	        }

          	/** @type {number} **/
      		let totalRecordCount = 0;

      		jsonWghPrfmnc.length = 0;
          	data.resultList.forEach((item, index) => {
  				const wghPrfmnc = {
  						apcCd: item.apcCd,
  						wghno: item.wghno,
  						wghSn: item.wghSn,
  						wghnoIndct: item.wghnoIndct,
  						wrhsno: item.wrhsno,
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
  						actlWght: item.actlWght,
  						rdcdWght: item.rdcdWght,
  						wrhsWght: item.wrhsWght,
  						rmrk: item.rmrk,
  						apcNm: item.apcNm,
  						prdcrNm: item.prdcrNm,
  						prdcrIdentno: item.prdcrIdentno,
  						grdCd: item.grdCd,
  						grdNm: item.grdNm,
  						pltWght: item.pltWght,
  						bxQntt: item.bxQntt,
  						bxWght: item.bxWght,
  						invntrWght: item.invntrWght,
  						warehouseSeCd: item.warehouseSeCd,
  						warehouseSeNm: item.warehouseSeNm,
  						gdsSeCd: item.gdsSeCd,
  						gdsSeNm: item.gdsSeNm,
  						wrhsSeCd: item.wrhsSeCd,
  						wrhsSeNm: item.wrhsSeNm,
  						trsprtSeCd: item.trsprtSeCd,
  						trsprtSeNm: item.trsprtSeNm,
  						stdGrd: item.stdGrd,
  						stdGrdCd: item.stdGrdCd,
  						fcltCd	: item.fcltCd,
  						wrhsSpmtType : item.wrhsSpmtType,
  						addYn : 'N'
  				}
  				jsonWghPrfmnc.push(wghPrfmnc);
  			});

          	grdWghPrfmnc.rebuild();
          	grdWghPrfmnc.addRow(true);

          	grdWghPrfmnc.setCellDisabled(grdWghPrfmnc.getRows() -1, 0, grdWghPrfmnc.getRows() -1, grdWghPrfmnc.getCols() -1, true);

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}

	/**
	 * 거래처 팝업 필수 함수
	 * 시작
	 */
	const fn_choiceCnpt = function() {
		let cnptNm = SBUxMethod.get("dtl-inp-cnptNm");
		popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, cnptNm, fn_setCnpt);
	}
	const fn_setCnpt = function(cnpt) {
		if (!gfn_isEmpty(cnpt)) {
			SBUxMethod.set("dtl-inp-cnptCd", cnpt.cnptCd);
			SBUxMethod.set("dtl-inp-cnptNm", cnpt.cnptNm);
		}
	}


	/* 생산자 팝업 호출 필수 function  */
	/* Start */
	/**
	 * @name fn_getPrdcrs
	 * @description 생산자 리스트 호출
	 */
	const fn_getPrdcrs = async function() {
		jsonPrdcr 		= await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr 		= gfn_setFrst(jsonPrdcr);
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
	 * @name fn_onSelectPrdcrNm
	 * @description 생산자 autocomplete 선택 callback
	 */
	function fn_onSelectPrdcrNm(value, label, item) {
		SBUxMethod.set("srch-inp-prdcrCd", value);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
		fn_setPrdcrForm(prdcr);
	}

 	/**
 	 * @name fn_clearPrdcr
 	 * @description 생산자 폼 clear
 	 */
 	const fn_clearPrdcr = function() {
 		SBUxMethod.set("srch-inp-prdcrCd", "");
 		SBUxMethod.set("srch-inp-prdcrIdentno", "");
 		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
 	}

	/**
	 * @name fn_choicePrdcr
	 * @description 생산자 선택 popup 호출
	 */
    const fn_choicePrdcr = function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
	}

	/**
	 * @name fn_setPrdcr
	 * @description 생산자 선택 popup callback 처리
	 */
	const fn_setPrdcr = async function(prdcr) {

		await fn_getPrdcrs();

		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			fn_setPrdcrForm(prdcr);
		}
	}

	const fn_setPrdcrForm = async function(prdcr) {

		if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
			SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
		} else {
			SBUxMethod.set("srch-inp-prdcrIdentno", "");
		}

	}

	const fn_onChangeSrchPrdcrIdentno = function(obj) {

		if (gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrIdentno"))) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", "");
		SBUxMethod.set("srch-inp-prdcrNm", "");
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

		let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-prdcrIdentno")) || 0;

		if (prdcrIdentno < 1) {
			return;
		}

		const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
		if (gfn_isEmpty(prdcrInfo)) {
			return;
		}

		SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
		SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
		SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

		fn_setPrdcrForm(prdcrInfo);

	}
	/*
	* 조회조건 생산자 팝업 관련 function
	* End
	*/


	const fn_popApcLink = function() {
        popApcLink.init(
                    {
                        apcCd: gv_selectedApcCd,
                        apcNm: gv_selectedApcNm,
                        linkKnd: "W",
                        kndList: ["W"]
                    },
                    fn_popApcLinkCallBack
                );
    }

	const fn_popApcLinkCallBack = function() {

    }


	/** ui event */

	/**
	 * @name fn_onChangeApc
	 * @description APC 선택 변경 event
	 */
	const fn_onChangeApc = async function() {
		fn_init();
	}

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>