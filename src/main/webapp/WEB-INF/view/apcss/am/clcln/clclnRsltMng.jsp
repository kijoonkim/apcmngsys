<%
 /**
  * @Class Name : clclnRsltMng.jsp
  * @Description : 정산결과관리 화면
  * @author SI개발부
  * @since 2024.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2024.08.31   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별실적등록 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btn-reset"
						name="btn-reset"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="초기화"
						onclick="fn_reset"
					></sbux-button>
					<sbux-button
						id="btn-save"
						name="btn-save"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="기준저장"
						onclick="fn_save"
					></sbux-button>
					<sbux-button
						id="btn-search"
						name="btn-search"
						uitype="normal"
						class="btn btn-sm btn-outline-dark"
						onclick="fn_search"
						text="조회"
					></sbux-button>
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
							<th scope="row" class="th_bg">정산연도/차수</th>
			          		<td class="td_input" style="border-right: hidden;">
				              	<sbux-datepicker
				                	id="srch-dtp-clclnYr"
				                    name="srch-dtp-clclnYr"
				                    uitype="popup"
				                    date-format="yyyy"
				                    datepicker-mode="year"
				                    class="form-control input-sm input-sm-ast inpt_data_reqed"
				                    style="height: 28px"
				                    onchange="fn_getClclnSn"
				              	></sbux-datepicker>
			          		</td>
			          		<td class="td_input" style="border-right: hidden;">
			          			<sbux-select
									id="srch-slt-clclnSn"
									name="srch-slt-clclnSn"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonClclnSn"
									jsondata-text="cdVlNm"
									jsondata-value="cdVl"									
									onchange="fn_onChangeSrchClclnSn(this)"
								></sbux-select>
			          		</td>
			          		<td class="td_input">
			          		<th scope="row" class="th_bg">정산구분</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-clclnSeCd"
									name="srch-slt-clclnSeCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonClclnSeCd"
									jsondata-text="cdVlNm"
									jsondata-value="cdVl"									
									onchange="fn_search"
								></sbux-select>
							</td>
			          		<th scope="row" class="th_bg">정산분류</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="srch-slt-clclnClsf"
									name="srch-slt-clclnClsf"
									uitype="single"
									class="form-control input-sm"
									unselected-text="전체"
									jsondata-ref="jsonClclnClsf"
									jsondata-text="cdVlNm"
									jsondata-value="cdVl"
									onchange="fn_search"
								></sbux-select>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">생산자</th>
			          		<td class="td_input" style="border-right: hidden;">
				              	<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
									autocomplete-height="270px"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
   								<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
			          		</td>
			          		<td class="td_input" style="border-right: hidden;">
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
			          		<td colspan="8">
			          		</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li>
							<span>정산실적</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-clclnRslt">0</span>건)</span>
						</li>
					</ul>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdClclnRslt" style="height:208px;"></div>
				</div>

				<!--[pp] //검색결과 -->
			</div>
		</div>
	</section>

	<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    
	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
</body>
<script type="text/javascript">

	let crtrType;
	let crtrCd;
	let crtrIndctNm;

	const lv_paging = {
		'type' : 'page',
	  	'count' : 5,
	  	'size' : 50,
	  	'sorttype' : 'page',
	  	'showgoalpageui' : true
    };

	const _COL_PRFX_QNTT_		= "qntt__";
	const _COL_PRFX_WGHT_		= "wght__";
	const _COL_PRFX_AMT_		= "amt__";
	
	const _COL_PRFX_SEED_		= "seed__";
	const _COL_PRFX_WHRS_GRD_	= "wrhsGrd__";
	const _COL_PRFX_SORT_GRD_	= "sortGrd__";
	const _COL_PRFX_GDS_GRD_	= "gdsGrd__";
	
	const _COL_PRFX_DDC_AMT_		= "ddc__";
	const _COL_PRFX_DDC_AMT_DTL_	= "ddcDtl__";
	const _COL_PRFX_ADVNC_AMT_		= "advnc__";
	
	// crtrType
	const _CLCLN_CRTR_TYPE_			= "CLCLN_CRTR_TYPE";
	
	const _CLCLN_ARTCL_KND_			= "CLCLN_ARTCL_KND";	
	const _CLCLN_AMT_KND_ 			= "CLCLN_AMT_KND";
	const _CLCLN_UNTPRC_ELMT_ 		= "CLCLN_UNTPRC_ELMT";
	const _CLCLN_UNTPRC_KND_		= "CLCLN_UNTPRC_KND";
	const _CLCLN_AMT_KND_DTL_		= "CLCLN_AMT_KND_DTL";
	
	// 정산상세유형
	const _CLCLN_DTL_TYPE_			= "CLCLN_DTL_TYPE";

	const _CLCLN_DTL_TYPE__NONE_	= "NONE";
	const _CLCLN_DTL_TYPE__SN_		= "SN";
	const _CLCLN_DTL_TYPE__ITEM_CD_	= "ITEM_CD";
	const _CLCLN_DTL_TYPE__VRTY_CD_	= "VRTY_CD";
	const _CLCLN_DTL_TYPE__GRD_CD_	= "GRD_CD";
	const _CLCLN_DTL_TYPE__SEED_CD_	= "SEED_CD";
	
	// (항목종류) CLCLN_ARTCL_KND	기준코드
	const _CLCLN_SE_CD_				= "CLCLN_SE_CD";
	const _CLCLN_CLSF_				= "CLCLN_CLSF";
	const _CLCLN_ELMT_				= "CLCLN_ELMT";

	// (단가종류) CLCLN_UNTPRC_KND 기준코드
	const _UNTPRC_KND__SEED_		= "SEED";
	const _UNTPRC_KND__WRHS_GRD_ 	= "WRHS_GRD";
	const _UNTPRC_KND__SORT_GRD_ 	= "SORT_GRD";
	const _UNTPRC_KND__GDS_GRD_ 	= "GDS_GRD";

	// (금액종류) CLCLN_AMT_KND 기준코드
	const _AMT_KND__ASST_CST_		= "ASST_CST";	// 보조비용
	const _AMT_KND__GIVE_AMT_		= "GIVE_AMT";	// 지급금액
	const _AMT_KND__DDC_AMT_		= "DDC_AMT";	// 공제금액
	const _AMT_KND__ADVNC_AMT_		= "ADVNC_AMT";	// 선금금액
	

	// CLCLN_ELMT 상세
	const _CLCLN_ELMT__SE_CD_		= "SE_CD";
	const _CLCLN_ELMT__CLSF_		= "CLSF";
	const _CLCLN_ELMT__ITEM_		= "ITEM";
	const _CLCLN_ELMT__VRTY_		= "VRTY";
	const _CLCLN_ELMT__SEED_		= "SEED";
	

	let needsElmtSeCd	= false;
	let needsElmtClsf	= false;
	let needsElmtItem	= false;
	let needsElmtVrty	= false;
	let needsElmtSeed	= false;
	
	let needsUntprcSeed		= false;
	let needsUntprcWrhsGrd	= false;	
	let needsUntprcSortGrd	= false;
	let needsUntprcGdsGrd	= false;
	
	// 코드 json
	var jsonYn				= [
		{cdVl: "Y", cdVlNm: "확정"},
		{cdVl: "N", cdVlNm: "미확정"},
	];
	
	var jsonClclnSeCd		= [];	// 정산구분코드
	var jsonClclnClsf		= [];	// 정산분류
	var jsonClclnElmt		= [];	// 정산항목
	var jsonClclnAmtKnd		= [];	// 정산금액종류
	var jsonClclnUntprcKnd	= [];	// 정산단가종류
	var jsonUntprcUnit		= [];	// 단가단위
	
	var jsonAsstCst		= [];
	var jsonGiveAmt		= [];
	var jsonDdcAmt		= [];
	var jsonAdvncAmt	= [];
	
	
	var jsonWrhsGrd		= [];	// 입고등급 
	var jsonSortGrd		= [];	// 선별등급
	var jsonGdsGrd		= [];	// 상품등급

	var jsonItem		= [];	// 품목
	var jsonVrty		= [];	// 품종
	var jsonSeed		= [];	// 종자

	var jsonClclnCrtr		= [];	// 정산기준
	var jsonClclnCrtrDtl	= [];	// 정산기준 상세

	var jsonClclnAmtKndDtl	= [];	// 금액종류상세
	
    /* SBGrid */
	var grdClclnRslt;

    /* SBGrid Data (JSON) */
	var jsonClclnRslt = [];
    
    const jsonClclnRsltData = [];
    
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	})
    
	/**
	 * @name fn_init
	 * @description form init
	 */
	const fn_init = async function() {

		await fn_initSBSelect();
		
		fn_createGrid();
	}
	
	const fn_initSBSelect = async function() {

 		await fn_setCodeJson();
 		
		SBUxMethod.refresh("srch-slt-clclnSeCd");
		SBUxMethod.refresh("srch-slt-clclnClsf");
	}

 	/**
     * @name fn_setCodeJson
     * @description 화면 초기 호출
     * @function
     */
 	const fn_setCodeJson = async function() {
 		
 		// 코드정보 설정
		let result = await Promise.all([
			gfn_getComCdDtls("UNTPRC_UNIT"),
			gfn_getApcItem(gv_selectedApcCd),
			gfn_getApcVrty(gv_selectedApcCd),
			gfn_getApcSeed (gv_selectedApcCd),

			fn_getClclnCrtrDtl(),
		]);
		
		jsonUntprcUnit = result[0];
		jsonItem = result[1];
		jsonVrty = result[2];
		jsonSeed = result[3];

		fn_setJsonClclnCrtr();
 	}
	
 	/**
     * @name fn_setJsonClclnCrtr
     * @description 정산기준 JSON
     * @function
     */
	const fn_setJsonClclnCrtr = function() {
		
 		jsonClclnSeCd.length = 0;		//	정산구분코드
 		jsonClclnClsf.length = 0;		//	정산분류
 		jsonClclnElmt.length = 0; 		//	정산요소
 		jsonClclnUntprcKnd.length = 0;	//	정산단가종류
 		jsonClclnAmtKndDtl.length = 0;	//	정산금액상세
 		
 		jsonWrhsGrd.length = 0;
 		jsonSortGrd.length = 0;
 		jsonGdsGrd.length = 0;
 		
 		jsonAsstCst.length = 0;
 		jsonGiveAmt.length = 0;
 		jsonDdcAmt.length = 0;
 		jsonAdvncAmt.length = 0;
 		
 		
 		
 		jsonClclnCrtrDtl.forEach((item, index) => {
 			
 			if (
 	 			_.isEqual("Y", item.crtrUseYn)
 	 			&&
 	 			_.isEqual("Y", item.crtrDtlUseYn)) {
 				
 				item.cdVl	= item.dtlCd;
 		 		item.cdVlNm	= item.dtlIndctNm;
 		 		
 				// 정산기준 유형에 따라 json 생성
 				switch (item.clclnCrtrType) {
 					
 					// 정산항목종류
 					case _CLCLN_ARTCL_KND_:
 						
 						// 기준코드
 						switch (item.crtrCd) {
 							case _CLCLN_SE_CD_:
 								jsonClclnSeCd.push(item);
 								break;
 								
 							case _CLCLN_CLSF_:
 								jsonClclnClsf.push(item);
 								break;
 								
 							case _CLCLN_ELMT_:
 								jsonClclnElmt.push(item);
 								break;
 								
 							default:
 		 						break;
 						}
 						
 						break;
 					
 					case _CLCLN_UNTPRC_KND_:		// 정산할 단가종류
 						jsonClclnUntprcKnd.push(item);
 						// 기준코드
 						switch (item.crtrCd) {
 							case _UNTPRC_KND__WRHS_GRD_:
 								jsonWrhsGrd.push(item);
 								break;
 								
 							case _UNTPRC_KND__SORT_GRD_:
 								jsonSortGrd.push(item);
 								break;
 								jsonWrhsGrd
 							case _UNTPRC_KND__GDS_GRD_:
 								jsonGdsGrd.push(item);
 								break;
 								
 							default:
 		 						break;
 						}
 						
 						break;
 					
 					case _CLCLN_AMT_KND_:		// 금액종류
 						switch (item.crtrCd) {
 							case _AMT_KND__ASST_CST_:
 								jsonAsstCst.push(item);
								break;
 							case _AMT_KND__GIVE_AMT_:
 								jsonGiveAmt.push(item);
								break;
 							case _AMT_KND__DDC_AMT_:
 								jsonDdcAmt.push(item);
								break;
 							case _AMT_KND__ADVNC_AMT_:
 								jsonAdvncAmt.push(item);
								break;
 							default:
 		 						break; 						
 						}
 					
					case _CLCLN_AMT_KND_DTL_:
							jsonClclnAmtKndDtl.push(item);
						break;
						
 					default:
 						break;
 				}
 			}

		});
 		
		jsonClclnElmt.forEach((item, index) => {
    		
    		// 정산요소에 따라 항목 표시
    		switch (item.dtlCd) {
    			case _CLCLN_ELMT__SE_CD_:
    				needsElmtSeCd = true;
    				break;
    			case _CLCLN_ELMT__CLSF_:
    				needsElmtClsf = true;
    				break;
    			case _CLCLN_ELMT__ITEM_:
    				needsElmtItem = true;
    				break;
    			case _CLCLN_ELMT__VRTY_:
    				needsElmtVrty = true;
    				break;
    			case _CLCLN_ELMT__SEED_:
    				needsElmtSeed = true;
    				break;
    				
    			default:
    				break;
    		}
    	});
		
		needsUntprcWrhsGrd	= jsonWrhsGrd.length > 0;	
		needsUntprcSortGrd	= jsonSortGrd.length > 0;
		needsUntprcGdsGrd	= jsonGdsGrd.length > 0;
 		
 	}
 	
 	/**
     * @name fn_getClclnCrtrDtl
     * @description 정산기준 상세 조회
     * @function
     */
 	const fn_getClclnCrtrDtl = async function() {
 		
 		jsonClclnCrtrDtl.length = 0;

        try {

        	const postJsonPromise = gfn_postJSON(
        			"/am/clcln/selectClclnCrtrDtlList.do", 
        			{apcCd: gv_selectedApcCd},
        			null,
        			true
        	);

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				data.resultList.forEach((item, index) => {
  					jsonClclnCrtrDtl.push(item);
				});
	        	
        	} else {
        		console.log("crtr dtl errorCode", data.resultCode);
        		console.log("crtr dtl errorMessage", data.resultMessage);
        	}

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("crtr dtl failed", e.message);
		}
 	}
 	
 	
 	/**
     * @name fn_createGrid
     * @description 정산실적 그리드 생성
     * @function
     */
	const fn_createGrid = function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdClclnCrtr';
		SBGridProperties.id = 'grdClclnCrtr';
		SBGridProperties.jsonref = 'jsonClclnCrtr';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.explorerbar = 'sort';
		SBGridProperties.scrollbubbling = false;
		SBGridProperties.frozencols = 2;
	    SBGridProperties.oneclickedit = true;
		SBGridProperties.columns = [
      		{
        		caption: ['정산연도','정산연도'],
        		ref: 'clclnYr',
        		width: '60px',
        		type: 'output', 
        		style: 'text-align:center'
        	},
      		{
        		caption: ['차수','차수'],
        		ref: 'clclnSn',
        		width: '40px',
        		type: 'output', 
        		style: 'text-align:center'
        	},
		];
		
		// 정산구분 사용
    	if (needsElmtSeCd) {
    		SBGridProperties.columns.push({
        		caption: ['정산구분','정산구분'],
        		ref: 'clclnSeCd',
        		width: '120px',
        		type: 'combo',
        		typeinfo : {
        			ref:'jsonClclnSeCd', 
        			label:'cdVlNm', 
        			value:'cdVl', 
        			oneclickedit: true
        		}, 
        		style: 'text-align:center'
        	});
    	}
		
    	// 정산분류 사용
    	if (needsElmtClsf) {
    		SBGridProperties.columns.push({
				caption: ['정산분류','정산분류'],
        		ref: 'clclnClsf',
        		width: '120px',
        		type: 'combo',
        		typeinfo : {
        			ref:'jsonClclnClsf', 
        			label:'cdVlNm', 
        			value:'cdVl', 
        			oneclickedit: true
        		}, 
        		style: 'text-align:center'
        	});
    	}
		
    	// 정산품목 사용
    	if (needsElmtItem) {
    		SBGridProperties.columns.push({
				caption: ['품목','품목'],
        		ref: 'itemCd',
        		width: '120px',
        		type: 'combo',
        		typeinfo : {
        			ref:'jsonItem',
        			label:'itemNm', 
        			value:'itemCd', 
        			oneclickedit: true
        		}, 
        		style: 'text-align:center'
        	});
    	}
    	
    	// 정산품종 사용
    	if (needsElmtVrty) {
    		SBGridProperties.columns.push({
				caption: ['품종','품종'],
        		ref: 'itemVrtyCd',
        		width: '120px',
        		type: 'combo',
        		typeinfo : {
        			ref:'jsonVrty',
        			label:'vrtyNm', 
        			value:'itemVrtyCd', 
        			oneclickedit: true,
        			itemcount: 10,
        	        filtering: {
                		usemode: true,
                		uppercol: 'itemCd',
                		attrname: 'itemCd',
                		listall: true
                	}
        		}, 
        		style: 'text-align:center'
        	});
    	}
    	
    	SBGridProperties.columns.push([
   			{
            	caption: ['지역','지역'],
            	ref: 'frmhsCtpvNm',
            	width: '80px',
            	type: 'output', 
            	style: 'text-align:center'
			},
    		{
           		caption: ['농가명','농가명'],
           		ref: 'prdcrNm',
           		width: '80px',
           		type: 'output', 
           		style: 'text-align:center'
           	},
           	{
           		caption: ['주소','주소'],
           		ref: 'frmhsAddr',
           		width: '120px',
           		type: 'output', 
           		style: 'text-align:center'
           	},
           	{
           		caption: ['연락처','연락처'],
           		ref: 'frmhsTelno',
           		width: '120px',
           		type: 'output', 
           		style: 'text-align:center'
           	},
 		]);
 		
 		// 정산종자 사용
    	if (needsElmtSeed) {
    		
    		jsonSeed.forEach((item, index) => {    			
    			const colNm = _COL_PRFX_SEED_ + item.seedCd;
    			SBGridProperties.columns.push({
    				caption: ['종자', item.seedNm],
            		ref: colNm,
            		datatype: 'number',
      				type:'input',
      				width:'120px',
      				style: 'text-align:right;background-color:#FFF8DC',
      				userattr: {colNm: "seed", dtlCd: item.seedCd},
      				typeinfo: {
      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
      	                maxlength: 14,
      	                oneclickedit: true
                    },
					format : {type:'number', rule:'#,###'}
            	});
    		});
    	}

    	SBGridProperties.columns.push([
     		{
               	caption: ['계약면적','평'],
               	ref: 'ctrtArea',
               	width: '60px',
               	type: 'output', 
               	style: 'text-align:center'
   			},
   			{
               	caption: ['계약면적','평'],
               	ref: 'ctrtAreaPyng',
               	width: '60px',
               	type: 'output', 
               	style: 'text-align:center'
   			},
   			{
               	caption: ['정식면적<br>(평)','정식면적<br>(평)'],
               	ref: 'cltvtnSfcPyng',
               	width: '60px',
               	type: 'output', 
               	style: 'text-align:center'
   			},
		]);
 		
    	
		// 등급별 수량, 중량
		// 입고등급
    	if (needsUntprcWrhsGrd) {
    		
    		jsonWrhsGrd.forEach((item, index) => {    			
    			
    			const colNmQntt = _COL_PRFX_QNTT_ + _COL_PRFX_WHRS_GRD_ + item.dtlCd;
    			const colNmAmt = _COL_PRFX_AMT_ + _COL_PRFX_WHRS_GRD_ + item.dtlCd;
    			
    			SBGridProperties.columns.push([
    				{
	    				caption: [item.dtlIndctNm,"수량"],
	            		ref: colNmQntt,
	            		datatype: 'number',
	      				type:'input',
	      				width:'100px',
	      				style: 'text-align:right;background-color:#FFF8DC',
	      				userattr: {colNm: "wrhsGrdQntt", dtlCd: item.dtlCd},
	      				typeinfo: {
	      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	      	                maxlength: 14,
	      	                oneclickedit: true
	                    },
						format : {type:'number', rule:'#,###'}
            		},
            		{
	    				caption: [item.dtlIndctNm,"금액"],
	            		ref: colNmAmt,
	            		datatype: 'number',
	      				type:'input',
	      				width:'100px',
	      				style: 'text-align:right;background-color:#FFF8DC',
	      				userattr: {colNm: "wrhsGrdAmt", dtlCd: item.dtlCd},
	      				typeinfo: {
	      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	      	                maxlength: 14,
	      	                oneclickedit: true
	                    },
						format : {type:'number', rule:'#,###'}
            		},
    			]);
    		});
    	}
		
    	// 선별등급
    	if (needsUntprcSortGrd) {
    		
    		jsonSortGrd.forEach((item, index) => {    			
    			
    			const colNmQntt = _COL_PRFX_QNTT_ + _COL_PRFX_SORT_GRD_ + item.dtlCd;
    			const colNmAmt = _COL_PRFX_AMT_ + _COL_PRFX_SORT_GRD_ + item.dtlCd;
    			
    			SBGridProperties.columns.push([
    				{
	    				caption: [item.dtlIndctNm,"수량"],
	            		ref: colNmQntt,
	            		datatype: 'number',
	      				type:'input',
	      				width:'100px',
	      				style: 'text-align:right;background-color:#FFF8DC',
	      				userattr: {colNm: "sortGrdQntt", dtlCd: item.dtlCd},
	      				typeinfo: {
	      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	      	                maxlength: 14,
	      	                oneclickedit: true
	                    },
						format : {type:'number', rule:'#,###'}
            		},
            		{
	    				caption: [item.dtlIndctNm,"금액"],
	            		ref: colNmAmt,
	            		datatype: 'number',
	      				type:'input',
	      				width:'100px',
	      				style: 'text-align:right;background-color:#FFF8DC',
	      				userattr: {colNm: "sortGrdAmt", dtlCd: item.dtlCd},
	      				typeinfo: {
	      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	      	                maxlength: 14,
	      	                oneclickedit: true
	                    },
						format : {type:'number', rule:'#,###'}
            		},
    			]);
    		});
    	}
		
		// 상품등급
    	if (needsUntprcGdsGrd) {
    		
    		jsonGdsGrd.forEach((item, index) => {    			
    			
    			const colNmQntt = _COL_PRFX_QNTT_ + _COL_PRFX_GDS_GRD_ + item.dtlCd;
    			const colNmAmt = _COL_PRFX_AMT_ + _COL_PRFX_GDS_GRD_ + item.dtlCd;
    			
    			SBGridProperties.columns.push([
    				{
	    				caption: [item.dtlIndctNm,"수량"],
	            		ref: colNmQntt,
	            		datatype: 'number',
	      				type:'input',
	      				width:'100px',
	      				style: 'text-align:right;background-color:#FFF8DC',
	      				userattr: {colNm: "gdsGrdQntt", dtlCd: item.dtlCd},
	      				typeinfo: {
	      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	      	                maxlength: 14,
	      	                oneclickedit: true
	                    },
						format : {type:'number', rule:'#,###'}
            		},
            		{
	    				caption: [item.dtlIndctNm,"금액"],
	            		ref: colNmAmt,
	            		datatype: 'number',
	      				type:'input',
	      				width:'100px',
	      				style: 'text-align:right;background-color:#FFF8DC',
	      				userattr: {colNm: "gdsGrdAmt", dtlCd: item.dtlCd},
	      				typeinfo: {
	      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	      	                maxlength: 14,
	      	                oneclickedit: true
	                    },
						format : {type:'number', rule:'#,###'}
            		},
    			]);
    		});
    	}
		
    	SBGridProperties.columns.push([
     		{
               	caption: ['합계','수량'],
        		ref: 'clclnQntt',
        		datatype: 'number',
  				type:'input',
  				width:'100px',
  				style: 'text-align:right;',
  				userattr: {colNm: "clclnQntt"},
  				typeinfo: {
  	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
  	                maxlength: 14,
  	                oneclickedit: true
                },
				format : {type:'number', rule:'#,###'}
   			},
   			{
               	caption: ['합계','금액'],
        		ref: 'clclnAmt',
        		datatype: 'number',
  				type:'input',
  				width:'100px',
  				style: 'text-align:right;',
  				userattr: {colNm: "clclnAmt"},
  				typeinfo: {
  	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
  	                maxlength: 14,
  	                oneclickedit: true
                },
				format : {type:'number', rule:'#,###'}
   			},
		]);
    	
    	// 추가 지급금
    	SBGridProperties.columns.push([
     		{
               	caption: ['추가지급금','단가'],
        		ref: 'clclnQntt',
        		datatype: 'number',
  				type:'input',
  				width:'100px',
  				style: 'text-align:right;',
  				userattr: {colNm: "clclnQntt"},
  				typeinfo: {
  	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
  	                maxlength: 14,
  	                oneclickedit: true
                },
				format : {type:'number', rule:'#,###'}
   			},
   			{
               	caption: ['추가지급금','금액'],
        		ref: 'extraUntprc',
        		datatype: 'number',
  				type:'input',
  				width:'100px',
  				style: 'text-align:right;',
  				userattr: {colNm: "clclnAmt"},
  				typeinfo: {
  	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
  	                maxlength: 14,
  	                oneclickedit: true
                },
				format : {type:'number', rule:'#,###'}
   			},
   			{
               	caption: ['추가지급금','금액'],
        		ref: 'extraAmt',
        		datatype: 'number',
  				type:'input',
  				width:'100px',
  				style: 'text-align:right;',
  				userattr: {colNm: "clclnAmt"},
  				typeinfo: {
  	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
  	                maxlength: 14,
  	                oneclickedit: true
                },
				format : {type:'number', rule:'#,###'}
   			},
   			{
               	caption: ['농협수수료','농협수수료'],
        		ref: 'extraFee',
        		datatype: 'number',
  				type:'input',
  				width:'100px',
  				style: 'text-align:right;',
  				userattr: {colNm: "clclnAmt"},
  				typeinfo: {
  	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
  	                maxlength: 14,
  	                oneclickedit: true
                },
				format : {type:'number', rule:'#,###'}
   			},
		]);
		
    	// 공제내역
		jsonDdcAmt.forEach((item, index) => {			
			if (gfn_isEmpty(item.dtlCrtrCd)) {
				const colNm = _COL_PRFX_DDC_AMT_ + item.dtlCd;   			
	   			SBGridProperties.columns.push([
	   				{
	    				caption: ["공제내역",item.dtlIndctNm],
	            		ref: colNm,
	            		datatype: 'number',
	      				type:'input',
	      				width:'100px',
	      				style: 'text-align:right;background-color:#FFF8DC',
	      				userattr: {colNm: "ddcAmt", dtlCd: item.dtlCd},
	      				typeinfo: {
	      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	      	                maxlength: 14,
	      	                oneclickedit: true
	                    },
						format : {type:'number', rule:'#,###'}
	           		}
				]);
			} else {
				jsonClclnAmtKndDtl.forEach((dtl, index) => {
					const colNm = _COL_PRFX_DDC_AMT_DTL_ + item.dtlCd + dtl.dtlCd;
					SBGridProperties.columns.push([
		   				{
		    				caption: ["공제내역",dtl.dtlIndctNm],
		            		ref: colNm,
		            		datatype: 'number',
		      				type:'input',
		      				width:'100px',
		      				style: 'text-align:right;background-color:#FFF8DC',
		      				userattr: {colNm: "ddcDtlAmt", dtlCd: dtl.dtlCd},
		      				typeinfo: {
		      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
		      	                maxlength: 14,
		      	                oneclickedit: true
		                    },
							format : {type:'number', rule:'#,###'}
		           		}
					]);
				});
			}
		});
    	
    	// 선금
    	jsonAdvncAmt.forEach((item, index) => {			
			const colNm = _COL_PRFX_ADVNC_AMT_ + item.dtlCd;   			
   			SBGridProperties.columns.push([
   				{
    				caption: ["선급금",item.dtlIndctNm],
            		ref: colNm,
            		datatype: 'number',
      				type:'input',
      				width:'100px',
      				style: 'text-align:right;background-color:#FFF8DC',
      				userattr: {colNm: "advncAmt", dtlCd: item.dtlCd},
      				typeinfo: {
      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
      	                maxlength: 14,
      	                oneclickedit: true
                    },
					format : {type:'number', rule:'#,###'}
           		}
			]);
		});
    	
    	SBGridProperties.columns.push([
				{
				caption: ["최종지급금"],
        		ref: "giveAmt",
        		datatype: 'number',
  				type:'input',
  				width:'100px',
  				style: 'text-align:right;',
  				userattr: {colNm: "giveAmt"},
  				typeinfo: {
  	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
  	                maxlength: 14,
  	                oneclickedit: true
                },
				format : {type:'number', rule:'#,###'}
       		}
		]);
    	
		grdClclnRslt = _SBGrid.create(SBGridProperties);
		grdClclnRslt.bind('valuechanged' , fn_grdClclnRsltValueChanged);		
	}

	/**
	 * common button action
	 */

    /**
     * @name fn_search
     * @description 조회 버튼
     */
	const fn_search = async function() {
	    
		jsonClclnRslt.length = 0;
		grdClclnRslt.refresh();
		
		fn_setGrdClclnRslt();
	}

	
    /**
     * @name fn_save
     * @description 저장 버튼
     */
 	const fn_save = async function() {
    	await fn_insertClclnRslt();	
    }
     
    /**
     * @name fn_insertClclnRslt
     * @description 저장 버튼
     */
	const fn_insertClclnRslt = async function() {

    	const crtrList = [];
    	
		const allData = grdClclnCrtr.getGridDataAll();

    	for ( var i=1; i<=allData.length; i++ ){
			const rowData = grdClclnCrtr.getRowData(i);
			const rowSts = grdClclnCrtr.getRowStatus(i);
			
			if (!_.isEqual("N", rowData.delYn) || rowSts === 0 ) {
				continue;
			}
			
			if (gfn_isEmpty(rowData.clclnCrtrType)) {
				gfn_comAlert("W0005", "정산기준유형");		//	W0005	{0}이/가 없습니다.
				return;
			}
			
			if (gfn_isEmpty(rowData.crtrCd)) {
				gfn_comAlert("W0005", "기준코드");		//	W0005	{0}이/가 없습니다.
				return;
			}
			
			if (gfn_isEmpty(rowData.crtrIndctNm)) {
				gfn_comAlert("W0005", "기준표시명");		//	W0005	{0}이/가 없습니다.
				return;
			}
			
			if (gfn_isEmpty(rowData.clclnDtlType)) {
				gfn_comAlert("W0005", "상세유형");		//	W0005	{0}이/가 없습니다.
				return;
			}
			
			crtrList.push({
				clclnCrtrType: rowData.clclnCrtrType,
				crtrCd: rowData.crtrCd,
				crtrVl: rowData.crtrVl,
				crtrIndctNm: rowData.crtrIndctNm,
				indctSeq: rowData.indctSeq,
				clclnDtlType: rowData.clclnDtlType,
				crtrRmrk: rowData.crtrRmrk,
				useYn: rowData.useYn,
			});
    	}
    	
		if (crtrList.length == 0) {
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}
		
		const param = {
			apcCd: gv_selectedApcCd,
			clclnCrtrList: crtrList
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/clcln/insertClclnCrtr.do", param);
    		const data = await postJsonPromise;
    		
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

	}

    /**
     * @name fn_deleteCrtr
     * @description 정산기준 삭제
     */
	const fn_deleteCrtr = async function(_crtr) {

    	const crtrList = [{
    		clclnCrtrType: _crtr.clclnCrtrType,
			crtrCd: _crtr.crtrCd,
    	}];
    	
		const param = {
			apcCd: gv_selectedApcCd,
			clclnCrtrList: crtrList
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/clcln/deleteClclnCrtr.do", param);
    		const data = await postJsonPromise;
    		
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
        	
        } catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

	}
    
    
    
	const fn_delete = async function() {

	}
	

    /**
     * @name fn_setGrdClclnRslt
     * @description 정산결과 목록 조회
     * @function
     */
    const fn_setGrdClclnRslt = async function() {
    	
    	jsonClclnRslt.length = 0;
    	jsonClclnRsltData.length = 0;
    	
    	const clclnYr = SBUxMethod.get("srch-dtp-clclnYr");
    	const clclnSn = SBUxMethod.get("srch-slt-clclnSn");
    	const clclnSeCd = SBUxMethod.get("srch-slt-clclnSeCd");
    	const clclnClsf = SBUxMethod.get("srch-slt-clclnClsf");
    	const prdcrNm = SBUxMethod.get("srch-inp-prdcrNm");
    	const prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
    	
        try {
        	
        	const postJsonPromise = gfn_postJSON("/am/clcln/selectClclnRsltList.do", {
        		apcCd: gv_selectedApcCd,
        		clclnYr: clclnYr,
        		clclnSn: crtrCd,
        		clclnSeCd: clclnSeCd,
        		clclnClsf: clclnClsf,
        		prdcrNm: prdcrNm,
        		prdcrCd: prdcrCd,
      		});

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				data.resultList.forEach((item, index) => {
	        		jsonClclnRsltData.push(item);
				});
  				
  				// set grid data
  				
  				
  				let totalRecordCount = jsonClclnRslt.length;
  				grdClclnRslt.rebuild();
  	          	
	        	document.querySelector('#cnt-clclnRslt').innerText = totalRecordCount;
	        	
	        	
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }
	
    
    /**
     * @name fn_setGrdClclnCrtrDtl
     * @description 정산기준 상세 목록 조회
     * @function
     */
    const fn_setGrdClclnCrtrDtl = async function(_crtr) {
    	
    	let needsNewRow = false;
    	
    	jsonClclnCrtrDtl.length = 0;
 		
        try {
        	
        	const postJsonPromise = gfn_postJSON("/am/clcln/selectClclnCrtrDtlList.do", {
        		apcCd: gv_selectedApcCd,
        		clclnCrtrType: _crtr.clclnCrtrType,
        		crtrCd: _crtr.crtrCd,
      		});

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				if (data.resultList.length > 0) {
  					needsNewRow = true;
  				}
  				
  				data.resultList.forEach((item, index) => {
	        		item.delYn = "N";
	        		item.chkVl = "Y";
	        		if (!gfn_isEmpty(item.dtlSn)) {
	        			jsonClclnCrtrDtl.push(item);	
	        		}
				});

  	          	let totalRecordCount = jsonClclnCrtrDtl.length;
  	          	grdClclnCrtrDtl.rebuild();
  	          	
	        	document.querySelector('#cnt-clclnCrtrDtl').innerText = totalRecordCount;
	        	
	        	grdClclnCrtrDtl.setCellDisabled(
	        			0, 
	        			0, 
	        			grdClclnCrtrDtl.getRows() -1, 
	        			3, 
	        			true
	        		);
	        	grdClclnCrtrDtl.setCellDisabled(
		        		0, 
		        		4, 
		        		grdClclnCrtrDtl.getRows() -1, 
		        		grdClclnCrtrDtl.getCols() -1,
		        		false
	        		);
		        
	        	if (needsNewRow) {
	        		grdClclnCrtrDtl.addRow();
		        	grdClclnCrtrDtl.setCellDisabled(
		        			grdClclnCrtrDtl.getRows() -1, 
				        	0, 
				        	grdClclnCrtrDtl.getRows() -1, 
				        	grdClclnCrtrDtl.getCols() -1,
				        	true
			        	);
	        	}
	        	
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
    }
    
    const fn_grdClclnCrtrRowChanged = function() {
    	
    	const nRow = grdClclnCrtr.getRow();
    	
    	if (nRow < 1) {
    		return;
    	}
    	
    	const _crtr = grdClclnCrtr.getRowData(nRow);
    	
    	if (gfn_isEmpty(_crtr) || !_.isEqual("Y", _crtr["chkVl"])) {    		
    		jsonClclnCrtrDtl.length = 0;
    		grdClclnCrtrDtl.refresh();
    		document.querySelector('#cnt-clclnCrtrDtl').innerText = 0;
    		return;
    	}
    	
    	fn_setGrdClclnCrtrDtl(_crtr);    	
    }
    


	/**
	 * @name fn_addRow
	 * @description 행추가
	 * @param {number} nRow
	 */
	const fn_addRow = async function(nRow) {

		const editableRow = grdClclnCrtr.getRowData(nRow, false);	// call by reference(deep copy)
		editableRow.delYn = "N";
		
		grdClclnCrtr.rebuild();
		grdClclnCrtr.setCellDisabled(nRow, 2, nRow, grdClclnCrtr.getCols() - 1, false);
		nRow++;
		grdClclnCrtr.addRow(true);
		grdClclnCrtr.setCellDisabled(nRow, 0, nRow, grdClclnCrtr.getCols() - 1, true);
	}
	 
	/**
	 * @name fn_delRow
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRow = async function(_nRow) {
		
		const rowStatus = grdClclnCrtr.getRowStatus(_nRow);
			
		if (rowStatus == 0 || rowStatus == 2) {
			if (!gfn_comConfirm("Q0002", "등록기준", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}

			const _crtr = grdClclnCrtr.getRowData(_nRow);
			await fn_deleteCrtr(_crtr);

    	} else {
    		grdClclnCrtr.deleteRow(_nRow);
    	}
	}
	 
	/**
	 * @name fn_addRowDtl
	 * @description 행추가
	 * @param {number} nRow
	 */
	const fn_addRowDtl = async function(nRow) {

		const crtrRow = grdClclnCrtr.getRow();
		
		if (crtrRow < 1) {
			gfn_comAlert("W0001", "정산기준");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		
		const _crtr = grdClclnCrtr.getRowData(crtrRow);
		
		if (gfn_isEmpty(_crtr) || !_.isEqual("Y", _crtr["chkVl"])) {
			gfn_comAlert("W0020", "미등록");		//	W0020	{0} 상태의 {1} 입니다.
			return;
		} 
		 
		const editableRow = grdClclnCrtrDtl.getRowData(nRow, false);	// call by reference(deep copy)

		editableRow.clclnCrtrType = _crtr.clclnCrtrType;
		editableRow.clclnCrtrTypeNm = _crtr.clclnCrtrTypeNm;
		editableRow.crtrCd = _crtr.crtrCd;
		editableRow.crtrIndctNm = _crtr.crtrIndctNm;
		
		editableRow.delYn = "N";
		
		grdClclnCrtrDtl.rebuild();
		grdClclnCrtrDtl.setCellDisabled(nRow, 3, nRow, grdClclnCrtrDtl.getCols() - 1, false);
		
		nRow++;
		grdClclnCrtrDtl.addRow(true);
		grdClclnCrtrDtl.setCellDisabled(nRow, 0, nRow, grdClclnCrtrDtl.getCols() - 1, true);
	}
	 
	/**
	 * @name fn_delRowDtl
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRowDtl = async function(_nRow) {

		const rowStatus = grdClclnCrtrDtl.getRowStatus(_nRow);
			
		if (rowStatus == 0 || rowStatus == 2) {
			if (!gfn_comConfirm("Q0002", "등록기준상세", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}

			const _crtrDtl = grdClclnCrtrDtl.getRowData(_nRow);
			await fn_deleteCrtrDtl(_crtrDtl);

    	} else {
    		grdClclnCrtrDtl.deleteRow(_nRow);
    	}
		 
	}
	 
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>