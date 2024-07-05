<%
/**
 * @Class Name 		: com2100.jsp
 * @Description 	: 회기 정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.06.27
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.06.27   	천용진		최초 생성
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
	<title>title : 회기 정보</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;">
                <div>
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                    </h3>
                </div>
                <div style="margin-left: auto;">
                </div>
            </div>
            <div class="box-body">

                <!--[pp] 검색 -->
				<!--[APC] START -->
					<%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
				<!--[APC] END -->
                <table class="table table-bordered tbl_fixed">
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
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="th_bg">법인</th>
                            <td class="td_input" style="border-right: hidden;">
								<div class="dropdown">
								    <button 
								    	style="width:160px;text-align:left" 
								    	class="btn btn-sm btn-light dropdown-toggle" 
								    	uitype="normal"
								    	id="SRCH_COMP_CODE" 
								    	data-toggle="dropdown" 
								    	aria-haspopup="true" 
								    	aria-expanded="false">
								    	<font>선택</font>
								        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
								    </button>
								    <div class="dropdown-menu" aria-labelledby=SRCH_COMP_CODE style="width:200px;height:200px;padding-top:0px;overflow:auto">
								    </div>
								</div>                                
                            </td>                
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>                                          
                            <th scope="row" class="th_bg">회기</th>
                            <td class="td_input" style="border-right: hidden;">
								<div class="dropdown">
								    <button 
								    	style="width:160px;text-align:left" 
								    	class="btn btn-sm btn-light dropdown-toggle" 
								    	uitype="normal"
								    	id="SRCH_FISCAL_NO" 
								    	data-toggle="dropdown" 
								    	aria-haspopup="true" 
								    	aria-expanded="false">
								    	<font>선택</font>
								        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>        
								    </button>
								    <div class="dropdown-menu" aria-labelledby=SRCH_FISCAL_NO style="width:500px;height:200px;padding-top:0px;overflow:auto">
								    </div>
								</div>                                
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="row">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>코드목록</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                            <sbux-button
                                    id="btnDel"
                                    name="btnDel"
                                    uitype="normal"
                                    text="행삭제"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_delRow"
                                    style="float: right;"
                            >
                            </sbux-button>
                            <sbux-button
                                    id="btnAdd"
                                    name="btnAdd"
                                    uitype="normal"
                                    text="행추가"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_addRow"
                                    style="float: right;"
                            ></sbux-button>
                        </div>                        
                        <div>
                            <div id="sb-area-grdCom2100" style="height:616px; width:100%;"></div>
                        </div>
                </div>
            </div>
        </div>
    </section>
    
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="com-popup1" name="com-popup1" uitype="middle" header-title="" body-html-id="body-com-popup1" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-com-popup1">
    	<jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
    </div>
    
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

	// ${comMenuVO.menuId}
	
	// common ---------------------------------------------------
	var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
	var p_menuId 	= '${comMenuVO.menuId}';
	var p_userId 	= '${loginVO.id}';
	//-----------------------------------------------------------
	var jsonFiscalStatus	= [];	// 회기진행상태
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			
			gfnma_setComSelect(['masterGrid','FISCAL_STATUS'], jsonFiscalStatus, 'L_FIM021', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//법인
			gfnma_multiSelectInit({
				target			: ['#SRCH_COMP_CODE']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_ORG000'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'COMP_CODE'
				,colLabel		: 'COMP_NAME'
				,columns		:[
		            {caption: "법인코드",		ref: 'COMP_CODE', 		width:'100px',  	style:'text-align:left'},
		            {caption: "법인명", 		ref: 'COMP_NAME',    	width:'100px',  	style:'text-align:left'},
				]
			}),
			//회기
			gfnma_multiSelectInit({
				target			: ['#SRCH_FISCAL_NO']
				,compCode		: gv_ma_selectedApcCd
				,clientCode		: gv_ma_selectedClntCd
				,bizcompId		: 'L_FIG007'
				,whereClause	: ''
				,formId			: p_formId
				,menuId			: p_menuId
				,selectValue	: ''
				,dropType		: 'down' 	// up, down
				,dropAlign		: 'left' 	// left, right
				,colValue		: 'FISCAL_NO'
				,colLabel		: 'FISCAL_PERIOD'
				,columns		:[
		            {caption: "회기",		ref: 'FISCAL_NO', 			width:'100px',  	style:'text-align:left'},
		            {caption: "회기기간", 	ref: 'FISCAL_PERIOD',    	width:'300px',  	style:'text-align:left'},
		            {caption: "종료년월", 	ref: 'YYYYMM_TO',    		width:'100px',  	style:'text-align:left'}
				]
			}),

		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

    	fn_initSBSelect();
    	fn_createGrid();
    	cfn_search();
    });
    
	// 신규
	function cfn_add() {
		fn_clearForm();
	}
	
	// 그룹코드 내역, 세부코드 정보 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
	        fn_save();
		}
    }
	
	
	// 마스터 그리드 삭제
	function cfn_del() {
		fn_delete();
	}
 
	// 조회
	function cfn_search() {
		fn_search();
		fn_clearForm();
		fn_createGrid();
	}

    //grid 초기화
    var masterGrid; 			// 그리드를 담기위한 객체 선언
    var jsonMasterList 	= []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdCom2100';
	    SBGridProperties.id 				= 'masterGrid';
	    SBGridProperties.jsonref 			= 'jsonMasterList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [ 
            {caption: ["회기"],			ref: 'FISCAL_NO', 		type:'input',  	width:'100px',  	style:'text-align:right'},
            {caption : ['시작일'],       ref: 'START_DATE',      type:'datepicker' ,   typeinfo : {dateformat :"yy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'},
            {caption : ['종료일'],       ref: 'END_DATE',        type:'datepicker' ,   typeinfo : {dateformat :"yy-mm-dd", displayui:true},      width : '100px', style : 'text-align:center'},
            {caption: ["회기진행상태"],	ref: 'FISCAL_STATUS', 	type:'combo',  	width:'100px',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonFiscalStatus',
					label		: 'label',
					value		: 'value',
					displayui :true, 
					oneclickedit: true
            	}
            },
            {caption: ["적요"],			ref: 'DESCR',    		type:'input',  	width:'350px',  	style:'text-align:left'}
        ];
        masterGrid	= _SBGrid.create(SBGridProperties);
    }
    const fn_save = async function() {
		 //세부코드 정보  저장
		 let rowLength	= masterGrid.getUpdateData(true, 'all').length;
		 let rowVal 	= masterGrid.getUpdateData(true, 'all');
		 if(rowLength >= 1 ){
	    		for(var i = 0; rowLength > i; i ++){
	    			var workType = rowVal[i].status == 'i' ? 'N' : (rowVal[i].status == 'u' ? 'U' : 'D');
	    			var paramObj = {
	    					 V_P_DEBUG_MODE_YN     : ''
	    						,V_P_LANG_ID           : ''
	    						,V_P_COMP_CODE         : gv_ma_selectedApcCd
	    						,V_P_CLIENT_CODE       : gv_ma_selectedClntCd
	    						,V_P_FISCAL_NO         : gfnma_nvl(rowVal[i].data.FISCAL_NO)
	    						,V_P_START_DATE        : gfnma_nvl(rowVal[i].data.START_DATE)
	    						,V_P_END_DATE          : gfnma_nvl(rowVal[i].data.END_DATE)
	    						,V_P_FISCAL_STATUS     : gfnma_nvl(rowVal[i].data.FISCAL_STATUS)
	    						,V_P_DESCR             : gfnma_nvl(rowVal[i].data.DESCR)
	    						,V_P_DESCR_CHN         : ''
	    						,V_P_FORM_ID           : p_formId
	    						,V_P_MENU_ID           : p_menuId
	    						,V_P_PROC_ID           : ''
	    						,V_P_USERID            : p_userId
	    						,V_P_PC                : ''
	    		    };		
	    			
	    	        const postJsonPromise = gfn_postJSON("/co/sys/cal/deleteCom2100.do", {
	    	        	getType				: 'json',
	    	        	workType			: workType,
	    	        	cv_count			: '0',
	    	        	params				: gfnma_objectToString(paramObj)
	    			});    	 
	    	        const subdata = await postJsonPromise;

	    	        try {
	    	        	if (_.isEqual("S", subdata.resultStatus)) {
	    	        		if(subdata.resultMessage){
	    		          		alert(subdata.resultMessage);
	    	        		}
	    	        		cfn_search();
	    	        	} else {
	    	          		alert(subdata.resultMessage);
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
    	
    }
    /**
     * 코드목록 조회
     */
    const fn_search = async function() {

    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	
    	let SRCH_FISCAL_NO = gfnma_multiSelectGet('#SRCH_FISCAL_NO');
    	
    	var paramObj = {
  	   			V_P_DEBUG_MODE_YN     : ''
  				,V_P_LANG_ID           : ''
  				,V_P_COMP_CODE         : gv_ma_selectedApcCd
  				,V_P_CLIENT_CODE       : gv_ma_selectedClntCd
  				,V_P_FISCAL_NO         : SRCH_FISCAL_NO
  				,V_P_FORM_ID           : p_formId
  				,V_P_MENU_ID           : p_menuId
  				,V_P_PROC_ID           : ''
  				,V_P_USERID            : p_userId
  				,V_P_PC                : ''
  	   		   
  	   		   
  		    };		
    	        const postJsonPromise = gfn_postJSON("/co/sys/cal/selectCom2100.do", {
    	        	getType				: 'json',
    	        	workType			: 'Q',
    	        	cv_count			: '2',
    	        	params				: gfnma_objectToString(paramObj)
    			});

    	        const data = await postJsonPromise;
    	        try {
    	  			if (_.isEqual("S", data.resultStatus)) {

    	  	        	/** @type {number} **/
    	  	    		let totalRecordCount = 0;

    	  	    		masterGrid.length = 0;
    	  	        	data.cv_1.forEach((item, index) => {
    	  					const msg = {
    	  							FISCAL_NO		: item.FISCAL_NO,
    	  							START_DATE		: item.START_DATE,
    	  							END_DATE		: item.END_DATE,
    	  							FISCAL_STATUS	: item.FISCAL_STATUS,
    	  							DESCR			: item.DESCR,
    	  							DESCR_CHN		: item.DESCR_CHN
    	  					}
    	  					jsonMasterList.push(msg);
    	  					totalRecordCount ++;
    	  				});

    	  	        	masterGrid.rebuild();
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
    const fn_clearForm = function() {
    	//코드목록
    	jsonMasterList = [];
    }
     // 행 추가
     const fn_addRow = function () {
         const rowVal = masterGrid.getGridDataAll();
         
		if(rowVal[rowVal.length - 1].FISCAL_NO != ''){
	    	let fiscalNo 			= rowVal[rowVal.length - 1].FISCAL_NO+1;
	    	let startDate 		= rowVal[rowVal.length - 1].START_DATE;
	    	let endDate 			= rowVal[rowVal.length - 1].END_DATE;
	    	let fiscalStatus 		= rowVal[rowVal.length - 1].FISCAL_STATUS;
			startDate = (Number(startDate.slice(0, 4)) + 1) + '0101';
			endDate	= (Number(endDate.slice(0, 4)) + 1) + '1231';
			
			masterGrid.addRows([{
				FISCAL_NO				: fiscalNo, 
				START_DATE				: startDate, 
				END_DATE				: endDate,
				FISCAL_STATUS			: fiscalStatus, 
				DESCR					: ''
			}]);	
		}else{
			masterGrid.addRow(true);
		}

    	
     }

     // 행 삭제
     const fn_delRow = async function () {

         let rowVal = masterGrid.getRow();

         if (rowVal == -1) {
             gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
             return;
         } else {
             masterGrid.deleteRow(rowVal);
         }
     }
     
    //그룹코드 내역 보기
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>