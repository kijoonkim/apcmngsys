<%
    /**
     * @Class Name 		: hri1000.jsp
     * @Description 	: 증명서발급 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.05.14
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.05.14   	이경한		최초 생성
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
    <title>title : 증명서발급</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
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
<%--                <sbux-button id="btnSearch" name="btnSearch" 	uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="cfn_search"></sbux-button>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="cfn_save"></sbux-button>
                <sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="cfn_del"></sbux-button>--%>
                <sbux-button id="btnAdminApproval" name="btnAdminApproval" uitype="normal" class="btn btn-sm btn-outline-danger" text="관리자승인" onclick="fn_adminApproval"></sbux-button>
                <sbux-button id="btnPrint" name="btnPrint" uitype="normal" class="btn btn-sm btn-outline-danger" text="출력" onclick="fn_print"></sbux-button>
                <sbux-button id="btnApproval" name="btnApproval" uitype="normal" class="btn btn-sm btn-outline-danger" text="결재처리" onclick="fn_approval"></sbux-button>
                <sbux-button id="btnApprovalList" name="btnApprovalList" uitype="normal" class="btn btn-sm btn-outline-danger" text="결재내역" onclick="fn_approvalList"></sbux-button>
            </div>
        </div>
        <div class="box-body">

            <!--[pp] 검색 -->
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <table class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 11%">
                    <col style="width: 11%">
                    <col style="width: 11%">
                    <col style="width: 11%">
                    <col style="width: 11%">
                    <col style="width: 11%">
                    <col style="width: 11%">
                    <col style="width: 11%">
                    <col style="width: 11%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">신청일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_REQUEST_DATE_FR"
                                name="SRCH_REQUEST_DATE_FR"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <span> ~ </span>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_REQUEST_DATE_TO"
                                name="SRCH_REQUEST_DATE_TO"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <th scope="row" class="th_bg">증명서유형</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_REPORT_TYPE" uitype="single" jsondata-ref="jsonReportType" unselected-text="선택    " class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">진행상태</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_CONFIRM_STEP" uitype="single" jsondata-ref="jsonConfirmStep" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">부서</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findSrchDeptCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">사원</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm" readonly></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findSrchEmpCode"
                        ></sbux-button>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>증명서발급</span>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-bandgvwInfo" style="height:350px;"></div>
                </div>
                <div class="ad_tbl_top2">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>증명서발급 신청</span>
                        </li>
                    </ul>
                </div>
                <div class="table-responsive tbl_scroll_sm">
                    <table class="table table-bordered tbl_fixed">
                        <caption>증명서발급 신청</caption>
                        <colgroup>
                            <col style="width: 9%">
                            <col style="width: 9%">
                            <col style="width: 9%">
                            <col style="width: 9%">
                            <col style="width: 9%">
                            <col style="width: 9%">
                            <col style="width: 9%">
                            <col style="width: 9%">
                            <col style="width: 9%">
                            <col style="width: 9%">
                            <col style="width: 9%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">신청일</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="REQUEST_DATE"
                                        name="REQUEST_DATE"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                        style="width:100%;"
                                        required
                                />
                            </td>
                            <th scope="row" class="th_bg">사원</th>
                            <td class="td_input">
                                <sbux-input id="EMP_CODE" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                            </td>
                            <td class="td_input">
                                <sbux-input id="EMP_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_findEmpCode"
                                ></sbux-button>
                            </td>
                            <td class="td_input">
                                <p class="ad_input_row">
                                    <sbux-checkbox
                                            uitype="normal"
                                            id="SOCIAL_NUM_YN"
                                            name="SOCIAL_NUM_YN"
                                            uitype="normal"
                                            class="form-control input-sm check"
                                            text="주민번호 출력"
                                            true-value="Y" false-value="N"
                                    />
                                </p>
                            </td>
                            <td class="td_input">
                                <p class="ad_input_row">
                                    <sbux-checkbox
                                            uitype="normal"
                                            id="IMG_YN"
                                            name="IMG_YN"
                                            uitype="normal"
                                            class="form-control input-sm check"
                                            text="직인삭제"
                                            true-value="Y" false-value="N"
                                    />
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">증명서유형</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-select id="REPORT_TYPE" uitype="single" jsondata-ref="jsonReportType" unselected-text="선택" class="form-control input-sm inpt_data_reqed" onchange="fn_changeReportType(REPORT_TYPE)" required></sbux-select>
                            </td>
                            <th scope="row" class="th_bg">제출처</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                <sbux-input id="SUBMIT_PLACE" uitype="text" placeholder="" class="form-control input-sm inpt_data_reqed" required></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">사용용도</th>
                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                <sbux-input id="USE_DESCR" uitype="text" placeholder="" class="form-control input-sm inpt_data_reqed" required></sbux-input>
                            </td>
                            <th id="certiMemoTh" scope="row" class="th_bg">담당업무</th>
                            <td id="certiMemoTd" class="td_input" style="border-right:hidden;">
                                <sbux-input id="CERTI_MEMO" uitype="text" placeholder="" class="form-control input-sm inpt_data_reqed" required></sbux-input>
                            </td>
                        </tr>
                        <tr id="incomeTr">
                            <th scope="row" class="th_bg">귀속년도</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="INCOME_YEAR"
                                        name="INCOME_YEAR"
                                        date-format="yyyy"
                                        datepicker-mode="year"
                                        class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                        style="width:100%;"
                                />
                            </td>
                            <th scope="row" class="th_bg">기간</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="INCOME_RECEIVE_START_DATE"
                                        name="INCOME_RECEIVE_START_DATE"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                        style="width:100%;"
                                />
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <span> ~ </span>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="INCOME_RECEIVE_END_DATE"
                                        name="INCOME_RECEIVE_END_DATE"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                        style="width:100%;"
                                />
                            </td>
                        </tr>
                        </tbody>
                    </table>
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

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    var apcAdminType = '${loginVO.apcAdminType}';
    //-----------------------------------------------------------

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createBandgvwInfoGrid();

        cfn_search();
    });

    var editType			= "N";
    var strDate = gfn_dateToYmd(new Date());

    var jsonReportType = []; // 증명서유형
    var jsonConfirmStep = []; // 진행상태
    var jsonPositionCode = []; // 직위
    var jsonDutyCode = []; // 직책
    var jsonPrintType = []; // 출력구분

    const fn_initSBSelect = async function() {
        SBUxMethod.set("SRCH_REQUEST_DATE_FR", gfn_dateToYmd(new Date(new Date().getFullYear(), new Date().getMonth(), 1)));
        SBUxMethod.set("SRCH_REQUEST_DATE_TO", gfn_dateToYmd(new Date()));
        if(apcAdminType != null) SBUxMethod.attr('btnAdminApproval',"disabled","true");
        $("#incomeTr").hide();
        $("#certiMemoTh").hide();
        $("#certiMemoTd").hide();

        let rst = await Promise.all([
            // 증명서유형
            gfnma_setComSelect(['SRCH_REPORT_TYPE', 'bandgvwInfo', 'REPORT_TYPE'], jsonReportType, 'L_HRI042', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 진행상태
            gfnma_setComSelect(['SRCH_CONFIRM_STEP', 'bandgvwInfo'], jsonConfirmStep, 'L_HRI059', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['bandgvwInfo'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['bandgvwInfo'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 출력구분
            gfnma_setComSelect(['bandgvwInfo'], jsonPrintType, 'L_HRA026', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    const fn_findEmpCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("EMP_NAME"));
        var replaceText0 	= "_EMP_CODE_";
        var replaceText1 	= "_EMP_NAME_";
        var strWhereClause 	= "AND X.EMP_CODE LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE = 'WORK'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["사번", 		"사원명"]
            ,searchInputFields		: ["EMP_CODE", 	"EMP_NAME"]
            ,searchInputValues		: ["", 			searchText]
            ,height					: '400px'
            ,tableHeader			: ["사번", "직원명", "부서코드", "부서명", "사업장명","직위명"]
            ,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_CODE", "DEPT_NAME","SITE_NAME","POSITION_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "80px", "120px", "120px", "100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('EMP_CODE', data.EMP_CODE);
            },
        });
    }

    var fn_findSrchDeptCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

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
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findSrchEmpCode = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 	= "_EMP_CODE_";
        var replaceText1 	= "_EMP_NAME_";
        var strWhereClause 	= "AND X.EMP_CODE LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE = 'WORK'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["사번", 		"사원명"]
            ,searchInputFields		: ["EMP_CODE", 	"EMP_NAME"]
            ,searchInputValues		: ["", 			searchText]
            ,height					: '400px'
            ,tableHeader			: ["사번", "직원명", "부서코드", "부서명", "사업장명","직위명"]
            ,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_CODE", "DEPT_NAME","SITE_NAME","POSITION_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "80px", "120px", "120px", "100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
            },
        });
    }

    const fn_changeReportType = function(reportType){
        console.log(reportType)
        if (reportType == "R_INCOME_A" || reportType == "R_INCOME_B" || reportType == "R_INCOME_C") {
            $("#incomeTr").show();
            $("#certiMemoTh").hide();
            $("#certiMemoTd").hide();

            SBUxMethod.attr("INCOME_YEAR", "required", "true");
            SBUxMethod.attr("INCOME_RECEIVE_START_DATE", "required", "true");
            SBUxMethod.attr("INCOME_RECEIVE_END_DATE", "required", "true");
        } else if (reportType == "R_CAREER" || reportType == "R_RETIRE" ) {
            $("#incomeTr").hide();
            $("#certiMemoTh").show();
            $("#certiMemoTh").text("담당업무");
            $("#certiMemoTd").show();

            SBUxMethod.attr("INCOME_YEAR", "required", "false");
            SBUxMethod.attr("INCOME_RECEIVE_START_DATE", "required", "false");
            SBUxMethod.attr("INCOME_RECEIVE_END_DATE", "required", "false");
        } else if (reportType == "R_WORK") {
            $("#incomeTr").hide();
            $("#certiMemoTh").show();
            $("#certiMemoTh").text("비고");
            $("#certiMemoTd").show();

            SBUxMethod.attr("INCOME_YEAR", "required", "false");
            SBUxMethod.attr("INCOME_RECEIVE_START_DATE", "required", "false");
            SBUxMethod.attr("INCOME_RECEIVE_END_DATE", "required", "false");
        } else {
            $("#incomeTr").hide();
            $("#certiMemoTh").hide();
            $("#certiMemoTd").hide();

            SBUxMethod.attr("INCOME_YEAR", "required", "false");
            SBUxMethod.attr("INCOME_RECEIVE_START_DATE", "required", "false");
            SBUxMethod.attr("INCOME_RECEIVE_END_DATE", "required", "false");
        }
    }


    //grid 초기화
    var bandgvwInfo; 			// 그리드를 담기위한 객체 선언
    var gvwCareer;

    var jsonReportList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonCareerList = [];

    function fn_createBandgvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-bandgvwInfo';
        SBGridProperties.id 				= 'bandgvwInfo';
        SBGridProperties.jsonref 			= 'jsonReportList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["문서번호"], 	        ref: 'DOC_NUM',    	        type:'output',  	width:'100px',  	style:'text-align:left', hidden: true},
            {caption: ["신청일","신청일 "],  		ref: 'REQUEST_DATE',    			type:'datepicker',  	width:'108px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["신청일","이름"],           ref: 'EMP_NAME', 		            type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["신청일","사번"],           ref: 'EMP_CODE', 		        type:'output',  	width:'80px', style:'text-align:left'},
            {caption: ["신청일","증명서유형"],           ref: 'REPORT_TYPE', 		        type:'combo',  	width:'150px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonReportType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["세부내용","제출처"],           ref: 'SUBMIT_PLACE', 		    type:'output',  	width:'213px',  style:'text-align:left'},
            {caption: ["세부내용","사용용도"],      	 ref: 'USE_DESCR', 		type:'output',  	width:'213px',  style:'text-align:left'},
            {caption: ["세부내용","주민번호출력"],   ref: 'SOCIAL_NUM_YN', 		    type:'checkbox',  	width:'127px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 2 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["세부내용","직인삭제"],     ref: 'IMG_YN', 		    type:'checkbox',  	width:'70px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 2 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["세부내용","담당업무"],         ref: 'CERTI_MEMO', 	type:'output',  	width:'200px',  style:'text-align:left'},
            {caption: ["원천징수","귀속년도"],     	     ref: 'INCOME_YEAR', 		    type:'datepicker',  	width:'104px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy'},
                format : {type:'date', rule:'yyyy', origin:'YYYY'}
                , disabled: true
            },
            {caption: ["원천징수","기간(From)"],            ref: 'INCOME_RECEIVE_START_DATE', 		type:'datepicker',  	width:'90px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["원천징수","기간(To)"],            ref: 'INCOME_RECEIVE_END_DATE', 		type:'datepicker',  	width:'90px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["상태정보","진행상태"],            ref: 'CONFIRM_STEP', 		    type:'combo',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonConfirmStep',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["상태정보","승인일"],           ref: 'APPROVAL_DATE', 		type:'datepicker',  	width:'90px',  style:'text-align:center',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["상태정보","현단계승인권자"],       ref: 'CURRENT_APPROVE_EMP_NAME', 		        type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["상태정보","수임자명"],       ref: 'PROXY_EMP_NAME', 		        type:'output',  	width:'101px',  style:'text-align:left'},
            {caption: ["상태정보","반려일"],       ref: 'REJECT_DATE', 		        type:'datepicker',  	width:'90px',  style:'text-align:center',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["상태정보","반려사유"],         ref: 'REJECT_REASON', 	type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["출력기간", "출력기간 "],         ref: 'PRINT_DATE', 		        type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["출력기간", "출력횟수"],            ref: 'PRINT_CNT', 		            type:'output',  	width:'90px',  style:'text-align:left'},
            {caption: ["출력기간", "출력가능여부"],         ref: 'PRINTABLE_YN', 	type:'checkbox',  	width:'90px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 2 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
            },
            {caption: ["부서", "부서 "],           ref: 'DEPT_NAME', 		    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["부서", "직위"],    ref: 'POSITION_CODE', 		    type:'combo',  	width:'100px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["부서", "직책"],      ref: 'DUTY_CODE', 		    type:'combo',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["승인여부"],           ref: 'APPROVAL_YN', 		type:'checkbox',  	width:'90px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
                , hidden: true
            },
            {caption: ["퇴직일"],       ref: 'RETIRE_DATE', 		        type:'datepicker',  	width:'90px',  style:'text-align:center',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["반려여부"],          ref: 'REJECT_YN', 		    type:'output',  	width:'75px',  style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
                , disabled: true
                , hidden: true
            },
            {caption: ["출력구분"],           ref: 'PRINT_TYPE', 		    type:'combo',  	width:'100px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPrintType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["출력시작일자"],   ref: 'PRINT_START_DATE', 		    type:'datepicker',  	width:'80px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["출력마감일자"],     ref: 'PRINT_END_DATE', 		    type:'datepicker',  	width:'80px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
                , hidden: true
            },
            {caption: ["APPR_ID"],        ref: 'APPR_ID', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["APPR_COUNT"],       ref: 'APPR_COUNT', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["FINAL_APPROVER"],       ref: 'FINAL_APPROVER', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["CURRENT_APPROVE_EMP_CODE"],       ref: 'CURRENT_APPROVE_EMP_CODE', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["INSERT_EMP_CODE"],       ref: 'INSERT_EMP_CODE', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["INSERT_USERID"],       ref: 'INSERT_USERID', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["수임자"],       ref: 'PROXY_EMP_CODE', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        bandgvwInfo = _SBGrid.create(SBGridProperties);
        bandgvwInfo.bind('click', 'fn_view');
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {
        let REQUEST_DATE_FR	= gfnma_nvl(SBUxMethod.get("SRCH_REQUEST_DATE_FR"));
        let REQUEST_DATE_TO	= gfnma_nvl(SBUxMethod.get("SRCH_REQUEST_DATE_TO"));
        let REPORT_TYPE	= gfnma_nvl(SBUxMethod.get("SRCH_REPORT_TYPE"));
        let CONFIRM_STEP	= gfnma_nvl(SBUxMethod.get("SRCH_CONFIRM_STEP"));
        let DEPT_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_REQUEST_DATE_FR : REQUEST_DATE_FR,
            V_P_REQUEST_DATE_TO : REQUEST_DATE_TO,
            V_P_REPORT_TYPE : REPORT_TYPE,
            V_P_CONFIRM_STEP : CONFIRM_STEP,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_EMP_CODE : EMP_CODE,
            V_P_FORM_ID	: p_formId,
            V_P_MENU_ID	: p_menuId,
            V_P_PROC_ID	: '',
            V_P_USERID : '',
            V_P_PC : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1750List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                jsonReportList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        DOC_NUM : item.DOC_NUM,
                        REQUEST_DATE : item.REQUEST_DATE,
                        REPORT_TYPE : item.REPORT_TYPE,
                        EMP_CODE : item.EMP_CODE,
                        EMP_NAME : item.EMP_NAME,
                        SUBMIT_PLACE : item.SUBMIT_PLACE,
                        USE_DESCR : item.USE_DESCR,
                        INCOME_YEAR : item.INCOME_YEAR,
                        INCOME_RECEIVE_START_DATE : item.INCOME_RECEIVE_START_DATE,
                        INCOME_RECEIVE_END_DATE : item.INCOME_RECEIVE_END_DATE,
                        CONFIRM_STEP : item.CONFIRM_STEP,
                        APPROVAL_YN : item.APPROVAL_YN,
                        APPROVAL_DATE : item.APPROVAL_DATE,
                        APPROVE_DATE : item.APPROVE_DATE,
                        REJECT_YN : item.REJECT_YN,
                        REJECT_DATE : item.REJECT_DATE,
                        REJECT_REASON : item.REJECT_REASON,
                        PRINT_START_DATE : item.PRINT_START_DATE,
                        PRINT_END_DATE : item.PRINT_END_DATE,
                        PRINT_DATE : item.PRINT_DATE,
                        PRINT_CNT : item.PRINT_CNT,
                        PRINTABLE_YN : item.PRINTABLE_YN,
                        SOCIAL_NUM_YN : item.SOCIAL_NUM_YN,
                        IMG_YN : item.IMG_YN,
                        DEPT_NAME : item.DEPT_NAME,
                        DUTY_CODE : item.DUTY_CODE,
                        POSITION_CODE : item.POSITION_CODE,
                        PRINT_TYPE : item.PRINT_TYPE,
                        CERTI_MEMO : item.CERTI_MEMO,
                        APPR_COUNT : item.APPR_COUNT,
                        APPR_ID : item.APPR_ID,
                        FINAL_APPROVER : item.FINAL_APPROVER,
                        INSERT_USERID : item.INSERT_USERID,
                        INSERT_EMP_CODE : item.INSERT_EMP_CODE,
                        CURRENT_APPROVE_EMP_CODE : item.CURRENT_APPROVE_EMP_CODE,
                        CURRENT_APPROVE_EMP_NAME : item.CURRENT_APPROVE_EMP_NAME,
                        PROXY_EMP_CODE : item.PROXY_EMP_CODE,
                        PROXY_EMP_NAME : item.PROXY_EMP_NAME,
                        RETIRE_DATE : item.RETIRE_DATE
                    }
                    jsonReportList.push(msg);
                });

                bandgvwInfo.rebuild();
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

    // 신규
    function cfn_add() {
        fn_create();
    }

    function cfn_save() {
        fn_save();
    }

    function cfn_del() {
        fn_delete();
    }

    /**
     * 신규등록
     */
    const fn_create = async function() {
        editType = "N";
        SBUxMethod.set("REQUEST_DATE", strDate);
        SBUxMethod.attr('REQUEST_DATE',"disabled","false");

        SBUxMethod.set("EMP_CODE", '');
        SBUxMethod.set("EMP_NAME", '');
        SBUxMethod.set("SOCIAL_NUM_YN", 'N');
        SBUxMethod.set("IMG_YN", 'N');
        SBUxMethod.set("REPORT_TYPE", '');
        SBUxMethod.set("SUBMIT_PLACE", '');
        SBUxMethod.set("USE_DESCR", '');
        SBUxMethod.set("CERTI_MEMO", '');
        SBUxMethod.set("INCOME_YEAR", '');
        SBUxMethod.set("INCOME_RECEIVE_START_DATE", '');
        SBUxMethod.set("INCOME_RECEIVE_END_DATE", '');
    }

    // 저장
    const fn_save = async function() {
        var nRow = bandgvwInfo.getRow();
        let rowData = bandgvwInfo.getRowData(nRow);

        if(editType == "U") {
            if (rowData.CONFIRM_STEP != "1") {
                alert("미승인 건만 수정이 가능합니다.");
                return;
            }
        }

        let DOC_NUM = gfnma_nvl(rowData.DOC_NUM);
        let REQUEST_DATE = gfnma_nvl(SBUxMethod.get("REQUEST_DATE"));
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        let REPORT_TYPE = gfnma_nvl(SBUxMethod.get("REPORT_TYPE"));
        let SUBMIT_PLACE = gfnma_nvl(SBUxMethod.get("SUBMIT_PLACE"));
        let USE_DESCR = gfnma_nvl(SBUxMethod.get("USE_DESCR"));
        let INCOME_YEAR = (REPORT_TYPE == "R_INCOME_A" || REPORT_TYPE == "R_INCOME_B" || REPORT_TYPE == "R_INCOME_C") ? gfnma_nvl(SBUxMethod.get("INCOME_YEAR")) : '';
        let INCOME_RECEIVE_START_DATE = (REPORT_TYPE == "R_INCOME_A" || REPORT_TYPE == "R_INCOME_B" || REPORT_TYPE == "R_INCOME_C") ? gfnma_nvl(SBUxMethod.get("INCOME_RECEIVE_START_DATE")) : '';
        let INCOME_RECEIVE_END_DATE = (REPORT_TYPE == "R_INCOME_A" || REPORT_TYPE == "R_INCOME_B" || REPORT_TYPE == "R_INCOME_C") ? gfnma_nvl(SBUxMethod.get("INCOME_RECEIVE_END_DATE")) : '';
        let PRINT_TYPE = gfnma_nvl(SBUxMethod.get("PRINT_TYPE"));
        let CERTI_MEMO = gfnma_nvl(SBUxMethod.get("CERTI_MEMO"));
        let SOURCE_SYS = gfnma_nvl(SBUxMethod.get("SOURCE_SYS"));
        let SOCIAL_NUM_YN = gfnma_nvl(SBUxMethod.get("SOCIAL_NUM_YN"));
        let IMG_YN = gfnma_nvl(SBUxMethod.get("IMG_YN"));

        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID : '',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE : gv_ma_selectedClntCd,
            IV_P_DOC_NUM : editType == "N" ? '' : DOC_NUM,
            V_P_REQUEST_DATE : REQUEST_DATE,
            V_P_EMP_CODE : EMP_CODE,
            V_P_REPORT_TYPE : REPORT_TYPE,
            V_P_SUBMIT_PLACE : SUBMIT_PLACE,
            V_P_USE_DESCR : USE_DESCR,
            V_P_INCOME_YEAR : INCOME_YEAR,
            V_P_INCOME_RECEIVE_START_DATE : INCOME_RECEIVE_START_DATE,
            V_P_INCOME_RECEIVE_END_DATE : INCOME_RECEIVE_END_DATE,
            V_P_PRINT_TYPE : '',
            V_P_CERTI_MEMO : CERTI_MEMO,
            V_P_SOURCE_SYS : 'HR',
            V_P_SOCIAL_NUM_YN : SOCIAL_NUM_YN.SOCIAL_NUM_YN,
            V_P_IMG_YN : IMG_YN.IMG_YN,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/insertHri1750.do", {
            getType				: 'json',
            workType			: editType,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.resultMessage){
                    alert(data.resultMessage);
                }
                cfn_search();
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

    const fn_adminApproval = async function() {
        var nRow = bandgvwInfo.getRow();
        let rowData = bandgvwInfo.getRowData(nRow);
        console.log(rowData);

        let DOC_NUM = gfnma_nvl(rowData.DOC_NUM);
        let REQUEST_DATE = gfnma_nvl(SBUxMethod.get("REQUEST_DATE"));
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        let REPORT_TYPE = gfnma_nvl(SBUxMethod.get("REPORT_TYPE"));
        let SUBMIT_PLACE = gfnma_nvl(SBUxMethod.get("SUBMIT_PLACE"));
        let USE_DESCR = gfnma_nvl(SBUxMethod.get("USE_DESCR"));
        let INCOME_YEAR = (REPORT_TYPE == "R_INCOME_A" || REPORT_TYPE == "R_INCOME_B" || REPORT_TYPE == "R_INCOME_C") ? gfnma_nvl(SBUxMethod.get("INCOME_YEAR")) : '';
        let INCOME_RECEIVE_START_DATE = (REPORT_TYPE == "R_INCOME_A" || REPORT_TYPE == "R_INCOME_B" || REPORT_TYPE == "R_INCOME_C") ? gfnma_nvl(SBUxMethod.get("INCOME_RECEIVE_START_DATE")) : '';
        let INCOME_RECEIVE_END_DATE = (REPORT_TYPE == "R_INCOME_A" || REPORT_TYPE == "R_INCOME_B" || REPORT_TYPE == "R_INCOME_C") ? gfnma_nvl(SBUxMethod.get("INCOME_RECEIVE_END_DATE")) : '';
        let PRINT_TYPE = gfnma_nvl(SBUxMethod.get("PRINT_TYPE"));
        let CERTI_MEMO = gfnma_nvl(SBUxMethod.get("CERTI_MEMO"));
        let SOURCE_SYS = gfnma_nvl(SBUxMethod.get("SOURCE_SYS"));
        let SOCIAL_NUM_YN = gfnma_nvl(SBUxMethod.get("SOCIAL_NUM_YN"));
        let IMG_YN = gfnma_nvl(SBUxMethod.get("IMG_YN"));

        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID : '',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE : gv_ma_selectedClntCd,
            IV_P_DOC_NUM : DOC_NUM,
            V_P_REQUEST_DATE : REQUEST_DATE,
            V_P_EMP_CODE : EMP_CODE,
            V_P_REPORT_TYPE : REPORT_TYPE,
            V_P_SUBMIT_PLACE : SUBMIT_PLACE,
            V_P_USE_DESCR : USE_DESCR,
            V_P_INCOME_YEAR : INCOME_YEAR,
            V_P_INCOME_RECEIVE_START_DATE : INCOME_RECEIVE_START_DATE,
            V_P_INCOME_RECEIVE_END_DATE : INCOME_RECEIVE_END_DATE,
            V_P_PRINT_TYPE : '',
            V_P_CERTI_MEMO : CERTI_MEMO,
            V_P_SOURCE_SYS : 'HR',
            V_P_SOCIAL_NUM_YN : SOCIAL_NUM_YN.SOCIAL_NUM_YN,
            V_P_IMG_YN : IMG_YN.IMG_YN,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/insertHri1750.do", {
            getType				: 'json',
            workType			: 'MANAGER',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.resultMessage){
                    alert(data.resultMessage);
                }
                cfn_search();
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

    const fn_delete = async function() {
        var nRow = bandgvwInfo.getRow();
        let rowData = bandgvwInfo.getRowData(nRow);

        if(gfn_comConfirm("Q0001", "선택한 건을 삭제")) {
            let DOC_NUM = gfnma_nvl(SBUxMethod.get("DOC_NUM"));
            let REQUEST_DATE = gfnma_nvl(SBUxMethod.get("REQUEST_DATE"));
            let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE"));
            let REPORT_TYPE = gfnma_nvl(SBUxMethod.get("REPORT_TYPE"));
            let SUBMIT_PLACE = gfnma_nvl(SBUxMethod.get("SUBMIT_PLACE"));
            let USE_DESCR = gfnma_nvl(SBUxMethod.get("USE_DESCR"));
            let INCOME_YEAR = (REPORT_TYPE == "R_INCOME_A" || REPORT_TYPE == "R_INCOME_B" || REPORT_TYPE == "R_INCOME_C") ? gfnma_nvl(SBUxMethod.get("INCOME_YEAR")) : '';
            let INCOME_RECEIVE_START_DATE = (REPORT_TYPE == "R_INCOME_A" || REPORT_TYPE == "R_INCOME_B" || REPORT_TYPE == "R_INCOME_C") ? gfnma_nvl(SBUxMethod.get("INCOME_RECEIVE_START_DATE")) : '';
            let INCOME_RECEIVE_END_DATE = (REPORT_TYPE == "R_INCOME_A" || REPORT_TYPE == "R_INCOME_B" || REPORT_TYPE == "R_INCOME_C") ? gfnma_nvl(SBUxMethod.get("INCOME_RECEIVE_END_DATE")) : '';
            let PRINT_TYPE = gfnma_nvl(SBUxMethod.get("PRINT_TYPE"));
            let CERTI_MEMO = gfnma_nvl(SBUxMethod.get("CERTI_MEMO"));
            let SOURCE_SYS = gfnma_nvl(SBUxMethod.get("SOURCE_SYS"));
            let SOCIAL_NUM_YN = gfnma_nvl(SBUxMethod.get("SOCIAL_NUM_YN"));
            let IMG_YN = gfnma_nvl(SBUxMethod.get("IMG_YN"));

            var paramObj = {
                V_P_DEBUG_MODE_YN : '',
                V_P_LANG_ID : '',
                V_P_COMP_CODE : gv_ma_selectedApcCd,
                V_P_CLIENT_CODE : gv_ma_selectedClntCd,
                IV_P_DOC_NUM : DOC_NUM,
                V_P_REQUEST_DATE : REQUEST_DATE,
                V_P_EMP_CODE : EMP_CODE,
                V_P_REPORT_TYPE : REPORT_TYPE,
                V_P_SUBMIT_PLACE : SUBMIT_PLACE,
                V_P_USE_DESCR : USE_DESCR,
                V_P_INCOME_YEAR : INCOME_YEAR,
                V_P_INCOME_RECEIVE_START_DATE : INCOME_RECEIVE_START_DATE,
                V_P_INCOME_RECEIVE_END_DATE : INCOME_RECEIVE_END_DATE,
                V_P_PRINT_TYPE : '',
                V_P_CERTI_MEMO : CERTI_MEMO,
                V_P_SOURCE_SYS : 'HR',
                V_P_SOCIAL_NUM_YN : SOCIAL_NUM_YN.SOCIAL_NUM_YN,
                V_P_IMG_YN : IMG_YN.IMG_YN,
                V_P_FORM_ID : p_formId,
                V_P_MENU_ID : p_menuId,
                V_P_PROC_ID : '',
                V_P_USERID : '',
                V_P_PC : ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hri/hri/insertHri1750.do", {
                getType				: 'json',
                workType			: 'D',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if(data.resultMessage){
                        alert(data.resultMessage);
                    }
                    cfn_search();
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

    const fn_print = async function() {
        var nRow = bandgvwInfo.getRow();
        let rowData = bandgvwInfo.getRowData(nRow);

        // 00 : 미승인, 11 : 승인, 19 : 반려
        if (rowData.CONFIRM_STEP != "5") {
            alert("승인되지 않은 건은 출력이 불가능합니다.");
            return;
        }

        let iprint_start_date = new Date(rowData.PRINT_START_DATE.replace("-","") == "" ? "0": rowData.PRINT_START_DATE.replace("-", ""));
        let iprint_end_date = new Date(rowData.PRINT_END_DATE.replace("-", "") == "" ? "99999999": rowData.PRINT_END_DATE.replace("-", ""));

        // 인사총무관리자가 아닐 경우 출력가능여부가 "N"이면 출력이 안되도록 처리
        if (apcAdminType != null) { // TODO: 권환 확인하여 오른쪽 조건 확인 필요  if(!SessionInfo.IsHRManager)
            if (strDate < iprint_start_date || strDate > iprint_end_date) {
                alert("출력기간이 아니므로 출력이 불가능합니다.");
                return;
            }

            if (rowData.PRINTABLE_YN == "N")
                return;
        }

        var param = {}
        param.VIEW_TYPE = 'PRINT';
        param.REPORT_TYPE = rowData.REPORT_TYPE;
        param.DOC_NUM = rowData.DOC_NUM;
        param.SOCIAL_VIEW = gfnma_nvl(SBUxMethod.get("SOCIAL_NUM_YN"));
        param.IMG_YN = gfnma_nvl(SBUxMethod.get("IMG_YN"));

        if (rowData.REPORT_TYPE == "R_INCOME_B") {
            let reportFilePath = await fn_findReportFilePath(rowData.REPORT_TYPE);

            param.WORK_TYPE = "REPORT";
            param.LANG_ID = 'KOR' // TODO: SessionInfo.LanguageID
            param.COMP_CODE = gv_ma_selectedApcCd;
            param.YE_TX_YYYY = rowData.INCOME_YEAR;
            param.SITE_CODE = '';
            param.DEPT_CODE = '';
            param.EMP_CODE = rowData.EMP_CODE;
            param.EMP_STATE = '';
            param.EMP_CODE_LIST = rowData.EMP_CODE;
            param.PAY_AREA_TYPE = '';

            gfn_popClipReport(jsonReportType.filter((value) => value.value == rowData.REPORT_TYPE)[0].text, reportFilePath, param);
        } else if (rowData.REPORT_TYPE == "R_INCOME_C") {
            let reportFilePath = await fn_findReportFilePath(rowData.REPORT_TYPE);
            let strye_tx_yyyy = rowData.INCOME_YEAR;

            let strretire_yyyy = rowData.RETIRE_DATE == "" ? "": rowData.RETIRE_DATE.substring(0, 4);

            param.WORK_TYPE = "REPORT";
            param.LANG_ID = 'KOR' // TODO: SessionInfo.LanguageID
            param.COMP_CODE = gv_ma_selectedApcCd;

            param.YE_TX_YYYY = rowData.INCOME_YEAR;
            if (strye_tx_yyyy == strretire_yyyy) {
                param.YE_TX_TYPE = "RETIRE";
            } else {
                param.YE_TX_TYPE = "YEAREND";
            }
            param.SITE_CODE = '';
            param.DEPT_CODE = '';
            param.EMP_CODE = rowData.EMP_CODE;
            param.PRINT_TYPE = '10';
            param.PRINT_TYPE1 = '30';

            param.WORK_END_DAT_FR = rowData.INCOME_RECEIVE_START_DATE;

            param.WORK_END_DAT_TO = rowData.INCOME_RECEIVE_END_DATE;
            param.EMP_CODE_LIST = rowData.EMP_CODE;
            param.PAY_AREA_TYPE = '';

            gfn_popClipReport(jsonReportType.filter((value) => value.value == rowData.REPORT_TYPE)[0].text, reportFilePath, param);
        } else {
            let reportFilePath = await fn_findReportFilePath("R_CERTI");
            gfn_popClipReport(jsonReportType.filter((value) => value.value == rowData.REPORT_TYPE)[0].text, reportFilePath, param);
        }
    }


    const fn_findReportFilePath = async function(reportType) {
        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID : '',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE : gv_ma_selectedClntCd,
            V_P_REPORT_TYPE : reportType,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };
        let reportFilePath = '';

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1750ReportFilePath.do", {
            getType				: 'json',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.resultMessage){
                    reportFilePath = data.cv_1[0].REPORT_DLL;
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

        return reportFilePath;
    }

    //상세정보 보기
    const fn_view = async function() {
        editType = "U";
        var nCol = bandgvwInfo.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = bandgvwInfo.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = bandgvwInfo.getRowData(nRow);
        let reportType = rowData.REPORT_TYPE;

        SBUxMethod.attr('REQUEST_DATE',"disabled","true");

        SBUxMethod.set("REQUEST_DATE", rowData.REQUEST_DATE);
        SBUxMethod.set("EMP_CODE", rowData.EMP_CODE);
        SBUxMethod.set("EMP_NAME", rowData.EMP_NAME);
        SBUxMethod.set("SOCIAL_NUM_YN", rowData.SOCIAL_NUM_YN);
        SBUxMethod.set("IMG_YN", rowData.IMG_YN);
        SBUxMethod.set("REPORT_TYPE", rowData.REPORT_TYPE);
        SBUxMethod.set("SUBMIT_PLACE", rowData.SUBMIT_PLACE);
        SBUxMethod.set("USE_DESCR", rowData.USE_DESCR);
        SBUxMethod.set("CERTI_MEMO", rowData.CERTI_MEMO);
        SBUxMethod.set("INCOME_YEAR", rowData.INCOME_YEAR);
        SBUxMethod.set("INCOME_RECEIVE_START_DATE", rowData.INCOME_RECEIVE_START_DATE);
        SBUxMethod.set("INCOME_RECEIVE_END_DATE", rowData.INCOME_RECEIVE_END_DATE);

        if (reportType == "R_INCOME_A" || reportType == "R_INCOME_B" || reportType == "R_INCOME_C") {
            $("#incomeTr").show();
            $("#certiMemoTh").hide();
            $("#certiMemoTd").hide();

            SBUxMethod.attr("INCOME_YEAR", "required", "true");
            SBUxMethod.attr("INCOME_RECEIVE_START_DATE", "required", "true");
            SBUxMethod.attr("INCOME_RECEIVE_END_DATE", "required", "true");
        } else if (reportType == "R_CAREER" || reportType == "R_RETIRE" ) {
            $("#incomeTr").hide();
            $("#certiMemoTh").show();
            $("#certiMemoTh").text("담당업무");
            $("#certiMemoTd").show();

            SBUxMethod.attr("INCOME_YEAR", "required", "false");
            SBUxMethod.attr("INCOME_RECEIVE_START_DATE", "required", "false");
            SBUxMethod.attr("INCOME_RECEIVE_END_DATE", "required", "false");
        } else if (reportType == "R_WORK") {
            $("#incomeTr").hide();
            $("#certiMemoTh").show();
            $("#certiMemoTh").text("비고");
            $("#certiMemoTd").show();

            SBUxMethod.attr("INCOME_YEAR", "required", "false");
            SBUxMethod.attr("INCOME_RECEIVE_START_DATE", "required", "false");
            SBUxMethod.attr("INCOME_RECEIVE_END_DATE", "required", "false");
        } else {
            $("#incomeTr").hide();
            $("#certiMemoTh").hide();
            $("#certiMemoTd").hide();

            SBUxMethod.attr("INCOME_YEAR", "required", "false");
            SBUxMethod.attr("INCOME_RECEIVE_START_DATE", "required", "false");
            SBUxMethod.attr("INCOME_RECEIVE_END_DATE", "required", "false");
        }
    }

    const fn_approval = async function() {
        // TODO : 결재공통 추가시 개발
    }

    const fn_approvalList = async function() {
        // TODO : 결재공통 추가시 개발
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>