<%
    /**
     * @Class Name        : hra1420.jsp
     * @Description       : 정산자료 등록(관리자) 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.09.23
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.09.23   	표주완		최초 생성
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
    <title>title : 정산자료 등록(관리자)</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>

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

        <div class="box-search-ma">
            <!--[pp] 검색 -->
            <!--[APC] START -->
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
                    <th scope="row" class="th_bg_search">정산연도</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_YE_TX_YYYY"
                                name="SRCH_YE_TX_YYYY"
                                uitype="popup"
                                datepicker-mode="year"
                                date-format="yyyy"
                                class="table-datepicker-ma inpt_data_reqed"
                                required>
                            <%--onchange="fn_payDate"--%>
                        </sbux-datepicker>
                    </td>
                    <td colspan="3" style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">정산구분</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left"
                                    class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button"
                                    id="SRCH_YE_TX_TYPE" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_YE_TX_TYPE"
                                 style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td style="border-right: hidden;"></td>
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
                    <th scope="row" class="th_bg_search">재직구분</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_EMP_STATE"
                                uitype="single"
                                jsondata-ref="jsonSrchEmpState"
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
                    <td class="td_input" data-group="DEPT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup1"
                        ></sbux-button>
                    </td>
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
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup2"
                        ></sbux-button>
                    </td>
                    <td colspan="5" style="border-right: hidden;"></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="ad_tbl_top">
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
            <div id="sb-area-gvwInfo" style="height:550px; width:100%;"></div>
        </div>
    </div>
</section>
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title=""
                body-html-id="body-modal-compopup1" header-is-close-button="false"
                footer-is-close-button="false"></sbux-modal>
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
    var jsonInfoList = []; 	// 그리드의 참조 데이터 주소 선언


    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )SRCH_PAY_AREA_TYPE
    var jsonSiteCode = []; //사업장 ( L_ORG001 )SRCH_SITE_CODE
    var jsonSrchEmpState = []; //재직구분 ( L_HRI009 )SRCH_EMP_STATE


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['gvwInfoGrid'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_EMP_STATE','gvwInfoGrid'], jsonSrchEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),


            //사업장
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
                ,colValue		: 'SITE_CODE'
                ,colLabel		: 'SITE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

            //정산구분
            gfnma_multiSelectInit({
                target			: ['#SRCH_YE_TX_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA029'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
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
            compCode: gv_ma_selectedCorpCd
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

    /**
     * 그리드내 공통팝업 오픈
     */
    var fn_compopup3 = function(row, col) {

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= "";
        var replaceText0 = "_EMP_CODE_";
        var replaceText1 = "_EMP_NAME_";
        var replaceText2 = "_DEPT_CODE_";
        var replaceText3 = "_DEPT_NAME_";
        var replaceText4 = "_EMP_STATE_";
        var strWhereClause = "AND x.EMP_CODE LIKE '%" + replaceText0 + "%' AND x.DEPT_NAME LIKE '%" + replaceText1 + "%' AND x.DEPT_CODE LIKE '%"+replaceText2
            + "%' AND x.DEPT_NAME LIKE '%" + replaceText3 +  "%' AND x.EMP_STATE LIKE '%"+replaceText4+"%'";

        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            , whereClause           : strWhereClause
            , searchCaptions        :   ["부서코드"    , "부서명"     , "사원코드"    ,"사원명"     ,"재직상태"]
            , searchInputFields     :   ["DEPT_CODE"  , "DEPT_NAME", "EMP_CODE"   ,"EMP_NAME"  ,"EMP_STATE"]
            , searchInputValues     :   [""           , ""         ,""             ,searchText         ,""]
            , height                : '400px'
            , tableHeader           :   ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames      :   ["EMP_CODE"  , "EMP_NAME"  , "DEPT_NAME"   ,"SITE_NAME"  ,"EMP_STATE_NAME"]
            , tableColumnWidths     :   ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            ,itemSelectEvent		: function (data){
                //그리드내 원하는 위치에 값 셋팅하기
                gvwInfoGrid.setCellData(row, (col-4), data['DEPT_CODE']);
                gvwInfoGrid.setCellData(row, (col-3), data['DEPT_NAME']);
                gvwInfoGrid.setCellData(row, (col-2), data['EMP_CODE']);
                gvwInfoGrid.setCellData(row, (col-1), data['EMP_NAME']);
            }
        });
    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        fn_createGrid();

        let openDate = gfn_dateToYear(new Date());
        SBUxMethod.set('SRCH_YE_TX_YYYY', openDate);

    }



    function cfn_save() {

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            fn_save('U', '');

        }
    }

    function cfn_search() {

        fn_search();


    }

    /* function cfn_add(){

     }
     function cfn_del(){
     }*/

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }

    // 리스트
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
        SBGridProperties.columns = [
            {caption : ["사업장"], ref : 'SITE_CODE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode',  label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["부서명"], ref: 'DEPT_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["사원검색"], 			ref: 'POP_BTN',    				type:'button',  	width:'150px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_gridPopup(event, " + nRow + ", " + nCol + ")'>…</button>";
                }
            },
            {caption : ["재직구분"], ref : 'EMP_STATE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSrchEmpState',  label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["전년도 총연봉"], ref: 'ANNUAL_SALARY_AMT', type: 'output', width: '240px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["월정급여액"], ref: 'PAY_AMT', type: 'output', width: '240px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["연장비과세대상"], ref: 'OT_TXFREE_APPLY_YN', type: 'checkbox', width: '140px', style: 'text-align:center',
                typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["비고"], ref: 'MEMO', type: 'output', width: '550px', style: 'text-align:left'},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값

        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);

    }


    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let SITE_CODE           = gfnma_multiSelectGet('#SRCH_SITE_CODE'); //사업장
        let YE_TX_TYPE          = gfnma_multiSelectGet('#SRCH_YE_TX_TYPE'); //정산구분
        let YE_TX_YYYY          = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도
        let PAY_AREA_TYPE       = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let EMP_STATE           = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE")); //재직구분
        let DEPT_CODE           = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE            = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_YE_TX_YYYY       : YE_TX_YYYY
            ,V_P_YEAR_END_TX_TYPE : YE_TX_TYPE
            ,V_P_SITE_CODE        : SITE_CODE
            ,V_P_DEPT_CODE        : DEPT_CODE
            ,V_P_EMP_CODE         : EMP_CODE
            ,V_P_EMP_STATE        : EMP_STATE
            ,V_P_PAY_AREA_TYPE    : PAY_AREA_TYPE

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1420List.do", {
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

                jsonInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        SITE_CODE 			                : gfn_nvl(item.SITE_CODE)
                        ,DEPT_CODE 			                : gfn_nvl(item.DEPT_CODE)
                        ,DEPT_NAME 			                : gfn_nvl(item.DEPT_NAME)
                        ,EMP_CODE 			                : gfn_nvl(item.EMP_CODE)
                        ,EMP_NAME 			                : gfn_nvl(item.EMP_NAME)
                        ,EMP_FULL_NAME 			            : gfn_nvl(item.EMP_FULL_NAME)
                        ,EMP_STATE 			                : gfn_nvl(item.EMP_STATE)
                        ,ANNUAL_SALARY_AMT 			        : gfn_nvl(item.ANNUAL_SALARY_AMT)
                        ,PAY_AMT 			                : gfn_nvl(item.PAY_AMT)
                        ,OT_TXFREE_APPLY_YN 			    : gfn_nvl(item.OT_TXFREE_APPLY_YN)

                    }
                    jsonInfoList.push(msg);
                    totalRecordCount ++;
                });

                gvwInfoGrid.rebuild();


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
    //저장
    const fn_save = async function () {

        let listData = [];
        listData = await getParamForm();

        if (listData.length > 0) {

            const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1420.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    } else {
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        fn_search();
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
        } else {

        }


    }

    const getParamForm = async function () {

        let returnData = [];
        let updateData = gvwInfoGrid.getUpdateData(true, 'all');

        let YE_TX_TYPE          = gfnma_multiSelectGet('#SRCH_YE_TX_TYPE'); //정산구분
        let YE_TX_YYYY          = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        updateData.forEach((item, index) =>{
            const param = {

                cv_count: '0',
                getType: 'json',
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({

                    V_P_DEBUG_MODE_YN: ''
                    , V_P_LANG_ID: ''
                    , V_P_COMP_CODE: gv_ma_selectedCorpCd
                    , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                    ,V_P_YE_TX_YYYY         : YE_TX_YYYY
                    ,V_P_YEAR_END_TX_TYPE   : YE_TX_TYPE
                    ,V_P_EMP_CODE           : gfn_nvl(item.data.EMP_CODE)
                    ,V_P_OT_TXFREE_APPLY_YN : gfn_nvl(item.data.OT_TXFREE_APPLY_YN)
                    ,V_P_MEMO               : gfn_nvl(item.data.MEMO)

                    , V_P_FORM_ID: p_formId
                    , V_P_MENU_ID: p_menuId
                    , V_P_PROC_ID: ''
                    , V_P_USERID: ''
                    , V_P_PC: ''
                })
            }

            returnData.push(param);
        })

        return returnData;


    }

    // 행추가
    const fn_addRow = async function () {
        let rowVal = gvwInfoGrid.getRow();

        const msg = {
            SITE_CODE                : '',
            DEPT_CODE                : '',
            DEPT_NAME                : '',
            EMP_CODE                 : '',
            EMP_NAME                 : '',
            EMP_STATE                : '',
            ANNUAL_SALARY_AMT        : 0,
            PAY_AMT                  : 0,
            OT_TXFREE_APPLY_YN       : '',
            MEMO                     : '',

            status: 'i'
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwInfoGrid.addRow(true, msg);
        }else{
            gvwInfoGrid.insertRow(rowVal, 'below', msg);
        }
    }

    // 행삭제
    const fn_delRow = async function () {
        let rowVal = gvwInfoGrid.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwInfoGrid.deleteRow(rowVal);
        }
    }

    /**
     * 그리드내 팝업 조회
     */
    function fn_gridPopup(event, row, col) {

        event.stopPropagation();	//이벤트가 그리드에 전파되는것 중지
        fn_compopup3(row, col);
    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>

