<%
/**
 * @Class Name 		: com3100.jsp
 * @Description 	: 전자세금계산서 관리(매출) 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.05.22
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.05.22   	장성주		최초 생성
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
	<title>title : 전자세금계산서 관리(매출)</title>
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
                    </h3><!-- 전자세금계산서 관리(매출) -->
                </div>
                <div style="margin-left: auto;">
                    <sbux-button id="btnCreate" name="btnCreate" 	uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
                    <sbux-button id="btnSave" 	name="btnSave" 		uitype="normal" text="저장" class="btn btn-sm btn-outline-danger" onclick="fn_save"></sbux-button>
                    <!-- 
                    <sbux-button id="btnDelete" name="btnDelete" 	uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
                     -->
                    <sbux-button id="btnSearch" name="btnSearch" 	uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
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
                            <th scope="row" class="th_bg">조회구분</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
								<p class="ad_input_row">
									<sbux-radio id="rdo-RidGubun1" name="rdo-RidGubun" uitype="normal" value="1" class="radio_label" checked></sbux-radio>
									<label class="radio_label" for="rdo-RidGubun1">전체</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-RidGubun2" name="rdo-RidGubun" uitype="normal" value="2" class="radio_label"></sbux-radio>
									<label class="radio_label" for="rdo-RidGubun2">세금계산서</label>
								</p>
								<p class="ad_input_row">
									<sbux-radio id="rdo-RidGubun3" name="rdo-RidGubun" uitype="normal" value="3" class="radio_label"></sbux-radio>
									<label class="radio_label" for="rdo-RidGubun3">계산서</label>
								</p>
                            </td>
                            
                            <th scope="row" class="th_bg">년월</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-datepicker id="srch_riod_yyyymm_p" name="picker_popup" uitype="popup" datepicker-mode="month" date-format="yyyy-mm"></sbux-datepicker>                            
                            </td>
                            
                            <th scope="row" class="th_bg">작성일자</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-datepicker id="srch_ymddate" name="picker_range" uitype="range" style="width:120px"></sbux-datepicker>                            
                            </td>
                            
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">상호</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                <sbux-input id="srch_txtcs_name" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            
                            <th scope="row" class="th_bg">담당자</th>
                            <td colspan="3" class="td_input" style="border-right:hidden;">
								<sbux-input id="srch_txtemp_code" name="input_sch" uitype="search" button-back-text="조회" button-back-style="color:black;"></sbux-input>                            
                            </td>
                            
                        </tr>
                    </tbody>
                </table>
                
				<!-- 1번째 그리드-->
				<div class="ad_tbl_top">
					<ul class="ad_tbl_count">
						<li><span>조회결과</span></li>
					</ul>
					<div class="ad_tbl_toplist">
						<span style="padding-right:10px;">제외사유</span>
						<sbux-button
									id="btnUld"
									name="btnUld"
									uitype="normal"
									text="제외처리 취소"
									class="btn btn-sm btn-outline-danger"
									onclick="fn_uld"
									style="float: right;"
								></sbux-button>
						<sbux-button
									id="btnDelPrdcrList"
									name="btnDelPrdcrList"
									uitype="normal"
									text="제외처리"
									class="btn btn-sm btn-outline-danger"
									onclick="fn_delPrdcrList"
									style="float: right;"
						>
						</sbux-button>
                        <sbux-input id="srch_txtcs_name" uitype="text" style="width:200px;float:right;" placeholder="" class="form-control input-sm" ></sbux-input>
                        <sbux-select id="REGION_CODE" uitype="single" jsondata-ref="jsonRegionCode" style="width:200px;float:right;" unselected-text="선택" class="form-control input-sm" ></sbux-select>
					</div>
				</div>
				
				<div>
					<div id="sb-area-grdComMsg" style="height:258px;width:100%"></div>
				</div>
				
				<div class="ad_tbl_top2">
					<ul class="ad_tbl_count">
						<li>
							<span>품묵</span>
						</li>
					</ul>
				</div>
				                
				<div>
					<div id="sb-area-grdComItem" style="height:258px;width:100%"></div>
				</div>
				
            </div>
        </div>
    </section>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	//-----------------------------------------------------------

	var editType			= "N";
	
	var jsonRegionCode		= [];	// 지역
	var jsonCurrenvyCode	= [];	// 통화
	var jsonUserYnCode		= [
		{value: 'Y', label: '사용', text: '사용'},
		{value: 'N', label: '불가',	text: '불가'}
	];	// 지역
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//지역
			gfnma_setComSelect(['NationInGrid','REGION_CODE'], jsonRegionCode, 'L_COM002', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			
			//통화
			//gfnma_setComSelect(['NationInGrid','CURRENCY_CODE'], jsonCurrenvyCode, 'L_COM001', '', '', 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
			gfnma_setComSelect(['NationInGrid'], jsonCurrenvyCode, 'L_COM001', '', '', 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
			
			//통화
			gfnma_multiSelectInit({
				target			: '#CURRENCY_CODE'
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM001'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'CURRENCY_CODE'
				,colLabel		: 'CURRENCY_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'CURRENCY_CODE', 			width:'150px',  	style:'text-align:left'},
		            {caption: "이름", 		ref: 'CURRENCY_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			})
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_initSBSelect();
    	fn_createGrid();
    	fn_search();
    });

    //grid 초기화
    var NationInGrid; 			// 그리드를 담기위한 객체 선언
    var jsonNationList = []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdComMsg';
	    SBGridProperties.id 				= 'NationInGrid';
	    SBGridProperties.jsonref 			= 'jsonNationList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.paging = {
			'type' 			: 'page',
		  	'count' 		: 5,
		  	'size' 			: 20,
		  	'sorttype' 		: 'page',
		  	'showgoalpageui': true
	    };
        SBGridProperties.columns = [
            {caption: ["국가코드"],			ref: 'NATION_CODE', 			type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption: ["국가약어"], 		ref: 'NATION_CODE_ABBR',    	type:'output',  	width:'300px',  	style:'text-align:left'},
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

        NationInGrid = _SBGrid.create(SBGridProperties);
        NationInGrid.bind('click', 'fn_view');
        NationInGrid.bind('beforepagechanged', 'fn_pagingComMsgList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {

    	// set pagination
    	let pageSize = NationInGrid.getPageSize();
    	let pageNo = 1;
    	
    	NationInGrid.movePaging(pageNo);
    }

    /**
     *
     */
    const fn_pagingComMsgList = async function() {
    	let recordCountPerPage 	= NationInGrid.getPageSize();   			// 몇개의 데이터를 가져올지 설정
    	let currentPageNo 		= NationInGrid.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
		var getColRef 			= NationInGrid.getColRef("checked");
		NationInGrid.setFixedcellcheckboxChecked(0, getColRef, false);
    	fn_setNationInGrid(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setNationInGrid = async function(pageSize, pageNo) {

    	// form clear
    	fn_clearForm();

		NationInGrid.clearStatus();

		let NATION_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_NATION_CODE"));
		let NATION_NAME	= gfnma_nvl(SBUxMethod.get("SRCH_NATION_NAME"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN	: ''
			,V_P_LANG_ID		: ''
			,V_P_COMP_CODE		: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
			,V_P_NATION_CODE	: NATION_CODE
			,V_P_NATION_NAME	: NATION_NAME
			,V_P_FORM_ID		: p_formId
			,V_P_MENU_ID		: p_menuId
			,V_P_PROC_ID		: ''
			,V_P_USERID			: ''
			,V_P_PC				: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/co/sys/org/selectCom3100List.do", {
        	getType				: 'json',
        	workType			: 'LIST',
        	cv_count			: '1',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		//console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonNationList.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						NATION_CODE				: item.NATION_CODE,
  						NATION_CODE_ABBR		: item.NATION_CODE_ABBR,
  						NATION_NAME				: item.NATION_NAME,
  						NATION_FULL_NAME		: item.NATION_FULL_NAME,
  						NATION_FULL_NAME_CHN	: item.NATION_FULL_NAME_CHN,
  						REGION_CODE				: item.REGION_CODE,
  						CURRENCY_CODE			: item.CURRENCY_CODE,
  						MEMO					: item.MEMO,
  						SORT_SEQ				: item.SORT_SEQ,
  						USE_YN 					: item.USE_YN
  					}
  					jsonNationList.push(msg);
  					totalRecordCount ++;
  				});

        		NationInGrid.rebuild();
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


    //신규 작성
    function fn_create() {
    	
    	editType = "N";    	

        SBUxMethod.attr('NATION_CODE',	'readonly', false);
    	
    	SBUxMethod.set("NATION_CODE", 			"");
    	SBUxMethod.set("NATION_CODE_ABBR", 		"");
        SBUxMethod.set("NATION_NAME", 			"");
        SBUxMethod.set("NATION_FULL_NAME", 		"");
        SBUxMethod.set("NATION_FULL_NAME_CHN", 	"");
        
        SBUxMethod.set("REGION_CODE", 			"");
        
        //SBUxMethod.set("CURRENCY_CODE", 		"");
        gfnma_multiSelectSet('#CURRENCY_CODE', '', '', '');
        
        SBUxMethod.set("MEMO", 					"");
        SBUxMethod.set("SORT_SEQ", 				"");
        SBUxMethod.set("USE_YN", 				"");
    }

    const fn_clearForm = function() {
    	SBUxMethod.set("NATION_CODE", 			"");
    	SBUxMethod.set("NATION_CODE_ABBR", 		"");
        SBUxMethod.set("NATION_NAME", 			"");
        SBUxMethod.set("NATION_FULL_NAME", 		"");
        SBUxMethod.set("NATION_FULL_NAME_CHN", 	"");
        
        SBUxMethod.set("REGION_CODE", 			"");
        
        //SBUxMethod.set("CURRENCY_CODE", 		"");
        gfnma_multiSelectSet('#CURRENCY_CODE', '', '', '');
        
        SBUxMethod.set("MEMO", 					"");
        SBUxMethod.set("SORT_SEQ", 				"");
        SBUxMethod.set("USE_YN", 				"");
    }

    //저장
    const fn_save = async function() {

    	let NATION_CODE 			= gfnma_nvl(SBUxMethod.get("NATION_CODE"));
    	let NATION_CODE_ABBR		= gfnma_nvl(SBUxMethod.get("NATION_CODE_ABBR"));
    	let NATION_NAME 			= gfnma_nvl(SBUxMethod.get("NATION_NAME"));
    	let NATION_FULL_NAME		= gfnma_nvl(SBUxMethod.get("NATION_FULL_NAME"));
    	let NATION_FULL_NAME_CHN	= gfnma_nvl(SBUxMethod.get("NATION_FULL_NAME_CHN"));
    	let REGION_CODE 			= gfnma_nvl(SBUxMethod.get("REGION_CODE"));
    	
    	//let CURRENCY_CODE			= gfnma_nvl(SBUxMethod.get("CURRENCY_CODE"));
    	let tempObj					= gfnma_multiSelectGet('#CURRENCY_CODE');
    	let CURRENCY_CODE			= tempObj.value;
    	
    	let MEMO 					= gfnma_nvl(SBUxMethod.get("MEMO"));
    	let SORT_SEQ 				= gfnma_nvl(SBUxMethod.get("SORT_SEQ"));
    	let USE_YN 					= gfnma_nvl(SBUxMethod.get("USE_YN"));

    	if (!NATION_CODE) {
            gfn_comAlert("W0002", "국가코드");
            return;
        }
    	if (!NATION_NAME) {
            gfn_comAlert("W0002", "국가약식명");
            return;
        }
    	if (!NATION_FULL_NAME) {
            gfn_comAlert("W0002", "국가정식명");
            return;
        }
    	if (!NATION_FULL_NAME_CHN) {
            gfn_comAlert("W0002", "국가정식명(한글)");
            return;
        }
    	if (!REGION_CODE) {
            gfn_comAlert("W0002", "지역");
            return;
        }
    	if (!CURRENCY_CODE) {
            gfn_comAlert("W0002", "통화");
            return;
        }
    	if (!SORT_SEQ) {
            gfn_comAlert("W0002", "정렬순서");
            return;
        }
    	if (!USE_YN) {
            gfn_comAlert("W0002", "사용여부");
            return;
        }

    	if (editType=="N") {
    		// 신규 등록
    		if(gfn_comConfirm("Q0001", "신규 등록")){
    			var obj = {
   			    	NATION_CODE				: NATION_CODE
   			    	,NATION_NAME			: NATION_NAME
   			    	,NATION_FULL_NAME		: NATION_FULL_NAME
   			    	,NATION_FULL_NAME_CHN	: NATION_FULL_NAME_CHN
   			    	,NATION_CODE_ABBR 		: NATION_CODE_ABBR
   			    	,REGION_CODE 			: REGION_CODE
   			    	,CURRENCY_CODE			: CURRENCY_CODE
   			    	,MEMO 					: MEMO
   			    	,SORT_SEQ 				: SORT_SEQ
   			    	,USE_YN 				: USE_YN
    			}
				fn_subInsert(obj);
    		} 
    	} else if(editType=="E") {
    		// 수정 저장
    		if(gfn_comConfirm("Q0001", "수정 저장")){
    			var obj = {
   			    	NATION_CODE				: NATION_CODE
   			    	,NATION_NAME			: NATION_NAME
   			    	,NATION_FULL_NAME		: NATION_FULL_NAME
   			    	,NATION_FULL_NAME_CHN	: NATION_FULL_NAME_CHN
   			    	,NATION_CODE_ABBR 		: NATION_CODE_ABBR
   			    	,REGION_CODE 			: REGION_CODE
   			    	,CURRENCY_CODE			: CURRENCY_CODE
   			    	,MEMO 					: MEMO
   			    	,SORT_SEQ 				: SORT_SEQ
   			    	,USE_YN 				: USE_YN
    			}
    			fn_subUpdate(obj);
    		} 
    	}

    }

    /**
     * @param {boolean} isConfirmed
     */
    const fn_subInsert = async function (obj){

 	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			,V_P_NATION_CODE			: obj.NATION_CODE
			,V_P_NATION_NAME			: obj.NATION_NAME
			,V_P_NATION_FULL_NAME     	: obj.NATION_FULL_NAME
			,V_P_NATION_FULL_NAME_CHN	: obj.NATION_FULL_NAME_CHN
			,V_P_NATION_CODE_ABBR		: obj.NATION_CODE_ABBR
			,V_P_REGION_CODE			: obj.REGION_CODE
			,V_P_CURRENCY_CODE			: obj.CURRENCY_CODE
			,V_P_MEMO					: obj.MEMO
			,V_P_SORT_SEQ				: obj.SORT_SEQ
			,V_P_USE_YN					: obj.USE_YN
			,V_P_FORM_ID				: p_formId
			,V_P_MENU_ID				: p_menuId
			,V_P_PROC_ID				: ''
			,V_P_USERID					: ''
			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/co/sys/org/insertCom3100.do", {
        	getType				: 'json',
        	workType			: 'N',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        		fn_search();
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
     * @param {boolean} isConfirmed
     */
	const fn_subUpdate = async function (obj){

  	    var paramObj = { 
  				V_P_DEBUG_MODE_YN			: ''
  				,V_P_LANG_ID				: ''
				,V_P_COMP_CODE				: gv_ma_selectedApcCd
				,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
  				,V_P_NATION_CODE			: obj.NATION_CODE
  				,V_P_NATION_NAME			: obj.NATION_NAME
  				,V_P_NATION_FULL_NAME     	: obj.NATION_FULL_NAME
  				,V_P_NATION_FULL_NAME_CHN	: obj.NATION_FULL_NAME_CHN
  				,V_P_NATION_CODE_ABBR		: obj.NATION_CODE_ABBR
  				,V_P_REGION_CODE			: obj.REGION_CODE
  				,V_P_CURRENCY_CODE			: obj.CURRENCY_CODE
  				,V_P_MEMO					: obj.MEMO
  				,V_P_SORT_SEQ				: obj.SORT_SEQ
  				,V_P_USE_YN					: obj.USE_YN
  				,V_P_FORM_ID				: p_formId
  				,V_P_MENU_ID				: p_menuId
  				,V_P_PROC_ID				: ''
  				,V_P_USERID					: ''
  				,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/co/sys/org/updateCom3100.do", {
        	getType				: 'json',
        	workType			: 'U',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        		fn_search();
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

    //선택 삭제
    function fn_delete() {

        //fn_subDelete(gfn_comConfirm("Q0001", "삭제"), list);
    }

	/**
     * @param {boolean} isConfirmed
     * @param {any[]} list
     */
    const fn_subDelete = async function (isConfirmed, list){
    	 
    }

    //상세정보 보기
    function fn_view() {

    	editType = "E";    	
    	
    	var nCol = NationInGrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = NationInGrid.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = NationInGrid.getRowData(nRow);

        SBUxMethod.attr('NATION_CODE',	'readonly', true);
        
        SBUxMethod.set("NATION_CODE", 			rowData.NATION_CODE);
        SBUxMethod.set("NATION_CODE_ABBR", 		rowData.NATION_CODE_ABBR);
        SBUxMethod.set("NATION_NAME", 			rowData.NATION_NAME);
        SBUxMethod.set("NATION_FULL_NAME", 		rowData.NATION_FULL_NAME);
        SBUxMethod.set("NATION_FULL_NAME_CHN", 	rowData.NATION_FULL_NAME_CHN);
        
        SBUxMethod.set("REGION_CODE", 			rowData.REGION_CODE);
        
        //SBUxMethod.set("CURRENCY_CODE", 		rowData.CURRENCY_CODE);
        gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', rowData.CURRENCY_CODE);
        
        SBUxMethod.set("MEMO", 					rowData.MEMO);
        SBUxMethod.set("SORT_SEQ", 				rowData.SORT_SEQ);
        SBUxMethod.set("USE_YN", 				rowData.USE_YN);
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>