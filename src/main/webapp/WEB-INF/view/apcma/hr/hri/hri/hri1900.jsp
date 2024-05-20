<%
    /**
     * @Class Name 		: hri1900.jsp
     * @Description 	: 부서별 직원명부 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.05.13
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.05.13   	이경한		최초 생성
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
    <title>title : 부서별 직원명부</title>
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
                <sbux-button id="btnSearch" name="btnSearch" 	uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
            </div>
        </div>
        <div class="box-body">

            <!--[pp] 검색 -->
            <table class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                    <col style="width: 12.5%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg"><span class="data_required"></span>법인</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_COMP_CODE" uitype="single" jsondata-ref="jsonCompCode" unselected-text="" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">소속사업장</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg"><span class="data_required"></span>재직구분</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">부서</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">사원</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">직위</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_POSITION_CODE" uitype="single" jsondata-ref="jsonPositionCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div>
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>부서별 직원명부</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gridViewEx1" style="height:616px;"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createGrid();

        fn_search();
    });

    var jsonCompCode		= [];	// 법인
    var jsonSiteCode	= [];	// 사업장
    var jsonEmpState = []; // 재직구분
    var jsonPositionCode = []; // 직위

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 법인
            gfnma_setComSelect(['SRCH_COMP_CODE'], jsonCompCode, 'L_ORG000', '', '', 'COMP_CODE', 'COMP_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SRCH_SITE_CODE'], jsonSiteCode, 'L_ORG001', '', '', 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 재직구분
            gfnma_setComSelect(['SRCH_EMP_STATE'], jsonEmpState, 'L_HRI009', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['SRCH_POSITION_CODE'], jsonPositionCode, 'L_HRI002', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    //grid 초기화
    var gridViewEx1; 			// 그리드를 담기위한 객체 선언
    var jsonEmpList = []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gridViewEx1';
        SBGridProperties.id 				= 'gridViewEx1';
        SBGridProperties.jsonref 			= 'jsonEmpList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.paging = {
            'type' 			: 'page',
            'count' 		: 5,
            'size' 			: 20,
            'sorttype' 		: 'page',
            'showgoalpageui': true
        };
        SBGridProperties.columns = [
            {caption: ["구분"],		ref: 'DEPT_CODE', 		type:'output',  	width:'74px',  	    style:'text-align:left'},
            {caption: ["소속"], 		ref: 'DEPT_NAME',    	type:'output',  	width:'105px',  	style:'text-align:left'},
            {caption: ["직위(년차)"], ref: 'POSITION_NAME',   type:'output',  	width:'69px',   	style:'text-align:left',
                renderer:function(objGrid, nRow, nCol, strValue, objRowData) {
                    return strValue ? strValue.replaceAll('\n', '<br>') : strValue;
                }
            },
            {caption: ["성명"],	    ref: 'EMP_NAME', 		type:'output',  	width:'54px',    	style:'text-align:left'},
            {caption: ["사원사진"],	ref: 'EMP_PHOTO',   	type:'output',  	width:'83px',   	style:'text-align:left'},
            {caption: ["생년월일"],   ref: 'BIRTHDAY', 		type:'output',  	width:'69px',    	style:'text-align:left',
                renderer:function(objGrid, nRow, nCol, strValue, objRowData) {
                    return strValue ? strValue.replaceAll('\n', '<br>') : strValue;
                }
            },
            {caption: ["입사일자"], 	ref: 'ENTER_DATE', 		type:'output',  	width:'60px',    	style:'text-align:left',
                renderer:function(objGrid, nRow, nCol, strValue, objRowData) {
                    return strValue ? strValue.replaceAll('\n', '<br>') : strValue;
                }
            },
            {caption: ["입사년수"],	ref: 'ENTER_YEAR',	    type:'output',  	width:'54px',   	style:'text-align:left'},
            {caption: ["승진일자"], 	ref: 'POSITION_DATE',  	type:'output',  	width:'60px',   	style:'text-align:left',
                renderer:function(objGrid, nRow, nCol, strValue, objRowData) {
                    return strValue ? strValue.replaceAll('\n', '<br>') : strValue;
                }
            },
            {caption: ["계약일자"], 	ref: 'CONTRACT_DATE', 	type:'output',		width:'49px',		style:'text-align:center'},
            {caption: ["학력"], 		ref: 'SCHOOL_MAJOR1', 	type:'output',		width:'90px',		style:'text-align:center',
                renderer:function(objGrid, nRow, nCol, strValue, objRowData) {
                    return strValue ? strValue.replaceAll('\n', '<br>') : strValue;
                }
            },
            {caption: ["졸업"], 		ref: 'SCHOOL_MAJOR2', 	type:'output',		width:'39px',		style:'text-align:center',
                renderer:function(objGrid, nRow, nCol, strValue, objRowData) {
                    return strValue ? strValue.replaceAll('\n', '<br>') : strValue;
                }
            },
            {caption: ["학위"], 		ref: 'SCHOOL_MAJOR3', 	type:'output',		width:'59px',		style:'text-align:center'},
            {caption: ["사내경력"], 	ref: 'INCAREER', 		type:'output',		width:'86px',		style:'text-align:center',
                renderer:function(objGrid, nRow, nCol, strValue, objRowData) {
                    return strValue ? strValue.replaceAll('\n', '<br>') : strValue;
                }
            },
            {caption: ["사외경력"], 	ref: 'OUTCAREER', 		type:'output',		width:'97px',		style:'text-align:center',
                renderer:function(objGrid, nRow, nCol, strValue, objRowData) {
                    return strValue ? strValue.replaceAll('\n', '<br>') : strValue;
                }
            },
            {caption: ["비고"], 		ref: 'BEGO', 			type:'output',		width:'109px',		style:'text-align:center',
                renderer:function(objGrid, nRow, nCol, strValue, objRowData) {
                    return strValue ? strValue.replaceAll('\n', '<br>') : strValue;
                }
            }
        ];

        gridViewEx1 = _SBGrid.create(SBGridProperties);
        gridViewEx1.bind('beforepagechanged', 'fn_pagingHriList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {

        // set pagination
        let pageSize = gridViewEx1.getPageSize();
        let pageNo = 1;

        gridViewEx1.movePaging(pageNo);
    }

    /**
     *
     */
    const fn_pagingHriList = async function() {
        let recordCountPerPage 	= gridViewEx1.getPageSize();   			// 몇개의 데이터를 가져올지 설정
        let currentPageNo 		= gridViewEx1.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
        var getColRef 			= gridViewEx1.getColRef("checked");
        gridViewEx1.setFixedcellcheckboxChecked(0, getColRef, false);
        fn_setGridViewEx1(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGridViewEx1 = async function(pageSize, pageNo) {

        gridViewEx1.clearStatus();

        let COMP_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_COMP_CODE"));
        let SITE_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let EMP_STATE	= gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let DEPT_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let POSITION_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_POSITION_CODE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: 'N'
            ,V_P_LANG_ID		: 'KOR'
            ,V_P_COMP_CODE		: COMP_CODE
            ,V_P_CLIENT_CODE	: '100'  // TODO : 호출 파라미터 공통화 필요
            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_DEPT_CODE      : DEPT_CODE
            ,V_P_POSITION_CODE  : POSITION_CODE
            ,V_P_EMP_CODE       : EMP_CODE
            ,V_P_EMP_STATE      : EMP_STATE
            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1900List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonEmpList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        DEPT_CODE       : item.DEPT_CODE,
                        DEPT_NAME       : item.DEPT_NAME,
                        POSITION_NAME   : item.POSITION_NAME,
                        EMP_NAME        : item.EMP_NAME,
                        EMP_PHOTO       : item.EMP_PHOTO,
                        BIRTHDAY        : item.BIRTHDAY,
                        ENTER_DATE      : item.ENTER_DATE,
                        ENTER_YEAR      : item.ENTER_YEAR,
                        POSITION_DATE   : item.POSITION_DATE,
                        CONTRACT_DATE   : item.CONTRACT_DATE,
                        SCHOOL_MAJOR1   : item.SCHOOL_MAJOR1,
                        SCHOOL_MAJOR2   : item.SCHOOL_MAJOR2,
                        SCHOOL_MAJOR3   : item.SCHOOL_MAJOR3,
                        INCAREER        : item.INCAREER,
                        OUTCAREER       : item.OUTCAREER,
                        BEGO            : item.BEGO
                    }
                    jsonEmpList.push(msg);
                });

                gridViewEx1.rebuild();
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