<%
    /**
     * @Class Name 		: hrt1410.jsp
     * @Description 	: 근무조 정보 (사원편성) 화면
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
    <title>title : 근무조 정보 (사원편성)</title>
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
                    <th scope="row" class="th_bg_search">사업장코드</th>
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
                    <th scope="row" class="th_bg_search">부서코드</th>
                    <td colspan="3" class="td_input">
                        <sbux-input id="SRCH_DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">부서명</th>
                    <td colspan="3" class="td_input">
                        <sbux-input id="SRCH_DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">기준일자</th>
                    <td class="td_input">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_BASE_YYYYMMDD"
                                name="SRCH_BASE_YYYYMMDD"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td colspan="3"></td>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>생산조직</span>
                                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-treeMaster" style="height:570px;"></div>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>근무조정보</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:11%">
                                    <col style="width:11%">
                                    <col style="width:1%">
                                    <col style="width:3%">
                                    <col style="width:11%">
                                    <col style="width:11%">
                                    <col style="width:11%">
                                    <col style="width:11%">
                                    <col style="width:30%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">사업장</th>
                                    <td colspan="4" class="td_input">
                                        <sbux-select id="SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm" readonly></sbux-select>
                                    </td>
                                    <td colspan="5"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">부서코드</th>
                                    <td class="td_input">
                                        <sbux-input id="DEPT_CODE" class="form-control input-sm input-sm-ast" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <td colspan="4"></td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>부서명</th>
                                    <td class="td_input">
                                        <sbux-input id="DEPT_NAME" class="form-control input-sm input-sm-ast" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">조직장</th>
                                    <td class="td_input" style="border-right:hidden;" data-group="DEPT_LEADER">
                                        <sbux-input id="DEPT_LEADER" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                    </td>
                                    <td></td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;" data-group="DEPT_LEADER">
                                        <sbux-input id="DEPT_LEADER_NAME" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="DEPT_LEADER">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="…" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findDeptLeaderEmpCode"
                                                readonly
                                        ></sbux-button>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>근무패턴</th>
                                    <td class="td_input">
                                        <sbux-select id="WORK_PATTERN_CODE" uitype="single" jsondata-ref="jsonWorkPatternCode" unselected-text="선택" class="form-control input-sm" readonly></sbux-select>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">상위부서</th>
                                    <td class="td_input" style="border-right:hidden;" data-group="PARENT_DEPT">
                                        <sbux-input id="PARENT_DEPT" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                    </td>
                                    <td></td>
                                    <td colspan="2"     class="td_input" style="border-right:hidden;" data-group="PARENT_DEPT">
                                        <sbux-input id="PARENT_DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="PARENT_DEPT">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="…" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findParentDeptCode"
                                                readonly
                                        ></sbux-button>
                                    </td>
                                    <td colspan="4"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">적용기간</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="START_DATE"
                                                name="START_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                                style="width:100%;"
                                                readonly
                                        />
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <span> ~ </span>
                                    </td>
                                    <td colspan="2" class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="END_DATE"
                                                name="END_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                                style="width:100%;"
                                                readonly
                                        />
                                    </td>
                                    <td></td>
                                    <th scope="row" class="th_bg">정렬순서</th>
                                    <td class="td_input">
                                        <sbux-input id="SORT_SEQ" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                    </td>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">비고</th>
                                    <td colspan="7">
                                        <sbux-textarea id="MEMO" rows="2" class="form-control input-sm" uitype="normal" style="width:100%" readonly></sbux-textarea>
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>

                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>추가정보 편집</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="normal" is-scrollable="false" jsondata-ref="jsonTabData">
                            </sbux-tabs>
                            <div class="tab-content">
                                <div id="tpgShiftPatten">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li>
                                                <span>근무조별 패턴 지정</span>
                                            </li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btnDeleteRowForPattern" name="btnDeleteRowForPattern" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForPattern" style="float: right;"></sbux-button>
                                            <sbux-button id="btnAddRowForPattern" name="btnAddRowForPattern" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForPattern" style="float: right;"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_sm">
                                        <div id="sb-area-gvwPattern" style="height:190px;"></div>
                                    </div>
                                </div>
                                <div id="tpgShiftPattenForEmployee">
                                    <div class="ad_tbl_top">
                                        <ul class="ad_tbl_count">
                                            <li>
                                                <span>사원별 근무조 지정</span>
                                            </li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btnDeleteRowForEmp" name="btnDeleteRowForEmp" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForEmp" style="float: right;"></sbux-button>
                                            <sbux-button id="btnAddRowForEmp" name="btnAddRowForEmp" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForEmp" style="float: right;"></sbux-button>
                                            <sbux-button id="btnSearchEmp" name="btnSearchEmp" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger" onclick="fn_searchEmp" style="float: right;"></sbux-button>
                                            <sbux-button id="btnClearMode" name="btnClearMode" uitype="normal" text="복사해제모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('clear')" style="float: right;"></sbux-button>
                                            <sbux-button id="btnLineCopyMode" name="btnLineCopyMode" uitype="normal" text="행복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('line')" style="float: right;"></sbux-button>
                                            <sbux-button id="btnCellCopyMode" name="btnCellCopyMode" uitype="normal" text="셀복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('cell')" style="float: right;"></sbux-button>
                                        </div>
                                    </div>
                                    <div>
                                        <table class="table table-bordered tbl_fixed">
                                            <colgroup>
                                                <col style="width:10%">
                                                <col style="width:10%">
                                                <col style="width:10%">
                                                <col style="width:10%">
                                                <col style="width:60%">
                                            </colgroup>
                                            <tr>
                                                <th scope="row" class="th_bg">사원</th>
                                                <td class="td_input" style="border-right:hidden;" data-group="EMP">
                                                    <sbux-input id="EMP_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;" data-group="EMP">
                                                    <sbux-input id="EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <td class="td_input" style="border-right:hidden;" data-group="EMP">
                                                    <sbux-button
                                                            class="btn btn-xs btn-outline-dark"
                                                            text="…" uitype="modal"
                                                            target-id="modal-compopup1"
                                                            onclick="fn_findEmpCode"
                                                    ></sbux-button>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div>
                                        <div id="sb-area-gvwEmp" style="height:150px;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    var editType			= "N";
    var copyMode            = "clear";

    var jsonSiteCode	= [];	// 사업장
    var jsonWorkPatternCode = []; // 근무패턴
    var jsonEmpState = []; // 재직구분
    var jsonPositionCode = []; // 직위
    var jsonDutyCode = []; // 직책
    var jsonJobRank = []; // 직급

    //grid 초기화
    var gvwPattern; 			// 그리드를 담기위한 객체 선언
    var gvwEmp;
    var treeMaster;

    var jsonPatternList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonEmpList = [];
    var jsonDeptList = [];

    // Tab Data
    var jsonTabData = [
        { "id" : "0",   "pid" : "-1",   "order" : "1",      "text" : "근무조별 패턴지정",             "targetid" : "tpgShiftPatten",    "targetvalue" : "근무조별 패턴지정" },
        { "id" : "1",   "pid" : "-1",   "order" : "2",      "text" : "사원별 근무조 지정",        "targetid" : "tpgShiftPattenForEmployee",    "targetvalue" : "사원별 근무조 지정" }
    ];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['SITE_CODE'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
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
            // 근무패턴
            gfnma_setComSelect(['WORK_PATTERN_CODE', 'gvwPattern', 'gvwEmp'], jsonWorkPatternCode, 'L_HRT020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 재직구분
            gfnma_setComSelect(['gvwEmp'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직위
            gfnma_setComSelect(['gvwEmp'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직책
            gfnma_setComSelect(['gvwEmp'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직급
            gfnma_setComSelect(['gvwEmp'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
        ]);
    }

    var fn_findEmpCode = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("EMP_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI0001_WORK'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", "부서명", "사원코드", "사원명", "재직구분"]
            ,searchInputFields		: ["DEPT_CD", "DEPT_NM", "EMP_CD", "EMP_NM", "EMP_STTS"]
            ,searchInputValues		: ["", "", "", searchText, ""]
            ,searchInputTypes		: ["input", "input", "input", "input", "select"]		//input, datepicker가 있는 경우
            ,searchInputTypeValues	: ["", "", "", "", jsonEmpState]
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서명", "사업장명", "재직구분", "직위", "직책", "직급"]
            ,tableColumnNames		: ["EMP_CD", "EMP_FLNM", "DEPT_NM", "SITE_NM", "EMP_STATE_NAME", "JBPS_CD", "JBTTL_CD", "JBGD_CD"]
            ,tableColumnWidths		: ["80px", "80px", "80px", "120px", "80px", "80px", "80px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('EMP_NAME', data.EMP_NM);
                SBUxMethod.set('EMP_CODE', data.EMP_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findDeptLeaderEmpCode = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("DEPT_LEADER_NAME"));
        var replaceText0 	= "_DEPT_NM_";
        var replaceText1 	= "_EMP_NM_";
        var replaceText2 	= "_EMP_STTS_";
        var strWhereClause 	= "AND X.DEPT_NM LIKE '%" + replaceText0 + "%' AND X.EMP_NM LIKE '%" + replaceText1 + "%' AND X.EMP_STTS LIKE '%" + replaceText2 + "%'";
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서",		"사원", 		"재직상태"]
            ,searchInputFields		: ["DEPT_NM",	"EMP_NM", 	"EMP_STTS"]
            ,searchInputValues		: ["", 			searchText,		""]
            ,searchInputTypes		: ["input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CD", "EMP_NM",  "DEPT_NM", "SITE_NM", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('DEPT_LEADER_NAME', data.EMP_NM);
                SBUxMethod.set('DEPT_LEADER', data.EMP_CD);
            },
        });
    }

    const fn_findParentDeptCode = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("PARENT_DEPT_NAME"));
        var replaceText0 	= "_CSTCT_CD_";
        var replaceText1 	= "_CSTCT_NM_";
        var strWhereClause 	= "AND CC_CODE LIKE '%" + replaceText0 + "%' AND CC_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["원가조직코드", 		"원가조직명"]
            ,searchInputFields		: ["CSTCT_CD", 		"CSTCT_NM"]
            ,searchInputValues		: ["", 			searchText]
            ,height					: '400px'
            ,tableHeader			: ["원가조직코드", "원가조직명"]
            ,tableColumnNames		: ["CSTCT_CD", "CSTCT_NM"]
            ,tableColumnWidths		: ["80px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('PARENT_DEPT_NAME', data.CSTCT_NM);
                SBUxMethod.set('PARENT_DEPT', data.CSTCT_CD);
            },
        });
    }

    const fn_findEmpCodeForGvwEmp = function(nRow) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= gfn_nvl(SBUxMethod.get("DEPT_LEADER_NAME"));
        var replaceText0 	= "_DEPT_CD_";
        var replaceText1 	= "_DEPT_NM_";
        var replaceText2 	= "_EMP_CD_";
        var replaceText3 	= "_EMP_NM_";
        var replaceText4 	= "_EMP_STTS_";
        var strWhereClause 	= "AND X.DEPT_CD LIKE '%" + replaceText0 + "%' AND X.DEPT_NM LIKE '%" + replaceText1 + "%' AND X.EMP_CD LIKE '%" + replaceText2 + "%' AND X.EMP_NM LIKE '%" + replaceText3 + "%' AND X.EMP_STTS LIKE '%" + replaceText4 + "%'";
 
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_EMP_BASE'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서코드", "부서명", "사원코드", "사원명", "재직구분"]
            ,searchInputFields		: ["DEPT_CD", "DEPT_NM", "EMP_CD", "EMP_NM", "EMP_STTS"]
            ,searchInputValues		: ["", "", "", "", ""]
            ,searchInputTypes		: ["input", "input", "input", "input", "select"]		//input, datepicker가 있는 경우
            ,searchInputTypeValues	: ["", "", "", "", jsonEmpState]
            ,height					: '400px'
            ,tableHeader			: ["사원코드", "사원명", "부서코드", "부서명", "직위", "직급", "입사일",  "직종", "직원하위그룹"]
            ,tableColumnNames		: ["EMP_CD", "EMP_NM", "DEPT_CD", "DEPT_NM", "JBPS_CD", "JBGD_CD", "JNCMP_YMD", "JOB_GROUP", "JOB_LWRNK_GROUP"]
            ,tableColumnWidths		: ["80px", "80px", "80px", "120px", "80px", "80px", "80px", "80px"]
            ,itemSelectEvent		: function (data){
                gvwEmp.setRowData(nRow, {
                    DEPT_CODE: data['DEPT_CD'],
                    DEPT_NAME: data['DEPT_NM'],
                    DUTY_CODE: data['JBTTL_CD'],
                    JOB_RANK: data['JBGD_CD'],
                    EMP_CODE: data['EMP_CD'],
                    EMP_NAME: data['EMP_NM'],
                    EMP_STATE: data['EMP_STTS'],
                    ENTER_DATE: data['JNCMP_YMD'],
                    POSITION_CODE: data['JBPS_CD']
                });
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    function fn_createTreeMasterGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-treeMaster';
        SBGridProperties.id 				= 'treeMaster';
        SBGridProperties.jsonref 			= 'jsonDeptList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.tree = {
            col : 0,
            levelref : 'LEVEL',
            open : true,
            lock : false,
            checkbox : false,
            checkboxexceptionlevel : [0],
            openlevel : 10,
            checkboxchildrencheck : false,
            iconclickeventignore : true,
        };
        SBGridProperties.columns = [
            {caption: ["부서명"],        ref: 'DEPT_NAME', 		         type:'output',  	width:'180px',  	style:'text-align:left'},
            {caption: ["부서코드"],        ref: 'DEPT_CODE', 		         type:'output',  	width:'88px',  	style:'text-align:left'},
            {caption: ["정렬순서"],        ref: 'SORT_SEQ', 		         type:'output',  	width:'95px',  	style:'text-align:left'},
            {caption: ["적용시작일"],        ref: 'START_DATE', 		         type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["적용종료일"],        ref: 'END_DATE', 		         type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["사업장"],        ref: 'SITE_CODE', 		         type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["상위부서코드"],        ref: 'PARENT_DEPT', 		         type:'output',  	width:'80px',  	style:'text-align:left', hidden: true},
            {caption: ["상위부서명"],        ref: 'PARENT_DEPT_NAME', 		         type:'output',  	width:'120px',  	style:'text-align:left', hidden: true},
            {caption: ["부서장코드"],        ref: 'DEPT_LEADER', 		         type:'output',  	width:'80px',  	style:'text-align:left', hidden: true},
            {caption: ["부서장명"],        ref: 'COLDEPT_LEADER_NAME', 		         type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["생산팀"],        ref: 'PRODUCTION_DEPT_YN', 		         type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["근태관리"],        ref: 'WORK_TIME_YN', 		         type:'output',  	width:'75px',  	style:'text-align:left, hidden: true', hidden: true},
            {caption: ["WORK_PATTERN_CODE"],        ref: 'WORK_PATTERN_CODE', 		         type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["법인"],        ref: 'COMP_CODE', 		         type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["PARENTKEYID"],        ref: 'PARENTKEYID', 		         type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["KEYID"],        ref: 'KEYID', 		         type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
        ];

        treeMaster = _SBGrid.create(SBGridProperties);
        treeMaster.bind('click', 'fn_view');
        treeMaster.bind('keyup', 'fn_keyup');
    }

    function fn_createGvwPatternGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwPattern';
        SBGridProperties.id 				= 'gvwPattern';
        SBGridProperties.jsonref 			= 'jsonPatternList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.rowheader 			= ['SEQ'];
        SBGridProperties.rowheadercaption 	= {SEQ: 'No'};
        SBGridProperties.rowheaderwidth 	= {SEQ: '60'};
        SBGridProperties.columns = [
            {caption: ["적용시작일"],        ref: 'APPLY_START_DATE', 		         type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["적용종료일"],        ref: 'APPLY_END_DATE', 		         type:'inputdate',  	width:'90px',  	style:'text-align:left',
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
            {caption: ["비고"],         ref: 'MEMO',    type:'input',  	width:'352px',  style:'text-align:left'},
            {caption: ["근무조"], 	        ref: 'DEPT_CODE',    	    type:'input',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["SEQ"],       ref: 'SEQ', 		type:'input',  	width:'100px',  	style:'text-align:left', hidden: true},
        ];

        gvwPattern = _SBGrid.create(SBGridProperties);
    }

    function fn_createGvwEmpGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwEmp';
        SBGridProperties.id 				= 'gvwEmp';
        SBGridProperties.jsonref 			= 'jsonEmpList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사

        if (copyMode == 'clear') { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if(copyMode == 'line'){ //행복사모드
            SBGridProperties.selectmode = 'byrows'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.
        } else if(copyMode == 'cell'){ //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }

        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["부서코드"],        ref: 'DEPT_CODE', 		         type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["부서"],        ref: 'DEPT_NAME', 		         type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["직위"], 		ref: 'POSITION_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["직책"], 		ref: 'DUTY_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },

            {caption: ["직급"], 		ref: 'JOB_RANK',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonJobRank',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["사번"],        ref: 'EMP_CODE', 		         type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["이름"],        ref: 'EMP_NAME', 		         type:'output',  	width:'95px',  	style:'text-align:left'},
            {caption: ["이름"], 		ref: 'EMP_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findEmpCodeForGvwEmp(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["사원별적용"],        ref: 'EMP_BASE_FLAG', 		         type:'checkbox',  	width:'82px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["근무패턴코드"], 		ref: 'WORK_PATTERN_CODE',   	    type:'combo', style:'text-align:left' ,width: '116px',
                typeinfo: {
                    ref			: 'jsonWorkPatternCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["비고"],        ref: 'MEMO', 		         type:'input',  	width:'218px',  	style:'text-align:left'},
            {caption: ["시작일자"],        ref: 'START_DATE', 		         type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["종료일자"],        ref: 'END_DATE', 		         type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["입사일"],        ref: 'ENTER_DATE', 		         type:'inputdate',  	width:'95px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}},
            {caption: ["퇴사일"],        ref: 'RETIRE_DATE', 		         type:'inputdate',  	width:'106px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["재직구분"], 		ref: 'EMP_STATE',   	    type:'combo', style:'text-align:left' ,width: '85px',
                typeinfo: {
                    ref			: 'jsonEmpState',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["순번"],        ref: 'TXN_ID', 		         type:'output',  	width:'54px',  	style:'text-align:left', hidden: true},
        ];

        gvwEmp = _SBGrid.create(SBGridProperties);
        /*gvwEmp.bind('dblclick', 'fn_gvwEmpDblclick');*/
    }

    // 복사모드토글
    const fn_toggleMode = async function (mode) {
        if(mode == "clear") {
            $("#btnClearMode").hide();
            $("#btnLineCopyMode").show();
            $("#btnCellCopyMode").hide();
            copyMode = "line";
        } else if(mode == "line") {
            $("#btnClearMode").hide();
            $("#btnLineCopyMode").hide();
            $("#btnCellCopyMode").show();
            copyMode = "cell";
        } else if (mode == "cell") {
            $("#btnClearMode").show();
            $("#btnLineCopyMode").hide();
            $("#btnCellCopyMode").hide();
            copyMode = "clear";
        }

        _SBGrid.destroy('bandgvwDetail');
        fn_createBandgvwDetailGrid(false);
    }

    // 행추가
    const fn_addRowForPattern = async function () {
        var nRow = treeMaster.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = treeMaster.getRowData(nRow);

        let rowVal = gvwPattern.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwPattern.addRow(true, {DEPT_CODE: rowData.DEPT_CODE});
        }else{
            gvwPattern.insertRow(rowVal, 'below', {DEPT_CODE: rowData.DEPT_CODE});
        }
    }

    const fn_addRowForEmp = async function () {
        var nRow = treeMaster.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = treeMaster.getRowData(nRow);
        let rowVal = gvwEmp.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwEmp.addRow(true,  {DEPT_CODE: rowData.DEPT_CODE, EMP_BASE_FLAG: "N"});
        }else{
            gvwEmp.insertRow(rowVal, 'below', {DEPT_CODE: rowData.DEPT_CODE, EMP_BASE_FLAG: "N"});
        }
    }

    // 행삭제
    const fn_deleteRowForPattern = async function () {
        let rowVal = gvwPattern.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwPattern.deleteRow(rowVal);
        }
    }

    const fn_deleteRowForEmp = async function () {
        let rowVal = gvwEmp.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwEmp.deleteRow(rowVal);
        }
    }

    // 검색
    const fn_searchEmp = async function () {
        var nRow = treeMaster.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = treeMaster.getRowData(nRow);
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(rowData.DEPT_CODE);
        let EMP_CODE = gfn_nvl(SBUxMethod.get("EMP_CODE"));
        let BASE_YYYYMMDD = gfn_nvl(SBUxMethod.get("SRCH_BASE_YYYYMMDD"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_EMP_CODE : EMP_CODE,
            V_P_BASE_YYYYMMDD : BASE_YYYYMMDD,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseEmp = gfn_postJSON("/hr/hrt/com/selectHrt1410List.do", {
            getType				: 'json',
            workType			: 'EMP',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const empData = await postJsonPromiseEmp;

        try {
            if (_.isEqual("S", empData.resultStatus)) {

                jsonEmpList.length = 0;
                empData.cv_2.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        DEPT_CODE : item.DEPT_CD,
                        DEPT_NAME : item.DEPT_NM,
                        EMP_CODE : item.EMP_CD,
                        EMP_NAME : item.EMP_NM,
                        POSITION_CODE : item.JBPS_CD,
                        DUTY_CODE : item.JBTTL_CD,
                        JOB_RANK : item.JBGD_CD,
                        ENTER_DATE : item.JNCMP_YMD,
                        RETIRE_DATE : item.RTRM_YMD,
                        EMP_STATE : item.EMP_STTS,
                        MEMO : item.MEMO,
                        START_DATE : item.BGNG_YMD,
                        END_DATE : item.END_DT,
                        TXN_ID : item.TRSC_ID,
                        EMP_BASE_FLAG : item.EMP_BASE_FLAG,
                        WORK_PATTERN_CODE : item.WRK_PTTRN_CD,
                        SORT_SEQ : item.SORT_SEQ
                    }
                    jsonEmpList.push(msg);
                });

                gvwEmp.rebuild();
            } else {
                alert(empData.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 신규
    function cfn_add() {
        fn_create();
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    // 삭제
    function cfn_del() {
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createTreeMasterGrid();
        fn_createGvwPatternGrid();
        fn_createGvwEmpGrid();
        await fn_onload();
    });

    const fn_create = async function() {
        SBUxMethod.set("SITE_CODE", '');
        SBUxMethod.set("DEPT_CODE", '');
        SBUxMethod.set("DEPT_NAME", '');
        SBUxMethod.set("DEPT_LEADER", '');
        SBUxMethod.set("DEPT_LEADER_NAME", '');
        SBUxMethod.set("WORK_PATTERN_CODE", '');
        SBUxMethod.set("PARENT_DEPT", '');
        SBUxMethod.set("PARENT_DEPT_NAME", '');
        SBUxMethod.set("START_DATE", '');
        SBUxMethod.set("END_DATE", '');
        SBUxMethod.set("SORT_SEQ", '');
        SBUxMethod.set("MEMO", '');

        jsonPatternList.length = 0;
        jsonEmpList.length = 0;

        gvwPattern.rebuild();
        gvwEmp.rebuild();
    }

    const fn_onload = async function () {
        SBUxMethod.set("SRCH_BASE_YYYYMMDD", gfn_dateToYmd(new Date()));
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();

        await fn_search();
    }

    const fn_search = async function() {
        if (!SBUxMethod.validateRequired({group_id:'panHeader'})) {
            return false;
        }

        editType = "N";
        let SITE_CODE	    = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE	    = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let BASE_YYYYMMDD	    = gfn_nvl(SBUxMethod.get("SRCH_BASE_YYYYMMDD"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_EMP_CODE : '',
            V_P_BASE_YYYYMMDD : BASE_YYYYMMDD,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/selectHrt1410List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                jsonDeptList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        DEPT_CODE : item.DEPT_CD,
                        DEPT_NAME : item.DEPT_NM,
                        COMP_CODE : item.CO_CD,
                        SITE_CODE : item.SITE_CD,
                        DEPT_LEADER : item.DEPT_TMLDR,
                        DEPT_LEADER_NAME : item.DEPT_LEADER_NAME,
                        MEMO : item.MEMO,
                        PARENTKEYID : item.UP_KEY_ID,
                        KEYID : item.KEY_ID,
                        PARENT_DEPT : item.PRNT_DEPT,
                        PARENT_DEPT_NAME : item.PARENT_DEPT_NAME,
                        SORT_SEQ : item.SORT_SEQ,
                        WORK_TIME_YN : item.WORK_TM_CHCK_YN,
                        START_DATE : item.BGNG_YMD,
                        END_DATE : item.END_DT,
                        PRODUCTION_DEPT_YN : item.PRDCTN_DEPT_YN,
                        WORK_TIME_YN : item.WORK_TM_CHCK_YN,
                        WORK_PATTERN_CODE : item.WRK_PTTRN_CD,
                        LEVEL: item.LEVEL
                    }
                    jsonDeptList.push(msg);
                });

                treeMaster.rebuild();

                document.querySelector('#listCount').innerText = jsonDeptList.length;

                if(jsonDeptList.length > 0) {
                    treeMaster.clickRow(1);
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

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    const fn_view = async function() {
        editType = "U";
        cfn_add();

        var nRow = treeMaster.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = treeMaster.getRowData(nRow);

        SBUxMethod.set("SITE_CODE", rowData.SITE_CODE);
        SBUxMethod.set("DEPT_CODE", rowData.DEPT_CODE);
        SBUxMethod.set("DEPT_NAME", rowData.DEPT_NAME);
        SBUxMethod.set("DEPT_LEADER", rowData.DEPT_LEADER);
        SBUxMethod.set("DEPT_LEADER_NAME", rowData.DEPT_LEADER_NAME);
        SBUxMethod.set("WORK_PATTERN_CODE", rowData.WORK_PATTERN_CODE);
        SBUxMethod.set("PARENT_DEPT", rowData.PARENT_DEPT);
        SBUxMethod.set("PARENT_DEPT_NAME", rowData.PARENT_DEPT_NAME);
        SBUxMethod.set("START_DATE", rowData.START_DATE);
        SBUxMethod.set("END_DATE", rowData.END_DATE);
        SBUxMethod.set("SORT_SEQ", rowData.SORT_SEQ);
        SBUxMethod.set("MEMO", rowData.MEMO);

        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(rowData.DEPT_CODE);
        let BASE_YYYYMMDD = gfn_nvl(SBUxMethod.get("SRCH_BASE_YYYYMMDD"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_EMP_CODE : '',
            V_P_BASE_YYYYMMDD : BASE_YYYYMMDD,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromisePatten = gfn_postJSON("/hr/hrt/com/selectHrt1410List.do", {
            getType				: 'json',
            workType			: 'PATTERN',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const postJsonPromiseEmp = gfn_postJSON("/hr/hrt/com/selectHrt1410List.do", {
            getType				: 'json',
            workType			: 'EMP',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const pattenData = await postJsonPromisePatten;

        try {
            if (_.isEqual("S", pattenData.resultStatus)) {

                jsonPatternList.length = 0;
                pattenData.cv_3.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        SEQ : item.SEQ,
                        DEPT_CODE : item.DEPT_CD,
                        WORK_PATTERN_CODE : item.WRK_PTTRN_CD,
                        APPLY_START_DATE : item.APLY_STRT_YMD,
                        APPLY_END_DATE : item.APLY_END_YMD,
                        MEMO : item.MEMO
                    }
                    jsonPatternList.push(msg);
                });

                gvwPattern.rebuild();
            } else {
                alert(pattenData.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

        const empData = await postJsonPromiseEmp;

        try {
            if (_.isEqual("S", empData.resultStatus)) {

                jsonEmpList.length = 0;
                empData.cv_2.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        DEPT_CODE : item.DEPT_CD,
                        DEPT_NAME : item.DEPT_NM,
                        EMP_CODE : item.EMP_CD,
                        EMP_NAME : item.EMP_NM,
                        POSITION_CODE : item.JBPS_CD,
                        DUTY_CODE : item.JBTTL_CD,
                        JOB_RANK : item.JBGD_CD,
                        ENTER_DATE : item.JNCMP_YMD,
                        RETIRE_DATE : item.RTRM_YMD,
                        EMP_STATE : item.EMP_STTS,
                        MEMO : item.MEMO,
                        START_DATE : item.BGNG_YMD,
                        END_DATE : item.END_DT,
                        TXN_ID : item.TRSC_ID,
                        EMP_BASE_FLAG : item.EMP_BASE_FLAG,
                        WORK_PATTERN_CODE : item.WRK_PTTRN_CD,
                        SORT_SEQ : item.SORT_SEQ
                    }
                    jsonEmpList.push(msg);
                });

                gvwEmp.rebuild();
            } else {
                alert(empData.resultMessage);
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
        var nRow = treeMaster.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = treeMaster.getRowData(nRow);

        let updatedEmpData = gvwEmp.getUpdateData(true, 'all');
        let updatedPatternData = gvwPattern.getUpdateData(true, 'all');
        let returnEmpData = [];
        let returnPatternData = [];

        updatedEmpData.forEach((item, index) => {
            if (item.data.EMP_BASE_FLAG == "Y") {
                if (gfn_nvl(item.data.WORK_PATTERN_CODE) == "" || gfn_nvl(item.data.START_DATE) == "" || gfn_nvl(item.data.END_DATE) == "") {
                    gfn_comAlert("근무패턴과 기간을 지정하십시요");
                    return false;
                }
            }

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
                    V_P_TXN_ID : gfn_nvl(item.data.TXN_ID) == '' ? '0' : gfn_nvl(item.data.TXN_ID),
                    V_P_DEPT_CODE : item.data.DEPT_CODE,
                    V_P_EMP_CODE : item.data.EMP_CODE,
                    V_P_MEMO : item.data.MEMO,
                    V_P_START_DATE : item.data.START_DATE,
                    V_P_END_DATE : item.data.END_DATE,
                    V_P_EMP_BASE_FLAG : gfn_nvl(item.data.EMP_BASE_FLAG) == '' ? 'N' : gfn_nvl(item.data.EMP_BASE_FLAG),
                    V_P_WORK_PATTERN_CODE : item.data.WORK_PATTERN_CODE,
                    V_P_POSITION_CODE : item.data.POSITION_CODE,
                    V_P_DUTY_CODE : item.data.DUTY_CODE,
                    V_P_JOB_RANK : item.data.JOB_RANK,
                    V_P_FORM_ID : p_formId,
                    V_P_MENU_ID : p_menuId,
                    V_P_PROC_ID : '',
                    V_P_USERID : '',
                    V_P_PC : ''
                })
            }
            returnEmpData.push(param);
        });

        updatedPatternData.forEach((item, index) => {
            if (gfn_nvl(item.data.WORK_PATTERN_CODE) == "" || gfn_nvl(item.data.APPLY_START_DATE) == "" || gfn_nvl(item.data.APPLY_END_DATE) == "") {
                gfn_comAlert("근무패턴과 기간을 지정하십시요");
                return false;
            }

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
                    V_P_SEQ : item.rownum,
                    V_P_DEPT_CODE : item.data.DEPT_CODE,
                    V_P_WORK_PATTERN_CODE : item.data.WORK_PATTERN_CODE,
                    V_P_MEMO : item.data.MEMO,
                    V_P_APPLY_START_DATE : item.data.APPLY_START_DATE,
                    V_P_APPLY_END_DATE : item.data.APPLY_END_DATE,
                    V_P_FORM_ID : p_formId,
                    V_P_MENU_ID : p_menuId,
                    V_P_PROC_ID : '',
                    V_P_USERID : '',
                    V_P_PC : ''
                })
            }
            returnPatternData.push(param);
        });

        if(returnEmpData.length > 0) {
            const postJsonPromiseForEmp = gfn_postJSON("/hr/hrt/com/insertHrt1410Emp.do", {listData: returnEmpData});
            const empData = await postJsonPromiseForEmp;

            try {
                if (_.isEqual("S", empData.resultStatus)) {
                    if(returnPatternData.length <= 0) {
                        gfn_comAlert("I0001");
                        fn_search();
                    }
                } else {
                    alert(empData.resultMessage);
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }

        if(returnPatternData.length > 0) {
            const postJsonPromiseForPattern = gfn_postJSON("/hr/hrt/com/insertHrt1410Patten.do", {listData: returnPatternData});
            const patternData = await postJsonPromiseForPattern;

            try {
                if (_.isEqual("S", patternData.resultStatus)) {
                    fn_search();
                } else {
                    alert(patternData.resultMessage);
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

    const fn_gvwEmpDblclick = async function() {
        var nRow = gvwEmp.getRow();
        var nCol = gvwEmp.getCol();

        if(nCol == 6 || nCol == 7) {
            fn_findEmpCodeForGvwEmp(nRow);
        }
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
