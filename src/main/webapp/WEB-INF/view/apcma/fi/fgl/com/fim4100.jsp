<%
/**
 * @Class Name 		: fim3100.jsp
 * @Description 	: 전표생성RULE관리 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.08
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
	<title>title : 전표생성RULE관리</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 전표생성RULE관리 -->
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
            <div class="box-body">
 
				<div class="box-search-ma"> 
	                <!--[pp] 검색 -->
					<!--[APC] START -->
						<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
					<!--[APC] END -->
	                <table id="srchArea1" class="table table-bordered tbl_fixed table-search-ma">
	                    <caption>검색 조건 설정</caption>
	                    <colgroup>
							<col style="width: 8%">
							<col style="width: 7%">
							<col style="width: 1%">
							<col style="width: 7%">
							<col style="width: 2%">
	
							<col style="width: 8%">
							<col style="width: 7%">
							<col style="width: 1%">
							<col style="width: 7%">
							<col style="width: 2%">
							
							<col style="width: 8%">
							<col style="width: 7%">
							<col style="width: 1%">
							<col style="width: 7%">
							<col style="width: 2%">
							
							<col style="width: 8%">
							<col style="width: 7%">
							<col style="width: 1%">
							<col style="width: 7%">
							<col style="width: 2%">
	                    </colgroup>
	                    <tbody>
	                        <tr>
	                            <th scope="row" class="th_bg_search">전표Rule코드</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="srch-txtrule-code" class="form-control input-sm" ></sbux-input>
	                            </td>
	                            <td colspan="16">
	                            </td>
	                        </tr>    
	                    </tbody>
	                </table>				
				</div>
                
                <div class="row">
                
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>전표생성RULE관리</span>
	                            <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
						</div>
	                </div>
	                <div>
	                    <div id="sb-area-grdTop" style="height:200px; width:100%;">
	                    </div>
	                </div>
	                
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>생성정보편집</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
						</div>
	                </div>
	                <div>
		                <table id="srchArea2" class="table table-bordered tbl_fixed">
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
		
		                        <col style="width: 7%">
		                        <col style="width: 6%">
		                        <col style="width: 6%">
		                        <col style="width: 3%">
		                    </colgroup>
		                    <tbody>
		                        <tr>
		                            <th scope="row" class="th_bg">전표Rule코드</th>
		                            <td colspan="3" class="td_input" >
		   								<sbux-input uitype="text" id="srch-txtrule-code1" class="form-control input-sm" ></sbux-input>
		                            </td>
		                            <th scope="row" class="th_bg">전표Rule명</th>
		                            <td colspan="3" class="td_input" >
		   								<sbux-input uitype="text" id="srch-rule-name" class="form-control input-sm" ></sbux-input>
		                            </td>
		                            <th scope="row" class="th_bg">회계기준</th>
		                            <td colspan="3" class="td_input" >
                        				<sbux-select id="srch-lblacct-rule-code" uitype="single" jsondata-ref="jsonLblacctRuleCode" unselected-text="선택" class="form-control input-sm" ></sbux-select>
		                            </td>
		                            <th scope="row" class="th_bg">시스템코드</th>
		                            <td colspan="3" class="td_input" >
		                       			<sbux-checkbox 
		                       				id="srch-chksystem-yn" 
		                       				uitype="normal" 
		                       				text="예" 
		                       				true-value="Y" 
		                       				false-value="N" 
		                       				style="margin-top:8px"
		                       				>
		                       			</sbux-checkbox>
		                            </td>
		                        </tr>    
		                        <tr>
		                            <th scope="row" class="th_bg">통화</th>
		                            <td colspan="3" class="td_input" >
										<div class="dropdown" style="margin-right:5px" >
										    <button id="srch-cbocurrency-code" style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby="srch-cbocurrency-code" style="width:200px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>                                    
		                            </td>
		                            <th scope="row" class="th_bg">전표구분</th>
		                            <td colspan="3" class="td_input" >
										<div class="dropdown" style="margin-right:5px" >
										    <button id="srch-cbodoc-type" style="width:200px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby="srch-cbodoc-type" style="width:300px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>                                    
		                            </td>
		                            <th scope="row" class="th_bg">비고</th>
		                            <td colspan="7" class="td_input" >
		   								<sbux-input uitype="text" id="srch-memomemo" class="form-control input-sm" ></sbux-input>
		                            </td>
		                        </tr>    
		                    </tbody>
		                </table>	                
	                </div>
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>전표생성Rule리스트</span>
	                            <span style="font-size:12px">(조회건수 <span id="listCount2">0</span>건)</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
							<a href="#" id="btn-row-add" class="cu-btn-plus" style="padding-left:10px" >
								<img src="../../../resource/images/plus.png" width="20px" /> 행추가
							</a>
							<a href="#" id="btn-row-del" class="cu-btn-minus" style="padding-left:10px">
								<img src="../../../resource/images/minus.png" width="20px" /> 행삭제
							</a>
						</div>
	                </div>
	                <div>
	                    <div id="sb-area-grdBot" style="height:240px; width:100%;">
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
	
	var jsonLblacctRuleCode 		= [];	//회계기준
    var jsonGridComboLineType 		= []; 	//행유형
    var jsonGridComboDebitCredit 	= []; 	//차/대
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//회계기준
            gfnma_setComSelect(['srch-lblacct-rule-code'], 	jsonLblacctRuleCode, 'L_FIM054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
			//통화
			gfnma_multiSelectInit({
				target			: ['#srch-cbocurrency-code']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM001'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down'	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'CRN_CD'
				,colLabel		: 'CRN_NM'
				,columns		:[
		            {caption: "코드",		ref: 'CRN_CD', 		width:'70px',  		style:'text-align:left'},
		            {caption: "명칭", 		ref: 'CRN_NM',    	width:'130px',  	style:'text-align:left'}
				]
			}),
			//전표구분
			gfnma_multiSelectInit({
				target			: ['#srch-cbodoc-type']
				,compCode		: gv_ma_selectedCorpCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIM051'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down'	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'SBSD_CD'
				,colLabel		: 'CD_NM'
				,columns		:[
		            {caption: "코드",		ref: 'SBSD_CD', 		width:'50px',  		style:'text-align:left'},
		            {caption: "명칭", 		ref: 'CD_NM',    	width:'250px',  	style:'text-align:left'}
				]
			}),
            gfnma_setComSelect([], jsonGridComboLineType, 		'L_FIM052', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect([], jsonGridComboDebitCredit, 	'L_FIG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
		]);
	}	
 
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_initSBSelect();
    	fn_createGridMast();	
    	fn_createGridDetail();
    	cfn_search();
    	
		$('#btn-row-add').click(function(e){
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
    var Fim4100GridMast; 			// 그리드를 담기위한 객체 선언
    var jsonFim4100Mast = []; 	// 그리드의 참조 데이터 주소 선언
 
    function fn_createGridMast() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTop';
	    SBGridProperties.id 				= 'Fim4100GridMast';
	    SBGridProperties.jsonref 			= 'jsonFim4100Mast';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sort';
	    SBGridProperties.useinitsorting 	= true;
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["전표Rule 코드"],			ref: 'RULE_CODE', 				type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["코드명"], 					ref: 'RULE_NAME',    			type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption: ["전표구분"],  				ref: 'DOC_NAME', 				type:'output',		width:'200px',  	style:'text-align:left'},
            {caption: ["회계기준"],    				ref: 'ACCT_RULE_NAME', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["통화"],						ref: 'CURRENCY_CODE',			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["시스템코드"], 				ref: 'SYSTEM_YN', 				type:'checkbox', 	width:'100px', 		style:'text-align:center',	typeinfo: { checkedvalue: 'Y', uncheckedvalue: 'N'}},        	
            {caption: ["비고"], 					ref: 'MEMO', 					type:'output',  	width:'200px',  	style:'text-align:left'},
        ];
 
        Fim4100GridMast = _SBGrid.create(SBGridProperties);
        Fim4100GridMast.bind('click', 'fn_viewMast');
    }
    
    //상세정보 보기
    function fn_viewMast() {
    	
    	editType = "E";    	
 
        var nRow = Fim4100GridMast.getRow();
		if (nRow < 1) {
            return;
		}
 
        let rowData = Fim4100GridMast.getRowData(nRow);
		console.log(rowData);        
		
        SBUxMethod.set("srch-txtrule-code1", 		rowData.RULE_CODE);
        SBUxMethod.set("srch-rule-name", 			rowData.RULE_NAME);
        SBUxMethod.set("srch-lblacct-rule-code",	rowData.ACCT_RULE_CODE);
        SBUxMethod.set("srch-chksystem-yn",			rowData.SYSTEM_YN);
        SBUxMethod.set("srch-memomemo",				rowData.MEMO);
        gfnma_multiSelectSet('#srch-cbocurrency-code', 	'CRN_CD', 'CRN_NM', rowData.CURRENCY_CODE);
        gfnma_multiSelectSet('#srch-cbodoc-type', 		'SBSD_CD', 'CD_NM', rowData.DOC_TYPE);
		fn_setFim4100GridDetail('ITEM');
    }
    
    //grid Detail 초기화
    var Fim4100GridDetail; 			// 그리드를 담기위한 객체 선언
    var jsonFim4100Detail = []; 	// 그리드의 참조 데이터 주소 선언
 
    function fn_createGridDetail() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdBot';
	    SBGridProperties.id 				= 'Fim4100GridDetail';
	    SBGridProperties.jsonref 			= 'jsonFim4100Detail';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : ["행유형"], ref : 'LINE_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: false,
                typeinfo : {ref : 'jsonGridComboLineType',  label : 'label', value : 'value'}
            },
            {caption : ["행유형"], ref : 'DEBIT_CREDIT', width : '70px', style : 'text-align:center', type : 'combo', disabled: false,
                typeinfo : {ref : 'jsonGridComboDebitCredit',  label : 'label', value : 'value'}
            },
            {caption: ["계정코드"],  				ref: 'ACCOUNT_CODE', 			type:'output',		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn1',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup1(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["계정명"],    				ref: 'ACCOUNT_NAME', 			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["부가세유형"],				ref: 'VAT_TYPE',				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["부가세유형명"],				ref: 'VAT_NAME',				type:'input',  		width:'200px',  	style:'text-align:left'},
            {caption: ["부서코드"],					ref: 'DEPT_CODE',				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn2',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup2(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["부서명"],					ref: 'DEPT_NAME',				type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["원가중심점코드"],			ref: 'COST_CENTER_CODE',		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn3',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup3(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["원가중심점명"],				ref: 'COST_CENTER_NAME',		type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["적요"], 					ref: 'DESCRIPTION', 			type:'input',  		width:'300px',  	style:'text-align:left'},
        ];
 
        Fim4100GridDetail = _SBGrid.create(SBGridProperties);
        Fim4100GridDetail.bind('click', 'fn_viewDetail');
    }
    
    /**
     * 그리드내 팝업(계정코드) 조회
     */
	function fn_gridPopup1(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Fim4100GridDetail.getCellData(row, 3) 
        let cellData2 = Fim4100GridDetail.getCellData(row, 5) 
    	fn_compopup1(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(계정코드) 오픈
     */
    var fn_compopup1 = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_ACNTL_CD_";
        var replaceText1 	= "_ACNT_NM_"; 
        var strWhereClause 	= "AND A.ACNTL_CD LIKE '%" + replaceText0 + "%' AND A.ACNT_NM LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정 과목');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ACCT_DOC_IN'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["코드", 			"명칭"]
   			,searchInputFields		: ["ACNTL_CD", 	"ACNT_NM"]
   			,searchInputValues		: [cellData1, 		cellData2]
			,width					: '500px'
    		,height					: '400px'
   			,tableHeader			: ["계정코드",		"계정명",		]
   			,tableColumnNames		: ["ACNTL_CD", 	"ACNT_NM"]
   			,tableColumnWidths		: ["100px", 		"300px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				//그리드내 원하는 위치에 값 셋팅하기
				Fim4100GridDetail.setCellData(row, 3, data['ACNTL_CD'], true, true);
				Fim4100GridDetail.setCellData(row, 5, data['ACNT_NM'], true, true);
			}
    	});
		SBUxMethod.openModal('modal-compopup1');
    }        
    
    /**
     * 그리드내 팝업(부서코드) 조회
     */
	function fn_gridPopup2(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Fim4100GridDetail.getCellData(row, 8) 
        let cellData2 = Fim4100GridDetail.getCellData(row, 10) 
    	fn_compopup2(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(부서코드) 오픈
     */
    var fn_compopup2 = function(row, col, cellData1, cellData2) {
    	
        var searchText1 	= cellData1;
        var searchText2 	= cellData2;
        var searchText3 	= gfnma_date4();
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_FI_DEPT'
       		,popupType				: 'B'
    		,whereClause			: ''
       		,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
   			,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
   			,searchInputValues		: [searchText1, 	searchText2,	searchText3]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '300px'
   			,tableHeader			: ["부서코드", 		"부서명"]
   			,tableColumnNames		: ["DEPT_CD", 	"DEPT_NM"]
   			,tableColumnWidths		: ["150px", 		"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fim4100GridDetail.setCellData(row, 8, 	data['DEPT_CD'], true, true);
				Fim4100GridDetail.setCellData(row, 10, 	data['DEPT_NM'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }        
    
    /**
     * 그리드내 팝업(원가중심점코드) 조회
     */
	function fn_gridPopup3(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Fim4100GridDetail.getCellData(row, 11) 
        let cellData2 = Fim4100GridDetail.getCellData(row, 13) 
    	fn_compopup3(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(원가중심점코드) 오픈
     */
    var fn_compopup3 = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_CSTCT_CD_";
        var replaceText1 	= "_CSTCT_NM_"; 
        var strWhereClause 	= "AND A.CSTCT_CD LIKE '%" + replaceText0 + "%' AND A.CSTCT_NM LIKE '%" + replaceText1 + "%' ";
        
    	SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_CC_INPUT'
       		,popupType				: 'A'
    		,whereClause			: strWhereClause
       		,searchCaptions			: ["코드", 				"명칭"]
   			,searchInputFields		: ["CSTCT_CD", 	"CSTCT_NM"]
   			,searchInputValues		: [cellData1, 			cellData2]
			,searchInputTypes		: ["input", 			"input"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '300px'
   			,tableHeader			: ["코드", 				"명칭",				"부서코드",		"부서명",		"사업장"]
   			,tableColumnNames		: ["CSTCT_CD", 	"CSTCT_NM",	"DEPT_CD",	"DEPT_NM",	"SITE_CD"]	
   			,tableColumnWidths		: ["150px", 		"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fim4100GridDetail.setCellData(row, 11, 	data['CSTCT_CD'], true, true);
				Fim4100GridDetail.setCellData(row, 13, 	data['CSTCT_NM'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');
    }        
    
    //상세정보 보기
    function fn_viewDetail() {
 
    	var nCol = Fim4100GridDetail.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = Fim4100GridDetail.getRow();
		if (nRow < 1) {
            return;
		}
 
        let rowData = Fim4100GridDetail.getRowData(nRow);
		console.log(rowData);        
    }
    
    /**
     * 목록 조회
     */
	function cfn_search() {
		fn_setFim4100GridMast('MASTER');
	}
    
    /**
     * mast 목록 가져오기
     */
    const fn_setFim4100GridMast = async function(wtype) {
 
		Fim4100GridMast.clearStatus();
 
		let p_txtrule_code	= gfnma_nvl(SBUxMethod.get("srch-txtrule-code"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN	: ''
			,V_P_LANG_ID		: ''
			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
			,V_P_RULE_CODE		: p_txtrule_code	
			,V_P_FORM_ID		: p_formId
			,V_P_MENU_ID		: p_menuId
			,V_P_PROC_ID		: ''
			,V_P_USERID			: ''
			,V_P_PC				: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/fi/fgl/com/selectFim4100List.do", {
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
 
  	        	jsonFim4100Mast.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						RULE_CODE				: gfnma_nvl(item.RULE_CD),
  						RULE_NAME				: gfnma_nvl(item.RULE_NM),
  						DOC_TYPE				: gfnma_nvl(item.SLIP_TYPE),			// --> 	L_FIM051
  						DOC_NAME				: gfnma_nvl(item.SLIP_NM),			
  						ACCT_RULE_CODE			: gfnma_nvl(item.GAAP_CD),	// -->	L_FIM054
  						ACCT_RULE_NAME			: gfnma_nvl(item.ACCT_RULE_NAME),	
  						CURRENCY_CODE			: gfnma_nvl(item.CRN_CD),	// -->	L_COM001
  						MEMO					: gfnma_nvl(item.MEMO),
  						COMP_CODE				: gfnma_nvl(item.CO_CD),
  						SYSTEM_YN				: gfnma_nvl(item.SYS_YN)
  					}
  					jsonFim4100Mast.push(msg);
  					totalRecordCount ++;
  				});
 
        		Fim4100GridMast.rebuild();
  	        	document.querySelector('#listCount1').innerText = totalRecordCount;
  	        	//deatil grid 첫번째 행 선택
				if(jsonFim4100Mast.length>0){
					Fim4100GridMast.setRow(1);
					Fim4100GridMast.moveScrollTop(1);
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
    const fn_setFim4100GridDetail = async function(wtype) {
 
		Fim4100GridDetail.clearStatus();
		let p_txtrule_code1	= gfnma_nvl(SBUxMethod.get("srch-txtrule-code1"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN	: ''
			,V_P_LANG_ID		: ''
			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
			,V_P_RULE_CODE		: p_txtrule_code1	
			,V_P_FORM_ID		: p_formId
			,V_P_MENU_ID		: p_menuId
			,V_P_PROC_ID		: ''
			,V_P_USERID			: ''
			,V_P_PC				: '' 
	    };		
 
        const postJsonPromise = gfn_postJSON("/fi/fgl/com/selectFim4100List.do", {
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
 
  	        	jsonFim4100Detail.length = 0;
  	        	data.cv_2.forEach((item, index) => {
  					const msg = {
  						RULE_CODE				: gfnma_nvl(item.RULE_CD),
  						ITEM_SEQ				: gfnma_nvl(item.ITEM_SEQ),
  						LINE_TYPE				: gfnma_nvl(item.LINE_TYPE),		// --> 	L_FIM052
  						LINE_TYPE_NAME			: gfnma_nvl(item.LINE_TYPE_NAME),	
  						DEBIT_CREDIT			: gfnma_nvl(item.DBSD_CRSD),		// -->	L_FIG003		
  						DEBIT_CREDIT_NAME		: gfnma_nvl(item.DEBIT_CREDIT_NAME),	
  						VAT_TYPE				: gfnma_nvl(item.VAT_TYPE),			
  						VAT_NAME				: gfnma_nvl(item.VAT_NM),			
  						VAT_NAME1				: gfnma_nvl(item.VAT_NAME1),			
  						ACCOUNT_CODE			: gfnma_nvl(item.ACNTL_CD),			
  						ACCOUNT_NAME			: gfnma_nvl(item.ACNT_NM),			
  						DEPT_CODE				: gfnma_nvl(item.DEPT_CD),			
  						DEPT_NAME				: gfnma_nvl(item.DEPT_NM),			
  						COST_CENTER_CODE		: gfnma_nvl(item.CSTCT_CD),			
  						COST_CENTER_NAME		: gfnma_nvl(item.CSTCT_NM),			
  						DESCRIPTION				: gfnma_nvl(item.DSCTN),			
  						COMP_CODE				: gfnma_nvl(item.CO_CD),
  					}
  					jsonFim4100Detail.push(msg);
  					totalRecordCount ++;
  				});
 
  	        	Fim4100GridDetail.rebuild();
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
        var idx = Fim4100GridDetail.getRows();
		console.log(idx);        
        Fim4100GridDetail.insertRow((idx-1), 'below');
    }
    
    /**
     * 행삭제
     */
    var fn_gridRowDel = function() {
		Fim4100GridDetail.deleteRow(Fim4100GridDetail.getRow());
    }
    
    /**
     * 신규 작성
     */
    function cfn_add() {
    	
    	editType = "N";    	
    	gfnma_uxDataClear('#srchArea2');
    	jsonFim4100Detail = [];
      	Fim4100GridDetail.rebuild();
    }
 
    /**
     * 삭제
     */
    function cfn_del() {
    	fn_delProcess();
    }
    
    const fn_delProcess = async function (){
    	
        var nRow = Fim4100GridMast.getRow();
		if (nRow < 1) {
            return;
		}
		if(confirm("선택하신 정보를 삭제하시겠습니까?")){
		}else{
			return;
		}		
		
        let rowData = Fim4100GridMast.getRowData(nRow);
 	    var paramObj = { 
 				V_P_DEBUG_MODE_YN			: ''
 				,V_P_LANG_ID				: ''
 				,V_P_COMP_CODE				: gv_ma_selectedCorpCd
 				,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
 				,V_P_RULE_CODE				: rowData.RULE_CODE
 				,V_P_RULE_NAME				: rowData.RULE_NAME
 				,V_P_DOC_TYPE     			: rowData.DOC_TYPE
 				,V_P_ACCT_RULE_CODE			: rowData.ACCT_RULE_CODE
 				,V_P_CURRENCY_CODE			: rowData.CURRENCY_CODE
 				,V_P_MEMO					: rowData.MEMO
 				,V_P_SYSTEM_YN				: rowData.SYSTEM_YN
 				,V_P_FORM_ID				: p_formId
 				,V_P_MENU_ID				: p_menuId
 				,V_P_PROC_ID				: ''
 				,V_P_USERID					: ''
 				,V_P_PC						: '' 
 		    };		
 
        const postJsonPromise = gfn_postJSON("/fi/fgl/com/saveFim4100Mast.do", {
        	getType				: 'json',
        	workType			: 'D',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;
 
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
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
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
 
        const postJsonPromise = gfn_postJSON("/fi/fgl/com/saveFim4100Mast.do", {
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
    	
    	 var chkList = Fim4100GridDetail.getUpdateData(true)
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
    	 				V_P_COMP_CODE				: gfnma_nvl(gv_ma_selectedCorpCd),
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
    	 	const postJsonPromise = gfn_postJSON("/fi/fgl/com/saveFim4100detail.do", {listData: listData});
 
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
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
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
 
        const postJsonPromise = gfn_postJSON("/fi/fgl/com/saveFim4100Mast.do", {
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
    	
		 var chkList = Fim4100GridDetail.getUpdateData(true);
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
    	 				V_P_COMP_CODE				: gfnma_nvl(gv_ma_selectedCorpCd),
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
    	 	const postJsonPromise = gfn_postJSON("/fi/fgl/com/saveFim4100detail.do", {listData: listData});
 
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
