<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title></title>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<section id="comPopFig1000Report">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<table class="table table-bordered tbl_row tbl_fixed">
	                    <colgroup>
							<col style="width: 25%">
							<col style="width: 25%">
							<col style="width: 25%">
							<col style="width: 25%">
	                    </colgroup>
						<tbody>
							<tr>
								<th scope="row" class="th_bg">◎ 합계여부</th>
								<td class="td_input " colspan="2" id="rdotd">
									<p class="ad_input_row">
										<sbux-radio id="RDO_TOTAL1" name="FIG1000_RDO" uitype="normal" value="N" class="radio_label" checked></sbux-radio>
										<label class="radio_label" for-id="RDO_TOTAL1">개별</label>
									</p>
									<p class="ad_input_row">
										<sbux-radio id="RDO_TOTAL2" name="FIG1000_RDO" uitype="normal" value="Y" class="radio_label"></sbux-radio>
										<label class="radio_label" for-id="RDO_TOTAL2">합계</label>
									</p>
								</td>									
								<td class="td_input" style="border-right: hidden;">
				                    <sbux-button uitype="normal" text="전표출력"  class="btn btn-sm btn-outline-danger cu-btn-print"></sbux-button>
								</td>	
							</tr>
						</tbody>
					</table>				
				</div>
			</div>
		</div>
	</section>
</body>
<script >

/**
 * @description 복수코드
 */
function comPopFig1000Report(options) {
	
	// id 선언
	var modalId  	= '#comPopFig1000Report';
	var modalDivId 	= 'modal-comPopFig1000Report';
	
	var settings = {
		height					: null
		,param					: null
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
	
	/**
	 * 전표출력
	 */
	const fn_btnPopPrint = async function() {
		let conn 		= '';
		let DOC_ID		= settings.param['P_DOC_ID'];
		let COMP_CODE 	= settings.param['P_COMP_CODE'];
		let CLIENT_CODE = settings.param['P_CLIENT_CODE'];
		//리포트 출력 데이터 가져오기
	    conn = await fn_getPopReportData(DOC_ID, COMP_CODE, CLIENT_CODE);
		//리포트 출력 데이터 리포트가 받을 수 있게끔 데이터 보정
	    conn = await gfnma_convertDataForReport(conn);
		//post 방식으로 리포트 팝업 출력 
	    await gfn_popClipReportPost("전표", "ma/RPT_FIG2200.crf", null, conn );	
	}
    
	const fn_getPopReportData = async function(DOC_ID, COMP_CODE, CLIENT_CODE) {
		let TOTAL_YN = $('[name=FIG1000_RDO]:checked').val();
	    var paramObj = {
	        V_P_DEBUG_MODE_YN	: ''
	        ,V_P_LANG_ID		: ''
	        ,V_P_COMP_CODE		: COMP_CODE
	        ,V_P_CLIENT_CODE	: CLIENT_CODE
	        ,V_P_INVOICE_ID     : ''
	        ,V_P_DOC_BATCH_NO   : ''
	        ,V_P_DOC_ID			: DOC_ID
	        ,V_P_TOTAL_YN      	: TOTAL_YN
	        ,V_P_FORM_ID		: p_formId
	        ,V_P_MENU_ID		: p_menuId
	        ,V_P_PROC_ID		: ''
	        ,V_P_USERID			: ''
	        ,V_P_PC				: ''
	    };
	    const postJsonPromise = gfn_postJSON("/com/selectFig1000Report.do", {
	        getType				: 'json',
	        workType			: 'DOC',
	        cv_count			: '4',
	        params				: gfnma_objectToString(paramObj)
	    });
	    const data = await postJsonPromise;
	    try {
	        if (_.isEqual("S", data.resultStatus)) {
	        	if(data.cv_1.length > 0){
	            	data.cv_1[0].COMP_LOGO = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfn_nvl(data.cv_1[0].LOGO_FILE_NAME) +"&comp_code="+ gv_ma_selectedApcCd +"&client_code=" + gv_ma_selectedClntCd;
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
	    return data;
	}
	
	
	
	$(modalId).find('.cu-btn-print').off('click');
	$(modalId).find('.cu-btn-print').click(function(){
		fn_btnPopPrint();
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