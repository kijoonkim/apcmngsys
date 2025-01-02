<%
    /**
     * @Class Name        : hra5200.jsp
     * @Description       : 퇴직소득원천징수영수증 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.07.23
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.23   	표주완		최초 생성
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
    <title>title : 퇴직소득원천징수영수증</title>
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

        <!--[pp] 검색 -->
        <!--[APC] START -->
        <div class="">
            <!--         <div class="box-search-ma"> -->
            <div style="padding-left: 500px; padding-right: 500px; padding-top: 250px; padding-bottom: 250px">
                <div style="display: none">
                    <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                </div>
                <table id="dataArea1" class="table table-bordered tbl_fixed table-search-ma">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 7%">
                        <col style="width: 6%">
                        <col style="width: 1%">
                        <col style="width: 4%">
                        <col style="width: 2%">
                        <col style="width: 6%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row" class="th_bg">정산일자</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="RETIRE_CALC_DATE_FR"
                                    name="RETIRE_CALC_DATE_FR"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="table-datepicker-ma inpt_data_reqed"
                                    required>
                                <%--onchange="fn_payDate"--%>
                            </sbux-datepicker>
                        </td>
                        <td>~</td>
                        <td colspan="2" class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="RETIRE_CALC_DATE_TO"
                                    name="RETIRE_CALC_DATE_TO"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="table-datepicker-ma inpt_data_reqed"
                                    required>
                                <%--onchange="fn_payDate"--%>
                            </sbux-datepicker>
                        </td>
                        <td style="border-right: hidden;">&nbsp;</td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">정산구분</th>
                        <td class="td_input" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
                                        type="button" id="RET_CALC_TYPE" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="RET_CALC_TYPE"
                                     style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td colspan="4" style="border-right: hidden;">&nbsp;</td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">법인</th>
                        <td colspan="5" class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="COMP_CODE"
                                    name="COMP_CODE"
                                    class="form-control input-sm inpt_data_reqed"
                                    jsondata-ref="jsonCompCode"
                                    readonly
                            />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">사업장</th>
                        <td colspan="5" class="td_input" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
                                        type="button" id="SITE_CODE" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="SITE_CODE"
                                     style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">부서</th>
                        <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                            <sbux-input
                                    uitype="text"
                                    id="DEPT_CODE"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td colspan="2" class="td_input" style="border-right: hidden;" data-group="DEPT">
                            <sbux-input
                            <%-- uitype="hidden"--%>
                                    uitype="text"
                                    id="DEPT_NAME"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_compopup1"
                            ></sbux-button>
                        </td>
                        <td style="border-right: hidden;">&nbsp;</td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">사원</th>
                        <td class="td_input" style="border-right: hidden;" data-group="EMP">
                            <sbux-input
                                    uitype="text"
                                    id="EMP_CODE"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td colspan="2" class="td_input" style="border-right: hidden;" data-group="EMP">
                            <sbux-input
                            <%-- uitype="hidden"--%>
                                    uitype="text"
                                    id="EMP_FULL_NAME"
                                    class="form-control input-sm"
                            ></sbux-input>
                        </td>
                        <td class="td_input" style="border-right: hidden;" data-group="EMP">
                            <sbux-button
                                    class="btn btn-xs btn-outline-dark"
                                    text="…" uitype="modal"
                                    target-id="modal-compopup1"
                                    onclick="fn_compopup2"
                            ></sbux-button>
                        </td>
                        <td style="border-right: hidden;">&nbsp;</td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">출력유형</th>
                        <td class="td_input" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:160px;text-align:left"
                                        class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button"
                                        id="PRINT_TYPE" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="PRINT_TYPE"
                                     style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td colspan="4" style="border-right: hidden;">&nbsp;</td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">지급일자</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-datepicker
                                    id="PAY_DATE"
                                    name="PAY_DATE"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="table-datepicker-ma"
                                    required>
                                <%--onchange="fn_payDate"--%>
                            </sbux-datepicker>
                        </td>
                        <td colspan="4" style="border-right: hidden;">&nbsp;</td>
                    </tr>
                    </tbody>
                </table>
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



    var jsonCompCode = []; //통화 ( L_ORG000 )COMP_CODE

    var jsonReportList = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['COMP_CODE'], jsonCompCode, 'L_ORG000', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CO_CD', 'CORP_NM', 'Y', ''),

            //정산구분
            gfnma_multiSelectInit({
                target			: ['#RET_CALC_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA037'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

            //사업장
            gfnma_multiSelectInit({
                target			: ['#SITE_CODE']
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

            //정산구분
            gfnma_multiSelectInit({
                target			: ['#PRINT_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA026'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),



        ]);

        SBUxMethod.set('COMP_CODE', gv_ma_selectedCorpCd);
        gfnma_multiSelectSet('#PRINT_TYPE', 'SBSD_CD', 'CD_NM', 20);
    }

    /**
     * 공통팝업3
     */
    var fn_compopup1 = function() {

        var searchText 		= gfn_nvl(SBUxMethod.get("DEPT_NAME"));

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
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"     ,   "100"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('DEPT_NAME', data.DEPT_NM);
                SBUxMethod.set('DEPT_CODE', data.DEPT_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {

        var searchText = gfn_nvl(SBUxMethod.get("EMP_FULL_NAME"));
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
                SBUxMethod.set('EMP_FULL_NAME', data.EMP_NM);
                SBUxMethod.set('EMP_CODE',      data.EMP_CD);
            },
        });

    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        let openDate = gfn_dateToYmd(new Date());

        SBUxMethod.set('RETIRE_CALC_DATE_FR', openDate);
        SBUxMethod.set('RETIRE_CALC_DATE_TO', openDate);


    }


    /**
     * 조회 ??
     */
    function cfn_search() {
        //fn_search();
    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let RET_DATE_FR     = gfnma_nvl2(SBUxMethod.get("RETIRE_CALC_DATE_FR")); //정산일자
        let RET_DATE_TO     = gfnma_nvl2(SBUxMethod.get("RETIRE_CALC_DATE_TO")); //정산일자
        let RET_CALC_TYPE	= gfnma_multiSelectGet('#RET_CALC_TYPE');//정산구분
        let SITE_CODE	    = gfnma_multiSelectGet('#SITE_CODE');//사업장
        let DEPT_CODE       = gfnma_nvl2(SBUxMethod.get("DEPT_CODE")); //부서
        let EMP_CODE        = gfnma_nvl2(SBUxMethod.get("EMP_CODE")); //사원
        let PRINT_TYPE      = gfnma_multiSelectGet('#PRINT_TYPE');//출력유형
        let PAY_DATE        = gfnma_nvl2(SBUxMethod.get("PAY_DATE")); //지급일자

        if (!PRINT_TYPE) {
            gfn_comAlert("W0002", "출력유형");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedCorpCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_RET_CALC_DAT_FR : RET_DATE_FR
            ,V_P_RET_CALC_DAT_TO : RET_DATE_TO
            ,V_P_RET_CALC_TYPE   : RET_CALC_TYPE
            ,V_P_SITE_CODE       : SITE_CODE
            ,V_P_DEPT_CODE       : DEPT_CODE
            ,V_P_EMP_CODE        : EMP_CODE
            ,V_P_PRINT_TYPE      : PRINT_TYPE
            ,V_P_PAY_DATE        : PAY_DATE

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/ret/selectHra5200List.do", {
            getType: 'json',
            workType: 'REPORT',
            cv_count: '2',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                jsonReportList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        LIVE_YN                         : gfnma_nvl2(item.LIVE_YN),
                        FOREIGNER_YN                    : gfnma_nvl2(item.FOREIGNER_YN),
                        NATION_NAME                     : gfnma_nvl2(item.NATION_NAME),
                        BIZ_REGNO                       : gfnma_nvl2(item.BIZ_REGNO),
                        COMP_NAME                       : gfnma_nvl2(item.COMP_NAME),
                        CEO_NAME                        : gfnma_nvl2(item.CEO_NAME),
                        COMP_REGNO                      : gfnma_nvl2(item.COMP_REGNO),
                        ADDRESS                         : gfnma_nvl2(item.ADDRESS),
                        EMP_NAME                        : gfnma_nvl2(item.EMP_NAME),
                        SOCIAL_NUM                      : gfnma_nvl2(item.SOCIAL_NUM),
                        SOCIAL_NUM_REAL                 : gfnma_nvl2(item.SOCIAL_NUM_REAL),
                        RESIDENCE_ADDRESS               : gfnma_nvl2(item.RESIDENCE_ADDRESS),
                        EXEC_YN                         : gfnma_nvl2(item.EXEC_YN),
                        RET_PENS_ST_DAT                 : gfnma_nvl2(item.RET_PENS_ST_DAT),
                        EXEC_RET_PAY_AMT                : gfnma_nvl2(item.EXEC_RET_PAY_AMT),
                        JOB_ST_DAT                      : gfnma_nvl2(item.JOB_ST_DAT),
                        JOB_END_DAT                     : gfnma_nvl2(item.JOB_END_DAT),
                        RET_REASON                      : gfnma_nvl2(item.RET_REASON),
                        PREV_COM_NAME                   : gfnma_nvl2(item.PREV_COM_NAME),
                        PREV_COM_NUM                    : gfnma_nvl2(item.PREV_COM_NUM),
                        PREV_RETIRE_INC_AMT             : gfnma_nvl2(item.PREV_RETIRE_INC_AMT),
                        PREV_TAX_FREE_RETIRE_INC_AMT    : gfnma_nvl2(item.PREV_TAX_FREE_RETIRE_INC_AMT),
                        PREV_TAX_RETIRE_INC_AMT         : gfnma_nvl2(item.PREV_TAX_RETIRE_INC_AMT),
                        //-- 근무처명, 사업자등록번호 위와 동일
                        RET_INC_AMT                     : gfnma_nvl2(item.RET_INC_AMT),
                        TXFREE_RET_INC_AMT              : gfnma_nvl2(item.TXFREE_RET_INC_AMT),
                        TX_RET_INC_AMT                  : gfnma_nvl2(item.TX_RET_INC_AMT),
                        TOT_RET_INC_AMT                 : gfnma_nvl2(item.TOT_RET_INC_AMT),
                        TOT_TXFREE_RET_INC_AMT          : gfnma_nvl2(item.TOT_TXFREE_RET_INC_AMT),
                        TOT_TX_RET_INC_AMT              : gfnma_nvl2(item.TOT_TX_RET_INC_AMT),
                        PREV_ENTER_DAT                  : gfnma_nvl2(item.PREV_ENTER_DAT),
                        PREV_RET_INITIAL_DAT            : gfnma_nvl2(item.PREV_RET_INITIAL_DAT),
                        PREV_RET_DAT                    : gfnma_nvl2(item.PREV_RET_DAT),
                        PREV_RET_PAY_DATE               : gfnma_nvl2(item.PREV_RET_PAY_DATE),
                        PREV_WORKING_MM_CNT             : gfnma_nvl2(item.PREV_WORKING_MM_CNT),
                        PREV_EXCP_MM_CNT                : gfnma_nvl2(item.PREV_EXCP_MM_CNT),
                        PREV_ADD_MM_CNT                 : gfnma_nvl2(item.PREV_ADD_MM_CNT),
                        PREV_WORKING_YEAR_CNT           : gfnma_nvl2(item.PREV_WORKING_YEAR_CNT),
                        ENTER_DAT                       : gfnma_nvl2(item.ENTER_DAT),
                        CALC_ST_DAT                     : gfnma_nvl2(item.CALC_ST_DAT),
                        RET_DAT                         : gfnma_nvl2(item.RET_DAT),
                        PAY_DATE                        : gfnma_nvl2(item.PAY_DATE),
                        WORKING_MM_CNT                  : gfnma_nvl2(item.WORKING_MM_CNT),
                        EXCP_MM_CNT                     : gfnma_nvl2(item.EXCP_MM_CNT),
                        ADD_MM_CNT                      : gfnma_nvl2(item.ADD_MM_CNT),
                        WORKING_YEAR_CNT                : gfnma_nvl2(item.WORKING_YEAR_CNT),
                        TOT_CALC_ST_DAT                 : gfnma_nvl2(item.TOT_CALC_ST_DAT),
                        TOT_RET_DAT                     : gfnma_nvl2(item.TOT_RET_DAT),
                        TOT_WORKING_MM_CNT              : gfnma_nvl2(item.TOT_WORKING_MM_CNT),
                        TOT_EXCP_MM_CNT                 : gfnma_nvl2(item.TOT_EXCP_MM_CNT),
                        TOT_ADD_MM_CNT                  : gfnma_nvl2(item.TOT_ADD_MM_CNT),
                        TOT_OVERLAP_MM_CNT              : gfnma_nvl2(item.TOT_OVERLAP_MM_CNT),
                        TOT_WORKING_YEAR_CNT            : gfnma_nvl2(item.TOT_WORKING_YEAR_CNT),
                        TOT_CALC_ST_DAT_BEF             : gfnma_nvl2(item.TOT_CALC_ST_DAT_BEF),
                        TOT_RET_DAT_BEF                 : gfnma_nvl2(item.TOT_RET_DAT_BEF),
                        TOT_WORKING_MM_CNT_BEF          : gfnma_nvl2(item.TOT_WORKING_MM_CNT_BEF),
                        TOT_EXCP_MM_CNT_BEF             : gfnma_nvl2(item.TOT_EXCP_MM_CNT_BEF),
                        TOT_ADD_MM_CNT_BEF              : gfnma_nvl2(item.TOT_ADD_MM_CNT_BEF),
                        TOT_WORKING_YEAR_CNT_BEF        : gfnma_nvl2(item.TOT_WORKING_YEAR_CNT_BEF),
                        TOT_CALC_ST_DAT_AFT             : gfnma_nvl2(item.TOT_CALC_ST_DAT_AFT),
                        TOT_RET_DAT_AFT                 : gfnma_nvl2(item.TOT_RET_DAT_AFT),
                        TOT_WORKING_MM_CNT_AFT          : gfnma_nvl2(item.TOT_WORKING_MM_CNT_AFT),
                        TOT_EXCP_MM_CNT_AFT             : gfnma_nvl2(item.TOT_EXCP_MM_CNT_AFT),
                        TOT_ADD_MM_CNT_AFT              : gfnma_nvl2(item.TOT_ADD_MM_CNT_AFT),
                        TOT_WORKING_YEAR_CNT_AFT        : gfnma_nvl2(item.TOT_WORKING_YEAR_CNT_AFT),
                        // --퇴직소득과세표준계산(2015.12.31 이전 계산방법)
                        PREV_RET_PAY_AMT                : gfnma_nvl2(item.PREV_RET_PAY_AMT),
                        RET_PAY_AMT                     : gfnma_nvl2(item.RET_PAY_AMT),
                        TOT_RET_PAY_AMT                 : gfnma_nvl2(item.TOT_RET_PAY_AMT),
                        TOT_RET_FX_R_DEDUCT             : gfnma_nvl2(item.TOT_RET_FX_R_DEDUCT),
                        TOT_WORKING_CNT_DEDUCT          : gfnma_nvl2(item.TOT_WORKING_CNT_DEDUCT),
                        TOT_RET_PAY_TX_STD_AMT          : gfnma_nvl2(item.TOT_RET_PAY_TX_STD_AMT),
                        // --퇴직소득과세표준계산(2016.01.01 이후 계산방법)
                        TOT_RET_PAY_AMT                 : gfnma_nvl2(item.TOT_RET_PAY_AMT),
                        TOT_WORKING_CNT_DE_A63          : gfnma_nvl2(item.TOT_WORKING_CNT_DE_A63),
                        CONV_INC_AMT_2016               : gfnma_nvl2(item.CONV_INC_AMT_2016),
                        CONV_INC_DEDUCT_2016            : gfnma_nvl2(item.CONV_INC_DEDUCT_2016),
                        RET_PAY_TX_STD_AMT_2016         : gfnma_nvl2(item.RET_PAY_TX_STD_AMT_2016),
                        //--퇴직소득세액계산 (2015.12.31 이전 계산방법)
                        RET_PAY_TX_STD_BEF              : gfnma_nvl2(item.RET_PAY_TX_STD_BEF),
                        RET_PAY_TX_STD_AFT              : gfnma_nvl2(item.RET_PAY_TX_STD_AFT),
                        TOT_RET_PAY_TX_STD              : gfnma_nvl2(item.TOT_RET_PAY_TX_STD),
                        ANN_AVG_TX_STD_AMT_BEF          : gfnma_nvl2(item.ANN_AVG_TX_STD_AMT_BEF),
                        ANN_AVG_TX_STD_AMT_AFT          : gfnma_nvl2(item.ANN_AVG_TX_STD_AMT_AFT),
                        TOT_ANN_AVG_TX_STD_AMT          : gfnma_nvl2(item.TOT_ANN_AVG_TX_STD_AMT),
                        CONV_TX_STD_AMT_AFT             : gfnma_nvl2(item.CONV_TX_STD_AMT_AFT),
                        TOT_CONV_TX_STD_AMT             : gfnma_nvl2(item.TOT_CONV_TX_STD_AMT),
                        CONV_CALC_TX_AMT_AFT            : gfnma_nvl2(item.CONV_CALC_TX_AMT_AFT),
                        TOT_CONV_CALC_TX_AMT            : gfnma_nvl2(item.TOT_CONV_CALC_TX_AMT),
                        ANN_AVG_CALC_TX_AMT_BEF         : gfnma_nvl2(item.ANN_AVG_CALC_TX_AMT_BEF),
                        ANN_AVG_CALC_TX_AMT_AFT         : gfnma_nvl2(item.ANN_AVG_CALC_TX_AMT_AFT),
                        TOT_ANN_AVG_CALC_TX_AMT         : gfnma_nvl2(item.TOT_ANN_AVG_CALC_TX_AMT),
                        CALC_TX_AMT_BEF                 : gfnma_nvl2(item.CALC_TX_AMT_BEF),
                        CALC_TX_AMT_AFT                 : gfnma_nvl2(item.CALC_TX_AMT_AFT),
                        TOT_CALC_TX_AMT                 : gfnma_nvl2(item.TOT_CALC_TX_AMT),
                        // --퇴직소득세액계산(2016.01.01 이후 계산방법)
                        CONV_CALC_TX_AMT_2016           : gfnma_nvl2(item.CONV_CALC_TX_AMT_2016),
                        CALC_TX_AMT_2016                : gfnma_nvl2(item.CALC_TX_AMT_2016),
                        PAY_YYYY_RETIRE_DATE            : gfnma_nvl2(item.PAY_YYYY_RETIRE_DATE),
                        SPEC_CALC_TX_AMT_AMT_2016       : gfnma_nvl2(item.SPEC_CALC_TX_AMT_AMT_2016),
                        INC_PREV_PAID_TX_AMT            : gfnma_nvl2(item.INC_PREV_PAID_TX_AMT),
                        INC_TX_AMT                      : gfnma_nvl2(item.INC_TX_AMT),
                        DEFER_INC_TX_AMT                : gfnma_nvl2(item.DEFER_INC_TX_AMT),
                        // --A.IRP_BANK_CODE,
                        IRP_BANK_NAME                   : gfnma_nvl2(item.IRP_BANK_NAME),
                        IRP_BIZ_REGNO                   : gfnma_nvl2(item.IRP_BIZ_REGNO),
                        IRP_BANK_ACC                    : gfnma_nvl2(item.IRP_BANK_ACC),
                        RET_PENS_END_DAT                : gfnma_nvl2(item.RET_PENS_END_DAT),
                        RET_PENS_AMT                    : gfnma_nvl2(item.RET_PENS_AMT),
                        DEFER_RET_INC_AMT               : gfnma_nvl2(item.DEFER_RET_INC_AMT),
                        DEFER_RET_TX_AMT                : gfnma_nvl2(item.DEFER_RET_TX_AMT),
                        INC_RET_TX_AMT                  : gfnma_nvl2(item.INC_RET_TX_AMT),
                        INC_DEFER_TX_AMT                : gfnma_nvl2(item.INC_DEFER_TX_AMT),
                        INC_BALANCE_TX_AMT              : gfnma_nvl2(item.INC_BALANCE_TX_AMT),
                        LOCAL_RET_TX_AMT                : gfnma_nvl2(item.LOCAL_RET_TX_AMT),
                        LOCAL_DEFER_TX_AMT              : gfnma_nvl2(item.LOCAL_DEFER_TX_AMT),
                        LOCAL_BALANCE_TX_AMT            : gfnma_nvl2(item.LOCAL_BALANCE_TX_AMT),
                        SPEC_RET_TX_AMT                 : gfnma_nvl2(item.SPEC_RET_TX_AMT),
                        SPEC_DEFER_TX_AMT               : gfnma_nvl2(item.SPEC_DEFER_TX_AMT),
                        SPEC_BALANCE_TX_AMT             : gfnma_nvl2(item.SPEC_BALANCE_TX_AMT),
                        RET_TX_SUM                      : gfnma_nvl2(item.RET_TX_SUM),
                        DEFER_TX_SUM                    : gfnma_nvl2(item.DEFER_TX_SUM),
                        BALANCE_TX_SUM                  : gfnma_nvl2(item.BALANCE_TX_SUM),
                        PRINT_TYPE                      : gfnma_nvl2(item.PRINT_TYPE),
                        PAY_YYYY_RETIRE_DATE            : gfnma_nvl2(item.PAY_YYYY_RETIRE_DATE),
                        PAY_DATE_YYYY                   : gfnma_nvl2(item.PAY_DATE_YYYY),
                        PAY_DATE_MM                     : gfnma_nvl2(item.PAY_DATE_MM),
                        PAY_DATE_DD                     : gfnma_nvl2(item.PAY_DATE_DD),
                        COMP_STAMP                      : gfnma_nvl2(item.COMP_STAMP),
                        STAMP_FILE_NAME                 : gfnma_nvl2(item.STAMP_FILE_NAME),

                    }
                    jsonReportList.push(msg);
                });
                if(data.cv_1.length > 0){
                    data.cv_1[0].COMP_STAMP = data.SEVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfn_nvl(data.cv_1[0].STAMP_FILE_NAME) +"&comp_code="+ gv_ma_selectedCorpCd +"&client_code=" + gv_ma_selectedClntCd;
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
        return data;
    }

    /**

     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
        SBUxMethod.set('COMP_CODE', gv_ma_selectedCorpCd);
    }


    /**
     * 출력
     */
    const fn_btnPrint = async function() {

        let conn = '';
        conn = await fn_search();
        if(conn.cv_1.length > 0){
            conn = await gfnma_convertDataForReport(conn);
        }else{
            return;
        }

        gfn_popClipReportPost("퇴직소득 원천징수영수증", "ma/RPT_HRA5200.crf", null, conn );

    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
