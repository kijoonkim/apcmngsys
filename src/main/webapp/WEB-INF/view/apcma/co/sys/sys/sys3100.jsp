<%
    /**
     * @Class Name        : sys3100.jsp
     * @Description       : 소수점 설정 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.05.14
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.05.14   	표주완		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 소수점 설정 정보</title>
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
                </h3><!-- 국가정보 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="신규"
                             class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"
                             onclick="fn_save"></sbux-button>
                <!--
                <sbux-button id="btnDelete" name="btnDelete" 	uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
                 -->
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회"
                             class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
            </div>
        </div>

        <!--[pp] 검색 -->
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

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 6%">
                <col style="width: 3%">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row" class="th_bg">소수유형ID</th>
                <td colspan="" class="td_input" style="border-right:hidden;">
                    <sbux-input id="search_decimal_id" uitype="text" style="width:200px" placeholder=""
                                class="form-control input-sm"></sbux-input>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">소수유형명</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="search_decimal_name" uitype="text" style="width:200px" placeholder=""
                                class="form-control input-sm"></sbux-input>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg" style="display: none"></th>
                <td class="td_input" style="border-right: hidden;">
                </td>
            </tr>
            </tbody>
        </table>

        <div class="row">
            <div class="col-sm-6">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>소수점 유형 리스트</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-grdSys3100" style="height:616px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>세부정보</span></li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:20%">
                            <col style="width:30%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">소수유형ID</th>
                            <td colspan="3" class="td_input">
                                <sbux-input id="DECIMAL_ID" class="form-control input-sm" uitype="text" required
                                            style="width:70%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">소수유형명</th>
                            <td colspan="3" class="td_input">
                                <sbux-input id="DECIMAL_NAME" class="form-control input-sm" uitype="text" required
                                            style="width:70%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">소수자리수</th>
                            <td colspan="3" class="td_input">
                                <sbux-input id="DECIMAL_LENGTH" class="form-control input-sm" uitype="text" required
                                            style="width:70%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">비고</th>
                            <td colspan="3" class="td_input">
                                <sbux-input id="DESCR" class="form-control input-sm" uitype="text" required
                                            style="width:70%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">사용여부</th>
                            <td colspan="3" class="td_input">
                                <sbux-checkbox id="USE_YN" name="USE_YN" uitype="normal" true-value="Y"
                                               false-value="N"></sbux-checkbox>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    var editType			= "N"; //신규, 수정 구분 ( N : 신규 , E : 수정 )

    //grid 초기화
    var gvwInfoGrid; 			// 그리드를 담기위한 객체 선언
    var jsonGvwInfoList = []; 	// 그리드의 참조 데이터 주소 선언


    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_init();

    });

    const fn_init = async function () {

        fn_createGrid();
        fn_search();
    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        // form clear
        fn_clearForm();
        gvwInfoGrid.clearStatus();

        let DECIMAL_ID = gfnma_nvl(SBUxMethod.get("search_decimal_id"));
        let DECIMAL_NAME = gfnma_nvl(SBUxMethod.get("search_decimal_name"));

        var paramObj = {
            V_P_WORK_TYPE: 'Q'
            , V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: '1000'
            , V_P_CLIENT_CODE: ''
            , V_P_DECIMAL_ID: DECIMAL_ID
            , V_P_DECIMAL_NAME: DECIMAL_NAME
            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/co/sys/sys/selectSys3100List.do", {
            getType: 'json',
            workType: 'LIST',
            cv_count: '1',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonGvwInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        DECIMAL_ID: item.DECIMAL_ID,
                        DECIMAL_NAME: item.DECIMAL_NAME,
                        DECIMAL_LENGTH: item.DECIMAL_LENGTH,
                        DESCR: item.DESCR,
                        USE_YN: item.USE_YN
                    }
                    jsonGvwInfoList.push(msg);
                    totalRecordCount++;
                });

                gvwInfoGrid.rebuild();
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

    const fn_clearForm = function () {
        SBUxMethod.set("DECIMAL_ID", "");
        SBUxMethod.set("DECIMAL_NAME", "");
        SBUxMethod.set("DECIMAL_LENGTH", "");
        SBUxMethod.set("DESCR", "");
        SBUxMethod.set("USE_YN", "");
    }


    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdSys3100';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonGvwInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        SBGridProperties.explorerbar = 'sortmove';
        /* SBGridProperties.rowheader = 'seq';*/
        /*SBGridProperties.rowheadercaption = {seq: 'No'};*/
        /*SBGridProperties.rowheaderwidth = {seq: '60'};*/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["소수유형ID"], ref: 'DECIMAL_ID', type: 'input', width: '150px', style: 'text-align:left'},
            {caption: ["소수유형명"], ref: 'DECIMAL_NAME', type: 'input', width: '200px', style: 'text-align:left'},
            {caption: ["소수자리수"], ref: 'DECIMAL_LENGTH', type: 'input', width: '150px', style: 'text-align:left'},
            {
                caption: ["사용여부"], ref: 'USE_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {
                    ignoreupdate: true,
                    fixedcellcheckbox: {
                        usemode: true,
                        rowindex: 1,
                        deletecaption: false
                    },
                    checkedvalue: 'Y',
                    uncheckedvalue: 'N'
                }
            }
        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        gvwInfoGrid.bind('click', 'fn_view');
        /* gvwInfoGrid.bind('beforepagechanged', 'fn_pagingComMsgList');*/
    }

    //상세정보 보기
    function fn_view() {

        editType = "E";

        var nCol = gvwInfoGrid.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = gvwInfoGrid.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);

        SBUxMethod.set("DECIMAL_ID",     rowData.DECIMAL_ID);
        SBUxMethod.set("DECIMAL_NAME",   rowData.DECIMAL_NAME);
        SBUxMethod.set("DECIMAL_LENGTH", rowData.DECIMAL_LENGTH);
        SBUxMethod.set("DESCR",          rowData.DESCR);
        SBUxMethod.set("USE_YN",         rowData.USE_YN);
    }

    //신규 작성
    function fn_create() {

        editType = "N";

        SBUxMethod.set("DECIMAL_ID", "");
        SBUxMethod.set("DECIMAL_NAME", "");
        SBUxMethod.set("DECIMAL_LENGTH", "");
        SBUxMethod.set("DESCR", "");
        SBUxMethod.set("USE_YN", "");
    }


    //저장
    const fn_save = async function() {

        let DECIMAL_ID 			= gfnma_nvl(SBUxMethod.get("DECIMAL_ID"));
        let DECIMAL_NAME		= gfnma_nvl(SBUxMethod.get("DECIMAL_NAME"));
        let DECIMAL_LENGTH 		= gfnma_nvl(SBUxMethod.get("DECIMAL_LENGTH"));
        let DESCR		        = gfnma_nvl(SBUxMethod.get("DESCR"));
        let USE_YN	            = gfnma_nvl(SBUxMethod.get("USE_YN"));


        if (!DECIMAL_ID) {
            gfn_comAlert("W0002", "소수유형ID");
            return;
        }
        if (!DECIMAL_NAME) {
            gfn_comAlert("W0002", "소수유형명");
            return;
        }


        if (editType=="N") {
            // 신규 등록
            if(gfn_comConfirm("Q0001", "신규 등록")){
                var obj = {
                    DECIMAL_ID			: DECIMAL_ID
                    ,DECIMAL_NAME		: DECIMAL_NAME
                    ,DECIMAL_LENGTH		: DECIMAL_LENGTH
                    ,DESCR	            : DESCR
                    ,USE_YN 		    : USE_YN
                }
                fn_subInsert(obj);
            }
        } else if(editType=="E") {
            // 수정 저장
            if(gfn_comConfirm("Q0001", "수정 저장")){
                var obj = {
                    DECIMAL_ID			: DECIMAL_ID
                    ,DECIMAL_NAME		: DECIMAL_NAME
                    ,DECIMAL_LENGTH		: DECIMAL_LENGTH
                    ,DESCR	            : DESCR
                    ,USE_YN 		    : USE_YN
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
            V_P_WORK_TYPE        : ''
            ,V_P_DEBUG_MODE_YN   : 'KOR'
            ,V_P_LANG_ID         : ''
            ,V_P_COMP_CODE       : ''
            ,V_P_CLIENT_CODE     : ''
            ,V_P_DECIMAL_ID      : obj.DECIMAL_ID
            ,V_P_DECIMAL_NAME    : obj.DECIMAL_NAME
            ,V_P_DECIMAL_LENGTH  : obj.DECIMAL_LENGTH
            ,V_P_DESCR           : obj.DESCR
            ,V_P_USE_YN          : obj.USE_YN
            ,V_P_FORM_ID         : p_formId
            ,V_P_MENU_ID         : p_menuId
            ,V_P_PROC_ID         : ''
            ,V_P_USERID          : ''
            ,V_P_PC              : ''
        };

        const postJsonPromise = gfn_postJSON("/co/sys/sys/insertSys3100.do", {
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


    /**
     * @param {boolean} isConfirmed
     */
    const fn_subUpdate = async function (obj){

        var paramObj = {
            V_P_WORK_TYPE        : ''
            ,V_P_DEBUG_MODE_YN   : 'KOR'
            ,V_P_LANG_ID         : ''
            ,V_P_COMP_CODE       : ''
            ,V_P_CLIENT_CODE     : ''
            ,V_P_DECIMAL_ID      : obj.DECIMAL_ID
            ,V_P_DECIMAL_NAME    : obj.DECIMAL_NAME
            ,V_P_DECIMAL_LENGTH  : obj.DECIMAL_LENGTH
            ,V_P_DESCR           : obj.DESCR
            ,V_P_USE_YN          : obj.USE_YN
            ,V_P_FORM_ID         : p_formId
            ,V_P_MENU_ID         : p_menuId
            ,V_P_PROC_ID         : ''
            ,V_P_USERID          : ''
            ,V_P_PC              : ''
        };

        const postJsonPromise = gfn_postJSON("/co/sys/sys/updateSys3100.do", {
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


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
