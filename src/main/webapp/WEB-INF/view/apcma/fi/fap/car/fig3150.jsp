<%
/**
 * @Class Name 		: com3100.jsp
 * @Description 	: 법인카드승인내역관리(매입) 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.01
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.04.29   	장성주		최초 생성
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
	<title>title : 법인카드승인내역관리(매입)</title>
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
                    </h3><!-- 법인카드승인내역관리(매입) -->
                </div>
                <div style="margin-left: auto;">
                    <sbux-button uitype="normal" text="데이터불러오기" 		class="btn btn-sm btn-outline-danger" onclick="fn_callDataList"></sbux-button>
                </div>
            </div>
            <div class="box-body">
				<div class="box-search-ma">
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
	                        <tr>
	                            <th scope="row" class="th_bg_search" >APC</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbofi-org-code" name="srch-cbofi-org-code" uitype="single" jsondata-ref="jsonCbofiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
								</td>
	                        	<td></td>
	                            
	                            <th scope="row" class="th_bg_search">년월</th>
	                            <td class="td_input" >
									<sbux-datepicker
									        id="srch-ymdperiod-yyyymm-p"
									        name="srch-ymdperiod-yyyymm-p"
									        uitype="popup"
									        datepicker-mode="month"
									        date-format="yyyy-mm"
									        style="width:100%"
									        class="form-control input-sm input-sm-ast table-datepicker-ma""
									        onchange = "fn_payDate"
									        required>
									</sbux-datepicker>                            
	                            </td>
	                        	<td colspan="3"></td>
	                            	 
	                            <th scope="row" class="th_bg_search">전기일자</th>
	                            <td class="td_input">
								    <sbux-datepicker
								            id="srch-ymddoc-date-fr"
								            name="srch-ymddoc-date-fr"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed table-datepicker-ma""
		                                    group-id="schHeader"
		                                    required
								            >
								    </sbux-datepicker>                          
	                            </td>
	                            <td class="td_input">-</td>
	                            <td class="td_input">
								    <sbux-datepicker
								            id="srch-ymddoc-date-to"
								            name="srch-ymddoc-date-to"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed table-datepicker-ma""
		                                    group-id="schHeader"
		                                    required
								            >
								    </sbux-datepicker>                            
	                            </td>
	                        	<td></td>
	                        	
	                            <th scope="row" class="th_bg_search">사용일자</th>
	                            <td class="td_input">
								    <sbux-datepicker
								            id="srch-ymdtxn-date-fr"
								            name="srch-ymdtxn-date-fr"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed table-datepicker-ma""
		                                    group-id="schHeader"
		                                    required
								            >
								    </sbux-datepicker>                          
	                            </td>
	                            <td class="td_input">-</td>
	                            <td class="td_input">
								    <sbux-datepicker
								            id="srch-ymdtxn-date-to"
								            name="srch-ymdtxn-date-to"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed table-datepicker-ma""
		                                    group-id="schHeader"
		                                    required
								            >
								    </sbux-datepicker>                            
	                            </td>
	                        	<td></td>
	                        	
	                        </tr>
	                        
	                        <tr>    
	                        
	                            <th scope="row" class="th_bg_search">사용자</th>
								<td colspan="3"  class="td_input" >
	   								<sbux-input
										uitype="text"
										id="srch-txtemp-name"
										style="width:100%"
										class="form-control input-sm"									
								        onchange = "fn_chgUser"
	   								></sbux-input>
									<sbux-input
										uitype="hidden"
										uitype="text"
										id="srch-txtemp-code"
										class="form-control input-sm"
	   								></sbux-input>
								</td>
								<td class="td_input" >
									<sbux-button 
										class="btn btn-xs btn-outline-dark" 
										text="…" 
										uitype="modal" 
										target-id="modal-compopup1" 
										onclick="fn_compopup1()" ></sbux-button>									
								</td>
								
	                            <th scope="row" class="th_bg_search">사용자부서</th>
								<td colspan="3"  class="td_input" >
	   								<sbux-input
										uitype="text"
										id="srch-txtdept-name"
										class="form-control input-sm"
								        onchange = "fn_chgDept"
									></sbux-input>
									<sbux-input
										uitype="hidden"
										uitype="text"
										id="srch-txtdept-code"
										class="form-control input-sm">
									</sbux-input>
								</td>
	                            <td class="td_input" >
									<sbux-button 
										class="btn btn-xs btn-outline-dark" 
										text="…" 
										uitype="modal" 
										target-id="modal-compopup1" 
										onclick="fn_compopup2()" ></sbux-button>									
	                            </td>
	                            
	                            <th scope="row" class="th_bg_search">전표상태</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbodoc-status" name="srch-cbodoc-status" uitype="single" jsondata-ref="jsonCbodocStatusCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        	<td></td>
	                            
	                            <th scope="row" class="th_bg_search">업종코드</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbomcc-code" uitype="single" jsondata-ref="jsonCbomccCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        	<td></td>
	                            
							</tr>
								
							<tr>	
	                            	                            
	                            <th scope="row" class="th_bg_search">카드번호</th>
								<td colspan="3"  class="td_input" >
		                            <sbux-input id="srch-txtcard-no" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
	                            </td>
	                        	<td></td>
	                            
	                            <th scope="row" class="th_bg_search">전표번호</th>
	                            <td colspan="4" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;">
				                        <sbux-input id="srch-txtdoc-name" class="form-control input-sm" uitype="text" style="width:120px;margin-right:10px"></sbux-input>
				                        <span style="padding-left:5px;padding-top:7px;padding-right:5px">
			                       			<sbux-checkbox 
			                       				id="srch-chkmulti-yn2" 
			                       				uitype="normal" 
			                       				text="복수선택" 
			                       				true-value="Y" 
			                       				false-value="N" 
			                       				style="margin-top:8px"
			                       				>
			                       			</sbux-checkbox>
				                        </span>
									    <font style="padding-right:10px"></font>  
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="복수선택" uitype="modal"
											target-id="modal-compopup3"
											onclick="fn_compopup4">
										</sbux-button>
	                            	</div>
	                            </td>
	                            
	                            <th scope="row" class="th_bg_search">승인번호</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-input id="srch-txtappr-no" style="width:100%" class="form-control input-sm" uitype="text" ></sbux-input>
	                            </td>
	                            <td colspan="5" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;">
				                        <span style="padding-left:5px;padding-top:7px;padding-right:5px">
			                       			<sbux-checkbox 
			                       				id="srch-chkmulti-yn" 
			                       				uitype="normal" 
			                       				text="복수선택" 
			                       				true-value="Y" 
			                       				false-value="N" 
			                       				style="margin-top:8px"
			                       				>
			                       			</sbux-checkbox>
		                       			</span>
									    <font style="padding-right:10px"></font>  
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="복수선택" uitype="modal"
											target-id="modal-compopup3"
											onclick="fn_compopup5">
										</sbux-button>
									    <font style="padding-left:15px;"></font>  
										<span style="border:1px solid #ff6347;background-color:#ff6347;min-width:40px !important">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
									    <font style="padding-left:5px;">미등록거래처</font>  
	                            	</div>
	                            </td>
	                            
	                        </tr>
	
	                    </tbody>
	                </table>				
				</div>
                
                <div class="row" style="padding-top:10px">
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>세부리스트</span>
	                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
		                    <sbux-button uitype="normal" text="거래처생성" 		class="btn btn-sm btn-outline-danger" 	style="margin-right:5px" onclick="fn_btnCustomer"></sbux-button>
		                    <sbux-button uitype="normal" text="전표번호갱신" 	class="btn btn-sm btn-outline-danger" 	style="margin-right:5px" onclick="fn_btnDocRefresh"></sbux-button>
	                    	<lavel style="margin-right:5px;padding-top:5px" >전기일</lavel>
						    <sbux-datepicker style="padding-right:10px !important;width:100px" id="srch-pay-s2date" name="srch-pay-s2date" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast"></sbux-datepicker> 
		                    <sbux-button uitype="normal" text="전기일자 일괄변경" 	class="btn btn-sm btn-outline-danger" 	style="margin-right:5px" onclick="fn_btnDocDateAllChange"></sbux-button>
	                    	<lavel style="margin-right:5px;padding-top:5px" >제외사유</lavel>
							<div class="dropdown" style="margin-right:5px" >
							    <button style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="srch-cboexcept-code" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    	<font>선택</font>
							        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
							    </button>
							    <div class="dropdown-menu" aria-labelledby="srch-cboexcept-code" style="width:300px;height:150px;padding-top:0px;overflow:auto">
							    </div>
							</div>                                    
							<sbux-input uitype="text" id="srch-txtexcept-reason" 	class="form-control input-sm" 			style="width:120px;margin-right:5px"></sbux-input>
		                    <sbux-button uitype="normal" text="제외처리" 		class="btn btn-sm btn-outline-danger" 	style="margin-right:5px" onclick="fn_btnExclusion"></sbux-button>
		                    <sbux-button uitype="normal" text="제외처리 취소" 	class="btn btn-sm btn-outline-danger" 	onclick="fn_btnExclusionCancel"></sbux-button>
	                    </div>
	                </div>
	                <div>
	                    <div id="sb-area-grdComMsg" style="height:500px; width:100%;"></div>
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
	
	var jsonCbofiOrgCode		= [];	// 회계단위
	var jsonCbodocStatusCode	= [];	// 전표상태
	var jsonCbomccCode			= [];	// 업종코드
	
    var chkyn2String			= "";	// 복수선택 문자열 리스트
    var chkynString 			= "";	// 복수선택 문자열 리스트
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//회계단위
			gfnma_setComSelect(['srch-cbofi-org-code'], jsonCbofiOrgCode, 'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACNTG_OGNZ_CD', 'ACNTG_OGNZ_NM', 'Y', '1100'),
			//전표상태
			gfnma_setComSelect(['srch-cbodoc-status'], jsonCbodocStatusCode, 'L_FIG002_2', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			//업종코드
			gfnma_setComSelect(['srch-cbomcc-code'], jsonCbomccCode, 'L_EFI0006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TPBIZ_CD', 'TPBIZ_NM', 'Y', ''),
			//제외사유
			gfnma_multiSelectInit({
				target			: ['#srch-cboexcept-code']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM221'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'CODE'
				,colLabel		: 'FAM_NM'
				,columns		:[
		            {caption: "제외사유",		ref: 'CODE', 			width:'150px',  	style:'text-align:left'},
		            {caption: "제외내용", 		ref: 'FAM_NM',    		width:'150px',  	style:'text-align:left'}
				]
			})
		]);
	}	
 
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	//년월
		SBUxMethod.set('srch-ymdperiod-yyyymm-p', gfnma_date().substr(0,4) + '-' + gfnma_date().substr(4,2));
    	fn_payDate();
    	
    	fn_initSBSelect();
    	fn_createGrid();		
    });
 
    //grid 초기화
    var Fig3150Grid; 			// 그리드를 담기위한 객체 선언
    var jsonFig3150List = []; 	// 그리드의 참조 데이터 주소 선언
 
    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdComMsg';
	    SBGridProperties.id 				= 'Fig3150Grid';
	    SBGridProperties.jsonref 			= 'jsonFig3150List';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
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
            {caption: ["전표상태"],				ref: 'DOC_STATUS_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            
            //{caption: ["전표번호"], 			ref: 'SLIP_NM',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ['전표번호'], 			ref: 'link',    				type:'button',  	width:'100px', 		style:'text-align:left', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            		if(objRowData['SLIP_ID']){
		        		return "<a style='text-decoration: underline;cursor:pointer;color:#149fff' href='#' onClick='fn_gridPopup1(event, " + objRowData['SLIP_ID'] + ")'>" + objRowData['SLIP_NM'] + "</a>";
            		} else {
            			return "";
            		}
            	}	
            },
            
            {caption: ["결재자"],  				ref: 'FINAL_STEP_SEQ', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["거래구분"],      		ref: 'APPR_CANCEL_TYPE_NAME', 	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부서명"],				ref: 'DEPT_NAME',				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["사용자명"], 			ref: 'EMP_NAME', 				type:'output',  	width:'100px',  	style:'text-align:center'},
            {caption: ["카드번호"], 			ref: 'CARD_NO',  				type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption: ["승인번호"], 			ref: 'APPR_NO',  				type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["코스트센터(전표)"],		ref: 'COST_CENTER_CODE',  		type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["사용계정명"], 			ref: 'ACCOUNT_NAME',  			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["전기일자"], 			ref: 'DOC_DATE',  				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["거래일자"], 			ref: 'TXN_DATE',  				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["거래처명"], 			ref: 'CS_NAME',  				type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["가맹점 사업자번호"], 	ref: 'CS_BIZ_REGNO',  			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["가맹점명"], 			ref: 'BIZ_CS_NAME',  			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["업종코드"], 			ref: 'BIZ_CODE',  				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["업종명"], 				ref: 'BIZ_ITEMS',  				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["카드유형"], 			ref: 'ZCARD_KIND_NAME',  		type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["매입금액"], 			ref: 'CARD_AMT',  				type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["매입부가세"], 			ref: 'CARD_VAT_AMT',  			type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["총액"], 				ref: 'SUM_AMOUNT',  			type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["전표담당자명"], 		ref: 'ACCOUNT_EMP_NAME',  		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["결재예정일자"], 		ref: 'SETTLE_DATE',  			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["제외사유코드"], 		ref: 'EXCEPT_CODE',  			type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["제외사유"], 			ref: 'EXCEPT_REASON',  			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["제외금액"], 			ref: 'EXCEPT_AMOUNT',  			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["가맹점과세구분"], 		ref: 'TAX_TYPE_NAME',  			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["과세유형"], 			ref: 'TAX_GUBUN_NAME',  		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전기일/증빙일"], 		ref: 'ZTRAN_DATE2',  			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["전표ID"], 				ref: 'DOC_ID',  				type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["전표금액"], 			ref: 'HEADER_INVOICE_AMOUNT',  	type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["전표공급가액"], 		ref: 'HEADER_CARD_AMT',  		type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            {caption: ["전표부가세금액"], 		ref: 'HEADER_VAT_AMOUNT',  		type:'output',  	width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,##0'}},
            
            {caption: ["적요"], 				ref: 'HEADER_DESC',  			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["폐업일자"], 			ref: 'BIZ_CLOSE_DATE',  		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["세무일자"], 			ref: 'TAX_DATE',  				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["가맹점휴폐업정보"], 	ref: 'ZVENDOR_CLOSE_IN',  		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["수정일자"], 			ref: 'ZUPDATE_DATE',  			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["승인일자"], 			ref: 'APPR_DATE',  				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["승인시각"], 			ref: 'APPR_TIME',  				type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["지급일자"], 			ref: 'ZCHARGE_DATE',  			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["남은결재자"], 			ref: 'APPR_STATUS_COUNT',  		type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["매입일자"], 			ref: 'TRANS_DATE',  			type:'output',  	width:'120px',  	style:'text-align:left'}
        ];
 
        Fig3150Grid = _SBGrid.create(SBGridProperties);
        Fig3150Grid.bind('click', 'fn_view');
    }
	
    //상세정보 보기
    function fn_view() {
 
    	editType = "E";    	
    	
    	var nCol = Fig3150Grid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = Fig3150Grid.getRow();
		if (nRow < 1) {
            return;
		}
 
        let rowData = Fig3150Grid.getRowData(nRow);
    }
    
    /**
     * 목록 조회
     */
	function cfn_search() {
        if(!SBUxMethod.validateRequired({group_id: "schHeader"})) {
            return false;
        }    	
		fn_setFig3150Grid('Q');
	}
    
    /**
     * 목록 가져오기
     */
    const fn_setFig3150Grid = async function(wtype) {
 
		Fig3150Grid.clearStatus();
 
		let p_cbofi_org_code	= gfnma_nvl(SBUxMethod.get("srch-cbofi-org-code"));
		
		let p_ymddoc_date_fr	= gfnma_nvl(SBUxMethod.get("srch-ymddoc-date-fr"));
		let p_ymddoc_date_to 	= gfnma_nvl(SBUxMethod.get("srch-ymddoc-date-to"));
		let p_ymdtxn_date_fr	= gfnma_nvl(SBUxMethod.get("srch-ymdtxn-date-fr"));
		let p_ymdtxn_date_to 	= gfnma_nvl(SBUxMethod.get("srch-ymdtxn-date-to"));
		
		//복수선택(상)
		let p_doc_name = "";
		let chk1 = gfnma_nvl(SBUxMethod.get("srch-chkmulti-yn2"));
		if(chk1['srch-chkmulti-yn2']=='Y'){
			p_doc_name = chkyn2String;
		} else {
			p_doc_name = gfnma_nvl(SBUxMethod.get("srch-txtdoc-name"))
		}
 
		let p_cbomcc_code 		= gfnma_nvl(SBUxMethod.get("srch-cbomcc-code"));
		let p_txtcard_no 		= gfnma_nvl(SBUxMethod.get("srch-txtcard-no"));
		let p_txtemp_code 		= gfnma_nvl(SBUxMethod.get("srch-txtemp-code"));
		let p_txtdept_code 		= gfnma_nvl(SBUxMethod.get("srch-txtdept-code"));
		
		//복수선택(하)
		let p_appr_no = "";
		let chk2 = gfnma_nvl(SBUxMethod.get("srch-chkmulti-yn"));
		if(chk2['srch-chkmulti-yn']=='Y'){
			p_appr_no = chkynString;
		} else {
			p_appr_no = gfnma_nvl(SBUxMethod.get("srch-txtappr-no"))
		}
		
		let p_doc_status 		= gfnma_nvl(SBUxMethod.get("srch-cbodoc-status"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN	: ''
			,V_P_LANG_ID		: ''
			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
			,V_P_FI_ORG_CODE	: p_cbofi_org_code		//회계단위
			,V_P_DOC_DATE_FR	: p_ymddoc_date_fr		//전기일자 시작
			,V_P_DOC_DATE_TO	: p_ymddoc_date_to		//전기일자 종료
			,V_P_TXN_DATE_FR	: p_ymdtxn_date_fr		//사용일자 시작
			,V_P_TXN_DATE_TO	: p_ymdtxn_date_to		//사용일자 종료
			,V_P_DOC_NAME		: p_doc_name
			,V_P_ZMCC_CODE		: p_cbomcc_code			//업종코드
			,V_P_CARD_NO		: p_txtcard_no			//카드번호
			,V_P_EMP_CODE		: p_txtemp_code			//사용자
			,V_P_DEPT_CODE		: p_txtdept_code		//사용부서
			,V_P_APPR_NO		: p_appr_no
			,V_P_DOC_STATUS		: p_doc_status			//전표상태
			,V_P_CARD_NO_1		: p_txtcard_no			//카드번호
			,V_P_USER_ID		: p_userId
			,V_P_FORM_ID		: p_formId
			,V_P_MENU_ID		: p_menuId
			,V_P_PROC_ID		: ''
			,V_P_USERID			: ''
			,V_P_PC				: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/fi/fap/car/selectFig3150List.do", {
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
 
  	        	jsonFig3150List.length = 0;
  	        	data.cv_2.forEach((item, index) => {
  					const msg = {
  						CHK_YN					: "",										//checkbox
  						DOC_STATUS				: gfnma_nvl2(item.SLIP_STTS),				//전표상태			--> DOC_STATUS_NAME (필요)		<-- L_FIG002_2 공통코드 조인
  						DOC_STATUS_NAME			: gfnma_nvl2(item.DOC_STATUS_NAME),			//전표상태명		--> DOC_STATUS_NAME (필요)		<-- L_FIG002_2 공통코드 조인
  						DOC_NAME				: gfnma_nvl2(item.SLIP_NM),					//전표번호
  						FINAL_STEP_SEQ			: gfnma_nvl2(item.FINAL_STEP_SEQ),			//결재자			--> ?
  						APPR_CANCEL_TYPE		: gfnma_nvl2(item.APRV_CNCL_TYPE),			//거래구분			--> APPR_CANCEL_TYPE_NAME (필요)  <-- L_FIG021 공통코드 조인
  						APPR_CANCEL_TYPE_NAME	: gfnma_nvl2(item.APPR_CANCEL_TYPE_NAME),	//거래구분명		--> APPR_CANCEL_TYPE_NAME (필요)  <-- L_FIG021 공통코드 조인
  						DEPT_NAME				: gfnma_nvl2(item.DEPT_NM),				//부서명			
  						EMP_NAME				: gfnma_nvl2(item.EMP_NM),					//사용자명
  						CARD_NO					: gfnma_nvl2(item.CARD_NO),					//카드번호
  						APPR_NO					: gfnma_nvl2(item.APRV_NO),					//승인번호
  						COST_CENTER_CODE		: gfnma_nvl2(item.CSTCT_CD),			//코스트센터(전표)
  						ACCOUNT_CODE			: gfnma_nvl2(item.ACNTL_CD),				//사용계정			--> ACCOUNT_NAME (필요)	<-- L_ACCT_CD 공통코드 조인
  						ACCOUNT_NAME			: gfnma_nvl2(item.ACNT_NM),				//사용계정명		--> ACCOUNT_NAME (필요)	<-- L_ACCT_CD 공통코드 조인
  						DOC_DATE				: gfnma_nvl2(item.SLIP_YMD),					//전기일자
  						TXN_DATE				: gfnma_nvl2(item.TRSC_DT),					//거래일자
  						CS_NAME					: gfnma_nvl2(item.CNPT_NM),					//거래처명
  						CS_BIZ_REGNO			: gfnma_nvl2(item.CNPT_BRNO),				//가맹점 사업자번호
  						BIZ_CS_NAME				: gfnma_nvl2(item.BIZ_CS_NAME),				//가맹점명
  						BIZ_CODE				: gfnma_nvl2(item.TPBIZ_CD),					//업종코드
  						BIZ_ITEMS				: gfnma_nvl2(item.TPBIZ),				//업종명
  						ZCARD_KIND				: gfnma_nvl2(item.CARD_KND),				//카드유형			--> ZCARD_KIND_NAME (필요) 	<-- L_FIM216  공통코드 조인
  						ZCARD_KIND_NAME			: gfnma_nvl2(item.ZCARD_KIND_NAME),			//카드유형명		--> ZCARD_KIND_NAME (필요) 	<-- L_FIM216  공통코드 조인
  						CARD_AMT				: gfnma_nvl2(item.CARD_AMT),					//매입금액
  						CARD_VAT_AMT			: gfnma_nvl2(item.CARD_VAT_AMT),				//매입부가세
  						SUM_AMOUNT				: gfnma_nvl2(item.SUM_AMT),				//총액
  						ACCOUNT_EMP_CODE		: gfnma_nvl2(item.SLIP_EMP_NO),			//전표담당자명 		--> ACCOUNT_EMP_NAME(필요)  <-- P_HRI001 공통코드 조인
  						ACCOUNT_EMP_NAME		: gfnma_nvl2(item.ACCOUNT_EMP_NAME),			//전표담당자명 		--> ACCOUNT_EMP_NAME(필요)  <-- P_HRI001 공통코드 조인
  						SETTLE_DATE				: gfnma_nvl2(item.STLM_YMD),				//결재예정일자
  						EXCEPT_CODE				: gfnma_nvl2(item.EXCPT_CD),				//제외사유코드 		--> ?
  						EXCEPT_REASON			: gfnma_nvl2(item.EXCPT_RSN),			//제외사유	 		--> ?
  						EXCEPT_AMOUNT			: gfnma_nvl2(item.EXCPT_AMT),			//제외금액	 		--> ?
  						TAX_TYPE				: gfnma_nvl2(item.TX_TYPE),					//가맹점과세구분	--> TAX_TYPE_NAME (필요) <-- L_FIG014  공통코드 조인
  						TAX_TYPE_NAME			: gfnma_nvl2(item.TX_TYPE_NM),			//가맹점과세구분명	--> TAX_TYPE_NAME (필요) <-- L_FIG014  공통코드 조인
  						TAX_GUBUN_NAME			: gfnma_nvl2(item.TX_TXTN_NM),			//과세유형			--> ?
  						ZTRAN_DATE2				: gfnma_nvl2(item.PSTG_YMD2),				//전기일/증빙일	
  						DOC_ID					: gfnma_nvl2(item.SLIP_ID),					//전표ID	
  						HEADER_INVOICE_AMOUNT	: gfnma_nvl2(item.HEADER_SLIP_AMT),	//전표금액	
  						HEADER_CARD_AMT			: gfnma_nvl2(item.HEADER_CARD_AMT),			//전표공급가액
  						HEADER_VAT_AMOUNT		: gfnma_nvl2(item.HEADER_VAT_AMT),		//전표부가세금액
  						HEADER_DESC				: gfnma_nvl2(item.HEADER_DSCTN),				//적요				--> ?
  						BIZ_CLOSE_DATE			: gfnma_nvl2(item.SCBIZ_YMD),			//폐업일자			--> ?
  						TAX_DATE				: gfnma_nvl2(item.TX_YMD),					//세무일자			--> ?
  						ZVENDOR_CLOSE_IN		: gfnma_nvl2(item.FRCS_SCBIZ_IFNO),			//가맹점휴폐업정보	--> ?
  						ZUPDATE_DATE			: gfnma_nvl2(item.UPDT_YMD),				//수정일자			--> ?
  						APPR_DATE				: gfnma_nvl2(item.APRV_YMD),				//승인일자			
  						APPR_TIME				: gfnma_nvl2(item.APRV_TM),				//승인시각			
  						ZCHARGE_DATE			: gfnma_nvl2(item.ZCHARGE_DATE),				//지급일자			--> ?
  						APPR_STATUS_COUNT		: gfnma_nvl2(item.APPR_STATUS_COUNT),		//남은결재자		
  						TRANS_DATE				: gfnma_nvl2(item.TRNSCO_YMD),				//매입일자
  						CARD_ID					: gfnma_nvl2(item.CARD_ID)				
  					}
  					jsonFig3150List.push(msg);
  					totalRecordCount ++;
  				});
 
        		Fig3150Grid.rebuild();
  	        	document.querySelector('#listCount').innerText = totalRecordCount;
 
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
     * 데이터불러오기
     */
    const fn_callDataList = async function() {
    	
		let p_cbofi_org_code	= gfnma_nvl(SBUxMethod.get("srch-cbofi-org-code"));
		let p_ymdtxn_date_fr	= gfnma_nvl(SBUxMethod.get("srch-ymdtxn-date-fr"));
		let p_ymdtxn_date_to 	= gfnma_nvl(SBUxMethod.get("srch-ymdtxn-date-to"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			,V_P_FI_ORG_CODE		: p_cbofi_org_code		//회계단위
			,V_P_TXN_DATE_FR		: p_ymdtxn_date_fr		//사용일자 시작
			,V_P_TXN_DATE_TO		: p_ymdtxn_date_to		//사용일자 종료
			,V_P_DOC_DATE_FR		: ''
			,V_P_DOC_DATE_TO		: ''
			,V_P_APPR_CANCEL_TYPE	: ''	
			,V_P_CARD_NO			: ''
			,V_P_APPR_NO			: ''
			,V_P_TXN_DATE			: ''
			,V_P_DOC_DATE			: ''
			,V_P_ACCOUNT_EMP_CODE	: ''	
			,V_P_CARD_ID			: ''			
			,V_P_CARD_AMT			: '0'			
			,V_P_CARD_VAT_AMT		: '0'			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: ''
			,V_P_PC					: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/fi/fap/car/selectFig3150Save.do", {
        	getType				: 'json',
        	workType			: 'S',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj, true)
		});
 
        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {
  				fn_setFig3150Grid('Q');  				
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
     * 사용자 팝업
     */
    var fn_compopup1 = function() {
    	
        var searchText 		= gfnma_nvl(SBUxMethod.get("srch-txtemp-name"));
        //var replaceText0 	= "_USER_ID_";
        //var replaceText1 	= "_USER_NM_";
        //var strWhereClause 	= "AND X.USER_ID LIKE '%" + replaceText0 + "%' AND X.USER_NM LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_USER_02'
        	,popupType				: 'A'
    		,whereClause			: '' //strWhereClause
   			,searchCaptions			: ["사번", 		"사원명"]
   			,searchInputFields		: ["EMP_CD", 	"EMP_NM"]
   			,searchInputValues		: ["", 			searchText]
    		,height					: '400px'
   			,tableHeader			: ["사번", 		"직원명", 		"부서코드", 	"부서명"]
   			,tableColumnNames		: ["USER_ID", 	"USER_NM",  	"DEPT_CD", 	"DEPT_NM"]
   			,tableColumnWidths		: ["80px", 		"80px", 		"80px", 		"120px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('srch-txtemp-name', 	data.USER_NM);
				SBUxMethod.set('srch-txtemp-code', 	data.USER_ID);
			},
    	});
  	}    
    
    /**
     * 사용자부서 팝업
     */
    var fn_compopup2 = function() {
    	
        var searchText 		= gfnma_nvl(SBUxMethod.get("srch-txtdept-name"));
    	
        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: ["", 				searchText,		""]
            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"부서코드"]
            ,tableColumnNames		: ["BGNG_YMD",	"SITE_NM", 	"DEPT_NM",  	"DEPT_CD"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px",		"200px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('srch-txtdept-name', 	data.DEPT_NM);
                SBUxMethod.set('srch-txtdept-code', 	data.DEPT_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
		SBUxMethod.openModal('modal-compopup1');
  	}    
    
    /**
     * 복수코드 팝업
     */
    var fn_compopup4 = function() {
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
		SBUxMethod.openModal('modal-compopup3');
    	compopup3({
    		height			: '400px'
   			,callbackEvent	: function (data){
   				if(data.length>0){
   					SBUxMethod.set('srch-chkmulti-yn2', 'Y');
   					chkyn2String = fn_convertListFromString(data);
   				} else {
   					SBUxMethod.set('srch-chkmulti-yn2', 'N');
   					chkyn2String = "";
   				}
   			}
    		,cancelEvent	: function (){
				SBUxMethod.set('srch-chkmulti-yn2', 'N');
				chkyn2String = "";
    		}
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
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
   				if(data.length>0){
   					SBUxMethod.set('srch-chkmulti-yn', 'Y');
   					chkynString = fn_convertListFromString(data);
   				} else {
   					SBUxMethod.set('srch-chkmulti-yn', 'N');
   					chkynString = "";
   				}
   			}
    		,cancelEvent	: function (){
				SBUxMethod.set('srch-chkmulti-yn', 'N');
				chkynString = "";
			}
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
  	}     
    
    //리스트를 문자열('|')로 리턴
    var fn_convertListFromString = function(list){
    	var rstr = '';
    	for (var i = 0; i < list.length; i++) {
    		rstr += list[i] + '|';
		}
    	return rstr.slice(0, -1);
    }
 
    //년월
    var fn_payDate = function() {
        var yyyymm	= gfnma_nvl(SBUxMethod.get("srch-ymdperiod-yyyymm-p"));
        var sdate	= yyyymm.substr(0,4) + '-' + yyyymm.substr(4,2) + '-01';
        var edate	= gfnma_date3(yyyymm.substr(0,4), yyyymm.substr(4,2));
		SBUxMethod.set('srch-ymddoc-date-fr', sdate);
		SBUxMethod.set('srch-ymddoc-date-to', edate);
		SBUxMethod.set('srch-ymdtxn-date-fr', sdate);
		SBUxMethod.set('srch-ymdtxn-date-to', edate);
    }
 
    //사용자 변경 evnet
    var fn_chgUser = function() {
    	var str = SBUxMethod.get('srch-txtemp-name');
    	if(!str){
    		SBUxMethod.set('srch-txtemp-code', '');
    	}
    }
 
    //사용자부서 변경 evnet
    var fn_chgDept = function() {
    	var str = SBUxMethod.get('srch-txtdept-name');
    	if(!str){
    		SBUxMethod.set('srch-txtdept-code', '');
    	}
    }
 
    //거래처생성
    var fn_btnCustomer = async function() {
    	
    	var cnt 		= 0
    	var chkList		= [];
    	for (var i = 0; i < jsonFig3150List.length; i++) {
			var obj = jsonFig3150List[i];
			if(obj['CHK_YN']=='Y'){
				cnt ++;
				obj['rownum'] = i;
				chkList.push(obj);
			}
		}
		if(cnt==0){
        	gfn_comAlert("E0000", "처리대상이 없습니다.");
        	return;
		}    	
		
		if(confirm("거래처 생성 하시겠습니까?")){
		}else{
			return;
		}		
		
		let p_cbofi_org_code	= gfnma_nvl(SBUxMethod.get("srch-cbofi-org-code"));
		let p_ymdtxn_date_fr	= gfnma_nvl(SBUxMethod.get("srch-ymdtxn-date-fr"));
		let p_ymdtxn_date_to 	= gfnma_nvl(SBUxMethod.get("srch-ymdtxn-date-to"));
		
		//서버 전송 리스트
        let listData = [];
    	for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i];
            const param = {
                    cv_count	: '0',
                    getType		: 'json',
                    rownum		: obj.rownum,
                    workType	: 'IF',
                    params		: gfnma_objectToString({
                        V_P_DEBUG_MODE_YN			: '',
                        V_P_LANG_ID					: '',
                        V_P_COMP_CODE				: gv_ma_selectedCorpCd,
                        V_P_CLIENT_CODE				: gv_ma_selectedClntCd,
                        V_P_FI_ORG_CODE 			: p_cbofi_org_code,
                        V_P_TXN_DATE_FR 			: p_ymdtxn_date_fr,
                        V_P_TXN_DATE_TO 			: p_ymdtxn_date_to,
                        V_P_CARD_NO					: obj.CARD_NO,
                        V_P_APPR_NO					: obj.APPR_NO,
                        V_P_TXN_DATE				: obj.TXN_DATE,
                        V_P_FORM_ID					: p_formId,
                        V_P_MENU_ID					: p_menuId,
                        V_P_PROC_ID					: '',
                        V_P_USERID					: '',
                        V_P_PC						: ''
                    })
            	}			
            listData.push(param);
    	}	
 
        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/fi/fap/car/saveFig3150Customer.do", {listData: listData});
 
            const data = await postJsonPromise;
            console.log('data:', data);
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
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
    }
 
    //전표번호갱신
    var fn_btnDocRefresh = async function() {
    	
		//선택된 행
        var nRow = Fig3150Grid.getRow();
		if (nRow < 1) {
            gfn_comAlert("E0000", "갱신할 행을 선택하세요");
            return;
		}
 
		if(confirm("전표번호를 갱신 하시겠습니까?")){
		}else{
			return;
		}		
        var rowData = Fig3150Grid.getRowData(nRow);
        console.error(rowData);
		
	    var paramObj = { 
				V_P_DEBUG_MODE_YN		: ''
				,V_P_LANG_ID			: ''
				,V_P_COMP_CODE			: gv_ma_selectedCorpCd
				,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
				,V_P_APPR_CANCEL_TYPE	: rowData.APPR_CANCEL_TYPE	
				,V_P_CARD_NO			: rowData.CARD_NO
				,V_P_APPR_NO			: rowData.APPR_NO
				,V_P_TXN_DATE			: rowData.TXN_DATE
				,V_P_DOC_ID				: rowData.DOC_ID			
				,V_P_FORM_ID			: p_formId
				,V_P_MENU_ID			: p_menuId
				,V_P_PROC_ID			: ''
				,V_P_USERID				: ''
				,V_P_PC					: '' 
		};		
 
        const postJsonPromise = gfn_postJSON("/fi/fap/car/saveFig3150DocRefresh.do", {
        	getType				: 'json',
        	workType			: 'U',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj, true)
		});
 
        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");
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
    
    //전기일자 일괄변경
    var fn_btnDocDateAllChange = async function() {
    	
    	var cnt 		= 0
    	var chkList		= [];
    	for (var i = 0; i < jsonFig3150List.length; i++) {
			var obj = jsonFig3150List[i];
			if(obj['CHK_YN']=='Y' && obj['DOC_STATUS'] != '6'){
				cnt ++;
				obj['rownum'] = i;
				chkList.push(obj);
			}
		}
		if(cnt==0){
        	gfn_comAlert("E0000", "처리대상이 없습니다.");
        	return;
		}    	
		
		let p_cbofi_org_code	= gfnma_nvl(SBUxMethod.get("srch-cbofi-org-code"));
		let p_ymddoc_date_fr	= gfnma_nvl(SBUxMethod.get("srch-ymddoc-date-fr"));
		let p_ymddoc_date_to 	= gfnma_nvl(SBUxMethod.get("srch-ymddoc-date-to"));
		let p_ymdtxn_date_fr	= gfnma_nvl(SBUxMethod.get("srch-ymdtxn-date-fr"));
		let p_ymdtxn_date_to 	= gfnma_nvl(SBUxMethod.get("srch-ymdtxn-date-to"));
		
		let p_doc_date 			= gfnma_nvl(SBUxMethod.get("srch-pay-s2date"));
		
		if(!p_doc_date){
        	gfn_comAlert("E0000", "전기일을 입력하세요.");
        	return;
		}
		
		if(confirm("정말 변경하시겠습니까? 변경하시려면 YES를 클릭하세요.")){
		}else{
			return;
		}		
		
		//서버 전송 리스트
        let listData = [];
    	for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i];
            const param = {
                    cv_count	: '0',
                    getType		: 'json',
                    rownum		: obj.rownum,
                    workType	: 'CHANGE',
           	    	params 		: gfnma_objectToString({
               			V_P_DEBUG_MODE_YN		: ''
               			,V_P_LANG_ID			: ''
               			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
               			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
               			,V_P_FI_ORG_CODE		: p_cbofi_org_code		//회계단위
               			,V_P_TXN_DATE_FR		: p_ymdtxn_date_fr		//사용일자 시작
               			,V_P_TXN_DATE_TO		: p_ymdtxn_date_to		//사용일자 종료
               			,V_P_DOC_DATE_FR		: p_ymddoc_date_fr		//전기일자 시작
               			,V_P_DOC_DATE_TO		: p_ymddoc_date_to		//전기일자 종료
               			,V_P_APPR_CANCEL_TYPE	: obj.APPR_CANCEL_TYPE	
               			,V_P_CARD_NO			: obj.CARD_NO
               			,V_P_APPR_NO			: obj.APPR_NO
               			,V_P_TXN_DATE			: obj.TXN_DATE
               			,V_P_DOC_DATE			: p_doc_date
               			,V_P_ACCOUNT_EMP_CODE	: obj.ACCOUNT_EMP_CODE	
               			,V_P_CARD_ID			: obj.CARD_ID			
               			,V_P_CARD_AMT			: '0'			
               			,V_P_CARD_VAT_AMT		: '0'			
               			,V_P_FORM_ID			: p_formId
               			,V_P_MENU_ID			: p_menuId
               			,V_P_PROC_ID			: ''
               			,V_P_USERID				: ''
               			,V_P_PC					: '' 
                    })
            	}			
            listData.push(param);
    	}	
 
        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/fi/fap/car/saveFig3150DocDateAllChange.do", {listData: listData});
 
            const data = await postJsonPromise;
            console.log('data:', data);
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
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
    }
    
    //제외처리
    var fn_btnExclusion = async function() {
    	
    	var cnt 		= 0
    	var chkList		= [];
    	for (var i = 0; i < jsonFig3150List.length; i++) {
			var obj = jsonFig3150List[i];
			if(obj['CHK_YN']=='Y' && obj['DOC_STATUS'] != '6'){
				cnt ++;
				obj['rownum'] = i;
				chkList.push(obj);
			}
		}
		if(cnt==0){
        	gfn_comAlert("E0000", "처리대상이 없습니다.");
        	return;
		}    	
		
    	let p_cboexcept_code	= gfnma_multiSelectGet('#srch-cboexcept-code');			//제외처리 선택
		let p_txtexcept_reason	= gfnma_nvl(SBUxMethod.get("srch-txtexcept-reason"));	//제외처리 수기입력
		
		if(!p_cboexcept_code){
        	gfn_comAlert("E0000", "제외사유를 선택하세요.");
        	return;
		}    	
		
		if(confirm("정말 제외처리 하시겠습니까? 제외 하시려면 Yes를 클릭하세요.")){
		}else{
			return;
		}		
		
		//서버 전송 리스트
        let listData = [];
    	for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i];
            const param = {
                    cv_count	: '0',
                    getType		: 'json',
                    rownum		: obj.rownum,
                    workType	: 'EXCLUSION',
           	    	params 		: gfnma_objectToString({
               			V_P_DEBUG_MODE_YN		: ''
               			,V_P_LANG_ID			: ''
               			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
               			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
               			,V_P_APPR_CANCEL_TYPE	: obj.APPR_CANCEL_TYPE	
               			,V_P_APPR_NO			: obj.APPR_NO
               			,V_P_CARD_NO			: obj.CARD_NO
               			,V_P_EXCEPT_CODE		: p_cboexcept_code
               			,V_P_EXCEPT_REASON		: p_txtexcept_reason
               			,V_P_CARD_ID			: obj.CARD_ID			
               			,V_P_FORM_ID			: p_formId
               			,V_P_MENU_ID			: p_menuId
               			,V_P_PROC_ID			: ''
               			,V_P_USERID				: ''
               			,V_P_PC					: '' 
                    })
            	}			
            listData.push(param);
    	}	
 
        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/fi/fap/car/saveFig3150DocExclusion.do", {listData: listData});
 
            const data = await postJsonPromise;
            console.log('data:', data);
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
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
    }
    
    //제외처리취소
    var fn_btnExclusionCancel = async function() {
    	
    	var cnt 		= 0
    	var chkList		= [];
    	for (var i = 0; i < jsonFig3150List.length; i++) {
			var obj = jsonFig3150List[i];
			if(obj['CHK_YN']=='Y' && obj['DOC_STATUS'] == '-9'){
				cnt ++;
				obj['rownum'] = i;
				chkList.push(obj);
			}
		}
		if(cnt==0){
        	gfn_comAlert("E0000", "처리대상이 없습니다.");
        	return;
		}    	
		
    	let p_cboexcept_code	= gfnma_multiSelectGet('#srch-cboexcept-code');			//제외처리 선택
		let p_txtexcept_reason	= gfnma_nvl(SBUxMethod.get("srch-txtexcept-reason"));	//제외처리 수기입력
		
		if(!p_cboexcept_code){
        	gfn_comAlert("E0000", "제외사유를 선택하세요.");
        	return;
		}    	
		
		if(confirm("정말 제외취소 처리 하시겠습니까? 제외취소 하시려면 Yes를 클릭하세요.")){
		}else{
			return;
		}		
		
		//서버 전송 리스트
        let listData = [];
    	for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i];
            const param = {
                    cv_count	: '0',
                    getType		: 'json',
                    rownum		: obj.rownum,
                    workType	: 'EXCLUSION_CANCEL',
           	    	params 		: gfnma_objectToString({
               			V_P_DEBUG_MODE_YN		: ''
               			,V_P_LANG_ID			: ''
               			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
               			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
               			,V_P_APPR_CANCEL_TYPE	: obj.APPR_CANCEL_TYPE	
               			,V_P_APPR_NO			: obj.APPR_NO
               			,V_P_CARD_NO			: obj.CARD_NO
               			,V_P_EXCEPT_CODE		: p_cboexcept_code
               			,V_P_EXCEPT_REASON		: p_txtexcept_reason
               			,V_P_CARD_ID			: obj.CARD_ID			
               			,V_P_FORM_ID			: p_formId
               			,V_P_MENU_ID			: p_menuId
               			,V_P_PROC_ID			: ''
               			,V_P_USERID				: ''
               			,V_P_PC					: '' 
                    })
            	}			
            listData.push(param);
    	}	
 
        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/fi/fap/car/saveFig3150DocExclusionCancel.do", {listData: listData});
 
            const data = await postJsonPromise;
            console.log('data:', data);
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
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
