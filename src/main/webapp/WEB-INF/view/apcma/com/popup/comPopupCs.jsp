<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title></title>
</head>
<body oncontextmenu="return false">
	<section id="comPopupCs">
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div> 
					<table id="srchComPopupCsTable" class="table table-bordered tbl_row tbl_fixed">
						<colgroup>
							<col style="width:15%">
							<col style="width:25%">
							<col style="width:15%">
							<col style="width:25%">
							<col style="width:10%">
							<col style="width:10%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" class="th_bg">거래처코드</th>
                                <td class="td_input" style="border-right: hidden;">
                                	<sbux-input id="SRCH_CS_CODE_POP" class="form-control input-sm" uitype="text"></sbux-input>
                                </td>
								<th scope="row" class="th_bg">거래처명</th>
                                <td class="td_input" style="border-right: hidden;">
                                	<sbux-input id="SRCH_CS_NAME_POP" class="form-control input-sm" uitype="text"></sbux-input>
                                </td>
                                <td colspan="2" rowspan="2" class="td_input" style="border-right: hidden;">
                                	<div>
	                        			<sbux-button id="btnSearchPopCs" name="btnSearchPopCs" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger cu-btn-search-compopupcs" style="float: right;"></sbux-button>
	                        			<sbux-button id="btnClearPopCs" name="btnClearPopCs" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger cu-btn-clear-compopupcs" style="float: right;"></sbux-button>
                                	</div>
                                </td>
							</tr>
							<tr>
								<th scope="row" class="th_bg">사업자번호</th>
                                <td colspan="3" class="td_input" style="border-right: hidden;">
                                	<sbux-input id="SRCH_BRNO_POP" class="form-control input-sm" uitype="text"></sbux-input>
                                </td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="box-body">
				<div class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
	            	<div id="sb-area-grid-cs" style="height:500px;"></div>
				</div>
			</div>
			<!--[pp] //검색결과 -->
			
		</div>
	</section>
</body>
<script >
 
var gridComPopCs;
var gridComPopCsList		= [];
var SBGridPropertiescomPopupCs = {};
// id 선언
var modalId  	= '#comPopupCs';
var modalDivId 	= 'modal-compopupcs';
var gridclickRowEvent= {
		itemSelectEvent		: null
	};
/**
 * @description 공통 팝업
 */
 

const clickPop = async function() {
	const nRow = gridComPopCs.getRow();
	if(nRow == -1){
		return;
	}
	const selectRowVal = gridComPopCs.getRowData(nRow);
	console.log('selectRowVal ==>', selectRowVal);
	if(gridclickRowEvent.itemSelectEvent){
		gridclickRowEvent.itemSelectEvent(selectRowVal);
		SBUxMethod.closeModal(modalDivId);
	}
}

