<%
/**
 * @Class Name 		: fig2300.jsp
 * @Description 	: 미결반제전표 조회 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.09.12
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.09.12   	장성주		최초 생성
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
	<title>title : 미결반제전표 조회</title>
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
                    </h3><!-- 미결반제전표 조회 -->
                </div>
                <div style="margin-left: auto;">
                    <sbux-button id="BTN_ALLCOMPLETE" 	style="display:none;" uitype="normal" text="전기+해제"  class="btn btn-sm btn-outline-danger" onclick="fn_btnAllComplete"></sbux-button>
                    <sbux-button id="BTN_RELEASE" 		style="display:none;" uitype="normal" text="보류해제"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnRelease"></sbux-button>
                    <sbux-button id="BTN_UNRELEASE"		style="display:none;" uitype="normal" text="보류지정"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnUnRelease"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <!-- 
                    <sbux-button style="display:none;" uitype="normal" text="전표복사"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnCopy"></sbux-button>
                     -->
                    <font style="margin-right:10px"></font>
                    <!-- 
                    <sbux-button uitype="normal" text="전표출력"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnPrint"></sbux-button>
                     -->
                    <sbux-button id="BTN_DETAILVIEW"	uitype="normal" text="세부내역"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnDetailView"></sbux-button>
                    <sbux-button id="BTN_END"			uitype="normal" text="전기처리"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnEnd"></sbux-button>
                    <sbux-button id="BTN_CANCEL"		uitype="normal" text="전기취소"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnCancel"></sbux-button>
                    <sbux-button id="BTN_DELETE"		uitype="normal" text="일괄삭제"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnDelete"></sbux-button>
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
  							<sbux-input  id="SCH_TXTPARAM"  	name="SCH_TXTPARAM" 	style="display:none;" uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<!-- /hidden -->
	                    
	                        <tr>
	                            <th scope="row" class="th_bg_search">APC</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_FI_ORG_CODE" name="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonfiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
						        <td></td>
	                            
	                            <th scope="row" class="th_bg_search">사업장</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_SITE_CODE" name="SCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
						        <td></td>
	                            
	                            <th scope="row" class="th_bg_search">보류여부</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_HOLD_FLAG" name="SCH_HOLD_FLAG" uitype="single" jsondata-ref="jsonHoldFlag" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
						        <td></td>
	                            
	                            <th scope="row" class="th_bg_search">전표상태</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_DOC_STATUS" name="SCH_DOC_STATUS" uitype="single" jsondata-ref="jsonDocStatus" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
						        <td></td>
	                        </tr>    
	                    
	                        <tr>
	                            <th scope="row" class="th_bg_search">년월</th>
	                            <td colspan="3" class="td_input" >
									<sbux-datepicker
									        id="SCH_YMDPERIOD_YYYYMM_P"
									        name="SCH_YMDPERIOD_YYYYMM_P"
									        uitype="popup"
									        datepicker-mode="month"
									        date-format="yyyy-mm"
									        style="width:80px"
									        class="form-control input-sm input-sm-ast table-datepicker-ma"
									        onchange = "fn_payDate"
									        required>
									</sbux-datepicker>                            
	                            </td>
						        <td></td>
	                            
	                            <th scope="row" class="th_bg_search">전표구분</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_DOC_TYPE" name="SCH_DOC_TYPE" uitype="single" jsondata-ref="jsonDocType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
						        <td></td>
	                            
	                            <th scope="row" class="th_bg_search">작성부서</th>
								<td colspan="3"  class="td_input" >
	   								<sbux-input
										id="SCH_TXTCREATED_DEPT_NAME"
										uitype="text"
										class="form-control input-sm"									
	   								></sbux-input>
									<sbux-input
										id="SCH_TXTCREATED_DEPT_CODE"
										uitype="hidden"
										uitype="text"
										class="form-control input-sm"
	   								></sbux-input>
								</td>
	                            <td class="td_input" >
									<sbux-button
										id="SCH_BTN_TXTCREATED_DEPT"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1"
									></sbux-button>
	                            </td>
								
	                            <th scope="row" class="th_bg_search">청구부서</th>
								<td colspan="2"  class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		   								<sbux-input
											id="SCH_TXTPAYEE_DEPT_NAME"
											uitype="text"
											class="form-control input-sm"									
		   								></sbux-input>
										<sbux-input
											id="SCH_TXTPAYEE_DEPT_CODE"
											uitype="hidden"
											uitype="text"
											class="form-control input-sm"
		   								></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="SCH_BTN_TXTPAYEE_DEPT"
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup2"
										></sbux-button>
									</div>
								</td>
	                            <td colspan="2"  class="td_input" >
	                       			<sbux-checkbox 
	                       				id="SCH_APPR_ONLY_FLAG" 
	                       				uitype="normal" 
	                       				text="결재건만" 
	                       				true-value="Y" 
	                       				false-value="N" ></sbux-checkbox>
	                            </td>
								
							</tr>	                    
	                    
	                        <tr>
	                            <th scope="row" class="th_bg_search">전표일자</th>
	                            <td class="td_input" >
								    <sbux-datepicker
								            id="SCH_ENTRY_DATE_FR"
								            name="SCH_ENTRY_DATE_FR"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast table-datepicker-ma">
								    </sbux-datepicker>                          
	                            </td>
						        <td>-</td>
	                            <td class="td_input" >
								    <sbux-datepicker
								            id="SCH_ENTRY_DATE_TO"
								            name="SCH_ENTRY_DATE_TO"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast table-datepicker-ma">
								    </sbux-datepicker>                            
	                            </td>
						        <td></td>
	                            
	                            <th scope="row" class="th_bg_search">회계기준</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_ACCT_RULE_CODE" name="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
						        <td></td>
	                            
	                            <th scope="row" class="th_bg_search">작성자</th>
								<td colspan="3"  class="td_input" >
	   								<sbux-input
										id="SCH_TXTCREATED_BY_NAME"
										uitype="text"
										class="form-control input-sm"									
	   								></sbux-input>
									<sbux-input
										id="SCH_TXTCREATED_BY_CODE"
										uitype="hidden"
										uitype="text"
										class="form-control input-sm"
	   								></sbux-input>
								</td>
	                            <td class="td_input" >
									<sbux-button
										id="SCH_BTN_TXTCREATED_BY"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup3"
									></sbux-button>
	                            </td>
								
	                            <th scope="row" class="th_bg_search">실사용자</th>
								<td colspan="2"  class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		   								<sbux-input
											id="SCH_TXTPAYEE_NAME"
											uitype="text"
											class="form-control input-sm"									
		   								></sbux-input>
										<sbux-input
											id="SCH_TXTPAYEE_CODE"
											uitype="hidden"
											uitype="text"
											class="form-control input-sm"
		   								></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="SCH_BTN_TXTPAYEE"
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup4"
										></sbux-button>
									</div>
								</td>
	                            <td colspan="2" class="td_input" >
	                       			<sbux-checkbox 
	                       				id="SCH_REVERSE_FLAG" 
	                       				uitype="normal" 
	                       				text="역분개제외여" 
	                       				true-value="Y" 
	                       				false-value="N" ></sbux-checkbox>
	                            </td>
	                            
	                    	</tr>
								          
	                        <tr>
	                            <th scope="row" class="th_bg_search">전표번호</th>
	                            <td colspan="9" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle !important;width:100%">
		   								<sbux-input
											id="SCH_DOC_NAME"
											uitype="text"
											style="width:300px"
											class="form-control input-sm"									
		   								></sbux-input>	                            
		   								<font style="width:10px"></font>
		   								<span style="padding-top:5px">
			                       			<sbux-checkbox 
			                       				id="SCH_MULTI_YN" 
			                       				uitype="normal" 
			                       				text="복수선택" 
			                       				true-value="Y" 
			                       				false-value="N" ></sbux-checkbox>
		   								</span>
		   								<font style="width:10px"></font>
										<sbux-button
											id="SCH_BTN_MULTI_DOC"
											class="btn btn-xs btn-outline-dark"
											text="복수전표" 
											onclick="fn_multiDoc()"></sbux-button>
	                            	</div>
	                            </td>							
	                            	          
	                            <th scope="row" class="th_bg_search">제목</th>
	                            <td colspan="9" class="td_input" >
	   								<sbux-input
										id="SCH_DESC"
										uitype="text"
										class="form-control input-sm"									
	   								></sbux-input>	                            
	                            </td>								          
							
							</tr>
								                            
	                    </tbody>
	                </table>				
				</div>
                
                <div class="row">
                
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>미결반제전표내역</span>
	                            <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
	                    	<span style="padding-top:5px">
		                    	<font style="font-size:11px" >결재의견</font>
	                    	</span>
		                    <span style="width:5px"></span>
	                        <sbux-input id="SCH_APPR_OPINION" name="SCH_APPR_OPINION" class="form-control input-sm" uitype="text" style="width:250px;" ></sbux-input>
		                    <span style="width:5px"></span>
		                    <sbux-button uitype="normal" text="일괄결재"  	class="btn btn-sm btn-outline-danger" onclick="fn_AllAppr" ></sbux-button>
		                    <span style="width:5px"></span>
		                    <sbux-button uitype="normal" text="일괄반려"  	class="btn btn-sm btn-outline-danger" onclick="fn_AllReturn" ></sbux-button>
						</div>
	                </div>
	                <div>
	                    <div id="SB_AREA_GRDTOP" style="height:200px; width:100%;">
	                    </div>
	                </div>
	                
	                <div style="padding-top:10px">
		                <sbux-tabs id="tab_norm" name="tab_norm" uitype="normal"
							is-scrollable="false"
							title-target-id-array="tab1^tab2^tab3"
							title-text-array="회계처리^원전표^결재이력">
						</sbux-tabs>
	                    <div class="tab-content">
							<div id="tab1" style="height:180px;">
								<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
									<font style="margin-right:auto;">회계처리</font>
								</div>
			                    <div id="SB_AREA_GRDTAB1" style="height:160px; width:100%;">
			                    </div>
							</div>
							<div id="tab2" style="height:180px;">
								<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
									<font style="margin-right:auto;">원전표</font>
								</div>
			                    <div id="SB_AREA_GRDTAB2" style="height:160px; width:100%;">
			                    </div>
							</div>
							<div id="tab3" style="height:180px;">
								<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
									<font style="margin-right:auto;">결재이력</font>
								</div>
			                    <div id="SB_AREA_GRDTAB3" style="height:160px; width:100%;">
			                    </div>
							</div>
						</div>
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

 	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:500px" id="modal-compopup4" name="modal-compopup4" uitype="middle" header-title="" body-html-id="body-modal-compopup4" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup4">
    	<jsp:include page="../../../com/popup/comPopup4.jsp"></jsp:include>
    </div>
    
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';
	
	var p_ss_empCode 			= '${loginVO.maEmpCode}';
	var p_ss_defaultAcctRule 	= '${loginVO.maDefaultAcctRule}';
	var p_ss_isAccountManager	= '${loginVO.maIsAccountManager}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	var p_ss_siteCode			= '${loginVO.maSiteCode}';
	var p_ss_userName 			= '${loginVO.maUserName}';
	var p_ss_deptCode 			= '${loginVO.maDeptCode}';
	var p_ss_deptName 			= '${loginVO.maDeptName}';
	
	var p_menu_param			= null;	// 메뉴이동 파라미터
	//-----------------------------------------------------------
	
    var jsonfiOrgCode 		= []; // APC
    var jsonSiteCode 		= []; // 사업장
    var jsonHoldFlag 		= []; // 보류여부
    var jsonDocStatus 		= []; // 전표상태
    var jsonDocType 		= []; // 전표구분
    var jsonAcctRuleCode 	= []; // 회계기준
	
	var pp_strDocList			= ""; // 복수전표 파라미터
	
	var pp_selDocId				= ""; 
	
	var pp_strunposting_type	= ""; 
	var pp_strunposting_date	= ""; 
    
    var Fig2300Grid; 			// 그리드를 담기위한 객체 선언
    var jsonFig2300 	= [];	// 그리드의 참조 데이터 주소 선언
    
    var tab1Fig2210Grid; 		// 그리드를 담기위한 객체 선언
    var jsonTab1Fig2210 = [];	// 그리드의 참조 데이터 주소 선언
    
    var tab2Fig2300Grid; 		// 그리드를 담기위한 객체 선언
    var jsonTab2Fig2300 = [];	// 그리드의 참조 데이터 주소 선언
    
    var tab3Fim3420Grid; 		// 그리드를 담기위한 객체 선언
    var jsonTab3Fim3420 = [];	// 그리드의 참조 데이터 주소 선언
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // APC
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],		jsonfiOrgCode, 		'L_FIM022', 	'', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE'], 		jsonSiteCode, 		'L_ORG001', 	'', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 보류여부
            gfnma_setComSelect(['SCH_HOLD_FLAG'], 		jsonHoldFlag, 		'L_COM036', 	'', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표상태
            gfnma_setComSelect(['SCH_DOC_STATUS'],		jsonDocStatus, 		'L_FIG002_1', 	'', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표구분
            gfnma_setComSelect(['SCH_DOC_TYPE'],		jsonDocType, 		'L_FIM051_CLR', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE'],	jsonAcctRuleCode, 	'L_FIM054', 	'', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '2'),
			
		]);
	}	

	async function fn_init() {
		
		//this param setting
		//
		//...................
		
  		await fn_initSBSelect()
		//화면셋팅
    	fn_state();
	} 
	
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_init();
    	fn_createFig2300Grid();	
    	fn_createTab1Grid();	
     	fn_createTab2Grid();	
     	fn_createTab3Grid();	
    	
    });

    /**
     * 화면 state 변경
     */
    const fn_state = async function() {
		
    	//컴포넌트 기본속성

		SBUxMethod.set("SCH_FI_ORG_CODE", 		p_ss_fiOrgCode);
		SBUxMethod.set("SCH_SITE_CODE", 		p_ss_siteCode);
		SBUxMethod.set("SCH_ACCT_RULE_CODE", 	p_ss_defaultAcctRule);
		SBUxMethod.set("SCH_DOC_TYPE", 			'93');
		
    	//년월
		SBUxMethod.set('SCH_YMDPERIOD_YYYYMM_P', gfnma_date().substr(0,4) + '-' + gfnma_date().substr(4,2));
        var yyyymm	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_YYYYMM_P"));
        var sdate	= yyyymm.substr(0,4) + '-' + yyyymm.substr(4,2) + '-01';
        var edate	= gfnma_date3(yyyymm.substr(0,4), yyyymm.substr(4,2));
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 	sdate);
		SBUxMethod.set('SCH_ENTRY_DATE_TO', 	edate);
		
		SBUxMethod.set('SCH_REVERSE_FLAG', 		'Y');
		SBUxMethod.set('SCH_APPR_ONLY_FLAG', 	'N');
		
		await fn_setFig2300Grid('MENU');
		
		let p_txtparam	= gfnma_nvl(SBUxMethod.get("SCH_TXTPARAM"));
		if(p_txtparam=='Q'){
			SBUxMethod.hide("BTN_END");
			SBUxMethod.hide("BTN_CANCEL");
			SBUxMethod.hide("BTN_ALLCOMPLETE");
			SBUxMethod.hide("BTN_RELEASE");
			SBUxMethod.hide("BTN_UNRELEASE");
			SBUxMethod.hide("BTN_DELETE");
		} else if(p_txtparam=='92'){
			SBUxMethod.set("SCH_DOC_TYPE", 	p_txtparam);
			SBUxMethod.attr('SCH_DOC_TYPE',	'disabled', true);
		}
		
		if(!p_ss_isAccountManager){
			SBUxMethod.hide("BTN_END");
			SBUxMethod.hide("BTN_CANCEL");
			SBUxMethod.hide("BTN_ALLCOMPLETE");
			SBUxMethod.hide("BTN_RELEASE");
			SBUxMethod.hide("BTN_UNRELEASE");
			SBUxMethod.hide("BTN_DELETE");
		}
		
		if(!p_ss_isAccountManager){
			SBUxMethod.set("SCH_TXTCREATED_BY_CODE", 	p_userId);
			SBUxMethod.set("SCH_TXTCREATED_BY_NAME", 	p_ss_userName);
			SBUxMethod.set("SCH_TXTCREATED_DEPT_CODE", 	p_ss_deptCode);
			SBUxMethod.set("SCH_TXTCREATED_DEPT_NAME", 	p_ss_deptName);
			SBUxMethod.attr('SCH_TXTCREATED_DEPT_NAME',	'disabled', true);
			SBUxMethod.attr('SCH_TXTCREATED_BY_NAME',	'disabled', false);
			
			SBUxMethod.set("SCH_TXTPAYEE_CODE", 		p_userId);
			SBUxMethod.set("SCH_TXTPAYEE_NAME", 		p_ss_userName);
			SBUxMethod.set("SCH_TXTPAYEE_DEPT_CODE", 	p_ss_deptCode);
			SBUxMethod.set("SCH_TXTPAYEE_DEPT_NAME", 	p_ss_deptName);
			SBUxMethod.attr('SCH_TXTPAYEE_DEPT_NAME',	'disabled', true);
			SBUxMethod.attr('SCH_TXTPAYEE_NAME',		'disabled', false);
		} else {
			SBUxMethod.set("SCH_TXTCREATED_BY_CODE", 	'');
			SBUxMethod.set("SCH_TXTCREATED_BY_NAME", 	'');
			SBUxMethod.set("SCH_TXTCREATED_DEPT_CODE", 	'');
			SBUxMethod.set("SCH_TXTCREATED_DEPT_NAME", 	'');
			SBUxMethod.attr('SCH_TXTCREATED_DEPT_NAME',	'disabled', false);
			SBUxMethod.attr('SCH_TXTCREATED_BY_NAME',	'disabled', false);
			
			SBUxMethod.set("SCH_TXTPAYEE_CODE", 		'');
			SBUxMethod.set("SCH_TXTPAYEE_NAME", 		'');
			SBUxMethod.set("SCH_TXTPAYEE_DEPT_CODE", 	'');
			SBUxMethod.set("SCH_TXTPAYEE_DEPT_NAME", 	'');
			SBUxMethod.attr('SCH_TXTPAYEE_DEPT_NAME',	'disabled', false);
			SBUxMethod.attr('SCH_TXTPAYEE_NAME',		'disabled', false);
		}
   	
    }
    
    function fn_createFig2300Grid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_AREA_GRDTOP';
	    SBGridProperties.id 				= 'Fig2300Grid';
	    SBGridProperties.jsonref 			= 'jsonFig2300';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
        SBGridProperties.frozencols 		= 8;
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
                    sum : [21,22,23]
                },
                grandtotalrow : {
                    titlecol 		: 20,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
        	{caption: [""], ref: 'CHECK_YN', type: 'checkbox', width: '40px', style: 'text-align:center',
        	    typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
        	        checkedvalue: 'Y', uncheckedvalue: 'N'
        	    }
        	},        	
            {caption: ["전표상태"],					ref: 'DOC_STATUS_NAME', 		type:'output', 		width:'100px',  	style:'text-align:left'},
            {caption: ["APC"], 				ref: 'FI_ORG_NAME',    			type:'output',  	width:'150px', 		style:'text-align:left'},
            {caption: ["사업장"],    				ref: 'SITE_NAME', 				type:'output',  	width:'150px', 		style:'text-align:left'},
            {caption: ["전기일자"],  				ref: 'DOC_DATE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전표구분"],  				ref: 'DOC_TYPE_NAME', 			type:'output',  	width:'150px',  	style:'text-align:left'},
            
            {caption: ["전표번호"], 				ref: 'DOC_NAME', 				type:'button',  	width:'100px', 		style:'text-align:left', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['DOC_ID']){
            			var tmp = "fn_gridPopup1(event, " + nRow + ", " + nCol + ")";
		        		return '<a style="text-decoration: underline;cursor:pointer;color:#149fff" href="#" onClick="' + tmp + '">' + objRowData['DOC_NAME'] + '</a>';
            		} else {
            			return "";
            		}
            	}	
            },
            
            {caption: ["통화"],						ref: 'CURRENCY_CODE',			type:'output',  	width:'70px',  		style:'text-align:left'},
            
            {caption: ["청구자"], 					ref: 'REQUEST_EMP',    			type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["직전결재자"], 				ref: 'BEFORE_APPR_EMP', 		type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["직전대행자"], 				ref: 'BEFORE_PROXY_EMP', 		type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["다음결재자"], 				ref: 'NEXT_APPR_EMP', 			type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["다음대행자"], 				ref: 'NEXT_PROXY_EMP', 			type:'output',  	width:'100px', 		style:'text-align:left'},
            
            {caption: ["거래처명"], 				ref: 'CS_NAME', 				type:'output',  	width:'250px', 		style:'text-align:left'},
            {caption: ["역분개"], 					ref: 'REVERSE_FLAG', 			type: 'checkbox', 	width: '50px', 		style: 'text-align:center', disabled: true,
                typeinfo: {ignoreupdate: false, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["보류여부"], 				ref: 'HOLD_FLAG', 				type: 'checkbox', 	width: '50px', 		style: 'text-align:center', disabled: true,
                typeinfo: {ignoreupdate: false, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            
            {caption: ["현업최종승인일"], 			ref: 'APPROVE_DATE', 			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["회계승인일"], 				ref: 'POSTING_DATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["회계승인취소일"],			ref: 'UNPOSTING_DATE', 			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["배치번호"],					ref: 'DOC_BATCH_NO', 			type:'output',  	width:'250px',  	style:'text-align:left'},
            
            {caption: ["금액"], 	   				ref: 'DOC_AMT', 				type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["공급가액"],    				ref: 'SUPPLY_AMT', 				type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["부가세"], 	   				ref: 'VAT_AMT', 				type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["적요"],    					ref: 'DESCRIPTION', 			type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["결의부서명"], 				ref: 'DEPT_NAME', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["작성자"], 					ref: 'INSERT_USER_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["소스타입"], 				ref: 'SOURCE_TYPE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            
        ];

        Fig2300Grid = _SBGrid.create(SBGridProperties);
        Fig2300Grid.bind('click', 'fn_viewFig2300GridEvent');
    }    
    
    //상세정보 보기
    function fn_viewFig2300GridEvent() {
    	
        var nRow = Fig2300Grid.getRow();
		if (nRow < 1) {
            return;
		}
        let rowData = Fig2300Grid.getRowData(nRow);
		console.log('rowData:', rowData);        
		if(rowData){
			pp_selDocId = Number(rowData['DOC_ID']);
		}
		
		//tab1 : tpgAccount 	: 회계처리
		fn_setTab1Grid('ACCOUNT', pp_selDocId);		
		
		//tab2 : tpgOriginal 	: 원전표
		fn_setTab2Grid('ORIGINAL', pp_selDocId);		
		
		//tab3 : tpgApprove 	: 결재이력
		fn_setTab3Grid('LIST', rowData);		
		
    }
    
    //상세정보 보기
    function fn_viewFig2300GridReload(idx) {
    	
    	Fig2300Grid.setRow(idx);
        let rowData = Fig2300Grid.getRowData(idx);
		//console.log(rowData);        
		if(rowData){
			pp_selDocId = Number(rowData['DOC_ID']);
		}
		
		//tab1 : tpgAccount 	: 회계처리
		fn_setTab1Grid('ACCOUNT', pp_selDocId);		
		
		//tab2 : tpgOriginal 	: 원전표
		fn_setTab2Grid('ORIGINAL', pp_selDocId);		
		
		//tab3 : tpgApprove 	: 결재이력
		fn_setTab3Grid('LIST', rowData);		
    }    
    
    function fn_createTab1Grid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_AREA_GRDTAB1';
	    SBGridProperties.id 				= 'tab1Fig2210Grid';
	    SBGridProperties.jsonref 			= 'jsonTab1Fig2210';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
        //SBGridProperties.frozencols 		= 8;
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
                    sum : [10,11,12,13]
                },
                grandtotalrow : {
                    titlecol 		: 9,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["전표번호"], 				ref: 'DOC_NAME', 				type:'button',  	width:'100px', 		style:'text-align:left', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['DOC_ID']){
            			var tmp = "fn_gridPopup2(event, " + nRow + ", " + nCol + ")";
		        		return '<a style="text-decoration: underline;cursor:pointer;color:#149fff" href="#" onClick="' + tmp + '">' + objRowData['DOC_NAME'] + '</a>';
            		} else {
            			return "";
            		}
            	}	
            },
            
            {caption: ["전표유형"], 				ref: 'DOC_TYPE_NAME',  			type:'output',  	width:'150px', 		style:'text-align:left'},
            {caption: ["전표상태"],    				ref: 'DOC_STATUS_NAME', 		type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["순번"],  					ref: 'ITEM_SEQ', 				type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["TYPE"],  					ref: 'LINE_TYPE_NAME', 			type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["차/대"],  					ref: 'DEBIT_CREDIT_NAME', 		type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["부가세유형"],  		 		ref: 'VAT_TYPE', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["계정코드"],  				ref: 'ACCOUNT_CODE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["계정과목명"],  				ref: 'ACCOUNT_NAME', 			type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["차변(통화)"],  				ref: 'ORIGINAL_DR_AMT', 		type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["대변(통화)"],  				ref: 'ORIGINAL_CR_AMT', 		type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["차변(전표)"],  				ref: 'FUNCTIONAL_DR_AMT', 		type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["대변(전표)"],  				ref: 'FUNCTIONAL_CR_AMT', 		type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["부서"], 	 				ref: 'DEPT_NAME', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["원가중심점"], 				ref: 'COST_CENTER_CODE',		type:'output',  	width:'150px',  	style:'text-align:left'},
            
            {caption: ["적요"],    					ref: 'DESCRIPTION', 			type:'output',  	width:'250px',  	style:'text-align:left'},
        ];

        tab1Fig2210Grid = _SBGrid.create(SBGridProperties);
    }    
    
    function fn_createTab2Grid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_AREA_GRDTAB2';
	    SBGridProperties.id 				= 'tab2Fig2300Grid';
	    SBGridProperties.jsonref 			= 'jsonTab2Fig2300';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
        //SBGridProperties.frozencols 		= 8;
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
                    sum : [7,8]
                },
                grandtotalrow : {
                    titlecol 		: 6,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["전표유형"], 				ref: 'DOC_TYPE_NAME',  			type:'output',  	width:'150px', 		style:'text-align:left'},
            {caption: ["전표번호"],					ref: 'DOC_NAME', 				type:'output', 		width:'150px',  	style:'text-align:left'},
            {caption: ["전표상태"],    				ref: 'DOC_STATUS_NAME', 		type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["지급요청일자"], 			ref: 'PLANNED_PAY_DATE', 		type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["지급일"], 					ref: 'PAY_DATE', 				type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["통화"], 					ref: 'CURRENCY_CODE', 			type:'output',  	width:'80px',  		style:'text-align:left'},
            
            {caption: ["통화금액"],  				ref: 'ORIGINAL_AMOUNT', 		type:'output',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["전표금액"],  				ref: 'FUNCTIONAL_AMOUNT', 		type:'output',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["비고"],  					ref: 'ETC', 					type:'output',  	width:'250px',  	style:'text-align:left'},
        ];

        tab2Fig2300Grid = _SBGrid.create(SBGridProperties);
    }    
    
    function fn_createTab3Grid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_AREA_GRDTAB3';
	    SBGridProperties.id 				= 'tab3Fim3420Grid';
	    SBGridProperties.jsonref 			= 'jsonTab3Fim3420';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
        //SBGridProperties.frozencols 		= 8;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= ['seq'];
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.columns = [
            {caption: ["순번"], 					ref: 'STEP_SEQ',  				type:'output',  	width:'80px', 		style:'text-align:left'},
            {caption: ["구분"], 					ref: 'APPR_TYPE_NAME', 			type:'output',  	width:'80px', 		style:'text-align:left'},
            {caption: ["결재구분"], 				ref: 'APPR_CATEGORY_NAME', 		type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["부서명"], 					ref: 'DEPT_NAME',  				type:'output',  	width:'150px', 		style:'text-align:left'},
            {caption: ["직책"], 					ref: 'DUTY_NAME',  				type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["이름"], 					ref: 'EMP_NAME',  				type:'output',  	width:'100px', 		style:'text-align:left'},
            
            {caption: ["수임자명"], 				ref: 'PROXY_EMP_NAME',  		type:'output',  	width:'200px', 		style:'text-align:left'},
            {caption: ["결재자명"], 				ref: 'UPDATE_EMP_NAME',  		type:'output',  	width:'200px', 		style:'text-align:left'},
            {caption: ["승인일"], 					ref: 'APPR_DATE',  				type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["결재의견"], 				ref: 'APPR_OPINION', 			type:'output',  	width:'200px', 		style:'text-align:left'},
            
            {caption: ["비고"],  					ref: 'ETC', 					type:'output',  	width:'250px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
        ];

        tab3Fim3420Grid = _SBGrid.create(SBGridProperties);
    }    
    
    /**
     * 목록 조회
     */
	function cfn_search() {
		fn_setFig2300Grid('Q');
	}    
    
    /**
     * 목록 가져오기
     */
    const fn_setFig2300Grid = async function(wtype) {
    	
		Fig2300Grid.clearStatus();

		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_acct_rule_code		= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_entry_date_fr			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_FR"));
		let p_entry_date_to			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_TO"));
		let p_site_code				= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_doc_type				= gfnma_nvl(SBUxMethod.get("SCH_DOC_TYPE"));
		let p_doc_status			= gfnma_nvl(SBUxMethod.get("SCH_DOC_STATUS"));
		let p_payee_dept			= gfnma_nvl(SBUxMethod.get("SCH_TXTPAYEE_DEPT_CODE"));
		let p_payee_code			= gfnma_nvl(SBUxMethod.get("SCH_TXTPAYEE_CODE"));
		let p_created_dept_code		= gfnma_nvl(SBUxMethod.get("SCH_TXTCREATED_DEPT_CODE"));
		let p_created_by_code		= gfnma_nvl(SBUxMethod.get("SCH_TXTCREATED_BY_CODE"));
		let p_reverse_flag			= gfnma_nvl(SBUxMethod.get("SCH_REVERSE_FLAG")['SCH_REVERSE_FLAG']);
		let p_hold_flag				= gfnma_nvl(SBUxMethod.get("SCH_HOLD_FLAG"));
		let p_appr_only_flag		= gfnma_nvl(SBUxMethod.get("SCH_APPR_ONLY_FLAG")['SCH_APPR_ONLY_FLAG']);
		let p_doc_name				= gfnma_nvl(SBUxMethod.get("SCH_DOC_NAME"));
		
		let p_multi_yn				= gfnma_nvl(SBUxMethod.get("SCH_MULTI_YN"));
		if(p_multi_yn=='N') {
			p_multi_yn = pp_strDocList;
		} else {
			p_multi_yn = '';
		}
		
		let p_doc_id		= (wtype=='ORIGINAL') ? pp_selDocId : '0';
		let p_desc			= gfnma_nvl(SBUxMethod.get("SCH_DESC"));
		
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		if(!p_site_code){
 			gfn_comAlert("E0000","사업장을 선택하세요");
			return;      		 
		}
		if(!p_entry_date_fr || !p_entry_date_to){
 			gfn_comAlert("E0000","전표일자를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_fi_org_code
			,V_P_ACCT_RULE_CODE     : p_acct_rule_code 
			,V_P_DOC_DATE           : p_entry_date_fr
			,V_P_SITE_CODE          : p_site_code
			,V_P_DOC_TYPE          	: p_doc_type
			,V_P_DOC_STATUS         : p_doc_status
			,V_P_PAYEE_DEPT         : p_payee_dept
			,V_P_PAYEE_CODE         : p_payee_code
			,V_P_CREATED_DEPT       : p_created_dept_code
			,V_P_CREATED_BY        	: p_created_by_code
			,V_P_ENTRY_DATE_FR      : p_entry_date_fr
			,V_P_ENTRY_DATE_TO      : p_entry_date_to
			,V_P_REVERSE_FLAG      	: p_reverse_flag
			,V_P_HOLD_FLAG      	: p_hold_flag
			,V_P_APPR_ONLY_FLAG    	: p_appr_only_flag
			,V_P_DOC_NAME    		: p_doc_name
			,V_P_DOC_NAME_D    		: p_multi_yn
			,V_P_DOC_ID    			: p_doc_id
			,V_P_DESC    			: p_desc
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig2300List.do", {
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

  	        	jsonFig2300.length = 0;
  	        	data.cv_2.forEach((item, index) => {
  					const msg = {
  						ACCT_RULE_CODE			: gfnma_nvl2(item.ACCT_RULE_CODE),
  						APPROVE_DATE			: gfnma_date5(gfnma_nvl2(item.APPROVE_DATE)),
  						APPR_ID					: gfnma_nvl2(item.APPR_ID),
  						APPR_SOURCE_TYPE		: gfnma_nvl2(item.APPR_SOURCE_TYPE),
  						AP_DOC_VIEW_YN			: gfnma_nvl2(item.AP_DOC_VIEW_YN),
  						AP_DOC_WRITE_YN			: gfnma_nvl2(item.AP_DOC_WRITE_YN),
  						AP_DOC_YN				: gfnma_nvl2(item.AP_DOC_YN),
  						AR_DOC_WRITE_YN			: gfnma_nvl2(item.AR_DOC_WRITE_YN),
  						AR_DOC_YN				: gfnma_nvl2(item.AR_DOC_YN),
  						BEFORE_APPR_EMP			: gfnma_nvl2(item.BEFORE_APPR_EMP),
  						BEFORE_PROXY_EMP		: gfnma_nvl2(item.BEFORE_PROXY_EMP),
						CHECK_YN				: gfnma_nvl2(item.CHECK_YN),			
						COMP_CODE				: gfnma_nvl2(item.COMP_CODE),			
  						CONFIRM_EMP_CODE		: gfnma_nvl2(item.CONFIRM_EMP_CODE),
  						CS_NAME					: gfnma_nvl2(item.CS_NAME),
  						CURRENCY_CODE			: gfnma_nvl2(item.CURRENCY_CODE),
						DEPT_CODE				: gfnma_nvl2(item.DEPT_CODE),			
  						DEPT_NAME				: gfnma_nvl2(item.DEPT_NAME),
  						DESCRIPTION				: gfnma_nvl2(item.DESCRIPTION),
  						DOC_AMT					: gfnma_nvl2(item.DOC_AMT),
  						DOC_BATCH_NO			: gfnma_nvl2(item.DOC_BATCH_NO),
  						DOC_DATE				: gfnma_date5(gfnma_nvl2(item.DOC_DATE)),
						DOC_ID					: gfnma_nvl2(item.DOC_ID),			
  						DOC_NAME				: gfnma_nvl2(item.DOC_NAME),
  						DOC_NUM					: gfnma_nvl2(item.DOC_NUM),
  						DOC_NUM_TOTAL			: gfnma_nvl2(item.DOC_NUM_TOTAL),
  						DOC_STATUS				: gfnma_nvl2(item.DOC_STATUS),
  						DOC_STATUS_NAME			: gfnma_nvl2(item.DOC_STATUS_NAME),
  						DOC_TYPE				: gfnma_nvl2(item.DOC_TYPE),
  						DOC_TYPE_NAME			: gfnma_nvl2(item.DOC_TYPE_NAME),
  						ESS_DOC_YN				: gfnma_nvl2(item.ESS_DOC_YN),
						FI_ORG_CODE				: gfnma_nvl2(item.FI_ORG_CODE),			
						FI_ORG_NAME				: gfnma_nvl2(item.FI_ORG_NAME),			
  						HOLD_FLAG				: gfnma_nvl2(item.HOLD_FLAG),
  						HOLD_USER				: gfnma_nvl2(item.HOLD_USER),
  						INSERT_PC				: gfnma_nvl2(item.INSERT_PC),
  						INSERT_TIME				: gfnma_nvl2(item.INSERT_TIME),
  						INSERT_USERID			: gfnma_nvl2(item.INSERT_USERID),
  						INSERT_USER_NAME		: gfnma_nvl2(item.INSERT_USER_NAME),
  						MANUAL_DOC_WRITE_YN		: gfnma_nvl2(item.MANUAL_DOC_WRITE_YN),
  						NULTI_AP_WRITE_YN		: gfnma_nvl2(item.NULTI_AP_WRITE_YN),
  						NEXT_APPR_EMP			: gfnma_nvl2(item.NEXT_APPR_EMP),
  						NEXTE_PROXY_EMP			: gfnma_nvl2(item.NEXT_PROXY_EMP),
  						POSTING_DATE			: gfnma_date5(gfnma_nvl2(item.POSTING_DATE)),
  						POSTING_USER			: gfnma_nvl2(item.POSTING_USER),
  						PROXY_EMP_CODE			: gfnma_nvl2(item.PROXY_EMP_CODE),
  						RELEASE_USER			: gfnma_nvl2(item.RELEASE_USER),
  						REQUEST_EMP				: gfnma_nvl2(item.REQUEST_EMP),
  						REVERSE_FLAG			: gfnma_nvl2(item.REVERSE_FLAG),
						SITE_CODE				: gfnma_nvl2(item.SITE_CODE),			
						SITE_NAME				: gfnma_nvl2(item.SITE_NAME),			
  						SOURCE_ID				: gfnma_nvl2(item.SOURCE_ID),
  						SOURCE_TYPE				: gfnma_nvl2(item.SOURCE_TYPE),
  						SUPPLY_AMT				: gfnma_nvl2(item.SUPPLY_AMT),
  						UNPOSTING_DATE			: gfnma_nvl2(item.UNPOSTING_DATE),
  						UNPOSTING_USER			: gfnma_nvl2(item.UNPOSTING_USER),
  						UPDATE_PC				: gfnma_nvl2(item.UPDATE_PC),
  						UPDATE_TIME				: gfnma_nvl2(item.UPDATE_TIME),
  						UPDATE_USERID			: gfnma_nvl2(item.UPDATE_USERID),
  						VAT_AMT					: gfnma_nvl2(item.VAT_AMT),
						
  						DOC_ID1					: gfnma_nvl2(item.DOC_ID1),
						FI_ORG_CODE1			: gfnma_nvl2(item.FI_ORG_CODE1),			
  						APPROVE_DATE1			: gfnma_nvl2(item.APPROVE_DATE1),
  					}
  					jsonFig2300.push(msg);
  					totalRecordCount ++;
  				});

        		Fig2300Grid.rebuild();
  	        	document.querySelector('#listCount1').innerText = totalRecordCount;
  	        	
  	        	//deatil grid 첫번째 행 선택
				if(jsonFig2300.length>0){
					fn_viewFig2300GridReload(1);					
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
     * 작성부서 팝업
     */
    var fn_compopup1 = function() {
    	
    	//type B 형 팝업
    	var addParams = [];	//bizcompId 의 파라미터에 따라 추가할것
    	var p_find1	= gfnma_nvl(SBUxMethod.get("SCH_TXTCREATED_DEPT_NAME"));
    	var p_day	= gfnma_date4();
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG001'
    		,popupType				: 'B'
    		,whereClause			: addParams
   			,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
   			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
   			,searchInputValues		: ["", 				p_find1,		p_day]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,height					: '400px'
   			,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
   			,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
   			,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('SCH_TXTCREATED_DEPT_NAME', data.DEPT_NAME);
				SBUxMethod.set('SCH_TXTCREATED_DEPT_CODE', data.DEPT_CODE);
			},
    	});
  	}         

    /**
     * 청구부서 팝업
     */
    var fn_compopup2 = function() {
    	
    	//type B 형 팝업
    	var addParams = [];	//bizcompId 의 파라미터에 따라 추가할것
    	var p_find1	= gfnma_nvl(SBUxMethod.get("SCH_TXTPAYEE_DEPT_NAME"));
    	var p_day	= gfnma_date4();
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG001'
    		,popupType				: 'B'
    		,whereClause			: addParams
   			,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
   			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
   			,searchInputValues		: ["", 				p_find1,		p_day]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,height					: '400px'
   			,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
   			,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
   			,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('SCH_TXTPAYEE_DEPT_NAME', data.DEPT_NAME);
				SBUxMethod.set('SCH_TXTPAYEE_DEPT_CODE', data.DEPT_CODE);
			},
    	});
  	}         
    
    /**
     * 작성자 팝업
     */
    var fn_compopup3 = function() {
    	
    	//type A 형 팝업
    	
        var searchText 		= gfnma_nvl(SBUxMethod.get("SCH_TXTCREATED_BY_NAME"));
        var replaceText0 	= "_USER_ID_";
        var replaceText1 	= "_USER_NAME_";
        var strWhereClause 	= "AND USER_ID LIKE '%" + replaceText0 + "%' AND USER_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사용자 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_USER'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["사용자ID", 	"사용자명"]
   			,searchInputFields		: ["USER_ID", 	"USER_NAME"]
   			,searchInputValues		: ["", 			searchText]
    		,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["사용자", 	"사용자명",]
   			,tableColumnNames		: ["USER_ID", 	"USER_NAME"]
			,tableColumnWidths		: ["100px", 	"200px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('SCH_TXTCREATED_BY_NAME', data.USER_NAME);
				SBUxMethod.set('SCH_TXTCREATED_BY_CODE', data.USER_ID);
			},
    	});
  	}            
    
    /**
     * 실사용자 팝업
     */
    var fn_compopup4 = function() {
    	
    	//type A 형 팝업
    	
        var searchText 		= gfnma_nvl(SBUxMethod.get("SCH_TXTPAYEE_NAME"));
        var replaceText0 	= "_USER_ID_";
        var replaceText1 	= "_USER_NAME_";
        var strWhereClause 	= "AND USER_ID LIKE '%" + replaceText0 + "%' AND USER_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사용자 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_USER_02'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["사용자ID", 	"사용자명"]
   			,searchInputFields		: ["USER_ID", 	"USER_NAME"]
   			,searchInputValues		: ["", 			searchText]
			,width					: '600px'
    		,height					: '400px'
   			,tableHeader			: ["사용자", 	"사용자명", 	"부서코드", 	"부서명"]
   			,tableColumnNames		: ["USER_ID", 	"USER_NAME",  	"DEPT_CODE", 	"DEPT_NAME"]
   			,tableColumnWidths		: ["100px", 	"100px", 		"100px", 		"200px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('SCH_TXTPAYEE_NAME', data.USER_NAME);
				SBUxMethod.set('SCH_TXTPAYEE_CODE', data.USER_ID);
			},
    	});
  	}    
    
    /**
     * 복수전표
     */
    function fn_multiDoc() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수전표');
    	SBUxMethod.openModal('modal-compopup3');
    	
    	compopup3({
    		height			: '400px'
    			,callbackEvent	: function (data){
    				console.log('callback data:', data);
    				pp_strDocList = "";
    				for (var i = 0; i < data.length; i++) {
    					pp_strDocList += data[i] + '|';
    				}
    				if(pp_strDocList){
    					pp_strDocList = pp_strDocList.slice(0, -1);
    					SBUxMethod.set('SCH_MULTI_YN', "Y");
    				} else {
    					SBUxMethod.set('SCH_MULTI_YN', "N");
    				}
    			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }  
    
    /**
     * 목록(Tab1) 가져오기
     */
    const fn_setTab1Grid = async function(wtype, doc_id) {
    	
    	tab1Fig2210Grid.clearStatus();

		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_fi_org_code
			,V_P_DOC_ID    			: doc_id
			,V_P_EMP_CODE     		: p_ss_empCode 
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig2210ItemQList.do", {
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

  	    		jsonTab1Fig2210.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
						ACCOUNT_CODE			: gfnma_nvl2(item.ACCOUNT_CODE),
						ACCOUNT_NAME			: gfnma_nvl2(item.ACCOUNT_NAME),
						ACC_CHARACTER			: gfnma_nvl2(item.ACC_CHARACTER),
						
						ACC_ITEM_CODE1			: gfnma_nvl2(item.ACC_ITEM_CODE1),
						ACC_ITEM_CODE2			: gfnma_nvl2(item.ACC_ITEM_CODE2),
						ACC_ITEM_CODE3			: gfnma_nvl2(item.ACC_ITEM_CODE3),
						ACC_ITEM_CODE4			: gfnma_nvl2(item.ACC_ITEM_CODE4),
						ACC_ITEM_CODE5			: gfnma_nvl2(item.ACC_ITEM_CODE5),
						ACC_ITEM_CODE6			: gfnma_nvl2(item.ACC_ITEM_CODE6),
						ACC_ITEM_CODE7			: gfnma_nvl2(item.ACC_ITEM_CODE7),
						ACC_ITEM_CODE8			: gfnma_nvl2(item.ACC_ITEM_CODE8),
						ACC_ITEM_CODE9			: gfnma_nvl2(item.ACC_ITEM_CODE9),
						ACC_ITEM_CODE10			: gfnma_nvl2(item.ACC_ITEM_CODE10),

						ACC_ITEM_NAME1			: gfnma_nvl2(item.ACC_ITEM_NAME1),
						ACC_ITEM_NAME2			: gfnma_nvl2(item.ACC_ITEM_NAME2),
						ACC_ITEM_NAME3			: gfnma_nvl2(item.ACC_ITEM_NAME3),
						ACC_ITEM_NAME4			: gfnma_nvl2(item.ACC_ITEM_NAME4),
						ACC_ITEM_NAME5			: gfnma_nvl2(item.ACC_ITEM_NAME5),
						ACC_ITEM_NAME6			: gfnma_nvl2(item.ACC_ITEM_NAME6),
						ACC_ITEM_NAME7			: gfnma_nvl2(item.ACC_ITEM_NAME7),
						ACC_ITEM_NAME8			: gfnma_nvl2(item.ACC_ITEM_NAME8),
						ACC_ITEM_NAME9			: gfnma_nvl2(item.ACC_ITEM_NAME9),
						ACC_ITEM_NAME10			: gfnma_nvl2(item.ACC_ITEM_NAME10),

						ACC_ITEM_VALUE1			: gfnma_nvl2(item.ACC_ITEM_VALUE1),
						ACC_ITEM_VALUE2			: gfnma_nvl2(item.ACC_ITEM_VALUE2),
						ACC_ITEM_VALUE3			: gfnma_nvl2(item.ACC_ITEM_VALUE3),
						ACC_ITEM_VALUE4			: gfnma_nvl2(item.ACC_ITEM_VALUE4),
						ACC_ITEM_VALUE5			: gfnma_nvl2(item.ACC_ITEM_VALUE5),
						ACC_ITEM_VALUE6			: gfnma_nvl2(item.ACC_ITEM_VALUE6),
						ACC_ITEM_VALUE7			: gfnma_nvl2(item.ACC_ITEM_VALUE7),
						ACC_ITEM_VALUE8			: gfnma_nvl2(item.ACC_ITEM_VALUE8),
						ACC_ITEM_VALUE9			: gfnma_nvl2(item.ACC_ITEM_VALUE9),
						ACC_ITEM_VALUE10		: gfnma_nvl2(item.ACC_ITEM_VALUE10),
						
						ACC_ITEM_YN1			: gfnma_nvl2(item.ACC_ITEM_YN1),
						ACC_ITEM_YN2			: gfnma_nvl2(item.ACC_ITEM_YN2),
						ACC_ITEM_YN3			: gfnma_nvl2(item.ACC_ITEM_YN3),
						ACC_ITEM_YN4			: gfnma_nvl2(item.ACC_ITEM_YN4),
						ACC_ITEM_YN5			: gfnma_nvl2(item.ACC_ITEM_YN5),
						ACC_ITEM_YN6			: gfnma_nvl2(item.ACC_ITEM_YN6),
						ACC_ITEM_YN7			: gfnma_nvl2(item.ACC_ITEM_YN7),
						ACC_ITEM_YN8			: gfnma_nvl2(item.ACC_ITEM_YN8),
						ACC_ITEM_YN9			: gfnma_nvl2(item.ACC_ITEM_YN9),
						ACC_ITEM_YN10			: gfnma_nvl2(item.ACC_ITEM_YN10),
						
						ACC_VALUE_NAME1			: gfnma_nvl2(item.ACC_VALUE_NAME1),
						ACC_VALUE_NAME2			: gfnma_nvl2(item.ACC_VALUE_NAME2),
						ACC_VALUE_NAME3			: gfnma_nvl2(item.ACC_VALUE_NAME3),
						ACC_VALUE_NAME4			: gfnma_nvl2(item.ACC_VALUE_NAME4),
						ACC_VALUE_NAME5			: gfnma_nvl2(item.ACC_VALUE_NAME5),
						ACC_VALUE_NAME6			: gfnma_nvl2(item.ACC_VALUE_NAME6),
						ACC_VALUE_NAME7			: gfnma_nvl2(item.ACC_VALUE_NAME7),
						ACC_VALUE_NAME8			: gfnma_nvl2(item.ACC_VALUE_NAME8),
						ACC_VALUE_NAME9			: gfnma_nvl2(item.ACC_VALUE_NAME9),
						ACC_VALUE_NAME10		: gfnma_nvl2(item.ACC_VALUE_NAME10),
						
						COST_CENTER_CODE		: gfnma_nvl2(item.COST_CENTER_CODE),
						COST_CENTER_NAME		: gfnma_nvl2(item.COST_CENTER_NAME),
						
						DATA_TYPE1				: gfnma_nvl2(item.DATA_TYPE1),
						DATA_TYPE2				: gfnma_nvl2(item.DATA_TYPE2),
						DATA_TYPE3				: gfnma_nvl2(item.DATA_TYPE3),
						DATA_TYPE4				: gfnma_nvl2(item.DATA_TYPE4),
						DATA_TYPE5				: gfnma_nvl2(item.DATA_TYPE5),
						DATA_TYPE6				: gfnma_nvl2(item.DATA_TYPE6),
						DATA_TYPE7				: gfnma_nvl2(item.DATA_TYPE7),
						DATA_TYPE8				: gfnma_nvl2(item.DATA_TYPE8),
						DATA_TYPE9				: gfnma_nvl2(item.DATA_TYPE9),
						DATA_TYPE10				: gfnma_nvl2(item.DATA_TYPE10),
						
						DEBIT_CREDIT			: gfnma_nvl2(item.DEBIT_CREDIT),
						DEBIT_CREDIT_NAME		: gfnma_nvl2(item.DEBIT_CREDIT_NAME),
						DEPT_CODE				: gfnma_nvl2(item.DEPT_CODE),
						DEPT_NAME				: gfnma_nvl2(item.DEPT_NAME),
						DESCRIPTION				: gfnma_nvl2(item.DESCRIPTION),
						DOC_ID					: gfnma_nvl2(item.DOC_ID),
						DOC_NAME				: gfnma_nvl2(item.DOC_NAME),
						DOC_STATUS				: gfnma_nvl2(item.DOC_STATUS),
						DOC_STATUS_NAME			: gfnma_nvl2(item.DOC_STATUS_NAME),
						
						DOC_TYPE				: gfnma_nvl2(item.DOC_TYPE),
						DOC_TYPE_NAME			: gfnma_nvl2(item.DOC_TYPE_NAME),
						FI_ORG_CODE				: gfnma_nvl2(item.FI_ORG_CODE),
						FUNCTIONAL_CR_AMT		: gfnma_nvl2(item.FUNCTIONAL_CR_AMT),
						FUNCTIONAL_DR_AMT		: gfnma_nvl2(item.FUNCTIONAL_DR_AMT),
						ITEM_CODE				: gfnma_nvl2(item.ITEM_CODE),
						ITEM_ID					: gfnma_nvl2(item.ITEM_ID),
						ITEM_SEQ				: gfnma_nvl2(item.ITEM_SEQ),
						KEY_ID					: gfnma_nvl2(item.KEY_ID),
						LINE_TYPE				: gfnma_nvl2(item.LINE_TYPE),
						LINE_TYPE_NAME			: gfnma_nvl2(item.LINE_TYPE_NAME),
						ORIGINAL_CR_AMT			: gfnma_nvl2(item.ORIGINAL_CR_AMT),
						ORIGINAL_DR_AMT			: gfnma_nvl2(item.ORIGINAL_DR_AMT),
						
						POPUP_ID1				: gfnma_nvl2(item.POPUP_ID1),
						POPUP_ID2				: gfnma_nvl2(item.POPUP_ID2),
						POPUP_ID3				: gfnma_nvl2(item.POPUP_ID3),
						POPUP_ID4				: gfnma_nvl2(item.POPUP_ID4),
						POPUP_ID5				: gfnma_nvl2(item.POPUP_ID5),
						POPUP_ID6				: gfnma_nvl2(item.POPUP_ID6),
						POPUP_ID7				: gfnma_nvl2(item.POPUP_ID7),
						POPUP_ID8				: gfnma_nvl2(item.POPUP_ID8),
						POPUP_ID9				: gfnma_nvl2(item.POPUP_ID9),
						POPUP_ID10				: gfnma_nvl2(item.POPUP_ID10),
						
						PROJECT_CODE			: gfnma_nvl2(item.PROJECT_CODE),
						TXN_QTY					: gfnma_nvl2(item.TXN_QTY),
						UOM						: gfnma_nvl2(item.UOM),
						VAT_NAME				: gfnma_nvl2(item.VAT_NAME),
						VAT_TYPE				: gfnma_nvl2(item.VAT_TYPE),
  					}
  					jsonTab1Fig2210.push(msg);
  					totalRecordCount ++;
  				});

  	        	tab1Fig2210Grid.rebuild();
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
     * 목록(Tab2) 가져오기
     */
    const fn_setTab2Grid = async function(wtype, doc_id) {
    	
    	tab2Fig2300Grid.clearStatus();

		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_acct_rule_code		= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_entry_date_fr			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_FR"));
		let p_entry_date_to			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_TO"));
		let p_site_code				= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_doc_type				= gfnma_nvl(SBUxMethod.get("SCH_DOC_TYPE"));
		let p_doc_status			= gfnma_nvl(SBUxMethod.get("SCH_DOC_STATUS"));
		let p_payee_dept			= gfnma_nvl(SBUxMethod.get("SCH_TXTPAYEE_DEPT_CODE"));
		let p_payee_code			= gfnma_nvl(SBUxMethod.get("SCH_TXTPAYEE_CODE"));
		let p_created_dept_code		= gfnma_nvl(SBUxMethod.get("SCH_TXTCREATED_DEPT_CODE"));
		let p_created_by_code		= gfnma_nvl(SBUxMethod.get("SCH_TXTCREATED_BY_CODE"));
		let p_reverse_flag			= gfnma_nvl(SBUxMethod.get("SCH_REVERSE_FLAG")['SCH_REVERSE_FLAG']);
		let p_hold_flag				= gfnma_nvl(SBUxMethod.get("SCH_HOLD_FLAG"));
		let p_appr_only_flag		= gfnma_nvl(SBUxMethod.get("SCH_APPR_ONLY_FLAG")['SCH_APPR_ONLY_FLAG']);
		let p_doc_name				= gfnma_nvl(SBUxMethod.get("SCH_DOC_NAME"));
		
		let p_multi_yn				= gfnma_nvl(SBUxMethod.get("SCH_MULTI_YN"));
		if(p_multi_yn=='N') {
			p_multi_yn = pp_strDocList;
		} else {
			p_multi_yn = '';
		}
		
		let p_doc_id		= doc_id;
		let p_desc			= gfnma_nvl(SBUxMethod.get("SCH_DESC"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_fi_org_code
			,V_P_ACCT_RULE_CODE     : p_acct_rule_code 
			,V_P_DOC_DATE           : p_entry_date_fr
			,V_P_SITE_CODE          : p_site_code
			,V_P_DOC_TYPE          	: p_doc_type
			,V_P_DOC_STATUS         : p_doc_status
			,V_P_PAYEE_DEPT         : p_payee_dept
			,V_P_PAYEE_CODE         : p_payee_code
			,V_P_CREATED_DEPT       : p_created_dept_code
			,V_P_CREATED_BY        	: p_created_by_code
			,V_P_ENTRY_DATE_FR      : p_entry_date_fr
			,V_P_ENTRY_DATE_TO      : p_entry_date_to
			,V_P_REVERSE_FLAG      	: p_reverse_flag
			,V_P_HOLD_FLAG      	: p_hold_flag
			,V_P_APPR_ONLY_FLAG    	: p_appr_only_flag
			,V_P_DOC_NAME    		: p_doc_name
			,V_P_DOC_NAME_D    		: p_multi_yn
			,V_P_DOC_ID    			: p_doc_id
			,V_P_DESC    			: p_desc
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig2300List.do", {
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

  	    		jsonTab2Fig2300.length = 0;
  	        	data.cv_2.forEach((item, index) => {
  					const msg = {
  						CURRENCY_CODE			: gfnma_nvl2(item.CURRENCY_CODE),
  						DOC_BATCH_NO			: gfnma_nvl2(item.DOC_BATCH_NO),
						DOC_ID					: gfnma_nvl2(item.DOC_ID),			
  						DOC_NAME				: gfnma_nvl2(item.DOC_NAME),
  						DOC_STATUS				: gfnma_nvl2(item.DOC_STATUS),
  						DOC_STATUS_NAME			: gfnma_nvl2(item.DOC_STATUS_NAME),
  						DOC_TYPE				: gfnma_nvl2(item.DOC_TYPE),
  						DOC_TYPE_NAME			: gfnma_nvl2(item.DOC_TYPE_NAME),
  						FUNCTIONAL_AMOUNT		: gfnma_nvl2(item.FUNCTIONAL_AMOUNT),
  						ORIGINAL_AMOUNT			: gfnma_nvl2(item.ORIGINAL_AMOUNT),
  						PAY_DATE				: gfnma_date5(gfnma_nvl2(item.PAY_DATE)),

  						ETC						: ''
  					}
  					jsonTab2Fig2300.push(msg);
  					totalRecordCount ++;
  				});

  	        	tab2Fig2300Grid.rebuild();
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
     * 목록(Tab3) 가져오기
     */
    const fn_setTab3Grid = async function(wtype, obj) {
    	
    	tab3Fim3420Grid.clearStatus();

		let p_appr_id	= !gfnma_nvl(obj['APPR_ID']) ? '0' : gfnma_nvl(obj['APPR_ID']);
    	
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_APPR_ID        	: p_appr_id						//'29430' 
			,V_P_SOURCE_NO     		: gfnma_nvl(obj['DOC_ID']) 		//'28'		
			,V_P_SOURCE_TYPE        : gfnma_nvl(obj['DOC_TYPE'])	//'AP'
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/ftr/tri/selectFim3420List.do", {
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

  	    		jsonTab3Fim3420.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						APPR_CATEGORY			: gfnma_nvl(item.APPR_CATEGORY),
  						APPR_CATEGORY_NAME		: gfnma_nvl(item.APPR_CATEGORY_NAME),
  						APPR_DATE				: gfnma_nvl(item.APPR_DATE),
  						APPR_ID					: gfnma_nvl(item.APPR_ID),
  						APPR_OPINION			: gfnma_nvl(item.APPR_OPINION),
  						APPR_STATUS				: gfnma_nvl(item.APPR_STATUS),
  						APPR_STATUS_NAME		: gfnma_nvl(item.APPR_STATUS_NAME),
  						APPR_TYPE				: gfnma_nvl(item.APPR_TYPE),
  						APPR_TYPE_NAME			: gfnma_nvl(item.APPR_TYPE_NAME),
  						DEPT_CODE				: gfnma_nvl(item.DEPT_CODE),
  						DEPT_NAME				: gfnma_nvl(item.DEPT_NAME),
  						DESCRIPTION				: gfnma_nvl(item.DESCRIPTION),
  						DUTY_CODE				: gfnma_nvl(item.DUTY_CODE),
  						DUTY_NAME				: gfnma_nvl(item.DUTY_NAME),
  						EMP_CODE				: gfnma_nvl(item.EMP_CODE),
  						EMP_NAME				: gfnma_nvl(item.EMP_NAME),
  						PROXY_EMP_CODE			: gfnma_nvl(item.PROXY_EMP_CODE),
  						PROXY_EMP_NAME			: gfnma_nvl(item.PROXY_EMP_NAME),
  						STEP_SEQ				: gfnma_nvl(item.STEP_SEQ),
  						UPDATE_EMP_NAME			: gfnma_nvl(item.UPDATE_EMP_NAME),
  						UPDATE_PC				: gfnma_nvl(item.UPDATE_PC),
  						UPDATE_TIME				: gfnma_nvl(item.UPDATE_TIME),
  						UPDATE_USERID			: gfnma_nvl(item.UPDATE_USERID),
  					}
  					jsonTab3Fim3420.push(msg);
  					totalRecordCount ++;
  				});

  	        	tab3Fim3420Grid.rebuild();
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
     * 전기+해제
     */
    var fn_btnAllComplete = function() {
    	
      	var p_strdoc_id		= '';
      	var chkList 		= Fig2300Grid.getUpdateData(true)
		for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i].data;
			if(obj['CHECK_YN']=='Y'){
				if(obj['DOC_ID']){
					p_strdoc_id += obj['DOC_ID'] + '|';
				}
			}
		}
		//console.log('p_strdoc_id:' , p_strdoc_id);      	 
      	if(!p_strdoc_id){
      		gfn_comAlert("E0000","전기+해체 할 전표를 선택하세요");
			return;      		 
      	}
      	p_strdoc_id = p_strdoc_id.slice(0, -1);
      	
		if(gfn_comConfirm("Q0001", "전기+해체")){
			fn_subDocProExit('END', p_strdoc_id, '1', function(){
				fn_subDocProExit('RELEASE', p_strdoc_id, '2');
			});
		}       	
  	}          
    
    /**
     * 전기처리, 전기취소, 전기+해제, 보류해제, 보류지정, 일괄삭제
     */
    const fn_subDocProExit = async function (wtype, p_strdoc_id, type, callbackFn){

		let p_cbofi_org_code	= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		if(!p_cbofi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		
  	    var paramObj = { 
 			V_P_DEBUG_MODE_YN			: ''
 			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
 			,V_P_FI_ORG_CODE			: p_cbofi_org_code
 			,V_P_ACCT_RULE_CODE			: p_ss_defaultAcctRule
 			,V_P_DOC_ID     			: p_strdoc_id
 			,V_P_HOLD_REASON			: ''
 			,V_P_UNPOSTING_TYPE			: pp_strunposting_type
 			,V_P_UNPOSTING_DATE			: pp_strunposting_date
 				
 			,V_P_FORM_ID				: p_formId
 			,V_P_MENU_ID				: p_menuId
 			,V_P_PROC_ID				: ''
 			,V_P_USERID					: p_userId
 			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2300S1.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(type=='1'){
	        		callbackFn();
        		} else {
              		alert(data.resultMessage);
        			cfn_search();
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
    }      
    
    /**
     * 보류해제
     */
    var fn_btnRelease = function() {
    	
      	var p_strdoc_id		= '';
      	var chkList 		= Fig2300Grid.getUpdateData(true)
		for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i].data;
			if(obj['CHECK_YN']=='Y'){
				if(obj['DOC_ID']){
					p_strdoc_id += obj['DOC_ID'] + '|';
				}
			}
		}
		//console.log('p_strdoc_id:' , p_strdoc_id);      	 
      	if(!p_strdoc_id){
      		gfn_comAlert("E0000","보류해체 할 전표를 선택하세요");
			return;      		 
      	}
      	p_strdoc_id = p_strdoc_id.slice(0, -1);
      	
		if(gfn_comConfirm("Q0001", "보류해체")){
			fn_subDocProExit('RELEASE', p_strdoc_id, '2');
		}       	
  	}           

    /**
     * 보류지정
     */
    var fn_btnUnRelease = function() {
    	
      	var p_strdoc_id		= '';
      	var chkList 		= Fig2300Grid.getUpdateData(true)
		for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i].data;
			if(obj['CHECK_YN']=='Y'){
				if(obj['DOC_ID']){
					p_strdoc_id += obj['DOC_ID'] + '|';
				}
			}
		}
		//console.log('p_strdoc_id:' , p_strdoc_id);      	 
      	if(!p_strdoc_id){
      		gfn_comAlert("E0000","보류지정 할 전표를 선택하세요");
			return;      		 
      	}
      	p_strdoc_id = p_strdoc_id.slice(0, -1);
      	
		if(gfn_comConfirm("Q0001", "보류지정")){
			fn_subDocProExit('UNRELEASE', p_strdoc_id, '2');
		}       	
  	}      
    
    /**
     * 세부내역
     */
    var fn_btnDetailView = function() {
    	//alert('매입송장등록 화면(매입전표작성) FIG3510_AP 으로 이동');
    	
        var nRow = Fig2300Grid.getRow();
		if (nRow < 1) {
            return;
		}
        let rowData = Fig2300Grid.getRowData(nRow);
		console.log(rowData);        
		
        var obj = {
            	'MENU_MOVE'			: 'Y'	
               	,'DOC_BATCH_NO'		: gfnma_nvl2(rowData['DOC_BATCH_NO'])
               	,'SOURCE_TYPE'		: gfnma_nvl2(rowData['SOURCE_TYPE'])
               	,'DOC_NUM'			: gfnma_nvl2(rowData['DOC_NUM'])
               	,'FI_ORG_CODE'		: gfnma_nvl2(rowData['FI_ORG_CODE'])
            	,'target'			: 'MA_A20_020_010_060'
        }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);
  	}       
    
    /**
     * 전기처리
     */
    var fn_btnEnd = function() {
    	
      	var p_strdoc_id	= '';
      	var chkList 		= Fig2300Grid.getUpdateData(true)
		//console.log(chkList);			
		for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i].data;
			if(obj['CHECK_YN']=='Y'){
				p_strdoc_id += obj['DOC_ID'] + '|';
			}
		}
      	 
      	if(!p_strdoc_id){
      		gfn_comAlert("E0000","전기처리 할 전표를 선택하세요");
			return;      		 
      	}
      	p_strdoc_id = p_strdoc_id.slice(0, -1);

		if(gfn_comConfirm("Q0001", "전기처리")){
	      	fn_subDocProcess('END', p_strdoc_id);
		}       	
  	}       
    
    
    /**
     * 전기처리 - 실행
     */
    const fn_subDocProcess = async function (wtype, p_strdoc_id){

		let p_cbofi_org_code	= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		if(!p_cbofi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		
  	    var paramObj = { 
 			V_P_DEBUG_MODE_YN			: ''
 			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
 			,V_P_FI_ORG_CODE			: p_cbofi_org_code
 			,V_P_ACCT_RULE_CODE			: p_ss_defaultAcctRule
 			,V_P_DOC_ID     			: p_strdoc_id
 			,V_P_HOLD_REASON			: ''
 			,V_P_UNPOSTING_TYPE			: pp_strunposting_type
 			,V_P_UNPOSTING_DATE			: pp_strunposting_date
 				
 			,V_P_FORM_ID				: p_formId
 			,V_P_MENU_ID				: p_menuId
 			,V_P_PROC_ID				: ''
 			,V_P_USERID					: p_userId
 			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2300S1.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        	} else {
          		alert(data.resultMessage);
        	}
       		cfn_search();
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }  
    }      
    
    
    /**
     * 전기취소
     */
    var fn_btnCancel = function() {
    	
    	var chk				= false;
      	var p_strdoc_id		= '';
      	var chkList 		= Fig2300Grid.getUpdateData(true)
		for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i].data;
			if(obj['CHECK_YN']=='Y'){
				if(obj['DOC_STATUS']=='6' && obj['DOC_ID']){
					p_strdoc_id += obj['DOC_ID'] + '|';
				} else {
					chk = true;
				}
			}
		}
		//console.log('p_strdoc_id:' , p_strdoc_id);      	 
		if(chk){
      		gfn_comAlert("E0000","전기취소는 승인완료된 것만 선택하세요");
			return;      		 
		}

      	if(!p_strdoc_id){
      		gfn_comAlert("E0000","전기취소 할 대상을 선택하세요");
			return;      		 
      	}
      	p_strdoc_id = p_strdoc_id.slice(0, -1);
      	fn_docCancelPop(p_strdoc_id);
  	}       
    
    /**
     * 전표전기취소 팝업
     */
    var fn_docCancelPop = function(p_strdoc_id) {
    	
		pp_strunposting_type = '';
		pp_strunposting_date = '';
		
    	SBUxMethod.attr('modal-compopup4', 'header-title', '전표전기취소');
    	compopup4({
    		param					: {}
			,callbackEvent			: function (data){
				console.log('callback data:', data);
				if(gfn_comConfirm("Q0001", "전기취소")){
					pp_strunposting_type = data['code'];
					pp_strunposting_date = data['date'];
			      	fn_subDocCancel(data['workType'], p_strdoc_id, data['code'], data['date']);
				}       	
			},
    	});
		SBUxMethod.openModal('modal-compopup4');
    }  
    
    /**
     * 전기취소 - 실행
     */
    const fn_subDocCancel = async function (wtype, p_strdoc_id, p_type, p_date){

		let p_cbofi_org_code	= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		if(!p_cbofi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		
  	    var paramObj = { 
 			V_P_DEBUG_MODE_YN			: ''
 			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
 			,V_P_FI_ORG_CODE			: p_cbofi_org_code
 			,V_P_ACCT_RULE_CODE			: p_ss_defaultAcctRule
 			,V_P_DOC_ID     			: p_strdoc_id
 			,V_P_HOLD_REASON			: ''
 			,V_P_UNPOSTING_TYPE			: p_type
 			,V_P_UNPOSTING_DATE			: p_date
 				
 			,V_P_FORM_ID				: p_formId
 			,V_P_MENU_ID				: p_menuId
 			,V_P_PROC_ID				: ''
 			,V_P_USERID					: p_userId
 			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2300S1.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        	} else {
          		alert(data.resultMessage);
        	}
       		cfn_search();
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }  
    }       
    
    /**
     * 일괄삭제
     */
    var fn_btnDelete = function() {
    	
      	var p_strdoc_id		= '';
      	var chkList 		= Fig2300Grid.getUpdateData(true)
		for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i].data;
			if(obj['CHECK_YN']=='Y'){
				p_strdoc_id += obj['DOC_ID'] + '|';
			}
		}
      	if(!p_strdoc_id){
      		gfn_comAlert("E0000","일괄삭제 할 전표를 선택하세요");
			return;      		 
      	}
      	p_strdoc_id = p_strdoc_id.slice(0, -1);
      	
		if(gfn_comConfirm("Q0001", "일괄삭제")){
			fn_subDocProExit('DELETE', p_strdoc_id, '2');
		}       	
  	}   
    
    /**
     * 일괄결재
     */
    var fn_AllAppr = function() {
    	
		let sp_appr_opinion	= gfnma_nvl(SBUxMethod.get("SCH_APPR_OPINION"));
    	
    	var chk1				= false;
    	var chk2				= false;
      	var p_strappr_id		= '';
      	var p_txtappr_opinion	= '';
      	var chkList 			= Fig2300Grid.getUpdateData(true)
		for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i].data;
			if(obj['CHECK_YN']=='Y'){
				if(obj['DOC_STATUS']=='3'){
					if(obj['CONFIRM_EMP_CODE'] == p_ss_empCode || obj['PROXY_EMP_CODE'] == p_ss_empCode){
						p_strappr_id 		+= obj['APPR_ID'] + '|';
						p_txtappr_opinion 	+= sp_appr_opinion + '|';
					} else {
						chk2 = true;
						break;
					}
				} else {
					chk1 = true;
					break;
				}
			}
		}
		//console.log('p_strappr_id:' , p_strappr_id);      	 
		if(chk1){
      		gfn_comAlert("E0000","일괄결재는 승인중 인 것만 선택하세요");
			return;      		 
		}
		if(chk2){
      		gfn_comAlert("E0000","로그인 사용자가 결재권자 혹은 수임권자인 경우 일괄결재를 할 수 있습니다.");
			return;      		 
		}
      	if(!p_strappr_id){
      		gfn_comAlert("E0000","일괄결재 할 전표를 선택하세요");
			return;      		 
      	}
      	p_strappr_id 		= p_strappr_id.slice(0, -1);
      	p_txtappr_opinion 	= p_txtappr_opinion.slice(0, -1);
      	
		if(gfn_comConfirm("Q0001", "일괄결재")){
			fn_subAllAppr('APPROVE', p_strappr_id, p_txtappr_opinion);
		}       	
  	}        
    
    /**
     * 일괄결재 - 실행
     */
    const fn_subAllAppr = async function (wtype, p_strappr_id, p_txtappr_opinion){

  	    var paramObj = { 
 			V_P_DEBUG_MODE_YN			: ''
 			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
 			,V_P_APPR_ID				: p_strappr_id
 			,V_P_APPR_OPINION			: p_txtappr_opinion
 				
 			,V_P_FORM_ID				: p_formId
 			,V_P_MENU_ID				: p_menuId
 			,V_P_PROC_ID				: ''
 			,V_P_USERID					: p_userId
 			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2200S2.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
	       		cfn_search();
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
     * 일괄반려
     */
    var fn_AllReturn = function() {
    	
		let sp_appr_opinion	= gfnma_nvl(SBUxMethod.get("SCH_APPR_OPINION"));
		if(!sp_appr_opinion){
      		gfn_comAlert("E0000","결재의견을 입력하세요");
			return;      		 
		}
    	
    	var chk1				= false;
    	var chk2				= false;
      	var p_strappr_id		= '';
      	var p_txtappr_opinion	= '';
      	var chkList 			= Fig2300Grid.getUpdateData(true)
		for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i].data;
			if(obj['CHECK_YN']=='Y'){
				if(obj['DOC_STATUS']=='3'){
					if(obj['CONFIRM_EMP_CODE'] == p_ss_empCode || obj['PROXY_EMP_CODE'] == p_ss_empCode){
						p_strappr_id 		+= obj['APPR_ID'] + '|';
						p_txtappr_opinion 	+= sp_appr_opinion + '|';
					} else {
						chk2 = true;
						break;
					}
				} else {
					chk1 = true;
					break;
				}
			}
		}
		console.log('p_strappr_id:' , p_strappr_id);      	 
		if(chk1){
      		gfn_comAlert("E0000","일괄반려는 승인중 인 것만 선택하세요");
			return;      		 
		}
		if(chk2){
      		gfn_comAlert("E0000","로그인 사용자가 결재권자 혹은 수임권자인 경우 일괄반려를 할 수 있습니다.");
			return;      		 
		}
      	if(!p_strappr_id){
      		gfn_comAlert("E0000","일괄반려 할 전표를 선택하세요");
			return;      		 
      	}
      	p_strappr_id 		= p_strappr_id.slice(0, -1);
      	p_txtappr_opinion 	= p_txtappr_opinion.slice(0, -1);
      	
		if(gfn_comConfirm("Q0001", "일괄반려")){
			fn_subAllAppr('REJECT', p_strappr_id, p_txtappr_opinion);
		}       	
  	}   
    
    /**
     * 그리드(미결반제전표내역) 전표번호 조회
     */
	function fn_gridPopup1(event, row, col) {
		event.preventDefault();	
		var rowData = Fig2300Grid.getRowData(row);
        console.log('fn_gridPopup1 rowData:', rowData);
        
        var obj = {
        	'MENU_MOVE'			: 'Y'	
        	,'DOC_ID' 			: rowData['DOC_ID']
        	,'DOC_NAME' 		: rowData['DOC_NAME']
        	,'DOC_BATCH_NO' 	: rowData['DOC_BATCH_NO']
        	,'DEPT_CODE' 		: rowData['DEPT_CODE']
        	,'DEPT_NAME' 		: rowData['DEPT_NAME']
        	,'SITE_CODE' 		: rowData['SITE_CODE']
        	,'DOC_TYPE' 		: rowData['DOC_TYPE']
        	,'DOC_STATUS' 		: rowData['DOC_STATUS']
        	,'CURRENCY_CODE' 	: rowData['CURRENCY_CODE']
        	,'DESCRIPTION' 		: rowData['DESCRIPTION']
        	,'DOC_DATE' 		: rowData['DOC_DATE']
        	,'POSTING_DATE' 	: rowData['POSTING_DATE']
        	,'ACCT_RULE_CODE'	: gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"))
        	,'WORK_TYPE'		: 'VIEW'
           	,'STATE' 			: 'edit'
        	,'target'			: 'MA_A20_030_020_160'
        }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);
	}
    
    /**
     * 그리드(회게처리탭) 전표번호 조회
     */
	function fn_gridPopup2(event, row, col) {
		event.preventDefault();	
    	var nRow 	= Fig2300Grid.getRow();
    	if(nRow<1){
    		return;
    	}
		var rowData = Fig2300Grid.getRowData(nRow);
        console.log('fn_gridPopup2 rowData:', rowData);
        
        var obj = {
        	'MENU_MOVE'			: 'Y'	
        	,'DOC_ID' 			: rowData['DOC_ID']
        	,'DOC_NAME' 		: rowData['DOC_NAME']
        	,'DOC_BATCH_NO' 	: rowData['DOC_BATCH_NO']
        	,'DEPT_CODE' 		: rowData['DEPT_CODE']
        	,'DEPT_NAME' 		: rowData['DEPT_NAME']
        	,'SITE_CODE' 		: rowData['SITE_CODE']
        	,'DOC_TYPE' 		: rowData['DOC_TYPE']
        	,'DOC_STATUS' 		: rowData['DOC_STATUS']
        	,'CURRENCY_CODE' 	: rowData['CURRENCY_CODE']
        	,'DESCRIPTION' 		: rowData['DESCRIPTION']
        	,'DOC_DATE' 		: rowData['DOC_DATE']
        	,'POSTING_DATE' 	: rowData['POSTING_DATE']
        	,'ACCT_RULE_CODE'	: gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"))
        	,'WORK_TYPE'		: 'VIEW'
           	,'STATE' 			: 'edit'
        	,'target'			: 'MA_A20_030_020_160'
        }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);
	}
    
    /**
     * 신규
     */
     var cfn_add = function() {
         var obj = {
             	'MENU_MOVE'		: 'Y'	
             	,'STATE' 		: 'new'
             	,'target'		: 'MA_A20_030_020_160'
        }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);
    }
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>