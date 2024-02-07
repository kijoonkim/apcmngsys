<%
 /**
  * @Class Name : spmtPrfmncRegByGrd.jsp
  * @Description : 출하실적등록(등급별) 화면
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>출하실적등록(등급별)</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 출하실적등록(등급별) -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btn-save" 
						name="btn-save" 
						uitype="normal" 
						text="저장" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_save"
					></sbux-button>
					<sbux-button 
						id="btn-search" 
						name="btn-save" 
						uitype="normal" 
						text="실적조회" 
						class="btn btn-sm btn-outline-danger" 
						onclick="fn_search"
					></sbux-button>
				</div>
			</div>
			<div class="box-body">
				<!--[pp] 검색 -->
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
						<col style="width: 3%">
						<col style="width: 6%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" class="th_bg"><span class="data_required"></span>출하일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-spmtYmd" name="srch-dtp-spmtYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed" onchange="fn_dtpChange(srch-dtp-pckgYmdFrom)"></sbux-datepicker>
							</td>
							<td colspan="2" class="td_input"></td>

							<th scope="row" class="th_bg"><span class="data_required"></span>거래처</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-select
									uitype="single"
									id="srch-slt-cnptCd"
									name="srch-slt-cnptCd"
									class="form-control input-sm input-sm-ast inpt_data_reqed"
									unselected-text="선택"
									jsondata-ref="jsonCnpt"
									onchange="fn_onChangeSrchCnptCd(this)"
								></sbux-select>
							</td>
							<td colspan="6" class="td_input"></td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->
				<!--[pp] 검색결과 -->

				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>출하내역</span></li>
					</ul>
				</div>
					<div class="ad_tbl_toplist">
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdSpmtReg" style="height:283px;"></div>
				</div>

				<br>

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
							<th scope="row" class="th_bg">운송회사</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select
									id="dtl-slt-trsprtCoCd" 
									name="dtl-slt-trsprtCoCd" 
									uitype="single" 
									class="form-control input-sm" 
									unselected-text="선택"
									jsondata-ref="jsonTrsprtCo"
								></sbux-select>
							</td>
							<td class="td_input"></td>
							<th scope="row" class="th_bg">차량번호</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input 
									id="dtl-inp-vhclno" 
									name="dtl-inp-vhclno" 
									uitype="text" 
									class="form-control input-sm" 
									maxlength="9"
								></sbux-input>
							</td>
							<td colspan="2" class="td_input">
								<sbux-button 
									id="dtl-btn-vhcl" 
									name="dtl-btn-vhcl" 
									class="btn btn-xs btn-outline-dark" 
									text="찾기" 
									uitype="modal" 
									target-id="modal-vhcl" 
									onclick="fn_choiceVhcl"
								></sbux-button>
							</td>
							<th scope="row" class="th_bg">배송처</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input 
									id="dtl-inp-dldtn" 
									name="dtl-inp-dldtn" 
									uitype="text" 
									class="form-control input-sm"
								></sbux-input>
							</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">운임비용</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input 
									id="dtl-inp-trsprtCst" 
									name="dtl-inp-trsprtCst" 
									uitype="text" 
									class="form-control input-sm"
									autocomplete="off"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
									maxlength="10"
								></sbux-input>
							</td>
							<td class="td_input"></td>
							<th scope="row" class="th_bg">출하자신고번호</th>
							<td colspan="3" class="td_input">
								<sbux-input
									id="dtl-inp-spmtPrsnDclrno"
									name="dtl-inp-spmtPrsnDclrno"
									uitype="text"
									class="form-control input-sm"
									mask = "999999-999999"
								></sbux-input>
							</td>
							<th scope="row" class="th_bg">팔레트불출</th>
							<td class="td_input" colspan="2">
								<sbux-select
									id="dtl-slt-pltBxCd"
									name="dtl-slt-pltBxCd"
									uitype="single"
									class="form-control input-sm"
									unselected-text="선택"
									jsondata-ref="jsonPltBx"
								></sbux-select>
							</td>
							<td class="td_input">
								<sbux-input
									id="dtl-inp-bssInvntrQntt"
									name="dtl-inp-bssInvntrQntt"
									uitype="text"
									class="form-control input-sm"
									autocomplete="off"
									mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
									maxlength="3"
								></sbux-input>
							</td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">비고</th>
							<td colspan="11" class="td_input" style="border-right: hidden;">
								<sbux-input 
									id="dtl-inp-rmrk" 
									name="dtl-inp-rmrk" 
									uitype="text" 
									class="form-control input-sm"
								></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>출하실적 내역</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist">
						<sbux-button id="btn-docSpmt" name="btn-docSpmt" uitype="normal" text="송품장" class="btn btn-sm btn-primary" onclick="fn_docSpmt"></sbux-button>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-spmtPrfmnc" style="height:180px;"></div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal 
        	id="modal-cnpt" 
        	name="modal-cnpt" 
        	uitype="middle" 
        	header-title="거래처 선택" 
        	body-html-id="body-modal-cnpt" 
        	footer-is-close-button="false" 
        	header-is-close-button="false" 
        	style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="../../am/popup/cnptPopup.jsp"></jsp:include>
    </div>
    
    <!-- 차량 선택 Modal -->
    <div>
        <sbux-modal 
        	id="modal-vhcl" 
        	name="modal-vhcl" 
        	uitype="middle" 
        	header-title="차량 선택" 
        	body-html-id="body-modal-vhcl" 
        	footer-is-close-button="false" 
        	header-is-close-button="false" 
        	style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-vhcl">
    	<jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
    </div>
	<!-- 출하지시번호 선택 Modal -->
    <div>
        <sbux-modal id="modal-spmtCmnd" name="modal-spmtCmnd" uitype="middle" header-title="출하지시번호 선택" body-html-id="body-modal-spmtCmnd" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-spmtCmnd">
    	<jsp:include page="../../am/popup/spmtCmndPopup.jsp"></jsp:include>
    </div>

    <!--  출하실적엑셀 팝업 -->
    <div>
		<sbux-modal id="modal-excel-spmtPrfmnc" name="modal-excel-spmtPrfmnc"
			uitype="middle"
			header-title="출하실적등록"
			body-html-id="body-modal-excelSpmtPrfmnc"
			footer-is-close-button="false"
			header-is-close-button="false"
			style="width:1000px"
		></sbux-modal>
	</div>
    <div id="body-modal-excelSpmtPrfmnc">
    	<jsp:include page="../../am/popup/spmtPrfmncExcelPopup.jsp"></jsp:include>
    </div>
    <sbux-button id="btnSpmtPrfmncPopup" name="btnSpmtPrfmncPopup" uitype="modal" text="엑셀등록" style="width:100%; display:none" class="btn btn-sm btn-outline-dark" target-id="modal-excel-spmtPrfmnc"></sbux-button>
</body>
<script type="text/javascript">
	
	var jsonItem			= [];	// 품목
	var jsonVrty			= [];	// 품종
	var jsonSpcfct			= [];	// 규격
	var jsonCnpt			= [];	// 거래처
	var jsonWarehouse		= [];	// 창고
	var jsonTrsprtCo		= [];	// 운송사
	var jsonGdsGrd			= [];	// 상품등급
	var jsonSpmtPckgUnit	= [];	// 출하포장단위
	var jsonPltBx			= [];	// 팔레트
	var jsonPrdcr			= [];	// 생산자
	
	var jsonSpmtReg			= [];	// 출하내역 (등록용)
	var jsonSpmtPrfmnc		= [];	// 출하실적
	
	var grdSpmtReg;
	var grdSpmtPrfmnc;
	
	var cmndYn = false;

	window.addEventListener('DOMContentLoaded', async function(e) {		
		fn_init();
	})
	
	/**
	 * @name fn_init
	 * @description 화면 초기 설정
	 */
	const fn_init = async function() {
		SBUxMethod.set("srch-dtp-spmtYmd", gfn_dateToYmd(new Date()));
		//fn_createSmptPrfmncGrid();
		await fn_initSBSelect();
		
		fn_createGridSpmtReg();
		
		fn_createGridSpmtPrfmnc();
	}
	
	/**
	 * @name fn_initSBSelect
	 * @description 초기 데이터 조회
	 */
	const fn_initSBSelect = async function() {
		
		let rst = await Promise.all([
			gfn_setCpntSBSelect('srch-slt-cnptCd', 			jsonCnpt, 		gv_selectedApcCd),		// 거래처
			gfn_setTrsprtsSBSelect('dtl-slt-trsprtCoCd', 	jsonTrsprtCo,	gv_selectedApcCd),		// 운송사
		 	gfn_setPltBxSBSelect('dtl-slt-pltBxCd', 		jsonPltBx, 		gv_selectedApcCd, "P"), // 팔레트
		 	gfn_getComCdDtls('WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
		 	gfn_getApcItem(gv_selectedApcCd),		// 품목
		 	gfn_getApcVrty(gv_selectedApcCd),		// 품종
		 	gfn_getApcSpcfcts(gv_selectedApcCd),	// 규격
		 	gfn_getApcGdsGrd(gv_selectedApcCd, null, _GRD_SE_CD_GDS),	// 상품등급
		 	gfn_getSpmtPckgUnits(gv_selectedApcCd),	// 출하포장단위
		 	gfn_getPrdcrs(gv_selectedApcCd)			// 생산자
		]);
		
		jsonWarehouse 		= rst[3];
		jsonItem 			= rst[4];
		jsonVrty 			= rst[5];
		jsonSpcfct 			= rst[6];
		jsonGdsGrd			= rst[7];
		jsonSpmtPckgUnit	= rst[8];
		jsonPrdcr			= rst[9];
		
		jsonGdsGrd.forEach((item) => {
			item.itemGrdNm = "[" + item.itemNm + "] " + item.grdNm;
		});
		
	}

	/**
	 * @name fn_search
	 * @description 조회
	 */
	const fn_search = async function(){
		
		/*
		const spmtYmd = SBUxMethod.get("srch-dtp-spmtYmd");
		const cnptCd = SBUxMethod.get("srch-slt-cnptCd");
		
		if (gfn_isEmpty(cnptCd)) {
			gfn_comAlert("W0001", "거래처");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		*/
		
		fn_createGridSpmtReg();
		await fn_setGrdSmptPrfmnc();		
	}
	
	/**
	 * @name fn_save
	 * @description 저장
	 */
	const fn_save = async function() {

    	let spmtYmd			= SBUxMethod.get("srch-dtp-spmtYmd");
    	let cnptCd			= SBUxMethod.get("srch-slt-cnptCd");
    	let trsprtCoCd		= SBUxMethod.get("dtl-slt-trsprtCoCd");
    	let trsprtCoNm		= SBUxMethod.getText("dtl-slt-trsprtCoCd");
    	let vhclno			= SBUxMethod.get("dtl-inp-vhclno");
    	let dldtn			= SBUxMethod.get("dtl-inp-dldtn");
    	let trsprtCst		= SBUxMethod.get("dtl-inp-trsprtCst");
    	let rmrk			= SBUxMethod.get("dtl-inp-rmrk");
    	let pltBxCd			= SBUxMethod.get("dtl-slt-pltBxCd");
    	let bssInvntrQntt 	= parseInt(SBUxMethod.get("dtl-inp-bssInvntrQntt")) || 0;
    	let spmtPrsnDclrno 	= SBUxMethod.get("dtl-inp-spmtPrsnDclrno");

    	let totBssInvntrQntt = 0;

    	if (gfn_isEmpty(spmtYmd)){
    		gfn_comAlert("W0001", "출하일자");			//	W0001	{0}을/를 선택하세요.
            return;
    	}
    	
    	if (gfn_isEmpty(cnptCd)){
    		gfn_comAlert("W0001", "거래처");			//	W0001	{0}을/를 선택하세요.
            return;
    	}

    	if (!gfn_isEmpty(vhclno)){
    		if(!(/^\d{2,3}[가-힣]\d{4}/.exec(vhclno))){
	    		gfn_comAlert("W0011", "차량번호");			//	W0001	{0}이/가 아닙니다.
    			return;
    		}
    	}

		const allSpmtData = grdSpmtReg.getGridDataAll();
				
		const spmtPrfmncList = [];
		
		for ( let i=0; i<allSpmtData.length-1; i++ ) {
    		
			const rowData = allSpmtData[i];
			
			if (gfn_isEmpty(rowData.spmtPckgUnitCd)) {
    			gfn_comAlert("W0001", "상품명");		//	W0001	{0}을/를 선택하세요.
    			return;
    		}
			
			if (gfn_isEmpty(rowData.itemGrdCd)) {
    			gfn_comAlert("W0001", "등급");		//	W0001	{0}을/를 선택하세요.
    			return;
    		}
			
			if (gfn_isEmpty(rowData.itemCd)) {
				gfn_comAlert("W0005", "품목");		//	W0005	{0}이/가 없습니다.
    			return;
			}
			
			if (gfn_isEmpty(rowData.itemVrtyCd)) {
				gfn_comAlert("W0005", "품종");		//	W0005	{0}이/가 없습니다.
    			return;
			}
			
			if (gfn_isEmpty(rowData.itemSpcfctCd)) {
				gfn_comAlert("W0005", "규격");		//	W0005	{0}이/가 없습니다.
    			return;
			}
			
			if (gfn_isEmpty(rowData.prdcrCd)) {
				gfn_comAlert("W0005", "생산자");		//	W0005	{0}이/가 없습니다.
    			return;
			}
			
			const invntrQntt = parseInt(rowData.invntrQntt) || 0;
			const invntrWght = parseFloat(rowData.invntrWght) || 0;
			
			const spmtQntt = parseInt(rowData.spmtQntt) || 0;
			const spmtWght = parseFloat(rowData.spmtWght) || 0;
			
    		if (spmtQntt <= 0){
    			gfn_comAlert("W0005", "출하수량");		//	W0005	{0}이/가 없습니다.
    			return;
    		}
    		
    		if (spmtWght <= 0){
    			gfn_comAlert("W0005", "출하중량");		//	W0005	{0}이/가 없습니다.
    			return;
    		}
    		
    		if (spmtQntt > invntrQntt){
    			gfn_comAlert("W0014", "출하수량", "재고수량");		//	W0014	{0}이/가 {1} 보다 큽니다.
    			return;
    		}
    		
    		spmtPrfmncList.push({
    			itemCd	: rowData.itemCd,
    			vrtyCd	: rowData.itemVrtyCd.substring(4),
    			spcfctCd: rowData.itemSpcfctCd.substring(4),
    			gdsGrd	: rowData.itemGrdCd.substring(6),
    			spmtPckgUnitCd: rowData.spmtPckgUnitCd,
    			prdcrCd	: rowData.prdcrCd,
    			warehouseSeCd : rowData.warehouseSeCd,
    			spmtQntt: spmtQntt,
    			spmtWght: spmtWght
    		});
		}
		
		if (spmtPrfmncList.length == 0) {
			gfn_comAlert("W0003", "등록");		//	W0001	{0}이/가 없습니다.
			return;
		}
		
    	const spmtPrfmncCom = {
    		apcCd		: gv_selectedApcCd,
    		spmtYmd		: spmtYmd,
    		cnptCd		: cnptCd,
    		trsprtCoCd	: trsprtCoCd,
    		vhclno		: vhclno,
    		dldtn		: dldtn,
    		spmtPrsnDclrno: spmtPrsnDclrno,
    		trsprtCst	: trsprtCst,
    		rmrk		: gfn_nvl(rmrk),
    		spmtPrfmncList: spmtPrfmncList,
			pltBxCd		: pltBxCd,
			bssInvntrQntt: bssInvntrQntt
    	}
    	
    	if (!gfn_comConfirm("Q0001", "저장")) {		//	Q0001	{0} 하시겠습니까?
    		return;
    	}

    	try {
			const postJsonPromise = gfn_postJSON("/am/spmt/insertSpmtPrfmncByGrd.do", spmtPrfmncCom);
	    	const data = await postJsonPromise;
	    	
	    	if (_.isEqual("S", data.resultStatus)) {
	    		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
	    	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
    	} catch (e) {
        	if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    		console.error("failed", e.message);
		}
    }
	
	const fn_setGrdSmptPrfmnc = async function(){
		
		const spmtYmd = SBUxMethod.get("srch-dtp-spmtYmd");
		const cnptCd = SBUxMethod.get("srch-slt-cnptCd");

        try {
    		
        	const postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncDtlList.do", {
    			apcCd	: gv_selectedApcCd,
    			spmtYmd	: spmtYmd,
    			cnptCd	: cnptCd
      		});
        	
            const data = await postJsonPromise;
            
  			if (_.isEqual("S", data.resultStatus)) {
  	          	/** @type {number} **/
  	      		jsonSpmtPrfmnc.length = 0;
  	          	data.resultList.forEach((item, index) => {
  	          		const gdsSpmtPrfmnc = {
  	          				apcCd			: item.apcCd,
  	          				spmtno			: item.spmtno,
  	          				spmtYmd			: item.spmtYmd,
  	          				itemCd			: item.itemCd,
  	          				itemNm			: item.itemNm,
  	          				vrtyCd			: item.vrtyCd,
  	          				vrtyNm			: item.vrtyNm,
  	          				spcfctCd		: item.spcfctCd,
  	          				spcfctNm		: item.spcfctNm,
  	          				gdsGrd			: item.gdsGrd,
  	          				gdsGrdNm		: item.gdsGrdNm,
  	          				cnptCd			: item.cnptCd,
  	          				cnptNm			: item.cnptNm,
  	          				trsprtCoCd		: item.trsprtCoCd,
  	          				trsprtCoNm		: item.trsprtCoNm,
  	          				delYn			: item.delYn,
  	          				vhclno			: item.vhclno,
  	          				dldtn			: item.dldtn,
  	          				trsprtCst		: item.trsprtCst,
  	          				spmtSeCd		: item.spmtSeCd,
  	          				spmtPrsnDclrnlo	: item.spmtPrsnDclrnlo,
  	          				plorCd			: item.plorCd,
  	          				pckgno			: item.pckgno,
  	          				pckgSn			: item.pckgSn,
  	          				brndNm			: item.brndNm,
  	          				gdsCd			: item.gdsCd,
  	          				prdcrCd			: item.prdcrCd,
  	          				spmtCmndno		: item.spmtCmndno,
  	          				spmtPckgUnitCd	: item.spmtPckgUnitCd,
  	          				spmtPckgUnitNm	: item.spmtPckgUnitNm,
  	          				spmtQntt		: item.spmtQntt,
  	          				spmtWght		: item.spmtWght,
  	          				rmrk			: item.rmrk
  	  				}
  	          		jsonSpmtPrfmnc.push(gdsSpmtPrfmnc);
  	  			});
  	          	
  	          	grdSpmtPrfmnc.rebuild();
  	          	
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
        	}
		} catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
			console.error("failed", e.message);
		}
	}
	
	const fn_dtpChange = function(){
		let pckgYmdFrom = SBUxMethod.get("srch-dtp-pckgYmdFrom");
		let pckgYmdTo = SBUxMethod.get("srch-dtp-pckgYmdTo");
		let spmtYmd = SBUxMethod.get("dtl-dtp-spmtYmd");
		if(gfn_diffDate(pckgYmdFrom, pckgYmdTo) < 0){
			gfn_comAlert("E0000", "시작일자는 종료일자보다 이후 일자입니다.");		//	W0001	{0}
			SBUxMethod.set("srch-dtp-pckgYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-pckgYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
		if(gfn_diffDate(pckgYmdFrom, spmtYmd) < 0){
			gfn_comAlert("W0015", "출하일자", "상품재고의 생산일자");		//	W0014	{0}이/가 {1} 보다 작습니다.
			SBUxMethod.set("dtl-dtp-spmtYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}


	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListSpmtReg = {
		"excelDwnld": {
			"name": "엑셀 다운로드",					// 컨텍스트메뉴에 표시될 이름
			"accesskey": "e",					// 단축키
			"callback": fn_excelDwnldSpmtReg,	// 콜백함수명
		}
	};
	

   	// 엑셀 다운로드
	function fn_excelDwnldSpmtReg() {
		grdSpmtReg.exportLocalExcel(
				"출하 내역", 
				{
					bSaveLabelData: true, 
					bNullToBlank: true, 
					bSaveSubtotalValue: true, 
					bCaptionConvertBr: true, 
					arrSaveConvertText: true
				}
			);
	}
     
	/**
	 * @name fn_createGridSpmtReg
	 * @description 출하내역(입력용) 그리드 생성
	 */
	const fn_createGridSpmtReg = function() {
		jsonSpmtReg.length = 0;
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-grdSpmtReg';
		SBGridProperties.id = 'grdSpmtReg';
		SBGridProperties.jsonref = 'jsonSpmtReg';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.scrollbubbling = false;
		SBGridProperties.oneclickedit = true;
		SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListSpmtReg;	// 우클릭 메뉴 리스트
        SBGridProperties.frozencols = 1;
        SBGridProperties.columns = [
        	{
        		caption: ["처리"],
        		ref: 'delYn',
        		type:'button',
        		width:'50px',
        		style: 'text-align:center',
	        	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	            	if (gfn_isEmpty(strValue)){
	            		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_addRow(" + nRow + ", " + nCol + ")'>추가</button>";
	            	} else {
				        return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
					}
		   		}
        	},
            {
        		caption: ['품목'], 
        		ref: 'itemCd', 
        		width: '80px', 
        		type: 'combo', 
        		style: 'text-align:center',
        		typeinfo : {
    				ref:'jsonItem',
    				displayui : false,
    				itemcount: 10,
    				label:'itemNm', 
    				value:'itemCd'
    			},
    			userattr: {colNm: "itemCd"},
        	},
        	{
        		caption: ['품종'], 
        		ref: 'itemVrtyCd', 
        		width: '80px', 	
        		type: 'combo', 
        		style: 'text-align:center',
        		typeinfo : {
    				ref:'jsonVrty',
    				displayui : false,
    				itemcount: 10,
    				label:'vrtyNm', 
    				value:'itemVrtyCd'
    			},
    			userattr: {colNm: "itemVrtyCd"},
        	},
        	{	
        		caption: ['규격'], 
        		ref: 'itemSpcfctCd', 
        		width: '100px', 
        		type: 'combo', 
        		style: 'text-align:center',
        		typeinfo : {
    				ref:'jsonSpcfct',
    				displayui : false,
    				itemcount: 10,
    				label:'spcfctNm', 
    				value:'itemSpcfctCd'
    			},
    			userattr: {colNm: "itemSpcfctCd"},
        	},
        	{
        		caption: ["등급"],
        		ref: 'itemGrdCd',
        		width:'200px',  
        		type:'combo',
        		style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {
    				ref:'jsonGdsGrd',
    				displayui : false,
    				itemcount: 10,
    				label:'itemGrdNm', 
    				value:'itemGrdCd',
    				unselect: {label: '', value: ''}
    			},
    			userattr: {colNm: "itemGrdCd"},
        	},
        	{
        		caption: ["상품명"],
        		ref: 'spmtPckgUnitCd',
        		width:'180px',  
        		type:'combo',
        		style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {
    				ref:'jsonSpmtPckgUnit',
    				displayui : false,
    				itemcount: 10,
    				label:'spmtPckgUnitNm', 
    				value:'spmtPckgUnitCd',
    				unselect: {label: '', value: ''}
    			},
    			userattr: {colNm: "spmtPckgUnitCd"},
        	},
        	{
        		caption: ['생산자번호'], 		
        		ref: 'prdcrIdentno', 		
        		width: '80px', 	
        		type: 'input', 	
        		style: 'text-align:center; background:#FFF8DC;',
    			userattr: {colNm: "prdcrIdentno"},
        	},
        	{
        		caption: ["생산자명"],
        		ref: 'prdcrCd',
        		width:'150px',  
        		type:'combo',
        		style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {
    				ref:'jsonPrdcr',
    				displayui : false,
    				itemcount: 10,
    				label:'prdcrNm', 
    				value:'prdcrCd'
    			},
    			userattr: {colNm: "prdcrCd"},
        	},
        	{
        		caption: ["창고"],		
        		ref: 'warehouseSeCd',    
        		type:'combo',  
        		width:'100px', 
        		style: 'text-align:center;',
           	 	typeinfo: {
           	 		ref:'jsonWarehouse', 
           	 		label:'cdVlNm', 
           	 		value:'cdVl', 
           	 		oneclickedit: true,
    				unselect: {label: '', value: ''}
           	 	},
    			userattr: {colNm: "warehouseSeCd"},
            },
        	{
        		caption: ['재고수량'], 
        		ref: 'invntrQntt', 
        		width: '80px', 	
        		type: 'output', 
        		style: 'text-align:right',
        		typeinfo : {mask : {alias : 'numeric'}}, 
        		format : {type:'number', rule:'#,###'}
        	},
            {
        		caption: ['재고중량(Kg)'], 	
        		ref: 'invntrWght', 		
        		width: '100px', 
        		type: 'output', 
        		style: 'text-align:right',
            	typeinfo : {mask : {alias : 'numeric'}}, 
            	format : {type:'number', rule:'#,###'}
            },
            {
            	caption: ['출하수량'], 		
            	ref: 'spmtQntt', 		
            	width: '80px', 	
            	type: 'input', 	
            	style: 'text-align:right; background:#FFF8DC;',
            	typeinfo : {mask : {alias : '#', repeat : '*'}}, 
            	format : {type:'number', rule:'#,###'},
    			userattr: {colNm: "spmtQntt"},
            },
            {
            	caption: ['출하중량 (Kg)'], 	
            	ref: 'spmtWght', 		
            	width: '100px', 
            	type: 'output', 	
            	style: 'text-align:right',
            	typeinfo : {mask : {alias : '#', repeat : '*'}}, 
            	format : {type:'number', rule:'#,###'},
    			userattr: {colNm: "spmtWght"},
            },
			{
            	caption: ['비고'], 			
            	ref: 'rmrk', 			
            	width: '300px', 
            	type: 'input', 
            	style: 'text-align:center'
            },
            {caption: ["규격단중"], ref: 'spcfctWght', type:'output',  hidden: true},
        ];

        grdSpmtReg = _SBGrid.create(SBGridProperties);
        grdSpmtReg.bind('valuechanged', 'fn_grdSpmtRegValueChanged');
        
		let nRow = grdSpmtReg.getRows();
		grdSpmtReg.addRow(true);
		grdSpmtReg.setCellDisabled(nRow, 0, nRow, grdSpmtReg.getCols() - 1, true);
	}
	
	/**
	 * @name fn_grdSpmtRegValueChanged
	 * @description 출하내역 입력 이벤트
	 */
	const fn_grdSpmtRegValueChanged = async function() {
		
		const grid = grdSpmtReg;
		let nRow = grid.getRow();
		let nCol = grid.getCol();
		
		const usrAttr = grid.getColUserAttr(nCol);
		
		if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {
			
			const rowData = grid.getRowData(nRow, false);	// deep copy
			
			let chkInfo;
			let spmtQntt;
			let spmtWght;
			
			switch (usrAttr.colNm) {
						
			case "itemGrdCd":		// 등급
				
				if (gfn_isEmpty(rowData.itemGrdCd)) {
					rowData.itemCd = "";
					rowData.itemVrtyCd = "";
					rowData.itemSpcfctCd = "";
					rowData.spmtPckgUnitCd = "";
				} else {
					console.log(jsonGdsGrd);
					chkInfo = _.find(jsonGdsGrd, {itemGrdCd: rowData.itemGrdCd});
					
					if (!_.isEqual(rowData.itemCd, chkInfo.itemCd)) {
						rowData.itemCd = chkInfo.itemCd;
						chkInfo = _.find(
								jsonSpmtPckgUnit, 
								{
									itemCd: rowData.itemCd
								}
							);
						
						if (!gfn_isEmpty(chkInfo)) {
							rowData.spmtPckgUnitCd = chkInfo.spmtPckgUnitCd;
							rowData.itemVrtyCd = rowData.itemCd + chkInfo.vrtyCd;
							rowData.itemSpcfctCd = rowData.itemCd + chkInfo.spcfctCd;
							rowData.spcfctWght = chkInfo.spcfctWght;
							
						} else {
							rowData.spmtPckgUnitCd = "";
							rowData.itemVrtyCd = "";
							rowData.itemSpcfctCd = "";
							rowData.spcfctWght = 0;
						}
					}
				}
			
				grid.refresh({"combo":true,"focus":false});
				
				break;
				
			case "spmtPckgUnitCd":	// 상품명
				if (gfn_isEmpty(rowData.spmtPckgUnitCd)) {
					rowData.itemVrtyCd = "";
					rowData.itemSpcfctCd = "";
					if (gfn_isEmpty(rowData.itemGrdCd)) {
						rowData.itemCd = "";	
					}
				} else {
					chkInfo = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: rowData.spmtPckgUnitCd});
					if (!_.isEqual(rowData.itemCd, chkInfo.itemCd)) {
						rowData.itemGrdCd = "";
					}
					rowData.itemCd = chkInfo.itemCd;
					rowData.itemVrtyCd = chkInfo.itemCd + chkInfo.vrtyCd;
					rowData.itemSpcfctCd = chkInfo.itemCd + chkInfo.spcfctCd;
					rowData.spcfctWght = chkInfo.spcfctWght;
				}
				
				grid.refresh({"combo":true,"focus":false});
				
				break;
			
			case "prdcrIdentno":			// 생산자
				chkInfo = _.find(jsonPrdcr, {prdcrIdentno: parseInt(rowData.prdcrIdentno)});
				if (gfn_isEmpty(chkInfo)) {
					rowData.prdcrCd = "";
				} else {
					rowData.prdcrCd = chkInfo.prdcrCd;
				}
				
				grid.refresh({"combo":true,"focus":false});
				break;
			
			case "prdcrCd":			// 생산자
				
				chkInfo = _.find(jsonPrdcr, {prdcrCd: rowData.prdcrCd});
				if (gfn_isEmpty(chkInfo)) {
					rowData.prdcrIdentno = "";
				} else {
					rowData.prdcrIdentno = chkInfo.prdcrIdentno;
				}
				grid.refresh({"focus":false});
				break;
			

			case "warehouseSeCd":	// 창고구분
				break;
			
			case "spmtQntt":		// 출하수량
				spmtQntt = parseInt(rowData.spmtQntt) || 0;
				spmtWght = gfn_apcEstmtWght(spmtQntt * parseFloat(rowData.spcfctWght) || 0, gv_selectedApcCd, rowData);
				rowData.spmtWght = spmtWght;
				grid.refresh({"focus":false});
				return;
			
			case "spmtWght":		// 출하중량
				return;			
			}
			
			fn_getInvntrInfo(rowData, grid);
		}
	}
	
	/**
	 * @name fn_getInvntrInfo
	 * @description 재고정보 조회
	 * @param {rowData} param
	 */
	const fn_getInvntrInfo = async function(rowData, grid) {
		
		const param = rowData;
		 
		if (
			gfn_isEmpty(param.itemCd) ||
			gfn_isEmpty(param.itemVrtyCd) ||
			gfn_isEmpty(param.itemSpcfctCd) ||
			gfn_isEmpty(param.itemGrdCd) ||
			gfn_isEmpty(param.spmtPckgUnitCd)
		) {
			return;
		}
	        
        try {
        	
        	const spmtYmd = SBUxMethod.get("srch-dtp-spmtYmd");
        	
    		const postJsonPromise = gfn_postJSON("/am/invntr/selectSpmtGdsInvntr.do", {
				apcCd			: gv_selectedApcCd,
				pckgYmdTo		: spmtYmd,
				warehouseSeCd	: param.warehouseSeCd,
				itemCd			: param.itemCd,
				vrtyCd			: param.itemVrtyCd.substring(4),
				spcfctCd		: param.itemSpcfctCd.substring(4),
				gdsGrd			: param.itemGrdCd.substring(6),
				spmtPckgUnitCd  : param.spmtPckgUnitCd,
				rprsPrdcrCd		: param.prdcrCd
	  		});
        
        	const data = await postJsonPromise;
        	console.log("data", data);
        	if (_.isEqual("S", data.resultStatus)) {
        		
        		if (gfn_isEmpty(data.resultMap)) {
        			return;
        		}
        		
        		rowData.invntrQntt = data.resultMap.invntrQntt;
        		rowData.invntrWght = data.resultMap.invntrWght;
				
        		grid.refresh({"focus":false});
        		
        	} else {
        		return;
        	}
        } catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
		}
	}
	
	/**
	 * @name fn_addRow
	 * @description 행추가
	 * @param {number} nRow
	 */
	const fn_addRow = async function(nRow, nCol) {

		const editableRow = grdSpmtReg.getRowData(nRow, false);	// call by reference(deep copy)

		editableRow.delYn = "N";
		//grdSortPrfmnc.setCellData(nRow, nCol, "xxx", true);

		grdSpmtReg.rebuild();
		grdSpmtReg.setCellDisabled(nRow, 0, nRow, 3, true);
		grdSpmtReg.setCellDisabled(nRow, 4, nRow, grdSpmtReg.getCols() - 1, false);
		nRow++;
		grdSpmtReg.addRow(true);
		grdSpmtReg.setCellDisabled(nRow, 0, nRow, grdSpmtReg.getCols() - 1, true);
	}
	
	/**
	 * @name fn_delRow
	 * @description 행삭제
	 * @param {number} nRow
	 */
	const fn_delRow = async function(nRow) {
		 grdSpmtReg.deleteRow(nRow);
	}
	
	 
	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
    const objMenuListSpmtPrfmnc = {
		"excelDwnld": {
			"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
			"accesskey": "e",					//단축키
			"callback": fn_excelDwnldSpmtPrfmnc,	//콜백함수명
		}
	};

    // 엑셀 다운로드
 	function fn_excelDwnldSpmtPrfmnc() {
 		grdSpmtPrfmnc.exportLocalExcel(
 				"출하실적", 
 				{
 					bSaveLabelData: true, 
 					bNullToBlank: true, 
 					bSaveSubtotalValue: true, 
 					bCaptionConvertBr: true, 
 					arrSaveConvertText: true
 				}
 			);
 	}
    	
	/**
	 * @name fn_createGridSpmtPrfmnc
	 * @description 출하실적
	 */
	const fn_createGridSpmtPrfmnc = async function() {
		var SBGridProperties = {};
		SBGridProperties.parentid = 'sb-area-spmtPrfmnc';
		SBGridProperties.id = 'grdSpmtPrfmnc';
		SBGridProperties.jsonref = 'jsonSpmtPrfmnc';
		SBGridProperties.emptyrecords = '데이터가 없습니다.';
		SBGridProperties.selectmode = 'free';
		SBGridProperties.extendlastcol = 'scroll';
		SBGridProperties.scrollbubbling = false;
		SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;					// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuListSpmtPrfmnc;		// 우클릭 메뉴 리스트
		SBGridProperties.frozencols = 1;
		SBGridProperties.columns = [
        	{
        		caption : ["<input type='checkbox' onchange='fn_checkAll(grdSpmtPrfmnc, this);'>"],
        		ref: 'checkedYn', type: 'checkbox',  width:'40px',
        		style: 'text-align:center',
        		typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}, checkedvalue : 'Y', uncheckedvalue : 'N'}
        	},
            {
        		caption: ['출하일자'],
        		ref: 'spmtYmd',
        		width: '100px', 
        		type: 'output', 
        		style: 'text-align:center',
            	format : {
            		type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'
            	}
        	},
            {caption: ['거래처'],		ref: 'cnptNm', 			width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['품목'], 		ref: 'itemNm', 			width: '80px', 	type: 'output', style: 'text-align:center'},
            {caption: ['품종'], 		ref: 'vrtyNm', 			width: '80px', 	type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 		ref: 'spcfctNm', 		width: '80px', 	type: 'output', style: 'text-align:center'},
            {caption: ['상품'], 		ref: 'gdsCd', 			width: '100px', type: 'output', style: 'text-align:center', hidden:true},
            {caption: ['등급'], 		ref: 'gdsGrdNm', 		width: '60px', 	type: 'output', style: 'text-align:center'},
            {caption: ['상품명'], 		ref: 'spmtPckgUnitNm', 	width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['수량'], 		ref: 'spmtQntt', 		width: '60px', 	type: 'output', style: 'text-align:right'},
            {caption: ['중량(Kg)'], 	ref: 'spmtWght',		width: '80px', 	type: 'output', style: 'text-align:right',
    			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}
    		},
            {caption: ['운송회사'],		ref: 'trsprtCoNm', 		width: '180px', type: 'output', style: 'text-align:center'},
            {caption: ['차량번호'],		ref: 'vhclno', 			width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['배송처'], 		ref: 'dldtn', 			width: '150px', type: 'output', style: 'text-align:center'},
            {
            	caption: ['운임비용(원)'],
            	ref: 'trsprtCst', 		
            	width: '80px', 	
            	type: 'output', 
            	style: 'text-align:center',
    			typeinfo : {
    				mask : {alias : 'numeric'}, 
    				maxlength: 10
    			}, 
    			format : {type:'number', rule:'#,###'}
    		},
            {caption: ['비고'],		ref: 'rmrk', 			width: '150px', type: 'output', style: 'text-align:center'}
        ];

        grdSpmtPrfmnc = _SBGrid.create(SBGridProperties);
	} 
	
	 
	 
	 
	const fn_createSmptPrfmncGrid = async function() {
        var SBGridPropertiesGdsInvntr = {};
        SBGridPropertiesGdsInvntr.parentid = 'sb-area-grdGdsInvntr';
        SBGridPropertiesGdsInvntr.id = 'grdGdsInvntr';
        SBGridPropertiesGdsInvntr.jsonref = 'jsonGdsInvntr';
        SBGridPropertiesGdsInvntr.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesGdsInvntr.selectmode = 'free';
        SBGridPropertiesGdsInvntr.extendlastcol = 'scroll';
        SBGridPropertiesGdsInvntr.scrollbubbling = false;
        SBGridPropertiesGdsInvntr.oneclickedit = true;
        SBGridPropertiesGdsInvntr.allowcopy = true;
        SBGridPropertiesGdsInvntr.explorerbar = 'move';				// 개인화 컬럼 이동 가능
        SBGridPropertiesGdsInvntr.contextmenu = true;				// 우클린 메뉴 호출 여부
        SBGridPropertiesGdsInvntr.contextmenulist = objMenuListGdsInvntr;	// 우클릭 메뉴 리스트
        SBGridPropertiesGdsInvntr.frozencols = 1;
        SBGridPropertiesGdsInvntr.columns = [
        	{
        		caption : ["<input type='checkbox' id='allGdsInvntrCheckBox' onchange='fn_checkAll(grdGdsInvntr, this);'>"],
        		ref: 'checkedYn', type: 'checkbox',  width:'40px',
        		style: 'text-align:center',
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ['품목'], 			ref: 'itemNm', 			width: '80px', 	type: 'output', style: 'text-align:center'},
        	{caption: ['품종'], 			ref: 'vrtyNm', 			width: '80px', 	type: 'output', style: 'text-align:center'},
            {caption: ['상품구분'],		ref: 'gdsSeNm', 		width: '80px', 	type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 			ref: 'spcfctNm', 		width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['생산일자'], 		ref: 'pckgYmd', 		width: '150px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['포장번호'], 		ref: 'pckgno', 			width: '150px', type: 'output', style: 'text-align:center'},
            /* {caption: ['선별등급'], 		ref: 'sortGrdNm', 		width: '120px', type: 'output', style: 'text-align:center'}, */
            {caption: ['재고수량'], 		ref: 'invntrQntt', 		width: '80px', 	type: 'output', style: 'text-align:right'},
            {caption: ['재고중량 (Kg)'], 	ref: 'invntrWght', 		width: '100px', type: 'output', style: 'text-align:right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
   			{caption: ["상품명"], 		ref: 'spmtPckgUnitCd',  width:'200px',  type:'combo',  	style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {ref:'jsonGrdSpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'label', value:'value', unselect: {label : '선택', value: ''}}},
            {caption: ["등급"], 			ref: 'gdsGrd',   		width:'100px',  type:'combo',  	style:'text-align:center; background:#FFF8DC;',
    			typeinfo : {ref:'jsonGrdGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
            {caption: ['출하수량'], 		ref: 'spmtQntt', 		width: '80px', 	type: 'input', 	style: 'text-align:right; background:#FFF8DC;',
            	typeinfo : {mask : {alias : '#', repeat : '*'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['출하중량 (Kg)'], 	ref: 'spmtWght', 		width: '100px', type: 'input', 	style: 'text-align:right',
            	typeinfo : {mask : {alias : '#', repeat : '*'}}, format : {type:'number', rule:'#,###'}},
			{caption: ['비고'], 			ref: 'rmrk', 			width: '300px', type: 'output', style: 'text-align:center'},
            {caption: ["출하일자"],		ref: 'spmtYmd',   		type:'output',  hidden: true},
            {caption: ["거래처코드"],		ref: 'cnptCd',   		type:'output',  hidden: true},
            {caption: ["운송사코드"],		ref: 'trsprtCoCd',  	type:'output',  hidden: true},
            {caption: ["운송사명"],		ref: 'trsprtCoNm',  	type:'output',  hidden: true},
            {caption: ["차량번호"],		ref: 'vhclno',   		type:'output',  hidden: true},
            {caption: ["배송지"],			ref: 'dldtn',   		type:'output',  hidden: true},
            {caption: ["운임"],			ref: 'trsprtCst',   	type:'output',  hidden: true},
            {caption: ["비고"],			ref: 'rmrk',   			type:'output',  hidden: true},
            {caption: ["지시번호"],		ref: 'spmtCmndno',  	type:'output',  hidden: true},
            {caption: ["브랜드명"],		ref: 'brndNm',  		type:'output',  hidden: true},
            {caption: ["발주번호"],		ref: 'outordrno',  		type:'output',  hidden: true},
            {caption: ["상품코드"],		ref: 'gdsCd',  			type:'output',  hidden: true},
            {caption: ["팔레트"],			ref: 'pltBxCd',  		type:'output',  hidden: true},
            {caption: ["수량"],			ref: 'bssInvntrQntt', 	type:'output',  hidden: true},
        ];

        grdGdsInvntr = _SBGrid.create(SBGridPropertiesGdsInvntr);
        grdGdsInvntr.bind('valuechanged', 'fn_grdCmndQnttValueChanged');
        grdGdsInvntr.bind('select','fn_setValue');
        grdGdsInvntr.bind('deselect','fn_delValue');

        var SBGridPropertiesSpmtPrfmnc = {};
        SBGridPropertiesSpmtPrfmnc.parentid = 'sb-area-spmtPrfmnc';
        SBGridPropertiesSpmtPrfmnc.id = 'grdSpmtPrfmnc';
	    SBGridPropertiesSpmtPrfmnc.jsonref = 'jsonSpmtPrfmnc';
	    SBGridPropertiesSpmtPrfmnc.emptyrecords = '데이터가 없습니다.';
	    SBGridPropertiesSpmtPrfmnc.selectmode = 'free';
	    SBGridPropertiesSpmtPrfmnc.extendlastcol = 'scroll';
	    SBGridPropertiesSpmtPrfmnc.scrollbubbling = false;
	    SBGridPropertiesSpmtPrfmnc.allowcopy = true;
	    SBGridPropertiesSpmtPrfmnc.explorerbar = 'move';				// 개인화 컬럼 이동 가능
	    SBGridPropertiesSpmtPrfmnc.contextmenu = true;					// 우클린 메뉴 호출 여부
	    SBGridPropertiesSpmtPrfmnc.contextmenulist = objMenuListPrfmnc;		// 우클릭 메뉴 리스트
	    SBGridPropertiesSpmtPrfmnc.frozencols = 1;
	    SBGridPropertiesSpmtPrfmnc.columns = [
        	{
        		caption : ["<input type='checkbox' onchange='fn_checkAll(grdSpmtPrfmnc, this);'>"],
        		ref: 'checkedYn', type: 'checkbox',  width:'40px',
        		style: 'text-align:center',
        		typeinfo: {ignoreupdate : true, fixedcellcheckbox : {usemode : true, rowindex : 0}, checkedvalue : 'Y', uncheckedvalue : 'N'}
        	},
            {caption: ['출하일자'], 		ref: 'spmtYmd', 		width: '100px', type: 'output', style: 'text-align:center',
            	format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['거래처'],			ref: 'cnptNm', 			width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['품목'], 			ref: 'itemNm', 			width: '80px', 	type: 'output', style: 'text-align:center'},
            {caption: ['품종'], 			ref: 'vrtyNm', 			width: '80px', 	type: 'output', style: 'text-align:center'},
            {caption: ['규격'], 			ref: 'spcfctNm', 		width: '80px', 	type: 'output', style: 'text-align:center'},
            {caption: ['상품'], 			ref: 'gdsCd', 			width: '100px', type: 'output', style: 'text-align:center', hidden:true},
            {caption: ['등급'], 			ref: 'gdsGrdNm', 		width: '60px', 	type: 'output', style: 'text-align:center'},
            {caption: ['상품명'], 			ref: 'spmtPckgUnitNm', 	width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['수량'], 			ref: 'spmtQntt', 		width: '60px', 	type: 'output', style: 'text-align:right'},
            {caption: ['중량 (Kg)'], 		ref: 'spmtWght',		width: '80px', 	type: 'output', style: 'text-align:right',
    			typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,###'}},
            {caption: ['운송회사'], 		ref: 'trsprtCoNm', 		width: '180px', type: 'output', style: 'text-align:center'},
            {caption: ['차량번호'], 		ref: 'vhclno', 			width: '100px', type: 'output', style: 'text-align:center'},
            {caption: ['배송처'], 		ref: 'dldtn', 			width: '150px', type: 'output', style: 'text-align:center'},
            {caption: ['운임비용 (원)'], 	ref: 'trsprtCst', 		width: '80px', 	type: 'output', style: 'text-align:center',
    			typeinfo : {mask : {alias : 'numeric'}, maxlength: 10}, format : {type:'number', rule:'#,###'}},
            {caption: ['지시번호'], 		ref: 'spmtCmndno', 		width: '120px', type: 'output', style: 'text-align:center'},
            {caption: ['비고'], 			ref: 'rmrk', 			width: '150px', type: 'output', style: 'text-align:center'}
        ];

        grdSpmtPrfmnc = _SBGrid.create(SBGridPropertiesSpmtPrfmnc);
    }

	/**
     * @description 메뉴트리그리드 컨텍스트메뉴 json
     * @type {object}
     */
     const objMenuListPrfmnc = {
		"excelDwnld": {
			"name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
			"accesskey": "e",					//단축키
			"callback": fn_excelDwnldPrfmnc,	//콜백함수명
		}
	};

    const objMenuListGdsInvntr = {
        "excelDwnld": {
            "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
            "accesskey": "e",					//단축키
            "callback": fn_excelDwnldGdsInvntr,	//콜백함수명
        },
        "personalSave" : {
        	"name": "개인화 저장",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "s",					//단축키
            "callback": fn_personalSave,		//콜백함수명
        },
        "personalLoad" : {
        	"name": "개인화 호출",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "l",					//단축키
            "callback": fn_personalLoad,		//콜백함수명
        },
        "colHidden" : {
        	"name": "열 숨기기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "h",					//단축키
            "callback": fn_colHidden,			//콜백함수명
        },
        "colShow" : {
        	"name": "열 보이기",				//컨텍스트메뉴에 표시될 이름
            "accesskey": "w",					//단축키
            "callback": fn_colShow,				//콜백함수명
        }
    };

  	// 엑셀 다운로드
	function fn_excelDwnldGdsInvntr() {
    	grdGdsInvntr.exportLocalExcel("상품재고 내역", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 엑셀 다운로드
    function fn_excelDwnldPrfmnc() {
    	grdSpmtPrfmnc.exportLocalExcel("출하 내역", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

    // 개인화 저장
    function fn_personalSave(){
    	grdSpmtPrfmnc.savePersonalInfo("apcCd");
   	}
    // 개인화 호출
    function fn_personalLoad(){
    	grdSpmtPrfmnc.loadPersonalInfo("apcCd");
   	}
	// 열 숨기기
    function fn_colHidden(){
    	grdSpmtPrfmnc.setColHidden(grdSpmtPrfmnc.getCol(), true);
   	}
	// 열 보이기
    function fn_colShow(){
    	for(let i = grdSpmtPrfmnc.getFixedCols(); i < grdSpmtPrfmnc.getCols()-1; i++) {
   			grdSpmtPrfmnc.setColHidden(i, false);
    	}
   	}



    //그리드 체크박스 전체 선택
    function fn_checkAll(grid, obj) {
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "Y" : "N";
        //체크박스 열 index
        var getColRef = grid.getColRef("checkedYn");
    	var getRow = grid.getRow();
    	var getCol = grid.getCol();
        for (var i=0; i<gridList.length; i++) {
        	grid.setCol(getColRef);
        	grid.clickCell(i+1, getColRef);
            grid.setCellData(i+1, getColRef, checkedYn, true, false);
        }
    	grid.clickCell(getRow, getCol);
    }

	const fn_setGrdGdsInvntr = async function(){
		let pckgYmdFrom = SBUxMethod.get("srch-dtp-pckgYmdFrom");
		let pckgYmdTo = SBUxMethod.get("srch-dtp-pckgYmdTo");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let spmtPckgUnitCd = SBUxMethod.get("dtl-slt-spmtPckgUnit");
		let gdsSeCd = SBUxMethod.get("srch-rdo-gdsSeCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");

		SBUxMethod.set("dtl-inp-spmtQntt", "");
		SBUxMethod.set("dtl-inp-spmtWght", "");

		if (gfn_isEmpty(pckgYmdFrom) || gfn_isEmpty(pckgYmdTo)) {
  			gfn_comAlert("W0001", "생산일자");		//	W0002	{0}을/를 선택하세요.
            return false;
  		}

  		if (gfn_isEmpty(vrtyCd)) {
  			gfn_comAlert("W0001", "품종");				//	W0002	{0}을/를 선택하세요.
            return false;
  		}
  		if (gfn_isEmpty(gdsSeCd)) {
  			gfn_comAlert("W0001", "상품");				//	W0002	{0}을/를 선택하세요.
            return false;
  		}
		const postJsonPromise = gfn_postJSON("/am/invntr/selectGdsInvntrList.do", {
			apcCd			: gv_selectedApcCd,
			pckgYmdFrom		: pckgYmdFrom,
			pckgYmdTo		: pckgYmdTo,
			warehouseSeCd	: warehouseSeCd,
			itemCd			: itemCd,
			vrtyCd			: vrtyCd,
			spmtPckgUnitCd  : spmtPckgUnitCd,
			gdsSeCd 		: gdsSeCd,
			spcfctCd		: spcfctCd
  		});
        const data = await postJsonPromise;
        try {
  			if (_.isEqual("S", data.resultStatus)) {
  	          	/** @type {number} **/
  	      		jsonGdsInvntr.length = 0;
  	          	data.resultList.forEach((item, index) => {
  	          		if(item.invntrWght != 0){
  		          		const gdsInvntr = {
  		          				apcCd		: item.apcCd
  		          			  ,	pckgno		: item.pckgno
  		          			  ,	pckgSn		: item.pckgSn
  		          			  ,	pckgYmd		: item.pckgYmd
  		          			  ,	itemCd		: item.itemCd
  		          			  ,	itemNm		: item.itemNm
  		          			  ,	vrtyCd		: item.vrtyCd
  		          			  ,	vrtyNm		: item.vrtyNm
  		          			  ,	spcfctCd	: item.spcfctCd
  		          			  ,	spcfctNm	: item.spcfctNm
  		          			  ,	gdsSeCd		: item.gdsSeCd
  		          			  ,	gdsSeNm		: item.gdsSeNm
  		          			  ,	invntrQntt	: item.invntrQntt
  		          			  ,	invntrWght	: item.invntrWght
  		          			  ,	spmtQntt	: 0
  		          			  ,	spmtWght	: 0
  		          			  ,	pckgQntt	: item.pckgQntt
  		          			  ,	pckgWght	: item.pckgWght
  		          			  ,	pckgSeCd	: item.pckgSeCd
  		          			  ,	pckgSeNm	: item.pckgSeNm
  		          			  ,	prdcrCd		: item.rprsPrdcrCd
  		          			  ,	prdcrNm		: item.rprsPrdcrNm
  		          			  ,	fcltCd		: item.fcltCd
  		          			  ,	fcltNm		: item.fcltNm
  		          			  ,	cmndQntt	: item.cmndQntt
  		          			  ,	cmndWght	: item.cmndWght
  		          			  ,	gdsGrd		: item.gdsGrd
  		          			  ,	gdsGrdNm	: item.gdsGrdNm
  		          			  ,	gdsCd 		: item.gdsCd
  		          			  ,	plorCd 		: item.plorCd
  		          			  ,	spmtPckgUnitCd: item.spmtPckgUnitCd
  		          			  ,	spmtPckgUnitNm: item.spmtPckgUnitNm
  		          			  ,	rmrk		: item.rmrk
  		          			  ,	brndNm		: item.brndNm
  		          			  ,	sortGrdCd	: item.sortGrdCd
  		          			  ,	sortGrdNm	: item.sortGrdNm
  		  				}
  						jsonGdsInvntr.push(gdsInvntr);
  	          		}
  	  			});
  	          	grdGdsInvntr.rebuild();

        	} else {
        		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        	}
		}catch (e) {

			if (!(e instanceof Error)) {
				e = new Error(e);
			}

			console.error("failed", e.message);
		}
		return true;
	}


	





	const fn_reset = async function () {
		SBUxMethod.set("srch-dtp-pckgYmdFrom", gfn_dateFirstYmd(new Date())); // 생산일지 from
		SBUxMethod.set("srch-dtp-pckgYmdTo", gfn_dateToYmd(new Date())); // 생산일지 to
		SBUxMethod.set("srch-slt-warehouseSeCd", ""); // 창고구분
		SBUxMethod.set("srch-slt-itemCd", ""); // 품목
		SBUxMethod.set("srch-slt-vrtyCd", ""); // 품종
		SBUxMethod.set("srch-rdo-gdsSeCd", "1"); // 상품
		SBUxMethod.set("srch-slt-spcfctCd", ""); // 규격
		SBUxMethod.set("dtl-inp-spmtCmndno", ""); // 지시번호
		SBUxMethod.set("dtl-inp-outordrno", ""); // 지시번호
		SBUxMethod.set("dtl-inp-cmndQntt", ""); // 지시수량
		SBUxMethod.set("dtl-inp-cmndWght", ""); // 지시중량
		SBUxMethod.set("dtl-slt-gdsGrd", ""); // 등급
		SBUxMethod.set("dtl-slt-spmtPckgUnit", ""); // 포장등급
		SBUxMethod.set("dtl-dtp-spmtYmd",  gfn_dateToYmd(new Date())); // 출하일자
		SBUxMethod.set("dtl-inp-spmtQntt",  ""); // 출하수량
		SBUxMethod.set("dtl-inp-spmtWght",  ""); // 출하중량
		SBUxMethod.set("dtl-inp-cnptCd",  ""); // 거래처 코드
		SBUxMethod.set("dtl-inp-cnptNm",  ""); // 거래처 명
		SBUxMethod.set("dtl-slt-trsprtCoCd",  ""); // 운송회사
		SBUxMethod.set("dtl-inp-vhclno",  ""); // 차량번호
		SBUxMethod.set("dtl-inp-dldtn",  ""); // 배송처
		SBUxMethod.set("dtl-inp-trsprtCst",  ""); // 운임비용
		SBUxMethod.set("dtl-inp-rmrk",  ""); // 비고

		jsonGdsInvntr.length = 0;
		jsonSpmtPrfmnc.length = 0;
		grdGdsInvntr.refresh();
		grdSpmtPrfmnc.refresh();

		fn_initSBSelect();

		jsonComSpcfct.length = 0;
		SBUxMethod.refresh("srch-slt-spcfctCd");

		cmndYn = false;
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
	/*
	 * 거래처 팝업 필수 함수
	 * 종료
	 */

 	/**
	 * 차량 팝업 필수 함수
	 * 시작
	 */
	const fn_choiceVhcl = function() {
		popVhcl.init(gv_selectedApcCd, gv_selectedApcNm, fn_setVhcl, SBUxMethod.get("dtl-inp-vhclno"));
	}

	const fn_setVhcl = function(vhcl) {
		if (!gfn_isEmpty(vhcl)) {
			SBUxMethod.set("dtl-inp-vhclno", vhcl.vhclno);   // callBack input
		}
	}
	/*
	 * 차량 팝업 필수 함수
	 * 종료
	 */

	/**
	 * 출하지시 팝업 필수 함수
	 * 시작
	 */
	const fn_choiceSpmtCmnd = function() {
        popSpmtCmnd.init(gv_selectedApcCd, gv_selectedApcNm, "", fn_setSpmtCmnd);
	}
	const fn_setSpmtCmnd = async function(cmnd) {
		if (!gfn_isEmpty(cmnd)) {
			SBUxMethod.set("dtl-inp-spmtCmndno", cmnd.spmtCmndno);
			SBUxMethod.set("dtl-inp-cmndQntt", cmnd.cmndQntt);
			SBUxMethod.set("dtl-inp-cmndWght", cmnd.cmndWght);
			SBUxMethod.set("dtl-slt-trsprtCoCd", cmnd.trsprtCoCd);
			SBUxMethod.set("dtl-inp-cnptCd", cmnd.cnptCd);
			SBUxMethod.set("dtl-inp-cnptNm", cmnd.cnptNm);
			SBUxMethod.set("dtl-inp-dldtn", cmnd.dldtn);
			if(gfn_isEmpty(cmnd.rmrk)){
				SBUxMethod.set("dtl-inp-rmrk", "");
			}else{
				SBUxMethod.set("dtl-inp-rmrk", cmnd.rmrk);
			}
			SBUxMethod.set("dtl-inp-outordrno", cmnd.outordrno);
			await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonComVrty, gv_selectedApcCd)		// 품종
			SBUxMethod.set("srch-slt-itemCd", cmnd.itemCd);
			SBUxMethod.set("srch-slt-vrtyCd", cmnd.vrtyCd);
			await fn_onChangeSrchVrtyCd({value: cmnd.vrtyCd});

			let rst = await Promise.all([
				gfn_setSpmtPckgUnitSBSelect('dtl-slt-spmtPckgUnit', 	jsonDtlSpmtPckgUnit, 	gv_apcCd, cmnd.itemCd, cmnd.vrtyCd)	// 포장구분
			])
			grdGdsInvntr.refresh({"combo":true, "focus":false})

			SBUxMethod.set("srch-slt-spcfctCd", cmnd.spcfctCd);
			SBUxMethod.set("dtl-slt-gdsGrd", cmnd.gdsGrd);
			SBUxMethod.set("dtl-slt-spmtPckgUnit", cmnd.spmtPckgUnitCd);

			fn_search();

			cmndYn = true;
		}
	}
	/*
	 * 출하지시 팝업 필수 함수
	 * 종료
	 */

	/**
     * @name fn_docSpmt
     * @description 송품장 발행 버튼
     */
 	const fn_docSpmt = function() {

 		const spmtnoList = [];
		const allData = grdSpmtPrfmnc.getGridDataAll();
		allData.forEach((item, index) => {
			if (item.checkedYn === "Y") {
				spmtnoList.push(item.spmtno);
    		}
		});

 		if (spmtnoList.length === 0) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}

 		const spmtno = spmtnoList.join("','");
 		gfn_popClipReport("송품장", "am/trsprtCmdtyDoc.crf", {apcCd: gv_selectedApcCd, spmtno: spmtno});
 	}

 // 엑셀다운로드
	// exp combo
	var jsonExpSltItem 			= [];	// 품목
	var jsonExpSltVrty 			= [];	// 품종
	var jsonExpSltSpcfct 		= [];	// 규격
	var jsonExpSltGdsGrd 		= [];	// 상품등급
	var jsonExpSltPrdcr 		= [];	// 생산자
	var jsonExpSltGdsSeCd 		= [];	// 상품구분
	var jsonExpSltSpmtPckgUnit 	= [];	// 포장구분
	var jsonExpSltCnpt 			= [];	// 거래처
	var jsonExpSltTrsprtCoCd 	= [];	// 운송사

	var grdExpSpmtPrfmnc;			// 엑셀 출하실적그리드
	var grdExpItem;					// 엑셀 품목그리드
	var grdExpVrty;					// 엑셀 품종그리드
	var grdExpGdsGrd				// 엑셀 등급그리드
	var grdExpSpcfct;				// 엑셀 규격그리드
	var grdExpPrdcr;				// 엑셀 생산자그리드
	var grdExpGdsSeCd;				// 엑셀 상품구분그리드
	var grdExpSpmtPckgUnit;			// 엑셀 포장구분그리드
	var grdExpCnpt;					// 엑셀 거래처그리드
	var grdExpTrsprtCoCd;			// 엑셀 운송사그리드


	var jsonExpSpmtPrfmnc 	= [];	// 엑셀 출하실적Json
	var jsonExpItem 		= [];	// 엑셀 품목Json
	var jsonExpVrty 		= [];	// 엑셀 품종Json
	var jsonExpGdsGrd 		= [];	// 엑셀 등급Json
	var jsonExpSpcfct 		= [];	// 엑셀 규격Json
	var jsonExpPrdcr 		= [];	// 엑셀 생산자Json
	var jsonExpGdsSeCd 		= [];	// 엑셀 상품구분Json
	var jsonExpSpmtPckgUnit = [];	// 엑셀 포장구분Json
	var jsonExpCnpt 		= [];	// 엑셀 거래처Json
	var jsonExpTrsprtCoCd 	= [];	// 엑셀 운송사Json


	const fn_getExpColumns = function() {
		const _columns = []
		_columns.push(
			{caption: ["출하일자"],		ref: 'spmtYmd',     	 type:'input',  width:'100px',   style:'text-align:center',
				format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
			{caption: ["상품구분"], 	ref: 'gdsSeCd',   		type:'combo',  	width:'80px',    style:'text-align:center; background-color:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltGdsSeCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["품목"], 		ref: 'itemCd',   		type:'combo',  	width:'80px',    style:'text-align:center; background-color:#FFF8DC;',
				typeinfo : {ref:'jsonExpSltItem', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["등급"], 		ref: 'gdsGrd',   		type:'combo',  	width:'80px',    style:'text-align:center; background-color:#FFF8DC;',
				typeinfo : {ref:'jsonExpGdsGrd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["상품명"], 		ref: 'spmtPckgUnitCd',	type:'combo',  	width:'140px',   style:'text-align:center; background-color:#FFF8DC;',
				typeinfo : {ref:'jsonExpSpmtPckgUnit', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
			{caption: ["생산자"], 		ref: 'prdcrCd',   		type:'combo',  	width:'80px',    style:'text-align:center',
				typeinfo : {ref:'jsonExpSltPrdcr', 	displayui : false,	itemcount: 10, label:'prdcrNm', value:'prdcrCd'}},
	        {caption: ["거래처"],		ref: 'cnptCd',			type:'combo',  	width:'100px',   style:'text-align:center; background-color:#FFF8DC;',
				typeinfo : {ref:'jsonExpCnpt', 		displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["운송회사"],		ref: 'trsprtCoCd',		type:'combo',  	width:'100px',   style:'text-align:center',
				typeinfo : {ref:'jsonExpTrsprtCoCd', 	displayui : false,	itemcount: 10, label:'label', value:'value'}},
	        {caption: ["차량번호"],		ref: 'vhclno',      	type:'output',  width:'100px',   style:'text-align:center'},
	        {caption: ["배송처"],		ref: 'dldtn',      		type:'output',  width:'100px',   style:'text-align:center'},
	        {caption: ["운송비용 (원)"],ref: 'trsprtCst',   	type:'output',  width:'100px',   style:'text-align:center'},
	        {caption: ["수량"],			ref: 'spmtQntt',    	type:'output',  width:'60px',    style:'text-align:right'},
	        {caption: ["중량 (Kg)"],	ref: 'spmtWght',    	type:'output',  width:'0px',     style:'text-align:right'},
	        {caption: ["비고"],			ref: 'rmrk',      		type:'output',  width:'300px',   style:'text-align:left'}
		);

	    return _columns;
	}

	const fn_setSltJson = async function() {
		// 첫 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// set exp/imp combo json
		jsonExpSltGdsSeCd 		= gfn_cloneJson(jsonComGdsSeCd);			// 상품구분
		jsonExpSltItem 			= gfn_cloneJson(jsonComItem);				// 품목
		jsonExpSltGdsGrd 		= gfn_cloneJson(jsonGrdGdsGrd);				// 상품등급
		jsonExpSltSpmtPckgUnit 	= gfn_cloneJson(jsonExeclComSpmtPckgUnit);	// 포장구분
		jsonExpSltPrdcr 		= gfn_cloneJson(jsonExeclComPrdcr);			// 생산자
		jsonExpCnpt 			= gfn_cloneJson(jsonExeclComCnpt);			// 거래처
		jsonExpSltTrsprtCoCd 	= gfn_cloneJson(jsonComTrsprtCoCd);			// 운송사

	}

	const fn_setExpJson = async function() {
		// 첫 시트가 아닌 다른 시트에서 쓰일 json을 엑셀에서 쓰는 변수에 담는 함수
		// export grid data
		jsonExpSpmtPrfmnc.length = 0;

		jsonExpGdsSeCd 		= gfn_cloneJson(jsonComGdsSeCd);			// 엑셀 상품구분Json
		jsonExpItem 		= gfn_cloneJson(jsonComItem);				// 엑셀 품목Json
		jsonExpGdsGrd 		= gfn_cloneJson(jsonGrdGdsGrd);				// 엑셀 등급Json
		jsonExpSpmtPckgUnit = gfn_cloneJson(jsonExeclComSpmtPckgUnit);	// 엑셀 포장구분Json
		jsonExpPrdcr 		= gfn_cloneJson(jsonExeclComPrdcr);			// 엑셀 생산자Json
		jsonExpCnpt 		= gfn_cloneJson(jsonExeclComCnpt);			// 엑셀 거래처Json
		jsonExpTrsprtCoCd 	= gfn_cloneJson(jsonComTrsprtCoCd);			// 엑셀 운송사Json
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

		if (gfn_isEmpty(itemCd)) {
  			gfn_comAlert("W0001", "품목");				//	W0002	{0}을/를 선택하세요.
            return;
  		}

		await fn_setSltJson();
		await fn_setExpJson();

		const expColumns = fn_getExpColumns();

		const expObjList = [
		    {
		        sbGrid: grdExpSpmtPrfmnc,
		        parentid: "sbexp-area-grdExpSpmtPrfmnc",
		        id: "grdExpSpmtPrfmnc",
		        jsonref: "jsonExpSpmtPrfmnc",
				columns: expColumns,
		        sheetName: "출하실적내역",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpGdsSeCd,
		        parentid: "sbexp-area-grdExpGdsSeCd",
		        id: "grdExpGdsSeCd",
		        jsonref: "jsonExpGdsSeCd",
				columns: [
			    	{caption: ["상품구분코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["상품구분코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "상품구분",
		        title: "",
		        unit: ""
		    }, {
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
		        sbGrid: grdExpGdsGrd,
		        parentid: "sbexp-area-grdExpGdsGrd",
		        id: "grdExpGdsGrd",
		        jsonref: "jsonExpGdsGrd",
				columns: [
			    	{caption: ["등급코드"],   	ref: 'value',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["등급코드명"],  	ref: 'text',  	type:'output',  width:'100px',    style:'text-align:center'},
				],
		        sheetName: "등급",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpSpmtPckgUnit,
		        parentid: "sbexp-area-grdExpSpmtPckgUnit",
		        id: "grdExpSpmtPckgUnit",
		        jsonref: "jsonExpSpmtPckgUnit",
				columns: [
					{caption: ["품목코드"],				ref: 'itemCd',  			type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품목명"],				ref: 'itemNm',  			type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["품종명"],				ref: 'vrtyNm',  			type:'output',  width:'100px',    style:'text-align:center'},
					{caption: ["규격명"],				ref: 'spcfctNm',  			type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["상품명코드"],   		ref: 'spmtPckgUnitCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["상품명"],    			ref: 'spmtPckgUnitNm',  	type:'output',  width:'160px',    style:'text-align:center'}
				],
		        sheetName: "상품명",
		        title: "",
		        unit: ""
		    },{
		        sbGrid: grdExpPrdcr,
		        parentid: "sbexp-area-grdExpPrdcr",
		        id: "grdExpPrdcr",
		        jsonref: "jsonExpPrdcr",
				columns: [
			    	{caption: ["생산자코드"],   		ref: 'prdcrCd',  	type:'output',  width:'100px',    style:'text-align:center'},
			    	{caption: ["생산자명"],    			ref: 'prdcrNm',  	type:'output',  width:'100px',    style:'text-align:center'}
				],
		        sheetName: "생산자",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpCnpt,
		        parentid: "sbexp-area-grdExpCnpt",
		        id: "grdExpCnpt",
		        jsonref: "jsonExpCnpt",
				columns: [
			    	{caption: ['거래처코드'],		ref: 'cnptCd', 	type: 'output', width: '80px', style: 'text-align:center'},
			        {caption: ['거래처명'], 		ref: 'cnptNm', 	type: 'output', width: '80px', style: 'text-align:center'}
				],
		        sheetName: "거래처",
		        title: "",
		        unit: ""
		    }, {
		        sbGrid: grdExpTrsprtCoCd,
		        parentid: "sbexp-area-grdExpTrsprtCoCd",
		        id: "grdExpTrsprtCoCd",
		        jsonref: "jsonExpTrsprtCoCd",
				columns: [
			    	{caption: ['운송회사코드'],		ref: 'trsprtCoCd', 	type: 'output', width: '80px', style: 'text-align:center'},
			        {caption: ['운송회사코드명'], 	ref: 'trsprtCoNm', 	type: 'output', width: '80px', style: 'text-align:center'}
				],
		        sheetName: "운송회사",
		        title: "",
		        unit: ""
		    }
		];

		fn_createExpGrid(expObjList);

	    gfn_exportExcelMulti("출하실적(샘플).xlsx", expObjList);
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

		SBUxMethod.openModal('modal-excel-spmtPrfmnc');

		fn_createGridSpmtPrfmncPopup();
		jsonExcelSpmtPrfmncPopup = 0;
    	grdExcelSpmtPrfmncPopup.rebuild();
    	grdExcelSpmtPrfmncPopup.importExcelData(e);
     }

    const fn_uld = async function() {
    	let itemCd = SBUxMethod.get("srch-slt-itemCd");

		if (gfn_isEmpty(itemCd)) {
  			gfn_comAlert("W0001", "품목");				//	W0002	{0}을/를 선택하세요.
            return;
  		}

    	document.querySelector("#btnFileUpload").value = "";
		$("#btnFileUpload").click();

    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>