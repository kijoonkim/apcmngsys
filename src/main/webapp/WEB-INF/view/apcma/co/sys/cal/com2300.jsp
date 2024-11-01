<%
/**
 * @Class Name 		: com2300.jsp
 * @Description 	: 달력 생성
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.01
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.01   	천용진		최초 생성
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
	<title>title : 달력 생성</title>
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
<!-- 	                <sbux-button id="btn_searchHoliday" name="btn_searchHoliday" uitype="normal" text="공휴일 조회" class="btn btn-sm btn-outline-danger" onclick="fn_searchHoliday" ></sbux-button> -->
	                <sbux-button id="btn_copyPrevYear" name="btn_copyPrevYear" uitype="normal" text="전년도 자료 복사" class="btn btn-sm btn-outline-danger" onclick="fn_copyPrevYear" ></sbux-button>
	                <sbux-button id="btn_createCalendar" name="btn_createCalendar" uitype="normal" text="캘린더 신규 생성" class="btn btn-sm btn-outline-danger" onclick="fn_createCalendar"></sbux-button>
	                <sbux-button id="btn_reflectChangeCalendar" name="btn_reflectChangeCalendar" uitype="normal" text="캘린더 갱신 반영" class="btn btn-sm btn-outline-danger" onclick="fn_reflectChangeCalendar" ></sbux-button>
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
                            <th scope="row" class="th_bg">법인</th>
                            <td class="td_input" style="border-right: hidden;">
								<div class="dropdown">
								    <button 
								    	style="width:160px;text-align:left" 
								    	class="btn btn-sm btn-light dropdown-toggle" 
								    	uitype="normal"
								    	id="SRCH_COMP_CODE" 
								    	data-toggle="dropdown" 
								    	aria-haspopup="true" 
								    	aria-expanded="false">
								    	<font>선택</font>
								        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
								    </button>
								    <div class="dropdown-menu" aria-labelledby=SRCH_COMP_CODE style="width:200px;height:150px;padding-top:0px;overflow:auto">
								    </div>
								</div>                                
                            </td>   
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">기준년도</th>
                            <td class="td_input" style="border-right: hidden;">
								<sbux-datepicker id="SRCH_YYYY" name="SRCH_YYYY" uitype="popup"
									date-format="yyyy" 
									datepicker-mode="year"
									style="height:28px">
								</sbux-datepicker>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-3">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>코드목록</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdCom2300" style="height:600px; width:100%;"></div>
                        </div>
                    </div>

                    <div class="col-sm-9">
                        <div class="ad_tbl_top">
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
	                            <div id="sb-area-subGrdCom2300" style="height:595px; width:100%;"></div>
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
	var jsonDayName	= [];	// 요일
	
	const fn_initSBSelect = async function() {
		SBUxMethod.set("SRCH_YYYY", gfn_dateToYmd(new Date()));
		let rst = await Promise.all([
			//그리드 - 요일
			gfnma_setComSelect(['masterGrid','DAY_NAME'], jsonDayName, 'L_COM043', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

			//법인
			gfnma_multiSelectInit({
				target			: ['#SRCH_COMP_CODE']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_ORG000'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'COMP_CODE'
				,colLabel		: 'COMP_NAME'
				,columns		:[
		            {caption: "법인코드",		ref: 'COMP_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "법인명", 		ref: 'COMP_NAME',    	width:'100px',  	style:'text-align:left'},
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
	}
	
    // 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
	        fn_save();
		}
    }
	// 삭제
	function cfn_del() {
		fn_delete();
	}
 
	// 조회
	function cfn_search() {
		if(gfn_nvl(SBUxMethod.get("SRCH_YYYY")) == ''){
			gfn_comAlert("W0002", "기준년도");
		}else{
			fn_search();
			fn_createGrid();
			fn_createSubGrid();
		}
	}

    //grid 초기화
    var masterGrid; 			// 그리드를 담기위한 객체 선언
    var jsonMasterList 	= []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdCom2300';
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
            {caption: ["요일"],	ref: 'DAY_NAME', 	type:'combo',  	width:'100px',  style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonDayName',
					label		: 'label',
					value		: 'value'
            	}
            },  
            {caption: ['휴일여부'],     ref: 'HOLIDAY_YN',		type:'checkbox',	width: '80px',
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            	style : 'text-align:center'
            },
            {caption: ['근무일여부'],    ref: 'WORKING_DAY_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            },
            {caption: ['영업일여부'],    ref: 'BUSINESS_DAY_YN',		type:'checkbox',	width: '80px',
            	typeinfo : { 
            		checkedvalue : "Y", 
            		uncheckedvalue : "N" }, 
            		style : 'text-align:center'
            }
        ];
        masterGrid	= _SBGrid.create(SBGridProperties);
    }
    
    var subGrid; 				// 세부코드 정보 그리드를 담기위한 객체 선언
    var jsonSubList 	= []; 	// 세부코드 정보 그리드의 참조 데이터 주소 선언
    
    function fn_createSubGrid() {
        // 세부코드 정보 초기세팅
        var SBSubGridProperties 				= {};
        SBSubGridProperties.parentid 			= 'sb-area-subGrdCom2300';
        SBSubGridProperties.id 					= 'subGrid';
        SBSubGridProperties.jsonref 			= 'jsonSubList';
        SBSubGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBSubGridProperties.selectmode 			= 'byrow';
        SBSubGridProperties.explorerbar 		= 'sortmove';
        SBSubGridProperties.rowheader 			= 'seq';
        SBSubGridProperties.rowheadercaption 	= {seq: 'No'};
        SBSubGridProperties.rowheaderwidth 		= {seq: '60'};
        SBSubGridProperties.extendlastcol 		= 'scroll';
        SBSubGridProperties.columns = [
            {caption: ['시작일'], 			ref: 'START_DAY',  		type:'datepicker' ,   typeinfo : {dateformat :"yyyy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'},
            {caption: ['종료일'], 			ref: 'END_DAY',    		type:'datepicker' ,   typeinfo : {dateformat :"yyyy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'},
            {caption: ['양력여부'],     		ref: 'SOLAR_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
            {caption: ['윤달여부'],     		ref: 'LEAP_MONTH_YN',	type:'checkbox',	width: '80px', 
            		typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
            {caption: ["특정일명칭"],			ref: 'DAY_TITLE',    		type:'input',  		width:'100px',  style:'text-align:left'},
            {caption: ['휴일여부'],     		ref: 'HOLIDAY_YN',		type:'checkbox',	width: '80px', 
            	typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
            {caption: ['근무일여부'],     	ref: 'WORKING_DAY_YN',	type:'checkbox',	width: '80px', 
            		typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
            {caption: ['영업일여부'],     	ref: 'BUSINESS_DAY_YN',	type:'checkbox',	width: '80px', 
            			typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
            {caption: ['비고'],     			ref: 'MEMO',			type:'input',		width: '80px', style : 'text-align:center'},
            {caption: ['시작일(양)'], ref: 'START_DAY_SOLAR',    		type:'datepicker' ,   typeinfo : {dateformat :"yyyy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'},
            {caption: ['시작(요일)'],     	ref: 'START_WEEK_NAME',	type:'input',		width: '80px', style : 'text-align:center'},
            {caption: ['종료일(양)'], ref: 'END_DAY_SOLAR',    		type:'datepicker' ,   typeinfo : {dateformat :"yyyy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'},
            {caption: ['종료(요일)'],     	ref: 'END_WEEK_NAME',	type:'input',		width: '80px', style : 'text-align:center'},
        ];               
        subGrid	= _SBGrid.create(SBSubGridProperties);
    }


    /**
     * 코드목록 조회
     */
    const fn_search = async function() {

    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	let SRCH_YYYY 		= gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
    	
    	var paramObj = {
    		    V_P_DEBUG_MODE_YN       : ''
	    	   ,V_P_LANG_ID             : ''
	    	   ,V_P_COMP_CODE           : gv_ma_selectedApcCd
	    	   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
	    	   ,V_P_YYYY	            : SRCH_YYYY
	    	   ,V_P_FORM_ID        		: p_formId
	    	   ,V_P_MENU_ID             : p_menuId
	    	   ,V_P_PROC_ID             : ''
	    	   ,V_P_USERID              : p_userId
	    	   ,V_P_PC                  : ''
   		    };		
   	        const postJsonPromise = gfn_postJSON("/co/sys/cal/selectCom2300.do", {
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
					
   	  	    		masterGrid.length = 0;
   	  	    		//메인 그리드
   	  	        	data.cv_1.forEach((item, index) => {
   	  					const msg = {
   	  						BUSINESS_DAY_YN		: item.BUSINESS_DAY_YN,
	   	  					DAY_NAME			: item.DAY_NAME,
		   	  				HOLIDAY_YN			: item.HOLIDAY_YN,
			   	  			SEQ					: item.SEQ,
				   	  		WORKING_DAY_YN		: item.WORKING_DAY_YN
   	  					}
   	  					jsonMasterList.push(msg);
   	  					totalRecordCount ++;
   	  				});
					masterGrid.rebuild();
				  	document.querySelector('#listCount').innerText = totalRecordCount;
				  	
				  	//서브 그리드
   	  	        	data.cv_2.forEach((item, index) => {
   	  					const subMsg = {
   	  						BUSINESS_DAY_YN			: item.BUSINESS_DAY_YN,
   	  						CHK_YN					: item.CHK_YN,
	   	  					DAY_TITLE				: item.DAY_TITLE,
		   	  				END_DAY					: item.END_DAY.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"),
			   	  			END_DAY_SOLAR			: item.END_DAY_SOLAR.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"),
				   	  		END_WEEK_NAME			: item.END_WEEK_NAME,
					   	  	HOLIDAY_YN				: item.HOLIDAY_YN,
					   	 	LEAP_MONTH_YN			: item.LEAP_MONTH_YN,
						   	SOLAR_YN				: item.SOLAR_YN,
						   	START_DAY				: item.START_DAY.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"),
						   	START_DAY_SOLAR			: item.START_DAY_SOLAR.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"),
						   	START_WEEK_NAME			: item.START_WEEK_NAME,
						   	TXN_ID					: item.TXN_ID,
						   	WORKING_DAY_YN			: item.WORKING_DAY_YN
   	  					}
   	  					jsonSubList.push(subMsg);
   	  				});
   	  	       		subGrid.rebuild();
				  	
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
    const fn_drawSubGrid = async function(mode, data,copymod) {
        // 세부코드 정보 세팅
        SBSubGridProperties 					= {};
        SBSubGridProperties.parentid 			= 'sb-area-subGrdCom2300';
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
                    {caption: ['시작일'], 			ref: 'START_DAY',  		type:'datepicker' ,   typeinfo : {dateformat :"yyyy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'},
                    {caption: ['종료일'], 			ref: 'END_DAY',    		type:'datepicker' ,   typeinfo : {dateformat :"yyyy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'},
                    {caption: ['양력여부'],     		ref: 'SOLAR_YN',		type:'checkbox',	width: '80px', 
                    	typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
                    {caption: ['윤달여부'],     		ref: 'LEAP_MONTH_YN',	type:'checkbox',	width: '80px', 
                    		typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
                    {caption: ["특정일명칭"],			ref: 'DAY_TITLE',  		type:'input',  		width:'100px',  style:'text-align:left'},
                    {caption: ['휴일여부'],     		ref: 'HOLIDAY_YN',		type:'checkbox',	width: '80px', 
                    	typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
                    {caption: ['근무일여부'],     	ref: 'WORKING_DAY_YN',	type:'checkbox',	width: '80px', 
                    		typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
                    {caption: ['영업일여부'],     	ref: 'BUSINESS_DAY_YN',	type:'checkbox',	width: '80px', 
                    			typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
                    {caption: ['비고'],     			ref: 'MEMO',			type:'input',		width: '80px', style : 'text-align:center'},
                    {caption: ['시작일(양)'], ref: 'START_DAY_SOLAR',    		type:'datepicker' ,   typeinfo : {dateformat :"yyyy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'},
                    {caption: ['시작(요일)'],     	ref: 'START_WEEK_NAME',	type:'input',		width: '80px', style : 'text-align:center'},
                    {caption: ['종료일(양)'], ref: 'END_DAY_SOLAR',    		type:'datepicker' ,   typeinfo : {dateformat :"yyyy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'},
                    {caption: ['종료(요일)'],     	ref: 'END_WEEK_NAME',	type:'input',		width: '80px', style : 'text-align:center'},
                ];  
		// 이전에 그렸던 그리드 삭제 후 다시 그리기
        _SBGrid.destroy('subGrid');
        subGrid = _SBGrid.create(SBSubGridProperties);
        
        data.forEach((item, index) => {
			const msg = {
					BUSINESS_DAY_YN			: item.BUSINESS_DAY_YN,
					CHK_YN					: item.CHK_YN,
  					DAY_TITLE				: item.DAY_TITLE,
   	  				END_DAY					: item.END_DAY.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"),
	   	  			END_DAY_SOLAR			: item.END_DAY_SOLAR.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"),
		   	  		END_WEEK_NAME			: item.END_WEEK_NAME,
			   	  	HOLIDAY_YN				: item.HOLIDAY_YN,
			   	 	LEAP_MONTH_YN			: item.LEAP_MONTH_YN,
				   	SOLAR_YN				: item.SOLAR_YN,
				   	START_DAY				: item.START_DAY.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"),
				   	START_DAY_SOLAR			: item.START_DAY_SOLAR.replace(/(\d{4})(\d{2})(\d{2})/, "$1-$2-$3"),
				   	START_WEEK_NAME			: item.START_WEEK_NAME,
				   	TXN_ID					: item.TXN_ID,
				   	WORKING_DAY_YN			: item.WORKING_DAY_YN	
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
    	
    }
    
    // 그리드 삭제
    const fn_delete = async function(){
    	let SRCH_YYYY 		= gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
		//그리드 요일별 데이터를 담기위한 리스트
    	let sunData = [];
    	let monData = [];
    	let tueData = [];
    	let wedData = [];
    	let thuData = [];
    	let friData = [];
    	let satData = [];
		let masterRowVal 	  = masterGrid.getGridDataAll();
		
		if(masterRowVal.length > 0){
			for(let i = 0; masterRowVal.length > i; i ++){
	            let row = masterRowVal[i];
	            switch (row.DAY_NAME) {
	                case '1': sunData.push(row); break;
	                case '2': monData.push(row); break;
	                case '3': tueData.push(row); break;
	                case '4': wedData.push(row); break;
	                case '5': thuData.push(row); break;
	                case '6': friData.push(row); break;
	                case '7': satData.push(row); break;
	                default: break;
	            }
			}
		}

  	    var paramObj = {
  	    	   V_P_DEBUG_MODE_YN         : '' 
    		   ,V_P_LANG_ID              : ''
    		   ,V_P_COMP_CODE            : gv_ma_selectedApcCd
    		   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
    		   ,V_P_YYYY                 : SRCH_YYYY
    		   ,V_P_SUN_HOLIDAY_YN       : gfn_nvl(sunData[0].HOLIDAY_YN)
    		   ,V_P_MON_HOLIDAY_YN       : gfn_nvl(monData[0].HOLIDAY_YN)
    		   ,V_P_TUE_HOLIDAY_YN       : gfn_nvl(tueData[0].HOLIDAY_YN)
    		   ,V_P_WED_HOLIDAY_YN       : gfn_nvl(wedData[0].HOLIDAY_YN)
    		   ,V_P_THU_HOLIDAY_YN       : gfn_nvl(thuData[0].HOLIDAY_YN)
    		   ,V_P_FRI_HOLIDAY_YN       : gfn_nvl(friData[0].HOLIDAY_YN)
    		   ,V_P_SAT_HOLIDAY_YN       : gfn_nvl(satData[0].HOLIDAY_YN)
    		   ,V_P_SUN_WORKING_DAY_YN   : gfn_nvl(sunData[0].WORKING_DAY_YN)
    		   ,V_P_MON_WORKING_DAY_YN   : gfn_nvl(monData[0].WORKING_DAY_YN)
    		   ,V_P_TUE_WORKING_DAY_YN   : gfn_nvl(tueData[0].WORKING_DAY_YN)
    		   ,V_P_WED_WORKING_DAY_YN   : gfn_nvl(wedData[0].WORKING_DAY_YN)
    		   ,V_P_THU_WORKING_DAY_YN   : gfn_nvl(thuData[0].WORKING_DAY_YN)
    		   ,V_P_FRI_WORKING_DAY_YN   : gfn_nvl(friData[0].WORKING_DAY_YN)
    		   ,V_P_SAT_WORKING_DAY_YN   : gfn_nvl(satData[0].WORKING_DAY_YN)
    		   ,V_P_SUN_BUSINESS_DAY_YN  : gfn_nvl(sunData[0].BUSINESS_DAY_YN)
    		   ,V_P_MON_BUSINESS_DAY_YN  : gfn_nvl(monData[0].BUSINESS_DAY_YN)
    		   ,V_P_TUE_BUSINESS_DAY_YN  : gfn_nvl(tueData[0].BUSINESS_DAY_YN)
    		   ,V_P_WED_BUSINESS_DAY_YN  : gfn_nvl(wedData[0].BUSINESS_DAY_YN)
    		   ,V_P_THU_BUSINESS_DAY_YN  : gfn_nvl(thuData[0].BUSINESS_DAY_YN)
    		   ,V_P_FRI_BUSINESS_DAY_YN  : gfn_nvl(friData[0].BUSINESS_DAY_YN)
    		   ,V_P_SAT_BUSINESS_DAY_YN  : gfn_nvl(satData[0].BUSINESS_DAY_YN)
    		   ,V_P_FORM_ID              : p_formId
    		   ,V_P_MENU_ID              : p_menuId
    		   ,V_P_PROC_ID              : ''
    		   ,V_P_USERID               : p_userId
    		   ,V_P_PC                   : ''
	    };			
        const postJsonPromise = gfn_postJSON("/co/sys/cal/deletecom2300.do", {
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
    	let SRCH_YYYY 		= gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
		//그리드 요일별 데이터를 담기위한 리스트
    	let sunData = [];
    	let monData = [];
    	let tueData = [];
    	let wedData = [];
    	let thuData = [];
    	let friData = [];
    	let satData = [];
		let masterRowVal 	  = masterGrid.getGridDataAll();
		
		if(masterRowVal.length > 0){
			for(let i = 0; masterRowVal.length > i; i ++){
	            let row = masterRowVal[i];
	            switch (row.DAY_NAME) {
	                case '1': sunData.push(row); break;
	                case '2': monData.push(row); break;
	                case '3': tueData.push(row); break;
	                case '4': wedData.push(row); break;
	                case '5': thuData.push(row); break;
	                case '6': friData.push(row); break;
	                case '7': satData.push(row); break;
	                default: break;
	            }
			}
		}

  	    var paramObj = {
  	    	   V_P_DEBUG_MODE_YN         : '' 
    		   ,V_P_LANG_ID              : ''
    		   ,V_P_COMP_CODE            : gv_ma_selectedApcCd
    		   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
    		   ,V_P_YYYY                 : SRCH_YYYY
    		   ,V_P_SUN_HOLIDAY_YN       : gfn_nvl(sunData[0].HOLIDAY_YN)
    		   ,V_P_MON_HOLIDAY_YN       : gfn_nvl(monData[0].HOLIDAY_YN)
    		   ,V_P_TUE_HOLIDAY_YN       : gfn_nvl(tueData[0].HOLIDAY_YN)
    		   ,V_P_WED_HOLIDAY_YN       : gfn_nvl(wedData[0].HOLIDAY_YN)
    		   ,V_P_THU_HOLIDAY_YN       : gfn_nvl(thuData[0].HOLIDAY_YN)
    		   ,V_P_FRI_HOLIDAY_YN       : gfn_nvl(friData[0].HOLIDAY_YN)
    		   ,V_P_SAT_HOLIDAY_YN       : gfn_nvl(satData[0].HOLIDAY_YN)
    		   ,V_P_SUN_WORKING_DAY_YN   : gfn_nvl(sunData[0].WORKING_DAY_YN)
    		   ,V_P_MON_WORKING_DAY_YN   : gfn_nvl(monData[0].WORKING_DAY_YN)
    		   ,V_P_TUE_WORKING_DAY_YN   : gfn_nvl(tueData[0].WORKING_DAY_YN)
    		   ,V_P_WED_WORKING_DAY_YN   : gfn_nvl(wedData[0].WORKING_DAY_YN)
    		   ,V_P_THU_WORKING_DAY_YN   : gfn_nvl(thuData[0].WORKING_DAY_YN)
    		   ,V_P_FRI_WORKING_DAY_YN   : gfn_nvl(friData[0].WORKING_DAY_YN)
    		   ,V_P_SAT_WORKING_DAY_YN   : gfn_nvl(satData[0].WORKING_DAY_YN)
    		   ,V_P_SUN_BUSINESS_DAY_YN  : gfn_nvl(sunData[0].BUSINESS_DAY_YN)
    		   ,V_P_MON_BUSINESS_DAY_YN  : gfn_nvl(monData[0].BUSINESS_DAY_YN)
    		   ,V_P_TUE_BUSINESS_DAY_YN  : gfn_nvl(tueData[0].BUSINESS_DAY_YN)
    		   ,V_P_WED_BUSINESS_DAY_YN  : gfn_nvl(wedData[0].BUSINESS_DAY_YN)
    		   ,V_P_THU_BUSINESS_DAY_YN  : gfn_nvl(thuData[0].BUSINESS_DAY_YN)
    		   ,V_P_FRI_BUSINESS_DAY_YN  : gfn_nvl(friData[0].BUSINESS_DAY_YN)
    		   ,V_P_SAT_BUSINESS_DAY_YN  : gfn_nvl(satData[0].BUSINESS_DAY_YN)
    		   ,V_P_FORM_ID              : p_formId
    		   ,V_P_MENU_ID              : p_menuId
    		   ,V_P_PROC_ID              : ''
    		   ,V_P_USERID               : p_userId
    		   ,V_P_PC                   : ''
	    };		
        const postJsonPromise = gfn_postJSON("/co/sys/cal/insertCom2300.do", {
        	getType				: 'json',
        	workType			: 'N',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		//세부코드 정보  저장
        		let updatedData		= subGrid.getUpdateData(true, 'all');
        		let listData		= [];
				if(updatedData.length > 0){

					updatedData.forEach((item, index) => {
						const param = {
							cv_count: '0',
							getType: 'json',
							workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
							params: gfnma_objectToString({
								V_P_DEBUG_MODE_YN         : ""
								,V_P_LANG_ID              : ""
								,V_P_COMP_CODE            : gv_ma_selectedApcCd
								,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
								,V_P_YYYY                 : SRCH_YYYY
								,V_P_TXN_ID               : gfn_nvl(item.data.TXN_ID)
								,V_P_START_DAY            : gfn_nvl(item.data.START_DAY)
								,V_P_END_DAY              : gfn_nvl(item.data.END_DAY)
								,V_P_SOLAR_YN             : gfn_nvl(item.data.SOLAR_YN)
								,V_P_LEAP_MONTH_YN        : gfn_nvl(item.data.LEAP_MONTH_YN)
								,V_P_DAY_TITLE            : gfn_nvl(item.data.DAY_TITLE)
								,V_P_HOLIDAY_YN           : gfn_nvl(item.data.HOLIDAY_YN)
								,V_P_WORKING_DAY_YN       : gfn_nvl(item.data.WORKING_DAY_YN)
								,V_P_BUSINESS_DAY_YN      : gfn_nvl(item.data.BUSINESS_DAY_YN)
								,V_P_MEMO                 : gfn_nvl(item.data.MEMO)
								,V_P_FORM_ID              : p_formId
								,V_P_MENU_ID              : p_menuId
								,V_P_PROC_ID              : ""
								,V_P_USERID               : p_userId
								,V_P_PC                   : ""
							})
						};
						listData.push(param);
					});	
						
					const postJsonPromise = gfn_postJSON("/co/sys/cal/updateCom2300_S1.do", {listData: listData});
					const subData = await postJsonPromise;
					try {
						if (_.isEqual("S", subData.resultStatus)) {
							gfn_comAlert("I0001");
							cfn_search();
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
         if (rowVal == -1){ 

             subGrid.addRow(true);
         }else{
             subGrid.insertRow(rowVal);
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
     
     /*셀복사 해제 (복사모드해제)*/
     const fn_gridCopyClear = function (){ 
         $('#btnCopyClear').hide();
         $('#btnCopyLine').show();
         $('#btnCopyCell').hide();

         let data = subGrid.getGridDataAll();
     	 jsonSubList = [];
		 let mode = 'byrow'; //행 단위 단일  선택
         fn_drawSubGrid(mode, data, true);

     }
     
     /*행 복사 (행복사모드)*/
     const fn_gridCopyLine = function () { 
         $('#btnCopyClear').hide();
         $('#btnCopyLine').hide();
         $('#btnCopyCell').show();

         let data = subGrid.getGridDataAll();
     	 jsonSubList = [];

		 let mode = 'byrows'; //행 단위 다중 선택
         fn_drawSubGrid(mode, data, true);

     }
     
     /*셀 복사 (셀복사모드)*/
     const fn_gridCopyCell = function () { 
         $('#btnCopyClear').show();
         $('#btnCopyLine').hide();
         $('#btnCopyCell').hide();
         
         let data = subGrid.getGridDataAll();
     	 jsonSubList = [];
	 
         let mode = 'free'; //셀 단위 다중 선택
         fn_drawSubGrid(mode, data, true);
     }
     
     //전년도 자료 복사
     const fn_copyPrevYear = async function() {
    	 
         let SRCH_YYYY = gfn_nvl(SBUxMethod.get("SRCH_YYYY"));

         const paramObj = {
    	    	   V_P_DEBUG_MODE_YN         : '' 
   	    		   ,V_P_LANG_ID              : ''
   	    		   ,V_P_COMP_CODE            : gv_ma_selectedApcCd
   	    		   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
   	    		   ,V_P_YYYY                 : SRCH_YYYY
   	    		   ,V_P_SUN_HOLIDAY_YN       : ''
   	    		   ,V_P_MON_HOLIDAY_YN       : ''
   	    		   ,V_P_TUE_HOLIDAY_YN       : ''
   	    		   ,V_P_WED_HOLIDAY_YN       : ''
   	    		   ,V_P_THU_HOLIDAY_YN       : ''
   	    		   ,V_P_FRI_HOLIDAY_YN       : ''
   	    		   ,V_P_SAT_HOLIDAY_YN       : ''
   	    		   ,V_P_SUN_WORKING_DAY_YN   : ''
   	    		   ,V_P_MON_WORKING_DAY_YN   : ''
   	    		   ,V_P_TUE_WORKING_DAY_YN   : ''
   	    		   ,V_P_WED_WORKING_DAY_YN   : ''
   	    		   ,V_P_THU_WORKING_DAY_YN   : ''
   	    		   ,V_P_FRI_WORKING_DAY_YN   : ''
   	    		   ,V_P_SAT_WORKING_DAY_YN   : ''
   	    		   ,V_P_SUN_BUSINESS_DAY_YN  : ''
   	    		   ,V_P_MON_BUSINESS_DAY_YN  : ''
   	    		   ,V_P_TUE_BUSINESS_DAY_YN  : ''
   	    		   ,V_P_WED_BUSINESS_DAY_YN  : ''
   	    		   ,V_P_THU_BUSINESS_DAY_YN  : ''
   	    		   ,V_P_FRI_BUSINESS_DAY_YN  : ''
   	    		   ,V_P_SAT_BUSINESS_DAY_YN  : ''
   	    		   ,V_P_FORM_ID              : p_formId
   	    		   ,V_P_MENU_ID              : p_menuId
   	    		   ,V_P_PROC_ID              : ''
   	    		   ,V_P_USERID               : p_userId
   	    		   ,V_P_PC                   : ''
         }

         const postJsonPromise = gfn_postJSON("/co/sys/cal/insertCom2300.do", {
             getType			: 'json',
             workType			: 'BEFORE',
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
     
	//캘린더 신규 생성
	const fn_createCalendar = async function() {

		await fn_save();

     	// 코드목록 그리드 초기화
     	fn_clearForm();
     	let SRCH_YYYY 		= gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
     	
     	var paramObj = {
	     		    V_P_DEBUG_MODE_YN       : ''
	 	    	   ,V_P_LANG_ID             : ''
	 	    	   ,V_P_COMP_CODE           : gv_ma_selectedApcCd
	 	    	   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
	 	    	   ,V_P_YYYY	            : SRCH_YYYY
	 	    	   ,V_P_FORM_ID        		: p_formId
	 	    	   ,V_P_MENU_ID             : p_menuId
	 	    	   ,V_P_PROC_ID             : ''
	 	    	   ,V_P_USERID              : p_userId
	 	    	   ,V_P_PC                  : ''
    		    };		
   	        const postJsonPromise = gfn_postJSON("/co/sys/cal/selectCom2300.do", {
   	        	getType				: 'json',
   	        	workType			: 'CREATE',
   	        	cv_count			: '2',
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
   	        } catch (e) {
   	    		if (!(e instanceof Error)) {
   	    			e = new Error(e);
   	    		}
   	    		console.error("failed", e.message);
   	        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
   	        }
     }
     
	//캘린더 갱신 반영
    const fn_reflectChangeCalendar = async function() {
		await fn_save();

     	// 코드목록 그리드 초기화
     	fn_clearForm();
     	let SRCH_YYYY 		= gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
     	
     	var paramObj = {
	     		    V_P_DEBUG_MODE_YN       : ''
	 	    	   ,V_P_LANG_ID             : ''
	 	    	   ,V_P_COMP_CODE           : gv_ma_selectedApcCd
	 	    	   ,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
	 	    	   ,V_P_YYYY	            : SRCH_YYYY
	 	    	   ,V_P_FORM_ID        		: p_formId
	 	    	   ,V_P_MENU_ID             : p_menuId
	 	    	   ,V_P_PROC_ID             : ''
	 	    	   ,V_P_USERID              : p_userId
	 	    	   ,V_P_PC                  : ''
    		    };		
   	        const postJsonPromise = gfn_postJSON("/co/sys/cal/selectCom2300.do", {
   	        	getType				: 'json',
   	        	workType			: 'MODIFY',
   	        	cv_count			: '2',
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