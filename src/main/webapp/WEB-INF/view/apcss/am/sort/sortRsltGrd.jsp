
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
	
<style type="text/css">
.ad_tbl_toplist>span {
	font-weight: bold;
	margin-right: 10px;
}
</style>

</head>
<body oncontextmenu="return false">
	<section class="content container-fluid">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
			
				<sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
				
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별결과표 -->
				</div>
				<div style="margin-left: auto;">
				
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
				<table class="table table-bordered tbl_fixed">
					<caption>검색 조건 설정</caption>
					<colgroup>

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 2%">
						<col style="width: 5%">
						<col style="width: 2%">

						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 4%">
						<col style="width: 3%">
						<col style="width: 3%">

						<col style="width: 5%">
						<col style="width: 5%">
						<col style="width: 3%">
						<col style="width: 3%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th colspan="1" scope="row" class="th_bg">선별일자</th>
							
							<td colspan="2" class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-inptYmdFrom"
									name="srch-dtp-inptYmdFrom"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-inptYmdFrom)"
								></sbux-datepicker>
							</td>
							
							<td colspan="2" class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-inptYmdTo"
									name="srch-dtp-inptYmdTo"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-inptYmdTo)"
								></sbux-datepicker>
							</td>
							<th colspan="1" scope="row" class="th_bg">선별기</th>
							<td colspan="2" class="td_input">
								<sbux-select uitype="single" id="srch-slt-fcltCd" name="srch-slt-fcltCd" class="form-control input-sm" jsondata-ref="jsonComFcltCd" onchange="fn_selectSortFclt" unselected-text="전체" ></sbux-select>
							</td>
							</tr>
							<tr>
							<th colspan="1" scope="row" class="th_bg">생산자</th>
							<td colspan="2"  class="td_input" style="border-right: hidden;">
								<sbux-input
									uitype="text"
									id="srch-inp-prdcrNm"
									name="srch-inp-prdcrNm"
									class="form-control input-sm"
									placeholder="초성검색 가능"
									autocomplete-ref="jsonPrdcrAutocomplete"
									autocomplete-text="name"
    								oninput="fn_onInputPrdcrNm(event)"
    								autocomplete-select-callback="fn_onSelectPrdcrNm"
   								></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button
									id="btn-srch-prdcr"
									name="btn-srch-prdcr"
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-prdcr"
									onclick="fn_choicePrdcr"
								></sbux-button>
							</td>
							<th colspan = "1" scope="row" class="th_bg">품목</th>
							<td colspan = "2"class="td_input">
								<sbux-select
									id="srch-slt-itemCd"
									name="srch-slt-itemCd"
									uitype="single"
									class="form-control input-sm"
									jsondata-ref="jsonApcItem"
									onchange="fn_selectItem"
								></sbux-select>
							</td>
														
							
							
							
						</tr>
					</tbody>
				</table>
				
				<div class="ad_tbl_top2">
					
					
					<div class="ad_tbl_toplist">
						
						<span id="dtl-spn-sttsFigure" style="margin-left: 10px;font-size: 28px;">●</span>
						<span id="dtl-spn-trsmMatSttsNm" style="margin-right: 20px;">기기상태</span>
						<span>요청 :</span>
						<span id="dtl-spn-reqDt"></span>
						<span>완료 :</span>
						<span id="dtl-spn-cmptnDt"></span>
						<span id="dtl-spn-sttsNm" style="margin-right: 20px;">진행상태</span>
						
						<sbux-button
							id="btn-sortReq"
							name="btn-sortReq"
							uitype="normal"
							class="btn btn-sm btn-outline-danger"
							onclick="fn_sortReq"
							text="정보재수신"
					    ></sbux-button>
					    <sbux-button
							id="btn-sortReqCncl"
							name="btn-sortReqCncl"
							uitype="normal"
							class="btn btn-sm btn-outline-danger"
							onclick="fn_sortReqCncl"
							text="취소"
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
			                    id="btn-reg-bffa"
			                    name="btn-reg-bffa"
			                    class="btn btn-sm btn-success"
			                    
			                    text="신규등록" uitype="modal"
			                    onclick="fn_reg_bffa"
			            ></sbux-button>
					</div>
								    
				</div>
				<div class="table-responsive tbl_scroll_sm">
				<sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="webacc" is-scrollable="false" jsondata-ref="tabJsonData">
				</sbux-tabs>
				
				

				<div class="tab-content">
					<div id="exhstDsctnTab" >
						<div id="sb-area-exhstDsctn" style="height:470px;"></div>
					</div>
					<div id="grdDsctnTab" >
						<div id="sb-area-grdDsctn" style="height:470px;"></div>
					</div>
					<div id="grdBffaGrdTab" >
						<div id="sb-area-bffaGrd" style="height:470px;"></div>
					</div>
				</div>
					
				</div>
			</div>
		</div>
	</section>
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
    <div>
        <sbux-modal
            id="modal-apcLinkPop" 
            name="modal-apcLinkPop" 
            uitype="middle" 
            header-title="선별연계수신" 
            body-html-id="body-modal-apcLinkPop" 
            header-is-close-button="false" 
            footer-is-close-button="false" 
            style="width:800px"
        ></sbux-modal>
    </div>
    <div id="body-modal-apcLinkPop">
        <jsp:include page="../../am/popup/apcLinkPopup.jsp"></jsp:include>
     </div>
	<!-- clip report direct print area  -->
	<div id="div-rpt-clipReportPrint" style="display:none;"></div>
	
	<div>
    	<sbux-modal id="modal-regSort" name="modal-regSort" uitype="middle" header-title="참외 육안선별 등록" body-html-id="body-modal-regSort" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
	</div>
	<div id="body-modal-regSort">
    	<jsp:include page="../../am/popup/regSortBffa.jsp"></jsp:include>
	</div>
	
    
