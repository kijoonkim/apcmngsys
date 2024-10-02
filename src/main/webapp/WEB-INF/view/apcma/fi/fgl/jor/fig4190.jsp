<%
/**
 * @Class Name 		: fig4190.jsp
 * @Description 	: 미결현황조회 화면
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
	<title>title : 미결현황조회</title>
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
                    </h3><!-- 미결현황조회 -->
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
	                                <sbux-select id="SCH_FI_ORG_CODE" name="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonfiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <th scope="row" class="th_bg">미결여부</th>
	                            <td colspan="3" class="td_input" >
									<p class="ad_input_row inpt_data_reqed">
										<sbux-radio id="SCH_END_BALANCE_TYPE1" name="SCH_END_BALANCE_TYPE" uitype="normal" value="A" class="radio_label" checked></sbux-radio>
										<label class="radio_label" for-id="SCH_END_BALANCE_TYPE1">전체</label>
									</p>
									<p class="ad_input_row inpt_data_reqed">
										<sbux-radio id="SCH_END_BALANCE_TYPE2" name="SCH_END_BALANCE_TYPE" uitype="normal" value="C" class="radio_label"></sbux-radio>
										<label class="radio_label" for-id="SCH_END_BALANCE_TYPE2">완료</label>
									</p>	                            
									<p class="ad_input_row inpt_data_reqed">
										<sbux-radio id="SCH_END_BALANCE_TYPE3" name="SCH_END_BALANCE_TYPE" uitype="normal" value="U" class="radio_label"></sbux-radio>
										<label class="radio_label" for-id="SCH_END_BALANCE_TYPE3">미결</label>
									</p>	                            
	                            </td>
	                            <th scope="row" class="th_bg">전표상태</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_DOC_STATUS" name="SCH_DOC_STATUS" uitype="single" jsondata-ref="jsonDocStatus" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <th scope="row" class="th_bg"></th>
	                            <td colspan="3" class="td_input" >
	                            </td>
	                        </tr>    
	                        <tr>
	                            <th scope="row" class="th_bg">전기일자</th>
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
	                            <th scope="row" class="th_bg">회계기준</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_ACCT_RULE_CODE" name="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <th scope="row" class="th_bg">미결관리대상</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_ACC_CHARACTER" name="SCH_ACC_CHARACTER" uitype="single" jsondata-ref="jsonAccCharacter" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <th scope="row" class="th_bg">전표유형</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_DOC_TYPE" name="SCH_DOC_TYPE" uitype="single" jsondata-ref="jsonDocType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        </tr>    
	                        <tr>
	                            <th scope="row" class="th_bg">계정과목</th>
	                            <td colspan="11" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px" id="SCH_ACCOUNT_CODE_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="SCH_BTN_ACCT_FR"
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
											id="SCH_BTN_ACCT_TO"
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
											id="SCH_BTN_MULTI_ACCOUNT"
											class="btn btn-xs btn-outline-dark"
											text="복수계정" 
											onclick="fn_multiAccount()"></sbux-button>
	   									<font style="width:5px"></font>
		                       			<sbux-checkbox 
		                       				id="SCH_GROUP_YBN" 
		                       				uitype="normal" 
		                       				text="외화평가보기" 
		                       				true-value="Y" 
		                       				false-value="N" ></sbux-checkbox>
									</div>
	                            </td>	                            
	                        </tr>
	                        
	                        <tr>
	                            <th scope="row" class="th_bg">거래처</th>
	                            <td colspan="11" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px"  id="SCH_CS_CODE_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="SCH_BTN_CS_FR"
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
											id="SCH_BTN_CS_TO"
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
											id="SCH_BTN_CS_MULTI"
											class="btn btn-xs btn-outline-dark"
											text="복수거래처" 
											onclick="fn_multiCs()"></sbux-button>
									</div>
	                            </td>
							</tr>
								 
	                        <tr>
	                            <th scope="row" class="th_bg">특수관계자여부</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_RELATED_YN" name="SCH_RELATED_YN" uitype="single" jsondata-ref="jsonRelatedYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <th scope="row" class="th_bg">특수관계자유형</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_RELATED_CS_TYPE" name="SCH_RELATED_CS_TYPE" uitype="single" jsondata-ref="jsonRelatedCsType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <th scope="row" class="th_bg"></th>
	                            <td colspan="3" class="td_input" >
	                            </td>
	                            <th scope="row" class="th_bg"></th>
	                            <td colspan="3" class="td_input" >
	                            </td>
	                        </tr>    
								                            
	                    </tbody>
	                </table>				
				</div>
                
                <div class="row">
                
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>미결현황</span>
	                            <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
						</div>
	                </div>
	                <div>
	                    <div id="SB_AREA_GRDTOP" style="height:440px; width:100%;">
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
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';
	
	var p_ss_defaultAcctRule 	= '${loginVO.maDefaultAcctRule}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	
	var p_menu_param			= null;	// 메뉴이동 파라미터
	//-----------------------------------------------------------
	
    var jsonfiOrgCode 		= []; // 회계단위
    var jsonDocStatus 		= []; // 전표상태
    var jsonAcctRuleCode 	= []; // 회계기준
    var jsonAccCharacter 	= []; // 미결관리대상
    var jsonDocType 		= []; // 전표유형
    var jsonRelatedYn 		= []; // 특수관계자여부
    var jsonRelatedCsType	= []; // 특수관계자유형
    
	var pp_strAccountCodeList	= ""; // 복수계정 파라미터
	var pp_strCsCodeList		= ""; // 복수거래처 파라미터
    
    var Fig4190Grid; 			// 그리드를 담기위한 객체 선언
    var jsonFig4190 = []; 		// 그리드의 참조 데이터 주소 선언
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 회계단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],		jsonfiOrgCode, 		'L_FIM022', 	'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 전표상태
            gfnma_setComSelect(['SCH_DOC_STATUS'],		jsonDocStatus, 		'L_FIG002_1', 	'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE'],	jsonAcctRuleCode, 	'L_FIM054', 	'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '2'),
            // 미결관리대상
            gfnma_setComSelect(['SCH_ACC_CHARACTER'],	jsonAccCharacter, 	'L_FIM033_01', 	'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표유형
            gfnma_setComSelect(['SCH_DOC_TYPE'],		jsonDocType, 		'L_FIM051', 	'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 특수관계자여부
            gfnma_setComSelect(['SCH_RELATED_YN'], 		jsonRelatedYn, 		'L_COM036', 	'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 특수관계자유형
            gfnma_setComSelect(['SCH_RELATED_CS_TYPE'], jsonRelatedCsType, 	'L_COM047', 	'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			
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
    	fn_createFig4190Grid();	
    	
    });

    /**
     * 화면 state 변경
     */
    function fn_state() {
		
    	//컴포넌트 기본속성
		SBUxMethod.hide("SCH_GROUP_YBN");
    	
		SBUxMethod.set("SCH_MULTI_YN", 		'N');
		SBUxMethod.set("SCH_MULTI_CS_YN", 	'N');
		SBUxMethod.set("SCH_GROUP_YBN", 	'N');
		SBUxMethod.set("SCH_DOC_STATUS", 	'2');
		
		SBUxMethod.set("SCH_FI_ORG_CODE", 		p_ss_fiOrgCode);
		SBUxMethod.set("SCH_END_BALANCE_TYPE", 	'U');
		SBUxMethod.set("SCH_ACCT_RULE_CODE", 	p_ss_defaultAcctRule);
		
		if(p_menu_param){
			if(p_menu_param['start_date']){
				SBUxMethod.set("SCH_ENTRY_DATE_FR", p_menu_param['start_date']);
			}
			if(p_menu_param['end_date']){
				SBUxMethod.set("SCH_ENTRY_DATE_TO", p_menu_param['end_date']);
			}
			if(p_menu_param['account_code']){
				SBUxMethod.set("SCH_ACCOUNT_CODE_FR", p_menu_param['account_code']);
			}
			if(p_menu_param['account_name']){
				SBUxMethod.set("SCH_ACCOUNT_NAME_FR", p_menu_param['account_name']);
			}
			if(p_menu_param['acct_rule_code']){
				SBUxMethod.set("SCH_ACCT_RULE_CODE", p_menu_param['acct_rule_code']);
			}
			fn_setFig4190Grid('Q');
		} else {
	        var dayfr	= '';
	        var dayto	= gfnma_date4();
	        dayfr		= dayto.substr(0,4) + '-01-01';
	        
			SBUxMethod.set('SCH_ENTRY_DATE_FR',	dayfr);
			SBUxMethod.set('SCH_ENTRY_DATE_TO', dayto);    	
		}
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
     * 복수계정 
     */
    function fn_multiAccount() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
    	SBUxMethod.openModal('modal-compopup3');
    	
    	compopup3({
    		height			: '400px'
    			,callbackEvent	: function (data){
    				console.log('callback data:', data);
    				pp_strAccountCodeList = data;
    				if(pp_strAccountCodeList){
    					pp_strAccountCodeList = pp_strAccountCodeList.slice(0, -1);
    					SBUxMethod.set('SCH_MULTI_YN', "Y");
    				} else {
    					SBUxMethod.set('SCH_MULTI_YN', "N");
    				}
    			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
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
    function fn_multiCs() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
    	SBUxMethod.openModal('modal-compopup3');
    	
    	compopup3({
    		height			: '400px'
    			,callbackEvent	: function (data){
    				console.log('callback data:', data);
    				pp_strCsCodeList = data;
    				if(pp_strCsCodeList){
    					SBUxMethod.set('SCH_MULTI_CS_YN', "Y");
    				} else {
    					SBUxMethod.set('SCH_MULTI_CS_YN', "N");
    				}
    			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }    
    
    function fn_createFig4190Grid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_AREA_GRDTOP';
	    SBGridProperties.id 				= 'Fig4190Grid';
	    SBGridProperties.jsonref 			= 'jsonFig4190';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.frozencols 		= 2;
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
                    sum : [20,21,22,28]
                },
                grandtotalrow : {
                    titlecol 		: 19,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["거래처코드"],				ref: 'CS_CODE', 				type:'output', 		width:'80px',  		style:'text-align:left'},
            {caption: ["계정코드"], 				ref: 'ACCT_NAME',    			type:'output',  	width:'250px', 		style:'text-align:left'},
            {caption: ["전표일자"],    				ref: 'DOC_DATE', 				type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["통화"],						ref: 'CURRENCY_CODE',			type:'output',  	width:'70px',  		style:'text-align:left'},
            {caption: ["증빙번호"], 				ref: 'VOUCHER_NO',    			type:'output',  	width:'250px', 		style:'text-align:left'},
            {caption: ["전표번호"],    				ref: 'DOC_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"],    					ref: 'ITEM_SEQ', 				type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["송장참조번호"], 			ref: 'ORIGIN_DOC_NAME', 		type:'output',  	width:'120px', 		style:'text-align:left'},
            {caption: ["반제전표번호"], 			ref: 'APPLY_DOC_NAME', 			type:'output',  	width:'120px', 		style:'text-align:left'},
            {caption: ["반제일"], 					ref: 'APPLY_DOC_DATE', 			type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["역분개전표"],				ref: 'REVERSE_DOC_NAME', 		type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["적요"],						ref: 'DESCRIPTION', 			type:'output',  	width:'300px', 		style:'text-align:left'},
            {caption: ["전표유형"],					ref: 'DOC_TYPE', 				type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["거래처명"], 				ref: 'CS_NAME', 				type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["미결"], 					ref: 'ACC_CHARACTER', 			type:'output',		width:'80px',  		style:'text-align:left'},
            {caption: ["계정과목"], 				ref: 'ACCOUNT_CODE', 			type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["계정과목명"], 				ref: 'ACCOUNT_NAME', 			type:'output',		width:'250px',  	style:'text-align:left'},
            {caption: ["차대"], 					ref: 'DEBIT_CREDIT_NAME', 		type:'output',		width:'80px',  		style:'text-align:left'},
            {caption: ["전표상태"], 				ref: 'DOC_STATUS_NAME',			type:'output',		width:'100px',  	style:'text-align:left'},
            
            {caption: ["차변(전표)"], 	   			ref: 'FUNCTIONAL_DR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대변(전표)"], 	   			ref: 'FUNCTIONAL_CR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["순금액(전표)"], 			ref: 'FUNCTIONAL_AMT', 			type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["차변(통화)"], 				ref: 'ORIGINAL_DR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대변(통화)"], 				ref: 'ORIGINAL_CR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["순금액(통화)"], 			ref: 'ORIGINAL_AMT', 			type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["평가일"],    				ref: 'VALUATION_DATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["평가환율"],    				ref: 'VAL_EXCHANGE_RATE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["평가금액"], 				ref: 'AFTER_VAL_AMOUNT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["당초환율"],    				ref: 'ORIGINAL_EXCHANGE_RATE', 	type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["당초금액"], 				ref: 'BEFORE_VAL_AMOUNT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["부가세유형"],  				ref: 'VAT_TYPE', 				type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["여신영역"],    				ref: 'CREDIT_AREA', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급기산일"],  				ref: 'EXPECTED_PAY_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급조건"],  				ref: 'PAY_TERM_NAME', 			type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["지급방법"],  				ref: 'PAY_METHOD_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["원가중심점"],  				ref: 'COST_CENTER_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["원가중심점명"], 			ref: 'COST_CENTER_NAME', 		type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["회계단위"],  				ref: 'FI_ORG_NAME', 			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["회계기준"],  				ref: 'ACCT_RULE_NAME', 			type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fig4190Grid = _SBGrid.create(SBGridProperties);
//        Fig4190Grid.bind('click', 'fn_viewFig4190GridEvent');
    }    
    
    /**
     * 목록 조회
     */
	function cfn_search() {
		fn_setFig4190Grid('Q');
	}
    
    /**
     * 목록 가져오기
     */
    const fn_setFig4190Grid = async function(wtype) {
    	
		Fig4190Grid.clearStatus();

		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_acct_rule_code		= gfnma_nvl(SBUxMethod.get("SCH_ACCT_RULE_CODE"));
		let p_doc_type				= gfnma_nvl(SBUxMethod.get("SCH_DOC_TYPE"));
		let p_entry_date_fr			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_FR"));
		let p_entry_date_to			= gfnma_nvl(SBUxMethod.get("SCH_ENTRY_DATE_TO"));
		
		let p_multi_yn				= gfnma_nvl(SBUxMethod.get("SCH_MULTI_YN"));
		let p_multi_yn_fr			= '';
		let p_multi_yn_to			= '';
		if(p_multi_yn=='N') {
			p_multi_yn_fr = gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_FR"));
			p_multi_yn_to = gfnma_nvl(SBUxMethod.get("SCH_ACCOUNT_CODE_TO"));
		} else {
			p_multi_yn_fr = '';	
			p_multi_yn_to = '';	
		}
		
		let p_multi_cs_yn			= gfnma_nvl(SBUxMethod.get("SCH_MULTI_CS_YN"));
		let p_multi_cs_yn_fr		= '';
		let p_multi_cs_yn_to		= '';
		if(p_multi_cs_yn=='N') {
			p_multi_cs_yn_fr = gfnma_nvl(SBUxMethod.get("SCH_CS_CODE_FR"));
			p_multi_cs_yn_to = gfnma_nvl(SBUxMethod.get("SCH_CS_CODE_TO"));
		} else {
			p_multi_cs_yn_fr = '';	
			p_multi_cs_yn_to = '';	
		}
		
		let p_end_balance_type 		= gfnma_nvl(SBUxMethod.get("SCH_END_BALANCE_TYPE"));
		let p_acc_character 		= gfnma_nvl(SBUxMethod.get("SCH_ACC_CHARACTER"));
		let p_doc_status	 		= gfnma_nvl(SBUxMethod.get("SCH_DOC_STATUS"));
		let p_related_yn 			= gfnma_nvl(SBUxMethod.get("SCH_RELATED_YN"));
		let p_related_cd_type		= gfnma_nvl(SBUxMethod.get("SCH_RELATED_CS_TYPE"));
		
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","회계단위를 선택하세요");
			return;      		 
		}
		if(!p_end_balance_type){
 			gfn_comAlert("E0000","미결여부를 선택하세요");
			return;      		 
		}
		if(!p_doc_status){
 			gfn_comAlert("E0000","전표상태를 선택하세요");
			return;      		 
		}
		if(!p_entry_date_fr || !p_entry_date_to){
 			gfn_comAlert("E0000","전기일자를 선택하세요");
			return;      		 
		}
		if(!p_acct_rule_code){
 			gfn_comAlert("E0000","회계기준을 선택하세요");
			return;      		 
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_fi_org_code
			,V_P_ACCT_RULE_CODE     : p_acct_rule_code 
			,V_P_DOC_TYPE           : p_doc_type
			,V_P_ENTRY_DATE_FR      : p_entry_date_fr
			,V_P_ENTRY_DATE_TO      : p_entry_date_to
			,V_P_ACCOUNT_CODE_FR    : p_multi_yn_fr
			,V_P_ACCOUNT_CODE_TO    : p_multi_yn_to
			,V_P_CS_CODE_FR    		: p_multi_cs_yn_fr
			,V_P_CS_CODE_TO    		: p_multi_cs_yn_to
			,V_P_ACCOUNT_CODE_D		: pp_strAccountCodeList
			,V_P_CS_CODE_D			: pp_strCsCodeList
			,V_P_END_BALANCE_TYPE	: p_end_balance_type
			,V_P_ACC_CHARACTER		: p_acc_character
			,V_P_FEVAL_YN			: 'N'
			,V_P_DOC_STATUS         : p_doc_status
			,V_P_RELATED_CS_YN      : p_related_yn
			,V_P_RELATED_CS_TYPE    : p_related_cd_type
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig4190List.do", {
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

  	        	jsonFig4190.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
						ACCOUNT_CODE			: gfnma_nvl(item.ACCOUNT_CODE),			
						ACCOUNT_NAME			: gfnma_nvl(item.ACCOUNT_NAME),	
						ACCT_NAME				: gfnma_nvl(item.ACCT_NAME),	
  						ACCT_RULE_CODE			: gfnma_nvl(item.ACCT_RULE_CODE),
  						ACCT_RULE_NAME			: gfnma_nvl(item.ACCT_RULE_NAME),
  						ACC_CHARACTER			: gfnma_nvl(item.ACC_CHARACTER),
						
  						ACC_ITEM_CODE1			: gfnma_nvl(item.ACC_ITEM_CODE1),
  						ACC_ITEM_CODE2			: gfnma_nvl(item.ACC_ITEM_CODE2),
  						ACC_ITEM_CODE3			: gfnma_nvl(item.ACC_ITEM_CODE3),
  						ACC_ITEM_CODE4			: gfnma_nvl(item.ACC_ITEM_CODE4),
  						ACC_ITEM_CODE5			: gfnma_nvl(item.ACC_ITEM_CODE5),
  						ACC_ITEM_CODE6			: gfnma_nvl(item.ACC_ITEM_CODE6),
  						ACC_ITEM_CODE7			: gfnma_nvl(item.ACC_ITEM_CODE7),
  						ACC_ITEM_CODE8			: gfnma_nvl(item.ACC_ITEM_CODE8),
  						ACC_ITEM_CODE9			: gfnma_nvl(item.ACC_ITEM_CODE9),
  						ACC_ITEM_CODE10			: gfnma_nvl(item.ACC_ITEM_CODE10),  						
  						
  						ACC_ITEM_VALUE1			: gfnma_nvl(item.ACC_ITEM_VALUE1),
  						ACC_ITEM_VALUE2			: gfnma_nvl(item.ACC_ITEM_VALUE2),
  						ACC_ITEM_VALUE3			: gfnma_nvl(item.ACC_ITEM_VALUE3),
  						ACC_ITEM_VALUE4			: gfnma_nvl(item.ACC_ITEM_VALUE4),
  						ACC_ITEM_VALUE5			: gfnma_nvl(item.ACC_ITEM_VALUE5),
  						ACC_ITEM_VALUE6			: gfnma_nvl(item.ACC_ITEM_VALUE6),
  						ACC_ITEM_VALUE7			: gfnma_nvl(item.ACC_ITEM_VALUE7),
  						ACC_ITEM_VALUE8			: gfnma_nvl(item.ACC_ITEM_VALUE8),
  						ACC_ITEM_VALUE9			: gfnma_nvl(item.ACC_ITEM_VALUE9),
  						ACC_ITEM_VALUE10		: gfnma_nvl(item.ACC_ITEM_VALUE10),
  						
  						ACC_VALUE_NAME1			: gfnma_nvl(item.ACC_VALUE_NAME1),
  						ACC_VALUE_NAME2			: gfnma_nvl(item.ACC_VALUE_NAME2),
  						ACC_VALUE_NAME3			: gfnma_nvl(item.ACC_VALUE_NAME3),
  						ACC_VALUE_NAME4			: gfnma_nvl(item.ACC_VALUE_NAME4),
  						ACC_VALUE_NAME5			: gfnma_nvl(item.ACC_VALUE_NAME5),
  						ACC_VALUE_NAME6			: gfnma_nvl(item.ACC_VALUE_NAME6),
  						ACC_VALUE_NAME7			: gfnma_nvl(item.ACC_VALUE_NAME7),
  						ACC_VALUE_NAME8			: gfnma_nvl(item.ACC_VALUE_NAME8),
  						ACC_VALUE_NAME9			: gfnma_nvl(item.ACC_VALUE_NAME9),
  						ACC_VALUE_NAME10		: gfnma_nvl(item.ACC_VALUE_NAME10),
  						
  						AFTER_VAL_AMOUNT		: gfnma_nvl(item.AFTER_VAL_AMOUNT),			
  						APPLY_COMPLETE_DATE		: gfnma_nvl(item.APPLY_COMPLETE_DATE),			
  						APPLY_COMPLETE_FLAG		: gfnma_nvl(item.APPLY_COMPLETE_FLAG),			
  						APPLY_DOC_DATE			: gfnma_nvl(item.APPLY_DOC_DATE),			
  						APPLY_DOC_ID			: gfnma_nvl(item.APPLY_DOC_ID),			
  						APPLY_DOC_NAME			: gfnma_nvl(item.APPLY_DOC_NAME),			
  						BANK_ACCOUNT_SEQ		: gfnma_nvl(item.BANK_ACCOUNT_SEQ),			
  						BEFORE_VAL_AMOUNT		: gfnma_nvl(item.BEFORE_VAL_AMOUNT),			
  						BILL_DUE_DATE			: gfnma_nvl(item.BILL_DUE_DATE),			
  						BILL_DUE_DAY			: gfnma_nvl(item.BILL_DUE_DAY),			
  						BILL_DUE_PAY_DATE		: gfnma_nvl(item.BILL_DUE_PAY_DATE),			
  						CARD_NO					: gfnma_nvl(item.CARD_NO),			
  						COST_CENTER_CODE		: gfnma_nvl(item.COST_CENTER_CODE),			
  						COST_CENTER_NAME		: gfnma_nvl(item.COST_CENTER_NAME),			
  						CREDIT_AREA				: gfnma_nvl(item.CREDIT_AREA),			
  						CS_CODE					: gfnma_nvl(item.CS_CODE),			
  						CS_NAME					: gfnma_nvl(item.CS_NAME),			
  						CURRENCY_CODE			: gfnma_nvl(item.CURRENCY_CODE),			
  						DEBIT_CREDIT			: gfnma_nvl(item.DEBIT_CREDIT),			
  						DEBIT_CREDIT_NAME		: gfnma_nvl(item.DEBIT_CREDIT_NAME),			
  						DEPT_CODE				: gfnma_nvl(item.DEPT_CODE),
  						DESCRIPTION				: gfnma_nvl(item.DESCRIPTION),
  						DOC_BATCH_NO			: gfnma_nvl(item.DOC_BATCH_NO),
  						DOC_DATE				: gfnma_date5(gfnma_nvl(item.DOC_DATE)),
  						DOC_ID					: gfnma_nvl(item.DOC_ID),
  						DOC_NAME				: gfnma_nvl(item.DOC_NAME),
  						DOC_STATUS				: gfnma_nvl(item.DOC_STATUS),
  						DOC_STATUS_NAME			: gfnma_nvl(item.DOC_STATUS_NAME),
  						DOC_TYPE				: gfnma_nvl(item.DOC_TYPE),
  						EXCHANGE_RATE			: gfnma_nvl(item.EXCHANGE_RATE),
  						EXPECTED_PAY_DATE		: gfnma_date5(gfnma_nvl(item.EXPECTED_PAY_DATE)),
  						FI_ORG_CODE				: gfnma_nvl(item.FI_ORG_CODE),
  						FI_ORG_NAME				: gfnma_nvl(item.FI_ORG_NAME),
  						FUNCTIONAL_AMT			: gfnma_nvl(item.FUNCTIONAL_AMT),
  						FUNCTIONAL_CR_AMT		: gfnma_nvl(item.FUNCTIONAL_CR_AMT),
  						FUNCTIONAL_DR_AMT		: gfnma_nvl(item.FUNCTIONAL_DR_AMT),
  						HOLD_DATE				: gfnma_nvl(item.HOLD_DATE),
  						HOLD_FLAG				: gfnma_nvl(item.HOLD_FLAG),
  						HOLD_REASON				: gfnma_nvl(item.HOLD_REASON),
  						HOLD_USER				: gfnma_nvl(item.HOLD_USER),
  						ITEM_CODE				: gfnma_nvl(item.ITEM_CODE),
  						ITEM_ID					: gfnma_nvl(item.ITEM_ID),
  						ITEM_SEQ				: gfnma_nvl(item.ITEM_SEQ),
  						ITEM_SOURCE_ID			: gfnma_nvl(item.ITEM_SOURCE_ID),
  						JL_AMOUNT				: gfnma_nvl(item.JL_AMOUNT),
  						LINE_TYPE				: gfnma_nvl(item.LINE_TYPE),
  						ORIGINAL_AMT			: gfnma_nvl(item.ORIGINAL_AMT),
  						ORIGINAL_CR_AMT			: gfnma_nvl(item.ORIGINAL_CR_AMT),
  						ORIGINAL_DR_AMT			: gfnma_nvl(item.ORIGINAL_DR_AMT),
  						ORIGINAL_EXCHANGE_RATE	: gfnma_nvl(item.ORIGINAL_EXCHANGE_RATE),
  						ORIGIN_DOC_ID			: gfnma_nvl(item.ORIGIN_DOC_ID),
  						ORIGIN_DOC_NAME			: gfnma_nvl(item.ORIGIN_DOC_NAME),
  						PAYEE_CODE				: gfnma_nvl(item.PAYEE_CODE),
  						PAY_BASE_DATE			: gfnma_nvl(item.PAY_BASE_DATE),
  						PAY_METHOD				: gfnma_nvl(item.PAY_METHOD),
  						PAY_METHOD_NAME			: gfnma_nvl(item.PAY_METHOD_NAME),
  						PAY_TERM_CODE			: gfnma_nvl(item.PAY_TERM_CODE),
  						PAY_TERM_NAME			: gfnma_nvl(item.PAY_TERM_NAME),
  						PAY_TERM_ORIG			: gfnma_nvl(item.PAY_TERM_ORIG),
  						PO_LINE_NO				: gfnma_nvl(item.PO_LINE_NO),
  						PROD_GROUP				: gfnma_nvl(item.PROD_GROUP),
  						PROJECT_CODE			: gfnma_nvl(item.PROJECT_CODE),
  						RELEASE_DATE			: gfnma_nvl(item.RELEASE_DATE),
  						RELEASE_USER			: gfnma_nvl(item.RELEASE_USER),
  						REVERSE_DOC_ID			: gfnma_nvl(item.REVERSE_DOC_ID),
  						REVERSE_DOC_NAME		: gfnma_nvl(item.REVERSE_DOC_NAME),
  						SALES_CS_CODE			: gfnma_nvl(item.SALES_CS_CODE),
  						SALES_PERSON			: gfnma_nvl(item.SALES_PERSON),
  						SITE_CODE				: gfnma_nvl(item.SITE_CODE),
  						SOURCE_TYPE				: gfnma_nvl(item.SOURCE_TYPE),
  						TXN_QTY					: gfnma_nvl(item.TXN_QTY),			
  						UOM						: gfnma_nvl(item.UOM),			
  						VALUATION_DATE			: gfnma_nvl(item.VALUATION_DATE),			
  						VAL_EXCHANGE_RATE		: gfnma_nvl(item.VAL_EXCHANGE_RATE),			
  						VAT_TYPE				: gfnma_nvl(item.VAT_TYPE),			
  						VOUCHER_NO				: gfnma_nvl(item.VOUCHER_NO),			
  						VOUCHER_NO1				: gfnma_nvl(item.VOUCHER_NO1),			
  						VOUCHER_RECEIPT_DATE	: gfnma_nvl(item.VOUCHER_RECEIPT_DATE),			
  						VOUCHER_TYPE			: gfnma_nvl(item.VOUCHER_TYPE),			
  						WITHHOLD_CS_CODE		: gfnma_nvl(item.WITHHOLD_CS_CODE),			
  						WITHHOLD_CS_CODE2		: gfnma_nvl(item.WITHHOLD_CS_CODE2),			
  						WITHHOLD_FLAG			: gfnma_nvl(item.WITHHOLD_FLAG),			
  						WITHHOLD_TAX_TYPE		: gfnma_nvl(item.WITHHOLD_TAX_TYPE),			
  						WITHHOLD_TAX_TYPE2		: gfnma_nvl(item.WITHHOLD_TAX_TYPE2),			
  					}
  					jsonFig4190.push(msg);
  					totalRecordCount ++;
  				});

        		Fig4190Grid.rebuild();
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
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>