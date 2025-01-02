<%
/**
 * @Class Name 		: fig4170.jsp
 * @Description 	: 거래처원장조회 화면
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
	<title>title : 거래처원장조회</title>
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
                    </h3><!-- 거래처원장조회 신규 -->
                </div>
                <div style="margin-left: auto;">
					<sbux-button class="btn btn-sm btn-outline-danger" text="출력" 				onclick="fn_print()"></sbux-button>
					<sbux-button class="btn btn-sm btn-outline-danger" text="엑셀다운" 			onclick="fn_excelDown()"></sbux-button>
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
                       		<!-- /hidden -->
                       		
	                    	<tr>
	                            <th scope="row" class="th_bg_search">APC</th>
	                            <td colspan="19" class="td_input" >
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
	                            
	                            <th scope="row" class="th_bg_search">사업장</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                    	
	                            <th scope="row" class="th_bg_search">년월</th>
	                            <td colspan="3" class="td_input" >
									<sbux-datepicker
									        id="SCH_YMDPERIOD_YYYYMM_P"
									        name="SCH_YMDPERIOD_YYYYMM_P"
									        uitype="popup"
									        datepicker-mode="month"
									        date-format="yyyy-mm"
									        class="form-control input-sm input-sm-ast table-datepicker-ma"
									        onchange = "fn_payDate">
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
 
	                            <th scope="row" class="th_bg_search">회계일자</th>
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
	                            
	                    	</tr>
	                    	
	                    	<tr>
	                            
	                            <th scope="row" class="th_bg_search">전표유형</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_DOC_TYPE" uitype="single" jsondata-ref="jsonDocType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                    	
	                            <th scope="row" class="th_bg_search">거래처</th>
	                            <td colspan="14" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px" placeholder="코드" id="SCH_CS_CODE_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="…" 
											onclick="fn_compopup2('1')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px" placeholder="거래처명"  id="SCH_CS_NAME_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
					                    <font>~</font>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:100px" placeholder="코드"  id="SCH_CS_CODE_TO" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="…" 
											onclick="fn_compopup2('2')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px" placeholder="거래처명"  id="SCH_CS_NAME_TO" uitype="text" class="form-control input-sm"></sbux-input>
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
	                    	<tr>
	                            <th scope="row" class="th_bg_search">미결여부</th>
	                            <td colspan="3" class="td_input" >
									<p class="ad_input_row ">
										<sbux-radio id="RDOEND_BALANCE_TYPE1" name="RDOEND_BALANCE_TYPE" uitype="normal" value="A" class="radio_label" checked></sbux-radio>
										<label class="radio_label" for-id="RDOEND_BALANCE_TYPE1">전체</label>
									</p>
									<p class="ad_input_row ">
										<sbux-radio id="RDOEND_BALANCE_TYPE2" name="RDOEND_BALANCE_TYPE" uitype="normal" value="C" class="radio_label"></sbux-radio>
										<label class="radio_label" for-id="RDOEND_BALANCE_TYPE2">완료</label>
									</p>
									<p class="ad_input_row ">
										<sbux-radio id="RDOEND_BALANCE_TYPE3" name="RDOEND_BALANCE_TYPE" uitype="normal" value="U" class="radio_label"></sbux-radio>
										<label class="radio_label" for-id="RDOEND_BALANCE_TYPE3">미결</label>
									</p>
	                            </td>
	                            <td></td>
	                    	
	                            <th scope="row" class="th_bg_search">계정과목</th>
	                            <td colspan="14" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px" placeholder="코드" id="SCH_ACCOUNT_CODE_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup1()"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px" placeholder="계정과목명"  id="SCH_ACCOUNT_NAME_FR" uitype="text" class="form-control input-sm"></sbux-input>
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
											text="복수선택" 
											onclick="fn_multiYn()"></sbux-button>
	   									<font style="width:10px"></font>
	   									<span style="padding-top:7px">
			                       			<sbux-checkbox 
			                       				id="SCH_GROUP_YN" 
			                       				uitype="normal" 
			                       				text="외화평가보기" 
			                       				true-value="Y" 
			                       				false-value="N" ></sbux-checkbox>
		                       			</span>	
	   									<font style="width:5px"></font>
	   									<span style="padding-top:7px">
			                       			<sbux-checkbox 
			                       				id="SCH_ALL_YN" 
			                       				uitype="normal" 
			                       				text="전체계졍" 
			                       				true-value="Y" 
			                       				false-value="N" ></sbux-checkbox>
		                       			</span>	
									</div>
	                            </td>
	                    	</tr>
								 
	                    	<tr>
	                    	
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
	                            
	                            <th scope="row" class="th_bg_search">전표번호</th>
	                            <td colspan="9" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:150px"  id="SCH_DOC_NAME_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
					                    <font>~</font>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:150px"  id="SCH_DOC_NAME_TO" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:10px"></font>
	   									<span style="padding-top:7px">
			                       			<sbux-checkbox 
			                       				id="SCH_MULTI_DOC_YN" 
			                       				uitype="normal" 
			                       				text="복수선택" 
			                       				true-value="Y" 
			                       				false-value="N" ></sbux-checkbox>
		   									<font style="width:10px"></font>
	   									</span>
	   									<font style="width:10px"></font>
										<sbux-button
											id="BTN_MULTI_DOC_YN"
											class="btn btn-xs btn-outline-dark"
											text="복수선택" 
											onclick="fn_multiDocYn()"></sbux-button>
	                            	</div>
	                            </td>
	                            
							</tr>
															                            
	                    </tbody>
	                </table>				
				</div>
                
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>거래처원장조회</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
                        </li>
                    </ul>
                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
					</div>
                </div>
				
                <div>
                    <div id="SB_AREA_GRDTOP" style="height:410px; width:100%;">
                    </div>
                </div>
                
               	<div style="display:flex;float:left;vertical-align:middle;padding-top:5px;width:100%">
 
 					<font style="width:300px"></font>
               		
               		<span style="padding-top:5px">
	                	<font style="font-size:12px">순금액(전표)</font>
               		</span>
					<font style="width:5px"></font>
					<sbux-input style="width:150px;text-align:right;"  id="TOT_1" uitype="text" class="form-control input-sm" readonly></sbux-input>
					<font style="width:10px"></font>
               	
               		<span style="padding-top:5px">
                		<font style="font-size:12px">순금액(통화)</font>
                	</span>
					<font style="width:5px"></font>
					<sbux-input style="width:150px;text-align:right;"  id="TOT_2" uitype="text" class="form-control input-sm" readonly></sbux-input>
					<font style="width:10px"></font>
               	
               		<span style="padding-top:5px">
	                	<font style="font-size:12px">평가금액</font>
	                </span>	
					<font style="width:5px"></font>
					<sbux-input style="width:150px;text-align:right;"  id="TOT_3" uitype="text" class="form-control input-sm" readonly></sbux-input>
					<font style="width:10px"></font>
               	
               		<span style="padding-top:5px">
	                	<font style="font-size:12px">당초금액</font>
	                </span>	
					<font style="width:5px"></font>
					<sbux-input style="width:150px;text-align:right;"  id="TOT_4" uitype="text" class="form-control input-sm" readonly></sbux-input>
					<font style="width:10px"></font>
					
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
	var p_ss_defaultAcctRule	= '${loginVO.maDefaultAcctRule}';
	var p_ss_deptCode			= '${loginVO.maDeptCode}';
	var p_ss_deptName			= '${loginVO.maDeptName}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	
	//grid 초기화
	var Fig4170Grid; 				// 그리드를 담기위한 객체 선언
	var jsonFig4170 		= []; 	// 그리드의 참조 데이터 주소 선언
 
	var jsonTempList 		= [];	// 저장할 임시 저장소
 
	var jsonFiOrgCode 		= []; 	// 사업단위
	var jsonSiteCode 		= []; 	// 사업장
	var jsonAcctRuleCode 	= []; 	// 회계기준
	var jsonDocType 		= []; 	// 전표유형
	var jsonRelatedYn 		= []; 	// 특수관계자여부
	var jsonRelatedCsType	= []; 	// 특수관계자유형
	
    var p_strAccountCodeList	= '';	//복수선택(계정과목)
    var p_strCsCodeList			= '';	//복수선택(거래처)
    var p_strDocYnList			= '';	//복수선택(전표번호)
	
    var p_menu_param			= null;
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],			jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACNTG_OGNZ_CD', 'ACNTG_OGNZ_NM', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE'], 			jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE'],		jsonAcctRuleCode, 	'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 전표유형
            gfnma_setComSelect(['SCH_DOC_TYPE'],			jsonDocType, 		'L_FIM051', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 특수관계자여부
            gfnma_setComSelect(['SCH_RELATED_YN'],			jsonRelatedYn, 		'L_COM036', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 특수관계자유형
            gfnma_setComSelect(['SCH_RELATED_CS_TYPE'],		jsonRelatedCsType,	'L_COM047', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
		]);
	}	
 
	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state();
  		fn_createFig4170Grid();
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
    	
		SBUxMethod.set("SCH_MULTI_CS_YN",		'N');
		SBUxMethod.set("SCH_MULTI_YN",			'N');
		SBUxMethod.set("SCH_MULTI_DOC_YN",		'N');
		SBUxMethod.set("SCH_GROUP_YN",			'N');
		
		SBUxMethod.set("SCH_FI_ORG_CODE", 		p_ss_fiOrgCode);
		SBUxMethod.set("RDOEND_BALANCE_TYPE",	'A');
		SBUxMethod.set("SCH_ACCT_RULE_CODE",	p_ss_defaultAcctRule);
		SBUxMethod.set("SCH_ALL_YN",			'Y');
		
    	if(p_menu_param){
    		if(p_menu_param['START_DATE']){
    			SBUxMethod.set("SCH_ENTRY_DATE_FR", 	p_menu_param['START_DATE']);
    		}
    		if(p_menu_param['END_DATE']){
    			SBUxMethod.set("SCH_ENTRY_DATE_TO", 	p_menu_param['END_DATE']);
    		}
    		if(p_menu_param['ACCOUNT_CODE']){
    			SBUxMethod.set("SCH_ACCOUNT_CODE_FR", 	p_menu_param['ACCOUNT_CODE']);
    		}
    		if(p_menu_param['ACCOUNT_NAME']){
    			SBUxMethod.set("SCH_ACCOUNT_NAME_FR", 	p_menu_param['ACCOUNT_NAME']);
    		}
    		if(p_menu_param['ACCT_RULE_CODE']){
    			SBUxMethod.set("SCH_ACCT_RULE_CODE", 	p_menu_param['ACCT_RULE_CODE']);
    		}
    	} else {
    		
        	//년월
    		SBUxMethod.set('SCH_YMDPERIOD_YYYYMM_P', gfnma_date().substr(0,4) + '-' + gfnma_date().substr(4,2));
            var yyyymm	= gfnma_nvl(SBUxMethod.get("SCH_YMDPERIOD_YYYYMM_P"));
            var sdate	= yyyymm.substr(0,4) + '-' + yyyymm.substr(4,2) + '-01';
            var edate	= gfnma_date3(yyyymm.substr(0,4), yyyymm.substr(4,2));
            
    		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		sdate);
    		SBUxMethod.set('SCH_ENTRY_DATE_TO', 		edate);
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
        if(!SBUxMethod.validateRequired({group_id: "schHeader"}) || !validateRequired("schHeader")) {        
            return false;
        }        
		fn_setFig4170Grid('Q');
	}
    
	function cfn_subSearch() {
		fn_setFig4170Grid('Q');
	}
    
    function fn_createFig4170Grid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_AREA_GRDTOP';
	    SBGridProperties.id 				= 'Fig4170Grid';
	    SBGridProperties.jsonref 			= 'jsonFig4170';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        //SBGridProperties.frozencols 		= 1;
	    SBGridProperties.tree = {
	            col: 0,
	            levelref: 'level',
	            open: true,
	            lock: true
	    },
        SBGridProperties.columns = [
            {caption: ["계정과목명"], 				ref: 'ACCOUNT_NAME', 			type:'output',		width:'250px',  	style:'text-align:left'},
            {caption: ["전표일자"],					ref: 'DOC_DATE', 				type:'output', 		width:'100px', 		style:'text-align:left'},
            {caption: ["전표유형"],					ref: 'DOC_TYPE', 				type:'output', 		width:'100px', 		style:'text-align:left'},
            
            //{caption: ["전표번호"],    			ref: 'DOC_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ['전표번호'], 				ref: 'link',    				type:'button',  	width:'100px', 		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['DOC_ID']){
		        		return "<a style='text-decoration: underline;cursor:pointer;color:#149fff' href='#' onClick='fn_gridPopup1(event, " + objRowData['DOC_ID'] + ")'>" + objRowData['DOC_NAME'] + "</a>";
            		} else {
            			return "";
            		}
            	}	
            },
            
            {caption: ["거래처코드"],				ref: 'CS_CODE', 				type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["거래처명"], 				ref: 'CS_NAME', 				type:'output',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["순금액(전표)"], 	 		ref: 'FUNCTIONAL_AMT', 			type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["순금액(통화)"], 			ref: 'ORIGINAL_AMT', 			type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["잔액(통화)"],	   			ref: 'ORIGINAL_BALANCE_AMT',	type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["잔액(전표)"], 	   			ref: 'FUNCTIONAL_BALANCE_AMT', 	type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["평가일"], 					ref: 'VALUATION_DATE', 			type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["평가환율"], 				ref: 'VAL_EXCHANGE_RATE', 		type:'output',		width:'100px',  	style:'text-align:left'},
            
            {caption: ["평가금액"], 	   			ref: 'AFTER_VAL_AMOUNT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},

            {caption: ["당초환율"], 				ref: 'ORIGINAL_EXCHANGE_RATE', 	type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["당초금액"], 				ref: 'BEFORE_VAL_AMOUNT', 		type:'output',		width:'100px',  	style:'text-align:left'},
            
            {caption: ["통화"],						ref: 'CURRENCY_CODE',			type:'output',  	width:'100px',  	style:'text-align:left'},

            {caption: ["원가중심점"], 				ref: 'COST_CENTER_CODE',		type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["원가중심점명"], 			ref: 'COST_CENTER_NAME',		type:'output',  	width:'150px', 		style:'text-align:left'},
            {caption: ["적요"],						ref: 'DESCRIPTION', 			type:'output',  	width:'300px', 		style:'text-align:left'},
            
            {caption: ["반제일"],  					ref: 'APPLY_DOC_DATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부가세유형"], 				ref: 'VAT_TYPE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["여신영역"], 				ref: 'CREDIT_AREA', 			type:'output',  	width:'100px',  	style:'text-align:left'},

            {caption: ["지급조건"], 				ref: 'PAY_TERM_CODE', 			type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["지급만기일"], 				ref: 'EXPECTED_PAY_DATE',		type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["지급방법"], 				ref: 'PAY_METHOD', 				type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["사업장"], 					ref: 'SITE_CODE', 				type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["작성자"], 					ref: 'INSERT_USER',				type:'output',		width:'150px',  	style:'text-align:left'},

        ];
 
        Fig4170Grid = _SBGrid.create(SBGridProperties);
//        Fig4170Grid.bind('click', 'fn_viewFig4170GridEvent');
    }        
    
    /**
     * 목록 가져오기
     */
    const fn_setFig4170Grid = async function(wtype) {
    	
		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_acct_rule_code		= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_doc_type				= gfnma_nvl(SBUxMethod.get("SCH_DOC_TYPE"));
		let p_entry_date_fr			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_FR"));
		let p_entry_date_to			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_TO"));
		
		//거래처
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
		
		//계정과목
		let p_account_code_fr		= gfnma_nvl(SBUxMethod.get("SCH_MULTI_YN")['SCH_MULTI_YN']);
		if(p_account_code_fr == 'N'){
			p_account_code_fr		= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_FR"));
		} else {
			p_account_code_fr		= p_strAccountCodeList;
		}
		
		//전표번호
		let p_doc_name_fr			= gfnma_nvl(SBUxMethod.get("SCH_DOC_NAME_FR"));
		let p_doc_name_to			= gfnma_nvl(SBUxMethod.get("SCH_DOC_NAME_TO"));
		let p_doc_name_d			= gfnma_nvl(SBUxMethod.get("SCH_MULTI_DOC_YN")['SCH_MULTI_DOC_YN']);
		if(p_doc_name_d == 'Y'){
			p_doc_name_d			= p_strDocYnList;
		} else {
			p_doc_name_d			= '';
		}
		
		let p_end_balance_type		= gfnma_nvl(SBUxMethod.get("RDOEND_BALANCE_TYPE"));
		let p_site_code				= gfnma_nvl(SBUxMethod.get("SCH_SITE_CODE"));
		let p_group_yn				= gfnma_nvl(SBUxMethod.get("SCH_GROUP_YN")['SCH_GROUP_YN']);
		let p_related_yn			= gfnma_nvl(SBUxMethod.get("SCH_RELATED_YN"));
		let p_related_cs_type		= gfnma_nvl(SBUxMethod.get("SCH_RELATED_CS_TYPE"));
		let p_all_yn				= gfnma_nvl(SBUxMethod.get("SCH_ALL_YN")['SCH_ALL_YN']);
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		
		if(!p_entry_date_fr ||  !p_entry_date_to){
 			gfn_comAlert("E0000","회계일자를 선택하세요");
			return;      		 
		}
		
// 		if(!gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_FR")) &&  !gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_TO"))){
//  			gfn_comAlert("E0000","계정과목을 선택하세요");
// 			return;      		 
// 		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_fi_org_code
			,V_P_ACCT_RULE_CODE     : p_acct_rule_code 
			,V_P_DOC_TYPE    		: p_doc_type
			,V_P_ENTRY_DATE_FR    	: p_entry_date_fr
			,V_P_ENTRY_DATE_TO    	: p_entry_date_to
 
			,V_P_CS_CODE_FR    		: p_cs_code_fr
			,V_P_CS_CODE_TO    		: p_cs_code_to
			,V_P_CS_CODE_D			: p_cs_code_d
			
			,V_P_ACCOUNT_CODE		: p_account_code_fr
			
			,V_P_DOC_NAME_FR    	: p_doc_name_fr
			,V_P_DOC_NAME_TO    	: p_doc_name_to
			,V_P_DOC_NAME_D			: p_doc_name_d
			
			,V_P_END_BALANCE_TYPE  	: p_end_balance_type
			,V_P_SITE_CODE     		: p_site_code
			,V_P_FEVAL_YN    		: p_group_yn
			,V_P_RELATED_CS_YN    	: p_related_yn
			,V_P_RELATED_CS_TYPE    : p_related_cs_type
			,V_P_ALL_YN    			: p_all_yn
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/leg/selectFig4170List.do", {
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
 
  	        	var list = [];
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
						ACCOUNT_CODE				: gfnma_nvl(item.ACNTL_CD),			
						ACCOUNT_NAME				: gfnma_nvl(item.ACNT_NM),			
						
						ACCT_NAME					: gfnma_nvl(item.ACCT_NAME),			
						ACCT_RULE_CODE				: gfnma_nvl(item.GAAP_CD),			
						ACCT_RULE_NAME				: gfnma_nvl(item.ACCT_RULE_NAME),			
						
						ACC_ITEM_CODE1				: gfnma_nvl(item.ACNT_MNG_ARTCL_CD1),		
						ACC_ITEM_CODE2				: gfnma_nvl(item.ACNT_MNG_ARTCL_CD2),		
						ACC_ITEM_CODE3				: gfnma_nvl(item.ACNT_MNG_ARTCL_CD3),		
						ACC_ITEM_CODE4				: gfnma_nvl(item.ACNT_MNG_ARTCL_CD4),		
						ACC_ITEM_CODE5				: gfnma_nvl(item.ACNT_MNG_ARTCL_CD5),		
						ACC_ITEM_CODE6				: gfnma_nvl(item.ACNT_MNG_ARTCL_CD6),		
						ACC_ITEM_CODE7				: gfnma_nvl(item.ACNT_MNG_ARTCL_CD7),		
						ACC_ITEM_CODE8				: gfnma_nvl(item.ACNT_MNG_ARTCL_CD8),		
						ACC_ITEM_CODE9				: gfnma_nvl(item.ACNT_MNG_ARTCL_CD9),		
						ACC_ITEM_CODE10				: gfnma_nvl(item.ACNT_MNG_ARTCL_CD10),		
 
						ACC_ITEM_VALUE1				: gfnma_nvl(item.ACNT_MNG_ARTCL_VL1),		
						ACC_ITEM_VALUE2				: gfnma_nvl(item.ACNT_MNG_ARTCL_VL2),		
						ACC_ITEM_VALUE3				: gfnma_nvl(item.ACNT_MNG_ARTCL_VL3),		
						ACC_ITEM_VALUE4				: gfnma_nvl(item.ACNT_MNG_ARTCL_VL4),		
						ACC_ITEM_VALUE5				: gfnma_nvl(item.ACNT_MNG_ARTCL_VL5),		
						ACC_ITEM_VALUE6				: gfnma_nvl(item.ACNT_MNG_ARTCL_VL6),		
						ACC_ITEM_VALUE7				: gfnma_nvl(item.ACNT_MNG_ARTCL_VL7),		
						ACC_ITEM_VALUE8				: gfnma_nvl(item.ACNT_MNG_ARTCL_VL8),		
						ACC_ITEM_VALUE9				: gfnma_nvl(item.ACNT_MNG_ARTCL_VL9),		
						ACC_ITEM_VALUE10			: gfnma_nvl(item.ACNT_MNG_ARTCL_VL10),		
 
						ACC_ITEM_VALUE_NAME1		: gfnma_nvl(item.ACNT_MNG_ARTCL_VL_NM1),		
						ACC_ITEM_VALUE_NAME2		: gfnma_nvl(item.ACNT_MNG_ARTCL_VL_NM2),		
						ACC_ITEM_VALUE_NAME3		: gfnma_nvl(item.ACNT_MNG_ARTCL_VL_NM3),		
						ACC_ITEM_VALUE_NAME4		: gfnma_nvl(item.ACNT_MNG_ARTCL_VL_NM4),		
						ACC_ITEM_VALUE_NAME5		: gfnma_nvl(item.ACNT_MNG_ARTCL_VL_NM5),		
						ACC_ITEM_VALUE_NAME6		: gfnma_nvl(item.ACNT_MNG_ARTCL_VL_NM6),		
						ACC_ITEM_VALUE_NAME7		: gfnma_nvl(item.ACNT_MNG_ARTCL_VL_NM7),		
						ACC_ITEM_VALUE_NAME8		: gfnma_nvl(item.ACNT_MNG_ARTCL_VL_NM8),		
						ACC_ITEM_VALUE_NAME9		: gfnma_nvl(item.ACNT_MNG_ARTCL_VL_NM9),		
						ACC_ITEM_VALUE_NAME10		: gfnma_nvl(item.ACNT_MNG_ARTCL_VL_NM10),		
						
						APPLY_DOC_DATE				: gfnma_nvl(item.APPLY_DOC_DATE),		
						APPLY_DOC_ID				: gfnma_nvl(item.APPLY_DOC_ID),		
						APPLY_DOC_NAME				: gfnma_nvl(item.APPLY_DOC_NAME),		
						BALANCE_SIDE				: gfnma_nvl(item.ACNT_BLNC_SE),		
						BANK_ACCOUNT_SEQ			: gfnma_nvl(item.BACNT_SEQ),		
						BATCH_NO					: gfnma_nvl(item.BTCH_NO),		
						
						BILL_DUE_DATE				: gfnma_date5(gfnma_nvl(item.PRMNT_MTRY_YMD)),			
						BILL_DUE_DAY				: gfnma_nvl(item.PRMNT_DCNT),			
						BILL_DUE_PAY_DATE			: gfnma_date5(gfnma_nvl(item.PRMNT_MTRY_PAY_YMD)),			
						BIZ_REGNO					: gfnma_nvl(item.BRNO),			
						CARD_NO						: gfnma_nvl(item.CARD_NO),			
						COST_CENTER_CODE			: gfnma_nvl(item.CSTCD_CD),			
						COST_CENTER_NAME			: gfnma_nvl(item.CSTCD_NM),			
						CREDIT_AREA					: gfnma_nvl(item.CRDT_SECT),			
						CS_CODE						: gfnma_nvl(item.CNPT_CD),
						CS_NAME						: gfnma_nvl(item.CNPT_NM),
 
						CURRENCY_CODE				: gfnma_nvl(item.CRN_CD),
						DEPT_CODE					: gfnma_nvl(item.DEPT_CD),
						DEPT_NAME					: gfnma_nvl(item.DEPT_NM),
						DESCRIPTION					: gfnma_nvl(item.DSCTN),
						DOC_DATE					: gfnma_nvl(item.SLIP_YMD),
						DOC_ID						: gfnma_nvl(item.SLIP_ID),
						DOC_NAME					: gfnma_nvl(item.SLIP_NM),
						DOC_STATUS					: gfnma_nvl(item.SLIP_STTS),
						DOC_STATUS_NAME				: gfnma_nvl(item.DOC_STATUS_NAME),
						DOC_TYPE					: gfnma_nvl(item.SLIP_TYPE),
						DOC_TYPE_NAME				: gfnma_nvl(item.DOC_TYPE_NAME),
 
						EXCHANGE_RATE				: gfnma_nvl(item.EXCHRT),
						EXPECTED_PAY_DATE			: gfnma_nvl(item.PAY_PRNMNT_YMD),
						FI_ORG_CODE					: gfnma_nvl(item.ACNTG_OGNZ_CD),
						FI_ORG_NAME					: gfnma_nvl(item.ACNTG_OGNZ_NM),
						
						FUNCTIONAL_AMT				: gfnma_nvl(item.CNVS_AMT),		
						FUNCTIONAL_BALANCE_AMT		: gfnma_nvl(item.CNVS_BLNC_AMT),		
						FUNCTIONAL_BALANCE_AMT2		: gfnma_nvl(item.CNVS_BLNC_AMT2),		
						FUNCTIONAL_CR_AMT			: gfnma_nvl(item.CNVS_CRSD_AMT),		
						FUNCTIONAL_DR_AMT			: gfnma_nvl(item.CNVS_DRSD_AMT),		
						
						HOLD_DATE					: gfnma_date5(gfnma_nvl(item.HLDOF_YMD)),
						HOLD_FLAG					: gfnma_nvl(item.HLDOF_FLAG),
						HOLD_REASON					: gfnma_nvl(item.HLDOF_RSN),
						HOLD_USER					: gfnma_nvl(item.HLDOF_USER),
						
						INSERT_USERNAME				: gfnma_nvl(item.WRT_USER_NM),
						ITEM_ID						: gfnma_nvl(item.ITEM_ID),
						ITEM_NAME					: gfnma_nvl(item.ITEM_NM),
						ITEM_SEQ					: gfnma_nvl(item.ITEM_SEQ),
						ITEM_SOURCE_ID				: gfnma_nvl(item.ITEM_SRC_ID),
						LINE_TYPE					: gfnma_nvl(item.LINE_TYPE),
						
						ORIGINAL_AMT				: gfnma_nvl(item.ORIGINAL_AMT),		
						ORIGINAL_BALANCE_AMT		: gfnma_nvl(item.ORGNL_BLNC_AMT),		
						ORIGINAL_BALANCE_AMT2		: gfnma_nvl(item.ORGNL_BLNC_AMT2),		
						ORIGINAL_CR_AMT				: gfnma_nvl(item.ORGNL_CRSD_AMT),		
						ORIGINAL_DR_AMT				: gfnma_nvl(item.ORGNL_DRSD_AMT),		
						
						PAYEE_CODE					: gfnma_nvl(item.RCPNT_CD),
						PAY_BASE_DATE				: gfnma_date5(gfnma_nvl(item.PAY_RCK_YMD)),
						PAY_DOC_DATE				: gfnma_nvl(item.PAY_DOC_DATE),
						PAY_DOC_NAME				: gfnma_nvl(item.PAY_DOC_NAME),
						PAY_METHOD					: gfnma_nvl(item.PAY_MTHD),
						PAY_TERM_CODE				: gfnma_nvl(item.PAY_TERM_CD),
						PAY_TERM_ORIG				: gfnma_nvl(item.PAY_TERM_FRST),
						PERIOD_CODE					: gfnma_nvl(item.PRD_CD),
						PO_LINE_NO					: gfnma_nvl(item.PORDR_LINE_NO),
						PROD_GROUP					: gfnma_nvl(item.PRDCT_GRP),
						PROJECT_CODE				: gfnma_nvl(item.PJT_CD),
						PROJECT_NAME				: gfnma_nvl(item.PJT_NM),
						RELEASE_DATE				: gfnma_date5(gfnma_nvl(item.RLS_YMD)),
						RELEASE_USER				: gfnma_nvl(item.RMV_USER),
						ROW_TYPE					: gfnma_nvl(item.ROW_TYPE),
						SALES_CS_CODE				: gfnma_nvl(item.SLL_CNPT_CD),
						SALES_PERSON				: gfnma_nvl(item.SALS_EMP),
						SEQ							: gfnma_nvl(item.SEQ),
						SITE_CODE					: gfnma_nvl(item.SITE_CD),
						SITE_NAME					: gfnma_nvl(item.SITE_NM),
						
						SOURCE_ID					: gfnma_nvl(item.SRC_ID),
						SOURCE_JUNPYO_ID			: gfnma_nvl(item.SOURCE_JUNPYO_ID),
						SOURCE_JUNPYO_NO			: gfnma_nvl(item.SOURCE_JUNPYO_NO),
						SOURCE_TYPE					: gfnma_nvl(item.SRC_TYPE),
						TXN_QTY						: gfnma_nvl(item.TRSC_QTY),
						UOM							: gfnma_nvl(item.UNIT),
						VAT_TYPE					: gfnma_nvl(item.VAT_TYPE),
						
						VOUCHER_NO					: gfnma_nvl(item.EVDNC_NO),
						VOUCHER_NO1					: gfnma_nvl(item.EVDNC_NO1),
						VOUCHER_RECEIPT_DATE		: gfnma_nvl(item.EVDNC_RCPT_YMD),
						VOUCHER_TYPE				: gfnma_nvl(item.EVDNC_TYPE),
						
						WITHHOLD_CS_CODE			: gfnma_nvl(item.WTHD_CNPT_CD),		
						WITHHOLD_CS_CODE2			: gfnma_nvl(item.WTHD_CNPT_CD2),		
						WITHHOLD_FLAG				: gfnma_nvl(item.WTHD_FLAG),		
						WITHHOLD_TAX_TYPE			: gfnma_nvl(item.WTHD_TX_TYPE),		
						WITHHOLD_TAX_TYPE2			: gfnma_nvl(item.WTHD_TX_TYPE2),		
						
						WRITE_DEPT_NAME				: gfnma_nvl(item.WRT_DEPT_NM),		
  					}
  					list.push(msg);
  					totalRecordCount ++;
  				});
				
  	        	fn_convertData(list);
        		Fig4170Grid.rebuild();
  	        	fn_setStyleGrid();
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
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#srchArea1');
    }    
    
    /**
     * 계정과목 
     */
    function fn_compopup1(type) {
    	
        var searchText1 	= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_FR"));
        var searchText2 	= gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_NAME_FR"));
        
        var replaceText0 	= "_ACNTL_CD_";
        var replaceText1 	= "_ACNT_NM_";
        var strWhereClause 	= "AND ACNTL_CD LIKE '%" + replaceText0 + "%' AND ACNT_NM LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정과목');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FIM042_1'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
    		,searchCaptions			: ["계정코드", 		"계정명"]
    		,searchInputFields		: ["ACNTL_CD", 	"ACNT_NM"]
    		,searchInputValues		: [searchText1, 	searchText2]
    		,height					: '400px'
    		,tableHeader			: ["계정코드", 		"계정명"]
    		,tableColumnNames		: ["ACNTL_CD", 	"ACNT_NM"]
    		,tableColumnWidths		: ["100px", 		"200px"]
    		,itemSelectEvent		: function (data){
    			console.log('callback data:', data);
   				SBUxMethod.set('SCH_ACCOUNT_CODE_FR', data.ACNTL_CD);
   				SBUxMethod.set('SCH_ACCOUNT_NAME_FR', data.ACNT_NM);
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
        
        if(!searchText1 && !searchText2){
 			gfn_comAlert("E0000", "거래처코드를 모르시는경우 거래처명을 2개단어 이상 입력해야 합니다.");
 			return;
        }
        
        var replaceText0 	= "_CNPT_CD_";
        var replaceText1 	= "_CNPT_NM_";
        var replaceText2 	= "_BRNO_";
        var strWhereClause 	= "AND a.CNPT_CD LIKE '%" + replaceText0 + "%' AND a.CNPT_NM LIKE '%" + replaceText1 + "%' AND a.BRNO LIKE '%"+ replaceText2 + "%'";
 
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처정보');
    	compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM004'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드", 	"거래처명",  	"사업자번호" ]
            ,searchInputFields		: ["CNPT_CD", 		"CNPT_NM",  	"BRNO"]
            ,searchInputValues		: [searchText1, 	searchText2, 	""         ]
            ,height					: '400px'
            ,width					: '1000px'
            ,tableHeader			: ["거래처코드",	"거래처명", 	"사업자번호" , 	"대표자",		"업태",			"종목",			"주소",		"전화",		"팩스"]
            ,tableColumnNames		: ["CNPT_CD", 		"CNPT_NM", 		"BRNO", 	"CEO_NM",	"BZSTAT",	"TPBIZ",	"ADDR",	"TELNO",		"FX_NO"]
            ,tableColumnWidths		: ["100px", 		"200px", 		"100px", 		"100px",		"100px",		"150px",		"400px",	"120px",	"120px"]
    		,itemSelectEvent		: function (data){
    			console.log('callback data:', data);
    			if(type=='1'){
    				SBUxMethod.set('SCH_CS_CODE_FR', data.CNPT_CD);
    				SBUxMethod.set('SCH_CS_NAME_FR', data.CNPT_NM);
    			} else {
    				SBUxMethod.set('SCH_CS_CODE_TO', data.CNPT_CD);
    				SBUxMethod.set('SCH_CS_NAME_TO', data.CNPT_NM);
    			}
    		},
    	});
		SBUxMethod.openModal('modal-compopup1');
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
     * 복수전표번호 팝업
     */
    var fn_multiDocYn = function() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수거래처');
		SBUxMethod.openModal('modal-compopup3');
		
    	compopup3({
    		height			: '400px'
    		,separator		: '|'
   			,callbackEvent	: function (data){
   				console.log('callback data:', data);
   				p_strDocYnList = data;
				if(p_strDocYnList){
					SBUxMethod.set('SCH_MULTI_DOC_YN', "Y");
				} else {
					SBUxMethod.set('SCH_MULTI_DOC_YN', "N");
				}
   			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
  	}  
    
    /**
     * 엑셀다운
     */
    var fn_excelDown = function() {
	    Fig4170Grid.exportData('xlsx', '거래처원장조회', true, {sheetName: '거래처원장조회'});
  	}       
    
    /**
     * 트리구조로 변경
     */
    var fn_convertData = function(list) {
      	
    	jsonFig4170.length = 0;
 
    	//계정과목 타이틀 추출
    	var tlist = [];      	
      	var acode = null;      	
      	var gtot1 = 0;
      	var gtot2 = 0;
      	var gtot3 = 0;
      	var gtot4 = 0;
      	
      	for (var i = 0; i < list.length; i++) {
      		var obj = list[i];
      		if(obj['ACCOUNT_CODE']!=acode){
	      		tlist.push(obj['ACCOUNT_CODE'] + '|' + '계정과목:' + obj['ACCOUNT_CODE']);
	      		acode = obj['ACCOUNT_CODE'];
      		}
      		gtot1 += Number(gfnma_nvl(obj['FUNCTIONAL_AMT']));
      		gtot2 += Number(gfnma_nvl(obj['ORIGINAL_AMT']));
      		gtot3 += Number(gfnma_nvl(obj['AFTER_VAL_AMOUNT']));
      		gtot4 += Number(gfnma_nvl(obj['BEFORE_VAL_AMOUNT']));
      	}
		SBUxMethod.set('TOT_1', gfnma_getThreeComma(parseInt(gtot1)));
		SBUxMethod.set('TOT_2', gfnma_getThreeComma(parseInt(gtot2)));
		SBUxMethod.set('TOT_3', gfnma_getThreeComma(parseInt(gtot3)));
		SBUxMethod.set('TOT_4', gfnma_getThreeComma(parseInt(gtot4)));
 
      	
      	//계정코드별 분류작업
      	var stot  = 0;
      	var chk   = null;
      	for (var i = 0; i < tlist.length; i++) {
      		var tmp = tlist[i].split('|');
      		jsonFig4170.push({
      			'level'			: 1
      			,'tot_type'		: 'A'
      			,'ACCOUNT_NAME'	: tmp[1]
      		});
      		chk  = false;
      		stot = 0;
      		for (var j = 0; j < list.length; j++) {
      			var dobj = list[j];
      			if(dobj['ACCOUNT_CODE']==tmp[0]){
      				dobj['level'] 		= 2;
      				dobj['tot_type'] 	= 'A';
      				jsonFig4170.push(dobj);
      				chk = true;
      				stot += Number(dobj['FUNCTIONAL_AMT']);
      			}
      		}
      		if(chk){
          		jsonFig4170.push({
          			'level'				: 2
          			,'tot_type'			: 'B'
          			,'FUNCTIONAL_AMT'	: stot
          		});
      		}
      	}
      	//console.log('jsonFig4170', jsonFig4170);      	
  	}       
    
    /**
     * 합계, 누계 색상
     */
    var fn_setStyleGrid = function() {
      	
    	let allDatas = Fig4170Grid.getGridDataAll()
      	for (var i = 0; i < allDatas.length; i++) {
      		var obj = allDatas[i];
      		if(obj['tot_type']=='B'){
      			Fig4170Grid.setRowStyle(i+1, 'data', 'background', 	'#d4f1da');
      			Fig4170Grid.setRowStyle(i+1, 'data', 'font-weight', 'bold');
      		}
      	}
    	Fig4170Grid.clearSelection();
  	}       
    
    /**
     * 1일
     */
    var fn_dateDay1 = function() {
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		gfnma_date4());
		SBUxMethod.set('SCH_ENTRY_DATE_TO', 		gfnma_date4());
		cfn_subSearch();
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
		cfn_subSearch();
  	}       
    
    /**
     * 1개월
     */
    var fn_dateMonth1 = function() {
    	var ddate = SBUxMethod.get('SCH_ENTRY_DATE_TO');
    	ddate = ddate.substr(0,4) + '-' + ddate.substr(4,2) + '-01'; 
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		ddate);
		cfn_subSearch();
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
		cfn_subSearch();
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
		cfn_subSearch();
  	}       
    
    /**
     * 1년
     */
    var fn_dateYear1 = function() {
    	var ddate = SBUxMethod.get('SCH_ENTRY_DATE_TO');
    	ddate = ddate.substr(0,4) + '-01-01'; 
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		ddate);
		cfn_subSearch();
  	}       
    
    /**
     * 전체
     */
    var fn_dateAll = function() {
    	var ddate = SBUxMethod.get('SCH_ENTRY_DATE_TO');
    	ddate = ddate.substr(0,4) + '-01-01'; 
		SBUxMethod.set('SCH_ENTRY_DATE_FR', 		ddate);
		cfn_subSearch();
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
