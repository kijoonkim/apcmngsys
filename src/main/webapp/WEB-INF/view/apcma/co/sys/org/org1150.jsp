<%
/**
 * @Class Name 		: org1150.jsp
 * @Description 	: 사업장 정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.07.18
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.07.18   	천용진		화면 수정
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
	<title>title : 사업장 정보</title>
	<%@ include file="../../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
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
	                        	<th scope="row" class="th_bg_search">사업장코드</th>
	                            <td colspan="3" class="td_input" style="border-right: hidden;">
	                                <sbux-input id="SRCH_SITE_CODE" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
	                            </td>
	                            <td></td>
	                            <th scope="row" class="th_bg_search">사업장명</th>
	                            <td colspan="3" class="td_input" style="border-right: hidden;">
	                                <sbux-input id="SRCH_SITE_NAME" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
	                            </td>   
	                            <td></td>                                   
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            <div class="row">
	                <div class="ad_tbl_top">
	                    <ul class="ad_tbl_count">
	                        <li>
	                            <span>◎ 사업장 리스트</span>
	                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
	                        </li>
	                    </ul>
	                </div>  
	                <div>
	                	<div id="sb-area-grdOrg1150" style="width:100%; height:70vh;"></div>
	                </div>                      
            	</div>    
            </div>
        </div>
    </section>
    
	<!-- 사용자 선택 Modal -->
    <div>
        <sbux-modal id="com-popup1" name="com-popup1" uitype="middle" header-title="" body-html-id="body-com-popup1" header-is-close-button="true" footer-is-close-button="false" style="width:1000px"></sbux-modal>
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
	
	let jsonCompCode = []; //그리드 - 법인 	 [ L_ORG000 ]
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			gfnma_setComSelect(['masterGrid','COMP_CODE'], jsonCompCode, 'L_ORG000', "AND COMP_CODE = '" + gv_ma_selectedCorpCd + "'", gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'COMP_CODE', 'COMP_NAME', 'Y', ''),
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
		fn_addRow();
	}
	
	// 그룹코드 내역, 세부코드 정보 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
	        fn_save();
		}
    }
	
	
	// 마스터 그리드 삭제
	function cfn_del() {
		fn_delRow();
	}
 
	// 조회
	function cfn_search() {
		fn_search();
	}
	/**
	 * 초기화
	 */
	function cfn_init() {
		gfnma_uxDataClear('#srchArea1');
	}
    var masterGrid; 			// 그리드를 담기위한 객체 선언
    var jsonMasterList 	= []; 	// 그리드의 참조 데이터 주소 선언
    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdOrg1150';
	    SBGridProperties.id 				= 'masterGrid';
	    SBGridProperties.jsonref 			= 'jsonMasterList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.useinitsorting 	= true;	
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption : ["법인"], ref : 'COMP_CODE', width : '200px', style : 'text-align:center', type: 'combo',
                typeinfo : {
                    ref : 'jsonCompCode',
                    label : 'label',
                    value : 'value'
                }
            },
            {caption: ["사업장코드"],		ref: 'SITE_CODE', 	type:'input',  	width:'200px',  style:'text-align:left'},
            {caption: ["사업장명"],		ref: 'SITE_NAME', 	type:'input',  	width:'200px',  style:'text-align:left'},
            {caption: ["메모"],			ref: 'DESCR',    	type:'input',  	width:'800px',  style:'text-align:left'},
            {caption: ['사용여부'],     	ref: 'USE_YN',		type:'checkbox',width:'100px',
            	typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'
           	},
        ];
        masterGrid	= _SBGrid.create(SBGridProperties);
    }
    
    const fn_save = async function () {
        let updatedData = masterGrid.getUpdateData(true, 'all');
        let listData = [];
        updatedData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                	   V_P_DEBUG_MODE_YN        : ""
               		  ,V_P_LANG_ID              : ""
               		  ,V_P_COMP_CODE            : gfn_nvl(item.data.COMP_CODE)
               		  ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
               		  ,V_P_SITE_CODE            : gfn_nvl(item.data.SITE_CODE)
               		  ,V_P_SITE_NAME            : gfn_nvl(item.data.SITE_NAME)
               		  ,V_P_SITE_NAME_CHN        : gfn_nvl(item.data.SITE_NAME_CHN)
               		  ,V_P_HR_SITE_CODE         : gfn_nvl(item.data.HR_SITE_CODE)
               		  ,V_P_DESCR                : gfn_nvl(item.data.DESCR)
               		  ,V_P_USE_YN               : gfn_nvl(item.data.USE_YN)
               		  ,V_P_FORM_ID              : p_formId
               		  ,V_P_MENU_ID              : p_menuId
               		  ,V_P_PROC_ID              : ""
               		  ,V_P_USERID               : p_userId
               		  ,V_P_PC                   : ""
                })
            }
            listData.push(param);
        });

        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/co/sys/org/updateOrg1150.do", {listData: listData});
            const data = await postJsonPromise;
            try {
                if (_.isEqual("S", data.resultStatus)) {
                	if(data.resultMessage){
                		alert(data.resultMessage);
                	}else{
	                    gfn_comAlert("I0001");
                	}
                    fn_search();
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
    /**
     * 코드목록 조회
     */
    const fn_search = async function() {

    	// 코드목록 그리드 초기화
    	fn_clearForm();
    	let SRCH_SITE_CODE = gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
    	let SRCH_SITE_NAME = gfn_nvl(SBUxMethod.get("SRCH_SITE_NAME"));
    	
    	var paramObj = {
    			   V_P_DEBUG_MODE_YN        : ""
   				  ,V_P_LANG_ID              : ""
   				  ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
   				  ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
   				  ,V_P_SITE_CODE            : SRCH_SITE_CODE
   				  ,V_P_SITE_NAME            : SRCH_SITE_NAME
   				  ,V_P_FORM_ID              : p_formId
   				  ,V_P_MENU_ID              : p_formId
   				  ,V_P_PROC_ID              : ""
   				  ,V_P_USERID               : p_formId
   				  ,V_P_PC                   : ""
		};		
    	
        const postJsonPromise = gfn_postJSON("/co/sys/org/selectOrg1150.do", {
        	getType				: 'json',
        	workType			: 'LIST',
        	cv_count			: '1',
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
  							SITE_CODE		: item.SITE_CODE,
  							SITE_NAME		: item.SITE_NAME,
  							DESCR			: item.DESCR,
  							COMP_CODE		: item.COMP_CODE,
  							HR_SITE_CODE	: item.HR_SITE_CODE,
  							USE_YN			: item.USE_YN,
  							SITE_NAME_CHN	: item.SITE_NAME_CHN,
  							CLIENT_CODE		: item.CLIENT_CODE
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
        let rowVal = masterGrid.getRow();
        if (rowVal == -1){
        	masterGrid.addRow(true);
        }else{
        	masterGrid.insertRow(rowVal);
        }
    }

     // 행 삭제
    const fn_delRow = async function () {
		if(gfn_comConfirm("Q0001", "행삭제")){ //{0} 하시겠습니까?
	        let rowVal = masterGrid.getRow();
	        if (rowVal == -1) {
	            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
	            return;
	        } else {
	            masterGrid.deleteRow(rowVal);
	            await fn_save();
	        }
    	}
    }
     
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>