<%
    /**
     * @Class Name        : hrp1000.jsp
     * @Description       : 연말정산 결과조회 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.09.05
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.08.24   	표주완		최초 생성
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
    <title>title : 연말정산 결과조회</title>
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
                <th scope="row" class="th_bg">정산연도</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_YE_TX_YYYY"
                            name="SRCH_YE_TX_YYYY"
                            uitype="popup"
                            datepicker-mode="year"
                            date-format="yyyy"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            required>
                        <%--onchange="fn_payDate"--%>
                    </sbux-datepicker>
                </td>
                <td colspan="2" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">급여영역</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="SRCH_PAY_AREA_TYPE"
                            name="SRCH_PAY_AREA_TYPE"
                            class="form-control input-sm"
                            jsondata-ref="jsonPayAreaType"
                    />
                </td>
                <td colspan="2" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">사업장</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="SRCH_SITE_CODE"
                            name="SRCH_SITE_CODE"
                            class="form-control input-sm"
                            jsondata-ref="jsonSiteCode"
                    />
                </td>
                <td colspan="2" style="border-right: hidden;"></td>
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
                <td class="td_input" style="border-right: hidden;" data-group="DEPT">
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
                <td class="td_input" style="border-right: hidden;" data-group="EMP">
                    <sbux-input
                    <%-- uitype="hidden"--%>
                            uitype="text"
                            id="SRCH_EMP_NAME"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="5" class="td_input"  data-group="EMP">
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup2"
                    ></sbux-button>
                </td>
            </tr>
            </tbody>
        </table>

        <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
                <li>
                    <span>연말정산계산 결과조회</span>
                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                </li>
            </ul>
        </div>
        <div>
            <div id="sb-area-gvwInfo" style="height:580px; width:100%;"></div>
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

    var jsonSiteCode = []; //사업장 ( L_ORG001 )SRCH_SITE_CODE
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )SRCH_PAY_AREA_TYPE
    var jsonCloseState = []; //마감상태 ( L_HRA010 )CLOSE_STATE

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['SRCH_SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonCloseState, 'L_HRA010', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

            //사업장
           /* gfnma_multiSelectInit({
                target			: ['#srch-site_code']
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
            })*/
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
        fn_save();
    }

    function cfn_search(){
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

    //연말정산계산 결과조회 리스트
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
        SBGridProperties.rowheader =['update'];
        SBGridProperties.frozencols = 6;
        SBGridProperties.columns = [
            {caption: ["사번"], ref: 'SEQ', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["정산구분"], ref: 'YE_TX_TYPE', type: 'output', width: '100px', style: 'text-align:left', hidden : true},
            {caption : ["마감상태"], ref : 'CLOSE_STATE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonCloseState', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["부서명"], ref: 'DEPT_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ['정산일자(퇴직일자)'], ref: 'WORK_END_DAT', 	width:'130px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["중간소득신고 여부"], ref: 'MIDWAY_TX_RETURN_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["급여계"], ref: 'PAY_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["상여계"], ref: 'BONUS_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["과세수당"], ref: 'PAY_TAX_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["급여계"], ref: 'YE_PAY_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["상여계"], ref: 'YE_BONUS_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["인정수당계"], ref: 'YE_ADD_BONUS_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["기타소득계"], ref: 'YE_INC_EXTRA_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["비과세수당"], ref: 'TXFREE_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["과세계"], ref: 'PAY_TX_TOT_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["비과세예외금액"], ref: 'TAX_FREE_EXCEPT_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["지급액계(비과세수당+비과세예외금액제외)"], ref: 'PAY_TOT_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["총급여액"], ref: 'INC_TOT_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["근로소득공제"], ref: 'INC_DEAMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["근로소득금액"], ref: 'INC_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["과세표준"], ref: 'TOT_INC_TX_STD_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["산출세액"], ref: 'CALCULATE_TX_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["세액공제"], ref: 'TX_DED_TOT_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["결정세액(소득세)"], ref: 'CALC_INC_TX_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["결정세액(주민세)"], ref: 'CALC_LOCAL_TX_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["결정세액(농특세)"], ref: 'CALC_SPEC_TX_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["기납부세액(소득세)"], ref: 'NOW_INC_TX_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["기납부세액(주민세)"], ref: 'NOW_LOCAL_TX_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["기납부세액(농특세)"], ref: 'NOW_SPEC_TX_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["차감징수세액(소득세)"], ref: 'INC_TX_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["차감징수세액(주민세)"], ref: 'LOCAL_TX_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["차감징수세액(농특세)"], ref: 'SPEC_TX_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},
            {caption: ["차감징수세액계"], ref: 'TX_TOT_AMT', type: 'output', width: '100px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' }},

        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        /*gvwInfoGrid.bind('click', 'fn_view');*/
    }


    /**
     * 목록 조회
     */
    const fn_search = async function (/*tabMoveVal*/) {

        let YE_TX_YYYY      = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도
        let SITE_CODE       = gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        let PAY_AREA_TYPE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let DEPT_CODE       = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE        = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_YE_TX_YYYY : YE_TX_YYYY
            ,V_P_SITE_CODE  : SITE_CODE
            ,V_P_DEPT_CODE  : DEPT_CODE
            ,V_P_EMP_CODE   : EMP_CODE
            ,V_P_PAY_AREA   : PAY_AREA_TYPE


            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1710List.do", {
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

                jsonInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        ORDER_SEQ 			                : gfn_nvl(item.ORDER_SEQ)
                        ,SORT_SEQ 			                : gfn_nvl(item.SORT_SEQ)
                        ,SEQ 			                    : gfn_nvl(item.SEQ)
                        ,YE_TX_TYPE 			            : gfn_nvl(item.YE_TX_TYPE)
                        ,CLOSE_STATE 			            : gfn_nvl(item.CLOSE_STATE)
                        ,DEPT_NAME 			                : gfn_nvl(item.DEPT_NAME)
                        ,EMP_CODE 			                : gfn_nvl(item.EMP_CODE)
                        ,EMP_NAME 			                : gfn_nvl(item.EMP_NAME)
                        ,WORK_END_DAT 			            : gfn_nvl(item.WORK_END_DAT)
                        ,MIDWAY_TX_RETURN_YN 			    : gfn_nvl(item.MIDWAY_TX_RETURN_YN)
                        // -- A : 급여계 =  [총금액에서 수당(과세+비과세)을 뺀 부분만 표현]으로 기본급만 취한다.
                        ,PAY_AMT 			                : gfn_nvl(item.PAY_AMT)
                        // -- B : 상여계(인정상여 포함, 그리고 상여에는 수당(과세 + 비과세)이 없다보고...)
                        ,BONUS_AMT 			                : gfn_nvl(item.BONUS_AMT)
                        //-- C : 과세수당 = 총금액 - 기본급
                        ,PAY_TAX_AMT 			            : gfn_nvl(item.PAY_TAX_AMT)
                        ,YE_PAY_AMT 			            : gfn_nvl(item.YE_PAY_AMT)
                        ,YE_BONUS_AMT 			            : gfn_nvl(item.YE_BONUS_AMT)
                        ,YE_ADD_BONUS_AMT 			        : gfn_nvl(item.YE_ADD_BONUS_AMT)
                        ,YE_INC_EXTRA_AMT 			        : gfn_nvl(item.YE_INC_EXTRA_AMT)
                        //-- D : 비과세수당(정산시 반영되는 비과세)
                        ,TXFREE_AMT 			            : gfn_nvl(item.TXFREE_AMT)
                        //-- E : 과세계 ( 소득총액 - 비과세총액)
                        ,PAY_TX_TOT_AMT 			        : gfn_nvl(item.PAY_TX_TOT_AMT)
                        // -- F : 비과세제외 = 비과세총액 - 비과세수당
                        ,TAX_FREE_EXCEPT_AMT 			    : gfn_nvl(item.TAX_FREE_EXCEPT_AMT)
                        ,PAY_TOT_AMT 			            : gfn_nvl(item.PAY_TOT_AMT)
                        ,INC_TOT_AMT 			            : gfn_nvl(item.INC_TOT_AMT)
                        ,INC_DEAMT 			                : gfn_nvl(item.INC_DEAMT)
                        ,INC_AMT 			                : gfn_nvl(item.INC_AMT)
                        ,TOT_INC_TX_STD_AMT 			    : gfn_nvl(item.TOT_INC_TX_STD_AMT)
                        ,CALCULATE_TX_AMT 			        : gfn_nvl(item.CALCULATE_TX_AMT)
                        ,TX_DED_TOT_AMT 			        : gfn_nvl(item.TX_DED_TOT_AMT)
                        ,CALC_INC_TX_AMT 			        : gfn_nvl(item.CALC_INC_TX_AMT)
                        ,CALC_LOCAL_TX_AMT 			        : gfn_nvl(item.CALC_LOCAL_TX_AMT)
                        ,CALC_SPEC_TX_AMT 			        : gfn_nvl(item.CALC_SPEC_TX_AMT)
                        ,NOW_INC_TX_AMT 			        : gfn_nvl(item.NOW_INC_TX_AMT)
                        ,NOW_LOCAL_TX_AMT 			        : gfn_nvl(item.NOW_LOCAL_TX_AMT)
                        ,NOW_SPEC_TX_AMT 			        : gfn_nvl(item.NOW_SPEC_TX_AMT)
                        ,INC_TX_AMT 			            : gfn_nvl(item.INC_TX_AMT)
                        ,LOCAL_TX_AMT 			            : gfn_nvl(item.LOCAL_TX_AMT)
                        ,SPEC_TX_AMT 			            : gfn_nvl(item.SPEC_TX_AMT)
                        ,TX_TOT_AMT 			            : gfn_nvl(item.TX_TOT_AMT)


                    }
                    jsonInfoList.push(msg);
                    totalRecordCount ++;
                });

                gvwInfoGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                /*fn_view();*/

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

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            let listData = [];
            listData =  await getParamForm('u');
            /* var paramObj = {
                 P_HRP1170_S: await getParamForm('u')
             }*/

            if (listData.length > 0) {

                const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1710.do", {listData: listData});

                const data = await postJsonPromise;

                try {
                    if (_.isEqual("S", data.resultStatus)) {
                        if (data.resultMessage) {
                            alert(data.resultMessage);
                        }else{
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
            }else{

            }
        }

    }

    const getParamForm = async function () {

        let returnData = [];
        let updateData = gvwInfoGrid.getUpdateData(true, 'all');

        let YE_TX_YYYY = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
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
                    , V_P_COMP_CODE: gv_ma_selectedApcCd
                    , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                    ,V_P_YE_TX_YYYY          : YE_TX_YYYY
                    ,V_P_YEAR_END_TX_TYPE    : gfn_nvl(item.data.YE_TX_TYPE)
                    ,V_P_EMP_CODE            : gfn_nvl(item.data.EMP_CODE)
                    ,V_P_MIDWAY_TX_RETURN_YN : gfn_nvl(item.data.MIDWAY_TX_RETURN_YN)

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

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>

