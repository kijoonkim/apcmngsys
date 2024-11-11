<%
/**
 * @Class Name 		: fig4180.jsp
 * @Description 	: 계정별잔액명세서 신규 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.09.23
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.09.23   	장성주		최초 생성
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
	<title>title : 계정별잔액명세서 신규</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
	
	<style type="text/css">
	</style>
	
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 계정별잔액명세서 신규 -->
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
            <div class="box-body">

				<div>
	                <!--[pp] 검색 -->
					<!--[APC] START -->
						<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
					<!--[APC] END -->
	                <table id="srchArea1" class="table table-bordered tbl_fixed">
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
	
	                        <col style="width: 7%">
	                        <col style="width: 6%">
	                        <col style="width: 6%">
	                        <col style="width: 3%">
	                    </colgroup>
	                    <tbody>
	                    
                           	<!-- hidden  -->
                       		<!-- /hidden -->
                       		
	                    	<tr>
	                            <th scope="row" class="th_bg">회계단위</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" style="width:150px" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">회계기준</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">회계일자</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left">
										<sbux-datepicker
										        id="SCH_DOC_DATE_FR"
										        name="SCH_DOC_DATE_FR"
										        uitype="popup"
										        datepicker-mode="month"
										        date-format="yyyy-mm"
										        style="width:80px"
										        class="form-control input-sm input-sm-ast inpt_data_reqed"
										        required>
										</sbux-datepicker>                            
									    <font style="padding-left:5px;padding-right:5px">-</font>  
										<sbux-datepicker
										        id="SCH_DOC_DATE_TO"
										        name="SCH_DOC_DATE_TO"
										        uitype="popup"
										        datepicker-mode="month"
										        date-format="yyyy-mm"
										        style="width:80px"
										        class="form-control input-sm input-sm-ast inpt_data_reqed"
										        required>
										</sbux-datepicker>                            
	                            	</div>
	                            </td>	      
	                             	                            
	                            <th scope="row" class="th_bg">계정수준</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_ACCOUNT_GROUP" uitype="single" jsondata-ref="jsonAccountGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                                          	
	                    	</tr>
	                    	
	                    	<tr>
	                            <th scope="row" class="th_bg">계정과목</th>
	                            <td colspan="15" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px" id="SCH_ACCOUNT_CODE_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text=".." uitype="modal"
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
											text=".." uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup1('2')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px" id="SCH_ACCOUNT_NAME_TO" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
		                       			<sbux-checkbox 
		                       				id="SCH_MULTI_YN" 
		                       				uitype="normal" 
		                       				text="복수선택" 
		                       				true-value="Y" 
		                       				false-value="N" ></sbux-checkbox>
	   									<font style="width:5px"></font>
										<sbux-button
											id="BTN_MULTI_YN"
											class="btn btn-xs btn-outline-dark"
											text="복수선택" 
											onclick="fn_multiYn()"></sbux-button>
									</div>
	                            </td>	                    	
	                    	</tr>
	                    	
	                    	<tr>
	                            <th scope="row" class="th_bg">거래처</th>
	                            <td colspan="15" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px"  id="SCH_CS_CODE_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text=".." uitype="modal"
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
											text=".." uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup2('2')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px"  id="SCH_CS_NAME_TO" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
		                       			<sbux-checkbox 
		                       				id="SCH_MULTI_CS_YN" 
		                       				uitype="normal" 
		                       				text="복수선택" 
		                       				true-value="Y" 
		                       				false-value="N" ></sbux-checkbox>
	   									<font style="width:5px"></font>
										<sbux-button
											id="BTN_MULTI_CS_YN"
											class="btn btn-xs btn-outline-dark"
											text="복수거래처" 
											onclick="fn_multiCsYn()"></sbux-button>
									</div>
	                            </td>
	                    	</tr>
	                    		                    	
	                    	<tr>
	                            <th scope="row" class="th_bg">특수관계자여부</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_RELATED_YN" uitype="single" jsondata-ref="jsonRelatedYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">특수관계자유형</th>
	                            <td colspan="11" class="td_input" >
		                            <sbux-select id="SCH_RELATED_CS_TYPE" uitype="single" jsondata-ref="jsonRelatedCsType" style="width:250px" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                    	</tr>	  

								                            
	                    </tbody>
	                </table>				
				</div>
                
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>계정별잔액명세서</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
                        </li>
                    </ul>
                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
					</div>
                </div>
				
                <div>
                    <div id="SB_AREA_GRDTOP" style="height:300px; width:100%;">
                    </div>
                </div>
                
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>거래처별 계정별 내역</span>
                        </li>
                    </ul>
                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
					</div>
                </div>
				
                <div>
                    <div id="SB_AREA_GRDBOT" style="height:140px; width:100%;">
                    </div>
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
	var p_ss_defaultAcctRule 	= '${loginVO.maDefaultAcctRule}';
	var p_ss_deptCode			= '${loginVO.maDeptCode}';
	var p_ss_deptName			= '${loginVO.maDeptName}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	
	//grid 초기화
	var Fig4180QGrid; 				// 그리드를 담기위한 객체 선언
	var jsonFig4180Q 		= []; 	// 그리드의 참조 데이터 주소 선언
	
	var Fig4180Q2Grid; 				// 그리드를 담기위한 객체 선언
	var jsonFig4180Q2 		= []; 	// 그리드의 참조 데이터 주소 선언
	
	var Fig4180Q2Grid; 				// 그리드를 담기위한 객체 선언

	var jsonTempList 		= [];	// 저장할 임시 저장소

	var jsonFiOrgCode 		= []; 	// 사업단위
	var jsonAcctRuleCode 	= []; 	// 회계기준
	var jsonAccountGroup 	= []; 	// 계정수준
	var jsonRelatedYn 		= []; 	// 특수관계자여부
	var jsonRelatedCsType 	= []; 	// 특수관계자유형
	
    var p_sel_row 				= '';
    var p_sel_col 				= '';
    
    var p_strAccountCodeList	= '';	//복수선택
    var p_strCsCodeList			= '';	//복수거래처
	
    var p_menu_param			= null;
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],			jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE'],		jsonAcctRuleCode, 	'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 계정수준
            gfnma_setComSelect(['SCH_ACCOUNT_GROUP'],		jsonAccountGroup, 	'L_FIG011_Y', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),            
            // 특수관계자여부
            gfnma_setComSelect(['SCH_RELATED_YN'], 			jsonRelatedYn, 		'L_COM036', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 특수관계자유형
            gfnma_setComSelect(['SCH_RELATED_CS_TYPE'],		jsonRelatedCsType, 	'L_COM047', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state();
  		fn_createFig4180QGrid();
  		fn_createFig4180Q2Grid();
	}    
    
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	
    	p_menu_param = localStorage.getItem("callMain");
    	if(p_menu_param){
    		p_menu_param = JSON.parse(p_menu_param);
    	}
    	localStorage.removeItem("callMain");
    	
    	fn_init();
    	
    });

    //메뉴가 이미 열려있을때..
    window.addEventListener('message', async function(e) {
    	let obj = e.data;
		if(obj){
			if(obj['MENU_MOVE']){
				p_menu_param 	= obj;
		    	fn_init();
			}
		}
    });
    
    /**
     * 화면 state 변경
     */
    function fn_state() {
    	
    	SBUxMethod.set("SCH_MULTI_YN", 			'N');
    	SBUxMethod.set("SCH_MULTI_CS_YN", 		'N');
    	
    	SBUxMethod.set("SCH_ACCOUNT_GROUP", 	'C');
    	SBUxMethod.set("SCH_FI_ORG_CODE", 		p_ss_fiOrgCode);
    	SBUxMethod.set("SCH_ACCT_RULE_CODE", 	p_ss_defaultAcctRule);
    	
    	if(p_menu_param){
    		if(p_menu_param['START_DATE']){
    			SBUxMethod.set("SCH_DOC_DATE_FR", 		p_menu_param['START_DATE']);
    		}
    		if(p_menu_param['END_DATE']){
    			SBUxMethod.set("SCH_DOC_DATE_TO", 		p_menu_param['END_DATE']);
    		}
    		if(p_menu_param['ACCOUNT_GROUP']){
    			SBUxMethod.set("SCH_ACCOUNT_GROUP", 	p_menu_param['ACCOUNT_GROUP']);
    		}
    		if(p_menu_param['ACCOUNT_CODE_FR']){
    			SBUxMethod.set("SCH_ACCOUNT_CODE_FR", 	p_menu_param['ACCOUNT_CODE_FR']);
    		}
    		if(p_menu_param['ACCOUNT_CODE_TO']){
    			SBUxMethod.set("SCH_ACCOUNT_CODE_TO", 	p_menu_param['ACCOUNT_CODE_TO']);
    		}
    		if(p_menu_param['ACCOUNT_NAME']){
    			SBUxMethod.set("SCH_ACCOUNT_NAME_FR", 	p_menu_param['ACCOUNT_NAME']);
    			SBUxMethod.set("SCH_ACCOUNT_NAME_TO", 	p_menu_param['ACCOUNT_NAME']);
    		}
    		if(p_menu_param['ACCOUNT_NAME_FR']){
    			SBUxMethod.set("SCH_ACCOUNT_NAME_FR", 	p_menu_param['ACCOUNT_NAME_FR']);
    		}
    		if(p_menu_param['ACCOUNT_NAME_TO']){
    			SBUxMethod.set("SCH_ACCOUNT_NAME_TO", 	p_menu_param['ACCOUNT_NAME_TO']);
    		}
    		if(p_menu_param['ACCT_RULE_CODE']){
    			SBUxMethod.set("SCH_ACCT_RULE_CODE", 	p_menu_param['ACCT_RULE_CODE']);
    		}
    		
    		cfn_subSearch();
    	} else {
			SBUxMethod.set("SCH_DOC_DATE_FR", 			gfnma_date().substr(0,6));
			SBUxMethod.set("SCH_DOC_DATE_TO", 			gfnma_date().substr(0,6));
    	}
    }
    
    /**
     * 날짜
     */
    var fn_payDate = function() {
        var yyyymm	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_YYYYMM_P"));
        var sdate	= yyyymm.substr(0,4) + '-' + yyyymm.substr(4,2) + '-01';
        var edate	= gfnma_date3(yyyymm.substr(0,4), yyyymm.substr(4,2));
        
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		sdate);
		SBUxMethod.set('SCH_ENTRY_DATE_TO', 		edate);    	
    }

    /**
     * 목록 조회
     */
	function cfn_search() {
		fn_setFig4180QGrid('Q');
	}
    
	function cfn_subSearch() {
		fn_setFig4180QGrid('Q');
	}
    
    function fn_createFig4180QGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_AREA_GRDTOP';
	    SBGridProperties.id 				= 'Fig4180QGrid';
	    SBGridProperties.jsonref 			= 'jsonFig4180Q';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        //SBGridProperties.frozencols 		= 4;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= ['seq'];
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total 				= {
                type 		: 'grand',
                position	: 'bottom',
                columns		: {
                    standard : [0],
                    sum : [8,9,10,11]
                },
                grandtotalrow : {
                    titlecol 		: 7,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["사업단위"], 				ref: 'FI_ORG_NAME',    			type:'output',  	width:'200px', 		style:'text-align:left'},
            {caption: ["기간"],						ref: 'PERIOD_CODE', 			type:'output', 		width:'100px', 		style:'text-align:left'},
            {caption: ["계정과목"], 				ref: 'ACCOUNT_CODE', 			type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["계정과목명"], 				ref: 'ACCOUNT_NAME', 			type:'output',		width:'250px',  	style:'text-align:left'},
            {caption: ["거래처코드"],				ref: 'CS_CODE', 				type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["거래처명"], 				ref: 'CS_NAME', 				type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["사업자번호"], 				ref: 'BIZ_REGNO', 				type:'output',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["전기(월)이월"],    			ref: 'BEGIN_AMT_F', 			type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["증가금액"], 	   			ref: 'IN_AMT_F', 				type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["감소금액"],		   			ref: 'OUT_AMT_F', 				type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["잔액"], 		   			ref: 'BALANCE_AMT_F', 			type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["적요"],						ref: 'DESCR', 					type:'output',  	width:'300px', 		style:'text-align:left'},
            {caption: ["통화"],						ref: 'CURRENCY_CODE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["전기(월)이월(통화)"],		ref: 'BEGIN_AMT_O', 			type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["증가금액(통화)"],  			ref: 'IN_AMT_O', 				type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["감소금액(통화)"],	 		ref: 'OUT_AMT_O', 				type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["잔액(통화)"], 	   			ref: 'BALANCE_AMT_O', 			type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
        ];

        Fig4180QGrid = _SBGrid.create(SBGridProperties);
        Fig4180QGrid.bind('click', 'fn_viewFig4180QGridEvent');
    }        
    
    //상세정보 보기
    function fn_viewFig4180QGridEvent() {
    	
        var nRow = Fig4180QGrid.getRow();
		if (nRow < 1) {
            return;
		}
        let rowData = Fig4180QGrid.getRowData(nRow);
		console.log(rowData);        
        fn_setFig4180Q2Grid('DETAIL', 	rowData);
    }
    
    function fn_createFig4180Q2Grid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_AREA_GRDBOT';
	    SBGridProperties.id 				= 'Fig4180Q2Grid';
	    SBGridProperties.jsonref 			= 'jsonFig4180Q2';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        //SBGridProperties.frozencols 		= 3;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= ['seq'];
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total 				= {
                type 		: 'grand',
                position	: 'bottom',
                columns		: {
                    standard : [0],
                    sum : [12,13,23,24,25]
                },
                grandtotalrow : {
                    titlecol 		: 11,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["계정코드"], 				ref: 'ACCT_NAME', 				type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["기간"],						ref: 'PERIOD_CODE', 			type:'output', 		width:'100px', 		style:'text-align:left'},
            {caption: ["사업단위"], 				ref: 'FI_ORG_NAME',    			type:'output',  	width:'200px', 		style:'text-align:left'},
            
            {caption: ["계정과목"], 				ref: 'ACCOUNT_CODE', 			type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["계정과목명"], 				ref: 'ACCOUNT_NAME', 			type:'output',		width:'250px',  	style:'text-align:left'},
            
            {caption: ["일자"], 					ref: 'DOC_DATE', 				type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["적요"],						ref: 'DESCRIPTION', 			type:'output',  	width:'300px', 		style:'text-align:left'},

            {caption: ["코드"],						ref: 'CS_CODE', 				type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["거래처명"],					ref: 'CS_NAME', 				type:'output',  	width:'200px', 		style:'text-align:left'},
            
            {caption: ["사업자번호"], 				ref: 'BIZ_REGNO', 				type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["전표번호"], 				ref: 'DOC_NAME', 				type:'output',		width:'100px',  	style:'text-align:left'},
            
            {caption: ["차변(전표)"],    			ref: 'FUNCTIONAL_DR_AMT', 		type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대변(전표)"], 	   			ref: 'FUNCTIONAL_CR_AMT', 		type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["순금액(전표)"],				ref: 'FUNCTIONAL_AMT', 			type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["잔액(전표)"], 	   			ref: 'FUNCTIONAL_BALANCE_AMT', 	type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["잔액(전표2)"],	   			ref: 'FUNCTIONAL_BALANCE_AMT2',	type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["전표유형"],					ref: 'DOC_TYPE',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["송장참조번호"],				ref: 'SOURCE_JUNPYO_NO',		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급전표번호"],				ref: 'PAY_DOC_NAME',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급일자"],					ref: 'PAY_DOC_DATE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["반제전표번호"],				ref: 'APPLY_DOC_NAME',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["반제일"],					ref: 'APPLY_DOC_DATE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["차변(통화)"],				ref: 'ORIGINAL_DR_AMT', 		type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대변(통화)"],				ref: 'ORIGINAL_CR_AMT', 		type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["순금액(통화)"],  			ref: 'ORIGINAL_AMT', 			type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["잔액(통화)"],	 			ref: 'ORIGINAL_BALANCE_AMT', 	type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["잔액(통화2)"], 	   			ref: 'ORIGINAL_BALANCE_AMT2', 	type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
        ];

        Fig4180Q2Grid = _SBGrid.create(SBGridProperties);
    }        
    
    /**
     * 목록 가져오기
     */
    const fn_setFig4180QGrid = async function(wtype) {
    	
		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_acct_rule_code		= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_doc_date_fr			= gfnma_nvl(SBUxMethod.get("SCH_DOC_DATE_FR"));
		let p_doc_date_to			= gfnma_nvl(SBUxMethod.get("SCH_DOC_DATE_TO"));
		let p_account_group			= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_GROUP"));
		
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
		
		let p_account_code_d		= gfnma_nvl(SBUxMethod.get("SCH_MULTI_YN")['SCH_MULTI_YN']);
		if(p_account_code_d == 'Y'){
			p_account_code_d		= p_strAccountCodeList;
		} else {
			p_account_code_d		= '';
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
		
		let p_cs_code_d				= gfnma_nvl(SBUxMethod.get("SCH_MULTI_CS_YN")['SCH_MULTI_CS_YN']);
		if(p_cs_code_d == 'Y'){
			p_cs_code_d				= p_strCsCodeList;
		} else {
			p_cs_code_d				= '';
		}
		
		let p_relaated_yn			= gfnma_nvl(SBUxMethod.get("SCH_RELATED_YN"));
		let p_related_cs_type		= gfnma_nvl(SBUxMethod.get("SCH_RELATED_CS_TYPE"));
		
		if(!p_doc_date_fr ||  !p_doc_date_to){
 			gfn_comAlert("E0000","회계일자를 선택하세요");
			return;      		 
		}
		
		if(!gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_FR")) &&  !gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_TO"))){
 			gfn_comAlert("E0000","계정과목을 선택하세요");
			return;      		 
		}
		
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_fi_org_code
			,V_P_ACCT_RULE_CODE     : p_acct_rule_code 
			,V_P_PERIOD_FR    		: p_doc_date_fr
			,V_P_PERIOD_TO    		: p_doc_date_to
			,V_P_ACCOUNT_GROUP    	: p_account_group
			
			,V_P_ACCOUNT_CODE_FR    : p_account_code_fr
			,V_P_ACCOUNT_CODE_TO    : p_account_code_to
			,V_P_ACCOUNT_CODE_D		: p_account_code_d
			
			,V_P_CS_CODE_FR    		: p_cs_code_fr
			,V_P_CS_CODE_TO    		: p_cs_code_to
			,V_P_CS_CODE_D			: p_cs_code_d
			
			,V_P_RELATED_CS_YN   	: p_relaated_yn
			,V_P_RELATED_CS_TYPE    : p_related_cs_type
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/leg/selectFig4180List.do", {
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

  	        	jsonFig4180Q.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
						ACCOUNT_CODE				: gfnma_nvl(item.ACCOUNT_CODE),			
						ACCOUNT_NAME				: gfnma_nvl(item.ACCOUNT_NAME),			
						
						BALANCE_AMT_F				: gfnma_nvl(item.BALANCE_AMT_F),			
						BALANCE_AMT_O				: gfnma_nvl(item.BALANCE_AMT_O),			
						BEGIN_AMT_F					: gfnma_nvl(item.BEGIN_AMT_F),			
						BEGIN_AMT_O					: gfnma_nvl(item.BEGIN_AMT_O),			
						
						BIZ_REGNO					: gfnma_nvl(item.BIZ_REGNO),			
						CS_CODE						: gfnma_nvl(item.CS_CODE),			
						CS_NAME						: gfnma_nvl(item.CS_NAME),			
						CURRENCY_CODE				: gfnma_nvl(item.CURRENCY_CODE),
						DESCR						: gfnma_nvl(item.DESCR),
						
						FI_ORG_CODE					: gfnma_nvl(item.FI_ORG_CODE),
						FI_ORG_NAME					: gfnma_nvl(item.FI_ORG_NAME),
						
						IN_AMT_F					: gfnma_nvl(item.IN_AMT_F),
						IN_AMT_O					: gfnma_nvl(item.IN_AMT_O),
						OUT_AMT_F					: gfnma_nvl(item.OUT_AMT_F),
						OUT_AMT_O					: gfnma_nvl(item.OUT_AMT_O),
						PERIOD_CODE					: gfnma_nvl(item.PERIOD_CODE),
  					}
  					jsonFig4180Q.push(msg);
  					totalRecordCount ++;
  				});
				
        		Fig4180QGrid.rebuild();
  	        	document.querySelector('#listCount1').innerText = totalRecordCount;
  	        	
  	        	//----------
  	        	if(jsonFig4180Q.length > 0){
	  	        	let nRow = 1;
	  	        	Fig4180QGrid.selectRow(nRow);
	  	        	let rowData = Fig4180QGrid.getRowData(nRow);
	  	          	fn_setFig4180Q2Grid('DETAIL', 	rowData);
  	        	} else {
  	  	    		jsonFig4180Q2.length = 0;
  	  	    		Fig4180Q2Grid.rebuild();  	        		
  	        	}
  	        	//----------
  	        	
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
     * 디테일 목록 가져오기
     */
    const fn_setFig4180Q2Grid = async function(wtype, obj) {

    	Fig4180Q2Grid.clearStatus();

		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_acct_rule_code		= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_doc_date_fr			= gfnma_nvl(SBUxMethod.get("SCH_DOC_DATE_FR"));
		let p_doc_date_to			= gfnma_nvl(SBUxMethod.get("SCH_DOC_DATE_TO"));
		let p_account_group			= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_GROUP"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_fi_org_code
			,V_P_ACCT_RULE_CODE     : p_acct_rule_code 
			,V_P_PERIOD_FR    		: p_doc_date_fr
			,V_P_PERIOD_TO    		: p_doc_date_to
			,V_P_ACCOUNT_GROUP    	: p_account_group
			,V_P_ACCOUNT_CODE    	: obj['ACCOUNT_CODE']
			,V_P_CS_CODE    		: obj['CS_CODE']
			,V_P_CURRENCY_CODE		: obj['CURRENCY_CODE']
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/leg/selectFig4180Q2List.do", {
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

  	    		jsonFig4180Q2.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
						ACCOUNT_CODE				: gfnma_nvl(item.ACCOUNT_CODE),			
						ACCOUNT_NAME				: gfnma_nvl(item.ACCOUNT_NAME),			
						
						ACCT_NAME					: gfnma_nvl(item.ACCT_NAME),			
						ACCT_RULE_CODE				: gfnma_nvl(item.ACCT_RULE_CODE),			
						//ACCT_RULE_NAME				: gfnma_nvl(item.ACCT_RULE_NAME),			
						
						ACC_ITEM_CODE1				: gfnma_nvl(item.ACC_ITEM_CODE1),		
						ACC_ITEM_CODE2				: gfnma_nvl(item.ACC_ITEM_CODE2),		
						ACC_ITEM_CODE3				: gfnma_nvl(item.ACC_ITEM_CODE3),		
						ACC_ITEM_CODE4				: gfnma_nvl(item.ACC_ITEM_CODE4),		
						ACC_ITEM_CODE5				: gfnma_nvl(item.ACC_ITEM_CODE5),		
						ACC_ITEM_CODE6				: gfnma_nvl(item.ACC_ITEM_CODE6),		
						ACC_ITEM_CODE7				: gfnma_nvl(item.ACC_ITEM_CODE7),		
						ACC_ITEM_CODE8				: gfnma_nvl(item.ACC_ITEM_CODE8),		
						ACC_ITEM_CODE9				: gfnma_nvl(item.ACC_ITEM_CODE9),		
						ACC_ITEM_CODE10				: gfnma_nvl(item.ACC_ITEM_CODE10),		
	
						ACC_ITEM_VALUE1				: gfnma_nvl(item.ACC_ITEM_VALUE1),		
						ACC_ITEM_VALUE2				: gfnma_nvl(item.ACC_ITEM_VALUE2),		
						ACC_ITEM_VALUE3				: gfnma_nvl(item.ACC_ITEM_VALUE3),		
						ACC_ITEM_VALUE4				: gfnma_nvl(item.ACC_ITEM_VALUE4),		
						ACC_ITEM_VALUE5				: gfnma_nvl(item.ACC_ITEM_VALUE5),		
						ACC_ITEM_VALUE6				: gfnma_nvl(item.ACC_ITEM_VALUE6),		
						ACC_ITEM_VALUE7				: gfnma_nvl(item.ACC_ITEM_VALUE7),		
						ACC_ITEM_VALUE8				: gfnma_nvl(item.ACC_ITEM_VALUE8),		
						ACC_ITEM_VALUE9				: gfnma_nvl(item.ACC_ITEM_VALUE9),		
						ACC_ITEM_VALUE10			: gfnma_nvl(item.ACC_ITEM_VALUE10),		
	
						ACC_ITEM_VALUE_NAME1		: gfnma_nvl(item.ACC_ITEM_VALUE_NAME1),		
						ACC_ITEM_VALUE_NAME2		: gfnma_nvl(item.ACC_ITEM_VALUE_NAME2),		
						ACC_ITEM_VALUE_NAME3		: gfnma_nvl(item.ACC_ITEM_VALUE_NAME3),		
						ACC_ITEM_VALUE_NAME4		: gfnma_nvl(item.ACC_ITEM_VALUE_NAME4),		
						ACC_ITEM_VALUE_NAME5		: gfnma_nvl(item.ACC_ITEM_VALUE_NAME5),		
						ACC_ITEM_VALUE_NAME6		: gfnma_nvl(item.ACC_ITEM_VALUE_NAME6),		
						ACC_ITEM_VALUE_NAME7		: gfnma_nvl(item.ACC_ITEM_VALUE_NAME7),		
						ACC_ITEM_VALUE_NAME8		: gfnma_nvl(item.ACC_ITEM_VALUE_NAME8),		
						ACC_ITEM_VALUE_NAME9		: gfnma_nvl(item.ACC_ITEM_VALUE_NAME9),		
						ACC_ITEM_VALUE_NAME10		: gfnma_nvl(item.ACC_ITEM_VALUE_NAME10),		
						
						APPLY_DOC_DATE				: gfnma_nvl(item.APPLY_DOC_DATE),		
						APPLY_DOC_ID				: gfnma_nvl(item.APPLY_DOC_ID),		
						APPLY_DOC_NAME				: gfnma_nvl(item.APPLY_DOC_NAME),		
						BALANCE_SIDE				: gfnma_nvl(item.BALANCE_SIDE),		
						BANK_ACCOUNT_SEQ			: gfnma_nvl(item.BANK_ACCOUNT_SEQ),		
						BATCH_NO					: gfnma_nvl(item.BATCH_NO),		
						
						BILL_DUE_DATE				: gfnma_date5(gfnma_nvl(item.BILL_DUE_DATE)),			
						BILL_DUE_DAY				: gfnma_nvl(item.BILL_DUE_DAY),			
						BILL_DUE_PAY_DATE			: gfnma_date5(gfnma_nvl(item.BILL_DUE_PAY_DATE)),			
						BIZ_REGNO					: gfnma_nvl(item.BIZ_REGNO),			
						CARD_NO						: gfnma_nvl(item.CARD_NO),			
						COST_CENTER_CODE			: gfnma_nvl(item.COST_CENTER_CODE),			
						COST_CENTER_NAME			: gfnma_nvl(item.COST_CENTER_NAME),			
						CREDIT_AREA					: gfnma_nvl(item.CREDIT_AREA),			
						CS_CODE						: gfnma_nvl(item.CS_CODE),
						CS_NAME						: gfnma_nvl(item.CS_NAME),
	
						CURRENCY_CODE				: gfnma_nvl(item.CURRENCY_CODE),
						DEPT_CODE					: gfnma_nvl(item.DEPT_CODE),
						DEPT_NAME					: gfnma_nvl(item.DEPT_NAME),
						DESCRIPTION					: gfnma_nvl(item.DESCRIPTION),
						DOC_DATE					: gfnma_nvl(item.DOC_DATE),
						DOC_ID						: gfnma_nvl(item.DOC_ID),
						DOC_NAME					: gfnma_nvl(item.DOC_NAME),
						DOC_STATUS					: gfnma_nvl(item.DOC_STATUS),
						//DOC_STATUS_NAME				: gfnma_nvl(item.DOC_STATUS_NAME),
						DOC_TYPE					: gfnma_nvl(item.DOC_TYPE),
						//DOC_TYPE_NAME				: gfnma_nvl(item.DOC_TYPE_NAME),
	
						EXCHANGE_RATE				: gfnma_nvl(item.EXCHANGE_RATE),
						EXPECTED_PAY_DATE			: gfnma_nvl(item.EXPECTED_PAY_DATE),
						FI_ORG_CODE					: gfnma_nvl(item.FI_ORG_CODE),
						FI_ORG_NAME					: gfnma_nvl(item.FI_ORG_NAME),
						
						FUNCTIONAL_AMT				: gfnma_nvl(item.FUNCTIONAL_AMT),		
						FUNCTIONAL_BALANCE_AMT		: gfnma_nvl(item.FUNCTIONAL_BALANCE_AMT),		
						FUNCTIONAL_BALANCE_AMT2		: gfnma_nvl(item.FUNCTIONAL_BALANCE_AMT2),		
						FUNCTIONAL_CR_AMT			: gfnma_nvl(item.FUNCTIONAL_CR_AMT),		
						FUNCTIONAL_DR_AMT			: gfnma_nvl(item.FUNCTIONAL_DR_AMT),		
						
						HOLD_DATE					: gfnma_date5(gfnma_nvl(item.HOLD_DATE)),
						HOLD_FLAG					: gfnma_nvl(item.HOLD_FLAG),
						HOLD_REASON					: gfnma_nvl(item.HOLD_REASON),
						HOLD_USER					: gfnma_nvl(item.HOLD_USER),
						
						INSERT_USERNAME				: gfnma_nvl(item.INSERT_USERNAME),
						ITEM_ID						: gfnma_nvl(item.ITEM_ID),
						ITEM_NAME					: gfnma_nvl(item.ITEM_NAME),
						ITEM_SEQ					: gfnma_nvl(item.ITEM_SEQ),
						ITEM_SOURCE_ID				: gfnma_nvl(item.ITEM_SOURCE_ID),
						LINE_TYPE					: gfnma_nvl(item.LINE_TYPE),
						
						ORIGINAL_AMT				: gfnma_nvl(item.ORIGINAL_AMT),		
						ORIGINAL_BALANCE_AMT		: gfnma_nvl(item.ORIGINAL_BALANCE_AMT),		
						ORIGINAL_BALANCE_AMT2		: gfnma_nvl(item.ORIGINAL_BALANCE_AMT2),		
						ORIGINAL_CR_AMT				: gfnma_nvl(item.ORIGINAL_CR_AMT),		
						ORIGINAL_DR_AMT				: gfnma_nvl(item.ORIGINAL_DR_AMT),		
						
						PAYEE_CODE					: gfnma_nvl(item.PAYEE_CODE),
						PAY_BASE_DATE				: gfnma_date5(gfnma_nvl(item.PAY_BASE_DATE)),
						PAY_DOC_NAME				: gfnma_nvl(item.PAY_DOC_NAME),
						PAY_METHOD					: gfnma_nvl(item.PAY_METHOD),
						PAY_TERM_CODE				: gfnma_nvl(item.PAY_TERM_CODE),
						PAY_TERM_ORIG				: gfnma_nvl(item.PAY_TERM_ORIG),
						PERIOD_CODE					: gfnma_nvl(item.PERIOD_CODE),
						PO_LINE_NO					: gfnma_nvl(item.PO_LINE_NO),
						PROD_GROUP					: gfnma_nvl(item.PROD_GROUP),
						PROJECT_CODE				: gfnma_nvl(item.PROJECT_CODE),
						PROJECT_NAME				: gfnma_nvl(item.PROJECT_NAME),
						RELEASE_DATE				: gfnma_date5(gfnma_nvl(item.RELEASE_DATE)),
						RELEASE_USER				: gfnma_nvl(item.RELEASE_USER),
						ROW_TYPE					: gfnma_nvl(item.ROW_TYPE),
						SALES_CS_CODE				: gfnma_nvl(item.SALES_CS_CODE),
						SALES_PERSON				: gfnma_nvl(item.SALES_PERSON),
						SEQ							: gfnma_nvl(item.SEQ),
						SITE_CODE					: gfnma_nvl(item.SITE_CODE),
						//SITE_NAME					: gfnma_nvl(item.SITE_NAME),
						
						SOURCE_ID					: gfnma_nvl(item.SOURCE_ID),
						SOURCE_JUNPYO_ID			: gfnma_nvl(item.SOURCE_JUNPYO_ID),
						SOURCE_JUNPYO_NO			: gfnma_nvl(item.SOURCE_JUNPYO_NO),
						SOURCE_TYPE					: gfnma_nvl(item.SOURCE_TYPE),
						TXN_QTY						: gfnma_nvl(item.TXN_QTY),
						UOM							: gfnma_nvl(item.UOM),
						VAT_TYPE					: gfnma_nvl(item.VAT_TYPE),
						
						VOUCHER_NO					: gfnma_nvl(item.VOUCHER_NO),
						VOUCHER_NO1					: gfnma_nvl(item.VOUCHER_NO1),
						VOUCHER_RECEIPT_DATE		: gfnma_nvl(item.VOUCHER_RECEIPT_DATE),
						VOUCHER_TYPE				: gfnma_nvl(item.VOUCHER_TYPE),
						
						WITHHOLD_CS_CODE			: gfnma_nvl(item.WITHHOLD_CS_CODE),		
						WITHHOLD_CS_CODE2			: gfnma_nvl(item.WITHHOLD_CS_CODE2),		
						WITHHOLD_FLAG				: gfnma_nvl(item.WITHHOLD_FLAG),		
						WITHHOLD_TAX_TYPE			: gfnma_nvl(item.WITHHOLD_TAX_TYPE),		
						WITHHOLD_TAX_TYPE2			: gfnma_nvl(item.WITHHOLD_TAX_TYPE2),		
						
						WRITE_DEPT_NAME				: gfnma_nvl(item.WRITE_DEPT_NAME),		
  							
  					}
  					jsonFig4180Q2.push(msg);
  					totalRecordCount ++;
  				});

  	        	Fig4180Q2Grid.rebuild();
  	        	
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
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#srchArea1');
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
    		compCode				: gv_ma_selectedApcCd
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
     * 복수선택 팝업
     */
    var fn_multiYn = function() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수선택');
		SBUxMethod.openModal('modal-compopup3');
		
    	compopup3({
    		height			: '400px'
    		,separator		: '|'
   			,callbackEvent	: function (data){
   				console.log('callback data:', data);
   				p_strAccountCodeList = data;
				if(p_strAccountCodeList){
					SBUxMethod.set('SCH_MULTI_YN', "Y");
				} else {
					SBUxMethod.set('SCH_MULTI_YN', "N");
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
    		compCode				: gv_ma_selectedApcCd
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
            compCode				: gv_ma_selectedApcCd
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
     * 복수거래처 
     */
    function fn_multiCsYn() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
    	SBUxMethod.openModal('modal-compopup3');
    	
    	compopup3({
    		height			: '400px'
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
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>