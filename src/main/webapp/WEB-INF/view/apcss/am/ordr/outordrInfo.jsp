<%
 /**
  * @Class Name : outordrinfo.jsp
  * @Description : 발주정보등록 화면
  * @author SI개발부
  * @since 2023.10.23
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.10.23   	김호			최초 생성
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
					<h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 발주정보조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button
						id="btnDelete" 
						name="btnDelete" 
						uitype="normal" 
						class="btn btn-sm btn-outline-dark" 
						text="삭제" 
						onclick="fn_delete"
					></sbux-button>
					<sbux-button
						id="btnSearch" 
						name="btnSearch" 
						uitype="normal" 
						class="btn btn-sm btn-outline-dark" 
						text="조회" 
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
						<col style="width: 6%">
						<col style="width: 3%">
						<col style="width: 7%">
						<col style="width: 6%">
						<col style="width: 6%">
						<col style="width: 3%">
					</colgroup>
					<tbody>
						<tr>
					        <th scope="row" class="th_bg">접수여부</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-rcptYn" name="srch-slt-rcptYn" uitype="single" unselected-text="전체" jsondata-ref="jsonRcptYn" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg"><span class="data_required"></span>발주일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-outordrYmdFrom" name="srch-dtp-outordrYmdFrom" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-outordrYmdFrom)"></sbux-datepicker>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-outordrYmdTo" name="srch-dtp-outordrYmdTo" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" onchange="fn_dtpChange(srch-dtp-outordrYmdTo)"></sbux-datepicker>
							</td>
							<td></td>
							<th scope="row" class="th_bg">발주유형</th>
							<td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select id="srch-slt-outordrType" name="srch-slt-outordrType" uitype="single" unselected-text="전체" jsondata-ref="jsonComOutordrType" class="form-control input-sm"></sbux-select>
									</div>
								</div>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">품목/품종</th>
						    <td class="td_input" style="border-right: hidden;">
								<div class="fl_group fl_rpgroup">
									<div class="dp_inline wd_180 va_m">
										<sbux-select
											unselected-text="전체"
											uitype="single"
											id="srch-slt-itemCd"
											name="srch-slt-itemCd"
											class="form-control input-sm"
											jsondata-ref="jsonApcItem"
											onchange="fn_selectItem"
										/>
									</div>
								</div>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-vrtyNm" name="srch-inp-vrtyNm" uitype="text" class="form-control input-sm" maxlength="33" show-clear-button="true" readonly></sbux-input>
								<sbux-input id="srch-inp-vrtyCd" name="srch-inp-vrtyCd" uitype="hidden"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchVrty" name="btnSrchVrty" class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-vrty" onclick="fn_modalVrty"/>
							</td>
						    <th scope="row" class="th_bg">거래처명</th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-cnptNm" name="srch-inp-cnptNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchCnpt" name="btnSrchCnpt" uitype="modal" target-id="modal-cnpt" onclick="fn_modalCnpt" text="찾기" class="btn btn-xs btn-outline-dark"></sbux-button>
							</td>
							<th scope="row" class="th_bg">납기일자</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker
									id="srch-dtp-dudtYmd"
									name="srch-dtp-dudtYmd"
									uitype="popup"
									date-format="yyyy-mm-dd"
									class="form-control input-sm"
									onchange="fn_dtpChangeDudt(srch-dtp-dudtYmd)"
								></sbux-datepicker>
							</td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row" class="th_bg">상품명</th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-input id="srch-inp-spmtPckgUnitNm" name="srch-inp-spmtPckgUnitNm" uitype="text" maxlength="33" class="form-control input-sm"></sbux-input>
							</td>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-button id="btnSrchGdsNm" name="btnSrchGdsNm" uitype="modal" class="btn btn-xs btn-outline-dark" target-id="modal-gds" onclick="fn_modalGds" text="찾기"></sbux-button>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>지시등록</span></li>
					</ul>
				</div>

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
							<th scope="row" class="th_bg"><span class="data_required"></span><sbux-label id="srch-lbl-cmndYmd" name="srch-lbl-cmndYmd" uitype="normal" text="지시일자" class="bold"></sbux-label></th>
							<td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="srch-dtp-cmndYmd" name="srch-dtp-cmndYmd" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm-ast inpt_data_reqed input-sm" onchange="fn_dtpChangeCmnd(srch-dtp-cmndYmd)"></sbux-datepicker>
							</td>
							<td colspan="2"></td>
							<th scope="row" class="th_bg" style="border-right: hidden;"><span class="data_required"></span></span><sbux-label id="srch-lbl-trsprtCoCd" name="srch-lbl-trsprtCoCd" uitype="normal" text="운송회사" class="bold"></sbux-label></th>
							<td colspan="2" class="td_input" style="border-right: hidden;">
								<sbux-select id="srch-slt-trsprtCoCd" name="srch-slt-trsprtCoCd" uitype="single" jsondata-ref="jsonTrsprtCoCd" class="form-control input-sm-ast inpt_data_reqed input-sm" unselected-text="선택"></sbux-select>
							</td>
							<td></td>
							<th scope="row" class="th_bg" style="border-right: hidden;"></span><sbux-label id="srch-lbl-rmrk" name="srch-lbl-rmrk" uitype="normal" text="비고" class="bold"></sbux-label></th>
							<td colspan="3" class="td_input">
								<sbux-input id="srch-inp-rmrk" name="srch-inp-rmrk" uitype="text" maxlength="333" class="form-control input-sm"></sbux-input>
							</td>
						</tr>
					</tbody>
				</table>
				<!--[pp] //검색 -->

				<!--[pp] 검색결과 -->
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>발주 내역</span>
							<span style="font-size:12px">(조회건수 <span id="cnt-outordr">0</span>건)</span>
						</li>
					</ul>
					<div class="ad_tbl_toplist_datepk">
				 		<table class="table table-bordered tbl_fixed">
				 			<caption>검색 조건 설정</caption>
							<colgroup>
								<col style="width: auto">
								<col style="min-width: 90px">
								<col style="width: 120px">
								<col style="width: 140px">
								<col style="width: 82px">
								<col style="width: 82px">
								<col style="width: 94px">
							</colgroup>
							<tbody>
								<tr>
									<td style="border-left:hidden"></td>
									<td class="td_input" style="border-right:hidden;">
										<sbux-button
											id="btn-ordrGds"
											name="btn-ordrGds"
											uitype="normal"
											onclick="fn_ordrGdsMng"
											class="btn btn-sm btn-outline-dark"
											text="발주상품관리"
										></sbux-button>
									</td>
									<td class="td_input" style="border-right:hidden; border-left:hidden" >
										<sbux-select
											unselected-text="대형마트 선택"
											uitype="single"
											id="slt-lgszMrktCd"
											name="slt-lgszMrktCd"
											class="form-control input-sm"
											jsondata-ref="jsonComLgszMrkt"
											onchange=""
										/>
									</td>
									<td class="td_input" style="border-right:hidden; border-left:hidden" >
										<sbux-datepicker
											id="dtp-crtrYmd"
											name="dtp-crtrYmd"
											uitype="popup"
											date-format="yyyy-mm-dd"
											class="form-control input-sm sbux-pik-group-apc"
											onchange="fn_dtpChangeCrtr"
										></sbux-datepicker>
									</td>
									<td class="td_input" style="border-right:hidden;">
										<sbux-button
											id="btn-rcptOutordr"
											name="btn-rcptOutordr"
											uitype="normal"
											onclick="fn_rcptOutordr"
											class="btn btn-sm btn-outline-dark"
											text="발주정보수신"
										></sbux-button>
									</td>
									<td class="td_input" style="border-right:hidden;">
										<sbux-button
											id="btnRcptOrdrAll"
											name="btnReceiptBndl"
											uitype="normal"
											onclick="fn_receiptBndl"
											class="btn btn-sm btn-outline-dark"
											text="일괄 접수"
										></sbux-button>
									</td>
									<td class="td_input" style="border-right:hidden;">
										<sbux-button
											id="btnRegPrdctnCmnd"
											name="btnRegPrdctnCmnd"
											uitype="normal"
											onclick="fn_regSpmtCmnd"
											class="btn btn-sm btn-outline-dark"
											text="출하지시 등록"
										></sbux-button>
									</td>
								</tr>
							</tbody>
				 		</table>
					</div>
				</div>
				<div class="table-responsive tbl_scroll_sm">
					<div id="sb-area-grdOutordr" style="width:100%;height:433px;"></div>
				</div>
				<!--[pp] //검색결과 -->

			</div>
		</div>
	</section>
	<!-- 거래처 선택 Modal -->
    <div>
        <sbux-modal id="modal-cnpt" name="modal-cnpt" uitype="middle" header-title="거래처 선택" body-html-id="body-modal-cnpt" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-cnpt">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/cnptPopup.jsp"></jsp:include>
    </div>
    <!-- 상품 선택 Modal -->
    <div>
        <sbux-modal id="modal-gds" name="modal-gds" uitype="middle" header-title="상품 선택" body-html-id="body-modal-gds" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-gds">
    	<jsp:include page="/WEB-INF/view/apcss/am/popup/gdsPopup.jsp"></jsp:include>
    </div>
    <!-- 품종 선택 Modal -->
    <div>
        <sbux-modal id="modal-vrty" name="modal-vrty" uitype="middle" header-title="품종 선택" body-html-id="body-modal-vrtyCrtr" footer-is-close-button="false" header-is-close-button="false" style="width:800px"></sbux-modal>
    </div>
    <div id="body-modal-vrtyCrtr">
    	<jsp:include page="../../am/popup/vrtyCrtrPopup.jsp"></jsp:include>
    </div>
    
    <!-- 발주상품코드 Modal -->
    <div>
        <sbux-modal 
        	id="modal-ordrGdsPop" 
        	name="modal-ordrGdsPop" 
        	uitype="middle" 
        	header-title="발주상품 관리" 
        	body-html-id="body-modal-ordrGds" 
        	footer-is-close-button="false" 
        	header-is-close-button="false" 
        	style="width:1000px"
        ></sbux-modal>
    </div>
    <div id="body-modal-ordrGds">
    	<jsp:include page="../../am/popup/mrktOrdrGdsPopup.jsp"></jsp:include>
    </div>
    
</body>
<script type="text/javascript">


	var grdOutordr;
	
	var jsonOutordr 		= [];
	var jsonApcItem			= [];															// 품목
	var jsonApcVrty			= [];															// 품종
	var jsonRcptYn			= [{text: "접수", value: "Y"}, {text: "미접수", value: "N"}];															// 접수여부
	var jsonComOutordrType	= [];															// 발주유형
	var jsonTrsprtCoCd		= [];															// 운송회사

	var jsonComLgszMrkt		= [];

	var comboGridRcpYn 		= [{label: "접수", value: "Y"}, {label: "미접수", value: "N"}];	// 접수여부 (그리드)

	
	/**
     * @name fn_initSBSelect
     * @description SBSelect 초기화
     */
	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 	 	jsonApcItem,		gv_selectedApcCd),	// 품목
		 	gfn_setApcVrtySBSelect('srch-inp-vrtyCd', 	 	jsonApcVrty, 		gv_selectedApcCd),	// 품종
			gfn_setComCdSBSelect('srch-slt-outordrType', 	jsonComOutordrType,	'OUTORDR_TYPE'),	// 발주유형
			gfn_setTrsprtsSBSelect('srch-slt-trsprtCoCd', 	jsonTrsprtCoCd, 	gv_selectedApcCd),	// 운송회사
			gfn_setComCdSBSelect('slt-lgszMrktCd', 			jsonComLgszMrkt,	'LGSZ_MRKT_CD'),	// 발주유형
		]);
		SBUxMethod.refresh('srch-slt-rcptYn');
		SBUxMethod.refresh('grdOutordr');	// 접수여부 (그리드)
	}

	/**
     * @name fn_init
     * @description 화면 init
     */
	const fn_init = async function() {

		const firstYmd = gfn_dateFirstYmd(new Date());
		const nowYmd = gfn_dateToYmd(new Date());

		SBUxMethod.set("srch-dtp-outordrYmdFrom", firstYmd);
		SBUxMethod.set("srch-dtp-outordrYmdTo", nowYmd);
		SBUxMethod.set("srch-dtp-cmndYmd", nowYmd);

		SBUxMethod.set("dtp-crtrYmd", nowYmd);

		await fn_initSBSelect();

		fn_createOutordrGrid();

		fn_search();
	}

	
	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});


	/**
     * @name fn_dtpChange
     * @description 발주일자 조회조건 validation
     */
	const fn_dtpChange = function() {
		let outordrYmdFrom = SBUxMethod.get("srch-dtp-outordrYmdFrom");
		let outordrYmdTo = SBUxMethod.get("srch-dtp-outordrYmdTo");
		if (gfn_diffDate(outordrYmdFrom, outordrYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-outordrYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-outordrYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}
	
	/**
     * @name fn_dtpChangeCrtr
     * @description 수신기준일자 조회조건 validation
     */
	const fn_dtpChangeCrtr = function(){
		let crtrYmd = SBUxMethod.get("dtp-crtrYmd");
		let outordrYmdFrom = SBUxMethod.get("srch-dtp-outordrYmdFrom");
		if (gfn_diffDate(outordrYmdFrom, crtrYmd) < 0){
			gfn_comAlert("W0015", "수신일자", "발주일자 시작일");		//	W0015	{0}이/가 {1} 보다 작습니다.
			SBUxMethod.set("dtp-crtrYmd", gfn_dateToYmd(new Date()));
			return;
		}
		
		let day = new Date();
		day.setHours(0, 0, 0, 0);
		let tomorrow = new Date(day.setDate(day.getDate()+1))

		if (gfn_diffDate(crtrYmd, gfn_dateToYmd(tomorrow)) <= 0){
			gfn_comAlert("W0014", "수신일자는", "금일");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("dtp-crtrYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}

	/**
     * @name fn_dtpChangeCmnd
     * @description 지시일자 validation
     */
	const fn_dtpChangeCmnd = function(){
		let cmndYmd = SBUxMethod.get("srch-dtp-cmndYmd");

		if (gfn_diffDate(gfn_dateToYmd(new Date()), cmndYmd) < 0){
			gfn_comAlert("W0015", "지시일자는", "금일");		//	W0015	{0}이/가 {1} 보다 작습니다.
			SBUxMethod.set("srch-dtp-cmndYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}

	/**
     * @name fn_dtpChangeDudt
     * @description 납기일자 validation
     */
	const fn_dtpChangeDudt = function(){
		let dudtYmd = SBUxMethod.get("srch-dtp-dudtYmd");
		if (gfn_diffDate(gfn_dateToYmd(new Date()), dudtYmd) < 0){
			gfn_comAlert("W0015", "납기일자", "금일");		//	W0015	{0}이/가 {1} 보다 작습니다.
			SBUxMethod.set("srch-dtp-dudtYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}

	/**
     * @name fn_selectItem
     * @description 품목변경 이벤트
     */
	function fn_selectItem() {
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
	}

	/**
     * @name fn_createOutordrGrid
     * @description 발주정보 그리드 생성
     */
	const fn_createOutordrGrid = function() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdOutordr';
	    SBGridProperties.id = 'grdOutordr';
	    SBGridProperties.jsonref = 'jsonOutordr';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.selectmode = 'free';
	    SBGridProperties.extendlastcol = 'scroll';
	    SBGridProperties.oneclickedit = true;
	    SBGridProperties.allowcopy = true;
		SBGridProperties.explorerbar = 'move';				// 개인화 컬럼 이동 가능
		SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
		SBGridProperties.contextmenulist = objMenuList;		// 우클릭 메뉴 리스트
		SBGridProperties.frozencols = 5;
    	SBGridProperties.paging = {
    			'type' : 'page',
    		  	'count' : 5,
    		  	'size' : 100,
    		  	'sorttype' : 'page',
    		  	'showgoalpageui' : true
    	    };
        SBGridProperties.columns = [
        	{
        		caption: ["<input type='checkbox' onchange='fn_checkAll(grdOutordr, this);'>"],
        		ref: 'checked', 		width: '40px', 		type: 'checkbox',
        		style:'text-align: center',
        		typeinfo : {ignoreupdate: true}
        	},
            {
        		caption: ['접수일자'], 		
        		ref: 'rcptCfmtnYmd', 	
        		width: '100px', 	
        		type: 'output',			
        		style:'text-align: center',
    		    format : {
    		    	type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'
    		    }
        	},
            {caption: ['발주유형'], 		ref: 'outordrTypeNm', 	width: '70px', 		type: 'output',			style:'text-align: center'},
            {
            	caption: ['접수여부'], 		
            	ref: 'rcptYn', 			
            	width: '70px', 		
            	type: 'combo',			
            	style:'text-align: center',
            	typeinfo : {
            		ref:'comboGridRcpYn', 
            		label:'label', 
            		value:'value'
            	}
            },
            {caption: ['발주번호'], 		ref: 'outordrno', 		width: '140px', 	type: 'output',			style:'text-align: center'},
            {caption: ['거래처명'], 		ref: 'apcCnptNm', 		width: '200px', 	type: 'output',			style:'text-align: center'},
            {
            	caption: ['납기일자'], 		
            	ref: 'wrhsYmd', 		
            	width: '100px', 	
            	type: 'output',			
            	style:'text-align: center',
    		    format : {
    		    	type: 'date', 
    		    	rule: 'yyyy-mm-dd', 
    		    	origin: 'yyyymmdd'
    		    }
            },
            {
            	caption: ['발주일자'], 		
            	ref: 'outordrYmd', 		
            	width: '100px', 	
            	type: 'output',			
            	style:'text-align: center',
        		format : {
        			type: 'date', 
        			rule: 'yyyy-mm-dd', 
        			origin: 'yyyymmdd'
        		}
            },
            {caption: ['주문자'], 		ref: 'ordrPrsn', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['공급자명'], 		ref: 'splyPrsn', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['상품명'], 		ref: 'spmtPckgUnitNm', 	width: '150px', 	type: 'output',			style:'text-align: center'},
            {caption: ['상품코드'], 		ref: 'spmtPckgUnitCd', 	width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['배송지'], 		ref: 'dldtn', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['품목'], 			ref: 'itemNm', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['품종'], 			ref: 'vrtyNm', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['규격'], 			ref: 'spcfctNm', 		width: '70px', 		type: 'output',			style:'text-align: center'},
            {
            	caption: ['입수'], 			
            	ref: 'bxGdsQntt', 		
            	width: '100px', 	
            	type: 'output',			
            	style:'text-align: right',
				format : {
					type:'number', 
					rule:'#,###'
				}
            },
            {
            	caption: ['발주수량'], 		
            	ref: 'outordrQntt', 	
            	width: '70px', 		
            	type: 'output',			
            	style:'text-align: right',
				format : {
					type:'number', 
					rule:'#,###'
				}
            },
            {
            	caption: ['낱개수량'], 		
            	ref: 'pieceQntt', 		
            	width: '70px', 		
            	type: 'output',			
            	style:'text-align: right',
				format : {
					type:'number', 
					rule:'#,###'
				}
            },
            {caption: ['단위'], 			ref: 'unitCd', 			width: '70px', 		type: 'output',			style:'text-align: center'},
            {
            	caption: ['박스단가 (원)'], 	
            	ref: 'bxUntprc', 		
            	width: '100px', 	
            	type: 'output',			
            	style:'text-align: right',
            	typeinfo : {
            		mask : {alias : 'numeric'}
            	}, 
            	format : {
            		type:'number', 
            		rule:'#,###'
            	}
            },
            {
            	caption: ['발주단가 (원)'], 	
            	ref: 'outordrUntprc', 	
            	width: '100px', 	
            	type: 'output',			
            	style:'text-align: right',
            	typeinfo : {
            		mask : {alias : 'numeric'}
            	}, format : {
            		type:'number', 
            		rule:'#,###'
            	}
            },
            {caption: ['발주단위'], 		ref: 'outordrUnitCd', 	width: '70px', 		type: 'output',			style:'text-align: center'},
            {caption: ['LOT'], 			ref: 'lot', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {
            	caption: ['세액 (원)'], 		ref: 'txAmt', 			width: '100px', 	type: 'output',			style:'text-align: right',
            	typeinfo : {
            		mask : {alias : 'numeric'}
            	}, 
            	format : {
            		type:'number', 
            		rule:'#,###'
            	}
            },
            {
            	caption: ['발주금액 (원)'], 	
            	ref: 'outordrAmt', 		
            	width: '100px', 	
            	type: 'output',			
            	style:'text-align: right',
            	typeinfo : {
            		mask : {
            			alias : 'numeric'
            		}
            	}, 
            	format : {
            		type:'number', 
            		rule:'#,###'
            	}
            },
  	        {
            	caption: ['재고수량'], 		
            	ref: 'invntrQntt', 		
            	width: '100px', 	
            	type: 'output', 		
            	style:'text-align:right',
  				format : {
  					type:'number', 
  					rule:'#,###'
  				}
            },
            {
            	caption: ['출하수량'], 		
            	ref: 'spmtQntt',		
            	width: '100px', 	
            	type: 'output', 		
            	style:'text-align:right',
  				format : {
  					type:'number',
  					rule:'#,###'
  				}
            },
            {
            	caption: ['출하지시수량'], 	
            	ref: 'cmndQntt',		
            	width: '100px', 	
            	type: 'output', 		
            	style:'text-align:right',
  				format : {
  					type:'number', 
  					rule:'#,###'
  				}
            },
            {
            	caption: ['지시수량'], 		
            	ref: 'inptCmndQntt', 	
            	width: '80px', 		
            	type: 'input', 			
            	style:'text-align:right; background:#FFF8DC;',
            	typeinfo : {
            		mask : {
            			alias : 'numeric'
            		}, 
            		maxlength : 10
            	}, 
            	format : {
            		type:'number', 
            		rule:'#,###'
            	}, 
            	validate : gfn_chkByte.bind({byteLimit: 10})
            },
            {
            	caption: ['지시중량 (Kg)'], 	
            	ref: 'inptCmndWght', 	
            	width: '100px', 	
            	type: 'output', 		
            	style:'text-align:right',
            	typeinfo : {
            		mask : {alias : 'numeric'}
            	}, 
            	format : {
            		type:'number', 
            		rule:'#,###'
            	}
            },
            {caption: ['입고형태'], 		ref: 'wrhsType', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['문서번호'], 		ref: 'docNo', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['도크정보'], 		ref: 'dockInfo', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['센터구분'], 		ref: 'cntrSe', 			width: '70px', 		type: 'output',			style:'text-align: center'},
            {caption: ['바이어명'], 		ref: 'buyerNm', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {
            	caption: ['센터입하일'], 		
            	ref: 'cntrRcvdWrhsYmd', 
            	width: '100px', 	
            	type: 'output',			
            	style:'text-align: center',
    		    format : {
    		    	type: 'date', 
    		    	rule: 'yyyy-mm-dd', 
    		    	origin: 'yyyymmdd'
    		    }
            },
            {caption: ['센터명'], 		ref: 'cntrNm', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['납품구분'], 		ref: 'dlvgdsSeCd', 		width: '70px', 		type: 'output',			style:'text-align: center'},
            {caption: ['기타'], 			ref: 'etc', 			width: '300px', 	type: 'output',			style:'text-align: center'},
            {caption: ['접수APC (농협)'], ref: 'rcptCfmtnApcNm', 	width: '200px', 	type: 'output',			style:'text-align: center'},
            {caption: ['출하지시번호'], 	ref: 'spmtCmndno', 		width: '140px', 	type: 'output',			style:'text-align: center'},
            {
            	caption: ['출하일자'], 		
            	ref: 'spmtYmd', 		
            	width: '100px', 	
            	type: 'output',			
            	style:'text-align: center',
    		    format : {
    		    	type: 'date', 
    		    	rule: 'yyyy-mm-dd', 
    		    	origin: 'yyyymmdd'
    		    }
            },
            {
            	caption: ['발주상품명'], 		
            	ref: 'orgnGdsNm', 		
            	width: '150px', 	
            	type: 'output',			
            	style:'text-align: center'
            },
            {
            	caption: ['발주상품코드'], 	
            	ref: 'orgnGdsCd', 		
            	width: '100px', 	
            	type: 'output',			
            	style:'text-align: center'
            },
            {caption: ['지시일자'], 		ref: 'cmndYmd', 		hidden: true},
            {caption: ['발주유형'], 		ref: 'outordrType', 	hidden: true},
            {caption: ['운송회사코드'], 	ref: 'trsprtCoCd', 		hidden: true},
            {caption: ['비고'],	 		ref: 'rmrk', 			hidden: true},
            {caption: ['상품등급'],	 	ref: 'gdsGrd', 			hidden: true},
            {caption: ['단위중량'],	 	ref: 'wght', 			hidden: true},
            {caption: ['APC코드'], 		ref: 'apcCd', 			hidden: true},
            {caption: ['APC구분코드'], 	ref: 'apcSeCd', 		hidden: true},
            {caption: ['거래처코드'], 		ref: 'apcCnptCd', 		hidden: true},
            {caption: ['품목코드'], 		ref: 'itemCd', 			hidden: true},
            {caption: ['품종코드'], 		ref: 'vrtyCd', 			hidden: true},
            {caption: ['규격코드'], 		ref: 'spcfctCd', 		hidden: true},
            {caption: ['삭제유무'], 		ref: 'delYn', 			hidden: true}
        ];
        
        grdOutordr = _SBGrid.create(SBGridProperties);
        grdOutordr.bind('afterpagechanged', fn_pagingOutordr);
        grdOutordr.bind('valuechanged', fn_grdCmndQnttValueChanged);
        grdOutordr.bind('select' , fn_setValue);
        grdOutordr.bind('deselect', fn_delValue);
    }

	/**
     * @name fn_checkAll
     * @description 그리드 체크박스 전체 선택
     */
    const fn_checkAll = function(grid, obj) {
		
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "true" : "false";
        //체크박스 열 index
        var getColRef = grid.getColRef("checked");
    	let nRow = grid.getRow();
    	let nCol = grid.getCol();
    	let alertList = [];
    	let checkedList = [];
        for (var i=0; i<gridList.length; i++) {
        	if (grid.getCellDisabled(i+1, getColRef)) {
        		continue;
        	}
        	grid.setCol(getColRef);
        	if (checkedYn == "true") {
            	grid.clickCell(i+1, getColRef, true, false);

           		// 발주수량 - 출하수량 - 출하지시수량 = 가능한 지시수량
       	    	let invntrQntt 		= grid.getRowData(i+1).invntrQntt;
       			let spmtQntt 		= grid.getRowData(i+1).spmtQntt;
       			let outordrQntt 	= grid.getRowData(i+1).outordrQntt;
       			let cmndQntt 		= grid.getRowData(i+1).cmndQntt;
       			let psbltyCmndQntt 	= outordrQntt - cmndQntt;
       			let wght 			= grid.getRowData(i+1).wght;
       			let inptCmndQnttCol = grid.getColRef("inptCmndQntt");
       			let inptCmndWghtCol = grid.getColRef("inptCmndWght");

       			if(psbltyCmndQntt > 0 && invntrQntt > 0){
       				if(psbltyCmndQntt > invntrQntt) {
       					grid.setCellData(i+1, inptCmndQnttCol, invntrQntt);
       					grid.setCellData(i+1, inptCmndWghtCol, invntrQntt*wght);
       		            grid.setCellData(i+1, getColRef, checkedYn, true, false);
       		            checkedList.push(i+1);
       				} else {
       					grid.setCellData(i+1, inptCmndQnttCol, psbltyCmndQntt);
       					grid.setCellData(i+1, inptCmndWghtCol, psbltyCmndQntt*wght);
       		            grid.setCellData(i+1, getColRef, checkedYn, true, false);
       		            checkedList.push(i+1);
       				}
       			} else if (invntrQntt <= 0) {
       		    	alertList.push(i+1 + "번째 행");
       			}
        	} else {
            	grid.clickCell(i+1, getColRef);
	            grid.setCellData(i+1, getColRef, checkedYn, true, false);
        	}
        }
    	grid.clickCell(nRow, nCol);

    	if (checkedYn == "true") {
	    	if (checkedList.length == 0) {
	        	let ref = "<input type='checkbox' onchange='fn_checkAll(grdOutordr, this);'>";
	        	grid.setCellData(0, getColRef, ref, true, false);
			}
    	}

    	if (alertList.length != 0) {
        	gfn_comAlert("E0000", alertList.join(", ") + "의 재고가 없습니다.");
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
	/**
     * @name fn_excelDwnld
     * @description 엑셀 다운로드
     */
    function fn_excelDwnld() {
    	grdOutordr.exportLocalExcel("발주정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	/**
	 * @name fn_delete
	 * @description 발주정보 삭제
	 */
    const fn_delete = async function() {
		
		const outordrList = [];
	
    	const allData = grdOutordr.getGridDataAll();
		
    	for ( let i=0; i<allData.length; i++) {
    		
    		const rowData = allData[i];
    		
    		if (rowData.checked == "true") {
    			if (_.isEqual(rowData.rcptYn, "Y")) {
    				// 접수상태
    				gfn_comAlert("W0010", "접수", "주문");		//	W0010	이미 {0}된 {1} 입니다.
    				return;
    			}
    			outordrList.push(rowData);
    		}
    	}
    	
    	if (outordrList.length == 0) {
    		gfn_comAlert("W0005", "삭제대상");		//	W0005	{0}이/가 없습니다.
    		return;
    	}
    	
		// comConfirm
		if (!gfn_comConfirm("Q0001", "발주정보삭제")) {	//	Q0001	{0} 하시겠습니까?
	    	return;
	    }

    	const postJsonPromise = gfn_postJSON("/am/ordr/deleteOutordrList.do", outordrList);
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        		//gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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
     * @name fn_search
     * @description 조회버튼
     */
    const fn_search = async function() {
		if (	gfn_isEmpty(SBUxMethod.get("srch-dtp-outordrYmdFrom")) 
				|| gfn_isEmpty(SBUxMethod.get("srch-dtp-outordrYmdTo"))){
			gfn_comAlert("W0002", "발주일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		
    	let recordCountPerPage = grdOutordr.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdOutordr.movePaging(currentPageNo);
    }

	let newJsonOutordrInfo = [];

	/**
     * @name fn_setGrdOutordr
     * @description 발주정보 조회
     */
	const fn_setGrdOutordr = async function(recordCountPerPage, currentPageNo) {

		let apcCd = gv_selectedApcCd;
		let rcptYn = SBUxMethod.get("srch-slt-rcptYn");
		let outordrYmdFrom = SBUxMethod.get("srch-dtp-outordrYmdFrom");
		let outordrYmdTo = SBUxMethod.get("srch-dtp-outordrYmdTo");
		let outordrType = SBUxMethod.get("srch-slt-outordrType");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-inp-vrtyCd");
		let cnptNm = SBUxMethod.get("srch-inp-cnptNm");
		let dudtYmd = SBUxMethod.get("srch-dtp-dudtYmd");
		let spmtPckgUnitNm = SBUxMethod.get("srch-inp-spmtPckgUnitNm");

		let ordrVO = {
					apcCd			: apcCd,
			        rcptYn 			: rcptYn,
					outordrYmdFrom 	: outordrYmdFrom,
					outordrYmdTo 	: outordrYmdTo,
					outordrType 	: outordrType,
					itemCd 			: itemCd,
					vrtyCd 			: vrtyCd,
					apcCnptNm 		: cnptNm,
					wrhsYmd 		: dudtYmd,
					spmtPckgUnitNm 	: spmtPckgUnitNm,
					
					pagingYn 			: 'Y',
					currentPageNo 		: currentPageNo,
					recordCountPerPage 	: recordCountPerPage
				};
        try{
        	
        	let postJsonPromise = gfn_postJSON("/am/ordr/selectOrdrList.do", ordrVO);
            let data = await postJsonPromise;
            newJsonOutordrInfo = [];
        	
  			if (!_.isEqual("S", data.resultStatus)) {
  				gfn_comAlert(data.resultCode, data.resultMessage);
  				return;	
  			}
  			
  			jsonOutordr.length = 0;
  			let totalRecordCount = 0;
  			
        	data.resultList.forEach((item, index) => {
				
        		if (gfn_isEmpty(item.apcCnptNm)) {
        			item.apcCnptNm = item.lgszMrktNm;
        		}
        		
        		let ordr = {
					  checked 			: "false"
					, rcptCfmtnYmd 		: item.rcptCfmtnYmd
					, outordrTypeNm 	: item.outordrTypeNm
					, outordrType 		: item.outordrType
					, rcptYn 			: null
					, outordrno 		: item.outordrno
					, apcCnptNm	 		: item.apcCnptNm
					, wrhsYmd 			: item.wrhsYmd
					, outordrYmd 		: item.outordrYmd
					, ordrPrsn 			: item.ordrPrsn
					, splyPrsn 			: item.splyPrsn
					, spmtPckgUnitNm 	: item.spmtPckgUnitNm
					, spmtPckgUnitCd	: item.spmtPckgUnitCd
					, dldtn 			: item.dldtn
					, itemNm 			: item.itemNm
					, vrtyNm 			: item.vrtyNm
					, spcfctNm 			: item.spcfctNm
					, bxGdsQntt 		: item.bxGdsQntt
					, outordrQntt		: item.outordrQntt
					, pieceQntt			: item.pieceQntt
					, unitCd			: item.unitCd
					, bxUntprc			: item.bxUntprc
					, outordrUntprc		: item.outordrUntprc
					, outordrUnitCd		: item.outordrUnitCd
					, lot				: item.lot
					, txAmt				: item.txAmt
					, outordrAmt		: item.outordrAmt
					, wrhsType			: item.wrhsType
					, docNo				: item.docNo
					, dockInfo			: item.dockInfo
					, cntrSe			: item.cntrSe
					, buyerNm			: item.buyerNm
					, cntrRcvdWrhsYmd	: item.cntrRcvdWrhsYmd
					, cntrNm			: item.cntrNm
					, dlvgdsSeCd		: item.dlvgdsSeCd
					, etc				: item.etc
					, rcptCfmtnApcNm	: item.rcptCfmtnApcNm
					, spmtCmndno		: item.spmtCmndno
					, spmtYmd			: item.spmtYmd
					, invntrQntt		: item.invntrQntt
					, invntrWght		: item.invntrWght
					, spmtQntt			: item.spmtQntt
					, spmtWght			: item.spmtWght
					, cmndQntt			: item.cmndQntt
					, cmndWght			: item.cmndWght
					, gdsGrd 			: item.gdsGrd
					, wght	 			: item.wght
					, apcCd 			: item.apcCd
					, apcSeCd 			: item.apcSeCd
					, apcCnptCd 		: item.apcCnptCd
					, itemCd 			: item.itemCd
					, vrtyCd 			: item.vrtyCd
					, spcfctCd 			: item.spcfctCd
					, delYn				: item.delYn
					, orgnGdsCd			: item.orgnGdsCd
					, orgnGdsNm			: item.orgnGdsNm
					, lgszMrktCd		: item.lgszMrktCd
					, lgszMrktNm		: item.lgszMrktNm
				}
				
				if (!gfn_isEmpty(ordr.rcptCfmtnYmd)){
					ordr.rcptYn = 'Y';
				} else {
					ordr.rcptYn = 'N';
				}
				
        		if (index === 0) {
	  				totalRecordCount = item.totalRecordCount;
	  			}
        		
				jsonOutordr.push(Object.assign({}, ordr));
				newJsonOutordrInfo.push(Object.assign({}, ordr));
				
			});
	        	
        	if (jsonOutordr.length > 0){
				if (grdOutordr.getPageTotalCount() != totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdOutordr.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdOutordr.rebuild();
				} else {
					grdOutordr.refresh();
				}
			} else {
				grdOutordr.setPageTotalCount(0);
				grdOutordr.rebuild();
			}
        	
        	document.querySelector('#cnt-outordr').innerText = totalRecordCount;
        	
        	// 체크박스 유무
        	for ( let i=1; i<=grdOutordr.getGridDataAll().length; i++ ){
    			const rowData = grdOutordr.getRowData(i);
    			if (rowData.outordrQntt == rowData.cmndQntt){
    				grdOutordr.setCellDisabled(i, 0, i, 0, true);
    			}
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
     * @name fn_pagingOutordr
     * @description 발주정보 조회 페이징
     */
    const fn_pagingOutordr = async function() {
    	let recordCountPerPage = grdOutordr.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdOutordr.getSelectPageIndex();
    	let ref = "<input type='checkbox' onchange='fn_checkAll(grdOutordr, this);'>";
    	grdOutordr.setCellData(0, grdOutordr.getColRef("checked"), ref, true, false);
    	fn_setGrdOutordr(recordCountPerPage, currentPageNo);
    }

	// 
	/**
	 * @name fn_receiptBndl
	 * @description 발주정보 일괄 접수
	 */
    const fn_receiptBndl = async function() {
		
    	let allData = grdOutordr.getGridDataAll();
    	let haveSpmtCmndList = [];
		const rcptOrdrAllList = [];

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdOutordr.getRowData(i);
			const rowSts = grdOutordr.getRowStatus(i);
			if (rowData.checked == "true") {
				if (!gfn_isEmpty(rowData.spmtCmndno)) {
					haveSpmtCmndList.push(i+"행");
				} else {
					if (rowSts === 2) {
						rowData.rowSts = "U";
						if (rowData.rcptYn == 'N') {
							rowData.rcptCfmtnYmd = null;
						} else {
							rowData.rcptCfmtnApcCd = gv_selectedApcCd;
							rowData.rcptCfmtnYmd = gfn_dateToYmd(new Date());
						}
						rcptOrdrAllList.push(rowData);
					} else {
						continue;
					}
				}
			}
		}

		if (haveSpmtCmndList.length > 0) {
			gfn_comAlert("E0000", haveSpmtCmndList.join(", ") + "은 출하지시가 등록된 데이터입니다.\n\n접수를 취소하시려면 출하지시를 삭제하십시오.");
            return;
		}

		if (rcptOrdrAllList.length == 0) {
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}
		if (!gfn_comConfirm("Q0001", "접수")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

        try {
        	
        	const postJsonPromise = gfn_postJSON("/am/ordr/multiOrdrList.do", rcptOrdrAllList);	// 프로그램id 추가
    		const data = await postJsonPromise;
        	
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
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
	 * @name fn_rcptOutordr
	 * @description 발주정보 수신 처리
	 */
	const fn_rcptOutordr = async function() {

		// set param
		const lgszMrktCd = SBUxMethod.get("slt-lgszMrktCd");
		const crtrYmd = SBUxMethod.get("dtp-crtrYmd");
		
		if (gfn_isEmpty(lgszMrktCd)) {
			gfn_comAlert("W0001", "대형마트");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		
		if (gfn_isEmpty(crtrYmd)) {
			gfn_comAlert("W0001", "수신기준일자");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (!gfn_comConfirm("Q0001", "발주정보수신")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		const rcptOutordr = {
				apcCd: gv_selectedApcCd,
				lgszMrktCd: lgszMrktCd,
				crtrYmd: crtrYmd
			}

        try {
        	
    		const postJsonPromise = gfn_postJSON(
					"/am/ordr/insertOutordrRcpt.do",
					rcptOutordr
				);	// 프로그램id 추가
			const data = await postJsonPromise;
        	
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);
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
	 * @name fn_grdCmndQnttValueChanged
	 * @description 지시수량 valueChanged Event
	 */
    const fn_grdCmndQnttValueChanged = async function(){

    	let nRow = grdOutordr.getRow();
		let nCol = grdOutordr.getCol();
		let inptCmndQnttCol = grdOutordr.getColRef("inptCmndQntt");
		switch (nCol) {
			case inptCmndQnttCol:	// checkbox
				fn_checkInptQntt();
				break;
			default:
				return;
		}
    }

    const fn_checkInptQntt = async function(){

    	let nRow = grdOutordr.getRow();
		let nCol = grdOutordr.getCol();

		const rowData = grdOutordr.getRowData(nRow);
		
		let invntrQntt 		= rowData.invntrQntt;
		let spmtQntt 		= rowData.spmtQntt;
		let outordrQntt 	= rowData.outordrQntt;
		let cmndQntt 		= rowData.cmndQntt;
		let inptCmndQntt 	= rowData.inptCmndQntt;
		let psbltyCmndQntt 	= outordrQntt - cmndQntt;
		let wght 			= rowData.wght;
		
		let inptCmndQnttCol = grdOutordr.getColRef("inptCmndQntt");
		let inptCmndWghtCol = grdOutordr.getColRef("inptCmndWght");
		let checkedCol 		= grdOutordr.getColRef("checked");

		// 지시가능한수량 > 입력한지시수량
		if (inptCmndQntt > psbltyCmndQntt){
			gfn_comAlert("W0008", "지시가능수량", "지시수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdOutordr.setCellData(nRow, inptCmndQnttCol , "");
			grdOutordr.setCellData(nRow, inptCmndWghtCol, "");
			grdOutordr.setCellData(nRow, checkedCol, "false");
            return;
		}
		
		if (invntrQntt >= inptCmndQntt){
			grdOutordr.setCellData(nRow, inptCmndWghtCol, inptCmndQntt*wght);
			grdOutordr.setCellData(nRow, checkedCol, "true");
		} else {
			gfn_comAlert("W0008", "재고수량", "지시수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdOutordr.setCellData(nRow, inptCmndQnttCol, "");
			grdOutordr.setCellData(nRow, inptCmndWghtCol, "");
			grdOutordr.setCellData(nRow, checkedCol, "false");
			return;
		}
		
		if (inptCmndQntt == 0){
			grdOutordr.setCellData(nRow, inptCmndQnttCol, "");
			grdOutordr.setCellData(nRow, inptCmndWghtCol, "");
			grdOutordr.setCellData(nRow, checkedCol, "false");
		}
    }

    const fn_setValue = function() {
    	let nRow = grdOutordr.getRow();
    	let nCol = grdOutordr.getCol();
    	let checkedCol 	= grdOutordr.getColRef("checked");
    	
    	if (nCol == checkedCol) {
    		const rowData = grdOutordr.getRowData(nRow);
    		// 발주수량 - 출하수량 - 출하지시수량 = 가능한 지시수량
	    	let invntrQntt 		= rowData.invntrQntt;
			let spmtQntt 		= rowData.spmtQntt;
			let outordrQntt 	= rowData.outordrQntt;
			let cmndQntt 		= rowData.cmndQntt;
			let psbltyCmndQntt 	= outordrQntt - cmndQntt;
			let wght 			= rowData.wght;
			
			let inptCmndQnttCol = grdOutordr.getColRef("inptCmndQntt");
			let inptCmndWghtCol = grdOutordr.getColRef("inptCmndWght");

			if(psbltyCmndQntt > 0 && invntrQntt > 0){
				if(psbltyCmndQntt > invntrQntt) {
					grdOutordr.setCellData(nRow, inptCmndQnttCol, invntrQntt);
					grdOutordr.setCellData(nRow, inptCmndWghtCol, invntrQntt*wght);
				} else {
					grdOutordr.setCellData(nRow, inptCmndQnttCol, psbltyCmndQntt);
					grdOutordr.setCellData(nRow, inptCmndWghtCol, psbltyCmndQntt*wght);
				}
			} else if (invntrQntt <= 0) {
				grdOutordr.setCellData(nRow, inptCmndQnttCol, "");
				grdOutordr.setCellData(nRow, inptCmndWghtCol, "");
				//grdOutordr.setCellData(nRow, checkedCol, "false");
				//gfn_comAlert("W0005", "상품재고");		//	W0005	{0}이/가 없습니다.
			}
    	}
    }

    const fn_delValue = async function(){
    	var nRow = grdOutordr.getRow();
        var getColRef = grdOutordr.getColRef("checked");
        
    	let inptCmndQnttCol = grdOutordr.getColRef("inptCmndQntt");
		let inptCmndWghtCol = grdOutordr.getColRef("inptCmndWght");
		grdOutordr.setCellData(nRow, inptCmndQnttCol, "");
		grdOutordr.setCellData(nRow, inptCmndWghtCol, "");

    	if (grdOutordr.getCheckedRows(getColRef) == 0) {
        	let ref = "<input type='checkbox' onchange='fn_checkAll(grdOutordr, this);'>";
        	grdOutordr.setCellData(0, getColRef, ref, true, false);
    	}
    }

	// 출하지시 등록
    const fn_regSpmtCmnd = async function () {
		
    	let allData = grdOutordr.getGridDataAll();
		let cmndYmd = SBUxMethod.get("srch-dtp-cmndYmd");
		let trsprtCoCd = SBUxMethod.get("srch-slt-trsprtCoCd");
		let rmrk = SBUxMethod.get("srch-inp-rmrk");
		const regSpmtCmndList = [];

		if (gfn_isEmpty(cmndYmd)){
			gfn_comAlert("W0002", "지시일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(trsprtCoCd)){
			gfn_comAlert("W0002", "운송회사");		//	W0002	{0}을/를 입력하세요.
            return;
		}

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdOutordr.getRowData(i);
			const rowSts = grdOutordr.getRowStatus(i);
			
			if (rowData.checked == "true"){
				if (gfn_isEmpty(rowData.inptCmndQntt)){
					gfn_comAlert("W0002", "지시수량");		//	W0002	{0}을/를 선택하세요.
					return;
				}
				rowData.cmndYmd = cmndYmd;
				rowData.trsprtCoCd = trsprtCoCd;
				rowData.rmrk = rmrk;
				rowData.cmndQntt = rowData.inptCmndQntt;
				rowData.cmndWght = rowData.inptCmndWght;
				if (gfn_isEmpty(rowData.rcptCfmtnYmd)){
					rowData.rcptCfmtnApcCd = gv_selectedApcCd;
					rowData.rcptCfmtnYmd = gfn_dateToYmd(new Date());
					rowData.rowSts = "U";
				} else {
					rowData.rowSts = "I";
				}
				regSpmtCmndList.push(rowData);
			} else {
				continue;
			}
		}

		if (regSpmtCmndList.length == 0){
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}
		if (!gfn_comConfirm("Q0001", "출하지시 등록")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		try {
			
	    	const postJsonPromise = gfn_postJSON("/am/ordr/regSpmtCmndList.do", regSpmtCmndList, this.prgrmId);	// 프로그램id 추가
			const data = await postJsonPromise;
			
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_search();
        	} else {
        		gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        	}
		}catch(e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

	// 접수여부 콤보박스 (검색 조건)
	async function setRcptYnSBSelect(_targetIds, _jsondataRef) {
		let sourceJson = [{cmnsNm: "접수", cmnsCd: "Y"}, {cmnsNm: "미접수", cmnsCd: "N"}];
		gfn_setSBSelectJson(_targetIds, _jsondataRef, sourceJson);
	}

	// APC 선택 변경
	const fn_onChangeApc = async function() {
		let result = await Promise.all([
			fn_initSBSelect()
		]);
	}

	const fn_ordrGdsMng = function() {
		
		const grid = grdOutordr;
		
		let nRow = grid.getRow();
		
		const param = {
			apcCd: gv_selectedApcCd,
			apcNm: gv_selectedApcNm,
			lgszMrktCd: null,
			orgnGdsCd: null,
			orgnGdsNm: null
		};
		
		if (nRow > 0) {
			let rowData = grid.getRowData(nRow);
			param.lgszMrktCd = rowData.lgszMrktCd;
			param.orgnGdsCd = rowData.orgnGdsCd;
			param.orgnGdsNm = rowData.orgnGdsNm;
		}
		
		popOrdrGds.init(
				param, 
				fn_setOrdrGds
			);
	}
	
	const fn_setOrdrGds = function(_ordrGds) {
		if (_ordrGds.saveCnt > 0) {
			fn_search();
		}
	}
	
	// 거래처 선택 팝업 호출
	const fn_modalCnpt = function() {
    	popCnpt.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-cnptNm"), fn_setCnpt);
	}

	const fn_setCnpt = function(cnpt) {
		if (!gfn_isEmpty(cnpt)) {
			SBUxMethod.set('srch-inp-cnptNm', cnpt.cnptNm);
		}
	}

	// 상품 선택 팝업 호출
	const fn_modalGds = function() {
    	popGds.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-inp-spmtPckgUnitNm"), fn_setGdsNm, SBUxMethod.get("srch-slt-itemCd"));
	}

	const fn_setGdsNm = function(gds) {
		if (!gfn_isEmpty(gds)) {
			SBUxMethod.set('srch-inp-spmtPckgUnitNm', gds.spmtPckgUnitNm);
			SBUxMethod.set("srch-slt-itemCd", gds.itemCd);
			SBUxMethod.set("srch-inp-vrtyCd", gds.vrtyCd);
		}
	}

	// 품종 선택 팝업 호출
	const fn_modalVrty = function() {
    	popVrty.init(gv_selectedApcCd, gv_selectedApcNm, SBUxMethod.get("srch-slt-itemCd"), fn_setVrty, fn_setVrtys);
	}

    const fn_setVrty = function(vrty) {
		if (!gfn_isEmpty(vrty)) {
			SBUxMethod.setValue('srch-slt-itemCd', vrty.itemCd);
			SBUxMethod.set('srch-inp-vrtyNm', vrty.vrtyNm);
			SBUxMethod.set('srch-inp-vrtyCd', vrty.vrtyCd);
		}
	}
     const fn_setVrtys = function(vrtys) {
		if (!gfn_isEmpty(vrtys)) {
			var _vrtyCd = [];
			var _vrtyNm = [];
			var diff = false;
			for(var i=0;i<vrtys.length;i++){
				if (vrtys[0].itemCd != vrtys[i].itemCd) {
					diff = true;
				}
				_vrtyCd.push(vrtys[i].vrtyCd);
				_vrtyNm.push(vrtys[i].vrtyNm);
			}
			if (diff) {
				SBUxMethod.set('srch-slt-itemCd', "");
			} else {
				SBUxMethod.set('srch-slt-itemCd', vrtys[0].itemCd);
			}
			SBUxMethod.set('srch-inp-vrtyCd', _vrtyCd.join(','));
			SBUxMethod.set('srch-inp-vrtyNm', _vrtyNm.join(','));
		}
	}

 	$(function(){
 		$(".glyphicon").on("click", function(){
 			SBUxMethod.set("srch-inp-vrtyNm", "");
			SBUxMethod.set("srch-inp-vrtyCd", "");
 		})
 	})
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>