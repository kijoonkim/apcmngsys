<%
/**
 * @Class Name 		: fig4140.jsp
 * @Description 	: 계정별원장 신규 화면
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
	<title>title : 계정별원장 신규</title>
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
                    </h3><!-- 계정별원장 신규 -->
                </div>
                <div style="margin-left: auto;">
					<sbux-button class="btn btn-sm btn-outline-danger" text="엑셀다운" 	onclick="fn_excelDown()"></sbux-button>
					<sbux-button class="btn btn-sm btn-outline-danger" text="출력" 		onclick="fn_print()"></sbux-button>
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
	                    </colgroup>
	                    <tbody>
	                    
                           	<!-- hidden  -->
                       		<!-- /hidden -->
                       		
	                    	<tr>
	                            <th scope="row" class="th_bg">회계단위</th>
	                            <td colspan="11" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			                            <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" style="width:150px" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                    <font style="margin-right:15px"></font>
											<sbux-button id="" class="btn btn-xs btn-outline-dark" text="1일" 	onclick="fn_dateDay1()"></sbux-button>
	                    					<font style="margin-right:3px"></font>
											<sbux-button id="" class="btn btn-xs btn-outline-dark" text="1주" 	onclick="fn_dateWeek1()"></sbux-button>
                    					<font style="margin-right:15px"></font>
											<sbux-button id="" class="btn btn-xs btn-outline-dark" text="1개월" onclick="fn_dateMonth1()"></sbux-button>
	                    					<font style="margin-right:3px"></font>
											<sbux-button id="" class="btn btn-xs btn-outline-dark" text="3개월" onclick="fn_dateMonth3()"></sbux-button>
	                    					<font style="margin-right:3px"></font>
											<sbux-button id="" class="btn btn-xs btn-outline-dark" text="6개월" onclick="fn_dateMonth6()"></sbux-button>
                    					<font style="margin-right:15px"></font>
											<sbux-button id="" class="btn btn-xs btn-outline-dark" text="1년" 	onclick="fn_dateYear1()"></sbux-button>
	                    					<font style="margin-right:3px"></font>
											<sbux-button id="" class="btn btn-xs btn-outline-dark" text="전체" 	onclick="fn_dateAll()"></sbux-button>
	                            	</div>
	                            </td>
	                    	</tr>
	                    	
	                    	<tr>
	                            <th scope="row" class="th_bg">년월</th>
	                            <td colspan="3" class="td_input" >
									<sbux-datepicker
									        id="SCH_YMDPERIOD_YYYYMM_P"
									        name="SCH_YMDPERIOD_YYYYMM_P"
									        uitype="popup"
									        datepicker-mode="month"
									        date-format="yyyy-mm"
									        style="width:80px"
									        class="form-control input-sm input-sm-ast inpt_data_reqed"
									        onchange = "fn_payDate"
									        required>
									</sbux-datepicker>                            
	                            </td>
	                            
	                            <th scope="row" class="th_bg">사업장</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">회계기준</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                    	</tr>
	                    	
	                    	<tr>
	                            <th scope="row" class="th_bg">회계일자</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left">
									    <sbux-datepicker
									            id="SCH_ENTRY_DATE_FR"
									            name="SCH_ENTRY_DATE_FR"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>                          
									    <font style="padding-left:5px;padding-right:5px">-</font>  
									    <sbux-datepicker
									            id="SCH_ENTRY_DATE_TO"
									            name="SCH_ENTRY_DATE_TO"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>                            
	                            	</div>
	                            </td>	                    	
	                    	
	                            <th scope="row" class="th_bg">합계표시</th>
	                            <td colspan="7" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			                            <sbux-select id="SCH_SUMMARY_TYPE" uitype="single" jsondata-ref="jsonSummaryType" style="width:150px" unselected-text="선택" class="form-control input-sm"></sbux-select>
	   									<font style="width:5px"></font>
		                       			<sbux-checkbox 
		                       				id="SCH_CARRIED_OVER" 
		                       				uitype="normal" 
		                       				text="이월표시여부" 
		                       				true-value="Y" 
		                       				false-value="N" ></sbux-checkbox>
	   									<font style="width:5px"></font>
	                            	</div>
	                            </td>
	                            
	                    	</tr>
	                    	<tr>
	                            <th scope="row" class="th_bg">계정수준</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_ACCOUNT_GROUP" uitype="single" jsondata-ref="jsonAccountGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                    	
	                            <th scope="row" class="th_bg">계정과목</th>
	                            <td colspan="7" class="td_input" >
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
								                            
	                    </tbody>
	                </table>				
				</div>
                
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>계정별원장</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
                        </li>
                    </ul>
                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
					</div>
                </div>
				
				<div class="card" style="height:480px;border:1px solid #f4f4f4;overflow:auto;">
					<table id="MAIN_TABLE" style="min-width:4570px" class="table table-bordered table-hover">
				        <colgroup>
	                        <col width="30px">
	                        <col width="100px">
	                        <col width="150px">
	                        <col width="100px">
	                        <col width="250px">
	                        <col width="120px">
	                        <col width="350px">
	                        <col width="150px">
	                        <col width="250px">
	                        <col width="150px">
	                        <col width="150px">
	                                  
	                        <col width="150px">
	                        <col width="150px">
	                        <col width="150px">
	                        <col width="150px">
	                        <col width="150px">
	                                  
	                        <col width="120px">
	                        <col width="120px">
	                        <col width="120px">
	                        <col width="120px">
	                        <col width="120px">
	                        <col width="120px">
	                                  
	                        <col width="150px">
	                        <col width="150px">
	                        <col width="150px">
	                        <col width="150px">
	                        <col width="150px">
	                                  
	                        <col width="100px">
	                        <col width="100px">
	                        <col width="150px">
	                        <col width="100px">
	                        <col width="100px">
				        </colgroup>
						<thead class="thead-light" style="text-align:left;background-color:#f5fbff;position:sticky;top:0;z-index:3">
							<tr>
								<th style="text-align:left;"></th>
								<th style="text-align:left;">기간</th>
								<th style="text-align:left;">사업단위</th>
								<th style="text-align:left;">계정과목</th>
								<th style="text-align:left;">계정과목명</th>
								<th style="text-align:left;">일자</th>
								<th style="text-align:left;">적요</th>
								<th style="text-align:left;">코드</th>
								<th style="text-align:left;">거래처명</th>
								<th style="text-align:left;">사업자번호</th>
								<th style="text-align:left;">전표번호</th>
								
								<th style="text-align:right;">차변(전표)</th>
								<th style="text-align:right;">대변(전표)</th>
								<th style="text-align:right;">순금액(전표)</th>
								<th style="text-align:right;">잔액(전표)</th>
								<th style="text-align:right;">잔액(전표2)</th>
								
								<th style="text-align:left;">전표유형</th>
								<th style="text-align:left;">송장참조번호</th>
								<th style="text-align:left;">지급전표번호</th>
								<th style="text-align:left;">지급일자</th>
								<th style="text-align:left;">반제전표번호</th>
								<th style="text-align:left;">반제일</th>
								
								<th style="text-align:right;">차변(통화)</th>
								<th style="text-align:right;">대변(통화)</th>
								<th style="text-align:right;">순금액(통화)</th>
								<th style="text-align:right;">잔액(통화)</th>
								<th style="text-align:right;">잔액(통화2)</th>
								
								<th style="text-align:left;">통화</th>
								<th style="text-align:left;">회계기준</th>
								<th style="text-align:left;">여신관리영역</th>
								<th style="text-align:left;">환율</th>
								<th style="text-align:left;">사업장</th>
							</tr>
						</thead>
						<tbody style="vertical-align:middle;">
						</tbody>
				    </table>
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
	var Fig4140Grid; 				// 그리드를 담기위한 객체 선언
	var jsonFig4140 		= []; 	// 그리드의 참조 데이터 주소 선언

	var jsonTempList 		= [];	// 저장할 임시 저장소

	var jsonFiOrgCode 		= []; 	// 사업단위
	var jsonSiteCode 		= []; 	// 사업장
	var jsonAcctRuleCode 	= []; 	// 회계기준
	var jsonSummaryType 	= []; 	// 합계표시
	var jsonAccountGroup 	= []; 	// 계정수준
	
    var p_sel_row 				= '';
    var p_sel_col 				= '';
    
    var p_strAccountCodeList	= '';	//복수선택
	
    var p_menu_param			= null;
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],			jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE'], 			jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE'],		jsonAcctRuleCode, 	'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 합계표시
            gfnma_setComSelect(['SCH_SUMMARY_TYPE'],		jsonSummaryType, 	'L_COM036', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 계정수준
            gfnma_setComSelect(['SCH_ACCOUNT_GROUP'],		jsonAccountGroup, 	'L_FIG011_Y', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),            
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state();
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

    /**
     * 화면 state 변경
     */
    function fn_state() {
    	
    	//년월
		SBUxMethod.set('SCH_YMDPERIOD_YYYYMM_P', gfnma_date().substr(0,4) + '-' + gfnma_date().substr(4,2));
        var yyyymm	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_YYYYMM_P"));
        var sdate	= yyyymm.substr(0,4) + '-' + yyyymm.substr(4,2) + '-01';
        var edate	= gfnma_date3(yyyymm.substr(0,4), yyyymm.substr(4,2));
        
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		sdate);
		SBUxMethod.set('SCH_ENTRY_DATE_TO', 		edate);

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
		fn_setFig4140Grid('Q');
	}
    
    /**
     * 목록 가져오기
     */
    const fn_setFig4140Grid = async function(wtype) {
    	
		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_acct_rule_code		= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_entry_date_fr			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_FR"));
		let p_entry_date_to			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_TO"));
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
		
		let p_summary_type			= gfnma_nvl(SBUxMethod.get("SCH_SUMMARY_TYPE"));
		let p_carried_over			= gfnma_nvl(SBUxMethod.get("SCH_CARRIED_OVER")['SCH_CARRIED_OVER']);
		let p_site_code				= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		
		if(!p_entry_date_fr ||  !p_entry_date_to){
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
			,V_P_ENTRY_DATE_FR    	: p_entry_date_fr
			,V_P_ENTRY_DATE_TO    	: p_entry_date_to
			,V_P_ACCOUNT_GROUP    	: p_account_group
			,V_P_ACCOUNT_CODE_FR    : p_account_code_fr
			,V_P_ACCOUNT_CODE_TO    : p_account_code_to
			,V_P_ACCOUNT_CODE_D		: p_account_code_d
			,IV_P_END_BALANCE_YN   	: p_summary_type
			,V_P_CARRIED_OVER_YN    : p_carried_over
			,V_P_SITE_CODE     		: p_site_code
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/leg/selectFig4140List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFig4140.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
						ACCOUNT_CODE				: gfnma_nvl(item.ACCOUNT_CODE),			
						ACCOUNT_NAME				: gfnma_nvl(item.ACCOUNT_NAME),			
						
						ACCT_NAME					: gfnma_nvl(item.ACCT_NAME),			
						ACCT_RULE_CODE				: gfnma_nvl(item.ACCT_RULE_CODE),			
						ACCT_RULE_NAME				: gfnma_nvl(item.ACCT_RULE_NAME),			
						
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
						DOC_STATUS_NAME				: gfnma_nvl(item.DOC_STATUS_NAME),
						DOC_TYPE					: gfnma_nvl(item.DOC_TYPE),
						DOC_TYPE_NAME				: gfnma_nvl(item.DOC_TYPE_NAME),

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
						SITE_NAME					: gfnma_nvl(item.SITE_NAME),
						
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
  					jsonFig4140.push(msg);
  					totalRecordCount ++;
  				});
				
  	        	fn_drawTable(jsonFig4140);
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
     * 테이블 그리기 
     */
    function fn_drawTable(list) {
    	
    	var rlist = [];
    	
    	//계정과목 타이틀 추출
    	var tlist = [];
    	var acode = null;
    	for (var i = 0; i < list.length; i++) {
			var obj = list[i];
			if(obj['ACCOUNT_CODE']!=acode){
				tlist.push(obj['ACCOUNT_CODE'] + '|' + obj['ACCOUNT_CODE'] + '-' + obj['ACCOUNT_NAME']);
				acode = obj['ACCOUNT_CODE'];
			}
		}
    	console.log('tlist', tlist);
    	
    	//계정코드별 분류작업
    	for (var i = 0; i < tlist.length; i++) {
    		var tmp = tlist[i].split('|');
    		rlist.push({
    			'TITLE'			: '1'
    			,'PERIOD_CODE'	: '계정코드'
    			,'FI_ORG_CODE'	: tmp[1]
    			,'KEY'			: tmp[0]
    			,'PKEY'			: ''
    		});
	    	for (var j = 0; j < list.length; j++) {
	    		var dobj = list[j];
	    		if(dobj['ACCOUNT_CODE']==tmp[0]){
	    			dobj['TITLE'] 	= '';
	    			dobj['KEY']		= '';
	    			dobj['PKEY']	= dobj['ACCOUNT_CODE'];
	    			rlist.push(dobj);
	    		}
	    	}
    	}
    	console.log('rlist', rlist);
    	
    	//테이블 그리기
    	var htm = '';
    	for (var i = 0; i < rlist.length; i++) {
			var obj = rlist[i];
			
			htm += '<tr '; 
			htm += 'key="' + gfnma_nvl(obj['KEY']) + '" '; 
			htm += 'pkey="' + gfnma_nvl(obj['PKEY']) + '" '; 
			if(obj['ROW_TYPE']=='C' || obj['ROW_TYPE']=='D' ){
				htm += ' style="background-color:#c7e5fa" ';				
			}
			htm += ' >';
			
			if(gfnma_nvl(obj['TITLE'])=='1'){
				htm += '<td>'; 
				htm += "<img class='cu-trow-right' 	style='cursor:pointer;' src='../../../resource/images/td_plus.png' width='14px' />";
				htm += "<img class='cu-trow-down' 	style='cursor:pointer;display:none'  src='../../../resource/images/td_minus.png' width='14px' />";
				htm += '</td>';
				htm += '<td colspan="4">'; 
				htm += '<font style="font-weight:bold">' + gfnma_nvl(obj['PERIOD_CODE']) + ': ' + gfnma_nvl(obj['FI_ORG_CODE']) + '</font>';
				htm += '</td>';
			} else {
				htm += '<td></td>';
				htm += '<td>' + gfnma_nvl(obj['PERIOD_CODE']) + '</td>';
				htm += '<td>' + gfnma_nvl(obj['FI_ORG_NAME']) + '</td>';
				htm += '<td>' + gfnma_nvl(obj['ACCOUNT_CODE']) + '</td>';
				htm += '<td>' + gfnma_nvl(obj['ACCOUNT_NAME']) + '</td>';
			}
			
			htm += '<td>' + gfnma_nvl(obj['DOC_DATE']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['DESCRIPTION']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['CS_CODE']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['CS_NAME']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['BIZ_REGNO']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['DOC_NAME']) + '</td>';
			
			htm += '<td style="text-align:right;">' + gfnma_getThreeComma(gfnma_nvl(obj['FUNCTIONAL_DR_AMT'])) + '</td>';
			htm += '<td style="text-align:right;">' + gfnma_getThreeComma(gfnma_nvl(obj['FUNCTIONAL_CR_AMT'])) + '</td>';
			htm += '<td style="text-align:right;">' + gfnma_getThreeComma(gfnma_nvl(obj['FUNCTIONAL_AMT'])) + '</td>';
			htm += '<td style="text-align:right;">' + gfnma_getThreeComma(gfnma_nvl(obj['FUNCTIONAL_BALANCE_AMT'])) + '</td>';
			htm += '<td style="text-align:right;">' + gfnma_getThreeComma(gfnma_nvl(obj['FUNCTIONAL_BALANCE_AMT2'])) + '</td>';
			
			htm += '<td>' + gfnma_nvl(obj['DOC_TYPE']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['SOURCE_JUNPYO_NO']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['PAY_DOC_NAME']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['PAY_DOC_DATE']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['APPLY_DOC_NAME']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['APPLY_DOC_DATE']) + '</td>';

			htm += '<td style="text-align:right;">' + gfnma_getThreeComma(gfnma_nvl(obj['ORIGINAL_DR_AMT'])) + '</td>';
			htm += '<td style="text-align:right;">' + gfnma_getThreeComma(gfnma_nvl(obj['ORIGINAL_CR_AMT'])) + '</td>';
			htm += '<td style="text-align:right;">' + gfnma_getThreeComma(gfnma_nvl(obj['ORIGINAL_AMT'])) + '</td>';
			htm += '<td style="text-align:right;">' + gfnma_getThreeComma(gfnma_nvl(obj['ORIGINAL_BALANCE_AMT'])) + '</td>';
			htm += '<td style="text-align:right;">' + gfnma_getThreeComma(gfnma_nvl(obj['ORIGINAL_BALANCE_AMT2'])) + '</td>';
			
			htm += '<td>' + gfnma_nvl(obj['CURRENCY_CODE']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['ACCT_RULE_NAME']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['CREDIT_AREA']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['EXCHANGE_RATE']) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['SITE_NAME']) + '</td>';
			
			htm += '</tr>';
		}
    	$('#MAIN_TABLE').find('tbody').html(htm);
    	$('#MAIN_TABLE').find('tbody').find('tr').each(function(){
    		
    	});
    	
    	//event
    	$('#MAIN_TABLE').find('tbody').find('.cu-trow-right').click(function(e){
    		e.preventDefault();
			$(this).hide();
			$(this).closest('td').find('.cu-trow-down').show();
			var key = $(this).closest('tr').attr('key');
			console.log('key:', key);			
			$('#MAIN_TABLE').find('tbody').find('[pkey=' + key + ']').hide();
    	})
    	$('#MAIN_TABLE').find('tbody').find('.cu-trow-down').click(function(e){
    		e.preventDefault();
			$(this).hide();
			$(this).closest('td').find('.cu-trow-right').show();
			var key = $(this).closest('tr').attr('key');
			console.log('key:', key);			
			$('#MAIN_TABLE').find('tbody').find('[pkey=' + key + ']').show();
    	})
    	
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
   			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
  	}       
    
    /**
     * 엑셀다운
     */
    var fn_excelDown = function() {
    	
    	var list = $('#MAIN_TABLE').find('tbody').find('tr').length;
    	if(list==0){
 			gfn_comAlert("E0000","다운로드하실 데이터가 없습니다.");
			return;      		 
    	}
    	
    	gfnma_htmlExcelDown({
    		fileName	: '계정별원장'
    		,sheetName	: 'sheet1'
    		,heads		: [
    			 {column: "A1",		text: "",				width:"5",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "B1",		text: "기간",			width:"10",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "C1",		text: "사업단위",		width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "D1",		text: "계정과목",		width:"10",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "E1",		text: "계정과목명",		width:"25",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "F1",		text: "일자",			width:"12",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "G1",		text: "적요",			width:"35",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "H1",		text: "코드",			width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "I1",		text: "거래처명",		width:"25",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "J1",		text: "사업자번호",		width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "K1",		text: "전표번호",		width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			
    			,{column: "L1",		text: "차변(전표)",		width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "M1",		text: "대변(전표)",		width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "N1",		text: "순금액(전표)",	width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "O1",		text: "잔액(전표)",		width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "P1",		text: "잔액(전표2)",	width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			
    			,{column: "Q1",		text: "전표유형",		width:"12",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "R1",		text: "송장참조번호",	width:"12",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "S1",		text: "지급전표번호",	width:"12",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "T1",		text: "지급일자",		width:"12",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "U1",		text: "반제전표번호",	width:"12",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "V1",		text: "반제일",			width:"12",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			
    			,{column: "W1",		text: "차변(통화)",		width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "X1",		text: "대변(통화)",		width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "Y1",		text: "순금액(통화)",	width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "Z1",		text: "잔액(통화)",		width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "AA1",	text: "잔액(통화2)",	width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			
    			,{column: "AB1",		text: "통화",			width:"10",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "AC1",		text: "회계기준",		width:"10",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "AD1",		text: "여신관리영역",	width:"15",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "AE1",		text: "환율",			width:"10",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    			,{column: "AF1",		text: "사업장",			width:"10",		bgColor:"D9D9D9",	style:{alignment:{vertical:'middle', horizontal:'center'}} }
    		]
    		,headFixed		: {state: 'frozen', xSplit:4, ySplit:1}
    		,dataStartColumn: 'A2'
    		,data			: gfnma_getRowTable('#MAIN_TABLE')
    	});
  	}       
    
        
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>