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
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_FI_ORG_CODE" name="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonfiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">미결여부</th>
	                            <td colspan="3" class="td_input" >
									<p class="ad_input_row ">
										<sbux-radio id="SCH_END_BALANCE_TYPE1" name="SCH_END_BALANCE_TYPE" uitype="normal" value="A" class="radio_label" checked></sbux-radio>
										<label class="radio_label" for-id="SCH_END_BALANCE_TYPE1">전체</label>
									</p>
									<p class="ad_input_row ">
										<sbux-radio id="SCH_END_BALANCE_TYPE2" name="SCH_END_BALANCE_TYPE" uitype="normal" value="C" class="radio_label"></sbux-radio>
										<label class="radio_label" for-id="SCH_END_BALANCE_TYPE2">완료</label>
									</p>	                            
									<p class="ad_input_row ">
										<sbux-radio id="SCH_END_BALANCE_TYPE3" name="SCH_END_BALANCE_TYPE" uitype="normal" value="U" class="radio_label"></sbux-radio>
										<label class="radio_label" for-id="SCH_END_BALANCE_TYPE3">미결</label>
									</p>	                            
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">전표상태</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_DOC_STATUS" name="SCH_DOC_STATUS" uitype="single" jsondata-ref="jsonDocStatus" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search"></th>
	                            <td colspan="3" class="td_input" >
	                            </td>
	                            <td></td>
	                            
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg_search">전기일자</th>
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
	                                <sbux-select id="SCH_ACCT_RULE_CODE" name="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed"
										group-id="frmBody" 
										required                                       
	                                ></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">미결관리대상</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_ACC_CHARACTER" name="SCH_ACC_CHARACTER" uitype="single" jsondata-ref="jsonAccCharacter" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">전표유형</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_DOC_TYPE" name="SCH_DOC_TYPE" uitype="single" jsondata-ref="jsonDocType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                        </tr>    
	                        
	                        <tr>
	                        
	                            <th scope="row" class="th_bg_search">특수관계자여부</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_RELATED_YN" name="SCH_RELATED_YN" uitype="single" jsondata-ref="jsonRelatedYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search">특수관계자유형</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="SCH_RELATED_CS_TYPE" name="SCH_RELATED_CS_TYPE" uitype="single" jsondata-ref="jsonRelatedCsType" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search"></th>
	                            <td colspan="3" class="td_input" >
	                            </td>
	                            <td></td>
	                            
	                            <th scope="row" class="th_bg_search"></th>
	                            <td colspan="3" class="td_input" >
	                            </td>
	                            <td></td>
	                            
	                        </tr>    
								                            
	                        <tr>
	                            <th scope="row" class="th_bg_search">계정과목</th>
	                            <td colspan="19" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px" placeholder="코드" id="SCH_ACCOUNT_CODE_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="SCH_BTN_ACCT_FR"
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup1('1')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px"  placeholder="계정과목명" id="SCH_ACCOUNT_NAME_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
					                    <font>~</font>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:100px"  placeholder="코드" id="SCH_ACCOUNT_CODE_TO" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="SCH_BTN_ACCT_TO"
											class="btn btn-xs btn-outline-dark"
											text="…" uitype="modal"
											target-id="modal-compopup1"
											onclick="fn_compopup1('2')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px" placeholder="계정과목명" id="SCH_ACCOUNT_NAME_TO" uitype="text" class="form-control input-sm"></sbux-input>
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
	                            <th scope="row" class="th_bg_search">거래처</th>
	                            <td colspan="19" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	   									<sbux-input style="width:100px"  placeholder="코드" id="SCH_CS_CODE_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="SCH_BTN_CS_FR"
											class="btn btn-xs btn-outline-dark"
											text="…" 
											onclick="fn_compopup2('1')"></sbux-button>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:200px"  placeholder="거래처명" id="SCH_CS_NAME_FR" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
					                    <font>~</font>
	   									<font style="width:5px"></font>
	   									<sbux-input style="width:100px"  placeholder="코드" id="SCH_CS_CODE_TO" uitype="text" class="form-control input-sm"></sbux-input>
	   									<font style="width:5px"></font>
										<sbux-button
											id="SCH_BTN_CS_TO"
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
											id="SCH_BTN_CS_MULTI"
											class="btn btn-xs btn-outline-dark"
											text="복수거래처" 
											onclick="fn_multiCs()"></sbux-button>
									</div>
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
	
    var jsonfiOrgCode 		= []; // APC
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
            // APC
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],		jsonfiOrgCode, 		'L_FIM022', 	'', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACNTG_OGNZ_CD', 'ACNTG_OGNZ_NM', 'Y', ''),
            // 전표상태
            gfnma_setComSelect(['SCH_DOC_STATUS'],		jsonDocStatus, 		'L_FIG002_1', 	'', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE'],	jsonAcctRuleCode, 	'L_FIM054', 	'', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '2'),
            // 미결관리대상
            gfnma_setComSelect(['SCH_ACC_CHARACTER'],	jsonAccCharacter, 	'L_FIM033_01', 	'', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 전표유형
            gfnma_setComSelect(['SCH_DOC_TYPE'],		jsonDocType, 		'L_FIM051', 	'', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 특수관계자여부
            gfnma_setComSelect(['SCH_RELATED_YN'], 		jsonRelatedYn, 		'L_COM036', 	'', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 특수관계자유형
            gfnma_setComSelect(['SCH_RELATED_CS_TYPE'], jsonRelatedCsType, 	'L_COM047', 	'', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			
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
    			if(type=='1'){
    				SBUxMethod.set('SCH_ACCOUNT_CODE_FR', data.ACNTL_CD);
    				SBUxMethod.set('SCH_ACCOUNT_NAME_FR', data.ACNT_NM);
    			} else {
    				SBUxMethod.set('SCH_ACCOUNT_CODE_TO', data.ACNTL_CD);
    				SBUxMethod.set('SCH_ACCOUNT_NAME_TO', data.ACNT_NM);
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
            ,tableHeader			: ["거래처코드",	"사업자번호" , 	"거래처명", 	"대표자",		"업태",			"종목",			"주소",		"전화",		"팩스"]
            ,tableColumnNames		: ["CNPT_CD", 		"BRNO", 	"CNPT_NM", 		"CEO_NM",	"BZSTAT",	"TPBIZ",	"ADDR",	"TELNO",		"FX_NO"]
            ,tableColumnWidths		: ["100px", 		"100px", 		"200px", 		"100px",		"100px",		"150px",		"400px",	"120px",	"120px"]
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
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
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
            
            //{caption: ["전표번호"],    				ref: 'DOC_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ['전표번호'], 				ref: 'link',    				type:'button',  	width:'100px', 		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['DOC_ID']){
		        		return "<a style='text-decoration: underline;cursor:pointer;color:#149fff' href='#' onClick='fn_gridPopup1(event, " + objRowData['DOC_ID'] + ")'>" + objRowData['DOC_NAME'] + "</a>";
            		} else {
            			return "";
            		}
            	}	
            },
            
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
            
            {caption: ["차변(전표)"], 	   			ref: 'FUNCTIONAL_DR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["대변(전표)"], 	   			ref: 'FUNCTIONAL_CR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["순금액(전표)"], 			ref: 'FUNCTIONAL_AMT', 			type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["차변(통화)"], 				ref: 'ORIGINAL_DR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["대변(통화)"], 				ref: 'ORIGINAL_CR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["순금액(통화)"], 			ref: 'ORIGINAL_AMT', 			type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["평가일"],    				ref: 'VALUATION_DATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["평가환율"],    				ref: 'VAL_EXCHANGE_RATE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["평가금액"], 				ref: 'AFTER_VAL_AMOUNT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["당초환율"],    				ref: 'ORIGINAL_EXCHANGE_RATE', 	type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["당초금액"], 				ref: 'BEFORE_VAL_AMOUNT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["부가세유형"],  				ref: 'VAT_TYPE', 				type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["여신영역"],    				ref: 'CREDIT_AREA', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급기산일"],  				ref: 'EXPECTED_PAY_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급조건"],  				ref: 'PAY_TERM_NAME', 			type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["지급방법"],  				ref: 'PAY_METHOD_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["원가중심점"],  				ref: 'COST_CENTER_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["원가중심점명"], 			ref: 'COST_CENTER_NAME', 		type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["APC"],  				ref: 'FI_ORG_NAME', 			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["회계기준"],  				ref: 'ACCT_RULE_NAME', 			type:'output',  	width:'100px',  	style:'text-align:left'},
        ];
 
        Fig4190Grid = _SBGrid.create(SBGridProperties);
//        Fig4190Grid.bind('click', 'fn_viewFig4190GridEvent');
    }    
    
    /**
     * 목록 조회
     */
	function cfn_search() {
        if(!SBUxMethod.validateRequired({group_id: "frmBody"}) || !validateRequired("frmBody")) {        
            return false;
        }        
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
 			gfn_comAlert("E0000","APC를 선택하세요");
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
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
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
						ACCOUNT_CODE			: gfnma_nvl2(item.ACNTL_CD),			
						ACCOUNT_NAME			: gfnma_nvl2(item.ACNT_NM),	
						ACCT_NAME				: gfnma_nvl2(item.ACCT_NAME),	
  						ACCT_RULE_CODE			: gfnma_nvl2(item.GAAP_CD),
  						ACCT_RULE_NAME			: gfnma_nvl2(item.ACCT_RULE_NAME),
  						ACC_CHARACTER			: gfnma_nvl2(item.INCPL_TYPE),
						
  						ACC_ITEM_CODE1			: gfnma_nvl2(item.ACNT_MNG_ARTCL_CD1),
  						ACC_ITEM_CODE2			: gfnma_nvl2(item.ACNT_MNG_ARTCL_CD2),
  						ACC_ITEM_CODE3			: gfnma_nvl2(item.ACNT_MNG_ARTCL_CD3),
  						ACC_ITEM_CODE4			: gfnma_nvl2(item.ACNT_MNG_ARTCL_CD4),
  						ACC_ITEM_CODE5			: gfnma_nvl2(item.ACNT_MNG_ARTCL_CD5),
  						ACC_ITEM_CODE6			: gfnma_nvl2(item.ACNT_MNG_ARTCL_CD6),
  						ACC_ITEM_CODE7			: gfnma_nvl2(item.ACNT_MNG_ARTCL_CD7),
  						ACC_ITEM_CODE8			: gfnma_nvl2(item.ACNT_MNG_ARTCL_CD8),
  						ACC_ITEM_CODE9			: gfnma_nvl2(item.ACNT_MNG_ARTCL_CD9),
  						ACC_ITEM_CODE10			: gfnma_nvl2(item.ACNT_MNG_ARTCL_CD10),  						
  						
  						ACC_ITEM_VALUE1			: gfnma_nvl2(item.ACNT_MNG_ARTCL_VL1),
  						ACC_ITEM_VALUE2			: gfnma_nvl2(item.ACNT_MNG_ARTCL_VL2),
  						ACC_ITEM_VALUE3			: gfnma_nvl2(item.ACNT_MNG_ARTCL_VL3),
  						ACC_ITEM_VALUE4			: gfnma_nvl2(item.ACNT_MNG_ARTCL_VL4),
  						ACC_ITEM_VALUE5			: gfnma_nvl2(item.ACNT_MNG_ARTCL_VL5),
  						ACC_ITEM_VALUE6			: gfnma_nvl2(item.ACNT_MNG_ARTCL_VL6),
  						ACC_ITEM_VALUE7			: gfnma_nvl2(item.ACNT_MNG_ARTCL_VL7),
  						ACC_ITEM_VALUE8			: gfnma_nvl2(item.ACNT_MNG_ARTCL_VL8),
  						ACC_ITEM_VALUE9			: gfnma_nvl2(item.ACNT_MNG_ARTCL_VL9),
  						ACC_ITEM_VALUE10		: gfnma_nvl2(item.ACNT_MNG_ARTCL_VL10),
  						
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
  						
  						AFTER_VAL_AMOUNT		: gfnma_nvl2(item.EVL_AFTR_AMT),			
  						APPLY_COMPLETE_DATE		: gfnma_nvl2(item.REVE_CMPTN_YMD),			
  						APPLY_COMPLETE_FLAG		: gfnma_nvl2(item.REVE_CMPTN_FLAG),			
  						APPLY_DOC_DATE			: gfnma_nvl2(item.APPLY_DOC_DATE),			
  						APPLY_DOC_ID			: gfnma_nvl2(item.APPLY_DOC_ID),			
  						APPLY_DOC_NAME			: gfnma_nvl2(item.APPLY_DOC_NAME),			
  						BANK_ACCOUNT_SEQ		: gfnma_nvl2(item.BACNT_SEQ),			
  						BEFORE_VAL_AMOUNT		: gfnma_nvl2(item.BFR_EVL_AMT),			
  						BILL_DUE_DATE			: gfnma_nvl2(item.PRMNT_MTRY_YMD),			
  						BILL_DUE_DAY			: gfnma_nvl2(item.PRMNT_DCNT),			
  						BILL_DUE_PAY_DATE		: gfnma_nvl2(item.PRMNT_MTRY_PAY_YMD),			
  						CARD_NO					: gfnma_nvl2(item.CARD_NO),			
  						COST_CENTER_CODE		: gfnma_nvl2(item.CSTCT_CD),			
  						COST_CENTER_NAME		: gfnma_nvl2(item.CSTCT_NM),			
  						CREDIT_AREA				: gfnma_nvl2(item.CRDT_SECT),			
  						CS_CODE					: gfnma_nvl2(item.CNPT_CD),			
  						CS_NAME					: gfnma_nvl2(item.CNPT_NM),			
  						CURRENCY_CODE			: gfnma_nvl2(item.CRN_CD),			
  						DEBIT_CREDIT			: gfnma_nvl2(item.DBSD_CRSD),			
  						DEBIT_CREDIT_NAME		: gfnma_nvl2(item.DEBIT_CREDIT_NAME),			
  						DEPT_CODE				: gfnma_nvl2(item.DEPT_CD),
  						DESCRIPTION				: gfnma_nvl2(item.DSCTN),
  						DOC_BATCH_NO			: gfnma_nvl2(item.SLIP_BTCH_NO),
  						DOC_DATE				: gfnma_date5(gfnma_nvl2(item.SLIP_YMD)),
  						DOC_ID					: gfnma_nvl2(item.SLIP_ID),
  						DOC_NAME				: gfnma_nvl2(item.SLIP_NM),
  						DOC_STATUS				: gfnma_nvl2(item.SLIP_STTS),
  						DOC_STATUS_NAME			: gfnma_nvl2(item.DOC_STATUS_NAME),
  						DOC_TYPE				: gfnma_nvl2(item.SLIP_TYPE),
  						EXCHANGE_RATE			: gfnma_nvl2(item.EXCHRT),
  						EXPECTED_PAY_DATE		: gfnma_date5(gfnma_nvl2(item.PAY_PRNMNT_YMD)),
  						FI_ORG_CODE				: gfnma_nvl2(item.ACNTG_OGNZ_CD),
  						FI_ORG_NAME				: gfnma_nvl2(item.ACNTG_OGNZ_NM),
  						FUNCTIONAL_AMT			: gfnma_nvl2(item.CNVS_AMT),
  						FUNCTIONAL_CR_AMT		: gfnma_nvl2(item.CNVS_CRSD_AMT),
  						FUNCTIONAL_DR_AMT		: gfnma_nvl2(item.CNVS_DRSD_AMT),
  						HOLD_DATE				: gfnma_nvl2(item.HLDOF_YMD),
  						HOLD_FLAG				: gfnma_nvl2(item.HLDOF_FLAG),
  						HOLD_REASON				: gfnma_nvl2(item.HLDOF_RSN),
  						HOLD_USER				: gfnma_nvl2(item.HLDOF_USER),
  						ITEM_CODE				: gfnma_nvl2(item.ITEM_CD),
  						ITEM_ID					: gfnma_nvl2(item.ITEM_ID),
  						ITEM_SEQ				: gfnma_nvl2(item.ITEM_SEQ),
  						ITEM_SOURCE_ID			: gfnma_nvl2(item.ITEM_SRC_ID),
  						JL_AMOUNT				: gfnma_nvl2(item.JL_AMOUNT),
  						LINE_TYPE				: gfnma_nvl2(item.LINE_TYPE),
  						ORIGINAL_AMT			: gfnma_nvl2(item.ORIGINAL_AMT),
  						ORIGINAL_CR_AMT			: gfnma_nvl2(item.ORGNL_CRSD_AMT),
  						ORIGINAL_DR_AMT			: gfnma_nvl2(item.ORGNL_DRSD_AMT),
  						ORIGINAL_EXCHANGE_RATE	: gfnma_nvl2(item.ORGNL_EXCHRT),
  						ORIGIN_DOC_ID			: gfnma_nvl2(item.ORGNL_SLIP_ID),
  						ORIGIN_DOC_NAME			: gfnma_nvl2(item.ORGNL_SLIP_NM),
  						PAYEE_CODE				: gfnma_nvl2(item.RCPNT_CD),
  						PAY_BASE_DATE			: gfnma_nvl2(item.PAY_RCK_YMD),
  						PAY_METHOD				: gfnma_nvl2(item.PAY_MTHD),
  						PAY_METHOD_NAME			: gfnma_nvl2(item.PAY_METHOD_NAME),
  						PAY_TERM_CODE			: gfnma_nvl2(item.PAY_TERM_CD),
  						PAY_TERM_NAME			: gfnma_nvl2(item.PAY_TERM_NM),
  						PAY_TERM_ORIG			: gfnma_nvl2(item.PAY_TERM_FRST),
  						PO_LINE_NO				: gfnma_nvl2(item.PORDR_LINE_NO),
  						PROD_GROUP				: gfnma_nvl2(item.PRDCT_GRP),
  						PROJECT_CODE			: gfnma_nvl2(item.PJT_CD),
  						RELEASE_DATE			: gfnma_nvl2(item.RLS_YMD),
  						RELEASE_USER			: gfnma_nvl2(item.RMV_USER),
  						REVERSE_DOC_ID			: gfnma_nvl2(item.REVE_SLIP_ID),
  						REVERSE_DOC_NAME		: gfnma_nvl2(item.REVERSE_DOC_NAME),
  						SALES_CS_CODE			: gfnma_nvl2(item.SLL_CNPT_CD),
  						SALES_PERSON			: gfnma_nvl2(item.SALS_EMP),
  						SITE_CODE				: gfnma_nvl2(item.SITE_CD),
  						SOURCE_TYPE				: gfnma_nvl2(item.SRC_TYPE),
  						TXN_QTY					: gfnma_nvl2(item.TRSC_QTY),			
  						UOM						: gfnma_nvl2(item.UNIT),			
  						VALUATION_DATE			: gfnma_nvl2(item.EVL_YMD),			
  						VAL_EXCHANGE_RATE		: gfnma_nvl2(item.VAL_EXCHANGE_RATE),			
  						VAT_TYPE				: gfnma_nvl2(item.VAT_TYPE),			
  						VOUCHER_NO				: gfnma_nvl2(item.EVDNC_NO),			
  						VOUCHER_NO1				: gfnma_nvl2(item.EVDNC_NO1),			
  						VOUCHER_RECEIPT_DATE	: gfnma_nvl2(item.EVDNC_RCPT_YMD),			
  						VOUCHER_TYPE			: gfnma_nvl2(item.EVDNC_TYPE),			
  						WITHHOLD_CS_CODE		: gfnma_nvl2(item.WTHD_CNPT_CD),			
  						WITHHOLD_CS_CODE2		: gfnma_nvl2(item.WTHD_CNPT_CD2),			
  						WITHHOLD_FLAG			: gfnma_nvl2(item.WTHD_FLAG),			
  						WITHHOLD_TAX_TYPE		: gfnma_nvl2(item.WTHD_TX_TYPE),			
  						WITHHOLD_TAX_TYPE2		: gfnma_nvl2(item.WTHD_TX_TYPE2),			
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
