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
	<section id="compopfim3420">
		<div class="box box-solid">
		
			<!-- 
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<table class="table table-bordered tbl_row tbl_fixed">
						<colgroup>
							<col style="width:auto">
							<col style="width:150px">
						</colgroup>
						<tbody>
							<tr>
								<td class="td_input" >
								</td>
								
								<td class="td_input" style="text-align:right;" >
									<sbux-button uitype="normal" text="닫기" class="btn btn-sm btn-outline-danger cu-btn-cancel" ></sbux-button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			 -->
 
			<div class="box-body">
				
				<div id="compopfim3420Grid" class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
				</div>
				
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script >
 
//grid Mast 초기화
var Fim3420Grid; 			// 그리드를 담기위한 객체 선언
var jsonFim3420 = []; 		// 그리드의 참조 데이터 주소 선언
 
/**
 * @description 복수코드
 */
function compopfim3420(options) {
	
	// id 선언
	var modalId  	= '#compopfim3420';
	var modalDivId 	= 'modal-compopfim3420';
	
	var settings = {
		height					: null
		,param					: null
		,callbackEvent			: null
		,cancelEvent			: null
	};
	$.extend(settings, options);	
	//console.log('settings:', settings);
 
	//css
	$('#' + modalDivId).find('.sbux-mol-hd-close').css({'font-size':'30px','margin-top':'-20px'});
	if(settings.width){
	 	$(modalId).closest('.sbux-mol-md-dlg').css('width', settings.width);
	}
	if(settings.height){
	 	$(modalId).find('.cu-table-div').css('height', settings.height);
	}	
 
    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'compopfim3420Grid';
	    SBGridProperties.id 				= 'Fim3420Grid';
	    SBGridProperties.jsonref 			= 'jsonFim3420';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["순번"], 					ref: 'STEP_SEQ',    			type:'output',  	width:'60px',  		style:'text-align:left'},
            {caption: ["구분"], 					ref: 'APPR_TYPE_NAME', 			type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: ["결재구분"],    				ref: 'APPR_CATEGORY_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["부서명"],    				ref: 'DEPT_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["직책"],  					ref: 'DUTY_NAME', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["이름"],  					ref: 'EMP_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["수임자명"],    				ref: 'PROXY_EMP_NAME', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["결재자명"],  				ref: 'UPDATE_EMP_NAME', 		type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["승인결과"],	 				ref: 'APPR_STATUS_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["승인일"],	  				ref: 'APPR_DATE', 				type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["결재의견"],	 				ref: 'APPR_OPINION', 			type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["비고"],	 					ref: 'ETC', 					type:'output',  	width:'100px',  	style:'text-align:left'},
        ];
 
        Fim3420Grid = _SBGrid.create(SBGridProperties);
        //Fim3420Grid.bind('click', 'fn_viewGrid');
    }	
    fn_createGrid();	
	
    const fn_setFim3420Grid = async function(wtype) {
 
		Fim3420Grid.clearStatus();
 
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
		    ,V_P_APPR_ID      		: settings.param['p_appr_id']
		    ,V_P_SOURCE_NO    		: settings.param['p_doc_id']
		    ,V_P_SOURCE_TYPE  		: settings.param['p_doc_type']
 
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/com/fim3420List.do", {
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
 
  	        	jsonFim3420.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						APPR_CATEGORY			: gfnma_nvl(item.APRV_CTGRY),			
						APPR_CATEGORY_NAME		: gfnma_nvl(item.APPR_CATEGORY_NAME),
  						APPR_DATE				: gfnma_nvl(item.APRV_YMD),
  						APPR_ID					: gfnma_nvl(item.APRV_ID),			
  						APPR_OPINION			: gfnma_nvl(item.APRV_OPNN),		
  						APPR_STATUS				: gfnma_nvl(item.APRV_STTS),
						APPR_STATUS_NAME		: gfnma_nvl(item.APPR_STATUS_NAME),
  						APPR_TYPE				: gfnma_nvl(item.APRV_TYPE),
						APPR_TYPE_NAME			: gfnma_nvl(item.APPR_TYPE_NAME),
  						DEPT_CODE				: gfnma_nvl(item.DEPT_CD),
  						DEPT_NAME				: gfnma_nvl(item.DEPT_NM),
  						DESCRIPTION				: gfnma_nvl(item.DSCTN),
  						DUTY_CODE				: gfnma_nvl(item.JBTTL_CD),
						DUTY_NAME				: gfnma_nvl(item.JBTTL_NM),
  						EMP_CODE				: gfnma_nvl(item.EMP_CD),
  						EMP_NAME				: gfnma_nvl(item.EMP_NM),
  						PROXY_EMP_CODE			: gfnma_nvl(item.DLCT_EMP_CD),
  						PROXY_EMP_NAME			: gfnma_nvl(item.PROXY_EMP_NAME),
  						STEP_SEQ				: gfnma_nvl(item.STP_SEQ),
  						UPDATE_EMP_NAME			: gfnma_nvl(item.UPDATE_EMP_NAME),
  						UPDATE_PC				: gfnma_nvl(item.UPDT_PC),
  						UPDATE_TIME				: gfnma_nvl(item.UPDT_DT),
  						UPDATE_USERID			: gfnma_nvl(item.UPDT_USER_ID),
  						ETC						: '',
  					}
  					jsonFim3420.push(msg);
  					totalRecordCount ++;
  				});
 
        		Fim3420Grid.rebuild();
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
	fn_setFim3420Grid('LIST');
    
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
