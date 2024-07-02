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
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 법인카드승인내역관리(매입) -->
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
            <div class="box-body">

				<div style="padding-bottom:10px">
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
	                            <th scope="row" class="th_bg">회계단위</th>
	                            <td colspan="3" class="td_input" style="border-right:hidden;">
	                                <sbux-select id="srch-cbofi-org-code" name="srch-cbofi-org-code" uitype="single" jsondata-ref="jsonCbofiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">년월</th>
	                            <td colspan="3" class="td_input" style="border-right:hidden;">
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
	                            	 
	                            <th scope="row" class="th_bg">전기일자</th>
	                            <td colspan="3" class="td_input" style="border-right:hidden;">
	                            	<div style="display:flex;float:left">
									    <sbux-datepicker
									            id="srch-ymddoc-date-fr"
									            name="srch-ymddoc-date-fr"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>                          
									    <font style="padding-left:5px;padding-right:5px">-</font>  
									    <sbux-datepicker
									            id="srch-ymddoc-date-to"
									            name="srch-ymddoc-date-to"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>                            
	                            	</div>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">사용일자</th>
	                            <td colspan="3" class="td_input" >
	                            	<div style="display:flex;float:left">
									    <sbux-datepicker
									            id="srch-ymdtxn-date-fr"
									            name="srch-ymdtxn-date-fr"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>                          
									    <font style="padding-left:5px;padding-right:5px">-</font>  
									    <sbux-datepicker
									            id="srch-ymdtxn-date-to"
									            name="srch-ymdtxn-date-to"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>                            
	                            	</div>
	                            </td>
	                        </tr>    
	                        <tr>
	                            <th scope="row" class="th_bg">사용자</th>
								<td colspan="2"  class="td_input" >
	   								<sbux-input
										uitype="text"
										id="srch-txtemp-name"
										class="form-control input-sm"									
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
										text="찾기" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1"
									></sbux-button>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">사용자부서</th>
								<td colspan="2"  class="td_input" >
	   								<sbux-input
										uitype="text"
										id="srch-txtdept-name"
										class="form-control input-sm">
									</sbux-input>
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
										text="찾기" uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup2">
									</sbux-button>
	                            </td>
	                            	                            
	                            <th scope="row" class="th_bg">전표상태</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbodoc-status" name="srch-cbodoc-status" uitype="single" jsondata-ref="jsonCbodocStatusCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">업종코드</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="srch-cbomcc-code" uitype="single" jsondata-ref="jsonCbomccCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th scope="row" class="th_bg">카드번호</th>
								<td colspan="3"  class="td_input" >
		                            <sbux-input id="srch-txtcard-no" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
	                            </td>
	                            <th scope="row" class="th_bg">전표번호</th>
	                            <td colspan="4" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;">
				                        <sbux-input id="srch-txtdoc-name" class="form-control input-sm" uitype="text" style="width:250px;margin-right:10px"></sbux-input>
		                       			<sbux-checkbox 
		                       				id="srch-chkmulti-yn2" 
		                       				uitype="normal" 
		                       				text="복수선택" 
		                       				true-value="Y" 
		                       				false-value="N" 
		                       				style="margin-top:8px"
		                       				>
		                       			</sbux-checkbox>
									    <font style="padding-right:10px"></font>  
										<sbux-button
											class="btn btn-xs btn-outline-dark"
											text="복수선택" uitype="modal"
											target-id="modal-compopup3"
											onclick="fn_compopup4">
										</sbux-button>
	                            	</div>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">승인번호</th>
	                            <td colspan="6" class="td_input" >
	                            	<div style="display:flex;float:left;vertical-align:middle;">
			                            <sbux-input id="srch-txtappr-no" class="form-control input-sm" uitype="text" style="width:250px;margin-right:10px"></sbux-input>
		                       			<sbux-checkbox 
		                       				id="srch-chkmulti-yn" 
		                       				uitype="normal" 
		                       				text="복수선택" 
		                       				true-value="Y" 
		                       				false-value="N" 
		                       				style="margin-top:8px"
		                       				>
		                       			</sbux-checkbox>
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
                
                <div class="row">
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>세부리스트</span>
	                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
		                    <sbux-button uitype="normal" text="거래처생성" 		class="btn btn-sm btn-outline-danger" 	style="margin-right:5px" onclick="cfn_approval"></sbux-button>
		                    <sbux-button uitype="normal" text="전표번호갱신" 	class="btn btn-sm btn-outline-danger" 	style="margin-right:5px" onclick="cfn_approval"></sbux-button>
	                    	<lavel style="margin-right:5px;padding-top:5px" >전기일</lavel>
						    <sbux-datepicker style="padding-right:10px !important;width:100px" id="srch-pay_s2date" name="srch-pay_s2date" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed"></sbux-datepicker> 
		                    <sbux-button uitype="normal" text="전기일자 일괄변경" 	class="btn btn-sm btn-outline-danger" 	style="margin-right:5px" onclick="cfn_approval"></sbux-button>
	                    	<lavel style="margin-right:5px;padding-top:5px" >제외사유</lavel>
							<div class="dropdown" style="margin-right:5px" >
							    <button style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="srch-cboexcept-code" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    	<font>선택</font>
							        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
							    </button>
							    <div class="dropdown-menu" aria-labelledby="srch-cboexcept-code" style="width:300px;height:150px;padding-top:0px;overflow:auto">
							    </div>
							</div>                                    
							<sbux-input uitype="text" id="SRCH_DEPT_NAME_1" 	class="form-control input-sm" 			style="width:120px;margin-right:5px"></sbux-input>
		                    <sbux-button uitype="normal" text="제외처리" 		class="btn btn-sm btn-outline-danger" 	style="margin-right:5px" onclick="cfn_approval"></sbux-button>
		                    <sbux-button uitype="normal" text="제외처리" 		class="btn btn-sm btn-outline-danger" 	style="margin-right:5px" onclick="cfn_approval"></sbux-button>
		                    <sbux-button uitype="normal" text="제외처리 취소" 	class="btn btn-sm btn-outline-danger" 	onclick="cfn_approval"></sbux-button>
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
        <sbux-modal style="width:700px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
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
			gfnma_setComSelect(['srch-cbofi-org-code'], jsonCbofiOrgCode, 'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', '1100'),
			//전표상태
			gfnma_setComSelect(['srch-cbodoc-status'], jsonCbodocStatusCode, 'L_FIG002_2', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//업종코드
			gfnma_setComSelect(['srch-cbomcc-code'], jsonCbomccCode, 'L_EFI0006', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ZMCC_CODE', 'ZMCC_NAME', 'Y', ''),
			//제외사유
			gfnma_multiSelectInit({
				target			: ['#srch-cboexcept-code']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM221'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'CODE'
				,colLabel		: 'NAME'
				,columns		:[
		            {caption: "제외사유",		ref: 'CODE', 			width:'150px',  	style:'text-align:left'},
		            {caption: "제외내용", 		ref: 'NAME',    		width:'150px',  	style:'text-align:left'}
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
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["국가코드"],			ref: 'NATION_CODE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["국가약어"], 		ref: 'NATION_CODE_ABBR',    	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["팝업"], 			ref: 'POP_BTN',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_gridPopup(event, " + nRow + ", " + nCol + ")'>선택</button>";
            	}	
            },
            {caption: ["선택"],  			ref: 'POP_SEL',    				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["국가약식명"],  		ref: 'NATION_NAME',    			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["국가정식명"],      	ref: 'NATION_FULL_NAME', 		type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["국가정식명(한글)"],	ref: 'NATION_FULL_NAME_CHN',	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["지역"],				ref: 'REGION_CODE', 			type:'combo',  		width:'100px',  	style:'text-align:left', disabled: true,
            	typeinfo: {
					ref			: 'jsonRegionCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },
            {caption: ["통화"],				ref: 'CURRENCY_CODE',   		type:'combo',  		width:'100px',  	style:'text-align:left', disabled: true,
            	typeinfo: {
					ref			: 'jsonCurrenvyCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },
            {caption: ["비고"], 			ref: 'MEMO', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["정렬순서"], 		ref: 'SORT_SEQ',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["사용여부"], 		ref: 'USE_YN', 				type:'output',		width:'80px',		style:'text-align:center'}
        ];

        Fig3150Grid = _SBGrid.create(SBGridProperties);
        Fig3150Grid.bind('click', 'fn_view');
    }

    /**
     * 목록 조회
     */
	function cfn_search() {
		fn_setFig3150Grid();
	}
	
    /**
     * 목록 가져오기
     */
    const fn_setFig3150Grid = async function() {

//		Fig3150Grid.clearStatus();

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
			,V_P_COMP_CODE		: gv_ma_selectedApcCd
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
        	workType			: 'Q',
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
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						DOC_STATUS				: item.DOC_STATUS,				//전표상태	--> DOC_STATUS_NAME (필요)		<-- L_FIG002_2 공통코드 조인
  						DOC_NAME				: item.DOC_NAME,				//전표번호
  						FINAL_STEP_SEQ			: item.FINAL_STEP_SEQ,			//결재자	--> ?
  						APPR_CANCEL_TYPE		: item.APPR_CANCEL_TYPE,		//거래구분	--> APPR_CANCEL_TYPE_NAME (필요)  <-- L_FIG021 공통코드 조인
  						DEPT_NAME				: item.DEPT_NAME,				//부서명	--> ?
  						EMP_NAME				: item.EMP_NAME,				//사용자명
  						CARD_NO					: item.CARD_NO,					//카드번호
  						APPR_NO					: item.APPR_NO,					//승인번호
  						COST_CENTER_CODE		: item.COST_CENTER_CODE,		//코스트센터(전표)
  						ACCOUNT_CODE			: item.ACCOUNT_CODE,			//사용계정	--> ACCOUNT_CODE_NAME (필요)	<-- L_ACCT_CD 공통코드 조인
  						DOC_DATE				: item.DOC_DATE,				//전기일자
  						TXN_DATE				: item.TXN_DATE,				//거래일자
  						CS_NAME					: item.CS_NAME,					//거래처명
  						CS_BIZ_REGNO			: item.CS_BIZ_REGNO,			//가맹점 사업자번호
  						BIZ_CS_NAME				: item.BIZ_CS_NAME,				//가맹점명
  						BIZ_CODE				: item.BIZ_CODE,				//업종코드
  						BIZ_ITEMS				: item.BIZ_ITEMS,				//업종명
  						ZCARD_KIND				: item.ZCARD_KIND,				//카드유형	--> ZCARD_KIND_NAME (필요) 	<-- L_FIM216  공통코드 조인
  						CARD_AMT				: item.CARD_AMT,				//매입금액
  						CARD_VAT_AMT			: item.CARD_VAT_AMT,			//매입부가세
  						SUM_AMOUNT				: item.SUM_AMOUNT,				//총액
  						ACCOUNT_EMP_CODE		: item.ACCOUNT_EMP_CODE,		//전표담당자명 --> ACCOUNT_EMP_CODE_NAME(필요)  <-- P_HRI001 공통코드 조인
  						SETTLE_DATE				: item.SETTLE_DATE,				//결재예정일자
  						EXCEPT_CODE				: item.EXCEPT_CODE,				//제외사유코드 	--> ?
  						EXCEPT_REASON			: item.EXCEPT_REASON,			//제외사유	 	--> ?
  						EXCEPT_AMOUNT			: item.EXCEPT_AMOUNT,			//제외금액	 	--> ?
  						TAX_TYPE				: item.TAX_TYPE,				//가맹점과세구분	--> TAX_TYPE_NAME (필요) <-- L_FIG014  공통코드 조인
  						TAX_GUBUN_NAME			: item.TAX_GUBUN_NAME,			//과세유형		--> ?
  						ZTRAN_DATE2				: item.ZTRAN_DATE2,				//전기일/증빙일	
  						DOC_ID					: item.DOC_ID,					//전표ID	
  						HEADER_INVOICE_AMOUNT	: item.HEADER_INVOICE_AMOUNT,	//전표금액	
  						HEADER_CARD_AMT			: item.HEADER_CARD_AMT,			//전표공급가액
  						HEADER_VAT_AMOUNT		: item.HEADER_VAT_AMOUNT,		//전표부가세금액
  						HEADER_DESC				: item.HEADER_DESC,				//적요				--> ?
  						BIZ_CLOSE_DATE			: item.BIZ_CLOSE_DATE,			//폐업일자			--> ?
  						TAX_DATE				: item.TAX_DATE,				//세무일자			--> ?
  						ZVENDOR_CLOSE_IN		: item.ZVENDOR_CLOSE_IN,		//가맹점휴폐업정보	--> ?
  						ZUPDATE_DATE			: item.ZUPDATE_DATE,			//수정일자			--> ?
  						APPR_DATE				: item.APPR_DATE,				//승인일자			
  						APPR_TIME				: item.APPR_TIME,				//승인시각			
  						ZCHARGE_DATE			: item.ZCHARGE_DATE,			//지급일자			--> ?
  						APPR_STATUS_COUNT		: item.APPR_STATUS_COUNT,		//남은결재자		
  						TRANS_DATE				: item.TRANS_DATE				//매입일자
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
		
        SBUxMethod.attr('NATION_CODE',	'readonly', true);
        
        gfnma_uxDataSet('#dataArea1', rowData);
        gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', rowData.CURRENCY_CODE);
    }
    
    /**
     * 사용자 팝업
     */
    var fn_compopup1 = function() {
    	
        var searchText 		= gfnma_nvl(SBUxMethod.get("srch-txtemp-name"));
        //var replaceText0 	= "_USER_ID_";
        //var replaceText1 	= "_USER_NAME_";
        //var strWhereClause 	= "AND X.USER_ID LIKE '%" + replaceText0 + "%' AND X.USER_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_USER_02'
        	,popupType				: 'A'
    		,whereClause			: '' //strWhereClause
   			,searchCaptions			: ["사번", 		"사원명"]
   			,searchInputFields		: ["EMP_CODE", 	"EMP_NAME"]
   			,searchInputValues		: ["", 			searchText]
    		,height					: '400px'
   			,tableHeader			: ["사번", 		"직원명", 		"부서코드", 	"부서명"]
   			,tableColumnNames		: ["USER_ID", 	"USER_NAME",  	"DEPT_CODE", 	"DEPT_NAME"]
   			,tableColumnWidths		: ["80px", 		"80px", 		"80px", 		"120px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('srch-txtemp-name', 	data.USER_NAME);
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
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: ["", 				searchText,		""]
            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"부서코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"DEPT_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px",		"200px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('srch-txtdept-name', 	data.DEPT_NAME);
                SBUxMethod.set('srch-txtdept-code', 	data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
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
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>