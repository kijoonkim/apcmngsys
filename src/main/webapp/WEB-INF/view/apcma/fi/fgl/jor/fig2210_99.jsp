<%
/**
 * @Class Name 		: fig2210_99.jsp
 * @Description 	: 전표등록 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.29
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.29   	장성주		최초 생성
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
	<title>title : 전표등록</title>
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
                    </h3><!-- 전표등록 -->
                </div>
                <div id="top_lable1" style="margin-left:auto">
                    <font style="top:5px">전표템플릿</font>
                </div>
                <div id="top_lable2" style="padding-left:10px;padding-right:10px">
					<div class="dropdown">
					    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="srch-compopup1-rulecode" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    	<font>원가마감전표</font>
					        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
					    </button>
					    <div class="dropdown-menu" aria-labelledby="srch-compopup1-rulecode" style="width:600px;height:150px;padding-top:0px;overflow:auto">
					    </div>
					</div> 
                </div>
                <div>
        			<sbux-checkbox 
        				id="srh-cost-class-check-yn" 
        				uitype="normal" 
        				text="원가유형제한" 
        				true-value="Y" 
        				false-value="N" 
       				></sbux-checkbox>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="SCM정보"  		id="sch-btn-scm" 	class="btn btn-sm btn-outline-danger" onclick="fn_fig2250pop"></sbux-button>
                    <sbux-button uitype="normal" text="파일첨부"  		id="sch-btn-file" 	class="btn btn-sm btn-outline-danger" onclick="fn_fig2250pop"></sbux-button>
                    <sbux-button uitype="normal" text="부서·적요수정"  	id="sch-btn-buseo" 	class="btn btn-sm btn-outline-danger" onclick="fn_fig2250pop"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전표복사"  		id="sch-btn-copy" 			class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
                    <sbux-button uitype="normal" text="결재"  			id="sch-btn-appr" 			class="btn btn-sm btn-outline-danger" onclick="fn_docAppr"></sbux-button>
                    <sbux-button uitype="normal" text="결재이력"  		id="sch-btn-apprhist" 		class="btn btn-sm btn-outline-danger" onclick="fn_docDetail"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전기처리"  		id="sch-btn-docProcess" 	class="btn btn-sm btn-outline-danger" onclick="fn_docProcess"></sbux-button>
                    <sbux-button uitype="normal" text="전기취소"  		id="sch-btn-docCancel" 		class="btn btn-sm btn-outline-danger" onclick="fn_docCancel"></sbux-button>
                    <sbux-button uitype="normal" text="보류해제"  		id="sch-btn-holdExit" 		class="btn btn-sm btn-outline-danger" onclick="fn_docHoldExit"></sbux-button>
                    <sbux-button uitype="normal" text="보류지정"  		id="sch-btn-holdPoint" 		class="btn btn-sm btn-outline-danger" onclick="fn_docHoldPoint"></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="출력"  			id="sch-btn-print" 			class="btn btn-sm btn-outline-danger" onclick="fn_docDelAll"></sbux-button>
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
  							<sbux-input  id="sch-txtsource-type2"  		name="sch-txtsource-type2" 		uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtinsert-userid"  	name="sch-txtinsert-userid" 	uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<sbux-select id="sch-fi-org-code" 			name="sch-fi-org-code" 			uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                       		<sbux-select id="sch-site-code" 			name="sch-site-code" 			uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                       		<sbux-select id="sch-hold-flag" 			name="sch-hold-flag" 			uitype="single" jsondata-ref="jsonHoldFlag" unselected-text="선택" class="form-control input-sm"></sbux-select>
  							<sbux-input  id="sch-base-scale"  			name="sch-base-scale" 			uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtopen-to-all-yn" 	name="sch-txtopen-to-all-yn" 	uitype="text" 	class="form-control input-sm" ></sbux-input>
  							<sbux-input  id="sch-txtopen-to-fcm-yn" 	name="sch-txtopen-to-fcm-yn" 	uitype="text" 	class="form-control input-sm" ></sbux-input>
                       		<!-- /hidden -->
                       		
	                        <tr>
	                            <th scope="row" class="th_bg">배치번호</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-doc-batch-no" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">회계기준</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="sch-acct-rule-code" name="sch-acct-rule-code" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">결의부서</th>
	                            <td colspan="2" class="td_input" >
	   								<sbux-input
										uitype="text"
										id="sch-dept-name"
										class="form-control input-sm"									
	   								></sbux-input>
									<sbux-input
										uitype="hidden"
										uitype="text"
										id="sch-dept-code"
										class="form-control input-sm"
	   								></sbux-input>
	                            </td>
	                            <td class="td_input" >
									<sbux-button
										class="btn btn-xs btn-outline-dark"
										text="찾기" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1"
									></sbux-button>
	                            </td>
	                            
	                            <td colspan="4" rowspan="7" class="td_input" >
	                            	<div id="panAccountSum" style="width:100%">
		                            	<font>계정과목별합계</font>
	                            	</div>
	                            </td>
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg">전표번호</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-doc-name" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">전표ID</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-doc-id" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">증빙번호</th>
	                            <td colspan="2" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		                                <sbux-select style="width:100px" id="sch-voucher-type" name="sch-voucher-type" uitype="single" jsondata-ref="jsonVoucherType" unselected-text="선택" class="form-control input-sm"></sbux-select>
		   								<sbux-input uitype="text" id="sch-voucher-no" class="form-control input-sm" ></sbux-input>
	                            	</div>
	                            </td>
	                            <td class="td_input" >
									<sbux-button
										id="btn-tax-view"
										class="btn btn-xs btn-outline-dark"
										text="확인" 
										onclick=""
									></sbux-button>
	                            </td>
	                            
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg">신고사업장</th>
	                            <td colspan="3" class="td_input" >
		                        	<sbux-select id="sch-tax-site-code" name="sch-tax-site-code" uitype="single" jsondata-ref="jsonTaxSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">종사업장</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="sch-sub-tax-site-code" name="sch-sub-tax-site-code" uitype="single" jsondata-ref="jsonSubTaxSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">매입송장번호</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-bill-no" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg">전표유형</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		                                <sbux-select id="sch-doc-type" name="sch-doc-type" uitype="single" jsondata-ref="jsonDocType" unselected-text="선택" class="form-control input-sm"></sbux-select>
		                                <sbux-select id="sch-doc-status" name="sch-doc-status" uitype="single" jsondata-ref="jsonDocStatus" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            	</div>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">현업결재일</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-approve-date" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">회계승인일</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		   								<sbux-input uitype="text" id="sch-posting-date" class="form-control input-sm" ></sbux-input>
		   								<sbux-input uitype="text" id="sch-posting-user" class="form-control input-sm" ></sbux-input>
	                            	</div>
	                            </td>
	                            
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg">전기일자</th>
	                            <td colspan="3" class="td_input" >
								    <sbux-datepicker
								            id="sch-doc-date"
								            name="sch-doc-date"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed">
								    </sbux-datepicker>                          
	                            </td>
	                            
	                            <th scope="row" class="th_bg">증빙일자</th>
	                            <td colspan="3" class="td_input" >
								    <sbux-datepicker
								            id="sch-voucher-receipt-date"
								            name="sch-voucher-receipt-date"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed">
								    </sbux-datepicker>                          
	                            </td>
	                            
	                            <th scope="row" class="th_bg">승인취소일</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		   								<sbux-input uitype="text" id="sch-unposting-date" class="form-control input-sm" ></sbux-input>
		   								<sbux-input uitype="text" id="sch-unposting-user" class="form-control input-sm" ></sbux-input>
	                            	</div>
	                            </td>
	                            
	                        </tr>    
	                        
	                        <tr>
	                            <th scope="row" class="th_bg">제목</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-description" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">역분개전표</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-reverse-doc-name" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">원전표</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="sch-orig-doc-name" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            
	                        </tr>    

	                        <tr>
	                            <th scope="row" class="th_bg">통화</th>
	                            <td colspan="11" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
		                                <sbux-select style="width:150px" id="sch-currency-code" name="sch-currency-code" uitype="single" jsondata-ref="jsonCurrencyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
		   								<sbux-input uitype="text" id="sch-exchange-type" class="form-control input-sm" ></sbux-input>
		   								<sbux-input uitype="text" id="sch-exchange-rate" class="form-control input-sm" ></sbux-input>
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
	                            <span>회계전표</span>
	                            <span id="sch-lblalert" style="font-size:12px;padding-left:20px;color:red">SCM전표 전기취소는 SCM에서만 가능합니다</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
	                    	<!-- 
							<a href="#" id="btn-copy-clear" class="cu-btn-clear" >
								<img src="../../../resource/images/clear.png" width="20px" /> 복사모드해제
							</a>
	                    	 -->
							<a href="#" id="btn1-row-add" class="cu-btn-plus" style="padding-left:10px" >
								<img src="../../../resource/images/plus.png" width="20px" /> 행추가
							</a>
							<a href="#" id="btn1-row-del" class="cu-btn-minus" style="padding-left:10px">
								<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
							</a>
						</div>
	                </div>
	                <div>
	                    <div id="sb-area-grdTop" style="height:200px; width:100%;">
	                    </div>
	                </div>
	                
                    <div style="display:flex;vertical-align:middle;float:left;padding-top:5px;padding-bottom:10px;margin-bottom:10px;width:100%;border:solid 1px #b2bad2">
                    	<font style="padding-left:10px">차변합계</font>
						<sbux-input style="width:150px;padding-left:10px" uitype="text" id="tot-numdr-sum" class="form-control input-sm" ></sbux-input>
                    	<font style="padding-left:20px">대변합계</font>
						<sbux-input style="width:150px;padding-left:10px" uitype="text" id="tot-numcr-sum" class="form-control input-sm" ></sbux-input>
                    	<font style="padding-left:20px">차이(통화)</font>
						<sbux-input style="width:150px;padding-left:10px" uitype="text" id="tot-numDiffWon" class="form-control input-sm" ></sbux-input>
                    	<font style="padding-left:20px">차이(전표)</font>
						<sbux-input style="width:150px;padding-left:10px" uitype="text" id="tot-numDiffFuntion" class="form-control input-sm" ></sbux-input>
	                </div>
	                
	                <div>
		                <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="normal"
							is-scrollable="false"
							title-target-id-array="tab1^tab2"
							title-text-array="부가세^관리항목">
						</sbux-tabs>
	                    <div class="tab-content">
	                    
							<div id="tab1" style="height:200px;">
								<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
									<font style="margin-right:auto;">부가세</font>
								</div>
			                    <div id="sb-area-grdTab1" style="height:180px; width:100%;">
			                    </div>
							</div>
							
							<div id="tab2" style="height:200px;">
								<div style="display:flex;justify-content:flex-start;width:100%;padding-bottom:10px">
									<font style="margin-right:auto;">관리항목</font>
								</div>
			                    <div id="sb-area-grdTab2" style="height:180px; width:100%;">
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
	var p_ss_fiDeleteUser 		= '${loginVO.maFI_DELETE_USER}';
	var p_ss_defaultAcctRule	= '${loginVO.maDefaultAcctRule}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	var p_ss_siteCode			= '${loginVO.maSiteCode}';
	var p_ss_deptCode			= '${loginVO.maDeptCode}';
	var p_ss_deptName			= '${loginVO.maDeptName}';
	var p_ss_currCode			= '${loginVO.maCurrCode}';
	
	var pg_state					= 'new';
	
    var pg_source_type			= '';	//파라미터 <== 다른 메뉴에서..
    var pg_fi_delete_user		= (p_ss_fiDeleteUser) ? p_ss_fiDeleteUser : '';
    var pg_strdoc_type			= '99';
    var pg_strdoc_status		= '1';
    
    var pg_vat_type_bizId		= '';	//그리드내(부가세유형) 팝업 bizId
    
    var pg_colcs_code_bizId		= '';	//그리드내(거래처) 팝업 bizId
    var pg_colcs_code_title		= '';	//그리드내(거래처) 팝업 타이틀
    var pg_colcs_code_field1	= '';	//그리드내(거래처) 컬럼명
    var pg_colcs_code_field2	= '';	//그리드내(거래처) 컬럼명
    
    var pg_rule_code_bizId		= '';	//멀티셀렉트 'srch-compopup1-rulecode' bizId
    var pg_rule_code_where		= '';	//멀티셀렉트 'srch-compopup1-rulecode' where
    
    var pg_doc_type_bizId		= '';	//셀텍트 'sch-doc-type' bizId
    var pg_doc_type_where		= '';	//셀텍트 'sch-doc-type' where
	//-----------------------------------------------------------

    var jsonFiOrgCode 			= []; // 사업단위
    var jsonSiteCode 			= []; 
    var jsonHoldFlag 			= []; 
    
    var jsonAcctRuleCode 		= []; // 회계기준
    var jsonVoucherType 		= []; // 증빙번호
    var jsonTaxSiteCode 		= []; // 신고사업장
    var jsonSubTaxSiteCode 		= []; // 총사업장
    var jsonDocType 			= []; // 전표유형
    var jsonDocStatus 			= []; // 전표유형
    var jsonCurrencyCode 		= []; // 통화
	
    var jsonLineType 			= []; // 라인유형
    var jsonDebitCredit 		= []; // 차/대
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['sch-fi-org-code'],				jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            gfnma_setComSelect(['sch-site-code'],				jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['sch-hold-flag'],				jsonHoldFlag, 		'L_COM036', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            
            // 회계기준
            gfnma_setComSelect(['sch-acct-rule-code'],			jsonAcctRuleCode, 	'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 증빙번호
            gfnma_setComSelect(['sch-voucher-type'],			jsonVoucherType, 	'L_FIG005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 신고사업장
            gfnma_setComSelect(['sch-tax-site-code'],			jsonTaxSiteCode, 	'L_ORG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TAX_SITE_CODE', 'TAX_SITE_NAME', 'Y', ''),
            // 종사업장
            gfnma_setComSelect(['sch-sub-tax-site-code'],		jsonSubTaxSiteCode, 'L_ORG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TAX_SITE_CODE', 'TAX_SITE_NAME', 'Y', ''),
            // 전표유형
            gfnma_setComSelect(['sch-doc-type'],				jsonDocType, 		pg_doc_type_bizId, pg_doc_type_where, gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['sch-doc-status'],				jsonDocStatus, 		'L_FIG002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 통화
            gfnma_setComSelect(['sch-currency-code'],			jsonCurrencyCode, 	'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
            
            // 그리드내 라인유형
			gfnma_setComSelect([], 								jsonLineType, 		'L_FIM052', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 그리드내 차/대
			gfnma_setComSelect([], 								jsonDebitCredit, 	'L_FIG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            
			//전표템플릿
			gfnma_multiSelectInit({
				target			: ['#srch-compopup1-rulecode']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: pg_rule_code_bizId
				,whereClause	: pg_rule_code_where
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'RULE_CODE'
				,colLabel		: 'RULE_NAME'
				,columns		:[
		            {caption: "rule코드",		ref: 'RULE_CODE',			width:'100px',  	style:'text-align:left'},
		            {caption: "rule코드명", 	ref: 'RULE_NAME',    		width:'200px',  	style:'text-align:left'},
		            {caption: "전표유형", 		ref: 'DOC_TYPE',    		width:'100px',  	style:'text-align:left'},
		            {caption: "ap_doc_yn", 		ref: 'AP_DOC_YN',    		width:'100px',  	style:'text-align:left'},
		            {caption: "ar_doc_yn", 		ref: 'AR_DOC_YN',    		width:'100px',  	style:'text-align:left'},
				]
			})
		]);
	}	

	async function fn_init() {
		
		if(pg_state=='new'){
			pg_vat_type_bizId		= 'P_ACCOUNT_POPUP_LINE_Q';
			
    		pg_colcs_code_bizId 	= 'P_CS_ALL';
    		pg_colcs_code_title 	= '거래처';
    		pg_colcs_code_field1 	= 'CS_CODE';
    		pg_colcs_code_field2 	= 'CS_NAME';
    		
    		pg_rule_code_bizId		= 'L_RULE';
    		pg_rule_code_where		= "AND manual_doc_write_yn = 'Y'";
    		
    		pg_doc_type_bizId		= 'L_FIM051';
    		pg_doc_type_where		= "AND manual_doc_write_yn = 'Y'";
		}
		//select init
  		await fn_initSBSelect()
		//화면셋팅
    	fn_state(pg_state);
	}    
    
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_init();
    	fn_createGrid2210();	
    });

    /**
     * 화면 state 변경
     */
    function fn_state(type) {
    	
    	//참고용 콤포넌트 숨기기
		SBUxMethod.hide('sch-txtsource-type2');
		SBUxMethod.hide('sch-txtinsert-userid');
		SBUxMethod.hide('sch-fi-org-code');
		SBUxMethod.hide('sch-site-code');
		SBUxMethod.hide('sch-hold-flag');
		SBUxMethod.hide('sch-base-scale');
		SBUxMethod.hide('sch-txtopen-to-all-yn');
		SBUxMethod.hide('sch-txtopen-to-fcm-yn');
		//...................................................
		
    	if(type=='new'){
    		//신규
    		$('#sch-lblalert').hide();
        	if(!pg_source_type){
        		pg_source_type = 'MANUAL';
        	}
    		SBUxMethod.set('sch-txtsource-type2', 		pg_source_type);
    		SBUxMethod.set('sch-txtinsert-userid', 		p_userId);
    		SBUxMethod.set('sch-acct-rule-code', 		p_ss_defaultAcctRule);
    		SBUxMethod.set('sch-doc-type', 				pg_strdoc_type);
    		SBUxMethod.set('sch-doc-status', 			pg_strdoc_status);
    		SBUxMethod.set('sch-fi-org-code', 			p_ss_fiOrgCode);
    		SBUxMethod.set('sch-site-code', 			p_ss_siteCode);
    		SBUxMethod.set('sch-dept-code', 			p_ss_deptCode);
    		SBUxMethod.set('sch-dept-name', 			p_ss_deptName);
    		SBUxMethod.set('sch-hold-flag', 			"Y");
    		SBUxMethod.set('sch-tax-site-code', 		"T02");
    		
    		SBUxMethod.attr('sch-acct-rule-code', 		'readonly', false);
    		SBUxMethod.attr('sch-fi-org-code', 			'readonly', false);
    		SBUxMethod.attr('sch-site-code', 			'readonly', false);
    		
    		$('#top_lable1').show();
    		$('#top_lable2').show();
    		SBUxMethod.attr('sch-btn-file', 			'disabled', true);
    		
    		SBUxMethod.set('sch-doc-date', 				gfnma_date4());
    		SBUxMethod.set('sch-voucher-receipt-date', 	gfnma_date4());
    		SBUxMethod.set('sch-currency-code', 		p_ss_currCode);
    		SBUxMethod.set('sch-base-scale', 			'1');
    		SBUxMethod.set('sch-exchange-rate', 		'1');
    		
    		SBUxMethod.attr('sch-doc-type', 			'readonly', false);

            //합계표시 보여주기 결정
			gfnma_getComCode({
					workType		: 'DETAIL_01'
					,groupCategory	: ''
					,groupCode		: 'SYS601'
					,groupName		: ''
					,subCode		: ''
					,extraField1	: 'FIG2210'
					,extraField2	: 'panAccountSum'
					,extraField3	: 'N'
					,extraField3	: 'N'
					,extraField3	: 'N'
					,formId			: p_formId
					,menuId			: p_menuId					
				}
				,function(data){
					if(data.length>0){
			            $('#panAccountSum').hide();
					}
				}
			);
            
    		//원가유형제한
    		if(p_ss_isAccountManager || p_ss_issAccountChief){
    			SBUxMethod.show('srh-cost-class-check-yn');
        		SBUxMethod.set('sch-txtopen-to-all-yn', 	"N");
        		SBUxMethod.set('sch-txtopen-to-fcm-yn', 	"N");
    			SBUxMethod.hide('sch-btn-copy');
    		} else {
    			SBUxMethod.hide('srh-cost-class-check-yn');
        		SBUxMethod.set('sch-txtopen-to-all-yn', 	"Y");
        		SBUxMethod.set('sch-txtopen-to-fcm-yn', 	"Y");
    			SBUxMethod.hide('sch-btn-copy');
    		}
			SBUxMethod.set('srh-cost-class-check-yn', 'Y');
    			
    		let p_sch_voucher_type = SBUxMethod.get('sch-voucher-type');
    		if(p_sch_voucher_type=='A' || p_sch_voucher_type=='B' || p_sch_voucher_type=='C'){
    			SBUxMethod.show('btn-tax-view');
    		} else {
    			SBUxMethod.hide('btn-tax-view');
    		}
    		
    		fn_setFig2210Grid('DEFAULTRULE');
    		
    	} else {
    		//전표조회에서 오는 경우
    		
    	}
    }
    
    /**
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#srchArea1');
    }
    
    /**
     * 결의부서 팝업
     */
    var fn_compopup1 = function() {
    	
    	//type B 형 팝업
    	var addParams = [];	//bizcompId 의 파라미터에 따라 추가할것
    	var p_find1	= gfnma_nvl(SBUxMethod.get("sch-dept-name"));
    	var p_day	= gfnma_date4();
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				SBUxMethod.set('sch-dept-name', data.DEPT_NAME);
				SBUxMethod.set('sch-dept-code', data.DEPT_CODE);
			},
    	});
  	}   
    
    //grid Mast 초기화
    var Fig2210Grid; 			// 그리드를 담기위한 객체 선언
    var jsonFig2210 = []; 		// 그리드의 참조 데이터 주소 선언

    function fn_createGrid2210() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTop';
	    SBGridProperties.id 				= 'Fig2210Grid';
	    SBGridProperties.jsonref 			= 'jsonFig2210';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
