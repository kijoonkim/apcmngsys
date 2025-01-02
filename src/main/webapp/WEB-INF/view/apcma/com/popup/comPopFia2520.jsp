<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title></title>
    
    <style>
		.cu-table-selected {
		    background-color: #adddff; 
		    font-weight:bold;
		}		
    </style>
    
</head>
<body oncontextmenu="return false">
	<section id="compopfia2520">
		<div class="box box-solid">
		
			<div class="box-body" style="padding-bottom:0px">
				
				<div class="card" style="margin-bottom:10px;">
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
	
	                        <col style="width: 7%">
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                            <th scope="row" class="th_bg">사업단위</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="POP_SCH_FI_ORG_CODE" uitype="single" jsondata-ref="pop_jsonFiOrgCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>				
	                            
	                            <th scope="row" class="th_bg">사업장</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="POP_SCH_SITE_CODE" uitype="single" jsondata-ref="pop_jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>				
	                            
	                            <th scope="row" class="th_bg">취득일</th>
	                            <td colspan="3" class="td_input" >
		                            <div style="display:flex;float:left;vertical-align:middle;width:100%">
									    <sbux-datepicker
									            id="POP_SCH_ACQUIRE_DATE_FR"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>
									    <font style="padding-left:5px;padding-right:5px" >-</font>                          
									    <sbux-datepicker
									            id="POP_SCH_ACQUIRE_DATE_TO"
									            uitype="popup"
									            date-format="yyyy-mm-dd"
									            class="form-control input-sm input-sm-ast inpt_data_reqed">
									    </sbux-datepicker>                          
	                            	</div>
	                            </td>				
	                            
	                            <td rowspan="2">
	                            	<div style="width:100%;text-align:center">
										<button style="min-width:80px;margin-top:10px" class="btn btn-sm btn-outline-danger cu-btn-sch" >조회</button>
	                            	</div>
	                            </td>
	                        </tr>
	                    	<tr>
	                            <th scope="row" class="th_bg">회계기준</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="POP_SCH_ACCT_RULE_CODE" uitype="single" jsondata-ref="pop_jsonAcctRuleCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>				
	                            
	                            <th scope="row" class="th_bg">실적구분</th>
	                            <td colspan="3" class="td_input" >
	                                <sbux-select id="POP_SCH_ACTUAL_FLAG_P" uitype="single" jsondata-ref="pop_jsonActualFlagP" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>				
	                            
	                            <th scope="row" class="th_bg"></th>
	                            <td colspan="3" class="td_input" >
	                            </td>				
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	                            
				<div id="compopfia2520Grid" class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
				</div>
				
                <div style="text-align:right;vertical-align:middle;width:100%">
					<button style="min-width:80px;margin-top:10px" class="btn btn-sm btn-outline-danger cu-btn-ok" >자산일괄등록</button>
					<font style="padding-right:5px"></font>
					<button style="min-width:80px;margin-top:10px" class="btn btn-sm btn-outline-danger cu-btn-cancel" >취소</button>
               	</div>
				
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script >
 
//grid Mast 초기화
var PopFia2520Grid; 			// 그리드를 담기위한 객체 선언
var jsonPopFia2520 = []; 		// 그리드의 참조 데이터 주소 선언
 
var pop_jsonFiOrgCode		= [];	// 사업단위
var pop_jsonSiteCode		= [];	// 사업장
var pop_jsonAcctRuleCode	= [];	// 회계기준
var pop_jsonActualFlagP		= [];	// 실적구분
var pop_jsonAcquireType		= [];	// 취득구분
 
/**
 * @description 복수코드
 */
