<%
/**
 * @Class Name 		: com3100.jsp
 * @Description 	: 감가상각률등록 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.10.17
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.10.17   	장성주		최초 생성
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
	<title>title : 감가상각률등록</title>
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
                    </h3><!-- 감가상각률등록 -->
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
	                            <th scope="row" class="th_bg_search">감가상각방법</th>
	                            <td colspan="11" class="td_input" >
	                                <sbux-select id="SCH_DEPRECIATION_METHOD" style="width:150px" uitype="single" jsondata-ref="jsonDepreciationMethod" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                            </td>
	                            <td></td>
	                            
	                            <td colspan="15"></td>
	                            
	                        </tr>
	                    </tbody>
	                </table>
                </div>
                
                <div class="row">
                    <div class="col-sm-6" style="width:20%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>감가상각률리스트</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <div id="sb_area_grid1" style="height:580px; width:100%;"></div>
                        </div>
                    </div>

                    <div class="col-sm-6" style="width:80%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>감가상각률정보편집</span></li>
                            </ul>
                        </div>
                        <div style="height:580px;overflow:auto;">
                        	<table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
			                        <col style="width: 10%">
			                        <col style="width: 6%">
			                        <col style="width: 6%">
			
			                        <col style="width: 10%">
			                        <col style="width: 6%">
			                        <col style="width: 6%">
			
			                        <col style="width: 10%">
			                        <col style="width: 6%">
			                        <col style="width: 6%">
			
			                        <col style="width: 10%">
			                        <col style="width: 6%">
			                        <col style="width: 6%">
                                </colgroup>
			                    <tbody>
	                                <tr>
	                                    <th scope="row" class="th_bg">감가상각방법</th>
	                                    <td colspan="2" class="td_input">
			                                <sbux-select id="FM_DEPRECIATION_METHOD2" jsondata-ref="jsonDepreciationMethod" uitype="single" unselected-text="선택" class="form-control input-sm"></sbux-select>
	                                    </td>
	                                
	                                    <th scope="row" class="th_bg">생성주기</th>
	                                    <td colspan="2" class="td_input">
	                                        <sbux-input id="FM_USEFUL_LIFE_CNT" class="form-control input-sm" uitype="text" ></sbux-input>
	                                    </td>
	                                
	                                    <th scope="row" class="th_bg">
	                                    	<font id="FM_SALVAGE_RATE">
		                                    	잔존비율
	                                    	</font>
	                                    </th>
	                                    <td colspan="2" class="td_input">
	                                        <sbux-input id="FM_SALVAGE_RATE" class="form-control input-sm" uitype="text" ></sbux-input>
	                                    </td>
	                                    
	                                    <td colspan="3" class="td_input">
			                            	<div style="text-align:right;vertical-align:middle;width:100%">
							                    <sbux-button id="BTN_STANDARDAPPLY" 	uitype="normal" text="표준값.적용하기"  	class="btn btn-sm btn-outline-danger" onclick="fn_standardApply"></sbux-button>
			                            	</div>
	                                    </td>
	                                </tr>
                                </tbody>
                            </table>
	                        <div>
	                            <div id="sb_area_grid2" style="height:540px; width:100%;"></div>
	                        </div>
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
	var p_userId 	= '${loginVO.userId}';
	
	var p_ss_languageID	= '${loginVO.maLanguageID}';
	//-----------------------------------------------------------

	var p_sel_rowData =  null;
	
    //grid 초기화
    var Fia1200GridMast; 			// 그리드를 담기위한 객체 선언
    var jsonFia1200Mast = []; 		// 그리드의 참조 데이터 주소 선언
    
    var Fia1200GridDetail; 			// 그리드를 담기위한 객체 선언
    var jsonFia1200Detail = []; 	// 그리드의 참조 데이터 주소 선언

	var jsonDepreciationMethod		= [];	// 감가상각방법
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//감가상각방법
			gfnma_setComSelect(['SCH_DEPRECIATION_METHOD','FM_DEPRECIATION_METHOD2'], jsonDepreciationMethod, 'L_FIA003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
		]);
	}	

	async function fn_init() {
		
  		await fn_initSBSelect()
  		
		//화면셋팅
    	fn_state('L');
  		
  		fn_createFia1200GridMast();
  		fn_createFia1200GridDetail();
		//cfn_search();
	} 
	
    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_init();
    });

    /**
     * 초기화
     */
    var cfn_init = function() {
    	gfnma_uxDataClear('#srchArea1');
    }
    
    /**
     * 화면 state 변경
     */
    function fn_state(type) {
    
    	if(type=='L'){
			$('#main-btn-new', parent.document).attr('disabled', true);
			$('#main-btn-save', parent.document).attr('disabled', true);
			$('#main-btn-del', 	parent.document).attr('disabled', true);
			fn_fmDisabled(true);
    	} else if(type=='N'){
    		SBUxMethod.attr('FM_DEPRECIATION_METHOD2', 		'readonly', false);
    		$('#main-btn-save', parent.document).attr('disabled', false);
    		$('#main-btn-del', 	parent.document).attr('disabled', false);
			fn_fmDisabled(false);
    	}
    }    
    
    /**
     * 목록 조회
     */
 	function cfn_search() {
 		p_sel_rowData = null;    	
 		fn_state('L');
    	fn_setFia1200GridMast('LIST');
    }
    
    /**
     * 그리드 셋팅
     */
    function fn_createFia1200GridMast() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid1';
	    SBGridProperties.id 				= 'Fia1200GridMast';
	    SBGridProperties.jsonref 			= 'jsonFia1200Mast';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["감가상각방법"],		ref: 'DEPRECIATION_NAME', 		type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["잔존비율"], 		ref: 'SALVAGE_RATE',  		  	type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fia1200GridMast = _SBGrid.create(SBGridProperties);
        Fia1200GridMast.bind('click', 			'fn_viewFia1200GridMastEvent');
    }
    
    //상세정보 보기
    function fn_viewFia1200GridMastEvent() {
    	
    	let nRow = Fia1200GridMast.getRow();
    	let nCol = Fia1200GridMast.getCol();
		if (nRow < 1) {
            return;
		}
        let rowData = Fia1200GridMast.getRowData(nRow);
        p_sel_rowData = rowData;
        console.log('rowData:', rowData);
		
		SBUxMethod.attr('FM_DEPRECIATION_METHOD2', 	'readonly', true);
        
        if(rowData['DEPRECIATION_METHOD']=='RATE'){
        	$('#FM_SALVAGE_RATE').show();
        	SBUxMethod.show('#FM_SALVAGE_RATE');
        } else {
        	$('#FM_SALVAGE_RATE').hide();
        	SBUxMethod.hide('FM_SALVAGE_RATE');
        }
        
        //detail
        SBUxMethod.set('FM_DEPRECIATION_METHOD2', 	rowData['DEPRECIATION_METHOD']);
        SBUxMethod.set('FM_USEFUL_LIFE_CNT', 		rowData['USEFUL_LIFE_CNT']);
        fn_setFia1200Detail('DETAIL', rowData);
    }  
    
    /**
     * 디테일 그리드 셋팅
     */
    function fn_createFia1200GridDetail() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb_area_grid2';
	    SBGridProperties.id 				= 'Fia1200GridDetail';
	    SBGridProperties.jsonref 			= 'jsonFia1200Detail';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    //SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["내용년수"],				ref: 'USEFUL_LIFE_SEQ', 			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["감가상각률(*1000)"], 	ref: 'DEPRECIATION_RATE1000', 		type:'output',		width:'150px',  	style:'text-align:right', format : {type:'number', rule:'#,###.0000'}},
            
            {caption: ["비고"], 				ref: 'ETC', 				 		type:'output',  	width:'100px',  	style:'text-align:left'},
        ];

        Fia1200GridDetail = _SBGrid.create(SBGridProperties);
        Fia1200GridDetail.bind('click', 		'fn_viewFia1200GridDetailEvent');
    }

    //상세정보 보기
    function fn_viewFia1200GridDetailEvent() {
    	
    	let nRow = Fia1200GridDetail.getRow();
    	let nCol = Fia1200GridDetail.getCol();
		if (nRow < 1) {
            return;
		}
        let rowData = Fia1200GridDetail.getRowData(nRow);
        p_sel_rowData = rowData;
        console.log('rowData:', rowData);
        
    }  
    
    /**
     * 화면 입력 상태
     */
    function fn_fmDisabled(type) {
		SBUxMethod.attr('FM_DEPRECIATION_METHOD2', 		'readonly', type);
		SBUxMethod.attr('FM_USEFUL_LIFE_CNT', 			'readonly', type);
		SBUxMethod.attr('FM_SALVAGE_RATE', 				'readonly', type);
		
		SBUxMethod.attr('BTN_STANDARDAPPLY', 			'disabled', type);
    }
    
    /**
     * 목록조회
     */
    const fn_setFia1200GridMast = async function(wtype) {
		
  		Fia1200GridMast.clearStatus();
    	
		let p_depreciation_method	= gfnma_nvl(SBUxMethod.get("SCH_DEPRECIATION_METHOD"));
		let p_salvage_rage			= '0';
		let p_useful_life_cnt		= '0';
		
		if(!p_depreciation_method){
    		gfn_comAlert("E0000","감가상각방법을 선택하세요");
    		return;
			
		}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
			,V_P_DEPRECIATION_METHOD	: p_depreciation_method
			,IV_P_SALVAGE_RATE			: p_salvage_rage
			,V_P_USEFUL_LIFE_CNT		: p_useful_life_cnt
			
			,V_P_FORM_ID				: p_formId
			,V_P_MENU_ID				: p_menuId
			,V_P_PROC_ID				: ''
			,V_P_USERID					: p_userId
			,V_P_PC						: '' 
	    };		
		console.log('paramObj:', paramObj);
        const postJsonPromise = gfn_postJSON("/fi/ffa/com/selectFia1200List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '3',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFia1200Mast.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
						DEPRECIATION_METHOD			: gfnma_nvl(item.DEPRECIATION_METHOD),
						DEPRECIATION_NAME			: gfnma_nvl(item.DEPRECIATION_NAME),
						FOCUS						: gfnma_nvl(item.FOCUS),
						SALVAGE_RATE				: gfnma_nvl(item.SALVAGE_RATE),
						USEFUL_LIFE_CNT				: gfnma_nvl(item.USEFUL_LIFE_CNT),
  					}
  					jsonFia1200Mast.push(msg);
  					totalRecordCount ++;
  				});

        		Fia1200GridMast.rebuild();
        		
        		if(jsonFia1200Mast.length>0){
        			Fia1200GridMast.setRow(1);
        			Fia1200GridMast.moveScrollTop(1);
        			fn_viewFia1200GridMastEvent();
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
     * 건별조회
     */
    const fn_setFia1200Detail = async function(wtype, obj) {
		
		let p_depreciation_method	= gfnma_nvl(obj['DEPRECIATION_METHOD']);
		let p_salvage_rage			= gfnma_nvl(obj['SALVAGE_RATE']);
		let p_useful_life_cnt		= '0';
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
			,V_P_DEPRECIATION_METHOD	: p_depreciation_method
			,IV_P_SALVAGE_RATE			: p_salvage_rage
			,V_P_USEFUL_LIFE_CNT		: p_useful_life_cnt
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
        const postJsonPromise = gfn_postJSON("/fi/ffa/com/selectFia1200List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '3',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {
  				
  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFia1200Detail.length = 0;
  	        	data.cv_2.forEach((item, index) => {
  					const msg = {
  						DEPRECIATION_RATE1000	: gfnma_nvl(item.DEPRECIATION_RATE1000),
  						SALVAGE_RATE			: gfnma_nvl(item.SALVAGE_RATE),
  						USEFUL_LIFE_SEQ			: gfnma_nvl(item.USEFUL_LIFE_SEQ),
  					}
  					jsonFia1200Detail.push(msg);
  					totalRecordCount ++;
  				});

        		Fia1200GridDetail.rebuild();
  	          
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
     * 건별조회
     */
    const fn_setFia1200Apply = async function(wtype, obj) {
		
		let p_depreciation_method2	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_METHOD2"));
		let p_salvage_rage			= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_RATE"));
		let p_useful_life_cnt		= gfnma_nvl(SBUxMethod.get("FM_USEFUL_LIFE_CNT"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
			,V_P_DEPRECIATION_METHOD	: p_depreciation_method2
			,IV_P_SALVAGE_RATE			: p_salvage_rage
			,V_P_USEFUL_LIFE_CNT		: p_useful_life_cnt
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
        const postJsonPromise = gfn_postJSON("/fi/ffa/com/selectFia1200List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '3',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {
  				
  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFia1200Detail.length = 0;
  	        	data.cv_3.forEach((item, index) => {
  					const msg = {
  						DEPRECIATION_RATE1000	: gfnma_nvl(item.DEPRECIATION_RATE1000),
  						SALVAGE_RATE			: gfnma_nvl(item.SALVAGE_RATE),
  						USEFUL_LIFE_SEQ			: gfnma_nvl(item.USEFUL_LIFE_SEQ),
  					}
  					jsonFia1200Detail.push(msg);
  					totalRecordCount ++;
  				});

        		Fia1200GridDetail.rebuild();
  	          
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
     * 삭제처리
     */
    const fn_deleteFia1200 = async function(wtype, obj) {
		
		let p_depreciation_method2	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_METHOD2"));
		let p_salvage_rage			= gfnma_nvl(SBUxMethod.get("FM_USEFUL_LIFE_CNT"));
		let p_useful_life_cnt		= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_RATE"));
		
    	if(p_depreciation_method2){
			if(gfn_comConfirm("Q0001", "감가상각률 정보를 삭제")){
			} else {
				return;
			}       	
    	}
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN			: ''
			,V_P_LANG_ID				: ''
			,V_P_COMP_CODE				: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
			
			,V_P_DEPRECIATION_METHOD	: gfnma_nvl(p_depreciation_method2)
	 		,V_P_USEFUL_LIFE_SEQ		: gfnma_nvl(p_useful_life_cnt)
	 		,V_P_SALVAGE_RATE			: gfnma_nvl(p_salvage_rate)
	 		,V_P_DEPRECIATION_RATE1000	: gfnma_nvl(obj['DEPRECIATION_RATE1000'])
	 		,V_P_USEFUL_LIFE_CNT		: gfnma_nvl(obj['USEFUL_LIFE_SEQ'])	  	 				
			
			,V_P_FORM_ID			: p_formId
			,V_P_MENU_ID			: p_menuId
			,V_P_PROC_ID			: ''
			,V_P_USERID				: p_userId
			,V_P_PC					: '' 
	    };		
        const postJsonPromise = gfn_postJSON("/fi/ffa/com/selectFia1200List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '3',
        	params				: gfnma_objectToString(paramObj)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
        try {
  			if (_.isEqual("S", data.resultStatus)) {
  				
  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFia1200Detail.length = 0;
  	        	data.cv_2.forEach((item, index) => {
  					const msg = {
  						DEPRECIATION_RATE1000	: gfnma_nvl(item.DEPRECIATION_RATE1000),
  						SALVAGE_RATE			: gfnma_nvl(item.SALVAGE_RATE),
  						USEFUL_LIFE_SEQ			: gfnma_nvl(item.USEFUL_LIFE_SEQ),
  					}
  					jsonFia1200Detail.push(msg);
  					totalRecordCount ++;
  				});

        		Fia1200GridDetail.rebuild();
  	          
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
     * 신규
     */
 	function cfn_add() {
		fn_state('N');
    }
    
    /**
     * 저장
     */
    function cfn_save() {
    	
    	fn_saveFia1200('N', function(){
    		cfn_search('L');
    	});
    }
    
    /**
     * 저장 처리
     */
    const fn_saveFia1200 = async function(status, callbackFn) {
		
		let p_depreciation_method2	= gfnma_nvl(SBUxMethod.get("FM_DEPRECIATION_METHOD2"));
		let p_useful_life_cnt		= gfnma_nvl(SBUxMethod.get("FM_USEFUL_LIFE_CNT"));
		let p_salvage_rate			= gfnma_nvl(SBUxMethod.get("FM_SALVAGE_RATE"));
		
    	if(status=='N' || status=='U'){
    		if(Number(p_useful_life_cnt) != jsonFia1200Detail.length){
	    		gfn_comAlert("E0000","표준값 적용하기 버튼을 클릭하지 않았습니다. 버튼을 클릭한 후 저장해 주시기 바랍니다.");
	    		return;
    		}
	    	if(!p_depreciation_method2){
	    		gfn_comAlert("E0000","감가상각방법을 선택하세요");
	    		return;
	    	}
	    	if(!p_useful_life_cnt){
	    		gfn_comAlert("E0000","생성주기를 등록하세요");
	    		return;
	    	}
    	}
		
    	if(status=='N'){
			if(gfn_comConfirm("Q0001", "신규 등록")){
			} else {
				return;
			}      	
    	} else if(status=='U') {
			if(gfn_comConfirm("Q0001", "수정")){
			} else {
				return;
			}       	
    	} else {
			if(gfn_comConfirm("Q0001", p_useful_life_cnt + "을 삭제")){
			} else {
				return;
			}       	
    	}
    	
	   	 var chkList = Fia1200GridDetail.getOrgGridDataAll(true);
	  	 //서버 전송 리스트
	  	 let listData 	= [];
	  	 let workt		= ""; 
	  	 for (var i = 0; i < chkList.length; i++) {
			var obj = chkList[i];
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
	  	 				
	  	 				V_P_DEPRECIATION_METHOD		: gfnma_nvl(p_depreciation_method2),
	  	 				V_P_USEFUL_LIFE_SEQ			: gfnma_nvl(p_useful_life_cnt),
	  	 				V_P_SALVAGE_RATE			: gfnma_nvl(p_salvage_rate),
	  	 				V_P_DEPRECIATION_RATE1000	: gfnma_nvl(obj['DEPRECIATION_RATE1000']),
	  	 				V_P_USEFUL_LIFE_CNT			: gfnma_nvl(obj['USEFUL_LIFE_SEQ']),	  	 				
	  	 				
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
     	 	const postJsonPromise = gfn_postJSON("/fi/ffa/com/saveFia1200List.do", {listData: listData});

     	 	const data = await postJsonPromise;
     	 	console.log('data:', data);
     	 	try {
     	 		if (_.isEqual("S", data.resultStatus)) {
     	 			gfn_comAlert("I0001", "");
     	 		} else {
     	 			alert(data.resultMessage);
     	 		}
				if(callbackFn){
					callbackFn();
				}
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
     * 삭제 
     */
    function cfn_del() {

    	let nRow = Fia1200GridDetail.getRow();
    	let nCol = Fia1200GridDetail.getCol();
		if (nRow < 1) {
            return;
		}
        let rowData = Fia1200GridDetail.getRowData(nRow);
        p_sel_rowData = rowData;
        console.log('rowData:', rowData);
    	
		var p_strStatus = 'D';
		fn_deleteFia1200(p_strStatus, rowData, function(){
     		fn_state('L');
    		cfn_search();
    	});
    }
    
    /**
     * 표준값 적용하기 
     */
    function fn_standardApply() {
    	
    	let nRow = Fia1200GridMast.getRow();
    	let nCol = Fia1200GridMast.getCol();
		if (nRow < 1) {
            return;
		}
        let rowData = Fia1200GridMast.getRowData(nRow);
        p_sel_rowData = rowData;
        console.log('rowData:', rowData);
    	
        //detail
        fn_setFia1200Apply('APPLY', rowData);
    }    
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>