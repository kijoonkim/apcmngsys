<%
    /**
     * @Class Name 		: tra1020.jsp
     * @Description 	: 예금입금등록 화면
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
    <title>title : 예금입금등록</title>
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
		        <sbux-button
		                id="btn-confirm"
		                name="btn-confirm"
		                uitype="normal"
		                class="btn btn-sm btn-primary"
		                text="확정"
		                onclick="fn_confirm"
		        ></sbux-button>
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
	                	<th scope="row" class="th_bg_search">거래일자</th>
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
	                    <td colspan="6"></td>
	                </tr>
	                <tr>
	                	<th scope="row" class="th_bg_search">입금통화</th>
						<td colspan="3" class="td_input" style="border-right: hidden;"">
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
	                	<th scope="row" class="th_bg_search">수금번호</th>
	                    <td colspan="3" class="td_input" style="border-right: hidden;">
	                    	<sbux-input 
	                    		id="srch-inp-receiptNo" 
	                    		class="form-control input-sm" 
	                    		uitype="text" 
	                    		style="width:100%"
	                    	></sbux-input>
	                    </td>
	                    <td></td>
	                    <th scope="row" class="th_bg_search">등록구분</th>
	                    <td colspan="3" class="td_input" style="border-right: hidden;">
							<sbux-select
	                        	unselected-text="전체"
	                            uitype="single"
	                            id="srch-slt-regType"
	                            name="srch-slt-regType"
	                            class="form-control input-sm"
	                            jsondata-ref="jsonRegType"
							/>
	                    </td>
	                    <td colspan="6"></td>
	                </tr>
	                </tbody>
	            </table>
			</div>
			<div class="row">
	            <div class="ad_tbl_top">
	                <ul class="ad_tbl_count">
	                    <li><span>예금입금내역</span></li>
	                </ul>
	                <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
	                	<sbux-button 
							id="svg-btn-addRow"
							name="svg-btn-addRow" 
							uitype="normal" 
							text="행추가" 
							class='btn btn-sm btn-outline-danger' 
							onClick="fn_addRowSvg"
							style="margin-right:5px"
							image-src="/static/resource/svg/grdPlus.svg"
	                           image-style="width:3rem;height:20px"
							image-placement="front"
						></sbux-button>
						<sbux-button 
							id="svg-btn-delRow"
							name="svg-btn-delRow" 
							uitype="normal" 
							text="행삭제" 
							class='btn btn-sm btn-outline-danger' 
							onClick="fn_delRowSvg"
							style="margin-right:5px"
							image-src="/static/resource/svg/grdMinus.svg"
	                           image-style="width:3rem;height:20px"
							image-placement="front"
						></sbux-button>
					</div>
	            </div>
            	<div id="sb-area-grdSvg" style="height:300px;width:100%"></div>
	            <br />
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
	       			<div id="tp-retra" class="tab-page">
	          			<div class="ad_tbl_top">
	           				<ul class="ad_tbl_count">
			        			<li>
			        				<span>반제실적</span>
			        			</li>
	           				</ul>
	        			</div>
	         			<div id="sb-area-grdRetra" style="height:300px"></div>
	       			</div>
	       		</div>
        	</div>
        </div>
    </div>
</section>
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
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "자금실적", "targetid" : "tp-fund", "targetvalue" : "자금실적" },
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "회계처리", "targetid" : "tp-acntg", "targetvalue" : "회계처리" },
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "반제실적", "targetid" : "tp-retra", "targetvalue" : "반제실적" },
    ];

	let lv_prvTabId;
	lv_prvTabId = "tp-fund";

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
	
	// 예금입금내역
	var grdSvg;
	var jsonSvg = [];
		
	// tab
	// 자금실적
	var grdFund;
	var jsonFund = [];
	
	// 회계처리
	var grdAcntg;
	var jsonAcntg = [];
	
	// 반제처리
	var grdRetra;
	var jsonRetra = [];
	
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
		
		SBUxMethod.set("srch-dtp-txnDateFrom", firstYmd);
		SBUxMethod.set("srch-dtp-txnDateTo", lastYmd);
		
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
				gfnma_setComSelect(['grdSvg'], jsonFiOrgCode, 'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
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
	                ,colValue		: 'FI_ORG_CODE'
	                ,colLabel		: 'FI_ORG_NAME'
	                ,columns		:[
	                    {caption: "코드",		ref: 'FI_ORG_CODE', 	width:'150px',  	style:'text-align:left'},
	                    {caption: "명", 		ref: 'FI_ORG_NAME',    	width:'150px',  	style:'text-align:left'}
	                ]
	            }),
	            
				// 통화
				gfnma_setComSelect(['grdSvg'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
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
					,colValue		: 'CURRENCY_CODE'
					,colLabel		: 'CURRENCY_NAME'
					,columns		:[
			            {caption: "통화코드",	ref: 'CURRENCY_CODE', 		width:'100px',  	style:'text-align:left'},
			            {caption: "통화명",	ref: 'CURRENCY_NAME',    	width:'150px',  	style:'text-align:left'}
					]
				}),
				// 수금방법
				gfnma_setComSelect(['srch-slt-payMethod'], jsonPayMethod, 'P_FIM073', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
				// 등록구분
				//gfnma_setComSelect(['srch-slt-svgMethod'], jsonSvgMethod, 'L_FIF015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
				gfnma_setComSelect(['srch-slt-regType'], jsonRegType, 'L_FBS017', "AND COMP_CODE = '" + gv_ma_selectedCorpCd + "'", gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
				
				// 은행
				gfnma_setComSelect(['grdSvg'], jsonBankCode, 'L_BANK_CODE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'BANK_CODE', 'BANK_NAME', 'Y', ''),
				// 거래유형
	            gfnma_setComSelect(['grdFund'], jsonTxnGroupCode, 'L_FIM071', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// 전표유형
	            gfnma_setComSelect(['grdFund'], jsonDocType, 'L_FIM051', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// 전표상태
	            gfnma_setComSelect(['grdFund'], jsonDocStatus, 'L_FIG002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// 환산유형
	            gfnma_setComSelect(['grdFund'], jsonExchangeType, 'L_COM034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// 상태코드
	            gfnma_setComSelect(['grdFund'], jsonStatusCode, 'L_FIM074', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// LINE
	            gfnma_setComSelect(['grdAcntg'], jsonLineType, 'L_FIM052', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// 차/대
	            gfnma_setComSelect(['grdAcntg'], jsonDebitCredit, 'L_FIG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	         	// 원가중심점코드
	            gfnma_setComSelect(['grdAcntg'], jsonCostCenterCode, 'L_CC_INPUT', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'COST_CENTER_CODE', 'COST_CENTER_NAME', 'Y', ''),
	         	// 증빙유형
	            gfnma_setComSelect(['grdAcntg'], jsonVoucherType, 'L_FIG005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
	            
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
            	caption : ['반제'],               
            	ref : 'CHECK_YN',
            	type : 'checkbox',
            	width : '40px',    
            	style : 'text-align:center',
                typeinfo : {
                	ignoreupdate : true,
                	checkedvalue : "Y", 
                	uncheckedvalue : "N" 
                }, 
            },
            {
            	caption : ['거래일'],          
            	ref : 'TXN_DATE',      
            	width : '120px',   
            	style : 'text-align:center',    
            	type : 'datepicker',
            	typeinfo : {
            		dateformat :'yymmdd', 
            		oneclickedit:true, 
            		displayui:true
            	},
            	format : {type:'date', rule:'yyyy-mm-dd', origin: 'yyyymmdd'} 
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
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {
            	caption : ['입금액'],          
            	ref : 'ORIGINAL_RECEIPT_AMOUNT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'input',
            	typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 20,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption : ['수수료(통화)'],          
            	ref : 'ORIGINAL_BANK_CHARGE',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'input',
            	typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 20,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption : ['수수료(전표)'],          
            	ref : 'FUNCTIONAL_BANK_CHARGE',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'input',
            	typeinfo: {
	                mask : {alias : '#', repeat: '*', unmaskvalue : true},
	                maxlength: 20,
	                oneclickedit: true
                },
                format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption : ["수금유형"],
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
            	caption : ["입금계좌코드"],				
            	ref: 'IN_DEPOSIT_CODE',		
            	type:'input',  	
            	width:'100px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
            },
            {
            	caption : ["입금은행"],
            	ref : 'CUSTOMER_BANK_CODE', 
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
            	caption : ["입금계좌번호"],				
            	ref: 'CUSTOMER_BANK_ACCOUNT_NO',		
            	type:'input',  	
            	width:'150px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
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
                format : {type:'number', rule:'#,###.00'}
            },
            {
            	caption : ["비고"],				
            	ref: 'DESCRIPTION',		
            	type:'input',  	
            	width:'150px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
            },
            {	
            	caption : ["등록구분"],				
            	ref: 'REG_TYPE', 
            	width : '100px', 
            	style : 'text-align:center', 
            	type : 'combo', 
            	fixedstyle : 'background-color:#f1ffd9;',
                typeinfo : {
                    ref : 'jsonRegType',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                } 
            },
        ];
        grdSvg = _SBGrid.create(SBGridProperties);
        grdSvg.bind('rowchanged', fn_grdSvgRowChanged);
	}
	
	const fn_grdSvgRowChanged = async function() {
		const nRow = grdSvg.getRow();
    	
    	if (nRow < 1) {
    		return;
    	}
    	
    	const _svg = grdSvg.getRowData(nRow);
    	
		const selectedTab = SBUxMethod.get('tab-svg');
		
		switch (selectedTab) {
			case "tp-fund":
				await fn_setGrdFund(_svg.TXN_ID);
				break;
			case "tp-acntg":
				await fn_setGrdAcntg(_svg.TXN_ID);
				break;
			case "tp-retra":
				await fn_setGrdRetra(_svg.TXN_ID);
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
            	caption : ["반제번호"],				
            	ref: 'APPLY_NO',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left', 
            	fixedstyle : 'background-color:#f1ffd9;' 
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
            	caption : ["통화"],
            	ref : 'CURRENCY_CODE', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo', 
            	fixedstyle : 'background-color:#f1ffd9;',
                typeinfo : {
                    ref : 'jsonCurrencyCode',
                    displayui : true,
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
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
        const receiptNo = gfn_nvl(SBUxMethod.get('srch-inp-receiptNo'));
        const regType = gfn_nvl(SBUxMethod.get('srch-slt-regType'));
        
        const paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID			: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                V_P_FI_ORG_CODE 	: fiOrgCode,
                V_P_TXN_DATE_FROM	: txnDateFrom,
                V_P_TXN_DATE_TO		: txnDateTo,
                V_P_RECEIPT_NO		: receiptNo,
                V_P_CUSTOMER_CS_CODE: '',
                V_P_CUSTOMER_CS_NAME: '',
                V_P_IN_CURRENCY_CODE: currencyCode,
                V_P_BANK_CS_CODE	: '',
                V_P_IN_DEPOSIT_CODE	: '',
                V_P_IN_PAY_METHOD	: payMethod,
                V_P_TXN_ID			: '',
                V_P_REG_TYPE		: '',
                
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };
        	console.log("paramObj", paramObj);
        const postJsonPromiseForList = gfn_postJSON("/fi/ftr/rec/selectTra1020List.do", {
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
                    		CHECK_YN: item.CHECK_YN,
                    		TXN_ID: item.TXN_ID,
                    		FI_ORG_CODE: item.FI_ORG_CODE,
                    		PAY_METHOD: item.PAY_METHOD,
                    		TXN_DATE: item.TXN_DATE,
                    		RECEIPT_NO: item.RECEIPT_NO,
                    		IN_DEPOSIT_CODE: item.IN_DEPOSIT_CODE,
                    		DEPOSIT_NAME: item.DEPOSIT_NAME,
                    		ACCOUNT_NUM: item.ACCOUNT_NUM,
                    		IN_DEPOSIT_SEQ: item.IN_DEPOSIT_SEQ,
                    		CUSTOMER_BANK_ACCOUNT_NO: item.CUSTOMER_BANK_ACCOUNT_NO,
                    		CUSTOMER_BANK_CODE: item.CUSTOMER_BANK_CODE,
                    		CUSTOMER_BANK_NAME: item.CUSTOMER_BANK_NAME,
                    		CUSTOMER_ACCOUNT_OWNER: item.CUSTOMER_ACCOUNT_OWNER,
                    		CUSTOMER_CS_CODE: item.CUSTOMER_CS_CODE,
                    		CUSTOMER_CS_NAME: item.CUSTOMER_CS_NAME,
                    		NOTE_NO: item.NOTE_NO,
                    		NOTE_ISSUE_DATE: item.NOTE_ISSUE_DATE,
                    		NOTE_DUE_DATE: item.NOTE_DUE_DATE,
                    		NOTE_ISSUER: item.NOTE_ISSUER,
                    		CURRENCY_CODE: item.CURRENCY_CODE,
                    		EXCHANGE_TYPE: item.EXCHANGE_TYPE,
                    		EXCHANGE_RATE: item.EXCHANGE_RATE,
                    		ORIGINAL_RECEIPT_AMOUNT: item.ORIGINAL_RECEIPT_AMOUNT,
                    		FUNCTIONAL_RECEIPT_AMOUNT: item.FUNCTIONAL_RECEIPT_AMOUNT,
                    		ORIGINAL_BANK_CHARGE: item.ORIGINAL_BANK_CHARGE,
                    		FUNCTIONAL_BANK_CHARGE: item.FUNCTIONAL_BANK_CHARGE,
                    		ORIGINAL_AMOUNT: item.ORIGINAL_AMOUNT,
                    		FUNCTIONAL_AMOUNT: item.FUNCTIONAL_AMOUNT,
                    		RECEIPT_TR_TYPE: item.RECEIPT_TR_TYPE,
                    		CONFIRM_FLAG: item.CONFIRM_FLAG,
                    		VOUCHER_NO: item.VOUCHER_NO,
                    		VOUCHER_TYPE: item.VOUCHER_TYPE,
                    		DESCRIPTION: item.DESCRIPTION,
                    		SOURCE_ID: item.SOURCE_ID,
                    		SOURCE_DOC: item.SOURCE_DOC,
                    		APPLY_COMPLETE_FLAG: item.APPLY_COMPLETE_FLAG,
                    		ACCOUNT_CODE: item.ACCOUNT_CODE,
                    		ACCOUNT_NAME: item.ACCOUNT_NAME,
                    		ADVANCE_ACC_CODE: item.ADVANCE_ACC_CODE,
                    		ADVANCE_ACC_NAME: item.ADVANCE_ACC_NAME,
                    		BANK_CHARGE_ACC_CODE: item.BANK_CHARGE_ACC_CODE,
                    		BANK_CHARGE_ACC_NAME: item.BANK_CHARGE_ACC_NAME,
                    		DEPT_CODE: item.DEPT_CODE,
                    		DEPT_NAME: item.DEPT_NAME,
                    		COST_CENTER_CODE: item.COST_CENTER_CODE,
                    		COST_CENTER_NAME: item.COST_CENTER_NAME,
                    		REG_TYPE: item.REG_TYPE,
                    		BASESCALE: item.BASESCALE,
                    		RECEIPT_TYPE: item.RECEIPT_TYPE,
                    }
                    jsonSvg.push(obj);
                });
                
                grdSvg.rebuild();
                
                fn_clearTabpageGrid();
                
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
     * @name fn_clearTabpageGrid
     * @description 탭페이지 그리드 정리
     */
	const fn_clearTabpageGrid = function() {
		jsonFund.length = 0;
		jsonAcntg.length = 0;
		jsonRetra.length = 0;
		
		grdFund.refresh();
		grdAcntg.refresh();
		grdRetra.refresh();
	}
	
	
	/**
     * @name fn_setGrdFund
     * @param {string} _txnId
     * @description 자금실적
     */
    const fn_setGrdFund = async function(_txnId) {
    	 
         const txnDateFrom = SBUxMethod.get('srch-dtp-txnDateFrom');
         const txnDateTo = SBUxMethod.get('srch-dtp-txnDateTo');
         const fiOrgCode = gfn_nvl(gfnma_multiSelectGet("#srch-fiOrgCode"));
         const payMethod = gfn_nvl(SBUxMethod.get('srch-slt-payMethod'));
         const currencyCode = gfn_nvl(gfnma_multiSelectGet("#srch-currencyCode"));
         const receiptNo = gfn_nvl(SBUxMethod.get('srch-inp-receiptNo'));
         const regType = gfn_nvl(SBUxMethod.get('srch-slt-regType'));
         
         const paramObj = {
                 V_P_DEBUG_MODE_YN	: '',
                 V_P_LANG_ID			: '',
                 V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                 V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                 V_P_FI_ORG_CODE 	: fiOrgCode,
                 V_P_TXN_DATE_FROM	: txnDateFrom,
                 V_P_TXN_DATE_TO		: txnDateTo,
                 V_P_RECEIPT_NO		: receiptNo,
                 V_P_CUSTOMER_CS_CODE: '',
                 V_P_CUSTOMER_CS_NAME: '',
                 V_P_IN_CURRENCY_CODE: currencyCode,
                 V_P_BANK_CS_CODE	: '',
                 V_P_IN_DEPOSIT_CODE	: '',
                 V_P_IN_PAY_METHOD	: payMethod,
                 V_P_TXN_ID			: _txnId,
                 V_P_REG_TYPE		: '',
                 
                 V_P_FORM_ID		: p_formId,
                 V_P_MENU_ID		: p_menuId,
                 V_P_PROC_ID		: '',
                 V_P_USERID			: '',
                 V_P_PC				: ''
             };
         	console.log("paramObj", paramObj);
         const postJsonPromiseForList = gfn_postJSON("/fi/ftr/rec/selectTra1020List.do", {
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
     * @param {string} _txnId
     * @description 회계처리
     */
    const fn_setGrdAcntg = async function(_txnId) {
		
         const txnDateFrom = SBUxMethod.get('srch-dtp-txnDateFrom');
         const txnDateTo = SBUxMethod.get('srch-dtp-txnDateTo');
         const fiOrgCode = gfn_nvl(gfnma_multiSelectGet("#srch-fiOrgCode"));
         const payMethod = gfn_nvl(SBUxMethod.get('srch-slt-payMethod'));
         const currencyCode = gfn_nvl(gfnma_multiSelectGet("#srch-currencyCode"));
         const receiptNo = gfn_nvl(SBUxMethod.get('srch-inp-receiptNo'));
         const regType = gfn_nvl(SBUxMethod.get('srch-slt-regType'));
         
         const paramObj = {
                 V_P_DEBUG_MODE_YN	: '',
                 V_P_LANG_ID			: '',
                 V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                 V_P_CLIENT_CODE		: gv_ma_selectedClntCd,
                 V_P_FI_ORG_CODE 	: fiOrgCode,
                 V_P_TXN_DATE_FROM	: txnDateFrom,
                 V_P_TXN_DATE_TO		: txnDateTo,
                 V_P_RECEIPT_NO		: receiptNo,
                 V_P_CUSTOMER_CS_CODE: '',
                 V_P_CUSTOMER_CS_NAME: '',
                 V_P_IN_CURRENCY_CODE: currencyCode,
                 V_P_BANK_CS_CODE	: '',
                 V_P_IN_DEPOSIT_CODE	: '',
                 V_P_IN_PAY_METHOD	: payMethod,
                 V_P_TXN_ID			: _txnId,
                 V_P_REG_TYPE		: '',
                 
                 V_P_FORM_ID		: p_formId,
                 V_P_MENU_ID		: p_menuId,
                 V_P_PROC_ID		: '',
                 V_P_USERID			: '',
                 V_P_PC				: ''
             };
         	console.log("paramObj", paramObj);
         const postJsonPromiseForList = gfn_postJSON("/fi/ftr/rec/selectTra1020List.do", {
             getType			: 'json',
             workType			: 'APPLY',
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
    						UOM: item.UOM,
    						TXN_QTY: item.TXN_QTY,
    						DEPT_NAME: item.DEPT_NAME,
    						DESCRIPTION: item.DESCRIPTION,
    						INVOICE_ID: item.INVOICE_ID,
    						FI_ORG_CODE: item.FI_ORG_CODE,
    						ITEM_DOC_TYPE: item.ITEM_DOC_TYPE,
    						DOC_NAME: item.DOC_NAME,
    						DOC_TYPE: item.DOC_TYPE,
    						DOC_STATUS: item.DOC_STATUS,
    						DOC_ID: item.DOC_ID,
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
     * @name fn_setGrdRetra
     * @param {string} _txnId
     * @description 반제실적
     */
    const fn_setGrdRetra = async function(_txnId) {
    	 const txnDateFrom = SBUxMethod.get('srch-dtp-txnDateFrom');
         const txnDateTo = SBUxMethod.get('srch-dtp-txnDateTo');
         const fiOrgCode = gfn_nvl(gfnma_multiSelectGet("#srch-fiOrgCode"));
         const payMethod = gfn_nvl(SBUxMethod.get('srch-slt-payMethod'));
         const currencyCode = gfn_nvl(gfnma_multiSelectGet("#srch-currencyCode"));
         const receiptNo = gfn_nvl(SBUxMethod.get('srch-inp-receiptNo'));
         const regType = gfn_nvl(SBUxMethod.get('srch-slt-regType'));
         
         const paramObj = {
                 V_P_DEBUG_MODE_YN	: '',
                 V_P_LANG_ID		: '',
                 V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                 V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                 V_P_FI_ORG_CODE 	: fiOrgCode,
                 V_P_TXN_DATE_FROM	: txnDateFrom,
                 V_P_TXN_DATE_TO	: txnDateTo,
                 V_P_RECEIPT_NO		: receiptNo,
                 V_P_CUSTOMER_CS_CODE: '',
                 V_P_CUSTOMER_CS_NAME: '',
                 V_P_IN_CURRENCY_CODE: currencyCode,
                 V_P_BANK_CS_CODE	: '',
                 V_P_IN_DEPOSIT_CODE	: '',
                 V_P_IN_PAY_METHOD	: payMethod,
                 V_P_TXN_ID			: _txnId,
                 V_P_REG_TYPE		: '',
                 
                 V_P_FORM_ID		: p_formId,
                 V_P_MENU_ID		: p_menuId,
                 V_P_PROC_ID		: '',
                 V_P_USERID			: '',
                 V_P_PC				: ''
			};
         
		console.log("paramObj", paramObj);
		
        const postJsonPromiseForList = gfn_postJSON("/fi/ftr/rec/selectTra1020List.do", {
             getType			: 'json',
             workType			: 'ACCOUNT',
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
	              		 TXN_ID: item.TXN_ID,
	                   	 APPLY_NO: item.APPLY_NO,
	                   	 RECEIPT_NO: item.RECEIPT_NO,
	                   	 APPLY_DATE: item.APPLY_DATE,
	                   	 FI_ORG_CODE: item.FI_ORG_CODE,
	                   	 APPLY_TYPE: item.APPLY_TYPE,
	                   	 INVOICE_ID: item.INVOICE_ID,
	                   	 INVOICE_BATCH_NO: item.INVOICE_BATCH_NO,
	                   	 INVOICE_LINE_NUM: item.INVOICE_LINE_NUM,
	                   	 CURRENCY_CODE: item.CURRENCY_CODE,
	                   	 EXCHANGE_TYPE: item.EXCHANGE_TYPE,
	                   	 EXCHANGE_RATE: item.EXCHANGE_RATE,
	                   	 ORIGINAL_AMOUNT: item.ORIGINAL_AMOUNT,
	                   	 FUNCTIONAL_AMOUNT: item.FUNCTIONAL_AMOUNT,
	                   	 CONFIRM_FLAG: item.CONFIRM_FLAG,
	                   	 VOUCHER_NO: item.VOUCHER_NO,
	                   	 VOUCHER_TYPE: item.VOUCHER_TYPE,
	                   	 DESCRIPTION: item.DESCRIPTION,
	                   	 SOURCE_ID: item.SOURCE_ID,
	                   	 SOURCE_DOC: item.SOURCE_DOC,
	                   	 APPLY_BATCH_NO: item.APPLY_BATCH_NO,
	                   	 APPLY_LINE_NUM: item.APPLY_LINE_NUM,
	                   	 APPLY_LINE_NO: item.APPLY_LINE_NO,
	                   	 APPLY_COMPLETE_FLAG: item.APPLY_COMPLETE_FLAG,
	                   	 DOC_ID: item.DOC_ID,
	                   	 DOC_NAME: item.DOC_NAME,
	                   	 DOC_TYPE: item.DOC_TYPE,
	                   	 DOC_STATUS: item.DOC_STATUS,
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
	}

    /**
     * @name fn_save
     * @description 저장 버튼
     */
	const fn_save = async function() {

        const fiOrgCode = gfn_nvl(gfnma_multiSelectGet("#srch-fiOrgCode"));
        const payMethod = gfn_nvl(SBUxMethod.get('srch-slt-payMethod'));
        const currencyCode = gfn_nvl(gfnma_multiSelectGet("#srch-currencyCode"));
        const receiptNo = gfn_nvl(SBUxMethod.get('srch-inp-receiptNo'));
        const regType = gfn_nvl(SBUxMethod.get('srch-slt-regType'));
 		
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
                	V_P_COMP_CODE: gfn_nvl(item.data.COMP_CODE, gv_ma_selectedCorpCd),
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

	
    // 행 추가
    const fn_addRowSvg = function() {
    	
        const rowIndex = grdSvg.getRow();

        if (rowIndex < 0){ 			// 데이터가 없고 행선택이 없을경우.
        	grdSvg.addRow(true);
        } else {
        	grdSvg.insertRow(rowIndex);
        }
    }

    // 행삭제
    const fn_delRowSvg = async function() {

    	const rowIndex = grdSvg.getRow();
    	
    	if (rowIndex < 1) {
    		gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
			return;
    	}
    	
		const rowStatus = grdSvg.getRowStatus(rowIndex);
		if (rowStatus == 0 || rowStatus == 2) {
			if (!gfn_comConfirm("Q0002", "등록정보", "삭제")) {	// Q0002	{0}이/가 있습니다. {1} 하시겠습니까?
				return;
			}
			
			grdSvg.setRowStatus(rowIndex, 'd');
			
    	} else {
    		grdSvg.deleteRow(rowIndex);
    	}

    }
	
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
