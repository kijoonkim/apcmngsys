<%
/**
 * @Class Name 		: fig5240.jsp
 * @Description 	: 재무상태표 화면
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
	<title>title : 재무상태표</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../../frame/inc/clipreport.jsp" %>	
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 재무상태표 -->
                </div>
                <div style="margin-left: auto;">
       				<sbux-button id="btnPrint" name="btnPrint" uitype="normal" class="btn btn-sm btn-outline-danger" text="리포트 출력" onclick="fn_btnPrint"></sbux-button>                            
                    <sbux-button uitype="normal" text="계정별원장조회"  class="btn btn-sm btn-outline-danger" onclick="fn_account()" ></sbux-button>
                </div>
            </div>
            <div class="box-body">

                <!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
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
                            <th scope="row" class="th_bg">사업단위</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            
                            <th scope="row" class="th_bg">사업장</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            
                            <th scope="row" class="th_bg">회계기준</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select style="width:150px" id="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            
                        </tr>
                        
                        <tr>
                            <th scope="row" class="th_bg">기준년월</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-datepicker
									uitype="popup"
									id="SCH_YMDPERIOD_FR"
							        datepicker-mode="month"
							        date-format="yyyy-mm"
							        style="width:80px"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
							        onchange = "fn_cngBasicDate"
								></sbux-datepicker>
							</td>
							                            
                            <th scope="row" class="th_bg">계정수준</th>
                            <td colspan="3" class="td_input" >
                            	<div style="display:flex;float:left">
	                                <sbux-select style="width:100px" id="SCH_ACCOUNT_LEVEL" uitype="single" jsondata-ref="jsonAccountLevel" unselected-text="선택" class="form-control input-sm"></sbux-select>
								    <font style="padding-left:5px;"></font>  
	                            	<sbux-checkbox id="SCH_CHKSUM_YN" uitype="normal" text="순잔액표시" true-value="Y" false-value="N" ></sbux-checkbox>
                            	</div>
                            </td>
							                            
                            <th scope="row" class="th_bg">비고1</th>
                            <td colspan="3" class="td_input" >
                            	<div style="display:flex;float:left">
	                                <sbux-select style="width:150px" id="SCH_CBODESCR1" name="SCH_CBODESCR1" uitype="single" jsondata-ref="jsonCbodescr1" unselected-text="선택" class="form-control input-sm" onchange="fn_cngCbodescr1(SCH_CBODESCR1)"></sbux-select>
									<sbux-datepicker
										uitype="popup"
										id="SCH_YYMDSELECT_PERIOD1"
								        datepicker-mode="month"
								        date-format="yyyy-mm"
								        style="width:80px"
										class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									></sbux-datepicker>
								</div>
                            </td>
                            
                        </tr>
                        
                        <tr>
                            <th scope="row" class="th_bg">비고2</th>
                            <td colspan="3" class="td_input" >
                            	<div style="display:flex;float:left">
	                                <sbux-select style="width:150px" id="SCH_CBODESCR2" name="SCH_CBODESCR2" uitype="single" jsondata-ref="jsonCbodescr2" unselected-text="선택" class="form-control input-sm" onchange="fn_cngCbodescr2(SCH_CBODESCR2)"></sbux-select>
									<sbux-datepicker
										uitype="popup"
										id="SCH_YYMDSELECT_PERIOD2"
								        datepicker-mode="month"
								        date-format="yyyy-mm"
								        style="width:80px"
										class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									></sbux-datepicker>
								</div>
                            </td>
                        
                            <th scope="row" class="th_bg">조건</th>
                            <td colspan="4" class="td_input" >
                            	<div style="display:flex;float:left">
                            	
	                            	<font>표준재무제표계정표시</font>
								    <font style="padding-left:10px;"></font>  
	                            	<sbux-checkbox id="SCH_CHKREPORT_YN" name="SCH_CHKREPORT_YN" uitype="normal" text="예" true-value="Y" false-value="N" onchange="fn_cngChkReportYn(SCH_CHKREPORT_YN)"></sbux-checkbox>
	                            	
								    <font style="padding-left:30px;"></font>  
								    
	                            	<font>Zero포함</font>
								    <font style="padding-left:10px;"></font>  
	                            	<sbux-checkbox id="SCH_CHKZERO_INCLUDE_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
	                            	
								    <font style="padding-left:30px;"></font>  
	                            	
	                            	<font>본사계정표시</font>
								    <font style="padding-left:10px;"></font>  
	                            	<sbux-checkbox id="SCH_CHKHQ_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
                            	</div>
                            </td>     
                            <td colspan="3" class="td_input" >
                            </td>                                                   
                        </tr>
                        
                    </tbody>
                </table>
                
				<div class="table-responsive tbl_scroll_sm" style="padding-top:10px">
				    <sbux-tabs 
				        id="idxTab_norm" name="tab_norm" uitype="normal"
	                    title-target-id-array = "sb_area_tab1^sb_area_tab2^sb_area_tab3^sb_area_tab4"
	                    title-text-array = "재무상태표(밴드)^재무상태표(트리)^(월)재무상태표^(월)재무상태표(트리)"
	                    title-target-value-array="1^2^3^4"
	                    onclick="fn_tabClick(tab_norm)">
	                </sbux-tabs>   					
					
					<div class="tab-content">
					
						<div id="sb_area_tab1" >
							<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
								<font style="margin-right:auto;">재무상태표</font>
                				<div style="margin-left: auto;">
								</div>
							</div>
							<div id="SB_TAB1_GRID" style="height:435px; width:100%;">
							</div>
						</div>
						
						<div id="sb_area_tab2" >
							<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
								<font style="margin-right:auto;">트리형식 재무상태표</font>
                				<div style="margin-left: auto;">
				                    <sbux-button uitype="normal" text="트리펼치기"  class="btn btn-sm btn-outline-danger" onclick="fn_treeOpen1()" ></sbux-button>
				                    <span style="width:5px"></span>
				                    <sbux-button uitype="normal" text="트리접기"  	class="btn btn-sm btn-outline-danger" onclick="fn_treeClose1()" ></sbux-button>
								</div>
							</div>
							<div id="SB_TAB2_GRID" style="height:435px; width:100%;">
							</div>
						</div>
						
						<div id="sb_area_tab3" >
							<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
								<font style="margin-right:auto;">(월)재무상태표</font>
                				<div style="margin-left: auto;">
								</div>
							</div>
							<div id="SB_TAB3_GRID" style="height:435px; width:100%;">
							</div>
						</div>
						
						<div id="sb_area_tab4" >
							<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
								<font style="margin-right:auto;">(월)재무상태표(트리)</font>
                				<div style="margin-left: auto;">
				                    <sbux-button uitype="normal" text="트리펼치기"  class="btn btn-sm btn-outline-danger" onclick="fn_treeOpen2()" ></sbux-button>
				                    <span style="width:5px"></span>
				                    <sbux-button uitype="normal" text="트리접기"  	class="btn btn-sm btn-outline-danger" onclick="fn_treeClose2()" ></sbux-button>
								</div>
							</div>
							<div id="SB_TAB4_GRID" style="height:435px; width:100%;">
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
	
	var jsonFiOrgCode		= [];	// 사업단위
	var jsonSiteCode		= [];	// 사업장
	var jsonAcctRuleCode	= [];	// 회계기준
	var jsonAccountLevel	= [];	// 계정수준
	var jsonCbodescr1		= [];	// 비고1
	var jsonCbodescr2		= [];	// 비고2
	
    //grid 초기화
    var Fig5240Grid1; 					// 그리드를 담기위한 객체 선언
    var jsonFig5240Grid1 		= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fig5240Grid2; 					// 그리드를 담기위한 객체 선언
    var jsonFig5240Grid2 		= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fig5240Grid3; 					// 그리드를 담기위한 객체 선언
    var jsonFig5240Grid3 		= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fig5240Grid4; 					// 그리드를 담기위한 객체 선언
    var jsonFig5240Grid4 		= []; 	// 그리드의 참조 데이터 주소 선언
    
    var p_sel_tab				= 1;	// 현재탭
    
    var gd1_col_4_visible		= true	// 그리드 컬럼의 state
    var gd1_col_5_visible		= true	// 그리드 컬럼의 state
    var gd1_col_6_visible		= true	// 그리드 컬럼의 state
    var gd1_col_7_visible		= true	// 그리드 컬럼의 state

    var gd2_col_4_visible		= true	// 그리드 컬럼의 state
    var gd2_col_5_visible		= true	// 그리드 컬럼의 state
    var gd2_col_6_visible		= true	// 그리드 컬럼의 state
    var gd2_col_7_visible		= true	// 그리드 컬럼의 state
    var gd2_col_9_visible		= true	// 그리드 컬럼의 state
    var gd2_col_10_visible		= true	// 그리드 컬럼의 state
    var gd2_col_11_visible		= true	// 그리드 컬럼의 state
    var gd2_col_12_visible		= true	// 그리드 컬럼의 state
    var gd2_col_13_visible		= true	// 그리드 컬럼의 state
    var gd2_col_14_visible		= true	// 그리드 컬럼의 state

    var gd3_col_4_visible		= true	// 그리드 컬럼의 state
    var gd3_col_5_visible		= true	// 그리드 컬럼의 state
    var gd3_col_6_visible		= true	// 그리드 컬럼의 state
    var gd3_col_7_visible		= true	// 그리드 컬럼의 state

    var gd4_col_4_visible		= true	// 그리드 컬럼의 state
    var gd4_col_5_visible		= true	// 그리드 컬럼의 state
    var gd4_col_6_visible		= true	// 그리드 컬럼의 state
    var gd4_col_7_visible		= true	// 그리드 컬럼의 state
    
    var strBMCation 	= "전월금액";  	//전월 캡션
    var strBMperiod 	= "";  			//전월 기간

    var strBBMCation 	= "전전월금액"; //전전월 캡션
    var strBBMperiod 	= "";  			//전전월 기간

    var strBECation 	= "전기말금액"; //전기말 캡션
    var strBEperiod 	= "";  			//전기말 기간
    
    var strBSCation 	= "전동기금액";	//전동기 캡션
    var strBSperiod 	= "";  			//전동기 기간
    
    var gd1_title_1		= null;		
    var gd1_title_1_1	= null;		
    var gd1_title_2		= null;		
    var gd1_title_3		= null;		

    var gd2_title_0		= '당기금액';		
    var gd2_title_1		= '전기말금액';		
    var gd2_title_2		= '전동기금액';		
    var gd2_title_3		= '전월금액';		
    var gd2_title_4		= '전전월금액';		
    var gd2_title_5		= '선택1금액';		
    var gd2_title_6		= '선택2금액';		

	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],			jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE'],			jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE'],		jsonAcctRuleCode, 	'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 계정수준
            gfnma_setComSelect(['SCH_ACCOUNT_LEVEL'],		jsonAccountLevel, 	'L_FIG011_Y', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 비고1
            gfnma_setComSelect(['SCH_CBODESCR1'],			jsonCbodescr1, 		'L_FIM130', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 비고2
            gfnma_setComSelect(['SCH_CBODESCR2'],			jsonCbodescr2, 		'L_FIM130', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state();
  		fn_createFig5240Grid1();
	}    
	
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	
    	fn_init();
    });

    /**
     * 화면 state 변경
     */
    function fn_state() {
    	
		SBUxMethod.set('SCH_FI_ORG_CODE', 			p_ss_fiOrgCode);
		SBUxMethod.set('SCH_ACCT_RULE_CODE', 		p_ss_defaultAcctRule);
		SBUxMethod.set('SCH_CHKSUM_YN', 			'N');
		SBUxMethod.set('SCH_CHKZERO_INCLUDE_YN', 	'Y');
    	
    	//년월
        var sdate	= gfnma_date1().substr(0,4) + gfnma_date1().substr(5,2);
		SBUxMethod.set('SCH_YMDPERIOD_FR', 			sdate);
		SBUxMethod.set('SCH_YYMDSELECT_PERIOD1', 	sdate);
		SBUxMethod.set('SCH_YYMDSELECT_PERIOD2', 	sdate);    	
		
		SBUxMethod.hide('SCH_YYMDSELECT_PERIOD1');
		SBUxMethod.hide('SCH_YYMDSELECT_PERIOD2');
		
		SBUxMethod.set('SCH_ACCOUNT_LEVEL', 		'C');
		SBUxMethod.set('SCH_CBODESCR1', 			'BE');	//전기말
		SBUxMethod.set('SCH_CBODESCR2', 			'BS');	//전동기
		
		gd1_col_4_visible	= false;
		gd1_col_5_visible	= false;
		gd1_col_6_visible	= false;
		gd1_col_7_visible	= false;
		
		gd2_col_4_visible	= false;
		gd2_col_5_visible	= false;
		gd2_col_6_visible	= false;
		gd2_col_7_visible	= false;
		
		gd3_col_4_visible	= false;
		gd3_col_5_visible	= false;
		gd3_col_6_visible	= false;
		gd3_col_7_visible	= false;
		
		gd4_col_4_visible	= false;
		gd4_col_5_visible	= false;
		gd4_col_6_visible	= false;
		gd4_col_7_visible	= false;
		
    	fn_gridSetTitle();
    }
    
    /**
     * 재무상태표밴드 (Tab1)
     */
    function fn_createFig5240Grid1() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_TAB1_GRID';
	    SBGridProperties.id 				= 'Fig5240Grid1';
	    SBGridProperties.jsonref 			= 'jsonFig5240Grid1';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["계정과목",		"계정구분"],		ref: 'ACCOUNT_GROUP', 			hidden:false,		type:'output',  	width:'80px'	,  	style:'text-align:left'},
            
            {caption: ["계정과목",		"계정과목코드"], 	ref: 'ACCOUNT_CODE_VIEW', 		hidden:false,		type:'button',  	width:'100px', 		style:'text-align:left', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['ACCOUNT_CODE_VIEW']){
            			var tmp = "fn_gridPopup1(event, '" + objRowData['ACCOUNT_CODE_VIEW'] + "', '" + objRowData['ACCOUNT_NAME'] + "' )";
            			//console.log('tmp:', tmp);
		        		return '<a style="text-decoration: underline;cursor:pointer;color:#149fff" href="#" onClick="' + tmp + '">' + objRowData['ACCOUNT_CODE_VIEW'] + '</a>';
            		} else {
            			return "";
            		}
            	}	
            },
            
            {caption: ["계정과목",		"계정과목명"],		ref: 'ACCOUNT_NAME', 			hidden:false,		type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption: ["본사계정",		"본사계정코드"],	ref: 'HQ_ACCOUNT_CODE', 		hidden:!gd1_col_4_visible,		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["본사계정",		"본사계정명"],		ref: 'HQ_ACCOUNT_NAME', 		hidden:!gd1_col_5_visible,		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["보고서계정",	"보고서계정코드"],	ref: 'REPORT_ACCOUNT_CODE', 	hidden:!gd1_col_6_visible,		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["보고서계정",	"보고서계정명"],	ref: 'REPORT_ACCOUNT_NAME',		hidden:!gd1_col_7_visible,		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: [gd1_title_1,		"당기세부"],		ref: 'THIS_DETAIL_AMT', 		hidden:false,		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: [gd1_title_1,		gd1_title_1_1],		ref: 'THIS_SUMMARY_AMT', 		hidden:false,		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: [gd1_title_2,		"전기말세부"],		ref: 'PREV_END_DETAIL_AMT', 	hidden:false,		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: [gd1_title_2,		"전기말요약"],		ref: 'PREV_END_SUMMARY_AMT', 	hidden:false,		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: [gd1_title_3,		"전동기세부"],		ref: 'PREV_DETAIL_AMT', 		hidden:false,		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: [gd1_title_3,		"전동기요약"],		ref: 'PREV_SUMMARY_AMT', 		hidden:false,		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["비고",			""],				ref: 'ETC', 					hidden:false,		type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fig5240Grid1 = _SBGrid.create(SBGridProperties);
        //Fig5240Grid1.bind('click', 'fn_viewFig5240Grid1Event');
        
    }
    
    /**
     * 재무상태표트리 (Tab2)
     */
    function fn_createFig5240Grid2() {

        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_TAB2_GRID';
	    SBGridProperties.id 				= 'Fig5240Grid2';
	    SBGridProperties.jsonref 			= 'jsonFig5240Grid2';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.tree = {
	            col: 0,
	            levelref: 'LVL',
	            open: true,
	            lock: true
	    },
        SBGridProperties.columns = [
            {caption: ["계정그룹"],			ref: 'ACCOUNT_GROUP', 			type:'output', 		width:'150px', 		style:'text-align:left'},
            {caption: ["계정코드"], 		ref: 'ACCOUNT_CODE_VIEW', 		type:'button',  	width:'100px', 		style:'text-align:left', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['ACCOUNT_CODE_VIEW']){
            			var tmp = "fn_gridPopup1(event, '" + objRowData['ACCOUNT_CODE_VIEW'] + "', '" + objRowData['ACCOUNT_NAME'] + "' )";
            			//console.log('tmp:', tmp);
		        		return '<a style="text-decoration: underline;cursor:pointer;color:#149fff" href="#" onClick="' + tmp + '">' + objRowData['ACCOUNT_CODE_VIEW'] + '</a>';
            		} else {
            			return "";
            		}
            	}	
            },
            
            {caption: ["계정과목"],			ref: 'ACCOUNT_NAME', 			type:'output', 		width:'250px', 		style:'text-align:left'},
            
            {caption: ["본사계정코드"],		ref: 'HQ_ACCOUNT_CODE', 		hidden:!gd2_col_4_visible,		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["본사계정명"],		ref: 'HQ_ACCOUNT_NAME', 		hidden:!gd2_col_5_visible,		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["보고서계정코드"],	ref: 'REPORT_ACCOUNT_CODE', 	hidden:!gd2_col_6_visible,		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["보고서계정명"],		ref: 'REPORT_ACCOUNT_NAME',		hidden:!gd2_col_7_visible,		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: [gd2_title_0],		ref: 'THIS_SUMMARY_AMT', 			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: [gd2_title_1],		ref: 'PREV_END_SUMMARY_AMT', 		hidden:!gd2_col_9_visible,		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: [gd2_title_2],		ref: 'PREV_SUMMARY_AMT', 			hidden:!gd2_col_10_visible,		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: [gd2_title_3],		ref: 'PREV_MONTH_SUMMARY_AMT', 		hidden:!gd2_col_11_visible,		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: [gd2_title_4],		ref: 'PREV_PREV_MONTH_SUMMARY_AMT', hidden:!gd2_col_12_visible,		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: [gd2_title_5],		ref: 'SELECT_MONTH_SUMMARY_AMT1', 	hidden:!gd2_col_13_visible,		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: [gd2_title_6],		ref: 'SELECT_MONTH_SUMMARY_AMT2', 	hidden:!gd2_col_14_visible,		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["비고"],				ref: 'ETC', 						type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

	    Fig5240Grid2 = _SBGrid.create(SBGridProperties);
        //Fig5240Grid1.bind('click', 'fn_viewFig5240Grid1Event');
    }
    
    /**
     * (월)재무상태표 (Tab3)
     */
    function fn_createFig5240Grid3() {

        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_TAB3_GRID';
	    SBGridProperties.id 				= 'Fig5240Grid3';
	    SBGridProperties.jsonref 			= 'jsonFig5240Grid3';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["계정구분"],			ref: 'ACCOUNT_GROUP', 			type:'output', 		width:'70px', 		style:'text-align:left'},
            {caption: ["계정과목코드"], 	ref: 'ACCOUNT_CODE_VIEW', 		type:'button',  	width:'100px', 		style:'text-align:left', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['ACCOUNT_CODE_VIEW']){
            			var tmp = "fn_gridPopup1(event, '" + objRowData['ACCOUNT_CODE_VIEW'] + "', '" + objRowData['ACCOUNT_NAME'] + "' )";
            			//console.log('tmp:', tmp);
		        		return '<a style="text-decoration: underline;cursor:pointer;color:#149fff" href="#" onClick="' + tmp + '">' + objRowData['ACCOUNT_CODE_VIEW'] + '</a>';
            		} else {
            			return "";
            		}
            	}	
            },
            
            {caption: ["계정과목"],			ref: 'ACCOUNT_NAME', 			type:'output', 		width:'250px', 		style:'text-align:left'},
            
            {caption: ["본사계정코드"],		ref: 'HQ_ACCOUNT_CODE', 		hidden:!gd3_col_4_visible,		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["본사계정명"],		ref: 'HQ_ACCOUNT_NAME', 		hidden:!gd3_col_5_visible,		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["보고서계정코드"],	ref: 'REPORT_ACCOUNT_CODE', 	hidden:!gd3_col_6_visible,		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["보고서계정명"],		ref: 'REPORT_ACCOUNT_NAME',		hidden:!gd3_col_7_visible,		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["1월"],				ref: 'MON_1',			 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["2월"],				ref: 'MON_2', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["3월"],				ref: 'MON_3', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["4월"],				ref: 'MON_4', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["5월"],				ref: 'MON_5', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["6월"],				ref: 'MON_6', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["7월"],				ref: 'MON_7', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["8월"],				ref: 'MON_8', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["9월"],				ref: 'MON_9', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["10월"],				ref: 'MON_10', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["11월"],				ref: 'MON_11', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["12월"],				ref: 'MON_12', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["비고"],				ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

	    Fig5240Grid3 = _SBGrid.create(SBGridProperties);
        //Fig5240Grid1.bind('click', 'fn_viewFig5240Grid1Event');
    }

    
    /**
     * (월)재무상태표 (Tab4)
     */
    function fn_createFig5240Grid4() {

        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_TAB4_GRID';
	    SBGridProperties.id 				= 'Fig5240Grid4';
	    SBGridProperties.jsonref 			= 'jsonFig5240Grid4';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.tree = {
	            col: 0,
	            levelref: 'LVL',
	            open: true,
	            lock: true
	    },
        SBGridProperties.columns = [
            {caption: ["계정구분"],			ref: 'ACCOUNT_GROUP', 			type:'output', 		width:'180px', 		style:'text-align:left'},
            {caption: ["계정과목코드"], 	ref: 'ACCOUNT_CODE_VIEW', 		type:'button',  	width:'100px', 		style:'text-align:left', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['ACCOUNT_CODE_VIEW']){
            			var tmp = "fn_gridPopup1(event, '" + objRowData['ACCOUNT_CODE_VIEW'] + "', '" + objRowData['ACCOUNT_NAME'] + "' )";
            			//console.log('tmp:', tmp);
		        		return '<a style="text-decoration: underline;cursor:pointer;color:#149fff" href="#" onClick="' + tmp + '">' + objRowData['ACCOUNT_CODE_VIEW'] + '</a>';
            		} else {
            			return "";
            		}
            	}	
            },
            
            {caption: ["계정과목"],			ref: 'ACCOUNT_NAME', 			type:'output', 		width:'250px', 		style:'text-align:left'},
            
            {caption: ["본사계정코드"],		ref: 'HQ_ACCOUNT_CODE', 		hidden:!gd4_col_4_visible,		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["본사계정명"],		ref: 'HQ_ACCOUNT_NAME', 		hidden:!gd4_col_5_visible,		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["보고서계정코드"],	ref: 'REPORT_ACCOUNT_CODE', 	hidden:!gd4_col_6_visible,		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["보고서계정명"],		ref: 'REPORT_ACCOUNT_NAME',		hidden:!gd4_col_7_visible,		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["1월"],				ref: 'MON_1',			 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["2월"],				ref: 'MON_2', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["3월"],				ref: 'MON_3', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["4월"],				ref: 'MON_4', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["5월"],				ref: 'MON_5', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["6월"],				ref: 'MON_6', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["7월"],				ref: 'MON_7', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["8월"],				ref: 'MON_8', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["9월"],				ref: 'MON_9', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["10월"],				ref: 'MON_10', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["11월"],				ref: 'MON_11', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["12월"],				ref: 'MON_12', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["비고"],				ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

	    Fig5240Grid4 = _SBGrid.create(SBGridProperties);
    }
    
    /**
     * 목록 조회
     */
 	function cfn_search() {
    	
		let p_cbodescr1			= gfnma_nvl(SBUxMethod.get("SCH_CBODESCR1"));
		let p_cbodescr2			= gfnma_nvl(SBUxMethod.get("SCH_CBODESCR2"));
		let p_ymdperiod_fr		= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_FR"));
		let p_ymdselect_period1	= gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD1"));
		let p_ymdselect_period2	= gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD2"));
 
		if(p_cbodescr1 != 'SP' || p_cbodescr2 != 'SP'){
			if(p_cbodescr1 == p_cbodescr2){
	 			gfn_comAlert("E0000","비교1과  비교2가 같을 수 없습니다.");
				return;      		 
			}
		}
		if(p_cbodescr1 == 'SP'){
			if(p_ymdperiod_fr == p_ymdselect_period1){
	 			gfn_comAlert("E0000","기준년월과 동일 합니다.");
				return;      		 
			}
		}
		if(p_cbodescr2 == 'SP'){
			if(p_ymdperiod_fr == p_ymdselect_period1){
	 			gfn_comAlert("E0000","기준년월과 동일 합니다.");
				return;      		 
			}
		}
		if(p_cbodescr1 == 'SP' || p_cbodescr2 == 'SP'){
			if(p_ymdselect_period1 == p_ymdselect_period2){
	 			gfn_comAlert("E0000","비교1 기간과 비교2 기간이 같을 수 없습니다.");
				return;      		 
			}
		}
		
		//tpgBSBand 1
		//tpgBSTree 2
		//tpgMonthlyGrid 3
		//tpgMonthlyTree 4
		
		console.log('p_sel_tab:', p_sel_tab);		
		
    	if(p_sel_tab==1){
    		gd1_title_1 = '당기(' + p_ymdperiod_fr + ')';
    		fn_gridVisible();    	
	    	fn_setFig5240Grid1('Q1');
    	} else if(p_sel_tab==2) {
    		gd2_title_0 = '당기금액(' + p_ymdperiod_fr.substr(0,4) + '-' + p_ymdperiod_fr.substr(4,2) + ')';
    		fn_gridVisible();    		
    		fn_setFig5240Grid2('T1');
    	} else if(p_sel_tab==3) {
    		fn_setFig5240Grid3('Q2');
    	} else {
    		fn_setFig5240Grid4('T2');
    	}
    }

    /**
     * 재무상태표(밴드) 목록조회
     */
    const fn_setFig5240Grid1 = async function(wtype) {
		
    	//타이틀 재구성
    	fn_gridSetTitle();
    	fn_createFig5240Grid1();    	
    	//--------------------------
    	
		Fig5240Grid1.clearStatus();

		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_ymdperiod_fr		= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_FR"));
		let p_account_level		= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_LEVEL"));
		let p_chksum_yn			= gfnma_nvl(SBUxMethod.get("SCH_CHKSUM_YN")['SCH_CHKSUM_YN']);
		let p_yymdselect_period1 = gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD1"));
		let p_yymdselect_period2 = gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD2"));
		let p_zero_include_yn	 = gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","사업단위를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!p_ymdperiod_fr){
 			gfn_comAlert("E0000","기준년월을 선택하세요");
			return;      		 
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_ACCT_RULE_CODE		: p_acct_rule_code
			,V_P_FI_ORG_CODE		: p_fi_org_code
			,V_P_SITE_CODE			: p_site_code
			,V_P_PERIOD_CODE		: p_ymdperiod_fr
			,V_P_ACCOUNT_GROUP		: p_account_level
			,V_P_SUM_YN				: p_chksum_yn
			,V_P_SELECT_PERIOD1		: p_yymdselect_period1
			,V_P_SELECT_PERIOD2		: p_yymdselect_period2
			,V_P_ZERO_INCLUDE_YN	: p_zero_include_yn
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5240List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '4',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFig5240Grid1.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						ACCOUNT_CODE				: gfnma_nvl(item.ACCOUNT_CODE),
  						ACCOUNT_CODE_VIEW			: gfnma_nvl(item.ACCOUNT_CODE_VIEW),
  						ACCOUNT_GROUP				: gfnma_nvl(item.ACCOUNT_GROUP),
  						ACCOUNT_NAME				: gfnma_nvl(item.ACCOUNT_NAME),
  						ACCT_RULE_CODE				: gfnma_nvl(item.ACCT_RULE_CODE),
  						
  						BEFORE_BEFORE_MONTH_PERIOD	: gfnma_nvl(item.BEFORE_BEFORE_MONTH_PERIOD),
  						BEFORE_MONTH_PERIOD			: gfnma_nvl(item.BEFORE_MONTH_PERIOD),
  						
  						COMP_CODE					: gfnma_nvl(item.COMP_CODE),
  						FI_ORG_CODE					: gfnma_nvl(item.FI_ORG_CODE),
  						FONT_SIZE 					: gfnma_nvl(item.FONT_SIZE),
  						
  						HQ_ACCOUNT_CODE 			: gfnma_nvl(item.HQ_ACCOUNT_CODE),
  						HQ_ACCOUNT_NAME 			: gfnma_nvl(item.HQ_ACCOUNT_NAME),
  						PREV_DETAIL_AMT 			: gfnma_nvl(item.PREV_DETAIL_AMT),
  						PREV_END_DETAIL_AMT 		: gfnma_nvl(item.PREV_END_DETAIL_AMT),
  						PREV_END_SUMMARY_AMT 		: gfnma_nvl(item.PREV_END_SUMMARY_AMT),
  						PREV_MONTH_DETAIL_AMT 		: gfnma_nvl(item.PREV_MONTH_DETAIL_AMT),
  						PREV_MONTH_SUMMARY_AMT 		: gfnma_nvl(item.PREV_MONTH_SUMMARY_AMT),
  						
  						PREV_PERIOD 				: gfnma_nvl(item.PREV_PERIOD),
  						PREV_PERIOD_END 			: gfnma_nvl(item.PREV_PERIOD_END),
  						PREV_PREV_MONTH_DETAIL_AMT	: gfnma_nvl(item.PREV_PREV_MONTH_DETAIL_AMT),
  						PREV_PREV_MONTH_SUMMARY_AMT : gfnma_nvl(item.PREV_PREV_MONTH_SUMMARY_AMT),
  						PREV_SUMMARY_AMT 			: gfnma_nvl(item.PREV_SUMMARY_AMT),
  						REPORT_ACCOUNT_CODE 		: gfnma_nvl(item.REPORT_ACCOUNT_CODE),
  						REPORT_ACCOUNT_NAME 		: gfnma_nvl(item.REPORT_ACCOUNT_NAME),
  						
  						SELECT_MONTH_DETAIL_AMT1 	: gfnma_nvl(item.SELECT_MONTH_DETAIL_AMT1),
  						SELECT_MONTH_DETAIL_AMT2 	: gfnma_nvl(item.SELECT_MONTH_DETAIL_AMT2),
  						SELECT_MONTH_SUMMARY_AMT1 	: gfnma_nvl(item.SELECT_MONTH_SUMMARY_AMT1),
  						SELECT_MONTH_SUMMARY_AMT2 	: gfnma_nvl(item.SELECT_MONTH_SUMMARY_AMT2),
  						
  						SELECT_PERIOD1				: gfnma_nvl(item.SELECT_PERIOD1),
  						SELECT_PERIOD2				: gfnma_nvl(item.SELECT_PERIOD2),
  						SORT_SEQ 					: gfnma_nvl(item.SORT_SEQ),
  						THIS_DETAIL_AMT 			: gfnma_nvl(item.THIS_DETAIL_AMT),
  						THIS_SUMMARY_AMT			: gfnma_nvl(item.THIS_SUMMARY_AMT),
  					}
  					jsonFig5240Grid1.push(msg);
  					totalRecordCount ++;
  				});

        		Fig5240Grid1.rebuild();
        		fn_setStyle1();
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
     * 재무상태표(트리) 목록조회
     */
    const fn_setFig5240Grid2 = async function(wtype) {
		
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_ymdperiod_fr		= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_FR"));
		let p_account_level		= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_LEVEL"));
		let p_chksum_yn			= gfnma_nvl(SBUxMethod.get("SCH_CHKSUM_YN")['SCH_CHKSUM_YN']);
		let p_yymdselect_period1 = gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD1"));
		let p_yymdselect_period2 = gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD2"));
		let p_zero_include_yn	 = gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","사업단위를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!p_ymdperiod_fr){
 			gfn_comAlert("E0000","기준년월을 선택하세요");
			return;      		 
		}

	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_ACCT_RULE_CODE		: p_acct_rule_code
			,V_P_FI_ORG_CODE		: p_fi_org_code
			,V_P_SITE_CODE			: p_site_code
			,V_P_PERIOD_CODE		: p_ymdperiod_fr
			,V_P_ACCOUNT_GROUP		: p_account_level
			,V_P_SUM_YN				: p_chksum_yn
			,V_P_SELECT_PERIOD1		: p_yymdselect_period1
			,V_P_SELECT_PERIOD2		: p_yymdselect_period2
			,V_P_ZERO_INCLUDE_YN	: p_zero_include_yn

			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5240List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '4',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	    		jsonFig5240Grid2.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						LVL							: gfnma_nvl(item.LVL),
  						
  						ACCOUNT_CODE				: gfnma_nvl(item.ACCOUNT_CODE),
  						ACCOUNT_CODE_VIEW			: gfnma_nvl(item.ACCOUNT_CODE_VIEW),
  						ACCOUNT_GROUP				: gfnma_nvl(item.ACCOUNT_GROUP),
  						ACCOUNT_NAME				: gfnma_nvl(item.ACCOUNT_NAME),
  						ACCT_RULE_CODE				: gfnma_nvl(item.ACCT_RULE_CODE),
  						
  						BEFORE_BEFORE_MONTH_PERIOD	: gfnma_nvl(item.BEFORE_BEFORE_MONTH_PERIOD),
  						BEFORE_MONTH_PERIOD			: gfnma_nvl(item.BEFORE_MONTH_PERIOD),
  						
  						COMP_CODE					: gfnma_nvl(item.COMP_CODE),
  						FI_ORG_CODE					: gfnma_nvl(item.FI_ORG_CODE),
  						FONT_SIZE 					: gfnma_nvl(item.FONT_SIZE),
  						
  						HQ_ACCOUNT_CODE 			: gfnma_nvl(item.HQ_ACCOUNT_CODE),
  						HQ_ACCOUNT_NAME 			: gfnma_nvl(item.HQ_ACCOUNT_NAME),
  						PREV_DETAIL_AMT 			: gfnma_nvl(item.PREV_DETAIL_AMT),
  						PREV_END_DETAIL_AMT 		: gfnma_nvl(item.PREV_END_DETAIL_AMT),
  						PREV_END_SUMMARY_AMT 		: gfnma_nvl(item.PREV_END_SUMMARY_AMT),
  						PREV_MONTH_DETAIL_AMT 		: gfnma_nvl(item.PREV_MONTH_DETAIL_AMT),
  						PREV_MONTH_SUMMARY_AMT 		: gfnma_nvl(item.PREV_MONTH_SUMMARY_AMT),
  						
  						PREV_PERIOD 				: gfnma_nvl(item.PREV_PERIOD),
  						PREV_PERIOD_END 			: gfnma_nvl(item.PREV_PERIOD_END),
  						PREV_PREV_MONTH_DETAIL_AMT	: gfnma_nvl(item.PREV_PREV_MONTH_DETAIL_AMT),
  						PREV_PREV_MONTH_SUMMARY_AMT : gfnma_nvl(item.PREV_PREV_MONTH_SUMMARY_AMT),
  						PREV_SUMMARY_AMT 			: gfnma_nvl(item.PREV_SUMMARY_AMT),
  						REPORT_ACCOUNT_CODE 		: gfnma_nvl(item.REPORT_ACCOUNT_CODE),
  						REPORT_ACCOUNT_NAME 		: gfnma_nvl(item.REPORT_ACCOUNT_NAME),
  						
  						SELECT_MONTH_DETAIL_AMT1 	: gfnma_nvl(item.SELECT_MONTH_DETAIL_AMT1),
  						SELECT_MONTH_DETAIL_AMT2 	: gfnma_nvl(item.SELECT_MONTH_DETAIL_AMT2),
  						SELECT_MONTH_SUMMARY_AMT1 	: gfnma_nvl(item.SELECT_MONTH_SUMMARY_AMT1),
  						SELECT_MONTH_SUMMARY_AMT2 	: gfnma_nvl(item.SELECT_MONTH_SUMMARY_AMT2),
  						
  						SELECT_PERIOD1				: gfnma_nvl(item.SELECT_PERIOD1),
  						SELECT_PERIOD2				: gfnma_nvl(item.SELECT_PERIOD2),
  						SORT_SEQ 					: gfnma_nvl(item.SORT_SEQ),
  						THIS_DETAIL_AMT 			: gfnma_nvl(item.THIS_DETAIL_AMT),
  						THIS_SUMMARY_AMT			: gfnma_nvl(item.THIS_SUMMARY_AMT)
  					}
  					jsonFig5240Grid2.push(msg);
  					totalRecordCount ++;
  				});

  	        	if(jsonFig5240Grid2.length>0){
  	        		strBMperiod 	= (jsonFig5240Grid2[0]['BEFORE_MONTH_PERIOD']).substr(0,4) + '-' + (jsonFig5240Grid2[0]['BEFORE_MONTH_PERIOD']).substr(4,2);
  	        		strBBMperiod 	= (jsonFig5240Grid2[0]['BEFORE_BEFORE_MONTH_PERIOD']).substr(0,4) + '-' + (jsonFig5240Grid2[0]['BEFORE_BEFORE_MONTH_PERIOD']).substr(4,2);
  	        		strBEperiod 	= (jsonFig5240Grid2[0]['PREV_PERIOD_END']).substr(0,4) + '-' + (jsonFig5240Grid2[0]['PREV_PERIOD_END']).substr(4,2);
  	        		strBSperiod 	= (jsonFig5240Grid2[0]['PREV_PERIOD']).substr(0,4) + '-' + (jsonFig5240Grid2[0]['PREV_PERIOD']).substr(4,2);
  	        	}
  	        	
	  	      	//타이틀 재구성 -----------
	  	      	fn_gridSetTitle();
	    		fn_gridVisible();    		
	  	      	fn_createFig5240Grid2();    	
	  			Fig5240Grid2.clearStatus();
	  	      	//--------------------------
  	        	
  	        	Fig5240Grid2.rebuild();
        		fn_setStyle2();

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
     * 재무상태표(트리) 목록조회
     */
    const fn_setFig5240Grid3 = async function(wtype) {
		
    	//타이틀 재구성
    	fn_gridSetTitle();
    	fn_createFig5240Grid3();    	
    	//--------------------------
    	
		Fig5240Grid3.clearStatus();

		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_ymdperiod_fr		= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_FR"));
		let p_account_level		= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_LEVEL"));
		let p_chksum_yn			= gfnma_nvl(SBUxMethod.get("SCH_CHKSUM_YN")['SCH_CHKSUM_YN']);
		let p_yymdselect_period1 = gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD1"));
		let p_yymdselect_period2 = gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD2"));
		let p_zero_include_yn	 = gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","사업단위를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!p_ymdperiod_fr){
 			gfn_comAlert("E0000","기준년월을 선택하세요");
			return;      		 
		}

	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_ACCT_RULE_CODE		: p_acct_rule_code
			,V_P_FI_ORG_CODE		: p_fi_org_code
			,V_P_SITE_CODE			: p_site_code
			,V_P_PERIOD_CODE		: p_ymdperiod_fr
			,V_P_ACCOUNT_GROUP		: p_account_level
			,V_P_SUM_YN				: p_chksum_yn
			,V_P_SELECT_PERIOD1		: p_yymdselect_period1
			,V_P_SELECT_PERIOD2		: p_yymdselect_period2
			,V_P_ZERO_INCLUDE_YN	: p_zero_include_yn

			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5240List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '4',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	    		jsonFig5240Grid3.length = 0;
  	        	data.cv_3.forEach((item, index) => {
  					const msg = {
  						ACCOUNT_CODE				: gfnma_nvl(item.ACCOUNT_CODE),
  						ACCOUNT_CODE_VIEW			: gfnma_nvl(item.ACCOUNT_CODE_VIEW),
  						ACCOUNT_GROUP				: gfnma_nvl(item.ACCOUNT_GROUP),
  						ACCOUNT_NAME				: gfnma_nvl(item.ACCOUNT_NAME),
  						ACCT_RULE_CODE				: gfnma_nvl(item.ACCT_RULE_CODE),
  						
  						COMP_CODE					: gfnma_nvl(item.COMP_CODE),
  						FI_ORG_CODE					: gfnma_nvl(item.FI_ORG_CODE),
  						FONT_SIZE 					: gfnma_nvl(item.FONT_SIZE),
  						
  						HQ_ACCOUNT_CODE				: gfnma_nvl(item.HQ_ACCOUNT_CODE),
  						HQ_ACCOUNT_NAME				: gfnma_nvl(item.HQ_ACCOUNT_NAME),
  						
  						PREV_DETAIL_AMT 			: gfnma_nvl(item.PREV_DETAIL_AMT),
  						
  						MON_1 						: gfnma_nvl(item.MON_1),
  						MON_2 						: gfnma_nvl(item.MON_2),
  						MON_3 						: gfnma_nvl(item.MON_3),
  						MON_4 						: gfnma_nvl(item.MON_4),
  						MON_5 						: gfnma_nvl(item.MON_5),
  						MON_6 						: gfnma_nvl(item.MON_6),
  						MON_7 						: gfnma_nvl(item.MON_7),
  						MON_8 						: gfnma_nvl(item.MON_8),
  						MON_9 						: gfnma_nvl(item.MON_9),
  						MON_10 						: gfnma_nvl(item.MON_10),
  						MON_11 						: gfnma_nvl(item.MON_11),
  						MON_12 						: gfnma_nvl(item.MON_12),
  						
  						MON_Q1 						: gfnma_nvl(item.MON_Q1),
  						MON_Q2 						: gfnma_nvl(item.MON_Q2),
  						MON_Q3 						: gfnma_nvl(item.MON_Q3),
  						MON_Q4 						: gfnma_nvl(item.MON_Q4),
  						MON_Q5 						: gfnma_nvl(item.MON_Q5),
  						MON_Q6 						: gfnma_nvl(item.MON_Q6),
  						MON_Q7 						: gfnma_nvl(item.MON_Q7),
  						MON_Q8 						: gfnma_nvl(item.MON_Q8),
  						MON_Q9 						: gfnma_nvl(item.MON_Q9),
  						MON_Q10 					: gfnma_nvl(item.MON_Q10),
  						MON_Q11 					: gfnma_nvl(item.MON_Q11),
  						MON_Q12 					: gfnma_nvl(item.MON_Q12),
  						
  						PARENT_ACCOUNT 				: gfnma_nvl(item.PARENT_ACCOUNT),
  						REPORT_ACCOUNT_CODE 		: gfnma_nvl(item.REPORT_ACCOUNT_CODE),
  						REPORT_ACCOUNT_NAME 		: gfnma_nvl(item.REPORT_ACCOUNT_NAME),
  						
  						SORT_SEQ 					: gfnma_nvl(item.SORT_SEQ),
  					}
  					jsonFig5240Grid3.push(msg);
  					totalRecordCount ++;
  				});

  	        	Fig5240Grid3.rebuild();
        		fn_setStyle3();

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
     * (월)재무상태표 목록조회
     */
    const fn_setFig5240Grid4 = async function(wtype) {
		
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_ymdperiod_fr		= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_FR"));
		let p_account_level		= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_LEVEL"));
		let p_chksum_yn			= gfnma_nvl(SBUxMethod.get("SCH_CHKSUM_YN")['SCH_CHKSUM_YN']);
		let p_yymdselect_period1 = gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD1"));
		let p_yymdselect_period2 = gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD2"));
		let p_zero_include_yn	 = gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","사업단위를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!p_ymdperiod_fr){
 			gfn_comAlert("E0000","기준년월을 선택하세요");
			return;      		 
		}

	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_ACCT_RULE_CODE		: p_acct_rule_code
			,V_P_FI_ORG_CODE		: p_fi_org_code
			,V_P_SITE_CODE			: p_site_code
			,V_P_PERIOD_CODE		: p_ymdperiod_fr
			,V_P_ACCOUNT_GROUP		: p_account_level
			,V_P_SUM_YN				: p_chksum_yn
			,V_P_SELECT_PERIOD1		: p_yymdselect_period1
			,V_P_SELECT_PERIOD2		: p_yymdselect_period2
			,V_P_ZERO_INCLUDE_YN	: p_zero_include_yn

			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5240List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '4',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	    		jsonFig5240Grid4.length = 0;
  	        	data.cv_3.forEach((item, index) => {
  					const msg = {
  						LVL							: gfnma_nvl(item.LVL),
  						
  						ACCOUNT_CODE				: gfnma_nvl(item.ACCOUNT_CODE),
  						ACCOUNT_CODE_VIEW			: gfnma_nvl(item.ACCOUNT_CODE_VIEW),
  						ACCOUNT_GROUP				: gfnma_nvl(item.ACCOUNT_GROUP),
  						ACCOUNT_NAME				: gfnma_nvl(item.ACCOUNT_NAME),
  						ACCT_RULE_CODE				: gfnma_nvl(item.ACCT_RULE_CODE),
  						
  						COMP_CODE					: gfnma_nvl(item.COMP_CODE),
  						FI_ORG_CODE					: gfnma_nvl(item.FI_ORG_CODE),
  						FONT_SIZE 					: gfnma_nvl(item.FONT_SIZE),
  						
  						HQ_ACCOUNT_CODE				: gfnma_nvl(item.HQ_ACCOUNT_CODE),
  						HQ_ACCOUNT_NAME				: gfnma_nvl(item.HQ_ACCOUNT_NAME),
  						
  						KEYID 						: gfnma_nvl(item.KEYID),
  						
  						MON_1 						: gfnma_nvl(item.MON_1),
  						MON_2 						: gfnma_nvl(item.MON_2),
  						MON_3 						: gfnma_nvl(item.MON_3),
  						MON_4 						: gfnma_nvl(item.MON_4),
  						MON_5 						: gfnma_nvl(item.MON_5),
  						MON_6 						: gfnma_nvl(item.MON_6),
  						MON_7 						: gfnma_nvl(item.MON_7),
  						MON_8 						: gfnma_nvl(item.MON_8),
  						MON_9 						: gfnma_nvl(item.MON_9),
  						MON_10 						: gfnma_nvl(item.MON_10),
  						MON_11 						: gfnma_nvl(item.MON_11),
  						MON_12 						: gfnma_nvl(item.MON_12),
  						
  						MON_Q1 						: gfnma_nvl(item.MON_Q1),
  						MON_Q2 						: gfnma_nvl(item.MON_Q2),
  						MON_Q3 						: gfnma_nvl(item.MON_Q3),
  						MON_Q4 						: gfnma_nvl(item.MON_Q4),
  						MON_Q5 						: gfnma_nvl(item.MON_Q5),
  						MON_Q6 						: gfnma_nvl(item.MON_Q6),
  						MON_Q7 						: gfnma_nvl(item.MON_Q7),
  						MON_Q8 						: gfnma_nvl(item.MON_Q8),
  						MON_Q9 						: gfnma_nvl(item.MON_Q9),
  						MON_Q10 					: gfnma_nvl(item.MON_Q10),
  						MON_Q11 					: gfnma_nvl(item.MON_Q11),
  						MON_Q12 					: gfnma_nvl(item.MON_Q12),
  						
  						PARENTKEYID 				: gfnma_nvl(item.PARENTKEYID),
  						
  						PARENT_ACCOUNT 				: gfnma_nvl(item.PARENT_ACCOUNT),
  						REPORT_ACCOUNT_CODE 		: gfnma_nvl(item.REPORT_ACCOUNT_CODE),
  						REPORT_ACCOUNT_NAME 		: gfnma_nvl(item.REPORT_ACCOUNT_NAME),
  						
  						SORT_SEQ 					: gfnma_nvl(item.SORT_SEQ),
  					}
  					jsonFig5240Grid4.push(msg);
  					totalRecordCount ++;
  				});

