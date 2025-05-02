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
				<div class="cu-search-div">
					<table class="table table-bordered tbl_row tbl_fixed">
						<colgroup>
							<col style="width:auto">
							<col style="width:110px">
						</colgroup>
						<tbody>
							<tr>
								<td class="td_input" >
									<table class="table table-bordered tbl_row tbl_fixed">
										<colgroup>
											<col style="width: 22%">
											<col style="width: 28%">
											<col style="width: 22%">
											<col style="width: 28%">
										</colgroup>
										<tbody class="cu-search-area">
										</tbody>
									</table>								
								</td>
								
								<td class="td_input" style="text-align:right;" >
									<div style="width:102px">
										<button class="btn btn-sm btn-outline-danger cu-btn-sch-compopup1" style="min-width:40px" >조회</button>
										<button class="btn btn-sm btn-outline-danger cu-btn-close-compopup1"  style="min-width:40px" >초기화</button>
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
function compopup1(options) {
	
	// id 선언
	var modalId  	= '#compopup1';
	var modalDivId 	= 'modal-compopup1';
	
	var settings = {
		compCode				: null
		,clientCode				: null
		,bizcompId				: null
		,popupType				: 'A'
		,whereClause			: null
		,searchCaptions			: null
		,searchInputFields		: null
		,searchInputValues		: null
		,searchInputTypes		: null
		,searchInputTypeValues	: null
		
		,cTypeParamFields		: null
		,cTypeParamValues		: null
		
		,width					: null
		,height					: null
		,tableHeader			: null
		,tableColumnNames		: null
		,tableColumnWidths		: null
		,tableColumnHiddenList	: null
		,itemSelectEvent		: null
		,returnDataFilter		: null
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
 
	// get data
    var createTable = function() {
		
		//조회부분 
		var acnt = 0;
		var alen = settings.searchCaptions.length;
		var isOod = (alen%2 == 1) ? true : false;	//홀수여부
		var htma = '<tr>';
		var htmc = ' name="_name_" ';
	    for (var i = 0; i < alen; i++) {
			
			var tmp3 = (settings.searchInputFields[i]) ? htmc.replace('_name_',	settings.searchInputFields[i]) : "";
			htma += '<th scope="th_bg">' + settings.searchCaptions[i] + '</th>';
			htma += '<td class="td_input" style="border-right: hidden;">';
			if(Array.isArray(settings.searchInputTypes)) {
				if(settings.searchInputTypes[i]=="input"){
					htma += '<input ' + tmp3 + ' uitype="text" class="form-control input-sm" value="' + settings.searchInputValues[i] + '" ></input>';
				} else if(settings.searchInputTypes[i]=="select") {
					htma += '<select ' + tmp3 + ' class="form-control form-select" >';
	        		htma += '<option value="">선택</option>';
				    for (var j = 0; j < settings.searchInputTypeValues[i].length; j++) {
				    	htma += '<option value="' + settings.searchInputTypeValues[i][j]['value'] + '">' + settings.searchInputTypeValues[i][j]['text'] + '</option>';
				    }
					htma += '</select>';	
				} else if(settings.searchInputTypes[i]=="datepicker") {
					htma += '<sbux-datepicker  ' + tmp3 + ' uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed" value="' + settings.searchInputValues[i] + '" ></sbux-datepicker>';
				}
			} else {
				htma += '<input ' + tmp3 + ' uitype="text" class="form-control input-sm" value="' + settings.searchInputValues[i] + '" ></input>';
			}
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
		if(alen==0){
			$(modalId).find('.cu-search-div').hide();
		} else {
			$(modalId).find('.cu-search-div').show();
		    $(modalId).find('.cu-search-area').html(htma);
		}
		
		//조회조건 td colspan
		if(alen>2){
			if(isOod){
				$(modalId).find('.cu-search-div').find('tr').last().find('td').attr('colspan', '3');
			}
		}
		
		//table column width
		var ctot = 0; 
		var blen = settings.tableColumnWidths.length;
		var htmd = '';
	    for (var j= 0; j < blen; j++) {
			htmd += '<col width="' + settings.tableColumnWidths[j]  + '" />'
			ctot += gfnma_getNumber(settings.tableColumnWidths[j]);
		}	
		$(modalId).find('.cu-data-table').find('colgroup').html(htmd);			
   	 	$(modalId).find('.cu-data-table').css('min-width', ctot + 'px');
 
		//table header column
		var clen = settings.tableHeader.length;
		var htme = '<tr>';
	    for (var j= 0; j < clen; j++) {
			htme += '<th style="text-align:left" >' + settings.tableHeader[j]  + '</th>'
		}	
		htme += '</tr>';
		$(modalId).find('.cu-data-table').find('thead').html(htme);				
		
	};
    createTable();
	
	// get data
    const getData = async function() {
    	
		var wstr 	= settings.whereClause; 	// AND X.EMP_CODE LIKE '%
		var pstr 	= "";						// 10|NULL|NULL|'test'
		var idx		= 0;
		
		if(settings.popupType=='A'){
			$(modalId).find('.cu-search-area').find('[name]').not('button').each(function(){
				var name  	= $(this).attr('name');
				if(!name){
					name  	= $(this).prop('name');
				}
				var icode 	= "_" + name + "_";
				var val   	= $(this).val();
				//datepicker 경우 구분자 삭제------------------------------
				if(Array.isArray(settings.searchInputTypes)) {
					if(settings.searchInputTypes[idx]=="datepicker"){
						var regex = /[^0-9]/g;
						var str = val.replace(regex, "");
						val = str;
					}
				}
				//----------------------------------------------------------
				wstr 		= wstr.replace(icode, val);
				idx ++;
			});
		} else if(settings.popupType=='B') {
			$(modalId).find('.cu-search-area').find('[name]').not('button').each(function(){
				var val   	= $(this).val();
				//datepicker 경우 구분자 삭제------------------------------
				if(Array.isArray(settings.searchInputTypes)) {
					if(settings.searchInputTypes[idx]=="datepicker"){
						var regex = /[^0-9]/g;
						var str = val.replace(regex, "");
						val = str;
					}
				}
				//----------------------------------------------------------
				if(!val){
					pstr += "NULL" + "|";
				} else {
					if(isNaN(val)){
						pstr += "'" + val + "'|";
					} else {
						if(gfnma_isDate(val)){
							pstr += "'" + val + "'|";
						} else {
							pstr += val + "|";
						}
					}
				}
				idx ++;
			});
			if(wstr){
				if(Array.isArray(wstr)){
					if(wstr.length>0){
						wstr.forEach(function(item) {
							if(item) {
								pstr += item + '|';
							} else {
								pstr += "NULL" + '|';
							}
						});						
					}
				}
			}
			if(pstr){
				pstr = pstr.slice(0, -1);
			}			
			console.log('type B형 parameter:', pstr);			
		} else {
			var clist = settings.cTypeParamFields;	
			var ctemp = "";
			for (var i = 0; i < clist.length; i++) {
				if(clist[i]){
					ctemp = $(modalId).find('.cu-search-area').find('[name=' + clist[i] + ']').val();
				} else {
					ctemp = settings.cTypeParamValues[i];
				}
				ctemp = (!ctemp) ? "NULL" : "'" + ctemp + "'";
				pstr +=  ctemp + '|';
			}
			if(pstr){
				pstr = pstr.slice(0, -1);
			}			
		}
		
		if(settings.popupType=='B' || settings.popupType=='C'){
			wstr = '';
		}
		
   		var paramObj = { 
   			V_P_DEBUG_MODE_YN	: ''
   			,V_P_LANG_ID		: ''
   			,V_P_COMP_CODE		: settings.compCode
   			,V_P_CLIENT_CODE	: settings.clientCode
   			,V_P_BIZCOMP_ID		: settings.bizcompId
   			,V_P_WHERE_CLAUSE	: wstr
   			,V_P_PARAM_LIST		: pstr
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
 
		if(settings.returnDataFilter){
			list = settings.returnDataFilter(list);
		}
 
   	 	for (var i= 0; i < list.length; i++) {
			tmp += '<tr>'
			//표시되는 컬럼
	   	 	for (var j= 0; j < settings.tableColumnNames.length; j++) {
				var code = settings.tableColumnNames[j];
				tmp += '<td cu-name="' + code + '">' + gfnma_nvl2(list[i][code]) + '</td>';
			}
			//비표시되는 컬럼
			var obj 	= list[i];
			var chkcol  = true; 
			var chkcode = '';
			for(var key in obj){
				chkcol = true;
				chkcode = '';
		   	 	for (var j= 0; j < settings.tableColumnNames.length; j++) {
		   	 		chkcode = settings.tableColumnNames[j];
					if(chkcode!=key){
						chkcol = false;
						break;
					}
				}
		   	 	if(!chkcol){
					tmp += '<td style="display:none" cu-name="' + key + '">' + gfnma_nvl2(obj[key]) + '</td>';
		   	 	}
			}
			tmp += '</tr>'
		}
   	 	$(modalId).find('.cu-data-table').find('tbody').html(tmp);
   	 	$(modalId).find('.cu-data-table').find('tbody').find('tr').click(function(){
   	 		var obj = gfnma_getObjectRowTable($(this));
   	 		if(settings.itemSelectEvent){
   	 			settings.itemSelectEvent(obj);
   	 		}
   	 		SBUxMethod.closeModal(modalDivId);
   	 	});		
    };
	
	//search button event
	$(modalId).find('.cu-btn-sch-compopup1').off('click');
	$(modalId).find('.cu-btn-sch-compopup1').click(function(){
    	getData();
	});
	
	//close event
	$(modalId).find('.cu-btn-close-compopup1').off('click');
	$(modalId).find('.cu-btn-close-compopup1').click(function(){
	 	//SBUxMethod.closeModal(modalDivId);
		gfnma_uxDataClear('.cu-search-area');
	});
 
	$(modalId).find('input').off('keydown');
	$(modalId).find('input').keydown(function(e){
		if(e.keyCode && e.keyCode == 13) {
			getData();
		} else if(e.keyCode && (e.keyCode == 8 || e.keyCode == 46)) {
			$(modalId).find('input').val("");
		}
	});
 
	//start
	getData();
	
}
 
</script>
</html>
