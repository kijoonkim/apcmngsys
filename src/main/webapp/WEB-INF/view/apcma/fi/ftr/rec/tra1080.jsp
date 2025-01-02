<%
    /**
     * @Class Name 		: tra1080.jsp
     * @Description 	: 예금입금처리 화면
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
    <title>title : 예금입금처리</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background: white; z-index: 999" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3>
            </div>
            <div style="margin-left: auto;">
      		</div>
        </div>
        <div class="box-body">
        	<div class="box-search-ma">
	        	<!--[APC] START -->
	            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
	            <!--[APC] END -->
	            <table class="table table-bordered tbl_fixed table-search-ma">
	                <colgroup>
	                    <col style="width: 8%">
						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 7%">
						<col style="width: 2%">
 
						<col style="width: 8%">
						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 7%">
						<col style="width: 2%">
						
						<col style="width: 8%">
						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 7%">
						<col style="width: 2%">
						
						<col style="width: 8%">
						<col style="width: 7%">
						<col style="width: 1%">
						<col style="width: 7%">
						<col style="width: 2%">
	                </colgroup>
	                <tbody>
	                
	                <tr>
	                	<th scope="row" class="th_bg_search">기간</th>
						<td class="td_input" style="border-right:hidden;">
							<sbux-datepicker
								uitype="popup" 
								id="srch-dtp-txnDateFrom" 
								name="srch-dtp-txnDateFrom"
								date-format="yyyy-mm-dd" 
								class="table-datepicker-ma inpt_data_reqed"
								wrap-class="displayFlex" 
								group-id="panHeader"
	                            required
							/>						
						</td>
						<td>~</td>
						<td class="td_input" style="border-right:hidden;">
							<sbux-datepicker
								uitype="popup" 
								id="srch-dtp-txnDateTo" 
								name="srch-dtp-txnDateTo"
								date-format="yyyy-mm-dd" 
								class="table-datepicker-ma inpt_data_reqed"
								wrap-class="displayFlex" 
								group-id="panHeader"
	                            required
							/>						
						</td>
						<td></td>
						<th scope="row" class="th_bg_search">APC</th>
	                    <td colspan="3" class="td_input" style="border-right: hidden;">
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
						<th scope="row" class="th_bg_search">수금방법</th>		<!-- 지급방식 -->
	                    <td colspan="3" class="td_input" style="border-right: hidden;">
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
	                    
	                    <th scope="row" class="th_bg_search">반제여부</th>
	                    <td colspan="3" class="td_input" style="border-right: hidden;">
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
	                <tr><!-- 고객사, 원가중심점, 처리자 -->
	                	<th scope="row" class="th_bg_search">고객사</th>
	                	<td class="td_input" style="border-right: hidden;">
	                		<sbux-input 
	                			id="srch-inp-payerCode"
	                			name="srch-inp-payerCode"
	                			class="form-control input-sm" 
	                			uitype="text"
	                			readonly
	                		></sbux-input>
	                	</td>
	                	<td colspan="2" class="td_input" style="border-right: hidden;">
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
	                            text="..."
	                            uitype="modal"
	                            target-id="modal-compopup1"
	                            onclick="fn_compopupPayerName"
	                        ></sbux-button>
	                    </td>
	                    
	                    <th scope="row" class="th_bg_search">원가중심점</th>
	                    <td class="td_input" style="border-right: hidden;">
	 						<sbux-input 
	 							uitype="text" 
	 							id="srch-inp-costCenterCode"
	 							name="srch-inp-costCenterCode"
	 							class="form-control input-sm" 
	 						></sbux-input>
						</td>
						<td colspan="2" class="td_input" style="border-right: hidden;">
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
								text="..." 
								uitype="modal" 
								target-id="modal-compopup1" 
								onclick="fn_compopupCostCenter"
							></sbux-button>
	                    </td>	                    
	                    <th scope="row" class="th_bg_search">처리자</th>
	                    <td class="td_input" style="border-right: hidden;">
							<sbux-input 
								uitype="text" 
								id="srch-inp-empCode"
								name="srch-inp-empCode"  
								class="form-control input-sm"
								readonly 
							></sbux-input>
						</td>
						<td colspan="2" class="td_input" style="border-right: hidden;">
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
								text="..." 
								uitype="modal" 
								target-id="modal-compopup1" 
								onclick="fn_compopupUser"
							></sbux-button>
	                    </td>
	                </tr>
	                <tr>
	                	<th scope="row" class="th_bg_search">입금통화</th>
						<td colspan="3" class="td_input" style="border-right: hidden;" colspan="3">
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
						<td></td>
	                	<th scope="row" class="th_bg_search">입금자</th>
	                    <td colspan="3" class="td_input" style="border-right: hidden;">
	                    	<sbux-input 
	                    		id="srch-inp-description" 
	                    		name="srch-inp-description" 
	                    		class="form-control input-sm" 
	                    		uitype="text" 
	                    		style="width:100%"
	                    	></sbux-input>
	                    </td>
	                    <td colspan="11"></td>
	                </tr>
	                </tbody>
	            </table>
			</div>
			
			<div class="row">
	            <div class="ad_tbl_top">
	                <ul class="ad_tbl_count">
	                    <li><span>수금 거래내역</span></li>
	                </ul>
					<div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
	                    <sbux-button
	                    	id="svg-btn-retraReg" 
	                    	name="svg-btn-retraReg" 
	                    	uitype="normal" 
	                    	text="채권반제수행" 
	                    	class="btn btn-sm btn-outline-danger" 
	                    	onclick="fn_retraReg" 
	                    	style="margin-right:5px"
	                    ></sbux-button>
	                    <sbux-button
	                		id="svg-btn-retraCncl"
	                		name="svg-btn-retraCncl" 
	                		uitype="normal" 
	                		text="채권반제취소" 
	                		class="btn btn-sm btn-outline-danger" 
	                		onclick="fn_retraCncl" 
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
            	<div id="sb-area-grdSvg" style="height:500px;width:100%"></div>
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
	
	//초기화
	function cfn_init() {
		if (!gfn_comConfirm("Q0001", "초기화")) {	// Q0001	{0} 하시겠습니까?
			return;
		}
 
		fn_init();
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
	var jsonBankCsCode = [];		// 공통은행코드
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
	
	// 예금입금내역
	var grdSvg;
	var jsonSvg = [];
 
	const srchElements = [
		{"id": "srch-slt-payMethod", "default": ""},
		{"id": "srch-slt-confirmFlag", "default": ""},
		{"id": "srch-inp-payerCode", "default": ""},
		{"id": "srch-inp-payerName", "default": ""},
		{"id": "srch-inp-costCenterCode", "default": ""},
		{"id": "srch-inp-costCenterName", "default": ""},
		{"id": "srch-inp-empCode", "default": ""},
		{"id": "srch-inp-empName", "default": ""},
		{"id": "srch-inp-description", "default": ""},
		{"id": "srch-slt-regType", "default": ""},
	];
 
	window.addEventListener("DOMContentLoaded",function(){
		fn_init();
    });
 
    
    /**
     * @name fn_init
     * @description 화면 초기 호출
     * @function
     */
    const fn_init = async function() {
 
		srchElements.forEach((item) => {
			SBUxMethod.set(item.id, item.default);
		});
 
		jsonSvg.length = 0;
 
    	let nowDate = new Date();
		let firstYmd = gfn_dateFirstYmd(nowDate);
		let lastYmd = gfn_dateToYmd(nowDate);
		
		console.log("firstYmd", firstYmd);
		console.log("lastYmd", lastYmd);
		
		SBUxMethod.set("srch-dtp-txnDateFrom", firstYmd);
		SBUxMethod.set("srch-dtp-txnDateTo", lastYmd);
		
		await fn_initSBSelect();
		
		// 그리드 생성
    	fn_createGridSvg();
    }
    
	/**
     * @name fn_initSBSelect
     * @description 화면 초기 호출
     * @function
     */
	const fn_initSBSelect = async function() {
  		
		// 코드정보 설정
		let result = await Promise.all([
				gfnma_setComSelect(['srch-slt-confirmFlag'], jsonUseYn, 'L_COM014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
				gfnma_setComSelect(['grdSvg'], jsonFiOrgCode, 'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACNTG_OGNZ_CD', 'ACNTG_OGNZ_NM', 'Y', ''),
				gfnma_multiSelectInit({
	                target			: ['#srch-fiOrgCode']
	                ,compCode		: gv_ma_selectedCorpCd
	                ,clientCode		: gv_ma_selectedClntCd
	                ,bizcompId		: 'L_FIM022'
	                ,whereClause	: ''
	                ,formId			: p_formId
	                ,menuId			: p_menuId
	                ,selectValue	: ''
	                ,dropType		: 'down' 	// up, down
	                ,dropAlign		: 'right' 	// left, right
	                ,colValue		: 'ACNTG_OGNZ_CD'
	                ,colLabel		: 'ACNTG_OGNZ_NM'
	                ,columns		:[
	                    {caption: "코드",		ref: 'ACNTG_OGNZ_CD', 	width:'150px',  	style:'text-align:left'},
	                    {caption: "명", 		ref: 'ACNTG_OGNZ_NM',    	width:'150px',  	style:'text-align:left'}
	                ]
	            }),
	            
				// 통화
				gfnma_setComSelect(['grdSvg'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CRN_CD', 'CRN_NM', 'Y', ''),
				//통화
				gfnma_multiSelectInit({
					target			: ['#srch-currencyCode']
					,compCode		: gv_ma_selectedCorpCd
					,clientCode		: gv_ma_selectedClntCd
					,bizcompId		: 'L_COM001'
					,whereClause	: ''
					,formId			: p_formId
					,menuId			: p_menuId
					,selectValue	: 'KRW'
					,dropType		: 'down' 	// up, down
					,dropAlign		: 'left' 	// left, right
					,colValue		: 'CRN_CD'
					,colLabel		: 'CRN_NM'
					,columns		:[
			            {caption: "통화코드",	ref: 'CRN_CD', 		width:'100px',  	style:'text-align:left'},
			            {caption: "통화명",	ref: 'CRN_NM',    	width:'150px',  	style:'text-align:left'}
					]
				}),
				// 수금방법
				gfnma_setComSelect(['srch-slt-payMethod'], jsonPayMethod, 'P_FIM073', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
				
				// 은행
				gfnma_setComSelect(['grdSvg'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'BANK_CD', 'BANK_NM', 'Y', ''),
				// 거래유형
	            gfnma_setComSelect(['grdFund'], jsonTxnGroupCode, 'L_FIM071', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	         	// 전표유형
	            gfnma_setComSelect(['grdFund'], jsonDocType, 'L_FIM051', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	         	// 전표상태
	            gfnma_setComSelect(['grdFund'], jsonDocStatus, 'L_FIG002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	         	// 환산유형
	            gfnma_setComSelect(['grdFund'], jsonExchangeType, 'L_COM034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	         	// 원가중심점코드
	            gfnma_setComSelect(['grdAcntg'], jsonCostCenterCode, 'L_CC_INPUT', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CSTCD_CD', 'CSTCD_NM', 'Y', ''),
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
            	ref : 'PAY_MTHD', 
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
            	ref : 'TRSC_DT',      
            	width : '120px',   
            	style : 'text-align:center',    
            	type : 'output',
            	format : {
            		type:'date', rule:'yyyy-mm-dd', origin: 'yyyymmdd'
            	} 
            },
            {
            	caption : ["입금은행"],
            	ref : 'CUST_BANK_CD', 
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
            	caption : ['거래금액'],          
            	ref : 'ORGNL_RCPT_AMT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'output',
                format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption : ['수수료'],          
            	ref : 'ORGNL_BANK_CRG',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'output',
                format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption : ["입금자"],				
            	ref: 'DSCTN',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            },
            {
            	caption : ["고객코드"],				
            	ref: 'CUST_CNPT_CD',		
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
            	ref: 'CSTCD_CD',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
            },
            {
            	caption : ["원가중심점명"],				
            	ref: 'CSTCD_NM',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
            },
            {
            	caption : ["반제전표번호"],				
            	ref: 'SLIP_NM',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',  
            },
            {
            	caption : ["입금전표번호"],				
            	ref: 'SRC_SLIP_NM',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',  
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHRT',
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
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {
		
        if (!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }
        
        const txnDateFrom = SBUxMethod.get('srch-dtp-txnDateFrom');
        const txnDateTo = SBUxMethod.get('srch-dtp-txnDateTo');
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
        
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                V_P_FI_ORG_CODE 	: fiOrgCode,
                V_P_DATE_FR			: txnDateFrom,
                V_P_DATE_TO			: txnDateTo,
                V_P_CONFIRM_FLAG	: confirmFlag,
                V_P_DESCRIPTION		: description,
                V_P_APPLY_ACCOUNT	: '',
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
					/*
                    const obj = {
                    		DOC_DATE: item.SLIP_YMD,
                    		COMP_CODE: item.CO_CD,
                    		FI_ORG_CODE: item.ACNTG_OGNZ_CD,
                    		TXN_ID: item.TRSC_ID,
                    		TXN_DATE: item.TRSC_DT,
                    		RECEIPT_NO: item.RCPT_NO,
                    		PAY_METHOD: item.PAY_MTHD,
                    		APPLY_TYPE: item.APLY_TYPE,
                    		CUSTOMER_CS_CODE: item.CUST_CNPT_CD,
                    		CUSTOMER_CS_NAME: item.CUSTOMER_CS_NAME,
                    		PAYER_BIZ_REGNO: item.PAYER_BIZ_REGNO,
                    		SOURCE_DOC_ID: item.SRC_DOC_ID,
                    		SOURCE_DOC_TYPE: item.SOURCE_DOC_TYPE,
                    		SOURCE_DOC_NAME: item.SRC_SLIP_NM,
                    		DOC_STATUS: item.SLIP_STTS,
                    		ITEM_SOURCE_ID: item.ITEM_SRC_ID,
                    		ACCOUNT_CODE: item.ACNTL_CD,
                    		ACCOUNT_NAME: item.ACNT_NM,
                    		BANK_CHARGE_ACC_CODE: item.BANK_CRG_ACNT_CD,
                    		BANK_CHARGE_ACC_NAME: item.BANK_CHARGE_ACC_NAME,
                    		CURRENCY_CODE: item.CRN_CD,
                    		EXCHANGE_TYPE: item.EXCHRT_TYPE,
                    		EXCHANGE_RATE: item.EXCHRT,
                    		ORIGINAL_AMOUNT: item.ORGNL_AMT,
                    		FUNCTIONAL_AMOUNT: item.CNVS_AMT,
                    		ORIGINAL_BANK_CHARGE: item.ORGNL_BANK_CRG,
                    		FUNCTIONAL_BANK_CHARGE: item.CNVS_BANK_CRG,
                    		CONFIRM_FLAG: item.CFMTN_FLAG,
                    		ACCOUNT_COMPLETE_FLAG: item.ACCOUNT_COMPLETE_FLAG,
                    		CHECK_YN: item.CHECK_YN,
                    		DOC_ID: item.SLIP_ID,
                    		DOC_TYPE: item.SLIP_TYPE,
                    		DOC_NAME: item.SLIP_NM,
                    		DOC_EMP_CODE: item.DOC_EMP_CODE,
                    		DOC_EMP_NAME: item.DOC_EMP_NAME,
                    		DOC_INSERT_TIME: item.DOC_INSERT_TIME,
                    		DOC_STATUS: item.SLIP_STTS,
                    		DEPT_CODE: item.DEPT_CD,
                    		DEPT_NAME: item.DEPT_NM,
                    		COST_CENTER_CODE: item.CSTCD_CD,
                    		COST_CENTER_NAME: item.CSTCD_NM,
                    		PROJECT_CODE: item.PJT_CD,
                    		CREDIT_AREA: item.CRDT_SECT,
                    		TOTAL_RECEIPT_AMOUNT: item.TOT_DPST_AMT,
                    		DESCRIPTION: item.DSCTN,
                    		IN_DEPOSIT_CODE: item.DPST_SVG_CD,
                    		DEPOSIT_NAME: item.DPMNY_NM,
                    		ACCOUNT_NUM: item.ACTNO,
                    		ORIGINAL_RECEIPT_YN: item.ORGNL_RCPT_YN,
                    		DIV_YN: item.PRTTN_YN,
                    		CHILD_CONFIRM_FLAG: item.CHILD_CONFIRM_FLAG,
                    		BASESCALE: item.BASESCALE,
                    		RECEIPT_TYPE: item.RCPT_TYPE,
                    }
                    jsonSvg.push(obj);
					 */
                    jsonSvg.push(item);
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
     * @name fn_save
     * @description 저장 버튼
     */
	const fn_save = async function() {
 
        const txnDateFrom = SBUxMethod.get('srch-dtp-txnDateFrom');
        const txnDateTo = SBUxMethod.get('srch-dtp-txnDateTo');
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
 		
 		const updatedData = grdSvg.getUpdateData(true, 'all');
        const listData = [];
 
        updatedData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                	V_P_DEBUG_MODE_YN: '',
                	V_P_LANG_ID: '',
                	V_P_COMP_CODE: gfn_nvl(item.data.CO_CD, gv_ma_selectedCorpCd),
                	V_P_CLIENT_CODE: gfn_nvl(item.data.CLNT_CD, gv_ma_selectedClntCd),
                	V_P_FI_ORG_CODE: gfn_nvl(item.data.ACNTG_OGNZ_CD, fiOrgCode),
                	V_P_PAY_METHOD: item.data.PAY_MTHD,
                	V_P_TXN_DATE: item.data.TRSC_DT,
                	V_P_IN_DEPOSIT_CODE: item.data.DPST_SVG_CD,
                	V_P_IN_DEPOSIT_SEQ: gfn_nvl(item.data.DPST_SVG_SEQ, "1"),
                	V_P_CUSTOMER_BANK_ACCOUNT_NO: item.data.CUST_BACNT_NO,
                	V_P_CUSTOMER_BANK_CODE: item.data.CUST_BANK_CD,
                	V_P_CUSTOMER_ACCOUNT_OWNER: item.data.CUST_BACNT_OWNR,
                	V_P_NOTE_NO: item.data.PRMNT_NO,
                	V_P_NOTE_ISSUE_DATE: item.data.PRMNT_ISSU_YMD,
                	V_P_NOTE_DUE_DATE: item.data.PRMNT_MTRY_YMD,
                	V_P_NOTE_ISSUER: item.data.PRMNT_ISR,
                	V_P_CURRENCY_CODE: item.data.CRN_CD,
                	V_P_EXCHANGE_TYPE: item.data.EXCHRT_TYPE,
                	V_P_EXCHANGE_RATE: item.data.EXCHRT,
                	V_P_ORIGINAL_RECEIPT_AMOUNT: item.data.ORGNL_RCPT_AMT,
                	V_P_FUNCTIONAL_RECEIPT_AMOUNT: item.data.CNVS_RCPT_AMT,
                	V_P_ORIGINAL_BANK_CHARGE: item.data.ORGNL_BANK_CRG,
                	V_P_FUNCTIONAL_BANK_CHARGE: item.data.CNVS_BANK_CRG,
                	V_P_RECEIPT_TR_TYPE: item.data.RCPT_FUND_TYPE,
                	V_P_VOUCHER_NO: item.data.EVDNC_NO,
                	V_P_VOUCHER_TYPE: item.data.EVDNC_TYPE,
                	V_P_DESCRIPTION: item.data.DSCTN,
                	V_P_APPLY_COMPLETE_FLAG: item.data.REVE_CMPTN_FLAG,
                	V_P_CUSTOMER_CS_CODE: item.data.CUST_CNPT_CD,
                	V_P_ACCOUNT_CODE: item.data.ACNTL_CD,
                	V_P_ADVANCE_ACC_CODE: item.data.ADPYR_ACNTL_CD,
                	V_P_BANK_CHARGE_ACC_CODE: item.data.BANK_CRG_ACNT_CD,
                	V_P_DEPT_CODE: item.data.DEPT_CD,
                	V_P_COST_CENTER_CODE: item.data.CSTCD_CD,
                	V_P_PROJECT_CODE: item.data.PJT_CD,
                	V_P_CREDIT_AREA: item.data.CRDT_SECT,
                	V_P_SALES_RECEIPT_YN: item.data.SLS_CLCTM_YN,
                	V_P_NOTE_TYPE: item.data.PRMNT_TYPE,
                	V_P_REQUESTOR: item.data.RQSR,
                	V_P_FBS_NOTE_TYPE: item.data.FBS_EPRMNT_TYPE,
                	V_P_PAY_BANK_NAME: item.data.PAY_BANK_NM,
                	V_P_PAY_BANK_BRANCH: item.data.PAY_BANK_BRNCH,
                	V_P_ENDORSER: item.data.ENDRSR,
                	V_P_APPLY_COMPLETE_DATE: item.data.REVE_CMPTN_YMD,
                	V_P_CMS_NO: item.data.CMS_NO,
                	V_P_VIRTUAL_ACCOUNT_NO: item.data.VR_ACTNO,
                	V_P_TXN_ID: item.data.TRSC_ID,
                	V_P_FORM_ID: p_formId,
                	V_P_MENU_ID: p_menuId,
                	V_P_PROC_ID: '',
                	V_P_USERID: '',
                	V_P_PC: '',
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
 		
		const postJsonPromise = gfn_postJSON("/fi/ftr/rec/insertTra1020SList.do", {listData: listData});
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
    
	//fn_confirm
    /**
     * @name fn_confirm
     * @description 확정 버튼
     */
	const fn_confirm = async function() {
 
		const allData = grdSvg.getGridDataAll();
        const listData = [];
        
        let rownum = 0;
        
        allData.forEach((item, index) => {
        	
        	if (!_.isEqual(item.CHECK_YN, "Y")) {
        		return;
        	}
        	
        	rownum++;
        	
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: rownum,
                workType: 'CONFIRM',
                params: gfnma_objectToString({
                	V_P_DEBUG_MODE_YN: '',
                	V_P_LANG_ID: '',
                	V_P_COMP_CODE: item.CO_CD,
                	V_P_CLIENT_CODE: item.CLNT_CD,
                	V_P_FI_ORG_CODE: item.ACNTG_OGNZ_CD,
                	V_P_ACCT_RULE_CODE: item.GAAP_CD,
                	V_P_TXN_DATE: item.TRSC_DT,
                	V_P_TXN_ID: item.TRSC_ID,
                	V_P_CONFIRM_FLAG: item.CFMTN_FLAG,
                	V_P_FORM_ID: p_formId,
                	V_P_MENU_ID: p_menuId,
                	V_P_PROC_ID: '',
                	V_P_USERID: '',
                	V_P_PC: '',
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
 		
		const postJsonPromise = gfn_postJSON("/fi/ftr/rec/insertTra1020S1List.do", {listData: listData});
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
        var replaceText0 	= "_CNPT_CD_";
        var replaceText1 	= "_CNPT_NM_";
        var replaceText2 	= "_BRNO_";
        var strWhereClause 	= "AND A.CNPT_CD LIKE '%" + replaceText0 + "%' AND A.CNPT_NM LIKE '%" + replaceText1 + "%' AND A.BRNO LIKE '%" + replaceText2 + "%'";
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '고객사 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_CS_SALE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["고객사코드",		"사업자번호", 		"고객사명"]
            ,searchInputFields		: ["CNPT_CD",	"BRNO", 	"CNPT_NM"]
            ,searchInputValues		: ["", 			"",		searchText]
            ,searchInputTypes		: ["input", 	"input",		"input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"",				""]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호", "대표자", "업태", "종목", "주소"
                , "전화", "팩스", "채권계정", "채권계정명", "선수금계정", "선수금계정명", "수금기준", "수금기준명", "수금방법", "통화"]
            ,tableColumnNames		: ["CNPT_CD", "CNPT_NM",  "BRNO", "CEO_NM", "BZSTAT", "TPBIZ", "ADDR"
                , "TELNO", "FX_NO", "AR_ACNT_CD", "AR_ACC_NAME", "ADPYR_ACNTL_CD", "ADVANCE_ACC_NAME", "PAY_TERM_CD", "PAY_TERM_NM", "PAY_MTHD", "CRN_CD"]
            ,tableColumnWidths		: ["90px", "150px", "130px", "80px", "100px", "100px", "200px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('srch-inp-payerCode', data.CNPT_CD);
                SBUxMethod.set('srch-inp-payerName', data.CNPT_NM);
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
        var replaceText0 	= "_CSTCD_CD_";
        var replaceText1 	= "_CSTCD_NM_";
        var strWhereClause 	= "AND A.CSTCD_CD  LIKE '%" + replaceText0 + "%' AND A.CSTCD_NM  LIKE '%" + replaceText1 + "%'";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점 팝업');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CC_INPUT'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["계정코드", 			"계정명"]
   			,searchInputFields		: ["CSTCD_CD", 	"CSTCD_NM"]
   			,searchInputValues		: [searchCode, 			searchName]
    		,height					: '400px'
   			,tableHeader			: ["코드", 				"명칭", 				"부서코드", 		"부서명", 			"원가유형", 		"사업장", 		"여신영역"]
   			,tableColumnNames		: ["CSTCD_CD",	"CSTCD_NM",	"DEPT_CD",	"CSTCD_NM",	"CST_CLSF",	"SITE_CD",	"CRDT_SECT"]
   			,tableColumnWidths		: ["80px", 				"80px", 			"80px", 		"80px", 			"80px", 		"80px", 		"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('srch-inp-costCenterCode', data.CSTCD_CD);
				SBUxMethod.set('srch-inp-costCenterName', data.CSTCD_NM);
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
	    //var replaceText1 	= "_USER_NM_";
	    //var strWhereClause 	= "AND X.USER_ID LIKE '%" + replaceText0 + "%' AND X.USER_NM LIKE '%" + replaceText1 + "%' ";
		
		SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
		compopup1({
			compCode				: gv_ma_selectedCorpCd
			,clientCode				: gv_ma_selectedClntCd
			,bizcompId				: 'P_USER_02'
	    	,popupType				: 'A'
			,whereClause			: '' //strWhereClause
				,searchCaptions			: ["사번", 		"사원명"]
				,searchInputFields		: ["EMP_CD", 	"EMP_NM"]
				,searchInputValues		: ["", 			searchText]
			,height					: '400px'
				,tableHeader			: ["사번", 		"직원명", 		"부서코드", 	"부서명"]
				,tableColumnNames		: ["USER_ID", 	"USER_NM",  	"DEPT_CD", 	"DEPT_NM"]
				,tableColumnWidths		: ["80px", 		"80px", 		"80px", 		"120px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('srch-inp-empCode', 	data.USER_NM);
				SBUxMethod.set('srch-inp-empName', 	data.USER_ID);
			},
		});
	}    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