//        SBGridProperties.frozencols 		= 9;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= ['seq'];
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	{caption: [""], ref: 'CHECK_YN', type: 'checkbox', width: '40px', style: 'text-align:center',
        	    typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
        	        checkedvalue: 'Y', uncheckedvalue: 'N'
        	    }
        	},        	
            {caption: ["순번"],						ref: 'ITEM_SEQ', 				type:'output', 		width:'50px',  		style:'text-align:left'},
            {caption: ["라인유형"],					ref: 'LINE_TYPE', 				type:'combo',  		width:'80px',  		style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonLineType',
					label		: 'label',
					value		: 'value',
					displayui :true, 
					oneclickedit: true
            	}
            },
            {caption: ["차/대"],					ref: 'DEBIT_CREDIT', 			type:'combo',  		width:'60px',  		style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonDebitCredit',
					label		: 'label',
					value		: 'value',
					displayui :true, 
					oneclickedit: true
            	}
            },
            
            {caption: ["부가세유형"], 				ref: 'VAT_TYPE',    			type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn1',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup1(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["부가세유형명"], 			ref: 'VAT_TYPE_NAME', 			type:'input',		width:'100px',  	style:'text-align:left'},
            
            {caption: ["거래처"], 					ref: pg_colcs_code_field1,    	type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: [''], 						ref: 'btn2',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup2(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["거래처명"], 				ref: pg_colcs_code_field2, 		type:'input',		width:'100px',  	style:'text-align:left'},
            
            {caption: ["기타"], 					ref: 'ETC', 					type:'output',		width:'100px',  	style:'text-align:left'},
        ];

        Fig2210Grid = _SBGrid.create(SBGridProperties);
        Fig2210Grid.bind('click', 'fn_viewFig2210GridEvent');
    }
    
    //상세정보 보기
    function fn_viewFig2210GridEvent() {
    	
        var nRow = Fig2210Grid.getRow();
		if (nRow < 1) {
            return;
		}
        let rowData = Fig2210Grid.getRowData(nRow);
		console.log(rowData);        
    }
    
    /**
     * 그리드내 팝업(부가세유형) 조회
     */
	function fn_gridPopup1(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2210Grid.getCellData(row, 5) 
        let cellData2 = Fig2210Grid.getCellData(row, 7) 
    	fn_gridPopup1Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(부가세유형) 오픈
     */
    var fn_gridPopup1Show = function(row, col, cellData1, cellData2) {
    	
        var searchText1 	= cellData1;
        var searchText2 	= cellData2;
    	var addParams = ['NULL', 'NULL'];	
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부가세유형');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: pg_vat_type_bizId
       		,popupType				: 'B'
    		,whereClause			: addParams
       		,searchCaptions			: ["부가세코드", 	"부가세명",		]
   			,searchInputFields		: ["VAT_CODE", 		"VAT_NAME",		]
   			,searchInputValues		: [searchText1, 	searchText2,	]
			,searchInputTypes		: ["input", 		"input",		]		//input, datepicker가 있는 경우
    		,width					: '600px'
    		,height					: '300px'
   			,tableHeader			: ["부가세코드", 	"부가세명",		"부가세유형",		"불공제여부"]
   			,tableColumnNames		: ["VAT_CODE", 		"VAT_NAME",		"VAT_TYPE_CODE",	"NONDED_YN"]
   			,tableColumnWidths		: ["100px", 		"200px",		"100px",			"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2210Grid.setCellData(row, 5, 	data['VAT_CODE'], true, true);
				Fig2210Grid.setCellData(row, 7, 	data['VAT_NAME'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    /**
     * 그리드내 팝업(거래처) 조회
     */
	function fn_gridPopup2(event, row, col) {
		event.stopPropagation();	
        let cellData1 = Fig2210Grid.getCellData(row, 8) 
        let cellData2 = Fig2210Grid.getCellData(row, 10) 
    	fn_gridPopup2Show(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(거래처) 오픈
     */
    var fn_gridPopup2Show = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_BIZ_REGNO_"; 
        var replaceText2 	= "_CS_NAME_"; 
        var strWhereClause 	= "AND A.CS_CODE LIKE '%" + replaceText0 + "%' AND A.BIZ_REGNO LIKE '%" + replaceText1 + "%' " + " AND A.CS_NAME LIKE '%" + replaceText2 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: pg_colcs_code_bizId
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["고객사코드", 	"사업자번호",	"고객사명"]
   			,searchInputFields		: ["CS_CODE", 		"BIZ_REGNO",	"CS_NAME"]
   			,searchInputValues		: [cellData1, 		'',				cellData2]
			,searchInputTypes		: ["input", 		"input",		"input"]		//input, datepicker가 있는 경우
    		,width					: '1000px'
    		,height					: '500px'
   			,tableHeader			: ["거래처코드", 	"거래처명",		"사업자번호",		"거래중지여부",		"거래처유형",	"구매처",		"판매처",	"수금기준",			"수금기준명",		"수금방법",		"원천세대상여부"]
   			,tableColumnNames		: ["CS_CODE", 		"CS_NAME",		"BIZ_REGNO",		"TXN_STOP_YN",		"CS_GROUP",		"PURCHASE_YN",	"SALE_YN",	"PAY_TERM_CODE",	"PAY_TERM_NAME",	"PAY_METHOD",	"WITHHOLD_TAX_YN"]
   			,tableColumnWidths		: ["80px", 			"200px",		"100px",			"100px",			"200px",		"70px",			"70px",		"70px",				"150px",			"70px",			"120px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2210Grid.setCellData(row, 8, 	data['CS_CODE'], true, true);
				Fig2210Grid.setCellData(row, 10, 	data['CS_NAME'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
        
    
    
	const fn_setFig2210Grid = async function (wtype){

		let p_fi_org_code		= gfnma_nvl(SBUxMethod.get("sch-fi-org-code"));
		let p_acct_rule_code	= gfnma_nvl(SBUxMethod.get("sch-acct-rule-code"));
		let p_doc_id			= gfnma_nvl(SBUxMethod.get("sch-doc-id"));
		let p_site_code			= gfnma_nvl(SBUxMethod.get("sch-site-code"));
		let p_dept_code			= gfnma_nvl(SBUxMethod.get("sch-dept-code"));
		let p_rule_code			= '';
		
		if(wtype=='RULE') {
			p_rule_code = gfnma_multiSelectGet('#srch-compopup1-rulecode'); 
		} else if(wtype=='DEFAULTRULE'){
			p_rule_code = gfnma_nvl(SBUxMethod.get("sch-doc-type"));
		} else {
			p_rule_code = '';
		}
		
		p_doc_id = (!p_doc_id) ? '0' : p_doc_id;
		
  	    var paramObj = { 
  				V_P_DEBUG_MODE_YN			: ''
  				,V_P_LANG_ID				: ''
				,V_P_COMP_CODE				: gv_ma_selectedApcCd
				,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
				
  				,V_P_FI_ORG_CODE			: p_fi_org_code
  				,V_P_ACCT_RULE_CODE			: p_acct_rule_code
  				,V_P_DOC_ID     			: p_doc_id
  				,V_P_ITEM_SEQ				: '0'
  				,V_P_SITE_CODE				: p_site_code
  				,V_P_DEPT_CODE				: p_dept_code
  				,V_P_ENTRY_DATE_FR			: ''
  				,V_P_ENTRY_DATE_TO			: ''
  				,V_P_RULE_CODE				: p_rule_code
  				,V_P_USER_ID				: p_userId
  				
  				,V_P_FORM_ID				: p_formId
  				,V_P_MENU_ID				: p_menuId
  				,V_P_PROC_ID				: ''
  				,V_P_USERID					: p_userId
  				,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig2210QList.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '5',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
		console.log(data);        		

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		jsonFig2210.length = 0;
  	        	data.cv_5.forEach((item, index) => {
  					const msg = {
  						CHECK_YN				: gfnma_nvl(item.CHECK_YN),			
  						ITEM_SEQ				: gfnma_nvl(item.ITEM_SEQ),			
  						LINE_TYPE				: gfnma_nvl(item.LINE_TYPE),			
  						ACCOUNT_CODE			: gfnma_nvl(item.ACCOUNT_CODE),			
  						ACCOUNT_NAME			: gfnma_nvl(item.ACCOUNT_NAME),
  						DEBIT_CREDIT			: gfnma_nvl(item.DEBIT_CREDIT),
  						SUPPLY_AMOUNT			: gfnma_nvl(item.SUPPLY_AMOUNT),
  						ACC_CATEGORY			: gfnma_nvl(item.ACC_CATEGORY),
  						
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

  						ACC_ITEM_NAME1			: gfnma_nvl(item.ACC_ITEM_NAME1),
  						ACC_ITEM_NAME2			: gfnma_nvl(item.ACC_ITEM_NAME2),
  						ACC_ITEM_NAME3			: gfnma_nvl(item.ACC_ITEM_NAME3),
  						ACC_ITEM_NAME4			: gfnma_nvl(item.ACC_ITEM_NAME4),
  						ACC_ITEM_NAME5			: gfnma_nvl(item.ACC_ITEM_NAME5),
  						ACC_ITEM_NAME6			: gfnma_nvl(item.ACC_ITEM_NAME6),
  						ACC_ITEM_NAME7			: gfnma_nvl(item.ACC_ITEM_NAME7),
  						ACC_ITEM_NAME8			: gfnma_nvl(item.ACC_ITEM_NAME8),
  						ACC_ITEM_NAME9			: gfnma_nvl(item.ACC_ITEM_NAME9),
  						ACC_ITEM_NAME10			: gfnma_nvl(item.ACC_ITEM_NAME10),
  						
  						ACC_ITEM_YN1			: gfnma_nvl(item.ACC_ITEM_YN1),
  						ACC_ITEM_YN2			: gfnma_nvl(item.ACC_ITEM_YN2),
  						ACC_ITEM_YN3			: gfnma_nvl(item.ACC_ITEM_YN3),
  						ACC_ITEM_YN4			: gfnma_nvl(item.ACC_ITEM_YN4),
  						ACC_ITEM_YN5			: gfnma_nvl(item.ACC_ITEM_YN5),
  						ACC_ITEM_YN6			: gfnma_nvl(item.ACC_ITEM_YN6),
  						ACC_ITEM_YN7			: gfnma_nvl(item.ACC_ITEM_YN7),
  						ACC_ITEM_YN8			: gfnma_nvl(item.ACC_ITEM_YN8),
  						ACC_ITEM_YN9			: gfnma_nvl(item.ACC_ITEM_YN9),
  						ACC_ITEM_YN10			: gfnma_nvl(item.ACC_ITEM_YN10),
  						
  						DATA_TYPE1				: gfnma_nvl(item.DATA_TYPE1),
  						DATA_TYPE2				: gfnma_nvl(item.DATA_TYPE2),
  						DATA_TYPE3				: gfnma_nvl(item.DATA_TYPE3),
  						DATA_TYPE4				: gfnma_nvl(item.DATA_TYPE4),
  						DATA_TYPE5				: gfnma_nvl(item.DATA_TYPE5),
  						DATA_TYPE6				: gfnma_nvl(item.DATA_TYPE6),
  						DATA_TYPE7				: gfnma_nvl(item.DATA_TYPE7),
  						DATA_TYPE8				: gfnma_nvl(item.DATA_TYPE8),
  						DATA_TYPE9				: gfnma_nvl(item.DATA_TYPE9),
  						DATA_TYPE10				: gfnma_nvl(item.DATA_TYPE10),
  						
  						POPUP_ID1				: gfnma_nvl(item.POPUP_ID1),
  						POPUP_ID2				: gfnma_nvl(item.POPUP_ID2),
  						POPUP_ID3				: gfnma_nvl(item.POPUP_ID3),
  						POPUP_ID4				: gfnma_nvl(item.POPUP_ID4),
  						POPUP_ID5				: gfnma_nvl(item.POPUP_ID5),
  						POPUP_ID6				: gfnma_nvl(item.POPUP_ID6),
  						POPUP_ID7				: gfnma_nvl(item.POPUP_ID7),
  						POPUP_ID8				: gfnma_nvl(item.POPUP_ID8),
  						POPUP_ID9				: gfnma_nvl(item.POPUP_ID9),
  						POPUP_ID10				: gfnma_nvl(item.POPUP_ID10),
  						
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
  						
  						ITEM_SOURCE_ID			: gfnma_nvl(item.ITEM_SOURCE_ID),
  						ITEM_SOURCE_TYPE		: gfnma_nvl(item.ITEM_SOURCE_TYPE),
  						SOURCE_RECORD_COUNT		: gfnma_nvl(item.SOURCE_RECORD_COUNT),
  						DEPT_CODE				: gfnma_nvl(item.DEPT_CODE),
  						DEPT_NAME				: gfnma_nvl(item.DEPT_NAME),
  						COST_CENTER_CODE		: gfnma_nvl(item.COST_CENTER_CODE),
  						COST_CENTER_NAME		: gfnma_nvl(item.COST_CENTER_NAME),
  						DESCRIPTION				: gfnma_nvl(item.DESCRIPTION),
  						VAT_TYPE				: gfnma_nvl(item.VAT_TYPE),
  						VAT_TYPE_NAME			: gfnma_nvl(item.VAT_TYPE_NAME),
  						PROJECT_YN				: gfnma_nvl(item.PROJECT_YN),
  						CS_CODE					: gfnma_nvl(item.CS_CODE),
  						CS_NAME					: gfnma_nvl(item.CS_NAME),
  						CURRENCY_CODE			: gfnma_nvl(item.CURRENCY_CODE),
  						EXCHANGE_RATE			: gfnma_nvl(item.EXCHANGE_RATE),
  						BASE_SCALE				: gfnma_nvl(item.BASE_SCALE),
  						EXCHANGE_TYPE			: gfnma_nvl(item.EXCHANGE_TYPE),
  						PAY_METHOD				: gfnma_nvl(item.PAY_METHOD),
  						EXPECTED_PAY_DATE		: gfnma_nvl(item.EXPECTED_PAY_DATE),
  						PAY_TERM_CODE			: gfnma_nvl(item.PAY_TERM_CODE),
  						PAY_TERM_NAME			: gfnma_nvl(item.PAY_TERM_NAME),
  						BASIS_TYPE				: gfnma_nvl(item.BASIS_TYPE),
  						VOUCHER_TYPE			: gfnma_nvl(item.VOUCHER_TYPE),
  						VOUCHER_NO				: gfnma_nvl(item.VOUCHER_NO),
  						PAYEE_CODE				: gfnma_nvl(item.PAYEE_CODE),
  						CARD_NO					: gfnma_nvl(item.CARD_NO),
  						VOUCHER_RECEIPT_DATE	: gfnma_nvl(item.VOUCHER_RECEIPT_DATE),
  						APPLY_COMPLETE_FLAG		: gfnma_nvl(item.APPLY_COMPLETE_FLAG),
  						WITHHOLD_FLAG			: gfnma_nvl(item.WITHHOLD_FLAG),
  						WITHHOLD_TAX_TYPE		: gfnma_nvl(item.WITHHOLD_TAX_TYPE),
  						SITE_CODE				: gfnma_nvl(item.SITE_CODE),
  						CREDIT_AREA				: gfnma_nvl(item.CREDIT_AREA),
  						FI_ORG_CODE				: gfnma_nvl(item.FI_ORG_CODE),
  						PO_LINE_NO				: gfnma_nvl(item.PO_LINE_NO),
  						SALES_PERSON			: gfnma_nvl(item.SALES_PERSON),
  						WITHHOLD_CS_CODE		: gfnma_nvl(item.WITHHOLD_CS_CODE),
  						WITHHOLD_TAX_TYPE2		: gfnma_nvl(item.WITHHOLD_TAX_TYPE2),
  						WITHHOLD_CS_CODE2		: gfnma_nvl(item.WITHHOLD_CS_CODE2),
  						APPLY_COMPLETE_DATE		: gfnma_nvl(item.APPLY_COMPLETE_DATE),
  						SALES_CS_CODE			: gfnma_nvl(item.SALES_CS_CODE),
  						HOLD_FLAG				: gfnma_nvl(item.HOLD_FLAG),
  						RELEASE_DATE			: gfnma_nvl(item.RELEASE_DATE),
  						RELEASE_USER			: gfnma_nvl(item.RELEASE_USER),
  						HOLD_DATE				: gfnma_nvl(item.HOLD_DATE),
  						HOLD_USER				: gfnma_nvl(item.HOLD_USER),
  						HOLD_REASON				: gfnma_nvl(item.HOLD_REASON),
  						PAY_BASE_DATE			: gfnma_nvl(item.PAY_BASE_DATE),
  						BILL_DUE_DATE			: gfnma_nvl(item.BILL_DUE_DATE),
  						BILL_DUE_DAY			: gfnma_nvl(item.BILL_DUE_DAY),
  						BILL_DUE_DAY_DATE		: gfnma_nvl(item.BILL_DUE_DAY_DATE),
  						PAY_TERM_ORIG			: gfnma_nvl(item.PAY_TERM_ORIG),
  						PROD_GROUP				: gfnma_nvl(item.PROD_GROUP),
  						BANK_ACCOUNT_SEQ		: gfnma_nvl(item.BANK_ACCOUNT_SEQ),
  						MATL_NO					: gfnma_nvl(item.MATL_NO),
  						PROD_ORDER_NO			: gfnma_nvl(item.PROD_ORDER_NO),
  						ORDER_NO				: gfnma_nvl(item.ORDER_NO),
  						SALES_NO				: gfnma_nvl(item.SALES_NO),
  						ETAX_TYPE				: gfnma_nvl(item.ETAX_TYPE),
  						AFTER_DUE_DATE_YN		: gfnma_nvl(item.AFTER_DUE_DATE_YN),
  						DUP_ISSUE_BILL_TYPE		: gfnma_nvl(item.DUP_ISSUE_BILL_TYPE),
  						EXCLUDE_REVENNU_AMT_YN	: gfnma_nvl(item.EXCLUDE_REVENNU_AMT_YN),
  						CARD_USE_TYPE			: gfnma_nvl(item.CARD_USE_TYPE),
  						CARD_NUM				: gfnma_nvl(item.CARD_NUM),
  						VAT_NOT_DEDUCTION_TYPE	: gfnma_nvl(item.VAT_NOT_DEDUCTION_TYPE),
  						REPORT_OMIT_YN			: gfnma_nvl(item.REPORT_OMIT_YN),
  						STANDARD_DATE			: gfnma_nvl(item.STANDARD_DATE),
  						VAT_ASSET_TYPE			: gfnma_nvl(item.VAT_ASSET_TYPE),
  						SUPPLY_AMT				: gfnma_nvl(item.SUPPLY_AMT),
  						VAT_AMT					: gfnma_nvl(item.VAT_AMT),
  						ZERO_REPORT_YN			: gfnma_nvl(item.ZERO_REPORT_YN),
  						LOCAL_CREDIT_TYPE		: gfnma_nvl(item.LOCAL_CREDIT_TYPE),
  						DOCUMENT_NAME			: gfnma_nvl(item.DOCUMENT_NAME),
  						ISSUE_NAME				: gfnma_nvl(item.ISSUE_NAME),
  						DOCUMENT_ISSUE_DATE		: gfnma_nvl(item.DOCUMENT_ISSUE_DATE),
  						EXPORT_LICENSE_NO		: gfnma_nvl(item.EXPORT_LICENSE_NO),
  						SHIIPPNG_DATE			: gfnma_nvl(item.SHIIPPNG_DATE),
  						EXPORT_AMT				: gfnma_nvl(item.EXPORT_AMT),
  						EXPORT_AMT_KRW			: gfnma_nvl(item.EXPORT_AMT_KRW),
  						VAT_EXPORT_AMT			: gfnma_nvl(item.VAT_EXPORT_AMT),
  						VAT_EXPORT_AMT_KRW		: gfnma_nvl(item.VAT_EXPORT_AMT_KRW),
  						FOREIGN_AMT				: gfnma_nvl(item.FOREIGN_AMT),
  						WON_AMT					: gfnma_nvl(item.WON_AMT),
  						DOCUMENT_NO				: gfnma_nvl(item.DOCUMENT_NO),
  						ZERO_TYPE				: gfnma_nvl(item.ZERO_TYPE),
  						COST_CLASS				: gfnma_nvl(item.COST_CLASS),
  						NONDED_YN				: gfnma_nvl(item.NONDED_YN),
  						WITHHOLD_TAX_YN			: gfnma_nvl(item.WITHHOLD_TAX_YN),
  						
  						ETC						: '',
  							
  					}
  					jsonFig2210.push(msg);
  				});        		
  	        	Fig2210Grid.rebuild();
        		
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