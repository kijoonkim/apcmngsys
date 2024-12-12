<%
/**
 * @Class Name 		: fig2310_99.jsp
 * @Description 	: 미결잔액조회 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.09.20
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.09.20   	장성주		최초 생성
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
	<title>title : 미결잔액조회 </title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 미결잔액조회  -->
                </div>
                <div>
                </div>
            </div>
            <div class="box-body">

				<div class="box-search-ma" >
	                <!--[pp] 검색 -->
					<!--[APC] START -->
						<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
					<!--[APC] END -->
	                <table id="srchArea1" class="table table-bordered tbl_fixed table-search-ma">
	                    <caption>검색 조건 설정</caption>
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
	                    
                           	<!-- hidden  -->
                       		<sbux-select id="SCH_SITE_CODE" 			name="SCH_SITE_CODE" 			jsondata-ref="jsonSiteCode" 	style="display:none;" uitype="single" 	unselected-text="선택" class="form-control input-sm"></sbux-select>
  							<sbux-input  id="SCH_TXTDEPT_CODE"  		name="SCH_TXTDEPT_CODE" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="SCH_TXTDEPT_NAME"  		name="SCH_TXTDEPT_NAME" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="SCH_TXTOPEN_TO_FCM_YN"  	name="SCH_TXTOPEN_TO_FCM_YN" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<!-- /hidden -->
                       		
	                    	<tr>
	                            <th scope="row" class="th_bg_search">APC</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">통화</th>
	                            <td colspan="4" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			                            <sbux-select style="width:120px" onchange="fn_currencyCodeChange(SCH_CURRENCY_CODE)" id="SCH_CURRENCY_CODE" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed"
											group-id="schHeader" 
											required                                       
			                            ></sbux-select>
					                    <font style="width:5px"></font>
	   									<sbux-input style="width:80px" id="SCH_EXCHANGE_RATE" uitype="text" class="form-control input-sm"></sbux-input>
					                    <font style="width:5px"></font>
					                    <span style="padding-top:5px">
			                       			<sbux-checkbox id="SCH_CHKSPOT_YN" uitype="normal" text="스팟환율" true-value="Y" false-value="N" ></sbux-checkbox>
					                    </span>
	                            	</div>
	                            </td>
	                            
	                            <th scope="row" class="th_bg_search">기준일자</th>
	                            <td colspan="3" class="td_input" >
								    <sbux-datepicker
							            id="SCH_ENTRY_DATE_TO"
							            uitype="popup"
							            date-format="yyyy-mm-dd"
							            class="form-control input-sm input-sm-ast table-datepicker-ma inpt_data_reqed"
										group-id="schHeader" 
										required                                       
								    >
								    </sbux-datepicker>                            
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">회계기준</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed"
										group-id="schHeader" 
										required                                       
		                            ></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                        </tr>
	                        
	                    	<tr>
	                            <th scope="row" class="th_bg_search">미결관리대상</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_ACC_CHARACTER" uitype="single" jsondata-ref="jsonAccCharacter" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                    	
	                            <th scope="row" class="th_bg_search">특수관계자여부</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_RELATED_YN" uitype="single" jsondata-ref="jsonRelatedYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">특수관계자유형</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_RELATED_CS_TYPE" uitype="single" jsondata-ref="jsonRelatedCsType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <td colspan="5" class="td_input" >
	                            </td>
	                            
	                    	</tr>	  
								                            
	                        <tr>    
	                        
	                            <th scope="row" class="th_bg_search">계정과목</th>
	                            <td colspan="19" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px" id="SCH_ACCOUNT_CODE_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup1('1')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px"  id="SCH_ACCOUNT_NAME_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
					                    <font>~</font>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:100px"  id="SCH_ACCOUNT_CODE_TO" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup1('2')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px" id="SCH_ACCOUNT_NAME_TO" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:10px"></font>
	   									<span style="padding-top:7px">
			                       			<sbux-checkbox 
			                       				id="SCH_MULTI_YN" 
			                       				uitype="normal" 
			                       				text="복수선택" 
			                       				true-value="Y" 
			                       				false-value="N" ></sbux-checkbox>
	   									</span>
	   									<font style="width:10px"></font>
										<sbux-button
											id="BTN_MULTI_YN"
											class="btn btn-xs btn-outline-dark"
											text="복수계정" 
											onclick="fn_multiYn()"></sbux-button>
									</div>
	                            </td>
	                    	</tr>
	                    	
	                    	<tr>
	                    	
	                            <th scope="row" class="th_bg_search">거래처</th>
	                            <td colspan="19" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px"  id="SCH_CS_CODE_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup2('1')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px"  id="SCH_CS_NAME_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
					                    <font>~</font>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:100px"  id="SCH_CS_CODE_TO" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup2('2')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px"  id="SCH_CS_NAME_TO" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:10px"></font>
	   									<span style="padding-top:7px">
			                       			<sbux-checkbox 
			                       				id="SCH_MULTI_CS_YN" 
			                       				uitype="normal" 
			                       				text="복수선택" 
			                       				true-value="Y" 
			                       				false-value="N" ></sbux-checkbox>
	   									</span>
	   									<font style="width:10px"></font>
										<sbux-button
											id="BTN_MULTI_CS_YN"
											class="btn btn-xs btn-outline-dark"
											text="복수거래처" 
											onclick="fn_multiCsYn()"></sbux-button>
									</div>
	                            </td>
	                    	</tr>
	                    	
	                    </tbody>
	                </table>				
				</div>
                
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>미결항목</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
                        </li>
                    </ul>
                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
					</div>
                </div>
				
				<div id="sb-area-grdTop" class="card" style="width:100%;height:450px;border:1px solid #f4f4f4;">
				</div>
                
            </div>
        </div>
    </section>
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:700px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup3">
    	<jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
    </div>
    
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';

	var p_ss_issAccountChief	= '${loginVO.maIsAccountChief}';
	var p_ss_isAccountManager	= '${loginVO.maIsAccountManager}';
	var p_ss_deptCode			= '${loginVO.maDeptCode}';
	var p_ss_deptName			= '${loginVO.maDeptName}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	
	//grid 초기화
	var Fig4195Grid; 				// 그리드를 담기위한 객체 선언
	var jsonFig4195 		= []; 	// 그리드의 참조 데이터 주소 선언

	var jsonTempList 		= [];	// 저장할 임시 저장소

	var jsonFiOrgCode 		= []; 	// APC
	var jsonCurrencyCode 	= []; 	// 통화
	var jsonAcctRuleCode 	= []; 	// 회계기준
	var jsonAccCharacter 	= []; 	// 미결관리대상
	var jsonRelatedYn 		= []; 	// 특수관계자여부
	var jsonRelatedCsType	= []; 	// 특수관계자유형
	var jsonSiteCode 		= []; 	// 

	var pp_strAccountCodeList	= ""; // 복수계정 파라미터
	var pp_strCsCodeList		= ""; // 복수거래처 파라미터
	
    var p_sel_row 				= '';
    var p_sel_col 				= '';
    
    var p_strAccountCodeList	= '';	//복수계정
    var p_strCsCodeList	= '';	//복수거래처
	
    var p_menu_param			= null;
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],			jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            gfnma_setComSelect(['SCH_SITE_CODE'],			jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['SCH_CURRENCY_CODE'],		jsonCurrencyCode, 	'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE'],		jsonAcctRuleCode, 	'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 미결관리대상
            gfnma_setComSelect(['SCH_ACC_CHARACTER'],		jsonAccCharacter, 	'L_FIM033_01', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 특수관계자여부
            gfnma_setComSelect(['SCH_RELATED_YN'],			jsonRelatedYn, 	  	'L_COM036', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 특수관계자유형
            gfnma_setComSelect(['SCH_RELATED_CS_TYPE'],		jsonRelatedCsType, 	'L_COM047', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state();
  	    fn_createFig4195();	
	}    
    
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	
    	p_menu_param = localStorage.getItem("callMain");
    	if(p_menu_param){
    		p_menu_param = JSON.parse(p_menu_param);
    	}
    	localStorage.removeItem("callMain");
    	
    	fn_init();
    	
		$('#btn1-row-add').click(function(e){
			e.preventDefault();
			fn_gridRowAdd();
		});
		$('#btn1-row-del').click(function(e){
			e.preventDefault();
			fn_gridRowDel();
		}); 
    });

    /**
     * 화면 state 변경
     */
    function fn_state() {
    	
		SBUxMethod.set("SCH_CHKSPOT_YN",		'N');
		SBUxMethod.hide("SCH_CHKSPOT_YN");
		SBUxMethod.attr('SCH_EXCHANGE_RATE',	'disabled', true);
		SBUxMethod.set("SCH_MULTI_CS_YN",		'N');
		SBUxMethod.set("BTN_MULTI_YN",			'N');
    	
    	if(p_menu_param){
    		if(p_menu_param['FI_ORG_CODE']){
    			SBUxMethod.set("SCH_FI_ORG_CODE", 		p_menu_param['FI_ORG_CODE']);
    		}
    		if(p_menu_param['ACCT_RULE_CODE']){
    			SBUxMethod.set("SCH_ACCT_RULE_CODE", 	p_menu_param['ACCT_RULE_CODE']);
    		}
			SBUxMethod.set("SCH_TXTDEPT_CODE",			p_ss_deptCode);
			SBUxMethod.set("SCH_TXTDEPT_NAME", 			p_ss_deptName);
    	} else {
			SBUxMethod.set("SCH_FI_ORG_CODE",		 	p_ss_fiOrgCode);
			SBUxMethod.set("SCH_TXTDEPT_CODE",			p_ss_deptCode);
			SBUxMethod.set("SCH_TXTDEPT_NAME", 			p_ss_deptName);
    	}
    	
    	if(p_ss_issAccountChief || p_ss_isAccountManager){
			SBUxMethod.set("SCH_TXTOPEN_TO_FCM_YN",		'N');
			SBUxMethod.show("SCH_CHKSPOT_YN");
    		SBUxMethod.attr('SCH_EXCHANGE_RATE', 		'disabled', false);
    	} else {
			SBUxMethod.set("SCH_TXTOPEN_TO_FCM_YN",		'Y');
			SBUxMethod.hide("SCH_CHKSPOT_YN");
    		SBUxMethod.attr('SCH_EXCHANGE_RATE', 		'disabled', true);
    	}
    }
    
    function fn_createFig4195() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTop';
	    SBGridProperties.id 				= 'Fig4195Grid';
	    SBGridProperties.jsonref 			= 'jsonFig4195';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["전표유형"],					ref: 'DOC_TYPE_NAME',			type:'output',  	width:'150px',  	style:'text-align:left'},
            
            //{caption: ["전표번호"],					ref: 'DOC_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ['전표번호'], 				ref: 'link',    				type:'button',  	width:'100px', 		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['DOC_ID']){
		        		return "<a style='text-decoration: underline;cursor:pointer;color:#149fff' href='#' onClick='fn_gridPopup1(event, " + objRowData['DOC_ID'] + ")'>" + objRowData['DOC_NAME'] + "</a>";
            		} else {
            			return "";
            		}
            	}	
            },
            
            {caption: ["전기일자"],  				ref: 'DOC_DATE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["계정명"],  					ref: 'ACCOUNT_NAME', 			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["부서명"],  					ref: 'DEPT_NAME', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["원가중심코드"], 			ref: 'COST_CENTER_CODE', 		type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["원가중심명"], 				ref: 'COST_CENTER_NAME', 		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["거래처코드"], 				ref: 'CS_CODE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["거래처명"], 				ref: 'CS_NAME', 				type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["통화"], 					ref: 'CURRENCY_CODE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"], 					ref: 'EXCHANGE_RATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["차대"], 					ref: 'DEBIT_CREDIT_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순금액(잔액-통화)"], 		ref: 'REMAIN_ORIGINAL_AMOUNT_RAW', 			type:'output',		width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["반제금액(통화)"], 			ref: 'REMAIN_ORIGINAL_AMOUNT_RAW', 			type:'output',		width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["적요"], 					ref: 'DOC_DESC',    			type:'output',  	width:'300px',  		style:'text-align:left'},
            {caption: ["상태"], 					ref: 'DOC_STATUS_NAME', 		type:'output',  	width:'100px',  		style:'text-align:left'},
        ];

        Fig4195Grid = _SBGrid.create(SBGridProperties);
        //Fig4195Grid.bind('click', 'fn_popViewFig4195GridEvent');
    }	

    /**
     * 목록 조회
     */
	function cfn_search() {
        if(!SBUxMethod.validateRequired({group_id: "schHeader"}) || !validateRequired("schHeader")) {        
            return false;
        }        
		fn_setFig4195Grid('Q');
	}
    
    /**
     * 목록 가져오기
     */
    const fn_setFig4195Grid = async function(wtype) {
    	
    	Fig4195Grid.clearStatus();

		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_acct_rule_code		= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_entry_date_to			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_TO"));
		
		let p_account_code_fr		= gfnma_nvl(SBUxMethod.get("SCH_MULTI_YN")['SCH_MULTI_YN']);
		if(p_account_code_fr == 'N'){
			p_account_code_fr		= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_FR"));
		} else {
			p_account_code_fr		= '';
		}
		
		let p_account_code_to		= gfnma_nvl(SBUxMethod.get("SCH_MULTI_YN")['SCH_MULTI_YN']);
		if(p_account_code_to == 'N'){
			p_account_code_to		= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_TO"));
		} else {
			p_account_code_to		= '';
		}
		
		let p_cs_code_fr			= gfnma_nvl(SBUxMethod.get("SCH_MULTI_CS_YN")['SCH_MULTI_CS_YN']);
		if(p_cs_code_fr == 'N'){
			p_cs_code_fr			= gfnma_nvl(SBUxMethod.get("SCH_CS_CODE_FR"));
		} else {
			p_cs_code_fr			= '';
		}
		
		let p_cs_code_to			= gfnma_nvl(SBUxMethod.get("SCH_MULTI_CS_YN")['SCH_MULTI_CS_YN']);
		if(p_cs_code_to == 'N'){
			p_cs_code_to			= gfnma_nvl(SBUxMethod.get("SCH_CS_CODE_TO"));
		} else {
			p_cs_code_to			= '';
		}
		
		let p_account_code_d		= gfnma_nvl(SBUxMethod.get("SCH_MULTI_YN")['SCH_MULTI_YN']);
		if(p_account_code_d == 'Y'){
			p_account_code_d		= p_strAccountCodeList;
		} else {
			p_account_code_d		= '';
		}
		
		let p_cs_code_d				= gfnma_nvl(SBUxMethod.get("SCH_MULTI_CS_YN")['SCH_MULTI_CS_YN']);
		if(p_cs_code_d == 'Y'){
			p_cs_code_d				= p_strCsCodeList;
		} else {
			p_cs_code_d				= '';
		}
		
		let p_acc_character			= gfnma_nvl(SBUxMethod.get("SCH_ACC_CHARACTER"));
		let p_currency_code			= gfnma_nvl(SBUxMethod.get("SCH_CURRENCY_CODE"));
		let p_strWorkType			= (wtype=='DEFAULTRULE') ? '93' : '';
		let p_related_yn			= gfnma_nvl(SBUxMethod.get("SCH_RELATED_YN"));
		let p_related_cs_type		= gfnma_nvl(SBUxMethod.get("SCH_RELATED_CS_TYPE"));
		
// 		if(!p_currency_code){
//  			gfn_comAlert("E0000","통화를 선택하세요");
// 			return;      		 
// 		}
// 		if(!p_acct_rule_code){
//  			gfn_comAlert("E0000","회계기준을 선택하세요");
// 			return;      		 
// 		}
// 		if(!p_entry_date_to){
//  			gfn_comAlert("E0000","기준일자를 입력하세요");
// 			return;      		 
// 		}
// 		if(!gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_FR")) &&  !gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_TO"))){
//  			gfn_comAlert("E0000","계정과목을 선택하세요");
// 			return;      		 
// 		}
// 		if(!gfnma_nvl(SBUxMethod.get("SCH_CS_CODE_FR")) &&  !gfnma_nvl(SBUxMethod.get("SCH_CS_CODE_TO"))){
//  			gfn_comAlert("E0000","거래처를 선택하세요");
// 			return;      		 
// 		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_fi_org_code
			,V_P_ACCT_RULE_CODE     : p_acct_rule_code 
			,V_P_BASE_DATE          : p_entry_date_to
			,V_P_ACCOUNT_CODE_FR    : p_account_code_fr
			,V_P_ACCOUNT_CODE_TO    : p_account_code_to
			,V_P_CS_CODE_FR    		: p_cs_code_fr
			,V_P_CS_CODE_TO    		: p_cs_code_to
			,V_P_ACCOUNT_CODE_D		: p_account_code_d
			,V_P_CS_CODE_D        	: p_cs_code_d
			,V_P_ACC_CHARACTER      : p_acc_character
			,V_P_CURRENCY_CODE     	: p_currency_code
			,V_P_RULE_CODE     		: p_strWorkType
			,V_P_RELATED_CS_YN    	: p_related_yn
			,V_P_RELATED_CS_TYPE  	: p_related_cs_type
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig4195List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '1',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFig4195.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
						ACCOUNT_CODE				: gfnma_nvl2(item.ACCOUNT_CODE),			
						ACCOUNT_NAME				: gfnma_nvl2(item.ACCOUNT_NAME),			
						
						ACC_ITEM_CODE1				: gfnma_nvl2(item.ACC_ITEM_CODE1),		
						ACC_ITEM_CODE2				: gfnma_nvl2(item.ACC_ITEM_CODE2),		
						ACC_ITEM_CODE3				: gfnma_nvl2(item.ACC_ITEM_CODE3),		
						ACC_ITEM_CODE4				: gfnma_nvl2(item.ACC_ITEM_CODE4),		
						ACC_ITEM_CODE5				: gfnma_nvl2(item.ACC_ITEM_CODE5),		
						ACC_ITEM_CODE6				: gfnma_nvl2(item.ACC_ITEM_CODE6),		
						ACC_ITEM_CODE7				: gfnma_nvl2(item.ACC_ITEM_CODE7),		
						ACC_ITEM_CODE8				: gfnma_nvl2(item.ACC_ITEM_CODE8),		
						ACC_ITEM_CODE9				: gfnma_nvl2(item.ACC_ITEM_CODE9),		
						ACC_ITEM_CODE10				: gfnma_nvl2(item.ACC_ITEM_CODE10),		

						ACC_ITEM_VALUE1				: gfnma_nvl2(item.ACC_ITEM_VALUE1),		
						ACC_ITEM_VALUE2				: gfnma_nvl2(item.ACC_ITEM_VALUE2),		
						ACC_ITEM_VALUE3				: gfnma_nvl2(item.ACC_ITEM_VALUE3),		
						ACC_ITEM_VALUE4				: gfnma_nvl2(item.ACC_ITEM_VALUE4),		
						ACC_ITEM_VALUE5				: gfnma_nvl2(item.ACC_ITEM_VALUE5),		
						ACC_ITEM_VALUE6				: gfnma_nvl2(item.ACC_ITEM_VALUE6),		
						ACC_ITEM_VALUE7				: gfnma_nvl2(item.ACC_ITEM_VALUE7),		
						ACC_ITEM_VALUE8				: gfnma_nvl2(item.ACC_ITEM_VALUE8),		
						ACC_ITEM_VALUE9				: gfnma_nvl2(item.ACC_ITEM_VALUE9),		
						ACC_ITEM_VALUE10			: gfnma_nvl2(item.ACC_ITEM_VALUE10),		

						ACC_ITEM_VALUE_NAME1		: gfnma_nvl2(item.ACC_ITEM_VALUE_NAME1),		
						ACC_ITEM_VALUE_NAME2		: gfnma_nvl2(item.ACC_ITEM_VALUE_NAME2),		
						ACC_ITEM_VALUE_NAME3		: gfnma_nvl2(item.ACC_ITEM_VALUE_NAME3),		
						ACC_ITEM_VALUE_NAME4		: gfnma_nvl2(item.ACC_ITEM_VALUE_NAME4),		
						ACC_ITEM_VALUE_NAME5		: gfnma_nvl2(item.ACC_ITEM_VALUE_NAME5),		
						ACC_ITEM_VALUE_NAME6		: gfnma_nvl2(item.ACC_ITEM_VALUE_NAME6),		
						ACC_ITEM_VALUE_NAME7		: gfnma_nvl2(item.ACC_ITEM_VALUE_NAME7),		
						ACC_ITEM_VALUE_NAME8		: gfnma_nvl2(item.ACC_ITEM_VALUE_NAME8),		
						ACC_ITEM_VALUE_NAME9		: gfnma_nvl2(item.ACC_ITEM_VALUE_NAME9),		
						ACC_ITEM_VALUE_NAME10		: gfnma_nvl2(item.ACC_ITEM_VALUE_NAME10),		
						
						APPLY_FUNCTIONAL_AMOUNT		: gfnma_nvl2(item.APPLY_FUNCTIONAL_AMOUNT),		
						APPLY_FUNCTIONAL_AMOUNT_RAW	: gfnma_nvl2(item.APPLY_FUNCTIONAL_AMOUNT_RAW),		
						
						APPLY_ORIGINAL_AMOUNT		: gfnma_nvl2(item.APPLY_ORIGINAL_AMOUNT),		
						APPLY_ORIGINAL_AMOUNT_INPUT	: gfnma_nvl2(item.APPLY_ORIGINAL_AMOUNT_INPUT),		
						APPLY_ORIGINAL_AMOUNT_RAW	: gfnma_nvl2(item.APPLY_ORIGINAL_AMOUNT_RAW),		
						
						BILL_DUE_DATE				: gfnma_date5(gfnma_nvl2(item.BILL_DUE_DATE)),			
						BILL_DUE_DAY				: gfnma_nvl2(item.BILL_DUE_DAY),			
						BILL_DUE_PAY_DATE			: gfnma_date5(gfnma_nvl2(item.BILL_DUE_PAY_DATE)),			
						
						CHECK_YN					: gfnma_nvl2(item.CHECK_YN),			
						COST_CENTER_CODE			: gfnma_nvl2(item.COST_CENTER_CODE),			
						COST_CENTER_NAME			: gfnma_nvl2(item.COST_CENTER_NAME),			
  					
						CS_CODE						: gfnma_nvl2(item.CS_CODE),
						CS_NAME						: gfnma_nvl2(item.CS_NAME),
						CURRENCY_CODE				: gfnma_nvl2(item.CURRENCY_CODE),
						DEBIT_CREDIT				: gfnma_nvl2(item.DEBIT_CREDIT),
						DEBIT_CREDIT_NAME			: gfnma_nvl2(item.DEBIT_CREDIT_NAME),
						DEPT_CODE					: gfnma_nvl2(item.DEPT_CODE),
						DEPT_NAME					: gfnma_nvl2(item.DEPT_NAME),
						DOC_BATCH_NO				: gfnma_nvl2(item.DOC_BATCH_NO),
						DOC_DATE					: gfnma_date5(gfnma_nvl2(item.DOC_DATE)),
						DOC_DATE_P					: gfnma_nvl2(item.DOC_DATE_P),
						DOC_DESC					: gfnma_nvl2(item.DOC_DESC),
						DOC_ID						: gfnma_nvl2(item.DOC_ID),
						DOC_NAME					: gfnma_nvl2(item.DOC_NAME),
						DOC_NUM						: gfnma_nvl2(item.DOC_NUM),
						DOC_STATUS					: gfnma_nvl2(item.DOC_STATUS),
						DOC_STATUS_NAME				: gfnma_nvl2(item.DOC_STATUS_NAME),
						DOC_TYPE					: gfnma_nvl2(item.DOC_TYPE),
						DOC_TYPE_NAME				: gfnma_nvl2(item.DOC_TYPE_NAME),
						
						EXCHANGE_GAIN_ACCOUNT		: gfnma_nvl2(item.EXCHANGE_GAIN_ACCOUNT),
						EXCHANGE_GAIN_ACCOUNT_NAME	: gfnma_nvl2(item.EXCHANGE_GAIN_ACCOUNT_NAME),
						EXCHANGE_LOSS_ACCOUNT		: gfnma_nvl2(item.EXCHANGE_LOSS_ACCOUNT),
						EXCHANGE_LOSS_ACCOUNT_NAME	: gfnma_nvl2(item.EXCHANGE_LOSS_ACCOUNT_NAME),
						
						EXCHANGE_RATE				: gfnma_nvl2(item.EXCHANGE_RATE),
						EXCHANGE_TYPE				: gfnma_nvl2(item.EXCHANGE_TYPE),
						EXPECTED_PAY_DATE			: gfnma_nvl2(item.EXPECTED_PAY_DATE),
						FI_ORG_CODE					: gfnma_nvl2(item.FI_ORG_CODE),
						FUNCTIONAL_AMOUNT			: gfnma_nvl2(item.FUNCTIONAL_AMOUNT),
						HOLD_FLAG					: gfnma_nvl2(item.HOLD_FLAG),
						HOLD_REASON					: gfnma_nvl2(item.HOLD_REASON),
						ITEM_SOURCE_ID				: gfnma_nvl2(item.ITEM_SOURCE_ID),
						ITEM_SOURCE_TYPE			: gfnma_nvl2(item.ITEM_SOURCE_TYPE),
						LINE_STATUS					: gfnma_nvl2(item.LINE_STATUS),
						ORIGINAL_AMOUNT				: gfnma_nvl2(item.ORIGINAL_AMOUNT),
						PAYEE_CODE					: gfnma_nvl2(item.PAYEE_CODE),
						PAY_BASE_DATE				: gfnma_date5(gfnma_nvl2(item.PAY_BASE_DATE)),
						PAY_METHOD					: gfnma_nvl2(item.PAY_METHOD),
						PAY_TERM_CODE				: gfnma_nvl2(item.PAY_TERM_CODE),
						PROJECT_CODE				: gfnma_nvl2(item.PROJECT_CODE),
						PROJECT_NAME				: gfnma_nvl2(item.PROJECT_NAME),
						
						REMAIN_FUNCTIONAL_AMOUNT	: gfnma_nvl2(item.REMAIN_FUNCTIONAL_AMOUNT),
						REMAIN_FUNCTIONAL_AMOUNT_RAW: gfnma_nvl2(item.REMAIN_FUNCTIONAL_AMOUNT_RAW),
						REMAIN_ORIGINAL_AMOUNT		: gfnma_nvl2(item.REMAIN_ORIGINAL_AMOUNT),
						REMAIN_ORIGINAL_AMOUNT_RAW	: gfnma_nvl2(item.REMAIN_ORIGINAL_AMOUNT_RAW),
  						
						SEQ							: gfnma_nvl2(item.SEQ),
						SITE_CODE					: gfnma_nvl2(item.SITE_CODE),
						SOURCE_RECORD_COUNT			: gfnma_nvl2(item.SOURCE_RECORD_COUNT),
						VOUCHER_NO					: gfnma_nvl2(item.VOUCHER_NO),
						VOUCHER_TYPE				: gfnma_nvl2(item.VOUCHER_TYPE),
  					}
  					jsonFig4195.push(msg);
  					totalRecordCount ++;
  				});

        		Fig4195Grid.rebuild();
  	        	document.querySelector('#listCount1').innerText = totalRecordCount;
  	        	
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
    
    /**
     * 복수계정 팝업
     */
    var fn_multiYn = function() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수계정');
		SBUxMethod.openModal('modal-compopup3');
		
    	compopup3({
    		height			: '400px'
    		,separator		: '|'
   			,callbackEvent	: function (data){
   				console.log('callback data:', data);
   				p_strAccountCodeList = data;
				if(pp_strAccountCodeList){
					SBUxMethod.set('SCH_MULTI_YN', "Y");
				} else {
					SBUxMethod.set('SCH_MULTI_YN', "N");
				}
   			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
  	}       
    
    /**
     * 복수거래처 팝업
     */
    var fn_multiCsYn = function() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수거래처');
		SBUxMethod.openModal('modal-compopup3');
		
    	compopup3({
    		height			: '400px'
    		,separator		: '|'
   			,callbackEvent	: function (data){
   				console.log('callback data:', data);
   				p_strCsCodeList = data;
				if(p_strCsCodeList){
					SBUxMethod.set('SCH_MULTI_CS_YN', "Y");
				} else {
					SBUxMethod.set('SCH_MULTI_CS_YN', "N");
				}
   			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
  	}       
    
    /**
     * 계정과목 
     */
    function fn_compopup1(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_FR"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_NAME_FR"));
        } else {
            searchText1 	= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_TO"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_NAME_TO"));
        }
        
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_";
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FIM042_1'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
    		,searchCaptions			: ["계정코드", 		"계정명"]
    		,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
    		,searchInputValues		: [searchText1, 	searchText2]
    		,height					: '400px'
    		,tableHeader			: ["계정코드", 		"계정명"]
    		,tableColumnNames		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
    		,tableColumnWidths		: ["100px", 		"200px"]
    		,itemSelectEvent		: function (data){
    			console.log('callback data:', data);
    			if(type=='1'){
    				SBUxMethod.set('SCH_ACCOUNT_CODE_FR', data.ACCOUNT_CODE);
    				SBUxMethod.set('SCH_ACCOUNT_NAME_FR', data.ACCOUNT_NAME);
    			} else {
    				SBUxMethod.set('SCH_ACCOUNT_CODE_TO', data.ACCOUNT_CODE);
    				SBUxMethod.set('SCH_ACCOUNT_NAME_TO', data.ACCOUNT_NAME);
    			}
    		},
    	});
    }      
    
    
    /**
     * 거래처 
     */
    function fn_compopup2(type) {
    	
        var searchText1 	= '';
        var searchText2 	= '';
        if(type=='1'){
            searchText1 	= gfnma_nvl(SBUxMethod.get("SCH_CS_CODE_FR"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("SCH_CS_NAME_FR"));
        } else {
            searchText1 	= gfnma_nvl(SBUxMethod.get("SCH_CS_CODE_TO"));
            searchText2 	= gfnma_nvl(SBUxMethod.get("SCH_CS_NAME_TO"));
        }
        
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND a.CS_CODE LIKE '%" + replaceText0 + "%' AND a.CS_NAME LIKE '%" + replaceText1 + "%' AND a.BIZ_REGNO LIKE '%"+ replaceText2 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처정보');
    	compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM004'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드", 	"거래처명",  	"사업자번호" ]
            ,searchInputFields		: ["CS_CODE", 		"CS_NAME",  	"BIZ_REGNO"]
            ,searchInputValues		: [searchText1, 	searchText2, 	""         ]
            ,height					: '400px'
            ,width					: '1000px'
            ,tableHeader			: ["거래처코드",	"거래처명", 	"사업자번호" , 	"대표자",		"업태",			"종목",			"주소",		"전화",		"팩스"]
            ,tableColumnNames		: ["CS_CODE", 		"CS_NAME", 		"BIZ_REGNO", 	"CHIEF_NAME",	"BIZ_CATEGORY",	"BIZ_ITEMS",	"ADDRESS",	"TEL",		"FAX"]
            ,tableColumnWidths		: ["100px", 		"200px", 		"100px", 		"100px",		"100px",		"150px",		"400px",	"120px",	"120px"]
    		,itemSelectEvent		: function (data){
    			console.log('callback data:', data);
    			if(type=='1'){
    				SBUxMethod.set('SCH_CS_CODE_FR', data.CS_CODE);
    				SBUxMethod.set('SCH_CS_NAME_FR', data.CS_NAME);
    			} else {
    				SBUxMethod.set('SCH_CS_CODE_TO', data.CS_CODE);
    				SBUxMethod.set('SCH_CS_NAME_TO', data.CS_NAME);
    			}
    		},
    	});
    }       
    
    /**
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#srchArea1');
    }    
    
    /**
     * 그리드내 링크(전표번호) 조회
     */
 	function fn_gridPopup1(event, doc_id) {
		event.preventDefault();	
		console.log('doc_id:', doc_id);		
        
        var obj = {
        	'MENU_MOVE'		: 'Y'	
        	,'DOC_ID' 		: doc_id
        	,'target'		: 'MA_A20_030_020_150'
        }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);
	}    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>