//   	        	if(jsonFig5240Grid4.length>0){
//   	        		if(jsonFig5240Grid2[0]['BEFORE_MONTH_PERIOD']){
// 	  	        		strBMperiod 	= (jsonFig5240Grid2[0]['BEFORE_MONTH_PERIOD']).substr(0,4) + '-' + (jsonFig5240Grid2[0]['BEFORE_MONTH_PERIOD']).substr(4,2);
//   	        		}
//   	        		if(jsonFig5240Grid2[0]['BEFORE_BEFORE_MONTH_PERIOD']){
// 	  	        		strBBMperiod 	= (jsonFig5240Grid2[0]['BEFORE_BEFORE_MONTH_PERIOD']).substr(0,4) + '-' + (jsonFig5240Grid2[0]['BEFORE_BEFORE_MONTH_PERIOD']).substr(4,2);
//   	        		}
//   	        		if(jsonFig5240Grid2[0]['PREV_PERIOD_END']){
//   	  	        		strBEperiod 	= (jsonFig5240Grid2[0]['PREV_PERIOD_END']).substr(0,4) + '-' + (jsonFig5240Grid2[0]['PREV_PERIOD_END']).substr(4,2);
//   	        		}
//   	        		if(jsonFig5240Grid2[0]['PREV_PERIOD']){
// 	  	        		strBSperiod 	= (jsonFig5240Grid2[0]['PREV_PERIOD']).substr(0,4) + '-' + (jsonFig5240Grid2[0]['PREV_PERIOD']).substr(4,2);
//   	        		}
//   	        	}
  	        	
	  	      	//타이틀 재구성 -----------
	  	      	fn_gridSetTitle();
	    		fn_gridVisible();    		
	  	      	fn_createFig5240Grid4();    	
	  			Fig5240Grid4.clearStatus();
	  	      	//--------------------------
  	        	
  	        	Fig5240Grid4.rebuild();
        		fn_setStyle4();

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
    	
		let sdate	= SBUxMethod.get("SCH_YMDPERIOD_FR");
		sdate = sdate.substr(0,4) + '-' + sdate.substr(4,2);	
		let jdate1	= Number(sdate.substr(0,4) - 1) + '-12';
		let jdate2	= Number(sdate.substr(0,4) - 1) + '-' + sdate.substr(5,2);
		
		gd1_title_1 	= '당기(' + sdate + ')';
		gd1_title_1_1 	= '당기요약';
		gd1_title_2 	= '전기말(' + jdate1 + ')';
		gd1_title_3 	= '전동기(' + jdate2 + ')';
    }

    /**
     * 그리드 컬럼 상태
     */
    const fn_gridVisible = function() {
    	
    	gd2_col_9_visible 		= false;
    	gd2_col_10_visible 		= false;
    	gd2_col_11_visible 		= false;
    	gd2_col_12_visible 		= false;
    	gd2_col_13_visible 		= false;
    	gd2_col_14_visible 		= false;
    	
		let p_cbodescr1			= gfnma_nvl(SBUxMethod.get("SCH_CBODESCR1"));
    	if(p_cbodescr1 == 'BM'){	
    		//전월
    		gd2_col_11_visible = true;
    		gd2_title_3 = strBMCation + '(' + strBMperiod + ')';
    	} else if(p_cbodescr1 == 'BBM'){
    		//전전월
    		gd2_col_12_visible = true;
    		gd2_title_4 = strBBMCation + '(' + strBBMperiod + ')';
    	} else if(p_cbodescr1 == 'BE'){
    		//전기말
    		gd2_col_9_visible = true;
    		gd2_title_1 = strBECation + '(' + strBEperiod + ')';
    	} else if(p_cbodescr1 == 'BS'){
    		//전동기
    		gd2_col_10_visible = true;
    		gd2_title_2 = strBSCation + '(' + strBSperiod + ')';
    	} else {
    		//특정기간
    		gd2_col_13_visible = true;
    		gd2_title_5 = gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD1"))
    	}
    	
		let p_cbodescr2			= gfnma_nvl(SBUxMethod.get("SCH_CBODESCR2"));
    	if(p_cbodescr2 == 'BM'){	
    		//전월
    		gd2_col_11_visible = true;
    		gd2_title_3 = strBMCation + '(' + strBMperiod + ')';
    	} else if(p_cbodescr2 == 'BBM'){
    		//전전월
    		gd2_col_12_visible = true;
    		gd2_title_4 = strBBMCation + '(' + strBBMperiod + ')';
    	} else if(p_cbodescr2 == 'BE'){
    		//전기말
    		gd2_col_9_visible = true;
    		gd2_title_1 = strBECation + '(' + strBEperiod + ')';
    	} else if(p_cbodescr2 == 'BS'){
    		//전동기
    		gd2_col_10_visible = true;
    		gd2_title_2 = strBSCation + '(' + strBSperiod + ')';
    	} else {
    		//특정기간
    		gd2_col_14_visible = true;
    		gd2_title_6 = gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD2"))
    	}
    }

    /**
     * 날짜
     */
    var fn_cngBasicDate = function() {
        var yyyymm	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_FR"));
		SBUxMethod.set('SCH_YYMDSELECT_PERIOD1', 		yyyymm);
		SBUxMethod.set('SCH_YYMDSELECT_PERIOD2', 		yyyymm);    	
    }
    
    /**
     * 비고1
     */
    var fn_cngCbodescr1 = function(val) {
    	console.log(val);
    	if(val=='BM'){
    		SBUxMethod.hide('SCH_YYMDSELECT_PERIOD1');
    	} else if(val=='BBM'){
    		SBUxMethod.hide('SCH_YYMDSELECT_PERIOD1');
    	} else if(val=='BE'){
    		SBUxMethod.hide('SCH_YYMDSELECT_PERIOD1');
    	} else if(val=='BS'){
    		SBUxMethod.hide('SCH_YYMDSELECT_PERIOD1');
    	} else {
    		SBUxMethod.show('SCH_YYMDSELECT_PERIOD1');
    	}
    }
    
    /**
     * 비고2
     */
    var fn_cngCbodescr2 = function(val) {
    	console.log(val);
    	if(val=='BM'){
    		SBUxMethod.hide('SCH_YYMDSELECT_PERIOD2');
    	} else if(val=='BBM'){
    		SBUxMethod.hide('SCH_YYMDSELECT_PERIOD2');
    	} else if(val=='BE'){
    		SBUxMethod.hide('SCH_YYMDSELECT_PERIOD2');
    	} else if(val=='BS'){
    		SBUxMethod.hide('SCH_YYMDSELECT_PERIOD2');
    	} else {
    		SBUxMethod.show('SCH_YYMDSELECT_PERIOD2');
    	}
    }
    
    /**
     * 표준재무제표계정표시
     */
    var fn_cngChkReportYn = function(obj) {
    	console.log(obj);
    	
		//tpgBSBand 1
		//tpgBSTree 2
		//tpgMonthlyGrid 3
		//tpgMonthlyTree 4
    	
    	if(obj['SCH_CHKREPORT_YN']=='Y'){
        	if(p_sel_tab==1){
        		gd1_col_4_visible = true;
        		gd1_col_5_visible = true;
        		gd1_col_6_visible = false;
        		gd1_col_7_visible = false;
        	} else if(p_sel_tab==2) {
        		gd2_col_4_visible = true;
        		gd2_col_5_visible = true;
        		gd2_col_6_visible = false;
        		gd2_col_7_visible = false;
        	} else if(p_sel_tab==3) {
        		gd3_col_4_visible = true;
        		gd3_col_5_visible = true;
        		gd3_col_6_visible = false;
        		gd3_col_7_visible = false;
        	} else {
        		gd4_col_4_visible = true;
        		gd4_col_5_visible = true;
        		gd4_col_6_visible = false;
        		gd4_col_7_visible = false;
        	}
    	} else {
        	if(p_sel_tab==1){
        		gd1_col_6_visible = false;
        		gd1_col_7_visible = false;
        	} else if(p_sel_tab==2) {
        		gd2_col_6_visible = false;
        		gd2_col_7_visible = false;
        	} else if(p_sel_tab==3) {
        		gd3_col_6_visible = false;
        		gd3_col_7_visible = false;
        	} else {
        		gd4_col_6_visible = false;
        		gd4_col_7_visible = false;
        	}
    	}
    }
        
    /**
     * 그리드1 색상
     */
    var fn_setStyle1 = function() {
    	let allDatas = Fig5240Grid1.getGridDataAll();
    	let chk 	 = false;
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['ACCOUNT_GROUP']=='G'){
      			Fig5240Grid1.setRowStyle(i+2, 'data', 'background', '#d4f1da');
      			Fig5240Grid1.setRowStyle(i+2, 'data', 'font-weight', 'bold');
      			chk = true;
      		}
      	}
      	if(chk){
      		Fig5240Grid1.clearSelection();
      	}
  	}    
        
    /**
     * 그리드2 색상
     */
    var fn_setStyle2 = function() {
    	let allDatas = Fig5240Grid2.getGridDataAll();
    	let chk 	 = false;
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['ACCOUNT_GROUP']=='G'){
      			Fig5240Grid2.setRowStyle(i+1, 'data', 'background', '#d4f1da');
      			Fig5240Grid2.setRowStyle(i+1, 'data', 'font-weight', 'bold');
      			chk = true;
      		}
      	}
      	if(chk){
      		Fig5240Grid2.clearSelection();
      	}
  	}    
        
    /**
     * 그리드3 색상
     */
    var fn_setStyle3 = function() {
    	let allDatas = Fig5240Grid3.getGridDataAll();
    	let chk 	 = false;
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['ACCOUNT_GROUP']=='G'){
      			Fig5240Grid3.setRowStyle(i+1, 'data', 'background', '#d4f1da');
      			Fig5240Grid3.setRowStyle(i+1, 'data', 'font-weight', 'bold');
      			chk = true;
      		}
      	}
      	if(chk){
      		Fig5240Grid3.clearSelection();
      	}
  	}    
        
    /**
     * 그리드4 색상
     */
    var fn_setStyle4 = function() {
    	let allDatas = Fig5240Grid4.getGridDataAll();
    	let chk 	 = false;
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['ACCOUNT_GROUP']=='G'){
      			Fig5240Grid4.setRowStyle(i+1, 'data', 'background', '#d4f1da');
      			Fig5240Grid4.setRowStyle(i+1, 'data', 'font-weight', 'bold');
      			chk = true;
      		}
      	}
      	if(chk){
      		Fig5240Grid4.clearSelection();
      	}
  	}    
    
    /**
     * 트리펼치기
     */
    var fn_treeOpen1 = function() {
    	Fig5240Grid2.openTreeNodeAll();
  	}    

    /**
     * 트리접기
     */
    var fn_treeClose1 = function() {
    	Fig5240Grid2.closeTreeNodeAll();
  	}    
    
    /**
     * 트리펼치기
     */
    var fn_treeOpen2 = function() {
    	Fig5240Grid4.openTreeNodeAll();
  	}    

    /**
     * 트리접기
     */
    var fn_treeClose2 = function() {
    	Fig5240Grid4.closeTreeNodeAll();
  	}    
    
    const fn_periodRetun = async function(obj, strType, iseq){
    	let strperiod1			= "";
		let YYMDSELECT_PERIOD1	= gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD1"));
		let YYMDSELECT_PERIOD2	= gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD2"));
		
        if (strType == "BM"){    		//전월
            strperiod1 = obj.BEFORE_MONTH_PERIOD.replace(/(\d{4})(\d{2})/, "$1-$2");
        }
        else if (strType == "BBM"){ 	//전전월
            strperiod1 = obj.BEFORE_BEFORE_MONTH_PERIOD.replace(/(\d{4})(\d{2})/, "$1-$2");
        }
        else if (strType == "BE"){ 		//전기말
            strperiod1 = obj.PREV_PERIOD_END.replace(/(\d{4})(\d{2})/, "$1-$2");
        }
        else if (strType == "BS"){ 		//전동기
            strperiod1 = obj.PREV_PERIOD.replace(/(\d{4})(\d{2})/, "$1-$2");
        }
        else{  							//특정기간
            strperiod1 = iseq == '1' ? YYMDSELECT_PERIOD1 : YYMDSELECT_PERIOD2;
        }
        return strperiod1;
    }
    
    const fn_btnPrint = async function () {
		let conn = '';
	    conn = await fn_getReportData();
	    conn = await gfnma_convertDataForReport(conn);
	    await gfn_popClipReportPost("재무상태표", "ma/RPT_FIG5240.crf", null, conn );
	}
    
	const fn_getReportData = async function() {
		
		let ACCT_RULE_CODE	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let FI_ORG_CODE		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let SITE_CODE			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let YMDPERIOD_FR		= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_FR"));
		let ACCOUNT_LEVEL		= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_LEVEL"));
		let CHKSUM_YN			= gfnma_nvl(SBUxMethod.get("SCH_CHKSUM_YN")['SCH_CHKSUM_YN']);
		let YYMDSELECT_PERIOD1 = gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD1"));
		let YYMDSELECT_PERIOD2 = gfnma_nvl(SBUxMethod.get("SCH_YYMDSELECT_PERIOD2"));
		let ZERO_INCLUDE_YN	 = gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		let DESCR1			= gfnma_nvl(SBUxMethod.get("SCH_CBODESCR1"));
		let DESCR2			= gfnma_nvl(SBUxMethod.get("SCH_CBODESCR2"));
		
		if(!FI_ORG_CODE){
 			gfn_comAlert("E0000","사업단위를 선택하세요");
			return;      		 
		}
		if(!ACCT_RULE_CODE){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!YMDPERIOD_FR){
 			gfn_comAlert("E0000","기준년월을 선택하세요");
			return;      		 
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_ACCT_RULE_CODE		: ACCT_RULE_CODE
			,V_P_FI_ORG_CODE		: FI_ORG_CODE
			,V_P_SITE_CODE			: SITE_CODE
			,V_P_PERIOD_CODE		: YMDPERIOD_FR
			,V_P_ACCOUNT_GROUP		: ACCOUNT_LEVEL
			,V_P_SUM_YN				: CHKSUM_YN
			,V_P_SELECT_PERIOD1		: YYMDSELECT_PERIOD1
			,V_P_SELECT_PERIOD2		: YYMDSELECT_PERIOD2
			,V_P_ZERO_INCLUDE_YN	: ZERO_INCLUDE_YN
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5240Report.do", {
        	getType				: 'json',
        	workType			: 'REPORT1',
        	cv_count			: '4',
        	params				: gfnma_objectToString(paramObj)
		});
	    const data = await postJsonPromise;
	    try {
	        if (_.isEqual("S", data.resultStatus)) {
	        	if(data.cv_2.length > 0) {
		        	data.cv_3 = data.cv_2
		        	if(data.cv_1.length > 0){
			        	data.cv_1[0].STRCON1 = DESCR1;
			        	data.cv_1[0].STRCON2 = DESCR2;        		
		        		data.cv_3[0].BEFORE_MONTH_PERIOD = data.cv_1[0].BEFORE_MONTH_PERIOD.replace(/(\d{4})(\d{2})/, "$1-$2");
		        		data.cv_3[0].BEFORE_BEFORE_MONTH_PERIOD = data.cv_1[0].BEFORE_BEFORE_MONTH_PERIOD.replace(/(\d{4})(\d{2})/, "$1-$2");
		        		data.cv_3[0].PREV_PERIOD_END = data.cv_1[0].PREV_PERIOD_END.replace(/(\d{4})(\d{2})/, "$1-$2");
		        		data.cv_3[0].PREV_PERIOD = data.cv_1[0].PREV_PERIOD.replace(/(\d{4})(\d{2})/, "$1-$2");
		        	}
		        	data.cv_3[0].STRCON1 = DESCR1;
		        	data.cv_3[0].STRCON2 = DESCR2;
		        	data.cv_3[0].STRCONPERIOD1 = await fn_periodRetun(data.cv_1[0], DESCR1, '1');
		        	data.cv_3[0].STRCONPERIOD2 = await fn_periodRetun(data.cv_1[0], DESCR2, '2');
	        	}
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
        	,'START_DATE'	 		: SBUxMethod.get('SCH_YMDPERIOD_FR') 
        	,'END_DATE' 			: SBUxMethod.get('SCH_YMDPERIOD_FR') 
        	,'ACCOUNT_GROUP' 		: SBUxMethod.get('SCH_ACCOUNT_GROUP') 
        	,'ACCOUNT_CODE_FR' 		: account_code_view
        	,'ACCOUNT_CODE_TO' 		: account_code_view
        	,'ACCOUNT_NAME' 		: account_name
        	,'target'				: 'MA_A20_030_030_220'
        }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);
	}    
    
    /**
     * 계정별원장조회
     */
 	function fn_account() {
    	
        var nRow 		= null;
        var rowData		= null;
        var start_date	= SBUxMethod.get('SCH_YMDPERIOD_FR');
        var end_date	= SBUxMethod.get('SCH_YMDPERIOD_FR');
        start_date		= start_date.substr(0,4) + '-01-01';	
        end_date		= end_date.substr(0,4) + '-' + end_date.substr(4,2) + '-' + gfnma_date3(Number(end_date.substr(0,4)), end_date.substr(5,2), true);

    	if(p_sel_tab==1){
    		//tpgBSBand : 재무상태표(밴드)
	        nRow = Fig5240Grid1.getRow();
			if (nRow > 0) {
		        rowData = Fig5240Grid1.getRowData(nRow);
			} else {
				return;
			}
			
			if(rowData['ACCOUNT_GROUP']=='A' || rowData['ACCOUNT_GROUP']=='B' || rowData['ACCOUNT_GROUP']=='C'){
				gfnma_getAccountRange('Q', rowData['ACCOUNT_CODE'], function(data){
			        var obj = {
		            	'MENU_MOVE'				: 'Y'	
		            	,'FI_ORG_CODE' 			: SBUxMethod.get('SCH_FI_ORG_CODE') 
		            	,'SITE_CODE' 			: SBUxMethod.get('SCH_SITE_CODE') 
		            	,'ACCT_RULE_CODE'		: SBUxMethod.get('SCH_ACCT_RULE_CODE') 
		            	,'START_DATE'	 		: start_date 
		            	,'END_DATE' 			: end_date 
		            	,'ACCOUNT_GROUP' 		: SBUxMethod.get('SCH_ACCOUNT_GROUP') 
		            	,'ACCOUNT_CODE' 		: data[0]['ACCOUNT_CODE_FR']
		            	,'ACCOUNT_NAME' 		: data[0]['ACCOUNT_NAME_FR']
		            	,'target'				: 'MA_A20_030_030_210'
		            }
		            let json = JSON.stringify(obj);
		            window.parent.cfn_openTabSearch(json);
				})
			} else {
	 			gfn_comAlert("E0000","계정수준이 과목/항목/세목인 경우에만 계정별원장을 조회할 수 있습니다.");
				return;
			}
			
    	} else if(p_sel_tab==2) {
    		//tpgBSTree : 재무상태표(트리)
	        nRow = Fig5240Grid2.getRow();
			if (nRow > 0) {
		        rowData = Fig5240Grid2.getRowData(nRow);
			} else {
				return;
			}
			
			if(rowData['ACCOUNT_GROUP']=='A' || rowData['ACCOUNT_GROUP']=='B' || rowData['ACCOUNT_GROUP']=='C'){
				gfnma_getAccountRange('Q', rowData['ACCOUNT_CODE'], function(data){
			        var obj = {
		            	'MENU_MOVE'				: 'Y'	
		            	,'FI_ORG_CODE' 			: SBUxMethod.get('SCH_FI_ORG_CODE') 
		            	,'SITE_CODE' 			: SBUxMethod.get('SCH_SITE_CODE') 
		            	,'ACCT_RULE_CODE'		: SBUxMethod.get('SCH_ACCT_RULE_CODE') 
		            	,'START_DATE'	 		: start_date 
		            	,'END_DATE' 			: end_date 
		            	,'ACCOUNT_GROUP' 		: SBUxMethod.get('SCH_ACCOUNT_GROUP') 
		            	,'ACCOUNT_CODE' 		: data[0]['ACCOUNT_CODE_FR']
		            	,'ACCOUNT_NAME' 		: data[0]['ACCOUNT_NAME_FR']
		            	,'target'				: 'MA_A20_030_030_210'
		            }
		            let json = JSON.stringify(obj);
		            window.parent.cfn_openTabSearch(json);
				})
			} else {
	 			gfn_comAlert("E0000","계정수준이 과목/항목/세목인 경우에만 계정별원장을 조회할 수 있습니다.");
				return;
			}
			
    	} else {
    		return;
    	}   	
    	
	}    
    
	
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>