<%
/**
 * @Class Name 		: fig5210.jsp
 * @Description 	: 합계잔액시산표조회 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.09.30
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.09.30   	장성주		최초 생성
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
	<title>title : 합계잔액시산표조회</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
	<%@ include file="../../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 합계잔액시산표조회 -->
                </div>
                <div style="margin-left: auto;">
					<sbux-button id="btnPrint" name="btnPrint" uitype="normal" class="btn btn-sm btn-outline-danger" text="리포트 출력" onclick="fn_btnPrint"></sbux-button>
                </div>
            </div>

 			<div class="box-body">
            
	            <div class="box-search-ma">
	
	                <!--[pp] 검색 -->
					<!--[APC] START -->
						<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
					<!--[APC] END -->
	                <table class="table table-bordered tbl_fixed table-search-ma">
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
	                        <tr>
	                            <th scope="row" class="th_bg_search">APC</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">사업장</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">회계기준</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">기간</th>
	                            <td colspan="4" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
										<sbux-datepicker
											uitype="popup"
											id="SCH_YMDPERIOD_FR"
									        datepicker-mode="month"
									        date-format="yyyy-mm"
									        style="width:70px"
											class="form-control pull-right input-sm input-sm-ast table-datepicker-ma"
										></sbux-datepicker>
									    <font style="padding-left:5px;padding-right:5px">-</font>  
										<sbux-datepicker
											uitype="popup"
											id="SCH_YMDPERIOD_TO"
									        datepicker-mode="month"
									        date-format="yyyy-mm"
									        style="width:70px"
											class="form-control pull-right input-sm input-sm-ast table-datepicker-ma"
										></sbux-datepicker>
									    <font style="padding-left:5px;"></font>  
									    <span style="padding-top:7px">
											<sbux-checkbox id="SCH_CHKTHIS_PERIOD_YN" name="SCH_CHKTHIS_PERIOD_YN" uitype="normal" text="당월" true-value="Y" false-value="N" onclick="fn_chkMonth(SCH_CHKTHIS_PERIOD_YN)" ></sbux-checkbox>
									    </span>
	                            	</div>
								</td>
							</tr>
	
	                        <tr>
								                            
	                            <th scope="row" class="th_bg_search">통화</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select style="width:150px" id="SCH_CURRENCY_CODE" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
								                            
	                            <th scope="row" class="th_bg_search">계정수준</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select style="width:150px" id="SCH_ACCOUNT_GROUP" uitype="single" jsondata-ref="jsonAccountGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">조건</th>
	                            <td colspan="9" class="td_input" >
	                            	<div style="display:flex;float:left">
	                            	
		                            	<font>기초포함</font>
									    <font style="padding-left:10px;"></font>  
		                            	<sbux-checkbox id="SCH_CHKBEGIN_INCLUDE_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
		                            	
									    <font style="padding-left:30px;"></font>  
									    
		                            	<font>Zero포함</font>
									    <font style="padding-left:10px;"></font>  
		                            	<sbux-checkbox id="SCH_CHKZERO_INCLUDE_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
		                            	
									    <font style="padding-left:30px;"></font>  
		                            	
		                            	<font>상위계정포함</font>
									    <font style="padding-left:10px;"></font>  
		                            	<sbux-checkbox id="SCH_CHKPARENT_INCLUDE_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
	
									    <font style="padding-left:30px;"></font>  
	
		                            	<font>표준재무제표계정표시</font>
									    <font style="padding-left:10px;"></font>  
		                            	<sbux-checkbox id="SCH_CHKREPORT_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
									    
									    <font style="padding-left:30px;"></font>  
	
		                            	<font>본사계정표시</font>
									    <font style="padding-left:10px;"></font>  
		                            	<sbux-checkbox id="SCH_CHKHQ_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
	                            	</div>
	                            </td>   
	                            
	                        </tr>
	                        
	                    </tbody>
	                </table>
	
	            </div>
                
				<div class="table-responsive tbl_scroll_sm" style="padding-top:10px">
				
				    <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="normal"
	                   title-target-id-array = "sb_area_tab1^sb_area_tab2"
	                   title-text-array = "시산표(밴드)^시산표(트리)"
	                   title-target-value-array="1^2"
	                   onclick="fn_tabClick(tab_norm)"></sbux-tabs>					
					
					<div class="tab-content">
						<div id="sb_area_tab1" >
							<div id="SB_TAB1_GRID" style="height:500px; width:100%;">
							</div>
						</div>
						<div id="sb_area_tab2" >
		                    <div style="display:flex;vertical-align:middle;float:right;padding-top:0px;padding-bottom:5px;margin-right:auto">
			                    <sbux-button uitype="normal" text="트리펼치기"  class="btn btn-sm btn-outline-danger" onclick="fn_treeOpen()" ></sbux-button>
			                    <span style="width:5px"></span>
			                    <sbux-button uitype="normal" text="트리접기"  	class="btn btn-sm btn-outline-danger" onclick="fn_treeClose()" ></sbux-button>
							</div>
							<div id="SB_TAB2_GRID" style="height:500px; width:100%;">
							</div>
						</div>
					</div>
				</div>
                
            </div>
            
        </div>
    </section>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';
	//-----------------------------------------------------------

	var p_ss_issAccountChief	= '${loginVO.maIsAccountChief}';
	var p_ss_isAccountManager	= '${loginVO.maIsAccountManager}';
	var p_ss_defaultAcctRule	= '${loginVO.maDefaultAcctRule}';
	var p_ss_deptCode			= '${loginVO.maDeptCode}';
	var p_ss_deptName			= '${loginVO.maDeptName}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	
	var jsonFiOrgCode		= [];	// APC
	var jsonSiteCode		= [];	// 사업장
	var jsonAcctRuleCode	= [];	// 회계기준
	var jsonCurrencyCode	= [];	// 통화
	var jsonAccountGroup	= [];	// 계정수준
	
    //grid 초기화
    var Fig5210Grid; 					// 그리드를 담기위한 객체 선언
    var jsonFig5210Grid 		= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fig5210Tree; 					// 그리드를 담기위한 객체 선언
    var jsonFig5210Tree 		= []; 	// 그리드의 참조 데이터 주소 선언
    
    var p_sel_tab			= 1;	// 현재탭
    
    var gd1_title_gigan		= null;		
    var gd1_title_cha		= null;		
    var gd1_title_dae		= null;		
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // APC
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],			jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE'],			jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE'],		jsonAcctRuleCode, 	'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['SCH_CURRENCY_CODE'],		jsonCurrencyCode, 	'L_COM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            // 계정수준
            gfnma_setComSelect(['SCH_ACCOUNT_GROUP'],		jsonAccountGroup, 	'L_FIG011_Y', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state();
  		fn_createFig5210Grid();
  		fn_createFig5210Tree();  		
	}    
	
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	
    	fn_init();
    });

    /**
     * 화면 state 변경
     */
    function fn_state() {
    	
    	//년월
        var sdate	= gfnma_date1().substr(0,4) + '01';
        var edate	= gfnma_date1().substr(0,4) + gfnma_date1().substr(5,2);
		SBUxMethod.set('SCH_YMDPERIOD_FR', 		sdate);
		SBUxMethod.set('SCH_YMDPERIOD_TO', 		edate);
		
		SBUxMethod.set('SCH_FI_ORG_CODE', 			p_ss_fiOrgCode);
		SBUxMethod.set('SCH_ACCT_RULE_CODE', 		p_ss_defaultAcctRule);
		SBUxMethod.set('SCH_ACCOUNT_GROUP', 		'C');
		SBUxMethod.set('SCH_CHKBEGIN_INCLUDE_YN', 	'Y');
		SBUxMethod.set('SCH_CHKPARENT_INCLUDE_YN', 	'Y');
		SBUxMethod.set('SCH_CHKZERO_INCLUDE_YN', 	'Y');
		SBUxMethod.set('SCH_CHKTHIS_PERIOD_YN', 	'N');
		
    	fn_gridSetTitle();
    }
    
    /**
     * 시산표 그리드 (Tab1)
     */
    function fn_createFig5210Grid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_TAB1_GRID';
	    SBGridProperties.id 				= 'Fig5210Grid';
	    SBGridProperties.jsonref 			= 'jsonFig5210Grid';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total 				= {
                type 		: 'grand',
                position	: 'bottom',
                columns		: {
                    standard : [0],
                    sum : [0,1,2,6,7,8]
                },
                grandtotalrow : {
                    titlecol 		: 5,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["차변",			"차변기초잔액"],	ref: 'DEBIT_BAL_AMT_F_BEGIN', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["차변",			"차변잔액"],		ref: 'DEBIT_BALANCE_AMT_F', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["차변",			gd1_title_cha],		ref: 'DEBIT_SUM_AMT_F', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd1_title_gigan,	"계정Level"],		ref: 'ACCOUNT_GROUP',			type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: [gd1_title_gigan,	"계정코드"], 		ref: 'ACCOUNT_CODE', 			type:'button',  	width:'100px', 		style:'text-align:left', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['ACCOUNT_CODE']){
            			var tmp = "fn_gridPopup1(event, '" + objRowData['ACCOUNT_CODE'] + "', '" + objRowData['ACCOUNT_NAME'] + "' )";
            			//console.log('tmp:', tmp);
		        		return '<a style="text-decoration: underline;cursor:pointer;color:#149fff" href="#" onClick="' + tmp + '">' + objRowData['ACCOUNT_CODE'] + '</a>';
            		} else {
            			return "";
            		}
            	}	
            },
            
            {caption: [gd1_title_gigan,	"계정과목"],		ref: 'ACCOUNT_NAME',			type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption: ["대변",			gd1_title_dae],		ref: 'CREDIT_SUM_AMT_F', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["대변",			"대변잔액"],		ref: 'CREDIT_BALANCE_AMT_F', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["대변",			"대변기초잔액"],	ref: 'CREDIT_BAL_AMT_F_BEGIN', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["비고",			""],				ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fig5210Grid = _SBGrid.create(SBGridProperties);
        //Fig5210Grid.bind('click', 'fn_viewFig5210GridEvent');
    }
    
    /**
     * 시산표 그리드 (Tab1)
     */
    function fn_createFig5210Tree() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_TAB2_GRID';
	    SBGridProperties.id 				= 'Fig5210Tree';
	    SBGridProperties.jsonref 			= 'jsonFig5210Tree';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.tree = {
	            col: 0,
	            levelref: 'LEVEL',
	            open: true,
	            lock: true
	    },
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total 				= {
                type 		: 'grand',
                position	: 'bottom',
                columns		: {
                    standard : [0],
                    sum : [3,4,5,6,7,8]
                },
                grandtotalrow : {
                    titlecol 		: 2,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["계정그룹"],			ref: 'ACCOUNT_GROUP', 			type:'output', 		width:'150px', 		style:'text-align:left'},
            {caption: ["계정코드"], 		ref: 'ACCOUNT_CODE', 			type:'button',  	width:'100px', 		style:'text-align:left', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['ACCOUNT_CODE']){
            			var tmp = "fn_gridPopup1(event, '" + objRowData['ACCOUNT_CODE'] + "', '" + objRowData['ACCOUNT_NAME'] + "' )";
            			//console.log('tmp:', tmp);
		        		return '<a style="text-decoration: underline;cursor:pointer;color:#149fff" href="#" onClick="' + tmp + '">' + objRowData['ACCOUNT_CODE'] + '</a>';
            		} else {
            			return "";
            		}
            	}	
            },
            
            {caption: [gd2_title_gigan],	ref: 'ACCOUNT_NAME', 			type:'output', 		width:'250px', 		style:'text-align:left'},
            {caption: ["차변기초잔액"],		ref: 'DEBIT_BAL_AMT_F_BEGIN', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["차변기말잔액"],		ref: 'DEBIT_BALANCE_AMT_F', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd2_title_cha],		ref: 'DEBIT_SUM_AMT_F', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd2_title_dae],		ref: 'CREDIT_SUM_AMT_F', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["대변기말잔액"],		ref: 'CREDIT_BALANCE_AMT_F', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["대변기초잔액"],		ref: 'CREDIT_BAL_AMT_F_BEGIN', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["비고"],				ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fig5210Tree = _SBGrid.create(SBGridProperties);
        //Fig5210Grid.bind('click', 'fn_viewFig5210GridEvent');
    }

    /**
     * 목록 조회
     */
 	function cfn_search() {
    	if(p_sel_tab==1){
	    	fn_setFig5210Grid('Q');
    	} else {
	    	fn_setFig5210Tree('Q2');
    	}
    }

    /**
     * 시산표(밴드) 목록조회
     */
    const fn_setFig5210Grid = async function(wtype) {
		
    	//타이틀 재구성
    	fn_gridSetTitle();
    	fn_createFig5210Grid();    	
    	//--------------------------
    	
		Fig5210Grid.clearStatus();

		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_ymdperiod_fr		= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_FR"));
		let p_ymdperiod_to		= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_TO"));
		let p_account_group		= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_GROUP"));
		let p_currency_code		= gfnma_nvl(SBUxMethod.get("SCH_CURRENCY_CODE"));
		let p_begin_include_yn	= gfnma_nvl(SBUxMethod.get("SCH_CHKBEGIN_INCLUDE_YN")['SCH_CHKBEGIN_INCLUDE_YN']);
		let p_parent_include_yn	= gfnma_nvl(SBUxMethod.get("SCH_CHKPARENT_INCLUDE_YN")['SCH_CHKPARENT_INCLUDE_YN']);
		let p_zero_include_yn	= gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!p_ymdperiod_fr || !p_ymdperiod_to){
 			gfn_comAlert("E0000","기간을 선택하세요");
			return;      		 
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_ACCT_RULE_CODE		: p_acct_rule_code
			,V_P_FI_ORG_CODE		: p_fi_org_code
			,V_P_SITE_CODE			: p_site_code
			,V_P_PERIOD_FR			: p_ymdperiod_fr
			,V_P_PERIOD_TO			: p_ymdperiod_to
			,V_P_ACCOUNT_GROUP		: p_account_group
			,V_P_CURRENCY_CODE		: p_currency_code
			,V_P_BEGIN_INCLUDE_YN	: p_begin_include_yn
			,V_P_PARENT_INCLUDE_YN	: p_parent_include_yn
			,V_P_ZERO_INCLUDE_YN	: p_zero_include_yn
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5210List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFig5210Grid.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						ACCOUNT_CODE			: gfnma_nvl2(item.ACCOUNT_CODE),
  						ACCOUNT_CODE_VIEW		: gfnma_nvl2(item.ACCOUNT_CODE_VIEW),
  						ACCOUNT_GROUP			: gfnma_nvl2(item.ACCOUNT_GROUP),
  						ACCOUNT_NAME			: gfnma_nvl2(item.ACCOUNT_NAME),
  						ACCT_RULE_CODE			: gfnma_nvl2(item.ACCT_RULE_CODE),
  						COMP_CODE				: gfnma_nvl2(item.COMP_CODE),
  						CREDIT_BALANCE_AMT_F	: gfnma_nvl2(item.CREDIT_BALANCE_AMT_F),
  						CREDIT_BALANCE_AMT_O	: gfnma_nvl2(item.CREDIT_BALANCE_AMT_O),
  						CREDIT_BAL_AMT_F_BEGIN	: gfnma_nvl2(item.CREDIT_BAL_AMT_F_BEGIN),
  						CREDIT_BAL_AMT_O_BEGIN	: gfnma_nvl2(item.CREDIT_BAL_AMT_O_BEGIN),
  						CREDIT_SUM_AMT_F		: gfnma_nvl2(item.CREDIT_SUM_AMT_F),
  						CREDIT_SUM_AMT_O		: gfnma_nvl2(item.CREDIT_SUM_AMT_O),
  						DEBIT_BALANCE_AMT_F		: gfnma_nvl2(item.DEBIT_BALANCE_AMT_F),
  						DEBIT_BALANCE_AMT_O		: gfnma_nvl2(item.DEBIT_BALANCE_AMT_O),
  						DEBIT_BAL_AMT_F_BEGIN	: gfnma_nvl2(item.DEBIT_BAL_AMT_F_BEGIN),
  						DEBIT_BAL_AMT_O_BEGIN	: gfnma_nvl2(item.DEBIT_BAL_AMT_O_BEGIN),
  						DEBIT_SUM_AMT_F			: gfnma_nvl2(item.DEBIT_SUM_AMT_F),
  						DEBIT_SUM_AMT_O			: gfnma_nvl2(item.DEBIT_SUM_AMT_O),
  						FI_ORG_CODE				: gfnma_nvl2(item.FI_ORG_CODE),
  						FONT_SIZE 				: gfnma_nvl2(item.FONT_SIZE),
  						HQ_ACCOUNT_CODE 		: gfnma_nvl2(item.HQ_ACCOUNT_CODE),
  						HQ_ACCOUNT_NAME 		: gfnma_nvl2(item.HQ_ACCOUNT_NAME),
  						SORT_SEQ 				: gfnma_nvl2(item.SORT_SEQ),
  					}
  					jsonFig5210Grid.push(msg);
  					totalRecordCount ++;
  				});

        		Fig5210Grid.rebuild();
        		fn_setStyleGrid();

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
     * 시산표(트리) 목록조회
     */
    const fn_setFig5210Tree = async function(wtype) {
		
    	//타이틀 재구성
    	fn_gridSetTitle();
    	fn_createFig5210Tree();    	
    	//--------------------------
    	
		Fig5210Tree.clearStatus();

		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_ymdperiod_fr		= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_FR"));
		let p_ymdperiod_to		= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_TO"));
		let p_account_group		= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_GROUP"));
		let p_currency_code		= gfnma_nvl(SBUxMethod.get("SCH_CURRENCY_CODE"));
		let p_begin_include_yn	= gfnma_nvl(SBUxMethod.get("SCH_CHKBEGIN_INCLUDE_YN")['SCH_CHKBEGIN_INCLUDE_YN']);
		let p_parent_include_yn	= gfnma_nvl(SBUxMethod.get("SCH_CHKPARENT_INCLUDE_YN")['SCH_CHKPARENT_INCLUDE_YN']);
		let p_zero_include_yn	= gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!p_ymdperiod_fr || !p_ymdperiod_to){
 			gfn_comAlert("E0000","기간을 선택하세요");
			return;      		 
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_ACCT_RULE_CODE		: p_acct_rule_code
			,V_P_FI_ORG_CODE		: p_fi_org_code
			,V_P_SITE_CODE			: p_site_code
			,V_P_PERIOD_FR			: p_ymdperiod_fr
			,V_P_PERIOD_TO			: p_ymdperiod_to
			,V_P_ACCOUNT_GROUP		: p_account_group
			,V_P_CURRENCY_CODE		: p_currency_code
			,V_P_BEGIN_INCLUDE_YN	: p_begin_include_yn
			,V_P_PARENT_INCLUDE_YN	: p_parent_include_yn
			,V_P_ZERO_INCLUDE_YN	: p_zero_include_yn
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5210List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFig5210Tree.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						ACCOUNT_CODE			: gfnma_nvl2(item.ACCOUNT_CODE),
  						ACCOUNT_CODE_VIEW		: gfnma_nvl2(item.ACCOUNT_CODE_VIEW),
  						ACCOUNT_GROUP			: gfnma_nvl2(item.ACCOUNT_GROUP),
  						ACCOUNT_NAME			: gfnma_nvl2(item.ACCOUNT_NAME),
  						ACCT_RULE_CODE			: gfnma_nvl2(item.ACCT_RULE_CODE),
  						COMP_CODE				: gfnma_nvl2(item.COMP_CODE),
  						CREDIT_BALANCE_AMT_F	: gfnma_nvl2(item.CREDIT_BALANCE_AMT_F),
  						CREDIT_BALANCE_AMT_O	: gfnma_nvl2(item.CREDIT_BALANCE_AMT_O),
  						CREDIT_BAL_AMT_F_BEGIN	: gfnma_nvl2(item.CREDIT_BAL_AMT_F_BEGIN),
  						CREDIT_BAL_AMT_O_BEGIN	: gfnma_nvl2(item.CREDIT_BAL_AMT_O_BEGIN),
  						CREDIT_SUM_AMT_F		: gfnma_nvl2(item.CREDIT_SUM_AMT_F),
  						CREDIT_SUM_AMT_O		: gfnma_nvl2(item.CREDIT_SUM_AMT_O),
  						DEBIT_BALANCE_AMT_F		: gfnma_nvl2(item.DEBIT_BALANCE_AMT_F),
  						DEBIT_BALANCE_AMT_O		: gfnma_nvl2(item.DEBIT_BALANCE_AMT_O),
  						DEBIT_BAL_AMT_F_BEGIN	: gfnma_nvl2(item.DEBIT_BAL_AMT_F_BEGIN),
  						DEBIT_BAL_AMT_O_BEGIN	: gfnma_nvl2(item.DEBIT_BAL_AMT_O_BEGIN),
  						DEBIT_SUM_AMT_F			: gfnma_nvl2(item.DEBIT_SUM_AMT_F),
  						DEBIT_SUM_AMT_O			: gfnma_nvl2(item.DEBIT_SUM_AMT_O),
  						FI_ORG_CODE				: gfnma_nvl2(item.FI_ORG_CODE),
  						FONT_SIZE 				: gfnma_nvl2(item.FONT_SIZE),
  						HQ_ACCOUNT_CODE 		: gfnma_nvl2(item.HQ_ACCOUNT_CODE),
  						HQ_ACCOUNT_NAME 		: gfnma_nvl2(item.HQ_ACCOUNT_NAME),
  						KEYID 					: gfnma_nvl2(item.KEYID),
  						LEVEL 					: gfnma_nvl2(item.LEVEL),
  						PARENTKEYID 			: gfnma_nvl2(item.PARENTKEYID),
  						REPORT_ACCOUNT_CODE 	: gfnma_nvl2(item.REPORT_ACCOUNT_CODE),
  						REPORT_ACCOUNT_NAME 	: gfnma_nvl2(item.REPORT_ACCOUNT_NAME),
  						SORT_SEQ 				: gfnma_nvl2(item.SORT_SEQ),
  					}
  					jsonFig5210Tree.push(msg);
  					totalRecordCount ++;
  				});

        		Fig5210Tree.rebuild();
        		fn_setStyleTree();

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
     * 탭클릭
     */
    const fn_tabClick = function(val) {
    	p_sel_tab = val;
    }

    /**
     * 그리드 타이틀
     */
    const fn_gridSetTitle = function() {
    	
		let p_this_period_yn	= gfnma_nvl(SBUxMethod.get("SCH_CHKTHIS_PERIOD_YN")['SCH_CHKTHIS_PERIOD_YN']);
		let sdate				= SBUxMethod.get("SCH_YMDPERIOD_FR");
		let edate				= SBUxMethod.get("SCH_YMDPERIOD_TO");
		
		if(p_this_period_yn=='Y'){
			gd1_title_gigan = '기간(당월): ' +  edate;
			gd1_title_cha	= '차변합계(당월)';
			gd1_title_dae	= '대변합계(당월)';
			gd2_title_gigan = '기간(당월): ' +  edate;
			gd2_title_cha	= '차변합계(당월)';
			gd2_title_dae	= '대변합계(당월)';
		} else {
			gd1_title_gigan = '기간: ' +  sdate + ' ~ ' + edate;
			gd1_title_cha	= '차변합계';
			gd1_title_dae	= '대변합계';
			gd2_title_gigan = '기간: ' +  sdate + ' ~ ' + edate;
			gd2_title_cha	= '차변합계';
			gd2_title_dae	= '대변합계';
		}
    }

    /**
     * 당월 check
     */
    const fn_chkMonth = function(obj) {
    	if(obj['SCH_CHKTHIS_PERIOD_YN']=='Y'){
            var sdate	= gfnma_date1().substr(0,4) + gfnma_date1().substr(5,2);
            var edate	= gfnma_date1().substr(0,4) + gfnma_date1().substr(5,2);
    		SBUxMethod.set('SCH_YMDPERIOD_FR', 		sdate);
    		SBUxMethod.set('SCH_YMDPERIOD_TO', 		edate);
    	}
    }

    /**
     * 시산표(밴드) 합계 색상
     */
    var fn_setStyleGrid = function() {
    	let allDatas = Fig5210Grid.getGridDataAll();
    	let chk 	 = false;
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['ACCOUNT_GROUP']=='G'){
      			Fig5210Grid.setRowStyle(i+2, 'data', 'background', '#d4f1da');
      			chk = true;
      		}
      	}
      	if(chk){
	      	Fig5210Grid.clearSelection();
      	}
  	}     

    /**
     * 시산표(트리) 합계 색상
     */
    var fn_setStyleTree = function() {
    	let allDatas = Fig5210Tree.getGridDataAll();
    	let chk 	 = false;
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['ACCOUNT_GROUP']=='G'){
      			Fig5210Tree.setRowStyle(i+1, 'data', 'background', '#d4f1da');
      			chk = true;
      		}
      	}
      	if(chk){
      		Fig5210Tree.clearSelection();
      	}
  	}    

    /**
     * 트리펼치기
     */
    var fn_treeOpen = function() {
    	Fig5210Tree.openTreeNodeAll();
  	}    

    /**
     * 트리접기
     */
    var fn_treeClose = function() {
    	Fig5210Tree.closeTreeNodeAll();
  	}    
    
    const fn_btnPrint = async function () {
		let conn = '';
	    conn = await fn_getReportData();
	    conn = await gfnma_convertDataForReport(conn);
	    await gfn_popClipReportPost("합계잔액시산표", "ma/RPT_FIG5210.crf", null, conn );
	}
    
	const fn_getReportData = async function() {
		
		let ACCT_RULE_CODE		= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let FI_ORG_CODE			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let SITE_CODE			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let YMDPERIOD_FR		= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_FR"));
		let YMDPERIOD_TO		= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_TO"));
		let ACCOUNT_GROUP		= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_GROUP"));
		let CURRENCY_CODE		= gfnma_nvl(SBUxMethod.get("SCH_CURRENCY_CODE"));
		let BEGIN_INCLUDE_YN	= gfnma_nvl(SBUxMethod.get("SCH_CHKBEGIN_INCLUDE_YN")['SCH_CHKBEGIN_INCLUDE_YN']);
		let PARENT_INCLUDE_YN	= gfnma_nvl(SBUxMethod.get("SCH_CHKPARENT_INCLUDE_YN")['SCH_CHKPARENT_INCLUDE_YN']);
		let ZERO_INCLUDE_YN		= gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
	    var paramObj = {
				V_P_DEBUG_MODE_YN		: ''
				,V_P_LANG_ID			: ''
				,V_P_COMP_CODE			: gv_ma_selectedCorpCd
				,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
				
				,V_P_ACCT_RULE_CODE		: ACCT_RULE_CODE
				,V_P_FI_ORG_CODE		: FI_ORG_CODE
				,V_P_SITE_CODE			: SITE_CODE
				,V_P_PERIOD_FR			: YMDPERIOD_FR
				,V_P_PERIOD_TO			: YMDPERIOD_TO
				,V_P_ACCOUNT_GROUP		: ACCOUNT_GROUP
				,V_P_CURRENCY_CODE		: CURRENCY_CODE
				,V_P_BEGIN_INCLUDE_YN	: BEGIN_INCLUDE_YN
				,V_P_PARENT_INCLUDE_YN	: PARENT_INCLUDE_YN
				,V_P_ZERO_INCLUDE_YN	: ZERO_INCLUDE_YN
				
				,V_P_FORM_ID			: p_formId
				,V_P_MENU_ID			: p_menuId
				,V_P_PROC_ID			: ''
				,V_P_USERID				: p_userId
				,V_P_PC					: '' 
	    };
	    const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5210Report.do", {
	        getType				: 'json',
	        workType			: 'REPORT',
	        cv_count			: '2',
	        params				: gfnma_objectToString(paramObj)
	    });
	    const data = await postJsonPromise;
	    try {
	        if (_.isEqual("S", data.resultStatus)) {
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
	    return data;
	}
    
    /**
     * 그리드내 링크(계정코드) 조회
     */
 	function fn_gridPopup1(event, account_code_view, account_name) {
		event.preventDefault();	
		console.log('account_code_view:', account_code_view);		
        
        var obj = {
        	'MENU_MOVE'				: 'Y'	
        	,'FI_ORG_CODE' 			: SBUxMethod.get('SCH_FI_ORG_CODE') 
        	,'SITE_CODE' 			: SBUxMethod.get('SCH_SITE_CODE') 
        	,'ACCT_RULE_CODE'		: SBUxMethod.get('SCH_ACCT_RULE_CODE') 
        	,'YMDPERIOD_FR' 		: SBUxMethod.get('SCH_YMDPERIOD_FR') 
        	,'YMDPERIOD_TO' 		: SBUxMethod.get('SCH_YMDPERIOD_TO') 
        	,'ACCOUNT_GROUP' 		: SBUxMethod.get('SCH_ACCOUNT_GROUP') 
        	,'ACCOUNT_CODE' 		: account_code_view
        	,'ACCOUNT_NAME' 		: account_name
        	,'target'				: 'MA_A20_030_030_210'
        }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);
	}    
    
	
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>