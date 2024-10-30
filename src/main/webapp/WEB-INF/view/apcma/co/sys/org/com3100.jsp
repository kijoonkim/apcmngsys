<%
/**
 * @Class Name 		: com3100.jsp
 * @Description 	: 국가정보 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.04.29
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
	<title>title : 국가정보</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid" style="border-radius:0px">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3><!-- 국가정보 -->
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
            <div class="box-body">

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
                            <th scope="row" class="th_bg">국가코드</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="SRCH_NATION_CODE" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            
                            <th scope="row" class="th_bg">국가명</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="SRCH_NATION_NAME" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            
                            <th scope="row" class="th_bg">공통팝업샘플1</th>
							<td colspan="2"  class="td_input" style="border-right: hidden;">
   								<sbux-input
									uitype="text"
									id="SRCH_EMP_NAME"
									class="form-control input-sm"									
   								></sbux-input>
								<sbux-input
									uitype="hidden"
									uitype="text"
									id="SRCH_EMP_CODE"
									class="form-control input-sm"
									
   								></sbux-input>
							</td>
                            <td class="td_input" >
								<sbux-button
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-compopup1"
									onclick="fn_compopup1"
								></sbux-button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg"></th>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            
                            <th scope="row" class="th_bg"></th>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            
                            <th scope="row" class="th_bg">공통팝업샘플3</th>
							<td colspan="2"  class="td_input" style="border-right: hidden;">
   								<sbux-input
									uitype="text"
									id="SRCH_DEPT_NAME"
									class="form-control input-sm"									
   								></sbux-input>
								<sbux-input
									uitype="hidden"
									uitype="text"
									id="SRCH_DEPT_CODE"
									class="form-control input-sm"
   								></sbux-input>
							</td>
                            <td class="td_input" >
								<sbux-button
									class="btn btn-xs btn-outline-dark"
									text="찾기" uitype="modal"
									target-id="modal-compopup1"
									onclick="fn_compopup3"
								></sbux-button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>코드목록</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb-area-grdComMsg" style="height:616px; width:100%;"></div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>상세정보</span></li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:30%">
                                    <col style="width:20%">
                                    <col style="width:30%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">국가코드</th>
                                    <td colspan="3" class="td_input">
                                        <sbux-input id="NATION_CODE" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">국가약어</th>
                                    <td colspan="3" class="td_input">
                                        <sbux-input id="NATION_CODE_ABBR" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">국가약식명</th>
                                    <td colspan="3" class="td_input">
                                        <sbux-input id="NATION_NAME" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">국가정식명</th>
                                    <td colspan="3" class="td_input">
                                        <sbux-input id="NATION_FULL_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">국가정식명(한글)</th>
                                    <td colspan="3" class="td_input">
                                        <sbux-input id="NATION_FULL_NAME_CHN" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">지역</th>
                                    <td scope="row" class="th_bg">
                                        <sbux-select id="REGION_CODE" uitype="single" jsondata-ref="jsonRegionCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">통화</th>
                                    <td scope="row" class="th_bg">
                                    	<!-- 
                                        <sbux-select id="CURRENCY_CODE" uitype="single" jsondata-ref="jsonCurrenvyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    	 -->
										<div class="dropdown">
										    <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="CURRENCY_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										    	<font>선택</font>
										        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
										    </button>
										    <div class="dropdown-menu" aria-labelledby="CURRENCY_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
										    </div>
										</div>                                    
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">비고</th>
                                    <td scope="row" class="th_bg">
                                        <sbux-input id="MEMO" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">정렬순서</th>
                                    <td scope="row" class="th_bg">
                                        <sbux-input id="SORT_SEQ" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">사용여부</th>
                                    <td scope="row" class="th_bg">
                                        <sbux-select id="USE_YN" uitype="single" jsondata-ref="jsonUserYnCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg"></th>
                                    <td scope="row" class="th_bg">
                                    </td>
                                </tr>
                                
                            </table>
                            
                            <br>
                            <p>테스트</p>
                            
                            <hr>
                            <p style="font-weight:bold;color:blue" >* 사진 및 싸인첨부 테스트</p>
			                <div style="width:100%;display:flex;float:right;padding-top:5px;padding-bottom:15px">
				                <input type="file" name="file" id="fileId">
			                    <sbux-button uitype="normal" text="사진(싸인첨부)" 	class="btn btn-sm btn-outline-danger" onclick="fn_imgUpload"></sbux-button>
			                </div>
                            <br>
                            
                            <p style="font-weight:bold;color:blue" >* 복수코드 팝업</p>
			                <div style="width:100%;display:flex;float:right;padding-top:5px;padding-bottom:15px">
			                    <sbux-button uitype="normal" text="복수코드 팝업" 	class="btn btn-sm btn-outline-danger" onclick="fn_compopup4"></sbux-button>
			                </div>
                            <br>
                            
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
    
	<!-- 팝업 Modal -->
    <div>
        <sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
    </div>
    <div id="body-modal-compopup3">
    	<jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
    </div>
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	//-----------------------------------------------------------

	var editType			= "N";
	
	var jsonRegionCode		= [];	// 지역
	var jsonCurrenvyCode	= [];	// 통화
	var jsonUserYnCode		= [
		{value: 'Y', label: '사용', text: '사용'},
		{value: 'N', label: '불가',	text: '불가'}
	];	// 지역
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//지역
			gfnma_setComSelect(['NationInGrid','REGION_CODE'], jsonRegionCode, 'L_COM002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			
			//통화
			//gfnma_setComSelect(['NationInGrid','CURRENCY_CODE'], jsonCurrenvyCode, 'L_COM001', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
			gfnma_setComSelect(['NationInGrid'], jsonCurrenvyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
			
			//통화
			gfnma_multiSelectInit({
				target			: ['#CURRENCY_CODE']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_COM001'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'right' 	// left, right
				,colValue		: 'CURRENCY_CODE'
				,colLabel		: 'CURRENCY_NAME'
				,columns		:[
		            {caption: "코드",		ref: 'CURRENCY_CODE', 			width:'150px',  	style:'text-align:left'},
		            {caption: "이름", 		ref: 'CURRENCY_NAME',    		width:'150px',  	style:'text-align:left'}
				]
			})
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	//파일 업로드 evnet : sample
   		gfnma_setFileChangeEvent({
   			target			: '#fileId'
   			,accessFile		: ['jpg','jpeg','png']	//파일 업로드 가능 종류 ( 파일 가능종류는 => limitFile : [] )
   			,limitFile		: []					//파일 업로드 제함 종류 ( 파일 가능종류는 => accessFile : [] )
   			,limitSizeMB	: 10
   		});
    	
    	fn_initSBSelect();
    	fn_createGrid();
    	cfn_search();
    });

    //grid 초기화
    var NationInGrid; 			// 그리드를 담기위한 객체 선언
    var jsonNationList = []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdComMsg';
	    SBGridProperties.id 				= 'NationInGrid';
	    SBGridProperties.jsonref 			= 'jsonNationList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["국가코드"],			ref: 'NATION_CODE', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["국가약어"], 		ref: 'NATION_CODE_ABBR',    	type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["팝업"], 			ref: 'POP_BTN',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_gridPopup(event, " + nRow + ", " + nCol + ")'>선택</button>";
            	}	
            },
            {caption: ["선택"],  			ref: 'POP_SEL',    				type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: ["국가약식명"],  		ref: 'NATION_NAME',    			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["국가정식명"],      	ref: 'NATION_FULL_NAME', 		type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["국가정식명(한글)"],	ref: 'NATION_FULL_NAME_CHN',	type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["지역"],				ref: 'REGION_CODE', 			type:'combo',  		width:'100px',  	style:'text-align:left', disabled: true,
            	typeinfo: {
					ref			: 'jsonRegionCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },
            {caption: ["통화"],				ref: 'CURRENCY_CODE',   		type:'combo',  		width:'100px',  	style:'text-align:left', disabled: true,
            	typeinfo: {
					ref			: 'jsonCurrenvyCode',
					label		: 'label',
					value		: 'value',
					itemcount	: 10
            	}
            },
            {caption: ["비고"], 			ref: 'MEMO', 				type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["정렬순서"], 		ref: 'SORT_SEQ',  			type:'output',  	width:'100px',  	style:'text-align:left'},
        	{caption: ["사용여부"], 		ref: 'USE_YN', 				type:'output',		width:'80px',		style:'text-align:center'}
        ];

        NationInGrid = _SBGrid.create(SBGridProperties);
        NationInGrid.bind('click', 'fn_view');
    }

    /**
     * 그리드내 팝업 조회
     */
	function fn_gridPopup(event, row, col) {
		
    	console.log('grid popup row:', row);
    	console.log('grid popup col:', col);
    	
		event.stopPropagation();	//이벤트가 그리드에 전파되는것 중지
    	fn_compopup2(row, col);
	}

    /**
     * 그리드내 공통팝업 오픈
     */
    var fn_compopup2 = function(row, col) {
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
		SBUxMethod.openModal('modal-compopup1');
    	
        var searchText 		= "";
        var replaceText0 	= "_EMP_CODE_";
        var replaceText1 	= "_EMP_NAME_"; 
        var strWhereClause 	= "AND X.EMP_CODE LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE = 'WORK'";
    	
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_HRI001_ESS'
           	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["사번", 		"사원명"]
   			,searchInputFields		: ["EMP_CODE", 	"EMP_NAME"]
   			,searchInputValues		: ["", 			searchText]
    		,height					: '400px'
   			,tableHeader			: ["사번", "직원명", "부서코드", "부서명", "사업장명","직위명"]
   			,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_CODE", "DEPT_NAME","SITE_NAME","POSITION_NAME"]
   			,tableColumnWidths		: ["80px", "80px", "80px", "120px", "120px", "100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				//그리드내 원하는 위치에 값 셋팅하기
				NationInGrid.setCellData(row, (col+1), data['EMP_CODE']);
			}
    	});
    }    	
    
    /**
     * 파일첨부시 필요 변수
     */
	var lgv_sourceType = 'HRITRIPEXPENSEHEADER';    // 화면(업무)마다 소스타입이 다르다.
	var lgv_sourceCode = 'TR231201-001';     		// 소스코드는 신규 저장후 리턴되는 값을 지정하여야 한다.
	
    /**
     * 파일첨부
     */
    var cfn_attach = function() {
    	
    	if( (lgv_sourceType) && (lgv_sourceCode) ){
			compopfilemng({
	    		compCode		: gv_ma_selectedApcCd
	    		,clientCode		: gv_ma_selectedClntCd
	    		,sourceType		: lgv_sourceType
	    		,sourceCode		: lgv_sourceCode
	   			,formID			: p_formId
	   			,menuId			: p_menuId    		
			});
    	}
    }
	
    /**
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#dataArea1');
    }
	
    /**
     * 결재처리 필요 변수
     */
	var lgv_apv_apprId		= '0';    				// 상신시:0, 승인(반려): 부모에서 온 값
	var lgv_apv_sourceNo	= '2024-00062';    		// 부모에서 온값
	var lgv_apv_sourceType 	= 'OIL';     			// 부모에서 온값
	var p_empCd 			= '${loginVO.empCd}';	
	
    /**
     * 결재처리
     */
    var cfn_appr = function() {
    	
    	//본인이 상신하는 경우
    	compopappvmng({
    		workType		: 'TEMPLATE'	// 상신:TEMPLATE , 승인(반려):APPR
    		,compCode		: gv_ma_selectedApcCd
    		,compCodeNm		: gv_ma_selectedApcNm
    		,clientCode		: gv_ma_selectedClntCd
    		,apprId			: lgv_apv_apprId
    		,sourceNo		: lgv_apv_sourceNo
    		,sourceType		: lgv_apv_sourceType
   			,empCode		: p_empCd
   			,formID			: p_formId
   			,menuId			: p_menuId    		
		});
    	
    	//본인이 상신한 것을 조회하는 경우
//     	compopappvmng({
//     		workType		: 'APPR'	// 상신:TEMPLATE , 승인(반려):APPR
//      	,compCode		: gv_ma_selectedApcCd
//        	,compCodeNm		: gv_ma_selectedApcNm
//        	,clientCode		: gv_ma_selectedClntCd
//        	,apprId			: '18'		
//        	,sourceNo		: lgv_apv_sourceNo
//        	,sourceType		: lgv_apv_sourceType
//    		,empCode		: p_empCd
//    		,formID			: p_formId
//    		,menuId			: p_menuId    		
// 		});
    	
    	//상위 결재권자가 조회 및 승인 할때
//     	compopappvmng({
//     		workType		: 'APPR'	// 상신:TEMPLATE , 승인(반려):APPR
//     		,compCode		: gv_ma_selectedApcCd
//     		,compCodeNm		: gv_ma_selectedApcNm
//     		,clientCode		: gv_ma_selectedClntCd
//     		,apprId			: '18'		// 부모화면에서 결재자가 가지고 있는 값
//        	,sourceNo		: lgv_apv_sourceNo
//        	,sourceType		: lgv_apv_sourceType
//    		,empCode		: '26223075'	//p_empCd
//    		,formID			: p_formId
//    		,menuId			: p_menuId    		
// 		});
    	
    }

    /**
     * 사진 및 싸인 업로드
     */
	const fn_imgUpload = async function() {
    	
		var my_empCd = '${loginVO.empCd}';	
    	
    	if($('#fileId').val()){
    	} else {
            gfn_comAlert("E0000", "사진 혹은 싸인을 선택하세요.");
            return false;
    	}
    	
    	var paramData 	= new FormData();
    	paramData.append("files", 			document.getElementById('fileId').files[0]);	
    	paramData.append("type", 			"1");		// 1:사진 , 2:싸인
    	paramData.append("empCode", 		my_empCd);
    	paramData.append("comp_code", 		gv_ma_selectedApcCd);
    	paramData.append("client_code", 	gv_ma_selectedClntCd);
    	paramData.append("formID", 			p_formId);
    	paramData.append("menuId", 			p_menuId);

    	const postJsonPromise = gfn_postFormData("/com/hrImageUpload.do", paramData);
    	const data = await postJsonPromise;

    	try {
    		if (_.isEqual("S", data.resultStatus)) {
    			if(data.resultMessage){
    				alert(data.resultMessage);
    			}
    			gfn_comAlert("I0001");	
				console.log('result =====>>>>>>>', data);    			
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
    	
    	//이미지(사진,싸인) 보여줄때
    	// <img src="/com/getFileImage.do?fkey=fdf31133e11545f0b2f0ada67efcd5e8.png&comp_code=8888&client_code=100" />
    	
    }
    
    /**
     * 목록 조회
     */
	function cfn_search() {
		fn_setNationInGrid();
	}
	
    /**
     * 목록 가져오기
     */
    const fn_setNationInGrid = async function() {

    	// form clear
    	fn_clearForm();

		NationInGrid.clearStatus();

		let NATION_CODE	= gfn_nvl(SBUxMethod.get("SRCH_NATION_CODE"));
		let NATION_NAME	= gfn_nvl(SBUxMethod.get("SRCH_NATION_NAME"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN	: ''
			,V_P_LANG_ID		: ''
			,V_P_COMP_CODE		: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
			,V_P_NATION_CODE	: NATION_CODE
			,V_P_NATION_NAME	: NATION_NAME
			,V_P_FORM_ID		: p_formId
			,V_P_MENU_ID		: p_menuId
			,V_P_PROC_ID		: ''
			,V_P_USERID			: ''
			,V_P_PC				: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/co/sys/org/selectCom3100List.do", {
        	getType				: 'json',
        	workType			: 'LIST',
        	cv_count			: '1',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		//console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonNationList.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						NATION_CODE				: item.NATION_CODE,
  						NATION_CODE_ABBR		: item.NATION_CODE_ABBR,
  						NATION_NAME				: item.NATION_NAME,
  						NATION_FULL_NAME		: item.NATION_FULL_NAME,
  						NATION_FULL_NAME_CHN	: item.NATION_FULL_NAME_CHN,
  						REGION_CODE				: item.REGION_CODE,
  						CURRENCY_CODE			: item.CURRENCY_CODE,
  						MEMO					: item.MEMO,
  						SORT_SEQ				: item.SORT_SEQ,
  						USE_YN 					: item.USE_YN
  					}
  					jsonNationList.push(msg);
  					totalRecordCount ++;
  				});

        		NationInGrid.rebuild();
  	        	document.querySelector('#listCount').innerText = totalRecordCount;

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
     * 공통팝업
     */
    var fn_compopup1 = function() {
    	
    	//type A 형 팝업
    	
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 	= "_EMP_CODE_";
        var replaceText1 	= "_EMP_NAME_";
        var strWhereClause 	= "AND X.EMP_CODE LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE = 'WORK'";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_HRI001_ESS'
        	,popupType				: 'A'
    		,whereClause			: strWhereClause
   			,searchCaptions			: ["사번", 		"사원명"]
   			,searchInputFields		: ["EMP_CODE", 	"EMP_NAME"]
   			,searchInputValues		: ["", 			searchText]
    		,height					: '400px'
   			,tableHeader			: ["사번", "직원명", "부서코드", "부서명", "사업장명","직위명"]
   			,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_CODE", "DEPT_NAME","SITE_NAME","POSITION_NAME"]
   			,tableColumnWidths		: ["80px", "80px", "80px", "120px", "120px", "100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
				SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
			},
    	});
  	}
	
    /**
     * 공통팝업3
     */
    var fn_compopup3 = function() {

    	//type B 형 팝업
    	var addParams = ['p1', 'p2'];	//bizcompId 의 파라미터에 따라 추가할것
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
    	compopup1({
    		compCode				: gv_ma_selectedApcCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'P_ORG001'
    		,popupType				: 'B'
    		,whereClause			: addParams
   			,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
   			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
   			,searchInputValues		: ["", 				"",				"2024-07-10"]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,height					: '400px'
   			,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
   			,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
   			,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NAME);
			},
    	});
    	//SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
  	}

    /**
     * 복수코드 팝업
     */
    var fn_compopup4 = function() {
    	
    	SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
		SBUxMethod.openModal('modal-compopup3');
		
    	compopup3({
    		height			: '400px'
   			,callbackEvent	: function (data){
   				console.log('callback data:', data);
   			},
    	});
    	SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
  	}    
    
    //신규 작성
    function cfn_add() {
    	
    	editType = "N";    	

        SBUxMethod.attr('NATION_CODE',	'readonly', false);
    	
    	SBUxMethod.set("NATION_CODE", 			"");
    	SBUxMethod.set("NATION_CODE_ABBR", 		"");
        SBUxMethod.set("NATION_NAME", 			"");
        SBUxMethod.set("NATION_FULL_NAME", 		"");
        SBUxMethod.set("NATION_FULL_NAME_CHN", 	"");
        
        SBUxMethod.set("REGION_CODE", 			"");
        
        //SBUxMethod.set("CURRENCY_CODE", 		"");
        gfnma_multiSelectSet('#CURRENCY_CODE', '', '', '');
        
        SBUxMethod.set("MEMO", 					"");
        SBUxMethod.set("SORT_SEQ", 				"");
        SBUxMethod.set("USE_YN", 				"");
    }

    const fn_clearForm = function() {
    	SBUxMethod.set("NATION_CODE", 			"");
    	SBUxMethod.set("NATION_CODE_ABBR", 		"");
        SBUxMethod.set("NATION_NAME", 			"");
        SBUxMethod.set("NATION_FULL_NAME", 		"");
        SBUxMethod.set("NATION_FULL_NAME_CHN", 	"");
        
        SBUxMethod.set("REGION_CODE", 			"");
        
        //SBUxMethod.set("CURRENCY_CODE", 		"");
        gfnma_multiSelectSet('#CURRENCY_CODE', '', '', '');
        
        SBUxMethod.set("MEMO", 					"");
        SBUxMethod.set("SORT_SEQ", 				"");
        SBUxMethod.set("USE_YN", 				"");
    }

    //저장
    function cfn_save() {

    	let NATION_CODE 			= gfn_nvl(SBUxMethod.get("NATION_CODE"));
    	let NATION_CODE_ABBR		= gfn_nvl(SBUxMethod.get("NATION_CODE_ABBR"));
    	let NATION_NAME 			= gfn_nvl(SBUxMethod.get("NATION_NAME"));
    	let NATION_FULL_NAME		= gfn_nvl(SBUxMethod.get("NATION_FULL_NAME"));
    	let NATION_FULL_NAME_CHN	= gfn_nvl(SBUxMethod.get("NATION_FULL_NAME_CHN"));
    	let REGION_CODE 			= gfn_nvl(SBUxMethod.get("REGION_CODE"));
    	
    	//let CURRENCY_CODE			= gfn_nvl(SBUxMethod.get("CURRENCY_CODE"));
    	let CURRENCY_CODE			= gfnma_multiSelectGet('#CURRENCY_CODE');
    	
    	let MEMO 					= gfn_nvl(SBUxMethod.get("MEMO"));
    	let SORT_SEQ 				= gfn_nvl(SBUxMethod.get("SORT_SEQ"));
    	let USE_YN 					= gfn_nvl(SBUxMethod.get("USE_YN"));

    	if (!NATION_CODE) {
            gfn_comAlert("W0002", "국가코드");
            return;
        }
    	if (!NATION_NAME) {
            gfn_comAlert("W0002", "국가약식명");
            return;
        }
    	if (!NATION_FULL_NAME) {
            gfn_comAlert("W0002", "국가정식명");
            return;
        }
    	if (!NATION_FULL_NAME_CHN) {
            gfn_comAlert("W0002", "국가정식명(한글)");
            return;
        }
    	if (!REGION_CODE) {
            gfn_comAlert("W0002", "지역");
            return;
        }
    	if (!CURRENCY_CODE) {
            gfn_comAlert("W0002", "통화");
            return;
        }
    	if (!SORT_SEQ) {
            gfn_comAlert("W0002", "정렬순서");
            return;
        }
    	if (!USE_YN) {
            gfn_comAlert("W0002", "사용여부");
            return;
        }

    	if (editType=="N") {
    		// 신규 등록
    		if(gfn_comConfirm("Q0001", "신규 등록")){
    			var obj = {
   			    	NATION_CODE				: NATION_CODE
   			    	,NATION_NAME			: NATION_NAME
   			    	,NATION_FULL_NAME		: NATION_FULL_NAME
   			    	,NATION_FULL_NAME_CHN	: NATION_FULL_NAME_CHN
   			    	,NATION_CODE_ABBR 		: NATION_CODE_ABBR
   			    	,REGION_CODE 			: REGION_CODE
   			    	,CURRENCY_CODE			: CURRENCY_CODE
   			    	,MEMO 					: MEMO
   			    	,SORT_SEQ 				: SORT_SEQ
   			    	,USE_YN 				: USE_YN
    			}
				fn_subInsert(obj);
    		} 
    	} else if(editType=="E") {
    		// 수정 저장
    		if(gfn_comConfirm("Q0001", "수정 저장")){
    			var obj = {
   			    	NATION_CODE				: NATION_CODE
   			    	,NATION_NAME			: NATION_NAME
   			    	,NATION_FULL_NAME		: NATION_FULL_NAME
   			    	,NATION_FULL_NAME_CHN	: NATION_FULL_NAME_CHN
   			    	,NATION_CODE_ABBR 		: NATION_CODE_ABBR
   			    	,REGION_CODE 			: REGION_CODE
   			    	,CURRENCY_CODE			: CURRENCY_CODE
   			    	,MEMO 					: MEMO
   			    	,SORT_SEQ 				: SORT_SEQ
   			    	,USE_YN 				: USE_YN
    			}
    			fn_subUpdate(obj);
    		} 
    	}

    }

    /**
     * @param {boolean} isConfirmed
     */
    const fn_subInsert = async function (obj){

 	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedApcCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			,V_P_NATION_CODE			: obj.NATION_CODE
			,V_P_NATION_NAME			: obj.NATION_NAME
			,V_P_NATION_FULL_NAME     	: obj.NATION_FULL_NAME
			,V_P_NATION_FULL_NAME_CHN	: obj.NATION_FULL_NAME_CHN
			,V_P_NATION_CODE_ABBR		: obj.NATION_CODE_ABBR
			,V_P_REGION_CODE			: obj.REGION_CODE
			,V_P_CURRENCY_CODE			: obj.CURRENCY_CODE
			,V_P_MEMO					: obj.MEMO
			,V_P_SORT_SEQ				: obj.SORT_SEQ
			,V_P_USE_YN					: obj.USE_YN
			,V_P_FORM_ID				: p_formId
			,V_P_MENU_ID				: p_menuId
			,V_P_PROC_ID				: ''
			,V_P_USERID					: ''
			,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/co/sys/org/insertCom3100.do", {
        	getType				: 'json',
        	workType			: 'N',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        		cfn_search();
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

	const fn_subUpdate = async function (obj){

  	    var paramObj = { 
  				V_P_DEBUG_MODE_YN			: ''
  				,V_P_LANG_ID				: ''
				,V_P_COMP_CODE				: gv_ma_selectedApcCd
				,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
  				,V_P_NATION_CODE			: obj.NATION_CODE
  				,V_P_NATION_NAME			: obj.NATION_NAME
  				,V_P_NATION_FULL_NAME     	: obj.NATION_FULL_NAME
  				,V_P_NATION_FULL_NAME_CHN	: obj.NATION_FULL_NAME_CHN
  				,V_P_NATION_CODE_ABBR		: obj.NATION_CODE_ABBR
  				,V_P_REGION_CODE			: obj.REGION_CODE
  				,V_P_CURRENCY_CODE			: obj.CURRENCY_CODE
  				,V_P_MEMO					: obj.MEMO
  				,V_P_SORT_SEQ				: obj.SORT_SEQ
  				,V_P_USE_YN					: obj.USE_YN
  				,V_P_FORM_ID				: p_formId
  				,V_P_MENU_ID				: p_menuId
  				,V_P_PROC_ID				: ''
  				,V_P_USERID					: ''
  				,V_P_PC						: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/co/sys/org/updateCom3100.do", {
        	getType				: 'json',
        	workType			: 'U',
        	cv_count			: '0',
        	params				: gfnma_objectToString(paramObj)
		});    	 
        const data = await postJsonPromise;

        try {
        	if (_.isEqual("S", data.resultStatus)) {
        		if(data.resultMessage){
	          		alert(data.resultMessage);
        		}
        		cfn_search();
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

    //상세정보 보기
    function fn_view() {

    	editType = "E";    	
    	
    	var nCol = NationInGrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = NationInGrid.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = NationInGrid.getRowData(nRow);
		
        SBUxMethod.attr('NATION_CODE',	'readonly', true);
        
        /*
        SBUxMethod.set("NATION_CODE", 			rowData.NATION_CODE);
        SBUxMethod.set("NATION_CODE_ABBR", 		rowData.NATION_CODE_ABBR);
        SBUxMethod.set("NATION_NAME", 			rowData.NATION_NAME);
        SBUxMethod.set("NATION_FULL_NAME", 		rowData.NATION_FULL_NAME);
        SBUxMethod.set("NATION_FULL_NAME_CHN", 	rowData.NATION_FULL_NAME_CHN);
        SBUxMethod.set("REGION_CODE", 			rowData.REGION_CODE);
        gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', rowData.CURRENCY_CODE);
        SBUxMethod.set("MEMO", 					rowData.MEMO);
        SBUxMethod.set("SORT_SEQ", 				rowData.SORT_SEQ);
        SBUxMethod.set("USE_YN", 				rowData.USE_YN);
        */
        
        gfnma_uxDataSet('#dataArea1', rowData);
        gfnma_multiSelectSet('#CURRENCY_CODE', 'CURRENCY_CODE', 'CURRENCY_NAME', rowData.CURRENCY_CODE);
        
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>