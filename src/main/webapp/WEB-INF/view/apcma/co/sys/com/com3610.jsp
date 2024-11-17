<%
/**
 * @Class Name 		: Com3610.jsp
 * @Description 	: 관리항목
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.06.03
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.06.03   	천용진		최초 생성
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
	<title>title : 관리항목</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
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
	                            <th scope="row" class="th_bg_search">관리항목코드</th>
	                            <td colspan="3" class="td_input" colspan="" style="border-right:hidden;">
	                                <sbux-input id="SRCH_ACC_ITEM_CODE" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                            <th scope="row" class="th_bg_search">관리항목명</th>
	                            <td colspan="3"  class="td_input" style="border-right: hidden;">
	                                <sbux-input id="SRCH_ACC_ITEM_NAME" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                        </tr>
	                    </tbody>
	                </table>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>◎ 코드목록</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdCom3610" style="height:100vh; width:100%;"></div>
                        </div>
                    </div>

                    <div class="col-sm-9">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>기초정보</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:15%">
                                    <col style="width:30%">
                                    <col style="width:5%">
                                    <col style="width:15%">
                                    <col style="width:35%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">기재항목코드</th>
                                    <td class="td_input">
                                        <sbux-input id="ACC_ITEM_CODE" name="ACC_ITEM_CODE" class="form-control input-sm inpt_data_reqed"  uitype="text"  style="width:100%"readonly>
                                        </sbux-input>
                                    </td>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">기재항목명</th>
                                    <td colspan="4" class="td_input" colspan="3">
                                        <sbux-input id="ACC_ITEM_NAME" name="ACC_ITEM_NAME"  class="form-control input-sm inpt_data_reqed" uitype="text"  style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">데이터유형</th>
		                            <td colspan="" class="td_input" style="border-right:hidden;">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button" 
										    	id="DATA_TYPE" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=DATA_TYPE style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>                              
									</td>
									<td></td>
                                    <th scope="row" class="th_bg">컨트롤유형</th>
		                            <td colspan="" class="td_input" style="border-right:hidden;">
										<div class="dropdown">
										    <button 
											    style="width:160px;text-align:left" 
											    class="btn btn-sm btn-light dropdown-toggle" 
											    type="button" id="CONTROL_TYPE"
											    data-toggle="dropdown" 
											    aria-haspopup="true" 
											    aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby="CONTROL_TYPE" style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>                          
									</td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">데이터길이</th>
                                    <td class="td_input">
                                        <sbux-input id="DATA_LENGTH" name="DATA_LENGTH"  class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td></td>
                                    <th scope="row" class="th_bg">소수자리수</th>
                                    <td class="td_input">
                                        <sbux-input id="DECIMAL_POINT" name="DECIMAL_POINT" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">생성구분</th>
                                    <td class="td_input">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button"
										    	id="CREATE_TYPE" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=CREATE_TYPE style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
									</td>
									<td></td>
                                    <th id="popupTh" name="popupTh" scope="row" class="th_bg">팝업데이터유형</th>
                                    <td class="td_input" id="popupTd" name="popupTd">
										<div class="dropdown">
										    <button 
										    	style="width:160px;text-align:left" 
										    	class="btn btn-sm btn-light dropdown-toggle" 
										    	type="button" 
										    	id="POPUP_DATA" 
										    	data-toggle="dropdown" 
										    	aria-haspopup="true" 
										    	aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby=POPUP_DATA style="width:250px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>   
									</td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li><span>사용자정의 관리항목 데이터</span></li>
                            </ul>
                            <div class="ad_tbl_toplist">
	                            <sbux-button
	                                    id="btnDel"
	                                    name="btnDel"
	                                    uitype="normal"
	                                    text="행삭제"
	                                    class="btn btn-sm btn-outline-danger"
	                                    onclick="fn_delRow"
	                                    style="float: right;"
	                            >
	                            </sbux-button>
	                            <sbux-button
	                                    id="btnAdd"
	                                    name="btnAdd"
	                                    uitype="normal"
	                                    text="행추가"
	                                    class="btn btn-sm btn-outline-danger"
	                                    onclick="fn_addRow"
	                                    style="float: right;"
	                            ></sbux-button>
                            </div>
                        </div>
                        <div class="ad_tbl_top2">
	                        <div>
	                            <div id="sb-area-subGrdCom3610" style="height:73vh; width:100%;"></div>
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
        	id="com-popup1" 
        	name="com-popup1" 
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
	var editType = 'N';
	
	/**
	 * 초기화
	 */
	function cfn_init() {
		editType = 'N';
		gfnma_uxDataClear('#srchArea1');
	}
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			
			//데이터 유형
			gfnma_multiSelectInit({
				target			: ['#DATA_TYPE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM024'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",			ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "데이터유형", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//컨트롤 유형
			gfnma_multiSelectInit({
				target			: ['#CONTROL_TYPE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM025'
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
		            {caption: "컨트롤유형", 	ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//생성구분
			gfnma_multiSelectInit({
				target			: ['#CREATE_TYPE']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM026'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",			ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "데이터생성구분", 	ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
			//팝업데이터
			gfnma_multiSelectInit({
				target			: ['#POPUP_DATA']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM027'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SUB_CODE'
				,colLabel		: 'CODE_NAME'
				,columns		:[
		            {caption: "코드",			ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
		            {caption: "팝업데이터유형", 	ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			}),
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_initSBSelect();
    	cfn_search();
    });
    
	// 신규
	function cfn_add() {
		fn_clearForm();
		fn_createSubGrid();
		editType = 'N';
		$("#ACC_ITEM_CODE" ).prop('readonly', false);
	}
	
    // 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
	        fn_save();
		}
    }
	
	// 마스터 그리드 삭제
	function cfn_del() {
		fn_delete();
	}
 
	// 조회
	function cfn_search() {
		fn_clearForm();
		fn_createGrid();
		fn_createSubGrid();
		fn_search();
	}

    //grid 초기화
    var MNGARTCLGrid; 					// 그리드를 담기위한 객체 선언
    var jsonMNGARTCLList		= []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdCom3610';
	    SBGridProperties.id 				= 'MNGARTCLGrid';
	    SBGridProperties.jsonref 			= 'jsonMNGARTCLList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : ["관리항목코드"],		ref: 'ACC_ITEM_CODE', 	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption : ["관리항목명"],		ref: 'ACC_ITEM_NAME',   type:'output',  	width:'150px',  	style:'text-align:left'}
        ];
        MNGARTCLGrid	= _SBGrid.create(SBGridProperties);
        MNGARTCLGrid.bind('click', 'fn_view');
    }
    
    var MNGARTCLSubGrid; 				// 세부코드 정보 그리드를 담기위한 객체 선언
    var jsonMNGARTCLSubList 	= []; 	// 세부코드 정보 그리드의 참조 데이터 주소 선언
    
    function fn_createSubGrid() {
    	
        // 세부코드 정보 초기세팅
        var SBSubGridProperties 				= {};
        SBSubGridProperties.parentid 			= 'sb-area-subGrdCom3610';
        SBSubGridProperties.id 					= 'MNGARTCLSubGrid';
        SBSubGridProperties.jsonref 			= 'jsonMNGARTCLSubList';
        SBSubGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBSubGridProperties.selectmode 			= 'byrow';
        SBSubGridProperties.explorerbar 		= 'sortmove';
        SBSubGridProperties.rowheader 			= 'seq';
        SBSubGridProperties.rowheadercaption 	= {seq: 'No'};
        SBSubGridProperties.rowheaderwidth 		= {seq: '60'};
        SBSubGridProperties.extendlastcol 		= 'scroll';
        SBSubGridProperties.columns = [
            {caption: ["데이터 코드"],	ref: 'DATA_CODE', 		type:'input',  		width:'20%',  	style:'text-align:left'},
            {caption: ["데이터명"],		ref: 'DATA_NAME',    	type:'input',  		width:'70%',  	style:'text-align:left'},
            {caption: ['사용'],     		ref : 'USE_YN',		type :'checkbox',		width:'10%', 
            	typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'
            }
        ];
        MNGARTCLSubGrid	= _SBGrid.create(SBSubGridProperties);
    }


    /**
     * 코드목록 조회
     */
    const fn_search = async function() {

    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	
    	let SRCH_ACC_ITEM_CODE	= gfn_nvl(SBUxMethod.get("SRCH_ACC_ITEM_CODE"));
    	let SRCH_ACC_ITEM_NAME 	= gfn_nvl(SBUxMethod.get("SRCH_ACC_ITEM_NAME"));
    	
    	var paramObj = {
	    	   V_P_DEBUG_MODE_YN    : ''
	    	   ,V_P_LANG_ID         : ''
	    	   ,V_P_COMP_CODE       : gv_ma_selectedCorpCd
	    	   ,V_P_CLIENT_CODE     : gv_ma_selectedClntCd
	    	   ,V_P_ACC_ITEM_CODE   : SRCH_ACC_ITEM_CODE
	    	   ,V_P_ACC_ITEM_NAME   : SRCH_ACC_ITEM_NAME
	    	   ,V_P_FORM_ID         : p_formId
	    	   ,V_P_MENU_ID         : p_menuId
	    	   ,V_P_PROC_ID         : ''
	    	   ,V_P_USERID          : p_userId
	    	   ,V_P_PC              : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3610List.do", {
			getType				: 'json',
			workType			: 'Q',
			cv_count			: '2',
			params				: gfnma_objectToString(paramObj)
		});
		
    	const data = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
	
	    	   	/** @type {number} **/
	    		let totalRecordCount = 0;
	
	    		MNGARTCLGrid.length = 0;
	    	   	data.cv_1.forEach((item, index) => {
		    		const msg = {
		    				ACC_ITEM_CODE		: item.ACC_ITEM_CODE,
		    				ACC_ITEM_NAME		: item.ACC_ITEM_NAME,
		    				DATA_TYPE			: item.DATA_TYPE,
		    				CONTROL_TYPE		: item.CONTROL_TYPE,
		    				DATA_LENGTH			: item.DATA_LENGTH,
		    				DECIMAL_POINT		: item.DECIMAL_POINT,
		    				CREATE_TYPE			: item.CREATE_TYPE,
		    				POPUP_DATA			: item.POPUP_DATA
		    		}
		    		jsonMNGARTCLList.push(msg);
		    		totalRecordCount ++;
		    	});
	
	    	   	MNGARTCLGrid.rebuild();
	    	   	document.querySelector('#listCount').innerText = totalRecordCount;
	
                if(jsonMNGARTCLList.length > 0) {
                	MNGARTCLGrid.clickRow(1);
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
    * 서브 그리드 조회
     */
    const fn_setMNGARTCLSubGrid = async function(ACC_ITEM_CODE) {

    	// form clear
    	fn_clearForm();

		MNGARTCLSubGrid.clearStatus();
    	
    	var paramObj = {
	    	   V_P_DEBUG_MODE_YN    : ''
	    	   ,V_P_LANG_ID         : ''
	    	   ,V_P_COMP_CODE       : gv_ma_selectedCorpCd
	    	   ,V_P_CLIENT_CODE     : gv_ma_selectedClntCd
	    	   ,V_P_ACC_ITEM_CODE   : ACC_ITEM_CODE
	    	   ,V_P_ACC_ITEM_NAME   : ''
	    	   ,V_P_FORM_ID         : p_formId
	    	   ,V_P_MENU_ID         : p_menuId
	    	   ,V_P_PROC_ID         : ''
	    	   ,V_P_USERID          : p_userId
	    	   ,V_P_PC              : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3610List.do", {
			getType				: 'json',
			workType			: 'Q1',
			cv_count			: '2',
			params				: gfnma_objectToString(paramObj)
		});
		
        const subData = await postJsonPromise;
        
        try {
  			if (_.isEqual("S", subData.resultStatus)) {
  		      	subData.cv_2.forEach((item, index) => {
  					const msg = {
  							DATA_CODE		: item.DATA_CODE,
  							DATA_NAME		: item.DATA_NAME,
  							USE_YN			: item.USE_YN
  					}
  					jsonMNGARTCLSubList.push(msg);
  				});
  				MNGARTCLSubGrid.rebuild();
  	      		
        	} else {
          		alert(subData.resultMessage);
        	}

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
	
    //세부코드 정보
    const fn_clearForm = function() {
		
    	//관리항목
    	jsonMNGARTCLList = [];
    	//사용자정의 관리항목 데이터
    	jsonMNGARTCLSubList = [];
    	//기초정보
    	SBUxMethod.set("ACC_ITEM_CODE", "");
    	SBUxMethod.set("ACC_ITEM_NAME", "");
    	SBUxMethod.set("DATA_LENGTH", "");
    	SBUxMethod.set("DECIMAL_POINT", "");
    	
    	gfnma_multiSelectSet('#DATA_TYPE',   '', '', '');
    	gfnma_multiSelectSet('#CONTROL_TYPE','', '', '');
    	gfnma_multiSelectSet('#CREATE_TYPE', '', '', '');
        gfnma_multiSelectSet('#POPUP_DATA',  '', '', '');

    }
    
    // 그리드 삭제
    const fn_delete = async function(){
    	let ACC_ITEM_CODE 	= gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE"));
    	let ACC_ITEM_NAME	= gfn_nvl(SBUxMethod.get("ACC_ITEM_NAME"));
    	let DATA_LENGTH		= gfn_nvl(SBUxMethod.get("DATA_LENGTH"));
    	let DECIMAL_POINT	= gfn_nvl(SBUxMethod.get("DECIMAL_POINT"));
    	let DATA_TYPE 		= gfnma_multiSelectGet("#DATA_TYPE");
    	let CONTROL_TYPE	= gfnma_multiSelectGet("#CONTROL_TYPE");
    	let CREATE_TYPE		= gfnma_multiSelectGet("#CREATE_TYPE");
    	let POPUP_DATA 		= gfnma_multiSelectGet("#POPUP_DATA");

  	    var paramObj = {
  	    		V_P_DEBUG_MODE_YN     : ''
 	    	    ,V_P_LANG_ID          : ''
	    	    ,V_P_COMP_CODE        : gv_ma_selectedCorpCd
  	    		,V_P_CLIENT_CODE      : gv_ma_selectedClntCd
  	    		,V_P_ACC_ITEM_CODE    : ACC_ITEM_CODE
  	    		,V_P_ACC_ITEM_NAME    : ACC_ITEM_NAME    
  	    		,V_P_DATA_TYPE        : DATA_TYPE
  	    		,V_P_CONTROL_TYPE     : CONTROL_TYPE
  	    		,V_P_DATA_LENGTH      : DATA_LENGTH
  	    		,V_P_DECIMAL_POINT    : DECIMAL_POINT
  	    		,V_P_CREATE_TYPE      : CREATE_TYPE
  	    		,V_P_POPUP_DATA       : POPUP_DATA
  	    		,V_P_FORM_ID          : p_formId
  	    		,V_P_MENU_ID          : p_menuId
  	    		,V_P_PROC_ID          : ''
  	    		,V_P_USERID           : p_userId
  	    		,V_P_PC               : ''
	    };		
        const postJsonPromise = gfn_postJSON("/co/sys/com/deleteCom3610.do", {
        	getType				: 'json',
        	workType			: 'D',
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

    //그룹코드 내역 저장
    const fn_save = async function() {

    	let ACC_ITEM_CODE 	= gfn_nvl(SBUxMethod.get("ACC_ITEM_CODE"));
    	let ACC_ITEM_NAME	= gfn_nvl(SBUxMethod.get("ACC_ITEM_NAME"));
    	let DATA_LENGTH		= gfn_nvl(SBUxMethod.get("DATA_LENGTH"));
    	let DECIMAL_POINT	= gfn_nvl(SBUxMethod.get("DECIMAL_POINT"));
    	let DATA_TYPE 		= gfnma_multiSelectGet("#DATA_TYPE");
    	let CONTROL_TYPE	= gfnma_multiSelectGet("#CONTROL_TYPE");
    	let CREATE_TYPE		= gfnma_multiSelectGet("#CREATE_TYPE");
    	let POPUP_DATA 		= gfnma_multiSelectGet("#POPUP_DATA");
    	if(ACC_ITEM_CODE == "") {
            gfn_comAlert("W0002", "기재항목코드");
            return;
    	}
    	if(ACC_ITEM_NAME == "") {
            gfn_comAlert("W0002", "기재항목명");
            return;
    	}
    	if(DATA_TYPE == "") {
            gfn_comAlert("W0002", "데이터유형");
            return;
    	}
    	if(CONTROL_TYPE == "") {
            gfn_comAlert("W0002", "컨트롤유형");
            return;
    	}
    	if(DATA_LENGTH == "") {
            gfn_comAlert("W0002", "데이터길이");
            return;
    	}
    	if(DECIMAL_POINT == "") {
            gfn_comAlert("W0002", "소수자리수");
            return;
    	}
    	if(CREATE_TYPE == "") {
            gfn_comAlert("W0002", "생성구분");
            return;
    	}
    	
    	if(editType == "N"){
    		var valUrl = "/co/sys/com/insertCom3610.do";
    	}else{
    		var valUrl = "/co/sys/com/updateCom3610.do";
    	}
    	
  	    var paramObj = {
  	    		V_P_DEBUG_MODE_YN     : ''
 	    	    ,V_P_LANG_ID          : ''
	    	    ,V_P_COMP_CODE        : gv_ma_selectedCorpCd
  	    		,V_P_CLIENT_CODE      : gv_ma_selectedClntCd
  	    		,V_P_ACC_ITEM_CODE    : ACC_ITEM_CODE
  	    		,V_P_ACC_ITEM_NAME    : ACC_ITEM_NAME    
  	    		,V_P_DATA_TYPE        : DATA_TYPE
  	    		,V_P_CONTROL_TYPE     : CONTROL_TYPE
  	    		,V_P_DATA_LENGTH      : DATA_LENGTH
  	    		,V_P_DECIMAL_POINT    : DECIMAL_POINT
  	    		,V_P_CREATE_TYPE      : CREATE_TYPE
  	    		,V_P_POPUP_DATA       : POPUP_DATA
  	    		,V_P_FORM_ID          : p_formId
  	    		,V_P_MENU_ID          : p_menuId
  	    		,V_P_PROC_ID          : ''
  	    		,V_P_USERID           : p_userId
  	    		,V_P_PC               : ''
	    };		
        const postJsonPromise = gfn_postJSON(valUrl, {
        	getType				: 'json',
        	workType			: editType,
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        		
        		//세부코드 정보  저장
        		let rowLength = MNGARTCLSubGrid.getUpdateData(true, 'all').length;
        		let rowVal 	  = MNGARTCLSubGrid.getUpdateData(true, 'all');
        		if(rowLength >= 1 ){
        	    		for(var i = 0; rowLength > i; i ++){
        	    			var workType = rowVal[i].status == 'i' ? 'N' : (rowVal[i].status == 'u' ? 'U' : 'D');
        		            		
        	    			var paramObj = {
       	    					   V_P_DEBUG_MODE_YN     : ''
   	    						   ,V_P_LANG_ID          : ''
   	    						   ,V_P_COMP_CODE        : gv_ma_selectedCorpCd
   	    						   ,V_P_CLIENT_CODE      : gv_ma_selectedClntCd
   	    						   ,V_P_ACC_ITEM_CODE    : ACC_ITEM_CODE
   	    						   ,V_P_DATA_CODE        : rowVal[i].data.DATA_CODE
   	    						   ,V_P_DATA_NAME        : rowVal[i].data.DATA_NAME
   	    						   ,V_P_USE_YN           : rowVal[i].data.USE_YN
   	    						   ,V_P_FORM_ID          : p_formId
   	    						   ,V_P_MENU_ID          : p_menuId
   	    						   ,V_P_PROC_ID          : ''
   	    						   ,V_P_USERID           : p_userId
   	    						   ,V_P_PC               : ''
        	    		    };		
        	    	        const postJsonPromise = gfn_postJSON("/co/sys/com/updateCom3610_S1.do", {
        	    	        	getType				: 'json',
        	    	        	workType			: workType,
        	    	        	cv_count			: '0',
        	    	        	params				: gfnma_objectToString(paramObj)
        	    			});    	 
        	    	        const subdata = await postJsonPromise;
        	    	        try {
        	    	        	if (_.isEqual("S", subdata.resultStatus)) {
        	    	        		if(subdata.resultMessage){
        	    		          		alert(subdata.resultMessage);
        	    	        		}
        	    	        	} else {
        	    	          		alert(subdata.resultMessage);
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

     // 행 추가
     const fn_addRow = function () {
         let rowVal = MNGARTCLSubGrid.getRow();
         let colVal = MNGARTCLSubGrid.getCol();
         //데이터가 없고 행선택이 없을경우.
         if (rowVal == -1){
             MNGARTCLSubGrid.addRow(true);
         }else{
             MNGARTCLSubGrid.insertRow(rowVal);
         }
     }

     // 행 삭제
     const fn_delRow = async function () {
         let rowVal = MNGARTCLSubGrid.getRow();

         if (rowVal == -1) {
             gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
             return;
         } else {
             MNGARTCLSubGrid.deleteRow(rowVal);
         }

     }
    //서브 그리드
    const fn_view = async function () {
		editType = 'U';
    	
    	var nCol = MNGARTCLGrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = MNGARTCLGrid.getRow();
		if (nRow < 1) {
            return;
		}
		
		let rowData = MNGARTCLGrid.getRowData(nRow);
		//사용자정의 관리항목 데이터
		await fn_setMNGARTCLSubGrid(rowData.ACC_ITEM_CODE);
        //기초정보
   		SBUxMethod.set("ACC_ITEM_CODE", 	rowData.ACC_ITEM_CODE);
   		SBUxMethod.set("ACC_ITEM_NAME", 	rowData.ACC_ITEM_NAME);
   		SBUxMethod.set("DATA_LENGTH", 		String(rowData.DATA_LENGTH));
   		SBUxMethod.set("DECIMAL_POINT", 	String(rowData.DECIMAL_POINT));
        gfnma_multiSelectSet('#DATA_TYPE', 		'SUB_CODE', 'CODE_NAME', rowData.DATA_TYPE);
        gfnma_multiSelectSet('#CONTROL_TYPE', 	'SUB_CODE', 'CODE_NAME', rowData.CONTROL_TYPE);
        gfnma_multiSelectSet('#CREATE_TYPE', 	'SUB_CODE', 'CODE_NAME', rowData.CREATE_TYPE);
        if(gfn_nvl(rowData.POPUP_DATA) != '') {
        	$('#popupTh').show();
        	$('#popupTd').show();
	        gfnma_multiSelectSet('#POPUP_DATA', 	'SUB_CODE', 'CODE_NAME', rowData.POPUP_DATA);
        }else{
        	$('#popupTh').hide();
        	$('#popupTd').hide();
        }
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>