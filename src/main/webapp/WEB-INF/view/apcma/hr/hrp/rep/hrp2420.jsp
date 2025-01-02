<%
    /**
     * @Class Name        : hrp2420.jsp
     * @Description       : 급여대장( 급여명세서 일괄출력 ) 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.07.08
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.08   	표주완		최초 생성
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
    <title>title : 급여대장</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <%@ include file="../../../../frame/inc/clipreport.jsp" %>

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
            <div style="margin-left: auto;">
                <sbux-button id="btnPrint" name="btnPrint" uitype="normal" text="출력"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnPrint"></sbux-button>
            </div>
        </div>

        <div class="box-search-ma">
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <table id="dataArea1" class="table table-bordered tbl_fixed table-search-ma">
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
                    <th scope="row" class="th_bg_search">사업장</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
                                    type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE"
                                 style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">급여영역</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_PAY_AREA_TYPE"
                                uitype="single"
                                jsondata-ref="jsonPayAreaType"
                        <%--unselected-text="선택"--%>
                                class="form-control input-sm"
                        <%--onchange="fn_payType"--%>>
                        </sbux-select>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">부서(실)</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
                                    type="button" id="SRCH_PARENT_DEPT01" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_PARENT_DEPT01"
                                 style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td style="border-right: hidden;"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">귀속년월</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_PAY_YYYYMM"
                                name="SRCH_PAY_YYYYMM"
                                uitype="popup"
                                datepicker-mode="month"
                                date-format="yyyy-mm"
                                class="table-datepicker-ma inpt_data_reqed"
                                style="width: 95%;"
                                onchange="fn_payDate"
                                required>
                            <%--onchange="fn_payDate"--%>
                        </sbux-datepicker>
                    </td>
                    <td colspan="3" style="border-right: hidden;"></td>

                    <th scope="row" class="th_bg_search">지급구분</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_PAY_TYPE"
                                uitype="single"
                                jsondata-ref="jsonPayType"
                                unselected-text="선택"
                                class="form-control input-sm inpt_data_reqed"
                                onchange="fn_payDate"
                                required
                        <%--onchange="fn_payType"--%>>
                        </sbux-select>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">지급일자</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_PAY_DATE"
                                uitype="single"
                                jsondata-ref="jsonPayDate"
                                unselected-text="선택"
                                class="form-control input-sm inpt_data_reqed"
                                required
                        <%--onchange="fn_payType"--%>>
                        </sbux-select>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">부서(팀)</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
                                    type="button" id="SRCH_PARENT_DEPT02" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_PARENT_DEPT02"
                                 style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td style="border-right: hidden;"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">부서</th>
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
                                text="…"
                                uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup1"
                        ></sbux-button>
                    </td>

                    <th scope="row" class="th_bg_search">사원</th>
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
                    <td class="td_input" data-group="EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…"
                                uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup2"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg_search">직군</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_JOB_GROUP"
                                uitype="single"
                                jsondata-ref="jsonJobGroup"
                                unselected-text="선택"
                                class="form-control input-sm"
                                required
                        <%--onchange="fn_payType"--%>>
                        </sbux-select>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">소급구분</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_SUM_TYPE"
                                uitype="single"
                                jsondata-ref="jsonSumType"
                                class="form-control input-sm"
                                required
                        <%--onchange="fn_payType"--%>>
                        </sbux-select>
                    </td>
                    <td style="border-right: hidden;"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">출력구분</th>
                    <td colspan="4" class="td_input inpt_data_reqed">
                        <sbux-radio id="EMP" name="SRCH_PRINT_TYPE" uitype="normal"
                                    text="개인별(소속)" value="EMP" checked>
                        </sbux-radio>
                        <sbux-radio id="DEPT" name="SRCH_PRINT_TYPE" uitype="normal"
                                    text="소속부서별" value="DEPT">
                        </sbux-radio>
                        <sbux-radio id="EMP_COST" name="SRCH_PRINT_TYPE" uitype="normal"
                                    text="개인별(귀속)" value="EMP_COST">
                        </sbux-radio>
                        <sbux-radio id="COST_DEPT" name="SRCH_PRINT_TYPE" uitype="normal"
                                    text="귀속부서별" value="COST_DEPT">
                        </sbux-radio>
                    </td>
                    <th scope="row" class="th_bg_search" style="display: none">근무지</th>
                    <td colspan="3" class="td_input" style="display: none">
                        <sbux-select
                                id="SRCH_WORK_REGION_CODE"
                                uitype="single"
                                jsondata-ref="jsonWorkRegionCode"
                                unselected-text="선택"
                                class="form-control input-sm"
                                required
                        ></sbux-select>
                    </td>
                    <td colspan="11" style="border-right: hidden;"></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
                <li>
                    <span>급여대장</span>
                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                </li>
            </ul>
        </div>
        <div>
            <div id="sb-area-gvwInfo" style="height:480px; width:100%;"></div>
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
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    //grid 초기화
    var gvwInfoGrid; 			// 그리드를 담기위한 객체 선언
    var jsonInfoList = []; 	    // 그리드의 참조 데이터 주소 선언

    var jsonSiteCode = []; //사업장 ( L_ORG001 )SRCH_SITE_CODE, 	SITE_CODE
    var jsonPayType = []; //지급구분 ( L_HRB008 )SRCH_PAY_TYPE, 	PAY_TYPE
    var jsonPayDate = []; //지급일자 ( L_HRP027 )SRCH_PAY_DATE
    var jsonJobGroup = []; //직군 ( L_HRI047 )SRCH_JOB_GROUP
    var jsonSumType = []; //소급구분 ( L_HRP041 )SRCH_SUM_TYPE
    var jsonWorkRegionCode = []; //근무지 ( L_HRI999 )SRCH_WORK_REGION_CODE
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )SRCH_PAY_AREA_TYPE
    var jsonEmpType = []; //사원구분 ( L_HRI008 )EMP_TYPE [gvwInfoGrid]
    var jsonDutyCode = []; //사원구분 ( L_HRI003 )DUTY_CODE [gvwInfoGrid]
    var jsonLaborCostGroup = []; //인건비 ( L_HRI007 )LABOR_COST_GROUP [gvwInfoGrid]
    var jsonJobRank = []; //직급 ( L_HRI005 )JOB_RANK [gvwInfoGrid]


    var jsonPositionCode = []; //직위 ( L_HRI002 )POSITION_CODE
    var jsonPayItemCode = []; //급여항목 ( L_HRP011 )PAY_ITEM_CODE
    var jsonPayItemCode2 = []; //공제항목 ( L_HRP012 )PAY_ITEM_CODE

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_TYPE','gvwInfoGrid'], jsonPayType, 'L_HRB008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            //gfnma_setComSelect(['SRCH_PAY_DATE'], jsonPayDate, 'L_HRP027', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_DATE', 'PAY_DATE2', 'Y', ''),
            gfnma_setComSelect(['SRCH_JOB_GROUP'], jsonJobGroup, 'L_HRI047', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['SRCH_SUM_TYPE'], jsonSumType, 'L_HRP041', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['SRCH_WORK_REGION_CODE'], jsonWorkRegionCode, 'L_HRI999', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonEmpType, 'L_HRI008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonLaborCostGroup, 'L_HRI007', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),

            gfnma_setComSelect(['gvwInfoGrid'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
           /* gfnma_setComSelect(['gvwPayGrid'], jsonPayItemCode, 'L_HRP011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SLRY_ITEM_CD', 'SLRY_ITEM_NM', 'Y', ''),
            gfnma_setComSelect(['gvwDedGrid'], jsonPayItemCode2, 'L_HRP012', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SLRY_ITEM_CD', 'SLRY_ITEM_NM', 'Y', ''),
*/

            //지급구분
            gfnma_multiSelectInit({
                target			: ['#SRCH_SITE_CODE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_ORG001'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SITE_CD'
                ,colLabel		: 'SITE_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SITE_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'SITE_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

            //부서(실)
            gfnma_multiSelectInit({
                target			: ['#SRCH_PARENT_DEPT01']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_ORG910'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'DEPT_CD'
                ,colLabel		: 'DEPT_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'DEPT_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'DEPT_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

            //부서(팀)
            gfnma_multiSelectInit({
                target			: ['#SRCH_PARENT_DEPT02']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_ORG911'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'DEPT_CD'
                ,colLabel		: 'DEPT_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'DEPT_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'DEPT_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

        ]);
    }

    var fn_compopup1 = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: ["", 				searchText,		""]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["BGNG_YMD",	"SITE_NM", 	"DEPT_NM",  	"SITE_CD"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_DEPT_NAME',  data.DEPT_NM);
                SBUxMethod.set('SRCH_DEPT_CODE',  data.DEPT_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {

        var searchText = gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 = "_EMP_CD_";
        var replaceText1 = searchText;
        var replaceText2 = "_DEPT_CD_";
        var replaceText3 = "_DEPT_NM_";
        var replaceText4 = "_EMP_STTS_";
        var strWhereClause = "AND x.EMP_CD LIKE '%" + replaceText0 + "%' AND x.EMP_NM LIKE '%" + replaceText1 + "%' AND x.DEPT_CD LIKE '%"+replaceText2
            + "%' AND x.DEPT_NM LIKE '%" + replaceText3 +  "%' AND x.EMP_STTS LIKE '%"+replaceText4+"%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_HRI001'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions:    ["부서코드"    , "부서명"     , "사원코드"    ,"사원명"     ,"재직상태"]
            , searchInputFields: ["DEPT_CD"  , "DEPT_NM", "EMP_CD"   ,"EMP_NM"  ,"EMP_STTS"]
            , searchInputValues: [""           , ""         ,""             ,searchText         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CD"  , "EMP_NM"  , "DEPT_NM"   ,"SITE_NM"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NM);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CD);
            },
        });

    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        let openDate = gfn_dateToYm(new Date());

        SBUxMethod.set('SRCH_PAY_YYYYMM', openDate);

        fn_createGrid();
    }

    /**
     * 지급일자 조회
     */
    var fn_payDate = function() {

        let PAY_YYYYMM      = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM"));   //귀속년월
        let PAY_TYPE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE"));     //지급구분
        let PAY_AREA_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역

        let V_P_WHERE_CLAUSE = "AND SITE_CD IN (SELECT SITE_CD FROM TB_ORG_SITE WHERE CO_CD ='"+gv_ma_selectedCorpCd+ "') AND SLRY_YM = '"
            + PAY_YYYYMM + "' AND SLRY_TYPE = '" + PAY_TYPE + "'AND SLRY_AREA_TYPE ='" + PAY_AREA_TYPE + "'";

        gfnma_setComSelect(['SRCH_PAY_DATE'], jsonPayDate, 'L_HRP027', V_P_WHERE_CLAUSE, gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_YMD', 'SLRY_YMD2', 'Y', '');

    }
    // 신규
    /*  function cfn_add() {
          fn_create();
      }*/
    /* // 저장
     function cfn_save() {
         fn_save();
     }*/
    // 삭제
    /*function cfn_del() {
        fn_delete();
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
        SBUxMethod.refresh('SRCH_SUM_TYPE');
        SBUxMethod.refresh('SRCH_PAY_AREA_TYPE');
    }

    var columns1 = [
        {caption: ['급여년월'], ref: 'PAY_YYYYMM', width:'140px',	type: 'inputdate', style: 'text-align: center', sortable: false,
            format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
        {caption : ["사업장"], ref : 'SITE_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
            typeinfo : {ref : 'jsonSiteCode',  label : 'label', value : 'value'}
        },
        {caption: ["담당"], ref: 'PARENT_PARENT_DEPT_NAME', type: 'output', width: '140px', style: 'text-align:left'},
        {caption: ["실"], ref: 'PARENT_DEPT_NAME', type: 'output', width: '140px', style: 'text-align:left'},
        {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '140px', style: 'text-align:left'},
        {caption: ["부서"], ref: 'DEPT_NAME', type: 'output', width: '140px', style: 'text-align:left'},
        {caption: ["귀속부서코드(코스트센터)"], ref: 'COST_DEPT_CODE', type: 'output', width: '140px', style: 'text-align:left'},
        {caption: ["귀속부서명(코스트센터)"], ref: 'COST_DEPT_NAME', type: 'output', width: '140px', style: 'text-align:left'},
        {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '140px', style: 'text-align:left'},
        {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '140px', style: 'text-align:left'},
        {caption: ["주민등록번호"], ref: 'SOCIAL_NUM_RAEL', type: 'output', width: '140px', style: 'text-align:left', hidden: true},
        {caption : ["직군"], ref : 'JOB_GROUP', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
            typeinfo : {ref : 'jsonJobGroup',  label : 'label', value : 'value'}
        },
        {caption : ["사원구분"], ref : 'EMP_TYPE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
            typeinfo : {ref : 'jsonEmpType',  label : 'label', value : 'value'}
        },
        {caption : ["직위"], ref : 'POSITION_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
            typeinfo : {ref : 'jsonPositionCode',  label : 'label', value : 'value'}
        },
        {caption : ["직책"], ref : 'DUTY_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
            typeinfo : {ref : 'jsonDutyCode',  label : 'label', value : 'value'}
        },
        {caption: ["지급구분"], ref: 'PAY_TYPE', type: 'output', width: '140px', style: 'text-align:left'},
        {caption: ['입사일'], ref: 'ENTER_DATE', width:'140px',	type: 'inputdate', style: 'text-align: center', sortable: false,
            format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
        {caption: ['퇴직일'], ref: 'RETIRE_DATE', width:'140px',	type: 'inputdate', style: 'text-align: center', sortable: false,
            format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
        {caption: ["근무지"], ref: 'WORK_REGION_NAME', type: 'output', width: '140px', style: 'text-align:left'},
        {caption: ["급여총액"], ref: 'PAY_TOTAL_AMT', type: 'output', width: '140px', style: 'text-align:right'
            ,  format : { type:'number' , rule:'#,###', emptyvalue:'0'}},
        {caption: ["비과세총액"], ref: 'TAX_FREE_AMT', type: 'output', width: '140px', style: 'text-align:right'
            ,  format : { type:'number' , rule:'#,###', emptyvalue:'0'}},
        {caption: ["공제총액"], ref: 'PAY_DEDUCTION_AMT', type: 'output', width: '140px', style: 'text-align:right'
            ,  format : { type:'number' , rule:'#,###', emptyvalue:'0'}},
        {caption: ["실지급액"], ref: 'PAY_NET_AMT', type: 'output', width: '140px', style: 'text-align:right'
            ,  format : { type:'number' , rule:'#,###', emptyvalue:'0'}},
        {caption : ["인건비"], ref : 'LABOR_COST_GROUP', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
            typeinfo : {ref : 'jsonLaborCostGroup',  label : 'label', value : 'value'}
        },
        {caption : ["직급"], ref : 'JOB_RANK', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
            typeinfo : {ref : 'jsonJobRank',  label : 'label', value : 'value'}
        },
        {caption: ["social_num"], ref: 'SOCIAL_NUM', type: 'output', width: '140px', style: 'text-align:left', hidden: true},
        {caption: ["호봉"], ref: 'HOBONG', type: 'output', width: '140px', style: 'text-align:left'},
        {caption: ["코스트센터명"], ref: 'COST_DEPT_NAME', type: 'output', width: '140px', style: 'text-align:left', hidden: true},
        {caption: ["코스트센터"], ref: 'COST_DEPT_CODE', type: 'output', width: '140px', style: 'text-align:left', hidden: true},
    ];

    /* var sumCol = [19,20,21,22];*/


    //급여내역 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.frozenbottomrows 	= 1;
        /* SBGridProperties.total = {
             type 		: 'grand',
             position	: 'bottom',
             columns		: {
                 standard : [0],
                 sum : sumCol
             },
             subtotalrow : {
                 1: {
                     titlecol: 0,
                     titlevalue: '합계',
                     style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                     stylestartcol: 0
                 },
             },
             grandtotalrow : {
                 titlecol 	: 0,
                 titlevalue	: '합계',
                 style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                 stylestartcol	: 0
             },
             datasorting	: false,
             usedecimal : false,
         };*/
        SBGridProperties.columns = [];

        columns1.forEach((col) => {
            SBGridProperties.columns.push(col);
        });

        gvwInfoGrid = _SBGrid.create(SBGridProperties);

    }



    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let SITE_CODE	        = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));//사업장
        let PAY_AREA_TYPE       = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let PARENT_DEPT01	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_PARENT_DEPT01'));//부서(실)
        let PAY_YYYYMM          = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); //귀속년월
        let PAY_TYPE            = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_DATE            = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); //지급일자
        let PARENT_DEPT02	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_PARENT_DEPT02'));//부서(팀)
        let DEPT_CODE           = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE            = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원
        let JOB_GROUP           = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP")); //직군
        let SUM_TYPE            = gfn_nvl(SBUxMethod.get("SRCH_SUM_TYPE")); //소급구분
        let PRINT_TYPE          = gfn_nvl(SBUxMethod.get("SRCH_PRINT_TYPE")); //출력구분
        let WORK_REGION_CODE    = gfn_nvl(SBUxMethod.get("SRCH_WORK_REGION_CODE")); //근무지


        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일자");
            return;
        }
        if (!PRINT_TYPE) {
            gfn_comAlert("W0002", "출력구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_PAY_YYYYMM         : PAY_YYYYMM
            ,V_P_PAY_TYPE           : PAY_TYPE
            ,V_P_PAY_DATE           : PAY_DATE
            ,V_P_SITE_CODE          : SITE_CODE

            ,V_P_PARENT_DEPT01	    : PARENT_DEPT01
            ,V_P_PARENT_DEPT02	    : PARENT_DEPT02

            ,V_P_DEPT_CODE          : DEPT_CODE
            ,V_P_EMP_CODE           : EMP_CODE
            ,V_P_WORK_REGION_CODE   : WORK_REGION_CODE
            ,V_P_JOB_GROUP          : JOB_GROUP
            ,V_P_PRINT_TYPE         : PRINT_TYPE   //'10' -- '10' : 개인별, '20' : 팀별
            ,V_P_PAY_AREA_TYPE      : PAY_AREA_TYPE
            ,V_P_SUM_TYPE           : SUM_TYPE   //--소급구분자 20171130 추가

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/rep/selectHrp2420List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '9',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                // -- 2. 동적 항목(급여항목) 코드 리스트
                await data.cv_2.forEach((item, index) => {

                    let PAY_ITEM_NAME       = gfn_nvl(item.SLRY_ITEM_NM);
                    let PAY_ITEM_CODE       = gfn_nvl(item.SLRY_ITEM_CD);
                    let PAY_ITEM_CATEGORY   = gfn_nvl(item.SLRY_ITEM_CTGRY);

                    if (PAY_ITEM_NAME != '' && PAY_ITEM_CODE != '' && PAY_ITEM_CATEGORY != ''){

                        const columns = {
                            caption: [PAY_ITEM_NAME],
                            ref: PAY_ITEM_CODE + PAY_ITEM_CATEGORY,
                            type: 'output',
                            width: '100px',
                            style: 'text-align:right'
                            ,format : { type:'number', rule:'#,###', emptyvalue:'0'}
                        };
                        columns1.push(columns);
                    }

                });

                fn_createGrid();

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonInfoList.length = 0;
                data.cv_1.forEach((item, index) => {

                    let DEPT_CODE   = gfn_nvl(item.DEPT_CD);
                    let EMP_CODE    = gfn_nvl(item.EMP_CD);

                    const msg = {
                        SITE_CODE               : gfn_nvl(item.SITE_CD),
                        PAY_YYYYMM              : gfn_nvl(item.SLRY_YM),
                        PARENT_PARENT_DEPT_NAME : gfn_nvl(item.PARENT_PARENT_DEPT_NAME),
                        PARENT_DEPT_NAME        : gfn_nvl(item.PARENT_DEPT_NAME),
                        DEPT_CODE               : gfn_nvl(item.DEPT_CD),
                        DEPT_NAME               : gfn_nvl(item.DEPT_NM),
                        EMP_CODE                : gfn_nvl(item.EMP_CD),
                        EMP_NAME                : gfn_nvl(item.EMP_NM),
                        SOCIAL_NUM              : gfn_nvl(item.RRNO_ENCPT),
                        SOCIAL_NUM_REAL         : gfn_nvl(item.SOCIAL_NUM_REAL),
                        PAY_TYPE                : gfn_nvl(item.SLRY_TYPE),
                        POSITION_CODE           : gfn_nvl(item.JBPS_CD),
                        DUTY_CODE               : gfn_nvl(item.JBTTL_CD),
                        ENTER_DATE              : gfn_nvl(item.JNCMP_YMD),
                        RETIRE_DATE             : gfn_nvl(item.RTRM_YMD),
                        TEMP_END_DATE           : gfn_nvl(item.TMPR_END_YMD),
                        WORK_REGION_CODE        : gfn_nvl(item.WORK_RGN_CD),
                        WORK_REGION_NAME        : gfn_nvl(item.WORK_RGN_NM),
                        PAY_TOTAL_AMT           : gfn_nvl(item.SLRY_TOT_AMT) == '' ? 0 : item.SLRY_TOT_AMT,
                        TAX_FREE_AMT            : gfn_nvl(item.TX_TXFR_AMT) == '' ? 0 : item.TX_TXFR_AMT,
                        PAY_DEDUCTION_AMT       : gfn_nvl(item.SLRY_DDC_AMT) == '' ? 0 : item.SLRY_DDC_AMT,
                        PAY_NET_AMT             : gfn_nvl(item.PAY_ACTL_AMT) == '' ? 0 : item.PAY_ACTL_AMT,
                        DEPT_CODE_SEQ           : gfn_nvl(item.DEPT_CODE_SEQ),
                        POSITION_CODE_SEQ       : gfn_nvl(item.POSITION_CODE_SEQ),
                        LABOR_COST_GROUP        : gfn_nvl(item.LBRCO_GROUP),
                        SALARY_CLASS            : gfn_nvl(item.SLRCL_NM),
                        JOB_RANK                : gfn_nvl(item.JBGD_CD),
                        HOBONG                  : gfn_nvl(item.HOBONG),
                        COST_DEPT_CODE          : gfn_nvl(item.CSTCT_CD),
                        COST_DEPT_NAME          : gfn_nvl(item.CSTCT_NM),
                        EMP_TYPE                : gfn_nvl(item.EMP_TYPE),
                        EMP_TYPE_NAME           : gfn_nvl(item.EMP_TYPE_NAME),
                        JOB_GROUP               : gfn_nvl(item.JOB_GROUP),
                        JOB_GROUP_NAME          : gfn_nvl(item.JOB_GROUP_NM),

                    }

                    // -- 3. 동적 항목(급여항목) 데이터 리스트
                    data.cv_3.forEach((item1, index) => {

                        let DEPT_CODE_VAL   = gfn_nvl(item1.DEPT_CD);
                        let EMP_CODE_VAL    = gfn_nvl(item1.EMP_CD);

                        if (DEPT_CODE != '' && EMP_CODE != '' && DEPT_CODE_VAL != '' && EMP_CODE_VAL != '' &&
                            _.isEqual(DEPT_CODE, DEPT_CODE_VAL) && _.isEqual(EMP_CODE, EMP_CODE_VAL)){

                            let PAY_ITEM_CODE       = gfn_nvl(item1.SLRY_ITEM_CD);
                            let PAY_ITEM_CATEGORY   = gfn_nvl(item1.SLRY_ITEM_CTGRY);
                            let REF_NAME = PAY_ITEM_CODE + PAY_ITEM_CATEGORY;

                            if (PAY_ITEM_CODE != '' && PAY_ITEM_CATEGORY != ''){
                                msg[REF_NAME] = gfn_nvl(item1.PAY_AMT) == '' ? 0 : item1.PAY_AMT;
                            }

                        }

                    });
                    jsonInfoList.push(msg);
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

    const downloadJSON = async ({ data, fileName ,fileType }) => {

        const blob = new Blob([data], { type: fileType });

        const link = document.createElement('a');
        link.download = fileName;
        link.href = await URL.createObjectURL(blob);

        const clickEvt = new MouseEvent('click', {
            view: window,
            bubbles: true,
            cancelable: true,
        });
        link.dispatchEvent(clickEvt);
        link.remove();
    };
    /**
     * 출력
     */
    const fn_btnPrint = async function () {

        let PRINT_TYPE          = gfn_nvl(SBUxMethod.get("SRCH_PRINT_TYPE")); //출력구분
        let gvwInfoGridRows 	= gvwInfoGrid.getRows();
        let conn = '';

        if (gvwInfoGridRows <= 1) {
            return;
        }

        conn = await fn_getReportData();
        conn = await fn_setReportData(conn);
        conn = await gfnma_convertDataForReport(conn);
        if (PRINT_TYPE == "EMP" || PRINT_TYPE == "EMP_COST"  ) {
            gfn_popClipReportPost("급여대장", "ma/RPT_HRP2425_EMP.crf", null, conn );

        } else if(PRINT_TYPE == "DEPT" || PRINT_TYPE == "COST_DEPT" ) {
            gfn_popClipReportPost("급여대장", "ma/RPT_HRP2425_DEPT.crf", null, conn );

        }
    }

    const fn_getReportData = async function(){

        let SITE_CODE	        = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));//사업장
        let PAY_AREA_TYPE       = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let PARENT_DEPT01	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_PARENT_DEPT01'));//부서(실)
        let PAY_YYYYMM          = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM")); //귀속년월
        let PAY_TYPE            = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_DATE            = gfn_nvl(SBUxMethod.get("SRCH_PAY_DATE")); //지급일자
        let PARENT_DEPT02	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_PARENT_DEPT02'));//부서(팀)
        let DEPT_CODE           = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE            = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원
        let JOB_GROUP           = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP")); //직군
        let SUM_TYPE            = gfn_nvl(SBUxMethod.get("SRCH_SUM_TYPE")); //소급구분
        let PRINT_TYPE          = gfn_nvl(SBUxMethod.get("SRCH_PRINT_TYPE")); //출력구분
        let WORK_REGION_CODE    = gfn_nvl(SBUxMethod.get("SRCH_WORK_REGION_CODE")); //근무지

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_PAY_YYYYMM         : PAY_YYYYMM
            ,V_P_PAY_TYPE           : PAY_TYPE
            ,V_P_PAY_DATE           : PAY_DATE
            ,V_P_SITE_CODE          : SITE_CODE

            ,V_P_PARENT_DEPT01	    : PARENT_DEPT01
            ,V_P_PARENT_DEPT02	    : PARENT_DEPT02

            ,V_P_DEPT_CODE          : DEPT_CODE
            ,V_P_EMP_CODE           : EMP_CODE
            ,V_P_WORK_REGION_CODE   : WORK_REGION_CODE
            ,V_P_JOB_GROUP          : JOB_GROUP
            ,V_P_PRINT_TYPE         : PRINT_TYPE   //'10' -- '10' : 개인별, '20' : 팀별
            ,V_P_PAY_AREA_TYPE      : PAY_AREA_TYPE
            ,V_P_SUM_TYPE           : SUM_TYPE   //--소급구분자 20171130 추가

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/rep/selectHrp2420Report.do", {
            getType				: 'json',
            workType			: 'REPORT',
            cv_count			: '9',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
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

        return data;
    }

    const fn_setReportData = async function(data){
        //결재라인 데이터가 없으면 보이지 않게하기 위해 데이터 널값 추가함
        if(data.cv_4.length == 0){
            data.cv_4[0] = { WF_DISP_TITLE : "null"};
        }

        //리포트 내에 페이지 헤더에 들어가는 커서에 리스트가 여러개가 있으면 그 수 만큼 페이지 헤더가 반복되기 때문에 한개의 리스트로 수정
        //cv_10은 프로시저에 없는 커서여서 cv_10으로 추가
        let obj = {};
        let key = '';
        let value = '';
        data.cv_6.forEach((item, index) => {
            key = item.PAY_CODE;
            value = item.PAY_ITEM_NAME;
            obj[key] = value;
        })
        //cv_10 생성
        if (!Array.isArray(data.cv_10)) {
            data.cv_10 = [];
        }
        data.cv_10[0] = obj;

        return data;
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
