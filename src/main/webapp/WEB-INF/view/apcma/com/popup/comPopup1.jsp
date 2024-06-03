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
		,height					: null
		,tableHeader			: null
		,tableColumnNames		: null
		,tableColumnWidths		: null
		,itemSelectEvent		: null
	};
	$.extend(settings, options);	
	//console.log('settings:', settings);

	//css
 	$(modalId).find('.cu-table-div').css('height', settings.height);

	// get data
    var createTable = function() {
		
		//조회부분 
		var acnt = 0;
		var alen = settings.searchCaptions.length;
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
					htma += '<sbux-datepicker  ' + tmp3 + ' uitype="popup" ></sbux-datepicker>';
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
	    $(modalId).find('.cu-search-area').html(htma);
		
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
		} else {
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
			if(pstr){
				pstr = pstr.slice(0, -1);
			}			
		}
		
   		var paramObj = { 
   			V_P_DEBUG_MODE_YN	: ''
   			,V_P_LANG_ID		: ''
   			,V_P_COMP_CODE		: settings.compCode
   			,V_P_CLIENT_CODE	: settings.clientCode
   			,V_P_BIZCOMP_ID		: settings.bizcompId
   			,V_P_WHERE_CLAUSE	: wstr
   			,V_P_PROC_PARAMS	: pstr
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
	   	 	for (var j= 0; j < settings.tableColumnNames.length; j++) {
				var code = settings.tableColumnNames[j];
				tmp += '<td cu-name="' + code + '">' + list[i][code] + '</td>';
			}
			//비표시되는 컬럼
			var obj = list[i];
			for(var key in obj){
		   	 	for (var j= 0; j < settings.tableColumnNames.length; j++) {
					var code = settings.tableColumnNames[j];
					if(code!=key){
						tmp += '<td style="display:none" cu-name="' + key + '">' + obj[key] + '</td>';
					}
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
	$(modalId).find('.cu-btn-sch-compopup1').click(function(){
    	getData();
	});
	
	//close event
	$(modalId).find('.cu-btn-close-compopup1').click(function(){
	 	SBUxMethod.closeModal(modalDivId);
	});	
	
	//start
	getData();
	
}
 
</script>
</html>