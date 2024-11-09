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
								style="width:160px;text-align:left" 
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
                	<td colspan="3" class="td_input" style="border-right: hidden;">
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
								id="retra-inp-sltTotAmt"
								name="retra-inp-sltTotAmt"
								class="form-control input-sm" 			
								style="width:120px;margin-right:20px"
								maxlength="20"
								autocomplete="off"
								mask = "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}"
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
	var jsonUseYn = [];
	
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
				gfnma_setComSelect(['grdSvg'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
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
	         	
			]);
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
        SBGridProperties.rowheader = ['update'];
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
            	width : '150px', 
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
            	ref : 'CUSTOMER_BANK_CODE', 
            	width : '100px', 
            	style : 'text-align:center', 
            	type : 'combo', 
                typeinfo : {
                    ref : 'jsonBankCode',
                    label : 'label',
                    value : 'value'
                },
                disabled: true
            },
            {
            	caption : ['원화금액'],          
            	ref : 'ORIGINAL_RECEIPT_AMOUNT',
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
            	fixedstyle : 'background-color:#f1ffd9;' 
            },
            
            // CHECK
            {
            	caption: ["적요"], 	        
            	ref: 'DESCRIPTION',    	        
            	type:'output',  	
            	width:'250px',  	
            	style:'text-align:left'
            },
            {
            	caption : ['입금액(통화)'],          
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
            	fixedstyle : 'background-color:#f1ffd9;',
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
                format : {type:'number', rule:'0,000.00'}
            },
            
            ///////
            
            
            
            
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
            	caption: ["반제구분"], 		
            	ref: 'APPLY_TYPE',   	    
            	type:'combo', 
            	style:'text-align:left',
            	width: '200px',
                typeinfo: {
                    ref			: 'jsonDocType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                },
                disabled: true
            },
            {
            	caption: ["AR송장번호"], 	        
            	ref: 'INVOICE_ID',    	        
            	type:'output',  	
            	width:'75px',  	
            	style:'text-align:left'
            },
            {
            	caption: ["라인번호"], 	        
            	ref: 'INVOICE_LINE_NUM',    	        
            	type:'output',  	
            	width:'66px',  	
            	style:'text-align:left'
			},
            {
            	caption : ["환율유형"],
            	ref : 'EXCHANGE_TYPE', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo', 
            	fixedstyle : 'background-color:#f1ffd9;',
                typeinfo : {
                    ref : 'jsonExchangeType',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHANGE_RATE',
            	datatype: 'number',
            	width : '50px',
            	style : 'text-align:right',
            	type : 'input',
            	typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 20,
	                oneclickedit: true,
                },
                format : {type:'number', rule:'#,###.##'}
            },
            
            {
            	caption : ["반제완료"],				
            	ref: 'APPLY_DOC_NAME',		
            	type:'output',  	
            	width:'60px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
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
            	caption: ['확정'],         
            	ref: 'CONFIRM_FLAG',				
            	type:'checkbox',        
            	width:'70px', 
            	style : 'text-align:center',
                typeinfo : { 
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                }, 
                disabled: true
            },
            {
            	caption: ["비고"],			
            	ref: 'DESCRIPTION',			            
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left'
            },
        ];
        
        grdRetra = _SBGrid.create(SBGridProperties);
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
            	fixedstyle : 'background-color:#f1ffd9;' 
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
                },
            	disabled: true
            },
            {
            	caption : ["통화"],
            	ref : 'CURRENCY_CODE', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo', 
            	fixedstyle : 'background-color:#f1ffd9;',
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
                format : {type:'number', rule:'0,000.00'}
            },
            {
            	caption : ["환산유형"],
            	ref : 'EXCHANGE_TYPE', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo', 
            	fixedstyle : 'background-color:#f1ffd9;',
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
            	fixedstyle : 'background-color:#f1ffd9;',
                typeinfo : {
                    ref : 'jsonBankCode',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
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
            	fixedstyle : 'background-color:#f1ffd9;',
                typeinfo : {
                    ref : 'jsonPayMethod',
                    displayui : true,
                    oneclickedit:true,
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
                }
                , disabled: true
                , hidden: true
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
            	type:'output',  	
            	width:'150px',  	
            	style:'text-align:left'
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
	
	
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
