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
	<section id="compopfig2250">
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
				
				<div id="compopfig2250Grid" class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
				</div>
				
			</div>
			<!--[pp] //검색결과 -->
		</div>
	</section>
</body>
<script >

//grid Mast 초기화
var Fig2250Grid; 			// 그리드를 담기위한 객체 선언
var jsonFig2250 = []; 		// 그리드의 참조 데이터 주소 선언

/**
 * @description 복수코드
 */
function compopfig2250(options) {
	
	// id 선언
	var modalId  	= '#compopfig2250';
	var modalDivId 	= 'modal-compopfig2250';
	
	var settings = {
		height					: null
		,param					: null
		,callbackEvent			: null
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

    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'compopfig2250Grid';
	    SBGridProperties.id 				= 'Fig2250Grid';
	    SBGridProperties.jsonref 			= 'jsonFig2250';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["전표번호"],					ref: 'DOC_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"], 					ref: 'ITEM_SEQ',    			type:'output',  	width:'60px',  		style:'text-align:left'},
            {caption: ["수정시간"], 				ref: 'INSERT_TIME', 			type:'output',		width:'150px',  	style:'text-align:left'},
            {caption: ["수정자"],    				ref: 'INSERT_USERID', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["수정자명"],    				ref: 'USER_NAME', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급기준일"],  				ref: 'PAY_BASE_DATE', 			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["지급예상일"],  				ref: 'EXPECTED_PAY_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["지급조건"],    				ref: 'PAY_TERM_CODE', 			type:'output',  	width:'80px',  		style:'text-align:left'},
            {caption: ["지급조건명"],  				ref: 'PAY_TERM_NAME', 			type:'output',  	width:'120px',  	style:'text-align:right'},
            {caption: ["금액"],	   					ref: 'AMOUNT', 					type:'output',  	width:'120px',  	style:'text-align:right'},
            {caption: ["어음만기일"],	  			ref: 'BILL_DUE_DATE', 			type:'output',  	width:'100px',  	style:'text-align:right'},
            {caption: ["비고"],	  					ref: 'DESCRIPTION', 			type:'output',  	width:'250px',  	style:'text-align:right'},
            {caption: ["어음일수"],	   				ref: 'BILL_DUE_DAY', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["어음지급일"],				ref: 'BILL_DUE_PAY_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fig2250Grid = _SBGrid.create(SBGridProperties);
        //Fig2250Grid.bind('click', 'fn_viewGrid');
    }	
    fn_createGrid();	
	
    const fn_setFig2250Grid = async function(wtype) {

		Fig2250Grid.clearStatus();

	    var paramObj = { 
			V_P_DEBUG_MODE_YN		: ''
			,V_P_LANG_ID			: ''
			,V_P_COMP_CODE			: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE		: gv_ma_selectedClntCd
			
			,V_P_FI_ORG_CODE        : settings.param['p_strfi_org_code']
			,V_P_DOC_ID             : settings.param['p_doc_id']

			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/jor/selectFig2250List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFig2250.length = 0;
  	        	data.cv_2.forEach((item, index) => {
  					const msg = {
  						DOC_ID					: gfn_nvl(item.DOC_ID),
  						DOC_NAME				: gfn_nvl(item.DOC_NAME),
  						ITEM_ID					: gfn_nvl(item.ITEM_ID),
  						ITEM_SEQ				: gfn_nvl(item.ITEM_SEQ),
  						INSERT_USERID			: gfn_nvl(item.INSERT_USERID),
  						USER_NAME				: gfn_nvl(item.USER_NAME),
  						INSERT_TIME				: gfn_nvl(item.INSERT_TIME),
  						PAY_BASE_DATE			: gfn_nvl(item.PAY_BASE_DATE),
  						EXPECTED_PAY_DATE		: gfnma_date5(gfn_nvl(item.EXPECTED_PAY_DATE)),
  						PAY_TERM_CODE			: gfn_nvl(item.PAY_TERM_CODE),
  						PAY_TERM_NAME			: gfn_nvl(item.PAY_TERM_NAME),
  						AMOUNT					: gfn_nvl(item.AMOUNT),
  						DESCRIPTION				: gfn_nvl(item.DESCRIPTION),
  						BILL_DUE_DATE			: gfnma_date5(gfn_nvl(item.BILL_DUE_DATE)),
  						BILL_DUE_DAY			: gfn_nvl(item.BILL_DUE_DAY),
  						BILL_DUE_PAY_DATE		: gfnma_date5(gfn_nvl(item.BILL_DUE_PAY_DATE)),
  						BANK_ACCOUNT_SEQ		: gfn_nvl(item.BANK_ACCOUNT_SEQ),
  						PGM_ID					: gfn_nvl(item.PGM_ID),
  					}
  					jsonFig2250.push(msg);
  					totalRecordCount ++;
  				});

        		Fig2250Grid.rebuild();
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
	fn_setFig2250Grid('Q');
    
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