async function comPopupCs(options, selectRowVal) {
	
	var settings = {
			compCode				: null
			,clientCode				: null
			,inputData				: null
			,bizcompId				: null
			,whereClause			: null
			,itemSelectEvent		: null
		};
	
	$.extend(settings, options);
	$.extend(gridclickRowEvent, options);
	console.log('settings:', settings);
	console.log('gridclickRowEvent:', gridclickRowEvent);

    const comPopupCsInputData = async function () {
        let rst = await Promise.all([
        	console.log('comPopupCsInputData settings ==>', settings.inputData),
		    $('#SRCH_CS_CODE_POP').val(settings.inputData.CS_CODE),
		    $('#SRCH_CS_NAME_POP').val(settings.inputData.CS_NAME),
		    $('#SRCH_BRNO_POP').val(settings.inputData.BIZ_REGNO),
        ]);
    }
    comPopupCsInputData();
	//setGrid
    const setCsGridFig3510 = function() {
        
	    SBGridPropertiescomPopupCs = {};
	    SBGridPropertiescomPopupCs.parentid 		= 'sb-area-grid-cs';
	    SBGridPropertiescomPopupCs.id 				= 'gridComPopCs';
	    SBGridPropertiescomPopupCs.jsonref 			= 'gridComPopCsList';
	    SBGridPropertiescomPopupCs.emptyrecords 	= '데이터가 없습니다.';
	    SBGridPropertiescomPopupCs.selectmode 		= 'byrows';
	    SBGridPropertiescomPopupCs.allowcopy 		= true; //복사
	    SBGridPropertiescomPopupCs.explorerbar 		= 'sortmove';
	    SBGridPropertiescomPopupCs.extendlastcol 	= 'scroll';
	    SBGridPropertiescomPopupCs.showscrollinfo = {
	            type        :   'vertical',
	            callback    :   function(nDataCount, nTopRow, nBottomRow){
	                return '전체 건 수: ' + nDataCount + '<br>' + '상단 행: ' + nTopRow + ', 하단 행: ' + nBottomRow;
	            }
	        };
	    SBGridPropertiescomPopupCs.livescroll = false;
	    SBGridPropertiescomPopupCs.columns = [
	        {caption: ["거래처코드"], 		ref: 'CNPT_CD', 		type: 'output', width: '90px',  style: 'text-align:left'},
	        {caption: ["거래처명"], 			ref: 'CNPT_NM', 		type: 'output', width: '150px', style: 'text-align:left'},
	        {caption: ["사업자번호"], 		ref: 'BRNO', 			type: 'output', width: '130px', style: 'text-align:left'},
	        {caption: ["거래중지여부"], 		ref: 'TRSC_HLT_YN', 	type: 'output', width: '70px', style: 'text-align:left'},
	        {caption: ["대표자"], 			ref: 'CEO_NM', 			type: 'output', width: '80px', style: 'text-align:left'},
	        {caption: ["업태"], 				ref: 'BZSTAT', 			type: 'output', width: '100px', style: 'text-align:left'},
	        {caption: ["종목"], 				ref: 'TPBIZ', 			type: 'output', width: '100px', style: 'text-align:left'},
	        {caption: ["주소"], 				ref: 'ADDR', 			type: 'output', width: '200px', style: 'text-align:left'},
	        {caption: ["전화"], 				ref: 'TELNO', 			type: 'output', width: '100px', style: 'text-align:left'},
	        {caption: ["팩스"], 				ref: 'FX_NO', 	type: 'output', width: '100px', style: 'text-align:left'},
	        {caption: ["채무계정"], 			ref: 'APS_ACNT_CD', 	type: 'output', width: '100px', style: 'text-align:left'},
	        {caption: ["채무계정명"], 		ref: 'AP_ACC_NAME', 	type: 'output', width: '100px', style: 'text-align:left'},
	        {caption: ["지급기준"], 			ref: 'PAY_TERM_CD', 	type: 'output', width: '100px', style: 'text-align:left'},
	        {caption: ["지급기준명"], 		ref: 'PAY_TERM_NM', 	type: 'output', width: '100px', style: 'text-align:left'},
	        {caption: ["지급방법"], 			ref: 'PAY_MTHD', 	type: 'output', width: '100px', style: 'text-align:left'},
	        {caption: ["통화"], 				ref: 'CRN_CD', 	type: 'output', width: '100px', style: 'text-align:left'},
	        {caption: ["TXN_STOP_REASON"], 		ref: 'TRSC_HLT_RSN', 	type: 'output', width: '100px', style: 'text-align:left'}
	    ];
	    gridComPopCs = _SBGrid.create(SBGridPropertiescomPopupCs);
	    gridComPopCs.bind('click', 'clickPop');
	}
    const setCsGridFig2210_99 = function() {
	  	//기간별환율 탭 - 기간별환율등록
	    SBGridPropertiescomPopupCs = {};
	    SBGridPropertiescomPopupCs.parentid 		= 'sb-area-grid-cs';
	    SBGridPropertiescomPopupCs.id 				= 'gridComPopCs';
	    SBGridPropertiescomPopupCs.jsonref 			= 'gridComPopCsList';
	    SBGridPropertiescomPopupCs.emptyrecords 	= '데이터가 없습니다.';
	    SBGridPropertiescomPopupCs.selectmode 		= 'byrows';
	    SBGridPropertiescomPopupCs.allowcopy 		= true; //복사
	    SBGridPropertiescomPopupCs.explorerbar 		= 'sortmove';
	    SBGridPropertiescomPopupCs.extendlastcol 	= 'scroll';
	    SBGridPropertiescomPopupCs.showscrollinfo = {
	            type        :   'vertical',
	            callback    :   function(nDataCount, nTopRow, nBottomRow){
	                return '전체 건 수: ' + nDataCount + '<br>' + '상단 행: ' + nTopRow + ', 하단 행: ' + nBottomRow;
	            }
	        };
	    SBGridPropertiescomPopupCs.livescroll = false;
	    SBGridPropertiescomPopupCs.columns = [
	        {caption: ["거래처코드"], 		ref: 'CNPT_CD', 		type: 'output', width: '80px',  style: 'text-align:left'},
	        {caption: ["거래처명"], 			ref: 'CNPT_NM', 		type: 'output', width: '200px', style: 'text-align:left'},
	        {caption: ["사업자번호"], 		ref: 'BRNO', 			type: 'output', width: '100px', style: 'text-align:left'},
	        {caption: ["거래중지여부"], 		ref: 'TRSC_HLT_YN', 	type: 'output', width: '100px', style: 'text-align:left'},
	        {caption: ["거래처유형"], 		ref: 'CNPT_GROUP', 			type: 'output', width: '200px', style: 'text-align:left'},
	        {caption: ["구매처"], 			ref: 'PCPL_YN', 			type: 'output', width: '70px', style: 'text-align:left'},
	        {caption: ["판매처"], 			ref: 'SLS_CNPT_YN', 			type: 'output', width: '70px', style: 'text-align:left'},
	        {caption: ["수금기준"], 			ref: 'PAY_TERM_CD', 			type: 'output', width: '70px', style: 'text-align:left'},
	        {caption: ["수금기준명"], 		ref: 'PAY_TERM_NM', 			type: 'output', width: '150px', style: 'text-align:left'},
	        {caption: ["수금방법"], 			ref: 'PAY_MTHD', 	type: 'output', width: '70px', style: 'text-align:left'},
	        {caption: ["원천세대상여부"], 		ref: 'WTHD_TX_YN', 	type: 'output', width: '120px', style: 'text-align:left'}
	    ];
	    gridComPopCs = _SBGrid.create(SBGridPropertiescomPopupCs);
	    gridComPopCs.bind('click', 'clickPop');
	}
    const setCsGridFia4300 = function() {
	  	//기간별환율 탭 - 기간별환율등록
	    SBGridPropertiescomPopupCs = {};
	    SBGridPropertiescomPopupCs.parentid 		= 'sb-area-grid-cs';
	    SBGridPropertiescomPopupCs.id 				= 'gridComPopCs';
	    SBGridPropertiescomPopupCs.jsonref 			= 'gridComPopCsList';
	    SBGridPropertiescomPopupCs.emptyrecords 	= '데이터가 없습니다.';
	    SBGridPropertiescomPopupCs.selectmode 		= 'byrows';
	    SBGridPropertiescomPopupCs.allowcopy 		= true; //복사
	    SBGridPropertiescomPopupCs.explorerbar 		= 'sortmove';
	    SBGridPropertiescomPopupCs.extendlastcol 	= 'scroll';
	    SBGridPropertiescomPopupCs.showscrollinfo = {
	            type        :   'vertical',
	            callback    :   function(nDataCount, nTopRow, nBottomRow){
	                return '전체 건 수: ' + nDataCount + '<br>' + '상단 행: ' + nTopRow + ', 하단 행: ' + nBottomRow;
	            }
	        };
	    SBGridPropertiescomPopupCs.livescroll = false;
	    SBGridPropertiescomPopupCs.columns = [
	        {caption: ["거래처코드"], 		ref: 'CNPT_CD', 		type: 'output', width: '180px',  style: 'text-align:center'},
	        {caption: ["거래처명"], 			ref: 'CNPT_NM', 		type: 'output', width: '300px', style: 'text-align:left'}
	    ];
	    gridComPopCs = _SBGrid.create(SBGridPropertiescomPopupCs);
	    gridComPopCs.bind('click', 'clickPop');
	}
    
    const clearPopCs = function() {
    	gfnma_uxDataClear('#srchComPopupCsTable');
    }
    
	// get data
	
	const replaceWhereClause = function(){
        var SRCH_CS_CODE_POP = gfnma_nvl2($('#SRCH_CS_CODE_POP').val());
        var SRCH_CS_NAME_POP = gfnma_nvl2($('#SRCH_CS_NAME_POP').val());
        var SRCH_BRNO_POP = gfnma_nvl2($('#SRCH_BRNO_POP').val());
        
        var strWhereClause = '';
        if(settings.bizcompId == 'P_CS_PURCHASE_DOC'){
        	strWhereClause = "AND CNPT_CD LIKE '%" + SRCH_CS_CODE_POP + "%' AND CNPT_NM LIKE '%" + SRCH_CS_NAME_POP + "%' AND BRNO LIKE '%" + SRCH_BRNO_POP + "%' AND '" + settings.whereClause[0] + "' BETWEEN EFCT_BGNG_YMD AND EFCT_END_YMD ";
        }else if(settings.bizcompId == 'P_CS_SALE_DOC'){
        	strWhereClause = "AND CNPT_CD LIKE '%" + SRCH_CS_CODE_POP + "%' AND CNPT_NM LIKE '%" + SRCH_CS_NAME_POP + "%' AND BRNO LIKE '%" + SRCH_BRNO_POP + "%'";
    	}else if(settings.bizcompId == 'P_CS_ALL' || settings.bizcompId == 'P_CS_PURCHASE_DOC' || settings.bizcompId == 'P_CS_PURCHASE_DOC_FOREIGN' || settings.bizcompId == 'P_CS_ALL_FOREIGN'){
        	strWhereClause = "AND CNPT_CD LIKE '%" + SRCH_CS_CODE_POP + "%' AND CNPT_NM LIKE '%" + SRCH_CS_NAME_POP + "%' AND BRNO LIKE '%" + SRCH_BRNO_POP + "%'";
        }else if(settings.bizcompId == 'P_COM008' || settings.bizcompId == 'P_CS_PURCHASE'){
        	strWhereClause = "AND CNPT_CD LIKE '%" + SRCH_CS_CODE_POP + "%' AND CNPT_NM LIKE '%" + SRCH_CS_NAME_POP + "%'";
        }
        
        return strWhereClause;
	}
	
    const searchPopCs = async function() {
		let strWhereClause = await replaceWhereClause();
   		var paramObj = {
   	   			V_P_DEBUG_MODE_YN	: ''
   	   			,V_P_LANG_ID		: ''
   	   			,V_P_COMP_CODE		: settings.compCode
   	   			,V_P_CLIENT_CODE	: settings.clientCode
   	   			,V_P_BIZCOMP_ID		: settings.bizcompId
   	   			,V_P_WHERE_CLAUSE	: strWhereClause
   	   			,V_P_PARAM_LIST		: ''
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
	        params				: gfnma_objectToString(paramObj, true)
  		});
    	
  	    const data = await postJsonPromise;
		console.log('popup get data:', data);
    	try {
	    	if (_.isEqual("S", data.resultStatus)) {
	    		gridComPopCsList.length = 0;
	    		if(settings.bizcompId == 'P_CS_PURCHASE_DOC' || settings.bizcompId == 'P_CS_SALE_DOC' || settings.bizcompId == 'P_CS_PURCHASE'){
		    	   	data.cv_1.forEach((item, index) => {
			    		const msg = {
			    				ADDR			: item.ADDR,
			    				APS_ACNT_CD		: item.APS_ACNT_CD,
			    				AP_ACC_NAME		: item.AP_ACC_NAME,
			    				BACNT_SEQ		: item.BACNT_SEQ,
			    				BASE_SCALE		: gfnma_nvl2(item.BASE_SCALE),
			    				BRNO			: item.BRNO,
			    				BZSTAT			: item.BZSTAT,
			    				CEO_NM			: item.CEO_NM,
			    				CNPT_CD			: item.CNPT_CD,
			    				CNPT_NM			: item.CNPT_NM,
			    				CRN_CD			: item.CRN_CD,
			    				CS_CODE1		: item.CS_CODE1,
			    				CS_NAME1		: item.CS_NAME1,
			    				FX_NO			: item.FX_NO,
			    				PAY_MTHD		: item.PAY_MTHD,
			    				PAY_TERM_CD		: item.PAY_TERM_CD,
			    				PAY_TERM_NM		: item.PAY_TERM_NM,
			    				SCRAP_DLNG_YN	: item.SCRAP_DLNG_YN,
			    				TELNO			: item.TELNO,
			    				TPBIZ			: item.TPBIZ,
			    				TRSC_HLT_RSN	: item.TRSC_HLT_RSN,
			    				TRSC_HLT_YN		: item.TRSC_HLT_YN,
			    				WTHD_TX_YN		: item.WTHD_TX_YN
			    		}
			    		gridComPopCsList.push(msg);
			    	});
	    		}else if(settings.bizcompId == 'P_CS_ALL' || settings.bizcompId == 'P_CS_PURCHASE_DOC' || settings.bizcompId == 'P_CS_PURCHASE_DOC_FOREIGN' || settings.bizcompId == 'P_CS_ALL_FOREIGN'){
		    	   	data.cv_1.forEach((item, index) => {
			    		const msg = {
			    				ADPYR_ACNTL_CD			: item.ADPYR_ACNTL_CD,
			    				ADVANCE_ACC_NAME		: item.ADVANCE_ACC_NAME,
			    				APS_ACNT_CD		: item.APS_ACNT_CD,
			    				AP_ACC_NAME		: item.AP_ACC_NAME,
			    				AR_ACC_NAME		: gfnma_nvl2(item.AR_ACC_NAME),
			    				AR_ACNT_CD			: item.AR_ACNT_CD,
			    				BASE_SCALE : item.BASE_SCALE,
			    				BRNO : item.BRNO,
			    				CNPT_CD : item.CNPT_CD,
			    				CNPT_GROUP : item.CNPT_GROUP,
			    				CNPT_NM			: item.CNPT_NM,
			    				CO_CD		: item.CO_CD,
			    				CRN_CD		: item.CRN_CD,
			    				PAY_MTHD			: item.PAY_MTHD,
			    				PAY_TERM_CD		: item.PAY_TERM_CD,
			    				PAY_TERM_NM		: item.PAY_TERM_NM,
			    				PCPL_YN	: item.PCPL_YN,
			    				PREPAY_ACC_NAME			: item.PREPAY_ACC_NAME,
			    				PRPY_ACNT_CD			: item.PRPY_ACNT_CD,
			    				SLS_CNPT_YN	: item.SLS_CNPT_YN,
			    				TRSC_HLT_YN		: item.TRSC_HLT_YN,
			    				WTHD_TX_YN		: item.WTHD_TX_YN
			    		}
			    		gridComPopCsList.push(msg);
			    	});
	    		}else if(settings.bizcompId == 'P_COM008'){
		    	   	data.cv_1.forEach((item, index) => {
			    		const msg = {
			    				ADDR			: item.ADDR,
			    				ADPYR_ACNTL_CD		: item.ADPYR_ACNTL_CD,
			    				ADVANCE_ACC_NAME		: item.ADVANCE_ACC_NAME,
			    				AR_ACC_NAME		: item.AR_ACC_NAME,
			    				BRNO : item.BRNO,
			    				BZSTAT : item.BZSTAT,
			    				CEO_NM : item.CEO_NM,
			    				CNPT_CD			: item.CNPT_CD,
			    				CNPT_NM		: item.CNPT_NM,
			    				FX_NO		: item.FX_NO,
			    				TELNO			: item.TELNO,
			    				TPBIZ		: item.TPBIZ
			    		}
			    		gridComPopCsList.push(msg);
			    	});
	    		}
	    	   	gridComPopCs.rebuild();
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
    };
    
    
	//search button event
	$(modalId).find('.cu-btn-search-compopupcs').off('click')
	$(modalId).find('.cu-btn-search-compopupcs').click(function(){
		searchPopCs();
	});

	//clear button event
	$(modalId).find('.cu-btn-clear-compopupcs').off('click')
	$(modalId).find('.cu-btn-clear-compopupcs').click(function(){
		clearPopCs();
	});
    
	$(modalId).find('input').off('keydown')
	$(modalId).find('input').keydown(function(e){
		if(e.keyCode && e.keyCode == 13) {
			searchPopCs();
		} else if(e.keyCode && (e.keyCode == 8 || e.keyCode == 46)) {
			clearPopCs();
		}
	});
	
	if(settings.bizcompId == 'P_CS_PURCHASE_DOC' || settings.bizcompId == 'P_CS_SALE_DOC' || settings.bizcompId == "P_CS_PURCHASE"){
		setCsGridFig3510();
	}else if(settings.bizcompId == 'P_CS_ALL' || settings.bizcompId == 'P_CS_PURCHASE_DOC' || settings.bizcompId == 'P_CS_PURCHASE_DOC_FOREIGN' || settings.bizcompId == 'P_CS_ALL_FOREIGN'){
		setCsGridFig2210_99();
	}else if(settings.bizcompId == 'P_COM008'){
		setCsGridFia4300();
	}
    replaceWhereClause();
    searchPopCs();
}
 
</script>
</html>
