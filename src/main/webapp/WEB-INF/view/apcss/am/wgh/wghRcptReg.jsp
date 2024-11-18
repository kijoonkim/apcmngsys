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
								<sbux-label id="srch-lab-prdcrNm" name="srch-lab-prdcrNm" style="font-weight: bold" uitype="normal" text="생산자"></sbux-label>
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
					<div id="sb-area-grdWghPrfmnc" style="width:100%;height:544px;"></div>
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
	var jsonApcGrd			= [];

	var jsonWrhsVhcl		= [];
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
		 	gfn_setWrhsVhclSBSelect('grdWghPrfmnc',			jsonWrhsVhcl, 			gv_selectedApcCd),	// 입고차량
		]);

		jsonComWrhsSpmtType = jsonComWrhsSpmtType.filter(item => item.value !== 'TF');
		jsonGrdWrhsSpmtType = jsonGrdWrhsSpmtType.filter(item => item.value !== 'TF');

		SBUxMethod.refresh("srch-slt-wrhsSpmtType");


		if (jsonApcItem.length == 1) {
			let itemCd = jsonApcItem[0].value;
			SBUxMethod.set("srch-slt-itemCd", itemCd);
			jsonApcGrd = await gfn_getStdGrdDtls(gv_selectedApcCd, "01", itemCd);
		}

		fn_getPrdcrs();
		fn_createWghPrfmncWrhsGrid();
	}

	window.addEventListener('DOMContentLoaded', function(e) {

		SBUxMethod.set('srch-dtp-wghYmd',gfn_dateToYmd(new Date()));
		fn_init();
	});

	const fn_init = async function() {

		let rst = await Promise.all([
			fn_reset(),
			fn_initSBSelect(),
		])
	};

	const fn_createWghPrfmncWrhsGrid = async function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdWghPrfmnc';
	    SBGridProperties.id = 'grdWghPrfmnc';
	    SBGridProperties.jsonref = 'jsonWghPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.total = {
      		  type 		: 'grand',
      		  position	: 'bottom',
      		  columns		: {
      		      standard : [1,2],
      		      sum : [8, 9, 10, 11, 12, 13, 14],
      		  },
      		  grandtotalrow : {
      		      titlecol 	: 1,
      		      titlevalue	: '합계',
      		      style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
      		      stylestartcol	: 1
      		  },
      		  datasorting	: true,
      		  usedecimal : false,
      		};
        SBGridProperties.columns = [
        	{caption: ["처리"], 		ref: 'delYn',   	type:'button', width:'60px',    style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
	        	if(strValue== null || strValue == ""){
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", " + nRow + ", " + nCol + ")'>추가</button>";
	        	}else{
			        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", " + nRow + ")'>삭제</button>";
	        	}
	        }},
            {caption: ['계량대'], 		ref: 'fcltCd', 		width: '80px', type:'combo',  	style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {ref:'jsonGrdFcltCd', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['구분'], 		ref: 'wrhsSpmtType', width: '60px', type:'combo',  	style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {ref:'jsonGrdWrhsSpmtType', 	displayui : false,	itemcount: 10, label:'label', value:'value'}, disabled:true},
            {caption: ['입고일자'], 	ref: 'wghYmd', 		width: '80px', type : 'datepicker', format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, typeinfo : {gotoCurrentClick: true, clearbutton: true}, style:'text-align:center; background:#FFF8DC;'},
            {caption: ['차량번호'], 	ref: 'vhclno', 		width: '80px', type: 'input', style:'text-align:center; background:#FFF8DC;', typeinfo : {max : 9}},
            {caption: ['생산자'], 		ref: 'prdcrCd', 	width: '120px', type:'inputcombo',  	style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {ref:'jsonGrdPrdcr', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['품목'], 		ref: 'itemCd', 		width: '80px', type:'combo',  	style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {ref:'jsonApcItem', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['품종'], 		ref: 'vrtyCd', 		width: '120px', type:'combo',  	style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {ref:'jsonApcVrty', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['실중량'], 		ref: 'actlWght', 	width: '70px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
            {caption: ['입고가구'], 	ref: 'bxQntt', 		width: '60px', type: 'output', style:'text-align:right;', format : {type:'number', rule:'#,### '}},
            {caption: ['입고팔레트'], 	ref: 'pltQntt', 	width: '70px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
		];
        for (var i=0; i<jsonApcGrd.length; i++) {
        	SBGridProperties.columns.push(
        			{caption: [jsonApcGrd[i].grdNm], 			ref: 'grdQntt' + (i+1), 		width: '50px', type: 'input', style:'text-align:right; background:#FFF8DC;', format : {type:'number', rule:'#,### '}},
        	)
        }

        SBGridProperties.columns.push(
        		{caption: ['타출고처'], 	ref: 'oinstSpmtNm', width: '70px', type: 'input', style:'text-align:right'},
                {caption: ['출고가구'], 	ref: 'shpgotQntt', 	width: '60px', type: 'input', style:'text-align:right', format : {type:'number', rule:'#,### '}},
                {caption: ['출고팔레트'], 	ref: 'shpgotPltQntt', 	width: '70px', type: 'input', style:'text-align:right', format : {type:'number', rule:'#,### '}},
                {caption: ['기사명'], 		ref: 'drvrNm', 		width: '60px', type: 'input', style:'text-align:center'},
                {caption: ['연락처'], 		ref: 'telno', 		width: '100px', type: 'input', style:'text-align:center', typeinfo : {max : 11}},
                {caption: ['작업자'], 		ref: 'oprtrNm', 	width: '60px', type: 'input', style:'text-align:center'},
                {caption: ['비고'], 		ref: 'rmrk', 		width: '300px', type: 'input', style:'text-align:left'},
                {caption: ['APC코드'], 		ref: 'apcCd', 		hidden: true},
                {caption: ['추가여부'], 	ref: 'addYn', 		hidden: true},
        	)
        for (var j=0; j<jsonApcGrd.length; j++) {
        	SBGridProperties.columns.push(
        			{caption: [jsonApcGrd[j].grdNm], 			ref: 'grdCd' + (j+1), 		hidden: true},
        	)
        }
        grdWghPrfmnc = _SBGrid.create(SBGridProperties);
        grdWghPrfmnc.bind('valuechanged', 'fn_grdGrdQnttChanged');
        grdWghPrfmnc.refresh({"combo":true});

    }

	const fn_grdGrdQnttChanged = function () {

		let nRow = grdWghPrfmnc.getRow();
		let nCol = grdWghPrfmnc.getCol();

		let grdQntt1Col = grdWghPrfmnc.getColRef("grdQnttCol1");
		let grdQntt2Col = grdWghPrfmnc.getColRef("grdQnttCol2");
		let grdQntt3Col = grdWghPrfmnc.getColRef("grdQnttCol3");
		let grdQntt4Col = grdWghPrfmnc.getColRef("grdQnttCol4");
		let bxQnttCol = grdWghPrfmnc.getColRef("bxQntt");
		let vhclnoCol = grdWghPrfmnc.getColRef("vhclno");

		if (grdQntt1Col = nCol || grdQntt2Col == nCol || grdQntt3Col == nCol || grdQntt3Col == nCol) {

			let rowData = grdWghPrfmnc.getRowData(nRow);
			let bxQntt = fn_parseInt(rowData.grdQntt1) + fn_parseInt(rowData.grdQntt2) + fn_parseInt(rowData.grdQntt3) + fn_parseInt(rowData.grdQntt4);
			grdWghPrfmnc.setCellData(nRow, bxQnttCol, bxQntt, true);
		}

		if (vhclnoCol == nCol) {
			let rowData = grdWghPrfmnc.getRowData(nRow);
			let vhclno = rowData.vhclno;

			const wrhsVhclInfo = _.find(jsonWrhsVhcl, {vhclno: vhclno});

			if (!gfn_isEmpty(wrhsVhclInfo)) {

				let drvrNm = wrhsVhclInfo.drvrNm;
				let telno = wrhsVhclInfo.telno;

				if (!gfn_isEmpty(drvrNm)) {
					let drvrNmCol = grdWghPrfmnc.getColRef("drvrNm");
					grdWghPrfmnc.setCellData(nRow, drvrNmCol, drvrNm, true);
				}

				if (!gfn_isEmpty(drvrNm)) {
					let telnoCol = grdWghPrfmnc.getColRef("telno");
					grdWghPrfmnc.setCellData(nRow, telnoCol, telno, true);
				}
			}
		}

		grdWghPrfmnc.refresh();

	}

	const fn_parseInt = function(val) {

    	if (gfn_isEmpty(val)) {
    		return 0;
    	} else {
    		if (val == 0) {
    			return 0;
    		} else {
    			return parseInt(val);
    		}
    	}
    }


	/**
     * @name fn_procRow
     * @description 그리드 추가, 삭제 이벤트
     */
     const fn_procRow = function (gubun, nRow, nCol) {

		if (gubun == "ADD") {


			if (jsonWghPrfmnc.length == 1 && gfn_isEmpty(jsonWghPrfmnc[0].delYn)) {
				grdWghPrfmnc.deleteRow(nRow);
			}

			// jsonWghPrfmnc
			let wghPrfmnc = {};

			wghPrfmnc.delYn = "N";
			wghPrfmnc.apcCd = gv_selectedApcCd;
			wghPrfmnc.addYn = "Y";


			if (!gfn_isEmpty(SBUxMethod.get("srch-slt-fcltCd"))) {
				wghPrfmnc.fcltCd = SBUxMethod.get("srch-slt-fcltCd");
			}

			if (!gfn_isEmpty(SBUxMethod.get("srch-slt-itemCd"))) {
				wghPrfmnc.itemCd = SBUxMethod.get("srch-slt-itemCd");
			}

			if (!gfn_isEmpty(SBUxMethod.get("srch-slt-vrtyCd"))) {
				wghPrfmnc.vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
			}

			if (!gfn_isEmpty(SBUxMethod.get("srch-dtp-wghYmd"))) {
				wghPrfmnc.wghYmd = SBUxMethod.get("srch-dtp-wghYmd");
			}

			if (!gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrCd"))) {
				wghPrfmnc.prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
			}

			if (!gfn_isEmpty(SBUxMethod.get("srch-slt-wrhsSpmtType"))) {
				wghPrfmnc.wrhsSpmtType = SBUxMethod.get("srch-slt-wrhsSpmtType");
			}

			jsonWghPrfmnc.splice(parseInt((nRow)-1), 0, wghPrfmnc);
			grdWghPrfmnc.rebuild();

			grdWghPrfmnc.setCellDisabled(0, 0, grdWghPrfmnc.getRows() -1, grdWghPrfmnc.getCols() -1, false);
			grdWghPrfmnc.setCellDisabled(grdWghPrfmnc.getRows() -1, 0, grdWghPrfmnc.getRows() -1, grdWghPrfmnc.getCols() -1, true);



		} else if (gubun == "DEL") {

			let rowData = jsonWghPrfmnc[parseInt(nRow)-1];
			let addYn = rowData.addYn;

			if (addYn != "Y"){
        		if (gfn_comConfirm("Q0001", "등록된 행입니다. 삭제")){
        			var wghPrfmncVO = grdWghPrfmnc.getRowData(nRow);
        			fn_deleteWghPrfmnc(wghPrfmncVO, nRow);
        		}
        	} else {
        		jsonWghPrfmnc.splice(parseInt(nRow)-1, 1);
        		grdWghPrfmnc.refresh();
        	}
		}

	}


	const fn_wrhsSpmtTypeChange = function (type) {
		jsonWghPrfmnc.length = 0;
		grdWghPrfmnc.refresh();

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

		let grdAllData = grdWghPrfmnc.getGridDataAll();
		let multiList = [];
		let wghSnList = [];
		for (var i=1; i<=grdAllData.length; i++) {

			let rowData = grdWghPrfmnc.getRowData(i);
			let stts = grdWghPrfmnc.getRowStatus(i)

			let delYn = rowData.delYn;

			if (!gfn_isEmpty(delYn)) {

				let itemCd = rowData.itemCd;
				let fcltCd = rowData.fcltCd;
				let vrtyCd = rowData.vrtyCd;
				let wrhsSpmtType = rowData.wrhsSpmtType;
				let vhclno = rowData.vhclno;
				let wghYmd = rowData.wghYmd;
				let prdcrCd = rowData.prdcrCd;
				let actlWght = rowData.actlWght;
				let bxQntt = rowData.bxQntt;
				let pltQntt = rowData.pltQntt;

				if (gfn_isEmpty(fcltCd)) {
		    		gfn_comAlert("W0001", "계량대");		//	W0001	{0}을/를 선택하세요.
		            return;
		    	}
				if (gfn_isEmpty(itemCd)) {
		    		gfn_comAlert("W0001", "품목");		//	W0001	{0}을/를 선택하세요.
		            return;
		    	}

				if (gfn_isEmpty(vrtyCd)) {
		    		gfn_comAlert("W0001", "품종");		//	W0001	{0}을/를 선택하세요.
		            return;
		    	}

				if (gfn_isEmpty(wrhsSpmtType)) {
		    		gfn_comAlert("W0001", "입고출고유형");		//	W0001	{0}을/를 선택하세요.
		            return;
		    	}

				if (gfn_isEmpty(prdcrCd)) {
		    		gfn_comAlert("W0001", "생산자");		//	W0001	{0}을/를 선택하세요.
		            return;
		    	}

				if (gfn_isEmpty(wghYmd)) {
		    		gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 선택하세요.
		            return;
		    	}

				if (gfn_isEmpty(vhclno)) {
		    		gfn_comAlert("W0002", "차량번호");		//	W0002	{0}을/를 입력하세요.
		            return;
		    	}

				if (gfn_isEmpty(actlWght)) {
		    		gfn_comAlert("W0002", "실중량");		//	W0002	{0}을/를 입력하세요.
		            return;
		    	}

				if (gfn_isEmpty(bxQntt) || bxQntt == 0) {
		    		gfn_comAlert("W0002", "입고가구");		//	W0002	{0}을/를 입력하세요.
		            return;
		    	}

				if (gfn_isEmpty(pltQntt)) {
		    		gfn_comAlert("W0002", "입고팔레트");		//	W0002	{0}을/를 입력하세요.
		            return;
		    	}

				let addYn = rowData.addYn;
				if (addYn == "Y") {

					for (var j=1; j<=jsonApcGrd.length; j++) {
						let insertRow = grdWghPrfmnc.getRowData(i);
						let grdCdKey = "grdCd"+j
						let grdQnttKey = "grdQntt"+j

						let qntt = insertRow[grdQnttKey];
						if (!(gfn_isEmpty(qntt) || parseInt(qntt) == 0)) {

							insertRow.grdCd = jsonApcGrd[(j-1)].grdCd
							insertRow.bxQntt = insertRow[grdQnttKey];
							insertRow.rowSts = "I";
							insertRow.groupId = i;
							insertRow.wholWght = insertRow.actlWght;
							multiList.push(insertRow)
						} else {
							continue;
						}
					}
				} else if (addYn == "N") {

					if (stts == 2) {
						wghSnList.length = 0;
						for (var n=0; n<jsonApcGrd.length; n++) {

							let snRowData = grdWghPrfmnc.getRowData(i);
							let grdWghSnKey = "grdWghSn"+(n+1);
							let wghSn = snRowData[grdWghSnKey];

							if (!gfn_isEmpty(wghSn)) {
								wghSnList.push(wghSn)
							}
						}

						for (var k=1; k<=jsonApcGrd.length; k++) {
							let updateRow = grdWghPrfmnc.getRowData(i);
							updateRow.rowSts = "U";

							let grdCdKey = "grdCd"+k;
							let grdQnttKey = "grdQntt"+k;
							let grdWrhsnoKey = "grdWrhsno"+k;
							let grdWghSnKey = "grdWghSn"+k;

							let grdCd = rowData[grdCdKey];
							let bxQntt = rowData[grdQnttKey];
							let wrhsno = rowData[grdWrhsnoKey];
							let wghSn = rowData[grdWghSnKey];

							updateRow.grdCd = grdCd;
							updateRow.bxQntt = bxQntt;
							updateRow.wrhsno = wrhsno;
							updateRow.pltno = wrhsno;
							if (gfn_isEmpty(wghSn)) {
								updateRow.newYn = 'Y';
								let max = Math.max(...wghSnList);
								updateRow.wghSn = parseInt(max) + 1;
								wghSnList.push(parseInt(max) +1);
							} else {
								updateRow.wghSn = wghSn;
							}

							if (gfn_isEmpty(grdCd)) {
								updateRow.grdCd = jsonApcGrd[(k-1)].grdCd;
							}
							updateRow.wholWght = updateRow.actlWght;
							updateRow.groupId = i;

							if (!gfn_isEmpty(wghSn) || bxQntt > 0) {
								multiList.push(updateRow);
							} else {
								continue;
							}

						}
					}
				}
			}
		}

		if (gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
			const postJsonPromise = gfn_postJSON("/am/wgh/multiWghPrfmncList.do", multiList);
	    	const data = await postJsonPromise;

	    	try {
	    		if (_.isEqual("S", data.resultStatus)) {
	       			fn_search();
	       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
	        	} else {
	        		gfn_comAlert(data.resultCode, data.resultMessage);
	        	}
	        } catch (e) {
	        	if (!(e instanceof Error)) {
	    			e = new Error(e);
	    		}
	    		console.error("failed", e.message);
			}
		}
	}

	/**
     * @name fn_deleteWghPrfmnc
     * @description 계량실적 삭제
     */
	const fn_deleteWghPrfmnc = async function (wghPrfmncVO, nRow) {
		const deleteList = [];

		deleteList.push(wghPrfmncVO);


		const postJsonPromise = gfn_postJSON("/am/wgh/deleteWghPrfmncList.do", deleteList);
    	const data = await postJsonPromise;

    	try {
    		if (_.isEqual("S", data.resultStatus)) {
       			gfn_comAlert("I0001");					// I0001 처리 되었습니다.
       			jsonWghPrfmnc.splice(parseInt(nRow)-1, 1);
        		grdWghPrfmnc.refresh();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
        } catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
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
	const fn_clearForm = function(wghPrfmncVO, nRow) {

	}


    /**
     * @name fn_setGrdWghPrfmnc
     * @description 계량실적 조회
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGrdWghPrfmnc = async function() {

  		let wghYmd 			= SBUxMethod.get("srch-dtp-wghYmd");		// 계량일자
  		let itemCd 			= SBUxMethod.get("srch-slt-itemCd");		// 품목
  		let vrtyCd 			= SBUxMethod.get("srch-slt-vrtyCd");		// 품목
  		if (!gfn_isEmpty(vrtyCd)) {
  			vrtyCd = vrtyCd.substring(4,8);
  		}

  		let wrhsSpmtType 	= SBUxMethod.get("srch-slt-wrhsSpmtType");	// 입고출고유형
  		let fcltCd 			= SBUxMethod.get("srch-slt-fcltCd");		// 계량기구분
 		let prdcrCd 		= SBUxMethod.get("srch-inp-prdcrCd");		// 생산자
 		let url 			= "";

  		if (gfn_isEmpty(wrhsSpmtType)) {
    		gfn_comAlert("W0001", "구분");					//	W0001	{0}을/를 선택하세요.
            return;
    	}

 		if (wrhsSpmtType == "RT") {
 			url = "/am/wgh/selectWghRcptWrhsList.do"
 		}
 		if (wrhsSpmtType == "DT") {
 			url = "/am/wgh/selectWghRcptSpmtList.do"
 		}


		const postJsonPromise = gfn_postJSON(url, {
			apcCd			: gv_selectedApcCd
		  , wghYmd			: wghYmd
		  , itemCd 			: itemCd
		  , vrtyCd			: vrtyCd
		  , wrhsSpmtType 	: wrhsSpmtType
		  , fcltCd			: fcltCd
		  , prdcrCd			: prdcrCd
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
  					    apcCd			: item.apcCd
  					  , wghno			: item.wghno
  					  , wghSn			: item.wghSn
  					  , wghnoIndct		: item.wghnoIndct
  					  , wrhsno			: item.wrhsno
  					  , wghYmd			: item.wghYmd
  					  , vhclno			: item.vhclno
  					  , prdcrCd			: item.prdcrCd
  					  , itemCd			: item.itemCd
  					  , itemNm			: item.itemNm
  					  , vrtyCd			: item.vrtyCd
  					  , vrtyNm			: item.vrtyNm
  					  , wholWght		: item.wholWght
  					  , emptVhclWght	: item.emptVhclWght
  					  , rdcdRt			: item.rdcdRt
  					  , actlWght		: item.actlWght
  					  , rdcdWght		: item.rdcdWght
  					  , wrhsWght		: item.wrhsWght
  					  , rmrk			: item.rmrk
  					  , apcNm			: item.apcNm
  					  , prdcrNm			: item.prdcrNm
  					  , prdcrIdentno	: item.prdcrIdentno
  					  , grdCd			: item.grdCd
  					  , grdNm			: item.grdNm
  					  , pltWght			: item.pltWght
  					  , bxQntt			: item.bxQntt
  					  , bxWght			: item.bxWght
  					  , invntrWght		: item.invntrWght
  					  , warehouseSeCd	: item.warehouseSeCd
  					  , warehouseSeNm	: item.warehouseSeNm
  					  , gdsSeCd			: item.gdsSeCd
  					  , gdsSeNm			: item.gdsSeNm
  					  , wrhsSeCd		: item.wrhsSeCd
  					  , wrhsSeNm		: item.wrhsSeNm
  					  , trsprtSeCd		: item.trsprtSeCd
  					  , trsprtSeNm		: item.trsprtSeNm
  					  , stdGrd			: item.stdGrd
  					  , stdGrdCd		: item.stdGrdCd
  					  , fcltCd			: item.fcltCd
  					  , wrhsSpmtType 	: item.wrhsSpmtType
  					  , grdQntt1 		: item.grdQntt1
  					  , grdQntt2 		: item.grdQntt2
  					  , grdQntt3 		: item.grdQntt3
  					  , grdQntt4 		: item.grdQntt4
  					  , grdCd1 			: item.grdCd1
  					  , grdCd2 			: item.grdCd2
  					  , grdCd3 			: item.grdCd3
  					  , grdCd4 			: item.grdCd4
  					  , grdWrhsno1 		: item.grdWrhsno1
  					  , grdWrhsno2 		: item.grdWrhsno2
  					  , grdWrhsno3 		: item.grdWrhsno3
  					  , grdWrhsno4 		: item.grdWrhsno4
  					  , grdWghSn1 		: item.grdWghSn1
  					  , grdWghSn2 		: item.grdWghSn2
  					  , grdWghSn3 		: item.grdWghSn3
  					  , grdWghSn4 		: item.grdWghSn4
  					  , grdPltno1 		: item.grdPltno1
  					  , grdPltno2 		: item.grdPltno2
  					  , grdPltno3 		: item.grdPltno3
  					  , grdPltno4 		: item.grdPltno4
  					  , pltQntt 		: item.pltQntt
  					  , shpgotQntt 		: item.shpgotQntt
  	                  , shpgotWght 		: item.shpgotWght
  	                  , shpgotPltQntt 	: item.shpgotPltQntt
  	                  , oinstSpmtNm 	: item.oinstSpmtNm
  	                  , trsprtCst 		: item.trsprtCst
  	                  , oprtrNm 		: item.oprtrNm
  	                  , telno			: item.telno
  	                  , drvrNm			: item.drvrNm
  	                  , wrhsno			: item.wrhsno
  	                  , spmtno			: item.wrhsno
					  , addYn 			: 'N'
					  , delYn			: 'N'
  				}
  				jsonWghPrfmnc.push(wghPrfmnc);
  			});

          	if (jsonWghPrfmnc.length == 0) {
          		grdWghPrfmnc.clearTotal();
          		grdWghPrfmnc.refresh();
          		grdWghPrfmnc.addRow(true);
          	} else {

	          	grdWghPrfmnc.rebuild();
          	}

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
                        linkKnd: "R",
                        kndList: ["R"]
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