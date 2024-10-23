<%
/**
 * @Class Name 		: fia4100.jsp
 * @Description 	: 이동내역등록 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.10.17
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.10.17   	장성주		최초 생성
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
	<title>title : 이동내역등록</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 이동내역등록 -->
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
            <div class="box-body">

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
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="th_bg"><font style="font-weight:bold;color:blue">[이동전]</font> 사업단위</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select style="width:200px" id="SCH_FI_ORG_CODE1" uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        
                            <th scope="row" class="th_bg">사업장</th>
                            <td colspan="7" class="td_input" >
                                <sbux-select style="width:200px" id="SCH_SITE_CODE1" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        </tr>
                    
                        <tr>
                            <th scope="row" class="th_bg"><font style="font-weight:bold;color:blue">[이동후]</font> 사업단위</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select style="width:200px" id="SCH_FI_ORG_CODE2" uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        
                            <th scope="row" class="th_bg">사업장</th>
                            <td colspan="7" class="td_input" >
                                <sbux-select style="width:200px" id="SCH_SITE_CODE2" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        </tr>
                    
                        <tr>
                            <th scope="row" class="th_bg">자산이동일</th>
                            <td colspan="3" class="td_input" >
			                    <div style="width:100%;display:flex;vertical-align:middle;float:right;padding-top:0px;margin-right:auto">
								    <sbux-datepicker
								            id="SCH_TRANSFER_DATE_FROM"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed">
								    </sbux-datepicker>
								    <font style="padding-left:5px;padding-right:5px" >-</font>                          
								    <sbux-datepicker
								            id="SCH_ACQUIRE_DATE_TO"
								            uitype="popup"
								            date-format="yyyy-mm-dd"
								            class="form-control input-sm input-sm-ast inpt_data_reqed">
								    </sbux-datepicker> 
								</div>                            
                            </td>
                        
                            <th scope="row" class="th_bg">이동자산</th>
                            <td colspan="7" class="td_input" >
	                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
 									<sbux-input style="width:80px" id="SCH_ASSET_CODE" uitype="text" class="form-control input-sm"></sbux-input>
 									<font style="width:5px"></font>
									<sbux-button
										style="width:20px"
										class="btn btn-xs btn-outline-dark"
										text=".." uitype="modal"
										target-id="modal-compopup1"
										onclick="fn_compopup1()"></sbux-button>
	 									<font style="width:5px"></font>
	 									<sbux-input style="width:200px" id="SCH_ASSET_NAME" uitype="text" class="form-control input-sm"></sbux-input>
	                           	</div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="row">
                
                    <div class="col-sm-6" style="width:100%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>자산정산 리스트</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb_area_grid1" style="height:250px; width:100%;"></div>
                        </div>
                    </div>
                
                    <div class="col-sm-6" style="width:100%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>자산 이동내역 편집</span>
                                </li>
                            </ul>
                        </div>
                        
						<div class="table-responsive tbl_scroll_sm" style="padding-top:10px">
						
                        	<table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
			                        <col style="width: 6%">
			                        <col style="width: 6%">
			                        <col style="width: 9%">
			
			                        <col style="width: 6%">
			                        <col style="width: 6%">
			                        <col style="width: 9%">
                                </colgroup>
			                    <tbody>
			                    
			                    	<!-- hidden  -->
 									<sbux-input style="display:none" id="FM_DOC_ID" uitype="text" class="form-control input-sm"></sbux-input>
			                    	<!-- /hidden  -->
			                    
	                                <tr>
	                                    <th scope="row" class="th_bg">이동번호</th>
	                                    <td colspan="2" class="td_input">
				                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
	                                        	<sbux-input style="width:200px" id="FM_ASSET_TRANSFER_NO" class="form-control input-sm" uitype="text" ></sbux-input>
			  									<font style="width:15px"></font>
	                                        	<font>자산이동일</font>
			  									<font style="width:5px"></font>
											    <sbux-datepicker
											            id="SCH_TRANSFER_DATE"
											            uitype="popup"
											            date-format="yyyy-mm-dd"
											            class="form-control input-sm input-sm-ast inpt_data_reqed">
											    </sbux-datepicker>
	                                        </div>
	                                    </td>
	                                    
	                                    <th scope="row" class="th_bg">이동자산</th>
	                                    <td colspan="2" class="td_input">
				                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			  									<sbux-input style="width:80px" id="FM_ASSET_CODE" uitype="text" class="form-control input-sm"></sbux-input>
			  									<font style="width:5px"></font>
												<sbux-button
													style="width:20px"
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup2()"></sbux-button>
			  									<font style="width:5px"></font>
			  									<sbux-input style="width:200px" id="FM_ASSET_NAME" uitype="text" class="form-control input-sm"></sbux-input>
				                           	</div>
	                                    </td>
                       				</tr>	
			                    
	                                <tr>
	                                    <th scope="row" class="th_bg">이동전 사업장</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select style="width:300px" id="FM_SITE_CODE_FROM" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                                    </td>
	                                    
	                                    <th scope="row" class="th_bg">이동후 사업장</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select style="width:300px" id="FM_SITE_CODE_TO" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                                    </td>
                       				</tr>	
			                    
	                                <tr>
	                                    <th scope="row" class="th_bg">이동전 부서</th>
	                                    <td colspan="2" class="td_input">
				                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			  									<sbux-input style="width:80px" id="FM_DEPT_NAME_CODE" uitype="text" class="form-control input-sm"></sbux-input>
			  									<font style="width:5px"></font>
												<sbux-button
													style="width:20px"
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup3('1')"></sbux-button>
			  									<font style="width:5px"></font>
			  									<sbux-input style="width:200px" id="FM_DEPT_NAME_FROM" uitype="text" class="form-control input-sm"></sbux-input>
				                           	</div>
	                                    </td>
	                                    
	                                    <th scope="row" class="th_bg">이동후 부서</th>
	                                    <td colspan="2" class="td_input">
				                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			  									<sbux-input style="width:80px" id="FM_DEPT_TO_CODE" uitype="text" class="form-control input-sm"></sbux-input>
			  									<font style="width:5px"></font>
												<sbux-button
													style="width:20px"
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup3('2')"></sbux-button>
			  									<font style="width:5px"></font>
			  									<sbux-input style="width:200px" id="FM_DEPT_TO_FROM" uitype="text" class="form-control input-sm"></sbux-input>
				                           	</div>
	                                    </td>
                       				</tr>	

	                                <tr>
	                                    <th scope="row" class="th_bg">이동전 원가중심점</th>
	                                    <td colspan="2" class="td_input">
				                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			  									<sbux-input style="width:80px" id="FM_COST_CENTER_CODE_FROM" uitype="text" class="form-control input-sm"></sbux-input>
			  									<font style="width:5px"></font>
												<sbux-button
													style="width:20px"
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup4('1')"></sbux-button>
			  									<font style="width:5px"></font>
			  									<sbux-input style="width:200px" id="FM_COST_CENTER_NAME_FROM" uitype="text" class="form-control input-sm"></sbux-input>
				                           	</div>
	                                	</td>
	                                
	                                    <th scope="row" class="th_bg">이동후 원가중심점</th>
	                                    <td colspan="2" class="td_input">
				                           	<div style="display:flex;float:left;vertical-align:middle;width:100%">
			  									<sbux-input style="width:80px" id="FM_COST_CENTER_CODE_TO" uitype="text" class="form-control input-sm"></sbux-input>
			  									<font style="width:5px"></font>
												<sbux-button
													style="width:20px"
													class="btn btn-xs btn-outline-dark"
													text=".." uitype="modal"
													target-id="modal-compopup1"
													onclick="fn_compopup4('2')"></sbux-button>
			  									<font style="width:5px"></font>
			  									<sbux-input style="width:200px" id="FM_COST_CENTER_NAME_TO" uitype="text" class="form-control input-sm"></sbux-input>
			  									
			  									<font style="width:10px"></font>
			  									
	                                        	<font>전표번호</font>
			  									<font style="width:5px"></font>
			  									<sbux-input style="display:none" id="FM_DOC_NAME" uitype="text" class="form-control input-sm"></sbux-input>
				                           	</div>
	                                	</td>
	                                </tr>
                       									
	                                <tr>
	                                    <th scope="row" class="th_bg">비고</th>
	                                    <td colspan="5" class="td_input">
	                                        <sbux-textarea id="FM_MEMO" class="form-control input-sm" uitype="normal" style="width:100%;height:70px;"></sbux-textarea>
	                                    </td>
									</td>                       									
                       									
                       			</tbody>
                       		</table>	
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
	
	var p_ss_languageID	= '${loginVO.maLanguageID}';
	//-----------------------------------------------------------

	var p_sel_rowData =  null;
	
    //grid 초기화
    var Fia4100GridMast; 			// 그리드를 담기위한 객체 선언
    var jsonFia4100Mast 	= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fia4100Grid; 				// 그리드를 담기위한 객체 선언
    var jsonFia4100 		= []; 	// 그리드의 참조 데이터 주소 선언
    
	var jsonFiOrgCode		= [];	// 사업단위
	var jsonSiteCode		= [];	// 사업장
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE1','SCH_FI_ORG_CODE2'],			jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE1','SCH_SITE_CODE2','FM_SITE_CODE_FROM','"FM_SITE_CODE_TO"'],			jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state('L');
  		
		fn_createFia4100Grid();
		//cfn_search();
	} 
	
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_init();
    });

    /**
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#srchArea1');
    }
    
    /**
     * 화면 state 변경
     */
    function fn_state(type) {
    
// 		SBUxMethod.attr('FM_VAT_TYPE_CODE', 	'readonly', true);
    	
//     	if(type=='L'){
// 			$('#main-btn-new', parent.document).attr('disabled', true);
// 			$('#main-btn-save', parent.document).attr('disabled', true);
// 			$('#main-btn-del', 	parent.document).attr('disabled', true);
// 			//fn_fmDisabled(true);
//     	} else if(type=='N'){
//     		SBUxMethod.attr('SCH_DEPRECIATION_METHOD2', 		'readonly', false);
//     		$('#main-btn-save', parent.document).attr('disabled', false);
//     		$('#main-btn-del', 	parent.document).attr('disabled', false);
// 			//fn_fmDisabled(false);
//     	}
    }    
    
    /**
     * 목록 조회
     */
 	function cfn_search() {
 		fn_state('L');
    	//fn_setFia4100GridMast('LIST');
    }
    
    function fn_createFia4100Grid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid1';
	    SBGridProperties.id 				= 'Fia4100GridMast';
	    SBGridProperties.jsonref 			= 'jsonFia4100Mast';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["항목",			"이동번호"],	ref: 'ASSET_TRANSFER_NO', 		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["항목",			"자산이동일"], 	ref: 'TRANSFER_DATE',  		  	type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["항목",			"자산번호"], 	ref: 'ASSET_NO', 			   	type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["항목",			"자산명"], 		ref: 'ASSET_NAME',				type:'output',  	width:'200px',  	style:'text-align:left'},

            {caption: ["이동전 정보",	"사업장"],		ref: 'SITE_CODE_FROM', 	  		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["이동전 정보",	"부서"],		ref: 'DEPT_NAME_FROM', 	  		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["이동전 정보",	"코스트센터"],	ref: 'COST_CENTER_CODE_FROM', 	type:'output',  	width:'150px',  	style:'text-align:left'},

            {caption: ["이동후 정보",	"사업장"],		ref: 'SITE_CODE_TO',  	  		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["이동후 정보",	"부서"],		ref: 'DEPT_NAME_TO',  	  		type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["이동후 정보",	"코스트센터"],	ref: 'COST_CENTER_NAME_TO', 	type:'output',  	width:'150px',  	style:'text-align:left'},
            
            {caption: ["비고"],							ref: 'MEMO',  			  		type:'output',  	width:'300px',  	style:'text-align:left'},
        ];

        Fia4100GridMast = _SBGrid.create(SBGridProperties);
        //Fia4100GridMast.bind('click', 			'fn_viewFia4100GridMastEvent');
    }
    
    /**
     * 이동자산
     */
    function fn_compopup1() {
    	
        var searchCode 		= gfnma_nvl(SBUxMethod.get('SCH_ASSET_CODE'));
        var searchName 		= gfnma_nvl(SBUxMethod.get("SCH_ASSET_NAME"));
        
        var replaceText0 	= "_ASSET_NO_";
        var replaceText1 	= "_ASSET_NAME_";
        var strWhereClause 	= "AND A.ASSET_NO LIKE '%" + replaceText0 + "%' AND A.ASSET_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산목록');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FIA001'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["자산번호", 	"명칭"]
  			,searchInputFields		: ["ASSET_NO", 	"ASSET_NAME"]
  			,searchInputValues		: [searchCode, 	searchName]
    		,width					: '700px'
    		,height					: '400px'
  			,tableHeader			: ["자산번호",		"자산명",		"site_code",	"dept_code",		"dept_name",	"cost_center_code",			"cost_center_name"]
  			,tableColumnNames		: ["ASSET_NO", 	 	"ASSET_NAME",	"SITE_CODE",	"DEPT_CODE",		"DEPT_NAME",	"COST_CENTER_CODE",			"ADDRESS"]
  			,tableColumnWidths		: ["100px", 		 "250px",		"100px",		"100px",			"100px",		"100px",					"100px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('SCH_ASSET_CODE',	data.ASSET_NO);
				SBUxMethod.set('SCH_ASSET_NAME', 	data.ASSET_NAME);
			},
    	});
    }  
    
    /**
     * 이동자산
     */
    function fn_compopup2() {
    	
        var searchCode 		= gfnma_nvl(SBUxMethod.get('FM_ASSET_CODE'));
        var searchName 		= gfnma_nvl(SBUxMethod.get("FM_ASSET_NAME"));
        
        var replaceText0 	= "_ASSET_NO_";
        var replaceText1 	= "_ASSET_NAME_";
        var strWhereClause 	= "AND ASSET_NO LIKE '%" + replaceText0 + "%' AND ASSET_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '자산목록');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ASSET_LIST'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["자산번호", 	"자산명"]
  			,searchInputFields		: ["ASSET_NO", 	"ASSET_NAME"]
  			,searchInputValues		: [searchCode, 	searchName]
    		,width					: '800px'
    		,height					: '400px'
  			,tableHeader			: ["자산번호", 	"자산명",		"사업장",		"자산구분",			"구분명",				"중분류명",				"소분류명",				"부서코드",		"부서명",		"원가코드",			"원가중심점",		"프로젝트코드",	"프로젝트명"]
  			,tableColumnNames		: ["ASSET_NO", 	"ASSET_NAME",	"SITE_CODE",	"ASSET_CATEGORY",	"ASSET_CATEGORY_NAME",	"ASSET_LEVEL2_NAME",	"ASSET_LEVEL3_NAME",	"DEPT_CODE",	"DEPT_NAME",	"COST_CENTER_CODE",	"COST_CENTER_NAME",	"PROJECT_CODE",	"PROJECT_NAME"]
  			,tableColumnWidths		: ["80px", 	 	"250px",		"100px",		"80px",				"80px",					"100px",				"100px",				"100px",		"200px",		"100px",			"150px",			"100px",		"250px",]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('FM_ASSET_CODE',	data.ASSET_NO);
				SBUxMethod.set('FM_ASSET_NAME',	data.ASSET_NAME);
			},
    	});
    }     
    
    /**
     * 담당부서 
     */
    function fn_compopup3(type) {
    	
        var searchText1		= '';
        var searchText2		= '';
        if(type=='1'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_DEPT_NAME_FROM"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_DEPT_NAME_CODE"));
        } else if(type=='2'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_DEPT_TO_FROM"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_DEPT_TO_CODE"));
        }
        
        var param		 	= null;

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FI_DEPT'
            ,popupType				: 'B'
       		,whereClause			: param
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: [searchText2, 	searchText1,	""]
            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
            ,width					: '500px'
            ,height					: '400px'
            ,tableHeader			: ["부서코드",		"부서명" 		]
            ,tableColumnNames		: ["DEPT_CODE",		"DEPT_NAME"  	]
            ,tableColumnWidths		: ["100px", 		"200px" 		]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                if(type=='1'){
	                SBUxMethod.set('FM_DEPT_NAME_FROM', data.DEPT_NAME);
	                SBUxMethod.set('FM_DEPT_NAME_CODE', data.DEPT_CODE);
                } else if(type=='2'){
	                SBUxMethod.set('FM_DEPT_TO_FROM', data.DEPT_NAME);
	                SBUxMethod.set('FM_DEPT_TO_CODE', data.DEPT_CODE);
                }
            },
        });
    }       
    
    
    /**
     * 원가중심점 
     */
     function fn_compopup4(type) {

        var searchText1 	= '';
        var searchText2 	= '';
        
        if(type=='1'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_CODE_FROM"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_NAME_FROM"));
        } else if(type=='2'){
            searchText1		= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_CODE_TO"));
            searchText2		= gfnma_nvl(SBUxMethod.get("FM_COST_CENTER_NAME_TO"));
        }
        
        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%'";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '코스트센터');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COST_CENTER'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
   			,searchInputValues		: [searchText1, 		searchText2]
    		,height					: '500px'
   			,tableHeader			: ["코스트센터코드", 	"코스트센터명"]
   			,tableColumnNames		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
   			,tableColumnWidths		: ["100px", 				"200px"]
			,itemSelectEvent		: function (data){
                if(type=='1'){
	                SBUxMethod.set('FM_COST_CENTER_CODE_FROM', data.COST_CENTER_CODE);
	                SBUxMethod.set('FM_COST_CENTER_NAME_FROM', data.COST_CENTER_NAME);
                } else if(type=='2'){
	                SBUxMethod.set('FM_COST_CENTER_CODE_TO', data.COST_CENTER_CODE);
	                SBUxMethod.set('FM_COST_CENTER_NAME_TO', data.COST_CENTER_NAME);
                }
			},
    	});
  	}
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>