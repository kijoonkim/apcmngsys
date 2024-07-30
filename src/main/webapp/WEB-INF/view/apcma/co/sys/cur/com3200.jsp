<%
/**
 * @Class Name 		: com3200.jsp
 * @Description 	: 통화 정보
 * @author 			: 인텔릭아이앤에스
 * @since 			: 2024.05.13
 * @version 		: 1.0
 * @Modification Information
 * @
 * @ 수정일       	수정자      수정내용
 * @ ----------		----------	---------------------------
 * @ 2024.05.13   	표주완		최초 생성
 * @ 2024.07.09   	천용진		화면 수정
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
	<title>title : 통화 정보</title>
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
                            <th scope="row" class="th_bg">통화</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="SRCH_CURRENCY_CODE" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>    
                           <th scope="row" class="th_bg">통화명</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input id="SRCH_CURRENCY_NAME" uitype="text" style="width:100%" placeholder="" class="form-control input-sm"></sbux-input>
                            </td>                                      
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>    
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
                            <div id="sb-area-grdCom3200" style="height:600px; width:100%;"></div>
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
	var jsonFiscalStatus	= [];	// 통화진행상태
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
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
	}
 
	// 조회
	function cfn_search() {
		fn_search();
	}

    var masterGrid; 			// 그리드를 담기위한 객체 선언
    var jsonMasterList 	= []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
    	//코드목록 
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdCom3200';
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
            {caption: ["통화코드"],			ref: 'CURRENCY_CODE', 		type:'input',  	width:'100px',  style:'text-align:center'},
            {caption: ["통화명"],				ref: 'CURRENCY_NAME', 		type:'input',  	width:'200px',  style:'text-align:left'},
            {caption: ["통화명(한글)"],		ref: 'CURRENCY_NAME_CHN', 	type:'input',  	width:'200px',  style:'text-align:left'},
            {caption: ['사용여부'],     		ref: 'USE_YN',				type:'checkbox',width:'80px', 	typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
            {caption: ['펌뱅킹 여부'],     	ref: 'FBS_YN',				type:'checkbox',width:'80px', 	typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" }, style : 'text-align:center'},
            {caption: ["심볼"],				ref: 'CURR_SYMBOL',    		type:'input',  	width:'100px',  style:'text-align:center'},
            {caption: ['소수점자리'],			ref: 'DECIMAL_LENGTH',      type:'input',   width:'100px',  style:'text-align:right', format : {type:'number', rule:'#,###'}, datatype : 'number'},
            {caption: ['환산기준단위'],		ref: 'EXCHANGE_BASE_SCALE', type:'input',   width:'200px',  style:'text-align:right', format : {type:'number', rule:'#,###.00'}, datatype : 'decimal'},
            {caption: ['정렬순서'],			ref: 'SORT_SEQ',      		type:'input',   width:'100px',  style:'text-align:right', format : {type:'number', rule:'#,###'}, datatype : 'number'},
            {caption: ["비고"],				ref: 'MEMO',    			type:'input',  	width:'250px',  style:'text-align:left'}
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
                	   V_P_DEBUG_MODE_YN         : ''
               		   ,V_P_LANG_ID              : ''
               		   ,V_P_COMP_CODE            : gv_ma_selectedApcCd
               		   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
               		   ,V_P_CURRENCY_CODE        : gfnma_nvl(item.data.CURRENCY_CODE)
               		   ,V_P_CURRENCY_NAME        : gfnma_nvl(item.data.CURRENCY_NAME)
               		   ,V_P_CURRENCY_NAME_CHN    : gfnma_nvl(item.data.CURRENCY_NAME_CHN)
               		   ,V_P_CURR_SYMBOL          : gfnma_nvl(item.data.CURR_SYMBOL)
               		   ,V_P_EXCHANGE_BASE_SCALE  : gfnma_nvl(item.data.EXCHANGE_BASE_SCALE) == "" ? 0 : gfnma_nvl(item.data.EXCHANGE_BASE_SCALE)
               		   ,V_P_SORT_SEQ             : gfnma_nvl(item.data.SORT_SEQ) == "" ? 0 : gfnma_nvl(item.data.SORT_SEQ)
               		   ,V_P_MEMO                 : gfnma_nvl(item.data.MEMO)
               		   ,V_P_USE_YN               : gfnma_nvl(item.data.USE_YN)
               		   ,V_P_FBS_YN               : gfnma_nvl(item.data.FBS_YN)
               		   ,V_P_DECIMAL_LENGTH       : gfnma_nvl(item.data.DECIMAL_LENGTH) == "" ? 0 : gfnma_nvl(item.data.DECIMAL_LENGTH)
               		   ,V_P_FORM_ID              : p_formId
               		   ,V_P_MENU_ID              : p_menuId
               		   ,V_P_PROC_ID              : ''
               		   ,V_P_USERID               : p_userId
               		   ,V_P_PC                   : ''
                })
            }
            listData.push(param);
        });

        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/co/sys/cur/insertCom3200.do", {listData: listData});
            const data = await postJsonPromise;
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
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
    	
    	let SRCH_CURRENCY_CODE = gfnma_nvl(SBUxMethod.get("SRCH_CURRENCY_CODE"));
    	let SRCH_CURRENCY_NAME = gfnma_nvl(SBUxMethod.get("SRCH_CURRENCY_NAME"));
    	
    	var paramObj = {
	    	   V_P_DEBUG_MODE_YN         : ''
	    	   ,V_P_LANG_ID              : ''
	    	   ,V_P_COMP_CODE            : gv_ma_selectedApcCd
	    	   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
	    	   ,V_P_CURRENCY_CODE        : SRCH_CURRENCY_CODE
	    	   ,V_P_CURRENCY_NAME        : SRCH_CURRENCY_NAME
	    	   ,V_P_FORM_ID              : p_formId
	    	   ,V_P_MENU_ID              : p_menuId
	    	   ,V_P_PROC_ID              : ''
	    	   ,V_P_USERID               : p_userId
	    	   ,V_P_PC                   : ''
		};		
    	
        const postJsonPromise = gfn_postJSON("/co/sys/cur/selectCom3200.do", {
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
  							CURRENCY_CODE			: item.CURRENCY_CODE,
  							CURRENCY_NAME			: item.CURRENCY_NAME,
  							CURR_SYMBOL				: item.CURR_SYMBOL,
  							EXCHANGE_BASE_SCALE		: item.EXCHANGE_BASE_SCALE,
  							SORT_SEQ				: item.SORT_SEQ,
  							MEMO					: item.MEMO,
  							USE_YN					: item.USE_YN,
  							FBS_YN					: item.FBS_YN,
  							CURRENCY_NAME_CHN		: item.CURRENCY_NAME_CHN,
  							DECIMAL_LENGTH			: item.DECIMAL_LENGTH
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
	        }
    	}
    }
     
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>