<%
    /**
     * @Class Name        : hra1300.jsp
     * @Description       : 종전근무지등록 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.07.29
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.29   	표주완		최초 생성
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
    <title>title : 종전근무지등록</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>

    <title>Calculator</title>
    <link rel="stylesheet" href="/resource/css/ma_custom.css">
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

        <!--[pp] 검색 -->
        <!--[APC] START -->
        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <table id="dataArea1" class="table table-bordered tbl_fixed">
            <caption>검색 조건 설정</caption>
            <colgroup>
                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 1%">
                <col style="width: 6%">
                <col style="width: 2%">

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 1%">
                <col style="width: 6%">
                <col style="width: 2%">

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 1%">
                <col style="width: 6%">
                <col style="width: 2%">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row" class="th_bg">정산연도</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_YE_TX_YYYY"
                            name="SRCH_YE_TX_YYYY"
                            uitype="popup"
                            datepicker-mode="year"
                            date-format="yyyy"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            style="width: 95%;"
                            required>
                        <%--onchange="fn_payDate"--%>
                    </sbux-datepicker>
                </td>
                <td colspan="3" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">사업장</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="3" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">급여영역</th>
                <td class="td_input">
                    <sbux-select
                            id="SRCH_PAY_AREA_TYPE"
                            uitype="single"
                            jsondata-ref="jsonPayAreaType"
                            unselected-text="선택"
                            class="form-control input-sm"
                    <%--onchange="fn_payType"--%>>
                    </sbux-select>
                </td>
                <td colspan="3" style="border-right: hidden;"></td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">부서</th>
                <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                    <sbux-input
                            uitype="text"
                            id="SRCH_DEPT_CODE"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="2" class="td_input" style="border-right: hidden;" data-group="DEPT">
                    <sbux-input
                    <%-- uitype="hidden"--%>
                            uitype="text"
                            id="SRCH_DEPT_NAME"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td <%--colspan="2"--%> class="td_input" data-group="DEPT">
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup1"
                    ></sbux-button>
                </td>
                <th scope="row" class="th_bg">사원</th>
                <td class="td_input" style="border-right: hidden;" data-group="EMP">
                    <sbux-input
                            uitype="text"
                            id="SRCH_EMP_CODE"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="2" class="td_input" style="border-right: hidden;" data-group="EMP">
                    <sbux-input
                    <%-- uitype="hidden"--%>
                            uitype="text"
                            id="SRCH_EMP_NAME"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="6" class="td_input" data-group="EMP">
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup2"
                    ></sbux-button>
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">입사일</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_DATE_FR"
                            name="SRCH_DATE_FR"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast"
                    >
                    </sbux-datepicker>
                </td>
                <td>~</td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_DATE_TO"
                            name="SRCH_DATE_TO"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast">
                    </sbux-datepicker>
                </td>
                <td style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">퇴사일</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_RET_DATE_FR"
                            name="SRCH_RET_DATE_FR"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast"
                    >
                    </sbux-datepicker>
                </td>
                <td>~</td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_RET_DATE_TO"
                            name="SRCH_RET_DATE_TO"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast">
                    </sbux-datepicker>
                </td>
                <td colspan="6" style="border-right: hidden;"></td>
            </tr>
            </tbody>
        </table>

        <div class="row">
            <div class="col-sm-4">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>사원 리스트</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwList" style="height:800px; width:100%;"></div>
                </div>
            </div>


            <div class="col-sm-8">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>사원정보</span></li>
                    </ul>
                </div>
                <div>
                    <table id="dataArea2" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:4%">
                            <col style="width:4%">
                            <col style="width:4%">
                            <col style="width:2%">

                            <col style="width:4%">
                            <col style="width:4%">
                            <col style="width:4%">
                            <col style="width:2%">

                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">사업장</th>
                            <td class="td_input">
                                <sbux-select
                                        id="SITE_CODE"
                                        uitype="single"
                                        jsondata-ref="jsonSiteCode"
                                        unselected-text="선택"
                                        class="form-control input-sm"
                                        readonly
                                <%--onchange="fn_payType"--%>>
                                </sbux-select>
                            </td>
                            <td colspan="6" style="border-right: hidden;"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">부서</th>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT2">
                                <sbux-input
                                        uitype="text"
                                        id="DEPT_CODE"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT2">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="DEPT_NAME"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT2">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup4"
                                        readonly
                                ></sbux-button>
                            </td>
                            <th scope="row" class="th_bg">사원</th>
                            <td class="td_input" style="border-right: hidden;" data-group="EMP2">
                                <sbux-input
                                        uitype="text"
                                        id="EMP_CODE"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="EMP2">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="EMP_NAME"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="EMP2" >
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup5"
                                        readonly
                                ></sbux-button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="8">
                                <p>
                                    *국세청 간소화자료(PDF)로 연말정산 등록을 하시는 분들은 종전근무지 정보의 건강보험료, 국민연금보험료를 입력하지 마십시오.(국세청 자료에서 종전+현 근무지 포함해서 제공)
                                </p>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>종전근무지 정보</span>
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
                    <div id="sb-area-gvwWorkComHistory" style="height:300px; width:100%;"></div>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>비과세 정보</span>
                        </li>
                    </ul>
                    <sbux-button
                            id="btnDel1"
                            name="btnDel1"
                            uitype="normal"
                            text="행삭제"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_delRow1"
                            style="float: right;"
                    >
                    </sbux-button>
                    <sbux-button
                            id="btnAdd1"
                            name="btnAdd1"
                            uitype="normal"
                            text="행추가"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_addRow1"
                            style="float: right;"
                    ></sbux-button>
                </div>
                <div>
                    <div id="sb-area-gvwWorkComTaxFreeHistory" style="height:300px; width:100%;"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    //grid 초기화
    var gvwListGrid; 			// 그리드를 담기위한 객체 선언
    var jsonList = []; 	    // 그리드의 참조 데이터 주소 선언
    var gvwWorkComGrid;
    var jsonWorkComList =[];
    var gvwTaxFreeGrid;
    var jsonTaxFreeList = [];


    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )SRCH_PAY_AREA_TYPE
    var jsonSiteCode = []; //사업장 ( L_ORG001 )SITE_CODE
    var jsonDeptCode = []; //부서코드 ( P_ORG004 )DEPT_CODE
    var jsonDeptName = []; //부서명 ( P_ORG001 )DEPT_NAME
    var jsonWorkCompanyType = []; //종전근무지구분 ( L_HRA031 )WORK_COMPANY_TYPE


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid'], jsonDeptCode, 'P_ORG004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid'], jsonDeptName, 'P_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwWorkComGrid','gvwWorkComGrid'], jsonWorkCompanyType, 'L_HRA031', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

            //사업장
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
                    {caption: "코드",		ref: 'SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

        ]);
    }

    var fn_compopup1 = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: ["", 				searchText,		""]

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

    const fn_compopup2 = function() {

        var searchText = gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 = "_EMP_CODE_";
        var replaceText1 = "_EMP_NAME_";
        var replaceText2 = "_DEPT_CODE_";
        var replaceText3 = "_DEPT_NAME_";
        var replaceText4 = "_EMP_STATE_";
        var strWhereClause = "AND x.EMP_CODE LIKE '%" + replaceText0 + "%' AND x.DEPT_NAME LIKE '%" + replaceText1 + "%' AND x.DEPT_CODE LIKE '%"+replaceText2
            + "%' AND x.DEPT_NAME LIKE '%" + replaceText3 +  "%' AND x.EMP_STATE LIKE '%"+replaceText4+"%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
        compopup1({
            compCode: gv_ma_selectedApcCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_HRI001'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions:    ["부서코드"    , "부서명"     , "사원코드"    ,"사원명"     ,"재직상태"]
            , searchInputFields: ["DEPT_CODE"  , "DEPT_NAME", "EMP_CODE"   ,"EMP_NAME"  ,"EMP_STATE"]
            , searchInputValues: [""           , ""         ,""             ,searchText         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CODE"  , "EMP_NAME"  , "DEPT_NAME"   ,"SITE_NAME"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
            },
        });

    }

    var fn_compopup4 = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("DEPT_CODE"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: ["", 				searchText,		""]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup5 = function() {

        var searchText = gfn_nvl(SBUxMethod.get("EMP_NAME"));
        var replaceText0 = "_EMP_CODE_";
        var replaceText1 = "_EMP_NAME_";
        var replaceText2 = "_DEPT_CODE_";
        var replaceText3 = "_DEPT_NAME_";
        var replaceText4 = "_EMP_STATE_";
        var strWhereClause = "AND x.EMP_CODE LIKE '%" + replaceText0 + "%' AND x.DEPT_NAME LIKE '%" + replaceText1 + "%' AND x.DEPT_CODE LIKE '%"+replaceText2
            + "%' AND x.DEPT_NAME LIKE '%" + replaceText3 +  "%' AND x.EMP_STATE LIKE '%"+replaceText4+"%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
        compopup1({
            compCode: gv_ma_selectedApcCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_HRI001'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions:    ["부서코드"    , "부서명"     , "사원코드"    ,"사원명"     ,"재직상태"]
            , searchInputFields: ["DEPT_CODE"  , "DEPT_NAME", "EMP_CODE"   ,"EMP_NAME"  ,"EMP_STATE"]
            , searchInputValues: [""           , ""         ,""             ,searchText         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CODE"  , "EMP_NAME"  , "DEPT_NAME"   ,"SITE_NAME"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('EMP_CODE', data.EMP_CODE);
            },
        });

    }

    /**
     * 그리드내 공통팝업 오픈
     */
    var fn_compopup3 = function(row, col) {

        SBUxMethod.attr('modal-compopup1', 'header-title', '비과세항목정보');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= "";
        var replaceText0 = "_TAX_FREE_CODE_";
        var replaceText1 = "_TAX_FREE_NAME_";
        var strWhereClause = "AND b.TAX_FREE_CODE LIKE '%" + replaceText0 + "%' AND b.TAX_FREE_NAME LIKE '%" + replaceText1 + "%'";

        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HR015_1'
            ,popupType				: 'A'
            , whereClause           : strWhereClause
            , searchCaptions        :   ["비과세코드"       , "비과세약칭"     ]
            , searchInputFields     :   ["TAX_FREE_CODE"  , "TAX_FREE_NAME"]
            , searchInputValues     :   [searchText       , ""             ]
            , height                : '400px'
            , tableHeader           :   ["비과세코드"       , "비과세약칭"       , "비과세설명"    ]
            , tableColumnNames      :   ["TAX_FREE_CODE"  , "TAX_FREE_NAME"  , "TAX_FREE_DESCR"]
            , tableColumnWidths     :   ["80px"      , "120px"      , "300px"]
            ,itemSelectEvent		: function (data){
                //그리드내 원하는 위치에 값 셋팅하기
                gvwTaxFreeGrid.setCellData(row, gvwTaxFreeGrid.getColRef('PREV_COM_NUM'), data['TAX_FREE_CODE']); //비과세코드
                gvwTaxFreeGrid.setCellData(row, gvwTaxFreeGrid.getColRef('TAX_FREE_NAME'), data['TAX_FREE_NAME']); //비과세약칭
                //gvwDetallGrid.setCellData(row, (col+1), data['TAX_FREE_DESCR']); //비과세설명
            }
        });
    }


    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        let openDate = gfn_dateToYear(new Date());

        SBUxMethod.set('SRCH_YE_TX_YYYY', openDate);
        /*SBUxMethod.set('srch-pay_yyyymm_fr2', openDate);*/

        fn_createGrid();
        fn_createWorkComGrid();
        fn_createTaxFreeGrid();
        fn_search();
    }

    // 신규
    /*  function cfn_add() {
          fn_create();
      }*/
    // 저장
    async function cfn_save() {
        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            let WorkComList = gvwWorkComGrid.getUpdateData(true, 'all');

            if (_.isEmpty(WorkComList) == false){

                await fn_save(WorkComList);

            }

            let updateData = gvwTaxFreeGrid.getUpdateData(true, 'all');

            if (_.isEmpty(updateData) == false){

                fn_saveS1(updateData);

            }

        }

    }
    // 삭제
    /*function cfn_del() {
        if (gfn_comConfirm("Q0001", "삭제")) {
            fn_save('D');
        }
    }*/

    // 조회
    function cfn_search() {
        fn_search();
    }

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }

    //사원정보
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwList';
        SBGridProperties.id = 'gvwListGrid';
        SBGridProperties.jsonref = 'jsonList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption : ["사업장"], ref : 'SITE_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["부서코드"], ref : 'DEPT_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDeptCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["부서명"], ref : 'DEPT_NAME', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDeptName', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['입사일자'], ref: 'ENTER_DATE', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
        ];

        gvwListGrid = _SBGrid.create(SBGridProperties);
        gvwListGrid.bind('click', 'fn_view');
    }


    //종전근무지 정보 리스트
    function fn_createWorkComGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwWorkComHistory';
        SBGridProperties.id = 'gvwWorkComGrid';
        SBGridProperties.jsonref = 'jsonWorkComList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["종전근무지구분"], ref : 'WORK_COMPANY_TYPE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonWorkCompanyType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["납세조합여부"], ref: 'TX_UNION_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["근무처명"], ref: 'PREV_COM_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["사업자번호"], ref: 'PREV_COM_NUM', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ['근무시작일'], ref: 'PREV_WORK_ST_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['근무종료일'], ref: 'PREV_WORK_END_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['감면시작일'], ref: 'PREV_REDUCT_ST_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['감면종료일'], ref: 'PREV_REDUCT_END_DAT', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["급여"], ref: 'PREV_PAY_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["상여"], ref: 'PREV_BONUS_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["인정상여"], ref: 'PREV_ADD_BONUS_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["주식매수선택권 행사이익"], ref: 'PREV_STOCK_PROFIT_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["우리사주조합인출금"], ref: 'PREV_EMP_STOCK_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["임원 퇴직소득금액 한도초과액"], ref: 'PREV_EXEC_RET_LIM_OVER', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["국민연금보험료"], ref: 'PREV_PENS_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["공무원연금"], ref: 'PREV_OFFICIAL_PENS_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["군인연금"], ref: 'PREV_MILITARY_PENS_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["사립학교 교직원연금"], ref: 'PREV_SCHOOL_PENS_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["별정우체국연금"], ref: 'PREV_POST_PENS_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["과학기술인공제"], ref: 'PREV_SCNT_PENS_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["근로자퇴직급여보장법"], ref: 'PREV_RET_PENS_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["연금저축계좌"], ref: 'PREV_PENS_SV_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["국민건강보험(노양장기요양보험 포함)"], ref: 'PREV_HEALTH_INSURE_AMT', type: 'input', width: '170px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["고용보험"], ref: 'PREV_EMP_INSURE_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["소득세"], ref: 'PREV_INC_TX_AMT', type: 'input', width: '170px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["지방소득세"], ref: 'PREV_LOCAL_TX_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["농어촌특별세"], ref: 'PREV_SPEC_TX_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
        ];

        gvwWorkComGrid = _SBGrid.create(SBGridProperties);
        /*gvwHistoryGrid.bind('click', 'fn_view');*/
    }


    //비과세 정보 리스트
    function fn_createTaxFreeGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwWorkComTaxFreeHistory';
        SBGridProperties.id = 'gvwTaxFreeGrid';
        SBGridProperties.jsonref = 'jsonTaxFreeList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["종전근무지구분"], ref : 'WORK_COMPANY_TYPE', width : '140px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonWorkCompanyType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["사업자번호"], ref: 'PREV_COM_NUM', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["비과세코드"], ref: 'TXFREE_CODE', type: 'input', width: '140px', style: 'text-align:left'},
            {caption: ["세액감면여부"], ref: 'TX_RED_INC_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["비과세약칭"], ref: 'TAX_FREE_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["비과세약칭 팝업"], 	ref: 'POP_BTN', type:'button', width:'80px', style:'text-align:center', /*disabled: true,*/
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_gridPopup(event, " + nRow + ", " + nCol + ")'>선택</button>";
                }
            },
            {caption: ["비과세금액"], ref: 'TXFREE_AMT', type: 'input', width: '170px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값
        ];

        gvwTaxFreeGrid = _SBGrid.create(SBGridProperties);
       /* gvwListGrid.bind('click', 'fn_view');*/
    }

    /**
     * 그리드내 팝업 조회
     */
    function fn_gridPopup(event, row, col) {

        event.stopPropagation();	//이벤트가 그리드에 전파되는것 중지
        fn_compopup3(row, col);
    }

    //상세정보 보기
    async function fn_view() {

        let nRow = gvwListGrid.getRow();
        let nCol = gvwListGrid.getCol();

        if (nCol == -1) {
            return;
        }
        if (nRow < 1) {
            return;
        }

        let YE_TX_YYYY = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY"));//정산연도

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }

        let SITE_CODE       = gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE"));//사업장
        let DEPT_CODE       = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));//부서
        let RET_DATE_FR     = gfn_nvl(SBUxMethod.get("SRCH_RET_DATE_FR"));//퇴사일 S
        let RET_DATE_TO     = gfn_nvl(SBUxMethod.get("SRCH_RET_DATE_TO"));//퇴사일 E
        let DATE_FR         = gfn_nvl(SBUxMethod.get("SRCH_DATE_FR"));//입사일 E
        let DATE_TO         = gfn_nvl(SBUxMethod.get("SRCH_DATE_TO"));//입사일 E
        let PAY_AREA_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE"));//급여영역


        let rowData = gvwListGrid.getRowData(nRow);

        if (!_.isEmpty(rowData)) {

            gfnma_uxDataClear('#dataArea2');
            gfnma_uxDataSet('#dataArea2', rowData);

            var paramObj = {
                V_P_DEBUG_MODE_YN: 'N'
                , V_P_LANG_ID: 'KOR'
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                ,V_P_YE_TX_YYYY     : YE_TX_YYYY
                ,V_P_SITE_CODE      : SITE_CODE
                ,V_P_DEPT_CODE      : DEPT_CODE
                ,V_P_EMP_CODE       : rowData.EMP_CODE
                ,V_P_RETIRE_DATE_FR : RET_DATE_FR
                ,V_P_RETIRE_DATE_TO : RET_DATE_TO
                ,V_P_ENTER_FR       : DATE_FR
                ,V_P_ENTER_TO       : DATE_TO
                ,V_P_PAY_AREA_TYPE  : PAY_AREA_TYPE

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''
            };


            const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1300List.do", {
                getType				: 'json',
                workType			: 'PREV',
                cv_count			: '3',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    // -- 종전근무지 정보
                    jsonWorkComList.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            WORK_COMPANY_TYPE       : gfn_nvl(item.WORK_COMPANY_TYPE),
                            TX_UNION_YN             : gfn_nvl(item.TX_UNION_YN),
                            PREV_COM_NAME           : gfn_nvl(item.PREV_COM_NAME),
                            PREV_COM_NUM            : gfn_nvl(item.PREV_COM_NUM),
                            PREV_WORK_ST_DAT        : gfn_nvl(item.PREV_WORK_ST_DAT),
                            PREV_WORK_END_DAT       : gfn_nvl(item.PREV_WORK_END_DAT),
                            PREV_REDUCT_ST_DAT      : gfn_nvl(item.PREV_REDUCT_ST_DAT),
                            PREV_REDUCT_END_DAT     : gfn_nvl(item.PREV_REDUCT_END_DAT),
                            PREV_PAY_AMT            : gfn_nvl(item.PREV_PAY_AMT),
                            PREV_BONUS_AMT          : gfn_nvl(item.PREV_BONUS_AMT),
                            PREV_ADD_BONUS_AMT      : gfn_nvl(item.PREV_ADD_BONUS_AMT),
                            PREV_STOCK_PROFIT_AMT   : gfn_nvl(item.PREV_STOCK_PROFIT_AMT),
                            PREV_EMP_STOCK_AMT      : gfn_nvl(item.PREV_EMP_STOCK_AMT),
                            PREV_EXEC_RET_LIM_OVER  : gfn_nvl(item.PREV_EXEC_RET_LIM_OVER),
                            PREV_PENS_AMT           : gfn_nvl(item.PREV_PENS_AMT),
                            PREV_OFFICIAL_PENS_AMT  : gfn_nvl(item.PREV_OFFICIAL_PENS_AMT),
                            PREV_MILITARY_PENS_AMT  : gfn_nvl(item.PREV_MILITARY_PENS_AMT),
                            PREV_SCHOOL_PENS_AMT    : gfn_nvl(item.PREV_SCHOOL_PENS_AMT),
                            PREV_POST_PENS_AMT      : gfn_nvl(item.PREV_POST_PENS_AMT),
                            PREV_SCNT_PENS_AMT      : gfn_nvl(item.PREV_SCNT_PENS_AMT),
                            PREV_RET_PENS_AMT       : gfn_nvl(item.PREV_RET_PENS_AMT),
                            PREV_PENS_SV_AMT        : gfn_nvl(item.PREV_PENS_SV_AMT),
                            PREV_HEALTH_INSURE_AMT  : gfn_nvl(item.PREV_HEALTH_INSURE_AMT),
                            PREV_EMP_INSURE_AMT     : gfn_nvl(item.PREV_EMP_INSURE_AMT),
                            PREV_INC_TX_AMT         : gfn_nvl(item.PREV_INC_TX_AMT),
                            PREV_LOCAL_TX_AMT       : gfn_nvl(item.PREV_LOCAL_TX_AMT),
                            PREV_SPEC_TX_AMT        : gfn_nvl(item.PREV_SPEC_TX_AMT),
                        }
                        jsonWorkComList.push(msg);
                    });

                    gvwWorkComGrid.rebuild();


                    jsonTaxFreeList.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            WORK_COMPANY_TYPE   : gfn_nvl(item.WORK_COMPANY_TYPE),
                            PREV_COM_NUM        : gfn_nvl(item.PREV_COM_NUM),
                            TXFREE_CODE         : gfn_nvl(item.TXFREE_CODE),
                            TX_RED_INC_YN       : gfn_nvl(item.TX_RED_INC_YN),
                            TAX_FREE_NAME       : gfn_nvl(item.TAX_FREE_NAME),
                            TXFREE_AMT          : gfn_nvl(item.TXFREE_AMT)

                        }
                        jsonTaxFreeList.push(msg);
                    });

                    gvwTaxFreeGrid.rebuild();

                    if (jsonTaxFreeList.length > 0){
                        jsonTaxFreeList.forEach((item, index) => {
                            gvwTaxFreeGrid.setCellDisabled(index+1, 0, index+1, 1, true, false, true);
                        })
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
    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let YE_TX_YYYY = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY"));//정산연도

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }

        let SITE_CODE       = gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE"));//사업장
        let DEPT_CODE       = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));//부서
        let EMP_CODE        = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));//사원
        let RET_DATE_FR     = gfn_nvl(SBUxMethod.get("SRCH_RET_DATE_FR"));//퇴사일 S
        let RET_DATE_TO     = gfn_nvl(SBUxMethod.get("SRCH_RET_DATE_TO"));//퇴사일 E
        let DATE_FR         = gfn_nvl(SBUxMethod.get("SRCH_DATE_FR"));//입사일 E
        let DATE_TO         = gfn_nvl(SBUxMethod.get("SRCH_DATE_TO"));//입사일 E
        let PAY_AREA_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE"));//급여영역


        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_YE_TX_YYYY     : YE_TX_YYYY
            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_DEPT_CODE      : DEPT_CODE
            ,V_P_EMP_CODE       : EMP_CODE
            ,V_P_RETIRE_DATE_FR : RET_DATE_FR
            ,V_P_RETIRE_DATE_TO : RET_DATE_TO
            ,V_P_ENTER_FR       : DATE_FR
            ,V_P_ENTER_TO       : DATE_TO
            ,V_P_PAY_AREA_TYPE  : PAY_AREA_TYPE

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1300List.do", {
            getType: 'json',
            workType: 'LIST',
            cv_count: '3',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN            : gfn_nvl(item.CHK_YN),
                        EMP_CODE          : gfn_nvl(item.EMP_CODE),
                        EMP_NAME          : gfn_nvl(item.EMP_NAME),
                        EMP_FULL_NAME     : gfn_nvl(item.EMP_FULL_NAME),
                        SITE_CODE         : gfn_nvl(item.SITE_CODE),
                        DEPT_CODE         : gfn_nvl(item.DEPT_CODE),
                        DEPT_NAME         : gfn_nvl(item.DEPT_NAME),
                        ENTER_DATE        : gfn_nvl(item.ENTER_DATE),
                    }
                    jsonList.push(msg);
                    totalRecordCount++;
                });

                gvwListGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if(jsonList.length > 0) {
                    gvwListGrid.clickRow(1);
                }
                //fn_view();

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

    // 행추가 (종전근무지)
    const fn_addRow = async function () {
        let rowVal = gvwWorkComGrid.getRow();

        const msg = {
            WORK_COMPANY_TYPE             : '',
            TX_UNION_YN                   : '',
            PREV_COM_NAME                 : '',
            PREV_COM_NUM                  : '',
            PREV_WORK_ST_DAT              : '',
            PREV_WORK_END_DAT             : '',
            PREV_REDUCT_ST_DAT            : '',
            PREV_REDUCT_END_DAT           : '',
            PREV_PAY_AMT                  : 0,
            PREV_BONUS_AMT                : 0,
            PREV_ADD_BONUS_AMT            : 0,
            PREV_STOCK_PROFIT_AMT         : 0,
            PREV_EMP_STOCK_AMT            : 0,
            PREV_EXEC_RET_LIM_OVER        : 0,
            PREV_PENS_AMT                 : 0,
            PREV_OFFICIAL_PENS_AMT        : 0,
            PREV_MILITARY_PENS_AMT        : 0,
            PREV_SCHOOL_PENS_AMT          : 0,
            PREV_POST_PENS_AMT            : 0,
            PREV_SCNT_PENS_AMT            : 0,
            PREV_RET_PENS_AMT             : 0,
            PREV_PENS_SV_AMT              : 0,
            PREV_HEALTH_INSURE_AMT        : 0,
            PREV_EMP_INSURE_AMT           : 0,
            PREV_INC_TX_AMT               : 0,
            PREV_LOCAL_TX_AMT             : 0,
            PREV_SPEC_TX_AMT              : 0,


            status: 'i'
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwWorkComGrid.addRow(true,msg);
        }else{
            gvwWorkComGrid.insertRow(rowVal, 'below', msg);
        }
    }

    // 행삭제 (종전근무지)
    const fn_delRow = async function () {
        let rowVal = gvwWorkComGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwWorkComGrid.deleteRow(rowVal);
        }
    }

    // 행추가 (비과세)
    const fn_addRow1 = async function () {
        let rowVal = gvwTaxFreeGrid.getRow();

        const msg = {
            WORK_COMPANY_TYPE      : '',
            PREV_COM_NUM           : '',
            TXFREE_CODE            : '',
            TX_RED_INC_YN          : '',
            TAX_FREE_NAME          : '',
            TXFREE_AMT             : 0,

            status: 'i'
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwTaxFreeGrid.addRow(true, msg);
        }else{
            gvwTaxFreeGrid.insertRow(rowVal, 'below', msg);
        }
    }

    // 행삭제 (비과세)
    const fn_delRow1 = async function () {
        let rowVal = gvwTaxFreeGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwTaxFreeGrid.deleteRow(rowVal);
        }
    }

    //저장
    const fn_save = async function (updatedData) {

        let listData = [];
        listData =  await getParamForm(updatedData);

        if (listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1300.do", {listData: listData});
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }/*else{
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        fn_search();
                    }*/

                } else {
                    alert(data.resultMessage);
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }
    }

    const getParamForm = async function (updatedData) {

        let returnData = [];

        let YE_TX_YYYY = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY"));//정산연도

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }

        let EMP_CODE = gfn_nvl(SBUxMethod.get("EMP_CODE"));//사원

        updatedData.forEach((item, index) => {

            const param = {

                cv_count: '0',
                getType: 'json',
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: ''
                    , V_P_LANG_ID: ''
                    , V_P_COMP_CODE: gv_ma_selectedApcCd
                    , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                    ,V_P_YE_TX_YYYY             : YE_TX_YYYY
                    ,V_P_EMP_CODE               : EMP_CODE
                    ,V_P_WORK_COMPANY_TYPE      : item.data.WORK_COMPANY_TYPE
                    ,V_P_TX_UNION_YN            : item.data.TX_UNION_YN
                    ,V_P_PREV_COM_NAME          : item.data.PREV_COM_NAME
                    ,V_P_PREV_COM_NUM           : item.data.PREV_COM_NUM
                    ,V_P_PREV_WORK_ST_DAT       : item.data.PREV_WORK_ST_DAT
                    ,V_P_PREV_WORK_END_DAT      : item.data.PREV_WORK_END_DAT
                    ,V_P_PREV_REDUCT_ST_DAT     : item.data.PREV_REDUCT_ST_DAT
                    ,V_P_PREV_REDUCT_END_DAT    : item.data.PREV_REDUCT_END_DAT
                    ,V_P_PREV_PAY_AMT           : item.data.PREV_PAY_AMT
                    ,V_P_PREV_BONUS_AMT         : item.data.PREV_BONUS_AMT
                    ,V_P_PREV_ADD_BONUS_AMT     : item.data.PREV_ADD_BONUS_AMT
                    ,V_P_PREV_STOCK_PROFIT_AMT  : item.data.PREV_STOCK_PROFIT_AMT
                    ,V_P_PREV_EMP_STOCK_AMT     : item.data.PREV_EMP_STOCK_AMT
                    ,V_P_PREV_EXEC_RET_LIM_OVER : item.data.PREV_EXEC_RET_LIM_OVER
                    ,V_P_PREV_PENS_AMT          : item.data.PREV_PENS_AMT
                    ,V_P_PREV_OFFICIAL_PENS_AMT : item.data.PREV_OFFICIAL_PENS_AMT
                    ,V_P_PREV_MILITARY_PENS_AMT : item.data.PREV_MILITARY_PENS_AMT
                    ,V_P_PREV_SCHOOL_PENS_AMT   : item.data.PREV_SCHOOL_PENS_AMT
                    ,V_P_PREV_POST_PENS_AMT     : item.data.PREV_POST_PENS_AMT
                    ,V_P_PREV_SCNT_PENS_AMT     : item.data.PREV_SCNT_PENS_AMT
                    ,V_P_PREV_RET_PENS_AMT      : item.data.PREV_RET_PENS_AMT
                    ,V_P_PREV_PENS_SV_AMT       : item.data.PREV_PENS_SV_AMT
                    ,V_P_PREV_HEALTH_INSURE_AMT : item.data.PREV_HEALTH_INSURE_AMT
                    ,V_P_PREV_EMP_INSURE_AMT    : item.data.PREV_EMP_INSURE_AMT
                    ,V_P_PREV_INC_TX_AMT        : item.data.PREV_INC_TX_AMT
                    ,V_P_PREV_LOCAL_TX_AMT      : item.data.PREV_LOCAL_TX_AMT
                    ,V_P_PREV_SPEC_TX_AMT       : item.data.PREV_SPEC_TX_AMT

                    , V_P_FORM_ID: p_formId
                    , V_P_MENU_ID: p_menuId
                    , V_P_PROC_ID: ''
                    , V_P_USERID: ''
                    , V_P_PC: ''

                })
            }

            returnData.push(param);

        });

        return returnData;
    }

    //근로소득 공제 리스트 저장
    const fn_saveS1 = async function (updatedData) {

        let workComData = gvwWorkComGrid.getGridDataAll();
        let chkWork = '';
        let chkPrev = '';

        updatedData.forEach((item1, index) => {

            let WORK_COMPANY_TYPE_T = item1.data.WORK_COMPANY_TYPE;
            let PREV_COM_NUM_T      = item1.data.PREV_COM_NUM;

            workComData.forEach((item2, index) => {

                let WORK_COMPANY_TYPE_W = item2.WORK_COMPANY_TYPE;
                let PREV_COM_NUM_W      = item2.PREV_COM_NUM;

                if (_.isEqual(WORK_COMPANY_TYPE_T, WORK_COMPANY_TYPE_W)){
                    chkWork = WORK_COMPANY_TYPE_T + ','+WORK_COMPANY_TYPE_W;
                }

                if (_.isEqual(PREV_COM_NUM_T, PREV_COM_NUM_W)){
                    chkPrev = PREV_COM_NUM_T + ','+PREV_COM_NUM_W;
                }

            });

        });

        if (chkWork == '')
        {
            gfn_comAlert("Q0000","종전근무지 정보가 일치하지 않습니다.(종전근무지구분)");
            //SetMessageBox(GetFormMessage("HRA1300_002")); // 종전근무지 정보가 일치하지 않습니다.
            return false;
        }
        if (chkPrev == '')
        {
            gfn_comAlert("Q0000","종전근무지 정보가 일치하지 않습니다.(사업자번호)");
            //SetMessageBox(GetFormMessage("HRA1300_002")); // 종전근무지 정보가 일치하지 않습니다.
            return false;
        }


        let listData = [];
        listData =  await getParamFormS1(updatedData);

        if (listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1300S1.do", {listData: listData});
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }/*else{
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        fn_search();
                    }*/

                } else {
                    alert(data.resultMessage);
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }
    }

    const getParamFormS1 = async function (updatedData) {

        let returnData = [];

        let YE_TX_YYYY = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY"));//정산연도

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }

        let EMP_CODE = gfn_nvl(SBUxMethod.get("EMP_CODE"));//사원

        updatedData.forEach((item, index) => {

            const param = {

                cv_count: '0',
                getType: 'json',
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN: ''
                    , V_P_LANG_ID: ''
                    , V_P_COMP_CODE: gv_ma_selectedApcCd
                    , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                    ,V_P_YE_TX_YYYY        : YE_TX_YYYY
                    ,V_P_EMP_CODE          : EMP_CODE
                    ,V_P_WORK_COMPANY_TYPE : item.data.WORK_COMPANY_TYPE
                    ,V_P_TXFREE_CODE       : item.data.TXFREE_CODE
                    ,V_P_TXFREE_AMT        : item.data.TXFREE_AMT
                    ,V_P_PREV_COM_NUM      : item.data.PREV_COM_NUM

                    , V_P_FORM_ID: p_formId
                    , V_P_MENU_ID: p_menuId
                    , V_P_PROC_ID: ''
                    , V_P_USERID: ''
                    , V_P_PC: ''

                })
            }

            returnData.push(param);

        });

        return returnData;
    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>