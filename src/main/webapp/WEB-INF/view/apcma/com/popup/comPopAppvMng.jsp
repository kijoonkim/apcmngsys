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
		.cu-table-selected {
		    background-color: #adddff; 
		    font-weight:bold;
		}		
    </style>
    
</head>
<body oncontextmenu="return false">
	<section id="compopappvmng">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start; padding-top: 0px" >
				<div>
					<div style="display:flex;float: right; padding-bottom:5px">
						<sbux-button uitype="normal" text="결재삭제" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-delete" ></sbux-button>
						<sbux-button uitype="normal" text="회수" 		style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-collect" ></sbux-button>
						<sbux-button uitype="normal" text="조회" 		style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-find" ></sbux-button>
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
								<th scope="th_bg">법인</th>							
								<td class="td_input" >
									<input uitype="text" class="form-control input-sm cu-inp-comp-code" disabled="disabled" value="">								
								</td>
								<th scope="th_bg">부서코드</th>							
								<td class="td_input" >
									<input uitype="text" class="form-control input-sm cu-inp-txtdept-code" value="">								
								</td>
								<th scope="th_bg">부서명</th>							
								<td class="td_input" >
									<input uitype="text" class="form-control input-sm cu-inp-txtdept-name" value="">								
								</td>
							</tr>
							<tr>
								<th scope="th_bg"></th>							
								<td class="td_input" >
								</td>
								<th scope="th_bg">사원코드</th>							
								<td class="td_input" >
									<input uitype="text" class="form-control input-sm cu-inp-txtemp-code" value="">								
								</td>
								<th scope="th_bg">사원명</th>							
								<td class="td_input" >
									<input uitype="text" class="form-control input-sm cu-inp-txtemp-name" value="(실장)(협)장성주">								
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="box-body" style="padding-top: 0px">
				<div class="card" style="display:flex;">
				
					<div style="width:30%">
						<div style="display:flex;height:35px">
							<p>사원</p>
						</div>
						<div style="border:1px solid #d1cece;height:350px">
                            <div id="sb-popTreeGrid" style="height:350px; width:100%;"></div>
						</div>
					</div>
					
					<div style="width:3%;height:350px;text-align:center;display:table-cell;vertical-align:middle;">
						<div style="display:inline-block;margin-top:200px">
							<a href="" class="cu-emp-add">
								<img src="../../../resource/images/arrow_right.png" width="20px" />
							</a>
						</div>
					</div>
					
					<div style="width:67%">
						<div style="display:flex;height:35px">
							<div style="width:60%;display:flex;vertical-align:middle;">
								<p style="padding-right:10px">승인경로</p>
								<!-- 
								<div class="dropdown">
								    <button style="width:400px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="APPR_PATH_LIST" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    	<font>선택</font>
								        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
								    </button>
								    <div class="dropdown-menu" aria-labelledby="APPR_PATH_LIST" style="width:300px;height:150px;padding-top:0px;overflow:auto">
								    </div>
								</div>                                    
								 -->
							</div>
							<div style="width:40%;text-align:right">
								<sbux-button uitype="normal" text="행삭제" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-rowdel" ></sbux-button>
								<sbux-button uitype="normal" text="위로" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-up" ></sbux-button>
								<sbux-button uitype="normal" text="아래로" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-down" ></sbux-button>
							</div>
						</div>
						<div style="overflow:auto;border:1px solid #d1cece;height:350px">
							<table class="table table-bordered table-hover cu-basic-table" style="min-width:1570px">
						        <colgroup>
			                        <col style="width: 50px">
			                        <col style="width: 80px">
			                        <col style="width: 60px">
			                        <col style="width: 120px">
			                        <col style="width: 80px">
			                        <col style="width: 80px">
			                        <col style="width: 100px">
			                        <col style="width: 100px">
			                        <col style="width: 100px">
			                        <col style="width: 100px">
			                        <col style="width: 100px">
			                        <col style="width: 100px">
			                        <col style="width: 100px">
			                        <col style="width: 100px">
			                        <col style="width: 100px">
			                        <col style="width: 100px">
			                        <col style="width: 100px">
						        </colgroup>
								<thead class="thead-light" style="text-align:left;background-color:#f5fbff;position:sticky;top:0;z-index:3">
									<tr>
										<th style="text-align:left;">순번</th>
										<th style="text-align:left;">결재구분</th>
										<th style="text-align:left;">구분</th>
										<th style="text-align:left;">부서</th>
										<th style="text-align:left;">직책</th>
										<th style="text-align:left;">사원</th>
										<th style="text-align:left;">승인수임자명</th>
										<th style="text-align:left;">결과</th>
										<th style="text-align:left;">결재일자</th>
										<th style="text-align:left;">결재의견</th>
										<th style="text-align:left;">비고</th>
										<th style="text-align:left;">생성자ID</th>
										<th style="text-align:left;">생성일시</th>
										<th style="text-align:left;">생성PC</th>
										<th style="text-align:left;">변경자ID</th>
										<th style="text-align:left;">변경일시</th>
										<th style="text-align:left;">변경PC</th>
									</tr>
								</thead>
								<tbody style="vertical-align:middle;">
								</tbody>
						    </table>
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="box-body" style="padding-top:0px;padding-bottom:10px">
				<div class="card" style="display:flex;">
					<div style="width:86%;height:60px;display:flex">
						<div style="width:7%">
							<p style="padding-right:10px">결재의견</p>
						</div>
						<div style="width:93%">
							<textarea class="cu-txt-opinion" style="width:100%" rows="3" cols=""></textarea>
						</div>
					</div>
					<div style="width:14%;height:60px;text-align:right;padding-left:10px">
						<sbux-button uitype="normal" text="승인" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-okresult" ></sbux-button>
						<sbux-button uitype="normal" text="반려" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-okcancel" ></sbux-button>
					</div>
				</div>
			</div>
			
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script>

var _compopappvmng_treeGrid; 					// 트리그리드를 담기위한 객체 선언
var _compopappvmng_jsonTreeList		= []; 		// 트리그리드의 참조 데이터 주소 선언
var _compopappvmng_treeGridSelRow	= null;		// 트리그리드를 선택한 행

