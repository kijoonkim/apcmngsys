<%
    /**
     * @Class Name        : hrt2370.jsp
     * @Description       : 근무보고서 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2025.01.07
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2025.01.07   	이경한		최초 생성
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
    <title>title : 근무보고서 정보</title>
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
                </h3><!-- 국가정보 -->
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
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">직군</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-select
                                unselected-text="전체"
                                uitype="single"
                                id="SRCH_JOB_GROUP"
                                name="SRCH_JOB_GROUP"
                                class="form-control input-sm"
                                jsondata-ref="jsonJobGroup"
                        />
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">기준일</th>
                    <td class="td_input">
                        <sbux-datepicker
                                id="SCH_START_DATE"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="table-datepicker-ma">
                        </sbux-datepicker>
                    </td>
                    <td class="td_input">
                        <span>-</span>
                    </td>
                    <td class="td_input">
                        <sbux-datepicker
                                id="SCH_END_DATE"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="table-datepicker-ma">
                        </sbux-datepicker>
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">구분</th>
                    <td colspan="3" class="td_input" >
                        <sbux-select
                                unselected-text="전체"
                                uitype="single"
                                id="SRCH_TIME_CATEGORY"
                                name="SRCH_TIME_CATEGORY"
                                class="form-control input-sm"
                                jsondata-ref="jsonTimeCategory"
                        />
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
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
                                uitype="text"
                                id="SRCH_DEPT_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" data-group="DEPT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                uitype="modal"
                                target-id="modal-compopup1"
                                text="…"
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
                                uitype="text"
                                id="SRCH_EMP_FULL_NAME"
                                class="form-control input-sm"

                        ></sbux-input>
                    </td>
                    <td class="td_input" data-group="EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                uitype="modal"
                                target-id="modal-compopup1"
                                text="…"
                                onclick="fn_compopup2"
                        ></sbux-button>
                    </td>
                    <td colspan="10" style="border-right: hidden;">&nbsp;</td>
                </tr>
                <tr style="display: none">
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="EMP_CODE"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
                <li>
                    <span>근무보고서</span>
                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                </li>
            </ul>
        </div>
        <div>
            <div id="sb-area-grwInfo" style="height:530px; width:100%;"></div>
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
    var jsonGvwInfoList = []; 	// 그리드의 참조 데이터 주소 선언

    var jsonSiteCode = []; // ( L_ORG001 )SRCH_SITE_CODE
    var jsonJobGroup = []; // ( L_HRI047 )SRCH_JOB_GROUP
    var jsonTimeCategory = []; // ( L_HRI047 )SRCH_TIME_CATEGORY
    var jsonPositionCode = []; // ( L_HRI002 )
    var jsonJobRank = []; // ( L_HRI005 )JOB_RANK
    var jsonOperationName = []; // ( L_COST_CENTER )OPERATION_NAME

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
            gfnma_setComSelect(['SRCH_JOB_GROUP'], jsonJobGroup, 'L_HRI047', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['SRCH_TIME_CATEGORY'], jsonTimeCategory, 'L_HRT024_04', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonOperationName, 'L_COST_CENTER', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CSTCD_CD', 'CSTCD_NM', 'Y', ''),

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
                ,colValue		: 'SITE_CD'
                ,colLabel		: 'SITE_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SITE_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'SITE_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            })
        ]);
    }

    /**
     * 공통팝업3
     */
    var fn_compopup1 = function() {

        var searchText = gfnma_nvl2(SBUxMethod.get("SRCH_DEPT_NAME"));

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
                    SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NM);
                    SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    var fn_compopup2 = function() {

        var searchText = gfnma_nvl2(SBUxMethod.get("SRCH_EMP_FULL_NAME"));

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
            , searchInputValues: [""           , ""     ,""             ,searchText         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CD"  , "EMP_NM"  , "DEPT_NM"   ,"SITE_NM"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                    SBUxMethod.set('SRCH_EMP_FULL_NAME', data.EMP_NM);
                    SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CD);
            },
        });
        //SBUxMethod.openModal('modal-compopup1');

    }

    // only document
    window.addEventListener('DOMContentLoaded', async function (e) {

        fn_initSBSelect();
        fn_init();
        await fn_onload();

    });

    const fn_onload = async function () {


    }

    const fn_init = async function () {

        fn_createGrid();
    }

    /**
     * 저장
     */
    async function cfn_save() {
        if (await gfnma_gridValidateCheck() == false) {
            return;
        }

        let updatedData = gvwInfoGrid.getUpdateData(true, 'all');

        if (_.isEmpty(updatedData)){
            return;
        }

        fn_save('', updatedData);
    }
    /**
     * 조회
     */
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
        SBGridProperties.parentid = 'sb-area-grwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonGvwInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        /*SBGridProperties.allowcopy = true; //복사*/
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ["팀코드"], ref: 'DEPT_CODE1', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["팀명"], ref: 'DEPT_NAME1', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["공정코드"], ref: 'DEPT_CODE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["공정명"], ref: 'DEPT_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["직위"], ref : 'POSITION_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : '', /*displayui : true,*/ label : 'label', value : 'value'}       //L_HRI002
            },
            {caption: ["직책"], ref: 'DUTY_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["직급"], ref : 'JOB_RANK', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : '', /*displayui : true,*/ label : 'label', value : 'value'}       //L_HRI005
            },
            {caption: ["근무패턴"], ref: 'WORK_PATTERN_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["공정명"], ref : 'OPERATION_NAME', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : '', /*displayui : true,*/ label : 'label', value : 'value'}       //L_COST_CENTER
            },
            {caption: ['시작일'], ref: 'TIME_START_DATE', width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['종료일'], ref: 'TIME_END_DATE', width:'100px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ["평일연장"], ref: 'OVERTIME_HOUR', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["기본근무"], ref: 'NORMAL_HOUR', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["휴일근무"], ref: 'HOLIDAY_HOUR', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["휴일연장"], ref: 'HOLIDAY_OVERTIME_HOUR', type: 'input', width: '100px', style: 'text-align:left', userattr : {required : true}},
            {caption: ["야근"], ref: 'NIGHT_HOUR', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["주누적시간"], ref: 'WEEKLY_ACC_HOUR', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["주52잔여"], ref: 'WEEK52_REMAIN_HOUR', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["평일연장(월)"], ref: 'OVERTIME_ACC', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["휴일(월)"], ref: 'HOLIDAY_ACC', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["휴일연장(월)"], ref: 'HOLIDAY_OVERTIME_ACC', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["야근(월)"], ref: 'NIGHT_ACC', type: 'input', width: '100px', style: 'text-align:left'},
        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
       /* gvwInfoGrid.bind('click', 'fn_view');
        gvwInfoGrid.bind('keyup', 'fn_keyup');*/

    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let SITE_CODE	       = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));//사업장
        let JOB_GROUP          = gfnma_nvl2(SBUxMethod.get("SRCH_JOB_GROUP")); //직군
        let START_DATE         = gfnma_nvl2(SBUxMethod.get("SCH_START_DATE")); //기준일
        let END_DATE           = gfnma_nvl2(SBUxMethod.get("SCH_END_DATE")); //기준일
        let TIME_CATEGORY      = gfnma_nvl2(SBUxMethod.get("SRCH_TIME_CATEGORY")); //구분
        let DEPT_CODE          = gfnma_nvl2(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE           = gfnma_nvl2(SBUxMethod.get("SRCH_EMP_CODE")); //사원

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_DEPT_CODE      : DEPT_CODE
            ,V_P_EMP_CODE       : EMP_CODE
            ,V_P_EMP_STATE      : EMP_STATE
            ,V_P_PAY_AREA_TYPE  : PAY_AREA_TYPE

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/selectHrt2370List.do", {
            getType: 'json',
            workType: 'MASTER',
            cv_count: '13',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        console.log('datadatadatadata', data);

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonGvwInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CREATE                  : gfnma_nvl2(item.CREATE),
                        EMP_CODE                : gfnma_nvl2(item.EMP_CD),
                        EMP_NAME                : gfnma_nvl2(item.EMP_NM),
                        PAY_GROUP_CODE          : gfnma_nvl2(item.SLRY_GRD_CD),
                        PAY_AREA_TYPE           : gfnma_nvl2(item.SLRY_AREA_TYPE),
                        DUTY_CODE               : gfnma_nvl2(item.JBTTL_CD),
                        POSITION_CODE           : gfnma_nvl2(item.JBPS_CD),
                        DEPT_NAME               : gfnma_nvl2(item.DEPT_NM),
                        ENTER_DATE              : gfnma_nvl2(item.JNCMP_YMD),
                        RETIRE_DATE             : gfnma_nvl2(item.RTRM_YMD),
                        BANK_CODE               : gfnma_nvl2(item.BANK_CD),
                        BANK_ACCOUNT_REAL       : gfnma_nvl2(item.BANK_ACCOUNT_REAL),
                        BANK_CODE2              : gfnma_nvl2(item.BANK_CD2),
                        BANK_ACCOUNT2_REAL      : gfnma_nvl2(item.BANK_ACCOUNT2_REAL),
                        EMP_STATE               : gfnma_nvl2(item.EMP_STTS),
                        BANK_ACCOUNT            : gfnma_nvl2(item.BACNT_NO),
                        BANK_ACCOUNT2           : gfnma_nvl2(item.ACTNO2),
                        RET_PENS_BANK_CODE      : gfnma_nvl2(item.RTRM_PN_BANK_CD),
                        RET_PENS_BANK_ACC       : gfnma_nvl2(item.RTRM_PN_ACTNO),
                        RET_PENS_BANK_ACC_REAL  : gfnma_nvl2(item.RET_PENS_BANK_ACC_REAL)

                    }
                    jsonGvwInfoList.push(msg);
                    totalRecordCount++;
                });

                gvwInfoGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                //수정했던 탭 페이지로 이동
                /*if (tabMoveVal != null && tabMoveVal != ''){

                    SBUxMethod.set('idx1', 'SBUx_IDE_JSON');
                }*/

                if(jsonGvwInfoList.length > 0) {
                    gvwInfoGrid.clickRow(1);
                }

                //fn_view('search');


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
    const fn_save = async function (strWorkType, updatedData) {

        let listData = [];
        listData =  await getParamFormS1(updatedData);

        if (_.isEmpty(listData) == false) {
            const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/insertHrt2370List.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    if (data.resultMessage) {
                        if (_.isEqual(data.v_errorCode, 'MSG0004') || _.isEqual(data.v_errorCode, 'MSG0002')){
                            return true;
                        }else {
                            alert(data.resultMessage);
                            return false;
                        }
                    }
                    return true;

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
    }

    const getParamFormS1 = async function (updatedData) {

        let returnData = [];

        let EMP_CODE = gfnma_nvl2(SBUxMethod.get("EMP_CODE"));

        if (!_.isEmpty(updatedData)) {

            updatedData.forEach((item, index) => {

                const param = {

                    cv_count: '0',
                    getType: 'json',
                    workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                    params: gfnma_objectToString({
                        V_P_DEBUG_MODE_YN   : ''
                        , V_P_LANG_ID       : ''
                        , V_P_COMP_CODE     : gv_ma_selectedCorpCd
                        , V_P_CLIENT_CODE   : gv_ma_selectedClntCd



                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''

                    })
                }

                returnData.push(param);

            });
        }

        return returnData;

    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
