<%
/**
 * @Class Name 		: Org1200.jsp
 * @Description 	: 사업단위 정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.08.06
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.08.06   	천용진		최초 생성
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
	<title>title : 사업단위 정보</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3>
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
            <div class="box-body">

                <!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				<!--[APC] END -->
                <table class="table table-bordered tbl_fixed">
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
                            <th scope="row" class="th_bg">사업단위</th>
                            <td class="td_input" colspan="" style="border-right:hidden;">
                                <sbux-input id="SRCH_ORG_CODE" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            
                            <th scope="row" class="th_bg">사업단위명</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="SRCH_ORG_NAME" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>                            
                        </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>사업단위 리스트</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdOrg1200" style="height:600px; width:100%;"></div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>사업단위 정보</span>
                                </li>
                            </ul>
                        </div>                    
                    	<table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:20%">
                                    <col style="width:20%">
                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">사업단위</th>
                                    <td class="td_input">
                                        <sbux-input id="FI_ORG_CODE" class="form-control input-sm inpt_data_reqed"  uitype="text"  style="width:100%"></sbux-input>
									</td>               
									<td class="td_input" style="border-right: hidden;"></td>                     
									<td class="td_input" style="border-right: hidden;"></td>                     
									<td class="td_input" style="border-right: hidden;"></td>                     
                                </tr>    
                                <tr>
                                    <th scope="row" class="th_bg">사업단위명</th>
                                    <td class="td_input" colspan="4">
                                        <sbux-input id="FI_ORG_NAME" class="form-control input-sm inpt_data_reqed"  uitype="text"  style="width:100%"></sbux-input>
									</td>                                    
                                </tr>    
                                <tr>
                                    <th scope="row" class="th_bg">본지점계정</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="SITE_ACC_CODE" class="form-control input-sm" ></sbux-input>
									</td>
									<td colspan="2"  class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="SITE_ACC_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupAcc" ></sbux-button>
		                            </td>
                                </tr>                                   
                                <tr>
                                    <th scope="row" class="th_bg">법인코드</th>
									<td class="td_input" style="border-right: hidden;">
		   								<sbux-input uitype="text" id="COMP_CODE" class="form-control input-sm" ></sbux-input>
									</td>
									<td colspan="2"  class="td_input" style="border-right: hidden;">
										<sbux-input uitype="text" id="COMP_NAME" class="form-control input-sm" ></sbux-input>
									</td>
		                            <td class="td_input">
										<sbux-button class="btn btn-xs btn-outline-dark" text="찾기" uitype="modal" target-id="modal-compopup1" onclick="fn_compopupComp" ></sbux-button>
		                            </td>
                                </tr>    
                                <tr>
                                    <th scope="row" class="th_bg">사용여부</th>
									<td colspan="4"  class="td_input" style="border-right: hidden;">
                                    	<sbux-checkbox uitype="normal" id="USE_YN" class="form-control input-sm check" text="사용여부" true-value="Y" false-value="N"/>
									</td>
                                </tr>    
                    	</table>                	
		                <sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="normal"
							is-scrollable="false"
							title-target-id-array="DETAIL^AUTHORITY"
							title-text-array="대상사업장^전표 전기 권한"
							style="margin-top:2rem;">
						</sbux-tabs>
						<div class="tab-content" >
	                        <div id="DETAIL" style="height:330px;">
								<div class="ad_tbl_top">
		                            <sbux-button id="btnDelDetail"  name="btnDelDetail" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delDetailRow" style="float: right;">
		                            </sbux-button>
		                            <sbux-button id="btnAddDetail"  name="btnAddDetail" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addDetailRow" style="float: right;">
		                            </sbux-button>
		                        </div>     
	                        	<div id="sb-area-grdOrgDetail" style="height:320px; width:100%;"></div>
	                        </div>
	                        <div id="AUTHORITY" style="height:330px;">
								<div class="ad_tbl_top">
		                            <sbux-button id="btnDelAuthority"  name="btnDelAuthority" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delAuthorityRow" style="float: right;">
		                            </sbux-button>
		                            <sbux-button id="btnAddAuthority"  name="btnAddAuthority" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addAuthorityRow" style="float: right;">
		                            </sbux-button>
		                        </div>     
	                        	<div id="sb-area-grdOrgAuthority" style="height:320px; width:100%;"></div>
	                        </div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal 
        	id="modal-compopup1" 
        	name="modal-compopup1" 
        	uitype="middle" 
        	header-title="" 
        	body-html-id="body-com-popup1" 
        	header-is-close-button="true" footer-is-close-button="false" style="width:1000px">
        </sbux-modal>
    </div>
    <div id="body-com-popup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
</body>

<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.id}';
	//-----------------------------------------------------------
	var jsonEmpState = []; // 재직구분
	const fn_initSBSelect = async function() {
		
		let rst = await Promise.all([
			
			//재직구분
		    gfnma_setComSelect([''], jsonEmpState, 'L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		    
			//사업장코드
			gfnma_multiSelectInit({
				target			: ['#SITE_CODE']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_ORG001'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SITE_CODE'
				,colLabel		: 'SITE_NAME'
				,columns		:[
		            {caption: "사업장코드",		ref: 'SITE_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "사업장명", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//사업단위구분
			gfnma_multiSelectInit({
				target			: ['#DEPT_CATEGORY']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_ORG010'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "사업단위구분", 	ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//인건비분류
			gfnma_multiSelectInit({
				target			: ['#LABOR_COST_GROUP']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_HRI007'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "인건비분류코드",	ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "인건비분류", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//근무패턴
			gfnma_multiSelectInit({
				target			: ['#WORK_PATTERN_CODE']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_HRT020'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'up' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "근무패턴",	 	ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//사업단위구분
			gfnma_multiSelectInit({
				target			: ['#ATTR1']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_ORG009'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "사업단위구분",	 	ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_initSBSelect();
    	fn_createGrid();
        fn_createAuthorityGrid();
        fn_createDetailGrid();
    	cfn_search();
    });
    
	// 신규
	function cfn_add() {
		fn_clearSubForm();
		SBUxMethod.attr("FI_ORG_CODE" , "readonly", false);
		detailGrid.rebuild();
		authorityGrid.rebuild();
	}
	
    // 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
	        fn_save("SAVE");
		}
    }
	
	// 마스터 그리드 삭제
	function cfn_del() {
		if(gfn_comConfirm("Q0001", "삭제")){ //{0} 하시겠습니까?
			fn_save("DELETE");
		}
	}
 
	// 조회
	function cfn_search() {
		fn_search();
	}

    //grid 초기화
    var masterGrid; 					// 사업단위 그리드를 담기위한 객체 선언
    var detailGrid; 					// 대상사업장 그리드를 담기위한 객체 선언
    var authorityGrid; 					// 전표 전기 권한 그리드를 담기위한 객체 선언
    var jsonMasterList			= []; 	// 사업단위 그리드의 참조 데이터 주소 선언
    var jsonDetialList			= []; 	// 대상사업장 그리드의 참조 데이터 주소 선언
    var jsonAuthorityList		= []; 	// 전표 전기 권한 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdOrg1200';
	    SBGridProperties.id 				= 'masterGrid';
	    SBGridProperties.jsonref 			= 'jsonMasterList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : ["사업단위"],			ref: 'FI_ORG_CODE', 	type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption : ["사업단위명"],		ref: 'FI_ORG_NAME', 	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["본지점계정"],		ref: 'SITE_ACC_CODE',	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption : ["법인명"],			ref: 'COMP_NAME',		type:'output',  	width:'200px',  	style:'text-align:left'}
        ];
        masterGrid	= _SBGrid.create(SBGridProperties);
        masterGrid.bind('click', 'fn_viewSubTable');
    }
    function fn_createDetailGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdOrgDetail';
	    SBGridProperties.id 				= 'detailGrid';
	    SBGridProperties.jsonref 			= 'jsonDetailList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ['선택'],    ref: 'CHECK_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : {
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
           		style : 'text-align:center'
            },
            {caption: [''],ref: 'btn1',    				type:'button',  	width:'50px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' style='width:40px' onClick='fn_gridPopup1(event, " + nRow + ", " + nCol + ")'>팝업</button>";
            	}	
            },
            {caption : ["사업장코드"],	ref: 'SITE_CODE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["사업장명"],		ref: 'SITE_NAME',		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["사업자번호"],	ref: 'BIZ_REGNO',		type:'output',  	width:'100px',  	style:'text-align:left'}
        ];
        detailGrid	= _SBGrid.create(SBGridProperties);
    }
    
    function fn_createAuthorityGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdOrgAuthority';
	    SBGridProperties.id 				= 'authorityGrid';
	    SBGridProperties.jsonref 			= 'jsonAuthorityList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [''],ref: 'btn2',    				type:'button',  	width:'50px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' style='width:40px' onClick='fn_gridPopup2(event, " + nRow + ", " + nCol + ")'>팝업</button>";
            	}
            },
            {caption : ["사용자ID"],			ref: 'USER_ID', 	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["사용자명"],			ref: 'USER_NAME', 	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ['적용시작일'],     	ref: 'START_DATE',      type:'datepicker' ,   
            	typeinfo : {dateformat :"yyyy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'
            },
            {caption : ['적용종료일'],     	ref: 'END_DATE',      type:'datepicker' ,   
            	typeinfo : {dateformat :"yyyy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'
            }
        ];
        authorityGrid	= _SBGrid.create(SBGridProperties);
    }
    /**
     * 코드목록 조회
     */
    const fn_search = async function() {

    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	
    	let SRCH_ORG_CODE	= gfn_nvl(SBUxMethod.get("SRCH_ORG_CODE"));
    	let SRCH_ORG_NAME 	= gfn_nvl(SBUxMethod.get("SRCH_ORG_NAME"));
    	
    	var paramObj = {
    			   V_P_DEBUG_MODE_YN       : ''
   				  ,V_P_LANG_ID             : ''
   				  ,V_P_COMP_CODE           : gv_ma_selectedApcCd
   				  ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
   				  ,V_P_FI_ORG_CODE         : SRCH_ORG_CODE
   				  ,V_P_FI_ORG_NAME         : SRCH_ORG_NAME
   				  ,V_P_USER_ID_P           : ''
   				  ,V_P_SITE_CODE           : ''
   				  ,V_P_FORM_ID             : p_formId
   				  ,V_P_MENU_ID             : p_menuId
   				  ,V_P_PROC_ID             : ''
   				  ,V_P_USERID              : p_userId
   				  ,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg1200.do", {
			getType				: 'json',
			workType			: 'Q',
			cv_count			: '4',
			params				: gfnma_objectToString(paramObj)
		});
    	const data = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
				
	    	   	/** @type {number} **/
	    		let totalRecordCount = 0;
	    	   	
	    		masterGrid.length = 0;
	    	   	data.cv_1.forEach((item, index) => {
		    		const msg = {
		    				COMP_CODE			: gfn_nvl(item.COMP_CODE),
		    				COMP_NAME			: gfn_nvl(item.COMP_NAME),
		    				FI_ORG_CODE			: gfn_nvl(item.FI_ORG_CODE),
		    				FI_ORG_NAME			: gfn_nvl(item.FI_ORG_NAME),
		    				FI_ORG_NAME_CHN		: gfn_nvl(item.FI_ORG_NAME_CHN),
		    				GROUP_MASTER		: gfn_nvl(item.GROUP_MASTER),
		    				SITE_ACC_CODE		: gfn_nvl(item.SITE_ACC_CODE),
		    				SITE_ACC_NAME		: gfn_nvl(item.SITE_ACC_NAME),
		    				USE_YN				: gfn_nvl(item.USE_YN)
		    		}
		    		jsonMasterList.push(msg);
		    		totalRecordCount ++;
		    	});
	    	   	masterGrid.rebuild();
	    	   	document.querySelector('#listCount').innerText = totalRecordCount;
                if(jsonMasterList.length > 0) {
                	masterGrid.clickRow(1);
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
     * @name fn_clearForm
     * @description 그리드 및 화면 초기화
     * @param 
     */
    const fn_clearForm = async function() {
    	//사업단위 리스트 
    	jsonMasterList = [];
    }
    
    /**
     * @name fn_clearSubForm
     * @description 사업단위 정보, 대상사업장, 전표 전기 권한 그리드 및 화면 초기화
     * @param 
     */
    const fn_clearSubForm = async function() {
    	SBUxMethod.set("FI_ORG_CODE"		, "");
    	SBUxMethod.set("FI_ORG_NAME"		, "");
    	SBUxMethod.set("SITE_ACC_CODE"		, "");
    	SBUxMethod.set("SITE_ACC_NAME"		, "");
    	SBUxMethod.set("COMP_CODE"			, "");
    	SBUxMethod.set("COMP_NAME"			, "");
    	SBUxMethod.set("USE_YN"				, "Y");
    	
    	jsonDetailList 		= [];
    	jsonAuthorityList 	= [];
    }
    
    
    // 그리드 삭제

    //그룹코드 내역 저장
    const fn_save = async function(type) {

    	//필수 데이터 입력하지 않았을 경우 리턴
    	if(gfn_nvl(SBUxMethod.get("FI_ORG_CODE")) == "") {
            gfn_comAlert("W0002", "사업단위");
            return;
    	}
    	if(gfn_nvl(SBUxMethod.get("FI_ORG_NAME")) == "") {
            gfn_comAlert("W0002", "사업단위명");
            return;
    	}
        let updatedDetailData	 = detailGrid.getGridDataAll();
        let updatedAuthorityData = authorityGrid.getGridDataAll();
   	    let strWorkType2 	= '';
   	    let strUserId	 	= '';
   	    let strStartDate 	= '';
   	    let strEndDate 		= '';
   	    let strSiteCode 	= '';
   		let workType		= '';
   	    if(updatedDetailData.lenght != 0){
	    	for(var i = 0; updatedDetailData.length > i; i++){
	        	if(updatedDetailData[i].SITE_CODE == ''){
	           		gfn_comAlert("W0002", i+1 + "번 행의 사업장코드");
	           		return;
	           	}
	           	if(updatedDetailData[i].SITE_NAME == ''){
	           		gfn_comAlert("W0002", i+1 + "번 행의 사업장명");
	           		return;
	           	}
	           	strSiteCode	+= updatedDetailData[i].SITE_CODE 	+ "|";
            }
            if (strSiteCode.length > 0){
            	strSiteCode = strSiteCode.substring(0, strSiteCode.length - 1);
            }
   	    }
   	    if(updatedAuthorityData.lenght != 0){
	    	for(var i = 0; updatedAuthorityData.length > i; i++){
	        	if(updatedAuthorityData[i].USER_ID == ''){
	           		gfn_comAlert("W0002", i+1 + "번 행의 사용자ID");
	           		return;
	           	}
	           	if(updatedAuthorityData[i].USER_NAME == ''){
	           		gfn_comAlert("W0002", i+1 + "번 행의 사용자명");
	           		return;
	           	}
	           	if(updatedAuthorityData[i].START_DATE == ''){
	           		gfn_comAlert("W0002", i+1 + "번 행의 적용시작일");
	           		return;
	           	}
	           	if(updatedAuthorityData[i].END_DATE == ''){
	           		gfn_comAlert("W0002", i+1 + "번 행의 적용종료일");
	           		return;
	           	}
	           	strWorkType2 	+= "N" + "|";
	           	strUserId 		+= updatedAuthorityData[i].USER_ID 		+ "|";
	   	        strStartDate 	+= updatedAuthorityData[i].START_DATE 	+ "|";
	   	        strEndDate 		+= updatedAuthorityData[i].END_DATE 	+ "|";
            }
            if (strUserId.length > 0){
           		strWorkType2 	= strWorkType2.substring(0, strWorkType2.length - 1);
           		strUserId 		= strUserId.substring(0, 	strUserId.length - 1);
                strStartDate 	= strStartDate.substring(0, strStartDate.length - 1);
                strEndDate 		= strEndDate.substring(0, 	strEndDate.length - 1);
                strStartDate 	= strStartDate.replace(/-/gi, '');
                strEndDate 		= strEndDate.replace(/-/gi, '');
            }
   	    }
   	    
   	    if(type == 'DELETE'){
   	    	workType = 'D';
   	    }else{
   	    	workType = $('#FI_ORG_CODE').is('[readonly]') ? 'U' : 'N';
   	    }
  	    var paramObj = {
         	   V_P_DEBUG_MODE_YN       : ""
       		  ,V_P_LANG_ID             : ""
       		  ,V_P_COMP_CODE           : gv_ma_selectedApcCd
       		  ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
       		  ,V_P_FI_ORG_CODE         : gfn_nvl(SBUxMethod.get("FI_ORG_CODE"))
       		  ,V_P_FI_ORG_NAME         : gfn_nvl(SBUxMethod.get("FI_ORG_NAME"))
       		  ,V_P_FI_ORG_NAME_CHN     : ""
       		  ,V_P_SITE_ACC_CODE       : gfn_nvl(SBUxMethod.get("SITE_ACC_CODE"))
       		  ,V_P_COMP_CODE_P         : gfn_nvl(SBUxMethod.get("COMP_CODE"))
       		  ,V_P_USE_YN              : gfn_nvl(SBUxMethod.get("USE_YN").USE_YN)
       		  ,V_P_SITE_CODE           : strSiteCode
       		  ,V_P_WORK_TYPE2          : strWorkType2
       		  ,V_P_USER_ID             : strUserId
       		  ,V_P_START_DATE          : strStartDate
       		  ,V_P_END_DATE            : strEndDate
       		  ,V_P_FORM_ID             : p_formId
       		  ,V_P_MENU_ID             : p_menuId
       		  ,V_P_PROC_ID             : ""
       		  ,V_P_USERID              : p_userId
       		  ,V_P_PC                  : ""
  	    };	
        const postJsonPromise = gfn_postJSON("/co/sys/org/insertOrg1200.do", {
        	getType				: 'json',
        	workType			: workType,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        		gfn_comAlert("I0001");
        		SBUxMethod.attr("FI_ORG_CODE", "readonly", true);
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

    //대상사업장, 전표 전기 권한 그리드 조회
    const fn_viewSubTable = async function() {
    	// 그리드의 빈곳을 눌렀을 때 리턴
    	const nRow = masterGrid.getRow();
	    if (nRow == -1) {
	        return;
	    }
	    const selectRowVal = masterGrid.getRowData(nRow);
    	// 사업단위 정보, 대상사업장, 전표 전기 권한 화면 및 그리드 초기화
    	await fn_clearSubForm();
    	SBUxMethod.attr("FI_ORG_CODE" , "readonly", true);
    	// 코드목록 그리드 초기화
    	var paramObj = {
    			   V_P_DEBUG_MODE_YN       : ''
   				  ,V_P_LANG_ID             : ''
   				  ,V_P_COMP_CODE           : gv_ma_selectedApcCd
   				  ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
   				  ,V_P_FI_ORG_CODE         : gfn_nvl(selectRowVal.FI_ORG_CODE)
   				  ,V_P_FI_ORG_NAME         : gfn_nvl(selectRowVal.FI_ORG_NAME)
   				  ,V_P_USER_ID_P           : ''
   				  ,V_P_SITE_CODE           : ''
   				  ,V_P_FORM_ID             : p_formId
   				  ,V_P_MENU_ID             : p_menuId
   				  ,V_P_PROC_ID             : ''
   				  ,V_P_USERID              : p_userId
   				  ,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg1200.do", {
			getType				: 'json',
			workType			: 'Q1',
			cv_count			: '4',
			params				: gfnma_objectToString(paramObj)
		});
    	const data = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
	        	SBUxMethod.set("FI_ORG_CODE"	, gfn_nvl(selectRowVal.FI_ORG_CODE) );
	        	SBUxMethod.set("FI_ORG_NAME"	, gfn_nvl(selectRowVal.FI_ORG_NAME) );
	        	SBUxMethod.set("SITE_ACC_CODE"	, gfn_nvl(selectRowVal.SITE_ACC_CODE) );
	        	SBUxMethod.set("SITE_ACC_NAME"	, gfn_nvl(selectRowVal.SITE_ACC_NAME) );
	        	SBUxMethod.set("COMP_CODE"		, gfn_nvl(selectRowVal.COMP_CODE) );
	        	SBUxMethod.set("COMP_NAME"		, gfn_nvl(selectRowVal.COMP_NAME) );
	        	SBUxMethod.set("USE_YN"			, gfn_nvl(selectRowVal.USE_YN) );
	    	   	data.cv_2.forEach((item, index) => {
		    		const msg = {
		    				CHECK_YN			: gfn_nvl(item.CHECK_YN),
		    				SITE_CODE			: gfn_nvl(item.SITE_CODE),
		    				SITE_NAME			: gfn_nvl(item.SITE_NAME),
		    				CLIENT_CODE			: gfn_nvl(item.CLIENT_CODE),
		    				FI_ORG_NAME_CHN		: gfn_nvl(item.FI_ORG_NAME_CHN),
		    				COMP_CODE			: gfn_nvl(item.COMP_CODE)
		    		}
		    		jsonDetailList.push(msg);
		    	});
	    	   	data.cv_3.forEach((item, index) => {
		    		const msg = {
		    				FI_ORG_CODE		: gfn_nvl(item.FI_ORG_CODE),
		    				USER_ID			: gfn_nvl(item.USER_ID),
		    				USER_NAME		: gfn_nvl(item.USER_NAME),
		    				START_DATE		: gfn_nvl(item.START_DATE),
		    				END_DATE		: gfn_nvl(item.END_DATE),
		    				CLIENT_CODE		: gfn_nvl(item.CLIENT_CODE),
		    				COMP_CODE		: gfn_nvl(item.COMP_CODE)
		    		}
		    		jsonAuthorityList.push(msg);
		    	});
	    	   	detailGrid.rebuild();
	    	   	authorityGrid.rebuild();
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
	 * 공통팝업
	 * 본지점계정 공통팝업
	 */
    var fn_compopupAcc = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get('SITE_ACC_CODE'));
        var searchName 		= gfn_nvl(SBUxMethod.get("SITE_ACC_NAME"));
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_";
        var strWhereClause 	= "AND A.ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND A.ACCOUNT_NAME  LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '본지점계정 조회');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
  			,searchCaptions			: ["계정코드", 	"계정명"]
  			,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
  			,searchInputValues		: [searchCode, 	searchName]
    		,height					: '400px'
  			,tableHeader			: ["계정코드", 		 "계정명", 			"계정(한국어)"]
  			,tableColumnNames		: ["ACCOUNT_CODE", 	 "ACCOUNT_NAME", 	"ACCOUNT_NAME_CHN"]
  			,tableColumnWidths		: ["80px", 			 "80px", 			"80px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('SITE_ACC_CODE',	data.ACCOUNT_CODE);
				SBUxMethod.set('SITE_ACC_NAME', data.ACCOUNT_NAME);
			},
    	});
  	}
    
    /**
     * 공통팝업
     * 법인코드
     */
    var fn_compopupComp = function() {
    	
        var searchCode 		= gfn_nvl(SBUxMethod.get('COMP_CODE'));
        var searchName 		= gfn_nvl(SBUxMethod.get("COMP_NAME"));
        var replaceText0 	= "_COMP_CODE_";
        var replaceText1 	= "_COMP_NAME_";
        var strWhereClause 	= "AND COMP_CODE LIKE '%" + replaceText0 + "%' AND COMP_NAME  LIKE '%" + replaceText1 + "%' ";

    	SBUxMethod.attr('modal-compopup1', 'header-title', '법인코드 조회');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG000'
    		,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["법인코드", 		"법인명"]
   			,searchInputFields		: ["COMP_CODE", 	"COMP_NAME"]
   			,searchInputValues		: [searchCode, 		searchName]
			,searchInputTypes		: ["input", 		"input"]		//input, datepicker가 있는 경우
    		,height					: '400px'
   			,tableHeader			: ["법인코드",		"법인명"]
   			,tableColumnNames		: ["COMP_CODE",		"COMP_NAME"]
   			,tableColumnWidths		: ["100px", 		"150px"]
			,itemSelectEvent		: function (data){
				SBUxMethod.set('COMP_CODE', 		data.COMP_CODE);
				SBUxMethod.set('COMP_NAME',			data.COMP_NAME);
			},
    	});
  	}
    

    
     // 대상사업자 행 추가
     const fn_addDetailRow = function () {
         let rowVal = detailGrid.getRow();
     	//데이터가 없고 행선택이 없을경우.
          if (rowVal == -1){ 
        	  detailGrid.addRow(true);
          }else{
        	  detailGrid.insertRow(rowVal);
          }
     	
     }
     // 대상사업자 행 삭제
     const fn_delDetailRow = async function () {
         let rowVal = detailGrid.getRow();

         if (rowVal == -1) {
             gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
             return;
         } else {
        	 detailGrid.deleteRow(rowVal);
         }
     }
     // 전표 전기 권한 행 추가
     const fn_addAuthorityRow = function () {
     	 const rowVal	= authorityGrid.getGridDataAll();
		 let startDate	= gfn_dateToYmd(new Date(), '-');
			 authorityGrid.addRows([{
				 USER_ID				: '', 
				 USER_name				: '', 
				 START_DATE				: startDate, 
				 END_DATE				: '',
				 DESCR					: ''
			 }]);	
     }
     // 전표 전기 권한 행 삭제
     const fn_delAuthorityRow = async function () {
         let rowVal = authorityGrid.getRow();
         if (rowVal == -1) {
             gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
             return;
         } else {
        	 authorityGrid.deleteRow(rowVal);
         }
     }
    /**
     * 그리드내 팝업(사업장코드, 사업장명) 조회
     */
 	function fn_gridPopup1(event, row, col) {
 		event.stopPropagation();
        let cellData1 = detailGrid.getCellData(row, 3)
        let cellData2 = detailGrid.getCellData(row, 4)
     	fn_comGridSitePopup(row, col, cellData1, cellData2);
 	}
    
    var fn_comGridSitePopup = function(row, col, cellData1, cellData2) {
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '대상사업장 정보');
		SBUxMethod.openModal('modal-compopup1');
    	
        var replaceText0 	= "_SITE_CODE_";
        var replaceText1 	= "_SITE_NAME_"; 
        var strWhereClause 	= "AND SITE_CODE LIKE '%" + replaceText0 + "%' AND SITE_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FI0010'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["사업장코드", 		"사업장명"]
   			,searchInputFields		: ["SITE_CODE", 	"SITE_NAME"]
   			,searchInputValues		: [cellData1, 	cellData2]
			,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["사업장코드",	"사업장명"]
   			,tableColumnNames		: ["SITE_CODE", "SITE_NAME"]
   			,tableColumnWidths		: ["100px", 	"100px"]
			,itemSelectEvent		: function (data){
				//그리드내 원하는 위치에 값 셋팅하기
				detailGrid.setCellData(row, 3, data['SITE_CODE'], true, true);
				detailGrid.setCellData(row, 4, data['SITE_NAME'], true, true);
			}
    	});
    }
    /**
     * 그리드내 팝업(사용자ID, 사용자명) 조회
     */
 	function fn_gridPopup2(event, row, col) {
 		event.stopPropagation();
        let cellData1 = authorityGrid.getCellData(row, 2)
        let cellData2 = authorityGrid.getCellData(row, 3)
     	fn_comGridEmpPopup(row, col, cellData1, cellData2);
 	}
    var fn_comGridEmpPopup = function(row, col, cellData1, cellData2) {
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사용자 정보');
		SBUxMethod.openModal('modal-compopup1');
    	
        var replaceText0 	= "_USER_ID_";
        var replaceText1 	= "_USER_NAME_"; 
        var strWhereClause 	= "AND USER_ID LIKE '%" + replaceText0 + "%' AND USER_NAME LIKE '%" + replaceText1 + "%' AND D.COMP_CODE LIKE '" + gv_ma_selectedApcCd + "\'";
    	
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_COM005'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["사용자ID", 	"사용자명"]
   			,searchInputFields		: ["USER_ID", 	"USER_NAME"]
   			,searchInputValues		: [cellData1, 	cellData2]
			,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["사용자ID",	"사용자명"]
   			,tableColumnNames		: ["USER_ID", 	"USER_NAME"]
   			,tableColumnWidths		: ["100px", 	"100px"]
			,itemSelectEvent		: function (data){
				//그리드내 원하는 위치에 값 셋팅하기
				authorityGrid.setCellData(row, 2, data['USER_ID'], true, true);
				authorityGrid.setCellData(row, 3, data['USER_NAME'], true, true);
			}
    	});
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>