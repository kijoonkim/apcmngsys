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
                </h3><
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnSearch" name="btnSearch" 	uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                <sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete"></sbux-button>
                <sbux-button id="btnAdminApproval" name="btnAdminApproval" uitype="normal" class="btn btn-sm btn-outline-danger" text="관리자승인" onclick="fn_adminApproval"></sbux-button>
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
                        <sbux-input id="SRCH_DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">사원</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
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
                            <span>경력내용</span>
                        </li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow" style="float: right;"></sbux-button>
                        <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                        <sbux-button id="btnAddAll" name="btnAddAll" uitype="normal" text="가져오기" class="btn btn-sm btn-outline-danger" onclick="fn_addAll" style="float: right;"></sbux-button>
                    </div>
                </div>
                <div class="table-responsive tbl_scroll_sm">
                    <div id="sb-area-gvwCareer" style="height:300px;"></div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createBandgvwInfoGrid();
        fn_createGvwCareerGrid();

        fn_search();
    });

    var jsonReportType = []; // 증명서유형
    var jsonConfirmStep = []; // 진행상태
    var jsonPositionCode = []; // 직위
    var jsonDutyCode = []; // 직책

    const fn_initSBSelect = async function() {
        SBUxMethod.set("SRCH_REQUEST_DATE_FR", gfn_dateToYmd(new Date(new Date().getFullYear(), new Date().getMonth(), 1)));
        SBUxMethod.set("SRCH_REQUEST_DATE_TO", gfn_dateToYmd(new Date()));

        let rst = await Promise.all([
            // 증명서유형
            gfnma_setComSelect(['SRCH_REPORT_TYPE', 'bandgvwInfo'], jsonReportType, 'L_HRI042', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 진행상태
            gfnma_setComSelect(['SRCH_CONFIRM_STEP'], jsonConfirmStep, 'L_HRI059', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['bandgvwInfo'], jsonPositionCode, 'L_HRI002', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['bandgvwInfo'], jsonDutyCode, 'L_HRI003', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
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
        SBGridProperties.paging = {
            'type' 			: 'page',
            'count' 		: 5,
            'size' 			: 20,
            'sorttype' 		: 'page',
            'showgoalpageui': true
        };
        SBGridProperties.columns = [
            {caption: ["문서번호"], 	        ref: 'DOC_NUM',    	        type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["신청일"],  		ref: 'REQUEST_DATE',    			type:'output',  	width:'108px',  	style:'text-align:left'},
            {caption: ["증명서유형"],           ref: 'REPORT_TYPE', 		        type:'output',  	width:'150px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonReportType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["사번"],           ref: 'EMP_CODE', 		        type:'output',  	width:'80px', style:'text-align:left'},
            {caption: ["이름"],           ref: 'EMP_NAME', 		            type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["제출처"],           ref: 'SUBMIT_PLACE', 		    type:'output',  	width:'213px',  style:'text-align:left'},
            {caption: ["사용용도"],      	 ref: 'USE_DESCR', 		type:'output',  	width:'213px',  style:'text-align:left'},
            {caption: ["귀속년도"],     	     ref: 'INCOME_YEAR', 		    type:'output',  	width:'104px',  style:'text-align:left'},
            {caption: ["기간(From)"],            ref: 'INCOME_RECEIVE_START_DATE', 		type:'output',  	width:'90px',  style:'text-align:left'},
            {caption: ["기간(To)"],            ref: 'INCOME_RECEIVE_END_DATE', 		type:'output',  	width:'90px',  style:'text-align:left'},
            {caption: ["진행상태"],            ref: 'CONFIRM_STEP', 		    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["승인여부"],           ref: 'APPROVAL_YN', 		type:'output',  	width:'90px',  style:'text-align:left'},
            {caption: ["반려여부"],          ref: 'REJECT_YN', 		    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["반려사유"],         ref: 'REJECT_REASON', 	type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["특이사항(경력사항)"],         ref: 'CERTI_MEMO', 	type:'output',  	width:'200px',  style:'text-align:left'},
            {caption: ["출력횟수"],            ref: 'PRINT_CNT', 		            type:'output',  	width:'90px',  style:'text-align:left'},
            {caption: ["출력기간"],         ref: 'PRINT_DATE', 		        type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["출력가능여부"],         ref: 'PRINTABLE_YN', 	type:'output',  	width:'90px',  style:'text-align:left'},
            {caption: ["부서"],           ref: 'DEPT_NAME', 		    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["직위"],    ref: 'POSITION_CODE', 		    type:'output',  	width:'100px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["직책"],      ref: 'DUTY_CODE', 		    type:'output',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["출력시작일자"],   ref: 'PRINT_START_DATE', 		    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["출력마감일자"],     ref: 'PRINT_END_DATE', 		    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["주민번호전체출력"],   ref: 'SOCIAL_NUM_YN', 		    type:'output',  	width:'127px',  style:'text-align:left'},
            {caption: ["직인삭제"],     ref: 'IMG_YN', 		    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["APPR_ID"],        ref: 'APPR_ID', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["APPR_COUNT"],       ref: 'APPR_COUNT', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["FINAL_APPROVER"],       ref: 'FINAL_APPROVER', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["CURRENT_APPROVE_EMP_CODE"],       ref: 'CURRENT_APPROVE_EMP_CODE', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["현단계승인권자"],       ref: 'CURRENT_APPROVE_EMP_NAME', 		        type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["수임권자"],       ref: 'PROXY_EMP_NAME', 		        type:'output',  	width:'101px',  style:'text-align:left'},
            {caption: ["PROXY_EMP_CODE"],       ref: 'PROXY_EMP_CODE', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["INSERT_USERID"],       ref: 'INSERT_USERID', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["INSERT_EMP_CODE"],       ref: 'INSERT_EMP_CODE', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["퇴사일자"],       ref: 'RETIRE_DATE', 		        type:'output',  	width:'120px',  style:'text-align:left'},
        ];

        bandgvwInfo = _SBGrid.create(SBGridProperties);
        bandgvwInfo.bind('click', 'fn_view');
        bandgvwInfo.bind('beforepagechanged', 'fn_pagingEmpList');
    }

    function fn_createGvwCareerGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwCareer';
        SBGridProperties.id 				= 'gvwCareer';
        SBGridProperties.jsonref 			= 'jsonCareerList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.paging = {
            'type' 			: 'page',
            'count' 		: 5,
            'size' 			: 20,
            'sorttype' 		: 'page',
            'showgoalpageui': true
        };
        SBGridProperties.columns = [
            {caption: ["문서번호"], 	    ref: 'DOC_NUM',    	        type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["순번"],  		ref: 'SEQ',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["사번"],       ref: 'EMP_CODE', 		        type:'output',  	width:'100px', style:'text-align:left'},
            {caption: ["적용시작일"],       ref: 'START_DATE', 		        type:'output',  	width:'100px', style:'text-align:left'},
            {caption: ["적용종료일"],       ref: 'END_DATE', 		        type:'output',  	width:'100px', style:'text-align:left'},
            {caption: ["부서명"],        ref: 'DEPT_NAME', 		            type:'output',  	width:'200px',  style:'text-align:left'}, // TODO: P_ORG001 팝업 적용 필요
            {caption: ["직책"],      ref: 'DUTY_NAME', 		    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["직위"],      	ref: 'POSITION', 		type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["담당업무"],      	ref: 'WORK', 		type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["비고"],      	ref: 'MEMO', 		type:'output',  	width:'100px',  style:'text-align:left'},
        ];

        gvwCareer = _SBGrid.create(SBGridProperties);
        gvwCareer.bind('beforepagechanged', 'fn_pagingTotalEmpList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {

        // set pagination
        let pageSize = bandgvwInfo.getPageSize();
        let pageNo = 1;

        bandgvwInfo.movePaging(pageNo);
    }

    /**
     *
     */
    const fn_pagingEmpList = async function() {
        let recordCountPerPage 	= bandgvwInfo.getPageSize();   			// 몇개의 데이터를 가져올지 설정
        let currentPageNo 		= bandgvwInfo.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
        var getColRef 			= bandgvwInfo.getColRef("checked");
        bandgvwInfo.setFixedcellcheckboxChecked(0, getColRef, false);
        fn_setBandgvwInfo(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setBandgvwInfo = async function(pageSize, pageNo) {

        bandgvwInfo.clearStatus();

        let REQUEST_DATE_FR	= gfnma_nvl(SBUxMethod.get("SRCH_REQUEST_DATE_FR"));
        let REQUEST_DATE_TO	= gfnma_nvl(SBUxMethod.get("SRCH_REQUEST_DATE_TO"));
        let REPORT_TYPE	= gfnma_nvl(SBUxMethod.get("SRCH_REPORT_TYPE"));
        let CONFIRM_STEP	= gfnma_nvl(SBUxMethod.get("SRCH_CONFIRM_STEP"));
        let DEPT_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	    : ''
            ,V_P_LANG_ID		    : ''
            ,V_P_COMP_CODE		    : gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE	    : gv_ma_selectedClntCd
            ,V_P_REQUEST_DATE_FR    : REQUEST_DATE_FR
            ,V_P_REQUEST_DATE_TO    : REQUEST_DATE_TO
            ,V_P_REPORT_TYPE        : REPORT_TYPE
            ,V_P_CONFIRM_STEP       : CONFIRM_STEP
            ,V_P_DEPT_CODE          : DEPT_CODE
            ,V_P_EMP_CODE           :EMP_CODE
            ,V_P_DOC_NUM            : ''
            ,V_P_FORM_ID		    : p_formId
            ,V_P_MENU_ID		    : p_menuId
            ,V_P_PROC_ID		    : ''
            ,V_P_USERID			    : ''
            ,V_P_PC				    : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1700List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '9',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

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
                        REJECT_YN : item.REJECT_YN,
                        REJECT_REASON : item.REJECT_REASON,
                        CERTI_MEMO : item.CERTI_MEMO,
                        PRINT_CNT : item.PRINT_CNT,
                        PRINT_DATE : item.PRINT_DATE,
                        PRINTABLE_YN : item.PRINTABLE_YN,
                        DEPT_NAME : item.DEPT_NAME,
                        POSITION_CODE : item.POSITION_CODE,
                        DUTY_CODE : item.DUTY_CODE,
                        PRINT_START_DATE : item.PRINT_START_DATE,
                        PRINT_END_DATE : item.PRINT_END_DATE,
                        SOCIAL_NUM_YN : item.SOCIAL_NUM_YN,
                        IMG_YN : item.IMG_YN,
                        APPR_ID : item.APPR_ID,
                        APPR_COUNT : item.APPR_COUNT,
                        FINAL_APPROVER : item.FINAL_APPROVER,
                        CURRENT_APPROVE_EMP_CODE : item.CURRENT_APPROVE_EMP_CODE,
                        CURRENT_APPROVE_EMP_NAME : item.CURRENT_APPROVE_EMP_NAME,
                        PROXY_EMP_NAME : item.PROXY_EMP_NAME,
                        PROXY_EMP_CODE : item.PROXY_EMP_CODE,
                        INSERT_USERID : item.INSERT_USERID,
                        INSERT_EMP_CODE : item.INSERT_EMP_CODE,
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

    //상세정보 보기
    const fn_view = async function() {

        editType = "E";

        var nCol = gvwList.getCol();
        //특정 열 부터 이벤트 적용
        if (nCol < 1) {
            return;
        }
        var nRow = gvwList.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = gvwList.getRowData(nRow);

        var paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
            ,V_P_REQUEST_DATE_FR: APPOINT_NUM
            ,V_P_REQUEST_DATE_TO: APPOINT_DATE_FR
            ,V_P_REPORT_TYPE: APPOINT_DATE
            ,V_P_CONFIRM_STEP      : SITE_CODE
            ,V_P_DEPT_CODE      : DEPT_CODE
            ,V_P_DOC_NUM       : ''
            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1700List.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '3',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonEmpList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        APPOINT_DATE                : item.APPOINT_DATE,
                        APPOINT_TYPE                : item.APPOINT_TYPE,
                        APPOINT_NUM                 : item.APPOINT_NUM,
                        APPOINT_TITLE               : item.APPOINT_TITLE,
                        APPLY_YN                    : item.APPLY_YN,
                        DEPT_APPOINT_YN             : item.DEPT_APPOINT_YN,
                        POSITION_APPOINT_YN         : item.POSITION_APPOINT_YN,
                        DUTY_APPOINT_YN             : item.DUTY_APPOINT_YN,
                        JOB_RANK_APPOINT_YN         : item.JOB_RANK_APPOINT_YN,
                        JOB_GROUP_APPOINT_YN        : item.JOB_GROUP_APPOINT_YN,
                        JOB_APPOINT_YN              : item.JOB_APPOINT_YN,
                        REGION_APPOINT_YN           : item.REGION_APPOINT_YN,
                        APPOINT_TYPE_NAME           : item.APPOINT_TYPE_NAME,
                        JOB_FAMILY_APPOINT_YN       : item.JOB_FAMILY_APPOINT_YN,
                        PARENTING_WORK_TYPE_YN      : item.PARENTING_WORK_TYPE_YN,
                        APPR_ID                     : item.APPR_ID,
                        APPR_COUNT                  : item.APPR_COUNT,
                        CURRENT_APPROVE_EMP_CODE    : item.CURRENT_APPROVE_EMP_CODE,
                        FINAL_APPROVER              : item.FINAL_APPROVER,
                        BEFORE_APPR_EMP             : item.BEFORE_APPR_EMP,
                        NEXT_APPR_EMP               : item.NEXT_APPR_EMP,
                        BEFORE_PROXY_EMP            : item.BEFORE_PROXY_EMP,
                        NEXT_PROXY_EMP              : item.NEXT_PROXY_EMP,
                        CONFIRM_EMP_CODE            : item.CONFIRM_EMP_CODE,
                        PROXY_EMP_CODE              : item.PROXY_EMP_CODE,
                        STATUS_CODE                 : item.STATUS_CODE,
                        APPROVE_DATE                : item.APPROVE_DATE
                    }
                    jsonEmpList.push(msg);
                });

                gvwList.rebuild();
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