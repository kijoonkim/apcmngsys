<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title></title>
</head>
<body oncontextmenu="return false">
	<section id="compopup1">
		<div class="box box-solid">
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
									<table class="table table-bordered tbl_row tbl_fixed">
										<colgroup>
											<col style="width: 25%">
											<col style="width: 25%">
											<col style="width: 25%">
											<col style="width: 25%">
										</colgroup>
										<tbody class="cu-search-area">
										</tbody>
									</table>								
								</td>
								
								<td class="td_input" style="text-align:right;" >
									<div>
										<sbux-button uitype="normal" text="조회" class="btn btn-sm btn-outline-danger cu-btn-sch-compopup1" ></sbux-button>
										<sbux-button uitype="normal" text="종료" class="btn btn-sm btn-outline-danger cu-btn-close-compopup1" ></sbux-button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="box-body">
				
				<div class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
					<table class="table table-bordered table-hover cu-data-table">
				        <colgroup>
				        </colgroup>
						<thead class="thead-light" style="background-color:#f5fbff;position:sticky;top:0;z-index:3">
						</thead>
						<tbody style="vertical-align:middle;">
						</tbody>
				    </table>
				</div>
				
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script >

/**
 * @description 공통 팝업
 */
const compopup1 = {
		
	prgrmId		: '#compopup1'
	,modalId	: 'modal-compopup1'
	,callbackFn	: null
	
	,init : async function(obj){
		var _compCode				= obj.compCode;
		var _clientCode				= obj.clientCode;
		var _bizcompId				= obj.bizcompId;
		var _whereClause			= obj.whereClause;
		
		var _searchCaptions			= obj.searchCaptions;
		var _searchInputFields		= obj.searchInputFields;
		var _searchInputValues		= obj.searchInputValues;
		
		var _height					= obj.height;
		var _tableHeader			= obj.tableHeader;
		var _tableColumnNames		= obj.tableColumnNames;
		var _tableColumnWidths		= obj.tableColumnWidths;
		compopup1.callbackFn		= obj.itemSelectEvent;
		
    	//css
   	 	$(compopup1.prgrmId).find('.cu-table-div').css('height', _height);
   	 	
    	//search
    	$(compopup1.prgrmId).find('.cu-btn-sch-compopup1').click(function(){
    		
    		var wstr 	= _whereClause;
    		$(compopup1.prgrmId).find('.cu-search-area').find('input').each(function(){
    			var name  	= $(this).prop('name');
    			var icode 	= "_" + name + "_";
    			var val   	= $(this).val();
    			wstr 		= wstr.replace(icode, val);
    		});
        	compopup1.getData(_compCode, _clientCode, _bizcompId, wstr, _tableColumnNames);
    	});
    	
    	//close event
    	$(compopup1.prgrmId).find('.cu-btn-close-compopup1').click(function(){
   	 		SBUxMethod.closeModal(compopup1.modalId);
    	});
    	
    	//create table
    	compopup1.createTable(_searchCaptions, _searchInputFields, _searchInputValues, _tableHeader, _tableColumnWidths);
    	
    	//get data
   		var wstr 	= _whereClause;
	    for (var i = 0; i < _searchInputFields.length; i++) {
   			var name  	= _searchInputFields[i];
   			var icode 	= "_" + name + "_";
   			var val   	= _searchInputValues[i];
   			wstr 		= wstr.replace(icode, val);
	    }
    	compopup1.getData(_compCode, _clientCode, _bizcompId, wstr, _tableColumnNames);
	}
	,createTable : function(p_searchCaptions, p_searchInputFields, p_searchInputValues, p_tableHeader, p_tableColumnWidths){
		
		//조회부분 
		var acnt = 0;
		var alen = p_searchCaptions.length;
		var htma = '<tr>';
		var htmc = ' name="_name_" ';
	    for (var i = 0; i < alen; i++) {
			
			var tmp3 = (p_searchInputFields[i]) ? htmc.replace('_name_',	p_searchInputFields[i]) : "";
			htma += '<th scope="th_bg">' + p_searchCaptions[i] + '</th>';
			htma += '<td class="td_input" style="border-right: hidden;">';
			htma += '<sbux-input ' + tmp3 + ' uitype="text" class="form-control input-sm" value="' + p_searchInputValues[i] + '" ></sbux-input>';
			htma += '</td>';
			acnt ++;		
			if(acnt==2){
				htma += '</tr>';
				acnt = 0;
				if((i+1)==alen){
				} else {
					htma += '<tr>';
				}
			}
		}	
	    $(compopup1.prgrmId).find('.cu-search-area').html(htma);
		
		//table column width
		var ctot = 0; 
		var blen = p_tableColumnWidths.length;
		var htmd = '';
	    for (var j= 0; j < blen; j++) {
			htmd += '<col width="' + p_tableColumnWidths[j]  + '" />'
			ctot += gfnma_getNumber(p_tableColumnWidths[j]);
		}	
		$(compopup1.prgrmId).find('.cu-data-table').find('colgroup').html(htmd);			
   	 	$(compopup1.prgrmId).find('.cu-data-table').css('min-width', ctot + 'px');

		//table header column
		var clen = p_tableHeader.length;
		var htme = '<tr>';
	    for (var j= 0; j < clen; j++) {
			htme += '<th style="text-align:left" >' + p_tableHeader[j]  + '</th>'
		}	
		htme += '</tr>';
		$(compopup1.prgrmId).find('.cu-data-table').find('thead').html(htme);		
	}
	,getData : async function(p_compCode, p_clientCode, p_bizcompId, p_whereClause, p_tableColumnNames){
    	
   		var paramObj = { 
   			V_P_DEBUG_MODE_YN	: ''
   			,V_P_LANG_ID		: ''
   			,V_P_COMP_CODE		: p_compCode
   			,V_P_CLIENT_CODE	: p_clientCode
   			,V_P_BIZCOMP_ID		: p_bizcompId
   			,V_P_WHERE_CLAUSE	: p_whereClause
   			,V_P_FORM_ID		: ''
   			,V_P_MENU_ID		: ''
   			,V_P_PROC_ID		: ''
   			,V_P_USERID			: ''
   			,V_P_PC				: ''
	    };
    	const postJsonPromise = gfn_postJSON("/com/comSelectList.do", {
	        getType				: 'json',
	        workType			: 'Q',
	        cv_count			: '1',
	        params				: gfnma_objectToString(paramObj)
  		});
  	    const data = await postJsonPromise;
    	console.log('popup get data:', data);
		
    	//create td
		var tmp = "";
		var list = data.cv_1;
   	 	for (var i= 0; i < list.length; i++) {
			tmp += '<tr>'
			//표시되는 컬럼
	   	 	for (var j= 0; j < p_tableColumnNames.length; j++) {
				var code = p_tableColumnNames[j];
				tmp += '<td cu-name="' + code + '">' + list[i][code] + '</td>';
			}
			//비표시되는 컬럼
			var obj = list[i];
			for(var key in obj){
		   	 	for (var j= 0; j < p_tableColumnNames.length; j++) {
					var code = p_tableColumnNames[j];
					if(code!=key){
						tmp += '<td style="display:none" cu-name="' + key + '">' + obj[key] + '</td>';
					}
				}
			}
			tmp += '</tr>'
		}
   	 	$(compopup1.prgrmId).find('.cu-data-table').find('tbody').html(tmp);
   	 	$(compopup1.prgrmId).find('.cu-data-table').find('tbody').find('tr').click(function(){
   	 		var obj = gfnma_getObjectRowTable($(this));
   	 		compopup1.callbackFn(obj);
   	 		SBUxMethod.closeModal(compopup1.modalId);
   	 	});
  	    
	}
}
</script>
</html>