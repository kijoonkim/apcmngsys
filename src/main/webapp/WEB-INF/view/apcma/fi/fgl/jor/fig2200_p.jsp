<%
/**
 * @Class Name 		: fig2200_p.jsp
 * @Description 	: 전표전기 화면
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
	<title>title : 전표전기</title>
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
                    </h3><!-- 전표전기 -->
                </div>
                <div style="margin-left: auto;">
                    <sbux-button uitype="normal" text="지급변경이력"  	class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전표출력"  		class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
                    <sbux-button uitype="normal" text="세부내역"  		class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전기처리"  		class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
                    <sbux-button uitype="normal" text="전기취소"  		class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="전기+해제"  		class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
                    <sbux-button uitype="normal" text="보류해제"  		class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
                    <font style="margin-right:10px"></font>
                    <sbux-button uitype="normal" text="보류지정"  		class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
                    <sbux-button uitype="normal" text="일괄삭제"  		class="btn btn-sm btn-outline-danger" onclick=""></sbux-button>
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
	                        <tr>
	                            <th scope="row" class="th_bg">사업단위</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbofi-org-code" name="srch-cbofi-org-code" uitype="single" jsondata-ref="jsonCbofiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <th scope="row" class="th_bg">사업장</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbosite-code" name="srch-cbosite-code" uitype="single" jsondata-ref="jsonCbositeCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <th scope="row" class="th_bg">보류여부</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-ccbohold-flag" name="srch-ccbohold-flag" uitype="single" jsondata-ref="jsonCboholdFlag" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <th scope="row" class="th_bg">전표상태</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbodoc-status-p" name="srch-cbodoc-status-p" uitype="single" jsondata-ref="jsonCbodocStatusP" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        </tr>    
	                        <tr>
	                            <th scope="row" class="th_bg">년월</th>
	                            <td colspan="3" class="td_input" >
									<sbux-datepicker
									        id="srch-ymdperiod-yyyymm-p"
									        name="srch-ymdperiod-yyyymm-p"
									        uitype="popup"
									        datepicker-mode="month"
									        date-format="yyyy-mm"
									        style="width:80px"
									        class="form-control input-sm input-sm-ast inpt_data_reqed"
									        onchange = "fn_payDate"
									        required>
									</sbux-datepicker>                            
	                            </td>
	                            <th scope="row" class="th_bg">전표일자</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left">
									    <sbux-datepicker
									            id="srch-ymddate-fr"
									            name="srch-ymddate-fr"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>                          
									    <font style="padding-left:5px;padding-right:5px">-</font>  
									    <sbux-datepicker
									            id="srch-ymddate-to"
									            name="srch-ymddate-to"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>                            
	                            	</div>
	                            </td>
	                            <th scope="row" class="th_bg">회계기준</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cboacct-rule-code" name="srch-cboacct-rule-code" uitype="single" jsondata-ref="jsonCboacctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <th scope="row" class="th_bg">전표구분</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbodoc-type-p" name="srch-cbodoc-type-p" uitype="single" jsondata-ref="jsonCbodocTypeP" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        </tr>    
	                        <tr>
	                            <th scope="row" class="th_bg">작성부서</th>
								<td colspan="2"  class="td_input" >
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
										class="btn btn-xs btn-outline-dark"
										text="찾기" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1"
									></sbux-button>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">청구부서</th>
								<td colspan="2"  class="td_input" >
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
										class="btn btn-xs btn-outline-dark"
										text="찾기" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup2"
									></sbux-button>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">작성자</th>
								<td colspan="2"  class="td_input" >
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
										class="btn btn-xs btn-outline-dark"
										text="찾기" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup3"
									></sbux-button>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">실사용자</th>
								<td colspan="2"  class="td_input" >
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
										class="btn btn-xs btn-outline-dark"
										text="찾기" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup4"
									></sbux-button>
	                            </td>	                            
	                            
	                        </tr>
	                        
	                        <tr>
	                            <th scope="row" class="th_bg">전표번호</th>
								<td colspan="3"  class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;width:100%">
				                        <sbux-input id="srch-txtdoc-name" name="srch-txtdoc-name" class="form-control input-sm" uitype="text" style="width:120px;" ></sbux-input>
									    <font style="padding-right:10px"></font>  
		                       			<sbux-checkbox 
		                       				id="srch-chkmulti-doc-yn" 
		                       				uitype="normal" 
		                       				text="복수선택" 
		                       				true-value="Y" 
		                       				false-value="N" 
	                       				></sbux-checkbox>
									    <font style="padding-right:10px"></font>  
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="복수전표" uitype="normal"
											onclick="fn_compopup5"
										></sbux-button>
	                            	</div>
								</td>
								
	                            <th scope="row" class="th_bg">제목</th>
								<td colspan="7"  class="td_input" >
			                        <sbux-input id="srch-txtdesc" name="srch-txtdesc" class="form-control input-sm" uitype="text" ></sbux-input>
								</td>
								
								<td colspan="4"  class="td_input" >
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
	                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
	                    	<font>결재의견</font>
		                    <span style="width:5px"></span>
	                        <sbux-input id="srch-txtappr-opinion" name="srch-txtappr-opinion" class="form-control input-sm" uitype="text" style="width:250px;" ></sbux-input>
		                    <span style="width:5px"></span>
		                    <sbux-button uitype="normal" text="일괄결재"  	class="btn btn-sm btn-outline-danger" onclick="" ></sbux-button>
		                    <span style="width:5px"></span>
		                    <sbux-button uitype="normal" text="일괄반려"  	class="btn btn-sm btn-outline-danger" onclick="" ></sbux-button>
						</div>
	                </div>
	                <div>
	                    <div id="sb-area-grdTop" style="height:300px; width:100%;">
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
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';
	//-----------------------------------------------------------

	var editType	= "N";

    var jsonCbofiOrgCode 		= []; // 사업단위
    var jsonCbositeCode 		= []; // 사업장
    var jsonCboholdFlag 		= []; // 보류여부
    var jsonCbodocStatusP 		= []; // 전표상태
    var jsonCbodocTypeP 		= []; // 전표구분
    var jsonCboacctRuleCode 	= []; // 회계기준
	
    var _chkmulti_doc_params	= null;	//복수전표 파라미터
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['srch-cbofi-org-code'],		jsonCbofiOrgCode, 'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['srch-cbosite-code'], 		jsonCbositeCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 보류여부
            gfnma_setComSelect(['srch-ccbohold-flag'], 		jsonCboholdFlag, 'L_COM036', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표상태
            gfnma_setComSelect(['srch-cbodoc-status-p'],	jsonCbodocStatusP, 'L_FIG002_1', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전표구분
            gfnma_setComSelect(['srch-cbodoc-type-p'],		jsonCbodocTypeP, 'L_FIM051', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['srch-cboacct-rule-code'],	jsonCboacctRuleCode, 'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_initSBSelect();
    	fn_createGrid();	
    	
    	//년월
		SBUxMethod.set('srch-ymdperiod-yyyymm-p', gfnma_date().substr(0,4) + '-' + gfnma_date().substr(4,2));
    	fn_payDate();
    	//역분개제외여부
		SBUxMethod.set('srch-chkreverse-flag', 'Y');
    	//반려제외여부
		SBUxMethod.set('srch-recall-yn', 'Y');
    });

    //년월
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

    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTop';
	    SBGridProperties.id 				= 'Fig2200Grid';
	    SBGridProperties.jsonref 			= 'jsonFig2200';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
        	
        	{caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '40px', style: 'text-align:center',
        	    typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
        	        checkedvalue: 'Y', uncheckedvalue: 'N'
        	    }
        	},        	
            {caption: ["법인코드"],					ref: 'COMP_CODE', 				type:'input',  		width:'200px',  	style:'text-align:left'},
            {caption: ["부서코드"], 				ref: 'DEPT_CODE',    			type:'input',  		width:'150px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn2',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup1(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["부서명"], 					ref: 'DEPT_NAME', 				type:'input',		width:'200px',  	style:'text-align:left'},
            {caption: ["계정코드"],    				ref: 'ACCOUNT_CODE', 			type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn1',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup2(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["계정명"],					ref: 'ACCOUNT_NAME',			type:'input',  		width:'300px', 		style:'text-align:left'},
            {caption: ["정렬순서"],					ref: 'SORT_SEQ',				type:'input',  		width:'80px', 		style:'text-align:left'},
            {caption: [""],							ref: 'ETC',						type:'output',  	width:'80px', 		style:'text-align:left'},
        ];

        Fig2200Grid = _SBGrid.create(SBGridProperties);
        Fig2200Grid.bind('click', 'fn_viewGrid');
    }
    
    /**
     * 그리드내 팝업(부서코드) 조회
     */
	function fn_gridPopup1(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Fig2200Grid.getCellData(row, 2) 
        let cellData2 = Fig2200Grid.getCellData(row, 4) 
    	fn_compopGrid1(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(부서코드) 오픈
     */
    var fn_compopGrid1 = function(row, col, cellData1, cellData2) {
    	
        var searchText1 	= cellData1;
        var searchText2 	= cellData2;
        var searchText3 	= gfnma_date4();
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FI_DEPT'
       		,popupType				: 'B'
    		,whereClause			: ''
       		,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
   			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
   			,searchInputValues		: [searchText1, 	searchText2,	searchText3]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '300px'
   			,tableHeader			: ["부서코드", 		"부서명"]
   			,tableColumnNames		: ["DEPT_CODE", 	"DEPT_NAME"]
   			,tableColumnWidths		: ["150px", 		"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fig2200Grid.setCellData(row, 2, 	data['DEPT_CODE'], true, true);
				Fig2200Grid.setCellData(row, 4, 	data['DEPT_NAME'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');

    }  
    
    //상세정보 보기
    function fn_viewGrid() {
    	
    	editType = "E";    	

        var nRow = Fig2200Grid.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = Fig2200Grid.getRowData(nRow);
		//console.log(rowData);        
    }
    
    /**
     * 목록 조회
     */
	function cfn_search() {
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
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
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
			,V_P_DOC_ID             : '0'
			,V_P_DESC               : p_txtdesc

			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: ''
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
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						CHK_YN					: gfnma_nvl(item.CHK_YN),			
  						DEPT_CODE				: gfnma_nvl(item.DEPT_CODE),			
  						DEPT_NAME				: gfnma_nvl(item.DEPT_NAME),			
  						ACCOUNT_CODE			: gfnma_nvl(item.ACCOUNT_CODE),
  						ACCOUNT_NAME			: gfnma_nvl(item.ACCOUNT_NAME),
  						SORT_SEQ				: gfnma_nvl(item.SORT_SEQ),
  						COMP_CODE				: gfnma_nvl(item.COMP_CODE),
  						INSERT_USERID			: gfnma_nvl(item.INSERT_USERID),
  						INSERT_TIME				: gfnma_nvl(item.INSERT_TIME),
  						UPDATE_USERID			: gfnma_nvl(item.UPDATE_USERID),
  						UPDATE_TIME				: gfnma_nvl(item.UPDATE_TIME),
  					}
  					jsonFig2200.push(msg);
  					totalRecordCount ++;
  				});

        		Fig2200Grid.rebuild();
  	        	document.querySelector('#listCount1').innerText = totalRecordCount;
  	        	
  	        	//deatil grid 첫번째 행 선택
				if(jsonFig2200.length>0){
					Fig2200Grid.setRow(1);
					Fig2200Grid.moveScrollTop(1);
					fn_viewGrid();					
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
     * 작성부서 팝업
     */
    var fn_compopup1 = function() {
    	
    	//type B 형 팝업
    	var addParams = [];	//bizcompId 의 파라미터에 따라 추가할것
    	var p_find1	= gfnma_nvl(SBUxMethod.get("srch-txtcreated-dept-name"));
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
				SBUxMethod.set('srch-txtcreated-dept-name', data.DEPT_NAME);
				SBUxMethod.set('srch-txtcreated-dept-code', data.DEPT_CODE);
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
				SBUxMethod.set('srch-txtpayee-dept-name', data.DEPT_NAME);
				SBUxMethod.set('srch-txtpayee-dept-code', data.DEPT_CODE);
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
        var replaceText1 	= "_USER_NAME_";
        var strWhereClause 	= "AND A.USER_ID LIKE '%" + replaceText0 + "%' AND A.USER_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사용자 조회');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				SBUxMethod.set('srch-txtcreated-by-name', data.USER_NAME);
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
        var replaceText1 	= "_USER_NAME_";
        var strWhereClause 	= "AND USER_ID LIKE '%" + replaceText0 + "%' AND USER_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사용자 조회');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
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
				SBUxMethod.set('srch-txtpayee-name', data.USER_NAME);
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
   			,callbackEvent	: function (data){
   				console.log('callback data:', data);
   				_chkmulti_doc_params = data;
   			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
  	}       
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>