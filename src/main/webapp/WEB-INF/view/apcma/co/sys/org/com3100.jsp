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
                            
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td style="border-right: hidden;">&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>코드목록</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                            <div class="ad_tbl_toplist">
	                            <sbux-button id="btnDel" name="btnDel" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delRow" style="float: right;"></sbux-button>
	                            <sbux-button id="btnAdd" name="btnAdd" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
	                            <sbux-button id="btnCopyClear" name="btnCopyClear" uitype="normal" text="복사모드해제" <%--그리드 복사 불가. 붙여넣기 불가.--%> class="btn btn-sm btn-outline-danger" onclick="fn_gridCopyClear" style="float: right; display: block"></sbux-button>
	                            <sbux-button id="btnCopyLine" name="btnCopyLine" uitype="normal" text="행복사모드" <%--행단위로 복사--%> class="btn btn-sm btn-outline-danger" onclick="fn_gridCopyLine" style="float: right; display: none;"></sbux-button>
	                            <sbux-button id="btnCopyCell" name="btnCopyCell" uitype="normal" text="셀복사모드" <%--셀단위로 복사--%> class="btn btn-sm btn-outline-danger" onclick="fn_gridCopyCell" style="float: right; display: none;" ></sbux-button>
                            </div>                            
                        </div>
                        <div>
                            <div id="sb-area-grdCom3100" style="height:580px; width:100%;"></div>
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

	var mode				= 'byrow';
	var jsonRegionCode		= [];	// 지역
	var jsonCurrenvyCode	= [];	// 통화
	var jsonUserYnCode		= [
		{value: 'Y', label: '사용', text: '사용'},
		{value: 'N', label: '불가',	text: '불가'}
	];
	
	const fn_initSBSelect = async function() {
		let rst = await Promise.all([
			//지역
			gfnma_setComSelect(['nationGrid','REGION_CODE'], jsonRegionCode, 'L_COM002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
			//통화
			gfnma_setComSelect(['nationGrid','CURRENCY_CODE'], jsonCurrenvyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),
		]);
	}	

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
    	fn_initSBSelect();
    	fn_createGrid();
    	cfn_search();
    });

    //grid 초기화
    var nationGrid; 			// 그리드를 담기위한 객체 선언
    var jsonNationList = []; 	// 그리드의 참조 데이터 주소 선언
    function fn_createGrid() {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdCom3100';
	    SBGridProperties.id 				= 'nationGrid';
	    SBGridProperties.jsonref 			= 'jsonNationList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
	    SBGridProperties.explorerbar 		= 'sortmove';
	    SBGridProperties.oneclickedit 		= true;
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["국가코드"],			ref: 'NATION_CODE', 			type:'input',  		width:'5%',  	style:'text-align:center'},
            {caption: ["국가약어"], 			ref: 'NATION_CODE_ABBR',    	type:'input',  	width:'5%',  	style:'text-align:center'},
            {caption: ["국가약식명"],  		ref: 'NATION_NAME',    			type:'input',  	width:'15%',  	style:'text-align:center'},
            {caption: ["국가정식명"],      	ref: 'NATION_FULL_NAME', 		type:'input',  	width:'15%',  	style:'text-align:center'},
            {caption: ["국가정식명(한글)"],	ref: 'NATION_FULL_NAME_CHN',	type:'input',  	width:'15%',  	style:'text-align:center'},
            {caption: ["지역"],				ref: 'REGION_CODE', 			type:'combo',  		width:'8%',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonRegionCode',
					label		: 'label',
					value		: 'value',
					oneclickedit: true
            	}
            },
            {caption: ["통화"],			ref: 'CURRENCY_CODE',   		type:'combo',  		width:'8%',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonCurrenvyCode',
					label		: 'label',
					value		: 'value',
					oneclickedit: true
            	}
            },
            {caption: ["정렬순서"], 		ref: 'SORT_SEQ',  			type:'input',  	width:'8%',  	style:'text-align:center'},
            {caption: ["비고"], 			ref: 'MEMO', 				type:'input',  	width:'16%',  	style:'text-align:center'},
            {caption: ['사용여부'],    	ref: 'USE_YN', 				type : 'checkbox' , typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" },  width:'5%',		style:'text-align:center'}
        ];
        nationGrid = _SBGrid.create(SBGridProperties);
    }

	
    /**
     * 초기화
     */
    function cfn_init() {
    	gfnma_uxDataClear('#srchArea1');
    }
    
    
    /**
     * 목록 조회
     */
	function cfn_search() {
		fn_search();
	}
	
    /**
     * 목록 가져오기
     */
    const fn_search = async function() {

    	// form clear
    	fn_clearForm();

		nationGrid.clearStatus();

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

        const postJsonPromise = gfn_postJSON("/co/sys/org/selectCom3100.do", {
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
  	        	nationGrid.rebuild();
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
	

    //신규 작성
    function cfn_add() {
        fn_clearForm();
    }

    const fn_clearForm = function() {
    	jsonNationList = [];
    }

    //저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
			fn_save();
		}
    }

    const fn_save = async function (){
        let nationGridLength 		= nationGrid.getUpdateData(true, 'all').length;
        let nationGridUpdateData 	= nationGrid.getUpdateData(true, 'all');
        if(nationGridLength <= 0){
        	gfn_comAlert('W0003', '저장'); //W0003 {0}할 대상이 없습니다.
        	return;
        }
        let listData = [];
        nationGridUpdateData.forEach((item, index) => {
            const param = {
                cv_count: '0',
                getType: 'json',
                rownum: item.rownum,
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
        			V_P_DEBUG_MODE_YN			: ''
       				,V_P_LANG_ID				: ''
       				,V_P_COMP_CODE				: gv_ma_selectedApcCd
       				,V_P_CLIENT_CODE			: gv_ma_selectedClntCd
       				,V_P_NATION_CODE			: gfn_nvl(item.data.NATION_CODE)
       				,V_P_NATION_NAME			: gfn_nvl(item.data.NATION_NAME)
       				,V_P_NATION_FULL_NAME     	: gfn_nvl(item.data.NATION_FULL_NAME)
       				,V_P_NATION_FULL_NAME_CHN	: gfn_nvl(item.data.NATION_FULL_NAME_CHN)
       				,V_P_NATION_CODE_ABBR		: gfn_nvl(item.data.NATION_CODE_ABBR)
       				,V_P_REGION_CODE			: gfn_nvl(item.data.REGION_CODE)
       				,V_P_CURRENCY_CODE			: gfn_nvl(item.data.CURRENCY_CODE)
       				,V_P_MEMO					: gfn_nvl(item.data.MEMO)
       				,V_P_SORT_SEQ				: gfn_nvl(item.data.SORT_SEQ)
       				,V_P_USE_YN					: gfn_nvl(item.data.USE_YN)
       				,V_P_FORM_ID				: p_formId
       				,V_P_MENU_ID				: p_menuId
       				,V_P_PROC_ID				: ''
       				,V_P_USERID					: ''
       				,V_P_PC						: '' 
                })
            }
            listData.push(param);
        });
        const postJsonPromise = gfn_postJSON("/co/sys/org/insertCom3100.do", {listData: listData});
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
          		gfn_comAlert("I0001")				// I0001	처리 되었습니다.
          		cfn_search();						// 그리드 조회
            } else {
                alert(data.resultMessage);
                return false;
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
    

    // 행 추가
    const fn_addRow = function () {
        let rowVal = nationGrid.getRow();
	   	//데이터가 없고 행선택이 없을경우.
        if (rowVal == -1){ 
        	nationGrid.addRow(true);
        }else{
        	nationGrid.insertRow(rowVal);
        }
    }

    // 행 삭제
    const fn_delRow = async function () {
        let rowVal = nationGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
        	nationGrid.deleteRow(rowVal);
        }
    }
    
    /*셀복사 해제 (복사모드해제)*/
    const fn_gridCopyClear = function (){ 
        $('#btnCopyClear').hide();
        $('#btnCopyLine').show();
        $('#btnCopyCell').hide();

        let data = nationGrid.getGridDataAll();
        jsonNationList = [];
		mode = 'byrow'; //행 단위 단일  선택
        fn_drawNationGrid(mode, data, true);

    }
    
    /*행 복사 (행복사모드)*/
    const fn_gridCopyLine = function () { 
        $('#btnCopyClear').hide();
        $('#btnCopyLine').hide();
        $('#btnCopyCell').show();

        let data = nationGrid.getGridDataAll();
        jsonNationList = [];

		mode = 'byrows'; //행 단위 다중 선택
		fn_drawNationGrid(mode, data, true);

    }
    
    /*셀 복사 (셀복사모드)*/
    const fn_gridCopyCell = function () { 
        $('#btnCopyClear').show();
        $('#btnCopyLine').hide();
        $('#btnCopyCell').hide();
        
        let data = nationGrid.getGridDataAll();
        jsonNationList = [];
	 
        mode = 'free'; //셀 단위 다중 선택
        fn_drawNationGrid(mode, data, true);
    }
    
    function fn_drawNationGrid(mode, data, copymode) {
        var SBGridProperties 				= {};
	    SBGridProperties.parentid 			= 'sb-area-grdCom3100';
	    SBGridProperties.id 				= 'nationGrid';
	    SBGridProperties.jsonref 			= 'jsonNationList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= mode;
        SBGridProperties.allowcopy 			= copymode;
        SBGridProperties.oneclickedit 		= true;
	    SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
		SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
	    SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["국가코드"],			ref: 'NATION_CODE', 			type:'input',  		width:'5%',  	style:'text-align:center'},
            {caption: ["국가약어"], 			ref: 'NATION_CODE_ABBR',    	type:'input',  	width:'5%',  	style:'text-align:center'},
            {caption: ["국가약식명"],  		ref: 'NATION_NAME',    			type:'input',  	width:'15%',  	style:'text-align:center'},
            {caption: ["국가정식명"],      	ref: 'NATION_FULL_NAME', 		type:'input',  	width:'15%',  	style:'text-align:center'},
            {caption: ["국가정식명(한글)"],	ref: 'NATION_FULL_NAME_CHN',	type:'input',  	width:'15%',  	style:'text-align:center'},
            {caption: ["지역"],				ref: 'REGION_CODE', 			type:'combo',  		width:'8%',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonRegionCode',
					label		: 'label',
					value		: 'value',
					oneclickedit: true
            	}
            },
            {caption: ["통화"],			ref: 'CURRENCY_CODE',   		type:'combo',  		width:'8%',  	style:'text-align:center',
            	typeinfo: {
					ref			: 'jsonCurrenvyCode',
					label		: 'label',
					value		: 'value',
					oneclickedit: true
            	}
            },
            {caption: ["정렬순서"], 		ref: 'SORT_SEQ',  			type:'input',  	width:'8%',  	style:'text-align:center'},
            {caption: ["비고"], 			ref: 'MEMO', 				type:'input',  	width:'16%',  	style:'text-align:center'},
            {caption: ['사용여부'],    	ref: 'USE_YN', 				type : 'checkbox' , typeinfo : { checkedvalue : "Y", uncheckedvalue : "N" },  width:'5%',		style:'text-align:center'}
        ];
        jsonNationList = [];
        _SBGrid.destroy('nationGrid');
        nationGrid = _SBGrid.create(SBGridProperties);
        
        data.forEach((item, index) => {
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
		});
		nationGrid.rebuild();
    }
    
    
    
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>