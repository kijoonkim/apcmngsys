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
					uitype="normal"
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
 
 
	const srchElements = [
		{"id": "srch-slt-payMethod", "default": ""},
		{"id": "srch-inp-payerCode", "default": ""},
		{"id": "srch-inp-payerName", "default": ""},
		{"id": "srch-inp-costCenterCode", "default": ""},
		{"id": "srch-inp-costCenterName", "default": ""},
		{"id": "srch-inp-receiptNo", "default": ""},
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
		jsonRetra.length = 0;
		jsonFund.length = 0;
		jsonAcntg.length = 0;
 
    	let nowDate = new Date();
		let firstYmd = gfn_dateFirstYmd(nowDate);
		let lastYmd = gfn_dateToYmd(nowDate);

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
				gfnma_setComSelect(['srch-slt-payMethod'], jsonPayMethod, 'L_FBS029', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
				// 등록구분
				//gfnma_setComSelect(['srch-slt-svgMethod'], jsonSvgMethod, 'L_FIF015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
				//gfnma_setComSelect(['srch-slt-regType'], jsonRegType, 'L_FBS017', "AND COMP_CODE = '" + gv_ma_selectedCorpCd + "'", gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
				gfnma_setComSelect(['srch-slt-regType'], jsonRegType, 'L_FBS017', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),

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
	         	// 상태코드
	            gfnma_setComSelect(['grdFund'], jsonStatusCode, 'L_FIM074', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	         	// LINE
	            gfnma_setComSelect(['grdAcntg'], jsonLineType, 'L_FIM052', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	         	// 차/대
	            gfnma_setComSelect(['grdAcntg'], jsonDebitCredit, 'L_FIG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	         	// 원가중심점코드
	            gfnma_setComSelect(['grdAcntg'], jsonCostCenterCode, 'L_CC_INPUT', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CSTCD_CD', 'CSTCD_NM', 'Y', ''),
	         	// 증빙유형
	            gfnma_setComSelect(['grdAcntg'], jsonVoucherType, 'L_FIG005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
	            
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
            	ref : 'TRSC_DT',      
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
            	ref : 'CRN_CD', 
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
            	caption : ['입금액'],          
            	ref : 'ORGNL_RCPT_AMT',
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
            	ref : 'ORGNL_BANK_CRG',
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
            	ref : 'CNVS_BANK_CRG',
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
            	ref : 'PAY_MTHD', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo',
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
            	ref: 'DPST_SVG_CD',		
            	type:'input',  	
            	width:'100px',  	
            	style:'text-align:left',
            },
            {
            	caption : ["입금은행"],
            	ref : 'CUST_BANK_CD', 
            	width : '100px', 
            	style : 'text-align:center', 
            	type : 'combo',
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
            	ref: 'CUST_BACNT_NO',		
            	type:'input',  	
            	width:'150px',  	
            	style:'text-align:left',
            },
            {
            	caption : ['환율'],
            	ref : 'EXCHRT',
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
            	ref: 'DSCTN',		
            	type:'input',  	
            	width:'150px',  	
            	style:'text-align:left',
            },
            {	
            	caption : ["등록구분"],				
            	ref: 'REG_TYPE', 
            	width : '100px', 
            	style : 'text-align:center', 
            	type : 'combo',
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
				await fn_setGrdFund(_svg.TRSC_ID);
				break;
			case "tp-acntg":
				await fn_setGrdAcntg(_svg.TRSC_ID);
				break;
			case "tp-retra":
				await fn_setGrdRetra(_svg.TRSC_ID);
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
            	ref: 'FUND_ID',		
            	type:'output',  	
            	width:'80px',  	
            	style:'text-align:right',  
            },
            {
            	caption : ["자금배치번호"],				
            	ref: 'FUND_BTCH_NO',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',
            },
            {
            	caption : ["순번"],				
            	ref: 'FUND_LINE_NO',		
            	type:'output',  	
            	width:'80px',  	
            	style:'text-align:right',  
            },
            {
            	caption: ["지급일"], 
            	ref: 'PAY_YMD', 
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
            	ref: 'PLAN_PAY_YMD', 
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
            	ref: 'TRSC_GROUP_CD',   	    
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
            	ref: 'SLIP_TYPE',   	    
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
            	ref: 'SLIP_NM',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',
            },
            {
            	caption: ["전표상태"],
            	ref: 'SLIP_STTS',
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
            	ref : 'CRN_CD', 
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
            	ref : 'EXCHRT',
            	datatype: 'number',
            	width : '50px',
            	style : 'text-align:right',
            	type : 'output',
                format : {type:'number', rule:'0,000.00'}
            },
            {
            	caption : ["환산유형"],
            	ref : 'EXCHRT_TYPE', 
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
            	ref : 'ORGNL_AMT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'output',
            	format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption : ['전표금액'],          
            	ref : 'CNVS_AMT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'input',
            	format : {type:'number', rule:'#,###'}
            },
            {
            	caption : ["은행"],
            	ref : 'BANK_CNPT_CD', 
            	width : '100px', 
            	style : 'text-align:center', 
            	type : 'combo',
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
            	ref: 'PMPL_ID',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',
            },
            {
            	caption : ["계좌번호"],				
            	ref: 'ACTNO',		
            	type:'input',  	
            	width:'150px',  	
            	style:'text-align:left', 
            },
            {
            	caption : ["지급방법"],
            	ref : 'PAY_MTHD', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo',
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
            	ref: 'STTS_CD', 		        
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
            	ref: 'SLIP_TYPE',   	    
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
            	ref: 'SLIP_NM',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',
            },
            {
            	caption: ["전표상태"],
            	ref: 'SLIP_STTS',
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
            	ref: 'DBSD_CRSD', 			
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
            	ref: 'ACNTL_CD',       
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left'
            },  
            {
            	caption: ["계정과목명"], 	    
            	ref: 'ACNT_NM',       
            	type:'output',  	
            	width:'200px',  	
            	style:'text-align:left'
            },
            {
            	caption: ["차변(통화)"],        
            	ref: 'ORGNL_DRSD_AMT',    
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
            	ref: 'ORGNL_CRSD_AMT',    
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
            	ref: 'CNVS_DRSD_AMT',    
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
            	ref: 'CNVS_CRSD_AMT',    
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
            	ref: 'DEPT_NM',    	        
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left'
            },
            {
            	caption: ["원가중심점"],           
            	ref: 'CSTCD_CD', 		        
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
            	ref: 'DSCTN',    	        
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
            	ref: 'SLIP_TYPE',   	    
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
            	ref: 'SLIP_NM',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',
            },
            {
            	caption: ["전표상태"],
            	ref: 'SLIP_STTS',
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
            	ref: 'REVE_NO',		
            	type:'output',  	
            	width:'100px',  	
            	style:'text-align:left',
            },
            {
            	caption: ["반제일"], 
            	ref: 'APLY_YMD', 
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
            	ref: 'APLY_TYPE',   	    
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
            	ref: 'SLIP_ID',    	        
            	type:'output',  	
            	width:'75px',  	
            	style:'text-align:left'
            },
            {
            	caption: ["라인번호"], 	        
            	ref: 'SLIP_LINE_NO',    	        
            	type:'output',  	
            	width:'66px',  	
            	style:'text-align:left'
			},
			{
            	caption : ["통화"],
            	ref : 'CRN_CD', 
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
            	caption : ["환율유형"],
            	ref : 'EXCHRT_TYPE', 
            	width : '150px', 
            	style : 'text-align:center', 
            	type : 'combo',
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
            	ref : 'EXCHRT',
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
            	ref : 'ORGNL_AMT',
            	datatype: 'number',
            	width : '100px',   
            	style : 'text-align:right',    
            	type : 'output',
            	format : {type:'number', rule:'#,###.##'}
            },
            {
            	caption : ['전표금액'],          
            	ref : 'CNVS_AMT',
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
            },
            {
            	caption: ["증빙유형"],
            	ref: 'EVDNC_TYPE',
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
            	ref: 'EVDNC_NO',    
            	type:'output',  	
            	width:'207px',  
            	style:'text-align:left'
            },
            {
            	caption: ['확정'],         
            	ref: 'CFMTN_FLAG',				
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
            	ref: 'DSCTN',			            
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
					/*
                    const obj = {
                    		CHECK_YN: item.CHECK_YN,
                    		TXN_ID: item.TRSC_ID,
                    		FI_ORG_CODE: item.ACNTG_OGNZ_CD,
                    		PAY_METHOD: item.PAY_MTHD,
                    		TXN_DATE: item.TRSC_DT,
                    		RECEIPT_NO: item.RCPT_NO,
                    		IN_DEPOSIT_CODE: item.DPST_SVG_CD,
                    		DEPOSIT_NAME: item.DPMNY_NM,
                    		ACCOUNT_NUM: item.ACTNO,
                    		IN_DEPOSIT_SEQ: item.DPST_SVG_SEQ,
                    		CUSTOMER_BANK_ACCOUNT_NO: item.CUST_BACNT_NO,
                    		CUSTOMER_BANK_CODE: item.CUST_BANK_CD,
                    		CUSTOMER_BANK_NAME: item.CUSTOMER_BANK_NAME,
                    		CUSTOMER_ACCOUNT_OWNER: item.CUST_BACNT_OWNR,
                    		CUSTOMER_CS_CODE: item.CUST_CNPT_CD,
                    		CUSTOMER_CS_NAME: item.CUSTOMER_CS_NAME,
                    		NOTE_NO: item.PRMNT_NO,
                    		NOTE_ISSUE_DATE: item.PRMNT_ISSU_YMD,
                    		NOTE_DUE_DATE: item.PRMNT_MTRY_YMD,
                    		NOTE_ISSUER: item.PRMNT_ISR,
                    		CURRENCY_CODE: item.CRN_CD,
                    		EXCHANGE_TYPE: item.EXCHRT_TYPE,
                    		EXCHANGE_RATE: item.EXCHRT,
                    		ORIGINAL_RECEIPT_AMOUNT: item.ORGNL_RCPT_AMT,
                    		FUNCTIONAL_RECEIPT_AMOUNT: item.CNVS_RCPT_AMT,
                    		ORIGINAL_BANK_CHARGE: item.ORGNL_BANK_CRG,
                    		FUNCTIONAL_BANK_CHARGE: item.CNVS_BANK_CRG,
                    		ORIGINAL_AMOUNT: item.ORGNL_AMT,
                    		FUNCTIONAL_AMOUNT: item.CNVS_AMT,
                    		RECEIPT_TR_TYPE: item.RCPT_FUND_TYPE,
                    		CONFIRM_FLAG: item.CFMTN_FLAG,
                    		VOUCHER_NO: item.EVDNC_NO,
                    		VOUCHER_TYPE: item.EVDNC_TYPE,
                    		DESCRIPTION: item.DSCTN,
                    		SOURCE_ID: item.SRC_ID,
                    		SOURCE_DOC: item.SRC_DOC,
                    		APPLY_COMPLETE_FLAG: item.REVE_CMPTN_FLAG,
                    		ACCOUNT_CODE: item.ACNTL_CD,
                    		ACCOUNT_NAME: item.ACNT_NM,
                    		ADVANCE_ACC_CODE: item.ADPYR_ACNTL_CD,
                    		ADVANCE_ACC_NAME: item.ADVANCE_ACC_NAME,
                    		BANK_CHARGE_ACC_CODE: item.BANK_CRG_ACNT_CD,
                    		BANK_CHARGE_ACC_NAME: item.BANK_CHARGE_ACC_NAME,
                    		DEPT_CODE: item.DEPT_CD,
                    		DEPT_NAME: item.DEPT_NM,
                    		COST_CENTER_CODE: item.CSTCD_CD,
                    		COST_CENTER_NAME: item.CSTCD_NM,
                    		REG_TYPE: item.REG_TYPE,
                    		BASESCALE: item.BASESCALE,
                    		RECEIPT_TYPE: item.RCPT_TYPE,
                    }
                    jsonSvg.push(obj);
					 */
					jsonSvg.push(item);
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
					/*
                     const obj = {
                   		 TREASURY_ID: item.FUND_ID,
                   		 TREASURY_BATCH_NO: item.FUND_BTCH_NO,
                   		 TREASURY_LINE_NUM: item.FUND_LINE_NO,
                   		 TXN_GROUP_CODE: item.TRSC_GROUP_CD,
                   		 PAYER_ID: item.PMPL_ID,
                   		 DOC_TYPE: item.SLIP_TYPE,
                   		 DOC_ID: item.SLIP_ID,
                   		 DOC_NAME: item.SLIP_NM,
                   		 DOC_STATUS: item.SLIP_STTS,
                   		 PLANNED_PAY_DATE: item.PLAN_PAY_YMD,
                   		 PAY_DATE: item.PAY_YMD,
                   		 PAY_METHOD: item.PAY_MTHD,
                   		 STATUS_CODE: item.STTS_CD,
                   		 BANK_CS_CODE: item.BANK_CNPT_CD,
                   		 ACCOUNT_NUM: item.ACTNO,
                   		 CURRENCY_CODE: item.CRN_CD,
                   		 EXCHANGE_TYPE: item.EXCHRT_TYPE,
                   		 EXCHANGE_RATE: item.EXCHRT,
                   		 ORIGINAL_AMOUNT: item.ORGNL_AMT,
                   		 FUNCTIONAL_AMOUNT: item.CNVS_AMT,
                   		 ACCT_RULE_CODE: item.GAAP_CD,
                     }
                     jsonFund.push(obj);
					 */
					 jsonFund.push(item);
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
					/*
                     const obj = {
    						KEY_ID: item.KEY_ID,
    						ITEM_ID: item.ITEM_ID,
    						ITEM_SEQ: item.ITEM_SEQ,
    						LINE_TYPE: item.LINE_TYPE,
    						DEBIT_CREDIT: item.DBSD_CRSD,
    						VAT_TYPE: item.VAT_TYPE,
    						VAT_NAME: item.VAT_NM,
    						DEPT_CODE: item.DEPT_CD,
    						COST_CENTER_CODE: item.CSTCD_CD,
    						PROJECT_CODE: item.PJT_CD,
    						ORIGINAL_CR_AMT: item.ORGNL_CRSD_AMT,
    						ORIGINAL_DR_AMT: item.ORGNL_DRSD_AMT,
    						FUNCTIONAL_CR_AMT: item.CNVS_CRSD_AMT,
    						FUNCTIONAL_DR_AMT: item.CNVS_DRSD_AMT,
    						TXN_QTY: item.TRSC_QTY,
    						ACCOUNT_CODE: item.ACNTL_CD,
    						ACCOUNT_NAME: item.ACNT_NM,
    						ACC_ITEM_CODE1: item.ACNT_MNG_ARTCL_CD1,
    						ACC_ITEM_CODE2: item.ACNT_MNG_ARTCL_CD2,
    						ACC_ITEM_CODE3: item.ACNT_MNG_ARTCL_CD3,
    						ACC_ITEM_CODE4: item.ACNT_MNG_ARTCL_CD4,
    						ACC_ITEM_CODE5: item.ACNT_MNG_ARTCL_CD5,
    						ACC_ITEM_CODE6: item.ACNT_MNG_ARTCL_CD6,
    						ACC_ITEM_CODE7: item.ACNT_MNG_ARTCL_CD7,
    						ACC_ITEM_CODE8: item.ACNT_MNG_ARTCL_CD8,
    						ACC_ITEM_CODE9: item.ACNT_MNG_ARTCL_CD9,
    						ACC_ITEM_CODE10: item.ACNT_MNG_ARTCL_CD10,
    						ACC_ITEM_NAME1: item.ACNT_MNG_ARTCL_NM1,
    						ACC_ITEM_NAME2: item.ACNT_MNG_ARTCL_NM2,
    						ACC_ITEM_NAME3: item.ACNT_MNG_ARTCL_NM3,
    						ACC_ITEM_NAME4: item.ACNT_MNG_ARTCL_NM4,
    						ACC_ITEM_NAME5: item.ACNT_MNG_ARTCL_NM5,
    						ACC_ITEM_NAME6: item.ACNT_MNG_ARTCL_NM6,
    						ACC_ITEM_NAME7: item.ACNT_MNG_ARTCL_NM7,
    						ACC_ITEM_NAME8: item.ACNT_MNG_ARTCL_NM8,
    						ACC_ITEM_NAME9: item.ACNT_MNG_ARTCL_NM9,
    						ACC_ITEM_NAME10: item.ACNT_MNG_ARTCL_NM10,
    						ACC_ITEM_YN1: item.ACNT_MNG_ARTCL_YN1,
    						ACC_ITEM_YN2: item.ACNT_MNG_ARTCL_YN2,
    						ACC_ITEM_YN3: item.ACNT_MNG_ARTCL_YN3,
    						ACC_ITEM_YN4: item.ACNT_MNG_ARTCL_YN4,
    						ACC_ITEM_YN5: item.ACNT_MNG_ARTCL_YN5,
    						ACC_ITEM_YN6: item.ACNT_MNG_ARTCL_YN6,
    						ACC_ITEM_YN7: item.ACNT_MNG_ARTCL_YN7,
    						ACC_ITEM_YN8: item.ACNT_MNG_ARTCL_YN8,
    						ACC_ITEM_YN9: item.ACNT_MNG_ARTCL_YN9,
    						ACC_ITEM_YN10: item.ACNT_MNG_ARTCL_YN10,
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
    						ACC_CHARACTER: item.INCPL_TYPE,
    						ACC_ITEM_VALUE1: item.ACNT_MNG_ARTCL_VL1,
    						ACC_ITEM_VALUE2: item.ACNT_MNG_ARTCL_VL2,
    						ACC_ITEM_VALUE3: item.ACNT_MNG_ARTCL_VL3,
    						ACC_ITEM_VALUE4: item.ACNT_MNG_ARTCL_VL4,
    						ACC_ITEM_VALUE5: item.ACNT_MNG_ARTCL_VL5,
    						ACC_ITEM_VALUE6: item.ACNT_MNG_ARTCL_VL6,
    						ACC_ITEM_VALUE7: item.ACNT_MNG_ARTCL_VL7,
    						ACC_ITEM_VALUE8: item.ACNT_MNG_ARTCL_VL8,
    						ACC_ITEM_VALUE9: item.ACNT_MNG_ARTCL_VL9,
    						ACC_ITEM_VALUE10: item.ACNT_MNG_ARTCL_VL10,
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
    						ITEM_CODE: item.ITEM_CD,
    						UOM: item.UNIT,
    						TXN_QTY: item.TRSC_QTY,
    						DEPT_NAME: item.DEPT_NM,
    						DESCRIPTION: item.DSCTN,
    						INVOICE_ID: item.SLIP_ID,
    						FI_ORG_CODE: item.ACNTG_OGNZ_CD,
    						ITEM_DOC_TYPE: item.ITEM_DOC_TYPE,
    						DOC_NAME: item.SLIP_NM,
    						DOC_TYPE: item.SLIP_TYPE,
    						DOC_STATUS: item.SLIP_STTS,
    						DOC_ID: item.SLIP_ID,
                     }
                     jsonAcntg.push(obj);

					 */
					jsonAcntg.push(item);
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
					/*
					const obj = {
	              		 TXN_ID: item.TRSC_ID,
	                   	 APPLY_NO: item.REVE_NO,
	                   	 RECEIPT_NO: item.RCPT_NO,
	                   	 APPLY_DATE: item.APLY_YMD,
	                   	 FI_ORG_CODE: item.ACNTG_OGNZ_CD,
	                   	 APPLY_TYPE: item.APLY_TYPE,
	                   	 INVOICE_ID: item.SLIP_ID,
	                   	 INVOICE_BATCH_NO: item.SLIP_BTCH_NO,
	                   	 INVOICE_LINE_NUM: item.SLIP_LINE_NO,
	                   	 CURRENCY_CODE: item.CRN_CD,
	                   	 EXCHANGE_TYPE: item.EXCHRT_TYPE,
	                   	 EXCHANGE_RATE: item.EXCHRT,
	                   	 ORIGINAL_AMOUNT: item.ORGNL_AMT,
	                   	 FUNCTIONAL_AMOUNT: item.CNVS_AMT,
	                   	 CONFIRM_FLAG: item.CFMTN_FLAG,
	                   	 VOUCHER_NO: item.EVDNC_NO,
	                   	 VOUCHER_TYPE: item.EVDNC_TYPE,
	                   	 DESCRIPTION: item.DSCTN,
	                   	 SOURCE_ID: item.SRC_ID,
	                   	 SOURCE_DOC: item.SRC_DOC,
	                   	 APPLY_BATCH_NO: item.REVE_BATCH_NO,
	                   	 APPLY_LINE_NUM: item.APLY_LINE_ID,
	                   	 APPLY_LINE_NO: item.APLY_LINE_NO,
	                   	 APPLY_COMPLETE_FLAG: item.REVE_CMPTN_FLAG,
	                   	 DOC_ID: item.SLIP_ID,
	                   	 DOC_NAME: item.SLIP_NM,
	                   	 DOC_TYPE: item.SLIP_TYPE,
	                   	 DOC_STATUS: item.SLIP_STTS,
					}
					
					jsonRetra.push(obj);

					 */
					jsonRetra.push(item);
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
