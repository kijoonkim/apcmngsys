<%
/**
 * @Class Name 		: fig5253.jsp
 * @Description 	: 손익계산서 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.10.07
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.10.07   	장성주		최초 생성
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
	<title>title : 손익계산서</title>
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
                    </h3><!-- 손익계산서 -->
                </div>
                <div style="margin-left: auto;">
                	<!-- 
                    <sbux-button uitype="normal" text="수불내역"  class="btn btn-sm btn-outline-danger" onclick="fn_dtlView()" ></sbux-button>
                	 -->
                </div>
            </div>
            <div class="box-body">

				<div class="box-search-ma" >
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
	                    
	                           	<!-- hidden  -->
	  							<sbux-input  id="SCH_YMDPERIOD_1"  			name="SCH_YMDPERIOD_1" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
	  							<sbux-input  id="SCH_YMDPERIOD_2_FR"  		name="SCH_YMDPERIOD_2_FR" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
	  							<sbux-input  id="SCH_YMDPERIOD_2_TO"  		name="SCH_YMDPERIOD_2_TO" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
	  							<sbux-input  id="SCH_YMDPERIOD_3"  			name="SCH_YMDPERIOD_3" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
	  							<sbux-input  id="SCH_YMDPERIOD_4"  			name="SCH_YMDPERIOD_4" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
	  							<sbux-input  id="SCH_YMDPERIOD_5_FR"  		name="SCH_YMDPERIOD_5_FR" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
	  							<sbux-input  id="SCH_YMDPERIOD_5_TO"  		name="SCH_YMDPERIOD_5_TO" 		style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
	  							<sbux-input  id="SCH_YMDPERIOD_6"  			name="SCH_YMDPERIOD_6" 			style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
	                       		<!-- /hidden -->
	                       		                    
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
	                                <sbux-select style="width:150px" id="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">기준년월</th>
	                            <td class="td_input" >
									<sbux-datepicker
										uitype="popup"
										id="SCH_YMDPERIOD_CODE_FR"
								        datepicker-mode="month"
								        date-format="yyyy-mm"
										class="form-control pull-right input-sm  input-sm-ast table-datepicker-ma"  onchange="fn_cngBasicDate">
									</sbux-datepicker>
								</td>
	                            <td>-</td>
	                            <td class="td_input" >
									<sbux-datepicker
										uitype="popup"
										id="SCH_YMDPERIOD_CODE_TO"
								        datepicker-mode="month"
								        date-format="yyyy-mm"
										class="form-control pull-right input-sm inpt_data_reqed input-sm-ast table-datepicker-ma" onchange = "fn_cngBasicDate">
									</sbux-datepicker>
								</td>
	                            <td></td>
	                            
	                        </tr>
	                        
	                        <tr>
								                            
	                            <th scope="row" class="th_bg_search">계정수준</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select style="width:150px" id="SCH_ACCOUNT_LEVEL" uitype="single" jsondata-ref="jsonAccountLevel" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
								                            
	                            <th scope="row" class="th_bg_search">기간</th>
	                            <td colspan="2" class="td_input" >
	                                <sbux-select style="width:150px" id="SCH_CBODESCR1" uitype="single" jsondata-ref="jsonCbodescr1" unselected-text="선택" class="form-control input-sm" onchange="fn_cngCbodescr1(SCH_CBODESCR1)"></sbux-select>
	                            </td>
	                            <td colspan="2" class="td_input" >
									<sbux-datepicker
										uitype="popup"
										id="SCH_YMDSELECT_PERIOD1"
								        datepicker-mode="month"
								        date-format="yyyy-mm"
								        style="width:80px"
										class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									></sbux-datepicker>
	                            </td>
								                            
	                            <th scope="row" class="th_bg_search">조건</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left">
		                            	<font>Zero포함</font>
									    <font style="padding-left:10px;"></font>  
		                            	<sbux-checkbox id="SCH_CHKZERO_INCLUDE_YN" uitype="normal" text="예" true-value="Y" false-value="N" ></sbux-checkbox>
	                            	</div>
	                            </td>
	                            <td></td>
	                            
	                            <td colspan="5"></td>
	                            
	                        </tr>
	                        
	                    </tbody>
	                </table>
                </div>
                
				<div class="table-responsive tbl_scroll_sm" style="padding-top:10px">
				
				    <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="normal"
	                   title-target-id-array = "sb_area_tab1^sb_area_tab2^sb_area_tab3^sb_area_tab4^sb_area_tab5^sb_area_tab6"
	                   title-text-array = "관리용^증감비교^월별손익^관리용(트리)^증감비료(트리)^월별손익(트리)"
	                   title-target-value-array="1^2^3^4^5^6"
	                   onclick="fn_tabClick(tab_norm)"></sbux-tabs>					
					
					<div class="tab-content">
					
						<div id="sb_area_tab1" >
							<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
								<font style="margin-right:auto;">관리용 손익계산서</font>
                				<div style="margin-left: auto;">
									<sbux-button id="btnPrint1" name="btnPrint1" uitype="normal" class="btn btn-sm btn-outline-danger" text="리포트 출력" onclick="fn_btnPrint('1')"></sbux-button>
								</div>
							</div>
							<div id="SB_TAB1_GRID" style="height:460px; width:100%;">
							</div>
						</div>
						
						<div id="sb_area_tab2" >
							<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
								<font style="margin-right:auto;">기간별 증감비교</font>
                				<div style="margin-left: auto;">
									<sbux-button id="btnPrint2" name="btnPrint2" uitype="normal" class="btn btn-sm btn-outline-danger" text="리포트 출력" onclick="fn_btnPrint('2')"></sbux-button>
								</div>
							</div>
							<div id="SB_TAB2_GRID" style="height:460px; width:100%;">
							</div>
						</div>
						
						<div id="sb_area_tab3" >
							<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
								<font style="margin-right:auto;">월별손익</font>
                				<div style="margin-left: auto;">
								</div>
							</div>
							<div id="SB_TAB3_GRID" style="height:460px; width:100%;">
							</div>
						</div>
						
						<div id="sb_area_tab4" >
							<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
								<font style="margin-right:auto;">관리용 손익계산서(트리)</font>
                				<div style="margin-left: auto;">
				                    <sbux-button uitype="normal" text="트리펼치기"  class="btn btn-sm btn-outline-danger" onclick="fn_treeOpen1()" ></sbux-button>
				                    <span style="width:5px"></span>
				                    <sbux-button uitype="normal" text="트리접기"  	class="btn btn-sm btn-outline-danger" onclick="fn_treeClose1()" ></sbux-button>
								</div>
							</div>
							<div id="SB_TAB4_GRID" style="height:460px; width:100%;">
							</div>
						</div>
						
						<div id="sb_area_tab5" >
							<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
								<font style="margin-right:auto;">기간별 증감비교(트리)</font>
                				<div style="margin-left: auto;">
				                    <sbux-button uitype="normal" text="트리펼치기"  class="btn btn-sm btn-outline-danger" onclick="fn_treeOpen2()" ></sbux-button>
				                    <span style="width:5px"></span>
				                    <sbux-button uitype="normal" text="트리접기"  	class="btn btn-sm btn-outline-danger" onclick="fn_treeClose2()" ></sbux-button>
								</div>
							</div>
							<div id="SB_TAB5_GRID" style="height:460px; width:100%;">
							</div>
						</div>
						
						<div id="sb_area_tab6" >
							<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
								<font style="margin-right:auto;">월별손익(트리)</font>
                				<div style="margin-left: auto;">
				                    <sbux-button uitype="normal" text="트리펼치기"  class="btn btn-sm btn-outline-danger" onclick="fn_treeOpen3()" ></sbux-button>
				                    <span style="width:5px"></span>
				                    <sbux-button uitype="normal" text="트리접기"  	class="btn btn-sm btn-outline-danger" onclick="fn_treeClose3()" ></sbux-button>
								</div>
							</div>
							<div id="SB_TAB6_GRID" style="height:460px; width:100%;">
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
	var jsonAccountLevel	= [];	// 계정수준
	var jsonCbodescr1		= [];	// 기간
	
    //grid 초기화
    var Fig5253Grid1; 					// 그리드를 담기위한 객체 선언
    var jsonFig5253Grid1 		= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fig5253Grid2; 					// 그리드를 담기위한 객체 선언
    var jsonFig5253Grid2 		= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fig5253Grid3; 					// 그리드를 담기위한 객체 선언
    var jsonFig5253Grid3 		= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fig5253Grid4; 					// 그리드를 담기위한 객체 선언
    var jsonFig5253Grid4 		= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fig5253Grid5; 					// 그리드를 담기위한 객체 선언
    var jsonFig5253Grid5 		= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fig5253Grid6; 					// 그리드를 담기위한 객체 선언
    var jsonFig5253Grid6 		= []; 	// 그리드의 참조 데이터 주소 선언
    
    var p_sel_tab			= 1;	// 현재탭
    
    var strTPperiod 		= ""; 
    var strTMperiod 		= ""; 
    var strBEperiod 		= ""; 
    var strBSperiod 		= ""; 
    var strBSperiodDescr 	= "";
    
    var gd1_title_1			= "당기";		
    var gd1_title_2			= "전기말";		
    var gd1_title_3			= "전동기";		
    
    var gd2_title_1			= "당기";		
    var gd2_title_2			= "전동기";		
    var gd2_title_3			= "증감액";		
    var gd2_title_4			= "증감비율%";		
    
    var gd4_title_1			= "당기금액";		
    var gd4_title_2			= "전기말금액";		
    var gd4_title_3			= "전동기금액";		
    
    var gd5_title_1			= "당기";		
    var gd5_title_1_1		= "월";		
    var gd5_title_2			= "전동기";		
    var gd5_title_2_1		= "월";		
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // APC
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],			jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE'],			jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE'],		jsonAcctRuleCode, 	'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 계정수준
            gfnma_setComSelect(['SCH_ACCOUNT_LEVEL'],		jsonAccountLevel, 	'L_FIG011_Y', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 기간
            gfnma_setComSelect(['SCH_CBODESCR1'],			jsonCbodescr1, 		'L_FIM130', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state();
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
		
    	//년월
        var sdate	= gfnma_date1().substr(0,4) + gfnma_date1().substr(5,2);
		SBUxMethod.set('SCH_YMDPERIOD_1', 		sdate);
		SBUxMethod.set('SCH_YMDPERIOD_2_FR', 	sdate);
		SBUxMethod.set('SCH_YMDPERIOD_2_TO', 	sdate);    	
		SBUxMethod.set('SCH_YMDPERIOD_3', 		sdate);
		SBUxMethod.set('SCH_YMDPERIOD_4', 		sdate);
		SBUxMethod.set('SCH_YMDPERIOD_5_FR', 	sdate);
		SBUxMethod.set('SCH_YMDPERIOD_5_TO', 	sdate);    	
		SBUxMethod.set('SCH_YMDPERIOD_6', 		sdate);
		SBUxMethod.set('SCH_YMDPERIOD_CODE_FR',	sdate);
		SBUxMethod.set('SCH_YMDPERIOD_CODE_TO',	sdate);
		
		SBUxMethod.set('SCH_ACCOUNT_LEVEL',			'C');
		SBUxMethod.set('SCH_CHKZERO_INCLUDE_YN',	'Y');
		
		$('#SCH_LBLBETWEEN').hide();
		SBUxMethod.hide('SCH_YMDPERIOD_CODE_TO');
		
		SBUxMethod.set('SCH_CBODESCR1',	'BS');
		
		SBUxMethod.hide('SCH_YMDSELECT_PERIOD1');
		
      	fn_createFig5253Grid1();    	
      	fn_createFig5253Grid2();    	
      	fn_createFig5253Grid3();    	
      	fn_createFig5253Grid4();    	
      	fn_createFig5253Grid5();    	
      	fn_createFig5253Grid6();    	
    }
    
    /**
     * 목록 조회
     */
 	function cfn_search() {
    	
		console.log('p_sel_tab:', p_sel_tab);		
		
    	if(p_sel_tab==1){
	    	fn_setFig5253Grid1('Q1');
    	} else if(p_sel_tab==2) {
	    	fn_setFig5253Grid2('Q2');
    	} else if(p_sel_tab==3) {
	    	fn_setFig5253Grid3('Q3');
    	} else if(p_sel_tab==4) {
	    	fn_setFig5253Grid4('T1');
    	} else if(p_sel_tab==5) {
	    	fn_setFig5253Grid5('T2');
    	} else {
	    	fn_setFig5253Grid6('T3');
    	}
    }
    
    /**
     * 관리용 손익계산서 (Tab1)
     */
    function fn_createFig5253Grid1() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_TAB1_GRID';
	    SBGridProperties.id 				= 'Fig5253Grid1';
	    SBGridProperties.jsonref 			= 'jsonFig5253Grid1';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozencols 		= 3;
        SBGridProperties.columns = [
            {caption: ["계정정보",		"계정구분"],		ref: 'ACCOUNT_GROUP', 			type:'output',  	width:'80px'	,  	style:'text-align:left'},
            {caption: ["계정정보",		"계정코드"], 		ref: 'ACCOUNT_CODE', 			type:'button',  	width:'100px', 		style:'text-align:left', 
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
            
            {caption: ["계정정보",		"계정과목"],		ref: 'ACCOUNT_NAME', 			type:'output',  	width:'300px',  	style:'text-align:left'},
            
            {caption: [gd1_title_1,		"당기세부"],		ref: 'THIS_DETAIL_AMT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd1_title_1,		"당기요약"],		ref: 'THIS_SUMMARY_AMT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: [gd1_title_2,		"전기말세부"],		ref: 'PREV_END_DETAIL_AMT', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd1_title_2,		"전기말요약"],		ref: 'PREV_END_SUMMARY_AMT',	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: [gd1_title_3,		"전동기세부"],		ref: 'PREV_DETAIL_AMT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd1_title_3,		"전동기요약"],		ref: 'PREV_SUMMARY_AMT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["비고",			""],				ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fig5253Grid1 = _SBGrid.create(SBGridProperties);
        //Fig5253Grid1.bind('click', 'fn_viewFig5253Grid1Event');
        
    }
    
    /**
     * 기간별 증감비교 (Tab2)
     */
    function fn_createFig5253Grid2() {

        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_TAB2_GRID';
	    SBGridProperties.id 				= 'Fig5253Grid2';
	    SBGridProperties.jsonref 			= 'jsonFig5253Grid2';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozencols 		= 3;
        SBGridProperties.columns = [
            {caption: ["계정그룹",		"계정구분"],		ref: 'ACCOUNT_GROUP', 			type:'output', 		width:'100px', 		style:'text-align:left'},
            {caption: ["계정그룹",		"계정코드"], 		ref: 'ACCOUNT_CODE', 			type:'button',  	width:'100px', 		style:'text-align:left', 
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
            
            {caption: ["계정그룹",		"계정과목"],		ref: 'ACCOUNT_NAME', 			type:'output', 		width:'250px', 		style:'text-align:left'},
            
            {caption: [gd2_title_1,		"월(당기)"],		ref: 'THIS_PERIOD_AMT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd2_title_1,		"누계(당기)"],		ref: 'THIS_TOTAL_AMT', 			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: [gd2_title_2,		"월(전기)"],		ref: 'PREV_PERIOD_AMT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd2_title_2,		"누적(전기)"],		ref: 'PREV_TOTAL_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: [gd2_title_3,		"월(차이)"],		ref: 'NET_PERIOD_AMT', 			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd2_title_3,		"누적(차이)"],		ref: 'NET_TOTAL_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: [gd2_title_4,		"월(비율)"],		ref: 'NET_PERIOD_RATE', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd2_title_4,		"누적(비율)"],		ref: 'NET_TOTAL_RATE', 			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["비고",			""],				ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

	    Fig5253Grid2 = _SBGrid.create(SBGridProperties);
    }
    
    /**
     * 월별손익 (Tab3)
     */
    function fn_createFig5253Grid3() {

        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_TAB3_GRID';
	    SBGridProperties.id 				= 'Fig5253Grid3';
	    SBGridProperties.jsonref 			= 'jsonFig5253Grid3';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozencols 		= 3;
        SBGridProperties.columns = [
            {caption: ["계정정보",	"계정구분"],		ref: 'ACCOUNT_GROUP', 			type:'output', 		width:'70px', 		style:'text-align:left'},
            {caption: ["계정정보",	"계정코드"], 		ref: 'ACCOUNT_CODE', 			type:'button',  	width:'100px', 		style:'text-align:left', 
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
            
            {caption: ["계정정보",	"계정과목"],		ref: 'ACCOUNT_NAME', 			type:'output', 		width:'250px', 		style:'text-align:left'},
            
            {caption: ["기준년도",	"총금액"],			ref: 'TOTAL_AMT',		 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["기준년도",	"1월금액"],			ref: 'MON_01',			 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["기준년도",	"2월금액"],			ref: 'MON_02', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["기준년도",	"3월금액"],			ref: 'MON_03', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["기준년도",	"4월금액"],			ref: 'MON_04', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["기준년도",	"5월금액"],			ref: 'MON_05', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["기준년도",	"6월금액"],			ref: 'MON_06', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["기준년도",	"7월금액"],			ref: 'MON_07', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["기준년도",	"8월금액"],			ref: 'MON_08', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["기준년도",	"9월금액"],			ref: 'MON_09', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["기준년도",	"10월금액"],		ref: 'MON_10', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["기준년도",	"11월금액"],		ref: 'MON_11', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["기준년도",	"12월금액"],		ref: 'MON_12', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["비고"],							ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

	    Fig5253Grid3 = _SBGrid.create(SBGridProperties);
        //Fig5253Grid1.bind('click', 'fn_viewFig5253Grid1Event');
    }
    
    /**
     * 관리용 손익계산서 (Tab4)
     */
    function fn_createFig5253Grid4() {

        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_TAB4_GRID';
	    SBGridProperties.id 				= 'Fig5253Grid4';
	    SBGridProperties.jsonref 			= 'jsonFig5253Grid4';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.tree = {
	            col: 0,
	            levelref: 'LVL',
	            open: true,
	            lock: true
	    },
        SBGridProperties.columns = [
            {caption: ["계정그룹"],			ref: 'ACCOUNT_GROUP', 			type:'output', 		width:'200px', 		style:'text-align:left'},
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
            
            {caption: ["계정과목명"],		ref: 'ACCOUNT_NAME', 			type:'output', 		width:'250px', 		style:'text-align:left'},
            
            {caption: [gd4_title_1],		ref: 'THIS_SUMMARY_AMT',		type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd4_title_2],		ref: 'PREV_END_SUMMARY_AMT',	type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd4_title_3],		ref: 'PREV_SUMMARY_AMT',		type:'output',  	width:'200px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["비고"],				ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

	    Fig5253Grid4 = _SBGrid.create(SBGridProperties);
    }
    
    /**
     * 기간별 증감비교(트리) (Tab5)
     */
    function fn_createFig5253Grid5() {

        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_TAB5_GRID';
	    SBGridProperties.id 				= 'Fig5253Grid5';
	    SBGridProperties.jsonref 			= 'jsonFig5253Grid5';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.tree = {
	            col: 0,
	            levelref: 'LVL',
	            open: true,
	            lock: true
	    },
        SBGridProperties.columns = [
            {caption: ["계정Leval",		"계정Leval"],		ref: 'ACCOUNT_GROUP', 			type:'output', 		width:'200px', 		style:'text-align:left'},
            {caption: ["계정코드",		"계정코드"], 		ref: 'ACCOUNT_CODE', 			type:'button',  	width:'100px', 		style:'text-align:left', 
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
            
            {caption: ["계정과목명", 	"계정과목명"],		ref: 'ACCOUNT_NAME', 			type:'output', 		width:'250px', 		style:'text-align:left'},
            
            {caption: [gd5_title_1, 	gd5_title_1_1],		ref: 'THIS_PERIOD_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd5_title_1,		"누적"],			ref: 'THIS_TOTAL_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: [gd5_title_2, 	gd5_title_2_1],		ref: 'PREV_PERIOD_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: [gd5_title_2,		"누적"],			ref: 'PREV_TOTAL_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["증감액", 		"월"],				ref: 'NET_PERIOD_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["증감액",		"누적"],			ref: 'NET_TOTAL_AMT',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["증감비율(%)", 	"월"],				ref: 'NET_PERIOD_RATE',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["증감비율(%)",	"누적"],			ref: 'NET_TOTAL_RATE',			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["비고"],					ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

	    Fig5253Grid5 = _SBGrid.create(SBGridProperties);
    }

    /**
     * 월별손익(트리) (Tab6)
     */
    function fn_createFig5253Grid6() {

        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_TAB6_GRID';
	    SBGridProperties.id 				= 'Fig5253Grid6';
	    SBGridProperties.jsonref 			= 'jsonFig5253Grid6';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.tree = {
	            col: 0,
	            levelref: 'LVL',
	            open: true,
	            lock: true
	    },
        SBGridProperties.columns = [
            {caption: ["계정그룹"],			ref: 'ACCOUNT_GROUP', 			type:'output', 		width:'200px', 		style:'text-align:left'},
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
            
            {caption: ["계정과목명"],		ref: 'ACCOUNT_NAME', 			type:'output', 		width:'250px', 		style:'text-align:left'},
            
            {caption: ["총금액"],			ref: 'TOTAL_AMT',		 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["1월금액"],			ref: 'MON_01',			 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["2월금액"],			ref: 'MON_02', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["3월금액"],			ref: 'MON_03', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["4월금액"],			ref: 'MON_04', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["5월금액"],			ref: 'MON_05', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["6월금액"],			ref: 'MON_06', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["7월금액"],			ref: 'MON_07', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["8월금액"],			ref: 'MON_08', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["9월금액"],			ref: 'MON_09', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["10월금액"],			ref: 'MON_10', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["11월금액"],			ref: 'MON_11', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["12월금액"],			ref: 'MON_12', 					type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["비고"],							ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

	    Fig5253Grid6 = _SBGrid.create(SBGridProperties);
    }
    
    /**
     * 관리용 손익계산서 (Tab1)
     */
    const fn_setFig5253Grid1 = async function(wtype) {
		
        let strAccountLevel = "";
    	if(wtype=='T1' || wtype=='T2' || wtype== 'T3'){
    		strAccountLevel = 'Z';	
    	} else {
    		strAccountLevel = gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_LEVEL"));	
    	}
    	
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_ymdperiod_code_fr	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_FR"));
		let p_ymdperiod_code_to	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_TO"));
		let p_cbodescr1			= gfnma_nvl(SBUxMethod.get("SCH_CBODESCR1"));
		let p_ymdselect_period1	= gfnma_nvl(SBUxMethod.get("SCH_YMDSELECT_PERIOD1"));
		let p_zero_include_yn	 = gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!p_ymdperiod_code_fr){
 			gfn_comAlert("E0000","기준년월을 선택하세요");
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
			,V_P_PERIOD_CODE_FR		: p_ymdperiod_code_fr
			,V_P_PERIOD_CODE_TO		: p_ymdperiod_code_to
			,V_P_ACCOUNT_GROUP		: strAccountLevel
			,V_P_DESCR				: p_cbodescr1
			,V_P_SELECT_PERIOD		: p_ymdselect_period1
			,V_P_ZERO_INCLUDE_YN	: p_zero_include_yn
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
		console.log('paramObj:', paramObj);
        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5253List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFig5253Grid1.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						ACCOUNT_CODE				: gfnma_nvl2(item.ACCOUNT_CODE),
  						ACCOUNT_CODE_VIEW			: gfnma_nvl2(item.ACCOUNT_CODE_VIEW),
  						ACCOUNT_GROUP				: gfnma_nvl2(item.ACCOUNT_GROUP),
  						ACCOUNT_NAME				: gfnma_nvl2(item.ACCOUNT_NAME),
  						ACCT_RULE_CODE				: gfnma_nvl2(item.ACCT_RULE_CODE),
  						
  						COMP_CODE					: gfnma_nvl2(item.COMP_CODE),
  						FI_ORG_CODE					: gfnma_nvl2(item.FI_ORG_CODE),
  						FONT_SIZE 					: gfnma_nvl2(item.FONT_SIZE),
  						
  						HQ_ACCOUNT_CODE 			: gfnma_nvl2(item.HQ_ACCOUNT_CODE),
  						HQ_ACCOUNT_NAME 			: gfnma_nvl2(item.HQ_ACCOUNT_NAME),
  						PERIOD_FR 					: gfnma_nvl2(item.PERIOD_FR),
  						
  						PREV_DETAIL_AMT 			: gfnma_nvl2(item.PREV_DETAIL_AMT),
  						PREV_DETAIL_QTY 			: gfnma_nvl2(item.PREV_DETAIL_QTY),
  						PREV_END_DETAIL_AMT 		: gfnma_nvl2(item.PREV_END_DETAIL_AMT),
  						PREV_END_DETAIL_QTY 		: gfnma_nvl2(item.PREV_END_DETAIL_QTY),
  						PREV_END_SUMMARY_AMT 		: gfnma_nvl2(item.PREV_END_SUMMARY_AMT),
  						
  						PREV_PERIOD 				: gfnma_nvl2(item.PREV_PERIOD),
  						PREV_PERIOD_DESCR 			: gfnma_nvl2(item.PREV_PERIOD_DESCR),
  						PREV_PERIOD_END_FR 			: gfnma_nvl2(item.PREV_PERIOD_END_FR),
  						PREV_PERIOD_END_TO 			: gfnma_nvl2(item.PREV_PERIOD_END_TO),
  						PREV_SUMMARY_AMT 			: gfnma_nvl2(item.PREV_SUMMARY_AMT),
  						
  						REPORT_ACCOUNT_CODE 		: gfnma_nvl2(item.REPORT_ACCOUNT_CODE),
  						REPORT_ACCOUNT_NAME 		: gfnma_nvl2(item.REPORT_ACCOUNT_NAME),
  						
  						SORT_SEQ_PL 				: gfnma_nvl2(item.SORT_SEQ_PL),
  						THIS_DETAIL_AMT 			: gfnma_nvl2(item.THIS_DETAIL_AMT),
  						THIS_DETAIL_QTY 			: gfnma_nvl2(item.THIS_DETAIL_QTY),
  						THIS_SUMMARY_AMT			: gfnma_nvl2(item.THIS_SUMMARY_AMT),
  					}
  					jsonFig5253Grid1.push(msg);
  					totalRecordCount ++;
  				});

  	        	if(jsonFig5253Grid1.length>0){
  	        		strTMperiod 	= (jsonFig5253Grid1[0]['PERIOD_FR']).substr(0,4) + '-' + (jsonFig5253Grid1[0]['PERIOD_FR']).substr(4,2);
  	        		strBEperiod 	= (jsonFig5253Grid1[0]['PREV_PERIOD_END_FR']).substr(0,4) + '-' + (jsonFig5253Grid1[0]['PREV_PERIOD_END_FR']).substr(4,2);
  	        		strBSperiod 	= (jsonFig5253Grid1[0]['PREV_PERIOD']).substr(0,4) + '-' + (jsonFig5253Grid1[0]['PREV_PERIOD']).substr(4,2);
  	        		strBSperiodDescr= (jsonFig5253Grid1[0]['PREV_PERIOD_DESCR']);
  	        		
  	        		gd1_title_1 = '당기' + '(' + strTMperiod  + ')';
  	        		gd1_title_2 = '전기말' + '(' + strBEperiod  + ')';
  	        		gd1_title_3 = strBSperiodDescr + '(' + strBSperiod  + ')';
  	        	}
  	        	
	  	      	//타이틀 재구성 -----------
	  	      	fn_createFig5253Grid1();    	
		  		Fig5253Grid1.clearStatus();
	  	      	//--------------------------
	  	      	
        		Fig5253Grid1.rebuild();
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
     * 기간별 증감비교 (Tab2)
     */
    const fn_setFig5253Grid2 = async function(wtype) {
		
        let strAccountLevel = "";
    	if(wtype=='T1' || wtype=='T2' || wtype== 'T3'){
    		strAccountLevel = 'Z';	
    	} else {
    		strAccountLevel = gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_LEVEL"));	
    	}
    	
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_ymdperiod_code_fr	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_FR"));
		let p_ymdperiod_code_to	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_TO"));
		let p_cbodescr1			= gfnma_nvl(SBUxMethod.get("SCH_CBODESCR1"));
		let p_ymdselect_period1	= gfnma_nvl(SBUxMethod.get("SCH_YMDSELECT_PERIOD1"));
		let p_zero_include_yn	 = gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!p_ymdperiod_code_fr){
 			gfn_comAlert("E0000","기준년월을 선택하세요");
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
			,V_P_PERIOD_CODE_FR		: p_ymdperiod_code_fr
			,V_P_PERIOD_CODE_TO		: p_ymdperiod_code_to
			,V_P_ACCOUNT_GROUP		: strAccountLevel
			,V_P_DESCR				: p_cbodescr1
			,V_P_SELECT_PERIOD		: p_ymdselect_period1
			,V_P_ZERO_INCLUDE_YN	: p_zero_include_yn

			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5253List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	    		jsonFig5253Grid2.length = 0;
  	        	data.cv_3.forEach((item, index) => {
  					const msg = {
  						ACCOUNT_CODE				: gfnma_nvl2(item.ACCOUNT_CODE),
  						ACCOUNT_CODE_VIEW			: gfnma_nvl2(item.ACCOUNT_CODE_VIEW),
  						ACCOUNT_GROUP				: gfnma_nvl2(item.ACCOUNT_GROUP),
  						ACCOUNT_NAME				: gfnma_nvl2(item.ACCOUNT_NAME),
  						ACCT_RULE_CODE				: gfnma_nvl2(item.ACCT_RULE_CODE),
  						
  						COMP_CODE					: gfnma_nvl2(item.COMP_CODE),
  						FI_ORG_CODE					: gfnma_nvl2(item.FI_ORG_CODE),
  						FONT_SIZE 					: gfnma_nvl2(item.FONT_SIZE),
  						
  						HQ_ACCOUNT_CODE 			: gfnma_nvl2(item.HQ_ACCOUNT_CODE),
  						HQ_ACCOUNT_NAME 			: gfnma_nvl2(item.HQ_ACCOUNT_NAME),
  						
  						NET_PERIOD_AMT				: gfnma_nvl2(item.NET_PERIOD_AMT),
  						NET_PERIOD_QTY				: gfnma_nvl2(item.NET_PERIOD_QTY),
  						NET_PERIOD_QTY_RATE			: gfnma_nvl2(item.NET_PERIOD_QTY_RATE),
  						NET_PERIOD_RATE				: gfnma_nvl2(item.NET_PERIOD_RATE),
  						
  						NET_TOTAL_AMT				: gfnma_nvl2(item.NET_TOTAL_AMT),
  						NET_TOTAL_QTY				: gfnma_nvl2(item.NET_TOTAL_QTY),
  						NET_TOTAL_QTY_RATE			: gfnma_nvl2(item.NET_TOTAL_QTY_RATE),
  						NET_TOTAL_RATE				: gfnma_nvl2(item.NET_TOTAL_RATE),
  						
  						PERIOD_FR					: gfnma_nvl2(item.PERIOD_FR),
  						PERIOD_TO					: gfnma_nvl2(item.PERIOD_TO),
  						
  						PREV_PERIOD_AMT 			: gfnma_nvl2(item.PREV_PERIOD_AMT),
  						PREV_PERIOD_DESCR 			: gfnma_nvl2(item.PREV_PERIOD_DESCR),
  						PREV_PERIOD_FR				: gfnma_nvl2(item.PREV_PERIOD_FR),
  						PREV_PERIOD_QTY 			: gfnma_nvl2(item.PREV_PERIOD_QTY),
  						PREV_PERIOD_TO	 			: gfnma_nvl2(item.PREV_PERIOD_TO),
  						PREV_TOTAL_AMT 				: gfnma_nvl2(item.PREV_TOTAL_AMT),
  						PREV_TOTAL_QTY 				: gfnma_nvl2(item.PREV_TOTAL_QTY),
  						
  						REPORT_ACCOUNT_CODE 		: gfnma_nvl2(item.REPORT_ACCOUNT_CODE),
  						REPORT_ACCOUNT_NAME 		: gfnma_nvl2(item.REPORT_ACCOUNT_NAME),
  						
  						SORT_SEQ_PL					: gfnma_nvl2(item.SORT_SEQ_PL),
  						THIS_PERIOD_AMT				: gfnma_nvl2(item.THIS_PERIOD_AMT),
  						THIS_PERIOD_QTY				: gfnma_nvl2(item.THIS_PERIOD_QTY),
  						THIS_TOTAL_AMT 				: gfnma_nvl2(item.THIS_TOTAL_AMT),
  						THIS_TOTAL_QTY				: gfnma_nvl2(item.THIS_TOTAL_QTY)
  					}
  					jsonFig5253Grid2.push(msg);
  					totalRecordCount ++;
  				});

  	        	if(jsonFig5253Grid2.length>0){
  	        		strTPperiod 	= (jsonFig5253Grid2[0]['PERIOD_FR']).substr(0,4) + '-' + (jsonFig5253Grid2[0]['PERIOD_TO']).substr(0,4);
  	        		strTMperiod 	= (jsonFig5253Grid2[0]['PERIOD_TO']).substr(0,4) + '-' + (jsonFig5253Grid2[0]['PERIOD_TO']).substr(4,2);
  	        		strBEperiod 	= (jsonFig5253Grid2[0]['PREV_PERIOD_FR']).substr(0,6) + '-' + (jsonFig5253Grid2[0]['PREV_PERIOD_TO']).substr(0,6);
  	        		strBSperiod 	= (jsonFig5253Grid2[0]['PREV_PERIOD_TO']).substr(0,4) + '-' + (jsonFig5253Grid2[0]['PREV_PERIOD_TO']).substr(4,2);
  	        		strBSperiodDescr= (jsonFig5253Grid2[0]['PREV_PERIOD_DESCR']);
  	        		
  	        		gd2_title_1 = '당기' + '(' + strTMperiod  + ')';
  	        		gd2_title_2 = strBSperiodDescr + '(' + strBEperiod + ')';
  	        		gd2_title_3 = '차이' + '(' + strBSperiod  + '-' + strTPperiod + ')';
  	        		gd2_title_4 = '비율' + '(' + strBSperiod  + '-' + strTPperiod + ')';
  	        	}
  	        	
	  	      	//타이틀 재구성 -----------
	  	      	fn_createFig5253Grid2();    	
	  			Fig5253Grid2.clearStatus();
	  	      	//--------------------------
  	        	
  	        	Fig5253Grid2.rebuild();
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
     * 월별손익 (Tab3)
     */
    const fn_setFig5253Grid3 = async function(wtype) {
		
        let strAccountLevel = "";
    	if(wtype=='T1' || wtype=='T2' || wtype== 'T3'){
    		strAccountLevel = 'Z';	
    	} else {
    		strAccountLevel = gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_LEVEL"));	
    	}
    	
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_ymdperiod_code_fr	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_FR"));
		let p_ymdperiod_code_to	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_TO"));
		let p_cbodescr1			= gfnma_nvl(SBUxMethod.get("SCH_CBODESCR1"));
		let p_ymdselect_period1	= gfnma_nvl(SBUxMethod.get("SCH_YMDSELECT_PERIOD1"));
		let p_zero_include_yn	 = gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!p_ymdperiod_code_fr){
 			gfn_comAlert("E0000","기준년월을 선택하세요");
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
			,V_P_PERIOD_CODE_FR		: p_ymdperiod_code_fr
			,V_P_PERIOD_CODE_TO		: p_ymdperiod_code_to
			,V_P_ACCOUNT_GROUP		: strAccountLevel
			,V_P_DESCR				: p_cbodescr1
			,V_P_SELECT_PERIOD		: p_ymdselect_period1
			,V_P_ZERO_INCLUDE_YN	: p_zero_include_yn

			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5253List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	    		jsonFig5253Grid3.length = 0;
  	        	data.cv_3.forEach((item, index) => {
  					const msg = {
  						ACCOUNT_CODE				: gfnma_nvl2(item.ACCOUNT_CODE),
  						ACCOUNT_CODE_VIEW			: gfnma_nvl2(item.ACCOUNT_CODE_VIEW),
  						ACCOUNT_GROUP				: gfnma_nvl2(item.ACCOUNT_GROUP),
  						ACCOUNT_NAME				: gfnma_nvl2(item.ACCOUNT_NAME),
  						ACCT_RULE_CODE				: gfnma_nvl2(item.ACCT_RULE_CODE),
  						
  						COMP_CODE					: gfnma_nvl2(item.COMP_CODE),
  						FI_ORG_CODE					: gfnma_nvl2(item.FI_ORG_CODE),
  						FONT_SIZE 					: gfnma_nvl2(item.FONT_SIZE),
  						
  						HQ_ACCOUNT_CODE 			: gfnma_nvl2(item.HQ_ACCOUNT_CODE),
  						HQ_ACCOUNT_NAME 			: gfnma_nvl2(item.HQ_ACCOUNT_NAME),
  						
  						MON_01						: gfnma_nvl2(item.MON_01),
  						MON_02						: gfnma_nvl2(item.MON_02),
  						MON_03						: gfnma_nvl2(item.MON_03),
  						MON_04						: gfnma_nvl2(item.MON_04),
  						MON_05						: gfnma_nvl2(item.MON_05),
  						MON_06						: gfnma_nvl2(item.MON_06),
  						MON_07						: gfnma_nvl2(item.MON_07),
  						MON_08						: gfnma_nvl2(item.MON_08),
  						MON_09						: gfnma_nvl2(item.MON_09),
  						MON_10						: gfnma_nvl2(item.MON_10),
  						MON_11						: gfnma_nvl2(item.MON_11),
  						MON_12						: gfnma_nvl2(item.MON_12),
  						
  						MON_Q01						: gfnma_nvl2(item.MON_Q01),
  						MON_Q02						: gfnma_nvl2(item.MON_Q02),
  						MON_Q03						: gfnma_nvl2(item.MON_Q03),
  						MON_Q04						: gfnma_nvl2(item.MON_Q04),
  						MON_Q05						: gfnma_nvl2(item.MON_Q05),
  						MON_Q06						: gfnma_nvl2(item.MON_Q06),
  						MON_Q07						: gfnma_nvl2(item.MON_Q07),
  						MON_Q08						: gfnma_nvl2(item.MON_Q08),
  						MON_Q09						: gfnma_nvl2(item.MON_Q09),
  						MON_Q10						: gfnma_nvl2(item.MON_Q10),
  						MON_Q11						: gfnma_nvl2(item.MON_Q11),
  						MON_Q12						: gfnma_nvl2(item.MON_Q12),
  						
  						REPORT_ACCOUNT_CODE 		: gfnma_nvl2(item.REPORT_ACCOUNT_CODE),
  						REPORT_ACCOUNT_NAME 		: gfnma_nvl2(item.REPORT_ACCOUNT_NAME),
  						
  						SORT_SEQ_PL					: gfnma_nvl2(item.SORT_SEQ_PL),
  						TOTAL_AMT					: gfnma_nvl2(item.TOTAL_AMT)
  					}
  					jsonFig5253Grid3.push(msg);
  					totalRecordCount ++;
  				});

	  	      	//타이틀 재구성 -----------
	  	      	fn_createFig5253Grid3();    	
	  			Fig5253Grid3.clearStatus();
	  	      	//--------------------------
  	        	
  	        	Fig5253Grid3.rebuild();
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
     * 관리용 손익계산서 (Tab4)
     */
    const fn_setFig5253Grid4 = async function(wtype) {
		
        let strAccountLevel = "";
    	if(wtype=='T1' || wtype=='T2' || wtype== 'T3'){
    		strAccountLevel = 'Z';	
    	} else {
    		strAccountLevel = gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_LEVEL"));	
    	}
    	
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_ymdperiod_code_fr	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_FR"));
		let p_ymdperiod_code_to	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_TO"));
		let p_cbodescr1			= gfnma_nvl(SBUxMethod.get("SCH_CBODESCR1"));
		let p_ymdselect_period1	= gfnma_nvl(SBUxMethod.get("SCH_YMDSELECT_PERIOD1"));
		let p_zero_include_yn	 = gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!p_ymdperiod_code_fr){
 			gfn_comAlert("E0000","기준년월을 선택하세요");
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
			,V_P_PERIOD_CODE_FR		: p_ymdperiod_code_fr
			,V_P_PERIOD_CODE_TO		: p_ymdperiod_code_to
			,V_P_ACCOUNT_GROUP		: strAccountLevel
			,V_P_DESCR				: p_cbodescr1
			,V_P_SELECT_PERIOD		: p_ymdselect_period1
			,V_P_ZERO_INCLUDE_YN	: p_zero_include_yn

			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5253List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	    		jsonFig5253Grid4.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  							LVL							: gfnma_nvl2(item.LVL),
  	  						
  	  						ACCOUNT_CODE				: gfnma_nvl2(item.ACCOUNT_CODE),
  	  						ACCOUNT_CODE_VIEW			: gfnma_nvl2(item.ACCOUNT_CODE_VIEW),
  	  						ACCOUNT_GROUP				: gfnma_nvl2(item.ACCOUNT_GROUP),
  	  						ACCOUNT_NAME				: gfnma_nvl2(item.ACCOUNT_NAME),
  	  						ACCT_RULE_CODE				: gfnma_nvl2(item.ACCT_RULE_CODE),
  	  						
  	  						COMP_CODE					: gfnma_nvl2(item.COMP_CODE),
  	  						FI_ORG_CODE					: gfnma_nvl2(item.FI_ORG_CODE),
  	  						FONT_SIZE 					: gfnma_nvl2(item.FONT_SIZE),
  	  						KEYID 						: gfnma_nvl2(item.KEYID),
  	  						PARENTKEYID 				: gfnma_nvl2(item.PARENTKEYID),
  	  						
  	  						PERIOD_FR 					: gfnma_nvl2(item.PERIOD_FR),
  	  						PREV_END_SUMMARY_AMT 		: gfnma_nvl2(item.PREV_END_SUMMARY_AMT),
  	  						PREV_PERIOD 				: gfnma_nvl2(item.PREV_PERIOD),
  	  						PREV_PERIOD_DESCR 			: gfnma_nvl2(item.PREV_PERIOD_DESCR),
  	  						PREV_PERIOD_END_FR 			: gfnma_nvl2(item.PREV_PERIOD_END_FR),
  	  						PREV_PERIOD_END_TO 			: gfnma_nvl2(item.PREV_PERIOD_END_TO),
  	  						PREV_SUMMARY_AMT 			: gfnma_nvl2(item.PREV_SUMMARY_AMT),
  	  						SORT_SEQ_PL 				: gfnma_nvl2(item.SORT_SEQ_PL),
  	  						THIS_SUMMARY_AMT 			: gfnma_nvl2(item.THIS_SUMMARY_AMT),
  					}
  					jsonFig5253Grid4.push(msg);
  					totalRecordCount ++;
  				});

  	        	if(jsonFig5253Grid4.length>0){
  	        		strTMperiod 	= (jsonFig5253Grid4[0]['PERIOD_FR']).substr(0,4) + '01-' + (jsonFig5253Grid4[0]['PERIOD_FR']).substr(0,6);
  	        		strBEperiod 	= (jsonFig5253Grid4[0]['PREV_PERIOD_END_FR']).substr(0,4) + '01-' + (jsonFig5253Grid4[0]['PREV_PERIOD_END_TO']).substr(0,6);
  	        		strBSperiod 	= (jsonFig5253Grid4[0]['PREV_PERIOD']).substr(0,4) + '01-' + (jsonFig5253Grid4[0]['PREV_PERIOD']).substr(0,6);
  	        		strBSperiodDescr= (jsonFig5253Grid4[0]['PREV_PERIOD_DESCR']);
  	        		
  	        		gd4_title_1 = '당기' + '(' + strTMperiod  + ')';
  	        		gd4_title_2 = '전기말' + '(' + strBEperiod + ')';
  	        		gd4_title_3 = strBSperiodDescr + '(' + strBSperiod + ')';
  	        	}
  	        	
	  	      	//타이틀 재구성 -----------
	  	      	fn_createFig5253Grid4();    	
	  			Fig5253Grid4.clearStatus();
	  	      	//--------------------------
  	        	
  	        	Fig5253Grid4.rebuild();
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
     * 기간별 증감비교(트리) (Tab5)
     */
    const fn_setFig5253Grid5 = async function(wtype) {
		
        let strAccountLevel = "";
    	if(wtype=='T1' || wtype=='T2' || wtype== 'T3'){
    		strAccountLevel = 'Z';	
    	} else {
    		strAccountLevel = gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_LEVEL"));	
    	}
    	
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_ymdperiod_code_fr	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_FR"));
		let p_ymdperiod_code_to	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_TO"));
		let p_cbodescr1			= gfnma_nvl(SBUxMethod.get("SCH_CBODESCR1"));
		let p_ymdselect_period1	= gfnma_nvl(SBUxMethod.get("SCH_YMDSELECT_PERIOD1"));
		let p_zero_include_yn	 = gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!p_ymdperiod_code_fr){
 			gfn_comAlert("E0000","기준년월을 선택하세요");
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
			,V_P_PERIOD_CODE_FR		: p_ymdperiod_code_fr
			,V_P_PERIOD_CODE_TO		: p_ymdperiod_code_to
			,V_P_ACCOUNT_GROUP		: strAccountLevel
			,V_P_DESCR				: p_cbodescr1
			,V_P_SELECT_PERIOD		: p_ymdselect_period1
			,V_P_ZERO_INCLUDE_YN	: p_zero_include_yn

			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5253List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	    		jsonFig5253Grid5.length = 0;
  	        	data.cv_3.forEach((item, index) => {
  					const msg = {
						LVL							: gfnma_nvl2(item.LVL),
  						
  						ACCOUNT_CODE				: gfnma_nvl2(item.ACCOUNT_CODE),
  						ACCOUNT_CODE_VIEW			: gfnma_nvl2(item.ACCOUNT_CODE_VIEW),
  						ACCOUNT_GROUP				: gfnma_nvl2(item.ACCOUNT_GROUP),
  						ACCOUNT_NAME				: gfnma_nvl2(item.ACCOUNT_NAME),
  						ACCT_RULE_CODE				: gfnma_nvl2(item.ACCT_RULE_CODE),
  						
  						COMP_CODE					: gfnma_nvl2(item.COMP_CODE),
  						FI_ORG_CODE					: gfnma_nvl2(item.FI_ORG_CODE),
  						FONT_SIZE 					: gfnma_nvl2(item.FONT_SIZE),
  						KEYID 						: gfnma_nvl2(item.KEYID),
  						
  						NET_PERIOD_AMT 				: gfnma_nvl2(item.NET_PERIOD_AMT),
  						NET_PERIOD_RATE 			: gfnma_nvl2(item.NET_PERIOD_RATE),
  						NET_TOTAL_AMT 				: gfnma_nvl2(item.NET_TOTAL_AMT),
  						NET_TOTAL_RATE 				: gfnma_nvl2(item.NET_TOTAL_RATE),
  						
  						PARENTKEYID 				: gfnma_nvl2(item.PARENTKEYID),
  						
  						PERIOD_FR 					: gfnma_nvl2(item.PERIOD_FR),
  						PERIOD_TO 					: gfnma_nvl2(item.PERIOD_TO),
  						
  						PREV_PERIOD_AMT 			: gfnma_nvl2(item.PREV_PERIOD_AMT),
  						PREV_PERIOD_DESCR 			: gfnma_nvl2(item.PREV_PERIOD_DESCR),
  						PREV_PERIOD_FR 				: gfnma_nvl2(item.PREV_PERIOD_FR),
  						PREV_PERIOD_TO 				: gfnma_nvl2(item.PREV_PERIOD_TO),
  						PREV_TOTAL_AMT 				: gfnma_nvl2(item.PREV_TOTAL_AMT),
  						SORT_SEQ_PL 				: gfnma_nvl2(item.SORT_SEQ_PL),
  						THIS_PERIOD_AMT 			: gfnma_nvl2(item.THIS_PERIOD_AMT),
  						THIS_TOTAL_AMT 				: gfnma_nvl2(item.THIS_TOTAL_AMT),
  					}
  					jsonFig5253Grid5.push(msg);
  					totalRecordCount ++;
  				});

  	        	if(jsonFig5253Grid5.length>0){
  	        		strTPperiod 	= (jsonFig5253Grid5[0]['PERIOD_FR']).substr(0,6) + '-' + (jsonFig5253Grid5[0]['PERIOD_TO']).substr(0,6);
  	        		strTMperiod 	= (jsonFig5253Grid5[0]['PERIOD_TO']).substr(0,4) + '-' + (jsonFig5253Grid5[0]['PERIOD_TO']).substr(4,2);
  	        		strBEperiod 	= (jsonFig5253Grid5[0]['PREV_PERIOD_FR']).substr(0,6) + '01-' + (jsonFig5253Grid5[0]['PREV_PERIOD_TO']).substr(0,6);
  	        		strBSperiod 	= (jsonFig5253Grid5[0]['PREV_PERIOD_TO']).substr(0,4) + '01-' + (jsonFig5253Grid5[0]['PREV_PERIOD_TO']).substr(4,2);
  	        		strBSperiodDescr= (jsonFig5253Grid5[0]['PREV_PERIOD_DESCR']);
  	        		
  	        		gd5_title_1 	= '당기' + '(' + strTPperiod  + ')';
  	        		gd5_title_1_1 	= '월' + '(' + strTMperiod + ')';
  	        		gd5_title_2 	= strBSperiodDescr + '(' + strBEperiod + ')';
  	        		gd5_title_2_1 	= '월' + '(' + strBSperiod + ')';
  	        	}
  	        	
	  	      	//타이틀 재구성 -----------
	  	      	fn_createFig5253Grid5();    	
	  			Fig5253Grid5.clearStatus();
	  	      	//--------------------------
  	        	
  	        	Fig5253Grid5.rebuild();
        		fn_setStyle5();

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
     * 월별손익(트리) (Tab6)
     */
    const fn_setFig5253Grid6 = async function(wtype) {
		
        let strAccountLevel = "";
    	if(wtype=='T1' || wtype=='T2' || wtype== 'T3'){
    		strAccountLevel = 'Z';	
    	} else {
    		strAccountLevel = gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_LEVEL"));	
    	}
    	
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_ymdperiod_code_fr	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_FR"));
		let p_ymdperiod_code_to	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_TO"));
		let p_cbodescr1			= gfnma_nvl(SBUxMethod.get("SCH_CBODESCR1"));
		let p_ymdselect_period1	= gfnma_nvl(SBUxMethod.get("SCH_YMDSELECT_PERIOD1"));
		let p_zero_include_yn	 = gfnma_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!p_ymdperiod_code_fr){
 			gfn_comAlert("E0000","기준년월을 선택하세요");
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
			,V_P_PERIOD_CODE_FR		: p_ymdperiod_code_fr
			,V_P_PERIOD_CODE_TO		: p_ymdperiod_code_to
			,V_P_ACCOUNT_GROUP		: strAccountLevel
			,V_P_DESCR				: p_cbodescr1
			,V_P_SELECT_PERIOD		: p_ymdselect_period1
			,V_P_ZERO_INCLUDE_YN	: p_zero_include_yn

			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5253List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	    		jsonFig5253Grid6.length = 0;
  	        	data.cv_3.forEach((item, index) => {
  					const msg = {
						LVL							: gfnma_nvl2(item.LVL),
  							
  						ACCOUNT_CODE				: gfnma_nvl2(item.ACCOUNT_CODE),
  						ACCOUNT_CODE_VIEW			: gfnma_nvl2(item.ACCOUNT_CODE_VIEW),
  						ACCOUNT_GROUP				: gfnma_nvl2(item.ACCOUNT_GROUP),
  						ACCOUNT_NAME				: gfnma_nvl2(item.ACCOUNT_NAME),
  						ACCT_RULE_CODE				: gfnma_nvl2(item.ACCT_RULE_CODE),
  						
  						COMP_CODE					: gfnma_nvl2(item.COMP_CODE),
  						FI_ORG_CODE					: gfnma_nvl2(item.FI_ORG_CODE),
  						FONT_SIZE 					: gfnma_nvl2(item.FONT_SIZE),
  						
  						HQ_ACCOUNT_CODE 			: gfnma_nvl2(item.HQ_ACCOUNT_CODE),
  						HQ_ACCOUNT_NAME 			: gfnma_nvl2(item.HQ_ACCOUNT_NAME),
  						
  						MON_01						: gfnma_nvl2(item.MON_01),
  						MON_02						: gfnma_nvl2(item.MON_02),
  						MON_03						: gfnma_nvl2(item.MON_03),
  						MON_04						: gfnma_nvl2(item.MON_04),
  						MON_05						: gfnma_nvl2(item.MON_05),
  						MON_06						: gfnma_nvl2(item.MON_06),
  						MON_07						: gfnma_nvl2(item.MON_07),
  						MON_08						: gfnma_nvl2(item.MON_08),
  						MON_09						: gfnma_nvl2(item.MON_09),
  						MON_10						: gfnma_nvl2(item.MON_10),
  						MON_11						: gfnma_nvl2(item.MON_11),
  						MON_12						: gfnma_nvl2(item.MON_12),
  						
  						MON_Q01						: gfnma_nvl2(item.MON_Q01),
  						MON_Q02						: gfnma_nvl2(item.MON_Q02),
  						MON_Q03						: gfnma_nvl2(item.MON_Q03),
  						MON_Q04						: gfnma_nvl2(item.MON_Q04),
  						MON_Q05						: gfnma_nvl2(item.MON_Q05),
  						MON_Q06						: gfnma_nvl2(item.MON_Q06),
  						MON_Q07						: gfnma_nvl2(item.MON_Q07),
  						MON_Q08						: gfnma_nvl2(item.MON_Q08),
  						MON_Q09						: gfnma_nvl2(item.MON_Q09),
  						MON_Q10						: gfnma_nvl2(item.MON_Q10),
  						MON_Q11						: gfnma_nvl2(item.MON_Q11),
  						MON_Q12						: gfnma_nvl2(item.MON_Q12),
  						
  						REPORT_ACCOUNT_CODE 		: gfnma_nvl2(item.REPORT_ACCOUNT_CODE),
  						REPORT_ACCOUNT_NAME 		: gfnma_nvl2(item.REPORT_ACCOUNT_NAME),
  						
  						SORT_SEQ_PL					: gfnma_nvl2(item.SORT_SEQ_PL),
  						TOTAL_AMT					: gfnma_nvl2(item.TOTAL_AMT)
  					}
  					jsonFig5253Grid6.push(msg);
  					totalRecordCount ++;
  				});

	  	      	//타이틀 재구성 -----------
	  	      	fn_createFig5253Grid6();    	
	  			Fig5253Grid6.clearStatus();
	  	      	//--------------------------
  	        	
  	        	Fig5253Grid6.rebuild();
        		fn_setStyle6();

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
     * 계정별원장조회
     */
    const fn_account = function() {
    }
    
    /**
     * 날짜
     */
    var fn_cngBasicDate = function() {
//         var yyyymm	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_FR"));
// 		SBUxMethod.set('SCH_YMDSELECT_PERIOD1', 		yyyymm);
// 		SBUxMethod.set('SCH_YYMDSELECT_PERIOD2', 		yyyymm);    	
    }
    
    /**
     * 비고1
     */
    var fn_cngCbodescr1 = function(val) {
    	console.log(val);
    	if(val=='BM'){
    		SBUxMethod.hide('SCH_YMDSELECT_PERIOD1');
    	} else if(val=='BBM'){
    		SBUxMethod.hide('SCH_YMDSELECT_PERIOD1');
    	} else if(val=='BE'){
    		SBUxMethod.hide('SCH_YMDSELECT_PERIOD1');
    	} else if(val=='BS'){
    		SBUxMethod.hide('SCH_YMDSELECT_PERIOD1');
    	} else {
    		if(p_sel_tab == 1 || p_sel_tab == 4){
        		SBUxMethod.show('SCH_YMDSELECT_PERIOD1');
    		} else {
    			SBUxMethod.set('SCH_CBODESCR1', 'BS');
        		SBUxMethod.hide('SCH_YMDSELECT_PERIOD1');
    		}
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
    	let allDatas = Fig5253Grid1.getGridDataAll();
    	let chk 	 = false;
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['ACCOUNT_GROUP']=='G'){
      			Fig5253Grid1.setRowStyle(i+2, 'data', 'background', '#d4f1da');
      			Fig5253Grid1.setRowStyle(i+2, 'data', 'font-weight', 'bold');
      			chk = true;
      		}
      	}
      	if(chk){
      		Fig5253Grid1.clearSelection();
      	}
  	}    
        
    /**
     * 그리드2 색상
     */
    var fn_setStyle2 = function() {
    	let allDatas = Fig5253Grid2.getGridDataAll();
    	let chk 	 = false;
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['ACCOUNT_GROUP']=='G'){
      			Fig5253Grid2.setRowStyle(i+2, 'data', 'background', '#d4f1da');
      			Fig5253Grid2.setRowStyle(i+2, 'data', 'font-weight', 'bold');
      			chk = true;
      		}
      	}
      	if(chk){
      		Fig5253Grid2.clearSelection();
      	}
  	}    
        
    /**
     * 그리드3 색상
     */
    var fn_setStyle3 = function() {
    	let allDatas = Fig5253Grid3.getGridDataAll();
    	let chk 	 = false;
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['ACCOUNT_GROUP']=='G'){
      			Fig5253Grid3.setRowStyle(i+2, 'data', 'background', '#d4f1da');
      			Fig5253Grid3.setRowStyle(i+2, 'data', 'font-weight', 'bold');
      			chk = true;
      		}
      	}
      	if(chk){
      		Fig5253Grid3.clearSelection();
      	}
  	}    
        
    /**
     * 그리드4 색상
     */
    var fn_setStyle4 = function() {
    	let allDatas = Fig5253Grid4.getGridDataAll();
    	let chk 	 = false;
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['ACCOUNT_GROUP']=='G'){
      			Fig5253Grid4.setRowStyle(i+1, 'data', 'background', '#d4f1da');
      			Fig5253Grid4.setRowStyle(i+1, 'data', 'font-weight', 'bold');
      			chk = true;
      		}
      	}
      	if(chk){
      		Fig5253Grid4.clearSelection();
      	}
  	}    
        
    /**
     * 그리드5 색상
     */
    var fn_setStyle5 = function() {
    	let allDatas = Fig5253Grid5.getGridDataAll();
    	let chk 	 = false;
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['ACCOUNT_GROUP']=='G'){
      			Fig5253Grid5.setRowStyle(i+2, 'data', 'background', '#d4f1da');
      			Fig5253Grid5.setRowStyle(i+2, 'data', 'font-weight', 'bold');
      			chk = true;
      		}
      	}
      	if(chk){
      		Fig5253Grid5.clearSelection();
      	}
  	}    
        
    /**
     * 그리드6 색상
     */
    var fn_setStyle6 = function() {
    	let allDatas = Fig5253Grid6.getGridDataAll();
    	let chk 	 = false;
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['ACCOUNT_GROUP']=='G'){
      			Fig5253Grid6.setRowStyle(i+1, 'data', 'background', '#d4f1da');
      			Fig5253Grid6.setRowStyle(i+1, 'data', 'font-weight', 'bold');
      			chk = true;
      		}
      	}
      	if(chk){
      		Fig5253Grid6.clearSelection();
      	}
  	}    
    
    /**
     * 트리펼치기
     */
    var fn_treeOpen1 = function() {
    	Fig5253Grid4.openTreeNodeAll();
  	}    

    /**
     * 트리접기
     */
    var fn_treeClose1 = function() {
    	Fig5253Grid4.closeTreeNodeAll();
  	}    
    
    /**
     * 트리펼치기
     */
    var fn_treeOpen2 = function() {
    	Fig5253Grid5.openTreeNodeAll();
  	}    

    /**
     * 트리접기
     */
    var fn_treeClose2 = function() {
    	Fig5253Grid5.closeTreeNodeAll();
  	}    
    
    /**
     * 트리펼치기
     */
    var fn_treeOpen3 = function() {
    	Fig5253Grid6.openTreeNodeAll();
  	}    

    /**
     * 트리접기
     */
    var fn_treeClose3 = function() {
    	Fig5253Grid6.closeTreeNodeAll();
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
        	,'YMDPERIOD_FR' 		: SBUxMethod.get('SCH_YMDPERIOD_CODE_FR')
        	,'YMDPERIOD_TO' 		: SBUxMethod.get('SCH_YMDPERIOD_CODE_FR')
        	,'ACCOUNT_GROUP' 		: SBUxMethod.get('SCH_ACCOUNT_LEVEL')
        	,'ACCOUNT_CODE' 		: account_code_view
        	,'ACCOUNT_NAME' 		: account_name
        	,'target'				: 'MA_A20_030_030_210'
        }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);
	}  
    
    const fn_btnPrint = async function(type){
    	var conn = '';
    	if (type == "1") {
            conn = await fn_GetReportData('REPORT1');
            conn = await gfnma_convertDataForReport(conn);
    		gfn_popClipReportPost("손익계산서", "ma/RPT_FIG5253_PL1.crf", null, conn );	
        } else if(type == "2") {
            conn = await fn_GetReportData('REPORT2');
            conn = await gfnma_convertDataForReport(conn);
    		gfn_popClipReportPost("손익계산서", "ma/RPT_FIG5253_PL2.crf", null, conn );
        }
    }
	//손익계산서 리포트 출력 데이터
    const fn_GetReportData = async function(workType) {
		let ACCT_RULE_CODE		= gfn_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let FI_ORG_CODE			= gfn_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let SITE_CODE			= gfn_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let YMDPERIOD_CODE_FR	= gfn_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_FR"));
		let YMDPERIOD_CODE_TO	= gfn_nvl(SBUxMethod.get("SCH_YMDPERIOD_CODE_TO"));
		let CBODESCR1			= gfn_nvl(SBUxMethod.get("SCH_CBODESCR1"));
		let YMDSELECT_PERIOD1	= gfn_nvl(SBUxMethod.get("SCH_YMDSELECT_PERIOD1"));
		let ZERO_INCLUDE_YN		= gfn_nvl(SBUxMethod.get("SCH_CHKZERO_INCLUDE_YN")['SCH_CHKZERO_INCLUDE_YN']);
		let ACCOUNT_GROUP	 	= gfn_nvl(SBUxMethod.get("SCH_ACCOUNT_LEVEL"));
		if(!FI_ORG_CODE){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		if(!ACCT_RULE_CODE){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		if(!YMDPERIOD_CODE_FR){
 			gfn_comAlert("E0000","기준년월을 선택하세요");
			return;      		 
		}
	    var paramObj = {
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			,V_P_ACCT_RULE_CODE		: ACCT_RULE_CODE
			,V_P_FI_ORG_CODE		: FI_ORG_CODE
			,V_P_SITE_CODE			: SITE_CODE
			,V_P_PERIOD_CODE_FR		: YMDPERIOD_CODE_FR
			,V_P_PERIOD_CODE_TO		: YMDPERIOD_CODE_TO
			,V_P_ACCOUNT_GROUP		: ACCOUNT_GROUP
			,V_P_DESCR				: CBODESCR1
			,V_P_SELECT_PERIOD		: YMDSELECT_PERIOD1
			,V_P_ZERO_INCLUDE_YN	: ZERO_INCLUDE_YN
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
        const postJsonPromise = gfn_postJSON("/fi/fgl/sta/selectFig5253Report.do", {
        	getType				: 'json',
        	workType			: workType,
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
            	if(workType == 'REPORT1'){
	            	if(data.cv_2.length > 0){
	            		data.cv_2[0].PREV_PERIOD_DESCR = data.cv_1[0].PREV_PERIOD_DESCR;
	            	}
            	}else if(workType == 'REPORT2'){
	            	if(data.cv_4.length > 0){
	            		data.cv_4[0].PREV_PERIOD_DESCR = data.cv_3[0].PREV_PERIOD_DESCR;
	            	}
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
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>