function compopfia2520(options) {
	
	// id 선언
	var modalId  	= '#compopfia2520';
	var modalDivId 	= 'modal-compopfia2520';
	
	var settings = {
		height					: null
		,param					: null
		,callbackEvent			: null
		,cancelEvent			: null
	};
	$.extend(settings, options);	
 
	//css
	$('#' + modalDivId).find('.sbux-mol-hd-close').css({'font-size':'30px','margin-top':'-20px'});
	if(settings.width){
	 	$(modalId).closest('.sbux-mol-md-dlg').css('width', settings.width);
	}
	if(settings.height){
	 	$(modalId).find('.cu-table-div').css('height', settings.height);
	}	
 
	const fn_initPopFia2520 = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['POP_SCH_FI_ORG_CODE'],		pop_jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'ACNTG_OGNZ_CD', 'ACNTG_OGNZ_NM', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['POP_SCH_SITE_CODE'],		pop_jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['POP_SCH_ACCT_RULE_CODE'],	pop_jsonAcctRuleCode,	'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 실적구분
            gfnma_setComSelect(['POP_SCH_ACTUAL_FLAG_P'],	pop_jsonActualFlagP,	'L_FIA020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 실적구분
            gfnma_setComSelect([''],						pop_jsonAcquireType,	'L_FIA007', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
		]);
		
	}
	
	async function fn_init() {
  		await fn_initPopFia2520();
  		
  		SBUxMethod.refresh('POP_SCH_ACQUIRE_DATE_FR');
  		SBUxMethod.refresh('POP_SCH_ACQUIRE_DATE_TO');
  		
  		SBUxMethod.set('POP_SCH_FI_ORG_CODE',	p_ss_fiOrgCode);
  		SBUxMethod.set('POP_SCH_SITE_CODE',		p_ss_siteCode);
 
  		if(settings.param){
  			if(settings.param.p_sch_acquire_date_fr){
  		  		SBUxMethod.set('POP_SCH_ACQUIRE_DATE_FR',	settings.param.p_sch_acquire_date_fr);
  			}
  			if(settings.param.p_sch_acquire_date_to){
  		  		SBUxMethod.set('POP_SCH_ACQUIRE_DATE_TO',	settings.param.p_sch_acquire_date_to);
  			}
  			if(settings.param.p_sch_fi_org_code){
  		  		SBUxMethod.set('POP_SCH_FI_ORG_CODE',		settings.param.p_sch_fi_org_code);
  			}
  			if(settings.param.p_sch_acct_rule_code){
  		  		SBUxMethod.set('POP_SCH_ACCT_RULE_CODE',	settings.param.p_sch_acct_rule_code);
  			}
  			if(settings.param.p_sch_actual_flag_p){
  		  		SBUxMethod.set('POP_SCH_ACTUAL_FLAG_P',		settings.param.p_sch_actual_flag_p);
  			}
  		}
  	    fn_createGrid();	
	}
	
	fn_init();
	
    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'compopfia2520Grid';
	    SBGridProperties.id 				= 'PopFia2520Grid';
	    SBGridProperties.jsonref 			= 'jsonPopFia2520';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [""], 					ref: 'CHECK_YN', 				type:'checkbox', 	width: '70px', 		style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["소스타입"],				ref: 'SOURCE_TYPE',				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["소스명"], 				ref: 'SOURCE_NAME',    			type:'input',  		width:'250px',  	style:'text-align:left'},
            
            {caption: ["회계기준"],				ref: 'ACCT_RULE_CODE', 			type:'combo',  		width:'100px',  	style:'text-align:left', disabled: false,
            	typeinfo: {
					ref			: 'pop_jsonAcctRuleCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },

            {caption: ["전표번호"],    			ref: 'DOC_NAME', 				type:'input',  		width:'150px',  	style:'text-align:left'},
            
            {caption: ["사업장"],				ref: 'SITE_CODE', 				type:'combo',  		width:'200px',  	style:'text-align:left', disabled: false,
            	typeinfo: {
					ref			: 'pop_jsonSiteCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },
            
         	{caption: ['취득일'],       		ref: 'ACQUIRE_DATE',      		type:'datepicker',	width:'100px',   	style:'text-align:left',	typeinfo : {dateformat :"yyyy-mm-dd", displayui:true}},
            
            {caption: ["거래처코드"], 			ref: 'CS_CODE',		 			type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: [''], 					ref: 'btn1',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_popFia2520_gridPopup1(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["거래처명"], 			ref: 'CS_NAME',		 			type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["부서코드"],				ref: 'DEPT_CODE',				type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: [''], 					ref: 'btn2',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_popFia2520_gridPopup2(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["부서"],	   				ref: 'DEPT_NAME',				type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["원가중심코드"],			ref: 'COST_CENTER_CODE',		type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: [''], 					ref: 'btn3',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_popFia2520_gridPopup3(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["원가중심점"],			ref: 'COST_CENTER_NAME',		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["취득구분"],				ref: 'ACQUIRE_TYPE', 			type:'combo',  		width:'100px',  	style:'text-align:left', disabled: false,
            	typeinfo: {
					ref			: 'pop_jsonAcquireType',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },
            
            {caption: ["자산번호"],				ref: 'ASSET_NO',				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: [''], 					ref: 'btn4',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_popFia2520_gridPopup4(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["자산명"],				ref: 'ASSET_NAME',				type:'output',  	width:'200px',  	style:'text-align:left'},
            
         	{caption: ['최초감가상각년월'],     ref: 'DEPRECIATE_START_YYYYMM', 		type:'datepicker',	width:'100px',   	style:'text-align:left',	typeinfo : {dateformat :"yyyy-mm", calendartype :"yearmonth", displayui:true}},
         	{caption: ['최초감가율(IFRS)'],     ref: 'DEPRECIATE_START_YYYYMM_IFRS', 	type:'datepicker',	width:'100px',   	style:'text-align:left',	typeinfo : {dateformat :"yyyy-mm", calendartype :"yearmonth", displayui:true}},
            
            {caption: ["수량"],					ref: 'ASSET_QTY',				type:'input',  		width:'100px',  	style:'text-align:left'},
            
            {caption: ["자산구분"],				ref: 'ASSET_CATEGORY',			type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: [''], 					ref: 'btn5',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_popFia2520_gridPopup5(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["자산구분명"],			ref: 'ASSET_CATEGORY_NAME',		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["중분류"],	   			ref: 'ASSET_LEVEL2', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: [''], 					ref: 'btn6',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_popFia2520_gridPopup6(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["중분류명"],	   			ref: 'ASSET_LEVEL2_NAME',		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["소분류"],				ref: 'ASSET_LEVEL3', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: [''], 					ref: 'btn7',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_popFia2520_gridPopup7(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["소분류명"],				ref: 'ASSET_LEVEL3_NAME', 		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["설비번호"],				ref: 'EQUIPMENT_NO', 			type:'input',  		width:'100px',  	style:'text-align:left'},
            
            {caption: ["위치코드"],				ref: 'LOCATION_CODE',	 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: [''], 					ref: 'btn8',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_popFia2520_gridPopup8(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["위치명"],				ref: 'LOCATION_NAME',	 		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["계정코드"],				ref: 'ACCOUNT_CODE',	 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["계정명"],				ref: 'ACCOUNT_NAME', 			type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["프로젝트코드"],			ref: 'PROJECT_CODE',	 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: [''], 					ref: 'btn9',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_popFia2520_gridPopup9(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["프로젝트명"],			ref: 'PROJECT_NAME',	 		type:'output',  	width:'200px',  	style:'text-align:left'},
            
            {caption: ["담당자"],				ref: 'EMP_NAME',		 		type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["통화"],					ref: 'CURRENCY_CODE',	 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"],					ref: 'EXCHANGE_RATE',	 		type:'output',  	width:'100px',  	style:'text-align:left'},
            
            {caption: ["통화금액"],				ref: 'ORIGINAL_AMOUNT',	 		type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            {caption: ["전표금액"],				ref: 'FUNCTIONAL_AMOUNT',		type:'output',  	width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["부가세유형"],			ref: 'VAT_TYPE',		 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: [''], 					ref: 'btn10',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_popFia2520_gridPopup10(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            
            {caption: ["부가세"],				ref: 'VAT_AMOUNT',		 		type:'input',  		width:'100px',  	style:'text-align:right', format : {type:'number', rule:'#,###'}},
            
            {caption: ["비고"],					ref: 'MEMO',			 		type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["취득수량"],				ref: 'QTY',				 		type:'input',  		width:'100px',  	style:'text-align:left'},
        ];
        
        PopFia2520Grid = _SBGrid.create(SBGridProperties);
        //PopFia2520Grid.bind('click', 'fn_viewGrid');
    }	
    
    const fn_setPopFia2520Grid = async function(wtype) {
 
		PopFia2520Grid.clearStatus();
 
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : gfnma_nvl(SBUxMethod.get('POP_SCH_FI_ORG_CODE'))
			,V_P_ACCT_RULE_CODE	   	: gfnma_nvl(SBUxMethod.get('POP_SCH_ACCT_RULE_CODE'))
			,V_P_SITE_CODE 	    	: gfnma_nvl(SBUxMethod.get('POP_SCH_SITE_CODE'))
			,V_P_ACTUAL_FLAG 	    : gfnma_nvl(SBUxMethod.get('POP_SCH_ACTUAL_FLAG_P'))
			,V_P_ACQUIRE_DATE_FR 	: gfnma_nvl(SBUxMethod.get('POP_SCH_ACQUIRE_DATE_FR'))
			,V_P_ACQUIRE_DATE_TO 	: gfnma_nvl(SBUxMethod.get('POP_SCH_ACQUIRE_DATE_TO'))
 
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectFia2520List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '1',
        	params				: gfnma_objectToString(paramObj, true)
		});
 
        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {
 
  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;
 
  	        	jsonPopFia2520.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						CHECK_YN						: 'N',
  						ACCOUNT_CODE					: gfn_nvl(item.ACNTL_CD),
  						ACCOUNT_NAME					: gfn_nvl(item.ACNT_NM),
  						ACCT_RULE_CODE					: gfn_nvl(item.GAAP_CD),
  						ACCUM_DEPR_ACC					: gfn_nvl(item.ACML_DPRC_ACNT),
  						ACCUM_DEPR_ACC_NAME				: gfn_nvl(item.ACCUM_DEPR_ACC_NAME),
  						ACQUIRE_DATE					: gfn_nvl(item.ACQS_FRST_YMD),
  						ACQUIRE_TYPE					: gfn_nvl(item.ACQS_TYPE),
  						ACTUAL_FLAG						: gfn_nvl(item.ACTL_FLAG),
  						ASSET_ACCOUNT					: gfn_nvl(item.ASST_ACNT_CD),
  						ASSET_ACCOUNT_NAME				: gfn_nvl(item.ASSET_ACCOUNT_NAME),
  						ASSET_CATEGORY					: gfn_nvl(item.ASST_CTGRY),
  						ASSET_CATEGORY_NAME				: gfn_nvl(item.ASSET_CATEGORY_NAME),
  						ASSET_LEVEL2					: gfn_nvl(item.ASST_MCLSF),
  						ASSET_LEVEL2_NAME				: gfn_nvl(item.ASSET_LEVEL2_NAME),
  						ASSET_LEVEL3					: gfn_nvl(item.ASST_SCLSF),
  						ASSET_LEVEL3_NAME				: gfn_nvl(item.ASSET_LEVEL3_NAME),
  						ASSET_NAME						: gfn_nvl(item.ASST_NM),
  						ASSET_NO						: gfn_nvl(item.ASST_NO),
  						ASSET_PRICE						: gfn_nvl(item.AST_UNTPRC),
  						ASSET_QTY						: gfn_nvl(item.AST_DSPSL_QTY),
  						ASSET_SPEC						: gfn_nvl(item.AST_SPCFCT),
  						CHK_YN							: gfn_nvl(item.CHK_YN),
  						COMP_CODE						: gfn_nvl(item.CO_CD),
  						COST_CENTER_CODE				: gfn_nvl(item.CSTCD_CD),
  						COST_CENTER_NAME				: gfn_nvl(item.CSTCD_NM),
  						CS_CODE							: gfn_nvl(item.CNPT_CD),
  						CS_NAME							: gfn_nvl(item.CNPT_NM),
  						CURRENCY_CODE					: gfn_nvl(item.CRN_CD),
  						DEPRECIATE_START_YYYYMM			: gfn_nvl(item.DPRC_BGNG_YM),
  						DEPRECIATE_START_YYYYMM_IFRS	: gfn_nvl(item.DPRC_BGNG_YM_IFRS),
  						
  						DEPRECIATE_YN					: gfn_nvl(item.DPRC_YN),
  						DEPRECIATION_METHOD_GAAP		: gfn_nvl(item.DPRC_MTHD_GAAP),
  						DEPRECIATION_METHOD_IFRS		: gfn_nvl(item.DPRC_MTHD_IFRS),
  						DEPRECIATION_METHOD_TAX			: gfn_nvl(item.DPRC_MTHD_TAX),
  						DEPRECIATION_PERIOD_GAAP		: gfn_nvl(item.DPRC_PRD_GAAP),
  						DEPRECIATION_PERIOD_IFRS		: gfn_nvl(item.DPRC_PRD_IFRS),
  						DEPRECIATION_PERIOD_TAX			: gfn_nvl(item.DPRC_PRD_TAX),
  						
  						DEPR_EXP_ACC					: gfn_nvl(item.DPCO_ACNT),
  						DEPR_EXP_ACC_NAME				: gfn_nvl(item.DEPR_EXP_ACC_NAME),
  						DEPT_CODE						: gfn_nvl(item.DEPT_CD),
  						DEPT_NAME						: gfn_nvl(item.DEPT_NM),
  						DOC_ID							: gfn_nvl(item.SLIP_ID),
  						DOC_NAME						: gfn_nvl(item.SLIP_NM),
  						EMP_CODE						: gfn_nvl(item.EMP_CD),
  						EMP_NAME						: gfn_nvl(item.EMP_NM),
  						EQUIPMENT_NO					: gfn_nvl(item.EQPMNT_NO),
  						EXCHANGE_RATE					: gfn_nvl(item.EXCHRT),
  						FI_ORG_CODE						: gfn_nvl(item.ACNTG_OGNZ_CD),
  						FUNCTIONAL_AMOUNT				: gfn_nvl(item.CNVS_AMT),
  						INVOICE_ID						: gfn_nvl(item.SLIP_ID),
  						INVOICE_SEQ						: gfn_nvl(item.SLIP_SEQ),
  						ITEM_ID							: gfn_nvl(item.ITEM_ID),
  						LOCATION_CODE					: gfn_nvl(item.LOCTN_CD),
  						LOCATION_NAME					: gfn_nvl(item.LOCTN_NM),
  						MEMO							: gfn_nvl(item.MEMO),
  						MEMO							: gfn_nvl(item.MEMO),
  						ORIGINAL_AMOUNT					: gfn_nvl(item.ORGNL_AMT),
  						PROJECT_CODE					: gfn_nvl(item.PJT_CD),
  						PROJECT_NAME					: gfn_nvl(item.PJT_NM),
  						QTY								: gfn_nvl(item.QTY),
  						SALVAGE_RATE_GAAP				: gfn_nvl(item.RMN_RT_GAAP),
  						SALVAGE_RATE_IFRS				: gfn_nvl(item.RMN_RT_IFRS),
  						SALVAGE_RATE_TAX				: gfn_nvl(item.RMN_RT_TAX),
  						SALVAGE_VALUE_GAAP				: gfn_nvl(item.RMN_AMT_GAAP),
  						SALVAGE_VALUE_IFRS				: gfn_nvl(item.RMN_AMT_IFRS),
  						SALVAGE_VALUE_TAX				: gfn_nvl(item.RMN_AMT_TAX),
  						SITE_CODE						: gfn_nvl(item.SITE_CD),
  						SOURCE_NAME						: gfn_nvl(item.SRC_NM),
  						SOURCE_TYPE						: gfn_nvl(item.SRC_TYPE),
  						SUBSIDIES_ACCOUNT				: gfn_nvl(item.GVSBS_ACNT),
  						SUBSIDIES_ACCUM_DEPR_ACC		: gfn_nvl(item.GVSBS_DPRC_AT_ACNT),
  						SUBSIDIES_ACCUM_DEPR_ACC_NAME	: gfn_nvl(item.SUBSIDIES_ACCUM_DEPR_ACC_NAME),
  						SUBSIDIES_ACC_NAME				: gfn_nvl(item.SUBSIDIES_ACC_NAME),
  						SUBSIDIES_DEPR_ACC				: gfn_nvl(item.GVSBS_DPCO_ACNT),
  						SUBSIDIES_DEPR_ACC_NAME			: gfn_nvl(item.SUBSIDIES_DEPR_ACC_NAME),
  						UNIT_CODE						: gfn_nvl(item.UNIT_CD),
  						USEFUL_LIFE_GAAP				: gfn_nvl(item.SVLF_GAAP),
  						USEFUL_LIFE_IFRS				: gfn_nvl(item.SVLF_IFRS),
  						USEFUL_LIFE_TAX					: gfn_nvl(item.SVLF_TAX),
  						VAT_AMOUNT						: gfn_nvl(item.VAT_AMT),
  						VAT_TYPE						: gfn_nvl(item.VAT_TYPE),
  					}
  					jsonPopFia2520.push(msg);
  					totalRecordCount ++;
  				});
 
        		PopFia2520Grid.rebuild();
  	        	//document.querySelector('#listCount1').innerText = totalRecordCount;
  	        	
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
    
    //자산일괄등록
   	const fn_okProcess = async function() {
    	
    	let allDatas = PopFia2520Grid.getOrgGridDataAll()
    	if(allDatas.length < 0){
    		return;
    	}
    	
    	for (var i = 0; i < allDatas.length; i++) {
    		var obj = allDatas[i];
    		if(obj['ASSET_CATEGORY']=="" || obj['ASSET_CATEGORY_NAME']==""){
        		gfn_comAlert("E0000",	"자산구분, 자산구분명은 필수 입력입니다.");
        		return;
    		}
    		if(obj['ASSET_LEVEL2']=="" || obj['ASSET_LEVEL2_NAME']==""){
        		gfn_comAlert("E0000",	"중분류, 중분류명은 필수 입력입니다.");
        		return;
    		}
    		if(obj['ASSET_LEVEL3']=="" || obj['ASSET_LEVEL3_NAME']==""){
        		gfn_comAlert("E0000",	"소분류, 소분류명은 필수 입력입니다.");
        		return;
    		}
    		if(obj['DEPT_CODE']=="" || obj['DEPT_NAME']==""){
        		gfn_comAlert("E0000",	"부서코드, 부서명은 필수 입력입니다.");
        		return;
    		}
    		if(obj['COST_CENTER_CODE']=="" || obj['COST_CENTER_NAME']==""){
        		gfn_comAlert("E0000",	"원가중심점코드, 원가중심점명은 필수 입력입니다.");
        		return;
    		}
    		if(obj['ACQUIRE_TYPE']==""){
        		gfn_comAlert("E0000",	"취득구분은 필수 입력입니다.");
        		return;
    		}
    		if(obj['ASSET_NAME']==""){
        		gfn_comAlert("E0000",	"자산명은 필수 입력입니다.");
        		return;
    		}
    		if(obj['ASSET_QTY']==""){
        		gfn_comAlert("E0000",	"수량은 필수 입력입니다.");
        		return;
    		}
    		if(obj['ACQUIRE_TYPE']=="CE" && obj['ASSET_NO']==""){
        		gfn_comAlert("E0000",	"자본적지출의 경우 자산번호는 필수입력항목입니다.");
        		return;
    		}
		}
    	
 		if(confirm("일괄등록 하시겠습니까?")){
 		}else{
 			return;
 		}		
    	
    	await fn_ProcessFia2520S('N');
    	await fn_setPopFia2520Grid('Q');
    }
    
    /**
     * 자산일괄등록 - 처리
     */
     const fn_ProcessFia2520S = async function(wType){
    	
		let p_pop_sch_actual_flag_p			= gfnma_nvl(SBUxMethod.get("POP_SCH_ACTUAL_FLAG_P"));
    	
    	 var chkList = PopFia2520Grid.getOrgGridDataAll();
    	 console.log('---->> grid all');
    	 console.log(chkList);
    	 
    	 //서버 전송 리스트
    	 let listData 	= [];
    	 let workt		= ""; 
    	 for (var i = 0; i < chkList.length; i++) {
 			var obj = chkList[i];
 			if(!gfnma_nvl(obj.CHECK_YN) || gfnma_nvl(obj.CHECK_YN)=='N'){
 				continue;
 			}
    	 	const param = {
    	 			cv_count	: '0',
    	 			getType		: 'json',
    	 			rownum		: chkList[i].rownum,
    	 			workType	: wType,
    	 			params		: gfnma_objectToString({
    	 				V_P_DEBUG_MODE_YN			: ''
    	 				,V_P_LANG_ID				: ''
    	 				,V_P_COMP_CODE				: gfnma_nvl(gv_ma_selectedCorpCd)
    	 				,V_P_CLIENT_CODE			: gfnma_nvl(gv_ma_selectedClntCd)
    	 				
						,V_P_ACCT_RULE_CODE     		: gfnma_nvl(obj.ACCT_RULE_CODE)
						,V_P_SITE_CODE         			: gfnma_nvl(obj.SITE_CODE)
						,V_P_ACTUAL_FLAG        		: gfnma_nvl(p_pop_sch_actual_flag_p)
						,IV_P_ASSET_ACQUIRE_NO 			: ''
						,IV_P_ASSET_NO         			: gfnma_nvl(obj.ASSET_NO)
						,V_P_ACQUIRE_DATE      			: gfnma_nvl(obj.ACQUIRE_DATE)
						,V_P_ACQUIRE_TYPE      			: gfnma_nvl(obj.ACQUIRE_TYPE)
						,V_P_CS_CODE           			: gfnma_nvl(obj.CS_CODE)
						,V_P_ASSET_CATEGORY    			: gfnma_nvl(obj.ASSET_CATEGORY)
						,V_P_ASSET_LEVEL2      			: gfnma_nvl(obj.ASSET_LEVEL2)
						,V_P_ASSET_LEVEL3      			: gfnma_nvl(obj.ASSET_LEVEL3)
						,V_P_DEPT_CODE         			: gfnma_nvl(obj.DEPT_CODE)
						,V_P_EMP_CODE          			: gfnma_nvl(obj.EMP_CODE)
						,V_P_COST_CENTER_CODE  			: gfnma_nvl(obj.COST_CENTER_CODE)
						,V_P_PROJECT_CODE      			: gfnma_nvl(obj.PROJECT_CODE)
						,V_P_ACCOUNT_CODE      			: gfnma_nvl(obj.ACCOUNT_CODE)
						,V_P_TAX_SITE_CODE     			: gfnma_nvl(obj.SITE_CODE)
						,V_P_VAT_TYPE          			: gfnma_nvl(obj.VAT_TYPE)
						,V_P_VAT_RATE          			: '0'
						,V_P_CURRENCY_CODE     			: gfnma_nvl(obj.CURRENCY_CODE)
						,V_P_EXCHANGE_RATE     			: gfnma_nvl(obj.EXCHANGE_RATE)
						,V_P_ORIGINAL_AMOUNT   			: gfnma_nvl(obj.ORIGINAL_AMOUNT)
						,V_P_VAT_AMOUNT        			: gfnma_nvl(obj.VAT_AMOUNT)
						,V_P_FUNCTIONAL_AMOUNT 			: gfnma_nvl(obj.FUNCTIONAL_AMOUNT)
						,V_P_MEMO              			: gfnma_nvl(obj.MEMO)
						,V_P_INVOICE_ID        			: gfnma_nvl(obj.INVOICE_ID)
						,V_P_INVOICE_SEQ       			: gfnma_nvl(obj.INVOICE_SEQ)
						,V_P_SOURCE_TYPE       			: gfnma_nvl(obj.SOURCE_TYPE)
						,V_P_ACQUIRE_SEQ       			: '1'
						,V_P_ASSET_NAME        			: gfnma_nvl(obj.ASSET_NAME)
						,V_P_ASSET_SPEC        			: ''
						,V_P_ASSET_QTY           		: ( !gfnma_nvl(obj.QTY) ) ? '0' : gfnma_nvl(obj.QTY)
						,V_P_UNIT_CODE         			: gfnma_nvl(obj.UNIT_CODE)
						,V_P_ASSET_PRICE       			: ( !gfnma_nvl(obj.ASSET_PRICE) ) ? '0' : gfnma_nvl(obj.ASSET_PRICE)
						,V_P_LOCATION_CODE          	: gfnma_nvl(obj.LOCATION_CODE)       
						,V_P_DEPRECIATE_YN            	: gfnma_nvl(obj.DEPRECIATE_YN)     
						,V_P_ASSET_ACCOUNT            	: gfnma_nvl(obj.ASSET_ACCOUNT)     
						,V_P_DEPR_EXP_ACC              	: gfnma_nvl(obj.DEPR_EXP_ACC)    
						,V_P_ACCUM_DEPR_ACC      		: gfnma_nvl(obj.ACCUM_DEPR_ACC)
						,V_P_SUBSIDIES_ACCOUNT        	: gfnma_nvl(obj.SUBSIDIES_ACCOUNT)     
						,V_P_SUBSIDIES_DEPR_ACC      	: gfnma_nvl(obj.SUBSIDIES_DEPR_ACC)      
						,V_P_SUBSIDIES_ACCUM_DEPR_ACC 	: gfnma_nvl(obj.SUBSIDIES_ACCUM_DEPR_ACC)     
						,V_P_USEFUL_LIFE_GAAP         	: gfnma_nvl(obj.USEFUL_LIFE_GAAP)     
						,V_P_USEFUL_LIFE_IFRS         	: gfnma_nvl(obj.USEFUL_LIFE_IFRS)     
						,V_P_USEFUL_LIFE_TAX          	: gfnma_nvl(obj.USEFUL_LIFE_TAX)     
						,V_P_SALVAGE_RATE_GAAP        	: gfnma_nvl(obj.SALVAGE_RATE_GAAP)     
						,V_P_SALVAGE_RATE_IFRS        	: gfnma_nvl(obj.SALVAGE_RATE_IFRS)     
						,V_P_SALVAGE_RATE_TAX         	: gfnma_nvl(obj.SALVAGE_RATE_TAX)     
						,V_P_SALVAGE_VALUE_GAAP       	: gfnma_nvl(obj.SALVAGE_VALUE_GAAP)     
						,V_P_SALVAGE_VALUE_IFRS        	: gfnma_nvl(obj.SALVAGE_VALUE_IFRS)    
						,V_P_SALVAGE_VALUE_TAX        	: gfnma_nvl(obj.SALVAGE_VALUE_TAX)     
						,V_P_DEPRECIATION_METHOD_GAAP 	: gfnma_nvl(obj.DEPRECIATION_METHOD_GAAP)     
						,V_P_DEPRECIATION_METHOD_IFRS 	: gfnma_nvl(obj.DEPRECIATION_METHOD_IFRS)     
						,V_P_DEPRECIATION_METHOD_TAX   	: gfnma_nvl(obj.DEPRECIATION_METHOD_TAX)    
						,V_P_DEPRECIATION_PERIOD_GAAP 	: gfnma_nvl(obj.DEPRECIATION_PERIOD_GAAP)     
						,V_P_DEPRECIATION_PERIOD_IFRS  	: gfnma_nvl(obj.DEPRECIATION_PERIOD_IFRS)    
						,V_P_DEPRECIATION_PERIOD_TAX  	: gfnma_nvl(obj.DEPRECIATION_PERIOD_TAX)     
						,V_P_DEPRECIATE_START_YYYYMM   	: gfnma_nvl(obj.DEPRECIATE_START_YYYYMM)    
						,V_P_DEPREC_START_YYYYMM_IFRS  	: gfnma_nvl(obj.DEPRECIATE_START_YYYYMM_IFRS)    
						,V_P_EQUIPMENT_NO              	: gfnma_nvl(obj.EQUIPMENT_NO)    
    	 				
    	 				,V_P_FORM_ID				: gfnma_nvl(p_formId)
    	 				,V_P_MENU_ID				: gfnma_nvl(p_menuId)
    	 				,V_P_PROC_ID				: ''
    	 				,V_P_USERID					: ''
    	 				,V_P_PC						: ''
    	 			})
    	 		}			
    	 	listData.push(param);
    	 }	
 
    	 if(listData.length > 0) {
    	 	const postJsonPromise = gfn_postJSON("/fi/ffa/alm/batchFia2520S.do", {listData: listData});
 
    	 	const data = await postJsonPromise;
    	 	console.log('data:', data);
    	 	try {
    	 		if (_.isEqual("S", data.resultStatus)) {
    	 			gfn_comAlert("I0001");
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
    	 } else {
     		gfn_comAlert("E0000",	"일괄등록 하실 내용이 없습니다.");
 			return;
    	 }       	
    }    
    
    
    //조회
	$(modalId).find('.cu-btn-sch').off('click');
	$(modalId).find('.cu-btn-sch').click(function(){
		fn_setPopFia2520Grid('Q');
	});	
    
    //확인
	$(modalId).find('.cu-btn-ok').off('click');
	$(modalId).find('.cu-btn-ok').click(function(){
		fn_okProcess();
	});	
	
	//close event
	$(modalId).find('.cu-btn-cancel').off('click');
	$(modalId).find('.cu-btn-cancel').click(function(){
 		if(settings.cancelEvent){
 			settings.cancelEvent();
 		}
	 	SBUxMethod.closeModal(modalDivId);
	});	
	
}
 
/**
 * 그리드내 팝업(거래처) 조회
 */
function fn_popFia2520_gridPopup1(event, row, col) {
	event.stopPropagation();	
    let cellData1 = PopFia2520Grid.getCellData(row, 7) 
    let cellData2 = PopFia2520Grid.getCellData(row, 9) 
	fn_popFia2520_compopup1(row, col, cellData1, cellData2);
}
 
/**
 * 그리드내 공통팝업(거래처) 오픈
 */
var fn_popFia2520_compopup1 = function(row, col, cellData1, cellData2) {
	
    var replaceText0 	= "_CNPT_CD_";
    var replaceText1 	= "_CNPT_NM_";
    var replaceText2 	= "_BRNO_";
    var strWhereClause 	= "AND a.CNPT_CD LIKE '%" + replaceText0 + "%' AND a.CNPT_NM LIKE '%" + replaceText1 + "%' AND a.BRNO LIKE '%"+ replaceText2 + "%'";
 
	SBUxMethod.attr('modal-compopup1', 'header-title', '거래처정보');
	compopup1({
        compCode				: gv_ma_selectedCorpCd
        ,clientCode				: gv_ma_selectedClntCd
        ,bizcompId				: 'P_COM004'
        ,popupType				: 'A'
        ,whereClause			: strWhereClause
        ,searchCaptions			: ["거래처코드", 	"거래처명",  	"사업자번호" ]
        ,searchInputFields		: ["CNPT_CD", 		"CNPT_NM",  	"BRNO"]
        ,searchInputValues		: [cellData1, 		cellData2, 	""         ]
        ,height					: '400px'
        ,width					: '1000px'
        ,tableHeader			: ["거래처코드",	"거래처명", 	"사업자번호" , 	"대표자",		"업태",			"종목",			"주소",		"전화",		"팩스"]
        ,tableColumnNames		: ["CNPT_CD", 		"CNPT_NM", 		"BRNO", 	"CEO_NM",	"BZSTAT",	"TPBIZ",	"ADDR",	"TELNO",		"FX_NO"]
        ,tableColumnWidths		: ["100px", 		"200px", 		"100px", 		"100px",		"100px",		"150px",		"400px",	"120px",	"120px"]
		,itemSelectEvent		: function (data){
			console.log('callback data:', data);
			//그리드내 원하는 위치에 값 셋팅하기
			PopFia2520Grid.setCellData(row, 7, data['CNPT_CD'], true, true);
			PopFia2520Grid.setCellData(row, 9, data['CNPT_NM'], true, true);
		},
	});
	SBUxMethod.openModal('modal-compopup1');
}        
 
/**
 * 그리드내 팝업(부서) 조회
 */
function fn_popFia2520_gridPopup2(event, row, col) {
	event.stopPropagation();	
    let cellData1 = PopFia2520Grid.getCellData(row, 10) 
    let cellData2 = PopFia2520Grid.getCellData(row, 12) 
	fn_popFia2520_compopup2(row, col, cellData1, cellData2);
}
 
/**
 * 그리드내 공통팝업(부서) 오픈
 */
var fn_popFia2520_compopup2 = function(row, col, cellData1, cellData2) {
	
    var param	= null;
    
	SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
	compopup1({
        compCode				: gv_ma_selectedCorpCd
        ,clientCode				: gv_ma_selectedClntCd
        ,bizcompId				: 'P_FI_DEPT'
        ,popupType				: 'B'
   		,whereClause			: param
        ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
        ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
        ,searchInputValues		: [cellData1, 		cellData2,	""]
        ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
        ,width					: '500px'
        ,height					: '400px'
        ,tableHeader			: ["부서코드",		"부서명" 		]
        ,tableColumnNames		: ["DEPT_CD",		"DEPT_NM"  	]
        ,tableColumnWidths		: ["100px", 		"200px" 		]
		,itemSelectEvent		: function (data){
			console.log('callback data:', data);
			//그리드내 원하는 위치에 값 셋팅하기
			PopFia2520Grid.setCellData(row, 10,	data['DEPT_CD'], true, true);
			PopFia2520Grid.setCellData(row, 12,	data['DEPT_NM'], true, true);
		},
	});
	SBUxMethod.openModal('modal-compopup1');
}        
 
/**
 * 그리드내 팝업(원가중심코드) 조회
 */
function fn_popFia2520_gridPopup3(event, row, col) {
	event.stopPropagation();	
    let cellData1 = PopFia2520Grid.getCellData(row, 13) 
    let cellData2 = PopFia2520Grid.getCellData(row, 15) 
	fn_popFia2520_compopup3(row, col, cellData1, cellData2);
}
 
/**
 * 그리드내 공통팝업(원가중심코드) 오픈
 */
var fn_popFia2520_compopup3 = function(row, col, cellData1, cellData2) {
	
    var replaceText0 	= "_CSTCD_CD_";
    var replaceText1 	= "_CSTCD_NM_";
    var strWhereClause 	= "AND X.CSTCD_CD LIKE '%" + replaceText0 + "%' AND X.CSTCD_NM LIKE '%" + replaceText1 + "%'";
    
	SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
	compopup1({
		compCode				: gv_ma_selectedCorpCd
		,clientCode				: gv_ma_selectedClntCd
		,bizcompId				: 'P_COST_CENTER'
    	,popupType				: 'A'
		,whereClause			: strWhereClause
		,searchCaptions			: ["코드", 				"명칭"]
		,searchInputFields		: ["CSTCD_CD", 	"CSTCD_NM"]
		,searchInputValues		: [cellData1, 			cellData2]
		,height					: '400px'
		,tableHeader			: ["코스트센터코드", 	"코스트센터명"]
		,tableColumnNames		: ["CSTCD_CD", 	"CSTCD_NM"]
		,tableColumnWidths		: ["80px", 	"80px"]
		,itemSelectEvent		: function (data){
			console.log('callback data:', data);
			//그리드내 원하는 위치에 값 셋팅하기
			PopFia2520Grid.setCellData(row, 13,	data['CSTCD_CD'], true, true);
			PopFia2520Grid.setCellData(row, 15,	data['CSTCD_NM'], true, true);
		},
	});
	SBUxMethod.openModal('modal-compopup1');
}        
 
/**
 * 그리드내 팝업(자산번호) 조회
 */
function fn_popFia2520_gridPopup4(event, row, col) {
	event.stopPropagation();	
    let cellData1 = PopFia2520Grid.getCellData(row, 17) 
    let cellData2 = PopFia2520Grid.getCellData(row, 19) 
	fn_popFia2520_compopup4(row, col, cellData1, cellData2);
}
 
/**
 * 그리드내 공통팝업(자산번호) 오픈
 */
var fn_popFia2520_compopup4 = function(row, col, cellData1, cellData2) {
	
    var replaceText0 	= "_ASST_NO_";
    var replaceText1 	= "_ASST_NM_";
    var strWhereClause 	= "AND A.ASST_NO LIKE '%" + replaceText0 + "%' AND A.ASST_NM LIKE '%" + replaceText1 + "%'";
    
	SBUxMethod.attr('modal-compopup1', 'header-title', '자산정보');
	compopup1({
		compCode				: gv_ma_selectedCorpCd
		,clientCode				: gv_ma_selectedClntCd
		,bizcompId				: 'P_ASSET_LIST'
    	,popupType				: 'A'
		,whereClause			: strWhereClause
		,searchCaptions			: ["번호", 			"명칭"]
		,searchInputFields		: ["ASST_NO", 		"ASST_NM"]
		,searchInputValues		: [cellData1, 		cellData2]
		,height					: '400px'
		,tableHeader			: ["자산번호", 		"자산명"]
		,tableColumnNames		: ["ASST_NO",		"ASST_NM"]
		,tableColumnWidths		: ["80px", 			"80px"]
		,itemSelectEvent		: function (data){
			console.log('callback data:', data);
			//그리드내 원하는 위치에 값 셋팅하기
			PopFia2520Grid.setCellData(row, 17,	data['ASST_NO'], true, true);
			PopFia2520Grid.setCellData(row, 19,	data['ASST_NM'], true, true);
		},
	});
	SBUxMethod.openModal('modal-compopup1');
}        
 
/**
 * 그리드내 팝업(자산구분) 조회
 */
function fn_popFia2520_gridPopup5(event, row, col) {
	event.stopPropagation();	
    let cellData1 = PopFia2520Grid.getCellData(row, 23) 
    let cellData2 = PopFia2520Grid.getCellData(row, 25) 
	fn_popFia2520_compopup5(row, col, cellData1, cellData2);
}
 
/**
 * 그리드내 공통팝업(자산구분) 오픈
 */
var fn_popFia2520_compopup5 = function(row, col, cellData1, cellData2) {
	
    var replaceText0 	= "_ASST_CTGRY_";
    var replaceText1 	= "_ASSET_CATEGORY_NAME_"; 
    var strWhereClause 	= "AND A.ASST_CTGRY LIKE '%" + replaceText0 + "%' AND A.ASSET_CATEGORY_NAME LIKE '%" + replaceText1 + "%' ";
    
	SBUxMethod.attr('modal-compopup1', 'header-title', '자산구분');
	compopup1({
		compCode				: gv_ma_selectedCorpCd
		,clientCode				: gv_ma_selectedClntCd
		,bizcompId				: 'P_ASSET_CATEGORY'
   		,popupType				: 'A'
   		,whereClause			: strWhereClause
   		,searchCaptions			: ["코드", 				"명칭"]
		,searchInputFields		: ["ASST_CTGRY", 	"ASSET_CATEGORY_NAME"]
		,searchInputValues		: [cellData1, 			cellData2]
		,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
   		,width					: '500px'
   		,height					: '400px'
		,tableHeader			: ["분류코드", 			"분류명"]
		,tableColumnNames		: ["ASST_CTGRY", 	"ASSET_CATEGORY_NAME"]	
		,tableColumnWidths		: ["100px", 			"250px"]
		,itemSelectEvent		: function (data){
			console.log('callback data:', data);
			//그리드내 원하는 위치에 값 셋팅하기
			PopFia2520Grid.setCellData(row, 23,	data['ASST_CTGRY'], 	true, true);
			PopFia2520Grid.setCellData(row, 25,	data['ASSET_CATEGORY_NAME'], true, true);
		},
	});
	SBUxMethod.openModal('modal-compopup1');
}        
 
/**
 * 그리드내 팝업(중분류) 조회
 */
function fn_popFia2520_gridPopup6(event, row, col) {
	event.stopPropagation();	
    let cellData1 = PopFia2520Grid.getCellData(row, 26) 
    let cellData2 = PopFia2520Grid.getCellData(row, 28) 
	fn_popFia2520_compopup6(row, col, cellData1, cellData2);
}
 
/**
 * 그리드내 공통팝업(중분류) 오픈
 */
var fn_popFia2520_compopup6 = function(row, col, cellData1, cellData2) {
	
    var replaceText0 	= "_ASST_MCLSF_";
    var replaceText1 	= "_ASSET_LEVEL2_NAME_"; 
    var strWhereClause 	= "AND AA.ASST_MCLSF LIKE '%" + replaceText0 + "%' AND AA.ASSET_LEVEL2_NAME LIKE '%" + replaceText1 + "%' ";
    
	SBUxMethod.attr('modal-compopup1', 'header-title', '자산중분류');
	compopup1({
		compCode				: gv_ma_selectedCorpCd
		,clientCode				: gv_ma_selectedClntCd
		,bizcompId				: 'P_ASSET_LEVEL2'
   		,popupType				: 'A'
		,whereClause			: strWhereClause
   		,searchCaptions			: ["코드", 				"명칭"]
		,searchInputFields		: ["ASST_MCLSF", 		"ASSET_LEVEL2_NAME"]
		,searchInputValues		: [cellData1, 			cellData2]
		,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
		,width					: '700px'
		,height					: '400px'
		,tableHeader			: ["중분류", 			"중분류명",				"자산구분",			"자산구분명",			"comp_code"]
		,tableColumnNames		: ["ASST_MCLSF", 		"ASSET_LEVEL2_NAME",	"ASST_CTGRY",	"ASSET_CATEGORY_NAME",	"CO_CD"]	
		,tableColumnWidths		: ["100px", 			"200px",				"100px",			"100px",				"100px"]
		,itemSelectEvent		: function (data){
			console.log('callback data:', data);
			//그리드내 원하는 위치에 값 셋팅하기
			PopFia2520Grid.setCellData(row, 26,	data['ASST_MCLSF'], 		true, true);
			PopFia2520Grid.setCellData(row, 28,	data['ASSET_LEVEL2_NAME'], 	true, true);
		},
	});
	SBUxMethod.openModal('modal-compopup1');
}        
 
/**
 * 그리드내 팝업(소분류) 조회
 */
function fn_popFia2520_gridPopup7(event, row, col) {
	event.stopPropagation();	
    let cellData1 = PopFia2520Grid.getCellData(row, 29) 
    let cellData2 = PopFia2520Grid.getCellData(row, 31) 
	fn_popFia2520_compopup7(row, col, cellData1, cellData2);
}
 
/**
 * 그리드내 공통팝업(소분류) 오픈
 */
var fn_popFia2520_compopup7 = function(row, col, cellData1, cellData2) {
	
    var replaceText0 	= "_ASST_SCLSF_";
    var replaceText1 	= "_ASSET_LEVEL3_NAME_"; 
    var strWhereClause 	= "AND AA.ASST_SCLSF LIKE '%" + replaceText0 + "%' AND AA.ASSET_LEVEL3_NAME LIKE '%" + replaceText1 + "%' ";
    
	SBUxMethod.attr('modal-compopup1', 'header-title', '자산소분류');
	compopup1({
		compCode				: gv_ma_selectedCorpCd
		,clientCode				: gv_ma_selectedClntCd
		,bizcompId				: 'P_ASSET_LEVEL3'
   		,popupType				: 'A'
		,whereClause			: strWhereClause
   		,searchCaptions			: ["코드", 				"명칭"]
		,searchInputFields		: ["ASST_SCLSF", 		"ASSET_LEVEL3_NAME"]
		,searchInputValues		: [cellData1, 			cellData2]
		,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
		,width					: '700px'
		,height					: '400px'
		,tableHeader			: ["소분류",			"소분류명",				"중분류", 			"중분류명",				"자산구분",			"자산구분명",			"comp_code"]
		,tableColumnNames		: ["ASSET_LEVE3",		"ASSET_LEVEL3_NAME",	"ASSET_LEVE2", 		"ASSET_LEVEL2_NAME",	"ASST_CTGRY",	"ASSET_CATEGORY_NAME",	"CO_CD"]	
		,tableColumnWidths		: ["100px", 			"200px",				"100px",			"100px",				"100px",			"100px",				"100px"]
		,itemSelectEvent		: function (data){
			console.log('callback data:', data);
			//그리드내 원하는 위치에 값 셋팅하기
			PopFia2520Grid.setCellData(row, 29,	data['ASST_SCLSF'], 		true, true);
			PopFia2520Grid.setCellData(row, 31,	data['ASSET_LEVEL3_NAME'], 	true, true);
		},
	});
	SBUxMethod.openModal('modal-compopup1');
}        
 
/**
 * 그리드내 팝업(위치코드) 조회
 */
function fn_popFia2520_gridPopup8(event, row, col) {
	event.stopPropagation();	
    let cellData1 = PopFia2520Grid.getCellData(row, 33) 
    let cellData2 = PopFia2520Grid.getCellData(row, 35) 
	fn_popFia2520_compopup8(row, col, cellData1, cellData2);
}
 
/**
 * 그리드내 공통팝업(위치코드) 오픈
 */
var fn_popFia2520_compopup8 = function(row, col, cellData1, cellData2) {
	
    var replaceText0 	= "_LOCTN_CD_";
    var replaceText1 	= "_LOCTN_NM_"; 
    var strWhereClause 	= "AND LOCATION_CODE LIKE '%" + replaceText0 + "%' AND LOCATION_NAME LIKE '%" + replaceText1 + "%' ";
    
	SBUxMethod.attr('modal-compopup1', 'header-title', '자산위치');
	compopup1({
		compCode				: gv_ma_selectedCorpCd
		,clientCode				: gv_ma_selectedClntCd
		,bizcompId				: 'P_FA_LOCATION'
   		,popupType				: 'A'
		,whereClause			: strWhereClause
   		,searchCaptions			: ["코드", 				"명칭"]
		,searchInputFields		: ["LOCTN_CD", 	"LOCTN_NM"]
		,searchInputValues		: [cellData1, 			cellData2]
		,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
		,width					: '700px'
		,height					: '400px'
		,tableHeader			: ["위치코드", 			"위치명",			"비고",			"법인"]
		,tableColumnNames		: ["LOCTN_CD", 	"LOCTN_NM",	"DESCIPTION",	"CO_CD"]	
		,tableColumnWidths		: ["100px", 			"200px",			"100px",		"100px"]
		,itemSelectEvent		: function (data){
			console.log('callback data:', data);
			//그리드내 원하는 위치에 값 셋팅하기
			PopFia2520Grid.setCellData(row, 33,	data['LOCTN_CD'], 	true, true);
			PopFia2520Grid.setCellData(row, 35,	data['LOCTN_NM'], 	true, true);
		},
	});
	SBUxMethod.openModal('modal-compopup1');
}        
 
/**
 * 그리드내 팝업(프로젝트코드) 조회
 */
function fn_popFia2520_gridPopup9(event, row, col) {
	event.stopPropagation();	
    let cellData1 = PopFia2520Grid.getCellData(row, 38) 
    let cellData2 = PopFia2520Grid.getCellData(row, 40) 
	fn_popFia2520_compopup9(row, col, cellData1, cellData2);
}
 
/**
 * 그리드내 공통팝업(프로젝트코드) 오픈
 */
var fn_popFia2520_compopup9 = function(row, col, cellData1, cellData2) {
	
    var replaceText0 	= "_PJT_CD_";
    var replaceText1 	= "_PJT_NM_"; 
    var strWhereClause 	= "AND A.PJT_CD LIKE '%" + replaceText0 + "%' AND A.PJT_NM LIKE '%" + replaceText1 + "%' ";
    
	SBUxMethod.attr('modal-compopup1', 'header-title', '자산위치');
	compopup1({
		compCode				: gv_ma_selectedCorpCd
		,clientCode				: gv_ma_selectedClntCd
		,bizcompId				: 'P_PROJECT_CIP'
   		,popupType				: 'A'
   		,whereClause			: strWhereClause
   		,searchCaptions			: ["코드", 				"명칭"]
		,searchInputFields		: ["PJT_CD", 		"PJT_NM"]
		,searchInputValues		: [cellData1, 			cellData2]
		,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
   		,width					: '700px'
   		,height					: '400px'
		,tableHeader			: ["코드", 				"명칭",				"년도",			"부서",			"호기",			"부서"]
		,tableColumnNames		: ["PJT_CD", 		"PJT_NM",		"CD_SGMT01",	"CD_SGMT02",	"CD_SGMT03",	"CD_SGMT04"]	
		,tableColumnWidths		: ["80px", 				"300px",			"100px",		"100px",		"100px",		"100px"]
		,itemSelectEvent		: function (data){
			console.log('callback data:', data);
			//그리드내 원하는 위치에 값 셋팅하기
			PopFia2520Grid.setCellData(row, 38,	data['PJT_CD'], 	true, true);
			PopFia2520Grid.setCellData(row, 40,	data['PJT_NM'], 	true, true);
		},
	});
	SBUxMethod.openModal('modal-compopup1');
}        
 
/**
 * 그리드내 팝업(부가세유형) 조회
 */
function fn_popFia2520_gridPopup10(event, row, col) {
	event.stopPropagation();	
    let cellData1 = PopFia2520Grid.getCellData(row, 46) 
	fn_popFia2520_compopup10(row, col, cellData1);
}
 
/**
 * 그리드내 공통팝업(부가세유형) 오픈
 */
var fn_popFia2520_compopup10 = function(row, col, cellData1) {
	
    var replaceText0 	= "_VAT_NM_";
    var strWhereClause 	= "AND A.VAT_NM LIKE '%" + replaceText0 + "%' ";
    
	SBUxMethod.attr('modal-compopup1', 'header-title', '부가세유형');
	compopup1({
		compCode				: gv_ma_selectedCorpCd
		,clientCode				: gv_ma_selectedClntCd
		,bizcompId				: 'L_VAT_INFO'
   		,popupType				: 'A'
   		,whereClause			: strWhereClause
		,searchCaptions			: ["코드명"]
		,searchInputFields		: ["VAT_NM"]
		,searchInputValues		: [cellData1]
		,width					: '780px'
		,height					: '400px'
		,tableHeader			: ["코드명",		"유형코드",			"유형명",			"세율",			"상한",				"하한"]
		,tableColumnNames		: ["VAT_NM", 	 	"VAT_TYPE_CD",	"VAT_TMPLT_NM",	"VAT_RT",		"HGHST_RT",	"LOWST_RT"]
		,tableColumnWidths		: ["250px", 		 "80px",			"200px",			"50px",			"50px",				"50px"]
		,itemSelectEvent		: function (data){
			console.log('callback data:', data);
			//그리드내 원하는 위치에 값 셋팅하기
			PopFia2520Grid.setCellData(row, 46,	data['VAT_NM'], 		true, true);
		},
	});
	SBUxMethod.openModal('modal-compopup1');
}        
 
</script>
</html>
