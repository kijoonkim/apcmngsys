<%
/**
 * @Class Name 		: fig4160.jsp
 * @Description 	: 총계정원장조회 신규 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.09.26
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.09.26   	장성주		최초 생성
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
	<title>title : 총계정원장조회 신규</title>
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
                    </h3><!-- 총계정원장조회 신규 -->
                </div>
                <div style="margin-left: auto;">
           			<sbux-checkbox 
           				id="SCH_CAL_FLAG" 
           				uitype="normal" 
           				text="3개월이상 집계" 
           				style="padding-right:10px !important"
           				true-value="Y" 
           				false-value="N" >
           			</sbux-checkbox>
					<sbux-button class="btn btn-sm btn-outline-danger" text="집계작업" 	onclick="fn_btnCal()"></sbux-button>
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
	                            <th scope="row" class="th_bg">사업단위</th>
	                            <td colspan="15" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			                            <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" style="width:150px" unselected-text="선택" class="form-control input-sm"></sbux-select>
					                    <font style="margin-right:15px"></font>
											<sbux-button id="btnDay1" class="btn btn-xs btn-outline-dark" text="1일" 	onclick="fn_dateDay1()"></sbux-button>
	                    					<font style="margin-right:3px"></font>
											<sbux-button id="btnDateWeek1" class="btn btn-xs btn-outline-dark" text="1주" 	onclick="fn_dateWeek1()"></sbux-button>
                    					<font style="margin-right:15px"></font>
											<sbux-button id="btnDateMonth1" class="btn btn-xs btn-outline-dark" text="1개월" onclick="fn_dateMonth1()"></sbux-button>
	                    					<font style="margin-right:3px"></font>
											<sbux-button id="btnDateMonth3" class="btn btn-xs btn-outline-dark" text="3개월" onclick="fn_dateMonth3()"></sbux-button>
	                    					<font style="margin-right:3px"></font>
											<sbux-button id="btnDateMonth6" class="btn btn-xs btn-outline-dark" text="6개월" onclick="fn_dateMonth6()"></sbux-button>
                    					<font style="margin-right:15px"></font>
											<sbux-button id="btnDateYear1" class="btn btn-xs btn-outline-dark" text="1년" 	onclick="fn_dateYear1()"></sbux-button>
	                    					<font style="margin-right:3px"></font>
											<sbux-button id="btnDateAll" class="btn btn-xs btn-outline-dark" text="전체" 	onclick="fn_dateAll()"></sbux-button>
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
	                            
	                            <th scope="row" class="th_bg">소속사업장</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">전표구분</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_DOC_TYPE" uitype="single" jsondata-ref="jsonDocType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">전표상태</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_DOC_STATUS" uitype="single" jsondata-ref="jsonDocStatus" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
	                    	
	                            <th scope="row" class="th_bg">특수관계자유형</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_RELATED_CS_TYPE" uitype="single" jsondata-ref="jsonRelatedCsType" style="width:250px" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                    	
	                            <th scope="row" class="th_bg">특수관계자여부</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_YES_NO" uitype="single" jsondata-ref="jsonYesNo" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">합계표시여부</th>
	                            <td colspan="3" class="td_input" >
	                       			<sbux-checkbox 
	                       				id="SCH_SUM_YN" 
	                       				uitype="normal" 
	                       				text="" 
	                       				true-value="Y" 
	                       				false-value="N" >
	                       			</sbux-checkbox>
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
								                            
	                    </tbody>
	                </table>				
				</div>
                
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>총계정원장조회</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
                        </li>
                    </ul>
                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
					</div>
                </div>
				
                <div>
                    <div id="SB_AREA_GRDTOP" style="height:480px; width:100%;">
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
	var p_ss_deptCode			= '${loginVO.maDeptCode}';
	var p_ss_deptName			= '${loginVO.maDeptName}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	
	//grid 초기화
	var Fig4160Grid; 				// 그리드를 담기위한 객체 선언
	var jsonFig4160 		= []; 	// 그리드의 참조 데이터 주소 선언

	var jsonFiOrgCode 		= []; 	// 사업단위
	var jsonSiteCode 		= []; 	// 사업장
	var jsonDocType 		= []; 	// 전표구분
	var jsonDocStatus 		= []; 	// 전표상태
	var jsonRelatedCsType	= []; 	// 특수관계자유형
	var jsonYesNo			= []; 	// 특수관계자여부
	
    var p_strAccountCodeList	= '';	//복수선택
	
    var p_menu_param			= null;
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],			jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE'], 			jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 전표구분
            gfnma_setComSelect(['SCH_DOC_TYPE'], 			jsonDocType, 		'L_FIM051', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표상태
            gfnma_setComSelect(['SCH_DOC_STATUS'], 			jsonDocStatus, 		'L_FIG002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 특수관계자유형
            gfnma_setComSelect(['SCH_RELATED_CS_TYPE'], 	jsonRelatedCsType, 	'L_COM047', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 특수관계자여부
            gfnma_setComSelect(['SCH_YES_NO'], 				jsonYesNo, 			'L_COM036', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state();
  		fn_createFig4160Grid();
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
    	
		SBUxMethod.set('SCH_CAL_FLAG', 		'N');
		SBUxMethod.set('SCH_SUM_YN', 		'N');
    	
    	SBUxMethod.set("SCH_FI_ORG_CODE", 		p_ss_fiOrgCode);
    	
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
		fn_setFig4160Grid('Q');
	}
    
    function fn_createFig4160Grid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_AREA_GRDTOP';
	    SBGridProperties.id 				= 'Fig4160Grid';
	    SBGridProperties.jsonref 			= 'jsonFig4160';
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
                    sum : [15,16,17,18,19,20]
                },
                grandtotalrow : {
                    titlecol 		: 14,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["전표상태"],					ref: 'DOC_STATUS_NAME',			type:'output', 		width:'100px', 		style:'text-align:left'},
            {caption: ["회계일자"],					ref: 'DOC_DATE', 				type:'output', 		width:'100px', 		style:'text-align:left'},
            {caption: ["유형"],						ref: 'DOC_TYPE_NAME', 			type:'output', 		width:'150px', 		style:'text-align:left'},
            
            //{caption: ["전표번호"],					ref: 'DOC_NAME', 				type:'output', 		width:'100px', 		style:'text-align:left'},
            {caption: ['전표번호'], 				ref: 'link',    				type:'button',  	width:'100px', 		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['DOC_ID']){
		        		return "<a style='text-decoration: underline;cursor:pointer;color:#149fff' href='#' onClick='fn_gridPopup1(event, " + objRowData['DOC_ID'] + ")'>" + objRowData['DOC_NAME'] + "</a>";
            		} else {
            			return "";
            		}
            	}	
            },
            
            {caption: ["통화"],						ref: 'CURRENCY_CODE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["행유형"],					ref: 'LINE_TYPE_NAME',			type:'output',  	width:'60px',  		style:'text-align:left'},
            {caption: ["차대"],						ref: 'DEBIT_CREDIT_NAME',		type:'output',  	width:'60px',  		style:'text-align:left'},
            {caption: ["미결"],						ref: 'ACC_CHARACTER',			type:'output',  	width:'60px',  		style:'text-align:left'},
            
            {caption: ["계정코드(과)"], 			ref: 'ACCOUNT_CODE_A', 			type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["계정명(과)"], 				ref: 'ACCOUNT_NAME_A', 			type:'output',		width:'200px',  	style:'text-align:left'},
            
            {caption: ["계정코드(항)"], 			ref: 'ACCOUNT_CODE_B', 			type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["계정명(항)"], 				ref: 'ACCOUNT_NAME_B', 			type:'output',		width:'200px',  	style:'text-align:left'},
            
            {caption: ["계정코드"], 				ref: 'ACCOUNT_CODE', 			type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["계정명"], 					ref: 'ACCOUNT_NAME', 			type:'output',		width:'200px',  	style:'text-align:left'},
            
            {caption: ["차변(전표)"], 	   			ref: 'FUNCTIONAL_DR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대변(전표)"], 	   			ref: 'FUNCTIONAL_CR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["순액(전표)"],	   			ref: 'FUNCTIONAL_NET_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["차변(통화)"], 	   			ref: 'ORIGINAL_DR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대변(통화)"], 	   			ref: 'ORIGINAL_CR_AMT',			type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["순액(통화)"], 	   			ref: 'ORIGINAL_NET_AMT',		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["거래처코드"],				ref: 'CS_CODE', 				type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["라인순번"],					ref: 'ITEM_SEQ', 				type:'output',  	width:'80', 		style:'text-align:left'},
            {caption: ["거래처명"], 				ref: 'CS_NAME', 				type:'output',		width:'200px',  	style:'text-align:left'},
            {caption: ["적요"],						ref: 'DESCRIPTION', 			type:'output',  	width:'300px', 		style:'text-align:left'},
            
            {caption: ["송장참조번호"], 			ref: 'SOURCE_DOC_NAME', 		type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["작성자"], 					ref: 'INSERT_USERNAME', 		type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["원가중심점코드"], 			ref: 'COST_CENTER_CODE1',		type:'output',  	width:'150px', 		style:'text-align:left'},
            {caption: ["원가중심점명"], 			ref: 'COST_CENTER_NAME',		type:'output',  	width:'150px', 		style:'text-align:left'},
            
            {caption: ["부서"], 					ref: 'DEPT_NAME', 				type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["프로젝트명"], 				ref: 'PROJECT_NAME', 			type:'output',		width:'250px',  	style:'text-align:left'},
            
            {caption: ["회계기준"], 				ref: 'ACCT_RULE_NAME',			type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["반제전표번호"], 			ref: 'APPLY_DOC_NAME',			type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["반제일"],	 				ref: 'APPLY_DOC_DATE',			type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["역분개전표"], 				ref: 'EVERSE_DOC_NAME', 		type:'output',  	width:'100px', 		style:'text-align:left'},

            {caption: ["회계승인일"], 				ref: 'POSTING_DATE', 			type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["회계승인자"],  				ref: 'POSTING_USER',			type:'output',  	width:'100px',  	style:'text-align:left'},

        ];

        Fig4160Grid = _SBGrid.create(SBGridProperties);
//        Fig4160Grid.bind('click', 'fn_viewFig4160GridEvent');
    }        
    
    /**
     * 목록 가져오기
     */
    const fn_setFig4160Grid = async function(wtype) {
    	
		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		
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

		let p_entry_date_fr			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_FR"));
		let p_entry_date_to			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_TO"));
		let p_doc_type				= gfnma_nvl(SBUxMethod.get("SCH_DOC_TYPE"));
		let p_doc_status			= gfnma_nvl(SBUxMethod.get("SCH_DOC_STATUS"));
		let p_yes_no				= gfnma_nvl(SBUxMethod.get("SCH_YES_NO"));
		let p_related_cd_type		= gfnma_nvl(SBUxMethod.get("SCH_RELATED_CS_TYPE"));
		let p_site_code				= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_cal_flag				= gfnma_nvl(SBUxMethod.get("SCH_CAL_FLAG")['SCH_CAL_FLAG']);

		if(!p_entry_date_fr ||  !p_entry_date_to){
 			gfn_comAlert("E0000","회계일자를 선택하세요");
			return;      		 
		}
		
		if(!gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_FR")) &&  !gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_TO"))){
 			gfn_comAlert("E0000","계정과목을 선택하세요");
			return;      		 
		}
		
		let p_sum_yn				= gfnma_nvl(SBUxMethod.get("SCH_SUM_YN")['SCH_SUM_YN']);
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_fi_org_code
			,V_P_ACCOUNT_CODE_FR    : p_account_code_fr
			,V_P_ACCOUNT_CODE_TO    : p_account_code_to
			,V_P_DOC_DATE_FR    	: p_entry_date_fr
			,V_P_DOC_DATE_TO    	: p_entry_date_to
			,V_P_DOC_TYPE    		: p_doc_type
			,V_P_DOC_STATUS    		: p_doc_status
			,V_P_RELATED_CS_YN 		: p_yes_no
			,V_P_RELATED_CS_TYPE	: p_related_cd_type
			,V_P_ACCOUNT_CODE_D		: p_strAccountCodeList
			,V_P_SITE_CODE     		: p_site_code
			,V_P_CAL_FLAG     		: p_cal_flag
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/leg/selectFig4160List.do", {
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

  	        	var list = [];
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
						ACCOUNT_CODE				: gfnma_nvl(item.ACCOUNT_CODE),			
						ACCOUNT_CODE_A				: gfnma_nvl(item.ACCOUNT_CODE_A),		
						ACCOUNT_CODE_B				: gfnma_nvl(item.ACCOUNT_CODE_B),		
						ACCOUNT_NAME				: gfnma_nvl(item.ACCOUNT_NAME),			
						ACCOUNT_NAME_A				: gfnma_nvl(item.ACCOUNT_NAME_A),			
						ACCOUNT_NAME_B				: gfnma_nvl(item.ACCOUNT_NAME_B),			
						
						ACCT_RULE_CODE				: gfnma_nvl(item.ACCT_RULE_CODE),			
						ACCT_RULE_NAME				: gfnma_nvl(item.ACCT_RULE_NAME),			
						ACC_CHARACTER				: gfnma_nvl(item.ACC_CHARACTER),			
						
						APPLY_DOC_DATE				: gfnma_date5(gfnma_nvl(item.APPLY_DOC_DATE)),		
						APPLY_DOC_ID				: gfnma_nvl(item.APPLY_DOC_ID),		
						APPLY_DOC_NAME				: gfnma_nvl(item.APPLY_DOC_NAME),	
						COST_CENTER_CODE			: gfnma_nvl(item.COST_CENTER_CODE),	
						COST_CENTER_CODE1			: gfnma_nvl(item.COST_CENTER_CODE1),	
						COST_CENTER_NAME			: gfnma_nvl(item.COST_CENTER_NAME),	
						
						CS_CODE						: gfnma_nvl(item.CS_CODE),
						CS_NAME						: gfnma_nvl(item.CS_NAME),
						CURRENCY_CODE				: gfnma_nvl(item.CURRENCY_CODE),
						
						DEBIT_CREDIT				: gfnma_nvl(item.DEBIT_CREDIT),
						DEBIT_CREDIT_NAME			: gfnma_nvl(item.DEBIT_CREDIT_NAME),
						DEPT_NAME					: gfnma_nvl(item.DEPT_NAME),
						DESCRIPTION					: gfnma_nvl(item.DESCRIPTION),
						DOC_DATE					: gfnma_date5(gfnma_nvl(item.DOC_DATE)),
						DOC_ID						: gfnma_nvl(item.DOC_ID),
						DOC_NAME					: gfnma_nvl(item.DOC_NAME),
						DOC_NUM						: gfnma_nvl(item.DOC_NUM),
						
						DOC_STATUS					: gfnma_nvl(item.DOC_STATUS),
						DOC_STATUS_NAME				: gfnma_nvl(item.DOC_STATUS_NAME),
						DOC_TYPE					: gfnma_nvl(item.DOC_TYPE),
						DOC_TYPE_NAME				: gfnma_nvl(item.DOC_TYPE_NAME),
						
						FUNCTIONAL_CR_AMT			: gfnma_nvl(item.FUNCTIONAL_CR_AMT),		
						FUNCTIONAL_DR_AMT			: gfnma_nvl(item.FUNCTIONAL_DR_AMT),		
						FUNCTIONAL_NET_AMT			: gfnma_nvl(item.FUNCTIONAL_NET_AMT),		
						GUBUN						: gfnma_nvl(item.GUBUN),		
						INSERT_USERNAME				: gfnma_nvl(item.INSERT_USERNAME),		
						
						ITEM_ID						: gfnma_nvl(item.ITEM_ID),
						ITEM_SEQ					: gfnma_nvl(item.ITEM_SEQ),
						LINE_TYPE					: gfnma_nvl(item.LINE_TYPE),
						LINE_TYPE_NAME				: gfnma_nvl(item.LINE_TYPE_NAME),

						ORIGINAL_CR_AMT				: gfnma_nvl(item.ORIGINAL_CR_AMT),		
						ORIGINAL_DR_AMT				: gfnma_nvl(item.ORIGINAL_DR_AMT),		
						ORIGINAL_NET_AMT			: gfnma_nvl(item.ORIGINAL_NET_AMT),		
						
						POSTING_DATE				: gfnma_date5(gfnma_nvl(item.POSTING_DATE)),		
						POSTING_USER				: gfnma_nvl(item.POSTING_USER),		

						PROJECT_CODE				: gfnma_nvl(item.PROJECT_CODE),		
						PROJECT_NAME				: gfnma_nvl(item.PROJECT_NAME),		
						REVERSE_DOC_ID				: gfnma_nvl(item.REVERSE_DOC_ID),		
						REVERSE_DOC_NAME			: gfnma_nvl(item.REVERSE_DOC_NAME),		
						
						SITE_CODE					: gfnma_nvl(item.SITE_CODE),
						SOURCE_DOC_ID				: gfnma_nvl(item.SOURCE_DOC_ID),
						SOURCE_DOC_NAME				: gfnma_nvl(item.SOURCE_DOC_NAME),
						SOURCE_ID					: gfnma_nvl(item.SOURCE_ID),
						SOURCE_TYPE					: gfnma_nvl(item.SOURCE_TYPE),
						SUBJECT_NAME				: gfnma_nvl(item.SUBJECT_NAME),
  					}
  					list.push(msg);
  					totalRecordCount ++;
  				});
				
        		fn_setStyleGrid(list, p_sum_yn);
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
     * 합계, 누계 색상
     */
    var fn_setStyleGrid = function(list, type) {
      	
    	jsonFig4160 = [];    	
      	for (var i = 0; i < list.length; i++) {
      		var obj = list[i];
      		if(type=='Y'){
      			jsonFig4160.push(obj);
      		} else {
	      		if(obj['GUBUN']!='2' && obj['GUBUN']!='3' ){
	      			jsonFig4160.push(obj);
	      		}
      		}
      	}
		Fig4160Grid.rebuild();
      	
		if(type=='Y'){
	    	let allDatas = Fig4160Grid.getGridDataAll();
	      	for (var i = 0; i < allDatas.length; i++) {
	      		var obj = allDatas[i];
	      		if(obj['GUBUN']=='2' || obj['GUBUN']=='3' ){
	      			Fig4160Grid.setRowStyle(i+1, 'data', 'background', '#d4f1da');
	      		}
	      	}
	    	Fig4160Grid.clearSelection();
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
     * 1일
     */
    var fn_dateDay1 = function() {
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		gfnma_date4());
		SBUxMethod.set('SCH_ENTRY_DATE_TO', 		gfnma_date4());
		cfn_search();
  	}       
    
    /**
     * 1주일
     */
    var fn_dateWeek1 = function() {
    	
		SBUxMethod.set('SCH_ENTRY_DATE_TO', 		gfnma_date4());
		
		var DiffDay = 0;
		var today 	= gfnma_date8(gfnma_date4());
		console.log(today);
		if(today=='일'){
			DiffDay = 0;
		} else if(today=='월'){
			DiffDay = 1;
		} else if(today=='화'){
			DiffDay = 2;
		} else if(today=='수'){
			DiffDay = 3;
		} else if(today=='목'){
			DiffDay = 4;
		} else if(today=='금'){
			DiffDay = 5;
		} else if(today=='토'){
			DiffDay = 6;
		}
		var newDate = new Date(gfnma_date4());
		newDate.setDate(newDate.getDate() - DiffDay);
		var ddate = gfnma_date(newDate);
		console.log(ddate);
		ddate = ddate.substr(0,4) + '-' + ddate.substr(4,2) + '-' + ddate.substr(6,2); 
		console.log(ddate);
		
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		ddate);
		cfn_search();
  	}       
    
    /**
     * 1개월
     */
    var fn_dateMonth1 = function() {
    	var ddate = SBUxMethod.get('SCH_ENTRY_DATE_TO');
    	ddate = ddate.substr(0,4) + '-' + ddate.substr(4,2) + '-01'; 
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		ddate);
		cfn_search();
  	}       
    
    /**
     * 3개월
     */
    var fn_dateMonth3 = function() {
    	var ddate = SBUxMethod.get('SCH_ENTRY_DATE_TO');
    	ddate = ddate.substr(0,4) + '-' + ddate.substr(4,2) + '-' + ddate.substr(6,2); 
		var newDate = new Date(ddate);
		newDate.setMonth(newDate.getMonth() - 2);
		var rdate = gfnma_date(newDate);
		rdate = rdate.substr(0,4) + '-' + rdate.substr(4,2) + '-01'; 
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		rdate);
		cfn_search();
  	}       
    
    /**
     * 6개월
     */
    var fn_dateMonth6 = function() {
    	var ddate = SBUxMethod.get('SCH_ENTRY_DATE_TO');
    	ddate = ddate.substr(0,4) + '-' + ddate.substr(4,2) + '-' + ddate.substr(6,2); 
		var newDate = new Date(ddate);
		newDate.setMonth(newDate.getMonth() - 5);
		var rdate = gfnma_date(newDate);
		rdate = rdate.substr(0,4) + '-' + rdate.substr(4,2) + '-01'; 
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		rdate);
		cfn_search();
  	}       
    
    /**
     * 1년
     */
    var fn_dateYear1 = function() {
    	var ddate = SBUxMethod.get('SCH_ENTRY_DATE_TO');
    	ddate = ddate.substr(0,4) + '-01-01'; 
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		ddate);
		cfn_search();
  	}       
    
    /**
     * 전체
     */
    var fn_dateAll = function() {
    	var ddate = SBUxMethod.get('SCH_ENTRY_DATE_TO');
    	ddate = ddate.substr(0,4) + '-01-01'; 
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		ddate);
		cfn_search();
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
            	,'WORK_TYPE'	: 'VIEW'
            	,'target'		: 'MA_A20_030_020_150'
            }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);			
	}        
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>