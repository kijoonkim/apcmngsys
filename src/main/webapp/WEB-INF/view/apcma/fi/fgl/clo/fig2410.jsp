<%
/**
 * @Class Name 		: fig2410.jsp
 * @Description 	: 선급비용상각 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.09.30
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.09.30   	장성주		최초 생성
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
	<title>title : 선급비용상각</title>
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
                    </h3><!-- 선급비용상각 신규 -->
                </div>
                <div style="margin-left: auto;">
					<sbux-button class="btn btn-sm btn-outline-danger" text="계산" 				onclick="fn_cal()"></sbux-button>
					<sbux-button class="btn btn-sm btn-outline-danger" text="전표생성" 			onclick="fn_account()"></sbux-button>
					<sbux-button class="btn btn-sm btn-outline-danger" text="전표취소" 			onclick="fn_cancel()"></sbux-button>
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
	                    </colgroup>
	                    <tbody>
	                    
                           	<!-- hidden  -->
                       		<!-- /hidden -->
                       		
	                    	<tr>
	                            <th scope="row" class="th_bg">사업단위</th>
	                            <td colspan="3" class="td_input" >
		                            <sbux-select id="SCH_FI_ORG_CODE" uitype="single" jsondata-ref="jsonFiOrgCode" style="width:150px" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            
	                            <th scope="row" class="th_bg">기간</th>
	                            <td colspan="3" class="td_input" >
									<sbux-datepicker
									        id="SCH_PERIOD_YYYYMM"
									        name="SCH_PERIOD_YYYYMM"
									        datepicker-mode="month"
									        date-format="yyyy-mm"
									        style="width:80px"
									        class="form-control input-sm input-sm-ast inpt_data_reqed"
									        required>
									</sbux-datepicker>                            
	                            </td>
	                            
	                            <th scope="row" class="th_bg"></th>
	                            <td colspan="3" class="td_input" >
	                            </td>
	                    	</tr>
															                            
	                    </tbody>
	                </table>				
				</div>
                
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>선급비용상각</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
                        </li>
                    </ul>
                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;padding-bottom:5px;margin-right:auto">
						<sbux-button class="btn btn-sm btn-outline-danger" text="전표조회" 	onclick="fn_docQ()"></sbux-button>
					</div>
                </div>
				
                <div>
                    <div id="SB_AREA_GRDTOP" style="height:530px; width:100%;">
                    </div>
                </div>
                
               	<div style="display:flex;float:left;vertical-align:middle;width:100%;padding-top:10px">

 					<font style="width:300px"></font>
               	
                	<font>전표번호</font>
					<font style="width:5px"></font>
					<sbux-input style="width:150px;text-align:right;"  id="TOT_INTERFACE_DOC_NAME" uitype="text" class="form-control input-sm" readonly></sbux-input>
					<font style="width:10px"></font>
               	
                	<font>건수</font>
					<font style="width:5px"></font>
					<sbux-input style="width:150px;text-align:right;"  id="TOT_INTERFACE_DOC_COUNT" uitype="text" class="form-control input-sm" readonly></sbux-input>
					<font style="width:10px"></font>
               	
                	<font>적요</font>
					<font style="width:5px"></font>
					<sbux-input style="width:150px;text-align:right;"  id="TOT_INTERFACE_DOC_STATUS" uitype="text" class="form-control input-sm" readonly></sbux-input>
					<font style="width:10px"></font>
               	
					<sbux-input id="TOT_CONFIRM_CNT" uitype="hidden" class="form-control input-sm" readonly></sbux-input>
					
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

	var p_ss_issAccountChief	= '${loginVO.maIsAccountChief}';
	var p_ss_isAccountManager	= '${loginVO.maIsAccountManager}';
	var p_ss_defaultAcctRule	= '${loginVO.maDefaultAcctRule}';
	var p_ss_deptCode			= '${loginVO.maDeptCode}';
	var p_ss_deptName			= '${loginVO.maDeptName}';
	var p_ss_fiOrgCode			= '${loginVO.maFIOrgCode}';
	
	//grid 초기화
	var Fig2410Grid; 				// 그리드를 담기위한 객체 선언
	var jsonFig2410 		= []; 	// 그리드의 참조 데이터 주소 선언

	var jsonFiOrgCode 		= []; 	// 사업단위
	
    var p_menu_param		= null;
	
    var p_sel_row			= null;
    
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['SCH_FI_ORG_CODE'],			jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state();
  		fn_createFig2410Grid();
	}    
    
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	
    	p_menu_param = localStorage.getItem("callMain");
    	if(p_menu_param){
    		p_menu_param = JSON.parse(p_menu_param);
    	}
    	localStorage.removeItem("callMain");
    	
    	fn_init();
    	
    });

    /**
     * 화면 state 변경
     */
    function fn_state() {
    	
    	//년월
		SBUxMethod.set('SCH_PERIOD_YYYYMM', gfnma_date().substr(0,4) + '-' + gfnma_date().substr(4,2));
    	
		SBUxMethod.set("SCH_FI_ORG_CODE", 		p_ss_fiOrgCode);
    }
    
    /**
     * 목록 조회
     */
	function cfn_search() {
		fn_setFig2410QGrid('Q');
		fn_setFig2410INFOGrid('INFO');
	}
    
    function fn_createFig2410Grid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'SB_AREA_GRDTOP';
	    SBGridProperties.id 				= 'Fig2410Grid';
	    SBGridProperties.jsonref 			= 'jsonFig2410';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        //SBGridProperties.frozencols 		= 4;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= ['seq'];
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
	    SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.total 				= {
                type 		: 'grand',
                position	: 'bottom',
                columns		: {
                    standard : [0],
                    sum : [8,9,10,11]
                },
                grandtotalrow : {
                    titlecol 		: 7,
                    titlevalue		: '합계',
                    style 			: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol	: 0
                },
                datasorting	: true,
        };
        SBGridProperties.columns = [
        	{caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '40px', style: 'text-align:center',
        	    typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
        	        checkedvalue: 'Y', uncheckedvalue: 'N'
        	    }
        	},        	
        	
            {caption: ["사업장"], 					ref: 'SITE_CODE', 				type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["전표번호"],    				ref: 'DOC_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전표제목"],    				ref: 'DOC_DESC', 				type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["전기일자"], 				ref: 'DOC_DATE', 				type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["원전표번호"], 				ref: 'ORIGINAL_DOC_NAME', 		type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["원전표전기일자"],			ref: 'ORIGINAL_DOC_DATE',		type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["원전표명"],					ref: 'ORIGINAL_DOC_DESC', 		type:'output',		width:'200px',  	style:'text-align:left'},
            
            {caption: ["순번"],						ref: 'ITEM_SEQ', 				type:'output', 		width:'80px', 		style:'text-align:left'},
            {caption: ["라인유형"],					ref: 'LINE_TYPE', 				type:'output', 		width:'80px', 		style:'text-align:left'},
            
            {caption: ["전체외화금액"], 	 		ref: 'ORIGINAL_AMOUNT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["전체원화금액"], 	 		ref: 'FUNCTIONAL_AMOUNT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["차/대"],					ref: 'DEBIT_CREDIT', 			type:'output', 		width:'80px', 		style:'text-align:left'},
            
            {caption: ["차변(원래)"], 	 			ref: 'ORIGINAL_DR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대변(원래)"], 				ref: 'ORIGINAL_CR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["차변금액"],	 	  			ref: 'FUNCTIONAL_DR_AMT',		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["대변금액"], 	   			ref: 'FUNCTIONAL_CR_AMT', 		type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["전표시작일"],				ref: 'TOTAL_START_DATE', 		type:'output', 		width:'100px', 		style:'text-align:left'},
            {caption: ["전표종료일"],				ref: 'TOTAL_END_DATE', 			type:'output', 		width:'100px', 		style:'text-align:left'},
            {caption: ["기간시작일"],				ref: 'PERIOD_START_DATE',		type:'output', 		width:'100px', 		style:'text-align:left'},
            {caption: ["기간종료일"],				ref: 'PERIOD_END_DATE', 		type:'output', 		width:'100px', 		style:'text-align:left'},
            {caption: ["계정과목"],					ref: 'ACCOUNT_CODE', 			type:'output', 		width:'100px', 		style:'text-align:left'},
            {caption: ["계정명"],					ref: 'ACCOUNT_NAME', 			type:'output', 		width:'100px', 		style:'text-align:left'},

            {caption: ["통화"],						ref: 'CURRENCY_CODE',			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"], 					ref: 'EXCHANGE_RATE', 			type:'output',		width:'100px',  	style:'text-align:left'},

            {caption: ["잔액"], 		   			ref: 'NET_AMOUNT', 				type:'output',  	width:'120px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["기간일수"],					ref: 'PERIOD_DAY', 				type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["총일수"],	 				ref: 'TOTAL_DAY', 				type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["원가중심점"],				ref: 'COST_CENTER_CODE', 		type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["원가중심정명"],				ref: 'COST_CENTER_NAME', 		type:'output',		width:'150px',  	style:'text-align:left'},
            
            {caption: ["부서"], 					ref: 'DEPT_CODE', 				type:'output',  	width:'100px', 		style:'text-align:left'},
            {caption: ["부서명"], 					ref: 'DEPT_NAME', 				type:'output',  	width:'150px', 		style:'text-align:left'},
            
            {caption: ["프로젝트"], 				ref: 'PROJECT_CODE', 			type:'output',  	width:'300px', 		style:'text-align:left'},

        ];

        Fig2410Grid = _SBGrid.create(SBGridProperties);
        Fig2410Grid.bind('click', 'fn_viewFig2410GridEvent');
    }        
    
    //상세정보 보기
    function fn_viewFig2410GridEvent() {
    	
        var nRow = Fig4180QGrid.getRow();
		if (nRow < 1) {
            return;
		}
		p_sel_row = Fig4180QGrid.getRowData(nRow);
		console.log(p_sel_row);        
    }
    
    /**
     * 목록 가져오기
     */
    const fn_setFig2410QGrid = async function(wtype) {
    	
    	p_sel_row = null;
    	
		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_period_yyyymm			= gfnma_nvl(SBUxMethod.get("SCH_PERIOD_YYYYMM"));
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","사업단위를 선택하세요");
			return;      		 
		}
		
		if(!p_period_yyyymm){
 			gfn_comAlert("E0000","기간을 선택하세요");
			return;      		 
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_fi_org_code
			,V_P_PERIOD_YYYYMM     	: p_period_yyyymm 
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/leg/selectFig2410List.do", {
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

  	        	jsonFig2410.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
						CHK_YN						: gfnma_nvl(item.CHK_YN),		
						DOC_DATE					: gfnma_nvl(item.DOC_DATE),
						ORIGINAL_DOC_DATE			: gfnma_nvl(item.ORIGINAL_DOC_DATE),
						DOC_ID						: gfnma_nvl(item.DOC_ID),
						DOC_NAME					: gfnma_nvl(item.DOC_NAME),
						ORIGINAL_DOC_ID				: gfnma_nvl(item.ORIGINAL_DOC_ID),
						ORIGINAL_DOC_NAME			: gfnma_nvl(item.ORIGINAL_DOC_NAME),
						ORIGINAL_DOC_DESC			: gfnma_nvl(item.ORIGINAL_DOC_DESC),
						ITEM_SEQ					: gfnma_nvl(item.ITEM_SEQ),
						DEBIT_CREDIT				: gfnma_nvl(item.DEBIT_CREDIT),
						DEBIT_CREDIT_NAME			: gfnma_nvl(item.DEBIT_CREDIT_NAME),
						SITE_CODE					: gfnma_nvl(item.SITE_CODE),
						SITE_NAME					: gfnma_nvl(item.SITE_NAME),
						LINE_TYPE					: gfnma_nvl(item.LINE_TYPE),
						LINE_TYPE_NAME				: gfnma_nvl(item.LINE_TYPE_NAME),
						ITEM_SOURCE_ID				: gfnma_nvl(item.ITEM_SOURCE_ID),
						ACCOUNT_CODE				: gfnma_nvl(item.ACCOUNT_CODE),
						ACCOUNT_NAME				: gfnma_nvl(item.ACCOUNT_NAME),
						FI_ORG_CODE					: gfnma_nvl(item.FI_ORG_CODE),
						DEBIT_CODE					: gfnma_nvl(item.DEBIT_CODE),
						DEBIT_NAME					: gfnma_nvl(item.DEBIT_NAME),
						
						COST_CENTER_CODE			: gfnma_nvl(item.COST_CENTER_CODE),			
						COST_CENTER_NAME			: gfnma_nvl(item.COST_CENTER_NAME),			
						PROJECT_CODE				: gfnma_nvl(item.PROJECT_CODE),			
						
						CURRENCY_CODE				: gfnma_nvl(item.CURRENCY_CODE),
						EXCHANGE_RATE				: gfnma_nvl(item.EXCHANGE_RATE),
						ORIGINAL_AMOUNT				: gfnma_nvl(item.ORIGINAL_AMOUNT),
						FUNCTIONAL_AMOUNT			: gfnma_nvl(item.FUNCTIONAL_AMOUNT),
						
						PERIOD_START_DATE			: gfnma_nvl(item.PERIOD_START_DATE),
						PERIOD_END_DATE				: gfnma_nvl(item.PERIOD_END_DATE),
						PERIOD_DAY					: gfnma_nvl(item.PERIOD_DAY),
						TOTAL_START_DATE			: gfnma_nvl(item.TOTAL_START_DATE),
						TOTAL_END_DATE				: gfnma_nvl(item.TOTAL_END_DATE),
						TOTAL_DAY					: gfnma_nvl(item.TOTAL_DAY),
						CONFIRM_FLAG				: gfnma_nvl(item.CONFIRM_FLAG),
						
						ORIGINAL_DR_AMT				: gfnma_nvl(item.ORIGINAL_DR_AMT),
						ORIGINAL_CR_AMT				: gfnma_nvl(item.ORIGINAL_CR_AMT),
						FUNCTIONAL_DR_AMT			: gfnma_nvl(item.FUNCTIONAL_DR_AMT),
						FUNCTIONAL_CR_AMT			: gfnma_nvl(item.FUNCTIONAL_CR_AMT),
						NET_AMTOUNT					: gfnma_nvl(item.NET_AMTOUNT),
						
						ACC_ITEM_VALUE1				: gfnma_nvl(item.ACC_ITEM_VALUE1),		
						ACC_ITEM_VALUE2				: gfnma_nvl(item.ACC_ITEM_VALUE2),		
						ACC_ITEM_VALUE3				: gfnma_nvl(item.ACC_ITEM_VALUE3),		
						ACC_ITEM_VALUE4				: gfnma_nvl(item.ACC_ITEM_VALUE4),		
  					}
  					Fig2410Grid.push(msg);
  					totalRecordCount ++;
  				});
				
        		Fig2410Grid.rebuild();
  	        	document.querySelector('#listCount1').innerText = totalRecordCount;
  	        	
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
     * 합계 가져오기
     */
    const fn_setFig2410INFOGrid = async function(wtype) {
    	
		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_period_yyyymm			= gfnma_nvl(SBUxMethod.get("SCH_PERIOD_YYYYMM"));
		
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","회계단위를 선택하세요");
			return;      		 
		}
		
		if(!p_period_yyyymm){
 			gfn_comAlert("E0000","기간을 선택하세요");
			return;      		 
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_fi_org_code
			,V_P_PERIOD_YYYYMM     	: p_period_yyyymm 
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/leg/selectFig2410List.do", {
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
				
  	        	if(data.cv_2 && data.cv_2.length>0){
	  	        	var obj = data.cv_2[0];
	  	        	SBUxMethod.set("TOT_INTERFACE_DOC_NAME", 	gfnma_nvl(obj.INTERFACE_DOC_NAME));
	  	        	SBUxMethod.set("TOT_INTERFACE_DOC_COUNT", 	gfnma_nvl(obj.INTERFACE_DOC_COUNT));
	  	        	SBUxMethod.set("TOT_INTERFACE_DOC_STATUS",	gfnma_nvl(obj.INTERFACE_DOC_STATUS));
	  	        	SBUxMethod.set("TOT_CONFIRM_CNT", 			gfnma_nvl(obj.CONFIRM_CNT));
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
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#srchArea1');
    }    
    
    /**
     * 계산
     */
    var fn_cal = function() {
		fn_setFig2410QGrid('CALC');
    }    
    
    /**
     * 전표생성
     */
    var fn_account = function() {
    	
      	var p_doc_id	= '';
        var intCnt 		= 0;
      	
      	var allList = Fig2410Grid.getGridDataAll()
		for (var i = 0; i < allList.length; i++) {
			var obj = allList[i].data;
			if(obj['CHK_YN']=='Y'){
				p_doc_id = obj['ORIGINAL_DOC_ID'];
				intCnt ++;
				
				for (var j = 0; j < jsonFig2410.length; j++) {
					var sobj = jsonFig2410[j].data;
					if(sobj['ORIGINAL_DOC_ID']==p_doc_id){
						Fig2410Grid.setCellData(j+1, 1, 'Y', true, true);
					}
				}
			}
		}
      	if(intCnt > 0){
      		fn_setFig2410S1Grid('ACCOUNT', function(){
      			cfn_search();
      		});
      	} else {
 			gfn_comAlert("E0000","전표생성하실 전표를 선택하세요");
			return;      		 
      	}
    }    
    
    /**
     * 전표생성 처리하기
     */
    const fn_setFig2410S1Grid = async function(wtype, callbackFn) {
    	
		let p_fi_org_code			= gfnma_nvl(SBUxMethod.get("SCH_FI_ORG_CODE"));
		let p_period_yyyymm			= gfnma_nvl(SBUxMethod.get("SCH_PERIOD_YYYYMM"));
    	
		if(!p_fi_org_code){
 			gfn_comAlert("E0000","사업단위를 선택하세요");
			return;      		 
		}
		
		if(!p_period_yyyymm){
 			gfn_comAlert("E0000","기간을 선택하세요");
			return;      		 
		}
		
        var strdoc_date 			= "";
        var stroriginal_doc_date 	= "";
        var strdoc_id 				= "";
        var stritem_seq 			= "";
        var strdebit_credit 		= "";
        var strsite_code 			= "";
        var strline_type 			= "";
        var stritem_source_id 		= "";
        var straccount_code 		= "";
        var strfi_org_code_d 		= "";
        var strdept_code 			= "";
        var strcost_center_code 	= "";
        var strproject_code 		= "";
        var strcurrency_code 		= "";
        var strexchange_rate 		= "";
        var stroriginal_dr_amt 		= "";
        var stroriginal_cr_amt 		= "";
        var strfunctional_dr_amt 	= "";
        var strfunctional_cr_amt 	= "";
        var stracc_item_value1 		= "";
        var stracc_item_value2 		= "";
        var stracc_item_value3 		= "";
        var stracc_item_value4 		= "";
		
      	var allList = Fig2410Grid.getGridDataAll()
		for (var i = 0; i < allList.length; i++) {
			var obj = allList[i].data;
			if(obj['CHK_YN']=='Y'){
                if (strdoc_date != "")
                {
                    strdoc_date 			+= "|";
                    stroriginal_doc_date 	+= "|";
                    strdoc_id 				+= "|";
                    stritem_seq 			+= "|";
                    strdebit_credit 		+= "|";
                    strsite_code 			+= "|";
                    strline_type 			+= "|";
                    stritem_source_id 		+= "|";
                    straccount_code 		+= "|";
                    strfi_org_code_d 		+= "|";
                    strdept_code 			+= "|";
                    strcost_center_code 	+= "|";
                    strproject_code 		+= "|";
                    strcurrency_code 		+= "|";
                    strexchange_rate 		+= "|";
                    stroriginal_dr_amt 		+= "|";
                    stroriginal_cr_amt 		+= "|";
                    strfunctional_dr_amt 	+= "|";
                    strfunctional_cr_amt 	+= "|";
                    stracc_item_value1 		+= "|";
                    stracc_item_value2 		+= "|";
                    stracc_item_value3 		+= "|";
                    stracc_item_value4 		+= "|";
                }			
                strdoc_date 			+= gfnma_getNumber(gfnma_nvl(obj["DOC_DATE"]));
                stroriginal_doc_date 	+= gfnma_getNumber(gfnma_nvl(obj["ORIGINAL_DOC_DATE"]));
                strdoc_id 				+= gfnma_nvl(obj["DOC_ID"]);
                stritem_seq 			+= gfnma_nvl(obj["ITEM_SEQ"]);
                strdebit_credit 		+= gfnma_nvl(obj["DEBIT_CREDIT"]);
                strsite_code 			+= gfnma_nvl(obj["SITE_CODE"]);
                strline_type 			+= gfnma_nvl(obj["LINE_TYPE"]);
                stritem_source_id 		+= gfnma_nvl(obj["ITEM_SOURCE_ID"]);
                straccount_code 		+= gfnma_nvl(obj["ACCOUNT_CODE"]);
                strfi_org_code_d 		+= gfnma_nvl(obj["FI_ORG_CODE"]);
                strdept_code 			+= gfnma_nvl(obj["DEPT_CODE"]);
                strcost_center_code 	+= gfnma_nvl(obj["COST_CENTER_CODE"]);
                strproject_code 		+= gfnma_nvl(obj["PROJECT_CODE"]);
                strcurrency_code 		+= gfnma_nvl(obj["CURRENCY_CODE"]);
                strexchange_rate 		+= gfnma_nvl(obj["EXCHANGE_RATE"]);
                stroriginal_dr_amt 		+= gfnma_nvl(obj["ORIGINAL_DR_AMT"]);
                stroriginal_cr_amt 		+= gfnma_nvl(obj["ORIGINAL_CR_AMT"]);
                strfunctional_dr_amt 	+= gfnma_nvl(obj["FUNCTIONAL_DR_AMT"]);
                strfunctional_cr_amt 	+= gfnma_nvl(obj["FUNCTIONAL_CR_AMT"]);
                stracc_item_value1 		+= gfnma_nvl(obj["ACC_ITEM_VALUE1"]);
                stracc_item_value2 		+= gfnma_nvl(obj["ACC_ITEM_VALUE2"]);
                stracc_item_value3 		+= gfnma_nvl(obj["ACC_ITEM_VALUE3"]);
                stracc_item_value4 		+= gfnma_nvl(obj["ACC_ITEM_VALUE4"]);
			}
		}
        
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : p_fi_org_code
			,V_P_ACCT_RULE_CODE    	: p_ss_defaultAcctRule 
			,V_P_PERIOD_YYYYMM     	: p_period_yyyymm 
			
			,V_P_DOC_DATE           : strdoc_date
			,V_P_ORIGINAL_DOC_DATE  : stroriginal_doc_date   
			,V_P_DOC_ID             : strdoc_id   
			,V_P_ITEM_SEQ           : stritem_seq   
			,V_P_DEBIT_CREDIT       : strdebit_credit   
			,V_P_SITE_CODE          : strsite_code   
			,V_P_LINE_TYPE          : strline_type   
			,V_P_ITEM_SOURCE_ID     : stritem_source_id   
			,V_P_ACCOUNT_CODE       : straccount_code   
			,V_P_FI_ORG_CODE_D      : strfi_org_code_d   
			,V_P_DEPT_CODE          : strdept_code   
			,V_P_COST_CENTER_CODE   : strcost_center_code   
			,V_P_PROJECT_CODE       : strproject_code   
			,V_P_CURRENCY_CODE      : strcurrency_code   
			,V_P_EXCHANGE_RATE      : strexchange_rate   
			,V_P_ORIGINAL_DR_AMT    : stroriginal_dr_amt   
			,V_P_ORIGINAL_CR_AMT    : stroriginal_cr_amt   
			,V_P_FUNCTIONAL_DR_AMT  : strfunctional_dr_amt   
			,V_P_FUNCTIONAL_CR_AMT  : strfunctional_cr_amt   
			,V_P_ACC_ITEM_VALUE1    : stracc_item_value1   
			,V_P_ACC_ITEM_VALUE2    : stracc_item_value2 
			,V_P_ACC_ITEM_VALUE3    : stracc_item_value3 
			,V_P_ACC_ITEM_VALUE4    : stracc_item_value4 
				   
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
	    
        const postJsonPromise = gfn_postJSON("/fi/fgl/clo/updateFig2410S1.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        		if(callbackFn){
        			callbackFn();
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
     * 전표취소
     */
    var fn_cancel = function() {
    	
      	var p_doc_id	= '';
        var intCnt 		= 0;
      	
      	var allList = Fig2410Grid.getGridDataAll()
		for (var i = 0; i < allList.length; i++) {
			var obj = allList[i].data;
			if(obj['CHK_YN']=='Y'){
				p_doc_id = obj['ORIGINAL_DOC_ID'];
				intCnt ++;
				
				for (var j = 0; j < jsonFig2410.length; j++) {
					var sobj = jsonFig2410[j].data;
					if(sobj['ORIGINAL_DOC_ID']==p_doc_id){
						Fig2410Grid.setCellData(j+1, 1, 'Y', true, true);
					}
				}
			}
		}
      	if(intCnt > 0){
      		fn_setFig2410S1Grid('CANCEL', function(){
      			cfn_search();
      		});
      	} else {
 			gfn_comAlert("E0000","전표취소하실 전표를 선택하세요");
			return;      		 
      	}
    }        
    
    /**
     * 전표조회
     */
    var fn_docQ = function() {
    	
    	if(!p_sel_row){
 			gfn_comAlert("E0000","조회하실 전표를 선택하세요");
			return;      		 
    	}
    	
        var obj = {
            	'MENU_MOVE'		: 'Y'	
            	,'DOC_ID' 		: p_sel_row['DOC_ID']
            	,'WORK_TYPE'	: 'VIEW'
            	,'target'		: 'MA_A20_030_020_150'
        }
        let json = JSON.stringify(obj);
        window.parent.cfn_openTabSearch(json);
    }        
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>