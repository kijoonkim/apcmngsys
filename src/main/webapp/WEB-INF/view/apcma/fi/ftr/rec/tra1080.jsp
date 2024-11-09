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
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
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
                </tbody>
            </table>

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
	         	// 원가중심점코드
	            gfnma_setComSelect(['grdAcntg'], jsonCostCenterCode, 'L_CC_INPUT', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),
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
            	caption : ['거래금액'],          
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
        const postJsonPromiseForList = gfn_postJSON("/fi/ftr/rec/selectTra1080List.do", {
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
     * @name fn_save
     * @description 저장 버튼
     */
	const fn_save = async function() {

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
                	V_P_COMP_CODE: gfn_nvl(item.data.COMP_CODE, gv_ma_selectedApcCd),
                	V_P_CLIENT_CODE: gfn_nvl(item.data.CLIENT_CODE, gv_ma_selectedClntCd),
                	V_P_FI_ORG_CODE: gfn_nvl(item.data.FI_ORG_CODE, fiOrgCode),
                	V_P_PAY_METHOD: item.data.PAY_METHOD,
                	V_P_TXN_DATE: item.data.TXN_DATE,
                	V_P_IN_DEPOSIT_CODE: item.data.IN_DEPOSIT_CODE,
                	V_P_IN_DEPOSIT_SEQ: gfn_nvl(item.data.IN_DEPOSIT_SEQ, "1"),
                	V_P_CUSTOMER_BANK_ACCOUNT_NO: item.data.CUSTOMER_BANK_ACCOUNT_NO,
                	V_P_CUSTOMER_BANK_CODE: item.data.CUSTOMER_BANK_CODE,
                	V_P_CUSTOMER_ACCOUNT_OWNER: item.data.CUSTOMER_ACCOUNT_OWNER,
                	V_P_NOTE_NO: item.data.NOTE_NO,
                	V_P_NOTE_ISSUE_DATE: item.data.NOTE_ISSUE_DATE,
                	V_P_NOTE_DUE_DATE: item.data.NOTE_DUE_DATE,
                	V_P_NOTE_ISSUER: item.data.NOTE_ISSUER,
                	V_P_CURRENCY_CODE: item.data.CURRENCY_CODE,
                	V_P_EXCHANGE_TYPE: item.data.EXCHANGE_TYPE,
                	V_P_EXCHANGE_RATE: item.data.EXCHANGE_RATE,
                	V_P_ORIGINAL_RECEIPT_AMOUNT: item.data.ORIGINAL_RECEIPT_AMOUNT,
                	V_P_FUNCTIONAL_RECEIPT_AMOUNT: item.data.FUNCTIONAL_RECEIPT_AMOUNT,
                	V_P_ORIGINAL_BANK_CHARGE: item.data.ORIGINAL_BANK_CHARGE,
                	V_P_FUNCTIONAL_BANK_CHARGE: item.data.FUNCTIONAL_BANK_CHARGE,
                	V_P_RECEIPT_TR_TYPE: item.data.RECEIPT_TR_TYPE,
                	V_P_VOUCHER_NO: item.data.VOUCHER_NO,
                	V_P_VOUCHER_TYPE: item.data.VOUCHER_TYPE,
                	V_P_DESCRIPTION: item.data.DESCRIPTION,
                	V_P_APPLY_COMPLETE_FLAG: item.data.APPLY_COMPLETE_FLAG,
                	V_P_CUSTOMER_CS_CODE: item.data.CUSTOMER_CS_CODE,
                	V_P_ACCOUNT_CODE: item.data.ACCOUNT_CODE,
                	V_P_ADVANCE_ACC_CODE: item.data.ADVANCE_ACC_CODE,
                	V_P_BANK_CHARGE_ACC_CODE: item.data.BANK_CHARGE_ACC_CODE,
                	V_P_DEPT_CODE: item.data.DEPT_CODE,
                	V_P_COST_CENTER_CODE: item.data.COST_CENTER_CODE,
                	V_P_PROJECT_CODE: item.data.PROJECT_CODE,
                	V_P_CREDIT_AREA: item.data.CREDIT_AREA,
                	V_P_SALES_RECEIPT_YN: item.data.SALES_RECEIPT_YN,
                	V_P_NOTE_TYPE: item.data.NOTE_TYPE,
                	V_P_REQUESTOR: item.data.REQUESTOR,
                	V_P_FBS_NOTE_TYPE: item.data.FBS_NOTE_TYPE,
                	V_P_PAY_BANK_NAME: item.data.PAY_BANK_NAME,
                	V_P_PAY_BANK_BRANCH: item.data.PAY_BANK_BRANCH,
                	V_P_ENDORSER: item.data.ENDORSER,
                	V_P_APPLY_COMPLETE_DATE: item.data.APPLY_COMPLETE_DATE,
                	V_P_CMS_NO: item.data.CMS_NO,
                	V_P_VIRTUAL_ACCOUNT_NO: item.data.VIRTUAL_ACCOUNT_NO,
                	V_P_TXN_ID: item.data.TXN_ID,
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
                	V_P_COMP_CODE: item.COMP_CODE,
                	V_P_CLIENT_CODE: item.CLIENT_CODE,
                	V_P_FI_ORG_CODE: item.FI_ORG_CODE,
                	V_P_ACCT_RULE_CODE: item.ACCT_RULE_CODE,
                	V_P_TXN_DATE: item.TXN_DATE,
                	V_P_TXN_ID: item.TXN_ID,
                	V_P_CONFIRM_FLAG: item.CONFIRM_FLAG,
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
