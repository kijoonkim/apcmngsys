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
	<section id="compopup4">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<table class="table tbl_row tbl_fixed">
						<colgroup>
							<col style="width:auto">
							<col style="width:150px">
						</colgroup>
						<tbody>
							<tr>
								<td class="td_input" >
								</td>
								
								<td class="td_input" style="text-align:right;" >
									<sbux-button uitype="normal" text="확인" class="btn btn-sm btn-outline-danger cu-btn-ok" ></sbux-button>
									<sbux-button uitype="normal" text="취소" class="btn btn-sm btn-outline-danger cu-btn-cancel" ></sbux-button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="box-body">
				
				<div class="card"  style="border:1px solid #f4f4f4;">
					<table class="table">
				        <colgroup>
							<col style="width:100px">
							<col style="width:auto">
				        </colgroup>
						<tbody>
							<tr>
								<th class="th_bg">취소유형</th>
								<td class="td_input" >
									<div class="dropdown">
									    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="srch-compopup4-ctype" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									    	<font>선택</font>
									        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
									    </button>
									    <div class="dropdown-menu" aria-labelledby="srch-compopup4-ctype" style="width:300px;height:150px;padding-top:0px;overflow:auto">
									    </div>
									</div> 
								</td>
							</tr>
							<tr>
								<th class="th_bg">전기취소일</th>
								<td class="td_input" >
								    <sbux-datepicker
							            id="srch-compopup4-cdate"
							            name="srch-compopup4-cdate"
							            uitype="popup"
							            date-format="yyyy-mm-dd"
							            class="form-control input-sm input-sm-ast inpt_data_reqed">
								    </sbux-datepicker>                          
								</td>
							</tr>
						</tbody>
				    </table>
				</div>
				
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script >

//var jsonComPopup4Ctype 		= []; // 취소유형

/**
 * @description 전기취소
 */
function compopup4(options) {
	
	// id 선언
	var modalId  	= '#compopup4';
	var modalDivId 	= 'modal-compopup4';
	console.log('this popup');
	
	var settings = {
		param					: null
		,callbackEvent			: null
		,cancelEvent			: null
	};
	$.extend(settings, options);	
	console.log('settings:', settings);

	//컴포넌트를 다시 그린다.
	SBUxMethod.refresh('srch-compopup4-cdate');
	
	//css
	$('#' + modalDivId).find('.sbux-mol-hd-close').css({'font-size':'30px','margin-top':'-20px'});
	if(settings.width){
	 	$(modalId).closest('.sbux-mol-md-dlg').css('width', settings.width);
	}
 	
	//취소유형
	gfnma_multiSelectInit({
		target			: ['#srch-compopup4-ctype']
		,compCode		: gv_ma_selectedApcCd
		,clientCode		: gv_ma_selectedClntCd
		,bizcompId		: 'L_COM072'
		,whereClause	: ''
		,formId			: p_formId
		,menuId			: p_menuId
		,selectValue	: ''
		,dropType		: 'down' 	// up, down
		,dropAlign		: 'left' 	// left, right
		,colValue		: 'SUB_CODE'
		,colLabel		: 'CODE_NAME'
		,columns		:[
            {caption: "코드",		ref: 'SUB_CODE', 				width:'50px',  		style:'text-align:left'},
            {caption: "명칭", 		ref: 'CODE_NAME',    			width:'150px',  	style:'text-align:left'},
            {caption: "WT", 		ref: 'WORK_TYPE',    			width:'100px',  	style:'text-align:left'},
		]
	});

	//ok
	$(modalId).find('.cu-btn-ok').off('click');
	$(modalId).find('.cu-btn-ok').click(function(){
 		if(settings.callbackEvent){
 			var cobj = gfnma_multiSelectGet('#srch-compopup4-ctype', true);
 	        var cdate = SBUxMethod.get("srch-compopup4-cdate"); 			
 			if(!cobj){
 	      		gfn_comAlert("E0000","취소유형을 선택하세요");
 	      		return false;
 			}
 			if(!cdate){
 	      		gfn_comAlert("E0000","전기취소일을 선택하세요");
 	      		return false;
 			}
 			var robj = {
 				code 		: cobj['SUB_CODE']
 				,name 		: cobj['CODE_NAME']
 				,workType 	: cobj['WORK_TYPE']
 				,date		: cdate
 			};
 			settings.callbackEvent(robj);
 		 	SBUxMethod.closeModal(modalDivId); 	        
 		}
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