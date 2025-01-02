<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title></title>
    
    <style>
		.cu-cancel-line {
		    text-decoration:line-through !important;
		}
		.cu-link-over a {
		    text-decoration:none;
		}
		.cu-link-over a:hover {
		    text-decoration:underline;
		}
    </style>
    
</head>
<body oncontextmenu="return false">
	<section id="compopfilemng">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start; padding-top: 0px" >
				<div>
					<div style="display:flex;float: right; padding-bottom:5px">
						<sbux-button uitype="normal" text="저장" 		style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-save" ></sbux-button>
						<sbux-button uitype="normal" text="링크추가" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-linkNew" ></sbux-button>
						<sbux-button uitype="normal" text="파일추가" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-fileNew" ></sbux-button>
						<sbux-button uitype="normal" text="종료" 		style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-close" ></sbux-button>
					</div>
					
					<table class="table table-bordered tbl_row tbl_fixed">
						<colgroup>
	                        <col style="width: 8%">
	                        <col style="width: 25%">
	
	                        <col style="width: 8%">
	                        <col style="width: 25%">
	
	                        <col style="width: 8%">
	                        <col style="width: 26%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="th_bg">소스유형</th>							
								<td class="td_input" >
									<input uitype="text" class="form-control input-sm cu-inp-source-type" readonly="readonly" value="">								
								</td>
								<th scope="th_bg">소스코드</th>							
								<td class="td_input" >
									<input uitype="text" class="form-control input-sm cu-inp-source-code" readonly="readonly" value="">								
								</td>
								<th scope="th_bg"></th>							
								<td class="td_input" >
								</td>
								<!-- 
								<th scope="th_bg">파일명</th>							
								<td class="td_input" >
									<input uitype="text" class="form-control input-sm cu-inp-file-name" value="">								
								</td>
								 -->
							</tr>
						</tbody>
					</table>
				</div>
			</div>
 
			<div class="box-body" style="padding-top: 0px">
				
				<div class="card" style="height:400px;border:1px solid #f4f4f4;overflow:auto;">
					<table class="table table-bordered table-hover cu-data-table">
				        <colgroup>
	                        <col style="width: 3%">
	                        <col style="width: 4%">
	                        <col style="width: 6%">
	                        <col style="width: 25%">
	                        <col style="width: 25%">
	                        <col style="width: 6%">
	                        <col style="width: 6%">
	                        <col style="width: 15%">
	                        <col style="width: 10%">
				        </colgroup>
						<thead class="thead-light" style="text-align:left;background-color:#f5fbff;position:sticky;top:0;z-index:3">
							<tr>
								<th style="text-align:left;"></th>
								<th style="text-align:left;">상태</th>
								<th style="text-align:left;">파일구분</th>
								<th style="text-align:left;">제목</th>
								<th style="text-align:left;">파일/링크/문서</th>
								<th style="text-align:left;">미리보기</th>
								<th style="text-align:left;">정렬순서</th>
								<th style="text-align:left;">등록시간</th>
								<th style="text-align:left;">등록자</th>
							</tr>
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
<script>
 
