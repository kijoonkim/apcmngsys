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
	<section id="compopfia2510">
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
	                            
				<div id="compopfia2510Grid" class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
				</div>
				
                <div style="text-align:right;vertical-align:middle;width:100%">
					<button style="min-width:80px;margin-top:10px" class="btn btn-sm btn-outline-danger cu-btn-ok" >확인</button>
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
var PopFia2510Grid; 			// 그리드를 담기위한 객체 선언
var jsonPopFia2510 = []; 		// 그리드의 참조 데이터 주소 선언

var pop_jsonFiOrgCode		= [];	// 사업단위
var pop_jsonSiteCode		= [];	// 사업장
var pop_jsonAcctRuleCode	= [];	// 회계기준
var pop_jsonActualFlagP		= [];	// 실적구분

/**
 * @description 복수코드
 */
function compopfia2510(options) {
	
	// id 선언
	var modalId  	= '#compopfia2510';
	var modalDivId 	= 'modal-compopfia2510';
	
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

	const fn_initPopFia2510 = async function() {
		let rst = await Promise.all([
            // 사업단위
            gfnma_setComSelect(['POP_SCH_FI_ORG_CODE'],		pop_jsonFiOrgCode, 		'L_FIM022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'FI_ORG_CODE', 'FI_ORG_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['POP_SCH_SITE_CODE'],		pop_jsonSiteCode, 		'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 회계기준
            gfnma_setComSelect(['POP_SCH_ACCT_RULE_CODE'],	pop_jsonAcctRuleCode,	'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 실적구분
            gfnma_setComSelect(['POP_SCH_ACTUAL_FLAG_P'],	pop_jsonActualFlagP,	'L_FIA020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
		
	}
	
	async function fn_init() {
  		await fn_initPopFia2510();
  		
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
	}
	
	fn_init();
	
    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'compopfia2510Grid';
	    SBGridProperties.id 				= 'PopFia2510Grid';
	    SBGridProperties.jsonref 			= 'jsonPopFia2510';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["소스타입"],				ref: 'SOURCE_TYPE',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["소스명"], 				ref: 'SOURCE_NAME',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["회계기준"], 			ref: 'ACCT_RULE_CODE', 			type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["전표번호"],    			ref: 'DOC_NAME', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["취득일"],    			ref: 'ACQUIRE_DATE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["전표ID"],  				ref: 'DOC_ID', 					type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["적요"],  				ref: 'MEMO2',			 		type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["사업장"],    			ref: 'SITE_CODE',	 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["거래처"],  				ref: 'CS_NAME',		 			type:'output',  	width:'120px',  	style:'text-align:right'},
            {caption: ["부서"],	   				ref: 'DEPT_NAME',				type:'output',  	width:'120px',  	style:'text-align:right'},
            {caption: ["코스트센터"],	  		ref: 'COST_CENTER_CODE',		type:'output',  	width:'100px',  	style:'text-align:right'},
            {caption: ["자산구분명"],	  		ref: 'ASSET_CATEGORY', 			type:'output',  	width:'150px',  	style:'text-align:right'},
            {caption: ["중분류명"],	   			ref: 'ASSET_LEVEL2', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["소분류명"],				ref: 'ASSET_LEVEL3', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["위치명"],				ref: 'LOCATION_NAME',	 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["계정명"],				ref: 'ACCOUNT_NAME', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["프로젝트명"],			ref: 'PROJECT_NAME',	 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["담당자"],				ref: 'EMP_NAME',		 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["통화"],					ref: 'CURRENCY_CODE',	 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환율"],					ref: 'EXCHANGE_RATE',	 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["금액"],					ref: 'ORIGINAL_AMOUNT',	 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["환산금액"],				ref: 'FUNCTIONAL_AMOUNT', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부가세유형"],			ref: 'VAT_TYPE',		 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부가세"],				ref: 'VAT_AMOUNT',		 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["비고"],					ref: 'MEMO',			 		type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        PopFia2510Grid = _SBGrid.create(SBGridProperties);
        //PopFia2510Grid.bind('click', 'fn_viewGrid');
    }	
    fn_createGrid();	
	
    const fn_setPopFia2510Grid = async function(wtype) {

		PopFia2510Grid.clearStatus();

	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : gfnma_nvl(SBUxMethod.get('POP_SCH_FI_ORG_CODE'))
			,V_P_ACCT_RULE_CODE	   	: gfnma_nvl(SBUxMethod.get('POP_SCH_ACCT_RULE_CODE'))
			,V_P_ACTUAL_FLAG 	    : gfnma_nvl(SBUxMethod.get('POP_SCH_ACTUAL_FLAG_P'))
			,V_P_SITE_CODE 	    	: gfnma_nvl(SBUxMethod.get('POP_SCH_SITE_CODE'))
			,V_P_ACQUIRE_DATE_FR 	: gfnma_nvl(SBUxMethod.get('POP_SCH_ACQUIRE_DATE_FR'))
			,V_P_ACQUIRE_DATE_TO 	: gfnma_nvl(SBUxMethod.get('POP_SCH_ACQUIRE_DATE_TO'))

			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/ffa/alm/selectFia2510.do", {
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

  	        	jsonPopFia2510.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						DOC_ID					: gfn_nvl(item.DOC_ID),
  						DOC_NAME				: gfn_nvl(item.DOC_NAME),
  						ITEM_ID					: gfn_nvl(item.ITEM_ID),
  						ITEM_SEQ				: gfn_nvl(item.ITEM_SEQ),
  						INSERT_USERID			: gfn_nvl(item.INSERT_USERID),
  						USER_NAME				: gfn_nvl(item.USER_NAME),
  						INSERT_TIME				: gfn_nvl(item.INSERT_TIME),
  						PAY_BASE_DATE			: gfn_nvl(item.PAY_BASE_DATE),
  						EXPECTED_PAY_DATE		: gfnma_date5(gfn_nvl(item.EXPECTED_PAY_DATE)),
  						PAY_TERM_CODE			: gfn_nvl(item.PAY_TERM_CODE),
  						PAY_TERM_NAME			: gfn_nvl(item.PAY_TERM_NAME),
  						AMOUNT					: gfn_nvl(item.AMOUNT),
  						DESCRIPTION				: gfn_nvl(item.DESCRIPTION),
  						BILL_DUE_DATE			: gfnma_date5(gfn_nvl(item.BILL_DUE_DATE)),
  						BILL_DUE_DAY			: gfn_nvl(item.BILL_DUE_DAY),
  						BILL_DUE_PAY_DATE		: gfnma_date5(gfn_nvl(item.BILL_DUE_PAY_DATE)),
  						BANK_ACCOUNT_SEQ		: gfn_nvl(item.BANK_ACCOUNT_SEQ),
  						PGM_ID					: gfn_nvl(item.PGM_ID),
  					}
  					jsonPopFia2510.push(msg);
  					totalRecordCount ++;
  				});

        		PopFia2510Grid.rebuild();
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
    
    function fn_okProcess() {
    	
    }
    
    
    //조회
	$(modalId).find('.cu-btn-sch').off('click');
	$(modalId).find('.cu-btn-sch').click(function(){
		fn_setPopFia2510Grid('Q');
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
 
</script>
</html>