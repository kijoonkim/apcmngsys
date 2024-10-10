<%
  /**
   * @Class Name : clclnUntprcMng.jsp
   * @Description : 정산단가 관리 화면
   * @author SI개발부
   * @since 2024.09.10
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2024.09.10   	손민성		최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 정산단가관리</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
  <style>
    #종자단가, #등급단가{
      border: 0;
      padding: 0;
    }
    .tab-page {
      border: 0;
      padding: 0;
    }
    .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-nor-bd > li.sbux-tabs-item > a:hover, .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-inbox-bd > li.sbux-tabs-item > a:hover {
      border-color : rgb(221, 221, 221) !important;
    }
    [id^="sb-area"] {
      padding: 3px;
    }
    .th__bg {
    	background-color: #f5deb3
    }
    
	.displayFlex > .sbux-pik-wrap {
		display: flex;
		gap: 10px;
	}
    
  </style>
</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
    		<div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background: white; z-index: 999" >
      			<div>
        			<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        			<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 정산정보조회 -->
      			</div>
	      		<div style="margin-left: auto;">
			        <sbux-button
			                id="btnCreate"
			                name="btnCreate"
			                uitype="normal"
			                class="btn btn-sm btn-outline-danger"
			                text="신규"
			                onclick="fn_create"
			        ></sbux-button>
			        <sbux-button
			                id="btnReset"
			                name="btnReset"
			                uitype="normal"
			                class="btn btn-sm btn-outline-danger"
			                text="초기화"
			                onclick="fn_reset"
			        ></sbux-button>
			        <sbux-button
			                id="btnSave"
			                name="btnSave"
			                uitype="normal"
			                class="btn btn-sm btn-primary"
			                text="저장"
			                onclick="fn_save"
			        ></sbux-button>
			        <sbux-button
			                id="btnSearch"
			                name="btnSearch"
			                uitype="normal"
			                class="btn btn-sm btn-outline-danger"
			                text="조회"
			                onclick="fn_search"
			        ></sbux-button>
	      		</div>
   			</div>
    		<div class="box-body">
				<!--[APC] START -->
				<%@ include file="../../../frame/inc/apcSelect.jsp" %>
				<!--[APC] END -->
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
					              	
									<!-- 
									<div style="display: flex;gap: 10px">
					              	<sbux-spinner
					              		id="srch-spn-clclnSn"
					              		name="srch-spn-clclnSn"
					                	wrap-style="flex-basis:30%"
					                    uitype="normal"
					                    number-min-value="1"
					                    number-max-value="10"
					                    number-suffix-text="차수"
					              	></sbux-spinner>
					              	 -->
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
        			</tbody>
      			</table>
				<table class="table table-bordered tbl_fixed" style="margin-bottom: 10px">
					<caption>등록 조건 설정</caption>
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
			          		<th scope="row" class="th_bg th__bg">단가적용기간</th>
							<td colspan="3" class="td_input" style="border-right: hidden;">
								<div style="display: flex;gap: 10px">
									<sbux-datepicker 
										uitype="range" 
										id="srch-dtp-untprcYmd" 
										name="srch-dtp-untprcYmd"
										date-format="yyyy-mm-dd" 
										class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
										wrap-class="displayFlex" 
										wrap-style="border:0;padding:0;"
									/>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button
					                id="btn-aply-ymd"
					                name="btnReset"
					                uitype="normal"
					                class="btn btn-sm btn-outline-danger"
					                text="적용"
					                onclick="fn_aplyYmd"
								></sbux-button>
							</td>
							<td colspan="7" class="td_input" style="border-right: hidden;">
								<sbux-label
									id="lbl-clclnMstInfo"
									name="lbl-clclnMstInfo"
									uitype="normal"
									text="미생성"
									tooltip=""
								></sbux-label>
							</td>
        				</tr>
					</tbody>
	            </table>
				<sbux-tabs
					id="tab-untprc"
					name="tab-untprc"
					uitype="webacc"
					is-scrollable="false"
					wrap-style="height:100%"
				    title-target-id-array="tp-seed^tp-wrhsGrd"
				    title-text-array="종자단가^등급단가(입고)"
				    onclick="fn_tabClick"
				    title-style-array="{
				    		margin-right: 5px;width: 8vw;
				        	text-align: center;font-weight: bold;border-radius:0}^{margin-right: 5px;width: 8vw;
				            text-align: center;font-weight: bold;border-radius:0}">
				</sbux-tabs>
     			<div class="tab-content">
        			<div id="tp-seed" class="tab-page">
          				<div class="ad_tbl_top">
            				<ul class="ad_tbl_count">
			        			<li>
			        				<span>종자별 단가 목록</span>
			        				<span style="font-size:12px">(조회건수 <span id="cnt-seed">0</span>건)</span>
			        			</li>
            				</ul>
         				</div>
         				<div id="sb-area-grdUntprcSeed" style="height: 500px"></div>
       				</div>
       				<div id="tp-wrhsGrd" class="tab-page">
         				<div class="ad_tbl_top">
           					<ul class="ad_tbl_count">
             					<li>
               						<span>등급별 단가 목록</span>
               						<span style="font-size:12px">(조회건수 <span id="cnt-wrhsGrd">0</span>건)</span>
             					</li>
           					</ul>
         				</div>
         				<div id="sb-area-grdUntprcWrhsGrd" style="height: 500px"></div>
       				</div>
    			</div>
    		</div>
  		</div>
	</section>
</body>
<script type="text/javascript">
	
	let lv_prvTabId;
	let lv_prvClclnYr;
	let lv_prvClclnSn;

	lv_prvTabId = "tp-seed";
	
	// crtrType
	const _CLCLN_ARTCL_KND_			= "CLCLN_ARTCL_KND";
	const _CLCLN_UNTPRC_KND_		= "CLCLN_UNTPRC_KND";
	
	// CLCLN_ARTCL_KND	기준코드
	const _CLCLN_SE_CD_				= "CLCLN_SE_CD";
	const _CLCLN_CLSF_				= "CLCLN_CLSF";
	const _CLCLN_ELMT_				= "CLCLN_ELMT";

	// CLCLN_UNTPRC_KND 기준코드
	const _UNTPRC_KND__SEED_		= "SEED";
	const _UNTPRC_KND__WRHS_GRD_ 	= "WRHS_GRD";
	const _UNTPRC_KND__SORT_GRD_ 	= "SORT_GRD";
	const _UNTPRC_KND__GDS_GRD_ 	= "GDS_GRD";


	
	// CLCLN_ELMT 상세
	const _CLCLN_ELMT__SE_CD_		= "SE_CD";
	const _CLCLN_ELMT__CLSF_		= "CLSF";
	const _CLCLN_ELMT__ITEM_		= "ITEM";
	const _CLCLN_ELMT__VRTY_		= "VRTY";
	
	let needsElmtSeCd	= false;
	let needsElmtClsf	= false;
	let needsElmtItem	= false;
	let needsElmtVrty	= false;
	
	
	var tabJsonData = [
		{ 
			"id": "0", 
			"pid": "-1", 
			"order": "1", 
			"text": "종자단가", 
			"targetid": "tp-seed",
			"targetvalue" : "종자단가"
		},
		{ 
			"id": "1", 
			"pid": "-1", 
			"order": "2", 
			"text": "등급단가", 
			"targetid": "tp-wrhsGrd",
			"targetvalue" : "등급단가"
		},
	];

	// 코드 json
	var jsonClclnSeCd		= [];	// 정산구분코드
	var jsonClclnClsf		= [];	// 정산분류
	var jsonClclnElmt		= [];	// 정산항목
	var jsonClclnUntprcKnd	= [];	// 정산단가종류

	var jsonClclnSn		= [];	// 차수
	
	var jsonUntprcUnit	= [];	// 단가단위
	
	var jsonWrhsGrd		= [];	// 입고등급 
	var jsonSortGrd		= [];	// 선별등급
	var jsonGdsGrd		= [];	// 상품등급

	var jsonItem		= [];	// 품목
	var jsonVrty		= [];	// 품종
	var jsonSeed		= [];	// 종자
	
	
	
	var jsonClclnCrtr		= [];	// 정산기준
	var jsonClclnCrtrDtl	= [];	// 정산기준 상세
	
	// 단가 그리드 object
	var grdUntprcSeed;		// 종자별 단가
	var grdUntprcWrhsGrd;	// 입고등급별 단가
	
	// 단가 json
	var jsonUntprcSeed		= [];
	var jsonUntprcWrhsGrd	= [];

  	window.addEventListener('DOMContentLoaded', async function(e) {
    	fn_init();
  	});

 	/**
     * @name fn_init
     * @description 화면 초기 호출
     * @function
     */
  	const fn_init = async function() {
  		
  		lv_prvTabId = "tp-seed";
 		
  	    SBUxMethod.set("srch-dtp-clclnYr", gfn_dateToYear(new Date()));
  		
 		await fn_initSBSelect();
 		
  		fn_createUntprcSeedGrid();
  		fn_createUntprcWrhsGrdGrid();
  		
		lv_prvClclnYr = SBUxMethod.get("srch-dtp-clclnYr");
  		lv_prvClclnSn = SBUxMethod.get("srch-spn-clclnSn");

		await fn_onChangeSrchClclnSn({value: lv_prvClclnSn});
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
			// 입고등급 가져오기
			//fn_getClclnCrtr(),
			fn_getClclnCrtrDtl(),
			fn_getClclnSn(),
		]);
		
		jsonUntprcUnit = result[0];
		jsonItem = result[1];
		jsonVrty = result[2];
		jsonSeed = result[3];

		fn_setJsonClclnCrtr();
 	}
 	
	const fn_initSBSelect = async function() {
  		
 		await fn_setCodeJson();
 		
		SBUxMethod.refresh("srch-slt-clclnSeCd");
		SBUxMethod.refresh("srch-slt-clclnClsf");
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
 		
 		jsonWrhsGrd.length = 0;
 		jsonSortGrd.length = 0;
 		jsonGdsGrd.length = 0;
 		
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
 					
 					case _CLCLN_UNTPRC_KND_:		// 정산할 등급
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
    			
    			default:
    				break;
    		}
    	});
 		
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
  				
  				console.log("jsonClclnSn", jsonClclnSn);
	        	
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
     * @name fn_getClclnCrtr
     * @description 정산기준 조회
     * @function
     */
 	const fn_getClclnCrtr = async function() {
 		
 		jsonClclnCrtr.length = 0;

        try {
        	const postJsonPromise = gfn_postJSON(
        			"/am/clcln/selectClclnCrtrList.do", 
        			{apcCd: gv_selectedApcCd},
        			null,
        			true
        	);

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				data.resultList.forEach((item, index) => {
	        		jsonClclnCrtr.push(item);
				});
	        	
        	} else {
        		console.log("crtr errorCode", data.resultCode);
        		console.log("crtr errorMessage", data.resultMessage);
        	}

		} catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("crtr failed", e.message);
		}
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
     * @name fn_createUntprcSeedGrid
     * @description 종자별 단가 그리드 생성
     * @function
     */
 	const fn_createUntprcSeedGrid = function() {
    	var SBGridProperties = {};
    	SBGridProperties.parentid = 'sb-area-grdUntprcSeed';
    	SBGridProperties.id = 'grdUntprcSeed';
    	SBGridProperties.jsonref = 'jsonUntprcSeed';
    	SBGridProperties.emptyrecords = '데이터가 없습니다.';
    	SBGridProperties.extendlastcol = 'scroll';
    	SBGridProperties.selectmode = 'free';
    	SBGridProperties.allowcopy = true;
    	SBGridProperties.explorerbar = 'sort';
    	SBGridProperties.scrollbubbling = false;

    	SBGridProperties.columns = [
      		{
      			caption: ["처리"],
		        ref: 'delYn',
		        type:'button',
		        width:'40px',
		        style: 'text-align:center',
        		renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if (gfn_isEmpty(strValue)){
            			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRowSeed(" + nRow + ")'>추가</button>";
            		} else {
			        	return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRowSeed(" + nRow + ")'>삭제</button>";
            		}
        		}
        	},
      		{
        		caption: '정산연도',
        		ref: 'clclnYr',
        		width: '60px',
        		type: 'output', 
        		style: 'text-align:center'
        	},
      		{
        		caption: '차수',
        		ref: 'clclnSn',
        		width: '40px',
        		type: 'output', 
        		style: 'text-align:center'
        	},
    	];

    	// 정산구분 사용
    	if (needsElmtSeCd) {
    		SBGridProperties.columns.push({
        		caption: '정산구분',
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
				caption: '정산분류',
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
				caption: '품목',
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
				caption: '품종',
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
    	
    	SBGridProperties.columns.push(
   			{
           		caption: '종자명',
           		ref: 'untprcDtlCd',
           		width: '120px',
           		type: 'combo',
           		typeinfo : {
           			ref:'jsonSeed', 
           			label:'seedNm', 
           			value:'seedCd', 
           			oneclickedit: true
           		}, 
           		style: 'text-align:center'
           	},
           	{
           		caption: '단위',
           		ref: 'untprcUnit',
           		width: '120px',
           		type: 'combo',
           		typeinfo : {
           			ref:'jsonUntprcUnit', 
           			label:'cdVlNm', 
           			value:'cdVl', 
           			oneclickedit: true
           		}, 
           		style: 'text-align:center'
           	},
         		{
           		caption: '단가',
           		ref: 'clclnUntprc',
      				datatype: 'number',
      				type:'input',
      				width:'120px',
      				style: 'text-align:right;background-color:#FFF8DC',
      				userattr: {colNm: "clclnUntprc"},
      				typeinfo: {
      	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
      	                maxlength: 14,
      	                oneclickedit: true
                      },
                      format : {type:'number', rule:'#,###'}
           	},
         		{
           		caption: '비고',
           		ref: 'untprcRmrk',
           		width: '300px',
           		type: 'input',
           		style: 'text-align:left'
   			},
    	);
    	
    	grdUntprcSeed = _SBGrid.create(SBGridProperties);
    	
    	grdUntprcSeed.addRow();
    	grdUntprcSeed.setCellDisabled(
    			grdUntprcSeed.getRows() -1, 
	        	0, 
	        	grdUntprcSeed.getRows() -1, 
	        	grdUntprcSeed.getCols() -1,
	        	true
        	);
	}
  	
 	
 	/**
     * @name fn_createUntprcWrhsGrdGrid
     * @description 입고등급별 단가 그리드 생성
     * @function
     */
 	const fn_createUntprcWrhsGrdGrid = function() {
    	var SBGridProperties = {};
    	SBGridProperties.parentid = 'sb-area-grdUntprcWrhsGrd';
    	SBGridProperties.id = 'grdUntprcWrhsGrd';
    	SBGridProperties.jsonref = 'jsonUntprcWrhsGrd';
    	SBGridProperties.emptyrecords = '데이터가 없습니다.';
    	SBGridProperties.extendlastcol = 'scroll';
    	SBGridProperties.selectmode = 'free';
    	SBGridProperties.allowcopy = true;
    	SBGridProperties.explorerbar = 'sort';
    	SBGridProperties.scrollbubbling = false;
    	SBGridProperties.columns = [
      		{
      			caption: ["처리"],
		        ref: 'delYn',
		        type:'button',
		        width:'40px',
		        style: 'text-align:center',
        		renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if (gfn_isEmpty(strValue)){
            			return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRowWrhsGrd(" + nRow + ")'>추가</button>";
            		} else {
			        	return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRowWrhsGrd(" + nRow + ")'>삭제</button>";
            		}
        		}
        	},
      		{
        		caption: '정산연도',
        		ref: 'clclnYr',
        		width: '60px',
        		type: 'output', 
        		style: 'text-align:center'
        	},
      		{
        		caption: '차수',
        		ref: 'clclnSn',
        		width: '40px',
        		type: 'output', 
        		style: 'text-align:center'
        	},
      		{
        		caption: '정산구분',
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
        	},
      		{
        		caption: '정산분류',
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
        	},
    	];
    	

    	// 정산구분 사용
    	if (needsElmtSeCd) {
    		SBGridProperties.columns.push({
        		caption: '정산구분',
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
				caption: '정산분류',
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
				caption: '품목',
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
				caption: '품종',
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
    	
    	SBGridProperties.columns.push(
    		{
	    		caption: '등급',
	    		ref: 'untprcDtlCd',
	    		width: '120px',
	    		type: 'combo',
	    		typeinfo : {
	    			ref:'jsonWrhsGrd', 
	    			label:'cdVlNm', 
	    			value:'cdVl', 
	    			oneclickedit: true
	    		}, 
	    		style: 'text-align:center'
	    	},
	    	{
	    		caption: '단위',
	    		ref: 'untprcUnit',
	    		width: '120px',
	    		type: 'combo',
	    		typeinfo : {
	    			ref:'jsonUntprcUnit', 
	    			label:'cdVlNm', 
	    			value:'cdVl', 
	    			oneclickedit: true
	    		}, 
	    		style: 'text-align:center'
	    	},
	  		{
	    		caption: '단가',
	    		ref: 'clclnUntprc',
					datatype: 'number',
					type:'input',
					width:'120px',
					style: 'text-align:right;background-color:#FFF8DC',
					userattr: {colNm: "clclnUntprc"},
					typeinfo: {
		                mask : {alias : '#', repeat: '*', unmaskvalue : true},
		                maxlength: 14,
		                oneclickedit: true
	               },
	               format : {type:'number', rule:'#,###'}
	    	},
	  		{
	    		caption: '비고',
	    		ref: 'untprcRmrk',
	    		width: '300px',
	    		type: 'input',
	    		style: 'text-align:left'
			}
		);
    	
    	grdUntprcWrhsGrd = _SBGrid.create(SBGridProperties);
    	
    	grdUntprcWrhsGrd.addRow();
    	grdUntprcWrhsGrd.setCellDisabled(
    			grdUntprcWrhsGrd.getRows() -1, 
	        	0, 
	        	grdUntprcWrhsGrd.getRows() -1, 
	        	grdUntprcWrhsGrd.getCols() -1,
	        	true
        	);
	}

 	/**
     * @name fn_createUntprcWrhsGrdGrid
     * @description 입고등급별 단가 그리드 생성
     * @function
     */
	const fn_search = async function() {
		
 		const selectedTab = SBUxMethod.get('tab-untprc');
		
		switch (selectedTab) {
			case "tp-seed":
				await fn_setGrdUntprcSeed();
				break;
			case "tp-wrhsGrd":
				await fn_setGrdUntprcWrhsGrd();
				break;
			
			default:
				break;
		}
 	}
 	
	const fn_tabClick = function() {
		
		const selectedTab = SBUxMethod.get('tab-untprc');
		
		if (!_.isEqual(lv_prvTabId, selectedTab)) {
			lv_prvTabId = selectedTab;
			fn_search();
		}		
	}

 	
    /**
     * @name fn_setGrdUntprcSeed
     * @description 종자별 단가 목록 조회
     * @function
     */
    const fn_setGrdUntprcSeed = async function() {
    	
    	jsonUntprcSeed.length = 0;
 		
    	const clclnYr = SBUxMethod.get("srch-dtp-clclnYr");
    	const clclnSn = SBUxMethod.get("srch-slt-clclnSn");
    	const clclnSeCd = SBUxMethod.get("srch-slt-clclnSeCd");
    	const clclnClsf = SBUxMethod.get("srch-slt-clclnClsf");
    	
    	lv_prvClclnYr = clclnYr;
  		lv_prvClclnSn = clclnSn;
    	
        try {
        	
        	const postJsonPromise = gfn_postJSON("/am/clcln/selectApcClclnUntprcList.do", {
        		apcCd: gv_selectedApcCd,
        		clclnYr: clclnYr,
        		clclnSn: clclnSn,
        		clclnSeCd: clclnSeCd,
        		clclnClsf: clclnClsf,
        		clclnUntprcKnd: _UNTPRC_KND__SEED_	//	종자별 조회
      		});

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				data.resultList.forEach((item, index) => {
	        		item.delYn = "N";
	        		item.chkVl = "Y";
	        		jsonUntprcSeed.push(item);
				});

  	          	let totalRecordCount = jsonUntprcSeed.length;
  	          	grdUntprcSeed.rebuild();
  	          	
	        	document.querySelector('#cnt-seed').innerText = totalRecordCount;
	        	
	        	grdUntprcSeed.setCellDisabled(
		        		0, 
		        		0, 
		        		grdUntprcSeed.getRows() -1, 
		        		grdUntprcSeed.getCols() -4,
		        		true
	        		);
		        
	        	grdUntprcSeed.addRow();
	        	grdUntprcSeed.setCellDisabled(
	        			grdUntprcSeed.getRows() -1, 
			        	0, 
			        	grdUntprcSeed.getRows() -1, 
			        	grdUntprcSeed.getCols() -1,
			        	true
		        	);
	        	
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
     * @name fn_setGrdUntprcWrhsGrd
     * @description 입고등급별 단가 목록 조회
     * @function
     */
    const fn_setGrdUntprcWrhsGrd = async function() {
    	
    	jsonUntprcWrhsGrd.length = 0;
 		
    	const clclnYr = SBUxMethod.get("srch-dtp-clclnYr");
    	const clclnSn = SBUxMethod.get("srch-slt-clclnSn");
    	const clclnSeCd = SBUxMethod.get("srch-slt-clclnSeCd");
    	const clclnClsf = SBUxMethod.get("srch-slt-clclnClsf");

    	lv_prvClclnYr = clclnYr;
  		lv_prvClclnSn = clclnSn;
    	
        try {
        	
        	const postJsonPromise = gfn_postJSON("/am/clcln/selectApcClclnUntprcList.do", {
        		apcCd: gv_selectedApcCd,
        		clclnYr: clclnYr,
        		clclnSn: clclnSn,
        		clclnSeCd: clclnSeCd,
        		clclnClsf: clclnClsf,
        		clclnUntprcKnd: _UNTPRC_KND__WRHS_GRD_	//	등급별 조회
      		});

            const data = await postJsonPromise;
        	
  			if (_.isEqual("S", data.resultStatus)) {
  	      		
  				data.resultList.forEach((item, index) => {
	        		item.delYn = "N";
	        		item.chkVl = "Y";
	        		jsonUntprcWrhsGrd.push(item);
				});

  	          	let totalRecordCount = jsonUntprcWrhsGrd.length;
  	          	grdUntprcWrhsGrd.rebuild();
  	          	
	        	document.querySelector('#cnt-wrhsGrd').innerText = totalRecordCount;
	        	
	        	grdUntprcWrhsGrd.setCellDisabled(
		        		0, 
		        		0, 
		        		grdUntprcWrhsGrd.getRows() -1, 
		        		grdUntprcWrhsGrd.getCols() -4,
		        		true
	        		);
		        
	        	grdUntprcWrhsGrd.addRow();
	        	grdUntprcWrhsGrd.setCellDisabled(
	        			grdUntprcWrhsGrd.getRows() -1, 
			        	0, 
			        	grdUntprcWrhsGrd.getRows() -1, 
			        	grdUntprcWrhsGrd.getCols() -1,
			        	true
		        	);
	        	
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
     * @name fn_save
     * @description 단가 등록
     * @function
     */
    const fn_save = async function() {
    	
		const selectedTab = SBUxMethod.get('tab-untprc');
		
		switch (selectedTab) {
			case "tp-seed":
				await fn_saveUntprc(grdUntprcSeed, "종자");
				break;
			case "tp-wrhsGrd":
				await fn_saveUntprc(grdUntprcWrhsGrd, "등급");
				break;
			
			default:
				break;
		}
    }    
    
    /**
     * @name fn_saveUntprc
     * @description 단가등록
     * @function
     */
    const fn_saveUntprc = async function(_gridObj, _strChkDtlMsg) {

    	const clclnYr = SBUxMethod.get("srch-dtp-clclnYr");
    	const clclnSn = SBUxMethod.get("srch-slt-clclnSn");
    	
    	if (gfn_isEmpty(clclnYr)) {
    		gfn_comAlert("W0001", "정산연도");		//	W0001	{0}을/를 선택하세요.
			return;
    	}
		if (gfn_isEmpty(clclnSn)) {
			gfn_comAlert("W0001", "정산차수");		//	W0001	{0}을/를 선택하세요.
			return;
    	}
    	
		const untprcList = [];
		const allData = _gridObj.getGridDataAll();
		
		for ( let i=0; i<allData.length; i++ ) {

			const item = allData[i];
			
			if (_.isEqual("N", item.delYn)) {
				
				// 정산구분, 정산분류, 정산품목, 정산품종은 optional 로 체크
				if (needsElmtSeCd) {
					if (gfn_isEmpty(item.clclnSeCd)) {
						gfn_comAlert("W0005", "정산구분");		//	W0005	{0}이/가 없습니다.
						return;
					}
				}
				if (needsElmtClsf) {
					if (gfn_isEmpty(item.clclnClsf)) {
						gfn_comAlert("W0005", "정산분류");		//	W0005	{0}이/가 없습니다.
						return;
					}
				}
				if (needsElmtItem) {
					if (gfn_isEmpty(item.itemCd)) {
						gfn_comAlert("W0005", "품목");		//	W0005	{0}이/가 없습니다.
						return;
					}
				}
				
				let vrtyCd = "";
				if (needsElmtVrty) {
					if (gfn_isEmpty(item.itemVrtyCd)) {
						gfn_comAlert("W0005", "품종");		//	W0005	{0}이/가 없습니다.
						return;
					}
					
					vrtyCd = item.itemVrtyCd.substr(4, 4);
				}
				
				if (gfn_isEmpty(item.untprcDtlCd)) {
					gfn_comAlert("W0005", _strChkDtlMsg);		//	W0005	{0}이/가 없습니다.
					return;
				}
				
				if (!_.isEqual(clclnYr, item.clclnYr)) {
					gfn_comAlert("W0006", "선택정산연도", "등록정산연도");	//	W0006	{0}와/과 {1}이/가 서로 다릅니다.
					return;
				}
				
				if (!_.isEqual(clclnSn, String(item.clclnSn))) {
					gfn_comAlert("W0006", "선택차수", "등록정산차수");		//	W0006	{0}와/과 {1}이/가 서로 다릅니다.
					return;
				}
				
				untprcList.push({
					apcCd: item.apcCd,
					clclnYr: item.clclnYr,
					clclnSn: item.clclnSn,
					untprcSn: item.untprcSn,
					untprcDtlCd: item.untprcDtlCd,
					untprcDtlNm: item.untprcDtlNm,
					clclnUntprcKnd: item.clclnUntprcKnd,
					clclnSeCd: item.clclnSeCd,
					clclnClsf: item.clclnClsf,
					itemCd: item.itemCd,
					vrtyCd: vrtyCd,
					clclnUntprc: item.clclnUntprc,
					clclnQntt: item.clclnQntt,
					clclnWght: item.clclnWght,
					clclnAmt: item.clclnAmt,
					untprcRmrk: item.untprcRmrk,
    			});	
			}
		}

		if (untprcList.length == 0) {
			gfn_comAlert("W0003", "저장");	//	W0003	{0}할 대상이 없습니다.
			return;
		}

		const param = {
			apcCd: gv_selectedApcCd,
			clclnYr: clclnYr,
			clclnSn: clclnSn,
			clclnUntprcList: untprcList
		}

        try {
        	const postJsonPromise = gfn_postJSON("/am/clcln/insertApcUntprc.do", param);
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
     * @name fn_deleteUntprcSeed
     * @description 종자단가 삭제
     * @function
     */
    const fn_deleteUntprc = async function(_untprc) {
    	
		const untprcList = [];
		
		untprcList.push(_untprc);	
		
		const param = {
			apcCd: gv_selectedApcCd,
			clclnUntprcList: untprcList
		}

        try {
        	
        	const postJsonPromise = gfn_postJSON("/am/clcln/deleteApcUntprc.do", param);
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
     * @name fn_addRow
     * @description 종자단가 행추가
     */
    const fn_addRowSeed = function (_nRow) {
    	fn_addRow(grdUntprcSeed, _nRow, _UNTPRC_KND__SEED_);
    }
    
	/**
     * @name fn_addRowWrhsGrd
     * @description 입고등급단가 행추가
     */
    const fn_addRowWrhsGrd = function (_nRow) {
    	fn_addRow(grdUntprcWrhsGrd, _nRow, _UNTPRC_KND__WRHS_GRD_);
    }
    
	/**
     * @name fn_addRow
     * @description 행추가
     */
    const fn_addRow = function (_gridObj, _nRow, _clclnUntprcKnd) {

    	const clclnYr = SBUxMethod.get("srch-dtp-clclnYr");
    	const clclnSn = SBUxMethod.get("srch-slt-clclnSn");
		
        const row = _gridObj.getRowData(_nRow, false);
		row.delYn = "N";
		row.apcCd = gv_selectedApcCd;
		row.clclnYr = clclnYr;
		row.clclnSn = clclnSn;
		row.clclnUntprcKnd = _clclnUntprcKnd;
		
		_gridObj.addRow(true);
		_gridObj.setCellDisabled(
	    		0, 
	    		0, 
	    		_gridObj.getRows() -1, 
	    		_gridObj.getCols() -1, 
	    		false
    		);
		_gridObj.setCellDisabled(
				_gridObj.getRows() -1, 
	    		0, 
	    		_gridObj.getRows() -1, 
	    		_gridObj.getCols() -1, 
    			true
    		);
    };
    
    
	/**
     * @name fn_delRowSeed
     * @description 종자단가 행삭제
     */
	const fn_delRowSeed = async function(_nRow) {
		
		fn_delRow(grdUntprcSeed, _nRow);
	}
	
	/**
     * @name fn_delRowWrhsGrd
     * @description 등급단가 행삭제
     */
	const fn_delRowWrhsGrd = async function(_nRow) {
		
		fn_delRow(grdUntprcWrhsGrd, _nRow);
	}
    
	/**
     * @name fn_delRow
     * @description 행삭제
     */
	const fn_delRow = async function(_gridObj, _nRow) {
		
		const rowStatus = _gridObj.getRowStatus(_nRow);
		
		if (rowStatus == 0 || rowStatus == 2) {
			if (!gfn_comConfirm("Q0002", "등록단가", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}

			const untprc = _gridObj.getRowData(_nRow);
			await fn_deleteUntprc(untprc);

    	} else {
    		_gridObj.deleteRow(_nRow);
    	}
	}
    
	/**
	* @name fn_onChangeSrchClclnSn
	* @description 차수 선택 변경 event
	*/
	const fn_onChangeSrchClclnSn = async function(obj) {
		
		const clclnSn = obj.value;
		const chkInfo = _.find(jsonClclnSn, {cdVl: clclnSn});
		console.log("jsonClclnSn", jsonClclnSn);
		console.log("chkInfo", chkInfo);
		
		if (!gfn_isEmpty(chkInfo)) {
			// set 단가정보
			const bgngYmd = gfn_nvl(chkInfo.bgngYmd);
			const endYmd = gfn_nvl(chkInfo.endYmd);
			SBUxMethod.set("srch-dtp-untprcYmd", bgngYmd + "," + endYmd);
			
			let infoText = chkInfo.clclnYr + "년 " + clclnSn + "차 "
				+ "(적용기간: " + bgngYmd + " ~ " + endYmd;
			SBUxMethod.set("lbl-clclnMstInfo", infoText);
			
		} else {
			SBUxMethod.set("srch-dtp-untprcYmd", ",");
			SBUxMethod.set("lbl-clclnMstInfo", "미등록");
		}
		
		await fn_search();
	}
    
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
