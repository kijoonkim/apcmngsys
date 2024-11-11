<%
    /**
     * @Class Name 		: tra1010.jsp
     * @Description 	: 채권반제 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.15
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.11   	신정철		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 채권반제</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
        </div>
        <div class="box-body">
        
        	<!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <table class="table table-bordered tbl_fixed">
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
                	<th scope="row" class="th_bg">기간</th>
					<td colspan="3" class="td_input" style="border-right:hidden;">
						<sbux-datepicker
							uitype="range" 
							id="srch-dtp-txnDate" 
							name="srch-dtp-txnDate"
							date-format="yyyy-mm-dd" 
							class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
							wrap-class="displayFlex" 
							wrap-style="border:0;padding:0;"
							group-id="panHeader"
                            required
						/>						
					</td>
					<th scope="row" class="th_bg">사업단위</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                    	  <div class="dropdown">
							<button 
								style="width:100%;text-align:left" 
								class="btn btn-sm btn-light dropdown-toggle" 
								type="button" 
								id="srch-fiOrgCode" 
								data-toggle="dropdown" 
								aria-haspopup="true" 
								aria-expanded="false"
							>
								<font>선택</font>
								<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
							</button>
							<div 
								class="dropdown-menu" 
								aria-labelledby="srch-fiOrgCode" 
								style="width:300px;height:150px;padding-top:0px;overflow:auto"
							></div>
						</div>  
					</td>
                    <td></td>
					<th scope="row" class="th_bg">수금방법</th>		<!-- 지급방식 -->
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                        <sbux-select
                        	unselected-text="전체"
                            uitype="single"
                            id="srch-slt-payMethod"
                            name="srch-slt-payMethod"
                            class="form-control input-sm"
                            jsondata-ref="jsonPayMethod"
						/>
                    </td>
                    <td></td>
                </tr>
                <tr><!-- 고객사, 원가중심점, 처리자 -->
                	<th scope="row" class="th_bg">고객사</th>
                	<td class="td_input" style="border-right: hidden;">
                		<sbux-input 
                			id="srch-inp-payerCode"
                			name="srch-inp-payerCode"
                			class="form-control input-sm" 
                			uitype="text"
                			readonly
                		></sbux-input>
                	</td>
                	<td class="td_input" style="border-right: hidden;">
                		<sbux-input
                			id="srch-inp-payerName"
                			name="srch-inp-payerName"
                			class="form-control input-sm" 
                			uitype="text"
                			style="width:100%"
                		></sbux-input>
                	</td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                        	class="btn btn-xs btn-outline-dark"
                            text="찾기"
                            uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopupPayerName"
                        ></sbux-button>
                    </td>
                    
                    <th scope="row" class="th_bg">원가중심점</th>
                    <td class="td_input" style="border-right: hidden;">
 						<sbux-input 
 							uitype="text" 
 							id="srch-inp-costCenterCode"
 							name="srch-inp-costCenterCode"
 							class="form-control input-sm" 
 						></sbux-input>
					</td>
					<td class="td_input" style="border-right: hidden;">
						<sbux-input 
							uitype="text" 
							id="srch-inp-costCenterName" 
							name="srch-inp-costCenterName"
							class="form-control input-sm" 
						></sbux-input>
					</td>
                    <td class="td_input">
						<sbux-button 
							class="btn btn-xs btn-outline-dark" 
							text="찾기" 
							uitype="modal" 
							target-id="modal-compopup1" 
							onclick="fn_compopupCostCenter"
						></sbux-button>
                    </td>
                    
                    <th scope="row" class="th_bg">처리자</th>
                    <td class="td_input" style="border-right: hidden;">
						<sbux-input 
							uitype="text" 
							id="srch-inp-empCode"
							name="srch-inp-empCode"  
							class="form-control input-sm"
							readonly 
						></sbux-input>
					</td>
					<td class="td_input" style="border-right: hidden;">
						<sbux-input 
							uitype="text" 
							id="srch-inp-empName"
							name="srch-inp-empName"  
							class="form-control input-sm"
							oninput="fn_onInputSrchEmpName(event)"
						></sbux-input>
					</td>
	   				<td class="td_input">
						<sbux-button 
							class="btn btn-xs btn-outline-dark" 
							text="찾기" 
							uitype="modal" 
							target-id="modal-compopup1" 
							onclick="fn_compopupUser"
						></sbux-button>
                    </td>
                </tr>
                <tr>
                	<th scope="row" class="th_bg">입금통화</th>
					<td class="td_input" style="border-right: hidden;" colspan="3">
						<div class="dropdown">
							<button 
								style="width:250px;text-align:left" 
								class="btn btn-sm btn-light dropdown-toggle" 
								type="button"
								id="srch-currencyCode" 
								data-toggle="dropdown" 
								aria-haspopup="true" 
								aria-expanded="false">
								<font>선택</font>
								<i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
							</button>
							<div
								class="dropdown-menu"
								aria-labelledby="srch-currencyCode" 
								style="width:250px;height:250px;padding-top:0px;overflow:auto"
							></div>
						</div>   	
					</td>
                	<th scope="row" class="th_bg">입금자</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                    	<sbux-input 
                    		id="srch-inp-description" 
                    		name="srch-inp-description" 
                    		class="form-control input-sm" 
                    		uitype="text" 
                    		style="width:100%"
                    	></sbux-input>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">반제여부</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
						<sbux-select
                        	unselected-text="전체"
                            uitype="single"
                            id="srch-slt-confirmFlag"
                            name="srch-slt-confirmFlag"
                            class="form-control input-sm"
                            jsondata-ref="jsonUseYn"
						/>
                    </td>
                    <td></td>
                </tr>
                <tr>
                	<th scope="row" class="th_bg">반제대상</th>
                	<td colspan="6" class="td_input" style="border-right: hidden;">
                		<sbux-radio
                			id="srch-rdo-retraAccount"
                			name="srch-rdo-retraAccount"
                			uitype="normal"
                			text-right-padding="10px"
                			jsondata-ref="jsonRetraAccount"
                			onchange="onChangeRetraAccount()"
                		></sbux-radio>
                	</td>
                	<td colspan="5">
                	</td>
                </tr>
                </tbody>
            </table>
            
            <!--[pp] //검색 -->
			<!--[pp] 검색결과 -->
			<div class="ad_tbl_top">
				<ul class="ad_tbl_count">
					<li>
						<span>수금 거래내역</span>
					</li>
				</ul>
				<div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
                    <sbux-button
                    	id="svg-btn-batchRetraReg" 
                    	name="svg-btn-batchRetraReg" 
                    	uitype="normal" 
                    	text="일괄반제수행" 
                    	class="btn btn-sm btn-outline-danger" 
                    	onclick="fn_batchRetraReg" 
                    	style="margin-right:5px"
                    ></sbux-button>
                    <sbux-button
                		id="svg-btn-batchRetraCncl"
                		name="svg-btn-batchRetraCncl" 
                		uitype="normal" 
                		text="일괄반제취소" 
                		class="btn btn-sm btn-outline-danger" 
                		onclick="fn_batchRetraCncl" 
                		style="margin-right:20px"
                	></sbux-button>
                	<label style="margin-right:5px;padding-top:5px" >분할금액</label>                              
					<sbux-input 
						uitype="text" 
						id="svg-inp-divAmount"
						name="svg-inp-divAmount"
						class="form-control input-sm" 			
						style="width:120px;
						margin-right:5px"
						maxlength="20"
						autocomplete="off"
						mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
					></sbux-input>
					<sbux-button
                		id="svg-btn-prttnReg"
                		name="svg-btn-prttnReg" 
                		uitype="normal" 
                		text="분할" 
                		class="btn btn-sm btn-outline-danger" 
                		onclick="fn_prttnReg" 
                		style="margin-right:5px"
                	></sbux-button>
                	<sbux-button
                		id="svg-btn-prttnCncl"
                		name="svg-btn-prttnCncl" 
                		uitype="normal" 
                		text="분할취소" 
                		class="btn btn-sm btn-outline-danger" 
                		onclick="fn_prttnCncl"
                	></sbux-button>
				</div>
			</div>
			<div class="table-responsive tbl_scroll_sm">
				<div id="sb-area-grdSvg" style="height:208px;"></div>
			</div>

			<br/>
			<!-- 
				ACNTG	회계
				FUND	자금
				RETRA	반제
				CLCTM	수금
				DLNG	거래
			 -->
			<sbux-tabs
				id="tab-svg"
				name="tab-svg"
				uitype="webacc"
				is-scrollable="false"
				wrap-style="height:100%"
				jsondata-ref="jsonMasterTabData"
				onclick="fn_tabClick"
			></sbux-tabs>
			<div class="tab-content">
				<div id="tp-retra" class="tab-page">
          			<div class="ad_tbl_top">
           				<ul class="ad_tbl_count">
		        			<li>
		        				<span>반제실적</span>
		        			</li>
           				</ul>
           				<div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
		                    <label style="margin-right:5px;padding-top:5px" >선택합계금액</label>                              
							<sbux-input 
								uitype="text" 
								id="retra-inp-sltTotOrgnlAmt"
								name="retra-inp-sltTotOrgnlAmt"
								class="form-control input-sm" 			
								style="width:120px;margin-right:40px"
								maxlength="20"
								autocomplete="off"
								mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								readonly
							></sbux-input>
							<sbux-input 
								uitype="text" 
								id="retra-inp-sltTotFnctnlAmt"
								name="retra-inp-sltTotFnctnlAmt"
								class="form-control input-sm" 			
								style="width:120px;margin-right:40px"
								maxlength="20"
								autocomplete="off"
								mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
								readonly
							></sbux-input>
							
		                    <label style="margin-right:20px;padding-top:5px" >확정합계금액</label>
		                    <label style="margin-right:5px;padding-top:5px" >입금액(통화)</label>
		                    <sbux-input 
								uitype="text" 
								id="retra-inp-cfmntTotOrgnlAmt"
								name="retra-inp-cfmntTotOrgnlAmt"
								class="form-control input-sm" 			
								style="width:120px;margin-right:5px"
								maxlength="20"
								autocomplete="off"
								mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
							></sbux-input>
							<label style="margin-right:5px;padding-top:5px" >수금전표금액</label>
		                    <sbux-input 
								uitype="text" 
								id="retra-inp-cfmntTotFnctnlAmt"
								name="retra-inp-cfmntTotFnctnlAmt"
								class="form-control input-sm" 			
								style="width:120px;margin-right:30px"
								maxlength="20"
								autocomplete="off"
								mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
							></sbux-input>
							
		                    <sbux-button
		                    	id="svg-btn-svgRetraReg" 
		                    	name="svg-btn-svgRetraReg" 
		                    	uitype="normal" 
		                    	text="입금반제수행" 
		                    	class="btn btn-sm btn-outline-danger" 
		                    	onclick="fn_svgRetraReg" 
		                    	style="margin-right:5px"
		                    ></sbux-button>
		                    <sbux-button
		                    	id="svg-btn-svgRetraCncl" 
		                    	name="svg-btn-svgRetraCncl" 
		                    	uitype="normal" 
		                    	text="입금반제취소" 
		                    	class="btn btn-sm btn-outline-danger" 
		                    	onclick="fn_svgRetraCncl" 
		                    	style="margin-right:2px"
		                    ></sbux-button>
						</div>
        			</div>
         			<div id="sb-area-grdRetra" style="height:300px"></div>
       			</div>
				<div id="tp-fund" class="tab-page">
          			<div class="ad_tbl_top">
           				<ul class="ad_tbl_count">
		        			<li>
		        				<span>자금실적</span>
		        			</li>
           				</ul>
        			</div>
         			<div id="sb-area-grdFund" style="height:300px"></div>
       			</div>
       			<div id="tp-acntg" class="tab-page">
          			<div class="ad_tbl_top">
           				<ul class="ad_tbl_count">
		        			<li>
		        				<span>회계처리</span>
		        			</li>
           				</ul>
        			</div>
         			<div id="sb-area-grdAcntg" style="height:300px"></div>
       			</div>
       			
       		</div>
            
        </div>
    </div>
</section>


<div>
    <sbux-modal
    	style="width:600px" 
    	id="modal-compopup1" 
    	name="modal-compopup1" 
    	uitype="middle" 
    	header-title="" 
    	body-html-id="body-modal-compopup1" 
    	header-is-close-button="true" 
    	footer-is-close-button="false" 
    ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>

</body>
<script>



	// common ---------------------------------------------------
	var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId = '${comMenuVO.menuId}';
	var p_empCd = '${loginVO.maEmpCode}';
	var p_fiOrgCode = "${loginVO.maFIOrgCode}";
	var p_defaultAcctRule = "${loginVO.maDefaultAcctRule}";
	//-----------------------------------------------------------
	
	// Tab Data
	var jsonMasterTabData = [
		{ "id" : "0", "pid" : "-1", "order" : "1", "text" : "반제실적", "targetid" : "tp-retra", "targetvalue" : "반제실적" },
		{ "id" : "1", "pid" : "-1", "order" : "2", "text" : "자금실적", "targetid" : "tp-fund", "targetvalue" : "자금실적" },
	    { "id" : "2", "pid" : "-1", "order" : "3", "text" : "회계처리", "targetid" : "tp-acntg", "targetvalue" : "회계처리" },
	];

	let lv_prvTabId;
	lv_prvTabId = "tp-retra";

	//초기화
	function cfn_init() {
	    
	}
	
	// 신규
	function cfn_add() {
	    fn_create();
	}
	
	// 저장
	function cfn_save() {
	    fn_save();
	}
	
	// 삭제
	function cfn_del() {
		fn_delete();
	}
	
	// 조회
	function cfn_search() {
	    fn_search();
	}


	// 공통요소
	var jsonFiOrgCode = [];			// 사업단위
	var jsonCurrencyCode = [];		// 통화
	var jsonPayMethod = []; 		// 수금방법
	var jsonReceiptType = [];		// 수금유형
	var jsonBankCsCode = [];		// 금융기관코드
	var jsonBankCode = [];			// 은행코드
	var jsonTxnGroupCode = [];		// 거래유형
	var jsonDocType = [];			// 전표유형
	var jsonDocStatus = []; 		// 전표상태
	var jsonExchangeType = []; 		// 환율유형
	var jsonStatusCode = []; 		// 상태코드
	var jsonLineType = []; 			// LINE
    var jsonAccountCode = []; 		// 계정코드
    var jsonDebitCredit = []; 		// 차/대
    var jsonCostCenterCode = []; 	// 원가중심코드
    var jsonAccItemCode = []; 		// 관리항목코드
    var jsonVoucherType = [];		// 증빙유형
	var jsonRegType = [];			// 등록유형
	var jsonVatType = [];			// 부가세유형
	var jsonUseYn = [];
	
	var jsonRetraAccount = [
		{text: "외상매출금", value: "111061%", style : "color:red;" },
		{text: "미지급금", value: "2120111%", style : "color:blue;" },
	];
	
	// 수금거래내역
	var grdSvg;
	var jsonSvg = [];
		
	// tab
	// 반제처리
	var grdRetra;
	var jsonRetra = [];
	// 자금실적
	var grdFund;
	var jsonFund = [];
	
	// 회계처리
	var grdAcntg;
	var jsonAcntg = [];
	
    window.addEventListener("DOMContentLoaded",function(){
		fn_init();
    });
    
    /**
     * @name fn_init
     * @description 화면 초기 호출
     * @function
     */
    const fn_init = async function() {
    	
    	let nowDate = new Date();
		let firstYmd = gfn_dateFirstYmd(nowDate);
		let lastYmd = gfn_dateToYmd(nowDate);
		
		console.log("firstYmd", firstYmd);
		console.log("lastYmd", lastYmd);
		
		SBUxMethod.set("srch-dtp-txnDate", firstYmd+","+lastYmd);
		
		await fn_initSBSelect();
		
		// 그리드 생성
    	fn_createGridSvg();
    	fn_createGridFund();
    	fn_createGridAcntg();
    	fn_createGridRetra();
    	
    	SBUxMethod.set("srch-rdo-retraAccount", "111061%");
    }
    
    
	/**
     * @name fn_initSBSelect
     * @description 화면 초기 호출
     * @function
     */
	const fn_initSBSelect = async function() {
  		
		// 코드정보 설정
		let result = await Promise.all([
				gfnma_setComSelect(['srch-slt-confirmFlag'], jsonUseYn, 'L_COM014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
				gfnma_setComSelect(['grdSvg'], jsonFiOrgCode, 'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
				gfnma_multiSelectInit({
	                target			: ['#srch-fiOrgCode']
	                ,compCode		: gv_ma_selectedApcCd
	                ,clientCode		: gv_ma_selectedClntCd
	                ,bizcompId		: 'L_FIM022'
	                ,whereClause	: ''
	                ,formId			: p_formId
	                ,menuId			: p_menuId
	                ,selectValue	: ''
	                ,dropType		: 'down' 	// up, down
	                ,dropAlign		: 'right' 	// left, right
	                ,colValue		: 'FI_ORG_CODE'
	                ,colLabel		: 'FI_ORG_NAME'
	                ,columns		:[
	                    {caption: "코드",		ref: 'FI_ORG_CODE', 	width:'150px',  	style:'text-align:left'},
	                    {caption: "명", 		ref: 'FI_ORG_NAME',    	width:'150px',  	style:'text-align:left'}
	                ]
	            }),
	            
				// 통화
				gfnma_setComSelect(['grdSvg'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
				//통화
				gfnma_multiSelectInit({
					target			: ['#srch-currencyCode']
					,compCode		: gv_ma_selectedApcCd
					,clientCode		: gv_ma_selectedClntCd
					,bizcompId		: 'L_COM001'
					,whereClause	: ''
					,formId			: p_formId
					,menuId			: p_menuId
					,selectValue	: 'KRW'
					,dropType		: 'down' 	// up, down
					,dropAlign		: 'left' 	// left, right
					,colValue		: 'CURRENCY_CODE'
					,colLabel		: 'CURRENCY_NAME'
					,columns		:[
			            {caption: "통화코드",	ref: 'CURRENCY_CODE', 		width:'100px',  	style:'text-align:left'},
			            {caption: "통화명",	ref: 'CURRENCY_NAME',    	width:'150px',  	style:'text-align:left'}
					]
				}),
				// 수금방법
				gfnma_setComSelect(['srch-slt-payMethod'], jsonPayMethod, 'P_FIM073', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
				// 등록구분
				//gfnma_setComSelect(['srch-slt-svgMethod'], jsonSvgMethod, 'L_FIF015', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
				gfnma_setComSelect(['srch-slt-regType'], jsonRegType, 'L_FBS017', "AND COMP_CODE = '" + gv_ma_selectedApcCd + "'", gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
				// 수금유형
	            gfnma_setComSelect(['grdSvg'], jsonReceiptType, 'L_FBS029', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	            
				// 은행
				
				//gfnma_setComSelect(['grdSvg'], jsonBankCode, 'P_COM003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
				// 금융기관코드
				gfnma_setComSelect(['grdFund'], jsonBankCsCode, 'L_CS_BANK', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CS_CODE', 'BANK_CS_NAME', 'Y', ''),
				// 거래유형
	            gfnma_setComSelect(['grdFund'], jsonTxnGroupCode, 'L_FIM071', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// 전표유형
	            gfnma_setComSelect(['grdFund'], jsonDocType, 'L_FIM051', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// 전표상태
	            gfnma_setComSelect(['grdFund'], jsonDocStatus, 'L_FIG002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// 환산유형
	            gfnma_setComSelect(['grdFund'], jsonExchangeType, 'L_COM034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// 상태코드
	            gfnma_setComSelect(['grdFund'], jsonStatusCode, 'L_FIM074', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// LINE
	            gfnma_setComSelect(['grdAcntg'], jsonLineType, 'L_FIM052', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// 차/대
	            gfnma_setComSelect(['grdAcntg'], jsonDebitCredit, 'L_FIG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// 원가중심점코드
	            gfnma_setComSelect(['grdAcntg'], jsonCostCenterCode, 'L_CC_INPUT', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),
	         	// 증빙유형
	            gfnma_setComSelect(['grdAcntg'], jsonVoucherType, 'L_FIG005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	            // 부가세유형
	            gfnma_setComSelect(['grdAcntg'], jsonVatType, 'L_FIT020', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'VAT_TYPE_CODE', 'VAT_TYPE_NAME', 'Y', ''),
	         	
			]);	
		
		console.log("jsonVatType", jsonVatType);
	}
    
	const fn_grdSvgRowChanged = async function() {
		
		const nRow = grdSvg.getRow();
    	
    	if (nRow < 1) {
    		return;
    	}
    	
    	const _svg = grdSvg.getRowData(nRow);
    	
		const selectedTab = SBUxMethod.get('tab-svg');
		
		switch (selectedTab) {
			case "tp-retra":
				await fn_setGrdRetra(_svg);
				break;
			case "tp-fund":
				await fn_setGrdFund(_svg);
				break;
			case "tp-acntg":
				await fn_setGrdAcntg(_svg);
				break;
			default:
				break;
		}
		
	}
	
	const fn_tabClick = function() {
		
		const selectedTab = SBUxMethod.get('tab-svg');
		
		if (!_.isEqual(lv_prvTabId, selectedTab)) {
			lv_prvTabId = selectedTab;
			fn_grdSvgRowChanged();
		}		
	}
	
	
	const fn_setRetraSumSelected = function() {
		
		let orgnAmt = 0;
		let fnctAmt = 0;
		
		const allData = grdRetra.getGridDataAll();
		allData.forEach((item) => {
			if (_.isEqual("Y", item.CHECK_YN)) {
				orgnAmt += parseInt(item.ORIGINAL_APPLY_AMOUNT) || 0;
				fnctAmt += parseInt(item.FUNCTIONAL_APPLY_R_AMOUNT) || 0;
			}
		});
		
		SBUxMethod.set('retra-inp-sltTotOrgnlAmt', orgnAmt);
		SBUxMethod.set('retra-inp-sltTotFnctnlAmt', fnctAmt);
	}
	
	const fn_setRetraSumConfirmed = function() {
		
		let orgnAmt = 0;
		let fnctAmt = 0;
		
		const allData = grdRetra.getGridDataAll();
		allData.forEach((item) => {
			if (_.isEqual("Y", item.CONFIRM_FLAG)) {
				orgnAmt += parseInt(item.ORIGINAL_APPLY_AMOUNT) || 0;
				fnctAmt += parseInt(item.FUNCTIONAL_APPLY_R_AMOUNT) || 0;
			}
		});		
		
		SBUxMethod.set('retra-inp-cfmntTotOrgnlAmt', orgnAmt);
		SBUxMethod.set('retra-inp-cfmntTotFnctnlAmt', fnctAmt);
	}
	
	
	/**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
		
        if (!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }
        
        const txnDateFrom = SBUxMethod.get('srch-dtp-txnDate_from');
        const txnDateTo = SBUxMethod.get('srch-dtp-txnDate_to');
        const fiOrgCode = gfn_nvl(gfnma_multiSelectGet("#srch-fiOrgCode"));
        const payMethod = gfn_nvl(SBUxMethod.get('srch-slt-payMethod'));
        const currencyCode = gfn_nvl(gfnma_multiSelectGet("#srch-currencyCode"));
        
        const payerName = gfn_nvl(SBUxMethod.get('srch-inp-payerName'));
        const payerCode = gfn_nvl(SBUxMethod.get('srch-inp-payerCode'));        
        const costCenterCode = gfn_nvl(SBUxMethod.get('srch-inp-costCenterCode'));
        const costCenterName = gfn_nvl(SBUxMethod.get('srch-inp-costCenterName'));
        const empCode = gfn_nvl(SBUxMethod.get('srch-inp-empCode'));
        const empName = gfn_nvl(SBUxMethod.get('srch-inp-empName'));
        const description = gfn_nvl(SBUxMethod.get('srch-inp-description'));
        const confirmFlag = gfn_nvl(SBUxMethod.get('srch-slt-confirmFlag'));
        const applyAccount = gfn_nvl(SBUxMethod.get('srch-rdo-retraAccount'));
        
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                V_P_FI_ORG_CODE 	: fiOrgCode,
                V_P_DATE_FR			: txnDateFrom,
                V_P_DATE_TO			: txnDateTo,
                V_P_CONFIRM_FLAG	: confirmFlag,
                V_P_DESCRIPTION		: description,
                V_P_APPLY_ACCOUNT	: applyAccount,
                V_P_CURRENCY_CODE	: currencyCode,
                V_P_CUSTOMER_CS_CODE: '',
                V_P_IN_PAY_METHOD	: payMethod,
                V_P_APPLY_TYPE		: '',
                V_P_RECEIPT_NO		: '',
                V_P_RECEIPT_DATE	: '',
                V_P_ITEM_SOURCE_ID	: '',
                V_P_ORIGINAL_RECEIPT_AMOUNT		: '',
                V_P_FUNCTIONAL_RECEIPT_AMOUNT	: '',
                V_P_TXN_ID			: '',
                V_P_DEPT_CODE		: '',
                V_P_COST_CENTER_CODE: costCenterCode,
                V_P_PROJECT_CODE	: '',
                V_P_EMP_CODE		: empCode,
                
                V_P_FORM_ID			: p_formId,
                V_P_MENU_ID			: p_menuId,
                V_P_PROC_ID			: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };
        	console.log("paramObj", paramObj);
        const postJsonPromiseForList = gfn_postJSON("/fi/ftr/rec/selectTra1010List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
            	
            	console.log("listData.cv_1", listData.cv_1);
            	
            	jsonSvg.length = 0;

                listData.cv_1.forEach((item, index) => {
                    const obj = {
                    		DOC_DATE: item.DOC_DATE,
                    		COMP_CODE: item.COMP_CODE,
                    		FI_ORG_CODE: item.FI_ORG_CODE,
                    		TXN_ID: item.TXN_ID,
                    		TXN_DATE: item.TXN_DATE,
                    		RECEIPT_NO: item.RECEIPT_NO,
                    		PAY_METHOD: item.PAY_METHOD,
                    		APPLY_TYPE: item.APPLY_TYPE,
                    		CUSTOMER_CS_CODE: item.CUSTOMER_CS_CODE,
                    		CUSTOMER_CS_NAME: item.CUSTOMER_CS_NAME,
                    		PAYER_BIZ_REGNO: item.PAYER_BIZ_REGNO,
                    		SOURCE_DOC_ID: item.SOURCE_DOC_ID,
                    		SOURCE_DOC_TYPE: item.SOURCE_DOC_TYPE,
                    		SOURCE_DOC_NAME: item.SOURCE_DOC_NAME,
                    		DOC_STATUS: item.DOC_STATUS,
                    		ITEM_SOURCE_ID: item.ITEM_SOURCE_ID,
                    		ACCOUNT_CODE: item.ACCOUNT_CODE,
                    		ACCOUNT_NAME: item.ACCOUNT_NAME,
                    		BANK_CHARGE_ACC_CODE: item.BANK_CHARGE_ACC_CODE,
                    		BANK_CHARGE_ACC_NAME: item.BANK_CHARGE_ACC_NAME,
                    		CURRENCY_CODE: item.CURRENCY_CODE,
                    		EXCHANGE_TYPE: item.EXCHANGE_TYPE,
                    		EXCHANGE_RATE: item.EXCHANGE_RATE,
                    		ORIGINAL_AMOUNT: item.ORIGINAL_AMOUNT,
                    		FUNCTIONAL_AMOUNT: item.FUNCTIONAL_AMOUNT,
                    		ORIGINAL_BANK_CHARGE: item.ORIGINAL_BANK_CHARGE,
                    		FUNCTIONAL_BANK_CHARGE: item.FUNCTIONAL_BANK_CHARGE,
                    		CONFIRM_FLAG: item.CONFIRM_FLAG,
                    		ACCOUNT_COMPLETE_FLAG: item.ACCOUNT_COMPLETE_FLAG,
                    		CHECK_YN: item.CHECK_YN,
                    		DOC_ID: item.DOC_ID,
                    		DOC_TYPE: item.DOC_TYPE,
                    		DOC_NAME: item.DOC_NAME,
                    		DOC_EMP_CODE: item.DOC_EMP_CODE,
                    		DOC_EMP_NAME: item.DOC_EMP_NAME,
                    		DOC_INSERT_TIME: item.DOC_INSERT_TIME,
                    		DOC_STATUS: item.DOC_STATUS,
                    		DEPT_CODE: item.DEPT_CODE,
                    		DEPT_NAME: item.DEPT_NAME,
                    		COST_CENTER_CODE: item.COST_CENTER_CODE,
                    		COST_CENTER_NAME: item.COST_CENTER_NAME,
                    		PROJECT_CODE: item.PROJECT_CODE,
                    		CREDIT_AREA: item.CREDIT_AREA,
                    		TOTAL_RECEIPT_AMOUNT: item.TOTAL_RECEIPT_AMOUNT,
                    		DESCRIPTION: item.DESCRIPTION,
                    		IN_DEPOSIT_CODE: item.IN_DEPOSIT_CODE,
                    		DEPOSIT_NAME: item.DEPOSIT_NAME,
                    		ACCOUNT_NUM: item.ACCOUNT_NUM,
                    		ORIGINAL_RECEIPT_YN: item.ORIGINAL_RECEIPT_YN,
                    		DIV_YN: item.DIV_YN,
                    		CHILD_CONFIRM_FLAG: item.CHILD_CONFIRM_FLAG,
                    		BASESCALE: item.BASESCALE,
                    		RECEIPT_TYPE: item.RECEIPT_TYPE,
                    }
                    jsonSvg.push(obj);
                });
                
                grdSvg.rebuild();
                
            } else {
                alert(listData.resultMessage);
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
     * @name fn_setGrdRetra
     * @param {string} _txnId
     * @description 반제실적
     */
    const fn_setGrdRetra = async function(_svg) {
    	 
         const txnDateFrom = SBUxMethod.get('srch-dtp-txnDate_from');
         const txnDateTo = SBUxMethod.get('srch-dtp-txnDate_to');
         const fiOrgCode = gfn_nvl(gfnma_multiSelectGet("#srch-fiOrgCode"));
         const payMethod = gfn_nvl(SBUxMethod.get('srch-slt-payMethod'));
         const currencyCode = gfn_nvl(gfnma_multiSelectGet("#srch-currencyCode"));
         
         const payerName = gfn_nvl(SBUxMethod.get('srch-inp-payerName'));
         const payerCode = gfn_nvl(SBUxMethod.get('srch-inp-payerCode'));        
         const costCenterCode = gfn_nvl(SBUxMethod.get('srch-inp-costCenterCode'));
         const costCenterName = gfn_nvl(SBUxMethod.get('srch-inp-costCenterName'));
         const empCode = gfn_nvl(SBUxMethod.get('srch-inp-empCode'));
         const empName = gfn_nvl(SBUxMethod.get('srch-inp-empName'));
         const description = gfn_nvl(SBUxMethod.get('srch-inp-description'));
         const confirmFlag = gfn_nvl(SBUxMethod.get('srch-slt-confirmFlag'));
         const applyAccount = gfn_nvl(SBUxMethod.get('srch-rdo-retraAccount'));
         
         const paramObj = {

                 V_P_DEBUG_MODE_YN	: '',
                 V_P_LANG_ID		: '',
                 V_P_COMP_CODE		: gv_ma_selectedApcCd,
                 V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                 V_P_FI_ORG_CODE 	: _svg.FI_ORG_CODE,
                 V_P_DATE_FR		: txnDateFrom,
                 V_P_DATE_TO		: txnDateTo,
                 V_P_CONFIRM_FLAG	: confirmFlag,
                 V_P_DESCRIPTION	: description,
                 V_P_APPLY_ACCOUNT	: applyAccount,
                 V_P_CURRENCY_CODE	: _svg.CURRENCY_CODE,
                 V_P_CUSTOMER_CS_CODE: _svg.CUSTOMER_CS_CODE,
                 V_P_IN_PAY_METHOD	: '',
                 V_P_APPLY_TYPE		: _svg.APPLY_TYPE,
                 V_P_RECEIPT_NO		: _svg.RECEIPT_NO,
                 V_P_RECEIPT_DATE	: _svg.TXN_DATE,
                 V_P_ITEM_SOURCE_ID	: parseInt(_svg.ITEM_SOURCE_ID) || 0,
                 V_P_ORIGINAL_RECEIPT_AMOUNT	: 
                	 					parseInt(_svg.ORIGINAL_AMOUNT) || 0
                	 					+ 
                	 					parseInt(_svg.ORIGINAL_BANK_CHARGE) || 0,
                 V_P_FUNCTIONAL_RECEIPT_AMOUNT	: 
                	 					parseInt(_svg.FUNCTIONAL_AMOUNT) || 0
	 									+ 
	 									parseInt(_svg.FUNCTIONAL_BANK_CHARGE) || 0,
                 V_P_TXN_ID			: parseInt(_svg.TXN_ID) || 0,
                 V_P_DEPT_CODE		: _svg.DEPT_CODE,
                 V_P_COST_CENTER_CODE: _svg.COST_CENTER_CODE,
                 V_P_PROJECT_CODE	: _svg.PROJECT_CODE,
                 V_P_EMP_CODE		: empCode,
                 
                 V_P_FORM_ID		: p_formId,
                 V_P_MENU_ID		: p_menuId,
                 V_P_PROC_ID		: '',
                 V_P_USERID			: '',
                 V_P_PC				: ''
			};
         
		console.log("paramObj", paramObj);
		
        const postJsonPromiseForList = gfn_postJSON("/fi/ftr/rec/selectTra1010List.do", {
             getType			: 'json',
             workType			: 'APPLY',
             cv_count			: '1',
             params				: gfnma_objectToString(paramObj)
		});

        const listData = await postJsonPromiseForList;

        try {
			if (_.isEqual("S", listData.resultStatus)) {
             	
				console.log("listData.cv_1", listData.cv_1);
             	
             	jsonRetra.length = 0;

				listData.cv_1.forEach((item, index) => {
					const obj = {
						CHECK_YN: item.CHECK_YN,
						APPLY_DATE: item.APPLY_DATE,
						DOC_DATE: item.DOC_DATE,
						APPLY_TYPE: item.APPLY_TYPE,
						INVOICE_ID: item.INVOICE_ID,
						INVOICE_BATCH_NO: item.INVOICE_BATCH_NO,
						INVOICE_LINE_NUM: item.INVOICE_LINE_NUM,
						PAYER_ID: item.PAYER_ID,
						PAYER_NAME: item.PAYER_NAME,
						FI_ORG_CODE: item.FI_ORG_CODE,
						DOC_ID: item.DOC_ID,
						DOC_TYPE: item.DOC_TYPE,
						DOC_NAME: item.DOC_NAME,
						VOUCHER_TYPE: item.VOUCHER_TYPE,
						VOUCHER_NO: item.VOUCHER_NO,
						ITEM_SOURCE_ID_ADVANCE: item.ITEM_SOURCE_ID_ADVANCE,
						ITEM_SOURCE_ID: item.ITEM_SOURCE_ID,
						ACCOUNT_CODE: item.ACCOUNT_CODE,
						ACCOUNT_NAME: item.ACCOUNT_NAME,
						CURRENCY_CODE: item.CURRENCY_CODE,
						EXCHANGE_TYPE: item.EXCHANGE_TYPE,
						EXCHANGE_RATE: item.EXCHANGE_RATE,
						ORIGINAL_APPLY_AMOUNT: item.ORIGINAL_APPLY_AMOUNT,
						FUNCTIONAL_APPLY_AMOUNT: item.FUNCTIONAL_APPLY_AMOUNT,
						ORIGINAL_AMOUNT: item.ORIGINAL_AMOUNT,
						FUNCTIONAL_AMOUNT: item.FUNCTIONAL_AMOUNT,
						FUNCTIONAL_APPLY_R_AMOUNT: item.FUNCTIONAL_APPLY_R_AMOUNT,
						PAY_EXCHANGE_PL_AMT: item.PAY_EXCHANGE_PL_AMT,
						CONFIRM_FLAG: item.CONFIRM_FLAG,
						APPLY_NO: item.APPLY_NO,
						DEPT_CODE: item.DEPT_CODE,
						COST_CENTER_CODE: item.COST_CENTER_CODE,
						PROJECT_CODE: item.PROJECT_CODE,
						DESCRIPTION: item.DESCRIPTION,
					}
					
					jsonRetra.push(obj);
				});
                 
				grdRetra.rebuild();
                 
			} else {
                alert(listData.resultMessage);
            }
		} catch (e) {
            if (!(e instanceof Error)) {
        		e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
		
		fn_setRetraSumSelected();
		fn_setRetraSumConfirmed();
		
	}
     
 	/**
     * @name fn_setGrdFund
     * @description 자금실적 조회 DETAIL
     * @function
     */
	const fn_setGrdFund = async function(_svg) {
		
        const txnDateFrom = SBUxMethod.get('srch-dtp-txnDate_from');
        const txnDateTo = SBUxMethod.get('srch-dtp-txnDate_to');
        const fiOrgCode = gfn_nvl(gfnma_multiSelectGet("#srch-fiOrgCode"));
        const payMethod = gfn_nvl(SBUxMethod.get('srch-slt-payMethod'));
        const currencyCode = gfn_nvl(gfnma_multiSelectGet("#srch-currencyCode"));
        
        const payerName = gfn_nvl(SBUxMethod.get('srch-inp-payerName'));
        const payerCode = gfn_nvl(SBUxMethod.get('srch-inp-payerCode'));        
        const costCenterCode = gfn_nvl(SBUxMethod.get('srch-inp-costCenterCode'));
        const costCenterName = gfn_nvl(SBUxMethod.get('srch-inp-costCenterName'));
        const empCode = gfn_nvl(SBUxMethod.get('srch-inp-empCode'));
        const empName = gfn_nvl(SBUxMethod.get('srch-inp-empName'));
        const description = gfn_nvl(SBUxMethod.get('srch-inp-description'));
        const confirmFlag = gfn_nvl(SBUxMethod.get('srch-slt-confirmFlag'));
        const applyAccount = gfn_nvl(SBUxMethod.get('srch-rdo-retraAccount'));
	     
	    const paramObj = {
	    		
			V_P_DEBUG_MODE_YN	: '',
	        V_P_LANG_ID		: '',
	        V_P_COMP_CODE		: gv_ma_selectedApcCd,
	        V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
	        V_P_FI_ORG_CODE 	: _svg.FI_ORG_CODE,
	        V_P_DATE_FR		: txnDateFrom,
	        V_P_DATE_TO		: txnDateTo,
	        V_P_CONFIRM_FLAG	: confirmFlag,
	        V_P_DESCRIPTION	: description,
	        V_P_APPLY_ACCOUNT	: applyAccount,
	        V_P_CURRENCY_CODE	: _svg.CURRENCY_CODE,
	        V_P_CUSTOMER_CS_CODE: _svg.CUSTOMER_CS_CODE,
	        V_P_IN_PAY_METHOD	: '',
	        V_P_APPLY_TYPE		: _svg.APPLY_TYPE,
	        V_P_RECEIPT_NO		: _svg.RECEIPT_NO,
	        V_P_RECEIPT_DATE	: _svg.TXN_DATE,
	        V_P_ITEM_SOURCE_ID	: parseInt(_svg.ITEM_SOURCE_ID) || 0,
	        V_P_ORIGINAL_RECEIPT_AMOUNT	: 
	        						parseInt(_svg.ORIGINAL_AMOUNT) || 0
	            					+ 
	            					parseInt(_svg.ORIGINAL_BANK_CHARGE) || 0,
	        V_P_FUNCTIONAL_RECEIPT_AMOUNT	: 
	        	 					parseInt(_svg.FUNCTIONAL_AMOUNT) || 0
	 								+ 
	 								parseInt(_svg.FUNCTIONAL_BANK_CHARGE) || 0,
	        V_P_TXN_ID			: parseInt(_svg.TXN_ID) || 0,
	        V_P_DEPT_CODE		: _svg.DEPT_CODE,
	        V_P_COST_CENTER_CODE: _svg.COST_CENTER_CODE,
	        V_P_PROJECT_CODE	: _svg.PROJECT_CODE,
	        V_P_EMP_CODE		: empCode,
	             
	        V_P_FORM_ID		: p_formId,
	        V_P_MENU_ID		: p_menuId,
	        V_P_PROC_ID		: '',
	        V_P_USERID			: '',
	        V_P_PC				: ''
		};
	     
		console.log("paramObj", paramObj);
		
	    const postJsonPromiseForList = gfn_postJSON("/fi/ftr/rec/selectTra1010List.do", {
	         getType			: 'json',
	         workType			: 'DETAIL',
	         cv_count			: '1',
	         params				: gfnma_objectToString(paramObj)
		});
	
	    const listData = await postJsonPromiseForList;
	
	    try {
			if (_.isEqual("S", listData.resultStatus)) {
	         	
				console.log("listData.cv_1", listData.cv_1);
	         	
	         	jsonFund.length = 0;
	
				listData.cv_1.forEach((item, index) => {
					const obj = {
							TREASURY_ID: item.TREASURY_ID,
							TREASURY_BATCH_NO: item.TREASURY_BATCH_NO,
							TREASURY_LINE_NUM: item.TREASURY_LINE_NUM,
							TXN_GROUP_CODE: item.TXN_GROUP_CODE,
							PAYER_ID: item.PAYER_ID,
							DOC_TYPE: item.DOC_TYPE,
							DOC_ID: item.DOC_ID,
							DOC_NAME: item.DOC_NAME,
							DOC_STATUS: item.DOC_STATUS,
							PLANNED_PAY_DATE: item.PLANNED_PAY_DATE,
							PAY_DATE: item.PAY_DATE,
							PAY_METHOD: item.PAY_METHOD,
							STATUS_CODE: item.STATUS_CODE,
							BANK_CS_CODE: item.BANK_CS_CODE,
							ACCOUNT_NUM: item.ACCOUNT_NUM,
							CURRENCY_CODE: item.CURRENCY_CODE,
							EXCHANGE_TYPE: item.EXCHANGE_TYPE,
							EXCHANGE_RATE: item.EXCHANGE_RATE,
							ORIGINAL_AMOUNT: item.ORIGINAL_AMOUNT,
							FUNCTIONAL_AMOUNT: item.FUNCTIONAL_AMOUNT,
							ACCT_RULE_CODE: item.ACCT_RULE_CODE,
					}
					
					jsonFund.push(obj);
				});
	             
				grdFund.rebuild();
	             
			} else {
	            alert(listData.resultMessage);
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
     * @name fn_setGrdAcntg
     * @param {object} _svg
     * @description 회계처리
     */
    const fn_setGrdAcntg = async function(_svg) {
		
         const txnDateFrom = SBUxMethod.get('srch-dtp-txnDate_from');
         const txnDateTo = SBUxMethod.get('srch-dtp-txnDate_to');
         const fiOrgCode = gfn_nvl(gfnma_multiSelectGet("#srch-fiOrgCode"));
         const payMethod = gfn_nvl(SBUxMethod.get('srch-slt-payMethod'));
         const currencyCode = gfn_nvl(gfnma_multiSelectGet("#srch-currencyCode"));
         
         const payerName = gfn_nvl(SBUxMethod.get('srch-inp-payerName'));
         const payerCode = gfn_nvl(SBUxMethod.get('srch-inp-payerCode'));        
         const costCenterCode = gfn_nvl(SBUxMethod.get('srch-inp-costCenterCode'));
         const costCenterName = gfn_nvl(SBUxMethod.get('srch-inp-costCenterName'));
         const empCode = gfn_nvl(SBUxMethod.get('srch-inp-empCode'));
         const empName = gfn_nvl(SBUxMethod.get('srch-inp-empName'));
         const description = gfn_nvl(SBUxMethod.get('srch-inp-description'));
         const confirmFlag = gfn_nvl(SBUxMethod.get('srch-slt-confirmFlag'));
         const applyAccount = gfn_nvl(SBUxMethod.get('srch-rdo-retraAccount'));
	     
	    const paramObj = {
	    		
			V_P_DEBUG_MODE_YN	: '',
	        V_P_LANG_ID		: '',
	        V_P_COMP_CODE		: gv_ma_selectedApcCd,
	        V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
	        V_P_FI_ORG_CODE 	: _svg.FI_ORG_CODE,
	        V_P_DATE_FR		: txnDateFrom,
	        V_P_DATE_TO		: txnDateTo,
	        V_P_CONFIRM_FLAG	: confirmFlag,
	        V_P_DESCRIPTION	: description,
	        V_P_APPLY_ACCOUNT	: applyAccount,
	        V_P_CURRENCY_CODE	: _svg.CURRENCY_CODE,
	        V_P_CUSTOMER_CS_CODE: _svg.CUSTOMER_CS_CODE,
	        V_P_IN_PAY_METHOD	: '',
	        V_P_APPLY_TYPE		: _svg.APPLY_TYPE,
	        V_P_RECEIPT_NO		: _svg.RECEIPT_NO,
	        V_P_RECEIPT_DATE	: _svg.TXN_DATE,
	        V_P_ITEM_SOURCE_ID	: parseInt(_svg.ITEM_SOURCE_ID) || 0,
	        V_P_ORIGINAL_RECEIPT_AMOUNT	: 
	        						parseInt(_svg.ORIGINAL_AMOUNT) || 0
	            					+ 
	            					parseInt(_svg.ORIGINAL_BANK_CHARGE) || 0,
	        V_P_FUNCTIONAL_RECEIPT_AMOUNT	: 
	        	 					parseInt(_svg.FUNCTIONAL_AMOUNT) || 0
	 								+ 
	 								parseInt(_svg.FUNCTIONAL_BANK_CHARGE) || 0,
	        V_P_TXN_ID			: parseInt(_svg.TXN_ID) || 0,
	        V_P_DEPT_CODE		: _svg.DEPT_CODE,
	        V_P_COST_CENTER_CODE: _svg.COST_CENTER_CODE,
	        V_P_PROJECT_CODE	: _svg.PROJECT_CODE,
	        V_P_EMP_CODE		: empCode,
	             
	        V_P_FORM_ID		: p_formId,
	        V_P_MENU_ID		: p_menuId,
	        V_P_PROC_ID		: '',
	        V_P_USERID			: '',
	        V_P_PC				: ''
		};
	     
		console.log("paramObj", paramObj);
		
	    const postJsonPromiseForList = gfn_postJSON("/fi/ftr/rec/selectTra1010List.do", {
	         getType			: 'json',
	         workType			: 'ACCOUNT',
	         cv_count			: '1',
	         params				: gfnma_objectToString(paramObj)
		});
	
	    const listData = await postJsonPromiseForList;

         try {
             if (_.isEqual("S", listData.resultStatus)) {
             	
             	console.log("listData.cv_1", listData.cv_1);
             	
             	jsonAcntg.length = 0;

				listData.cv_1.forEach((item, index) => {
                     const obj = {
                    		 KEY_ID: item.KEY_ID,
                    		 ITEM_ID: item.ITEM_ID,
                    		 ITEM_SEQ: item.ITEM_SEQ,
                    		 LINE_TYPE: item.LINE_TYPE,
                    		 DEBIT_CREDIT: item.DEBIT_CREDIT,
                    		 VAT_TYPE: item.VAT_TYPE,
                    		 VAT_NAME: item.VAT_NAME,
                    		 DEPT_CODE: item.DEPT_CODE,
                    		 COST_CENTER_CODE: item.COST_CENTER_CODE,
                    		 PROJECT_CODE: item.PROJECT_CODE,
                    		 ORIGINAL_CR_AMT: item.ORIGINAL_CR_AMT,
                    		 ORIGINAL_DR_AMT: item.ORIGINAL_DR_AMT,
                    		 FUNCTIONAL_CR_AMT: item.FUNCTIONAL_CR_AMT,
                    		 FUNCTIONAL_DR_AMT: item.FUNCTIONAL_DR_AMT,
                    		 TXN_QTY: item.TXN_QTY,
                    		 ACCOUNT_CODE: item.ACCOUNT_CODE,
                    		 ACCOUNT_NAME: item.ACCOUNT_NAME,
                    		 ACC_ITEM_CODE1: item.ACC_ITEM_CODE1,
                    		 ACC_ITEM_CODE2: item.ACC_ITEM_CODE2,
                    		 ACC_ITEM_CODE3: item.ACC_ITEM_CODE3,
                    		 ACC_ITEM_CODE4: item.ACC_ITEM_CODE4,
                    		 ACC_ITEM_CODE5: item.ACC_ITEM_CODE5,
                    		 ACC_ITEM_CODE6: item.ACC_ITEM_CODE6,
                    		 ACC_ITEM_CODE7: item.ACC_ITEM_CODE7,
                    		 ACC_ITEM_CODE8: item.ACC_ITEM_CODE8,
                    		 ACC_ITEM_CODE9: item.ACC_ITEM_CODE9,
                    		 ACC_ITEM_CODE10: item.ACC_ITEM_CODE10,
                    		 ACC_ITEM_NAME1: item.ACC_ITEM_NAME1,
                    		 ACC_ITEM_NAME2: item.ACC_ITEM_NAME2,
                    		 ACC_ITEM_NAME3: item.ACC_ITEM_NAME3,
                    		 ACC_ITEM_NAME4: item.ACC_ITEM_NAME4,
                    		 ACC_ITEM_NAME5: item.ACC_ITEM_NAME5,
                    		 ACC_ITEM_NAME6: item.ACC_ITEM_NAME6,
                    		 ACC_ITEM_NAME7: item.ACC_ITEM_NAME7,
                    		 ACC_ITEM_NAME8: item.ACC_ITEM_NAME8,
                    		 ACC_ITEM_NAME9: item.ACC_ITEM_NAME9,
                    		 ACC_ITEM_NAME10: item.ACC_ITEM_NAME10,
                    		 ACC_ITEM_YN1: item.ACC_ITEM_YN1,
                    		 ACC_ITEM_YN2: item.ACC_ITEM_YN2,
                    		 ACC_ITEM_YN3: item.ACC_ITEM_YN3,
                    		 ACC_ITEM_YN4: item.ACC_ITEM_YN4,
                    		 ACC_ITEM_YN5: item.ACC_ITEM_YN5,
                    		 ACC_ITEM_YN6: item.ACC_ITEM_YN6,
                    		 ACC_ITEM_YN7: item.ACC_ITEM_YN7,
                    		 ACC_ITEM_YN8: item.ACC_ITEM_YN8,
                    		 ACC_ITEM_YN9: item.ACC_ITEM_YN9,
                    		 ACC_ITEM_YN10: item.ACC_ITEM_YN10,
                    		 DATA_TYPE1: item.DATA_TYPE1,
                    		 DATA_TYPE2: item.DATA_TYPE2,
                    		 DATA_TYPE3: item.DATA_TYPE3,
                    		 DATA_TYPE4: item.DATA_TYPE4,
                    		 DATA_TYPE5: item.DATA_TYPE5,
                    		 DATA_TYPE6: item.DATA_TYPE6,
                    		 DATA_TYPE7: item.DATA_TYPE7,
                    		 DATA_TYPE8: item.DATA_TYPE8,
                    		 DATA_TYPE9: item.DATA_TYPE9,
                    		 DATA_TYPE10: item.DATA_TYPE10,
                    		 POPUP_ID1: item.POPUP_ID1,
                    		 POPUP_ID2: item.POPUP_ID2,
                    		 POPUP_ID3: item.POPUP_ID3,
                    		 POPUP_ID4: item.POPUP_ID4,
                    		 POPUP_ID5: item.POPUP_ID5,
                    		 POPUP_ID6: item.POPUP_ID6,
                    		 POPUP_ID7: item.POPUP_ID7,
                    		 POPUP_ID8: item.POPUP_ID8,
                    		 POPUP_ID9: item.POPUP_ID9,
                    		 POPUP_ID10: item.POPUP_ID10,
                    		 ACC_CHARACTER: item.ACC_CHARACTER,
                    		 ACC_ITEM_VALUE1: item.ACC_ITEM_VALUE1,
                    		 ACC_ITEM_VALUE2: item.ACC_ITEM_VALUE2,
                    		 ACC_ITEM_VALUE3: item.ACC_ITEM_VALUE3,
                    		 ACC_ITEM_VALUE4: item.ACC_ITEM_VALUE4,
                    		 ACC_ITEM_VALUE5: item.ACC_ITEM_VALUE5,
                    		 ACC_ITEM_VALUE6: item.ACC_ITEM_VALUE6,
                    		 ACC_ITEM_VALUE7: item.ACC_ITEM_VALUE7,
                    		 ACC_ITEM_VALUE8: item.ACC_ITEM_VALUE8,
                    		 ACC_ITEM_VALUE9: item.ACC_ITEM_VALUE9,
                    		 ACC_ITEM_VALUE10: item.ACC_ITEM_VALUE10,
                    		 ACC_VALUE_NAME1: item.ACC_VALUE_NAME1,
                    		 ACC_VALUE_NAME2: item.ACC_VALUE_NAME2,
                    		 ACC_VALUE_NAME3: item.ACC_VALUE_NAME3,
                    		 ACC_VALUE_NAME4: item.ACC_VALUE_NAME4,
                    		 ACC_VALUE_NAME5: item.ACC_VALUE_NAME5,
                    		 ACC_VALUE_NAME6: item.ACC_VALUE_NAME6,
                    		 ACC_VALUE_NAME7: item.ACC_VALUE_NAME7,
                    		 ACC_VALUE_NAME8: item.ACC_VALUE_NAME8,
                    		 ACC_VALUE_NAME9: item.ACC_VALUE_NAME9,
                    		 ACC_VALUE_NAME10: item.ACC_VALUE_NAME10,
                    		 ITEM_CODE: item.ITEM_CODE,
                    		 TXN_QTY: item.TXN_QTY,
                    		 DEPT_NAME: item.DEPT_NAME,
                    		 DESCRIPTION: item.DESCRIPTION,
                    		 INVOICE_ID: item.INVOICE_ID,
                    		 FI_ORG_CODE: item.FI_ORG_CODE,
                    		 ITEM_DOC_TYPE: item.ITEM_DOC_TYPE,
                    		 DOC_ID: item.DOC_ID,
                    		 DOC_NAME: item.DOC_NAME,
                    		 DOC_TYPE: item.DOC_TYPE,
                    		 DOC_STATUS: item.DOC_STATUS,
                     }
                     jsonAcntg.push(obj);
                 });
                 
                 grdAcntg.rebuild();
                 
             } else {
                 alert(listData.resultMessage);
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
     * @name fn_createGridSvg
     * @description 예금입금 그리드 생성	sb-area-grdSvg
     * @function
     */
	const fn_createGridSvg = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSvg';
        SBGridProperties.id = 'grdSvg';
        SBGridProperties.jsonref = 'jsonSvg';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.rowheader = ['update','select'];
        SBGridProperties.columns = [
            {
            	caption : ['chk'],               
            	ref : 'CHECK_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	fixedcellcheckbox : {usemode : true, rowindex : 0},
                	ignoreupdate : true,
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                }, 
            },
            {
            	caption : ["수금방법"],
            	ref : 'PAY_METHOD', 
            	width : '100px', 
            	style : 'text-align:center', 
            	type : 'combo', 
                typeinfo : {
                    ref : 'jsonPayMethod',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['입금일'],          
            	ref : 'TXN_DATE',      
            	width : '120px',   
            	style : 'text-align:center',    
            	type : 'output',
            	format : {
            		type:'date', rule:'yyyy-mm-dd', origin: 'yyyymmdd'
            	} 
            },
            {
            	caption : ["입금은행"],
            	ref : 'DEPOSIT_NAME',
            	width : '140px',   
            	style : 'text-align:left',    
            	type : 'output',
            },
            {
            	caption : ['원화금액'],          
            	ref : 'ORIGINAL_AMOUNT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'output',
                format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption : ['수수료'],          
            	ref : 'ORIGINAL_BANK_CHARGE',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'output',
                format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption : ["수금유형"],
            	ref : 'RECEIPT_TYPE', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo', 
                typeinfo : {
                    ref : 'jsonReceiptType',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ["입금자"],				
            	ref: 'DESCRIPTION',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            },
            {
            	caption : ["고객코드"],				
            	ref: 'CUSTOMER_CS_CODE',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
            },
            {
            	caption : ["고객명"],				
            	ref: 'CUSTOMER_CS_NAME',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
            },
            {
            	caption : ["원가중심점"],				
            	ref: 'COST_CENTER_CODE',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
            },
            {
            	caption : ["원가중심점명"],				
            	ref: 'COST_CENTER_NAME',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
            },
            {
            	caption : ["반제전표번호"],				
            	ref: 'DOC_NAME',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',  
            },
            {
            	caption : ["입금전표번호"],				
            	ref: 'SOURCE_DOC_NAME',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',  
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHANGE_RATE',
            	datatype: 'number',
            	width : '50px',
            	style : 'text-align:right',
            	type : 'output',
                format : {type:'number', rule:'#,###.00'}
            },
            {
            	caption : ["처리자"],				
            	ref: 'DOC_EMP_NAME',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',  
            },
            {
            	caption : ["처리일시"],				
            	ref: 'DOC_INSERT_TIME',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',  
            },
        ];
        grdSvg = _SBGrid.create(SBGridProperties);
        grdSvg.bind('rowchanged', fn_grdSvgRowChanged);
	}

	
	/**
     * @name fn_createGridRetra
     * @description 반제처리 그리드 생성		sb-area-grdRetra
     * @function
     */
	const fn_createGridRetra = function() {
		var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdRetra';
        SBGridProperties.id = 'grdRetra';
        SBGridProperties.jsonref = 'jsonRetra';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
            {
            	caption : ["반제ID"],				
            	ref: 'APPLY_NO',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',  
            },
            {
            	caption: ["반제일"], 
            	ref: 'APPLY_DATE', 
            	type:'output',  
            	width:'120px', 
            	style: 'text-align:center',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', 
            		origin:'yyyymmdd'
            	}
            },
            {
            	caption : ["지급처코드"],				
            	ref: 'CS_CODE',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            },
            {
            	caption : ["지급처명"],				
            	ref: 'CS_NAME',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',  
            },
            {
            	caption : ["통화"],
            	ref : 'CURRENCY_CODE', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo', 
                typeinfo : {
                    ref : 'jsonCurrencyCode',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {
            	caption : ["전표번호"],				
            	ref: 'DOC_NAME',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            },
            
            // CHECK
            {
            	caption : [''],               
            	ref : 'CHECK_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	//ignoreupdate : true,
                	checkedvalue : "Y", 
                	uncheckedvalue : "N",
                	fixedcellcheckbox : {
                		usemode: true, 
                		rowindex: 0, 
                		deletecaption: true
                	}
                }, 
            },
            {
            	caption: ["적요"], 	        
            	ref: 'DESCRIPTION',    	        
            	type:'output',  	
            	width:'250px',  	
            	style:'text-align:left'
            },
            {
            	caption : ['입금액(통화)'],          
            	ref : 'ORIGINAL_APPLY_AMOUNT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'output',
            	format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption: ["계정코드"], 	        
            	ref: 'ACCOUNT_CODE',       
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left'
            },  
            {
            	caption: ["계정과목명"], 	    
            	ref: 'ACCOUNT_NAME',       
            	type:'output',  	
            	width:'200px',  	
            	style:'text-align:left'
            },
            {
            	caption : ["반제번호"],				
            	ref: 'APPLY_NO',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',  
            },
            {
            	caption : ["반제대상"],				
            	ref: 'APPLY_NO',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
            },
            {
            	caption: ["거래일"], 
            	ref: 'TXN_DATE', 
            	type:'output',  
            	width:'120px', 
            	style: 'text-align:center',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', 
            		origin:'yyyymmdd'
            	}
            },
        	{
            	caption: ["전표유형"], 		
            	ref: 'DOC_TYPE',   	    
            	type:'combo', 
            	style:'text-align:left',
            	width: '100px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {
            	caption : ["환율유형"],
            	ref : 'EXCHANGE_TYPE', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo', 
                typeinfo : {
                    ref : 'jsonExchangeType',
                    label : 'label',
                    value : 'value'
                },
            	disabled: true
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHANGE_RATE',
            	datatype: 'number',
            	width : '50px',
            	style : 'text-align:right',
            	type : 'output',
            	format : {type:'number', rule:'#,###.00'}
            },            
            {
            	caption : ['입금액(전표)'],          
            	ref : 'FUNCTIONAL_APPLY_AMOUNT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'input',
            	format : {type:'number', rule:'#,###'}
            },
            {
            	caption : ['통화금액'],          
            	ref : 'ORIGINAL_AMOUNT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'input',
            	format : {type:'number', rule:'#,###'}
            },
            {
            	caption : ['수금전표금액'],          
            	ref : 'FUNCTIONAL_APPLY_R_AMOUNT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'input',
            	format : {type:'number', rule:'#,###'}
            },
            {
            	caption : ['환차손익'],          
            	ref : 'PAY_EXCHANGE_PL_AMT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'input',
            	format : {type:'number', rule:'#,###'}
            },
            {
            	caption: ["증빙유형"],
            	ref: 'VOUCHER_TYPE',
				type:'combo', 
				style:'text-align:left',
				width: '100px',
                typeinfo: {
                    ref			: 'jsonVoucherType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }, 
                disabled: true
            },
            {
            	caption: ["증빙번호"],         
            	ref: 'VOUCHER_NO',    
            	type:'output',  	
            	width:'207px',  
            	style:'text-align:left'
            },
            {
            	caption : ['순번'],          
            	ref : 'INVOICE_LINE_NUM',
            	datatype: 'number',
            	width : '50px',   
            	style : 'text-align:right',    
            	type : 'input',
            	format : {type:'number', rule:'#,###'}
            },
        ];
        
        grdRetra = _SBGrid.create(SBGridProperties);
        grdRetra.bind('valuechanged' , fn_grdRetraValueChanged);
	}	
	
	const fn_grdRetraValueChanged = function() {
		
		const row = grdRetra.getRow();
		const col = grdRetra.getCol();
		
		if (row < 1 || col < 0) {
			return;
		}
		
		if (_.isEqual(col, grdRetra.getColRef('CHECK_YN'))) {
			fn_setRetraSumSelected();
		} 
	}
	
	
	/**
     * @name fn_createGridFund
     * @description 자금실적 그리드 생성		sb-area-grdFund
     * @function
     */
	const fn_createGridFund = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdFund';
        SBGridProperties.id = 'grdFund';
        SBGridProperties.jsonref = 'jsonFund';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
            	caption : ["id"],				
            	ref: 'TREASURY_ID',		
            	type:'output',  	
            	width:'80px',  	
            	style:'text-align:right',  
            },
            {
            	caption : ["자금배치번호"],				
            	ref: 'TREASURY_BATCH_NO',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',
            },
            {
            	caption : ["순번"],				
            	ref: 'TREASURY_LINE_NUM',		
            	type:'output',  	
            	width:'80px',  	
            	style:'text-align:right',  
            },
            {
            	caption: ["지급일"], 
            	ref: 'PAY_DATE', 
            	type:'output',  
            	width:'120px', 
            	style: 'text-align:center',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', 
            		origin:'yyyymmdd'
            	}
            },
            {
            	caption: ["지급예정일"], 
            	ref: 'PLANNED_PAY_DATE', 
            	type:'output',  
            	width:'120px', 
            	style: 'text-align:center',
            	format : {
            		type:'date', 
            		rule:'yyyy-mm-dd', 
            		origin:'yyyymmdd'
            	}
            },
            {
            	caption: ["거래유형"], 		
            	ref: 'TXN_GROUP_CODE',   	    
            	type:'combo', 
            	style:'text-align:left',
            	width: '98px',
                typeinfo: {
                    ref			: 'jsonTxnGroupCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                },
            	disabled: true
            },
            {
            	caption: ["전표유형"], 		
            	ref: 'DOC_TYPE',   	    
            	type:'combo', 
            	style:'text-align:left',
            	width: '100px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                },
            	disabled: true
            },
            {
            	caption : ["전표번호"],				
            	ref: 'DOC_NAME',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            },
            {
            	caption: ["전표상태"],
            	ref: 'DOC_STATUS',
            	type:'combo', 
            	style:'text-align:left',
            	width: '79px',
                typeinfo: {
                    ref			: 'jsonDocStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                },
            	disabled: true
            },
            {
            	caption : ["통화"],
            	ref : 'CURRENCY_CODE', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo', 
                typeinfo : {
                    ref : 'jsonCurrencyCode',
                    label : 'label',
                    value : 'value'
                },
            	disabled: true
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHANGE_RATE',
            	datatype: 'number',
            	width : '50px',
            	style : 'text-align:right',
            	type : 'output',
            	format : {type:'number', rule:'#,###.00'}
            },
            {
            	caption : ["환산유형"],
            	ref : 'EXCHANGE_TYPE', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo', 
                typeinfo : {
                    ref : 'jsonExchangeType',
                    label : 'label',
                    value : 'value'
                },
            	disabled: true
            },
            {
            	caption : ['통화금액'],          
            	ref : 'ORIGINAL_AMOUNT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'output',
            	format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption : ['전표금액'],          
            	ref : 'FUNCTIONAL_AMOUNT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'input',
            	format : {type:'number', rule:'#,###'}
            },
            {
            	caption : ["은행"],
            	ref : 'BANK_CS_CODE', 
            	width : '100px', 
            	style : 'text-align:center', 
            	type : 'combo', 
            	typeinfo : {
                    ref : 'jsonBankCsCode',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ["거래처"],				
            	ref: 'PAYER_ID',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',
            },
            {
            	caption : ["계좌번호"],				
            	ref: 'ACCOUNT_NUM',		
            	type:'input',  	
            	width:'150px',  	
            	style:'text-align:left', 
            },
            {
            	caption : ["지급방법"],
            	ref : 'PAY_METHOD', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo', 
                typeinfo : {
                    ref : 'jsonPayMethod',
                    label : 'label',
                    value : 'value'
                }
            },
            {
            	caption: ["자금상태"],           
            	ref: 'STATUS_CODE', 		        
            	type:'combo',  	
            	width:'60px', 
            	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonStatusCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                },
                disabled: true,
                hidden: true
            },
        ];
        grdFund = _SBGrid.create(SBGridProperties);
	}
	
	/**
     * @name fn_createGridAcntg
     * @description 회계처리 그리드 생성		sb-area-grdAcntg
     * @function
     */
	const fn_createGridAcntg = function() {
		var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdAcntg';
        SBGridProperties.id = 'grdAcntg';
        SBGridProperties.jsonref = 'jsonAcntg';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
        	{
            	caption: ["전표유형"], 		
            	ref: 'DOC_TYPE',   	    
            	type:'combo', 
            	style:'text-align:left',
            	width: '100px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {
            	caption : ["전표번호"],				
            	ref: 'DOC_NAME',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
            },
            {
            	caption: ["전표상태"],
            	ref: 'DOC_STATUS',
            	type:'combo', 
            	style:'text-align:left',
            	width: '79px',
                typeinfo: {
                    ref			: 'jsonDocStatus',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {
            	caption: ["순번"], 	        
            	ref: 'ITEM_SEQ',    	        
            	type:'output',  	
            	width:'60px',  	
            	style:'text-align:right'
            },
            {
            	caption: ["TYPE"],           
            	ref: 'LINE_TYPE', 		        
            	type:'combo',  	
            	width:'80px', 
            	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonLineType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {
            	caption: ["차/대"],					
            	ref: 'DEBIT_CREDIT', 			
            	type:'combo',  		
            	width:'60px',  		
            	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonDebitCredit',
					label		: 'label',
					value		: 'value',
					displayui :true, 
					oneclickedit: true
            	}
            },
            {
            	caption: ["부가세유형"], 	    
            	ref: 'VAT_TYPE',    	   
            	type:'combo',  	
            	width:'150px',  	
            	style:'text-align:left',
               	typeinfo: {
   					ref			: 'jsonVatType',
   					label		: 'label',
   					value		: 'value',
               	}
            }, // TODO : P_ACCOUNT_POPUP_Q
            {
            	caption: ["계정코드"], 	        
            	ref: 'ACCOUNT_CODE',       
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left'
            },  
            {
            	caption: ["계정과목명"], 	    
            	ref: 'ACCOUNT_NAME',       
            	type:'output',  	
            	width:'200px',  	
            	style:'text-align:left'
            },
            {
            	caption: ["차변(통화)"],        
            	ref: 'ORIGINAL_DR_AMT',    
            	type:'output',  	
            	width:'120px',  
            	style:'text-align:right',
                typeinfo : {
                	mask : {alias : 'numeric'}, 
                	maxlength : 24
                }, 
                format : {type:'number', rule:'#,###', emptyvalue:'0'}
            },
            {
            	caption: ["대변(통화)"],         
            	ref: 'ORIGINAL_CR_AMT',    
            	type:'output',  	
            	width:'120px',  
            	style:'text-align:right',
                typeinfo : {
                	mask : {alias : 'numeric'}, 
                	maxlength : 24
                },
                format : {
                	type:'number', 
                	rule:'#,###', 
                	emptyvalue:'0'
                }
            },
            {
            	caption: ["차변(전표)"],         
            	ref: 'FUNCTIONAL_DR_AMT',    
            	type:'output',  	
            	width:'120px',  
            	style:'text-align:right',
                typeinfo : {
                	mask : {alias : 'numeric'}, 
                	maxlength : 24
                }, 
                format : {
                	type:'number', 
                	rule:'#,###', 
                	emptyvalue:'0'
                }
            },
            {
            	caption: ["대변(전표)"],         
            	ref: 'FUNCTIONAL_CR_AMT',    
            	type:'output',  	
            	width:'120px',  
            	style:'text-align:right',
                typeinfo : {
                	mask : {alias : 'numeric'}, 
                	maxlength : 24
                }, 
                format : {
                	type:'number', 
                	rule:'#,###', 
                	emptyvalue:'0'
                }
            },
            {
            	caption: ["부서"], 	        
            	ref: 'DEPT_NAME',    	        
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left'
            },
            {
            	caption: ["원가중심점"],           
            	ref: 'COST_CENTER_CODE', 		        
            	type:'combo',  	
            	width:'100px', 
            	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCostCenterCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                },
                disabled: true
            },
            {
            	caption: ["적요"], 	        
            	ref: 'DESCRIPTION',    	        
            	type:'output',  	
            	width:'250px',  	
            	style:'text-align:left'
            },
        ];
        
        grdAcntg = _SBGrid.create(SBGridProperties);
	}
	

	
	const fn_onInputSrchEmpName = function(empName) {
    	SBUxMethod.set('srch-inp-empCode', '');
	}
	
	
	/** popup function */
	
    /**
     * @name fn_compopupPayerName
     * @description 거래처 팝업
     */
    const fn_compopupPayerName = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("srch-inp-payerName"));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND A.CS_CODE LIKE '%" + replaceText0 + "%' AND A.CS_NAME LIKE '%" + replaceText1 + "%' AND A.BIZ_REGNO LIKE '%" + replaceText2 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '고객사 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CS_SALE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["고객사코드",		"사업자번호", 		"고객사명"]
            ,searchInputFields		: ["CS_CODE",	"BIZ_REGNO", 	"CS_NAME"]
            ,searchInputValues		: ["", 			"",		searchText]
            ,searchInputTypes		: ["input", 	"input",		"input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"",				""]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호", "대표자", "업태", "종목", "주소"
                , "전화", "팩스", "채권계정", "채권계정명", "선수금계정", "선수금계정명", "수금기준", "수금기준명", "수금방법", "통화"]
            ,tableColumnNames		: ["CS_CODE", "CS_NAME",  "BIZ_REGNO", "CHIEF_NAME", "BIZ_CATEGORY", "BIZ_ITEMS", "ADDRESS"
                , "TEL", "FAX", "AR_ACC_CODE", "AR_ACC_NAME", "ADVANCE_ACC_CODE", "ADVANCE_ACC_NAME", "PAY_TERM_CODE", "PAY_TERM_NAME", "PAY_METHOD", "CURRENCY_CODE"]
            ,tableColumnWidths		: ["90px", "150px", "130px", "80px", "100px", "100px", "200px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('srch-inp-payerCode', data.CS_CODE);
                SBUxMethod.set('srch-inp-payerName', data.CS_NAME);
            },
        });
    }

    /**
     * @name fn_compopupCostCenter
     * @description 원가중심점 팝업
     */
    const fn_compopupCostCenter = async function() {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get("srch-inp-costCenterCode"));
        var searchName 		= gfn_nvl(SBUxMethod.get("srch-inp-costCenterName"));
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND A.COST_CENTER_CODE  LIKE '%" + replaceText0 + "%' AND A.COST_CENTER_NAME  LIKE '%" + replaceText1 + "%'";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CC_INPUT'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["계정코드", 			"계정명"]
   			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["코드", 				"명칭", 				"부서코드", 		"부서명", 			"원가유형", 		"사업장", 		"여신영역"]
   			,tableColumnNames		: ["COST_CENTER_CODE",	"COST_CENTER_NAME",	"DEPT_CODE",	"COST_CENTER_NAME",	"COST_CLASS",	"SITE_CODE",	"CREDIT_AREA"]
   			,tableColumnWidths		: ["80px", 				"80px", 			"80px", 		"80px", 			"80px", 		"80px", 		"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-inp-costCenterCode', data.COST_CENTER_CODE);
				SBUxMethod.set('srch-inp-costCenterName', data.COST_CENTER_NAME);
			},
    	});
  	}
    
    /**
     * @name fn_compopupUser
     * @description 사용자 팝업
     */
    const fn_compopupUser = async function() {
	    var searchText 		= gfnma_nvl(SBUxMethod.get("srch-inp-empName"));
	    //var replaceText0 	= "_USER_ID_";
	    //var replaceText1 	= "_USER_NAME_";
	    //var strWhereClause 	= "AND X.USER_ID LIKE '%" + replaceText0 + "%' AND X.USER_NAME LIKE '%" + replaceText1 + "%' ";
		
		SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
		compopup1({
			compCode				: gv_ma_selectedApcCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_USER_02'
	    	,popupType				: 'A'
			,whereClause			: '' //strWhereClause
				,searchCaptions			: ["사번", 		"사원명"]
				,searchInputFields		: ["EMP_CODE", 	"EMP_NAME"]
				,searchInputValues		: ["", 			searchText]
			,height					: '400px'
				,tableHeader			: ["사번", 		"직원명", 		"부서코드", 	"부서명"]
				,tableColumnNames		: ["USER_ID", 	"USER_NAME",  	"DEPT_CODE", 	"DEPT_NAME"]
				,tableColumnWidths		: ["80px", 		"80px", 		"80px", 		"120px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('srch-inp-empCode', 	data.USER_NAME);
				SBUxMethod.set('srch-inp-empName', 	data.USER_ID);
			},
		});
	}    
	
    /**
     * @name fn_onChangeRetraAccount
     * @description 반제대상변경 이벤트
     */
	const fn_onChangeRetraAccount = function() {
		
		const chkVal = SBUxMethod.get("srch-rdo-retraAccount");
		
		if (_.isEqual(chkVal, "111061%")) {
			SBUxMethod.show('svg-btn-batchRetraReg');
			SBUxMethod.show('svg-btn-batchRetraCncl');
		} else {
			SBUxMethod.hide('svg-btn-batchRetraReg');
			SBUxMethod.hide('svg-btn-batchRetraCncl');
		}
	}
	
	
    
    /**
     * @name fn_batchRetraReg
     * @description 일괄반제수행
     */    
	const fn_batchRetraReg = async function() {
		await fn_batchRetra('BATCH_APPLY');
    }
    
    /**
     * @name fn_batchRetraCncl
     * @description 일괄반제취소
     */    
	const fn_batchRetraCncl = async function() {
		await fn_batchRetra('BATCH_CANCEL');
    }
    
    const fn_batchRetra = async function(_workType) {
    	
		let receiptNo = "";
		
		const allData = grdSvg.getGridDataAll();
		
		allData.forEach((item) => {
			if (_.isEqual("Y", item.CHECK_YN)) {
				
				if (!gfn_isEmpty(receiptNo)) {
					receiptNo += "|";
				}
				
				receiptNo += item['RECEIPT_NO'];
			}
		});
		
		if (gfn_isEmpty(receiptNo)) {
			gfn_comAlert("W0004", "선택");		//	W0004	{0}한 대상이 없습니다.
 			return;
		}
		
		let msgCn = "";
		switch (_workType) {
			case 'BATCH_APPLY':
				msgCn = "일괄반제수행";
				break;
			case 'BATCH_CANCEL':
				msgCn = "일괄반제취소"
				break;
			default:
				return;
		}
		
		if (!gfn_comConfirm("Q0001", msgCn)) {	//	Q0001	{0} 하시겠습니까?
     		return;
     	}
		
  		const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedApcCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                
                V_P_RECEIPT_NO_T	: receiptNo,
                
                V_P_FORM_ID			: p_formId,
                V_P_MENU_ID			: p_menuId,
                V_P_PROC_ID			: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };
        	
        const postJsonPromise = gfn_postJSON("/fi/ftr/rec/insertTra1010S3.do", {
            getType				: 'json',
            workType			: _workType,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });
        
        console.log("paramObj", paramObj);
    	
    	Object.keys(paramObj).forEach((key) => {
    		console.log("key", key, paramObj[key]);
    	});
    	
        
        const resoponseData = await postJsonPromise;
        
        try {
            if (_.isEqual("S", resoponseData.resultStatus)) {
            	gfn_comAlert("I0001");	// I0001	처리 되었습니다.
            	fn_search();

            } else {
                //alert(resoponseData.resultMessage);
                gfn_comAlert("E0000", data.resultMessage);
                return false;
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
     * @name fn_prttnReg
     * @description 분할등록
     */    
    const fn_prttnReg = async function() {
    	
    	await fn_prttn('DIVIDE');
    	
    }
    
    /**
     * @name fn_prttnCncl
     * @description 분할취소
     */    
    const fn_prttnCncl = async function() {
    	
    	await fn_prttn('CANCEL');
    	
    }
    
    /**
     * @name fn_prttn
     * @description 분할
     */
    const fn_prttn = async function(_workType) {
    	
    	// 현재행
    	const row = grdSvg.getRow();
    	if (row < 1) {
    		return;
    	}
    	
    	const rowData = grdSvg.getRowData(row);
    	
    	
    	const divAmount = parseInt(SBUxMethod.get('svg-inp-divAmount')) || 0;
    	const originalAmount = parseInt(rowData['ORIGINAL_AMOUNT']) || 0;
    	
    	const originalReceiptYn = rowData['ORIGINAL_RECEIPT_YN'];
    	const divYn = rowData['DIV_YN'];
    	
    	switch (_workType) {
    	
	    	case 'DIVIDE':

	        	if (divAmount <= 0) {
	    			gfn_comAlert("W0023", "분할금액", "0");		//	W0023	{0}은/는 {1} 보다 커야 합니다.
	     			return;
	    		}
	        	
	        	
	        	if (divAmount >= originalAmount) {
	        		gfn_comAlert("W0024", "분할금액", "통화금액");		//	W0024	{0}은/는 {1} 보다 작아야 합니다.
	     			return;
	        	}
	        	
	        	if (!gfn_comConfirm("Q0001", "분할")) {	//	Q0001	{0} 하시겠습니까?
	         		return;
	         	}
	        	
	    		break;
	    		
	    	case 'CANCEL':
	    		
	    		if (_.isEqual(originalReceiptYn, "Y")) {
	    			gfn_comAlert("W0025", "원수금내역", "분할취소", "불가능");		//	W0025	{0}은/는 {1}이/가 {2}합니다.
	     			return;
	    		}
	    		
	    		if (_.isEqual(divYn, "Y")) {
	    			gfn_comAlert("W0011", "분할내역");		//	W0011	{0}이/가 아닙니다.
	     			return;
	    		}
	    		
	    		if (!gfn_comConfirm("Q0001", "분할취소")) {	//	Q0001	{0} 하시겠습니까?
	         		return;
	         	}
	    		
	    	default:
	    		return;
    	
    	}
    	
  		const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gfn_nvl(rowData.COMP_CODE, gv_ma_selectedApcCd),
                V_P_CLIENT_CODE		: gfn_nvl(rowData.CLIENT_CODE, gv_ma_selectedClntCd),
                
                V_P_TXN_ID         	: rowData.TXN_ID,
                V_P_DIV_AMOUNT     	: divAmount,
                
                V_P_FORM_ID			: p_formId,
                V_P_MENU_ID			: p_menuId,
                V_P_PROC_ID			: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };
        	
        const postJsonPromise = gfn_postJSON("/fi/ftr/rec/insertTra1010S2.do", {
            getType				: 'json',
            workType			: _workType,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });
        
        console.log("paramObj", paramObj);
    	
    	Object.keys(paramObj).forEach((key) => {
    		console.log("key", key, paramObj[key]);
    	});
    	
        
        const resoponseData = await postJsonPromise;
        
        try {
            if (_.isEqual("S", resoponseData.resultStatus)) {
            	gfn_comAlert("I0001");	// I0001	처리 되었습니다.
            	fn_search();

            } else {
                //alert(resoponseData.resultMessage);
                gfn_comAlert("E0000", data.resultMessage);
                return false;
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
     * @name fn_svgRetraReg
     * @description 입금반제
     */
    const fn_svgRetraReg = async function(_workType) {
    	await fn_svgRetra('N');
    }
    
    /**
     * @name fn_svgRetraCncl
     * @description 입금반제취소
     */
    const fn_svgRetraCncl = async function(_workType) {
    	await fn_svgRetra('D');
    }
    
    /**
     * @name fn_svgRetra
     * @description 입금반제처리
     */
    const fn_svgRetra = async function(_workType) {
    	
    	// 현재행
    	const row = grdSvg.getRow();
    	if (row < 1) {
    		return;
    	}
    	
    	const rowData = grdSvg.getRowData(row);

    	switch (_workType) {
    	
	    	case 'N':	// 입금반제
	    	
	        	fn_setRetraSumSelected();
	        	
	        	const originalAmount = parseInt(rowData['ORIGINAL_AMOUNT']) || 0;
	        	const originalBankCharge = parseInt(rowData['ORIGINAL_BANK_CHARGE']) || 0;
	        		
	        	const dtlOrgnlAmt = parseInt(SBUxMethod.get('retra-inp-sltTotOrgnlAmt')) || 0;
	        	const dtlFnctnlAmt = parseInt(SBUxMethod.get('retra-inp-sltTotFnctnlAmt')) || 0;
	        	
	        	if (dtlOrgnlAmt > originalAmount + originalBankCharge) {
	        		//채권반제항목 합계는 수금 거래내역의 입금금액을 초과할 수 없습니다.
	        		gfn_comAlert("W0014", "채권반제항목 합계", "수금 거래내역의 입금금액");		//	W0014	{0}이/가 {1} 보다 큽니다.
	     			return;
	        	} else if (dtlOrgnlAmt < originalAmount + originalBankCharge) {
	        		// 채권반제항목 합계가 수금 거래내역에서 선택된 입금금액보다 작습니다.
	        		gfn_comAlert("W0015", "채권반제항목 합계", "수금 거래내역에서 선택된 입금금액");		//	W0015	{0}이/가 {1} 보다 작습니다.
	     			return;
	        	}
	        	
	        	if (!gfn_comConfirm("Q0001", "입금반제")) {	//	Q0001	{0} 하시겠습니까?
	         		return;
	         	}
	        	
	    		break;
	    		
	    	case 'D':	// 입금반제취소
	    		
	    		if (!gfn_comConfirm("Q0001", "입금반제취소")) {	//	Q0001	{0} 하시겠습니까?
	         		return;
	         	}
	    		
	    		break;
	    	
	    	default:
	    		return;
    	
    	}
    	
    	let docIdD = "";
    	let exchangeTypeD = "";
    	let exchangeRateD = "";
    	let originalAmountD = "";
    	let originalApplyAmountD = "";
    	let functionalApplyAmountD = "";
    	let payExchangePlAmtD = "";
    	let voucherNoD = "";
    	let voucherTypeD = "";
    	let descriptionD = "";
    	let sourceIdAdvanceD = "";
    	let sourceIdD = "";
    	let sourceDocD = "";
    	let accountCodeD = "";
    	let deptCodeD = "";
    	let costCenterCodeD = "";
    	let projectCodeD = "";
    	
		const allData = grdRetra.getGridDataAll();
		
		allData.forEach((item) => {
			if (_.isEqual("Y", item.CHECK_YN)) {
				
				const docId = item['DOC_ID'] + "";
				const exchangeType = item['EXCHANGE_TYPE'] + "";
				const exchangeRate = item['EXCHANGE_RATE'] + "";
				const originalAmount = item['ORIGINAL_AMOUNT'] + "";
				const originalApplyAmount = item['ORIGINAL_APPLY_AMOUNT'] + "";
				const functionalApplyAmount = item['FUNCTIONAL_APPLY_AMOUNT'] + "";
				const payExchangePlAmt = item['PAY_EXCHANGE_PL_AMT'] + "";
				const voucherNo = item['VOUCHER_NO'] + "";
				const voucherType = item['VOUCHER_TYPE'] + "";
				const description = item['DESCRIPTION'] + "";
				const itemSourceIdAdvance = item['ITEM_SOURCE_ID_ADVANCE'] + "";
				const itemSourceId = item['ITEM_SOURCE_ID'] + "";
				const docType = item['DOC_TYPE'] + "";
				const accountCode = item['ACCOUNT_CODE'] + "";
				const deptCode = item['DEPT_CODE'] + "";
				const costCenterCode = item['COST_CENTER_CODE'] + "";
				const projectCode = item['PROJECT_CODE'] + "";
				
				
				if (!gfn_isEmpty(docIdD)) {
					docIdD += "|";
					exchangeTypeD += "|";
					exchangeRateD += "|";
					originalAmountD += "|";
					originalApplyAmountD += "|";
					functionalApplyAmountD += "|";
					payExchangePlAmtD += "|";
					voucherNoD += "|";
					voucherTypeD += "|";
					descriptionD += "|";
					sourceIdAdvanceD += "|";
					sourceIdD += "|";
					sourceDocD += "|";
					accountCodeD += "|";
					deptCodeD += "|";
					costCenterCodeD += "|";
					projectCodeD += "|";
				}
				
				docIdD += docId;
				exchangeTypeD += exchangeType;
				exchangeRateD += exchangeRate;
				originalAmountD += originalAmount;
				originalApplyAmountD += originalApplyAmount;
				functionalApplyAmountD += functionalApplyAmount;
				payExchangePlAmtD += payExchangePlAmt;
				voucherNoD += voucherNo;
				voucherTypeD += voucherType;
				descriptionD += description;
				sourceIdAdvanceD += itemSourceIdAdvance;
				sourceIdD += itemSourceId;
				sourceDocD += docType;
				accountCodeD += accountCode;
				deptCodeD += deptCode;
				costCenterCodeD += costCenterCode;
				projectCodeD += projectCode;
			}
		});
    	
    	
  		const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gfn_nvl(rowData.COMP_CODE, gv_ma_selectedApcCd),
                V_P_CLIENT_CODE		: gfn_nvl(rowData.CLIENT_CODE, gv_ma_selectedClntCd),
                
                V_P_FI_ORG_CODE		: fiOrgCode,
                V_P_RECEIPT_NO		: receiptNo,
                V_P_APPLY_DATE		: applyDate,
                V_P_APPLY_TYPE		: applyType,
                V_P_CURRENCY_CODE	: currencyCode,
                V_P_TXN_ID			: txnId,
                V_P_DOC_ID_D					: docIdD,
                V_P_EXCHANGE_TYPE_D				: exchangeTypeD,
                V_P_EXCHANGE_RATE_D				: exchangeRateD,
                V_P_ORIGINAL_AMOUNT_D			: originalAmountD,
                V_P_ORIGINAL_APPLY_AMOUNT_D		: originalApplyAmountD,
                V_P_FUNCTIONAL_APPLY_AMOUNT_D	: functionalApplyAmountD,
                V_P_PAY_EXCHANGE_PL_AMT_D		: payExchangePlAmtD,
                V_P_VOUCHER_NO_D				: voucherNoD,
                V_P_VOUCHER_TYPE_D				: voucherTypeD,
                V_P_DESCRIPTION_D				: descriptionD,
                V_P_SOURCE_ID_ADVANCE_D			: sourceIdAdvanceD,
                V_P_SOURCE_ID_D					: sourceIdD,
                V_P_SOURCE_DOC_D				: sourceDocD,
                V_P_ACCOUNT_CODE_D				: accountCodeD,
                V_P_DEPT_CODE_D					: deptCodeD,
                V_P_COST_CENTER_CODE_D			: costCenterCodeD,
                V_P_PROJECT_CODE_D				: projectCodeD,
                
                V_P_FORM_ID			: p_formId,
                V_P_MENU_ID			: p_menuId,
                V_P_PROC_ID			: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };
        	
        const postJsonPromise = gfn_postJSON("/fi/ftr/rec/insertTra1010S.do", {
            getType				: 'json',
            workType			: _workType,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });
        
        console.log("paramObj", paramObj);
    	
    	Object.keys(paramObj).forEach((key) => {
    		console.log("key", key, paramObj[key]);
    	});
    	
        const resoponseData = await postJsonPromise;
        
        try {
            if (_.isEqual("S", resoponseData.resultStatus)) {
            	gfn_comAlert("I0001");	// I0001	처리 되었습니다.
            	fn_search();

            } else {
                alert(resoponseData.resultMessage);
                return false;
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
     * @name fn_saveFundPlan	
     * @description 저장 버튼	자금계획등록
     */
    const fn_insertFundPlan = async function() {
    	await fn_saveFundPlan('ACCOUNT');
	}
    
	/**
     * @name fn_deleteFundPlan	
     * @description 저장 버튼	자금계획삭제
     */
    const fn_deleteFundPlan = async function() {
    	await fn_saveFundPlan('CANCEL');
	}
	
	/**
     * @name fn_saveFundPlan	
     * @description 저장 버튼	자금계획등록
     */
    const fn_saveFundPlan = async function(_workType) {
		
        const fiOrgCode = gfn_nvl(gfnma_multiSelectGet("#srch-fiOrgCode"));
        const payMethod = gfn_nvl(SBUxMethod.get('srch-slt-payMethod'));
        const currencyCode = gfn_nvl(gfnma_multiSelectGet("#srch-currencyCode"));
        const receiptNo = gfn_nvl(SBUxMethod.get('srch-inp-receiptNo'));
        const regType = gfn_nvl(SBUxMethod.get('srch-slt-regType'));

        const listData = [];

        let rownum = -1;
        
        const allData = grdSvg.getGridDataAll();
        allData.forEach((item, index) => {
        	
        	if (!_.isEqual("Y", item.CHECK_YN)) {
        		return;
        	}
        			
        	if (_.isEqual(_workType, 'ACCOUNT') && _.isEqual(item.ACCOUNT_COMPLETE_FLAG, "Y")) {
        		return;
        	}
        		
        	rownum++;
        	
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: rownum,
                workType: _workType,
                params: gfnma_objectToString({
                	V_P_DEBUG_MODE_YN	: '',
                	V_P_LANG_ID			: '',
                	V_P_COMP_CODE		: gv_ma_selectedApcCd,
                	V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                	V_P_FI_ORG_CODE		: gfn_nvl(item.FI_ORG_CODE, fiOrgCode),
                	V_P_ACCT_RULE_CODE	: p_defaultAcctRule,
                	V_P_APPLY_TYPE		: item.APPLY_TYPE,
                	V_P_RECEIPT_NO		: item.RECEIPT_NO,
                	V_P_TXN_ID			: gfn_nvl(item.TXN_ID, "0"),
                	V_P_FORM_ID			: p_formId,
                	V_P_MENU_ID			: p_menuId,
                	V_P_PROC_ID			: '',
                	V_P_USERID			: '',
                	V_P_PC				: '',
                })
            }
            
            listData.push(param);
        });

        if (listData.length == 0) {
 			gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
 			return;
 		}
        
 		if (!gfn_comConfirm("Q0001", "저장")) {	//	Q0001	{0} 하시겠습니까?
     		return;
     	}
 		
		const postJsonPromise = gfn_postJSON("/fi/ftr/rec/insertTra1010S1List.do", {listData: listData});
        const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
            	gfn_comAlert("I0001");
                fn_search();
			} else {
            alert(data.resultMessage);
            }
		} catch (e) {
        	if (!(e instanceof Error)) {
            	e = new Error(e);
			}
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
		}
	}
	
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
