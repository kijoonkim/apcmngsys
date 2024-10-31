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
                </h3>
            </div>
        </div>
        <div class="box-body">

            <!--[pp] 검색 -->
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <table id="srchArea" class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">소속사업장</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <%--<sbux-select id="SRCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <th scope="row" class="th_bg"><span class="data_required"></span>재직구분</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">부서</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-input id="SRCH_DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-input id="SRCH_DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findSrchDeptCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">사원</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findEmpCode"
                        ></sbux-button>
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

<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    var jsonSiteCode	= [];	// 사업장
    var jsonEmpState = []; // 재직구분
    var jsonPositionCode = []; // 직위

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
            /*gfnma_setComSelect(['SRCH_SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#SRCH_SITE_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_ORG001'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SITE_CODE'
                ,colLabel		: 'SITE_NAME'
                ,columns		:[
                    {caption: "사업장코드",		ref: 'SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "사업장명", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 재직구분
            gfnma_setComSelect(['SRCH_EMP_STATE'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['SRCH_POSITION_CODE'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    var fn_findSrchDeptCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: [searchCode, 				searchName,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findEmpCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 	= "_DEPT_NAME_";
        var replaceText1 	= "_EMP_CODE_";
        var replaceText2 	= "_EMP_NAME_";
        var replaceText3 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_CODE LIKE '%" + replaceText1 + "%' AND X.EMP_NAME LIKE '%" + replaceText2 + "%' AND X.EMP_STATE LIKE '%" + replaceText3 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		"재직상태"]
            ,searchInputFields		: ["DEPT_NAME", 	"EMP_CODE",		"EMP_NAME",		"EMP_STATE"]
            ,searchInputValues		: ["", 			searchCode, searchName,		""]
            ,searchInputTypes		: ["input", 	"input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"", "",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
            },
        });
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
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["NO"],		ref: 'CNT', 		type:'output',  	width:'28px',  	    style:'text-align:center'},
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
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGrid();

        await fn_onload();
    });

    const fn_onload = async function () {
        SBUxMethod.set('SRCH_EMP_STATE', "WORK");
    }

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {
        let SITE_CODE	= gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let EMP_STATE	= gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let DEPT_CODE	= gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE	= gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let POSITION_CODE	= gfn_nvl(SBUxMethod.get("SRCH_POSITION_CODE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
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

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonEmpList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CNT             : item.CNT,
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