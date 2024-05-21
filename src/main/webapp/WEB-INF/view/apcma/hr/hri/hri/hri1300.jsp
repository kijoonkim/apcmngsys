<%
    /**
     * @Class Name 		: hri1300.jsp
     * @Description 	: 인사발령 등록 화면
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
    <title>title : 인사발령 등록</title>
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
                <sbux-button id="btnSearch" name="btnSearch" 	uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                <sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete"></sbux-button>
                <sbux-button id="btnAttachFile" name="btnAttachFile" uitype="normal" class="btn btn-sm btn-outline-danger" text="파일첨부" onclick="fn_attachFile"></sbux-button>
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
                    <col style="width: 14%">
                    <col style="width: 14%">
                    <col style="width: 1%">
                    <col style="width: 14%">
                    <col style="width: 14%">
                    <col style="width: 14%">
                    <col style="width: 14%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">사업장</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">발령구분</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_APPOINT_TYPE" uitype="single" jsondata-ref="jsonAppointType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">발령번호</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_APPOINT_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_APPOINT_TITLE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">발령기간</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_APPOINT_DATE_FR"
                                name="SRCH_APPOINT_DATE_FR"
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
                                id="SRCH_APPOINT_DATE"
                                name="SRCH_APPOINT_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="col-sm-3">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>인사발령 리스트</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwList" style="height:600px;"></div>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>인사발령등록</span>
                                </li>
                            </ul>
                            <div class="ad_tbl_toplist">
                                <sbux-button id="btnUld" name="btnUld" uitype="normal" text="인사기록반영취소" class="btn btn-sm btn-outline-danger" onclick="fn_uld" style="float: right;"></sbux-button>
                                <sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="인사기록반영" class="btn btn-sm btn-outline-danger" onclick="fn_dwnld" style="float: right;"></sbux-button>
                            </div>
                        </div>
                        <div class="table-responsive tbl_scroll_xs">
                            <table class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:10%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">발령번호</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="APPOINT_NUM" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">발령일자</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="APPOINT_DATE"
                                                name="APPOINT_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">발령구분</th>
                                    <td class="td_input">
                                        <sbux-input id="APPOINT_TYPE" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="APPOINT_TYPE_NAME" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">발령명칭</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="APPOINT_TITLE" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">적용여부</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="APPLY_YN" uitype="single" jsondata-ref="jsonApplyYn" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">상태</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="STATUS_CODE" uitype="single" jsondata-ref="jsonStatusCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">비고</th>
                                    <td colspan="5" class="td_input">
                                        <sbux-input id="MEMO" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">승인일자</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="APPROVE_DATE"
                                                name="APPROVE_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">발령적용</th>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="DEPT_APPOINT_YN" name="DEPT_APPOINT_YN" class="form-control input-sm check" text="부서"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="POSITION_APPOINT_YN" name="POSITION_APPOINT_YN" class="form-control input-sm check" text="직위"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="DUTY_APPOINT_YN" name="DUTY_APPOINT_YN" class="form-control input-sm check" text="직책"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="JOB_RANK_APPOINT_YN" name="JOB_RANK_APPOINT_YN" class="form-control input-sm check" text="직급"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="JOB_GROUP_APPOINT_YN" name="JOB_GROUP_APPOINT_YN" class="form-control input-sm check" text="직군"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="JOB_APPOINT_YN" name="JOB_APPOINT_YN" class="form-control input-sm check" text="직무"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="JOB_FAMILY_APPOINT_YN" name="JOB_FAMILY_APPOINT_YN" class="form-control input-sm check" text="직원하위그룹"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="REGION_APPOINT_YN" name="REGION_APPOINT_YN" class="form-control input-sm check" text="근무지"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="PARENTING_WORK_TYPE_YN" name="PARENTING_WORK_TYPE_YN" class="form-control input-sm check" text="육아단축근무"/>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>발령대상자</span>
                                </li>
                            </ul>
                            <div class="ad_tbl_toplist">
                                <sbux-button id="btnDeleteRow" name="btnDeleteRow" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow" style="float: right;"></sbux-button>
                                <sbux-button id="btnAddRow" name="btnAddRow" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" style="float: right;"></sbux-button>
                                <sbux-button id="btnToggleMode" name="btnToggleMode" uitype="normal" text="복사모드해제" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode" style="float: right;"></sbux-button>
                                <sbux-button id="btnDeleteAll" name="btnDeleteAll" uitype="normal" text="일괄삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteAll" style="float: right;"></sbux-button>
                                <sbux-button id="btnAddAll" name="btnAddAll" uitype="normal" text="일괄추가" class="btn btn-sm btn-outline-danger" onclick="fn_addAll" style="float: right;"></sbux-button>
                            </div>
                        </div>
                        <div class="table-responsive tbl_scroll_xs">
                            <table class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:12.5%">
                                    <col style="width:12.5%">
                                    <col style="width:12.5%">
                                    <col style="width:12.5%">
                                    <col style="width:12.5%">
                                    <col style="width:12.5%">
                                    <col style="width:12.5%">
                                    <col style="width:12.5%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">법인</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="COMP_CODE" uitype="single" jsondata-ref="jsonCompCode" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td></td>
                                    <th scope="row" class="th_bg">사업장</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">부서</th>
                                    <td class="td_input">
                                        <sbux-input id="DEPT_CODE" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="DEPT_NAME" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <td></td>
                                    <th scope="row" class="th_bg">사원</th>
                                    <td class="td_input">
                                        <sbux-input id="EMP_CODE" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="EMP_NAME" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">직위</th>
                                    <td class="td_input">
                                        <sbux-select id="POSITION_CODE" uitype="single" jsondata-ref="jsonPositionCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">직책</th>
                                    <td class="td_input">
                                        <sbux-select id="DUTY_CODE" uitype="single" jsondata-ref="jsonDutyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">직급</th>
                                    <td class="td_input">
                                        <sbux-select id="JOB_RANK" uitype="single" jsondata-ref="jsonJobRank" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">직군</th>
                                    <td class="td_input">
                                        <sbux-select id="JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">직무</th>
                                    <td class="td_input">
                                        <sbux-select id="JOB_CODE" uitype="single" jsondata-ref="jsonJobCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">근무지</th>
                                    <td class="td_input">
                                        <sbux-select id="WORK_REGION" uitype="single" jsondata-ref="jsonWorkRegion" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="table-responsive tbl_scroll_sm">
                            <div id="sb-area-bandgvwDetail" style="height:270px;"></div>
                        </div>
                    </div>
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
        fn_createGvwListGrid();
        fn_createBandgvwDetailGrid();

        fn_search();
    });

    var jsonSiteCode	= [];	// 사업장
    var jsonAppointType = []; // 발령구분
    var jsonApplyYn = []; // 적용구분
    var jsonStatusCode = []; // 발령상태
    var jsonPositionCode = []; // 직위
    var jsonDutyCode = []; // 직책
    var jsonJobRank = []; // 직급
    var jsonJobGroup = []; // 직군
    var jsonJobCode = []; // 직무
    var jsonWorkRegion = []; // 근무지
    var jsonJobFamily = []; // 현직원하위그룹
    var jsonParentingWorkType = []; // 육아시간근로단축
    var jsonTimeStartDayType = []; // 시작구분

    const fn_initSBSelect = async function() {
        SBUxMethod.set("SRCH_APPOINT_DATE_FR", gfn_dateToYmd(new Date(new Date().getFullYear(), new Date().getMonth(), 1)));
        SBUxMethod.set("SRCH_APPOINT_DATE", gfn_dateToYmd(new Date()));

        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['SRCH_SITE_CODE', 'SITE_CODE', 'bandgvwDetail'], jsonSiteCode, 'L_ORG001', '', '', 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 발령구분
            gfnma_setComSelect(['SRCH_APPOINT_TYPE', 'gvwList'], jsonAppointType, 'L_HRI041', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 적용구분
            gfnma_setComSelect(['APPLY_YN'], jsonApplyYn, 'L_HRM003', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 발령상태
            gfnma_setComSelect(['STATUS_CODE'], jsonStatusCode, 'L_FIG002', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['POSITION_CODE', 'bandgvwDetail'], jsonPositionCode, 'L_HRI002', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['DUTY_CODE', 'bandgvwDetail'], jsonDutyCode, 'L_HRI003', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직급
            gfnma_setComSelect(['JOB_RANK', 'bandgvwDetail'], jsonJobRank, 'L_HRI005', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직군
            gfnma_setComSelect(['JOB_GROUP', 'bandgvwDetail'], jsonJobGroup, 'L_HRI047', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직무
            gfnma_setComSelect(['JOB_CODE', 'bandgvwDetail'], jsonJobCode, 'L_HRI006', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무지
            gfnma_setComSelect(['WORK_REGION', 'bandgvwDetail'], jsonWorkRegion, 'L_HRI999', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 휴직유형
            gfnma_setComSelect(['bandgvwDetail'], jsonTimeOffType, 'L_HRT003', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직종
            gfnma_setComSelect(['bandgvwDetail'], jsonJobFamily, 'L_HRI004', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 육아기근로시간단축
            gfnma_setComSelect(['bandgvwDetail'], jsonParentingWorkType, 'L_HRM006', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 시작구분
            gfnma_setComSelect(['bandgvwDetail'], jsonTimeStartDayType, 'L_HRT011', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),


        ]);
    }

    //grid 초기화
    var gvwList; 			// 그리드를 담기위한 객체 선언
    var bandgvwDetail;

    var jsonEmpList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonBandgvwDetailList = [];

    function fn_createGvwListGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwList';
        SBGridProperties.id 				= 'gvwList';
        SBGridProperties.jsonref 			= 'jsonEmpList';
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
            {caption: [""],			        ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:left', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }}},
            {caption: ["발령일자"], 	        ref: 'APPOINT_DATE',    	        type:'output',  	width:'89px',  	style:'text-align:left'},
            {caption: ["발령유형"],  		ref: 'APPOINT_TYPE',    			type:'output',  	width:'91px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAppointType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["발령번호"],           ref: 'APPOINT_NUM', 		        type:'output',  	width:'106px', style:'text-align:left'},
            {caption: ["발령명칭"],           ref: 'APPOINT_TITLE', 		        type:'output',  	width:'167px', style:'text-align:left'},
            {caption: ["적용여부"],           ref: 'APPLY_YN', 		            type:'output',  	width:'74px',  style:'text-align:left'},
            {caption: ["부서적용"],           ref: 'DEPT_APPOINT_YN', 		    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["직책적용"],      	 ref: 'POSITION_APPOINT_YN', 		type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["직위적용"],     	     ref: 'DUTY_APPOINT_YN', 		    type:'output',  	width:'90px',  style:'text-align:left', hidden: true},
            {caption: ["직급적용"],            ref: 'JOB_RANK_APPOINT_YN', 		type:'output',  	width:'90px',  style:'text-align:left', hidden: true},
            {caption: ["직군적용"],            ref: 'JOB_GROUP_APPOINT_YN', 		type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["직무적용"],            ref: 'JOB_APPOINT_YN', 		    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["근무지적용"],           ref: 'REGION_APPOINT_YN', 		type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["발령유형명"],          ref: 'APPOINT_TYPE_NAME', 		    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["직원하위그룹"],         ref: 'JOB_FAMILY_APPOINT_YN', 	type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["육아단축근무"],         ref: 'PARENTING_WORK_TYPE_YN', 	type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["APPR_ID"],            ref: 'APPR_ID', 		            type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["APPR_COUNT"],         ref: 'APPR_COUNT', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["현단계결재자"],         ref: 'CURRENT_APPROVE_EMP_CODE', 	type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["최종결재자"],           ref: 'FINAL_APPROVER', 		    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["BEFORE_APPR_EMP"],    ref: 'BEFORE_APPR_EMP', 		    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["NEXT_APPR_EMP"],      ref: 'NEXT_APPR_EMP', 		    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["BEFORE_PROXY_EMP"],   ref: 'BEFORE_PROXY_EMP', 		    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["NEXT_PROXY_EMP"],     ref: 'NEXT_PROXY_EMP', 		    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["CONFIRM_EMP_CODE"],   ref: 'CONFIRM_EMP_CODE', 		    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["PROXY_EMP_CODE"],     ref: 'PROXY_EMP_CODE', 		    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["STATUS_CODE"],        ref: 'STATUS_CODE', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["APPROVE_DATE"],       ref: 'APPROVE_DATE', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        gvwList.bind('click', 'fn_view');
        gvwList.bind('beforepagechanged', 'fn_pagingEmpList');
    }

    function fn_createBandgvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-bandgvwDetail';
        SBGridProperties.id 				= 'bandgvwDetail';
        SBGridProperties.jsonref 			= 'jsonBandgvwDetailList';
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
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:left', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }}},
            {caption: ["사원번호"], 	    ref: 'EMP_CODE',    	        type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["사원명"],  		ref: 'EMP_FULL_NAME',    			type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["시작일자"],       ref: 'START_DATE', 		        type:'output',  	width:'128px', style:'text-align:left'},
            {caption: ["종료일자"],       ref: 'END_DATE', 		        type:'output',  	width:'128px', style:'text-align:left'},
            {caption: ["휴직유형"],       ref: 'TIME_OFF_TYPE', 		        type:'output',  	width:'89px', style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonTimeOffType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["현부서"],        ref: 'DEPT_CODE1', 		            type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["현부서명"],      ref: 'DEPT_NAME1', 		    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["현직위"],      	ref: 'POSITION_CODE1', 		type:'output',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["현직책"],      	ref: 'DUTY_CODE1', 		type:'output',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["현직급"],      	ref: 'JOB_RANK1', 		type:'output',  	width:'110px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonJobRank',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["현직군"],      	ref: 'JOB_GROUP1', 		type:'output',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonJobGroup',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["현직무"],      	ref: 'JOB_CODE1', 		type:'output',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonJobCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["현직원하위그룹"],  ref: 'JOB_FAMILY1', 		type:'output',  	width:'103px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonJobFamily',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["현근무지"],      ref: 'REGION_CODE1', 		type:'output',  	width:'100px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWorkRegion',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["현원가중심점"],      	ref: 'COST_DEPT1', 		type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["현원가중심점명"],      ref: 'COST_DEPT1_NAME', 		type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["발령부서"],      	ref: 'DEPT_CODE2', 		type:'output',  	width:'82px',  style:'text-align:left'},
            {caption: ["발령부서명"],      	ref: 'DEPT_NAME2', 		type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["발령직위"],      	ref: 'POSITION_CODE2', 		type:'output',  	width:'103px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["발령직책"],      	ref: 'DUTY_CODE2', 		type:'output',  	width:'103px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["발령직급"],      	ref: 'JOB_RANK2', 		type:'output',  	width:'110px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonJobRank',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["발령직군"],      	ref: 'JOB_GROUP2', 		type:'output',  	width:'101px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonJobGroup',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["발령직무"],      	ref: 'JOB_CODE2', 		type:'output',  	width:'89px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonJobCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["발령직원하위그룹"],    ref: 'JOB_FAMILY2', 		type:'output',  	width:'89px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonJobFamily',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["발령근무지"],      	ref: 'REGION_CODE2', 		type:'output',  	width:'100px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWorkRegion',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["발령원가중심점코드"],   ref: 'COST_DEPT2', 		type:'output',  	width:'113px',  style:'text-align:left'},
            {caption: ["발령원가중심점명"],     ref: 'COST_DEPT2_NAME', 		type:'output',  	width:'128px',  style:'text-align:left'},
            {caption: ["당초발령번호"],      	ref: 'FIRST_APPOINT_NUM', 		type:'output',  	width:'200px',  style:'text-align:left'},
            {caption: ["발령사유"],      	ref: 'APPOINT_REASON', 		type:'output',  	width:'200px',  style:'text-align:left'},
            {caption: ["비고"],      	    ref: 'MEMO', 		type:'output',  	width:'300px',  style:'text-align:left'},
            {caption: ["유형"],      	    ref: 'APPOINT_TYPE', 		type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["현사업장"],      	ref: 'SITE_CODE1', 		type:'output',  	width:'111px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["발령사업장"],      	ref: 'SITE_CODE2', 		type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["육아기근로시간단축"],   ref: 'PARENTING_WORK_TYPE', 		type:'output',  	width:'120px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonParentingWorkType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["시작구분"],      	ref: 'TIME_START_DAY_TYPE', 		type:'output',  	width:'65px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonTimeStartDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["시작시각"],      	ref: 'TIME_START_HHMM', 		type:'output',  	width:'66px',  style:'text-align:left'},
            {caption: ["종료구분"],      	ref: 'TIME_END_DAY_TYPE', 		type:'output',  	width:'65px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonTimeStartDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["종료시각"],      	ref: 'TIME_END_HHMM', 		type:'output',  	width:'66px',  style:'text-align:left'},
        ];

        bandgvwDetail = _SBGrid.create(SBGridProperties);
        bandgvwDetail.bind('beforepagechanged', 'fn_pagingTotalEmpList');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {

        // set pagination
        let pageSize = gvwList.getPageSize();
        let pageNo = 1;

        gvwList.movePaging(pageNo);
    }

    /**
     *
     */
    const fn_pagingEmpList = async function() {
        let recordCountPerPage 	= gvwList.getPageSize();   			// 몇개의 데이터를 가져올지 설정
        let currentPageNo 		= gvwList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
        var getColRef 			= gvwList.getColRef("checked");
        gvwList.setFixedcellcheckboxChecked(0, getColRef, false);
        fn_setGvwList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setGvwList = async function(pageSize, pageNo) {

        gvwList.clearStatus();

        let SITE_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let APPOINT_TYPE	= gfnma_nvl(SBUxMethod.get("SRCH_APPOINT_TYPE"));
        let APPOINT_NUM	= gfnma_nvl(SBUxMethod.get("SRCH_APPOINT_NUM"));
        let APPOINT_DATE_FR	= gfnma_nvl(SBUxMethod.get("SRCH_APPOINT_DATE_FR"));
        let APPOINT_DATE	= gfnma_nvl(SBUxMethod.get("SRCH_APPOINT_DATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: 'N'
            ,V_P_LANG_ID		: 'KOR'
            ,V_P_COMP_CODE		: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
            ,V_P_APPOINT_NUM    : APPOINT_NUM
            ,V_P_APPOINT_DATE_FR: APPOINT_DATE_FR
            ,V_P_APPOINT_DATE_TO: APPOINT_DATE
            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_DEPT_CODE      : ''
            ,V_P_EMP_CODE       : ''
            ,V_P_POSITION_CODE  : ''
            ,V_P_DUTY_CODE      : ''
            ,V_P_JOB_RANK       : ''
            ,V_P_JOB_GROUP      : ''
            ,V_P_JOB_CODE       : ''
            ,V_P_WORK_REGION    : ''
            ,V_P_APPOINT_TYPE   : APPOINT_TYPE
            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1300List.do", {
            getType				: 'json',
            workType			: 'Q',
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

        let SITE_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let DEPT_CODE   = rowData.DEPT_CODE;
        let APPOINT_TYPE	= gfnma_nvl(SBUxMethod.get("SRCH_APPOINT_TYPE"));
        let APPOINT_NUM	= rowData.APPOINT_NUM;
        let APPOINT_DATE_FR	= gfnma_nvl(SBUxMethod.get("SRCH_APPOINT_DATE_FR"));
        let APPOINT_DATE	= gfnma_nvl(SBUxMethod.get("SRCH_APPOINT_DATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: 'N'
            ,V_P_LANG_ID		: 'KOR'
            ,V_P_COMP_CODE		: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
            ,V_P_APPOINT_NUM    : APPOINT_NUM
            ,V_P_APPOINT_DATE_FR: APPOINT_DATE_FR
            ,V_P_APPOINT_DATE_TO: APPOINT_DATE
            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_DEPT_CODE      : DEPT_CODE
            ,V_P_EMP_CODE       : ''
            ,V_P_POSITION_CODE  : ''
            ,V_P_DUTY_CODE      : ''
            ,V_P_JOB_RANK       : ''
            ,V_P_JOB_GROUP      : ''
            ,V_P_JOB_CODE       : ''
            ,V_P_WORK_REGION    : ''
            ,V_P_APPOINT_TYPE   : APPOINT_TYPE
            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1300List.do", {
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


    // 일괄추가
    const fn_addAll = async function() {
        let SITE_CODE	= gfnma_nvl(SBUxMethod.get("SITE_CODE"));
        let DEPT_CODE	= gfnma_nvl(SBUxMethod.get("DEPT_CODE"));
        let EMP_CODE	= gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        let POSITION_CODE	= gfnma_nvl(SBUxMethod.get("POSITION_CODE"));
        let DUTY_CODE	= gfnma_nvl(SBUxMethod.get("DUTY_CODE"));
        let JOB_RANK	= gfnma_nvl(SBUxMethod.get("JOB_RANK"));
        let JOB_GROUP	= gfnma_nvl(SBUxMethod.get("JOB_GROUP"));
        let JOB_CODE	= gfnma_nvl(SBUxMethod.get("JOB_CODE"));
        let WORK_REGION	= gfnma_nvl(SBUxMethod.get("WORK_REGION"));
        let APPOINT_TYPE = gfnma_nvl(SBUxMethod.get("SRCH_APPOINT_TYPE"));

        let APPOINT_DATE_FR	= gfnma_nvl(SBUxMethod.get("SRCH_APPOINT_DATE_FR"));
        let APPOINT_DATE	= gfnma_nvl(SBUxMethod.get("SRCH_APPOINT_DATE"));


        var paramObj = {
            V_P_DEBUG_MODE_YN	: 'N'
            ,V_P_LANG_ID		: 'KOR'
            ,V_P_COMP_CODE		: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
            ,V_P_APPOINT_NUM    : ''
            ,V_P_APPOINT_DATE_FR: APPOINT_DATE_FR
            ,V_P_APPOINT_DATE_TO: APPOINT_DATE
            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_DEPT_CODE      : DEPT_CODE
            ,V_P_EMP_CODE       : EMP_CODE
            ,V_P_POSITION_CODE  : POSITION_CODE
            ,V_P_DUTY_CODE      : DUTY_CODE
            ,V_P_JOB_RANK       : JOB_RANK
            ,V_P_JOB_GROUP      : JOB_GROUP
            ,V_P_JOB_CODE       : JOB_CODE
            ,V_P_WORK_REGION    : WORK_REGION
            ,V_P_APPOINT_TYPE   : APPOINT_TYPE
            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1300List.do", {
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
                data.cv_3.forEach((item, index) => {
                    const msg = {
                        EMP_CODE            : item.EMP_CODE,
                        EMP_FULL_NAME       : item.EMP_FULL_NAME,
                        START_DATE          : item.START_DATE,
                        END_DATE            : item.END_DATE,
                        TIME_OFF_TYPE       : item.TIME_OFF_TYPE,
                        DEPT_CODE1          : item.DEPT_CODE1,
                        DEPT_NAME1          : item.DEPT_NAME1,
                        POSITION_CODE1      : item.POSITION_CODE1,
                        DUTY_CODE1          : item.DUTY_CODE1,
                        JOB_RANK1           : item.JOB_RANK1,
                        JOB_GROUP1          : item.JOB_GROUP1,
                        JOB_CODE1           : item.JOB_CODE1,
                        JOB_FAMILY1         : item.JOB_FAMILY1,
                        REGION_CODE1        : item.REGION_CODE1,
                        COST_DEPT1          : item.COST_DEPT1,
                        COST_DEPT1_NAME     : item.COST_DEPT1_NAME,
                        DEPT_CODE2          : item.DEPT_CODE2,
                        DEPT_NAME2          : item.DEPT_NAME2,
                        POSITION_CODE2      : item.POSITION_CODE2,
                        DUTY_CODE2          : item.DUTY_CODE2,
                        JOB_RANK2           : item.JOB_RANK2,
                        JOB_GROUP2          : item.JOB_GROUP2,
                        JOB_CODE2           : item.JOB_CODE2,
                        JOB_FAMILY2         : item.JOB_FAMILY2,
                        REGION_CODE2        : item.REGION_CODE2,
                        COST_DEPT2          : item.COST_DEPT2,
                        COST_DEPT2_NAME     : item.COST_DEPT2_NAME,
                        FIRST_APPOINT_NUM   : item.FIRST_APPOINT_NUM,
                        APPOINT_REASON      : item.APPOINT_REASON,
                        MEMO                : item.MEMO,
                        APPOINT_TYPE        : item.APPOINT_TYPE,
                        SITE_CODE1          : item.SITE_CODE1,
                        SITE_CODE2          : item.SITE_CODE2,
                        PARENTING_WORK_TYPE : item.PARENTING_WORK_TYPE,
                        TIME_START_DAY_TYPE : item.TIME_START_DAY_TYPE,
                        TIME_START_HHMM     : item.TIME_START_HHMM,
                        TIME_END_DAY_TYPE   : item.TIME_END_DAY_TYPE,
                        TIME_END_HHMM       : item.TIME_END_HHMM
                    }
                    jsonBandgvwDetailList.push(msg);
                });

                bandgvwDetail.rebuild();
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