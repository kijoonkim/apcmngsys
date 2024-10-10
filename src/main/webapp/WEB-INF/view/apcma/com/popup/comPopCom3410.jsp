<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title></title>
</head>
<body oncontextmenu="return false">
	<section id="compopcom3410">
		<div class="box box-solid">
			<div class="box-body">
				<div class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
					<div id="compopcom3410Grid" name="compopcom3410Grid" class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script >

//grid Mast 초기화
var com3410Grid; 			// 그리드를 담기위한 객체 선언
var jsonCom3410 = []; 		// 그리드의 참조 데이터 주소 선언
var jsonCsGroup = [];		//

/**
 * @description 복수코드
 */
function compopcom3410(options) {
	
	// id 선언
	var modalId  	= '#compopcom3410';
	var modalDivId 	= 'modal-compopcom3410';
	
	var settings = {
		height					: null
		,callbackEvent			: null
		,cancelEvent			: null
	};
	$.extend(settings, options);	
	console.log('settings:', settings);

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
	    SBGridProperties.parentid 			= 'compopcom3410Grid';
	    SBGridProperties.id 				= 'com3410Grid';
	    SBGridProperties.jsonref 			= 'jsonCom3410';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrows';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["오류코드"], 					ref: 'ERROR_CODE',    			type:'output',  	width:'60px',  		style:'text-align:left'},
            {caption : ["거래처유형"], 				ref: 'CS_GROUP', 				type:'combo',		width:'150px', 		style:'text-align:center', disabled : true, 
                typeinfo : {
                    ref : 'jsonCsGroup',
                    oneclickedit:true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption: ["거래처코드"],    				ref: 'CS_CODE', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["거래처명"],    				ref: 'CS_NAME', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["사업자번호"],  				ref: 'BIZ_REGNO', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["오류내역"],  					ref: 'ERROR_DESCRIPTION', 		type:'output',  	width:'200px',  	style:'text-align:left'}
        ];
        com3410Grid	= _SBGrid.create(SBGridProperties);
        console.log('fn_createGrid end');
    }	
    fn_createGrid();	
    gfnma_setComSelect(['com3410Grid','CS_GROUP'], jsonCsGroup, 'L_COM011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '');
	console.log('jsonCsGroup =>', jsonCsGroup);
	
	function fn_clearCom3410() {
		jsonCom3410 = [];
		com3410Grid.rebuild();
	}
    const fn_setCom3410Grid = async function() {

    	fn_clearCom3410();
    	
	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/com/com3410List.do", {
        	getType				: 'json',
        	workType			: 'Q',
        	cv_count			: '1',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('fn_setCom3410Grid data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonCom3410.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  							ERROR_CODE			: gfnma_nvl(item.ERROR_CODE),			
  							CS_CODE				: gfnma_nvl(item.CS_CODE),
  							CS_NAME				: gfnma_nvl(item.CS_NAME),
  							CS_GROUP			: gfnma_nvl(item.CS_GROUP),			
  							BIZ_REGNO			: gfnma_nvl(item.BIZ_REGNO),		
  							ERROR_DESCRIPTION	: gfnma_nvl(item.ERROR_DESCRIPTION)
  					}
  					jsonCom3410.push(msg);
  					totalRecordCount ++;
  				});
        		com3410Grid.rebuild();
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
	fn_setCom3410Grid();
    
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