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
                                id="SRCH_START_DATE"
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
                                id="SRCH_END_DATE"
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
                                onclick="fn_findDeptCode"
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
                                id="SRCH_EMP_NAME"
                                class="form-control input-sm"

                        ></sbux-input>
                    </td>
                    <td class="td_input" data-group="EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                uitype="modal"
                                target-id="modal-compopup1"
                                text="…"
                                onclick="fn_findEmpCode"
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
    var p_userId = '${loginVO.maUserID}';
    var isHrManager = '${loginVO.maIsHRManager}' == 'Y';
    var p_deptCode = '${loginVO.maDeptCode}';
    var p_deptName = '${loginVO.maDeptName}';
    //-----------------------------------------------------------

    //grid 초기화
    var gvwInfo; 			// 그리드를 담기위한 객체 선언
    var jsonGvwInfoList = []; 	// 그리드의 참조 데이터 주소 선언

    var jsonSiteCode = []; // ( L_ORG001 )SRCH_SITE_CODE
    var jsonJobGroup = []; // ( L_HRI047 )SRCH_JOB_GROUP
    var jsonTimeCategory = []; // ( L_HRI047 )SRCH_TIME_CATEGORY
    var jsonPositionCode = []; // ( L_HRI002 )
    var jsonJobRank = []; // ( L_HRI005 )JOB_RANK
    var jsonOperationName = []; // ( L_COST_CENTER )OPERATION_NAME

    var pink = "0";
    var yellow = "0";
    var red = "0";
    var color_type = "1";

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
            gfnma_setComSelect(['SRCH_JOB_GROUP'], jsonJobGroup, 'L_HRI047', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['SRCH_TIME_CATEGORY'], jsonTimeCategory, 'L_HRT024_04', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfo'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfo'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfo'], jsonOperationName, 'L_COST_CENTER', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CSTCT_CD', 'CSTCT_NM', 'Y', ''),

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
    var fn_findDeptCode = function() {
        var searchText = gfnma_nvl2(SBUxMethod.get("SRCH_DEPT_NAME"));
        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');

        var param		 	= ["'"+ p_userId+"'"];

        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001_HRT'
            ,popupType				: 'B'
            ,whereClause			: param
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

    const fn_findEmpCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));

        var addParams = ["'"+ p_userId+"'"];	//bizcompId 의 파라미터에 따라 추가할것

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_EMP_WORK'
            ,popupType				: 'B'
            ,whereClause			: addParams
            , searchCaptions:    ["부서코드", "부서명", "사원코드", "사원명", "기준일"]
            , searchInputFields: ["DEPT_CD", "DEPT_NM", "EMP_CD"   ,"EMP_NM"  ,"CRTR_YMD"]
            ,searchInputValues		: ["", "", searchCode, searchName, gfn_dateToYmd(new Date())]
            ,searchInputTypes		: ["input", "input", "input", "input", "datepicker"]		//input, datepicker가 있는 경우
            ,height: '400px'
            , tableHeader:       ["사원코드", "사원명", "부서명", "부서명", "입사일", "퇴사일", "직위코드", "직위명", "파트명", "직급"]
            , tableColumnNames:  ["EMP_CD", "EMP_NM", "DEPT_CD", "DEPT_NM", "JNCMP_YMD", "RTRM_YMD", "JBPS_CD", "JBPS_NM", "CSTCT_NM", "JBGD_CD"]
            ,tableColumnWidths		: ["100px", "100px", "80px", "140px", "100px", "100px", "100px", "100px", "100px", "100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NM);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'1020px'})
    }

    const fn_onload = async function () {
        SBUxMethod.set("SRCH_START_DATE",gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("SRCH_END_DATE", gfn_dateToYmd(new Date()));

        if (!isHrManager) {
            SBUxMethod.set("SRCH_DEPT_CODE", p_deptCode);
            SBUxMethod.set("SRCH_DEPT_NAME", p_deptName);
        }

        await fn_findColorList(color_type);
    }

    window.addEventListener('DOMContentLoaded', async function (e) {
        await fn_initSBSelect();
        fn_createGrid();
        await fn_onload();
    });

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
        SBGridProperties.id = 'gvwInfo';
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
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["직책"], ref: 'DUTY_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["직급"], ref : 'JOB_RANK', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo: {
                    ref			: 'jsonJobRank',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근무패턴"], ref: 'WORK_PATTERN_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["공정명"], ref : 'OPERATION_NAME', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo: {
                    ref			: 'jsonOperationName',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
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

        gvwInfo = _SBGrid.create(SBGridProperties);
    }

    const fn_gvwInfoAfterRebuild = async function() {
        var nRow = gvwInfo.getRow();
        let gvwInfoData = gvwInfo.getGridDataAll();

        for(var i = 0; i < gvwInfoData.length; i++) {
            let rowData = gvwInfo.getRowData(i+1);
            var week52RemainHourRowIndex = gvwInfo.getColRef("WEEK52_REMAIN_HOUR")

            // 주52시간 체크
            if (parseFloat(rowData.WEEK52_REMAIN_HOUR) <= parseFloat(red) && (nRow != (i+1))) { // 주52시간근무 <= numRed  경우 빨간색
                gvwInfo.setCellStyle('background-color', i+1, week52RemainHourRowIndex, i+1, week52RemainHourRowIndex, 'red');
            } else if (parseFloat(rowData.WEEK52_REMAIN_HOUR) <= parseFloat(pink) &&
                parseFloat(rowData.WEEK52_REMAIN_HOUR) > parseFloat(red) && (nRow != (i+1))) {  // numRed < 주52시간근무 <= numPink  경우 주황색
                gvwInfo.setCellStyle('background-color', i+1, week52RemainHourRowIndex, i+1, week52RemainHourRowIndex, 'orange');
            } else if (parseFloat(rowData.WEEK52_REMAIN_HOUR) <= parseFloat(yellow) &&
                parseFloat(rowData.WEEK52_REMAIN_HOUR) > parseFloat(pink) && (nRow != (i+1))) { // numPink < 주52시간근무 <= numYellow 경우 노랑색(40시간 근무까지는 정상)
                gvwInfo.setCellStyle('background-color', i+1, week52RemainHourRowIndex, i+1, week52RemainHourRowIndex, 'green');
            }
        }
    }
    
    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let SITE_CODE	       = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));//사업장
        let JOB_GROUP          = gfnma_nvl2(SBUxMethod.get("SRCH_JOB_GROUP")); //직군
        let TIME_START_DATE         = gfnma_nvl2(SBUxMethod.get("SRCH_START_DATE")); //기준일
        let TIME_END_DATE           = gfnma_nvl2(SBUxMethod.get("SRCH_END_DATE")); //기준일
        let DEPT_CODE          = gfnma_nvl2(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE           = gfnma_nvl2(SBUxMethod.get("SRCH_EMP_CODE")); //사원

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd
            , V_P_TIME_START_DATE : TIME_START_DATE
            , V_P_TIME_END_DATE : TIME_END_DATE
            , V_P_SITE_CODE : SITE_CODE
            , V_P_DEPT_CODE : DEPT_CODE
            , V_P_JOB_GROUP : JOB_GROUP
            , V_P_EMP_CODE : EMP_CODE
            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/selectHrt2370List.do", {
            getType: 'json',
            workType: 'Q',
            cv_count: '2',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonGvwInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        SEQ : gfn_nvl(item.SEQ),
                        DEPT_CODE : gfn_nvl(item.DEPT_CD),
                        DEPT_NAME : gfn_nvl(item.DEPT_NM),
                        DEPT_CODE1 : gfn_nvl(item.DEPT_CD1),
                        DEPT_NAME1 : gfn_nvl(item.DEPT_NM1),
                        DEPT_CATEGORY : gfn_nvl(item.DEPT_CTRGY),
                        SORT_SEQ : gfn_nvl(item.SORT_SEQ),
                        EMP_CODE : gfn_nvl(item.EMP_CD),
                        EMP_NAME : gfn_nvl(item.EMP_NM),
                        POSITION_CODE : gfn_nvl(item.JBPS_CD),
                        DUTY_CODE : gfn_nvl(item.JBTTL_CD),
                        JOB_RANK : gfn_nvl(item.JBGD_CD),
                        WORK_PATTERN_CODE : gfn_nvl(item.WORK_TYPE_CD),
                        OPERATION_NAME : gfn_nvl(item.OPERATION_NAME),
                        TIME_START_DATE : gfn_nvl(item.WRKDY_BGNG_YMD),
                        TIME_END_DATE : gfn_nvl(item.TM_END_YMD),
                        NORMAL_HOUR : gfn_nvl(item.NORMAL_HOUR),
                        OVERTIME_HOUR : gfn_nvl(item.OVERTIME_HOUR),
                        HOLIDAY_HOUR : gfn_nvl(item.HOLIDAY_HOUR),
                        HOLIDAY_OVERTIME_HOUR : gfn_nvl(item.HOLIDAY_OVERTIME_HOUR),
                        NIGHT_HOUR : gfn_nvl(item.NIGHT_HOUR),
                        WEEKLY_ACC_HOUR : gfn_nvl(item.WEEKLY_ACC_HOUR),
                        WEEK52_REMAIN_HOUR : gfn_nvl(item.WEEK52_REMAIN_HOUR),
                        OVERTIME_ACC : gfn_nvl(item.OVERTIME_ACC),
                        HOLIDAY_ACC : gfn_nvl(item.HOLIDAY_ACC),
                        HOLIDAY_OVERTIME_ACC : gfn_nvl(item.HOLIDAY_OVERTIME_ACC),
                        NIGHT_ACC : gfn_nvl(item.NIGHT_ACC)
                    }
                    jsonGvwInfoList.push(msg);
                    totalRecordCount++;
                });

                gvwInfo.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if(jsonGvwInfoList.length > 0) {
                    gvwInfo.clickRow(1);
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

    const fn_findColorList = async function (colorType) {
        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd
            , V_P_COLOR_TYPE : colorType
            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/hrt/selectHrt2370ColorList.do", {
            getType: 'json',
            workType: 'Q',
            cv_count: '1',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.cv_1.length > 0) {
                    yellow = gfn_nvl(data.cv_1[0]["COLOR1"]);
                    pink = gfn_nvl(data.cv_1[0]["COLOR2"]);
                    red = gfn_nvl(data.cv_1[0]["COLOR3"]);
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
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
