<%
    /**
     * @Class Name 		: hrt1510.jsp
     * @Description 	: 사원별 근무일정관리 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.06.03
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.03   	이경한		최초 생성
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
    <title>title : 사원별 근무일정관리</title>
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
            <div style="margin-left: auto;">
                <sbux-button id="btnUnconfirm" name="btnUnconfirm" uitype="normal" text="확정취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_unconfirm"></sbux-button>
                <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_confirm"></sbux-button>
                <sbux-button id="btnApply" name="btnApply" uitype="normal" text="교대조 정보 생성" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_apply"></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <div class="box-search-ma">
                <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                <table id="srchArea" class="table table-bordered tbl_fixed table-search-ma">
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
                    <td colspan="3" class="td_input">
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
                    <td></td>
                    <th scope="row" class="th_bg_search">재직구분</th>
                    <td colspan="3" class="td_input">
                        <sbux-select id="SRCH_EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">근태관리</th>
                    <td colspan="3" class="td_input">
                        <sbux-select id="SRCH_WORK_TIME_YN" uitype="single" jsondata-ref="jsonWorkTimeYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">직종</th>
                    <td colspan="3" class="td_input">
                        <%--<sbux-select id="SRCH_JOB_GROUP" uitype="single" jsondata-ref="jsonSrchJobGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_JOB_GROUP" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_JOB_GROUP" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">년월</th>
                    <td class="td_input">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_PERIOD_YYYYMM"
                                name="SRCH_PERIOD_YYYYMM"
                                date-format="yyyy-mm"
                                datepicker-mode="month"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                onchange="fn_srchPeriodYyyymm(SRCH_PERIOD_YYYYMM)"
                        />
                    </td>
                    <td colspan="3"></td>
                    <th scope="row" class="th_bg_search">부서</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-input id="SRCH_DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-input id="SRCH_DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findSrchDeptCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg_search">사원</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findEmpCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg_search">
                        <sbux-checkbox
                                uitype="normal"
                                id="SRCH_MULTI_YN"
                                name="SRCH_MULTI_YN"
                                uitype="normal"
                                class="form-control input-sm"
                                text="복수선택"
                                true-value="Y" false-value="N"
                        />
                    </th>
                    <td colspan="4" class="td_input">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="복수선택" uitype="modal"
                                target-id="modal-compopup3"
                                onclick="fn_multiSelect"
                        ></sbux-button>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">적용기간</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_APPLY_START_DATE"
                                name="SRCH_APPLY_START_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <span> ~ </span>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_APPLY_END_DATE"
                                name="SRCH_APPLY_END_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td></td>
                </tr>
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
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwShift" style="height:500px;"></div>
                    </div>
                </div>
                <div class="col-sm-7">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>사원별 교대조 기본정보이력</span>
                            </li>
                        </ul>
                        <div class="ad_tbl_toplist">
                            <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow"></sbux-button>
                            <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow"></sbux-button>
                        </div>
                    </div>
                    <div>
                        <div id="sb-area-gvwShiftInfo" style="height:250px;"></div>
                    </div>

                    <div class="ad_tbl_top2">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>근무일정 설정 체크리스트</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwCheck" style="height:200px;"></div>
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

<div>
    <sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup3">
    <jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
</div>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    var strEmpCodeList = "";

    var jsonShiftCode = []; // 교대조
    var jsonWorkPatternCode = []; // 근무패턴
    var jsonPositionCode = []; // 직위
    var jsonDutyCode = []; // 직책
    var jsonJobRank = []; // 직급
    var jsonEmpState = []; // 재직상태
    var jsonDataSource = []; // 데이터 소스
    var jsonShiftType = []; // 교대조구분
    var jsonStartEndDayType = []; // 시작/종료일자유형
    var jsonSiteCode = []; // 사업장
    var jsonSrchJobGroup = []; // 직종
    var jsonWorkTimeYn = []; // 근태관리 여부

    //grid 초기화
    var gvwShift; 			// 그리드를 담기위한 객체 선언
    var gvwShiftInfo;
    var gvwCheck;

    var jsonEmpList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonShiftInfoList = [];
    var jsonCheckList = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 교대조
            gfnma_setComSelect(['gvwShift', 'gvwShiftInfo'], jsonShiftCode, 'L_HRT_SHIFTCODE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SHWORK_CD', 'SHWORK_TEAM_NM', 'Y', ''),
            // 근무패턴
            gfnma_setComSelect(['gvwShift', 'gvwShiftInfo'], jsonWorkPatternCode, 'L_HRT020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직위
            gfnma_setComSelect(['gvwShift'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직책
            gfnma_setComSelect(['gvwShift'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직급
            gfnma_setComSelect(['gvwShift'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 재직상태
            gfnma_setComSelect(['SRCH_EMP_STATE', 'gvwShift'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 데이터 소스
            gfnma_setComSelect(['gvwShiftInfo'], jsonDataSource, 'L_HRT027', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 교대조구분
            gfnma_setComSelect(['gvwShiftInfo'], jsonShiftType, 'L_HRT034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 시작/종료일자유형
            gfnma_setComSelect(['gvwShiftInfo'], jsonStartEndDayType, 'L_HRT011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['gvwCheck'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
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
                    {caption: "사업장코드",		ref: 'SITE_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "사업장명", 		ref: 'SITE_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 직종
            /*gfnma_setComSelect(['SRCH_JOB_GROUP'], jsonSrchJobGroup, 'L_HRI047_02', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#SRCH_JOB_GROUP']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI047_02'
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
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 근태관리 여부
            gfnma_setComSelect(['SRCH_WORK_TIME_YN'], jsonWorkTimeYn, 'L_COM036', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
        ]);
    }

    const fn_srchPeriodYyyymm = async function(args) {
        SBUxMethod.set("SRCH_APPLY_START_DATE", gfn_dateToYmd(new Date(args.substring(0,4), (args.substring(5,6)-1), 1)));
        SBUxMethod.set("SRCH_APPLY_END_DATE", gfn_dateLastYmd(new Date(args.substring(0,4), (args.substring(5,6)-1), 1)));
    }

    var fn_findSrchDeptCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: [searchCode, 				searchName,		gfn_dateToYmd(new Date())]

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

    const fn_findEmpCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 	= "_DEPT_NM_";
        var replaceText1 	= "_EMP_CD_";
        var replaceText2 	= "_EMP_NM_";
        var replaceText3 	= "_EMP_STTS_";
        var strWhereClause 	= "AND X.DEPT_NM LIKE '%" + replaceText0 + "%' AND X.EMP_CD LIKE '%" + replaceText1 + "%' AND X.EMP_NM LIKE '%" + replaceText2 + "%' AND X.EMP_STTS LIKE '%" + replaceText3 + "%'";
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		"재직상태"]
            ,searchInputFields		: ["DEPT_NM", 	"EMP_CD",		"EMP_NM",		"EMP_STTS"]
            ,searchInputValues		: ["", 			searchCode, searchName,		""]
            ,searchInputTypes		: ["input", 	"input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"", "",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CD", "EMP_NM",  "DEPT_NM", "SITE_NM", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NM);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CD);
            },
        });
    }

    const fn_multiSelect = function() {
        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                strEmpCodeList = "";
                data.forEach((item, index) => {
                    strEmpCodeList += item + "|";
                });

                if (strEmpCodeList.length > 0)
                    strEmpCodeList = strEmpCodeList.substring(0, strEmpCodeList.length - 1);

                if (strEmpCodeList.replaceAll("|", "") == "")
                    SBUxMethod.set("SRCH_MULTI_YN", "N");
                else
                    SBUxMethod.set("SRCH_MULTI_YN", "Y");
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }

    function fn_createGvwShiftGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwShift';
        SBGridProperties.id 				= 'gvwShift';
        SBGridProperties.jsonref 			= 'jsonEmpList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["부서"],         ref: 'DEPT_CODE',    type:'output',  	width:'85px',  style:'text-align:left'},
            {caption: ["사번"],         ref: 'EMP_CODE',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["이름"],         ref: 'EMP_NAME',    type:'output',  	width:'92px',  style:'text-align:left'},
            {caption: ["생산건수"],         ref: 'CREATE_CNT',    type:'output',  	width:'65px',  style:'text-align:left'},
            {caption: ["확정건수"],         ref: 'CONFIRM_CNT',    type:'output',  	width:'58px',  style:'text-align:left'},
            {caption: ["직위"], 		ref: 'POSITION_CODE',   	    type:'combo', style:'text-align:left' ,width: '82px',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["교대조"], 		ref: 'SHIFT_CODE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonShiftCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["근무패턴"], 		ref: 'WORK_PATTERN_CODE',   	    type:'combo', style:'text-align:left' ,width: '140px',
                typeinfo: {
                    ref			: 'jsonWorkPatternCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부서명"],         ref: 'DEPT_NAME',    type:'output',  	width:'119px',  style:'text-align:left'},
            {caption: ["근태관리"],         ref: 'WORK_TIME_YN',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["입사일"],        ref: 'ENTER_DATE', 		         type:'inputdate',  	width:'88px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["부서시작일"],        ref: 'DEPT_START_DATE', 		         type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["부서종료일"],        ref: 'DEPT_END_DATE', 		         type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["퇴사일"],        ref: 'RETIRE_DATE', 		         type:'inputdate',  	width:'91px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["재직상태"], 		ref: 'EMP_STATE',   	    type:'combo', style:'text-align:left' ,width: '82px',
                typeinfo: {
                    ref			: 'jsonEmpState',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["직책"], 		ref: 'DUTY_CODE',   	    type:'combo', style:'text-align:left' ,width: '82px',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["직급"], 		ref: 'JOB_RANK',   	    type:'combo', style:'text-align:left' ,width: '79px',
                typeinfo: {
                    ref			: 'jsonJobRank',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
        ];

        gvwShift = _SBGrid.create(SBGridProperties);
        gvwShift.bind('click', 'fn_view');
        gvwShift.bind('keyup', 'fn_keyup');
    }

    function fn_createGvwShiftInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwShiftInfo';
        SBGridProperties.id 				= 'gvwShiftInfo';
        SBGridProperties.jsonref 			= 'jsonShiftInfoList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["확정여부"],         ref: 'CONFIRM_FLAG',    type:'checkbox',  	width:'75px',  style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["일자"],        ref: 'YYYYMMDD', 		         type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["근무패턴"], 		ref: 'WORK_PATTERN_CODE',   	    type:'combo', style:'text-align:left' ,width: '140px',
                typeinfo: {
                    ref			: 'jsonWorkPatternCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["교대조"], 		ref: 'SHIFT_CODE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonShiftCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["출근시각"],        ref: 'WORK_ON_HHMM', 		         type:'input',  	width:'70px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["퇴근시각"],        ref: 'WORK_OFF_HHMM', 		         type:'input',  	width:'70px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["정상근무시작유형"], 		ref: 'NORMAL_START_DAY_TYPE',   	    type:'combo', style:'text-align:left' ,width: '89px',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["정상근무시작시각"],        ref: 'NORMAL_START_HHMM', 		         type:'input',  	width:'91px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["정상근무종료유형"], 		ref: 'NORMAL_END_DAY_TYPE',   	    type:'combo', style:'text-align:left' ,width: '94px',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["정상근무종료시각"],        ref: 'NORMAL_END_HHMM', 		         type:'input',  	width:'89px',  	style:'text-align:left',
                format : {type : 'date', rule : 'HH:mm', origin : 'HHmm'}
            },
            {caption: ["공휴일여부"],         ref: 'HOLIDAY_YN',    type:'checkbox',  	width:'75px',  style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["명절여부"],         ref: 'HOLIDAY2_YN',    type:'checkbox',  	width:'75px',  style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["휴게적용여부"],         ref: 'BREAK_APPLY_YN',    type:'checkbox',  	width:'91px',  style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["교대조구분"], 		ref: 'SHIFT_TYPE',   	    type:'combo', style:'text-align:left' ,width: '91px',
                typeinfo: {
                    ref			: 'jsonShiftType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["데이타소스"], 		ref: 'DATA_SOURCE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonDataSource',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["교대조(원)"],       ref: 'SHIFT_CODE_ORIG', 		type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["정상근무시작유형(원)"],       ref: 'NORMAL_START_DAY_TYPE_ORIG', 		type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["정상근무시작시각(원)"],       ref: 'NORMAL_START_HHMM_ORIG', 		type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["정상근무종료유형(원)"],       ref: 'NORMAL_END_DAY_TYPE_ORIG', 		type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["정상근무종료시각(원)"],       ref: 'NORMAL_END_HHMM_OIRG', 		type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["휴게적용여부(원)"],       ref: 'BREAK_APPLY_YN_OIRG', 		type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
        ];

        gvwShiftInfo = _SBGrid.create(SBGridProperties);
        gvwShiftInfo.bind('valuechanged','fn_gvwShiftInfoValueChanged');
    }

    function fn_createGvwCheckGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwCheck';
        SBGridProperties.id 				= 'gvwCheck';
        SBGridProperties.jsonref 			= 'jsonCheckList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부서"],         ref: 'DEPT_CODE',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["부서명"],         ref: 'DEPT_NAME',    type:'output',  	width:'128px',  style:'text-align:left'},
            {caption: ["사번"],         ref: 'EMP_CODE',    type:'output',  	width:'82px',  style:'text-align:left'},
            {caption: ["사원명"],         ref: 'EMP_NAME',    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["근태관리여부"],         ref: 'WORK_TIME_YN',    type:'checkbox',  	width:'96px',  style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}, disabled: true},
            {caption: ["일자"],        ref: 'YYYYMMDD', 		         type:'inputdate',  	width:'101px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["근무패턴코드"],         ref: 'WORK_PATTERN_CODE',    type:'output',  	width:'110px',  style:'text-align:left'},
            {caption: ["체크유형"],         ref: 'CHECK_TYPE',    type:'output',  	width:'110px',  style:'text-align:left'},
            {caption: ["설정가이드"],         ref: 'SETUP_GUIDE',    type:'output',  	width:'445px',  style:'text-align:left'},
            {caption: ["법인"],         ref: 'COMP_CODE',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true},
        ];

        gvwCheck = _SBGrid.create(SBGridProperties);
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwShiftGrid();
        fn_createGvwShiftInfoGrid();
        fn_createGvwCheckGrid();
        await fn_onload();
    });

    // 행추가
    const fn_addRow = async function () {
        let rowVal = gvwShiftInfo.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwShiftInfo.addRow(true, {
                CONFIRM_FLAG: "N",
                HOLIDAY_YN: "N",
                HOLIDAY2_YN: "N",
                BREAK_APPLY_YN: "N"
            });
        }else{
            gvwShiftInfo.insertRow(rowVal, 'below', {
                CONFIRM_FLAG: "N",
                HOLIDAY_YN: "N",
                HOLIDAY2_YN: "N",
                BREAK_APPLY_YN: "N"
            });
        }
    }

    // 행삭제
    const fn_deleteRow = async function () {
        let rowVal = gvwShiftInfo.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwShiftInfo.deleteRow(rowVal);
        }
    }

    const fn_gvwShiftInfoValueChanged = async function() {
        var nRow = gvwShiftInfo.getRow();
        var nCol = gvwShiftInfo.getCol();
        var rowData = gvwShiftInfo.getRowData(nRow);

       if (nCol == gvwShiftInfo.getColRef('SHIFT_CODE')) {
            if (gfn_nvl(rowData.SHIFT_CODE) == "") {
                return;
            } else {
                let YYYYMMDD_FR = gfn_nvl(SBUxMethod.get("SRCH_APPLY_START_DATE"));
                let YYYYMMDD_TO = gfn_nvl(SBUxMethod.get("SRCH_APPLY_END_DATE"));
                let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
                let DEPT_CODE = gfn_nvl(rowData.DEPT_CODE);
                let EMP_CODE = gfn_nvl(rowData.EMP_CODE);
                let EMP_CODE_D = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE_D"));
                let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
                let WORK_TIME_YN = gfn_nvl(SBUxMethod.get("SRCH_WORK_TIME_YN"));
                let JOB_GROUP = gfn_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));
                let SHIFT_CODE = gfn_nvl(rowData.SHIFT_CODE);

                var paramObj = {
                    V_P_DEBUG_MODE_YN	: '',
                    V_P_LANG_ID		: '',
                    V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                    V_P_YYYYMMDD_FR : YYYYMMDD_FR,
                    V_P_YYYYMMDD_TO : YYYYMMDD_TO,
                    V_P_SITE_CODE : SITE_CODE,
                    V_P_DEPT_CODE : DEPT_CODE,
                    V_P_EMP_CODE : EMP_CODE,
                    V_P_EMP_CODE_D : EMP_CODE_D,
                    V_P_EMP_STATE : EMP_STATE,
                    V_P_LOGIN_DEPT_CODE : '',
                    V_P_HR_MANAGER_YN : '',
                    V_P_WORK_TIME_YN : WORK_TIME_YN,
                    V_P_JOB_GROUP : JOB_GROUP,
                    V_P_SHIFT_CODE : SHIFT_CODE,
                    V_P_WORK_PATTERN_CODE : '',
                    V_P_FORM_ID		: p_formId,
                    V_P_MENU_ID		: p_menuId,
                    V_P_PROC_ID		: '',
                    V_P_USERID			: '',
                    V_P_PC				: ''
                };

                const postJsonPromiseForShift = gfn_postJSON("/hr/hrt/com/selectHrt1510List.do", {
                    getType				: 'json',
                    workType			: 'SHIFT',
                    cv_count			: '8',
                    params				: gfnma_objectToString(paramObj)
                });

                const listData = await postJsonPromiseForShift;

                try {
                    if (_.isEqual("S", listData.resultStatus)) {
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("WORK_ON_HHMM"), gfn_nvl(listData.cv_1[0].GTWK_TM), true);
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("WORK_OFF_HHMM"), gfn_nvl(listData.cv_1[0].LVWK_TM), true);
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("NORMAL_START_DAY_TYPE"), gfn_nvl(listData.cv_1[0].NML_BGNG_DAY_TYPE), true);
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("NORMAL_START_HHMM"), gfn_nvl(listData.cv_1[0].NML_WORK_BGNG_TM), true);
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("NORMAL_END_DAY_TYPE"), gfn_nvl(listData.cv_1[0].NML_END_DAY_TYPE), true);
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("NORMAL_END_HHMM"), gfn_nvl(listData.cv_1[0].NML_WORK_END_TM), true);
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("BREAK_APPLY_YN"), gfn_nvl(listData.cv_1[0].BRTM_APLY_YN), true);
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("NORMAL_START_DAY_TYPE_ORIG"), gfn_nvl(listData.cv_1[0].NML_BGNG_DAY_TYPE_ORGNL), true);
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("NORMAL_START_HHMM_ORIG"), gfn_nvl(listData.cv_1[0].NML_WORK_BGNG_TM_ORGNL), true);
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("NORMAL_END_DAY_TYPE_ORIG"), gfn_nvl(listData.cv_1[0].NML_END_DAY_TYPE_ORGNL), true);
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("NORMAL_END_HHMM_ORIG"), gfn_nvl(listData.cv_1[0].NML_WORK_END_TM_ORGNL), true);
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("BREAK_APPLY_YN_ORIG"), gfn_nvl(listData.cv_1[0].BRTM_APLY_YN_ORGNLY), true);
                    } else {
                        alert(listData.resultMessage);
                    }

                } catch (e) {
                    if (!(e instanceof Error)) {
                        e = new Error(e);
                    }
                    console.error("failed", e.message);
                    gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
                }
            }
        } else if (nCol == gvwShiftInfo.getColRef('WORK_PATTERN_CODE')) {
            if (gfn_nvl(rowData.WORK_PATTERN_CODE) == "") {
                return;
            } else {
                let YYYYMMDD_FR = gfn_nvl(SBUxMethod.get("SRCH_APPLY_START_DATE"));
                let YYYYMMDD_TO = gfn_nvl(SBUxMethod.get("SRCH_APPLY_END_DATE"));
                let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
                let DEPT_CODE = gfn_nvl(rowData.DEPT_CODE);
                let EMP_CODE = gfn_nvl(rowData.EMP_CODE);
                let EMP_CODE_D = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE_D"));
                let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
                let WORK_TIME_YN = gfn_nvl(SBUxMethod.get("SRCH_WORK_TIME_YN"));
                let JOB_GROUP = gfn_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));
                let WORK_PATTERN_CODE = gfn_nvl(rowData.WORK_PATTERN_CODE);

                var paramObj = {
                    V_P_DEBUG_MODE_YN	: '',
                    V_P_LANG_ID		: '',
                    V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                    V_P_YYYYMMDD_FR : YYYYMMDD_FR,
                    V_P_YYYYMMDD_TO : YYYYMMDD_TO,
                    V_P_SITE_CODE : SITE_CODE,
                    V_P_DEPT_CODE : DEPT_CODE,
                    V_P_EMP_CODE : EMP_CODE,
                    V_P_EMP_CODE_D : EMP_CODE_D,
                    V_P_EMP_STATE : EMP_STATE,
                    V_P_LOGIN_DEPT_CODE : '',
                    V_P_HR_MANAGER_YN : '',
                    V_P_WORK_TIME_YN : WORK_TIME_YN,
                    V_P_JOB_GROUP : JOB_GROUP,
                    V_P_SHIFT_CODE : '',
                    V_P_WORK_PATTERN_CODE : WORK_PATTERN_CODE,
                    V_P_FORM_ID		: p_formId,
                    V_P_MENU_ID		: p_menuId,
                    V_P_PROC_ID		: '',
                    V_P_USERID			: '',
                    V_P_PC				: ''
                };

                const postJsonPromiseForShift = gfn_postJSON("/hr/hrt/com/selectHrt1510List.do", {
                    getType				: 'json',
                    workType			: 'PATTERN',
                    cv_count			: '8',
                    params				: gfnma_objectToString(paramObj)
                });

                const listData = await postJsonPromiseForShift;

                try {
                    if (_.isEqual("S", listData.resultStatus)) {
                        gvwShiftInfo.setCellData(nRow, gvwShiftInfo.getColRef("SHIFT_TYPE"), gfn_nvl(listData.cv_1[0].SHWORK_TYPE), true);
                    } else {
                        alert(listData.resultMessage);
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
    }

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    const fn_onload = async function () {
        SBUxMethod.set("SRCH_PERIOD_YYYYMM", gfn_dateToYm(new Date()));
        SBUxMethod.set("SRCH_APPLY_START_DATE", gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("SRCH_APPLY_END_DATE", gfn_dateLastYmd(new Date()));

        await fn_search();
    }

    const fn_search = async function() {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'})) {
            return false;
        }

        let YYYYMMDD_FR = gfn_nvl(SBUxMethod.get("SRCH_APPLY_START_DATE"));
        let YYYYMMDD_TO = gfn_nvl(SBUxMethod.get("SRCH_APPLY_END_DATE"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_CODE_D = gfn_nvl(strEmpCodeList);
        let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let WORK_TIME_YN = gfn_nvl(SBUxMethod.get("SRCH_WORK_TIME_YN"));
        let JOB_GROUP = gfn_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMMDD_FR : YYYYMMDD_FR,
            V_P_YYYYMMDD_TO : YYYYMMDD_TO,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_CODE_D : EMP_CODE_D,
            V_P_EMP_STATE : EMP_STATE,
            V_P_LOGIN_DEPT_CODE : '',
            V_P_HR_MANAGER_YN : '',
            V_P_WORK_TIME_YN : WORK_TIME_YN,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_SHIFT_CODE : '',
            V_P_WORK_PATTERN_CODE : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/com/selectHrt1510List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '8',
            params				: gfnma_objectToString(paramObj)
        });

        const postJsonPromiseForCheck = gfn_postJSON("/hr/hrt/com/selectHrt1510List.do", {
            getType				: 'json',
            workType			: 'CHECK',
            cv_count			: '8',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                jsonEmpList.length = 0;
                listData.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        DEPT_NAME : item.DEPT_NM,
                        EMP_CODE : item.EMP_CD,
                        EMP_NAME : item.EMP_NM,
                        POSITION_CODE : item.JBPS_CD,
                        DUTY_CODE : item.JBTTL_CD,
                        JOB_RANK : item.JBGD_CD,
                        SITE_CODE : item.SITE_CD,
                        DEPT_CODE : item.DEPT_CD,
                        ENTER_DATE : item.JNCMP_YMD,
                        RETIRE_DATE : item.RTRM_YMD,
                        DEPT_START_DATE : item.DEPT_BGNG_YMD,
                        DEPT_END_DATE : item.DEPT_END_YMD,
                        EMP_STATE : item.EMP_STTS,
                        SORT_SEQ : item.SORT_SEQ,
                        SORT_SEQ2 : item.SORT_SEQ2,
                        WORK_TIME_YN : item.WORK_TM_CHCK_YN,
                        CREATE_CNT : item.CREATE_CNT,
                        CONFIRM_CNT : item.CONFIRM_CNT,
                        WORK_PATTERN_CODE : item.WORK_TYPE_CD
                    }

                    jsonEmpList.push(msg);
                });

                gvwShift.rebuild();
                document.querySelector('#listCount').innerText = jsonEmpList.length;

                if(jsonEmpList.length > 0) {
                    gvwShift.clickRow(1);
                }
            } else {
                alert(listData.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

        const checkData = await postJsonPromiseForCheck;

        try {
            if (_.isEqual("S", checkData.resultStatus)) {

                jsonCheckList.length = 0;
                checkData.cv_8.forEach((item, index) => {
                    const msg = {
                        EMP_CODE : item.EMP_CD,
                        EMP_NAME : item.EMP_NM,
                        SITE_CODE : item.SITE_CD,
                        DEPT_CODE : item.DEPT_CD,
                        DEPT_NAME : item.DEPT_NM,
                        POSITION_CODE : item.JBPS_CD,
                        DUTY_CODE : item.JBTTL_CD,
                        JOB_RANK : item.JBGD_CD,
                        WORK_PATTERN_CODE : item.WORK_TYPE_CD,
                        YYYYMMDD : item.YMD,
                        SHIFT_CODE : item.SHWORK_CD,
                        WORK_TIME_YN : item.WORK_TM_CHCK_YN,
                        CHECK_TYPE : item.HLTH_CKUP_TYPE,
                        SETUP_GUIDE : item.SETUP_GUIDE,
                        SORT_SEQ : item.SORT_SEQ
                    }
                    jsonCheckList.push(msg);
                });

                gvwCheck.rebuild();
            } else {
                alert(checkData.resultMessage);
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

    const fn_view = async function() {
        var nRow = gvwShift.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = gvwShift.getRowData(nRow);

        let YYYYMMDD_FR = gfn_nvl(SBUxMethod.get("SRCH_APPLY_START_DATE"));
        let YYYYMMDD_TO = gfn_nvl(SBUxMethod.get("SRCH_APPLY_END_DATE"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(rowData.DEPT_CODE);
        let EMP_CODE = gfn_nvl(rowData.EMP_CODE);
        let EMP_CODE_D = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE_D"));
        let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let WORK_TIME_YN = gfn_nvl(SBUxMethod.get("SRCH_WORK_TIME_YN"));
        let JOB_GROUP = gfn_nvl(gfnma_multiSelectGet('#SRCH_JOB_GROUP'));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMMDD_FR : YYYYMMDD_FR,
            V_P_YYYYMMDD_TO : YYYYMMDD_TO,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_CODE_D : EMP_CODE_D,
            V_P_EMP_STATE : EMP_STATE,
            V_P_LOGIN_DEPT_CODE : '',
            V_P_HR_MANAGER_YN : '',
            V_P_WORK_TIME_YN : WORK_TIME_YN,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_SHIFT_CODE : '',
            V_P_WORK_PATTERN_CODE : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/selectHrt1510List.do", {
            getType				: 'json',
            workType			: 'HISTORY',
            cv_count			: '8',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonShiftInfoList.length = 0;
                data.cv_2.forEach((item, index) => {
                    const msg = {
                        YYYYMMDD : item.YMD,
                        SHIFT_CODE : item.SHWORK_CD,
                        DEPT_CODE : item.DEPT_CD,
                        WORK_PATTERN_CODE : item.WORK_TYPE_CD,
                        WORK_ON_HHMM : item.GTWK_TM,
                        WORK_OFF_HHMM : item.LVWK_TM,
                        NORMAL_START_DAY_TYPE : item.NML_BGNG_DAY_TYPE,
                        NORMAL_START_HHMM : item.NML_WORK_BGNG_TM,
                        NORMAL_END_DAY_TYPE : item.NML_END_DAY_TYPE,
                        NORMAL_END_HHMM : item.NML_WORK_END_TM,
                        BREAK_APPLY_YN : item.BRTM_APLY_YN,
                        NORMAL_START_DAY_TYPE_ORIG : item.NML_BGNG_DAY_TYPE_ORGNL,
                        NORMAL_START_HHMM_ORIG : item.NML_WORK_BGNG_TM_ORGNL,
                        NORMAL_END_DAY_TYPE_ORIG : item.NML_END_DAY_TYPE_ORGNL,
                        NORMAL_END_HHMM_ORIG : item.NML_WORK_END_TM_ORGNL,
                        BREAK_APPLY_YN_ORIG : item.BRTM_APLY_YN_ORGNLY,
                        DATA_SOURCE : item.DATA_SRC,
                        CONFIRM_FLAG : item.CFMTN_FLAG,
                        TXN_ID : item.TRSC_ID,
                        HOLIDAY_YN : item.HLDY_YN,
                        HOLIDAY2_YN : item.HLDY2_YN,
                        SHIFT_TYPE : item.SHWORK_TYPE
                    }

                    jsonShiftInfoList.push(msg);
                });

                gvwShiftInfo.rebuild();
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

    const fn_save = async function() {
        var nRow = gvwShift.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = gvwShift.getRowData(nRow);

        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(rowData.DEPT_CODE);
        let EMP_CODE = gfn_nvl(rowData.EMP_CODE);
        let updatedData = gvwShiftInfo.getUpdateData(true, 'all');
        let listData = [];

        updatedData.forEach((item, index) => {
            const param = {
                cv_count : '0',
                getType : 'json',
                rownum: item.rownum,
                workType : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({
                    V_P_DEBUG_MODE_YN : '',
                    V_P_LANG_ID	: '',
                    V_P_COMP_CODE : gv_ma_selectedCorpCd,
                    V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                    V_P_SITE_CODE : SITE_CODE,
                    V_P_DEPT_CODE : DEPT_CODE,
                    V_P_EMP_CODE : EMP_CODE,
                    V_P_TXN_ID : gfn_nvl(item.data.TXN_ID) == '' ? 0 : item.data.TXN_ID,
                    V_P_APPLY_START_DATE : '',
                    V_P_APPLY_END_DATE : '',
                    V_P_YYYYMMDD : item.data.YYYYMMDD,
                    V_P_SHIFT_CODE : item.data.SHIFT_CODE,
                    V_P_WORK_PATTERN_CODE : item.data.WORK_PATTERN_CODE,
                    V_P_SHIFT_TYPE : item.data.SHIFT_TYPE,
                    V_P_CONFIRM_FLAG : item.data.CONFIRM_FLAG,
                    V_P_DATA_SOURCE : item.data.DATA_SOURCE,
                    V_P_HOLIDAY_YN : item.data.HOLIDAY_YN,
                    V_P_HOLIDAY2_YN : item.data.HOLIDAY2_YN,
                    V_P_EMP_CODE_D : '',
                    V_P_NORMAL_START_DAY_TYPE : item.data.NORMAL_START_DAY_TYPE,
                    V_P_NORMAL_START_HHMM : item.data.NORMAL_START_HHMM,
                    V_P_NORMAL_END_DAY_TYPE : item.data.NORMAL_END_DAY_TYPE,
                    V_P_NORMAL_END_HHMM : item.data.NORMAL_END_HHMM,
                    V_P_BREAK_APPLY_YN : item.data.BREAK_APPLY_YN,
                    V_P_FORM_ID : p_formId,
                    V_P_MENU_ID : p_menuId,
                    V_P_PROC_ID : '',
                    V_P_USERID : '',
                    V_P_PC : ''
                })
            }
            listData.push(param);
        });

        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt1510List.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    await fn_search();
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

    const fn_apply = async function() {
        let APPLY_START_DATE = gfn_nvl(SBUxMethod.get("SRCH_APPLY_START_DATE"));
        let APPLY_END_DATE = gfn_nvl(SBUxMethod.get("SRCH_APPLY_END_DATE"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));

        let grdRows = gvwShift.getCheckedRows(0, true);
        let EMP_CODE_D = "";

        if (grdRows.legnth == 0) {
            gfn_comAlert("좌측 목록에서 인원을 선택하십시요");
            return false;
        }

        grdRows.forEach((item, index) => {
            EMP_CODE_D += gvwShift.getRowData(item).EMP_CODE + "|"
        });

        if (EMP_CODE_D.length > 0) {
            EMP_CODE_D = EMP_CODE_D.substring(0, EMP_CODE_D.length - 1);
        }

        let listData = [{
            cv_count : '0',
            getType : 'json',
            rownum: 0,
            workType : 'APPLY',
            params: gfnma_objectToString({
                V_P_DEBUG_MODE_YN : '',
                V_P_LANG_ID	: '',
                V_P_COMP_CODE : gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_SITE_CODE : SITE_CODE,
                V_P_DEPT_CODE : DEPT_CODE,
                V_P_EMP_CODE : EMP_CODE,
                V_P_TXN_ID : 0,
                V_P_APPLY_START_DATE : APPLY_START_DATE,
                V_P_APPLY_END_DATE : APPLY_END_DATE,
                V_P_YYYYMMDD : '',
                V_P_SHIFT_CODE : '',
                V_P_WORK_PATTERN_CODE : '',
                V_P_SHIFT_TYPE : '',
                V_P_CONFIRM_FLAG : '',
                V_P_DATA_SOURCE : '1',
                V_P_HOLIDAY_YN : '',
                V_P_HOLIDAY2_YN : '',
                V_P_EMP_CODE_D : EMP_CODE_D,
                V_P_NORMAL_START_DAY_TYPE : '',
                V_P_NORMAL_START_HHMM : '',
                V_P_NORMAL_END_DAY_TYPE : '',
                V_P_NORMAL_END_HHMM : '',
                V_P_BREAK_APPLY_YN : '',
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            })
        }];

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt1510List.do", {listData: listData});

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.resultMessage){
                    alert(data.resultMessage);
                }
                await fn_search();
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

    const fn_confirm = async function() {
        let APPLY_START_DATE = gfn_nvl(SBUxMethod.get("SRCH_APPLY_START_DATE"));
        let APPLY_END_DATE = gfn_nvl(SBUxMethod.get("SRCH_APPLY_END_DATE"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));

        let grdRows = gvwShift.getCheckedRows(0, true);
        let EMP_CODE_D = "";

        if (grdRows.legnth == 0) {
            gfn_comAlert("좌측 목록에서 인원을 선택하십시요");
            return false;
        }

        grdRows.forEach((item, index) => {
            EMP_CODE_D += gvwShift.getRowData(item).EMP_CODE + "|"
        });

        if (EMP_CODE_D.length > 0) {
            EMP_CODE_D = EMP_CODE_D.substring(0, EMP_CODE_D.length - 1);
        }

        let listData = [{
            cv_count : '0',
            getType : 'json',
            rownum: 0,
            workType : 'CONFIRM',
            params: gfnma_objectToString({
                V_P_DEBUG_MODE_YN : '',
                V_P_LANG_ID	: '',
                V_P_COMP_CODE : gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_SITE_CODE : SITE_CODE,
                V_P_DEPT_CODE : DEPT_CODE,
                V_P_EMP_CODE : EMP_CODE,
                V_P_TXN_ID : 0,
                V_P_APPLY_START_DATE : APPLY_START_DATE,
                V_P_APPLY_END_DATE : APPLY_END_DATE,
                V_P_YYYYMMDD : '',
                V_P_SHIFT_CODE : '',
                V_P_WORK_PATTERN_CODE : '',
                V_P_SHIFT_TYPE : '',
                V_P_CONFIRM_FLAG : '',
                V_P_DATA_SOURCE : '1',
                V_P_HOLIDAY_YN : '',
                V_P_HOLIDAY2_YN : '',
                V_P_EMP_CODE_D : EMP_CODE_D,
                V_P_NORMAL_START_DAY_TYPE : '',
                V_P_NORMAL_START_HHMM : '',
                V_P_NORMAL_END_DAY_TYPE : '',
                V_P_NORMAL_END_HHMM : '',
                V_P_BREAK_APPLY_YN : '',
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            })
        }];

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt1510List.do", {listData: listData});

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.resultMessage){
                    alert(data.resultMessage);
                }
                await fn_search();
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

    const fn_unconfirm = async function() {
        let APPLY_START_DATE = gfn_nvl(SBUxMethod.get("SRCH_APPLY_START_DATE"));
        let APPLY_END_DATE = gfn_nvl(SBUxMethod.get("SRCH_APPLY_END_DATE"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));

        let grdRows = gvwShift.getCheckedRows(0, true);
        let EMP_CODE_D = "";

        if (grdRows.legnth == 0) {
            gfn_comAlert("좌측 목록에서 인원을 선택하십시요");
            return false;
        }

        grdRows.forEach((item, index) => {
            EMP_CODE_D += gvwShift.getRowData(item).EMP_CODE + "|"
        });

        if (EMP_CODE_D.length > 0) {
            EMP_CODE_D = EMP_CODE_D.substring(0, EMP_CODE_D.length - 1);
        }

        let listData = [{
            cv_count : '0',
            getType : 'json',
            rownum: 0,
            workType : 'UNCONFIRM',
            params: gfnma_objectToString({
                V_P_DEBUG_MODE_YN : '',
                V_P_LANG_ID	: '',
                V_P_COMP_CODE : gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                V_P_SITE_CODE : SITE_CODE,
                V_P_DEPT_CODE : DEPT_CODE,
                V_P_EMP_CODE : EMP_CODE,
                V_P_TXN_ID : 0,
                V_P_APPLY_START_DATE : APPLY_START_DATE,
                V_P_APPLY_END_DATE : APPLY_END_DATE,
                V_P_YYYYMMDD : '',
                V_P_SHIFT_CODE : '',
                V_P_WORK_PATTERN_CODE : '',
                V_P_SHIFT_TYPE : '',
                V_P_CONFIRM_FLAG : '',
                V_P_DATA_SOURCE : '1',
                V_P_HOLIDAY_YN : '',
                V_P_HOLIDAY2_YN : '',
                V_P_EMP_CODE_D : EMP_CODE_D,
                V_P_NORMAL_START_DAY_TYPE : '',
                V_P_NORMAL_START_HHMM : '',
                V_P_NORMAL_END_DAY_TYPE : '',
                V_P_NORMAL_END_HHMM : '',
                V_P_BREAK_APPLY_YN : '',
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            })
        }];

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt1510List.do", {listData: listData});

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.resultMessage){
                    alert(data.resultMessage);
                }
                await fn_search();
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