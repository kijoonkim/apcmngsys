<%
    /**
     * @Class Name        : hrp2510.jsp
     * @Description       : 개인 기간별 조회 정보 화면
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
    <title>title : 개인 기간별 조회</title>
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
            <%--<div style="margin-left: auto;">
                <sbux-button id="btnFile" name="btnFile" uitype="normal" text="파일저장"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnFile"></sbux-button>
            </div>--%>
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
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
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
                                unselected-text="선택"
                                class="form-control input-sm"
                        <%--onchange="fn_payType"--%>>
                        </sbux-select>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">귀속기간</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_PAY_YYYYMM_FR"
                                name="SRCH_PAY_YYYYMM_FR"
                                uitype="popup"
                                datepicker-mode="month"
                                date-format="yyyy-mm"
                                class="table-datepicker-ma inpt_data_reqed"
                                style="width: 100%;"
                                required>
                            <%--onchange="fn_payDate"--%>
                        </sbux-datepicker>
                    </td>
                    <td>~</td>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_PAY_YYYYMM_FR2"
                                name="SRCH_PAY_YYYYMM_FR2"
                                uitype="popup"
                                datepicker-mode="month"
                                date-format="yyyy-mm"
                                class="table-datepicker-ma inpt_data_reqed"
                                style="width: 100%;"
                                required>
                            <%--onchange="fn_payDate"--%>
                        </sbux-datepicker>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">지급구분</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_PAY_TYPE"
                                uitype="single"
                                jsondata-ref="jsonPayType"
                                unselected-text="선택"
                                class="form-control input-sm"
                        <%--onchange="fn_payType"--%>>
                        </sbux-select>
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
                    <td colspan="10" style="border-right: hidden;"></td>
                </tr>
                <%-- /************** 숨겨져 있는 컬럼 목록 **************/--%>
                <%--  <tr>
                      <td class="td_input" style="display: none;">
                          <sbux-select
                                  id="PAY_DATE"
                                  uitype="single"
                                  jsondata-ref="jsonPayDate"
                                  unselected-text="선택"
                                  class="form-control input-sm inpt_data_reqed"
                          &lt;%&ndash;onchange="fn_payType"&ndash;%&gt;>
                          </sbux-select>
                      </td>
                      <td class="td_input" style="border-right: hidden; display: none;">
                          <sbux-input
                                  uitype="text"
                                  id="EMAIL_SUBJECT"
                                  class="form-control input-sm"
                          ></sbux-input>
                      </td>
                      <td class="td_input" style="border-right: hidden; display: none;">
                          <sbux-input
                                  uitype="text"
                                  id="EMAIL_BODY"
                                  class="form-control input-sm"
                          ></sbux-input>
                      </td>
                  </tr>--%>
                </tbody>
            </table>
        </div>

        <div class="row">
            <div class="col-sm-5">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>사원리스트</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwInfo" style="height:530px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-7">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>급여정보</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount2">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwDetail" style="height:530px; width:100%;"></div>
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
    var gvwInfoGrid; 			// 그리드를 담기위한 객체 선언
    var jsonInfoList = []; 	    // 그리드의 참조 데이터 주소 선언
    var gvwDetailGrid;
    var jsonDetailList = [];

    var jsonSiteCode = []; //사업장 ( L_ORG001 )SRCH_SITE_CODE, 	SITE_CODE
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )SRCH_PAY_AREA_TYPE
    var jsonPayType = []; //지급구분 ( L_HRB008 )SRCH_PAY_TYPE, 	PAY_TYPE
    var jsonPayDate = []; //지급일자 ( L_HRP027 )PAY_DATE
    var jsonPositionCode = []; //직위 ( L_HRI002 )POSITION_CODE
    var jsonSalaryClass = []; //급호 ( L_HRI011 )SALARY_CLASS
    var jsonEmpState = []; //재직구분 ( L_HRI009 )EMP_STATE


    var jsonPayItemCode = []; //급여항목 ( L_HRP011 )PAY_ITEM_CODE
    var jsonPayItemCode2 = []; //공제항목 ( L_HRP012 )PAY_ITEM_CODE

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_TYPE','gvwInfoGrid'], jsonPayType, 'L_HRB008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['PAY_DATE'], jsonPayDate, 'L_HRP027', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_YMD', 'SLRY_YMD2', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonSalaryClass, 'L_HRI011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'JBCD_SLRCL_CD', 'GRADE_HOBONG_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),


            gfnma_setComSelect(['gvwPayGrid'], jsonPayItemCode, 'L_HRP011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SLRY_ITEM_CD', 'SLRY_ITEM_NM', 'Y', ''),
            gfnma_setComSelect(['gvwDedGrid'], jsonPayItemCode2, 'L_HRP012', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SLRY_ITEM_CD', 'SLRY_ITEM_NM', 'Y', ''),


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

        ]);
    }

    var fn_compopup1 = function() {
        var searchText 		= gfnma_nvl2(SBUxMethod.get("SRCH_DEPT_NAME"));

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
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NM);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {

        var searchText = gfnma_nvl2(SBUxMethod.get("SRCH_EMP_NAME"));
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

        let openDate = gfn_dateToYmd(new Date());

        SBUxMethod.set('SRCH_PAY_YYYYMM_FR', openDate);
        SBUxMethod.set('SRCH_PAY_YYYYMM_FR2', openDate);

        fn_createGrid();
        fn_createDetailGrid();
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
    }

    //사원 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '140px', style: 'text-align:left', hidden : true},
            {caption: ["부서"], ref: 'DEPT_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption : ["직위"], ref : 'POSITION_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPositionCode',  label : 'label', value : 'value'}
            },
            {caption : ["급호"], ref : 'SALARY_CLASS', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSalaryClass',  label : 'label', value : 'value'}
            },
            {caption : ["재직구분"], ref : 'EMP_STATE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonEmpState',  label : 'label', value : 'value'}
            }
        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        gvwInfoGrid.bind('click', 'fn_view');
        gvwInfoGrid.bind('keyup', 'fn_keyup');
    }

    let columns1 = [
        {caption: ["항목코드"], ref: 'SLRY_ITEM_CD', type: 'output', width: '100px', style: 'text-align:left', hidden : true},
        {caption: ["항목"], ref: 'SLRY_ITEM_NM', type: 'output', width: '100px', style: 'text-align:left'},
    ];


    //급여정보 리스트
    function fn_createDetailGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwDetail';
        SBGridProperties.id = 'gvwDetailGrid';
        SBGridProperties.jsonref = 'jsonDetailList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [];
        columns1.forEach((col) => {
            SBGridProperties.columns.push(col);
        });


        gvwDetailGrid = _SBGrid.create(SBGridProperties);
    }


    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let SITE_CODE       = gfnma_nvl2(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        let PAY_AREA_TYPE   = gfnma_nvl2(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let PAY_YYYYMM_FR   = gfnma_nvl2(SBUxMethod.get("SRCH_PAY_YYYYMM_FR")); //귀속기간
        let PAY_YYYYMM_FR2  = gfnma_nvl2(SBUxMethod.get("SRCH_PAY_YYYYMM_FR2")); //귀속기간
        let PAY_TYPE        = gfnma_nvl2(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let DEPT_CODE       = gfnma_nvl2(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE        = gfnma_nvl2(SBUxMethod.get("SRCH_EMP_CODE")); //사원

        if (!PAY_YYYYMM_FR) {
            gfn_comAlert("W0002", "귀속기간");
            return;
        }
        if (!PAY_YYYYMM_FR2) {
            gfn_comAlert("W0002", "귀속기간");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_SITE_CODE     : SITE_CODE
            ,V_P_DEPT_CODE     : DEPT_CODE
            ,V_P_EMP_CODE      : EMP_CODE
            ,V_P_PAY_YYYYMM_FR : PAY_YYYYMM_FR
            ,V_P_PAY_YYYYMM_TO : PAY_YYYYMM_FR2
            ,V_P_PAY_TYPE      : PAY_TYPE
            ,V_P_PAY_AREA_TYPE : PAY_AREA_TYPE

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };


        const postJsonPromise = gfn_postJSON("/hr/hrp/rep/selectHrp2510List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {


                /** @type {number} **/
                let totalRecordCount = 0;

                jsonInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        DEPT_CODE		        : gfnma_nvl2(item.DEPT_CD),
                        DEPT_NAME		        : gfnma_nvl2(item.DEPT_NM),
                        EMP_CODE		        : gfnma_nvl2(item.EMP_CD),
                        EMP_NAME		        : gfnma_nvl2(item.EMP_NM),
                        POSITION_CODE		    : gfnma_nvl2(item.JBPS_CD),
                        EMP_STATE		        : gfnma_nvl2(item.EMP_STTS),
                        SALARY_CLASS		    : gfnma_nvl2(item.SLRCL_NM)

                    }
                    jsonInfoList.push(msg);
                    totalRecordCount ++;
                });

                gvwInfoGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if(jsonInfoList.length > 0) {
                    gvwInfoGrid.clickRow(1);
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

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    //상세정보 보기
    async function fn_view() {

        jsonDetailList.length = 0;
        gvwDetailGrid.rebuild();

        let nRow = gvwInfoGrid.getRow();
        let nCol = gvwInfoGrid.getCol();

        if (nCol == -1) {
            return;
        }
        if (nRow < 1) {
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);


        let PAY_TYPE        = gfnma_nvl2(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_YYYYMM_FR   = gfnma_nvl2(SBUxMethod.get("SRCH_PAY_YYYYMM_FR")); //귀속기간
        let PAY_YYYYMM_FR2  = gfnma_nvl2(SBUxMethod.get("SRCH_PAY_YYYYMM_FR2")); //귀속기간


        if (!_.isEmpty(rowData)) {

            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                ,V_P_LANG_ID: ''
                ,V_P_COMP_CODE: gv_ma_selectedCorpCd
                ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

                ,V_P_SITE_CODE     : ''
                ,V_P_DEPT_CODE     : ''
                ,V_P_EMP_CODE      : rowData.EMP_CODE
                ,V_P_PAY_YYYYMM_FR : PAY_YYYYMM_FR
                ,V_P_PAY_YYYYMM_TO : PAY_YYYYMM_FR2
                ,V_P_PAY_TYPE      : PAY_TYPE
                ,V_P_PAY_AREA_TYPE : ''

                ,V_P_FORM_ID: p_formId
                ,V_P_MENU_ID: p_menuId
                ,V_P_PROC_ID: ''
                ,V_P_USERID: ''
                ,V_P_PC: ''
            };


            const postJsonPromise = gfn_postJSON("/hr/hrp/rep/selectHrp2510List.do", {
                getType				: 'json',
                workType			: 'DETAIL',
                cv_count			: '3',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    /*columns1 = [];*/
                    columns1 = [
                        {caption: ["항목코드"], ref: 'SLRY_ITEM_CD', type: 'output', width: '100px', style: 'text-align:left', hidden : true},
                        {caption: ["항목"], ref: 'SLRY_ITEM_NM', type: 'output', width: '100px', style: 'text-align:left'},
                    ];

                    data.cv_2.reverse().forEach((item, index) => {
                        const columns2 =   {caption: [gfnma_nvl2(item.PAY_YYYYMM_NAME)], ref: gfnma_nvl2(item.PAY_YYYYMM_CODE), type: 'output', width: '100px', style: 'text-align:right'
                            , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}}

                        columns1.push(columns2);
                    });


                    fn_createDetailGrid();

                    jsonDetailList.length = 0;
                    jsonDetailList = data.cv_3;
                    document.querySelector('#listCount2').innerText = data.cv_3.length;
                    gvwDetailGrid.rebuild();


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

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