function compopfilemng(options) {
	
	//id 선언
	var modalId  		= '#compopfilemng';
	var modalDivId 		= 'modal-comPopFileMng';
	
	var chkLimitFile 	= ['zip','exe','dll','sh'];	//파일 업로드 제한 확장자 ['exe','dll','sh']
	var chkLimitSizeMB 	= 20;						//파일 업로드 제한 용량(MB,KB)
	var chkExtension 	= ['pdf','jpg','png'];		//미리보기 가능 확장자
	
	var settings = {
		compCode				: null
		,clientCode				: null
		,sourceType				: null
		,sourceCode				: null
		,formID					: null
		,menuId					: null    		
		,chkLimitFile			: null
		,chkLimitSizeMB			: null
	};
	$.extend(settings, options);	
	//console.log('settings:', settings);
	if(settings.chkLimitFile){
		chkLimitFile = settings.chkLimitFile;
	}
	if(settings.chkLimitSizeMB){
		chkLimitSizeMB = settings.chkLimitSizeMB;
	}
		
	//open modal
	SBUxMethod.openModal(modalDivId);
	
	$(modalId).find('.cu-inp-source-type').val(settings.sourceType);
	$(modalId).find('.cu-inp-source-code').val(settings.sourceCode);
	
	//미리보기 확장자 check
    const isPreview = function(str) {
		var chk = false;
		var val = str.toLowerCase();
   	 	for (var i= 0; i < chkExtension.length; i++) {
   	 		if(val.indexOf('.'+chkExtension[i]) !== -1){
   	 			chk = true;
   	 			break;
   	 		}
   	 	}
   	 	return chk;
    }
    
	//파일추가
    const fileAdd = async function() {
		var tmp = "";
		tmp += '<tr>';
		tmp += '<input type="hidden" class="cu-col-org-stat" 	value="">';
		tmp += '<input type="hidden" class="cu-col-chg-stat" 	value="N">';
		tmp += '<input type="hidden" class="cu-col-seq" 		value="">';
		
		tmp += '<input type="hidden" class="cu-col-seq" 		value="">';
		tmp += '<input type="hidden" class="cu-col-chk-yn" 		value="">';
		tmp += '<input type="hidden" class="cu-col-file-type" 	value="1">';
		tmp += '<td>';
		tmp += '<i class="far fa-trash-alt cu-tr-del" style="cursor:pointer;font-size:12px;margin-top:5px;margin-left:5px"></i>';		
		tmp += '</td>';
		tmp += '<td>신규</td>';
		tmp += '<td>파일</td>';
		tmp += '<td><input class="cu-title-input" style="width:100%" type="text" value=""></td>';
		
		tmp += '<td>';
		tmp += '<input style="width:100%" type="file" >';
		tmp += '<input type="hidden" class="cu-link-input" 	value="">';
		tmp += '</td>';
		
		tmp += '<td></td>';
		tmp += '<td><input class="cu-order-input" style="width:100%" type="text" value=""></td>';
		tmp += '<td></td>';
		tmp += '<td></td>';
		tmp += '</tr>';
   	 	$(modalId).find('.cu-data-table').find('tbody').append(tmp);
   	 	
   	 	$(modalId).find('.cu-data-table').find('tbody').find('tr').find('input[type=file]').last().trigger('click');
   	 	$(modalId).find('.cu-data-table').find('tbody').find('.cu-tr-del').last().click(function(){
   	 		$(this).closest('tr').remove();
   		});		
   	 	
   		//파일 확장자 및 크기 제한 -----------------------
   		var ltfileStr = "";
   		if(chkLimitFile == "" || chkLimitFile == undefined || chkLimitFile == "undefined" || chkLimitFile.length==0){
   			chkLimitFile = [];
   		} else {
   			for (var i = 0; i < chkLimitFile.length; i++) {
   				ltfileStr += chkLimitFile[i] + ", ";
   			}
   			ltfileStr += "파일은 업로드 할 수 없습니다.";
   		}
   		$(modalId).find('.cu-data-table').find('tbody').find('input[type=file]').last().change(function(event) {
   			if(!$(this).val()) {
   				$(this).closest('tr').find('td').eq(3).find('input').val('');
   				$(this).closest('tr').find('td').eq(5).html('');
   				return false;
   			}
   			var ext = $(this).val().split('.').pop().toLowerCase();
   			if($.inArray(ext,chkLimitFile)==-1){
   			} else {
   				alert(ltfileStr);
   				$(this).val('');
   				return false;
   			}
   			if(chkLimitSizeMB){
   				var fsize = gfnma_getFileSize($(this), 'MB');
   				if(fsize > Number(chkLimitSizeMB)){
   					alert('파일 용량은 ' + chkLimitSizeMB + 'MB 를 초과할 수 없습니다.');
   					$(this).val('');
   					return false;
   				}
   			}
			var fileValue 	= $(this).val().split("\\");
			var fileName 	= fileValue[fileValue.length-1];
   			//제목에 파일명 추가
			$(this).closest('tr').find('td').eq(3).find('input').val(fileName);
   		});	
	}
	
	//파일추가
	$(modalId).find('.cu-btn-fileNew').off('click');
	$(modalId).find('.cu-btn-fileNew').click(function(){
		fileAdd();
	});		
	
	//링크추가
    const linkAdd = async function() {
		var tmp = "";
		tmp += '<tr>';
		tmp += '<input type="hidden" class="cu-col-org-stat" 	value="">';
		tmp += '<input type="hidden" class="cu-col-chg-stat" 	value="N">';
		tmp += '<input type="hidden" class="cu-col-seq" 		value="">';
		
		tmp += '<input type="hidden" class="cu-col-seq" 		value="">';
		tmp += '<input type="hidden" class="cu-col-chk-yn" 		value="">';
		tmp += '<input type="hidden" class="cu-col-file-type" 	value="2">';
		tmp += '<td>';
		tmp += '<i class="far fa-trash-alt cu-tr-del" style="cursor:pointer;font-size:12px;margin-top:5px;margin-left:5px"></i>';		
		tmp += '</td>';
		tmp += '<td>신규</td>';
		tmp += '<td>링크</td>';
		tmp += '<td><input class="cu-title-input" style="width:100%" type="text" value=""></td>';
		tmp += '<td><input class="cu-link-input" style="width:100%" type="text" ></td>';
		tmp += '<td></td>';
		tmp += '<td><input class="cu-order-input" style="width:100%" type="text" value=""></td>';
		tmp += '<td></td>';
		tmp += '<td></td>';
		tmp += '</tr>';
   	 	$(modalId).find('.cu-data-table').find('tbody').append(tmp);
   	 	
   	 	$(modalId).find('.cu-data-table').find('tbody').find('.cu-tr-del').last().click(function(){
   	 		$(this).closest('tr').remove();
   		});		
	}
	
	//링크추가
	$(modalId).find('.cu-btn-linkNew').off('click');
	$(modalId).find('.cu-btn-linkNew').click(function(){
		linkAdd();
	});		
	
	//close event
	$(modalId).find('.cu-btn-close').off('click');
	$(modalId).find('.cu-btn-close').click(function(){
	 	SBUxMethod.closeModal(modalDivId);
	});		
	
	// get data
    const getData = async function() {
    	
   		var paramObj = { 
   			V_P_DEBUG_MODE_YN	: ''
   			,V_P_LANG_ID		: ''
   			,V_P_COMP_CODE		: settings.compCode
   			,V_P_CLIENT_CODE	: settings.clientCode
   			,V_P_FILE_NAME		: ''
   			,V_P_SOURCE_TYPE	: settings.sourceType
   			,V_P_SOURCE_CODE	: settings.sourceCode
   			,V_P_USER			: ''
   			,V_P_FORM_ID		: settings.formID
   			,V_P_MENU_ID		: settings.menuId
   			,V_P_PROC_ID		: ''
   			,V_P_USERID			: ''
   			,V_P_PC				: ''
   		};
    	const postJsonPromise = gfn_postJSON("/com/comFileList.do", {
	        getType				: 'json',
	        workType			: 'Q',
	        cv_count			: '1',
	        params				: gfnma_objectToString(paramObj)
  		});
  	    const data = await postJsonPromise;
    	console.log('popup file get data:', data);
   		
    	//create td
		var tmp 		= "";
		var list 		= data.cv_1;
		var ftype 		= "";
		var ftypeName 	= "";
		var pvchk		= "";
		
   	 	for (var i= 0; i < list.length; i++) {
   	 		
   	 		ftype 		= list[i]['FILE_TYPE'];
   	 		ftypeName	= (ftype=='1') ? '파일' : '링크';
   	 		pvchk		= isPreview(list[i]['FILE_NM']) ? 'Y' : 'N';	
   	 		
			tmp += '<tr class="cu-link-over">';
			tmp += '<input type="hidden" class="cu-col-org-stat" 	value="A">';
			tmp += '<input type="hidden" class="cu-col-chg-stat" 	value="">';
			
			tmp += '<input type="hidden" class="cu-col-seq" 		value="' + list[i]['SEQ'] + '">';
			tmp += '<input type="hidden" class="cu-col-chk-yn" 		value="' + list[i]['CHK_YN'] + '">';
			tmp += '<input type="hidden" class="cu-col-file-type" 	value="' + ftype + '">';
			tmp += '<input type="hidden" class="cu-col-server-file-name" 	value="' + list[i]['SRVR_FILE_NM'] + '">';
			
			tmp += '<td style="text-align:center">';
			tmp += '<i title="삭제" class="far fa-close cu-filedelchk" style="cursor:pointer;font-size:14px;color:red;margin-right:5px"></i>';
			tmp += '</td>';
			tmp += '<td>기존</td>';
			tmp += '<td>' + ftypeName + '</td>';
			tmp += '<td><input class="cu-delchk-input cu-title-input" style="width:100%" type="text" value="' + list[i]['MEMO'] + '"></td>';
			
			if(ftype=='1'){
				tmp += '<td>';
				tmp += '<a download class="cu-delchk-alink cu-filedn-link" style="font-weight:bold;color:blue;" href="#">' + list[i]['FILE_NM'] + '</a>';
				tmp += '<input type="hidden" class="cu-link-input" 	value="">';
				tmp += '</td>';
			} else {
				tmp += '<td><input class="cu-delchk-input cu-link-input" style="width:100%" type="text" value="' + list[i]['FILE_NM'] + '"></td>';
			}
			
			if(pvchk=='Y'){
				tmp += '<td>';
				tmp += '<a href="#" class="cu-file-preview" style="font-weight:bold;color:blue;text-decoration:underline">' + pvchk + '</a>';
				tmp += '</td>';
			} else {
				tmp += '<td>N</td>';
			}
			tmp += '<td><input class="cu-order-input" style="width:100%" type="text" value="' + list[i]['SORT_SEQ'] + '"></td>';
			tmp += '<td>' + list[i]['WRT_DT'] + '</td>';
			tmp += '<td>' + list[i]['WRT_USER'] + '</td>';
			tmp += '</tr>';
		}
   	 	$(modalId).find('.cu-data-table').find('tbody').html(tmp);
   	 	
   		//파일다운로드클릭 -----------------------------
  		$(modalId).find('.cu-data-table').find(".cu-filedn-link").click(function(event){
  			event.preventDefault();
  			var url = '/com/getFileDown.do';
   	 		url	+= '?fkey=' + $(this).closest('tr').find('.cu-col-server-file-name').val();
   	 		url	+= '&comp_code=' + settings.compCode;
   			url += '&client_code=' + settings.clientCode;
   			//window.open(url);
   			$('#downloadFrame').attr('src', url);
   		});
   		//-------------------------------------------
   	 	
   		//미리보기클릭 -----------------------------
  		$(modalId).find('.cu-data-table').find(".cu-file-preview").click(function(event){
	   	 	
  			event.preventDefault();
	   	 	var fkey 		= $(this).closest('tr').find('.cu-col-server-file-name').val();
	   	 	var comp_code	= settings.compCode;	
	   	 	var client_code	= settings.clientCode;	
	   	 	var fileName	= $(this).closest('tr').find('.cu-filedn-link').text();
   	 		if(fileName.indexOf('.pdf') !== -1){
	 	 		//pdf
	   			var url = '/com/getPdfFileDown.do';
	   			url		+= '?fkey=' + fkey;
	   			url		+= '&comp_code=' + comp_code;
	   			url		+= '&client_code=' + client_code;
			   	console.log('url:', url);
			   	let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1200, height=800, top=0,left=0";
			   	window.open(url,"_blank", options);	 	 		
  	 		} else {
  	 			//image
	   	 		compopfileview2(fkey, comp_code, client_code); 
  	 		}	   	 		
   		});
   		//-------------------------------------------
   		
   		//파일삭제클릭 -----------------------------
   		$(modalId).find('.cu-data-table').find(".cu-filedelchk").click(function(){
   			var val = $(this).closest('tr').find('.cu-col-chg-stat').val();
   			if(val){
   				$(this).removeClass('fa-rotate-left').addClass('fa-close').css('color','red');
   				$(this).closest('tr').find('.cu-col-chg-stat').val('');
   				$(this).closest('tr').find('td').eq(1).html('기존').css('color', '');
   				$(this).closest('tr').find('td').eq(2).removeClass('cu-cancel-line');
   				$(this).closest('tr').find('.cu-delchk-input').prop('disabled', false).removeClass('cu-cancel-line');
   				$(this).closest('tr').find('.cu-delchk-alink').removeClass('cu-cancel-line');
   				$(this).closest('tr').find('td').eq(4).removeClass('cu-cancel-line');
   				$(this).closest('tr').find('td').eq(5).removeClass('cu-cancel-line');
   				$(this).closest('tr').find('td').eq(6).removeClass('cu-cancel-line');
   				$(this).closest('tr').find('td').eq(7).removeClass('cu-cancel-line');
   				$(this).closest('tr').find('td').eq(8).removeClass('cu-cancel-line');
   			} else {
   				$(this).removeClass('fa-close').addClass('fa-rotate-left').css('color','');
   				$(this).closest('tr').find('.cu-col-chg-stat').val('D');
   				$(this).closest('tr').find('td').eq(1).html('삭제').css('color', 'red');
   				$(this).closest('tr').find('td').eq(2).addClass('cu-cancel-line');
   				$(this).closest('tr').find('.cu-delchk-input').prop('disabled', true).addClass('cu-cancel-line');
   				$(this).closest('tr').find('.cu-delchk-alink').addClass('cu-cancel-line');
   				$(this).closest('tr').find('td').eq(4).addClass('cu-cancel-line');
   				$(this).closest('tr').find('td').eq(5).addClass('cu-cancel-line');
   				$(this).closest('tr').find('td').eq(6).addClass('cu-cancel-line');
   				$(this).closest('tr').find('td').eq(7).addClass('cu-cancel-line');
   				$(this).closest('tr').find('td').eq(8).addClass('cu-cancel-line');
   			}
   		});
   		//-------------------------------------------
   		
    };	
    getData();
    
	//저장
    const saveFileAndLink = async function() {
		
		var trTarget	= $(modalId).find('.cu-data-table').find('tbody').find('tr');
    	
		//저장전 자료점검 --------------------------------------------------------------------   	
		var isChk		= true;
		var msg			= '';
		trTarget.each(function(){
   	 		var tmp = [];
   	 		if($(this).find('.cu-col-org-stat').val()!='A'){
   	 			//신규 파일,링크만 check
   	   	 		if($(this).find('.cu-col-file-type').val()=='1'){
   	   	 			//파일
   	   	 			if($(this).find('[type=file]').val()==''){
   	   	 				isChk = false;
   	   	 				msg = '파일 추가된 부분에 파일이 선택되지 않았습니다.\n해당 행을 삭제하신 후 저장 하세요';
   	   	 				return false;
   	   	 			}
   	   	 		} else if($(this).find('.cu-col-file-type').val()=='2'){
   	   	 			//링크
   	   	 			if($(this).find('.cu-link-input').val()==''){
   	   	 				isChk = false;
   	   	 				msg = '링크 추가된 부분에 링크내용이 입력되지 않았습니다.\n해당 행을 삭제하신 후 저장 하세요';
   	   	 				return false;
   	   	 			}
   	   	 		}
   	 		}
   	 	});
		if(!isChk){
			alert(msg);
			return false;
		}
    	//---------------------------------------------------------------------------------
   	 	
    	var paramData 	= new FormData();
    	var slist		= [];
    	var idx			= 0;
   	 	trTarget.each(function(){
   	 		var obj = {};
   	 		idx ++;
 			obj['IDX'] 			= idx;
 			obj['ORG_STAT'] 	= $(this).find('.cu-col-org-stat').val();
 			obj['CHG_STAT'] 	= $(this).find('.cu-col-chg-stat').val();
 			obj['SEQ'] 			= $(this).find('.cu-col-seq').val();
 			obj['FILE_TYPE'] 	= $(this).find('.cu-col-file-type').val();
 			obj['TITLE_TXT']	= $(this).find('.cu-title-input').val();
 			obj['LINK_TXT'] 	= $(this).find('.cu-link-input').val();
 			obj['ORD_SEQ'] 		= ($(this).find('.cu-order-input').val()) ? $(this).find('.cu-order-input').val() : "0";
 			slist.push(obj);
   	 	});
   	 	trTarget.find('input[type=file]').each(function(){
			var files = $(this).get(0).files;
			console.log("files ==========================> ", files);
			if(files.length > 0) {
				paramData.append("files", files[0]);
			}   	 		
   	 	})
    	
   		paramData.append("slist", 			JSON.stringify(slist));
   		//paramData.append("slist", 			slist);
   		
   		paramData.append("comp_code", 		settings.compCode);
   		paramData.append("client_code", 	settings.clientCode);
   		paramData.append("source_type", 	settings.sourceType);
   		paramData.append("source_code", 	settings.sourceCode);
   		paramData.append("formID", 			settings.formID);
   		paramData.append("menuId", 			settings.menuId);
   		
		const postJsonPromise = gfn_postFormData("/com/saveFile.do", paramData);
		const data = await postJsonPromise;
    	
        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
            	gfn_comAlert("I0001");	
            	getData();
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
	
	 	SBUxMethod.closeModal(modalDivId);
	}    
    
	//저장 event
	$(modalId).find('.cu-btn-save').off('click');
	$(modalId).find('.cu-btn-save').click(function(){
		saveFileAndLink();
	});		
	
}
 
 
</script>
</html>
