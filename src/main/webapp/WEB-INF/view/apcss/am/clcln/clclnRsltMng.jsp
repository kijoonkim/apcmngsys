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
						id="btn-clclnReg"
						name="btn-clclnReg"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="정산실적생성"
						onclick="fn_clclnReg"
					></sbux-button>
					<sbux-button
						id="btn-save"
						name="btn-save"
						uitype="normal"
						class="btn btn-sm btn-outline-danger"
						text="저장"
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
					<div id="sb-area-grdClclnRslt" style="height:500px;"></div>
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

	const _COL_PRFX_UNTPRC_		= "ClclnUntprc";
	const _COL_PRFX_QNTT_		= "ClclnQntt";
	const _COL_PRFX_WGHT_		= "ClclnWght";
	const _COL_PRFX_AMT_		= "ClclnAmt";
	
	const _COL_PRFX_SEED_		= "seed";
	const _COL_PRFX_WHRS_GRD_	= "wrhs";
	const _COL_PRFX_SORT_GRD_	= "sort";
	const _COL_PRFX_GDS_GRD_	= "gds";
	
	const _COL_PRFX_ACML_FUND_	= "acmlFund";
	
	const arrCtrtAmtKnd = [
		{property: "ctrtSdPymt", column: "SD_PYMT"},
		{property: "ctrtCash", column: "CASH"},
	];
	
	const arrAdvncAmtKnd = [
		{property: "advncPrvpyAmt", column: "PRVPY_AMT"},
		{property: "advncSdPymt", column: "SD_PYMT"},
	];
	
	const arrDdcAmtKnd = [
		{property: "ddcSdPymt", column: "SD_PYMT"},
		{property: "ddcCtrtAmt", column: "CTRT_AMT"},
		{property: "ddcMtrlPymt", column: "MTRL_PYMT"},
		{property: "ddcAcmlFund", column: "ACML_FUND"},
		{property: "ddcTrsprtCst", column: "TRSPRT_CST"},
		{property: "ddcJobCst", column: "JOB_CST"},
		{property: "ddcRntlCrg", column: "RNTL_CRG"},
		{property: "ddcVlntrlEndw", column: "VLNTRL_ENDW"},
		{property: "ddcNRtnDdc", column: "N_RTN_DDC"},
		{property: "ddcPrtpay", column: "PRTPAY"},
	];
	
	const _COL_PRFX_DDC_AMT_		= "ddc__";
	const _COL_PRFX_ADVNC_AMT_		= "advnc__";
	
	// crtrType
	const _CLCLN_CRTR_TYPE_			= "CLCLN_CRTR_TYPE";
	
	const _CLCLN_ARTCL_KND_			= "CLCLN_ARTCL_KND";	
	const _CLCLN_AMT_KND_ 			= "CLCLN_AMT_KND";
	const _CLCLN_UNTPRC_ELMT_ 		= "CLCLN_UNTPRC_ELMT";
	const _CLCLN_UNTPRC_KND_		= "CLCLN_UNTPRC_KND";
	const _CLCLN_AMT_KND_DTL_		= "CLCLN_AMT_KND_DTL";
	const _CLCLN_RSLT_KND_			= "CLCLN_RSLT_KND";	
	
	const _RSLT_KND__SEED_			= "SEED";
	const _RSLT_KND__WRHS_			= "WRHS";
	const _RSLT_KND__SORT_			= "SORT";
	const _RSLT_KND__GDS_			= "GDS";
	const _RSLT_KND__ALL_			= "RSLT_ALL";
	
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
	const _AMT_KND__CTRT_AMT_		= "CTRT_AMT";	// 계약금액
	const _AMT_KND__ADVNC_AMT_		= "ADVNC_AMT";	// 선금금액
	const _AMT_KND__ACML_FUND_		= "ACML_FUND";	// 적자금
	const _AMT_KND__EXTRA_AMT_		= "EXTRA_AMT";	// 추가지급금
	const _AMT_KND__FEE_AMT_		= "FEE_AMT";	// 적자금
	
	const _AMT_KND__CTRT_AMT_SUM_	= "CTRT_AMT_SUM";
	
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
	
	let needsExtraAmt	= false;
	let needsFeeAmt		= false;
	
	var jsonClclnSn		= [];	// 차수
	
    var jsonPrdcr				= [];
    var jsonPrdcrAutocomplete 	= [];
    
	
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
	var jsonCtrtAmt		= [];
	var jsonAcmlFund	= [];
	
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

		SBUxMethod.openProgress(gv_loadingOptions);
		
		SBUxMethod.set("srch-dtp-clclnYr", gfn_dateToYear(new Date()));
		
		await fn_initSBSelect();
		
		fn_createGrid();
		
		SBUxMethod.closeProgress(gv_loadingOptions);
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
			//gfn_getApcSeed(gv_selectedApcCd),

			fn_getClclnCrtrDtl(),
			fn_getClclnSn(),
			fn_getPrdcrs(),
		]);
		
		jsonUntprcUnit = result[0];
		jsonItem = result[1];
		jsonVrty = result[2];
		//jsonSeed = result[3];

		fn_setJsonClclnCrtr();
 	}
	
	/**
     * @name fn_getClclnSn
     * @description 정산차수 조회
     * @function
	 **/
	const fn_getClclnSn = async function() {
		
		jsonClclnSn.length = 0;

		const clclnYr = SBUxMethod.get("srch-dtp-clclnYr");
		
		try {
        	const postJsonPromise = gfn_postJSON(
        			"/am/clcln/selectClclnUntprcMstrList.do", 
        			{
        				apcCd: gv_selectedApcCd, clclnYr: clclnYr
        			},
        			null,
        			true
        	);

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				const list = [...data.resultList].reverse();
  				
  				list.forEach((item, index) => {
  					item.cdVl = "" + item.clclnSn;
  					item.cdVlNm = "" + item.clclnSn + "차";
  					jsonClclnSn.push(item);
				});
  					        	
        	} else {
        		console.log("clclnSn errorCode", data.resultCode);
        		console.log("clclnSn errorMessage", data.resultMessage);
        	}

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("clclnSn failed", e.message);
		}
		
		SBUxMethod.refresh("srch-slt-clclnSn");
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
 		jsonSeed.length = 0;
 		
 		jsonAsstCst.length = 0;
 		jsonGiveAmt.length = 0;
 		jsonDdcAmt.length = 0;
 		jsonAdvncAmt.length = 0;
 		jsonCtrtAmt.length = 0;
 		jsonAcmlFund.length = 0;
 		
 		jsonClclnCrtrDtl.forEach((item, index) => {

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
							
						case _UNTPRC_KND__GDS_GRD_:
							jsonGdsGrd.push(item);
							break;
							
						case _UNTPRC_KND__SEED_:
							jsonSeed.push(item);
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
						
						case _AMT_KND__CTRT_AMT_:
							jsonCtrtAmt.push(item);
							break;
							
						case _AMT_KND__ACML_FUND_:
							jsonAcmlFund.push(item);
							break;
						
							
						case _AMT_KND__EXTRA_AMT_:
							needsExtraAmt = true;
							break;
						case _AMT_KND__FEE_AMT_:
							needsFeeAmt = true;
							break;
							
						default:
	 						break;
					}
				
				default:
					break;
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
		needsUntprcSeed		= jsonSeed.length > 0;
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
        			"/am/clcln/selectCrtrDtlListInUse.do", 
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
		SBGridProperties.parentid = 'sb-area-grdClclnRslt';
		SBGridProperties.id = 'grdClclnRslt';
		SBGridProperties.jsonref = 'jsonClclnRslt';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.allowcopy = true;
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.explorerbar = 'sort';
		SBGridProperties.scrollbubbling = false;
		SBGridProperties.frozencols = 2;
	    //SBGridProperties.oneclickedit = true;
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
        		ref: 'clclnSeNm',
        		width: '120px',
        		type: 'output',
        		style: 'text-align:center'
        	});
    	}
		
    	// 정산분류 사용
    	if (needsElmtClsf) {
    		SBGridProperties.columns.push({
				caption: ['정산분류','정산분류'],
        		ref: 'clclnClsfNm',
        		width: '120px',
        		type: 'output',
        		style: 'text-align:center'
        	});
    	}
		
    	// 정산품목 사용
    	if (needsElmtItem) {
    		SBGridProperties.columns.push({
				caption: ['품목','품목'],
        		ref: 'itemNm',
        		width: '120px',
        		type: 'output',
        		style: 'text-align:center'
        	});
    	}
    	
    	// 정산품종 사용
    	if (needsElmtVrty) {
    		SBGridProperties.columns.push({
				caption: ['품종','품종'],
        		ref: 'vrtyNm',
        		width: '120px',
        		type: 'output',
        		style: 'text-align:center'
        	});
    	}
    	
    	SBGridProperties.columns.push(
   			{
            	caption: ['지역','지역'],
            	ref: 'frmhsCtpv',
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
           		ref: 'telno',
           		width: '120px',
           		type: 'output', 
           		style: 'text-align:center'
           	},
 		);
 		
 		// 정산종자 사용
    	if (needsUntprcSeed) {    		
    		jsonSeed.forEach((item, index) => {    			
    			const colNm = _COL_PRFX_SEED_ + _COL_PRFX_QNTT_ + (index+1);
    			const colNmAmt = _COL_PRFX_SEED_ + _COL_PRFX_AMT_ + (index+1);
    			const colNmUntprc = _COL_PRFX_SEED_ + _COL_PRFX_UNTPRC_ + (index+1);
    			
    			SBGridProperties.columns.push({
    				caption: ['품종', item.dtlIndctNm],
            		ref: colNm,
            		datatype: 'number',
      				type:'input',
      				width:'80px',
      				style: 'text-align:right;background-color:#FFF8DC',
      				userattr: {
      					colType: _RSLT_KND__SEED_, 
      					colNm: colNm,
      					colNmUntprc: colNmUntprc,
      					colNmAmt: colNmAmt,
      					dtlCd: item.dtlCd
      				},
      				typeinfo: {
      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
      	                maxlength: 14,
      	                oneclickedit: true
                    },
					format : {type:'number', rule:'#,###'}
            	});
    		});
    	}

    	SBGridProperties.columns.push(
     		{
               	caption: ['계약면적','평'],
               	ref: 'ctrtArea',
               	width: '60px',
               	type: 'output', 
               	format : {type:'number', rule:'#,###'},
               	style: 'text-align:center'
   			},
   			{
               	caption: ['계약면적','㎡'],
               	ref: 'ctrtAreaM',
               	width: '60px',
               	type: 'output', 
               	format : {type:'number', rule:'#,###'},
               	style: 'text-align:center'
   			},
   			{
               	caption: ['정식면적<br>(평)','정식면적<br>(평)'],
               	ref: 'plntngArea',
               	width: '60px',
               	type: 'output', 
               	format : {type:'number', rule:'#,###'},
               	style: 'text-align:center'
   			},
		);
 		
    	
		// 등급별 수량, 중량
		// 입고등급
    	if (needsUntprcWrhsGrd) {
    		
    		jsonWrhsGrd.forEach((item, index) => {    			

    			const colNmQntt = _COL_PRFX_WHRS_GRD_ + _COL_PRFX_QNTT_ + (index+1);
    			const colNmAmt = _COL_PRFX_WHRS_GRD_ + _COL_PRFX_AMT_ + (index+1);
    			const colNmUntprc = _COL_PRFX_WHRS_GRD_ + _COL_PRFX_UNTPRC_ + (index+1);
    			SBGridProperties.columns.push(
    				{
	    				caption: [item.dtlIndctNm,"수량"],
	            		ref: colNmQntt,
	            		datatype: 'number',
	      				type:'input',
	      				width:'80px',
	      				style: 'text-align:right;background-color:#FFF8DC',
	      				userattr: {
	      					colType: _RSLT_KND__WRHS_,
	      					colNm: colNmQntt,
	      					colNmUntprc: colNmUntprc,
	      	                colNmAmt: colNmAmt,
	      					dtlCd: item.dtlCd,
	      					prcs: "C",
	      				},
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
	      				userattr: {
	      					colType: _RSLT_KND__WRHS_, 
	      					colNm: colNmAmt, 
	      					dtlCd: item.dtlCd
	      				},
	      				typeinfo: {
	      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	      	                maxlength: 14,
	      	                oneclickedit: true
	                    },
						format : {type:'number', rule:'#,###'}
            		},
    			);
    		});
    	}
		
    	// 선별등급
    	if (needsUntprcSortGrd) {
    		
    		jsonSortGrd.forEach((item, index) => {    			
    			
    			const colNmQntt = _COL_PRFX_SORT_GRD_ + _COL_PRFX_QNTT_ + (index+1);
    			const colNmAmt = _COL_PRFX_SORT_GRD_ + _COL_PRFX_AMT_ + (index+1);
    			const colNmUntprc = _COL_PRFX_SORT_GRD_ + _COL_PRFX_UNTPRC_ + (index+1);
    			
    			SBGridProperties.columns.push(
    				{
	    				caption: [item.dtlIndctNm,"수량"],
	            		ref: colNmQntt,
	            		datatype: 'number',
	      				type:'input',
	      				width:'80px',
	      				style: 'text-align:right;background-color:#FFF8DC',
	      				userattr: {
	      					colType: _RSLT_KND__SORT_, 
	      					colNm: colNmQntt,
	      					colNmUntprc: colNmUntprc,
	      	                colNmAmt: colNmAmt,
	      					dtlCd: item.dtlCd,
	      					prcs: "C",
	      				},
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
	      				userattr: {
	      					colType: _RSLT_KND__SORT_, 
	      					colNm: colNmAmt, 
	      					dtlCd: item.dtlCd
	      				},
	      				typeinfo: {
	      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	      	                maxlength: 14,
	      	                oneclickedit: true
	                    },
						format : {type:'number', rule:'#,###'}
            		},
    			);
    		});
    	}
		
		// 상품등급
    	if (needsUntprcGdsGrd) {
    		
    		jsonGdsGrd.forEach((item, index) => {    			
    			
    			const colNmQntt = _COL_PRFX_GDS_GRD_ + _COL_PRFX_QNTT_ + (index+1);
    			const colNmAmt = _COL_PRFX_GDS_GRD_ + _COL_PRFX_AMT_ + (index+1);
    			const colNmUntprc = _COL_PRFX_GDS_GRD_ + _COL_PRFX_UNTPRC_ + (index+1);
    			
    			SBGridProperties.columns.push(
    				{
	    				caption: [item.dtlIndctNm,"수량"],
	            		ref: colNmQntt,
	            		datatype: 'number',
	      				type:'input',
	      				width:'80px',
	      				style: 'text-align:right;background-color:#FFF8DC',
	      				userattr: {
	      					colType: _RSLT_KND__GDS_, 
	      					colNm: colNmQntt, 
	      					colNmUntprc: colNmUntprc,
	      	                colNmAmt: colNmAmt,
	      					dtlCd: item.dtlCd,
	      					prcs: "C",
	      				},
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
	      				userattr: {
	      					colType: _RSLT_KND__GDS_, 
	      					colNm: colNmAmt, 
	      					dtlCd: item.dtlCd
	      				},
	      				typeinfo: {
	      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	      	                maxlength: 14,
	      	                oneclickedit: true
	                    },
						format : {type:'number', rule:'#,###'}
            		},
    			);
    		});
    	}
		
    	SBGridProperties.columns.push(
     		{
               	caption: ['합계','수량'],
        		ref: 'clclnQntt',
        		datatype: 'number',
  				type:'input',
  				width:'100px',
  				style: 'text-align:right;',
  				userattr: {
  					colType: _RSLT_KND__ALL_, 
  					colNm: "clclnQntt", 
  					dtlCd: ""
  				},
  				typeinfo: {
  	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
  	                maxlength: 14,
  	                //oneclickedit: true
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
  				userattr: {
  					colType: _RSLT_KND__ALL_, 
  					colNm: "clclnAmt", 
  					dtlCd: ""
  				},
  				typeinfo: {
  	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
  	                maxlength: 14,
  	                //oneclickedit: true
                },
				format : {type:'number', rule:'#,###'}
   			},
		);
    	
    	// 추가 지급금
    	if (needsExtraAmt) {
    		SBGridProperties.columns.push(
	     		{
	               	caption: ['추가지급금','단가'],
	        		ref: 'extraUntprc',
	        		datatype: 'number',
	  				type:'input',
	  				width:'100px',
	  				style: 'text-align:right;',
	  				userattr: {
	  					colType: _AMT_KND__EXTRA_AMT_, 
	  					colNm: "extraUntprc", 
	  					dtlCd: ""
	  				},
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
	  				userattr: {
	  					colType: _AMT_KND__EXTRA_AMT_, 
	  					colNm: "extraAmt", 
	  					dtlCd: ""
	  				},
	  				typeinfo: {
	  	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	  	                maxlength: 14,
	  	                oneclickedit: true
	                },
					format : {type:'number', rule:'#,###'}
	   			},
			);
    	}
    	
    	// 수수료
    	if (needsFeeAmt) {
    		SBGridProperties.columns.push(
   	   			{
   	               	caption: ['농협수수료','농협수수료'],
   	        		ref: 'feeAmt',
   	        		datatype: 'number',
   	  				type:'input',
   	  				width:'100px',
   	  				style: 'text-align:right;',
   	  				userattr: {
   	  					colType: _AMT_KND__FEE_AMT_, 
   	  					colNm: "feeAmt", 
   	  					dtlCd: ""
   	  				},
   	  				typeinfo: {
   	  	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
   	  	                maxlength: 14,
   	  	                oneclickedit: true
   	                },
   					format : {type:'number', rule:'#,###'}
   	   			},
   			);
    	}
    	
    	// 계약금
    	jsonCtrtAmt.forEach((item, index) => {
    		const ctrt = _.find(arrCtrtAmtKnd, {column: item.dtlCd});
			const colNm = ctrt.property;
			
   			SBGridProperties.columns.push(
   				{
    				caption: ["계약금",item.dtlIndctNm],
            		ref: colNm,
            		datatype: 'number',
      				type:'input',
      				width:'100px',
      				style: 'text-align:right;background-color:#FFF8DC',
      				userattr: {
      					colType: _AMT_KND__CTRT_AMT_, 
      					colNm: colNm,
      					colNmAmt: "ctrtAmt",
      					dtlCd: item.dtlCd,
      					prcs: "S",
      				},
      				typeinfo: {
      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
      	                maxlength: 14,
      	                oneclickedit: true
                    },
					format : {type:'number', rule:'#,###'}
           		}
			);
    	});
    	
    	if (jsonCtrtAmt.length > 1) {
    		SBGridProperties.columns.push(
      			{
       				caption: ["계약금","합계"],
               		ref: "ctrtAmt",
               		datatype: 'number',
         				type:'input',
         				width:'100px',
         				style: 'text-align:right;background-color:#FFF8DC',
         				userattr: {
         					colType: _AMT_KND__CTRT_AMT_SUM_, 
         					colNm: "ctrtAmt", 
         					dtlCd: ""
         				},
         				typeinfo: {
         	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
         	                maxlength: 14,
         	                //oneclickedit: true
                       },
   					format : {type:'number', rule:'#,###'}
              	}
   			);
    	}
    	
    	// 적자금
    	jsonAcmlFund.forEach((item, index) => {
    		const colNm = _COL_PRFX_ACML_FUND_ + (index+1);
    		SBGridProperties.columns.push(
      			{
       				caption: ["적자금", item.dtlIndctNm],
               		ref: colNm,
               		datatype: 'number',
         				type:'input',
         				width:'100px',
         				style: 'text-align:right;background-color:#FFF8DC',
         				userattr: {
         					colType: _AMT_KND__ACML_FUND_, 
         					colNm: colNm, 
         					dtlCd: item.dtlCd
         				},
         				typeinfo: {
         	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
         	                maxlength: 14,
         	                oneclickedit: true
                       },
   					format : {type:'number', rule:'#,###'}
              	}
   			);
    	});
    	
    	// 공제내역
		jsonDdcAmt.forEach((item, index) => {
			
			const ddc = _.find(arrDdcAmtKnd, {column: item.dtlCd});
			const colNm = ddc.property;
			
   			SBGridProperties.columns.push(
   				{
    				caption: ["공제내역", item.dtlIndctNm],
            		ref: colNm,
            		datatype: 'number',
      				type:'input',
      				width:'100px',
      				style: 'text-align:right;background-color:#FFF8DC',
      				userattr: {
      					colType: _AMT_KND__DDC_AMT_, 
      					colNm: colNm, 
      					dtlCd: item.dtlCd
      				},
      				typeinfo: {
      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
      	                maxlength: 14,
      	                oneclickedit: true
                    },
					format : {type:'number', rule:'#,###'}
           		}
			);
		});
    	
    	// 선금
    	jsonAdvncAmt.forEach((item, index) => {
    		
			const advnc = _.find(arrAdvncAmtKnd, {column: item.dtlCd});
			const colNm = advnc.property;
			
   			SBGridProperties.columns.push(
   				{
    				caption: ["선급금",item.dtlIndctNm],
            		ref: colNm,
            		datatype: 'number',
      				type:'input',
      				width:'100px',
      				style: 'text-align:right;background-color:#FFF8DC',
      				userattr: {
      					colType: _AMT_KND__ADVNC_AMT_, 
      					colNm: colNm, 
      					dtlCd: item.dtlCd
      				},
      				typeinfo: {
      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
      	                maxlength: 14,
      	                oneclickedit: true
                    },
					format : {type:'number', rule:'#,###'}
           		}
			);
		});
    	
    	SBGridProperties.columns.push(
			{
				caption: ["최종지급금","최종지급금"],
        		ref: "giveAmt",
        		datatype: 'number',
  				type:'input',
  				width:'100px',
  				style: 'text-align:right;',
  				userattr: {
  					colType: _AMT_KND__GIVE_AMT_, 
  					colNm: "giveAmt", 
  					dtlCd: ""
  				},
  				typeinfo: {
  	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
  	                maxlength: 14,
  	                //oneclickedit: true
                },
				format : {type:'number', rule:'#,###'}
       		}
		);
    	
    	//console.log("columns");
    	console.log(SBGridProperties.columns);
    	
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
	    
		//jsonClclnRslt.length = 0;
		//grdClclnRslt.refresh();
		
		fn_setGrdClclnRslt();
	}

	
	const fn_clclnReg = async function() {
		
		const clclnYr = SBUxMethod.get("srch-dtp-clclnYr");
    	const clclnSn = SBUxMethod.get("srch-slt-clclnSn");
    	
    	if (!gfn_comConfirm("Q0001", clclnYr + "년 " + clclnSn + "차 정산실적 생성")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
    	
        try {
        	const postJsonPromise = gfn_postJSON("/am/clcln/insertClclnRsltReg.do", {
        		apcCd: gv_selectedApcCd,
        		clclnYr: clclnYr,
        		clclnSn: clclnSn
      		});

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
        		
  				gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		
  				await fn_search();
  				
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

    	const clclnRsltList = [];
    	
		const allData = grdClclnRslt.getGridDataAll();
		
    	for ( var i=2; i<=allData.length+1; i++ ){
			const rowData = grdClclnRslt.getRowData(i);
			const rowSts = grdClclnRslt.getRowStatus(i);
			
			const isUpdatedYn = rowData.isUpdatedYn;
			
			console.log("isUpdatedYn", isUpdatedYn)
			
			if (rowSts === 0 && !_.isEqual(isUpdatedYn, "Y")) {
				continue;
			}
			
			
			
			const clclnRsltDtlList = [];
			
			let seedClclnAmt = 0;
			let wrhsClclnAmt = 0;
			let sortClclnAmt = 0;
			let gdsClclnAmt = 0;
			let extraUntprc = 0;
			let extraAmt = 0;
			let feeAmt = 0;
			let ctrtAmt = 0;
			let acmlFund = 0;
			let ddcAmt = 0;
			let advncAmt = 0;
			let giveAmt = 0;

			// 항목별 분기
			
			// 종자			**************************************************
			// jsonSeed.dtlCd
			// 종자 수량 seed seedClclnQntt, seedClclnAmt
			// 1 ~ 10
			if (needsUntprcSeed) {
				jsonSeed.forEach((item, index) => {
					const colUntprc = _COL_PRFX_SEED_ + _COL_PRFX_UNTPRC_ + (index+1);
					const colQntt = _COL_PRFX_SEED_ + _COL_PRFX_QNTT_ + (index+1);
					
					const untprc = rowData[colUntprc];
					const qntt = rowData[colQntt];
					const amt = qntt * untprc;
					
					if (qntt > 0) {
						
						clclnRsltDtlList.push({
							clclnCrtrType: _CLCLN_RSLT_KND_,
							crtrCd: _RSLT_KND__SEED_,
							dtlCd: item.dtlCd,
							clclnQntt: qntt,
							clclnAmt: amt,
							elmtQntt: "Y",
							elmtAmt: "Y"
						});
						
						seedClclnAmt += amt || 0;
					}
				});
			}
			
			// 등급수량		**************************************************
			// 등급수량 - 입고
			if (needsUntprcWrhsGrd) {
				jsonWrhsGrd.forEach((item, index) => {
					const colUntprc = _COL_PRFX_WHRS_GRD_ + _COL_PRFX_UNTPRC_ + (index+1);
					const colQntt = _COL_PRFX_WHRS_GRD_ + _COL_PRFX_QNTT_ + (index+1);
					
					const untprc = rowData[colUntprc];
					const qntt = rowData[colQntt];
					const amt = qntt * untprc;
					
					if (qntt > 0) {
						clclnRsltDtlList.push({
							clclnCrtrType: _CLCLN_RSLT_KND_,
							crtrCd: _RSLT_KND__WRHS_,
							dtlCd: item.dtlCd,
							clclnQntt: qntt,
							clclnAmt: amt,
							elmtQntt: "Y",
							elmtAmt: "Y"
						});
						
						wrhsClclnAmt += amt || 0;
					}
				});
			}
			
			// 등급수량 - 선별
			if (needsUntprcSortGrd) {
				jsonSortGrd.forEach((item, index) => {
					const colUntprc = _COL_PRFX_SORT_GRD_ + _COL_PRFX_UNTPRC_ + (index+1);
					const colQntt = _COL_PRFX_SORT_GRD_ + _COL_PRFX_QNTT_ + (index+1);
					
					const untprc = rowData[colUntprc];
					const qntt = rowData[colQntt];
					const amt = qntt * untprc;
					
					if (qntt > 0) {
						clclnRsltDtlList.push({
							clclnCrtrType: _CLCLN_RSLT_KND_,
							crtrCd: _RSLT_KND__SORT_,
							dtlCd: item.dtlCd,
							clclnQntt: qntt,
							clclnAmt: amt,
							elmtQntt: "Y",
							elmtAmt: "Y"
						});
						
						sortClclnAmt += amt || 0;
					}
				});
			}
			
			// 등급수량 - 상품
			if (needsUntprcGdsGrd) {
				jsonGdsGrd.forEach((item, index) => {
					const colUntprc = _COL_PRFX_GDS_GRD_ + _COL_PRFX_UNTPRC_ + (index+1);
					const colQntt = _COL_PRFX_GDS_GRD_ + _COL_PRFX_QNTT_ + (index+1);
					
					const untprc = rowData[colUntprc];
					const qntt = rowData[colQntt];
					const amt = qntt * untprc;
					if (qntt > 0) {
						clclnRsltDtlList.push({
							clclnCrtrType: _CLCLN_RSLT_KND_,
							crtrCd: _RSLT_KND__GDS_,
							dtlCd: item.dtlCd,
							clclnQntt: qntt,
							clclnAmt: amt,
							elmtQntt: "Y",
							elmtAmt: "Y"
						});
					
						gdsClclnAmt += amt || 0;
					}
				});
			}
			
			// 추가지급금	**************************************************
			// 추가지급금 - 단가	extraUntprc
			// 추가지급금 - 금액	extraAmt
			extraUntprc = rowData["extraUntprc"] || 0;
			extraAmt = rowData["extraAmt"] || 0;
			clclnRsltDtlList.push({
				clclnCrtrType: _CLCLN_AMT_KND_,
				crtrCd: _AMT_KND__EXTRA_AMT_,
				clclnUntprc: extraUntprc,
				clclnAmt: extraAmt,
				elmtUntprc: "Y",
				elmtAmt: "Y"
			});
			
			// 수수료		**************************************************
			// 농협수수료 feeAmt
			feeAmt = rowData["feeAmt"] || 0;
			clclnRsltDtlList.push({
				clclnCrtrType: _CLCLN_AMT_KND_,
				crtrCd: _AMT_KND__FEE_AMT_,
				clclnAmt: feeAmt,
				elmtAmt: "Y"
			});
			
			// 계약금		**************************************************
			// 계약금 - 종자대금
			// 계약금 - 현금
			jsonCtrtAmt.forEach((item, index) => {
				const ctrt = _.find(arrCtrtAmtKnd, {column: item.dtlCd});
				const colNm = ctrt.property;
				const amt = rowData[colNm];
				
				clclnRsltDtlList.push({
					clclnCrtrType: item.clclnCrtrType,
					crtrCd: item.crtrCd,
					dtlCd: item.dtlCd,
					clclnAmt: amt,
					elmtAmt: "Y"
				});
				
				ctrtAmt += amt || 0;
			});
			
			
			// 적자금		**************************************************
			jsonAcmlFund.forEach((item, index) => {
				const colNm = _COL_PRFX_ACML_FUND_ + (index+1);
				const amt = rowData[colNm];
				
				clclnRsltDtlList.push({
					clclnCrtrType: item.clclnCrtrType,
					crtrCd: item.crtrCd,
					dtlCd: item.dtlCd,
					clclnAmt: amt,
					elmtAmt: "Y"
				});
				
				acmlFund += amt || 0;
			});
			
			// 공제내역 	**************************************************
			// 공제내역 - 농자재대금
			// 공제내역 - 운반비
			// 공제내역 - 작업비
			// 공제내역 - 백대여료
			// 공제내역 - 출하회자조금
			// 공제내역 - 백미반납공제금
			// 공제내역 - 중도금
			jsonDdcAmt.forEach((item, index) => {
				const ddc = _.find(arrDdcAmtKnd, {column: item.dtlCd});
				const colNm = ddc.property;
				const amt = rowData[colNm];
				
				clclnRsltDtlList.push({
					clclnCrtrType: item.clclnCrtrType,
					crtrCd: item.crtrCd,
					dtlCd: item.dtlCd,
					clclnAmt: amt,
					elmtAmt: "Y"
				});
				
				ddcAmt += amt || 0;
			});
						
			// 선급금		**************************************************
			// 선급금 - 선금
			// 선급금 - 종자대금
			jsonAdvncAmt.forEach((item, index) => {
				const advnc = _.find(arrAdvncAmtKnd, {column: item.dtlCd});
				const colNm = advnc.property;
				const amt = rowData[colNm];
				
				clclnRsltDtlList.push({
					clclnCrtrType: item.clclnCrtrType,
					crtrCd: item.crtrCd,
					dtlCd: item.dtlCd,
					clclnAmt: amt,
					elmtAmt: "Y"
				});
				
				advncAmt += amt || 0;
			});
			
			
			// 최종지급금	**************************************************
			giveAmt = rowData["giveAmt"] || 0;
			clclnRsltDtlList.push({
				clclnCrtrType: _CLCLN_AMT_KND_,
				crtrCd: _AMT_KND__GIVE_AMT_,
				clclnAmt: giveAmt,
				elmtAmt: "Y"
			});
			
			rowData.clclnRsltDtlList = clclnRsltDtlList;
			clclnRsltList.push(rowData);
    	}
    	
		if (clclnRsltList.length == 0) {
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
			return;
		}
		

		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
		
		const param = {
			apcCd: gv_selectedApcCd,
			clclnRsltList: clclnRsltList
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/clcln/updateClclnRslt.do", param);
    		const data = await postJsonPromise;
    		
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		
        		await fn_search();
        		
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
     * @name fn_setGrdClclnRslt
     * @description 정산결과 목록 조회
     * @function
     */
    const fn_setGrdClclnRslt = async function() {

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
        		clclnSn: clclnSn,
        		clclnSeCd: clclnSeCd,
        		clclnClsf: clclnClsf,
        		prdcrNm: prdcrNm,
        		prdcrCd: prdcrCd,
      		});

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  		    	jsonClclnRslt.length = 0;
  		    	
  				data.resultList.forEach((item, index) => {
  					item.isUpdatedYn = "N";
  					jsonClclnRslt.push(item);
				});
  				
  				let totalRecordCount = jsonClclnRslt.length;
  				grdClclnRslt.rebuild();
  	          	
	        	document.querySelector('#cnt-clclnRslt').innerText = totalRecordCount;
	        	console.log(jsonClclnRslt)
	        	
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
	

	 
	/*
	 * @name fn_grdClclnRsltValueChanged
	 * @description 정산결과 변경 이벤트
	 */
	const fn_grdClclnRsltValueChanged = function() {
		
		const nRow = grdClclnRslt.getRow();
		const nCol = grdClclnRslt.getCol();
		
		const usrAttr = grdClclnRslt.getColUserAttr(nCol);
		
		
		if (
			!gfn_isEmpty(usrAttr) 
			&& usrAttr.hasOwnProperty('colType')
			&& usrAttr.hasOwnProperty('colNm')) {
			
			const rowData = grdClclnRslt.getRowData(nRow, false);	// deep copy
			const val = grdClclnRslt.getCellData(nRow, nCol);
			
			let extraAmt = 0;
			let feeAmt = 0;
			let ctrtSdPymt = 0;
			let ctrtAmt = 0;
			let acmlFund = 0;
			let ddcAmt = 0;
			let advncAmt = 0;
			
			let rsltQntt = 0;
			let rsltWght = 0;
			let rsltAmt = 0;
			
			switch (usrAttr.colType) {
			
			case _RSLT_KND__SEED_:	// 종자
				
				if (usrAttr.hasOwnProperty('prcs')
						&& _.isEqual(usrAttr.prcs, "C")) {
					
  					const colNmUntprc = usrAttr["colNmUntprc"];
  					const colNmAmt = usrAttr["colNmAmt"];
					
					const untprc = parseInt(rowData[colNmUntprc]) || 0;
					const amt = val * untprc;
					
					rowData[colNmAmt] = amt;
				}
				
				// 종자대금 set
				jsonSeed.forEach((item, index) => { 
					const colNmAmt = _COL_PRFX_SEED_ + _COL_PRFX_AMT_ + (index+1);
					const amt = parseInt(rowData[colNmAmt]) || 0;
					
					ctrtSdPymt += amt;
				});
				
				rowData["ctrtSdPymt"] = ctrtSdPymt;	// 종자대금 set
				
			case _AMT_KND__CTRT_AMT_:	// 계약금
				// 계약금 합산
				jsonCtrtAmt.forEach((item, index) => {
		    		const ctrt = _.find(arrCtrtAmtKnd, {column: item.dtlCd});
					const colNm = ctrt.property;
					
					const amt = parseInt(rowData[colNm]) || 0;

					ctrtAmt += amt;
				});

				rowData["ctrtAmt"] = ctrtAmt;	// 계약금 합계 set
				
				break;
			
			case _RSLT_KND__WRHS_:	// 입고
			case _RSLT_KND__SORT_:	// 선별
			case _RSLT_KND__GDS_:	// 입고
			
				if (usrAttr.hasOwnProperty('prcs')
						&& _.isEqual(usrAttr.prcs, "C")) {
					
  					const colNmUntprc = usrAttr["colNmUntprc"];
  					const colNmAmt = usrAttr["colNmAmt"];
					
					const untprc = parseInt(rowData[colNmUntprc]) || 0;
					const amt = val * untprc;
					
					rowData[colNmAmt] = amt;
				}
				
				jsonWrhsGrd.forEach((item, index) => {    			

	    			const colNmQntt = _COL_PRFX_WHRS_GRD_ + _COL_PRFX_QNTT_ + (index+1);
	    			const colNmWght = _COL_PRFX_WHRS_GRD_ + _COL_PRFX_WGHT_ + (index+1);
	    			const colNmAmt = _COL_PRFX_WHRS_GRD_ + _COL_PRFX_AMT_ + (index+1);
	    			
	    			const qntt = parseInt(rowData[colNmQntt]) || 0;
	    			const wght = parseInt(rowData[colNmWght]) || 0;
	    			const amt = parseInt(rowData[colNmQntt]) || 0;
	    			
	    			rsltQntt += qntt;
	    			rsltWght += wght;
	    			rsltAmt += amt;
				});
				jsonSortGrd.forEach((item, index) => {    			

	    			const colNmQntt = _COL_PRFX_SORT_GRD_ + _COL_PRFX_QNTT_ + (index+1);
	    			const colNmWght = _COL_PRFX_SORT_GRD_ + _COL_PRFX_WGHT_ + (index+1);
	    			const colNmAmt = _COL_PRFX_SORT_GRD_ + _COL_PRFX_AMT_ + (index+1);
	    			
	    			const qntt = parseInt(rowData[colNmQntt]) || 0;
	    			const wght = parseInt(rowData[colNmWght]) || 0;
	    			const amt = parseInt(rowData[colNmQntt]) || 0;
	    			
	    			rsltQntt += qntt;
	    			rsltWght += wght;
	    			rsltAmt += amt;
				});
				
				jsonGdsGrd.forEach((item, index) => {    			

	    			const colNmQntt = _COL_PRFX_GDS_GRD_ + _COL_PRFX_QNTT_ + (index+1);
	    			const colNmWght = _COL_PRFX_GDS_GRD_ + _COL_PRFX_WGHT_ + (index+1);
	    			const colNmAmt = _COL_PRFX_GDS_GRD_ + _COL_PRFX_AMT_ + (index+1);
	    			
	    			const qntt = parseInt(rowData[colNmQntt]) || 0;
	    			const wght = parseInt(rowData[colNmWght]) || 0;
	    			const amt = parseInt(rowData[colNmQntt]) || 0;
	    			
	    			rsltQntt += qntt;
	    			rsltWght += wght;
	    			rsltAmt += amt;
				});

				rowData["clclnQntt"] = rsltQntt;
				rowData["clclnWght"] = rsltQntt;
				rowData["clclnAmt"] = rsltQntt;
				
				break;

				
			case _AMT_KND__ACML_FUND_:	// 적자금
				// 적자금 합산
				jsonAcmlFund.forEach((item, index) => {
					const colNm = _COL_PRFX_ACML_FUND_ + (index+1);
					const amt = parseInt(rowData[colNm]) || 0;

					acmlFund += amt;
				});
			
				rowData["acmlFund"] = acmlFund;	// 적자금 합계 set
				
				break;
				
				
			case _AMT_KND__EXTRA_AMT_:	// 추가지급
				break;
			case _AMT_KND__FEE_AMT_:	// 수수료
				break;
			case _AMT_KND__ASST_CST_:	// 보조비용
				break;
			case _AMT_KND__DDC_AMT_:	// 공제비용
				
				jsonDdcAmt.forEach((item, index) => {
					const ddc = _.find(arrDdcAmtKnd, {column: item.dtlCd});
					const colNm = ddc.property;
					const amt = parseInt(rowData[colNm]) || 0;
					
					ddcAmt += amt;
				});
			
				rowData["ddcAmt"] = ddcAmt;
				
				break;
				
			case _AMT_KND__ADVNC_AMT_:	// 선지급
			
				jsonAdvncAmt.forEach((item, index) => {
					const advnc = _.find(arrAdvncAmtKnd, {column: item.dtlCd});
					const colNm = advnc.property;
					const amt = parseInt(rowData[colNm]) || 0;
										
					advncAmt += amt;
				});
			
				rowData["advncAmt"] = advncAmt;
				
				break;
				
			
			case _AMT_KND__GIVE_AMT_:	// 최종지급액
				// 합산 없음.
				return;
			
			default:
				break;	

			}
					
			// 합산 호출
			fn_setRowTotalAmt(nRow);
			
			rowData["isUpdatedYn"] = "Y";
			
			grdClclnRslt.refresh();
		}
		
	}
	
	/*
	* @name fn_setRowRsltAmt
	* @description 종자, 실적 합
	*/
	const fn_setRowTotalAmt = async function(_nRow) {
		
		const rowData = grdClclnRslt.getRowData(_nRow, false);	// deep copy
		
		const clclnAmt = parseInt(rowData["clclnAmt"]) || 0;
		const extraAmt = parseInt(rowData["extraAmt"]) || 0;
		const feeAmt = parseInt(rowData["feeAmt"]) || 0;
		const ctrtAmt = parseInt(rowData["ctrtAmt"]) || 0;
		const acmlFund = parseInt(rowData["acmlFund"]) || 0;
		const ddcAmt = parseInt(rowData["ddcAmt"]) || 0;
		const advncAmt = parseInt(rowData["advncAmt"]) || 0;
		
		const giveAmt = 
			clclnAmt
			+ extraAmt
			+ feeAmt
			- ctrtAmt
			- acmlFund
			- ddcAmt
			+ advncAmt;
		
		rowData["giveAmt"] = giveAmt;
	}
	
	/*
	* @name fn_getPrdcrs
	* @description 생산자 자동완성 목록 가져오기
	*/
	const fn_getPrdcrs = async function() {
		jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
		jsonPrdcr = gfn_setFrst(jsonPrdcr);
	}

	/**
	 * @name fn_onInputPrdcrNm
	 * @description 생산자명 입력 시 event : autocomplete
	 */
	const fn_onInputPrdcrNm = function(prdcrNm){
		fn_clearPrdcr();
		if (gfn_getByteLengthOfString(prdcrNm.target.value) > 100){
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
	//const fn_onSelectPrdcrNm = function(value, label, item) {
	function fn_onSelectPrdcrNm (value, label, item) {
		
		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
		if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
			document.getElementById('btn-srch-prdcr').click();
		} else{
			SBUxMethod.set("srch-inp-prdcrCd", value);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
			let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
			prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;
		}
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

		//await fn_getPrdcrs();

		if (!gfn_isEmpty(prdcr)) {
			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

			//fn_setPrdcrForm(prdcr);
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

	}
	 
	 
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>