var _compopappvmng_fnTreeView = function(){
	var nCol = _compopappvmng_treeGrid.getCol();
    //특정 열 부터 이벤트 적용
    if (nCol < 1) {
        return;
    }
    var nRow = _compopappvmng_treeGrid.getRow();
	if (nRow < 1) {
        return;
	}

	_compopappvmng_treeGridSelRow = _compopappvmng_treeGrid.getRowData(nRow);	
	console.log('treeGrid rowData:', _compopappvmng_treeGridSelRow);
}

function compopappvmng(options) {
	
	//id 선언
	var modalId  		= '#compopappvmng';
	var modalDivId 		= 'modal-comPopAppvMng';
	
	var settings = {
		workType				: null
		,compCode				: null
		,compCodeNm				: null
		,clientCode				: null
		,apprId					: null
		,sourceNo				: null
		,sourceType				: null
		,empCode				: null
		,formID					: null
		,menuId					: null    		
	};
	$.extend(settings, options);	
	//console.log('settings:', settings);
	
	//open modal
	SBUxMethod.openModal(modalDivId);
	
	//상단 조회 표시
	$(modalId).find('.cu-inp-comp-code').val(settings.compCodeNm);
	$(modalId).find('.cu-inp-txtdept-code').val('');
	$(modalId).find('.cu-inp-txtdept-name').val('');
	$(modalId).find('.cu-inp-txtemp-code').val('');
	$(modalId).find('.cu-inp-txtemp-name').val('');
	
	//상신:TEMPLATE , 승인(반려):APPR
	if(settings.workType=='TEMPLATE'){
		$(modalId).find('.cu-btn-delete').hide();
	} else if(settings.workType=='APPR'){
		//승인(상신X)인 경우 행삭제,위로,아래로,반려 버튼이 안보인다.
		$(modalId).find('.cu-btn-rowdel').hide();
		$(modalId).find('.cu-btn-up').hide();
		$(modalId).find('.cu-btn-down').hide();
		$(modalId).find('.cu-btn-okcancel').hide();
	}
	
	//승인경로
// 	gfnma_multiSelectInit({
// 		target			: ['#APPR_PATH_LIST']
// 		,compCode		: settings.compCode
// 		,clientCode		: settings.clientCode
// 		,bizcompId		: 'L_APPR_TEMPLATE'
// 		,whereClause	: ''
// 		,formId			: p_formId
// 		,menuId			: p_menuId
// 		,selectValue	: ''
// 		,dropType		: 'down' 	// up, down
// 		,dropAlign		: 'left' 	// left, right
// 		,colValue		: 'TEMPLATE_ID'
// 		,colLabel		: 'TEMPLATE_NAME'
// 		,columns		:[
//             {caption: "코드",		ref: 'TEMPLATE_ID', 			width:'150px',  	style:'text-align:left'},
//             {caption: "이름", 		ref: 'TEMPLATE_NAME',    		width:'150px',  	style:'text-align:left'}
// 		]
// 	})
	
	//사원 트리 가져오기 --------------------------------------------------------------
    var fn_createTreeGrid = function(){
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-popTreeGrid';
	    SBGridProperties.id 				= '_compopappvmng_treeGrid';
	    SBGridProperties.jsonref 			= '_compopappvmng_jsonTreeList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.tree = {
	        col: 1,
	        levelref: "LEVEL",
	        open: true,
	        lock: true
        };
        SBGridProperties.columns = [
            {caption : ['사원'],			ref: 'DEPT_NAME', 		type:'output',  	width:'250px',  	style:'text-align:left'}
        ];
        _compopappvmng_treeGrid	= _SBGrid.create(SBGridProperties);
        _compopappvmng_treeGrid.bind('click', '_compopappvmng_fnTreeView');
    };
    fn_createTreeGrid();
    
    var fn_treeSearch = async function() {

    	var paramObj = {
			 V_P_DEBUG_MODE_YN       : ''
			,V_P_LANG_ID             : ''
			,V_P_COMP_CODE           : settings.compCode
			,V_P_CLIENT_CODE         : settings.clientCode
			,V_P_APPR_ID             : ''
			,V_P_SOURCE_NO           : ''
			,V_P_SOURCE_TYPE         : ''
			,V_P_DEPT_CODE           : ''
			,V_P_DEPT_NAME           : ''
			,V_P_COST_CENTER_CODE    : ''
			,V_P_EMP_CODE            : ''
			,V_P_EMP_NAME            : ''
			,V_P_DOC_TYPE            : ''
			,V_P_SEQ                 : ''
			,V_P_SOURCE_SYS          : ''
			,V_P_SUB_CODE1           : ''
			,V_P_SUB_CODE2           : ''
			,V_P_SUB_CODE3           : ''
			,V_P_SUB_CODE4           : ''
			,V_P_SUB_CODE5           : ''
			,V_P_AMOUNT              : ''
			,V_P_USER_ID             : ''    	   
			,V_P_FORM_ID             : settings.formID
			,V_P_MENU_ID             : settings.menuId
			,V_P_PROC_ID             : ''
			,V_P_USERID              : ''
			,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/com/comApprEmpList.do", {
			getType				: 'json',
			workType			: 'DEPTHIER',
			cv_count			: '3',
			params				: gfnma_objectToString(paramObj)
		});
    	const data = await postJsonPromise;
    	console.log('popup appr tree data:', data);

    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
	
	    	   	/** @type {number} **/
	    		let totalRecordCount = 0;
	    	   	
	    	   	data.cv_1.forEach((item, index) => {
		    		const msg = {
		    				LEVEL				: item.LV,
		    				TYPE				: item.TYPE,
		    				DEPT_NAME			: gfnma_nvl(item.DEPT_NAME),
		    				DEPT_CODE			: gfnma_nvl(item.DEPT_CODE),
		    				DEPT_NAME1			: gfnma_nvl(item.DEPT_NAME1),
		    				DUTY_CODE			: gfnma_nvl(item.DUTY_CODE),
		    				DUTY_NAME			: gfnma_nvl(item.DUTY_NAME),
		    				EMP_CODE			: gfnma_nvl(item.EMP_CODE),
		    				EMP_NAME			: gfnma_nvl(item.EMP_NAME),
		    		}
		    		_compopappvmng_jsonTreeList.push(msg);
		    		totalRecordCount ++;
		    	});
	    	   	
	    	   	_compopappvmng_treeGrid.rebuild();
	        	//console.log('_compopappvmng_jsonTreeList :', _compopappvmng_jsonTreeList);
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
    fn_treeSearch();
	//----------------------------------------------------------------------------
	
	//결재 경로 관련--------------------------------------------------------------
	// cu-type: A:결재자, B:결재경로에 따라 표시된 사원, C:사원트리에서 행추가된 사원
	
	// 넘버링
	var fn_reNumberingBasicGrid = function(){
		var cnt = 0;
		$('#compopappvmng').find('.cu-basic-table').find('tbody tr').each(function(){
			cnt ++;
			$(this).find('td').eq(0).text(cnt);
		});
	}
	
	// tr 클릭 event
	var fn_trClickBasicGrid = function(){
		$('#compopappvmng').find('.cu-basic-table').find('tbody tr').off('click');
		$('#compopappvmng').find('.cu-basic-table').find('tbody tr').click(function(){
		     if($(this).hasClass("cu-table-selected")){
		        $(this).removeClass('cu-table-selected');
		     } else {
		        $(this).addClass('cu-table-selected').siblings().removeClass('cu-table-selected');
		     }
		});		
	}
	
	// 중복check
	var fn_dpcAddRowBasicGrid = function(user){
		var bol = false;
		$('#compopappvmng').find('.cu-basic-table').find('tbody tr').each(function(){
			var emp_code = $(this).attr('cu-col-emp-code');
			if(emp_code == user){
				bol = true;
				return false;
			}
		});
		return bol;
	}
	
	//행추가
	var fn_addRowBasicGrid = function(obj){
		var htm = '';
		htm += '<tr cu-type="C" ';
		htm += ' cu-col-step-seq="' 		+ gfnma_nvl(obj['STEP_SEQ']) + '" ';
		htm += ' cu-col-appr-type="' 		+ gfnma_nvl(obj['APPR_TYPE']) + '" ';
		htm += ' cu-col-appr-category="' 	+ gfnma_nvl(obj['APPR_CATEGORY']) + '" ';
		htm += ' cu-col-appr-process="' 	+ gfnma_nvl(obj['APPR_PROCESS']) + '" ';
		htm += ' cu-col-dept-code="' 		+ gfnma_nvl(obj['DEPT_CODE']) + '" ';
		htm += ' cu-col-emp-code="' 		+ gfnma_nvl(obj['EMP_CODE']) + '" ';
		htm += ' cu-col-appr-status="' 		+ gfnma_nvl(obj['APPR_STATUS']) + '" ';
		htm += ' cu-col-appr-date="' 		+ gfnma_nvl(obj['APPR_DATE']) + '" ';
		htm += ' cu-col-appr-opinion="' 	+ gfnma_nvl(obj['APPR_OPINION']) + '" ';
		htm += ' cu-col-description="' 		+ gfnma_nvl(obj['DESCRIPTION']) + '" ';
		htm += ' cu-col-proxy-emp-code="' 	+ gfnma_nvl(obj['PROXY_EMP_CODE']) + '" ';
		htm += ' cu-col-insert-userid="' 	+ gfnma_nvl(obj['INSERT_USERID']) + '" ';
		htm += ' cu-col-insert-time="' 		+ gfnma_nvl(obj['INSERT_TIME']) + '" ';
		htm += ' cu-col-insert-pc="' 		+ gfnma_nvl(obj['INSERT_PC']) + '" ';
		htm += ' cu-col-update-userid="' 	+ gfnma_nvl(obj['UPDATE_USERID']) + '" ';
		htm += ' cu-col-update-time="' 		+ gfnma_nvl(obj['UPDATE_TIME']) + '" ';
		htm += ' cu-col-update-pc="' 		+ gfnma_nvl(obj['UPDATE_PC']) + '" ';		
		
		htm += ' >';
		
		htm += '<td>' + gfnma_nvl(obj['STEP_SEQ']) 			+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['APPR_CATEGORY'])		+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['APPR_TYPE'])			+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['DEPT_NAME1'])		+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['DUTY_NAME'])			+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['EMP_NAME']) 			+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['PROXY_EMP_NAME']) 	+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['APPR_STATUS']) 		+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['APPR_DATE']) 		+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['APPR_OPINION']) 		+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['DESCRIPTION']) 		+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['INSERT_USERID']) 	+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['INSERT_TIME']) 		+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['INSERT_PC']) 		+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['UPDATE_USERID']) 	+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['UPDATE_TIME']) 		+ '</td>';
		htm += '<td>' + gfnma_nvl(obj['UPDATE_PC']) 		+ '</td>';
		htm += '</tr>';
		$('#compopappvmng').find('.cu-basic-table').find('tbody').append(htm);		
		fn_reNumberingBasicGrid();
		fn_trClickBasicGrid();		
	}
	
	//그리드 셋팅
	var fn_createBasicGrid = function(list){
		
		var htm = '';
		for (var i = 0; i < list.length; i++) {
			var obj = list[i];
			if(settings.empCode == obj['EMP_CODE']){
				htm += '<tr cu-type="A" ';
			} else {
				htm += '<tr cu-type="B" ';
			}
			htm += ' cu-col-step-seq="' 		+ gfnma_nvl(obj['STEP_SEQ']) + '" ';
			htm += ' cu-col-appr-type="' 		+ gfnma_nvl(obj['APPR_TYPE']) + '" ';
			htm += ' cu-col-appr-category="' 	+ gfnma_nvl(obj['APPR_CATEGORY']) + '" ';
			htm += ' cu-col-appr-process="' 	+ gfnma_nvl(obj['APPR_PROCESS']) + '" ';
			htm += ' cu-col-dept-code="' 		+ gfnma_nvl(obj['DEPT_CODE']) + '" ';
			htm += ' cu-col-emp-code="' 		+ gfnma_nvl(obj['EMP_CODE']) + '" ';
			htm += ' cu-col-appr-status="' 		+ gfnma_nvl(obj['APPR_STATUS']) + '" ';
			htm += ' cu-col-appr-date="' 		+ gfnma_nvl(obj['APPR_DATE']) + '" ';
			htm += ' cu-col-appr-opinion="' 	+ gfnma_nvl(obj['APPR_OPINION']) + '" ';
			htm += ' cu-col-description="' 		+ gfnma_nvl(obj['DESCRIPTION']) + '" ';
			htm += ' cu-col-proxy-emp-code="' 	+ gfnma_nvl(obj['PROXY_EMP_CODE']) + '" ';
			htm += ' cu-col-insert-userid="' 	+ gfnma_nvl(obj['INSERT_USERID']) + '" ';
			htm += ' cu-col-insert-time="' 		+ gfnma_nvl(obj['INSERT_TIME']) + '" ';
			htm += ' cu-col-insert-pc="' 		+ gfnma_nvl(obj['INSERT_PC']) + '" ';
			htm += ' cu-col-update-userid="' 	+ gfnma_nvl(obj['UPDATE_USERID']) + '" ';
			htm += ' cu-col-update-time="' 		+ gfnma_nvl(obj['UPDATE_TIME']) + '" ';
			htm += ' cu-col-update-pc="' 		+ gfnma_nvl(obj['UPDATE_PC']) + '" ';
			htm += ' >';
			
			htm += '<td>' + (i+1) + '</td>';
			htm += '<td>' + gfnma_nvl(obj['APPR_CATEGORY_NAME'])	+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['APPR_TYPE_NAME'])		+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['DEPT_NAME'])			+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['DUTY_NAME'])			+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['EMP_NAME']) 			+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['PROXY_EMP_NAME']) 	+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['APPR_STATUS']) 		+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['APPR_DATE']) 		+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['APPR_OPINION']) 		+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['DESCRIPTION']) 		+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['INSERT_USERID']) 	+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['INSERT_TIME']) 		+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['INSERT_PC']) 		+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['UPDATE_USERID']) 	+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['UPDATE_TIME']) 		+ '</td>';
			htm += '<td>' + gfnma_nvl(obj['UPDATE_PC']) 		+ '</td>';
			htm += '</tr>';
		}
		$('#compopappvmng').find('.cu-basic-table').find('tbody').html(htm);
		fn_reNumberingBasicGrid();
		fn_trClickBasicGrid();		
	}
	
	//결재경로 가져오기
    var fn_basicSearch = async function() {

    	var paramObj = {
			 V_P_DEBUG_MODE_YN       : ''
			,V_P_LANG_ID             : ''
			,V_P_COMP_CODE           : settings.compCode
			,V_P_CLIENT_CODE         : settings.clientCode
			,V_P_APPR_ID             : settings.apprId
			,V_P_SOURCE_NO           : settings.sourceNo
			,V_P_SOURCE_TYPE         : settings.sourceType
			,V_P_DEPT_CODE           : ''
			,V_P_DEPT_NAME           : ''
			,V_P_COST_CENTER_CODE    : ''
			,V_P_EMP_CODE            : settings.empCode
			,V_P_EMP_NAME            : ''
			,V_P_DOC_TYPE            : ''
			,V_P_SEQ                 : '0'
			,V_P_SOURCE_SYS          : 'FCM'
			,V_P_SUB_CODE1           : ''
			,V_P_SUB_CODE2           : ''
			,V_P_SUB_CODE3           : ''
			,V_P_SUB_CODE4           : ''
			,V_P_SUB_CODE5           : ''
			,V_P_AMOUNT              : '0'
			,V_P_USER_ID             : settings.empCode    	   
			,V_P_FORM_ID             : settings.formID
			,V_P_MENU_ID             : settings.menuId
			,V_P_PROC_ID             : ''
			,V_P_USERID              : ''
			,V_P_PC                  : ''
	    };
    	
		const postJsonPromise = gfn_postJSON("/com/comApprEmpList.do", {
			getType				: 'json',
			workType			: settings.workType,
			cv_count			: '3',
			params				: gfnma_objectToString(paramObj)
		});
    	const data = await postJsonPromise;
    	console.log('popup appr basic data:', data);

    	var dlist = [];
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
	
	    	   	/** @type {number} **/
	    		let totalRecordCount = 0;
	    	   	
	    	   	data.cv_3.forEach((item, index) => {
		    		const msg = {
		    				APPR_SOURCE_TYPE	: item.APPR_SOURCE_TYPE,
		    				APPR_CATEGORY		: item.APPR_CATEGORY,
		    				APPR_CATEGORY_NAME	: item.APPR_CATEGORY_NAME,
		    				APPR_TYPE			: item.APPR_TYPE,
		    				APPR_TYPE_NAME		: item.APPR_TYPE_NAME,
		    				DEPT_CODE			: item.DEPT_CODE,
		    				DEPT_NAME			: item.DEPT_NAME,
		    				DUTY_CODE			: item.DUTY_CODE,
		    				DUTY_NAME			: item.DUTY_NAME,
		    				EMP_CODE			: item.EMP_CODE,
		    				EMP_NAME			: item.EMP_NAME,
		    				STEP_SEQ			: item.STEP_SEQ
		    		}
		    		dlist.push(msg);
		    		totalRecordCount ++;
		    	});
	        	console.log('dlist :', dlist);
	        	fn_createBasicGrid(dlist);	        	
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
    fn_basicSearch();	
	//[end ] / 결재 경로 관련 ---------------------------------------------------------
	
	//사원 추가하기
	$(modalId).find('.cu-emp-add').off('click');
	$(modalId).find('.cu-emp-add').click(function(e){
		e.preventDefault();
		if(_compopappvmng_treeGridSelRow['TYPE']=='DEPT'){
            gfn_comAlert("W0001", "사원");
			return false;
		};
		if(fn_dpcAddRowBasicGrid(_compopappvmng_treeGridSelRow['EMP_CODE'])){
            gfn_comAlert("E0000", "선택하신 사원이 승인 경로에 있습니다.");
			return false;
		}
		fn_addRowBasicGrid(_compopappvmng_treeGridSelRow);
	});		
	
	//행삭제
	$(modalId).find('.cu-btn-rowdel').off('click');
	$(modalId).find('.cu-btn-rowdel').click(function(){
		var tar = $('#compopappvmng').find('.cu-basic-table').find('tbody').find('.cu-table-selected');
		if(tar.length==0){
            gfn_comAlert("E0000", "삭제하실 사원을 선택하세요");
			return false;
		}
		var cu_type = tar.eq(0).attr('cu-type');
		if(cu_type=='A'){
            gfn_comAlert("E0000", "상신자는 삭제할 수 없습니다.");
			return false;
		} else {
			tar.eq(0).remove();
		}
	});		
	
	//위로
	$(modalId).find('.cu-btn-up').off('click');
	$(modalId).find('.cu-btn-up').click(function(){
		var tar 	= $('#compopappvmng').find('.cu-basic-table').find('tbody').find('.cu-table-selected').eq(0);
		if(tar.prev()){
			if(tar.prev().attr('cu-type')=='A'){
	            gfn_comAlert("E0000", "상신자 위로 순서를 변경할 수 없습니다.");
				return false;
			} else {
				tar.prev().before(tar);				
				fn_reNumberingBasicGrid();
			}
		}
	});		
	
	//아래로
	$(modalId).find('.cu-btn-down').off('click');
	$(modalId).find('.cu-btn-down').click(function(){
		var tar = $('#compopappvmng').find('.cu-basic-table').find('tbody').find('.cu-table-selected').eq(0);
		if(tar.attr('cu-type')=='A'){
            gfn_comAlert("E0000", "상신자 위로 순서를 변경할 수 없습니다.");
			return false;
		} else {
			tar.next().after(tar);				
			fn_reNumberingBasicGrid();
		}
	});		
	
	//승인
    var fn_okResult = async function() {
		
		var tar 		= $('#compopappvmng').find('.cu-basic-table').find('tbody tr');
		
		var myEmpCode	= settings.empCode;
		var myIdx		= tar.find('[cu-col-emp-code=' + myEmpCode + ']').index();
		//console.log('myIdx:', myIdx);		
		
		if(tar.length<2){
            gfn_comAlert("E0000", "승인경로에 상신자 이외에 결재자가 없습니다.");
			return false;
		}
		if(myIdx>0){
			myIdx = myIdx - 1;
			if(tar.eq(myIdx).attr('cu-col-appr-date')==null || tar.eq(myIdx).attr('cu-col-appr-date')==''){
	            gfn_comAlert("E0000", "직전 승인권자 승인 완료후 결재가능합니다.");
				return false;
			}
		}
		if(confirm("승인하시겠습니까?")){
		}else{
			return false;
		}		

		var gubun				= "^";
		var tmp_workType		= "";
		
        var strstep_seq 		= "";
        var strappr_type	 	= "";
        var strappr_category 	= "";
        var strappr_process 	= "";
        var strdept_code 		= "";
        var stremp_code 		= "";
        var strappr_status 		= "";
        var strappr_date 		= "";
        var strappr_opinion 	= "";
        var strdescription 		= "";
        var strproxy_emp_code 	= "";
        var strinsert_userid 	= "";
        var strinsert_time 		= "";
        var strinsert_pc 		= "";
        var strupdate_userid 	= "";
        var strupdate_time 		= "";
        var strupdate_pc 		= "";
        
		tar.each(function(){
			strstep_seq			+= $(this).attr('cu-col-step-seq')			+ gubun;
			strappr_type		+= $(this).attr('cu-col-appr-type')			+ gubun;
			strappr_category	+= $(this).attr('cu-col-appr-category')		+ gubun;
			strappr_process		+= $(this).attr('cu-col-appr-process')		+ gubun;
			strdept_code		+= $(this).attr('cu-col-dept-code')			+ gubun;
			stremp_code			+= $(this).attr('cu-col-emp-code')			+ gubun;
			strdescription		+= $(this).attr('cu-col-description')		+ gubun;
			strproxy_emp_code	+= $(this).attr('cu-col-proxy-emp-code')	+ gubun;
			
			if(myEmpCode==$(this).attr('cu-col-emp-code')){
				//상신 혹은 승인자는 본인내용에 수정한다.
				strappr_opinion		+= $('#compopappvmng').find('.cu-txt-opinion').val() + gubun;
				strappr_status		+= "5"					+ gubun;
				strappr_date		+= 	gfnma_date1() 		+ gubun;
				strinsert_userid	+= myEmpCode			+ gubun;
				strinsert_time		+= gfnma_date1() 		+ gubun;
				strinsert_pc		+= "" 					+ gubun;
				strupdate_userid	+= myEmpCode 			+ gubun;
				strupdate_time		+= gfnma_date1() 		+ gubun;
				strupdate_pc		+= ""					+ gubun;
			} else {
				strappr_opinion		+= $(this).attr('cu-col-appr-opinion')	+ gubun;
				strappr_status		+= $(this).attr('cu-col-appr-status')	+ gubun;
				strappr_date		+= $(this).attr('cu-col-appr-date')		+ gubun;
				strinsert_userid	+= myEmpCode + gubun;
				strinsert_time		+= $(this).attr('cu-col-insert-time') 	+ gubun;
				strinsert_pc		+= $(this).attr('cu-col-insert-pc') 	+ gubun;
				strupdate_userid	+= myEmpCode + gubun;
				strupdate_time		+= $(this).attr('cu-col-update-time') 	+ gubun;
				strupdate_pc		+= $(this).attr('cu-col-update-pc') 	+ gubun;
			}
		});		
		
		//마지막 문자열 제거
        strstep_seq 		= strstep_seq.slice(0, -1);
        strappr_type	 	= strappr_type.slice(0, -1); 
        strappr_category 	= strappr_category.slice(0, -1); 
        strappr_process 	= strappr_process.slice(0, -1); 
        strdept_code 		= strdept_code.slice(0, -1); 
        stremp_code 		= stremp_code.slice(0, -1); 
        strappr_status 		= strappr_status.slice(0, -1); 
        strappr_date 		= strappr_date.slice(0, -1); 
        strappr_opinion 	= strappr_opinion.slice(0, -1); 
        strdescription 		= strdescription.slice(0, -1); 
        strproxy_emp_code 	= strproxy_emp_code.slice(0, -1); 
        strinsert_userid 	= strinsert_userid.slice(0, -1); 
        strinsert_time 		= strinsert_time.slice(0, -1); 
        strinsert_pc 		= strinsert_pc.slice(0, -1); 
        strupdate_userid 	= strupdate_userid.slice(0, -1); 
        strupdate_time 		= strupdate_time.slice(0, -1); 
        strupdate_pc 		= strupdate_pc.slice(0, -1); 
		
		if(settings.workType=='TEMPLATE'){
			tmp_workType = 'N';
		} else {
			tmp_workType = 'U';
		}
    	var paramObj = {
   			 V_P_DEBUG_MODE_YN       : ''
   			,V_P_LANG_ID             : ''
   			,V_P_COMP_CODE           : settings.compCode
   			,V_P_CLIENT_CODE         : settings.clientCode
   			,V_P_APPR_ID             : settings.apprId
			,V_P_APPR_NAME           : ''
			,V_P_SOURCE_TYPE         : settings.sourceType
			,V_P_SOURCE_NO           : settings.sourceNo
			,V_P_REF_EMP_CODE        : myEmpCode
			,V_P_DESCRIPTION         : ''
			,V_P_STEP_SEQ            : strstep_seq
			,V_P_APPR_TYPE           : strappr_type
			,V_P_APPR_CATEGORY       : strappr_category
			,V_P_APPR_PROCESS        : strappr_process
			,V_P_DEPT_CODE           : strdept_code
			,V_P_EMP_CODE            : stremp_code
			,V_P_PROXY_EMP_CODE_D    : strproxy_emp_code
			,V_P_DESCRIPTION_D       : strdescription
			,V_P_APPR_STATUS         : strappr_status
			,V_P_APPR_DATE           : strappr_date
			,V_P_APPR_OPINION        : strappr_opinion
			,V_P_INSERT_USERID       : strinsert_userid
			,V_P_INSERT_TIME         : strinsert_time
			,V_P_INSERT_PC           : strinsert_pc
			,V_P_UPDATE_USERID       : strupdate_userid
			,V_P_UPDATE_TIME         : strupdate_time
			,V_P_UPDATE_PC           : strupdate_pc
   			,V_P_FORM_ID             : settings.formID
   			,V_P_MENU_ID             : settings.menuId
   			,V_P_PROC_ID             : ''
   			,V_P_USERID              : ''
   			,V_P_PC                  : ''
   	    };
		console.log('paramObj:', paramObj);    	
       	
   		const postJsonPromise = gfn_postJSON("/com/comApprEmpOk.do", {
   			getType				: 'json',
   			workType			: tmp_workType,
   			cv_count			: '0',
   			params				: gfnma_objectToString(paramObj)
   		});
       	const data = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
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
	}
	
	//승인
	$(modalId).find('.cu-btn-okresult').off('click');
	$(modalId).find('.cu-btn-okresult').click(function(){
		fn_okResult();
	});		
	
	//반려
    var fn_rejectResult = async function() {
		
		var tar 		= $('#compopappvmng').find('.cu-basic-table').find('tbody tr');
		
		var myEmpCode	= settings.empCode;
		var myIdx		= tar.find('[cu-col-emp-code=' + myEmpCode + ']').index();
		//console.log('myIdx:', myIdx);		
		
		if(tar.length<2){
            gfn_comAlert("E0000", "승인경로에 상신자 이외에 결재자가 없습니다.");
			return false;
		}
		if(myIdx>0){
			myIdx = myIdx - 1;
			if(tar.eq(myIdx).attr('cu-col-appr-date')==null || tar.eq(myIdx).attr('cu-col-appr-date')==''){
	            gfn_comAlert("E0000", "직전 승인권자 승인 완료후 반려 가능합니다.");
				return false;
			}
		}
		if(confirm("반려 하시겠습니까?")){
		}else{
			return false;
		}		

		var gubun				= "^";
		var tmp_workType		= "";
		
        var strstep_seq 		= "";
        var strappr_type	 	= "";
        var strappr_category 	= "";
        var strappr_process 	= "";
        var strdept_code 		= "";
        var stremp_code 		= "";
        var strappr_status 		= "";
        var strappr_date 		= "";
        var strappr_opinion 	= "";
        var strdescription 		= "";
        var strproxy_emp_code 	= "";
        var strinsert_userid 	= "";
        var strinsert_time 		= "";
        var strinsert_pc 		= "";
        var strupdate_userid 	= "";
        var strupdate_time 		= "";
        var strupdate_pc 		= "";
        
		tar.each(function(){
			strstep_seq			+= $(this).attr('cu-col-step-seq')			+ gubun;
			strappr_type		+= $(this).attr('cu-col-appr-type')			+ gubun;
			strappr_category	+= $(this).attr('cu-col-appr-category')		+ gubun;
			strappr_process		+= $(this).attr('cu-col-appr-process')		+ gubun;
			strdept_code		+= $(this).attr('cu-col-dept-code')			+ gubun;
			stremp_code			+= $(this).attr('cu-col-emp-code')			+ gubun;
			strdescription		+= $(this).attr('cu-col-description')		+ gubun;
			strproxy_emp_code	+= $(this).attr('cu-col-proxy-emp-code')	+ gubun;
			
			if(myEmpCode==$(this).attr('cu-col-emp-code')){
				//상신 혹은 승인자는 본인내용에 수정한다.
				strappr_opinion		+= $('#compopappvmng').find('.cu-txt-opinion').val() + gubun;
				strappr_status		+= "4"					+ gubun;
				strappr_date		+= 	gfnma_date1() 		+ gubun;
				strinsert_userid	+= myEmpCode			+ gubun;
				strinsert_time		+= gfnma_date1() 		+ gubun;
				strinsert_pc		+= "" 					+ gubun;
				strupdate_userid	+= myEmpCode 			+ gubun;
				strupdate_time		+= gfnma_date1() 		+ gubun;
				strupdate_pc		+= ""					+ gubun;
			} else {
				strappr_opinion		+= $(this).attr('cu-col-appr-opinion')	+ gubun;
				strappr_status		+= $(this).attr('cu-col-appr-status')	+ gubun;
				strappr_date		+= $(this).attr('cu-col-appr-date')		+ gubun;
				strinsert_userid	+= myEmpCode + gubun;
				strinsert_time		+= $(this).attr('cu-col-insert-time') 	+ gubun;
				strinsert_pc		+= $(this).attr('cu-col-insert-pc') 	+ gubun;
				strupdate_userid	+= myEmpCode + gubun;
				strupdate_time		+= $(this).attr('cu-col-update-time') 	+ gubun;
				strupdate_pc		+= $(this).attr('cu-col-update-pc') 	+ gubun;
			}
		});		
		
		//마지막 문자열 제거
        strstep_seq 		= strstep_seq.slice(0, -1);
        strappr_type	 	= strappr_type.slice(0, -1); 
        strappr_category 	= strappr_category.slice(0, -1); 
        strappr_process 	= strappr_process.slice(0, -1); 
        strdept_code 		= strdept_code.slice(0, -1); 
        stremp_code 		= stremp_code.slice(0, -1); 
        strappr_status 		= strappr_status.slice(0, -1); 
        strappr_date 		= strappr_date.slice(0, -1); 
        strappr_opinion 	= strappr_opinion.slice(0, -1); 
        strdescription 		= strdescription.slice(0, -1); 
        strproxy_emp_code 	= strproxy_emp_code.slice(0, -1); 
        strinsert_userid 	= strinsert_userid.slice(0, -1); 
        strinsert_time 		= strinsert_time.slice(0, -1); 
        strinsert_pc 		= strinsert_pc.slice(0, -1); 
        strupdate_userid 	= strupdate_userid.slice(0, -1); 
        strupdate_time 		= strupdate_time.slice(0, -1); 
        strupdate_pc 		= strupdate_pc.slice(0, -1); 
		
		tmp_workType = 'U';
    	var paramObj = {
   			 V_P_DEBUG_MODE_YN       : ''
   			,V_P_LANG_ID             : ''
   			,V_P_COMP_CODE           : settings.compCode
   			,V_P_CLIENT_CODE         : settings.clientCode
   			,V_P_APPR_ID             : settings.apprId
			,V_P_APPR_NAME           : ''
			,V_P_SOURCE_TYPE         : settings.sourceType
			,V_P_SOURCE_NO           : settings.sourceNo
			,V_P_REF_EMP_CODE        : myEmpCode
			,V_P_DESCRIPTION         : ''
			,V_P_STEP_SEQ            : strstep_seq
			,V_P_APPR_TYPE           : strappr_type
			,V_P_APPR_CATEGORY       : strappr_category
			,V_P_APPR_PROCESS        : strappr_process
			,V_P_DEPT_CODE           : strdept_code
			,V_P_EMP_CODE            : stremp_code
			,V_P_PROXY_EMP_CODE_D    : strproxy_emp_code
			,V_P_DESCRIPTION_D       : strdescription
			,V_P_APPR_STATUS         : strappr_status
			,V_P_APPR_DATE           : strappr_date
			,V_P_APPR_OPINION        : strappr_opinion
			,V_P_INSERT_USERID       : strinsert_userid
			,V_P_INSERT_TIME         : strinsert_time
			,V_P_INSERT_PC           : strinsert_pc
			,V_P_UPDATE_USERID       : strupdate_userid
			,V_P_UPDATE_TIME         : strupdate_time
			,V_P_UPDATE_PC           : strupdate_pc
   			,V_P_FORM_ID             : settings.formID
   			,V_P_MENU_ID             : settings.menuId
   			,V_P_PROC_ID             : ''
   			,V_P_USERID              : ''
   			,V_P_PC                  : ''
   	    };
		console.log('paramObj:', paramObj);    	
       	
   		const postJsonPromise = gfn_postJSON("/com/comApprEmpOk.do", {
   			getType				: 'json',
   			workType			: tmp_workType,
   			cv_count			: '0',
   			params				: gfnma_objectToString(paramObj)
   		});
       	const data = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
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
	}	
	
	//반려
	$(modalId).find('.cu-btn-okcancel').off('click');
	$(modalId).find('.cu-btn-okcancel').click(function(){
		
		var txt_opinion =  $(modalId).find('.cu-txt-opinion').val();
		if(!txt_opinion){
            gfn_comAlert("E0000", "반려시 결재의견은 필수입력입니다.");
            return false;
		}
		fn_rejectResult();
	});		
	
	//회수
    var fn_rejectCollect = async function() {
		
		var tar 		= $('#compopappvmng').find('.cu-basic-table').find('tbody tr');
		var myEmpCode	= settings.empCode;
		var myIdx		= tar.find('[cu-col-emp-code=' + myEmpCode + ']').index();		
		
		if(tar.length<2){
            gfn_comAlert("E0000", "승인경로에 상신자 이외에 결재자가 없습니다.");
			return false;
		}
		if(tar.length>(myIdx+1)){
			myIdx = myIdx + 1;
			if(tar.eq(myIdx).attr('cu-col-appr-date')!=null && tar.eq(myIdx).attr('cu-col-appr-date')!=''){
	            gfn_comAlert("E0000", "상위 결재자가 승인 처리하여 회수 처리할 수 없습니다.");
				return false;
			}
		}
		if(confirm("회수 하시겠습니까?")){
		}else{
			return false;
		}			

		var tmp_workType	= 'RETURN';
    	var paramObj = {
   			 V_P_DEBUG_MODE_YN       : ''
   			,V_P_LANG_ID             : ''
   			,V_P_COMP_CODE           : settings.compCode
   			,V_P_CLIENT_CODE         : settings.clientCode
   			,V_P_APPR_ID             : settings.apprId
			,V_P_SOURCE_TYPE         : settings.sourceType
			,V_P_SOURCE_NO           : settings.sourceNo
			,V_P_REF_EMP_CODE        : myEmpCode
			,V_P_EMP_CODE            : stremp_code
   			,V_P_FORM_ID             : settings.formID
   			,V_P_MENU_ID             : settings.menuId
   			,V_P_PROC_ID             : ''
   			,V_P_USERID              : ''
   			,V_P_PC                  : ''
   	    };
		console.log('paramObj:', paramObj);    	
       	
   		const postJsonPromise = gfn_postJSON("/com/comApprEmpCancel.do", {
   			getType				: 'json',
   			workType			: tmp_workType,
   			cv_count			: '0',
   			params				: gfnma_objectToString(paramObj)
   		});
       	const data = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
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
	}
	
	//회수
	$(modalId).find('.cu-btn-collect').off('click');
	$(modalId).find('.cu-btn-collect').click(function(){
		fn_rejectCollect();		
	});	
	
	//결재삭제
    var fn_apprDelete = async function() {
		
		var tar 		= $('#compopappvmng').find('.cu-basic-table').find('tbody tr');
		
		if(tar.length<2){
            gfn_comAlert("E0000", "승인경로에 상신자 이외에 결재자가 없습니다.");
			return false;
		}
		if(confirm("결재 삭제 하시겠습니까?")){
		}else{
			return false;
		}			

		var tmp_workType	= 'DELETE';
    	var paramObj = {
   			 V_P_DEBUG_MODE_YN       : ''
   			,V_P_LANG_ID             : ''
   			,V_P_COMP_CODE           : settings.compCode
   			,V_P_CLIENT_CODE         : settings.clientCode
   			,V_P_APPR_ID             : settings.apprId
			,V_P_SOURCE_TYPE         : settings.sourceType
			,V_P_SOURCE_NO           : settings.sourceNo
			,V_P_REF_EMP_CODE        : myEmpCode
			,V_P_EMP_CODE            : stremp_code
   			,V_P_FORM_ID             : settings.formID
   			,V_P_MENU_ID             : settings.menuId
   			,V_P_PROC_ID             : ''
   			,V_P_USERID              : ''
   			,V_P_PC                  : ''
   	    };
		console.log('paramObj:', paramObj);    	
       	
   		const postJsonPromise = gfn_postJSON("/com/comApprEmpCancel.do", {
   			getType				: 'json',
   			workType			: tmp_workType,
   			cv_count			: '0',
   			params				: gfnma_objectToString(paramObj)
   		});
       	const data = await postJsonPromise;
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
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
	}
	
	//결재삭제
	$(modalId).find('.cu-btn-delete').off('click');
	$(modalId).find('.cu-btn-delete').click(function(){
		fn_apprDelete();
	});	
	
	//트리 조회
    var treeFindIdx;
    var treeFindCol;
	$(modalId).find('.cu-btn-find').off('click');
	$(modalId).find('.cu-btn-find').click(function(){
		
		var cnt 		= 0;
		var find_text	= "";
		
		var find_deptcode 	= $(modalId).find('.cu-inp-txtdept-code').val();
		if(find_deptcode) {
			cnt ++;
			find_text 	= find_deptcode;
			treeFindCol	= 'DEPT_CODE';
		}
		var find_deptname 	= $(modalId).find('.cu-inp-txtdept-name').val();
		if(find_deptname) {
			cnt ++;
			find_text 	= find_deptname;
			treeFindCol	= 'DEPT_NAME1';
		}
		var find_empcode 	= $(modalId).find('.cu-inp-txtemp-code').val();
		if(find_empcode) {
			cnt ++;
			find_text = find_empcode;
			treeFindCol	= 'EMP_CODE';
		}
		var find_empname 	= $(modalId).find('.cu-inp-txtemp-name').val();
		if(find_empname) {
			cnt ++;
			find_text = find_empname;
			treeFindCol	= 'EMP_NAME';
		}
		
		if(!find_deptcode && !find_deptname && !find_empcode && !find_empname){
            gfn_comAlert("E0000", "조회하실 항목(부서코드, 부서명, 사원코드, 사원명)이 입력되지 않았습니다.");
            return false;
		} else if(cnt>1){
            gfn_comAlert("E0000", "조회하실 항목은 1개만 가능합니다.");
            return false;
		}
		_compopappvmng_treeGrid.setCellStyles(treeFindIdx, 1, treeFindIdx, 1, 'background : #fff');
        treeFindIdx = _compopappvmng_jsonTreeList.filter(function (item) {
			return item[treeFindCol].includes(find_text);
		}).map(function (item) {
			return item.sb_level_index;
		});		
        
        treeFindIdx = Number(treeFindIdx[0]) + 1;
        
        setTimeout(function () {
	        _compopappvmng_treeGrid.clickCell(treeFindIdx, 1, true);
	        _compopappvmng_treeGrid.setCellStyles(treeFindIdx, 1, treeFindIdx, 1, 'background : #ddd');
	        //console.log('==>>>treeFindIdx:', treeFindIdx);  	// 결과를 콘솔에 출력합니다.
	        //_compopappvmng_treeGridSelRow <--- 값은 자동으로 이쪾으로 담김 (이벤트발생됨)
        }, 100); 					// openTreeNodeAll() 메소드로 node가 모두 펼쳐지는 시간을 고려하여 0.1초 뒤에 실행
	});		
	
	//close event
	$(modalId).find('.cu-btn-close').off('click');
	$(modalId).find('.cu-btn-close').click(function(){
	 	SBUxMethod.closeModal(modalDivId);
	});		
	
}

 
</script>
</html>