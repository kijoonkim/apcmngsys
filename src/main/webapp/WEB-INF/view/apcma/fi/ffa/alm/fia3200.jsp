<%
/**
 * @Class Name 		: fia3100.jsp
 * @Description 	: 자산명세조회 화면
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
	<title>title : 자산명세조회</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;padding-bottom:0px">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 자산명세조회 -->
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

                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 6%">
                        <col style="width: 3%">
                    </colgroup>
                    <tbody>
                    
                        <tr>
                            <th scope="row" class="th_bg">사업단위</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        
                            <th scope="row" class="th_bg">사업장</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        
                            <th scope="row" class="th_bg">회계기준</th>
                            <td colspan="3" class="td_input" >
                                <sbux-select id="SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                        
                            <th scope="row" class="th_bg">데이타항목</th>
                            <td colspan="3" class="td_input" >
                            </td>
                        </tr>
                        
                    </tbody>
                </table>
                
                <div class="row">
                
                    <div class="col-sm-6" style="width:75%">
                        
						<div class="table-responsive tbl_scroll_sm" style="padding-top:10px">
						
						    <sbux-tabs id="idxTab_norm1" name="idxTab_norm1" uitype="normal"
			                   title-target-id-array = "SB_TOP_TAB1^SB_TOP_TAB2"
			                   title-text-array = "자산원장List^자산원장Summary"
			                   title-target-value-array="1^2"
			                   onclick="fn_tabClick(idxTab_norm1)"></sbux-tabs>					
							
							<div class="tab-content" style="width:100%" >
							
								<div id="SB_TOP_TAB1" >
		                            <div id="sb_area_grid1" style="height:550px; width:100%;">
		                        	</div>         							
								</div>
							
								<div id="SB_TOP_TAB2" >
		                            <div id="sb_area_grid2" style="height:550px; width:100%;">
		                        	</div>         							
		                    	</div>
		
		                	</div>
	            		
	            		</div>
            		
        			</div>
        			
                    <div class="col-sm-6" style="width:25%">
                    
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>검색조건</span></li>
                            </ul>
                        </div>
                        
                        <div style="width:100%">
                        
                        	<table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
			                        <col style="width: 6%">
			                        <col style="width: 6%">
			                        <col style="width: 9%">
                                </colgroup>
			                    <tbody>
	                                <tr>
	                                    <th scope="row" class="th_bg">자산구분</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select id="SCH_ASSET_CATEGORY" uitype="single" jsondata-ref="jsonAssetCategory" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                                    </td>                        
                      				</tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">상각여부</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select id="SCH_DEPRECIATE_YN" uitype="single" jsondata-ref="jsonDepreciateYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                                    </td>                        
                      				</tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">중분류</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select id="SCH_ASSET_LEVEL2" uitype="single" jsondata-ref="jsonAssetLevel2" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                                    </td>                        
                      				</tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">소분류</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select id="SCH_ASSET_LEVEL3" uitype="single" jsondata-ref="jsonAssetLevel3" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                                    </td>                        
                      				</tr>
	                                <tr>
	                                    <th scope="row" class="th_bg">조회기준일</th>
	                                    <td colspan="2" class="td_input">
										    <sbux-datepicker
										            id="FM_BASE_DATE"
										            uitype="popup"
										            date-format="yyyy-mm-dd"
										            class="form-control input-sm input-sm-ast inpt_data_reqed">
										    </sbux-datepicker>
	                                    </td>                        
                      				</tr>
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
    var Fia3200GridMast; 			// 그리드를 담기위한 객체 선언
    var jsonFia3200Mast 	= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fia3200Grid01; 				// 그리드를 담기위한 객체 선언
    var jsonFia3200Grid01 	= []; 	// 그리드의 참조 데이터 주소 선언
    
    var Fia3200Grid02; 				// 그리드를 담기위한 객체 선언
    var jsonFia3200Detail02 = []; 	// 그리드의 참조 데이터 주소 선언
    
	var jsonFiOrgCode		= [];	// 사업단위
	var jsonSiteCode		= [];	// 사업장
	var jsonAcctRuleCode	= [];	// 회계기준
	var jsonAssetCategory	= [];	// 자산구분
	var jsonDepreciateYn	= [];	// 상각여부
	var jsonAssetLevel2		= [];	// 중분류
	var jsonAssetLevel3		= [];	// 소분류
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],				jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SCH_SITE_CODE'],				jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['SCH_ACCT_RULE_CODE'],			jsonAcctRuleCode,	'L_FIM054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 자산구분
            gfnma_setComSelect(['SCH_ASSET_CATEGORY'],			jsonAssetCategory,	'L_FIA001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상각여부
            gfnma_setComSelect(['SCH_DEPRECIATE_YN'],			jsonDepreciateYn,	'L_COM036', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 중분류
            gfnma_setComSelect(['SCH_ASSET_LEVEL2'],			jsonAssetLevel2,	'L_FIA005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ASSET_GROUP_CODE', 'ASSET_GROUP_NAME', 'Y', ''),
            // 소분류
            gfnma_setComSelect(['SCH_ASSET_LEVEL3'],			jsonAssetLevel2,	'L_FIA006', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'ASSET_GROUP_CODE', 'ASSET_GROUP_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//재직상태
		gfnma_getComSelectList('L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME',
			function(list){
				$('#BTN_POP1').click(function(){
					fn_compopup10(list);
				});
			}
		)
  		
		//화면셋팅
    	fn_state('L');
  		
		fn_createFia3200Grid01();
		fn_createFia3200Grid02();
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
    	//fn_setFia3200GridMast('LIST');
    }
    
    function fn_createFia3200Grid01() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid1';
	    SBGridProperties.id 				= 'Fia3200Grid01';
	    SBGridProperties.jsonref 			= 'jsonFia3200Grid01';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total 				= {
                type 		: 'grand',
                position	: 'bottom',
                columns		: {
                    standard : [0],
                    sum : [10]
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
            {caption: ["상각여부"],				ref: 'DEPRECIATE_YN', 			type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["자산번호"],				ref: 'ASSET_NO', 	 		  	type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption: ["구분"],					ref: 'ASSET_CATEGORY', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["중분류"], 				ref: 'ASSET_LEVEL2', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["소분류"],				ref: 'ASSET_LEVEL3', 		  	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["원가중심점명"],			ref: 'COST_CENTER_CODE', 		type:'output',  	width:'150px',  	style:'text-align:left'},
            
            {caption: ["신규취득가액"],				ref: 'FUNCTIONAL_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대체입고금액"],				ref: 'TRANSFER_IN_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["자본적지출"],				ref: 'CAPITAL_EXPENDITURE', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},         
            {caption: ["보조금"],					ref: 'SUBSIDIES_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["처분유형"],					ref: 'DISPOSAL_TYPE',  			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["처분일"],					ref: 'DISPOSAL_DATE',  			type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["처분취득가액"],				ref: 'OUT_ACQUISITION_AMOUNT',	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대체출고금액"],				ref: 'TRANSFER_OUT_AMOUNT', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["처분보조금"],				ref: 'OUT_SUBSIDIES_AMOUNT', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["처분보조금상각누계액"],		ref: 'OUT_SUBSIDIES_ACC_DEPR',	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["처분상각누계액"],			ref: 'OUT_ACCUM_DEPR', 			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["기말상각누계액"],			ref: 'END_ACCUM_DEPR', 			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["기말보조금상각누계액"],		ref: 'END_SUBSIDES_ACCUM_DEPR', type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["수량"],						ref: 'ASSET_QTY',  				type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["장부가액"],					ref: 'BOOK_VALUE',  			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["프로젝트번호"],				ref: 'PROJECT_CODE',  			type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["취득일자"],					ref: 'ACQUIRE_DATE',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fia3200Grid01 = _SBGrid.create(SBGridProperties);
        //Fia3200Grid01.bind('click', 			'fn_viewFia3200Grid01Event');
    }
    
    function fn_createFia3200Grid02() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid2';
	    SBGridProperties.id 				= 'Fia3200Grid02';
	    SBGridProperties.jsonref 			= 'jsonFia3200Grid02';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total 				= {
                type 		: 'grand',
                position	: 'bottom',
                columns		: {
                    standard : [2,3,4,5,6,7,8,9,10,11,12,13],
                    sum : [10]
                },
                grandtotalrow : {
                    titlecol 		: 1,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
            {caption: ["구분"],				ref: 'TXN_DATE', 				type:'output',  	width:'150px', 		style:'text-align:left'},

            {caption: ["신규취득가액"],			ref: 'FUNCTIONAL_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},  
            {caption: ["대체입고금액"],			ref: 'TRANSFER_IN_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["자본적지출"],			ref: 'CAPITAL_EXPENDITURE', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["보조금"],				ref: 'SUBSIDIES_AMOUNT', 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대체출고금액"],			ref: 'TRANSFER_OUT_AMOUNT', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["처분취득가액"],			ref: 'OUT_ACQUISITION_AMOUNT', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["처분보조금"],			ref: 'OUT_SUBSIDIES_AMOUNT', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["처분보조금상각누계액"], ref: 'OUT_SUBSIDIES_ACC_DEPR', 	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["처분상각누계액"], 		ref: 'OUT_ACCUM_DEPR', 			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["기말상각누계액"], 		ref: 'END_ACCUM_DEPR', 			type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["기말보조금상각누계액"],	ref: 'END_SUBSIDES_ACCUM_DEPR',	type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["장부가액"],				ref: 'BOOK_VALUE',		 		type:'output',  	width:'170px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["비고"],				ref: 'MEMO',    				type:'output',  	width:'200px',  	style:'text-align:left'},
        ];

        Fia3200Grid02 = _SBGrid.create(SBGridProperties);
        //Fia3200Grid02.bind('click', 			'fn_viewFia3200Grid02Event');
    }
    
    
        
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>