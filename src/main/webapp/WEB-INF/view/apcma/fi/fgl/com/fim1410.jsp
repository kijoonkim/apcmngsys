<%
/**
 * @Class Name 		: fim1410.jsp
 * @Description 	: 부서별계정 화면
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.15
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.15   	장성주		최초 생성
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
	<title>title : 부서별계정</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
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
                    </h3><!-- 부서별계정 -->
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
            <div class="box-body">

				<div class="box-search-ma" >
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
	                            <th scope="row" class="th_bg_search">부서코드</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="srch-txtdept-code1" class="form-control input-sm" ></sbux-input>
	                            </td>
	                        	<td></td>
	                            
	                            <th scope="row" class="th_bg_search">계정코드</th>
	                            <td colspan="3" class="td_input" >
	   								<sbux-input uitype="text" id="srch-txtsite-name1" class="form-control input-sm" ></sbux-input>
	                            </td>
	                        	<td colspan="11"></td>
	                            
	                        </tr>    
	                    </tbody>
	                </table>				
				</div>
                
                <div class="row">
                
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>부서별 계정과목</span>
	                            <span style="font-size:12px">(조회건수 <span id="listCount1">0</span>건)</span>
	                        </li>
	                    </ul>
	                    <div style="display:flex;vertical-align:middle;float:right;padding-top:10px;margin-right:auto">
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
	                    <div id="sb-area-grdTop" style="height:590px; width:100%;">
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
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
		
    	fn_initSBSelect();
    	fn_createGrid();	
    	cfn_search();
    	
		$('#btn1-row-add').click(function(e){
			e.preventDefault();
			fn_gridRowAdd();
		});
		$('#btn1-row-del').click(function(e){
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
    var Fim1410Grid; 			// 그리드를 담기위한 객체 선언
    var jsonFim1410 = []; 		// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdTop';
	    SBGridProperties.id 				= 'Fim1410Grid';
	    SBGridProperties.jsonref 			= 'jsonFim1410';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.allowcopy 			= true; //복사	    
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '40'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["법인코드"],					ref: 'COMP_CODE', 				type:'input',  		width:'200px',  	style:'text-align:left'},
            {caption: ["부서코드"], 				ref: 'DEPT_CODE',    			type:'input',  		width:'150px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn2',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup1(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["부서명"], 					ref: 'DEPT_NAME', 				type:'input',		width:'200px',  	style:'text-align:left'},
            {caption: ["계정코드"],    				ref: 'ACCOUNT_CODE', 			type:'input',  		width:'100px',  	style:'text-align:left'},
            {caption: [''], 						ref: 'btn1',    				type:'button',  	width:'40px',  		style:'text-align:center', 
            	renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
	        		return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_gridPopup2(event, " + nRow + ", " + nCol + ")'>…</button>";
            	}	
            },
            {caption: ["계정명"],					ref: 'ACCOUNT_NAME',			type:'input',  		width:'300px', 		style:'text-align:left'},
            {caption: ["정렬순서"],					ref: 'SORT_SEQ',				type:'input',  		width:'80px', 		style:'text-align:left'},
            {caption: [""],							ref: 'ETC',						type:'output',  	width:'80px', 		style:'text-align:left'},
        ];

        Fim1410Grid = _SBGrid.create(SBGridProperties);
        Fim1410Grid.bind('click', 'fn_viewGrid');
    }
    
    /**
     * 그리드내 팝업(부서코드) 조회
     */
	function fn_gridPopup1(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Fim1410Grid.getCellData(row, 2) 
        let cellData2 = Fim1410Grid.getCellData(row, 4) 
    	fn_compopup1(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(부서코드) 오픈
     */
    var fn_compopup1 = function(row, col, cellData1, cellData2) {
    	
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
   			,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
   			,searchInputValues		: [searchText1, 	searchText2,	searchText3]
			,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우
    		,width					: '700px'
    		,height					: '300px'
   			,tableHeader			: ["부서코드", 		"부서명"]
   			,tableColumnNames		: ["DEPT_CODE", 	"DEPT_NAME"]
   			,tableColumnWidths		: ["150px", 		"250px"]
			,itemSelectEvent		: function (data){
				console.log('callback data:', data);
				Fim1410Grid.setCellData(row, 2, 	data['DEPT_CODE'], true, true);
				Fim1410Grid.setCellData(row, 4, 	data['DEPT_NAME'], true, true);
			},
    	});
		SBUxMethod.openModal('modal-compopup1');

    }  
    
    /**
     * 그리드내 팝업(계정코드) 조회
     */
	function fn_gridPopup2(event, row, col) {
    	//console.log('grid popup row:', row);
    	//console.log('grid popup col:', col);
		event.stopPropagation();	
        let cellData1 = Fim1410Grid.getCellData(row, 5) 
        let cellData2 = Fim1410Grid.getCellData(row, 7) 
    	fn_compopup2(row, col, cellData1, cellData2);
	}
    
    /**
     * 그리드내 공통팝업(계정코드) 오픈
     */
    var fn_compopup2 = function(row, col, cellData1, cellData2) {
    	
        var replaceText0 	= "_ACCOUNT_CODE_";
        var replaceText1 	= "_ACCOUNT_NAME_"; 
        var strWhereClause 	= "AND ACCOUNT_CODE LIKE '%" + replaceText0 + "%' AND ACCOUNT_NAME LIKE '%" + replaceText1 + "%' ";
    	
    	SBUxMethod.attr('modal-compopup1', 'header-title', '계정 과목');
    	compopup1({
    		compCode				: gv_ma_selectedCorpCd
    		,clientCode				: gv_ma_selectedClntCd
    		,bizcompId				: 'L_ACCT_DOC_IN'
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
				Fim1410Grid.setCellData(row, 5, data['ACCOUNT_CODE'], true, true);
				Fim1410Grid.setCellData(row, 7, data['ACCOUNT_NAME'], true, true);
			}
    	});
		SBUxMethod.openModal('modal-compopup1');
    }  
    
    //상세정보 보기
    function fn_viewGrid() {
    	
    	editType = "E";    	

        var nRow = Fim1410Grid.getRow();
		if (nRow < 1) {
            return;
		}

        let rowData = Fim1410Grid.getRowData(nRow);
		//console.log(rowData);        
    }
    
    /**
     * 목록 조회
     */
	function cfn_search() {
		fn_setFim1410Grid('LIST');
	}
    
    /**
     * 목록 가져오기
     */
    const fn_setFim1410Grid = async function(wtype) {

		Fim1410Grid.clearStatus();

		let p_txtdept_code1		= gfnma_nvl(SBUxMethod.get("srch-txtdept-code1"));
		let p_txtsite_name1		= gfnma_nvl(SBUxMethod.get("srch-txtsite-name1"));
		
	    var paramObj = { 
			V_P_DEBUG_MODE_YN	: ''
			,V_P_LANG_ID		: ''
			,V_P_COMP_CODE		: gv_ma_selectedCorpCd
			,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
			
		   	,V_P_DEPT_CODE     	: p_txtdept_code1	
		   	,V_P_ACCOUNT_CODE   : p_txtsite_name1	 
		   	
			,V_P_FORM_ID		: p_formId
			,V_P_MENU_ID		: p_menuId
			,V_P_PROC_ID		: ''
			,V_P_USERID			: ''
			,V_P_PC				: '' 
	    };		

        const postJsonPromise = gfn_postJSON("/fi/fgl/com/selectFim1410List.do", {
        	getType				: 'json',
        	workType			: wtype,
        	cv_count			: '1',
        	params				: gfnma_objectToString(paramObj, true)
		});

        const data = await postJsonPromise;
		console.log('data:', data);
		
		try {
  			if (_.isEqual("S", data.resultStatus)) {

  	        	/** @type {number} **/
  	    		let totalRecordCount = 0;

  	        	jsonFim1410.length = 0;
  	        	data.cv_1.forEach((item, index) => {
  					const msg = {
  						CHK_YN					: gfnma_nvl(item.CHK_YN),			
  						DEPT_CODE				: gfnma_nvl(item.DEPT_CODE),			
  						DEPT_NAME				: gfnma_nvl(item.DEPT_NAME),			
  						ACCOUNT_CODE			: gfnma_nvl(item.ACCOUNT_CODE),
  						ACCOUNT_NAME			: gfnma_nvl(item.ACCOUNT_NAME),
  						SORT_SEQ				: gfnma_nvl(item.SORT_SEQ),
  						COMP_CODE				: gfnma_nvl(item.COMP_CODE),
  						INSERT_USERID			: gfnma_nvl(item.INSERT_USERID),
  						INSERT_TIME				: gfnma_nvl(item.INSERT_TIME),
  						UPDATE_USERID			: gfnma_nvl(item.UPDATE_USERID),
  						UPDATE_TIME				: gfnma_nvl(item.UPDATE_TIME),
  					}
  					jsonFim1410.push(msg);
  					totalRecordCount ++;
  				});

        		Fim1410Grid.rebuild();
  	        	document.querySelector('#listCount1').innerText = totalRecordCount;
  	        	
  	        	//deatil grid 첫번째 행 선택
				if(jsonFim1410.length>0){
					Fim1410Grid.setRow(1);
					Fim1410Grid.moveScrollTop(1);
					fn_viewGrid();					
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
     * 행추가
     */
    var fn_gridRowAdd = function() {
        var idx = Fim1410Grid.getRow();
        if(idx==-1){
        	idx = 0;
        }
		Fim1410Grid.insertRow(idx, 'below');
		//USE_YN
		Fim1410Grid.setCellData((idx+1), 19, 'Y', true, true);
		//detail 초기화
    	jsonFim1410Detail = [];
      	Fim1410GridDetail.rebuild();
      	$('#listCount2').text('0');
    }
    
    /**
     * 행삭제
     */
    var fn_gridRowDel = function() {
    	Fim1410Grid.deleteRow(Fim1410Grid.getRow());
		//detail 초기화
    	jsonFim1410Detail = [];
      	Fim1410GridDetail.rebuild();
    }
    
    /**
     * 저장
     */
    function cfn_save() {

     	var chkList = Fim1410Grid.getUpdateData(true)
     	if(chkList.length==0){
            gfn_comAlert("E0000", "저장할 데이터가 없습니다.");
     		return;
     	}

		// 신규 등록
		if(gfn_comConfirm("Q0001", "저장")){
			fn_subInsert();
		} 
    }    
        
    /**
     * 저장
     */
    const fn_subInsert = async function (){

   	 var chkList = Fim1410Grid.getUpdateData(true)
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
	 				
	 				V_P_DEPT_CODE				: gfnma_nvl(obj.DEPT_CODE),
	 				V_P_ACCOUNT_CODE			: gfnma_nvl(obj.ACCOUNT_CODE),
	 				V_P_SORT_SEQ				: gfnma_nvl(obj.SORT_SEQ),
	 				
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
	 	const postJsonPromise = gfn_postJSON("/fi/fgl/com/saveFim1410.do", {listData: listData});

	 	const data = await postJsonPromise;
	 	console.log('data:', data);
	 	try {
	 		if (_.isEqual("S", data.resultStatus)) {
	 			gfn_comAlert("I0001");
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
    }    
    
        
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>