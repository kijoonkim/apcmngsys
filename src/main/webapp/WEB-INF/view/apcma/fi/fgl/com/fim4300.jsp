<%
/**
 * @Class Name 		: fim3100.jsp
 * @Description 	: 전표유형관리 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.11
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.04.29   	장성주		최초 생성
 * @see
 *
 */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>title : 전표유형관리</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
	
	<style type="text/css">
		
	</style>
	
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 전표유형관리 -->
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
            <div class="box-body">

				<div>
	                <!--[pp] 검색 -->
					<!--[APC] START -->
						<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
					<!--[APC] END -->
	                <table id="srchArea1" class="table table-bordered tbl_fixed">
	                    <caption>검색 조건 설정</caption>
	                    <colgroup>
	                        <col style="width: 7%">
	                        <col style="width: 6%">
	                        <col style="width: 6%">
	                        <col style="width: 3%">
	
	                        <col style="width: 7%">
	                        <col style="width: 6%">
	                        <col style="width: 6%">
	                        <col style="width: 3%">
	
	                        <col style="width: 7%">
	                        <col style="width: 6%">
	                        <col style="width: 6%">
	                        <col style="width: 3%">
	                    </colgroup>
	                    <tbody>
	                        <tr>
	                            <th scope="row" class="th_bg">전표유형</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="srch-txtdoc-type" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <th scope="row" class="th_bg">전표유형명</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="srch-txtdoc-name" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <th scope="row" class="th_bg"></th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="srch-txtdoctype-p" class="form-control input-sm" ></sbux-input>
	                            </td>
	                        </tr>    
	                    </tbody>
	                </table>				
				</div>
                
                <div class="row">
                
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>전표유형관리</span>
	                            <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
	                    	<!-- 
							<a href="#" id="btn-copy-clear" class="cu-btn-clear" >
								<img src="../../../resource/images/clear.png" width="20px" /> 복사모드해제
							</a>
	                    	 -->
							<a href="#" id="btn1-row-add" class="cu-btn-plus" style="padding-left:10px" >
								<img src="../../../resource/images/plus.png" width="20px" /> 행추가
							</a>
							<a href="#" id="btn1-row-del" class="cu-btn-minus" style="padding-left:10px">
								<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
							</a>
						</div>
	                </div>
	                <div>
	                    <div id="sb-area-grdTop" style="height:200px; width:100%;">
	                    </div>
	                </div>
	                <div class="ad_tbl_top" style="padding-top:10px">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>결제경로</span>
	                            <span style="font-size:12px">(조회건수 <span id="listCount2">0</span>건)</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
	                    	<!-- 
							<a href="#" id="btn-copy-clear" class="cu-btn-clear" >
								<img src="../../../resource/images/clear.png" width="20px" /> 복사모드해제
							</a>
	                    	 -->
							<a href="#" id="btn2-row-add" class="cu-btn-plus" style="padding-left:10px" >
								<img src="../../../resource/images/plus.png" width="20px" /> 행추가
							</a>
							<a href="#" id="btn2-row-del" class="cu-btn-minus" style="padding-left:10px">
								<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
							</a>
						</div>
	                </div>
	                <div style="padding-top:10px">
	                    <div id="sb-area-grdBot" style="height:340px; width:100%;">
	                    </div>
	                </div>
                </div>
                
            </div>
        </div>
    </section>
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:700px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.userId}';
	//-----------------------------------------------------------

	var editType	= "N";
	
	//grid mast
    var jsonGridApprTemplate 		= []; 	//결재경로유형
    var jsonGridApprSourceType 		= []; 	//결재유형
    //grid detail
    var jsonGridApprRule 			= []; 	//결재룰
    var jsonGridSourceType 			= []; 	//결재유형
    var jsonGridDocType 			= []; 	//전표유형
    var jsonGridApprCategory 		= []; 	//결재구분
    var jsonGridAmtRule 			= []; 	//금액기준
    var jsonGridApprRelation 		= []; 	//관계
    
    var jsonGridEmpState 			= []; 	//재직상태
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
            gfnma_setComSelect([], jsonGridApprTemplate, 		'L_FIM062', 		'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([], jsonGridApprSourceType, 		'L_FIM062_SOURCE', 	'AND EXTRA_FIELD12 IS NULL', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([], jsonGridApprRule, 			'L_FIM063', 		'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([], jsonGridSourceType, 			'L_FIM062', 		'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([], jsonGridDocType, 			'L_FIM051', 		'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([], jsonGridApprCategory,		'L_FIM065', 		'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([], jsonGridAmtRule,				'L_FIM066', 		'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([], jsonGridApprRelation,		'L_FIM064', 		'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            
            gfnma_setComSelect([], jsonGridEmpState,			'L_HRI009', 		'', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_initSBSelect();
    	fn_createGridMast();	
    	fn_createGridDetail();
    	cfn_search();
    	
		$('#btn1-row-add').click(function(e){
			e.preventDefault();
			fn_gridRowAdd();
		});
		$('#btn-row-del').click(function(e){
			e.preventDefault();
			fn_gridRowDel();
		});
    });

    /**
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#srchArea1');
    }
    
    //grid Mast 초기화
    var Fim4300GridMast; 			// 그리드를 담기위한 객체 선언
    var jsonFim4300Mast = []; 		// 그리드의 참조 데이터 주소 선언

    function fn_createGridMast() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTop';
	    SBGridProperties.id 				= 'Fim4300GridMast';
	    SBGridProperties.jsonref 			= 'jsonFim4300Mast';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.frozencols 		= 2;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["전표유형"],					ref: 'DOC_TYPE', 				type:'input',  		width:'70px',  		style:'text-align:left'},
            {caption: ["전표유형명"], 				ref: 'DOC_NAME',    			type:'input',  		width:'150px',  	style:'text-align:left'},
            {caption: ["전표유형명(한글)"], 		ref: 'DOC_NAME_CHN', 			type:'input',		width:'150px',  	style:'text-align:left'},
            {caption: ["적요"],    					ref: 'DESCRIPTION', 			type:'input',  		width:'150px',  	style:'text-align:left'},
            {caption: ["구분자"],					ref: 'PREFIX_CODE',				type:'input',  		width:'70px',  		style:'text-align:left'},
            
            {caption: ["환차익계정"],				ref: 'EXCHAGE_GAIN_ACC',		type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn1',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup1(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["환차익계정명"],				ref: 'EXCHAGE_GAIN_ACC_NAME',	type:'input',  		width:'100px',  	style:'text-align:left'},
            
            {caption: ["환차손계정"],				ref: 'EXCHAGE_LOSS_ACC',		type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn2',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup2(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["환차손계정명"],				ref: 'EXCHAGE_LOSS_ACC_NAME',	type:'input',  		width:'100px',  	style:'text-align:left'},
            
            {caption: ["외화평가이익계정"],			ref: 'VAL_GAIN_ACC',			type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn3',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup3(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["외화평가이익계정명"],		ref: 'VAL_GAIN_ACC_NAME',		type:'input',  		width:'100px',  	style:'text-align:left'},
            
            {caption: ["외화평가손실계정"],			ref: 'VAL_LOSS_ACC',			type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn4',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup4(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["외화평가손실계정명"],		ref: 'VAL_LOSS_ACC_NAME',		type:'input',  		width:'100px',  	style:'text-align:left'},
            
        	{caption: ["시스템코드"], 				ref: 'SYSTEM_YN', 				type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
        	{caption: ["사용여부"], 				ref: 'USE_YN', 					type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
        	{caption: ["정렬순서"], 				ref: 'ORDER_SEQ', 				type:'input', 		width:'100px', 		style:'text-align:center'},        	
        	{caption: ["매입전표제한"],				ref: 'ATTR1', 					type:'input', 		width:'100px', 		style:'text-align:center'},        	
        	{caption: ["매출전표제한"],				ref: 'ATTR2', 					type:'input', 		width:'100px', 		style:'text-align:center'},        	
        	{caption: ["미결반제제한"],				ref: 'ATTR3', 					type:'input', 		width:'100px', 		style:'text-align:center'},        	
        	{caption: ["전표편철대상"],				ref: 'ATTR4', 					type:'input', 		width:'100px', 		style:'text-align:center'},        	
        	
            {caption: ["결재경로유형"], 			ref:'APPR_TEMPLATE', 			type:'combo', 		width:'100px', 		style:'text-align:center', disabled: false,
                typeinfo : {ref : 'jsonGridApprTemplate', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["결재유형"], 				ref:'APPR_SOURCE_TYPE', 		type:'combo', 		width:'100px', 		style:'text-align:center', disabled: false,
                typeinfo : {ref : 'jsonGridApprSourceType', displayui : true, label : 'label', value : 'value'}
            },
            
        	{caption: ["전표자동전기"], 			ref: 'DOC_END_YN', 				type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
        	{caption: ["매입전표"], 				ref: 'AP_DOC_YN', 				type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
        	{caption: ["매입전표조회"], 			ref: 'AP_DOC_VIEW_YN', 			type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
        	{caption: ["매출전표"], 				ref: 'AR_DOC_YN', 				type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
        	{caption: ["ESS전표"], 					ref: 'ESS_DOC_YN', 				type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
        	{caption: ["AP조회제외"], 				ref: 'AP_DOC_VIEW_EXCLUDE_YN', 	type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
        	{caption: ["채무전표작성"], 			ref: 'AP_DOC_WRITE_YN', 		type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
        	{caption: ["채권전표작성"], 			ref: 'AR_DOC_WRITE_YN', 		type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
        	{caption: ["수기전표작성"], 			ref: 'MANUAL_DOC_WRITE_YN', 	type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
        	{caption: ["복수채무전표작성"], 		ref: 'MULTI_AP_WRITE_YN', 		type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	

            {caption: ["참조5"],					ref: 'ATTR5',					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조6"],					ref: 'ATTR6',					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조7"],					ref: 'ATTR7',					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조8"],					ref: 'ATTR8',					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조9"],					ref: 'ATTR9',					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조10"],					ref: 'ATTR10',					type:'input',  		width:'100px',  	style:'text-align:left'},
        	
            {caption: ["자동보류해제"], 			ref: 'DOC_RELEASE_YN',			type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},
        ];

        Fim4300GridMast = _SBGrid.create(SBGridProperties);
        Fim4300GridMast.bind('click', 'fn_viewMast');
    }
    
    /**
     * 그리드내 팝업(환차익계정) 조회
     */
	function fn_gridPopup1(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Fim4300GridMast.getCellData(row, 6) 
        let cellData2 = Fim4300GridMast.getCellData(row, 8) 
    	fn_compopup1(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(환차익계정) 오픈
     */
    var fn_compopup1 = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_"; 
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정 과목');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 			"명칭"]
   			,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,searchInputValues		: [cellData1, 		cellData2]
			,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드",		"계정명",		]
   			,tableColumnNames		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,tableColumnWidths		: ["100px", 	"400px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				//그리드내 원하는 위치에 값 셋팅하기
				Fim4300GridMast.setCellData(row, 6, data['ACCOUNT_CODE'], true, true);
				Fim4300GridMast.setCellData(row, 8, data['ACCOUNT_NAME'], true, true);
			}
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    /**
     * 그리드내 팝업(환차손계정) 조회
     */
	function fn_gridPopup2(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Fim4300GridMast.getCellData(row, 9) 
        let cellData2 = Fim4300GridMast.getCellData(row, 11) 
    	fn_compopup2(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(환차손계정) 오픈
     */
    var fn_compopup2 = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_"; 
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정 과목');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 			"명칭"]
   			,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,searchInputValues		: [cellData1, 		cellData2]
			,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드",		"계정명",		]
   			,tableColumnNames		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,tableColumnWidths		: ["100px", 	"400px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				//그리드내 원하는 위치에 값 셋팅하기
				Fim4300GridMast.setCellData(row, 9, data['ACCOUNT_CODE'], true, true);
				Fim4300GridMast.setCellData(row, 11, data['ACCOUNT_NAME'], true, true);
			}
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    /**
     * 그리드내 팝업(외화평가이익계정) 조회
     */
	function fn_gridPopup3(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Fim4300GridMast.getCellData(row, 12) 
        let cellData2 = Fim4300GridMast.getCellData(row, 14) 
    	fn_compopup3(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(외화평가이익계정) 오픈
     */
    var fn_compopup3 = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_"; 
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정 과목');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 			"명칭"]
   			,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,searchInputValues		: [cellData1, 		cellData2]
			,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드",		"계정명",		]
   			,tableColumnNames		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,tableColumnWidths		: ["100px", 	"400px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				//그리드내 원하는 위치에 값 셋팅하기
				Fim4300GridMast.setCellData(row, 12, data['ACCOUNT_CODE'], true, true);
				Fim4300GridMast.setCellData(row, 14, data['ACCOUNT_NAME'], true, true);
			}
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    /**
     * 그리드내 팝업(외화평가손실계정) 조회
     */
	function fn_gridPopup4(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Fim4300GridMast.getCellData(row, 15) 
        let cellData2 = Fim4300GridMast.getCellData(row, 17) 
    	fn_compopup4(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(외화평가손실계정) 오픈
     */
    var fn_compopup4 = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_"; 
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정 과목');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 			"명칭"]
   			,searchInputFields		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,searchInputValues		: [cellData1, 		cellData2]
			,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드",		"계정명",		]
   			,tableColumnNames		: ["ACCOUNT_CODE", 	"ACCOUNT_NAME"]
   			,tableColumnWidths		: ["100px", 	"400px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				//그리드내 원하는 위치에 값 셋팅하기
				Fim4300GridMast.setCellData(row, 15, data['ACCOUNT_CODE'], true, true);
				Fim4300GridMast.setCellData(row, 17, data['ACCOUNT_NAME'], true, true);
			}
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    //상세정보 보기
    function fn_viewMast() {
    	
    	editType = "E";    	

        var nRow = Fim4300GridMast.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = Fim4300GridMast.getRowData(nRow);
		console.log(rowData);        
		
		let doc_type = rowData.DOC_TYPE;
 		fn_setFim4300GridDetail('DETAIL', doc_type);
    }
    
    //grid Detail 초기화
    var Fim4300GridDetail; 			// 그리드를 담기위한 객체 선언
    var jsonFim4300Detail = []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGridDetail() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdBot';
	    SBGridProperties.id 				= 'Fim4300GridDetail';
	    SBGridProperties.jsonref 			= 'jsonFim4300Detail';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["결재룰"], 					ref:'APPR_RULE', 			type:'combo', 		width:'100px', 		style:'text-align:center', disabled: false,
                typeinfo : {ref : 'jsonGridApprRule', 		displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["결재유형"], 				ref:'SOURCE_TYPE', 			type:'combo', 		width:'100px', 		style:'text-align:center', disabled: false,
                typeinfo : {ref : 'jsonGridSourceType', 	displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["전표유형"], 				ref:'DOC_TYPE', 			type:'combo', 		width:'100px', 		style:'text-align:center', disabled: false,
                typeinfo : {ref : 'jsonGridDocType', 		displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["결재구분"], 				ref:'APPR_CATEGORY', 		type:'combo', 		width:'100px', 		style:'text-align:center', disabled: false,
                typeinfo : {ref : 'jsonGridApprCategory', 	displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액기준"], 				ref:'AMT_RULE', 		type:'combo', 		width:'100px', 		style:'text-align:center', disabled: false,
                typeinfo : {ref : 'jsonGridAmtRule', 		displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액(최소)"],				ref: 'AMT_FR',					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["금액(최대)"],				ref: 'AMT_TO',					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["세부기준1"],				ref: 'SUB_CODE1',				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["세부기준2"],				ref: 'SUB_CODE2',				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["세부기준3"],				ref: 'SUB_CODE3',				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["세부기준4"],				ref: 'SUB_CODE4',				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["세부기준5"],				ref: 'SUB_CODE5',				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["순번"],						ref: 'SEQ',						type:'input',  		width:'100px',  	style:'text-align:left'},
            
            {caption: ["부서코드"],					ref: 'DEPT_CODE',				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn1',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup10(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            {caption: ["부서명"],					ref: 'DEPT_NAME',				type:'input',  		width:'100px',  	style:'text-align:left'},
            
            {caption: ["결재자"],					ref: 'APPR_EMP_CODE',			type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["관계"], 					ref: 'APPR_RELATION', 			type:'combo', 		width:'100px', 		style:'text-align:center', disabled: false,
                typeinfo : {ref : 'jsonGridApprRelation', 		displayui : true, label : 'label', value : 'value'}
            },
            
            {caption: ["결재자명"],					ref: 'APPR_EMP_NAME',			type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn2',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup11(event, " + nRow + ", " + nCol + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
            	}	
            },
            
            {caption: ["적요"], 					ref: 'DESCRIPTION', 			type:'input',  		width:'200px',  	style:'text-align:left'},
        	{caption: ["사용여부"], 				ref: 'USE_YN', 					type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
            {caption: ["적요"], 					ref: 'ORDER_SEQ', 				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조1"], 					ref: 'ATTR1', 					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조2"], 					ref: 'ATTR2', 					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조3"], 					ref: 'ATTR3', 					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조4"], 					ref: 'ATTR4', 					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조5"], 					ref: 'ATTR5', 					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조6"], 					ref: 'ATTR6', 					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조7"], 					ref: 'ATTR7', 					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조8"], 					ref: 'ATTR8', 					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조9"], 					ref: 'ATTR9', 					type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["참조10"], 					ref: 'ATTR10', 					type:'input',  		width:'100px',  	style:'text-align:left'},
        ];

        Fim4300GridDetail = _SBGrid.create(SBGridProperties);
        Fim4300GridDetail.bind('click', 'fn_viewDetail');
    }
    
    /**
     * 그리드내 팝업(부서코드) 조회
     */
	function fn_gridPopup10(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Fim4300GridDetail.getCellData(row, 14) 
        let cellData2 = Fim4300GridDetail.getCellData(row, 16) 
    	fn_compopup10(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(부서코드) 오픈
     */
    var fn_compopup10 = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_DEPT_CODE_";
        var replaceText1 	= "_DEPT_NAME_"; 
        var strWhereClause 	= "AND DEPT_CODE LIKE '%" + replaceText0 + "%' AND DEPT_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서(조직)정보');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG006'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["부서코드", 		"부서명"]
   			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME"]
   			,searchInputValues		: [cellData1, 		cellData2]
			,searchInputTypes		: ["input", 		"input"]		//input, select가 있는 경우
			,width					: '600px'
    		,height					: '400px'
   			,tableHeader			: ["부서코드",		"부서명",		"사업장명"]
   			,tableColumnNames		: ["DEPT_CODE",		"DEPT_NAME",	"SITE_NAME"]
			,tableColumnWidths		: ["100px", 		"200px",		"220px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				//그리드내 원하는 위치에 값 셋팅하기
				Fim4300GridDetail.setCellData(row, 14, data['DEPT_CODE'], true, true);
				Fim4300GridDetail.setCellData(row, 16, data['DEPT_NAME'], true, true);
			}
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    /**
     * 그리드내 팝업(결재자명) 조회
     */
	function fn_gridPopup11(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Fim4300GridDetail.getCellData(row, 17) 
        let cellData2 = Fim4300GridDetail.getCellData(row, 19) 
    	fn_compopup11(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(결재자명) 오픈
     */
    var fn_compopup11 = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_EMP_CODE_";
        var replaceText1 	= "_EMP_NAME_";
        var strWhereClause 	= "AND EMP_CODE LIKE '%" + replaceText0 + "%' AND EMP_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서(조직)정보');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_EMP_APPR'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		]
   			,searchInputFields		: ["DEPT_NAME", 	"EMP_CODE",		"EMP_NAME"		]
   			,searchInputValues		: ["", 				cellData1,		cellData2		]
			,searchInputTypes		: ["input", 		"input",		"input"			]			//input, select가 있는 경우
   			,searchInputTypeValues	: ["", 				"",				""				]	//select 경우
			,width					: '600px'
    		,height					: '400px'
   			,tableHeader			: ["사원코드",		"사원명",		"부서명"]
   			,tableColumnNames		: ["EMP_CODE", 		"EMP_NAME",		"DEPT_NAME"]
   			,tableColumnWidths		: ["100px", 		"200px",		"220px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				//그리드내 원하는 위치에 값 셋팅하기
				Fim4300GridDetail.setCellData(row, 17, data['EMP_CODE'], true, true);
				Fim4300GridDetail.setCellData(row, 19, data['EMP_NAME'], true, true);
			}
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    //상세정보 보기
    function fn_viewDetail() {

    	var nCol = Fim4300GridDetail.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = Fim4300GridDetail.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = Fim4300GridDetail.getRowData(nRow);
		console.log(rowData);        
    }
    
    /**
     * 목록 조회
     */
	function cfn_search() {
		fn_setFim4300GridMast('LIST');
	}
    
    /**
     * mast 목록 가져오기
     */
    const fn_setFim4300GridMast = async function(wtype) {

		Fim4300GridMast.clearStatus();

		let p_txtdoc_type		= gfnma_nvl(SBUxMethod.get("srch-txtdoc-type"));
		let p_txtdoc_name		= gfnma_nvl(SBUxMethod.get("srch-txtdoc-name"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN	: ''
			,V_P_LANG_ID		: ''
			,V_P_COMP_CODE		: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
		   	,V_P_DOC_TYPE      	: p_txtdoc_type	
		   	,V_P_DOC_NAME      	: p_txtdoc_name	 
		   	,V_P_USER_ID       	: p_userId
			,V_P_FORM_ID		: p_formId
			,V_P_MENU_ID		: p_menuId
			,V_P_PROC_ID		: ''
			,V_P_USERID			: ''
			,V_P_PC				: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/com/selectFim4300List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFim4300Mast.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						DOC_TYPE				: gfnma_nvl(item.DOC_TYPE),			
  						DOC_NAME				: gfnma_nvl(item.DOC_NAME),			
  						DOC_NAME_CHN			: gfnma_nvl(item.DOC_NAME_CHN),			
  						PREFIX_CODE				: gfnma_nvl(item.PREFIX_CODE),
  						DESCRIPTION				: gfnma_nvl(item.DESCRIPTION),
  						EXCHAGE_GAIN_ACC		: gfnma_nvl(item.EXCHAGE_GAIN_ACC),
  						EXCHAGE_GAIN_ACC_NAME	: gfnma_nvl(item.EXCHAGE_GAIN_ACC_NAME),
  						EXCHAGE_LOSS_ACC		: gfnma_nvl(item.EXCHAGE_LOSS_ACC),
  						EXCHAGE_LOSS_ACC_NAME	: gfnma_nvl(item.EXCHAGE_LOSS_ACC_NAME),
  						SYSTEM_YN				: gfnma_nvl(item.SYSTEM_YN),
  						USE_YN					: gfnma_nvl(item.USE_YN),
  						ORDER_SEQ				: gfnma_nvl(item.ORDER_SEQ),
  						ATTR1					: gfnma_nvl(item.ATTR1),
  						ATTR2					: gfnma_nvl(item.ATTR2),
  						ATTR3					: gfnma_nvl(item.ATTR3),
  						ATTR4					: gfnma_nvl(item.ATTR4),
  						ATTR5					: gfnma_nvl(item.ATTR5),
  						ATTR6					: gfnma_nvl(item.ATTR6),
  						ATTR7					: gfnma_nvl(item.ATTR7),
  						ATTR8					: gfnma_nvl(item.ATTR8),
  						ATTR9					: gfnma_nvl(item.ATTR9),
  						ATTR10					: gfnma_nvl(item.ATTR10),
  						AP_DOC_YN				: gfnma_nvl(item.AP_DOC_YN),
  						AR_DOC_YN				: gfnma_nvl(item.AR_DOC_YN),
  						ESS_DOC_YN				: gfnma_nvl(item.ESS_DOC_YN),
  						AP_DOC_VIEW_YN			: gfnma_nvl(item.AP_DOC_VIEW_YN),
  						AP_DOC_VIEW_EXCLUDE_YN	: gfnma_nvl(item.AP_DOC_VIEW_EXCLUDE_YN),
  						AP_DOC_VIEW_YN1			: gfnma_nvl(item.AP_DOC_VIEW_YN1),
  						AP_DOC_WRITE_YN			: gfnma_nvl(item.AP_DOC_WRITE_YN),
  						AR_DOC_WRITE_YN			: gfnma_nvl(item.AR_DOC_WRITE_YN),
  						MANUAL_DOC_WRITE_YN		: gfnma_nvl(item.MANUAL_DOC_WRITE_YN),
  						MULTI_AP_WRITE_YN		: gfnma_nvl(item.MULTI_AP_WRITE_YN),
  						APPR_TEMPLATE			: gfnma_nvl(item.APPR_TEMPLATE),
  						APPR_SOURCE_TYPE		: gfnma_nvl(item.APPR_SOURCE_TYPE),
  						DOC_END_YN				: gfnma_nvl(item.DOC_END_YN),
  						DOC_RELEASE_YN			: gfnma_nvl(item.DOC_RELEASE_YN)
  					}
  					jsonFim4300Mast.push(msg);
  					totalRecordCount ++;
  				});

        		Fim4300GridMast.rebuild();
  	        	document.querySelector('#listCount1').innerText = totalRecordCount;
  	        	
  	        	//deatil grid 첫번째 행 선택
				if(jsonFim4300Mast.length>0){
					Fim4300GridMast.setRow(1);
					Fim4300GridMast.moveScrollTop(1);
					fn_viewMast();					
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
    }
    
    /**
     * detail 목록 가져오기
     */
    const fn_setFim4300GridDetail = async function(wtype, doc_type) {

		Fim4300GridDetail.clearStatus();
		
	    var paramObj = { 
				V_P_DEBUG_MODE_YN	: ''
				,V_P_LANG_ID		: ''
				,V_P_COMP_CODE		: gv_ma_selectedApcCd
				,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
			   	,V_P_DOC_TYPE      	: doc_type	
			   	,V_P_DOC_NAME      	: ''	 
			   	,V_P_USER_ID       	: p_userId
				,V_P_FORM_ID		: p_formId
				,V_P_MENU_ID		: p_menuId
				,V_P_PROC_ID		: ''
				,V_P_USERID			: ''
				,V_P_PC				: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/com/selectFim4300List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '2',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFim4300Detail.length = 0;
  	        	data.cv_2.forEach((item, index) => {
  					const msg = {
  						DOC_TYPE				: gfnma_nvl(item.DOC_TYPE),
  						SEQ						: gfnma_nvl(item.SEQ),
  						APPR_RULE				: gfnma_nvl(item.APPR_RULE),		
  						SOURCE_TYPE				: gfnma_nvl(item.SOURCE_TYPE),		
  						DEPT_CODE				: gfnma_nvl(item.DEPT_CODE),			
  						DEPT_NAME				: gfnma_nvl(item.DEPT_NAME),			
  						APPR_EMP_CODE			: gfnma_nvl(item.APPR_EMP_CODE),			
  						APPR_EMP_NAME			: gfnma_nvl(item.APPR_EMP_NAME),			
  						APPR_RELATION			: gfnma_nvl(item.APPR_RELATION),			
  						DESCRIPTION				: gfnma_nvl(item.DESCRIPTION),			
  						USE_YN					: gfnma_nvl(item.USE_YN),			
  						ORDER_SEQ				: gfnma_nvl(item.ORDER_SEQ),			
  						ATTR1					: gfnma_nvl(item.ATTR1),			
  						ATTR2					: gfnma_nvl(item.ATTR2),			
  						ATTR3					: gfnma_nvl(item.ATTR3),			
  						ATTR4					: gfnma_nvl(item.ATTR4),			
  						ATTR5					: gfnma_nvl(item.ATTR5),			
  						ATTR6					: gfnma_nvl(item.ATTR6),			
  						ATTR7					: gfnma_nvl(item.ATTR7),			
  						ATTR8					: gfnma_nvl(item.ATTR8),			
  						ATTR9					: gfnma_nvl(item.ATTR9),			
  						ATTR10					: gfnma_nvl(item.ATTR10),			
  						APPR_CATEGORY			: gfnma_nvl(item.APPR_CATEGORY),			
  						AMT_RULE				: gfnma_nvl(item.AMT_RULE),			
  						AMT_FR					: gfnma_nvl(item.AMT_FR),			
  						AMT_TO					: gfnma_nvl(item.AMT_TO),			
  						SUB_CODE1				: gfnma_nvl(item.SUB_CODE1),			
  						SUB_CODE2				: gfnma_nvl(item.SUB_CODE2),			
  						SUB_CODE3				: gfnma_nvl(item.SUB_CODE3),			
  						SUB_CODE4				: gfnma_nvl(item.SUB_CODE4),			
  						SUB_CODE5				: gfnma_nvl(item.SUB_CODE5)			
  					}
  					jsonFim4300Detail.push(msg);
  					totalRecordCount ++;
  				});

  	        	Fim4300GridDetail.rebuild();
  	        	document.querySelector('#listCount2').innerText = totalRecordCount;

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
    
    /**
     * 행추가
     */
    var fn_gridRowAdd = function() {
        var idx = Fim4300GridDetail.getRows();
		console.log(idx);        
        Fim4300GridDetail.insertRow((idx-1), 'below');
    }
    
    /**
     * 행삭제
     */
    var fn_gridRowDel = function() {
		Fim4300GridDetail.deleteRow(Fim4300GridDetail.getRow());
    }
    
    /**
     * 저장
     */
    function cfn_save() {

    	let p_txtrule_code1 	= gfnma_nvl(SBUxMethod.get("srch-txtrule-code1"));
    	let p_rule_name			= gfnma_nvl(SBUxMethod.get("srch-rule-name"));
    	let p_lblacct_rule_code	= gfnma_nvl(SBUxMethod.get("srch-lblacct-rule-code"));
    	let p_cbocurrency_code	= gfnma_multiSelectGet('#srch-cbocurrency-code');
    	let p_cbodoc_type		= gfnma_multiSelectGet('#srch-cbodoc-type');
    	let p_chksystem_yn		= gfnma_nvl(SBUxMethod.get('srch-chksystem-yn')['srch-chksystem-yn']);
    	let p_memomemo			= gfnma_multiSelectGet('#srch-memomemo');

    	if (!p_txtrule_code1) {
            gfn_comAlert("W0002", "전표Rule코드");
            return;
        }
    	if (!p_rule_name) {
            gfn_comAlert("W0002", "전표Rule명");
            return;
        }
    	if (!p_lblacct_rule_code) {
            gfn_comAlert("W0002", "회계기준");
            return;
        }
    	if (!p_cbocurrency_code) {
            gfn_comAlert("W0002", "통화");
            return;
        }
    	if (!p_cbodoc_type) {
            gfn_comAlert("W0002", "전표구분");
            return;
        }

    	if (editType=="N") {
    		// 신규 등록
    		if(gfn_comConfirm("Q0001", "신규 등록")){
    			var obj = {
    				RULE_CODE				: p_txtrule_code1
   			    	,RULE_NAME				: p_rule_name
   			    	,DOC_TYPE				: p_cbodoc_type
   			    	,ACCT_RULE_CODE			: p_lblacct_rule_code
   			    	,CURRENCY_CODE 			: p_cbocurrency_code
   			    	,MEMO 					: p_memomemo
   			    	,SYSTEM_YN 				: p_chksystem_yn
    			}
				fn_subInsert1(obj);
    		} 
    	} else if(editType=="E") {
    		// 수정 저장
    		if(gfn_comConfirm("Q0001", "수정 저장")){
    			var obj = {
       				RULE_CODE				: p_txtrule_code1
   			    	,RULE_NAME				: p_rule_name
   			    	,DOC_TYPE				: p_cbodoc_type
   			    	,ACCT_RULE_CODE			: p_lblacct_rule_code
   			    	,CURRENCY_CODE 			: p_cbocurrency_code
   			    	,MEMO 					: p_memomemo
   			    	,SYSTEM_YN 				: p_chksystem_yn
    			}
    			fn_subUpdate1(obj);
    		} 
    	}
    }    
        
    /**
     * mast 저장
     */
    const fn_subInsert1 = async function (obj){

 	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			,V_P_RULE_CODE				: obj.RULE_CODE
			,V_P_RULE_NAME				: obj.RULE_NAME
			,V_P_DOC_TYPE     			: obj.DOC_TYPE
			,V_P_ACCT_RULE_CODE			: obj.ACCT_RULE_CODE
			,V_P_CURRENCY_CODE			: obj.CURRENCY_CODE
			,V_P_MEMO					: obj.MEMO
			,V_P_SYSTEM_YN				: obj.SYSTEM_YN
			,V_P_FORM_ID				: p_formId
			,V_P_MENU_ID				: p_menuId
			,V_P_PROC_ID				: ''
			,V_P_USERID					: ''
			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/com/saveFim4300Mast.do", {
        	getType				: 'json',
        	workType			: 'N',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		fn_subInsert2(obj);
        	} else {
          		alert(data.resultMessage);
	 			cfn_search();
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }    
    
    /**
     * detail 저장
     */
     const fn_subInsert2 = async function(pobj){
    	
    	 var chkList = Fim4300GridDetail.getUpdateData(true)
    	 console.log('---->> grid all');
    	 console.log(chkList);
    	 
    	 //서버 전송 리스트
    	 let listData 	= [];
    	 let workt		= ""; 
    	 for (var i = 0; i < chkList.length; i++) {
 			var obj = chkList[i].data;
    	 	const param = {
    	 			cv_count	: '0',
    	 			getType		: 'json',
    	 			rownum		: chkList[i].rownum,
    	 			workType	: 'N',
    	 			params		: gfnma_objectToString({
    	 				V_P_DEBUG_MODE_YN			: '',
    	 				V_P_LANG_ID					: '',
    	 				V_P_COMP_CODE				: gfnma_nvl(gv_ma_selectedApcCd),
    	 				V_P_CLIENT_CODE				: gfnma_nvl(gv_ma_selectedClntCd),
    	 				V_P_RULE_CODE				: gfnma_nvl(pobj.RULE_CODE),
    	 				V_P_ITEM_SEQ				: gfnma_nvl(i+1),
    	 				V_P_LINE_TYPE     			: gfnma_nvl(obj.LINE_TYPE),
    	 				V_P_DEBIT_CREDIT			: gfnma_nvl(obj.DEBIT_CREDIT),
    	 				V_P_VAT_TYPE				: gfnma_nvl(obj.VAT_TYPE),
    	 				V_P_ACCOUNT_CODE			: gfnma_nvl(obj.ACCOUNT_CODE),
    	 				V_P_DEPT_CODE				: gfnma_nvl(obj.DEPT_CODE),
    	 				V_P_COST_CENTER_CODE		: gfnma_nvl(obj.COST_CENTER_CODE),
    	 				V_P_DESCRIPTION				: gfnma_nvl(obj.DESCRIPTION),
    	 				V_P_FORM_ID					: gfnma_nvl(p_formId),
    	 				V_P_MENU_ID					: gfnma_nvl(p_menuId),
    	 				V_P_PROC_ID					: '',
    	 				V_P_USERID					: '',
    	 				V_P_PC						: ''
    	 			})
    	 		}			
    	 	listData.push(param);
    	 }	

    	 if(listData.length > 0) {
    	 	const postJsonPromise = gfn_postJSON("/fi/fgl/com/saveFim4300detail.do", {listData: listData});

    	 	const data = await postJsonPromise;
    	 	console.log('data:', data);
    	 	try {
    	 		if (_.isEqual("S", data.resultStatus)) {
    	 			gfn_comAlert("I0001");
    	 		} else {
    	 			alert(data.resultMessage);
    	 		}
   	 			cfn_search();

    	 	} catch (e) {
    	 		if (!(e instanceof Error)) {
    	 			e = new Error(e);
    	 		}
    	 		console.error("failed", e.message);
    	 		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    	 	}
    	 }       	
    }
        
    /**
     * mast 수정
     */
    const fn_subUpdate1 = async function (obj){

 	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			,V_P_RULE_CODE				: obj.RULE_CODE
			,V_P_RULE_NAME				: obj.RULE_NAME
			,V_P_DOC_TYPE     			: obj.DOC_TYPE
			,V_P_ACCT_RULE_CODE			: obj.ACCT_RULE_CODE
			,V_P_CURRENCY_CODE			: obj.CURRENCY_CODE
			,V_P_MEMO					: obj.MEMO
			,V_P_SYSTEM_YN				: obj.SYSTEM_YN
			,V_P_FORM_ID				: p_formId
			,V_P_MENU_ID				: p_menuId
			,V_P_PROC_ID				: ''
			,V_P_USERID					: ''
			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/com/saveFim4300Mast.do", {
        	getType				: 'json',
        	workType			: 'U',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		fn_subUpdate2(obj);
        	} else {
          		alert(data.resultMessage);
	 			cfn_search();
        	}
        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }    
    
    /**
     * detail 수정
     */
     const fn_subUpdate2 = async function(pobj){
    	
		 var chkList = Fim4300GridDetail.getUpdateData(true);
    	 console.log('---->> grid all');
    	 console.log(chkList);
    	 
    	 //서버 전송 리스트
    	 let listData 	= [];
    	 let workt		= ""; 
    	 for (var i = 0; i < chkList.length; i++) {
 			var obj = chkList[i].data;
			if(chkList[i].status=='i'){
				workt = 'N';
			} else if(chkList[i].status=='u'){
				workt = 'U';
			} else{
				workt = 'D';
			}
    	 	const param = {
    	 			cv_count	: '0',
    	 			getType		: 'json',
    	 			rownum		: chkList[i].rownum,
    	 			workType	: workt,
    	 			params		: gfnma_objectToString({
    	 				V_P_DEBUG_MODE_YN			: '',
    	 				V_P_LANG_ID					: '',
    	 				V_P_COMP_CODE				: gfnma_nvl(gv_ma_selectedApcCd),
    	 				V_P_CLIENT_CODE				: gfnma_nvl(gv_ma_selectedClntCd),
    	 				V_P_RULE_CODE				: gfnma_nvl(pobj.RULE_CODE),
    	 				V_P_ITEM_SEQ				: gfnma_nvl(obj.ITEM_SEQ),
    	 				V_P_LINE_TYPE     			: gfnma_nvl(obj.LINE_TYPE),
    	 				V_P_DEBIT_CREDIT			: gfnma_nvl(obj.DEBIT_CREDIT),
    	 				V_P_VAT_TYPE				: gfnma_nvl(obj.VAT_TYPE),
    	 				V_P_ACCOUNT_CODE			: gfnma_nvl(obj.ACCOUNT_CODE),
    	 				V_P_DEPT_CODE				: gfnma_nvl(obj.DEPT_CODE),
    	 				V_P_COST_CENTER_CODE		: gfnma_nvl(obj.COST_CENTER_CODE),
    	 				V_P_DESCRIPTION				: gfnma_nvl(obj.DESCRIPTION),
    	 				V_P_FORM_ID					: gfnma_nvl(p_formId),
    	 				V_P_MENU_ID					: gfnma_nvl(p_menuId),
    	 				V_P_PROC_ID					: '',
    	 				V_P_USERID					: '',
    	 				V_P_PC						: ''
    	 			})
    	 		}			
    	 	listData.push(param);
    	 }	

    	 if(listData.length > 0) {
    	 	const postJsonPromise = gfn_postJSON("/fi/fgl/com/saveFim4300detail.do", {listData: listData});

    	 	const data = await postJsonPromise;
    	 	console.log('data:', data);
    	 	try {
    	 		if (_.isEqual("S", data.resultStatus)) {
    	 			gfn_comAlert("I0001");
    	 		} else {
    	 			alert(data.resultMessage);
    	 		}
	 			cfn_search();

    	 	} catch (e) {
    	 		if (!(e instanceof Error)) {
    	 			e = new Error(e);
    	 		}
    	 		console.error("failed", e.message);
    	 		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    	 	}
    	 }       	
    }
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>