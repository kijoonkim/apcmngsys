<%
/**
 * @Class Name 		: fig2200_q.jsp
 * @Description 	: 전표조회 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.15
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.15   	장성주		최초 생성
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
	<title>title : 전표조회</title>
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
                    </h3><!-- 전표조회 -->
                </div>
                <div style="margin-left: auto;">
                    <sbux-button uitype="normal" text="지급변경이력"  	class="btn btn-sm btn-outline-danger" onclick="fn_btnPayLog"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전표출력"  		class="btn btn-sm btn-outline-danger" onclick="fn_btnPrint"></sbux-button>
                    <sbux-button uitype="normal" text="세부내역"  		class="btn btn-sm btn-outline-danger" onclick="fn_btnDocDetail"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전기처리"  		id="sch-btnEnd" 		class="btn btn-sm btn-outline-danger" onclick="fn_btnEnd"></sbux-button>
                    <sbux-button uitype="normal" text="전기취소"  		id="sch-btnCancel" 		class="btn btn-sm btn-outline-danger" onclick="fn_btnCancel"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전기+해제"  		id="sch-btnAllComplete"	class="btn btn-sm btn-outline-danger" onclick="fn_btnAllComplete"></sbux-button>
                    <sbux-button uitype="normal" text="보류해제"  		id="sch-btnRelease"		class="btn btn-sm btn-outline-danger" onclick="fn_btnRelease"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="보류지정"  		id="sch-btnUnRelease"	class="btn btn-sm btn-outline-danger" onclick="fn_btnUnRelease"></sbux-button>
                    <sbux-button uitype="normal" text="일괄삭제"  		id="sch-btnDelete"		class="btn btn-sm btn-outline-danger" onclick="fn_btnDelete"></sbux-button>
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
	                                <sbux-select id="srch-cbofi-org-code" name="srch-cbofi-org-code" uitype="single" jsondata-ref="jsonCbofiOrgCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed"
										group-id="schHeader" 
										required                                       
	                                ></sbux-select>
	                            </td>
						        <td></td>
	                            
	                            <th scope="row" class="th_bg_search">사업장</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbosite-code" name="srch-cbosite-code" uitype="single" jsondata-ref="jsonCbositeCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
						        <td></td>
						        
	                            <th scope="row" class="th_bg_search">보류여부</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-ccbohold-flag" name="srch-ccbohold-flag" uitype="single" jsondata-ref="jsonCboholdFlag" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
						        <td></td>
						        
	                            <th scope="row" class="th_bg_search">전표상태</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbodoc-status-p" name="srch-cbodoc-status-p" uitype="single" jsondata-ref="jsonCbodocStatusP" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
						        <td></td>
	                            
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg_search">년월</th>
	                            <td colspan="3" class="td_input" >
									<sbux-datepicker
									        id="srch-ymdperiod-yyyymm-p"
									        name="srch-ymdperiod-yyyymm-p"
									        uitype="popup"
									        datepicker-mode="month"
									        date-format="yyyy-mm"
									        class="form-control input-sm input-sm-ast table-datepicker-ma"
									        onchange = "fn_payDate"
									        required>
									</sbux-datepicker>                            
	                            </td>
						        <td></td>
	                            
	                            <th scope="row" class="th_bg_search">전표일자</th>
	                            <td class="td_input" >
								    <sbux-datepicker
							            id="srch-ymddate-fr"
							            name="srch-ymddate-fr"
							            uitype="popup"
							            date-format="yyyy-mm-dd"
							            class="form-control input-sm input-sm-ast table-datepicker-ma inpt_data_reqed"
										group-id="schHeader" 
										required                                       
								    >
								    </sbux-datepicker>                          
	                            </td>
						        <td>-</td>
	                            <td class="td_input" >
								    <sbux-datepicker
							            id="srch-ymddate-to"
							            name="srch-ymddate-to"
							            uitype="popup"
							            date-format="yyyy-mm-dd"
							            class="form-control input-sm input-sm-ast table-datepicker-ma inpt_data_reqed"
										group-id="schHeader" 
										required                                       
								    >
								    </sbux-datepicker>                            
	                            </td>
						        <td></td>
	                            
	                            <th scope="row" class="th_bg_search">회계기준</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cboacct-rule-code" name="srch-cboacct-rule-code" uitype="single" jsondata-ref="jsonCboacctRuleCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed"
										group-id="schHeader" 
										required                                       
	                                ></sbux-select>
	                            </td>
						        <td></td>
						        
	                            <th scope="row" class="th_bg_search">전표구분</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbodoc-type-p" name="srch-cbodoc-type-p" uitype="single" jsondata-ref="jsonCbodocTypeP" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
						        <td></td>
	                        </tr>    
	                        
	                        <tr>
	                        
	                            <th scope="row" class="th_bg_search">작성부서</th>
								<td colspan="3"  class="td_input" >
	   								<sbux-input
										uitype="text"
										id="srch-txtcreated-dept-name"
										class="form-control input-sm"									
	   								></sbux-input>
									<sbux-input
										uitype="hidden"
										uitype="text"
										id="srch-txtcreated-dept-code"
										class="form-control input-sm"
	   								></sbux-input>
								</td>
	                            <td class="td_input" >
									<sbux-button
										id="srch-btn-txtcreated-dept"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1"
									></sbux-button>
	                            </td>
	                            
	                            <th scope="row" class="th_bg_search">청구부서</th>
								<td colspan="3"  class="td_input" >
	   								<sbux-input
										uitype="text"
										id="srch-txtpayee-dept-name"
										class="form-control input-sm"									
	   								></sbux-input>
									<sbux-input
										uitype="hidden"
										uitype="text"
										id="srch-txtpayee-dept-code"
										class="form-control input-sm"
										
	   								></sbux-input>
	                            </td>
	                            <td class="td_input" >
									<sbux-button
										id="srch-btn-txtpayee-dept"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup2"
									></sbux-button>
	                            </td>
	                            
	                            <th scope="row" class="th_bg_search">작성자</th>
								<td colspan="3"  class="td_input" >
	   								<sbux-input
										uitype="text"
										id="srch-txtcreated-by-name"
										class="form-control input-sm"									
	   								></sbux-input>
									<sbux-input
										uitype="hidden"
										uitype="text"
										id="srch-txtcreated-by-code"
										class="form-control input-sm"
										
	   								></sbux-input>
								</td>
	                            <td class="td_input" >
									<sbux-button
										id="srch-btn-txtcreated-by"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup3"
									></sbux-button>
	                            </td>
	                            
	                            <th scope="row" class="th_bg_search">실사용자</th>
								<td colspan="3"  class="td_input" >
	   								<sbux-input
										uitype="text"
										id="srch-txtpayee-name"
										class="form-control input-sm"									
	   								></sbux-input>
									<sbux-input
										uitype="hidden"
										uitype="text"
										id="srch-txtpayee-code"
										class="form-control input-sm"
	   								></sbux-input>
								</td>
	                            <td class="td_input" >
									<sbux-button
										id="srch-btn-txtpayee"
										class="btn btn-xs btn-outline-dark"
										text="…" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup4"
									></sbux-button>
	                            </td>	                            
	                            
	                        </tr>
	                        
	                        <tr>
	                            <th scope="row" class="th_bg_search">전표번호</th>
								<td colspan="4"  class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
				                        <sbux-input id="srch-txtdoc-name" name="srch-txtdoc-name" class="form-control input-sm" uitype="text" style="width:120px;" ></sbux-input>
									    <font style="padding-right:10px"></font>  
									    <span style="padding-top:5px">
			                       			<sbux-checkbox 
			                       				id="srch-chkmulti-doc-yn" 
			                       				uitype="normal" 
			                       				text="복수선택" 
			                       				true-value="Y" 
			                       				false-value="N" 
		                       				></sbux-checkbox>
									    </span>
									    <font style="padding-right:10px"></font>  
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="복수전표" uitype="normal"
											onclick="fn_compopup5"
										></sbux-button>
	                            	</div>
								</td>
								
	                            <th scope="row" class="th_bg_search">제목</th>
								<td colspan="9"  class="td_input" >
			                        <sbux-input id="srch-txtdesc" name="srch-txtdesc" class="form-control input-sm" uitype="text" ></sbux-input>
								</td>
								
								<td colspan="5"  class="td_input" >
								    <font style="padding-right:10px"></font>  
	                       			<sbux-checkbox 
	                       				id="srch-chkappr-only-flag" 
	                       				uitype="normal" 
	                       				text="결재건만" 
	                       				true-value="Y" 
	                       				false-value="N" 
                       				></sbux-checkbox>
								    <font style="padding-right:10px"></font>  
	                       			<sbux-checkbox 
	                       				id="srch-chkreverse-flag" 
	                       				uitype="normal" 
	                       				text="역분개제외여부" 
	                       				true-value="Y" 
	                       				false-value="N" 
                       				></sbux-checkbox>
								    <font style="padding-right:10px"></font>  
	                       			<sbux-checkbox 
	                       				id="srch-recall-yn" 
	                       				uitype="normal" 
	                       				text="반려제외여부" 
	                       				true-value="Y" 
	                       				false-value="N" 
                       				></sbux-checkbox>
								</td>
								
							</tr>
								                            
	                    </tbody>
	                </table>				
				</div>
                
                <div class="row">
                
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>회계전표내역</span>
	                            <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
	                    	<span style="padding-top:5px">
		                    	<font style="font-size:11px" >결재의견</font>
	                    	</span>
		                    <span style="width:5px"></span>
	                        <sbux-input id="srch-txtappr-opinion" name="srch-txtappr-opinion" class="form-control input-sm" uitype="text" style="width:250px;" ></sbux-input>
		                    <span style="width:5px"></span>
		                    <sbux-button uitype="normal" text="일괄결재"  	class="btn btn-sm btn-outline-danger" onclick="fn_AllAppr" ></sbux-button>
		                    <span style="width:5px"></span>
		                    <sbux-button uitype="normal" text="일괄반려"  	class="btn btn-sm btn-outline-danger" onclick="fn_AllReturn" ></sbux-button>
						</div>
	                </div>
	                <div>
	                    <div id="sb-area-grdTop" style="height:200px; width:100%;">
	                    </div>
	                </div>
	                
	                <div style="padding-top:10px">
		                <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="normal"
							is-scrollable="false"
							title-target-id-array="tab1^tab2^tab3"
							title-text-array="회계처리^반제/역분개실적^결재이력">
						</sbux-tabs>
	                    <div class="tab-content">
	                    
							<div id="tab1" style="height:200px;">
								<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
									<font style="margin-right:auto;">회계처리</font>
								</div>
			                    <div id="sb-area-grdTab1" style="height:180px; width:100%;">
			                    </div>
							</div>
							
							<div id="tab2" style="height:200px;">
								<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
									<font style="margin-right:auto;">반제/역분개실적</font>
								</div>
			                    <div id="sb-area-grdTab2" style="height:180px; width:100%;">
			                    </div>
							</div>
							
							<div id="tab3" style="height:200px;">
								<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
									<font style="margin-right:auto;">결재이력</font>
								</div>
			                    <div id="sb-area-grdTab3" style="height:180px; width:100%;">
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
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:1400px" id="modal-compopfig2250" name="modal-compopfig2250" uitype="middle" header-title="" body-html-id="body-modal-compopfig2250" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopfig2250">
    	<jsp:include page="../../../com/popup/comPopFig2250.jsp"></jsp:include>
    </div>
    
	<!-- 리포트 출력 팝업 -->
	<div>
		<sbux-modal style="width:600px" id="modal-comPopFig1000Report" name="modal-comPopFig1000Report" uitype="middle" header-title="" body-html-id="body-modal-comPopFig1000Report" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
	</div>
	<div id="body-modal-comPopFig1000Report">
		<jsp:include page="../../../com/popup/comPopFig1000Report.jsp"></jsp:include>
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
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	var p_ss_siteCode			= '${loginVO.maSiteCode}';
	var p_ss_defaultAcctRule 	= '${loginVO.maDefaultAcctRule}';
	var p_ss_isPostingUser 		= '${loginVO.maIsPostingUser}';
	var p_ss_isAccountManager	= '${loginVO.maIsAccountManager}';
	var p_ss_userName 			= '${loginVO.maUserName}';
	var p_ss_deptCode 			= '${loginVO.maDeptCode}';
	var p_ss_deptName 			= '${loginVO.maDeptName}';
	//-----------------------------------------------------------
	
    var Tab1Fig2210Grid; 			// 그리드를 담기위한 객체 선언
    var jsonTab1Fig2210 = []; 		// 그리드의 참조 데이터 주소 선언
 
    var Tab2Fig2200Grid; 			// 그리드를 담기위한 객체 선언
    var jsonTab2Fig2200 = []; 		// 그리드의 참조 데이터 주소 선언
 
    var Tab3Fim3420Grid; 			// 그리드를 담기위한 객체 선언
    var jsonTab3Fim3420 = []; 		// 그리드의 참조 데이터 주소 선언
	
    var jsonCbofiOrgCode 		= []; // APC
    var jsonCbositeCode 		= []; // 사업장
    var jsonCboholdFlag 		= []; // 보류여부
    var jsonCbodocStatusP 		= []; // 전표상태
    var jsonCbodocTypeP 		= []; // 전표구분
    var jsonCboacctRuleCode 	= []; // 회계기준
	
    var _chkmulti_doc_params	= null;	//복수전표 파라미터
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // APC
            gfnma_setComSelect(['srch-cbofi-org-code'],		jsonCbofiOrgCode, 'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACNTG_OGNZ_CD', 'ACNTG_OGNZ_NM', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['srch-cbosite-code'], 		jsonCbositeCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
            // 보류여부
            gfnma_setComSelect(['srch-ccbohold-flag'], 		jsonCboholdFlag, 'L_COM036', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 전표상태
            gfnma_setComSelect(['srch-cbodoc-status-p'],	jsonCbodocStatusP, 'L_FIG002_1', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 전표구분
            gfnma_setComSelect(['srch-cbodoc-type-p'],		jsonCbodocTypeP, 'L_FIM051', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['srch-cboacct-rule-code'],	jsonCboacctRuleCode, 'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', '2'),
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
    	fn_createGrid2200();	
    	fn_createGridTab1Fig2210();	
    	fn_createGridTab2Fig2200();
    	fn_createGridTab3Fim3420();
    	
    });
 
    /**
     * 화면 state 변경
     */
    function fn_state() {
		
    	//숨겨진 콤포넌트
    	//...............
    	
		SBUxMethod.set('srch-cbofi-org-code', 		p_ss_fiOrgCode);
		SBUxMethod.set('srch-cbosite-code', 		p_ss_siteCode);
		SBUxMethod.set('srch-cboacct-rule-code', 	p_ss_defaultAcctRule);
    	
    	//년월
		SBUxMethod.set('srch-ymdperiod-yyyymm-p', gfnma_date().substr(0,4) + '-' + gfnma_date().substr(4,2));
        var yyyymm	= gfnma_nvl(SBUxMethod.get("srch-ymdperiod-yyyymm-p"));
        var sdate	= yyyymm.substr(0,4) + '-' + yyyymm.substr(4,2) + '-01';
        var edate	= gfnma_date3(yyyymm.substr(0,4), yyyymm.substr(4,2));
        
		SBUxMethod.set('srch-ymddate-fr', 		sdate);
		SBUxMethod.set('srch-ymddate-to', 		edate);
    	
    	//역분개제외여부
		SBUxMethod.set('srch-chkreverse-flag', 'Y');
    	//반려제외여부
		SBUxMethod.set('srch-recall-yn', 'Y');
    	//복수선택
		SBUxMethod.set('srch-chkmulti-doc-yn', 'N');
    	//결재건만
		SBUxMethod.set('srch-chkappr-only-flag', 'N');
    	
		SBUxMethod.hide('sch-btnEnd');
		SBUxMethod.hide('sch-btnCancel');
		SBUxMethod.hide('sch-btnAllComplete');
		SBUxMethod.hide('sch-btnRelease');
		SBUxMethod.hide('sch-btnUnRelease');
		SBUxMethod.hide('sch-btnDelete');
    	
    	//전기담당자 여부
    	if(!p_ss_isPostingUser){
    		SBUxMethod.hide('sch-btnEnd');
    		SBUxMethod.hide('sch-btnCancel');
    		SBUxMethod.hide('sch-btnAllComplete');
    		SBUxMethod.hide('sch-btnRelease');
    		SBUxMethod.hide('sch-btnUnRelease');
    		SBUxMethod.hide('sch-btnDelete');
    	}
    	//회계담당자 여부
    	if(!p_ss_isAccountManager){
    		SBUxMethod.set('srch-txtcreated-by-code',		p_userId);
    		SBUxMethod.set('srch-txtcreated-by-name',		p_ss_userName);
    		SBUxMethod.set('srch-txtcreated-dept-code',		p_ss_deptCode);
    		SBUxMethod.set('srch-txtcreated-dept-name',		p_ss_deptName);
    		SBUxMethod.attr('srch-txtcreated-dept-name', 	'disabled', true);
    		SBUxMethod.attr('srch-btn-txtcreated-dept', 	'disabled', true);
    		SBUxMethod.attr('srch-txtcreated-by-name', 		'disabled', false);
    		SBUxMethod.attr('srch-btn-txtcreated-by', 		'disabled', false);
    		
    		SBUxMethod.set('srch-txtpayee-code',			p_userId);
    		SBUxMethod.set('srch-txtpayee-name',			p_ss_userName);
    		SBUxMethod.set('srch-txtpayee-dept-code',		p_ss_deptCode);
    		SBUxMethod.set('srch-txtpayee-dept-name',		p_ss_deptName);
    		SBUxMethod.attr('srch-txtpayee-dept-name', 		'disabled', true);
    		SBUxMethod.attr('srch-btn-txtpayee-dept', 		'disabled', true);
    		SBUxMethod.attr('srch-txtpayee-name', 			'disabled', false);
    		SBUxMethod.attr('srch-btn-txtpayee', 			'disabled', false);
    	} else {
    		SBUxMethod.set('srch-txtcreated-by-code',		'');
    		SBUxMethod.set('srch-txtcreated-by-name',		'');
    		SBUxMethod.set('srch-txtcreated-dept-code',		'');
    		SBUxMethod.set('srch-txtcreated-dept-name',		'');
    		SBUxMethod.attr('srch-txtcreated-by-name', 		'disabled', false);
    		SBUxMethod.attr('srch-btn-txtcreated-by', 		'disabled', false);
    		
    		SBUxMethod.set('srch-txtpayee-code',			'');
    		SBUxMethod.set('srch-txtpayee-name',			'');
    		SBUxMethod.set('srch-txtpayee-dept-code',		'');
    		SBUxMethod.set('srch-txtpayee-dept-name',		'');
    		SBUxMethod.attr('srch-txtpayee-name', 			'disabled', false);
    		SBUxMethod.attr('srch-btn-txtpayee', 			'disabled', false);
    	}
    }
    
    /**
     * 날짜
     */
    var fn_payDate = function() {
        var yyyymm	= gfnma_nvl(SBUxMethod.get("srch-ymdperiod-yyyymm-p"));
        var sdate	= yyyymm.substr(0,4) + '-' + yyyymm.substr(4,2) + '-01';
        var edate	= gfnma_date3(yyyymm.substr(0,4), yyyymm.substr(4,2));
        
		SBUxMethod.set('srch-ymddate-fr', 		sdate);
		SBUxMethod.set('srch-ymddate-to', 		edate);    	
    }
    
    /**
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#srchArea1');
    }
    
    //grid Mast 초기화
    var Fig2200Grid; 			// 그리드를 담기위한 객체 선언
    var jsonFig2200 = []; 		// 그리드의 참조 데이터 주소 선언
 
    function fn_createGrid2200() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTop';
	    SBGridProperties.id 				= 'Fig2200Grid';
	    SBGridProperties.jsonref 			= 'jsonFig2200';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
        SBGridProperties.frozencols 		= 9;
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
                    sum : [10,11,12]
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
        	{caption: [""], ref: 'CHECK_YN', type: 'checkbox', width: '40px', style: 'text-align:center',
        	    typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
        	        checkedvalue: 'Y', uncheckedvalue: 'N'
        	    }
        	},        	
            {caption: ["전표상태"],					ref: 'DOC_STATUS_NAME', 		type:'output', 		width:'80px',  		style:'text-align:left'},
            {caption: ["APC"], 						ref: 'FI_ORG_NAME',    			type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["사업장"], 					ref: 'SITE_NAME', 				type:'output',		width:'80px',  		style:'text-align:left'},
            {caption: ["역발행승인"],    			ref: 'SIGN_YN', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전기일자"],    				ref: 'DOC_DATE', 				type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["전표구분"],    				ref: 'DOC_TYPE_NAME', 			type:'output',  	width:'150px',  	style:'text-align:left'},
            
            //{caption: ["전표번호"],    			ref: 'DOC_NAME', 				type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ['전표번호'], 				ref: 'link',    				type:'button',  	width:'100px', 		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['DOC_STATUS']=='3'){
		        		return "<a style='text-decoration: underline;cursor:pointer;color:#149fff' href='#' onClick='fn_gridPopup1(event, " + objRowData['DOC_ID'] + ")'>" + objRowData['DOC_NAME'] + "</a>";
            		} else {
		        		return objRowData['DOC_NAME'];
            		}
            	}	
            },
            
            {caption: ["적요"], 	   				ref: 'DESCRIPTION', 			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["금액"], 	   				ref: 'DOC_AMT', 				type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["공급가액"],	   				ref: 'SUPPLY_AMT', 				type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["부가세"],	   				ref: 'VAT_AMT', 				type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["거래처명"],	   				ref: 'CS_NAME', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["상신일자"],	   				ref: 'INSERT_DATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["청구자"],	   				ref: 'REQUEST_EMP', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["직전결재자"],				ref: 'BEFORE_APPR_EMP', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["직전대행자"],				ref: 'BEFORE_PROXY_EMP', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["다음결재자"],				ref: 'NEXT_APPR_EMP', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["다음대행자"],				ref: 'NEXT_PROXY_EMP', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["역분개"], 					ref: 'REVERSE_FLAG', 			type: 'checkbox', width: '50px', style: 'text-align:center', disabled: true,
                typeinfo: {ignoreupdate: false, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["보류여부"], 				ref: 'HOLD_FLAG', 				type: 'checkbox', width: '50px', style: 'text-align:center', disabled: true,
                typeinfo: {ignoreupdate: false, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["현업최종승인일"],			ref: 'APPROVE_DATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["회계승인일"],				ref: 'POSTING_DATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["회계승인취소일"],			ref: 'UNPOSTING_DATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["배치번호"],					ref: 'DOC_BATCH_NO', 			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["환율"],						ref: 'EXCHANGE_RATE', 			type:'output',  	width:'60px',  		style:'text-align:left'},
            {caption: ["결의부서명"],				ref: 'DEPT_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["작성자"],					ref: 'INSERT_USER_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["역분개전표번호"],			ref: 'REVERSE_DOC_NAME', 		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["원전표번호"],				ref: 'ORIG_DOC_NAME', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사업자번호"],				ref: 'BIZ_REGNO', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["통화"],						ref: 'CURRENCY_CODE',			type:'output',  	width:'70px',  		style:'text-align:left'},
        ];
 
        Fig2200Grid = _SBGrid.create(SBGridProperties);
        Fig2200Grid.bind('click', 'fn_viewFig2200GridEvent');
    }
    
    //상세정보 보기
    function fn_viewFig2200GridEvent() {
    	
        var nRow = Fig2200Grid.getRow();
		if (nRow < 1) {
            return;
		}
        let rowData = Fig2200Grid.getRowData(nRow);
		console.log(rowData);        
        fn_setTab1Fig2210Grid('ACCOUNT', 	rowData['DOC_ID']);
        fn_setTab2Fig2200Grid('PAYMENT', 	rowData['DOC_ID']);
        fn_setTab3Fim3420Grid('LIST', 		rowData['APPR_ID'], rowData['DOC_ID'], rowData['DOC_TYPE']);
    }
    
    //상세정보 보기
    function fn_viewFig2200GridReload(idx) {
    	
    	Fig2200Grid.setRow(idx);
        let rowData = Fig2200Grid.getRowData(idx);
		//console.log(rowData);        
        fn_setTab1Fig2210Grid('ACCOUNT', 	rowData['DOC_ID']);
        fn_setTab2Fig2200Grid('PAYMENT', 	rowData['DOC_ID']);
        fn_setTab3Fim3420Grid('LIST', 		rowData['APPR_ID'], rowData['DOC_ID'], rowData['DOC_TYPE']);
    }
    
    /**
     * 목록 조회
     */
	function cfn_search() {
        if(!SBUxMethod.validateRequired({group_id: "schHeader"}) || !validateRequired("schHeader")) {        
            return false;
        }        
    	
		jsonTab1Fig2210 = [];
		jsonTab2Fig2200 = []; 	
		jsonTab3Fim3420 = []; 
		
    	fn_createGridTab1Fig2210();	
    	fn_createGridTab2Fig2200();
    	fn_createGridTab3Fim3420();
		
		fn_setFig2200Grid('Q');
	}
    
    /**
     * 목록 가져오기
     */
    const fn_setFig2200Grid = async function(wtype) {
    	
		Fig2200Grid.clearStatus();
 
		let p_cbofi_org_code		= gfnma_nvl(SBUxMethod.get("srch-cbofi-org-code"));
		let p_cboacct_rule_code		= gfnma_nvl(SBUxMethod.get("srch-cboacct-rule-code"));
		let p_ymddate_fr			= gfnma_nvl(SBUxMethod.get("srch-ymddate-fr"));
		let p_cbosite_code			= gfnma_nvl(SBUxMethod.get("srch-cbosite-code"));
		let p_cbodoc_type_p			= gfnma_nvl(SBUxMethod.get("srch-cbodoc-type-p"));
		let p_cbodoc_status_p		= gfnma_nvl(SBUxMethod.get("srch-cbodoc-status-p"));
		let p_txtpayee_dept_code	= gfnma_nvl(SBUxMethod.get("srch-txtpayee-dept-code"));
		let p_txtpayee_code			= gfnma_nvl(SBUxMethod.get("srch-txtpayee-code"));
		let p_txtcreated_dept_code	= gfnma_nvl(SBUxMethod.get("srch-txtcreated-dept-code"));
		let p_txtcreated_by_code	= gfnma_nvl(SBUxMethod.get("srch-txtcreated-by-code"));
		let p_ymddate_to			= gfnma_nvl(SBUxMethod.get("srch-ymddate-to"));
		let p_chkreverse_flag		= gfnma_nvl(SBUxMethod.get('srch-chkreverse-flag')['srch-chkreverse-flag']);
		let p_ccbohold_flag			= gfnma_nvl(SBUxMethod.get("srch-ccbohold-flag"));
		let p_chkappr_only_flag		= gfnma_nvl(SBUxMethod.get('srch-chkappr-only-flag')['srch-chkappr-only-flag']);
		let p_txtdoc_name			= gfnma_nvl(SBUxMethod.get("srch-txtdoc-name"));
		
		let p_chkmulti_doc_yn		= gfnma_nvl(SBUxMethod.get('srch-chkmulti-doc-yn')['srch-chkmulti-doc-yn']);
		if(p_chkmulti_doc_yn=='Y'){
			p_chkmulti_doc_yn = _chkmulti_doc_params;
		} else {
			p_chkmulti_doc_yn = "";
		}
		
		let p_txtdesc				= gfnma_nvl(SBUxMethod.get("srch-txtdesc"));
		
		if(!p_cbofi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;      		 
		}
		if(!p_ymddate_fr){
 			gfn_comAlert("E0000","전표일자(시작)를 선택하세요");
			return;      		 
		}
		if(!p_ymddate_to){
 			gfn_comAlert("E0000","전표일자(종료)를 선택하세요");
			return;      		 
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_cbofi_org_code
			,V_P_ACCT_RULE_CODE     : p_cboacct_rule_code 
			,V_P_DOC_DATE           : p_ymddate_fr
			,V_P_SITE_CODE          : p_cbosite_code
			,V_P_DOC_TYPE           : p_cbodoc_type_p
			,V_P_DOC_STATUS         : p_cbodoc_status_p
			,V_P_PAYEE_DEPT         : p_txtpayee_dept_code
			,V_P_PAYEE_CODE         : p_txtpayee_code
			,V_P_CREATED_DEPT       : p_txtcreated_dept_code
			,V_P_CREATED_BY         : p_txtcreated_by_code
			,V_P_ENTRY_DATE_FR      : p_ymddate_fr
			,V_P_ENTRY_DATE_TO      : p_ymddate_to
			,V_P_REVERSE_FLAG       : p_chkreverse_flag
			,V_P_HOLD_FLAG          : p_ccbohold_flag 
			,V_P_APPR_ONLY_FLAG     : p_chkappr_only_flag 
			,V_P_DOC_NAME           : p_txtdoc_name 
			,V_P_DOC_NAME_D         : p_chkmulti_doc_yn
			,V_P_DOC_ID             : ''
			,V_P_DESC               : p_txtdesc
 
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig2200List.do", {
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
 
  	        	jsonFig2200.length = 0;
  	        	data.cv_2.forEach((item, index) => {
  					const msg = {
  						CHECK_YN				: gfnma_nvl2(item.CHECK_YN),			
  						DOC_ID					: gfnma_nvl2(item.SLIP_ID),			
  						FI_ORG_CODE				: gfnma_nvl2(item.ACNTG_OGNZ_CD),			
  						FI_ORG_NAME				: gfnma_nvl2(item.ACNTG_OGNZ_NM),			
  						COMP_CODE				: gfnma_nvl2(item.CO_CD),
  						SITE_CODE				: gfnma_nvl2(item.SITE_CD),
  						SITE_NAME				: gfnma_nvl2(item.SITE_NM),
  						DEPT_CODE				: gfnma_nvl2(item.DEPT_CD),
  						ACCT_RULE_CODE			: gfnma_nvl2(item.GAAP_CD),
  						HOLD_FLAG				: gfnma_nvl2(item.HLDOF_FLAG),
  						POSTING_DATE			: gfnma_date5(gfnma_nvl2(item.PSTG_YMD)),
  						UNPOSTING_DATE			: gfnma_nvl2(item.PSTG_CNCL_YMD),
  						DEPT_NAME				: gfnma_nvl2(item.DEPT_NM),
  						INSERT_USERID			: gfnma_nvl2(item.WRT_USER_ID),
  						INSERT_TIME				: gfnma_nvl2(item.WRT_DT),
  						INSERT_PC				: gfnma_nvl2(item.WRT_PC),
  						INSERT_USER_NAME		: gfnma_nvl2(item.INSERT_USER_NAME),
  						POSTING_USER			: gfnma_nvl2(item.PSTG_PIC),
  						UNPOSTING_USER			: gfnma_nvl2(item.PSTG_CNCL_USER),
  						RELEASE_USER			: gfnma_nvl2(item.RMV_USER),
  						HOLD_USER				: gfnma_nvl2(item.HLDOF_USER),
  						DOC_DATE				: gfnma_date5(gfnma_nvl2(item.SLIP_YMD)),
  						APPROVE_DATE			: gfnma_date5(gfnma_nvl2(item.APRV_YMD)),
  						CURRENCY_CODE			: gfnma_nvl2(item.CRN_CD),
  						EXCHANGE_RATE			: gfnma_nvl2(item.EXCHRT),
  						DOC_AMT					: gfnma_nvl2(item.SLIP_AMT),
  						DOC_TYPE				: gfnma_nvl2(item.SLIP_TYPE),
  						DOC_TYPE_NAME			: gfnma_nvl2(item.DOC_TYPE_NAME),
  						DOC_NAME				: gfnma_nvl2(item.SLIP_NM),
  						SOURCE_TYPE				: gfnma_nvl2(item.SRC_TYPE),
  						SOURCE_ID				: gfnma_nvl2(item.SRC_ID),
  						DOC_NAME				: gfnma_nvl2(item.SLIP_NM),
  						DOC_ID1					: gfnma_nvl2(item.DOC_ID1),
  						DESCRIPTION				: gfnma_nvl2(item.DSCTN),
  						DOC_STATUS				: gfnma_nvl2(item.SLIP_STTS),
  						DOC_STATUS_NAME			: gfnma_nvl2(item.DOC_STATUS_NAME),
  						DOC_NUM					: gfnma_nvl2(item.SLIP_NO),
  						DOC_NUM_TOTAL			: gfnma_nvl2(item.DOC_NUM_TOTAL),
  						UPDATE_USERID			: gfnma_nvl2(item.UPDT_USER_ID),
  						UPDATE_TIME				: gfnma_nvl2(item.UPDT_DT),
  						CS_NAME					: gfnma_nvl2(item.CNPT_NM),
  						BIZ_REGNO				: gfnma_nvl2(item.BRNO),
  						SUPPLY_AMT				: gfnma_nvl2(item.SPLY_AMT),
  						VAT_AMT					: gfnma_nvl2(item.VAT_AMT),
  						DOC_BATCH_NO			: gfnma_nvl2(item.SLIP_BTCH_NO),
  						FI_ORG_CODE1			: gfnma_nvl2(item.FI_ORG_CODE1),
  						REVERSE_FLAG			: gfnma_nvl2(item.REVE_FLAG),
  						REVERSE_DOC_ID			: gfnma_nvl2(item.REVE_SLIP_ID),
  						REVERSE_DOC_NAME		: gfnma_nvl2(item.REVERSE_DOC_NAME),
  						ORIG_DOC_ID				: gfnma_nvl2(item.ORGNL_SLIP_ID),
  						ORIG_DOC_NAME			: gfnma_nvl2(item.ORIG_DOC_NAME),
  						SIGN_YN					: gfnma_nvl2(item.SIGN_YN),
  						AP_DOC_YN				: gfnma_nvl2(item.APS_SLIP_YN),
  						AR_DOC_YN				: gfnma_nvl2(item.AR_SLIP_YN),
  						ESS_DOC_YN				: gfnma_nvl2(item.ESS_SLIP_YN),
  						AP_DOC_VIEW_YN			: gfnma_nvl2(item.APS_SLIP_INQ_YN),
  						AP_DOC_WRITE_YN			: gfnma_nvl2(item.APS_SLIP_WRT_YN),
  						AR_DOC_WRITE_YN			: gfnma_nvl2(item.AR_SLIP_WRT_YN),
  						MANUAL_DOC_WRITE_YN		: gfnma_nvl2(item.HWRT_SLIP_YN),
  						MULTI_AP_WRITE_YN		: gfnma_nvl2(item.MLT_APS_SLIP_YN),
  						APPR_SOURCE_TYPE		: gfnma_nvl2(item.APRV_SRC_TYPE),
  						INSERT_DATE				: gfnma_date5(gfnma_nvl2(item.INPT_DT)),
  						CONFIRM_EMP_CODE		: gfnma_nvl2(item.CONFIRM_EMP_CODE),
  						PROXY_EMP_CODE			: gfnma_nvl2(item.DLGT_EMP_CD),
  						APPR_ID					: gfnma_nvl2(item.APRV_ID),
  						REQUEST_EMP				: gfnma_nvl2(item.REQUEST_EMP),
  						BEFORE_APPR_EMP			: gfnma_nvl2(item.BEFORE_APPR_EMP),
  						NEXT_APPR_EMP			: gfnma_nvl2(item.NEXT_APPR_EMP),
  						BEFORE_PROXY_EMP		: gfnma_nvl2(item.BEFORE_PROXY_EMP),
  						NEXT_PROXY_EMP			: gfnma_nvl2(item.NEXT_PROXY_EMP),
  					}
  					jsonFig2200.push(msg);
  					totalRecordCount ++;
  				});
 
        		Fig2200Grid.rebuild();
        		fn_setFig2200Style();
  	        	document.querySelector('#listCount1').innerText = totalRecordCount;
  	        	
  	        	//deatil grid 첫번째 행 선택
				if(jsonFig2200.length>0){
					fn_viewFig2200GridReload(1);					
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
     * 그리드 행 칼라
     */
    var fn_setFig2200Style = function() {
    	
    	for (var i = 0; i < jsonFig2200.length; i++) {
			var obj = jsonFig2200[i];
			if(obj['DOC_STATUS']=='3'){
				//승인중
		        Fig2200Grid.setRowStyle((i+1), 'data', 'background', '#efeeb8');
			}
		}
        Fig2200Grid.clearSelection();    	
    }
    
//     /**
//      * 그리드내 전표번호 조회
//      */
// 	function fn_gridPopup1(event, row, col) {
// 		event.preventDefault();	
//         let rowData = Fig2200Grid.getRowData(row);
//         console.log('fn_gridPopup1 rowData:', rowData);
        
//         var obj = {
//         	'MENU_MOVE'		: 'Y'	
//         	,'DOC_ID' 		: rowData['DOC_ID']
//         	,'WORK_TYPE'	: 'VIEW'
//         	,'target'		: 'MA_A20_030_020_150'
//         }
//         let json = JSON.stringify(obj);
//         window.parent.cfn_openTabSearch(json);
// 	}
    
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
    
    /**
     * 작성부서 팝업
     */
    var fn_compopup1 = function() {
    	
    	//type B 형 팝업
    	var addParams = [];	//bizcompId 의 파라미터에 따라 추가할것
    	var p_find1	= gfnma_nvl(SBUxMethod.get("srch-txtcreated-dept-name"));
    	var p_day	= gfnma_date4();
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG001'
    		,popupType				: 'B'
    		,whereClause			: addParams
   			,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
   			,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
   			,searchInputValues		: ["", 				p_find1,		p_day]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,height					: '400px'
   			,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
   			,tableColumnNames		: ["BGNG_YMD",	"SITE_NM", 	"DEPT_NM",  	"SITE_CD"]
   			,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('srch-txtcreated-dept-name', data.DEPT_NM);
				SBUxMethod.set('srch-txtcreated-dept-code', data.DEPT_CD);
			},
    	});
  	}        
    
    /**
     * 청구부서 팝업
     */
    var fn_compopup2 = function() {
    	
    	//type B 형 팝업
    	var addParams = [];	//bizcompId 의 파라미터에 따라 추가할것
    	var p_find1	= gfnma_nvl(SBUxMethod.get("srch-txtpayee-dept-name"));
    	var p_day	= gfnma_date4();
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG001'
    		,popupType				: 'B'
    		,whereClause			: addParams
   			,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
   			,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
   			,searchInputValues		: ["", 				p_find1,		p_day]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,height					: '400px'
   			,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
   			,tableColumnNames		: ["BGNG_YMD",	"SITE_NM", 	"DEPT_NM",  	"SITE_CD"]
   			,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('srch-txtpayee-dept-name', data.DEPT_NM);
				SBUxMethod.set('srch-txtpayee-dept-code', data.DEPT_CD);
			},
    	});
  	}        
    
    /**
     * 작성자 팝업
     */
    var fn_compopup3 = function() {
    	
    	//type A 형 팝업
    	
        var searchText 		= gfnma_nvl(SBUxMethod.get("srch-txtcreated-by-name"));
        var replaceText0 	= "_USER_ID_";
        var replaceText1 	= "_USER_NM_";
        var strWhereClause 	= "AND A.USER_ID LIKE '%" + replaceText0 + "%' AND A.USER_NM LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사용자 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_USER_02'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["사용자ID", 	"사용자명"]
   			,searchInputFields		: ["USER_ID", 	"USER_NM"]
   			,searchInputValues		: ["", 			searchText]
    		,width					: '600px'
    		,height					: '400px'
   			,tableHeader			: ["사용자", 	"사용자명", 	"부서코드", 	"부서명"]
   			,tableColumnNames		: ["USER_ID", 	"USER_NM",  	"DEPT_CD", 		"DEPT_NM"]
			,tableColumnWidths		: ["100px", 	"100px", 		"100px", 		"200px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('srch-txtcreated-by-name', data.USER_NM);
				SBUxMethod.set('srch-txtcreated-by-code', data.USER_ID);
			},
    	});
  	}        
    
    /**
     * 실사용자 팝업
     */
    var fn_compopup4 = function() {
    	
    	//type A 형 팝업
    	
        var searchText 		= gfnma_nvl(SBUxMethod.get("srch-txtpayee-name"));
        var replaceText0 	= "_USER_ID_";
        var replaceText1 	= "_USER_NM_";
        var strWhereClause 	= "AND A.USER_ID LIKE '%" + replaceText0 + "%' AND A.USER_NM LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사용자 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_USER_02'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["사용자ID", 	"사용자명"]
   			,searchInputFields		: ["USER_ID", 	"USER_NM"]
   			,searchInputValues		: ["", 			searchText]
			,width					: '600px'
    		,height					: '400px'
   			,tableHeader			: ["사용자", 	"사용자명", 	"부서코드", 	"부서명"]
   			,tableColumnNames		: ["USER_ID", 	"USER_NM",  	"DEPT_CD", 		"DEPT_NM"]
   			,tableColumnWidths		: ["100px", 	"100px", 		"100px", 		"200px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('srch-txtpayee-name', data.USER_NM);
				SBUxMethod.set('srch-txtpayee-code', data.USER_ID);
			},
    	});
  	}        
        
    /**
     * 복수코드 팝업
     */
    var fn_compopup5 = function() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
		SBUxMethod.openModal('modal-compopup3');
		
    	compopup3({
    		height			: '400px'
    		,separator		: '|'
   			,callbackEvent	: function (data){
   				console.log('callback data:', data);
   				_chkmulti_doc_params = data;
   			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
  	}       
        
    /**
     * 전표출력
     */
    var fn_btnPrint = function() {
 		let Fig2200GridCheckedList 		= Fig2200Grid.getCheckedRows(Fig2200Grid.getColRef("CHECK_YN"), true);
 		let Fig2200GridCheckedRowsData 	= Fig2200Grid.getCheckedRowData(Fig2200Grid.getColRef("CHECK_YN"));
 
 		if (Fig2200GridCheckedRowsData.length < 1) {
 			gfn_comAlert("E0000", "전표를 선택해주세요.");
 			return;
 		}else if(Fig2200GridCheckedRowsData.length == 1){
 			
 			SBUxMethod.attr('modal-comPopFig1000Report', 'header-title', '전표 출력');
 			SBUxMethod.openModal('modal-comPopFig1000Report');
 			comPopFig1000Report({
 				height			: '200px'
 				,width			: '400px'
 				,param			: {
 					P_WORK_TYPE		: 'DOC'
 					,P_DOC_ID		: Fig2200GridCheckedRowsData[0].data.DOC_ID
 					,P_COMP_CODE	: Fig2200GridCheckedRowsData[0].data.COMP_CODE
 					,P_CLIENT_CODE	: gv_ma_selectedClntCd
 				}
 			});
 		}
  	}       
        
    /**
     * 지급변경이력
     */
    var fn_btnPayLog = function() {
    	
		var p_cbofi_org_code = gfnma_nvl(SBUxMethod.get("srch-cbofi-org-code"))
		if(!p_cbofi_org_code){
 			gfn_comAlert("E0000","APC를 선택하세요");
			return;
		}
 
        var nRow = Fig2200Grid.getRow();
		if (nRow < 1) {
 			gfn_comAlert("E0000","회계전표내역을 선택해야 조회할 수 있습니다.");
            return;
		}
        let rowData = Fig2200Grid.getRowData(nRow);
    	
    	SBUxMethod.attr('modal-compopfig2250', 'header-title', '지급조건변경이력');
		SBUxMethod.openModal('modal-compopfig2250');
		
		compopfig2250({
    		height			: '600px'
    		,param			: {
    			p_cbofi_org_code	: p_cbofi_org_code
    			,p_doc_id			: rowData['DOC_ID']
    		}
   			,callbackEvent	: function (data){
   				console.log('callback data:', data);
   			},
    	});
  	}       
        
    /**
     * 세부내역
     */
    var fn_btnDocDetail = function() {
    	//alert('매입송장등록 화면(매입전표작성) FIG3510_AP 으로 이동');
    	
        var nRow = Fig2200Grid.getRow();
		if (nRow < 1) {
            return;
		}
        let rowData = Fig2200Grid.getRowData(nRow);
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
      	var chkList 		= Fig2200Grid.getUpdateData(true)
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
 
		let p_cbofi_org_code	= gfnma_nvl(SBUxMethod.get("srch-cbofi-org-code"));
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
 			,V_P_UNPOSTING_TYPE			: ''
 			,V_P_UNPOSTING_DATE			: ''
 				
 			,V_P_FORM_ID				: p_formId
 			,V_P_MENU_ID				: p_menuId
 			,V_P_PROC_ID				: ''
 			,V_P_USERID					: p_userId
 			,V_P_PC						: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2200S1.do", {
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
      	var chkList 		= Fig2200Grid.getUpdateData(true)
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
    	
    	console.log('fn_docCancelPop this');
    	SBUxMethod.attr('modal-compopup4', 'header-title', '전표전기취소');
    	compopup4({
    		param					: {}
			,callbackEvent			: function (data){
				console.log('callback data:', data);
				if(gfn_comConfirm("Q0001", "전기취소")){
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
 
		let p_cbofi_org_code	= gfnma_nvl(SBUxMethod.get("srch-cbofi-org-code"));
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
 
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2200S1.do", {
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
     * 전기+해제
     */
    var fn_btnAllComplete = function() {
    	
      	var p_strdoc_id		= '';
      	var chkList 		= Fig2200Grid.getUpdateData(true)
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
 
		let p_cbofi_org_code	= gfnma_nvl(SBUxMethod.get("srch-cbofi-org-code"));
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
 			,V_P_UNPOSTING_TYPE			: ''
 			,V_P_UNPOSTING_DATE			: ''
 				
 			,V_P_FORM_ID				: p_formId
 			,V_P_MENU_ID				: p_menuId
 			,V_P_PROC_ID				: ''
 			,V_P_USERID					: p_userId
 			,V_P_PC						: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/updateFig2200S1.do", {
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
      	var chkList 		= Fig2200Grid.getUpdateData(true)
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
      	var chkList 		= Fig2200Grid.getUpdateData(true)
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
     * 일괄삭제
     */
    var fn_btnDelete = function() {
    	
    	var chk1			= false;
    	var chk2			= false;
    	
      	var p_strdoc_id		= '';
      	var chkList 		= Fig2200Grid.getUpdateData(true)
		for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i].data;
			if(obj['CHECK_YN']=='Y'){
				if(obj['DOC_STATUS']=='6'){
					chk1 = true;
					break;
				} else {
					if(obj['DOC_TYPE']=='16' || obj['DOC_TYPE']=='17' || obj['DOC_TYPE']=='18' || obj['DOC_TYPE']=='19' || obj['DOC_TYPE']=='39' ||
						obj['DOC_TYPE']=='81' || obj['DOC_TYPE']=='92' || obj['DOC_TYPE']=='93' || obj['DOC_TYPE']=='95' || obj['DOC_TYPE']=='99' ||
						obj['DOC_TYPE']=='98' || obj['DOC_TYPE']=='97' 
					){
						if(obj['DOC_ID']){
							p_strdoc_id += obj['DOC_ID'] + '|';
						}
					} else {
						chk2 = true;
						break;
					} 					
				}
			}
		}
		//console.log('p_strdoc_id:' , p_strdoc_id);      	 
		if(chk1){
      		gfn_comAlert("E0000","최종완료를 제외한 건만 일괄결재가 가능합니다.");
			return;      		 
		}
		if(chk2){
      		gfn_comAlert("E0000","삭제할 수 없는 전표유형입니다.");
			return;      		 
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
    	
		let sp_txtappr_opinion	= gfnma_nvl(SBUxMethod.get("srch-txtappr-opinion"));
    	
    	var chk1				= false;
    	var chk2				= false;
      	var p_strappr_id			= '';
      	var p_txtappr_opinion	= '';
      	var chkList 			= Fig2200Grid.getUpdateData(true)
		for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i].data;
			if(obj['CHECK_YN']=='Y'){
				if(obj['DOC_STATUS']=='3' && obj['APPR_ID']){
					if(obj['CONFIRM_EMP_CODE'] == p_ss_empCode || obj['PROXY_EMP_CODE'] == p_ss_empCode){
						p_strappr_id 		+= obj['APPR_ID'] + '|';
						if(sp_txtappr_opinion){
							p_txtappr_opinion 	+= sp_txtappr_opinion + '|';
						}
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
    	
		let sp_txtappr_opinion	= gfnma_nvl(SBUxMethod.get("srch-txtappr-opinion"));
		if(!sp_txtappr_opinion){
      		gfn_comAlert("E0000","결재의견을 입력하세요");
			return;      		 
		}
    	
    	var chk1				= false;
    	var chk2				= false;
      	var p_strappr_id			= '';
      	var p_txtappr_opinion	= '';
      	var chkList 			= Fig2200Grid.getUpdateData(true)
		for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i].data;
			if(obj['CHECK_YN']=='Y'){
				if(obj['DOC_STATUS']=='3' && obj['APPR_ID']){
					if(obj['CONFIRM_EMP_CODE'] == p_ss_empCode || obj['PROXY_EMP_CODE'] == p_ss_empCode){
						p_strappr_id 		+= obj['APPR_ID'] + '|';
						p_txtappr_opinion 	+= sp_txtappr_opinion + '|';
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
    
    function fn_createGridTab1Fig2210() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTab1';
	    SBGridProperties.id 				= 'Tab1Fig2210Grid';
	    SBGridProperties.jsonref 			= 'jsonTab1Fig2210';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
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
                subtotalrow : {
                    1: {
                        titlecol: 0,
                        titlevalue: '합계',
                        style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                        stylestartcol: 0
                    },
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
            
            {caption: ["전표유형"],					ref: 'DOC_TYPE_NAME', 			type:'output',  	width:'150px', 		style:'text-align:left'},
            {caption: ["전표상태"], 				ref: 'DOC_STATUS_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"], 					ref: 'ITEM_SEQ', 				type:'output',		width:'60px',  		style:'text-align:left'},
            {caption: ["TYPE"],    					ref: 'LINE_TYPE_NAME', 			type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["차/대"],    				ref: 'DEBIT_CREDIT_NAME', 		type:'output',  	width:'70px',  		style:'text-align:left'},
            {caption: ["부가세유형"],  				ref: 'VAT_NAME', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["계정코드"],    				ref: 'ACCOUNT_CODE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["계정과목명"],  				ref: 'ACCOUNT_NAME', 			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["차변(통화)"],				ref: 'ORIGINAL_DR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["대변(통화)"],				ref: 'ORIGINAL_CR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["차변(전표)"],				ref: 'FUNCTIONAL_DR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["대변(전표)"],				ref: 'FUNCTIONAL_CR_AMT',		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["부서"],	   					ref: 'DEBIT_CREDIT_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["원가중심점"],				ref: 'COST_CENTER_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["적요"],						ref: 'DESCRIPTION',				type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["비고"],						ref: 'ETC',						type:'output',  	width:'100px',  	style:'text-align:left'},
        ];
 
        Tab1Fig2210Grid = _SBGrid.create(SBGridProperties);
        //Tab1Fig2210Grid.bind('click', 'fn_viewTab1Fig2210Grid');
    }    
    
    /**
     * 목록 가져오기
     */
    const fn_setTab1Fig2210Grid = async function(wtype, p_doc_id) {
 
		Tab1Fig2210Grid.clearStatus();
 
		var p_cbofi_org_code 		= gfnma_nvl(SBUxMethod.get("srch-cbofi-org-code"))
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_cbofi_org_code
			,V_P_DOC_ID             : p_doc_id
			,V_P_EMP_CODE           : ''
			
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
  						KEY_ID					: gfnma_nvl2(item.KEY_ID),			
  						ITEM_ID					: gfnma_nvl2(item.ITEM_ID),			
  						ITEM_SEQ				: gfnma_nvl2(item.ITEM_SEQ),			
  						LINE_TYPE				: gfnma_nvl2(item.LINE_TYPE),			
  						LINE_TYPE_NAME			: gfnma_nvl2(item.LINE_TYPE_NAME),			
  						DEBIT_CREDIT			: gfnma_nvl2(item.DBSD_CRSD),			
  						DEBIT_CREDIT_NAME		: gfnma_nvl2(item.DEBIT_CREDIT_NAME),			
  						VAT_TYPE				: gfnma_nvl2(item.VAT_TYPE),
  						VAT_NAME				: gfnma_nvl2(item.VAT_NM),
  						DEPT_CODE				: gfnma_nvl2(item.DEPT_CD),
  						
  						COST_CENTER_CODE		: gfnma_nvl2(item.CSTCT_CD),
  						COST_CENTER_NAME		: gfnma_nvl2(item.CSTCD_NM),
  						PROJECT_CODE			: gfnma_nvl2(item.PJT_CD),
  						ORIGINAL_CR_AMT			: gfnma_nvl2(item.ORGNL_CRSD_AMT),
  						ORIGINAL_DR_AMT			: gfnma_nvl2(item.ORGNL_DRSD_AMT),
  						FUNCTIONAL_CR_AMT		: gfnma_nvl2(item.CNVS_CRSD_AMT),
  						FUNCTIONAL_DR_AMT		: gfnma_nvl2(item.CNVS_DRSD_AMT),
  						TXN_QTY					: gfnma_nvl2(item.TRSC_QTY),
  						ACCOUNT_CODE			: gfnma_nvl2(item.ACNTL_CD),
  						ACCOUNT_NAME			: gfnma_nvl2(item.ACNT_NM),
  						
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
  						
  						ACC_ITEM_NAME1			: gfnma_nvl2(item.ACNT_MNG_ARTCL_NM1),
  						ACC_ITEM_NAME2			: gfnma_nvl2(item.ACNT_MNG_ARTCL_NM2),
  						ACC_ITEM_NAME3			: gfnma_nvl2(item.ACNT_MNG_ARTCL_NM3),
  						ACC_ITEM_NAME4			: gfnma_nvl2(item.ACNT_MNG_ARTCL_NM4),
  						ACC_ITEM_NAME5			: gfnma_nvl2(item.ACNT_MNG_ARTCL_NM5),
  						ACC_ITEM_NAME6			: gfnma_nvl2(item.ACNT_MNG_ARTCL_NM6),
  						ACC_ITEM_NAME7			: gfnma_nvl2(item.ACNT_MNG_ARTCL_NM7),
  						ACC_ITEM_NAME8			: gfnma_nvl2(item.ACNT_MNG_ARTCL_NM8),
  						ACC_ITEM_NAME9			: gfnma_nvl2(item.ACNT_MNG_ARTCL_NM9),
  						ACC_ITEM_NAME10			: gfnma_nvl2(item.ACNT_MNG_ARTCL_NM10),
 
  						ACC_ITEM_YN1			: gfnma_nvl2(item.ACNT_MNG_ARTCL_YN1),
  						ACC_ITEM_YN2			: gfnma_nvl2(item.ACNT_MNG_ARTCL_YN2),
  						ACC_ITEM_YN3			: gfnma_nvl2(item.ACNT_MNG_ARTCL_YN3),
  						ACC_ITEM_YN4			: gfnma_nvl2(item.ACNT_MNG_ARTCL_YN4),
  						ACC_ITEM_YN5			: gfnma_nvl2(item.ACNT_MNG_ARTCL_YN5),
  						ACC_ITEM_YN6			: gfnma_nvl2(item.ACNT_MNG_ARTCL_YN6),
  						ACC_ITEM_YN7			: gfnma_nvl2(item.ACNT_MNG_ARTCL_YN7),
  						ACC_ITEM_YN8			: gfnma_nvl2(item.ACNT_MNG_ARTCL_YN8),
  						ACC_ITEM_YN9			: gfnma_nvl2(item.ACNT_MNG_ARTCL_YN9),
  						ACC_ITEM_YN10			: gfnma_nvl2(item.ACNT_MNG_ARTCL_YN10),
 
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
  						
  						ACC_CHARACTER			: gfnma_nvl2(item.INCPL_TYPE),
  						
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
  						
  						ITEM_CODE				: gfnma_nvl2(item.ITEM_CD),
  						UOM						: gfnma_nvl2(item.UNIT),
  						TXN_QTY1				: gfnma_nvl2(item.TXN_QTY1),
  						DEPT_NAME				: gfnma_nvl2(item.DEPT_NM),
  						DESCRIPTION				: gfnma_nvl2(item.DSCTN),
  						FI_ORG_CODE				: gfnma_nvl2(item.ACNTG_OGNZ_CD),
  						DOC_ID					: gfnma_nvl2(item.SLIP_ID),
  						DOC_NAME				: gfnma_nvl2(item.SLIP_NM),
  						DOC_TYPE				: gfnma_nvl2(item.SLIP_TYPE),
  						DOC_TYPE_NAME			: gfnma_nvl2(item.DOC_TYPE_NAME),
  						DOC_STATUS				: gfnma_nvl2(item.SLIP_STTS),
  						DOC_STATUS_NAME			: gfnma_nvl2(item.DOC_STATUS_NAME),
  						
  						ETC						: '',
  					}
  					jsonTab1Fig2210.push(msg);
  					totalRecordCount ++;
  				});
 
        		Tab1Fig2210Grid.rebuild();
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
    
    function fn_createGridTab2Fig2200() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTab2';
	    SBGridProperties.id 				= 'Tab2Fig2200Grid';
	    SBGridProperties.jsonref 			= 'jsonTab2Fig2200';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
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
                subtotalrow : {
                    1: {
                        titlecol: 0,
                        titlevalue: '합계',
                        style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                        stylestartcol: 0
                    },
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
            {caption: ["전표유형"],					ref: 'DOC_TYPE_NAME', 			type:'output',  	width:'120px', 		style:'text-align:left'},
            {caption: ["전표번호"],    				ref: 'DOC_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전표상태"], 				ref: 'DOC_STATUS_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급요청일자"], 			ref: 'PLANNED_PAY_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급일"], 					ref: 'PAY_DATE', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["통화"], 					ref: 'CURRENCY_CODE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["통화금액"], 				ref: 'ORIGINAL_AMOUNT', 		type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["전표금액"], 				ref: 'FUNCTIONAL_AMOUNT', 		type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["비고"], 					ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];
 
        Tab2Fig2200Grid = _SBGrid.create(SBGridProperties);
        //Tab2Fig2200Grid.bind('click', 'fn_viewTab2Fig2200Grid');
    }     
    
    /**
     * 목록 가져오기
     */
    const fn_setTab2Fig2200Grid = async function(wtype, p_doc_id) {
 
		Tab2Fig2200Grid.clearStatus();
 
		var p_cbofi_org_code 		= gfnma_nvl(SBUxMethod.get("srch-cbofi-org-code"))
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : ''
			,V_P_ACCT_RULE_CODE     : '' 
			,V_P_DOC_DATE           : ''
			,V_P_SITE_CODE          : ''
			,V_P_DOC_TYPE           : ''
			,V_P_DOC_STATUS         : ''
			,V_P_PAYEE_DEPT         : ''
			,V_P_PAYEE_CODE         : ''
			,V_P_CREATED_DEPT       : ''
			,V_P_CREATED_BY         : ''
			,V_P_ENTRY_DATE_FR      : ''
			,V_P_ENTRY_DATE_TO      : ''
			,V_P_REVERSE_FLAG       : ''
			,V_P_HOLD_FLAG          : '' 
			,V_P_APPR_ONLY_FLAG     : '' 
			,V_P_DOC_NAME           : '' 
			,V_P_DOC_NAME_D         : ''
			,V_P_DOC_ID             : p_doc_id
			,V_P_DESC               : ''
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig2200List.do", {
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
 
  	    		jsonTab2Fig2200.length = 0;
  	        	data.cv_2.forEach((item, index) => {
  					const msg = {
  						DOC_BATCH_NO			: gfnma_nvl2(item.SLIP_BTCH_NO),			
  						PLANNED_PAY_DATE		: gfnma_date5(gfnma_nvl2(item.PLAN_PAY_YMD)),			
  						PAY_DATE				: gfnma_date5(gfnma_nvl2(item.PAY_YMD)),			
  						DOC_TYPE				: gfnma_nvl2(item.SLIP_TYPE),			
  						DOC_TYPE_NAME			: gfnma_nvl2(item.DOC_TYPE_NAME),
  						DOC_NAME				: gfnma_nvl2(item.SLIP_NM),
  						DOC_ID					: gfnma_nvl2(item.SLIP_ID),			
  						DOC_STATUS				: gfnma_nvl2(item.SLIP_STTS),
  						DOC_STATUS_NAME			: gfnma_nvl2(item.DOC_STATUS_NAME),
  						CURRENCY_CODE			: gfnma_nvl2(item.CRN_CD),
  						ORIGINAL_AMOUNT			: gfnma_nvl2(item.ORGNL_AMT),
  						FUNCTIONAL_AMOUNT		: gfnma_nvl2(item.CNVS_AMT),  
  						ETC						: ''
  					}
  					jsonTab2Fig2200.push(msg);
  					totalRecordCount ++;
  				});
 
        		Tab2Fig2200Grid.rebuild();
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
    
    function fn_createGridTab3Fim3420() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTab3';
	    SBGridProperties.id 				= 'Tab3Fim3420Grid';
	    SBGridProperties.jsonref 			= 'jsonTab3Fim3420';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["순번"],						ref: 'STEP_SEQ', 				type:'output',  	width:'60px', 		style:'text-align:left'},
            {caption: ["구분"],    					ref: 'APPR_TYPE_NAME', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["결재구분"], 				ref: 'APPR_CATEGORY_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부서명"], 					ref: 'DEPT_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["직책"], 					ref: 'DUTY_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["이름"], 					ref: 'EMP_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["수임자명"], 				ref: 'PROXY_EMP_NAME', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["결재자명"], 				ref: 'UPDATE_EMP_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["승인결과"], 				ref: 'APPR_STATUS_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["결재의견"], 				ref: 'APPR_OPINION', 			type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption: ["비고"], 					ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];
 
        Tab3Fim3420Grid = _SBGrid.create(SBGridProperties);
        //Tab3Fim3420Grid.bind('click', 'fn_viewTab3Fim3420Grid');
    }     
    
    /**
     * 목록 가져오기
     */
    const fn_setTab3Fim3420Grid = async function(wtype, p_appr_id, p_doc_id, p_doc_type) {
 
		Tab3Fim3420Grid.clearStatus();
		p_appr_id = (p_appr_id) ? p_appr_id : '0';
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_APPR_ID        	: p_appr_id
			,V_P_SOURCE_NO     		: p_doc_id
			,V_P_SOURCE_TYPE        : p_doc_type
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFim3420List.do", {
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
  						STEP_SEQ				: gfnma_nvl(item.STP_SEQ),			
  						APPR_TYPE				: gfnma_nvl(item.APRV_TYPE), 					
  						APPR_TYPE_NAME			: gfnma_nvl(item.APPR_TYPE_NAME), 				
  						APPR_CATEGORY			: gfnma_nvl(item.APRV_CTGRY), 				
  						APPR_CATEGORY_NAME		: gfnma_nvl(item.APPR_CATEGORY_NAME),			
  						DEPT_NAME				: gfnma_nvl(item.DEPT_NM), 		
  						DUTY_CODE				: gfnma_nvl(item.JBTTL_CD), 		
  						DUTY_NAME				: gfnma_nvl(item.JBTTL_NM), 		
  						EMP_NAME				: gfnma_nvl(item.EMP_NM),
  						PROXY_EMP_NAME			: gfnma_nvl(item.PROXY_EMP_NAME),
  						UPDATE_EMP_NAME			: gfnma_nvl(item.UPDATE_EMP_NAME),
  						APPR_STATUS				: gfnma_nvl(item.APRV_STTS),		
  						APPR_STATUS_NAME		: gfnma_nvl(item.APPR_STATUS_NAME),	
  						APPR_DATE				: gfnma_date5(gfnma_nvl(item.APRV_YMD)),			
  						APPR_OPINION			: gfnma_nvl(item.APRV_OPNN),
  						ETC						: ''
  					}
  					jsonTab3Fim3420.push(msg);
  					totalRecordCount ++;
  				});
 
        		Tab3Fim3420Grid.rebuild();
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