</body>

<script type="text/javascript">

	let lv_interval = 3 * 60 * 1000;
	
	let timerId;
	
	const fn_clearBatch = () => {
		if (!gfn_isEmpty(timerId)) {
			clearInterval(timerId);
		}
	}

	let currApcLink;
	
    /**
     * @name fn_getApcLink
     * @description apc 연계상태 확인
     * @function
     */
	const fn_getApcLink = async function() {
    	
		fn_clearBatch();
		
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/apc/selectApcLinkStts.do",
						{apcCd: gv_selectedApcCd}
					);
	        const data = await postJsonPromise;

	        if (_.isEqual("S", data.resultStatus)) {
	        	
	        	if (_.isEqual("S", data.resultStatus)) {
	        		
		        	const apcLink = data.resultMap;
					fn_setApcLink(apcLink);
		        	
	        	} else {
	        		fn_setApcLink(false);
	        	}
	        	
        	} else {
        		fn_setApcLink(false);
        	}

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
		} finally {
			timerId = setInterval(() => {
				fn_getApcLink();
			}, lv_interval);
		}
    }
    
    /**
     * @name fn_setApcLink
     * @description apc 연계상태 정보 표시
     * @function
     */
	const fn_setApcLink = function(apcLink) {
    	
		const sttsFigure = document.querySelector('#dtl-spn-sttsFigure');
		const trsmMatSttsNm = document.querySelector('#dtl-spn-trsmMatSttsNm');
		const reqDt = document.querySelector('#dtl-spn-reqDt');
		const cmptnDt = document.querySelector('#dtl-spn-cmptnDt');
		const sttsNm = document.querySelector('#dtl-spn-sttsNm');
		const emptyDt = "____-__-__ __:__:__";
		
    	if (gfn_isEmpty(apcLink)) {    		
    		sttsFigure.style.color = "#000000";
    		trsmMatSttsNm.innerText = "...";
    		trsmMatSttsNm.style.color = "#808080";
    		
    		reqDt.innerText = emptyDt;
    		cmptnDt.innerText = emptyDt;
    		sttsNm.innerText = "확인중";
    		sttsNm.style.color = "#808080";
    		
    		currApcLink = null;
    	} else {    		
    		sttsFigure.style.color = apcLink.trsmMatSttsColor;
    		trsmMatSttsNm.innerText = apcLink.trsmMatSttsNm;
    		trsmMatSttsNm.style.color = apcLink.trsmMatSttsColor;

    		reqDt.innerText = _.isEqual(apcLink.sortLinkStts, "P0") ? emptyDt : gfn_nvl(apcLink.sortReqDt, emptyDt);
    		cmptnDt.innerText = _.isEqual(apcLink.sortLinkStts, "P0") ? gfn_nvl(apcLink.sortPrcsCmptnDt, emptyDt) : emptyDt;
    		sttsNm.innerText = apcLink.sortSttsNm;
    		sttsNm.style.color = apcLink.sortSttsColor;
    		
    		currApcLink = apcLink;
    	}
    }
	
    /**
     * @name fn_sortReq
     * @description 선별정보 연계요청
     * @function
     */
 	const fn_sortReq = async function() {

 		if (!gfn_comConfirm("Q0001", "정보재수신 요청")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
 		// validation check
 		
		const param = {
			apcCd: gv_selectedApcCd,
			linkKnd: 'S',	// 선별
			linkStts: 'R0'	// 요청
		}

		try {
			const postJsonPromise = gfn_postJSON(
						"/am/apc/updateApcLinkStts.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        
	        if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		} finally {
			await fn_getApcLink();
		}
	}
 	
    /**
     * @name fn_sortReqCncl
     * @description 선별정보 연계요청 취소
     * @function
     */
 	const fn_sortReqCncl = async function() {

 		// validation check
 		if (!gfn_comConfirm("Q0001", "정보재수신 요청취소")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}
 		
		const param = {
			apcCd: gv_selectedApcCd,
			linkKnd: 'S',	// 선별
			linkStts: 'R9'	// 요청
		}

		try {
			const postJsonPromise = gfn_postJSON(
						"/am/apc/updateApcLinkStts.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        
	        if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
	        
		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		} finally {
			await fn_getApcLink();
		}
	}
 	
	
	var jsonComFcltCd				= [];	// 선별기
	var jsonPrdcrAutocomplete = []; // 생산자
	var jsonApcItem			= [];	// 품목 	itemCd			검색

	window.addEventListener('DOMContentLoaded', async function(e) {
		//SBUxMethod.openModal('modal-apcLinkPop');
		fn_init();

	})

	const fn_init = async function() {

		SBUxMethod.set("dtl-inp-apcCd", gv_selectedApcNm);
		SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateToYmd(new Date()));
		SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
		//fn_createExhstDsctn();
		//fn_createGrdDsctn();
		
		let rst = await Promise.all([			
			gfn_setComCdSBSelect('srch-slt-fcltCd',jsonComFcltCd, 'SORT_FCLT_CD', 	gv_selectedApcCd),	// 설비
			gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),								// 품목
			fn_getApcLink()
		]);
		
		
		
		if(gv_apcCd === "0203"){
				SBUxMethod.hideTab('idxTab_norm','grdDsctnTab');
		}
		
		fn_selectBffaGrdType();
		fn_search();
	}


	//그리드 id, 그리드 json
	//배출구별 집계 내역
	var grdExhstDsctn;
	//등급별 집계 내역
	var grdGrdDsctn;
	//육안등급판정
	var grdBffaGrd;

	//배출구별 집계 내역
	var jsonExhstDsctn = [];
	//등급별 집계 내역
	var jsonGrdDsctn= [];
	//육안등급판정내역
	var jsonBffaGrd= [];

	var jsonExhstColumnData = [];
	var jsonGrdColumnData = [];
	var jsonSortBffa = [];
    var exhstDsctnColumns = [];
    var addSortRsltExhstCol = [];
    
    /** 육안선별 코드 변수 **/
    var BffaGrdType = [];
    
    var tabJsonData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "배출구별 집계", "targetid" : "exhstDsctnTab", "targetvalue" : "배출구별 집계" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "등급별 집계", "targetid" : "grdDsctnTab", "targetvalue" : "등급별 집계" },
		{ "id" : "3", "pid" : "-1", "order" : "3", "text" : "육안등급판정", "targetid" : "grdBffaGrdTab", "targetvalue" : "육안등급판정" }
	];


	const fn_createExhstDsctn= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-exhstDsctn';
	    SBGridProperties.id = 'grdExhstDsctn';
	    SBGridProperties.jsonref = 'jsonExhstDsctn';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.clickeventarea = {fixed: false, empty: false};
		SBGridProperties.backcoloralternate = '#e0ffff';
	    SBGridProperties.columns = [
	    	{caption : ["선별기"], ref: 'sortFclt', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["선별정보"], ref: 'sortInfo', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption: ["등급"],    		ref: 'grd',     	type: 'input', width:'50px', 	style: 'text-align:center', disabled:true},
	    	{caption : ["소계"], ref: 'sbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#e0ffff '
	    							, format : {type:'number', rule:'#,##0',emptyvalue:'0'}, disabled:true},

	    	{caption : ["비고"], ref: 'rmrk', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', disabled:true},
	    	{caption: ["생산자코드"],	ref: 'prdcrCd',     		type:'input',  	hidden: true},
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        addSortRsltExhstCol = [];
        
        jsonExhstColumnData.forEach(function(item){
            
            addSortRsltExhstCol.push(
                    {caption : [item.GRD_SN.toString()], ref: 'exhst' + item.GRD_SN, type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px; '
                    , format : {type:'number', rule:'#,###', emptyvalue:'0'}, merge: false ,disabled:true}
               );
        })
        let originColumns = SBGridProperties.columns;
        originColumns.splice(3,0,...addSortRsltExhstCol);
        SBGridProperties.columns = originColumns;
        
        grdExhstDsctn = _SBGrid.create(SBGridProperties);
        //grdExhstDsctn.bind('click', fnClick)
        grdExhstDsctn.rebuild();
	}
	
	const fn_createGrdDsctn= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdDsctn';
	    SBGridProperties.id = 'grdGrdDsctn';
	    SBGridProperties.jsonref = 'jsonGrdDsctn';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.backcoloralternate = '#e0ffff';
		SBGridProperties.clickeventarea = {fixed: false, empty: false};	   
	    SBGridProperties.columns = [
	    	{caption : ["선별기"], ref: 'sortFclt', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["선별정보"], ref: 'sortInfo', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption: ["등급"],    		ref: 'grd',     	type: 'input', width:'100px', 	style: 'text-align:center', disabled:true},
	    	{caption : ["소계"], ref: 'sbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#e0ffff '
	    							, format : {type:'number', rule:'#,###',emptyvalue:'0'},fixedstyle : 'background-color:#e0ffff;', merge: false , disabled:true},

	    	{caption : ["비고"], ref: 'rmrk', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', disabled:true},
	    	{caption: ["생산자코드"],	ref: 'prdcrCd',     		type:'input',  	hidden: true},
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        let addSortRsltGrdCol = []
        
        jsonGrdColumnData.forEach(function(item){
            addSortRsltGrdCol.push(
                    {caption : [item.GRD_NM], ref: 'grd' + item.GRD_SN, type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px; '
                    , format : {type:'number', rule:'#,###', emptyvalue:'0'}, merge: false ,disabled:true}
               );
        })
        let originColumns = SBGridProperties.columns;
        originColumns.splice(3,0,...addSortRsltGrdCol);
        SBGridProperties.columns = originColumns;
	    grdGrdDsctn = _SBGrid.create(SBGridProperties);
	    //grdGrdDsctn.bind('click', fnClick)


	}
	
	const fn_createBffaGrd= function() {
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-bffaGrd';
	    SBGridProperties.id = 'grdBffaGrd';
	    SBGridProperties.jsonref = 'jsonBffaGrd';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    //SBGridProperties.mergecells = 'bycolrec';
	    SBGridProperties.fixedrowheight = 50;
	    SBGridProperties.allowcopy = true;
	    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.backcoloralternate = '#e0ffff';
		SBGridProperties.clickeventarea = {fixed: false, empty: false};	   
	    SBGridProperties.columns = [
	    	{caption : ["선별일자"], ref: 'sortYmd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["선별기"], ref: 'sortFclt', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["선별정보"], ref: 'sortInfo', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["박스수량"], ref: 'bxQntt', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["입고중량"], ref: 'wrhsWght', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["열과"], ref: 'skinCrack', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["폐기"], ref: 'dscd', type: 'input',  width:'100px', style: 'text-align:center; padding-right:5px;' , disabled:true  },
	    	{caption : ["합계"], ref: 'sbTot', type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px;background-color:#e0ffff '
	    							, format : {type:'number', rule:'#,###',emptyvalue:'0'},fixedstyle : 'background-color:#e0ffff;', merge: false , disabled:true},

	    	{caption : ["비고"], ref: 'rmrk', type: 'input',  width:'50px', style: 'text-align:right; padding-right:5px;', disabled:true},
	    	{caption: ["생산자코드"],	ref: 'prdcrCd',     		type:'input',  	hidden: true},
	    	{caption: ["선별번호"],	ref: 'sortNo',     		type:'input',  	hidden: true}

	    ];
        let addBffaGrdCol = []
        
        jsonGrdColumnData.forEach(function(item){
        	addBffaGrdCol.push(
                    {caption : [item.GRD_NM], ref: 'grd' + item.GRD_SN, type: 'input',  width:'100px', style: 'text-align:right; padding-right:5px; '
                    , format : {type:'number', rule:'#,###', emptyvalue:'0'}, merge: false ,disabled:true}
               );
        })
        let originColumns = SBGridProperties.columns;
        originColumns.splice(7,0,...addBffaGrdCol);
        SBGridProperties.columns = originColumns;
        grdBffaGrd= _SBGrid.create(SBGridProperties);
	    grdBffaGrd.bind('click', fn_reg_bffa);
	    
	}
	
	const fnClick = function(){
		//fn_createGrid();
		//SBUxMethod.openModal('modal-regSort');
	}

    const fn_popApcLinkCallBack = function() {
        
    }
    
     const fn_popApcLink = function() {
         popApcLink.init(
                     {
                         apcCd: gv_selectedApcCd,
                         apcNm: gv_selectedApcNm,
                         linkKnd: "S",
                     },
                     fn_popApcLinkCallBack
                 );
     }
	
	
	
	// 배출구별 집계
	const fn_setExhstDsctnTot = async function() {
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
		let sortFclt = SBUxMethod.get("srch-slt-fcltCd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		//gv_selectedApcCd
		const param = {
			apcCd: gv_selectedApcCd 
			, prdcrCd : prdcrCd
			, inptYmdFrom : inptYmdFrom
			, inptYmdTo  : inptYmdTo
			, sortFclt : sortFclt
			, prdcrCd : prdcrCd
			, itemCd : itemCd
		}
		jsonExhstDsctn.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/sort/selectExhstDsctn.do",
						param,
						null,
						false
					);
	        const data = await postJsonPromise;
	        let sumTot1 = {exhst1 : 0,exhst2 : 0, exhst3 : 0,exhst4 : 0,exhst5 : 0,exhst6 : 0,exhst7 : 0,exhst8 : 0,exhst9 : 0,exhst10 : 0,exhst11 : 0,exhst12 : 0,exhst13 : 0,exhst14 : 0,exhst15 : 0,exhst16 : 0,exhst17 : 0,exhst18 : 0,exhst19 : 0,exhst20 : 0,exhst21 : 0,exhst22 : 0,exhst23 : 0};
	        let sumTot2 = {exhst1 : 0,exhst2 : 0, exhst3 : 0,exhst4 : 0,exhst5 : 0,exhst6 : 0,exhst7 : 0,exhst8 : 0,exhst9 : 0,exhst10 : 0,exhst11 : 0,exhst12 : 0,exhst13 : 0,exhst14 : 0,exhst15 : 0,exhst16 : 0,exhst17 : 0,exhst18 : 0,exhst19 : 0,exhst20 : 0,exhst21 : 0,exhst22 : 0,exhst23 : 0};
	        data.resultList.forEach((item, index) => {
	        	const exhstDsctnQnttTot = {
	        			grd     : item.GRD
	        			,sortFclt : item.FCLT_NM
	        			,sortInfo : item.PRDCR_NM
	        			,grd      : "수량"
	        				,exhst1 : item.QNTT_1
	        				,exhst2 : item.QNTT_2
	        				,exhst3 : item.QNTT_3
	        				,exhst4 : item.QNTT_4
	        				,exhst5 : item.QNTT_5
	        				,exhst6 : item.QNTT_6
	        				,exhst7 : item.QNTT_7
	        				,exhst8 : item.QNTT_8
	        				,exhst9 : item.QNTT_9
	        				,exhst10 : item.QNTT_10
	        				,exhst11 : item.QNTT_11
	        				,exhst12 : item.QNTT_12
	        				,exhst13 : item.QNTT_13
	        				,exhst14 : item.QNTT_14
	        				,exhst15 : item.QNTT_15
	        				,exhst16 : item.QNTT_16
	        				,exhst17 : item.QNTT_17
	        				,exhst18 : item.QNTT_18
	        				,exhst19 : item.QNTT_19
	        				,exhst20 : item.QNTT_20
	        				,exhst21 : item.QNTT_21
	        				,exhst22 : item.QNTT_22
                            ,exhst23 : item.QNTT_23
                            ,exhst24 : item.QNTT_24
                            ,exhst25 : item.QNTT_25
                            ,exhst26 : item.QNTT_26
                            ,exhst27 : item.QNTT_27
                            ,exhst28 : item.QNTT_28
                            ,exhst29 : item.QNTT_29
                            ,exhst30 : item.QNTT_30
    						,sbTot        : item.SORT_QNTT

	        	};
				const exhstDsctnWghtTot = 		{
        			sortFclt : item.FCLT_NM
        			,sortInfo : item.INPT_YMD
        			,grd      : "중량"
        				,exhst1 : item.WGHT_1
        				,exhst2 : item.WGHT_2
        				,exhst3 : item.WGHT_3
        				,exhst4 : item.WGHT_4
        				,exhst5 : item.WGHT_5
        				,exhst6 : item.WGHT_6
        				,exhst7 : item.WGHT_7
        				,exhst8 : item.WGHT_8
        				,exhst9 : item.WGHT_9
        				,exhst10 : item.WGHT_10
        				,exhst11 : item.WGHT_11
        				,exhst12 : item.WGHT_12
        				,exhst13 : item.WGHT_13
        				,exhst14 : item.WGHT_14
        				,exhst15 : item.WGHT_15
        				,exhst16 : item.WGHT_16
        				,exhst17 : item.WGHT_17
        				,exhst18 : item.WGHT_18
        				,exhst19 : item.WGHT_19
        				,exhst20 : item.WGHT_20
        				,exhst21 : item.WGHT_21
        				,exhst22 : item.WGHT_22
                        ,exhst23 : item.WGHT_23
                        ,exhst24 : item.WGHT_24
                        ,exhst25 : item.WGHT_25
                        ,exhst26 : item.WGHT_26
                        ,exhst27 : item.WGHT_27
                        ,exhst28 : item.WGHT_28
                        ,exhst29 : item.WGHT_29
                        ,exhst30 : item.WGHT_30
					,sbTot        : item.SORT_WGHT
        		}
	        	jsonExhstDsctn.push(exhstDsctnQnttTot);
	        	jsonExhstDsctn.push(exhstDsctnWghtTot);	    
	        	sumTot1 = sumValues(sumTot1,exhstDsctnQnttTot);	        	
        		sumTot2 = sumValues(sumTot2,exhstDsctnWghtTot);
        		
	        });	      
	         
	        sumTot1["sortFclt"] = "합계"; sumTot1["grd"] = "수량"; sumTot1["sortInfo"] = "합계";
	        sumTot2["sortFclt"] = "합계"; sumTot2["grd"] = "중량"; sumTot2["sortInfo"] = "합계";
            sumTot1["sbTot"] = sumTot1.exhst1+    sumTot1.exhst2+    sumTot1.exhst3+    sumTot1.exhst4+    sumTot1.exhst5+    sumTot1.exhst6+    sumTot1.exhst7+    sumTot1.exhst8+    sumTot1.exhst9+    sumTot1.exhst10+    sumTot1.exhst11+    sumTot1.exhst12+    sumTot1.exhst13+    sumTot1.exhst14+    sumTot1.exhst15+    sumTot1.exhst16+    sumTot1.exhst17+    sumTot1.exhst18+    sumTot1.exhst19+    sumTot1.exhst20+    sumTot1.exhst21+    sumTot1.exhst22+    sumTot1.exhst23 + sumTot1.exhst24 + sumTot1.exhst25 + sumTot1.exhst26 + sumTot1.exhst27 + sumTot1.exhst28 + sumTot1.exhst29 + sumTot1.exhst30; 
            sumTot2["sbTot"] = sumTot2.exhst1+    sumTot2.exhst2+    sumTot2.exhst3+    sumTot2.exhst4+    sumTot2.exhst5+    sumTot2.exhst6+    sumTot2.exhst7+    sumTot2.exhst8+    sumTot2.exhst9+    sumTot2.exhst10+    sumTot2.exhst11+    sumTot2.exhst12+    sumTot2.exhst13+    sumTot2.exhst14+    sumTot2.exhst15+    sumTot2.exhst16+    sumTot2.exhst17+    sumTot2.exhst18+    sumTot2.exhst19+    sumTot2.exhst20+    sumTot2.exhst21+    sumTot2.exhst22+    sumTot2.exhst23 + sumTot2.exhst24 + sumTot2.exhst25 + sumTot2.exhst26 + sumTot2.exhst27 + sumTot2.exhst28 + sumTot2.exhst29 + sumTot2.exhst30;

	        jsonExhstDsctn.push(sumTot1);
	        jsonExhstDsctn.push(sumTot2);
	        //const allData = grdExhstDsctn.getGridDataAll();
			

	        grdExhstDsctn.refresh();
	        

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	function sumValues(obj1,obj2){
		const result = {};
		for(const key in obj1){
			if(obj1.hasOwnProperty(key)){
				const val1 = obj1[key];
				const val2 = obj2[key] || 0;
				result[key] = val1 + val2 
			}
		}
		return result;
	}
	// 등급별 집계
	const fn_setGrdDsctnTot = async function() {
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let prdcrCd = SBUxMethod.get('srch-inp-prdcrCd');
		const param = {
			apcCd: gv_selectedApcCd,
			inptYmdFrom: inptYmdFrom,
			inptYmdTo: inptYmdTo,
			itemCd: itemCd,
			prdcrCd : prdcrCd,
			itemCd : itemCd
		}
		jsonGrdDsctn.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/sort/selectGrdDsctn.do",
						param,
						null,
						false
					);
			let sumTot1 = {grd1 : 0,grd2 : 0, grd3 : 0,grd4 : 0,grd5 : 0,grd6 : 0,grd7 : 0,grd8 : 0,grd9 : 0};
 	        let sumTot2 = {grd1 : 0,grd2 : 0, grd3 : 0,grd4 : 0,grd5 : 0,grd6 : 0,grd7 : 0,grd8 : 0,grd9 : 0};
	        const data = await postJsonPromise;	        	        
	 	        data.resultList.forEach((item, index) => {
	 	        	const grdDsctnQnttTot = {
	 	        			sortFclt : item.FCLT_NM
                            ,sortInfo : item.PRDCR_NM
	 	        			,grd      : "수량"
	         				,grd1 : item.QNTT_1
	         				,grd2 : item.QNTT_2
	         				,grd3 : item.QNTT_3
	         				,grd4 : item.QNTT_4
	         				,grd5 : item.QNTT_5
	         				,grd6 : item.QNTT_6
	         				,grd7 : item.QNTT_7
	         				,grd8 : item.QNTT_8
	         				,grd9 : item.QNTT_9	         				
	         				,sbTot        : item.SORT_QNTT

	 	        	};
	 				const grdDsctnWghtTot = 		{
                         sortFclt : item.FCLT_NM
                        ,sortInfo : item.INPT_YMD
	         			,grd      : "중량"
	         				,grd1 : item.WGHT_1
	         				,grd2 : item.WGHT_2
	         				,grd3 : item.WGHT_3
	         				,grd4 : item.WGHT_4
	         				,grd5 : item.WGHT_5
	         				,grd6 : item.WGHT_6
	         				,grd7 : item.WGHT_7
	         				,grd8 : item.WGHT_8
	         				,grd9 : item.WGHT_9	         				
	         				,sbTot        : item.SORT_WGHT
	         		};
	 	        	jsonGrdDsctn.push(grdDsctnQnttTot);
	 	        	jsonGrdDsctn.push(grdDsctnWghtTot);	    
	 	        	sumTot1 = sumValues(sumTot1,grdDsctnQnttTot);	        	
	         		sumTot2 = sumValues(sumTot2,grdDsctnWghtTot);
	         		
	 	        });	      
	 	         
	 	        sumTot1["sortFclt"] = "합계"; sumTot1["grd"] = "수량"; sumTot1["sortInfo"] = "합계";
	 	        sumTot2["sortFclt"] = "합계"; sumTot2["grd"] = "중량"; sumTot2["sortInfo"] = "합계";
	 	        sumTot1["sbTot"] = sumTot1.grd1 + sumTot1.grd2 + sumTot1.grd3 + sumTot1.grd4 + sumTot1.grd5 + sumTot1.grd6 + sumTot1.grd7 + sumTot1.grd8 + sumTot1.grd9;  
	 	        sumTot2["sbTot"] = sumTot2.grd1 + sumTot2.grd2 + sumTot2.grd3 + sumTot2.grd4 + sumTot2.grd5 + sumTot2.grd6 + sumTot2.grd7 + sumTot2.grd8 + sumTot2.grd9;

	 	        jsonGrdDsctn.push(sumTot1);
	 	        jsonGrdDsctn.push(sumTot2);


	        //const allData = grdGrdDsctn.getGridDataAll();


	        grdGrdDsctn.refresh();
	        

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
	// 육안판정등급 집계
	const fn_setBffaGrdTot = async function() {
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let prdcrCd = SBUxMethod.get('srch-inp-prdcrCd');
		const param = {
			apcCd: gv_selectedApcCd,
			inptYmdFrom: inptYmdFrom,
			inptYmdTo: inptYmdTo,
			itemCd: itemCd,
			prdcrCd : prdcrCd			
		}
		jsonBffaGrd.length = 0;
		let totalRecordCount = 0;
		try {
			const postJsonPromise = gfn_postJSON(
						"/am/sort/selectBffaGrdTot.do",
						param,
						null,
						false
					);
			
	        const data = await postJsonPromise;	        	        
	 	        data.resultList.forEach((item, index) => {
	 	        	const grdBffaGrdTot = {
	 	        			sortYmd : item.INPT_YMD
	 	        			,sortFclt : item.FCLT_NM
                            ,sortInfo : item.PRDCR_NM
                            ,bxQntt : item.WRHS_QNTT
                            ,wrhsWght : item.WHOL_WGHT
                            ,dscd : item.GRD_TYPE_1_WGHT
                            ,skinCrack : item.GRD_TYPE_2_WGHT
	         				,grd1 : item.QNTT_1
	         				,grd2 : item.QNTT_2
	         				,grd3 : item.QNTT_3
	         				,grd4 : item.QNTT_4
	         				,grd5 : item.QNTT_5
	         				,grd6 : item.QNTT_6
	         				,grd7 : item.QNTT_7
	         				,grd8 : item.QNTT_8
	         				,grd9 : item.QNTT_9	         				
	         				,sbTot        : item.SORT_QNTT

	 	        	};

	 	        	jsonBffaGrd.push(grdBffaGrdTot);
	 	        });	      

	        
	        grdBffaGrd.refresh();
	        

		} catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
 			//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}


	const fn_search = async function () {
        await fn_setExhstDsctnCol(); // 배출구 컬럼 
        await fn_setGrdDsctnCol(); // 등급별 컬럼
        fn_createBffaGrd();
        fn_createGrdDsctn();
        fn_createExhstDsctn();
        fn_setExhstDsctnTot(); // 배출구 집계
        fn_setGrdDsctnTot(); // 등급 집계
        fn_setBffaGrdTot(); // 육안등급판정 집계
	}

	const fn_dtpChange = function(){
		let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
		let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
		if(gfn_diffDate(inptYmdFrom, inptYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-inptYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-inptYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuList = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnld,			//콜백함수명
        }
    };

     // 엑셀 다운로드
     function fn_excelDwnld() {
    	 grdExhstDsctn.exportLocalExcel("배출구별집계", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
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
 		// 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
 		if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
 			document.getElementById('btn-srch-prdcr').click();
 		}
 		else{
 			SBUxMethod.set("srch-inp-prdcrCd", value);
 			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
 		}
 	}

     const fn_choicePrdcr = function() {
 		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
 	}

 	const fn_setPrdcr = function(prdcr) {
 		if (!gfn_isEmpty(prdcr)) {
 			SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
 			SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
 			SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
 		}
 	}
 	
    const fn_setExhstDsctnCol = async function() {
        let itemCd = SBUxMethod.get('srch-slt-itemCd');
        const param = {
            apcCd: gv_selectedApcCd 
            , grdSeCd : '02'
            , itemCd : itemCd
        }
        jsonExhstColumnData.length = 0;
        try {
            const postJsonPromise = gfn_postJSON(
                        "/am/sort/selectExhstDsctnCol.do",
                        param,
                        null,
                        false
                    );
            
            
            const data = await postJsonPromise;
            jsonExhstColumnData = data.resultList;
            //await fn_createExhstDsctn();

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
             //gfn_comAlert("E0001");    //    E0001    오류가 발생하였습니다.
        }
        
    }
    
    const fn_setGrdDsctnCol = async function() {
        let itemCd = SBUxMethod.get('srch-slt-itemCd');
        const param = {
            apcCd: gv_selectedApcCd 
            , grdSeCd : '03'
            , itemCd : itemCd
        }
        jsonGrdColumnData.length = 0;
        try {
            const postJsonPromise = gfn_postJSON(
                        "/am/sort/selectExhstDsctnCol.do",
                        param,
                        null,
                        false
                    );
            
            
            const data = await postJsonPromise;
            jsonGrdColumnData = data.resultList;
            //await fn_createGrdDsctn();
            //await fn_createBffaGrd();

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
             //gfn_comAlert("E0001");    //    E0001    오류가 발생하였습니다.
        }
        
    }
     
 	
 	/**
	 * @name fn_docSort
	 * @description 선별확인서 발행
	 */
	const fn_docSort = async function() {
		const sortnoSnList = [];
		const sortnoList = [];
		const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'ST_DOC');
		const allData = grdExhstDsctn.getGridDataAll();
		allData.forEach((item) => {
			if (item.checkedYn === "Y") {
				sortnoSnList.push(item.sortno + item.sortSn);
				sortnoList.push(item.sortno);
    		}
		});

 		if (sortnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const sortnoSn = sortnoSnList.join("','");
 		const sortno = sortnoList.join("','");
 		gfn_popClipReport("선별확인서", rptUrl, {apcCd: gv_selectedApcCd, sortnoSn: sortnoSn, sortno: sortno});
 		//gfn_popClipReport("선별확인서", "am/sortIdntyDoc.crf", {apcCd: gv_selectedApcCd, sortnoSn: sortnoSn, sortno: sortno});
 	}
 	
    /** 육안선별 등록 팝업함수 **/
    const fn_reg_bffa = function(){
        let itemCd = SBUxMethod.get('srch-slt-itemCd');

        if(gfn_isEmpty(itemCd)){
            gfn_comAlert("W0005", "품목");
            return
        }
        popBffa.init(gv_apcCd,gv_selectedApcNm,itemCd,BffaGrdType,fn_bffaSearch);
        SBUxMethod.openModal('modal-regSort');
    }
 	
    /** 품목 선택시 육안선별 종류 SELECT **/
    const fn_selectBffaGrdType = async function(){
        let itemCd = SBUxMethod.get("srch-slt-itemCd");

        if(!gfn_isEmpty(itemCd)){
            try{
               let postJsonPromise = gfn_postJSON('/am/cmns/apcBffaType',{
                    apcCd:gv_apcCd,
                    itemCd:itemCd
                });
                let data = await postJsonPromise;
                if (_.isEqual("S", data.resultStatus)) {
                    BffaGrdType = data.resultList;
                }
                //await fn_createGrid();
            }catch (e){
                console.log(e);
            }
        }
    }
    
    /** 육안선별 목록 조회 **/
    const fn_bffaSearch = async function(){
        jsonSortBffa.length = 0;

        let inptYmdFrom = SBUxMethod.get("srch-dtp-inptYmdFrom");
        let inptYmdTo = SBUxMethod.get("srch-dtp-inptYmdTo");
        let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
        let fcltCd = SBUxMethod.get("srch-slt-fcltCd");
        let itemCd = SBUxMethod.get("srch-slt-itemCd");

        let postJsonPromise = gfn_postJSON("/am/sort/selectSortBffa.do",
            {
                apcCd : gv_apcCd,
                inptYmdFrom : inptYmdFrom,
                inptYmdTo : inptYmdTo,
                prdcrCd : prdcrCd,
                fcltCd : fcltCd,
                itemCd : itemCd
            });
            const data  = await postJsonPromise;
            try{
                if(_.isEqual("S",data.resultStatus)){
                    data.resultList.forEach(function(item){
                        let bffaObj =
                            {
                                apcCd     : item.apcCd,
                                bffaWrhsno: item.bffaWrhsno,
                                wrhsYmd   : item.wrhsYmd,
                                prdcrNm   : item.prdcrNm,
                                prdcrCd   : item.prdcrCd,
                                fcltNm    : item.fcltNm,
                                fcltCd    : item.fcltCd,
                                wrhsQntt  : item.wrhsQntt,
                                wholWght  : item.wholWght,
                                icptWght  : item.icptWght,
                                grdType1Wght : item.grdType1Wght,
                                grdType2Wght : item.grdType2Wght,
                                grdType3Wght : item.grdType3Wght,
                                wrhsWght  : item.wrhsWght,
                                rmrk      : item.rmrk,
                                itemCd    : item.itemCd,

                            }
                        jsonSortBffa.push(bffaObj);
                    });
                    grdSortBffa.rebuild();
                }
            }catch (e){

            }
    }
	

     
     


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>