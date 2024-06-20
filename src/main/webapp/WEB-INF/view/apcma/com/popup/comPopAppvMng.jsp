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
	<section id="compopappvmng">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start; padding-top: 0px" >
				<div>
					<div style="display:flex;float: right; padding-bottom:5px">
						<sbux-button uitype="normal" text="회수" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-cancel" ></sbux-button>
						<sbux-button uitype="normal" text="조회" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-find" ></sbux-button>
						<sbux-button uitype="normal" text="종료" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-close" ></sbux-button>
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
									<input uitype="text" class="form-control input-sm cu-inp-comp-code" value="">								
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
									<input uitype="text" class="form-control input-sm cu-inp-txtemp-name" value="">								
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
                            <div id="sb-gridTree" style="height:350px; width:100%;"></div>
						</div>
					</div>
					
					<div style="width:2%">
					</div>
					
					<div style="width:69%">
						<div style="display:flex;height:35px">
							<div style="width:60%;display:flex;vertical-align:middle;">
								<p style="padding-right:10px">승인경로</p>
								<div class="dropdown">
								    <button style="width:400px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="APPR_PATH_LIST" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    	<font>선택</font>
								        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
								    </button>
								    <div class="dropdown-menu" aria-labelledby="APPR_PATH_LIST" style="width:300px;height:150px;padding-top:0px;overflow:auto">
								    </div>
								</div>                                    
							</div>
							<div style="width:40%;text-align:right">
								<sbux-button uitype="normal" text="행삭제" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-cancel" ></sbux-button>
								<sbux-button uitype="normal" text="위로" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-find" ></sbux-button>
								<sbux-button uitype="normal" text="아래로" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-close" ></sbux-button>
							</div>
						</div>
						<div style="overflow:auto;border:1px solid #d1cece;height:350px">
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
					
				</div>
			</div>
			
			<div class="box-body" style="padding-top:0px;padding-bottom:10px">
				<div class="card" style="display:flex;">
					<div style="width:86%;height:60px;display:flex">
						<div style="width:7%">
							<p style="padding-right:10px">결재의견</p>
						</div>
						<div style="width:93%">
							<textarea style="width:100%" rows="3" cols=""></textarea>
						</div>
					</div>
					<div style="width:14%;height:60px;text-align:right;padding-left:10px">
						<sbux-button uitype="normal" text="승인" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-cancel" ></sbux-button>
						<sbux-button uitype="normal" text="반려" 	style="margin-right:5px" class="btn btn-sm btn-outline-danger cu-btn-find" ></sbux-button>
					</div>
				</div>
			</div>
			
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script>

var _compopappvmng_treeGrid; 			// 그리드를 담기위한 객체 선언
var _compopappvmng_jsonTreeList	= []; 	// 그리드의 참조 데이터 주소 선언

function compopappvmng(options) {
	
	//id 선언
	var modalId  		= '#compopappvmng';
	var modalDivId 		= 'modal-comPopAppvMng';
	
	var settings = {
		compCode				: null
		,clientCode				: null
		,sourceType				: null
		,sourceNo				: null
		,formID					: null
		,menuId					: null    		
	};
	$.extend(settings, options);	
	//console.log('settings:', settings);
	
	//open modal
	SBUxMethod.openModal(modalDivId);
	
	//승인경로
	gfnma_multiSelectInit({
		target			: ['#APPR_PATH_LIST']
		,compCode		: gv_ma_selectedApcCd
		,clientCode		: gv_ma_selectedClntCd
		,bizcompId		: 'L_APPR_TEMPLATE'
		,whereClause	: ''
		,formId			: p_formId
		,menuId			: p_menuId
		,selectValue	: ''
		,dropType		: 'down' 	// up, down
		,dropAlign		: 'left' 	// left, right
		,colValue		: 'TEMPLATE_ID'
		,colLabel		: 'TEMPLATE_NAME'
		,columns		:[
            {caption: "코드",		ref: 'TEMPLATE_ID', 			width:'150px',  	style:'text-align:left'},
            {caption: "이름", 		ref: 'TEMPLATE_NAME',    		width:'150px',  	style:'text-align:left'}
		]
	})
	
	//사원 가져오기 --------------------------------------------------------------
    
    var fn_view = function() {
    };
    
    var fn_createGrid = function(){
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-gridTree';
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
            {caption : ['사원'],			ref: 'DEPT_NAME', 		type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption : ['구분'],			ref: 'TYPE', 			type:'output',  	width:'10px',  		style:'text-align:left', hidden: true}
        ];
        _compopappvmng_treeGrid	= _SBGrid.create(SBGridProperties);
        _compopappvmng_treeGrid.bind('click', 'fn_view');
    };
    fn_createGrid();
    
    var fn_search = async function() {

    	var paramObj = {
			 V_P_DEBUG_MODE_YN       : ''
			,V_P_LANG_ID             : ''
			,V_P_COMP_CODE           : gv_ma_selectedApcCd
			,V_P_CLIENT_CODE         : gv_ma_selectedClntCd
			,V_P_APPR_ID             : ''
			,V_P_SOURCE_NO           : ''	//settings.sourceNo
			,V_P_SOURCE_TYPE         : ''	//settings.sourceType
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
    	//console.log('popup appr get data:', data);

    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
	
	    	   	/** @type {number} **/
	    		let totalRecordCount = 0;
	    	   	
	    	   	data.cv_1.forEach((item, index) => {
		    		const msg = {
		    				LEVEL				: item.LV,
		    				DEPT_NAME			: item.DEPT_NAME,
		    				TYPE				: item.TYPE,
		    		}
		    		_compopappvmng_jsonTreeList.push(msg);
		    		totalRecordCount ++;
		    	});
	    	   	
	    	   	_compopappvmng_treeGrid.rebuild();
	        	console.log('_compopappvmng_jsonTreeList :', _compopappvmng_jsonTreeList);
	    	   	//document.querySelector('#listCount').innerText = totalRecordCount;
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
    fn_search();
    
	//----------------------------------------------------------------------------
	
	$(modalId).find('.cu-inp-source-type').val(settings.sourceType);
	$(modalId).find('.cu-inp-source-code').val(settings.sourceNo);
	
	//close event
	$(modalId).find('.cu-btn-close').off('click');
	$(modalId).find('.cu-btn-close').click(function(){
	 	SBUxMethod.closeModal(modalDivId);
	});		
	
	
}

 
</script>
</html>