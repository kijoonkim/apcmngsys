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
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ ${menuNm}</h3><!-- 발주정보조회 -->
				</div>
				<div style="margin-left: auto;">
					<sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-dark" text="조회" onclick="fn_search"></sbux-button>
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
						<li><span>발주 내역</span></li>
					</ul>
					<div class="ad_tbl_toplist_datepk">
				 		<table class="table table-bordered tbl_fixed">
				 			<caption>검색 조건 설정</caption>
							<colgroup>
								<col style="width: auto">
								<col style="width: 120px">
								<col style="width: 140px">
								<col style="width: 82px">
								<col style="width: 82px">
								<col style="width: 94px">
							</colgroup>
							<tbody>
								<tr>
									<td style="border-left:hidden"></td>
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
											onclick="btn_receiptBndl"
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
					<div id="sb-area-grdOutordrInfo" style="width:100%;height:433px;"></div>
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
</body>
<script type="text/javascript">


	var jsonOutordrInfo 	= [];

	var jsonApcItem			= [];															// 품목
	var jsonApcVrty			= [];															// 품종
	var jsonRcptYn			= [{text: "접수", value: "Y"}, {text: "미접수", value: "N"}];															// 접수여부
	var jsonComOutordrType	= [];															// 발주유형
	var jsonTrsprtCoCd		= [];															// 운송회사

	var jsonComLgszMrkt		= [];

	var comboGridRcpYn 		= [{label: "접수", value: "Y"}, {label: "미접수", value: "N"}];	// 접수여부 (그리드)

	const fn_initSBSelect = async function() {
		// 검색 SB select
		let rst = await Promise.all([
		 	gfn_setApcItemSBSelect('srch-slt-itemCd', 	 	jsonApcItem,		gv_selectedApcCd),	// 품목
		 	gfn_setApcVrtySBSelect('srch-inp-vrtyCd', 	 	jsonApcVrty, 		gv_selectedApcCd),	// 품종
			gfn_setComCdSBSelect('srch-slt-outordrType', 	jsonComOutordrType,	'OUTORDR_TYPE'),	// 발주유형
			gfn_setTrsprtsSBSelect('srch-slt-trsprtCoCd', 	jsonTrsprtCoCd, 	gv_selectedApcCd),	// 운송회사
			//setRcptYnSBSelect('srch-slt-rcptYn', 		 jsonRcptYn),								// 접수여부
			gfn_setComCdSBSelect('slt-lgszMrktCd', 			jsonComLgszMrkt,	'LGSZ_MRKT_CD'),	// 발주유형
		]);
		SBUxMethod.refresh('srch-slt-rcptYn');
		SBUxMethod.refresh('grdOutordrInfo');	// 접수여부 (그리드)
	}

	const fn_init = async function() {

		const firstYmd = gfn_dateFirstYmd(new Date());
		const nowYmd = gfn_dateToYmd(new Date());

		SBUxMethod.set("srch-dtp-outordrYmdFrom", firstYmd);
		SBUxMethod.set("srch-dtp-outordrYmdTo", nowYmd);
		SBUxMethod.set("srch-dtp-cmndYmd", nowYmd);

		SBUxMethod.set("dtp-crtrYmd", nowYmd);

		await fn_initSBSelect();

		fn_createOutordrInfoGrid();

		fn_search();
	}

	window.addEventListener('DOMContentLoaded', function(e) {
		fn_init();
	});



	const fn_dtpChange = function(){
		let outordrYmdFrom = SBUxMethod.get("srch-dtp-outordrYmdFrom");
		let outordrYmdTo = SBUxMethod.get("srch-dtp-outordrYmdTo");
		if (gfn_diffDate(outordrYmdFrom, outordrYmdTo) < 0){
			gfn_comAlert("W0014", "시작일자", "종료일자");		//	W0014	{0}이/가 {1} 보다 큽니다.
			SBUxMethod.set("srch-dtp-outordrYmdFrom", gfn_dateFirstYmd(new Date()));
			SBUxMethod.set("srch-dtp-outordrYmdTo", gfn_dateToYmd(new Date()));
			return;
		}
	}
	const fn_dtpChangeCrtr = function(){
		let crtrYmd = SBUxMethod.get("dtp-crtrYmd");
		let outordrYmdFrom = SBUxMethod.get("srch-dtp-outordrYmdFrom");
		if (gfn_diffDate(outordrYmdFrom, crtrYmd) < 0){
			gfn_comAlert("E0000", "수신일자는 발주일자 시작일 보다 이전일수 없습니다.");	//	E0000	{0}
			SBUxMethod.set("dtp-crtrYmd", gfn_dateToYmd(new Date()));
			return;
		}
		let day = new Date();
		day.setHours(0, 0, 0, 0);
		let tomorrow = new Date(day.setDate(day.getDate()+1))

		if (gfn_diffDate(crtrYmd, gfn_dateToYmd(tomorrow)) <= 0){
			gfn_comAlert("E0000", "수신일자는 금일 이후가 될수 없습니다.");					//	E0000	{0}
			SBUxMethod.set("dtp-crtrYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}

	const fn_dtpChangeCmnd = function(){
		let cmndYmd = SBUxMethod.get("srch-dtp-cmndYmd");

		if (gfn_diffDate(gfn_dateToYmd(new Date()), cmndYmd) < 0){
			gfn_comAlert("E0000", "지시일자는 금일 보다 이전일수 없습니다.");		//	E0000	{0}
			SBUxMethod.set("srch-dtp-cmndYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}

	const fn_dtpChangeDudt = function(){
		let dudtYmd = SBUxMethod.get("srch-dtp-dudtYmd");
		if (gfn_diffDate(gfn_dateToYmd(new Date()), dudtYmd) < 0){
			gfn_comAlert("E0000", "납기일자는 금일 이전일수 없습니다.");		//	E0000	{0}
			SBUxMethod.set("srch-dtp-dudtYmd", gfn_dateToYmd(new Date()));
			return;
		}
	}

	function fn_selectItem(){
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		SBUxMethod.set("srch-inp-vrtyNm", "");
		SBUxMethod.set("srch-inp-vrtyCd", "");
	}

	function fn_createOutordrInfoGrid() {
        var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-grdOutordrInfo';
	    SBGridProperties.id = 'grdOutordrInfo';
	    SBGridProperties.jsonref = 'jsonOutordrInfo';
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
    		  	'size' : 20,
    		  	'sorttype' : 'page',
    		  	'showgoalpageui' : true
    	    };
        SBGridProperties.columns = [
        	{
        		caption: ["<input type='checkbox' onchange='fn_checkAll(grdOutordrInfo, this);'>"],
        		ref: 'checked', 		width: '40px', 		type: 'checkbox',
        		style:'text-align: center',
        		typeinfo : {ignoreupdate: true}
        	},
            {caption: ['접수일자'], 		ref: 'rcptCfmtnYmd', 	width: '100px', 	type: 'output',			style:'text-align: center',
    		    format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['발주유형'], 		ref: 'outordrTypeNm', 	width: '70px', 		type: 'output',			style:'text-align: center'},
            {caption: ['접수여부'], 		ref: 'rcptYn', 			width: '70px', 		type: 'combo',			style:'text-align: center',
            	typeinfo : {ref:'comboGridRcpYn', label:'label', value:'value'}},
            {caption: ['발주번호'], 		ref: 'outordrno', 		width: '140px', 	type: 'output',			style:'text-align: center'},
            {caption: ['거래처명'], 		ref: 'apcCnptNm', 		width: '200px', 	type: 'output',			style:'text-align: center'},
            {caption: ['납기일자'], 		ref: 'wrhsYmd', 		width: '100px', 	type: 'output',			style:'text-align: center',
    		    format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['발주일자'], 		ref: 'outordrYmd', 		width: '100px', 	type: 'output',			style:'text-align: center',
        		format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['주문자'], 		ref: 'outordrPrsn', 	width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['공급자명'], 		ref: 'splyPrsn', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['상품명'], 		ref: 'spmtPckgUnitNm', 	width: '150px', 	type: 'output',			style:'text-align: center'},
            {caption: ['상품코드'], 		ref: 'spmtPckgUnitCd', 	width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['배송지'], 		ref: 'dldtn', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['품목'], 			ref: 'itemNm', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['품종'], 			ref: 'vrtyNm', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['규격'], 			ref: 'spcfctNm', 		width: '70px', 		type: 'output',			style:'text-align: center'},
            {caption: ['입수'], 			ref: 'bxGdsQntt', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['발주수량'], 		ref: 'outordrQntt', 	width: '70px', 		type: 'output',			style:'text-align: right',
				format : {type:'number', rule:'#,###'}},
            {caption: ['낱개수량'], 		ref: 'pieceQntt', 		width: '70px', 		type: 'output',			style:'text-align: right',
				format : {type:'number', rule:'#,###'}},
            {caption: ['단위'], 			ref: 'unitCd', 			width: '70px', 		type: 'output',			style:'text-align: center'},
            {caption: ['박스단가'], 		ref: 'bxUntprc', 		width: '100px', 	type: 'output',			style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### 원'}},
            {caption: ['발주단가'], 		ref: 'outordrUntprc', 	width: '100px', 	type: 'output',			style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### 원'}},
            {caption: ['발주단위'], 		ref: 'outordrUnitCd', 	width: '70px', 		type: 'output',			style:'text-align: center'},
            {caption: ['LOT'], 			ref: 'lot', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['세액'], 			ref: 'txAmt', 			width: '100px', 	type: 'output',			style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### 원'}},
            {caption: ['발주금액'], 		ref: 'outordrAmt', 		width: '100px', 	type: 'output',			style:'text-align: right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### 원'}},
  	        {caption: ['재고수량'], 		ref: 'invntrQntt', 		width: '100px', 	type: 'output', 		style:'text-align:right',
  				format : {type:'number', rule:'#,###'}},
            {caption: ['출하수량'], 		ref: 'spmtQntt',		width: '100px', 	type: 'output', 		style:'text-align:right',
  				format : {type:'number', rule:'#,###'}},
            {caption: ['출하지시수량'], 	ref: 'cmndQntt',		width: '100px', 	type: 'output', 		style:'text-align:right',
  				format : {type:'number', rule:'#,###'}},
            {caption: ['지시수량'], 		ref: 'inptCmndQntt', 	width: '80px', 		type: 'input', 			style:'text-align:right; background:#FFF8DC;',
            	typeinfo : {mask : {alias : 'numeric'}, maxlength : 10}, format : {type:'number', rule:'#,###'}, validate : gfn_chkByte.bind({byteLimit: 10})},
            {caption: ['지시중량'], 		ref: 'inptCmndWght', 	width: '100px', 	type: 'output', 		style:'text-align:right',
            	typeinfo : {mask : {alias : 'numeric'}}, format : {type:'number', rule:'#,### Kg'}},
            {caption: ['입고형태'], 		ref: 'wrhsType', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['문서번호'], 		ref: 'docno', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['도크정보'], 		ref: 'dockInfo', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['센터구분'], 		ref: 'cntrSe', 			width: '70px', 		type: 'output',			style:'text-align: center'},
            {caption: ['바이어명'], 		ref: 'buyerNm', 		width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['센터입하일'], 		ref: 'cntrRcvdWrhsYmd', width: '100px', 	type: 'output',			style:'text-align: center',
    		    format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
            {caption: ['센터명'], 		ref: 'cntrNm', 			width: '100px', 	type: 'output',			style:'text-align: center'},
            {caption: ['납품구분'], 		ref: 'dlvgdsSeCd', 		width: '70px', 		type: 'output',			style:'text-align: center'},
            {caption: ['기타'], 			ref: 'etc', 			width: '300px', 	type: 'output',			style:'text-align: center'},
            {caption: ['접수APC (농협)'], ref: 'rcptCfmtnApcNm', 	width: '200px', 	type: 'output',			style:'text-align: center'},
            {caption: ['출하지시번호'], 	ref: 'spmtCmndno', 		width: '140px', 	type: 'output',			style:'text-align: center'},
            {caption: ['출하일자'], 		ref: 'spmtYmd', 		width: '100px', 	type: 'output',			style:'text-align: center',
    		    format : {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}},
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
        grdOutordrInfo = _SBGrid.create(SBGridProperties);
        grdOutordrInfo.bind( "afterpagechanged" , "fn_pagingOutordrInfoList" );
        grdOutordrInfo.bind('valuechanged' , 'fn_grdCmndQnttValueChanged');
        grdOutordrInfo.bind('select' , 'fn_setValue');
        grdOutordrInfo.bind('deselect' , 'fn_delValue');
    }

	//그리드 체크박스 전체 선택
    function fn_checkAll(grid, obj) {
        var gridList = grid.getGridDataAll();
        var checkedYn = obj.checked ? "true" : "false";
        //체크박스 열 index
        var getColRef = grid.getColRef("checked");
    	var getRow = grid.getRow();
    	var getCol = grid.getCol();
        for (var i=0; i<gridList.length; i++) {
        	if (grid.getCellDisabled(i+1, getColRef)) {
        		continue;
        	}
        	grid.setCol(getColRef);
        	grid.clickCell(i+1, getColRef);
            grid.setCellData(i+1, getColRef, checkedYn, true, false);
        }
    	grid.clickCell(getRow, getCol);
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
    	grdOutordrInfo.exportLocalExcel("발주정보", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
    }

	// 출하지시 목록 조회 (조회 버튼)
    async function fn_search() {
    	let recordCountPerPage = grdOutordrInfo.getPageSize();  		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = 1;
    	grdOutordrInfo.movePaging(currentPageNo);
    }

	let newJsonOutordrInfo = [];

	// 출하지시 목록 조회 호출
	async function fn_callSelectOutordrInfoList(recordCountPerPage, currentPageNo){
		jsonOutordrInfo = [];
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
// 		let apcSeCd = ;
		if (gfn_isEmpty(outordrYmdFrom)){
			gfn_comAlert("W0002", "발주일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		if (gfn_isEmpty(outordrYmdTo)){
			gfn_comAlert("W0002", "발주일자");		//	W0002	{0}을/를 입력하세요.
            return;
		}
		let OrdrVO = {apcCd 				: apcCd
//				    , apcSeCd 				: apcSeCd
			        , rcptYn 				: rcptYn
					, outordrYmdFrom 		: outordrYmdFrom
					, outordrYmdTo 			: outordrYmdTo
					, outordrType 			: outordrType
					, itemCd 				: itemCd
					, vrtyCd 				: vrtyCd
					, apcCnptNm 			: cnptNm
					, wrhsYmd 				: dudtYmd
					, spmtPckgUnitNm 		: spmtPckgUnitNm
					, pagingYn 				: 'Y'
					, currentPageNo 		: currentPageNo
					, recordCountPerPage 	: recordCountPerPage};
    	let postJsonPromise = gfn_postJSON("/am/ordr/selectOrdrList.do", OrdrVO);
        let data = await postJsonPromise;
        newJsonOutordrInfo = [];
        try{
        	data.resultList.forEach((item, index) => {
				let ordr = {
					  checked 				: "false"
					, rcptCfmtnYmd 			: item.rcptCfmtnYmd
					, outordrTypeNm 		: item.outordrTypeNm
					, outordrType 			: item.outordrType
					, rcptYn 				: null
					, outordrno 			: item.outordrno
					, apcCnptNm	 			: item.apcCnptNm
					, wrhsYmd 				: item.wrhsYmd
					, outordrYmd 			: item.outordrYmd
					, outordrPrsn 			: item.outordrPrsn
					, splyPrsn 				: item.splyPrsn
					, spmtPckgUnitNm 		: item.spmtPckgUnitNm
					, spmtPckgUnitCd		: item.spmtPckgUnitCd
					, dldtn 				: item.dldtn
					, itemNm 				: item.itemNm
					, vrtyNm 				: item.vrtyNm
					, spcfctNm 				: item.spcfctNm
					, bxGdsQntt 			: item.bxGdsQntt
					, outordrQntt			: item.outordrQntt
					, pieceQntt				: item.pieceQntt
					, unitCd				: item.unitCd
					, bxUntprc				: item.bxUntprc
					, outordrUntprc			: item.outordrUntprc
					, outordrUnitCd			: item.outordrUnitCd
					, lot					: item.lot
					, txAmt					: item.txAmt
					, outordrAmt			: item.outordrAmt
					, wrhsType				: item.wrhsType
					, docno					: item.docno
					, dockInfo				: item.dockInfo
					, cntrSe				: item.cntrSe
					, buyerNm				: item.buyerNm
					, cntrRcvdWrhsYmd		: item.cntrRcvdWrhsYmd
					, cntrNm				: item.cntrNm
					, dlvgdsSeCd			: item.dlvgdsSeCd
					, etc					: item.etc
					, rcptCfmtnApcNm		: item.rcptCfmtnApcNm
					, spmtCmndno			: item.spmtCmndno
					, spmtYmd				: item.spmtYmd
					, invntrQntt			: item.invntrQntt
					, invntrWght			: item.invntrWght
					, spmtQntt				: item.spmtQntt
					, spmtWght				: item.spmtWght
					, cmndQntt				: item.cmndQntt
					, cmndWght				: item.cmndWght
					, gdsGrd 				: item.gdsGrd
					, wght	 				: item.wght
					, apcCd 				: item.apcCd
					, apcSeCd 				: item.apcSeCd
					, apcCnptCd 			: item.apcCnptCd
					, itemCd 				: item.itemCd
					, vrtyCd 				: item.vrtyCd
					, spcfctCd 				: item.spcfctCd
					, delYn					: item.delYn
				}
				if(!gfn_isEmpty(ordr.rcptCfmtnYmd)){
					ordr.rcptYn = 'Y';
				} else {
					ordr.rcptYn = 'N';
				}
				jsonOutordrInfo.push(Object.assign({}, ordr));
				newJsonOutordrInfo.push(Object.assign({}, ordr));
			});
        	if(jsonOutordrInfo.length > 0){
				if(grdOutordrInfo.getPageTotalCount() != data.resultList[0].totalRecordCount){	// TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
					grdOutordrInfo.setPageTotalCount(data.resultList[0].totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
					grdOutordrInfo.rebuild();
				}else{
					grdOutordrInfo.refresh();
				}
			}else{
				grdOutordrInfo.setPageTotalCount(0);
				grdOutordrInfo.rebuild();
			}
        	// 체크박스 유무
        	for ( let i=1; i<=grdOutordrInfo.getGridDataAll().length; i++ ){
    			const rowData = grdOutordrInfo.getRowData(i);
    			if (rowData.outordrQntt == rowData.cmndQntt){
    				grdOutordrInfo.setCellDisabled(i, 0, i, 0, true);
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

	// 페이징
    async function fn_pagingOutordrInfoList(){
    	let recordCountPerPage = grdOutordrInfo.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    	let currentPageNo = grdOutordrInfo.getSelectPageIndex();
    	let ref = "<input type='checkbox' onchange='fn_checkAll(grdOutordrInfo, this);'>";
    	grdOutordrInfo.setCellData(0, grdOutordrInfo.getColRef("checked"), ref, true, false);
    	fn_callSelectOutordrInfoList(recordCountPerPage, currentPageNo);
    }

	// 일괄 접수
    async function btn_receiptBndl(){
    	let allData = grdOutordrInfo.getGridDataAll();
    	let haveSpmtCmndList = [];
		const rcptOrdrAllList = [];

		for ( let i=1; i<=allData.length; i++ ){
			const rowData = grdOutordrInfo.getRowData(i);
			const rowSts = grdOutordrInfo.getRowStatus(i);
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
			alert(haveSpmtCmndList.join(", ") + "은 출하지시가 등록된 데이터입니다.\n\n접수를 취소하시려면 출하지시를 삭제하십시오.");
            return;
		}

		if (rcptOrdrAllList.length == 0) {
			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
            return;
		}
		if (!gfn_comConfirm("Q0001", "접수")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

    	const postJsonPromise = gfn_postJSON("/am/ordr/multiOrdrList.do", rcptOrdrAllList, this.prgrmId);	// 프로그램id 추가
		const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_callSelectOutordrInfoList();
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
		const crtrYmdFrom = SBUxMethod.get("dtp-crtrYmd");
		const crtrYmdTo = SBUxMethod.get("dtp-crtrYmd");

		if (gfn_isEmpty(lgszMrktCd)) {
			gfn_comAlert("W0001", "대형마트");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if (gfn_isEmpty(crtrYmdFrom)) {
			gfn_comAlert("W0001", "수신기준시작일자");		//	W0001	{0}을/를 선택하세요.
			return;
		}
		if (gfn_isEmpty(crtrYmdTo)) {
			gfn_comAlert("W0001", "수신기준종료일자");		//	W0001	{0}을/를 선택하세요.
			return;
		}

		if (!gfn_comConfirm("Q0001", "발주정보수신")) {	//	Q0001	{0} 하시겠습니까?
    		return;
    	}

		const rcptOutordr = {
				apcCd: gv_selectedApcCd,
				lgszMrktCd: lgszMrktCd,
				crtrYmdFrom: crtrYmdFrom,
				crtrYmdTo: crtrYmdTo
			}

		const postJsonPromise = gfn_postJSON(
										"/am/ordr/insertOutordrRcpt.do",
										rcptOutordr
									);	// 프로그램id 추가
		const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_callSelectOutordrInfoList();
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

    const fn_grdCmndQnttValueChanged = async function(){

    	let nRow = grdOutordrInfo.getRow();
		let nCol = grdOutordrInfo.getCol();
		let inptCmndQnttCol = grdOutordrInfo.getColRef("inptCmndQntt");
		switch (nCol) {
		case inptCmndQnttCol:	// checkbox
			fn_checkInptQntt();
			break;
		default:
			return;
		}
    }

    const fn_checkInptQntt = async function(){

    	let nRow = grdOutordrInfo.getRow();
		let nCol = grdOutordrInfo.getCol();

		let invntrQntt 		= grdOutordrInfo.getRowData(nRow).invntrQntt;
		let spmtQntt 		= grdOutordrInfo.getRowData(nRow).spmtQntt;
		let outordrQntt 	= grdOutordrInfo.getRowData(nRow).outordrQntt;
		let cmndQntt 		= grdOutordrInfo.getRowData(nRow).cmndQntt;
		let inptCmndQntt 	= grdOutordrInfo.getRowData(nRow).inptCmndQntt;
		let psbltyCmndQntt 	= outordrQntt - cmndQntt;
		let wght 			= grdOutordrInfo.getRowData(nRow).wght;
		let inptCmndQnttCol = grdOutordrInfo.getColRef("inptCmndQntt");
		let inptCmndWghtCol = grdOutordrInfo.getColRef("inptCmndWght");
		let checkedCol 		= grdOutordrInfo.getColRef("checked");

		// 지시가능한수량 > 입력한지시수량
		if(inptCmndQntt > psbltyCmndQntt){
			gfn_comAlert("W0008", "지시가능수량", "지시수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdOutordrInfo.setCellData(nRow, inptCmndQnttCol , "");
			grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, "");
			grdOutordrInfo.setCellData(nRow, checkedCol, "false");
            return;
		}
		if(invntrQntt >= inptCmndQntt){
			grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, inptCmndQntt*wght);
			grdOutordrInfo.setCellData(nRow, checkedCol, "true");
		}else{
			gfn_comAlert("W0008", "재고수량", "지시수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
			grdOutordrInfo.setCellData(nRow, inptCmndQnttCol, "");
			grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, "");
			grdOutordrInfo.setCellData(nRow, checkedCol, "false");
			return;
		}
		if(inptCmndQntt == 0){
			grdOutordrInfo.setCellData(nRow, inptCmndQnttCol, "");
			grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, "");
			grdOutordrInfo.setCellData(nRow, checkedCol, "false");
		}
    }

    const fn_setValue = function(){
    	let nRow = grdOutordrInfo.getRow();
    	let nCol = grdOutordrInfo.getCol();
    	if(nCol == grdOutordrInfo.getColRef("checked")){
    		// 발주수량 - 출하수량 - 출하지시수량 = 가능한 지시수량
	    	let invntrQntt 		= grdOutordrInfo.getRowData(nRow).invntrQntt;
			let spmtQntt 		= grdOutordrInfo.getRowData(nRow).spmtQntt;
			let outordrQntt 	= grdOutordrInfo.getRowData(nRow).outordrQntt;
			let cmndQntt 		= grdOutordrInfo.getRowData(nRow).cmndQntt;
			let psbltyCmndQntt 	= outordrQntt - cmndQntt;
			let wght 			= grdOutordrInfo.getRowData(nRow).wght;
			let inptCmndQnttCol = grdOutordrInfo.getColRef("inptCmndQntt");
			let inptCmndWghtCol = grdOutordrInfo.getColRef("inptCmndWght");
			let checkedCol 		= grdOutordrInfo.getColRef("checked");

			if(psbltyCmndQntt > 0 && invntrQntt > 0){
				if(psbltyCmndQntt > invntrQntt) {
					grdOutordrInfo.setCellData(nRow, inptCmndQnttCol, invntrQntt);
					grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, invntrQntt*wght);
				} else {
					grdOutordrInfo.setCellData(nRow, inptCmndQnttCol, psbltyCmndQntt);
					grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, psbltyCmndQntt*wght);
				}
			}
    	}
    }

    const fn_delValue = async function(){
    	var nRow = grdOutordrInfo.getRow();
    	let inptCmndQnttCol = grdOutordrInfo.getColRef("inptCmndQntt");
		let inptCmndWghtCol = grdOutordrInfo.getColRef("inptCmndWght");
    	grdOutordrInfo.setCellData(nRow, inptCmndQnttCol, "");
    	grdOutordrInfo.setCellData(nRow, inptCmndWghtCol, "");
    }

	// 출하지시 등록
    async function fn_regSpmtCmnd(){
    	let allData = grdOutordrInfo.getGridDataAll();
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
			const rowData = grdOutordrInfo.getRowData(i);
			const rowSts = grdOutordrInfo.getRowStatus(i);
			if (rowData.checked == "true"){
				if (gfn_isEmpty(rowData.inptCmndQntt)){
					break;
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

    	const postJsonPromise = gfn_postJSON("/am/ordr/regSpmtCmndList.do", regSpmtCmndList, this.prgrmId);	// 프로그램id 추가
		const data = await postJsonPromise;

		try {
        	if (_.isEqual("S", data.resultStatus)) {
        		gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        		fn_callSelectOutordrInfoList();
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