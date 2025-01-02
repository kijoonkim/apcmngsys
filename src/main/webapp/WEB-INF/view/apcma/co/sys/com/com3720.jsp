<%
/**
 * @Class Name 		: com3720.jsp
 * @Description 	: 프로젝트코드 정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.06.18
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.06.18   	천용진		최초 생성
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
	<title>title : 프로젝트코드 정보</title>
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
	                            <th scope="row" class="th_bg_search">그룹코드</th>
	                            <td class="td_input" colspan="3" style="border-right:hidden;">
	                                <sbux-input id="SRCH_GROUP_CODE" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                            <th scope="row" class="th_bg_search">코드그룹명</th>
	                            <td class="td_input" colspan="3" style="border-right: hidden;">
	                                <sbux-input id="SRCH_GROUP_NAME" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>    
                <div class="row">
                    <div class="col-sm-2">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>◎ 프로젝트코드 리스트</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdcom3720" style="height:75vh; width:100%;"></div>
                        </div>
                    </div>

                    <div class="col-sm-10">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>그룹코드 내역</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:10%">
                                    <col style="width:16%">
                                    <col style="width:18%">
                                    <col style="width:10%">
                                    <col style="width:18%">
                                    <col style="width:10%">
                                    <col style="width:18%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">그룹코드</th>
                                    <td class="td_input" colspan="2">
                                        <sbux-input id="GROUP_CODE" class="form-control input-sm inpt_data_reqed"  uitype="text"  style="width:100%" group-id="panAppoint" required></sbux-input>
                                    </td>
                                    <th scope="row"class="th_bg">여유필드캡션1</th>
                                    <td class="td_input" >
                                        <sbux-input id="FIELD_CAPTION1" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row"class="th_bg">여유필드캡션6</th>
                                    <td class="td_input" >
                                        <sbux-input id="FIELD_CAPTION6" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">코드그룹명</th>
                                    <td class="td_input" colspan="2">
                                        <sbux-input id="GROUP_NAME" class="form-control input-sm inpt_data_reqed" uitype="text"  style="width:100%" group-id="panAppoint" required></sbux-input>
                                    </td>
                                    <th scope="row"class="th_bg">여유필드캡션2</th>
                                    <td class="td_input" >
                                        <sbux-input id="FIELD_CAPTION2" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row"class="th_bg">여유필드캡션7</th>
                                    <td class="td_input" >
                                        <sbux-input id="FIELD_CAPTION7" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">코드길이</th>
                                    <td class="td_input" colspan="2">
                                        <sbux-input id="CODE_LENGTH" class="form-control input-sm inpt_data_reqed" uitype="text"  style="width:100%" group-id="panAppoint" required></sbux-input>
                                    </td>
                                    <th scope="row"class="th_bg">여유필드캡션3</th>
                                    <td class="td_input" >
                                        <sbux-input id="FIELD_CAPTION3" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row"class="th_bg">여유필드캡션8</th>
                                    <td class="td_input" >
                                        <sbux-input id="FIELD_CAPTION8" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>   
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">비즈컴포넌트</th>
                                    <td class="td_input" colspan="2">
                                        <sbux-input id="BIZCOMPONENT_ID"  class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">여유필드캡션4</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION4" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">여유필드캡션9</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION9" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">코드필드명</th>
                                    <td class="td_input" colspan="2">
                                        <sbux-input id="SEGMENT_FIELD_NAME"  class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">여유필드캡션5</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION5" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">여유필드캡션10</th>
                                    <td class="td_input">
                                        <sbux-input id="FIELD_CAPTION10" class="form-control input-sm field-caption" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">WHERE 조건</th>
                                    <td class="td_input" colspan="6" >
                                        <sbux-input id="SQL_WHERE_CODE" class="form-control input-sm" uitype="text" style="width:100%;  height:50px;"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">적요</th>
                                    <td class="td_input" colspan="6" >
                                        <sbux-input id="DESCR" class="form-control input-sm" uitype="text" style="width:100%;  height:50px;"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">사용여부</th>
                                    <td class="td_input" colspan="2">
                            			<sbux-checkbox 
                            				id="USE_YN"
                            				uitype="normal"
                            				text="사용"
                            				true-value="Y"
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>
                                    <th scope="row" class="th_bg">채번사용</th>
                                    <td class="td_input" style="border-right:hidden;" >
                            			<sbux-checkbox 
                            				id="NUMBER_YN"
                            				uitype="normal"
                            				text="사용"
                            				true-value="Y"
                            				false-value="N" >
                            			</sbux-checkbox>
									</td>							
											
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li><span>세부코드 정보</span></li>
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
	                            <sbux-button
	                                    id="btnCopyClear"
	                                    name="btnCopyClear"
	                                    uitype="normal"
	                                    text="복사모드해제" <%--그리드 복사 불가. 붙여넣기 불가.--%>
	                                    class="btn btn-sm btn-outline-danger"
	                                    onclick="fn_gridCopyClear"
	                                    style="float: right; display: block"
	                            ></sbux-button>
	                            <sbux-button
	                                    id="btnCopyLine"
	                                    name="btnCopyLine"
	                                    uitype="normal"
	                                    text="행복사모드" <%--행단위로 복사--%>
	                                    class="btn btn-sm btn-outline-danger"
	                                    onclick="fn_gridCopyLine"
	                                    style="float: right; display: none;"
	                            ></sbux-button>
	                            <sbux-button
	                                    id="btnCopyCell"
	                                    name="btnCopyCell"
	                                    uitype="normal"
	                                    text="셀복사모드" <%--셀단위로 복사--%>
	                                    class="btn btn-sm btn-outline-danger"
	                                    onclick="fn_gridCopyCell"
	                                    style="float: right; display: none;"
	                            ></sbux-button>
                            </div>
                        </div>
                        <div class="ad_tbl_top2">
	                        <div>
	                            <div id="sb-area-subGrdcom3720" style="height:30vh; width:100%;"></div>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="com-popup1" name="com-popup1" uitype="middle" header-title="" body-html-id="body-com-popup1" header-is-close-button="true" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-com-popup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.id}';
	//-----------------------------------------------------------
	var editType 		= 'N';
	var mode 			= 'byrows';
	var copy			= false;
	var jsonGroupCode	= [];	// 유형분류
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_initSBSelect();
    	fn_createGrid();
    	fn_createSubGrid();
    	cfn_search();
    	
		$('.field-caption').focusout(function() {
			fn_changeFieldCaption();
		})
    });
    
	// 신규
	function cfn_add() {
		fn_clearForm();
		fn_createSubGrid();
		editType = 'N';
	}
	
	/**
	 * 초기화
	 */
	function cfn_init() {
		gfnma_uxDataClear('#srchArea1');
	}
	
    // 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
			fn_saveFieldCaption();
		}
    }
	// 마스터 그리드 삭제
	function cfn_del() {
		fn_delete();
	}
 
	// 조회
	function cfn_search() {
		fn_search();
		fn_clearForm();
		fn_createGrid();
		fn_createSubGrid();
	}

    /*여유필드 캡션1~20 수정 시 그리드에 적용되게 */
    const fn_changeFieldCaption = async function () { 
       let gridData = subGrid.getGridDataAll();
       jsonSubList = [];
       let fieldData = await fn_fieldCaption(); 
       
       fn_drawSubGrid(mode,fieldData, gridData, true);
    }
    
    /*필드캡션 데이터*/
    const fn_fieldCaption = async function (data){
    	let field_data = {}
    	if(_.isEmpty(data)){
	    	field_data = {
    	    	FIELD_CAPTION1 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION1")),
    	    	FIELD_CAPTION2 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION2")),
    	    	FIELD_CAPTION3 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION3")),
    	    	FIELD_CAPTION4 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION4")),
    	    	FIELD_CAPTION5 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION5")),
    	    	FIELD_CAPTION6 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION6")),
    	    	FIELD_CAPTION7 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION7")),
    	    	FIELD_CAPTION8 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION8")),
    	    	FIELD_CAPTION9 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION9")),
    	    	FIELD_CAPTION10 : gfn_nvl(SBUxMethod.get("FIELD_CAPTION10"))
    		};
    	}else{
	    	field_data = {
	    	    	FIELD_CAPTION1 : gfn_nvl( data.EXTRA_COL1 ),
	    	    	FIELD_CAPTION2 : gfn_nvl( data.EXTRA_COL2 ),
	    	    	FIELD_CAPTION3 : gfn_nvl( data.EXTRA_COL3 ),
	    	    	FIELD_CAPTION4 : gfn_nvl( data.EXTRA_COL4 ),
	    	    	FIELD_CAPTION5 : gfn_nvl( data.EXTRA_COL5 ),
	    	    	FIELD_CAPTION6 : gfn_nvl( data.EXTRA_COL6 ),
	    	    	FIELD_CAPTION7 : gfn_nvl( data.EXTRA_COL7 ),
	    	    	FIELD_CAPTION8 : gfn_nvl( data.EXTRA_COL8 ),
	    	    	FIELD_CAPTION9 : gfn_nvl( data.EXTRA_COL9 ),
	    	    	FIELD_CAPTION10 : gfn_nvl( data.EXTRA_COL10 ),
	    	};
    	}
    	return field_data;
    }
    
    //grid 초기화
    var masterGrid; 			// 그리드를 담기위한 객체 선언
    var jsonMasterList 	= []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdcom3720';
	    SBGridProperties.id 				= 'masterGrid';
	    SBGridProperties.jsonref 			= 'jsonMasterList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.useinitsorting 	= true;
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["그룹코드"],		ref: 'GROUP_CODE', 		type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["코드그룹명"],		ref: 'GROUP_NAME',    	type:'output',  	width:'150px',  	style:'text-align:left'}
        ];
        masterGrid	= _SBGrid.create(SBGridProperties);
        masterGrid.bind('click', 'fn_view');
        masterGrid.bind('keyup', 'fn_keyup');

    }
    const fn_keyup = async function(event){
    	if(event.keyCode == 38 || event.keyCode == 40 ){
    		await fn_view();
    	}
    }
    var subGrid; 				// 세부코드 정보 그리드를 담기위한 객체 선언
    var jsonSubList 	= []; 	// 세부코드 정보 그리드의 참조 데이터 주소 선언
    
    function fn_createSubGrid() {
        // 세부코드 정보 초기세팅
        var SBSubGridProperties 				= {};
        SBSubGridProperties.parentid 			= 'sb-area-subGrdcom3720';
        SBSubGridProperties.id 					= 'subGrid';
        SBSubGridProperties.jsonref 			= 'jsonSubList';
        SBSubGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBSubGridProperties.selectmode 			= 'byrow';
		SBSubGridProperties.allowcopy 			= copy;
        SBSubGridProperties.explorerbar 		= 'sortmove';
        SBSubGridProperties.rowheader 			= 'seq';
        SBSubGridProperties.rowheadercaption 	= {seq: 'No'};
        SBSubGridProperties.rowheaderwidth 		= {seq: '60'};
        SBSubGridProperties.extendlastcol 		= 'scroll';
        SBSubGridProperties.columns = [
            {caption: ["세부코드"],			ref: 'SUB_CODE', 		type:'input',  		width:'100px',  		style:'text-align:left', userattr : {required : true} },
            {caption: ["코드명"],				ref: 'CODE_NAME',    	type:'input',  		width:'200px',  	style:'text-align:left', userattr : {required : true} },
            {caption: ['시스템코드'],     	ref : 'SYSTEM_YN',		type :'checkbox',	width : '80px', typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center', userattr : {required : true} },
            {caption: ["정렬순서"],			ref: 'SORT_SEQ',    	type:'input',  		width:'100px',  	style:'text-align:right', userattr : {required : true} },
            {caption: ['사용여부'],    	 	ref : 'USE_YN',			type :'checkbox' ,	width : '80px', typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center', userattr : {required : true} },
            {caption: ["여유필드1"],			ref: 'EXTRA_FIELD1',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드2"],			ref: 'EXTRA_FIELD2',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드3"],			ref: 'EXTRA_FIELD3',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드4"],			ref: 'EXTRA_FIELD4',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드5"],			ref: 'EXTRA_FIELD5',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드6"],			ref: 'EXTRA_FIELD6',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드7"],			ref: 'EXTRA_FIELD7',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드8"],			ref: 'EXTRA_FIELD8',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드9"],			ref: 'EXTRA_FIELD9',    type:'input',       width:'100px',  	style:'text-align:left'},
            {caption: ["여유필드10"],			ref: 'EXTRA_FIELD10',   type:'input',       width:'100px',  	style:'text-align:left'},
        ];
        subGrid	= _SBGrid.create(SBSubGridProperties);
    }

    /**
     * 코드목록 조회
     */
    const fn_search = async function() {

    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	
    	let SRCH_GROUP_CODE		= gfn_nvl(SBUxMethod.get("SRCH_GROUP_CODE"));
    	let SRCH_GROUP_NAME 	= gfn_nvl(SBUxMethod.get("SRCH_GROUP_NAME"));
    	
    	var paramObj = {
    		    V_P_DEBUG_MODE_YN       : ''
	    	   ,V_P_LANG_ID             : ''
	    	   ,V_P_COMP_CODE           : gv_ma_selectedCorpCd
	    	   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
	    	   ,V_P_GROUP_CODE          : SRCH_GROUP_CODE
	    	   ,V_P_GROUP_NAME          : SRCH_GROUP_CODE
	    	   ,V_P_FORM_ID             : p_formId
	    	   ,V_P_MENU_ID             : p_menuId
	    	   ,V_P_PROC_ID             : ''
	    	   ,V_P_USERID              : p_userId
	    	   ,V_P_PC                  : ''
   		    };		
   	        const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3720.do", {
   	        	getType				: 'json',
   	        	workType			: 'MASTER',
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
   	  							GROUP_NAME		: item.GRP_NM,
   	  							GROUP_CODE		: item.GRP_CD,
   	  							USE_YN			: item.USE_YN,
   	  							CLIENT_CODE		: item.CLNT_CD,
   	  							COMP_CODE		: item.CO_CD
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
	
    //세부코드 정보
    const fn_drawSubGrid = async function(mode, fieldData, gridData, copymod) {
		let FIELD_CAPTION1    	= gfn_nvl(fieldData.FIELD_CAPTION1)  == "" ? "여유필드1"  : fieldData.FIELD_CAPTION1;
		let FIELD_CAPTION2	    = gfn_nvl(fieldData.FIELD_CAPTION2)  == "" ? "여유필드2"  : fieldData.FIELD_CAPTION2;
		let FIELD_CAPTION3	    = gfn_nvl(fieldData.FIELD_CAPTION3)  == "" ? "여유필드3"  : fieldData.FIELD_CAPTION3;
		let FIELD_CAPTION4	    = gfn_nvl(fieldData.FIELD_CAPTION4)  == "" ? "여유필드4"  : fieldData.FIELD_CAPTION4;
		let FIELD_CAPTION5	    = gfn_nvl(fieldData.FIELD_CAPTION5)  == "" ? "여유필드5"  : fieldData.FIELD_CAPTION5;
		let FIELD_CAPTION6	    = gfn_nvl(fieldData.FIELD_CAPTION6)  == "" ? "여유필드6"  : fieldData.FIELD_CAPTION6;
		let FIELD_CAPTION7	    = gfn_nvl(fieldData.FIELD_CAPTION7)  == "" ? "여유필드7"  : fieldData.FIELD_CAPTION7;
		let FIELD_CAPTION8	    = gfn_nvl(fieldData.FIELD_CAPTION8)  == "" ? "여유필드8"  : fieldData.FIELD_CAPTION8;
		let FIELD_CAPTION9	    = gfn_nvl(fieldData.FIELD_CAPTION9)  == "" ? "여유필드9"  : fieldData.FIELD_CAPTION9;
		let FIELD_CAPTION10	    = gfn_nvl(fieldData.FIELD_CAPTION10) == "" ? "여유필드10" : fieldData.FIELD_CAPTION10;
		
        // 세부코드 정보 세팅
        SBSubGridProperties 					= {};
        SBSubGridProperties.parentid 			= 'sb-area-subGrdcom3720';
        SBSubGridProperties.id 					= 'subGrid';
        SBSubGridProperties.jsonref 			= 'jsonSubList';
        SBSubGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBSubGridProperties.selectmode 			= mode;
        SBSubGridProperties.allowcopy 			= copymod;
        SBSubGridProperties.explorerbar 		= 'sortmove';
        SBSubGridProperties.rowheader 			= 'seq';
        SBSubGridProperties.rowheadercaption 	= {seq: 'No'};
        SBSubGridProperties.rowheaderwidth 		= {seq: '60'};
        SBSubGridProperties.extendlastcol 		= 'scroll';
        SBSubGridProperties.columns = [
            {caption: ["세부코드"],			ref: 'SUB_CODE', 		type:'input',  		width:'100px',  		style:'text-align:left', userattr : {required : true} },
            {caption: ["코드명"],				ref: 'CODE_NAME',    	type:'input',  		width:'200px',  	style:'text-align:left', userattr : {required : true} },
            {caption: ['시스템코드'],     	ref : 'SYSTEM_YN',		type :'checkbox',	width : '80px', typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center', userattr : {required : true} },
            {caption: ["정렬순서"],			ref: 'SORT_SEQ',    	type:'input',  		width:'100px',  	style:'text-align:right', userattr : {required : true} },
            {caption: ['사용여부'],    	 	ref : 'USE_YN',			type :'checkbox' ,	width : '80px', typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center', userattr : {required : true} },
            {caption: [FIELD_CAPTION1],			ref: 'EXTRA_FIELD1',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION2],			ref: 'EXTRA_FIELD2',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION3],			ref: 'EXTRA_FIELD3',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION4],			ref: 'EXTRA_FIELD4',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION5],			ref: 'EXTRA_FIELD5',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION6],			ref: 'EXTRA_FIELD6',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION7],			ref: 'EXTRA_FIELD7',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION8],			ref: 'EXTRA_FIELD8',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION9],			ref: 'EXTRA_FIELD9',    type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: [FIELD_CAPTION10],		ref: 'EXTRA_FIELD10',   type:'input',  	width:'100px',  	style:'text-align:left'}
        ];                                                                   

		// 이전에 그렸던 그리드 삭제 후 다시 그리기
        _SBGrid.destroy('subGrid');
        subGrid = _SBGrid.create(SBSubGridProperties);
        jsonSubList = [];
        gridData.forEach((item, index) => {
			const msg = {
					SUB_CODE		: item.SUB_CODE,
					CODE_NAME		: item.CODE_NAME,
					SYSTEM_YN		: item.SYSTEM_YN,
					DESCR			: item.DESCR,
					EXTRA_FIELD1	: item.EXTRA_FIELD1,
					EXTRA_FIELD2	: item.EXTRA_FIELD2,
					EXTRA_FIELD3	: item.EXTRA_FIELD3,
					EXTRA_FIELD4	: item.EXTRA_FIELD4,
					EXTRA_FIELD5	: item.EXTRA_FIELD5,
					EXTRA_FIELD6	: item.EXTRA_FIELD6,
					EXTRA_FIELD7	: item.EXTRA_FIELD7,
					EXTRA_FIELD8	: item.EXTRA_FIELD8,
					EXTRA_FIELD9	: item.EXTRA_FIELD9,
					EXTRA_FIELD10	: item.EXTRA_FIELD10,
					SORT_SEQ		: item.SORT_SEQ,
					USE_YN			: item.USE_YN,
					GROUP_CODE		: item.GROUP_CODE,
					CLIENT_CODE		: item.CLIENT_CODE,
					COMP_CODE		: item.COMP_CODE		
			}
			jsonSubList.push(msg);
		});
		subGrid.rebuild();
    }
    
    const fn_clearForm = function() {
		
    	//코드목록
    	jsonMasterList = [];
    	//세부코드 정보
    	jsonSubList = [];
    	
    	//그룹코드 내역
    	SBUxMethod.set("GROUP_CODE", 			"");
        SBUxMethod.set("GROUP_NAME", 			"");
    	SBUxMethod.set("CODE_LENGTH", 			"");
    	SBUxMethod.set("BIZCOMPONENT_ID", 		"");
    	SBUxMethod.set("SEGMENT_FIELD_NAME", 	"");
    	SBUxMethod.set("SQL_WHERE_CODE", 		"");
        SBUxMethod.set("DESCR", 				"");
    	SBUxMethod.set("USE_YN", 				"");
    	SBUxMethod.set("NUMBER_YN", 			"");
        SBUxMethod.set("FIELD_CAPTION1", 		"");
        SBUxMethod.set("FIELD_CAPTION2", 		"");
        SBUxMethod.set("FIELD_CAPTION3", 		"");
        SBUxMethod.set("FIELD_CAPTION4", 		"");
        SBUxMethod.set("FIELD_CAPTION5", 		"");
        SBUxMethod.set("FIELD_CAPTION6", 		"");
        SBUxMethod.set("FIELD_CAPTION7", 		"");
        SBUxMethod.set("FIELD_CAPTION8", 		"");
        SBUxMethod.set("FIELD_CAPTION9", 		"");
        SBUxMethod.set("FIELD_CAPTION10", 		"");
    }
    
    // 그리드 삭제
    const fn_delete = async function(){
    	let GROUP_CODE 			= gfn_nvl(SBUxMethod.get("GROUP_CODE"));
    	let GROUP_NAME			= gfn_nvl(SBUxMethod.get("GROUP_NAME"));
    	let USE_YN				= gfn_nvl(SBUxMethod.get("USE_YN").USE_YN);
    	let NUMBER_YN			= gfn_nvl(SBUxMethod.get("NUMBER_YN").NUMBER_YN);
    	let DESCR 				= gfn_nvl(SBUxMethod.get("DESCR"));
    	let CODE_LENGTH			= gfn_nvl(SBUxMethod.get("CODE_LENGTH"));
    	let BIZCOMPONENT_ID 	= gfn_nvl(SBUxMethod.get("BIZCOMPONENT_ID"));
    	let SEGMENT_FIELD_NAME 	= gfn_nvl(SBUxMethod.get("SEGMENT_FIELD_NAME"));
    	let SQL_WHERE_CODE 		= gfn_nvl(SBUxMethod.get("SQL_WHERE_CODE"));

    	let FIELD_CAPTION1 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION1"));
    	let FIELD_CAPTION2 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION2"));
    	let FIELD_CAPTION3 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION3"));
    	let FIELD_CAPTION4 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION4"));
    	let FIELD_CAPTION5 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION5"));
    	let FIELD_CAPTION6 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION6"));
    	let FIELD_CAPTION7 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION7"));
    	let FIELD_CAPTION8 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION8"));
    	let FIELD_CAPTION9 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION9"));
    	let FIELD_CAPTION10 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION10"));
    	
  	    var paramObj = {
  	    	    V_P_DEBUG_MODE_YN       : ''
    		   ,V_P_LANG_ID             : ''
    		   ,V_P_COMP_CODE           : gv_ma_selectedCorpCd
    		   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
    		   ,V_P_GROUP_CODE          : GROUP_CODE
    		   ,V_P_GROUP_NAME          : GROUP_NAME
    		   ,V_P_CODE_LENGTH         : CODE_LENGTH
    		   ,V_P_FIELD_CAPTION1      : FIELD_CAPTION1
    		   ,V_P_FIELD_CAPTION2      : FIELD_CAPTION2
    		   ,V_P_FIELD_CAPTION3      : FIELD_CAPTION3
    		   ,V_P_FIELD_CAPTION4      : FIELD_CAPTION4
    		   ,V_P_FIELD_CAPTION5      : FIELD_CAPTION5
    		   ,V_P_FIELD_CAPTION6      : FIELD_CAPTION6
    		   ,V_P_FIELD_CAPTION7      : FIELD_CAPTION7
    		   ,V_P_FIELD_CAPTION8      : FIELD_CAPTION8
    		   ,V_P_FIELD_CAPTION9      : FIELD_CAPTION9
    		   ,V_P_FIELD_CAPTION10     : FIELD_CAPTION10
    		   ,V_P_DESCR               : DESCR
    		   ,V_P_USE_YN              : USE_YN
    		   ,V_P_BIZCOMPONENT_ID     : BIZCOMPONENT_ID
    		   ,V_P_SEGMENT_FIELD_NAME  : SEGMENT_FIELD_NAME
    		   ,V_P_SQL_WHERE_CODE      : SQL_WHERE_CODE
    		   ,V_P_NUMBER_YN           : NUMBER_YN
    		   ,V_P_FORM_ID             : p_formId
    		   ,V_P_MENU_ID             : p_menuId
    		   ,V_P_PROC_ID             : ''
    		   ,V_P_USERID              : p_userId
    		   ,V_P_PC                  : ''
	    };		
        const postJsonPromise = gfn_postJSON("/co/sys/com/deleteCom3720.do", {
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
    const fn_saveFieldCaption = async function() {
    	
    	if (!SBUxMethod.validateRequired({group_id:'panAppoint'}) || !validateRequired("panAppoint") || !gfnma_gridValidateCheck()) {
    		return false;
    	}

    	let GROUP_CODE 			= gfn_nvl(SBUxMethod.get("GROUP_CODE"));
    	let GROUP_NAME			= gfn_nvl(SBUxMethod.get("GROUP_NAME"));
    	let USE_YN				= gfn_nvl(SBUxMethod.get("USE_YN").USE_YN);
    	let NUMBER_YN			= gfn_nvl(SBUxMethod.get("NUMBER_YN").NUMBER_YN);
    	let DESCR 				= gfn_nvl(SBUxMethod.get("DESCR"));
    	let CODE_LENGTH			= gfn_nvl(SBUxMethod.get("CODE_LENGTH"));
    	let BIZCOMPONENT_ID 	= gfn_nvl(SBUxMethod.get("BIZCOMPONENT_ID"));
    	let SEGMENT_FIELD_NAME 	= gfn_nvl(SBUxMethod.get("SEGMENT_FIELD_NAME"));
    	let SQL_WHERE_CODE 		= gfn_nvl(SBUxMethod.get("SQL_WHERE_CODE"));

    	let FIELD_CAPTION1 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION1"));
    	let FIELD_CAPTION2 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION2"));
    	let FIELD_CAPTION3 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION3"));
    	let FIELD_CAPTION4 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION4"));
    	let FIELD_CAPTION5 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION5"));
    	let FIELD_CAPTION6 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION6"));
    	let FIELD_CAPTION7 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION7"));
    	let FIELD_CAPTION8 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION8"));
    	let FIELD_CAPTION9 		= gfn_nvl(SBUxMethod.get("FIELD_CAPTION9"));
    	let FIELD_CAPTION10 	= gfn_nvl(SBUxMethod.get("FIELD_CAPTION10"));
    	
    	
    	if(editType == "N"){
    		var valUrl = "/co/sys/com/insertCom3720.do";
    	}else{
    		var valUrl = "/co/sys/com/updateCom3720.do";
    	}
    	
  	    var paramObj = {
  	    	    V_P_DEBUG_MODE_YN       : ''
    		   ,V_P_LANG_ID             : ''
    		   ,V_P_COMP_CODE           : gv_ma_selectedCorpCd
    		   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
    		   ,V_P_GROUP_CODE          : GROUP_CODE
    		   ,V_P_GROUP_NAME          : GROUP_NAME
    		   ,V_P_CODE_LENGTH         : CODE_LENGTH
    		   ,V_P_FIELD_CAPTION1      : FIELD_CAPTION1
    		   ,V_P_FIELD_CAPTION2      : FIELD_CAPTION2
    		   ,V_P_FIELD_CAPTION3      : FIELD_CAPTION3
    		   ,V_P_FIELD_CAPTION4      : FIELD_CAPTION4
    		   ,V_P_FIELD_CAPTION5      : FIELD_CAPTION5
    		   ,V_P_FIELD_CAPTION6      : FIELD_CAPTION6
    		   ,V_P_FIELD_CAPTION7      : FIELD_CAPTION7
    		   ,V_P_FIELD_CAPTION8      : FIELD_CAPTION8
    		   ,V_P_FIELD_CAPTION9      : FIELD_CAPTION9
    		   ,V_P_FIELD_CAPTION10     : FIELD_CAPTION10
    		   ,V_P_DESCR               : DESCR
    		   ,V_P_USE_YN              : USE_YN
    		   ,V_P_BIZCOMPONENT_ID     : BIZCOMPONENT_ID
    		   ,V_P_SEGMENT_FIELD_NAME  : SEGMENT_FIELD_NAME
    		   ,V_P_SQL_WHERE_CODE      : SQL_WHERE_CODE
    		   ,V_P_NUMBER_YN           : NUMBER_YN
    		   ,V_P_FORM_ID             : p_formId
    		   ,V_P_MENU_ID             : p_menuId
    		   ,V_P_PROC_ID             : ''
    		   ,V_P_USERID              : p_userId
    		   ,V_P_PC                  : ''
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
        		let rowLength = subGrid.getUpdateData(true, 'all').length;
        		let rowVal 	  = subGrid.getUpdateData(true, 'all');
        		if(rowLength >= 1 ){
        	    		for(var i = 0; rowLength > i; i ++){
        	    			var workType 		= rowVal[i].status == 'i' ? 'N' : (rowVal[i].status == 'u' ? 'U' : 'D');
        		            var P_USE_YN 		= '';
        		            var P_SYSTEM_YN 	= '';
        	    			
        	    			if(gfn_nvl(rowVal[i].data.USE_YN) == ""){
        	    				P_USE_YN = 'N';
        	    			}
        	    			if(gfn_nvl(rowVal[i].data.SYSTEM_YN) == ""){
        	    				P_SYSTEM_YN = 'N';
        	    			}
        	    			var paramObj = {
        	    					
       	    					   V_P_DEBUG_MODE_YN        : ''
  	    						   ,V_P_LANG_ID             : ''
  	    						   ,V_P_COMP_CODE           : gv_ma_selectedCorpCd
  	    						   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
  	    						   ,V_P_GROUP_CODE          : GROUP_CODE
  	    						   ,V_P_SUB_CODE            : gfn_nvl(rowVal[i].data.SUB_CODE)
  	    						   ,V_P_CODE_NAME           : gfn_nvl(rowVal[i].data.CODE_NAME)
  	    						   ,V_P_SYSTEM_YN           : gfn_nvl(rowVal[i].data.SYSTEM_YN) == 'Y' ? 'Y' : 'N'
  	    						   ,V_P_EXTRA_FIELD1        : gfn_nvl(rowVal[i].data.EXTRA_FIELD1)
  	    						   ,V_P_EXTRA_FIELD2        : gfn_nvl(rowVal[i].data.EXTRA_FIELD2)
  	    						   ,V_P_EXTRA_FIELD3        : gfn_nvl(rowVal[i].data.EXTRA_FIELD3)
  	    						   ,V_P_EXTRA_FIELD4        : gfn_nvl(rowVal[i].data.EXTRA_FIELD4)
  	    						   ,V_P_EXTRA_FIELD5        : gfn_nvl(rowVal[i].data.EXTRA_FIELD5)
  	    						   ,V_P_EXTRA_FIELD6        : gfn_nvl(rowVal[i].data.EXTRA_FIELD6)
  	    						   ,V_P_EXTRA_FIELD7        : gfn_nvl(rowVal[i].data.EXTRA_FIELD7)
  	    						   ,V_P_EXTRA_FIELD8        : gfn_nvl(rowVal[i].data.EXTRA_FIELD8)
  	    						   ,V_P_EXTRA_FIELD9        : gfn_nvl(rowVal[i].data.EXTRA_FIELD9)
  	    						   ,V_P_EXTRA_FIELD10       : gfn_nvl(rowVal[i].data.EXTRA_FIELD10)
  	    						   ,V_P_SORT_SEQ            : gfn_nvl(rowVal[i].data.SORT_SEQ)
  	    						   ,V_P_USE_YN              : gfn_nvl(rowVal[i].data.USE_YN) == 'Y' ? 'Y' : 'N'
  	    						   ,V_P_FORM_ID             : p_formId
  	    						   ,V_P_MENU_ID             : p_menuId
  	    						   ,V_P_PROC_ID             : ''
  	    						   ,V_P_USERID              : p_userId
  	    						   ,V_P_PC                  : ''
        	    		    };		
        	    			
        	    	        const postJsonPromise = gfn_postJSON("/co/sys/com/updateCom3720_S1.do", {
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
        let rowVal = subGrid.getRow();

    	//데이터가 없고 행선택이 없을경우.
		if(rowVal == -1) {
			subGrid.addRow(true,{ SYSTEM_YN:"Y", USE_YN:"Y" }, true);
		} else {
			subGrid.insertRow(rowVal, 'below', { SYSTEM_YN:"Y", USE_YN:"Y" });
		}
    }

     // 행 삭제
     const fn_delRow = async function () {

         let rowVal = subGrid.getRow();

         if (rowVal == -1) {
             gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
             return;
         } else {
             subGrid.deleteRow(rowVal);
         }
     }
     
     
     const fn_gridCopyClear = async function (){
         $('#btnCopyClear').hide();
         $('#btnCopyLine').show();
         $('#btnCopyCell').hide();

         let gridData = subGrid.getGridDataAll();
         let fieldData = await fn_fieldCaption(); 
     	 jsonSubList = [];
		 mode = 'byrow'; //행 단위 단일  선택
		 copy = true;
         fn_drawSubGrid(mode,fieldData, gridData, copy);
     }
     
     /*행 복사 (행복사모드)*/
     const fn_gridCopyLine = async function () { 
         $('#btnCopyClear').hide();
         $('#btnCopyLine').hide();
         $('#btnCopyCell').show();

         let gridData = subGrid.getGridDataAll();
         let fieldData = await fn_fieldCaption(); 
     	 jsonSubList = [];
		 mode = 'byrows'; //행 단위 다중 선택
		 copy = true;
         fn_drawSubGrid(mode,fieldData, gridData, copy);
     }
     
     /*셀 복사 (셀복사모드)*/
     const fn_gridCopyCell = async function () {
         $('#btnCopyClear').show();
         $('#btnCopyLine').hide();
         $('#btnCopyCell').hide();
         
         let gridData = subGrid.getGridDataAll();
         let fieldData = await fn_fieldCaption(); 
     	 jsonSubList = [];
         mode = 'free'; //셀 단위 다중 선택
		 copy = true;
         fn_drawSubGrid(mode,fieldData, gridData, copy);
     }
     
    //그룹코드 내역 보기
    const fn_view = async function() {
    
		editType = 'U';
    	var nCol = masterGrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = masterGrid.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = masterGrid.getRowData(nRow);
    	fn_clearForm();
		subGrid.clearStatus();
		
	    var paramObj = {
	   		   V_P_DEBUG_MODE_YN	: ''
	   		   ,V_P_LANG_ID         : ''    
	   		   ,V_P_COMP_CODE       : gv_ma_selectedCorpCd
	   		   ,V_P_CLIENT_CODE     : gv_ma_selectedClntCd
	   		   ,V_P_GROUP_CODE      : rowData.GROUP_CODE
	   		   ,V_P_GROUP_NAME		: ''          
	   		   ,V_P_FORM_ID			: p_formId    
	   		   ,V_P_MENU_ID			: p_menuId         
	   		   ,V_P_PROC_ID     	: ''        
	   		   ,V_P_USERID			: p_userId
	   		   ,V_P_PC				: '' 
   		   
	    };		

        const postJsonPromise = gfn_postJSON("/co/sys/com/selectCom3720.do", {
        	getType				: 'json',
        	workType			: 'DETAIL',
        	cv_count			: '4',
        	params				: gfnma_objectToString(paramObj)
		});
        const data = await postJsonPromise;
        try {
  			if (_.isEqual("S", data.resultStatus)) {
				let fieldData = await fn_fieldCaption(data.cv_2[0]);
				let obj = data.cv_2[0];
		    	SBUxMethod.set("GROUP_CODE", 			gfn_nvl(obj.GRP_CD) );
		        SBUxMethod.set("GROUP_NAME", 			gfn_nvl(obj.GRP_NM) );
		    	SBUxMethod.set("CODE_LENGTH", 			gfn_nvl(obj.CD_LNGTH) );
		    	SBUxMethod.set("BIZCOMPONENT_ID", 		gfn_nvl(obj.BIZ_CMPON_ID) );
		    	SBUxMethod.set("SEGMENT_FIELD_NAME", 	gfn_nvl(obj.SGMT_ARTCL_NM) );
		    	SBUxMethod.set("SQL_WHERE_CODE", 		gfn_nvl(obj.SQL_CND_CD) );
		        SBUxMethod.set("DESCR", 				gfn_nvl(obj.DSCTN) );
		    	SBUxMethod.set("USE_YN", 				gfn_nvl(obj.USE_YN) );
		    	SBUxMethod.set("NUMBER_YN", 			gfn_nvl(obj.NO_YN) );
		        SBUxMethod.set("FIELD_CAPTION1", 		gfn_nvl(obj.COL_CPTN1) );
		        SBUxMethod.set("FIELD_CAPTION2", 		gfn_nvl(obj.COL_CPTN2) );
		        SBUxMethod.set("FIELD_CAPTION3", 		gfn_nvl(obj.COL_CPTN3) );
		        SBUxMethod.set("FIELD_CAPTION4", 		gfn_nvl(obj.COL_CPTN4) );
		        SBUxMethod.set("FIELD_CAPTION5", 		gfn_nvl(obj.COL_CPTN5) );
		        SBUxMethod.set("FIELD_CAPTION6", 		gfn_nvl(obj.COL_CPTN6) );
		        SBUxMethod.set("FIELD_CAPTION7", 		gfn_nvl(obj.COL_CPTN7) );
		        SBUxMethod.set("FIELD_CAPTION8", 		gfn_nvl(obj.COL_CPTN8) );
		        SBUxMethod.set("FIELD_CAPTION9", 		gfn_nvl(obj.COL_CPTN9) );
		        SBUxMethod.set("FIELD_CAPTION10", 		gfn_nvl(obj.COL_CPTN10) );
				
  	        	jsonSubList = [];
  	        	data.cv_3.forEach((item, index) => {
	  	  			const msg = {
	  						SUB_CODE		: item.SBSD_CD,
	  						CODE_NAME		: item.CD_NM,
	  						SYSTEM_YN		: item.SYS_YN,
	  						DESCR			: item.DSCTN,
	  						EXTRA_FIELD1	: item.EXTRA_COL1,
	  						EXTRA_FIELD2	: item.EXTRA_COL2,
	  						EXTRA_FIELD3	: item.EXTRA_COL3,
	  						EXTRA_FIELD4	: item.EXTRA_COL4,
	  						EXTRA_FIELD5	: item.EXTRA_COL5,
	  						EXTRA_FIELD6	: item.EXTRA_COL6,
	  						EXTRA_FIELD7	: item.EXTRA_COL7,
	  						EXTRA_FIELD8	: item.EXTRA_COL8,
	  						EXTRA_FIELD9	: item.EXTRA_COL9,
	  						EXTRA_FIELD10	: item.EXTRA_COL10,
	  						SORT_SEQ		: item.SORT_SEQ,
	  						USE_YN			: item.USE_YN,
	  						GROUP_CODE		: item.GRP_CD,
	  						CLIENT_CODE		: item.CLNT_CD,
	  						COMP_CODE		: item.COMP_CODE		
	  				}
 					jsonSubList.push(msg);
 				});
  	      		fn_drawSubGrid(mode, fieldData, jsonSubList, copy);
  	      		
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