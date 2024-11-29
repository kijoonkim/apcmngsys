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
                    <th scope="row" class="th_bg_search">사업장</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
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
                    <th scope="row" class="th_bg_search">발령구분</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <%--<sbux-select id="SRCH_APPOINT_TYPE" uitype="single" jsondata-ref="jsonAppointType" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_APPOINT_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_APPOINT_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">발령번호</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_APPOINT">
                        <sbux-input id="SRCH_APPOINT_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_APPOINT">
                        <sbux-input id="SRCH_APPOINT_TITLE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_APPOINT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-srchAppointNum"
                                onclick="fn_findSrchAppointNum"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg_search">발령기간</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_APPOINT_DATE_FR"
                                name="SRCH_APPOINT_DATE_FR"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
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
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                        />
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>인사발령 리스트</span>
                                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
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
                                <sbux-button id="btnCancelReflectionInfo" name="btnCancelReflectionInfo" uitype="normal" text="인사기록반영취소" class="btn btn-sm btn-outline-danger" onclick="fn_cancelReflectionInfo" style="float: right;"></sbux-button>
                                <sbux-button id="btnReflectionInfo" name="btnReflectionInfo" uitype="normal" text="인사기록반영" class="btn btn-sm btn-outline-danger" onclick="fn_reflectionInfo" style="float: right;"></sbux-button>
                            </div>
                        </div>
                        <div>
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
                                        <sbux-input id="APPOINT_NUM" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>발령일자</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="APPOINT_DATE"
                                                name="APPOINT_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="input-sm inpt_data_reqed"
                                                autocomplete="off"
                                                group-id="panAppoint"
                                                required
                                        ></sbux-datepicker>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>발령구분</th>
                                    <td class="td_input" data-group="APPOINT">
                                        <sbux-input id="APPOINT_TYPE" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" group-id="panAppoint" readonly required></sbux-input>
                                    </td>
                                    <td class="td_input" data-group="APPOINT">
                                        <sbux-input id="APPOINT_TYPE_NAME" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" group-id="panAppoint" required></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="APPOINT">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="…" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findAppointType"
                                        ></sbux-button>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>발령명칭</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="APPOINT_TITLE" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" group-id="panAppoint" required></sbux-input>
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
                                        <sbux-input id="MEMO" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">승인일자</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="APPROVE_DATE"
                                                name="APPROVE_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">발령적용</th>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="DEPT_APPOINT_YN" name="DEPT_APPOINT_YN" class="form-control input-sm check" text="부서" true-value="Y" false-value="N" onchange="fnDeptAppointYnChange(DEPT_APPOINT_YN)"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="POSITION_APPOINT_YN" name="POSITION_APPOINT_YN" class="form-control input-sm check" text="직위" true-value="Y" false-value="N" onchange="fnPositionAppointYnChange(POSITION_APPOINT_YN)"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="DUTY_APPOINT_YN" name="DUTY_APPOINT_YN" class="form-control input-sm check" text="직책" true-value="Y" false-value="N" onchange="fnDutyAppointYnChange(DUTY_APPOINT_YN)"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="JOB_RANK_APPOINT_YN" name="JOB_RANK_APPOINT_YN" class="form-control input-sm check" text="직급" true-value="Y" false-value="N" onchange="fnJobRankAppointYnChange(JOB_RANK_APPOINT_YN)"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="JOB_GROUP_APPOINT_YN" name="JOB_GROUP_APPOINT_YN" class="form-control input-sm check" text="직군" true-value="Y" false-value="N" onchange="fnJobGroupAppointYnChange(JOB_GROUP_APPOINT_YN)"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="JOB_APPOINT_YN" name="JOB_APPOINT_YN" class="form-control input-sm check" text="직무" true-value="Y" false-value="N" onchange="fnJobAppointYnChange(JOB_APPOINT_YN)"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="JOB_FAMILY_APPOINT_YN" name="JOB_FAMILY_APPOINT_YN" class="form-control input-sm check" text="직원하위그룹" true-value="Y" false-value="N" onchange="fnJobFamilyAppointYnChange(JOB_FAMILY_APPOINT_YN)"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="REGION_APPOINT_YN" name="REGION_APPOINT_YN" class="form-control input-sm check" text="근무지" true-value="Y" false-value="N" onchange="fnRegionAppointYnChange(REGION_APPOINT_YN)"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="PARENTING_WORK_TYPE_YN" name="PARENTING_WORK_TYPE_YN" class="form-control input-sm check" text="육아단축근무" true-value="Y" false-value="N" onchange="fnParentingWorkTypeYnChange(PARENTING_WORK_TYPE_YN)"/>
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
                                <sbux-button id="btnClearMode" name="btnClearMode" uitype="normal" text="복사해제모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('clear')" style="float: right;"></sbux-button>
                                <sbux-button id="btnLineCopyMode" name="btnLineCopyMode" uitype="normal" text="행복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('line')" style="float: right;"></sbux-button>
                                <sbux-button id="btnCellCopyMode" name="btnCellCopyMode" uitype="normal" text="셀복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('cell')" style="float: right;"></sbux-button>
                                <sbux-button id="btnDeleteAll" name="btnDeleteAll" uitype="normal" text="일괄삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteAll" style="float: right;"></sbux-button>
                                <sbux-button id="btnAddAll" name="btnAddAll" uitype="normal" text="일괄추가" class="btn btn-sm btn-outline-danger" onclick="fn_addAll" style="float: right;"></sbux-button>
                            </div>
                        </div>
                        <div>
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
                                    <th scope="row" class="th_bg">사업장</th>
                                    <td colspan="2" class="td_input">
                                        <%--<sbux-select id="SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">부서</th>
                                    <td class="td_input" data-group="DEPT">
                                        <sbux-input id="DEPT_CODE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input" data-group="DEPT">
                                        <sbux-input id="DEPT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="DEPT">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="…" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findDeptCode"
                                        ></sbux-button>
                                    </td>
                                    <th scope="row" class="th_bg">사원</th>
                                    <td class="td_input" data-group="EMP">
                                        <sbux-input id="EMP_CODE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input" data-group="EMP">
                                        <sbux-input id="EMP_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;" data-group="EMP">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="…" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findEmpCode"
                                        ></sbux-button>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">직위</th>
                                    <td class="td_input">
                                        <sbux-select id="POSITION_CODE" uitype="single" jsondata-ref="jsonPositionCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">직책</th>
                                    <td class="td_input">
                                        <%--<sbux-select id="DUTY_CODE" uitype="single" jsondata-ref="jsonDutyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="DUTY_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="DUTY_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
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
                                        <%--<sbux-select id="JOB_CODE" uitype="single" jsondata-ref="jsonJobCode" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="JOB_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="JOB_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row" class="th_bg">근무지</th>
                                    <td class="td_input">
                                        <%--<sbux-select id="WORK_REGION" uitype="single" jsondata-ref="jsonWorkRegion" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="WORK_REGION" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="WORK_REGION" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
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

<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
    <sbux-modal style="width:800px" id="modal-srchAppointNum" name="modal-srchAppointNum" uitype="middle" header-title="발령정보" body-html-id="body-modal-srchAppointNum" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-srchAppointNum">
    <section id="srchAppointNumPopup">
        <div class="box box-solid">
            <div class="box-header" style="display:flex; justify-content: flex-start;" >
                <div>
                    <table class="table table-bordered tbl_row tbl_fixed">
                        <colgroup>
                            <col style="width:auto">
                            <col style="width:150px">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td class="td_input" >
                                <table class="table table-bordered tbl_row tbl_fixed">
                                    <colgroup>
                                        <col style="width: 24%">
                                        <col style="width: 24%">
                                        <col style="width: 4%">
                                        <col style="width: 24%">
                                        <col style="width: 24%">
                                    </colgroup>
                                    <tbody class="cu-search-area">
                                    <tr>
                                        <th scope="th_bg">발령기간</th>
                                        <td class="td_input" style="border-right:hidden;">
                                            <sbux-datepicker
                                                    uitype="popup"
                                                    id="POP_APPOINT_DATE_FR"
                                                    name="POP_APPOINT_DATE_FR"
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
                                                    id="POP_APPOINT_DATE"
                                                    name="POP_APPOINT_DATE"
                                                    date-format="yyyy-mm-dd"
                                                    class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                    style="width:100%;"
                                            />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="th_bg">발령구분</th>
                                        <td class="td_input" style="border-right: hidden;">
                                            <div class="dropdown">
                                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="POP_APPOINT_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <font>선택</font>
                                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="POP_APPOINT_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                </div>
                                            </div>
                                        </td>
                                        <td></td>
                                        <th scope="th_bg">적용여부</th>
                                        <td class="td_input" style="border-right: hidden;">
                                            <div class="dropdown">
                                                <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="POP_APPLY_YN" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <font>선택</font>
                                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="POP_APPLY_YN" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>

                            <td class="td_input" style="text-align:right;" >
                                <div>
                                    <sbux-button uitype="normal" text="조회" class="btn btn-sm btn-outline-danger cu-btn-sch-compopup1" ></sbux-button>
                                    <sbux-button uitype="normal" text="종료" class="btn btn-sm btn-outline-danger cu-btn-close-compopup1" ></sbux-button>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="box-body">

                <div class="card cu-table-div" style="border:1px solid #f4f4f4;overflow:auto;">
                    <table class="table table-bordered table-hover cu-data-table">
                        <colgroup>
                            <col style="width: 10%">
                            <col style="width: 20%">
                            <col style="width: 15%">
                            <col style="width: 27.5%">
                            <col style="width: 10%">
                            <col style="width: 27.5%">
                        </colgroup>
                        <thead class="thead-light" style="background-color:#f5fbff;position:sticky;top:0;z-index:3">
                            <tr>
                                <th style="text-align:left">발령일자</th>
                                <th style="text-align:left">발령번호</th>
                                <th style="text-align:left">발령구분</th>
                                <th style="text-align:left">발령명칭</th>
                                <th style="text-align:left">적용여부</th>
                                <th style="text-align:left">비고</th>
                            </tr>
                        </thead>
                        <tbody style="vertical-align:middle;">
                        </tbody>
                    </table>
                </div>

            </div>
            <!--[pp] //검색결과 -->
        </div>
    </section>
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

    var jsonSiteCode = [];	// 사업장
    var jsonAppointType = []; // 발령구분
    var jsonApplyYn = []; // 적용구분
    var jsonStatusCode = []; // 발령상태
    var jsonPositionCode = []; // 직위
    var jsonDutyCode = []; // 직책
    var jsonJobRank = []; // 직급
    var jsonJobGroup = []; // 직군
    var jsonJobCode = []; // 직무
    var jsonWorkRegion = []; // 근무지
    var jsonTimeOffType = []; // 휴직유형
    var jsonJobFamily = []; // 현직원하위그룹
    var jsonParentingWorkType = []; // 육아시간근로단축
    var jsonTimeStartDayType = []; // 시작구분
    var jsonEmpState = []; // 재직구분

    const fn_initSBSelect = async function () {
        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['bandgvwDetail'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_SITE_CODE', '#SITE_CODE']
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
                    {caption: "사업장코드",		ref: 'SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "사업장명", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 발령구분
            gfnma_setComSelect(['gvwList'], jsonAppointType, 'L_HRI041', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_APPOINT_TYPE', '#POP_APPOINT_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI041'
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
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 적용구분
            gfnma_setComSelect(['APPLY_YN'], jsonApplyYn, 'L_HRM003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#POP_APPLY_YN']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRM003'
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
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 발령상태
            gfnma_setComSelect(['STATUS_CODE'], jsonStatusCode, 'L_FIG002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['POSITION_CODE', 'bandgvwDetail'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['bandgvwDetail'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#DUTY_CODE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI003'
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
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 직급
            gfnma_setComSelect(['JOB_RANK', 'bandgvwDetail'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직군
            gfnma_setComSelect(['JOB_GROUP', 'bandgvwDetail'], jsonJobGroup, 'L_HRI047', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직무
            gfnma_setComSelect(['bandgvwDetail'], jsonJobCode, 'L_HRI006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#JOB_CODE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI006'
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
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 근무지
            gfnma_setComSelect(['bandgvwDetail'], jsonWorkRegion, 'L_HRI999', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#WORK_REGION']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI999'
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
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 휴직유형
            gfnma_setComSelect(['bandgvwDetail'], jsonTimeOffType, 'L_HRT003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직종
            gfnma_setComSelect(['bandgvwDetail'], jsonJobFamily, 'L_HRI004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 육아기근로시간단축
            gfnma_setComSelect(['bandgvwDetail'], jsonParentingWorkType, 'L_HRM006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 시작구분
            gfnma_setComSelect(['bandgvwDetail'], jsonTimeStartDayType, 'L_HRT011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 재직구분
            gfnma_setComSelect(['EMP_STATE'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    const fn_findEmpCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("EMP_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("EMP_NAME"));
        var replaceText0 	= "_DEPT_NAME_";
        var replaceText1 	= "_EMP_CODE_";
        var replaceText2 	= "_EMP_NAME_";
        var replaceText3 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_CODE LIKE '%" + replaceText1 + "%' AND X.EMP_NAME LIKE '%" + replaceText2 + "%' AND X.EMP_STATE LIKE '%" + replaceText3 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		"재직상태"]
            ,searchInputFields		: ["DEPT_NAME", 	"EMP_CODE",		"EMP_NAME",		"EMP_STATE"]
            ,searchInputValues		: ["", 			searchCode, searchName,		""]
            ,searchInputTypes		: ["input", 	"input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"", "",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('EMP_CODE', data.EMP_CODE);
            },
        });
    }

    var fn_findDeptCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("DEPT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: [searchCode, 				searchName,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findAppointType = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("APPOINT_TYPE_NAME"));
        var replaceText0 	= "_SUB_CODE_";
        var replaceText1 	= "_CODE_NAME_";
        var strWhereClause 	= "AND SUB_CODE LIKE '%" + replaceText0 + "%' AND CODE_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '발령구분 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI041'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["발령코드", 		"발령구분"]
            ,searchInputFields		: ["SUB_CODE", 		"CODE_NAME"]
            ,searchInputValues		: ["", 			searchText]
            ,height					: '400px'
            ,tableHeader			: ["발령코드", "발령구분"]
            ,tableColumnNames		: ["SUB_CODE", "CODE_NAME"]
            ,tableColumnWidths		: ["80px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('APPOINT_TYPE_NAME', data.CODE_NAME);
                SBUxMethod.set('APPOINT_TYPE', data.SUB_CODE);
            },
        });
    }

    const fn_findCostDeptCodeForBandgvwDetail = function(nRow) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '원가중심점');

        var replaceText0 	= "_COST_CENTER_CODE_";
        var replaceText1 	= "_COST_CENTER_NAME_";
        var strWhereClause 	= "AND COST_CENTER_CODE LIKE '%" + replaceText0 + "%' AND COST_CENTER_NAME LIKE '%" + replaceText1 + "%' ";

        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COST_CENTER'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", 				"명칭"]
            ,searchInputFields		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
            ,searchInputValues		: ["", 			""]
            ,height					: '400px'
            ,tableHeader			: ["코스트센터코드", 	"코스트센터명"]
            ,tableColumnNames		: ["COST_CENTER_CODE", 	"COST_CENTER_NAME"]
            ,tableColumnWidths		: ["80px", 	"80px"]
            ,itemSelectEvent		: function (data){
                bandgvwDetail.setCellData(nRow, bandgvwDetail.getColRef("COST_DEPT2"), data['COST_CENTER_CODE']);
                bandgvwDetail.setCellData(nRow, bandgvwDetail.getColRef("COST_DEPT2_NAME"), data['COST_CENTER_NAME']);
            },
        });
        SBUxMethod.openModal('modal-compopup1');
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findDeptCodeForBandgvwDetail = function(nRow) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: ["", 				"",		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                console.log(data);
                bandgvwDetail.setCellData(nRow, bandgvwDetail.getColRef("DEPT_CODE2"), data['DEPT_CODE']);
                bandgvwDetail.setCellData(nRow, bandgvwDetail.getColRef("DEPT_NAME2"), data['DEPT_NAME']);
                bandgvwDetail.setCellData(nRow, bandgvwDetail.getColRef("COST_DEPT2"), data['CC_CODE']);
                bandgvwDetail.setCellData(nRow, bandgvwDetail.getColRef("COST_DEPT2_NAME"), data['CC_NAME']);
                bandgvwDetail.setCellData(nRow, bandgvwDetail.getColRef("SITE_CODE2"), data['SITE_CODE']);
            },
        });
        SBUxMethod.openModal('modal-compopup1');
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findSrchAppointNum = function() {
        const getData = async function() {
            let APPOINT_TYPE = gfn_nvl(gfnma_multiSelectGet('#POP_APPOINT_TYPE'));
            let APPLY_YN = gfn_nvl(gfnma_multiSelectGet('#POP_APPLY_YN'));
            let APPOINT_DATE_FR = gfn_nvl(SBUxMethod.get("POP_APPOINT_DATE_FR"));
            let APPOINT_DATE_TO = gfn_nvl(SBUxMethod.get("POP_APPOINT_DATE"));

            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                , V_P_LANG_ID: ''
                , V_P_COMP_CODE: gv_ma_selectedCorpCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd
                , V_P_APPOINT_NUM : ''
                , V_P_EMP_CODE : ''
                , V_P_APPOINT_DATE_FR : APPOINT_DATE_FR
                , V_P_APPOINT_DATE_TO : APPOINT_DATE_TO
                , V_P_APPOINT_TYPE : APPOINT_TYPE
                , V_P_APPLY_YN : APPLY_YN
                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1300PopupList.do", {
                getType: 'json',
                workType: 'Q',
                cv_count: '1',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    //create td
                    var tmp = "";
                    var list = data.cv_1;
                    var columns = ["APPOINT_DATE", "APPOINT_NUM", "APPOINT_TYPE", "APPOINT_TITLE", "APPLY_YN", "MEMO"];
                    for (var i= 0; i < list.length; i++) {
                        tmp += '<tr>'
                        //표시되는 컬럼
                        for (var j= 0; j < columns.length; j++) {
                            var code = columns[j];
                            tmp += '<td cu-name="' + code + '">' + list[i][code] + '</td>';
                        }
                        //비표시되는 컬럼
                        var obj = list[i];
                        for(var key in obj){
                            for (var j= 0; j < columns.length; j++) {
                                var code = columns[j];
                                if(code!=key){
                                    tmp += '<td style="display:none" cu-name="' + key + '">' + obj[key] + '</td>';
                                }
                            }
                        }
                        tmp += '</tr>'
                    }
                    $("#srchAppointNumPopup").find('.cu-data-table').find('tbody').html(tmp);
                    $("#srchAppointNumPopup").find('.cu-data-table').find('tbody').find('tr').click(function(){
                        var obj = gfnma_getObjectRowTable($(this));
                        SBUxMethod.set("SRCH_APPOINT_NUM", obj.APPOINT_NUM);
                        SBUxMethod.set("SRCH_APPOINT_TITLE", obj.APPOINT_TITLE);
                        SBUxMethod.closeModal('modal-srchAppointNum');
                    });
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
        SBUxMethod.set("POP_APPOINT_DATE_FR", gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("POP_APPOINT_DATE", gfn_dateToYmd(new Date()));
        getData();
        SBUxMethod.openModal('modal-srchAppointNum');

        //search button event
        $("#srchAppointNumPopup").find('.cu-btn-sch-compopup1').click(function(){
            getData();
        });

        //close event
        $("#srchAppointNumPopup").find('.cu-btn-close-compopup1').click(function(){
            SBUxMethod.closeModal('modal-srchAppointNum');
        });
    }

    //grid 초기화
    var gvwList; 			// 그리드를 담기위한 객체 선언
    var bandgvwDetail;

    var jsonEmpList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonBandgvwDetailList = [];

    function fn_createGvwListGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwList';
        SBGridProperties.id = 'gvwList';
        SBGridProperties.jsonref = 'jsonEmpList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["발령일자"], ref: 'APPOINT_DATE', type: 'output', width: '89px', style: 'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {
                caption: ["발령유형"], ref: 'APPOINT_TYPE', type: 'combo', width: '91px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonAppointType',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
            },
            {caption: ["발령번호"], ref: 'APPOINT_NUM', type: 'output', width: '106px', style: 'text-align:left'},
            {caption: ["발령명칭"], ref: 'APPOINT_TITLE', type: 'output', width: '167px', style: 'text-align:left'},
            {caption: ["적용여부"], ref: 'APPLY_YN', type: 'combo', width: '74px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonApplyYn',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , disabled: true
            },
            {
                caption: ["부서적용"],
                ref: 'DEPT_APPOINT_YN',
                type: 'output',
                width: '80px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["직책적용"],
                ref: 'POSITION_APPOINT_YN',
                type: 'output',
                width: '80px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["직위적용"],
                ref: 'DUTY_APPOINT_YN',
                type: 'output',
                width: '90px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["직급적용"],
                ref: 'JOB_RANK_APPOINT_YN',
                type: 'output',
                width: '90px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["직군적용"],
                ref: 'JOB_GROUP_APPOINT_YN',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["직무적용"],
                ref: 'JOB_APPOINT_YN',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["근무지적용"],
                ref: 'REGION_APPOINT_YN',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["발령유형명"],
                ref: 'APPOINT_TYPE_NAME',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["직원하위그룹"],
                ref: 'JOB_FAMILY_APPOINT_YN',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["육아단축근무"],
                ref: 'PARENTING_WORK_TYPE_YN',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["APPR_ID"],
                ref: 'APPR_ID',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["APPR_COUNT"],
                ref: 'APPR_COUNT',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["현단계결재자"],
                ref: 'CURRENT_APPROVE_EMP_CODE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {caption: ["최종결재자"], ref: 'FINAL_APPROVER', type: 'output', width: '75px', style: 'text-align:left'},
            {
                caption: ["BEFORE_APPR_EMP"],
                ref: 'BEFORE_APPR_EMP',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["NEXT_APPR_EMP"],
                ref: 'NEXT_APPR_EMP',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["BEFORE_PROXY_EMP"],
                ref: 'BEFORE_PROXY_EMP',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["NEXT_PROXY_EMP"],
                ref: 'NEXT_PROXY_EMP',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["CONFIRM_EMP_CODE"],
                ref: 'CONFIRM_EMP_CODE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["PROXY_EMP_CODE"],
                ref: 'PROXY_EMP_CODE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["STATUS_CODE"],
                ref: 'STATUS_CODE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
            {
                caption: ["APPROVE_DATE"],
                ref: 'APPROVE_DATE',
                type: 'output',
                width: '75px',
                style: 'text-align:left',
                hidden: true
            },
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        gvwList.bind('click', 'fn_view');
        gvwList.bind('keyup', 'fn_keyup');
    }

    function fn_createBandgvwDetailGrid(disableOption) {
        let DEPT_APPOINT_YN = gfn_nvl(SBUxMethod.get("DEPT_APPOINT_YN").DEPT_APPOINT_YN);
        let POSITION_APPOINT_YN = gfn_nvl(SBUxMethod.get("POSITION_APPOINT_YN").POSITION_APPOINT_YN);
        let DUTY_APPOINT_YN = gfn_nvl(SBUxMethod.get("DUTY_APPOINT_YN").DUTY_APPOINT_YN);
        let JOB_RANK_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_RANK_APPOINT_YN").JOB_RANK_APPOINT_YN);
        let JOB_GROUP_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_GROUP_APPOINT_YN").JOB_GROUP_APPOINT_YN);
        let JOB_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_APPOINT_YN").JOB_APPOINT_YN);
        let JOB_FAMILY_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_FAMILY_APPOINT_YN").JOB_FAMILY_APPOINT_YN);
        let REGION_APPOINT_YN = gfn_nvl(SBUxMethod.get("REGION_APPOINT_YN").REGION_APPOINT_YN);
        let APPOINT_TYPE = gfn_nvl(SBUxMethod.get("APPOINT_TYPE"));

        let commonHiddenYn = (DEPT_APPOINT_YN == "N" && POSITION_APPOINT_YN == "N" &&
            DUTY_APPOINT_YN == "N" && JOB_RANK_APPOINT_YN == "N" &&
            JOB_GROUP_APPOINT_YN == "N" && JOB_APPOINT_YN == "N" &&
            JOB_FAMILY_APPOINT_YN == "N" && REGION_APPOINT_YN == "N");

        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-bandgvwDetail';
        SBGridProperties.id = 'bandgvwDetail';
        SBGridProperties.jsonref = 'jsonBandgvwDetailList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
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

        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {
                caption: ["인원정보", ""],
                ref: 'CHK_YN',
                type: 'checkbox',
                width: '45px',
                style: 'text-align:center',
                typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true},
                disabled: disableOption
            },
            {caption: ["인원정보","사원번호"], ref: 'EMP_CODE', type: 'input', width: '80px', style: 'text-align:left', disabled: disableOption},
            {caption: ["인원정보","사원명"], ref: 'EMP_FULL_NAME', type: 'input', width: '80px', style: 'text-align:left', disabled: disableOption},
            {caption: ["기간정보","시작일자"], ref: 'START_DATE', type: 'datepicker', width: '128px', style: 'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'},
                disabled: disableOption
            },
            {caption: ["기간정보","종료일자"], ref: 'END_DATE', type: 'datepicker', width: '128px', style: 'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'},
                disabled: disableOption
            },
            {
                caption: ["기간정보","휴직유형"], ref: 'TIME_OFF_TYPE', type: 'combo', width: '89px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonTimeOffType',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                },
                disabled: disableOption
            },
            {caption: ["기간정보","발령유형"], ref: 'APPOINT_TYPE', type: 'input', width: '75px', style: 'text-align:left', hidden: false, disabled: disableOption},
            {
                caption: ["시작시각","시작구분"], ref: 'TIME_START_DAY_TYPE', type: 'combo', width: '65px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonTimeStartDayType',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: false
                , disabled: disableOption
            },
            {caption: ["시작시각"," 시작시각"], ref: 'TIME_START_HHMM', type: 'input', width: '66px', style: 'text-align:left', hidden: false, disabled: disableOption},
            {
                caption: ["종료시각","종료구분"], ref: 'TIME_END_DAY_TYPE', type: 'combo', width: '65px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonTimeStartDayType',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: false
                , disabled: disableOption
            },
            {caption: ["종료시각"," 종료시각"], ref: 'TIME_END_HHMM', type: 'input', width: '66px', style: 'text-align:left', hidden: false, disabled: disableOption},
            {caption: ["현재정보","현부서"], ref: 'DEPT_CODE1', type: 'input', width: '80px', style: 'text-align:left', hidden: commonHiddenYn, disabled: disableOption},
            {caption: ["현재정보","현부서명"], ref: 'DEPT_NAME1', type: 'input', width: '120px', style: 'text-align:left'
                , hidden: (commonHiddenYn || (DEPT_APPOINT_YN != "Y")), disabled: disableOption},
            {caption: ["현재정보","현원가중심점"], ref: 'COST_DEPT1', type: 'input', width: '80px', style: 'text-align:left', hidden: commonHiddenYn, disabled: disableOption},
            {caption: ["현재정보","현원가중심점명"], ref: 'COST_DEPT1_NAME', type: 'input', width: '120px', style: 'text-align:left'
                , hidden: (commonHiddenYn || !(APPOINT_TYPE != "O5" && APPOINT_TYPE != "O6")), disabled: disableOption},
            {
                caption: ["현재정보"," 직위"], ref: 'POSITION_CODE1', type: 'combo', width: '80px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonPositionCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (POSITION_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["현재정보"," 직책"], ref: 'DUTY_CODE1', type: 'combo', width: '80px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonDutyCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (DUTY_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["현재정보"," 직급"], ref: 'JOB_RANK1', type: 'combo', width: '110px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonJobRank',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (JOB_RANK_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["현재정보"," 직군"], ref: 'JOB_GROUP1', type: 'combo', width: '80px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonJobGroup',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (JOB_GROUP_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["현재정보"," 직무"], ref: 'JOB_CODE1', type: 'combo', width: '80px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonJobCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (JOB_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["현재정보"," 직원하위그룹"], ref: 'JOB_FAMILY1', type: 'combo', width: '103px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonJobFamily',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (JOB_FAMILY_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["현재정보"," 현사업장"], ref: 'SITE_CODE1', type: 'combo', width: '111px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonSiteCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || !(APPOINT_TYPE != "O5" && APPOINT_TYPE != "O6"))
                , disabled: disableOption
            },
            {
                caption: ["현재정보"," 현근무지"], ref: 'REGION_CODE1', type: 'combo', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonWorkRegion',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (REGION_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {caption: ["발령정보","발령부서"], ref: 'DEPT_CODE2', type: 'output', width: '82px', style: 'text-align:left', hidden: commonHiddenYn, disabled: disableOption},
            {caption: ["발령정보","발령부서명"], ref: 'DEPT_NAME2', type: 'output', width: '120px', style: 'text-align:left'
                , hidden: (commonHiddenYn || (DEPT_APPOINT_YN != "Y")), disabled: disableOption},
            {caption: ["발령정보","발령부서명"], ref: 'DEPT_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findDeptCodeForBandgvwDetail(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {caption: ["발령정보","발령원가중심점코드"], ref: 'COST_DEPT2', type: 'output', width: '113px', style: 'text-align:left', hidden: commonHiddenYn, disabled: disableOption},
            {caption: ["발령정보","발령원가중심점명"], ref: 'COST_DEPT2_NAME', type: 'output', width: '128px', style: 'text-align:left'
                , hidden: (commonHiddenYn || !(APPOINT_TYPE != "O5" && APPOINT_TYPE != "O6")), disabled: disableOption},
            {caption: ["발령정보","발령원가중심점명"], ref: 'COST_DEPT_BTN',    				type:'button',  	width:'30px',  		style:'text-align:center',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:20px' onClick='fn_findCostDeptCodeForBandgvwDetail(" + nRow + ")'><img src='../../../resource/images/find2.png' width='12px' /></button>";
                }
            },
            {
                caption: ["발령정보","직위"], ref: 'POSITION_CODE2', type: 'combo', width: '103px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonPositionCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (POSITION_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["발령정보","직책"], ref: 'DUTY_CODE2', type: 'combo', width: '103px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonDutyCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (DUTY_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["발령정보","직급"], ref: 'JOB_RANK2', type: 'combo', width: '110px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonJobRank',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (JOB_RANK_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["발령정보","직군"], ref: 'JOB_GROUP2', type: 'combo', width: '101px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonJobGroup',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (JOB_GROUP_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["발령정보","직무"], ref: 'JOB_CODE2', type: 'combo', width: '89px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonJobCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (JOB_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["발령정보","직원하위그룹"], ref: 'JOB_FAMILY2', type: 'combo', width: '89px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonJobFamily',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (JOB_FAMILY_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["발령정보","발령사업장"], ref: 'SITE_CODE2', type: 'combo', width: '120px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonSiteCode',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || !(APPOINT_TYPE != "O5" && APPOINT_TYPE != "O6"))
                , disabled: disableOption
            },
            {
                caption: ["발령정보","발령근무지"], ref: 'REGION_CODE2', type: 'combo', width: '100px', style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonWorkRegion',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (commonHiddenYn || (REGION_APPOINT_YN != "Y"))
                , disabled: disableOption
            },
            {
                caption: ["기타정보","육아기근로시간단축"],
                ref: 'PARENTING_WORK_TYPE',
                type: 'combo',
                width: '120px',
                style: 'text-align:left',
                typeinfo: {
                    ref: 'jsonParentingWorkType',
                    label: 'label',
                    value: 'value',
                    itemcount: 10
                }
                , hidden: (PARENTING_WORK_TYPE_YN != "Y")
                , disabled: disableOption
            },
            {caption: ["기타정보","당초발령번호"], ref: 'FIRST_APPOINT_NUM', type: 'input', width: '200px', style: 'text-align:left', disabled: disableOption},
            {caption: ["기타정보","발령사유"], ref: 'APPOINT_REASON', type: 'input', width: '200px', style: 'text-align:left', disabled: disableOption},
            {caption: ["기타정보","비고"], ref: 'MEMO', type: 'input', width: '300px', style: 'text-align:left', disabled: disableOption},
        ];

        bandgvwDetail = _SBGrid.create(SBGridProperties);
        bandgvwDetail.bind('valuechanged', 'fn_bandgvwDetailValueChanged');
    }

    const fn_bandgvwDetailValueChanged = async function() {
        var nRow = bandgvwDetail.getRow();
        var nCol = bandgvwDetail.getCol();
        var rowData = bandgvwDetail.getRowData(nRow);

        if (nCol == bandgvwDetail.getColRef('TIME_OFF_TYPE')) {
            if (bandgvwDetail.getCellData(nRow, bandgvwDetail.getColRef('TIME_OFF_TYPE')) == "H0090") {
                const getData = async function() {
                    gfnma_multiSelectSet('#POP_APPOINT_TYPE', 'SUB_CODE', 'CODE_NAME', gfn_nvl(SBUxMethod.get("APPOINT_TYPE")));
                    let APPOINT_TYPE = gfn_nvl(SBUxMethod.get("APPOINT_TYPE"));
                    let APPLY_YN = "Y";
                    let APPOINT_DATE_FR = gfn_nvl(SBUxMethod.get("POP_APPOINT_DATE_FR"));
                    let APPOINT_DATE_TO = gfn_nvl(SBUxMethod.get("POP_APPOINT_DATE"));
                    let EMP_CODE = bandgvwDetail.getCellData(nRow, bandgvwDetail.getColRef('EMP_CODE'));
                    let APPOINT_NUM = gfn_nvl(SBUxMethod.get("APPOINT_NUM"));

                    var paramObj = {
                        V_P_DEBUG_MODE_YN: ''
                        , V_P_LANG_ID: ''
                        , V_P_COMP_CODE: gv_ma_selectedCorpCd
                        , V_P_CLIENT_CODE: gv_ma_selectedClntCd
                        , V_P_APPOINT_NUM : APPOINT_NUM
                        , V_P_EMP_CODE : EMP_CODE
                        , V_P_APPOINT_DATE_FR : APPOINT_DATE_FR
                        , V_P_APPOINT_DATE_TO : APPOINT_DATE_TO
                        , V_P_APPOINT_TYPE : APPOINT_TYPE
                        , V_P_APPLY_YN : APPLY_YN
                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''
                    };

                    const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1300PopupList.do", {
                        getType: 'json',
                        workType: 'Q1',
                        cv_count: '1',
                        params: gfnma_objectToString(paramObj)
                    });

                    const data = await postJsonPromise;

                    try {
                        if (_.isEqual("S", data.resultStatus)) {
                            //create td
                            var tmp = "";
                            var list = data.cv_1;
                            var columns = ["APPOINT_DATE", "APPOINT_NUM", "APPOINT_TYPE", "APPOINT_TITLE", "APPLY_YN", "MEMO"];
                            for (var i= 0; i < list.length; i++) {
                                tmp += '<tr>'
                                //표시되는 컬럼
                                for (var j= 0; j < columns.length; j++) {
                                    var code = columns[j];
                                    tmp += '<td cu-name="' + code + '">' + list[i][code] + '</td>';
                                }
                                //비표시되는 컬럼
                                var obj = list[i];
                                for(var key in obj){
                                    for (var j= 0; j < columns.length; j++) {
                                        var code = columns[j];
                                        if(code!=key){
                                            tmp += '<td style="display:none" cu-name="' + key + '">' + obj[key] + '</td>';
                                        }
                                    }
                                }
                                tmp += '</tr>'
                            }
                            $("#srchAppointNumPopup").find('.cu-data-table').find('tbody').html(tmp);
                            $("#srchAppointNumPopup").find('.cu-data-table').find('tbody').find('tr').click(function(){
                                var obj = gfnma_getObjectRowTable($(this));
                                bandgvwDetail.setCellData(nRow, bandgvwDetail.getColRef('FIRST_APPOINT_NUM'), obj.APPOINT_NUM);
                                bandgvwDetail.setCellData(nRow, bandgvwDetail.getColRef('APPOINT_REASON'), obj.APPOINT_TITLE);
                                SBUxMethod.closeModal('modal-srchAppointNum');
                            });
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
                SBUxMethod.set("POP_APPOINT_DATE_FR", gfn_dateFirstYmd(new Date()));
                SBUxMethod.set("POP_APPOINT_DATE", gfn_dateToYmd(new Date()));
                getData();
                SBUxMethod.openModal('modal-srchAppointNum');

                //search button event
                $("#srchAppointNumPopup").find('.cu-btn-sch-compopup1').click(function(){
                    getData();
                });

                //close event
                $("#srchAppointNumPopup").find('.cu-btn-close-compopup1').click(function(){
                    SBUxMethod.closeModal('modal-srchAppointNum');
                });

            }
        }
    }

    function fnDeptAppointYnChange(args){
        let DEPT_APPOINT_YN = args ? args.DEPT_APPOINT_YN : gfn_nvl(SBUxMethod.get("DEPT_APPOINT_YN").DEPT_APPOINT_YN);
        let APPOINT_TYPE = gfn_nvl(SBUxMethod.get("APPOINT_TYPE"));

        if (DEPT_APPOINT_YN == "Y") {
            //소속부서
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('DEPT_NAME1'), false, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('DEPT_NAME2'), false, true);
            //겸직 겸직헤제일때는 발령부서만 조회될수 있도록 처리
            if (APPOINT_TYPE != "O5" && APPOINT_TYPE != "O6") {
                //귀속부서
                bandgvwDetail.setColHidden(bandgvwDetail.getColRef('COST_DEPT1_NAME'), false, true);
                bandgvwDetail.setColHidden(bandgvwDetail.getColRef('COST_DEPT2_NAME'), false, true);

                //사업장
                bandgvwDetail.setColHidden(bandgvwDetail.getColRef('SITE_CODE1'), false, true);
                bandgvwDetail.setColHidden(bandgvwDetail.getColRef('SITE_CODE2'), false, true);
            }
        } else {
            //소속부서
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('DEPT_NAME1'), true, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('DEPT_NAME2'), true, true);

            //귀속부서
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('COST_DEPT1_NAME'), true, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('COST_DEPT2_NAME'), true, true);

            //사업장
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('SITE_CODE1'), true, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('SITE_CODE2'), true, true);
        }
    }

    function fnPositionAppointYnChange(args){
        let POSITION_APPOINT_YN = args ? args.POSITION_APPOINT_YN : gfn_nvl(SBUxMethod.get("POSITION_APPOINT_YN").POSITION_APPOINT_YN);

        if (POSITION_APPOINT_YN == "Y") {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('POSITION_CODE1'), false, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('POSITION_CODE2'), false, true);
        } else {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('POSITION_CODE1'), true, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('POSITION_CODE2'), true, true);
        }
    }

    function fnDutyAppointYnChange(args){
        let DUTY_APPOINT_YN = args ? args.DUTY_APPOINT_YN : gfn_nvl(SBUxMethod.get("DUTY_APPOINT_YN").DUTY_APPOINT_YN);

        if (DUTY_APPOINT_YN == "Y") {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('DUTY_CODE1'), false, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('DUTY_CODE2'), false, true);
        } else {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('DUTY_CODE1'), true, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('DUTY_CODE2'), true, true);
        }
    }

    function fnJobRankAppointYnChange(args){
        let JOB_RANK_APPOINT_YN = args ? args.JOB_RANK_APPOINT_YN : gfn_nvl(SBUxMethod.get("JOB_RANK_APPOINT_YN").JOB_RANK_APPOINT_YN);

        if (JOB_RANK_APPOINT_YN == "Y") {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_RANK1'), false, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_RANK2'), false, true);
        } else {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_RANK1'), true, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_RANK2'), true, true);
        }
    }

    function fnJobGroupAppointYnChange(args){
        let JOB_GROUP_APPOINT_YN = args ? args.JOB_GROUP_APPOINT_YN : gfn_nvl(SBUxMethod.get("JOB_GROUP_APPOINT_YN").JOB_GROUP_APPOINT_YN);

        if (JOB_GROUP_APPOINT_YN == "Y") {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_GROUP1'), false, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_GROUP2'), false, true);
        } else {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_GROUP1'), true, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_GROUP2'), true, true);
        }
    }

    function fnJobAppointYnChange(args){
        let JOB_APPOINT_YN = args ? args.JOB_APPOINT_YN : gfn_nvl(SBUxMethod.get("JOB_APPOINT_YN").JOB_APPOINT_YN);

        if (JOB_APPOINT_YN == "Y") {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_CODE1'), false, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_CODE2'), false, true);
        } else {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_CODE1'), true, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_CODE2'), true, true);
        }
    }

    function fnJobFamilyAppointYnChange(args){
        let JOB_FAMILY_APPOINT_YN = args ? args.JOB_FAMILY_APPOINT_YN : gfn_nvl(SBUxMethod.get("JOB_FAMILY_APPOINT_YN").JOB_FAMILY_APPOINT_YN);

        if (JOB_FAMILY_APPOINT_YN == "Y") {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_FAMILY1'), false, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_FAMILY2'), false, true);
        } else {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_FAMILY1'), true, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('JOB_FAMILY2'), true, true);
        }
    }

    function fnRegionAppointYnChange(args){
        let REGION_APPOINT_YN = args ? args.REGION_APPOINT_YN : gfn_nvl(SBUxMethod.get("REGION_APPOINT_YN").REGION_APPOINT_YN);

        if (REGION_APPOINT_YN == "Y") {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('REGION_CODE1'), false, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('REGION_CODE2'), false, true);
        } else {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('REGION_CODE1'), true, true);
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('REGION_CODE2'), true, true);
        }
    }

    function fnParentingWorkTypeYnChange(args){
        let PARENTING_WORK_TYPE_YN = args ? args.PARENTING_WORK_TYPE_YN : gfn_nvl(SBUxMethod.get("PARENTING_WORK_TYPE_YN").PARENTING_WORK_TYPE_YN)
        if (PARENTING_WORK_TYPE_YN == "Y") {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('PARENTING_WORK_TYPE'), false, true);
        } else {
            bandgvwDetail.setColHidden(bandgvwDetail.getColRef('PARENTING_WORK_TYPE'), true, true);
        }
    }

    window.addEventListener('DOMContentLoaded', async function (e) {
        let initObject = localStorage.getItem("callMain");
        await fn_initSBSelect();
        fn_createGvwListGrid();
        fn_createBandgvwDetailGrid(false);

        await fn_onload();

        if(!gfn_isEmpty(initObject)){
            initObject = JSON.parse(initObject);
            localStorage.removeItem("callMain");

            await fn_onload(initObject);
        } else {
            await fn_onload();
        }
    });

    window.addEventListener('message', async function(event){
        let obj = event.data;
        if(!gfn_isEmpty(obj)){
            await fn_onload(obj);
        } else {
            await fn_onload();
        }
    });

    const fn_onload = async function (parentParameter) {
        SBUxMethod.set("SRCH_APPOINT_DATE_FR", gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("SRCH_APPOINT_DATE", gfn_dateToYmd(new Date()));
        SBUxMethod.set("APPLY_YN", "N");
        SBUxMethod.set("APPOINT_DATE", gfn_dateToYmd(new Date()));

        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();

        if (parentParameter) {
            let strappoint_type = "";
            let strwork_type = "";

            if (parentParameter.hasOwnProperty("WORK_TYPE")) {
                if (gfn_nvl(parentParameter["WORK_TYPE"]) == "") {
                    strwork_type = "N";
                } else {
                    strwork_type = gfn_nvl(parentParameter["WORK_TYPE"]);
                }
            } else {
                strwork_type = "N";
            }

            if (parentParameter.hasOwnProperty("APPOINT_NUM")) {
                if (gfn_nvl(parentParameter["APPOINT_NUM"]) == "") {
                    SBUxMethod.set("SRCH_APPOINT_NUM", "");
                } else {
                    SBUxMethod.set("SRCH_APPOINT_NUM", gfn_nvl(parentParameter["APPOINT_NUM"]));
                }
            } else {
                SBUxMethod.set("SRCH_APPOINT_NUM", "");
            }

            if (strwork_type == "VIEW") {
                SBUxMethod.set("SRCH_APPOINT_DATE_FR", "");
                SBUxMethod.set("SRCH_APPOINT_DATE", "");
                fn_search();
            } else {
                if (gfn_nvl(parentParameter["APPOINT_TYPE"]) == "") {
                    strappoint_type = "";
                } else {
                    strappoint_type = gfn_nvl(parentParameter["APPOINT_TYPE"]);
                }
                SBUxMethod.set("APPOINT_TYPE", strappoint_type);
                SBUxMethod.set("APPOINT_TYPE_NAME", parentParameter["APPOINT_TYPE_NAME"]);
                SBUxMethod.set("APPOINT_DATE", parentParameter["APPOINT_DATE"]);
                SBUxMethod.set("APPLY_YN", "N");

                bandgvwDetail.addRow(true, {
                    CHK_YN: "Y",
                    EMP_CODE: gfn_nvl(parentParameter["EMP_CODE"]),
                    EMP_FULL_NAME: gfn_nvl(parentParameter["EMP_NAME"]),
                    START_DATE: gfn_nvl(parentParameter["START_DATE"]),
                    END_DATE: gfn_nvl(parentParameter["END_DATE"]),
                    DEPT_CODE1: gfn_nvl(parentParameter["DEPT_CODE1"]),
                    POSITION_CODE1: gfn_nvl(parentParameter["POSITION_CODE1"]),
                    DUTY_CODE1: gfn_nvl(parentParameter["DUTY_CODE1"]),
                    JOB_RANK1: gfn_nvl(parentParameter["JOB_RANK1"]),
                    JOB_GROUP1: gfn_nvl(parentParameter["JOB_GROUP1"]),
                    JOB_CODE1: gfn_nvl(parentParameter["JOB_CODE1"]),
                    REGION_CODE1: gfn_nvl(parentParameter["REGION_CODE1"]),
                    COST_DEPT1: gfn_nvl(parentParameter["COST_DEPT1"]),
                    DEPT_CODE2: gfn_nvl(parentParameter["DEPT_CODE2"]),
                    POSITION_CODE2: gfn_nvl(parentParameter["POSITION_CODE2"]),
                    DUTY_CODE2: gfn_nvl(parentParameter["DUTY_CODE2"]),
                    JOB_RANK2: gfn_nvl(parentParameter["JOB_RANK2"]),
                    JOB_GROUP2: gfn_nvl(parentParameter["JOB_GROUP2"]),
                    REGION_CODE2: gfn_nvl(parentParameter["REGION_CODE2"]),
                    COST_DEPT2: gfn_nvl(parentParameter["COST_DEPT2"]),
                    FIRST_APPOINT_NUM: "",
                    APPOINT_REASON: gfn_nvl(parentParameter["APPOINT_TYPE_NAME"])
                });

                SBUxMethod.attr("APPOINT_TYPE", "disabled", "true");
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

    /**
     * 목록 조회
     */
    const fn_search = async function() {
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let APPOINT_TYPE = gfn_nvl(gfnma_multiSelectGet('#SRCH_APPOINT_TYPE'));
        let APPOINT_NUM = gfn_nvl(SBUxMethod.get("SRCH_APPOINT_NUM"));
        let APPOINT_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_APPOINT_DATE_FR"));
        let APPOINT_DATE = gfn_nvl(SBUxMethod.get("SRCH_APPOINT_DATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedCorpCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd
            , V_P_APPOINT_NUM: APPOINT_NUM
            , V_P_APPOINT_DATE_FR: APPOINT_DATE_FR
            , V_P_APPOINT_DATE_TO: APPOINT_DATE
            , V_P_SITE_CODE: SITE_CODE
            , V_P_DEPT_CODE: ''
            , V_P_EMP_CODE: ''
            , V_P_POSITION_CODE: ''
            , V_P_DUTY_CODE: ''
            , V_P_JOB_RANK: ''
            , V_P_JOB_GROUP: ''
            , V_P_JOB_CODE: ''
            , V_P_WORK_REGION: ''
            , V_P_APPOINT_TYPE: APPOINT_TYPE
            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1300List.do", {
            getType: 'json',
            workType: 'Q',
            cv_count: '3',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonEmpList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        APPOINT_DATE: item.APPOINT_DATE,
                        APPOINT_TYPE: item.APPOINT_TYPE,
                        APPOINT_NUM: item.APPOINT_NUM,
                        APPOINT_TITLE: item.APPOINT_TITLE,
                        APPLY_YN: item.APPLY_YN,
                        DEPT_APPOINT_YN: item.DEPT_APPOINT_YN,
                        POSITION_APPOINT_YN: item.POSITION_APPOINT_YN,
                        DUTY_APPOINT_YN: item.DUTY_APPOINT_YN,
                        JOB_RANK_APPOINT_YN: item.JOB_RANK_APPOINT_YN,
                        JOB_GROUP_APPOINT_YN: item.JOB_GROUP_APPOINT_YN,
                        JOB_APPOINT_YN: item.JOB_APPOINT_YN,
                        REGION_APPOINT_YN: item.REGION_APPOINT_YN,
                        APPOINT_TYPE_NAME: item.APPOINT_TYPE_NAME,
                        JOB_FAMILY_APPOINT_YN: item.JOB_FAMILY_APPOINT_YN,
                        PARENTING_WORK_TYPE_YN: item.PARENTING_WORK_TYPE_YN,
                        APPR_ID: item.APPR_ID,
                        APPR_COUNT: item.APPR_COUNT,
                        CURRENT_APPROVE_EMP_CODE: item.CURRENT_APPROVE_EMP_CODE,
                        FINAL_APPROVER: item.FINAL_APPROVER,
                        BEFORE_APPR_EMP: item.BEFORE_APPR_EMP,
                        NEXT_APPR_EMP: item.NEXT_APPR_EMP,
                        BEFORE_PROXY_EMP: item.BEFORE_PROXY_EMP,
                        NEXT_PROXY_EMP: item.NEXT_PROXY_EMP,
                        CONFIRM_EMP_CODE: item.CONFIRM_EMP_CODE,
                        PROXY_EMP_CODE: item.PROXY_EMP_CODE,
                        STATUS_CODE: item.STATUS_CODE,
                        APPROVE_DATE: item.APPROVE_DATE
                    }
                    jsonEmpList.push(msg);
                });

                gvwList.rebuild();
                document.querySelector('#listCount').innerText = jsonEmpList.length;
                if(jsonEmpList.length > 0) {
                    gvwList.clickRow(1);
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

    // 신규
    function cfn_add() {
        fn_create();
    }

    const fn_create = async function () {
        editType = "N";
        SBUxMethod.set("APPOINT_NUM", "");
        SBUxMethod.set("APPOINT_DATE", "");
        SBUxMethod.set("APPOINT_TYPE", "");
        SBUxMethod.set("APPOINT_TYPE_NAME", "");
        SBUxMethod.set("APPOINT_TITLE", "");
        SBUxMethod.set("APPLY_YN", "");
        SBUxMethod.set("STATUS_CODE", "");
        SBUxMethod.set("MEMO", "");
        SBUxMethod.set("APPROVE_DATE", "");
        SBUxMethod.set("DEPT_APPOINT_YN", "N");
        SBUxMethod.set("POSITION_APPOINT_YN", "N");
        SBUxMethod.set("DUTY_APPOINT_YN", "N");
        SBUxMethod.set("JOB_RANK_APPOINT_YN", "N");
        SBUxMethod.set("JOB_GROUP_APPOINT_YN", "N");
        SBUxMethod.set("JOB_APPOINT_YN", "N");
        SBUxMethod.set("JOB_FAMILY_APPOINT_YN", "N");
        SBUxMethod.set("REGION_APPOINT_YN", "N");
        SBUxMethod.set("PARENTING_WORK_TYPE_YN", "N");
        jsonBandgvwDetailList.length = 0;
        bandgvwDetail.rebuild();
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    // 저장
    const fn_save = async function() {
        if (!SBUxMethod.validateRequired({group_id:'panAppoint'})) {
            return false;
        }

        let APPOINT_NUM = gfn_nvl(SBUxMethod.get("APPOINT_NUM"));
        let APPOINT_TYPE = gfn_nvl(SBUxMethod.get("APPOINT_TYPE"));
        let APPOINT_DATE = gfn_nvl(SBUxMethod.get("APPOINT_DATE"));
        let APPOINT_TITLE = gfn_nvl(SBUxMethod.get("APPOINT_TITLE"));
        let DEPT_APPOINT_YN = gfn_nvl(SBUxMethod.get("DEPT_APPOINT_YN").DEPT_APPOINT_YN);
        let POSITION_APPOINT_YN = gfn_nvl(SBUxMethod.get("POSITION_APPOINT_YN").POSITION_APPOINT_YN);
        let DUTY_APPOINT_YN = gfn_nvl(SBUxMethod.get("DUTY_APPOINT_YN").DUTY_APPOINT_YN);
        let JOB_RANK_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_RANK_APPOINT_YN").JOB_RANK_APPOINT_YN);
        let JOB_GROUP_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_GROUP_APPOINT_YN").JOB_GROUP_APPOINT_YN);
        let JOB_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_APPOINT_YN").JOB_APPOINT_YN);
        let REGION_APPOINT_YN = gfn_nvl(SBUxMethod.get("REGION_APPOINT_YN").REGION_APPOINT_YN);
        let JOB_FAMILY_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_FAMILY_APPOINT_YN").JOB_FAMILY_APPOINT_YN);
        let MEMO = gfn_nvl(SBUxMethod.get("MEMO"));
        let APPLY_YN = gfn_nvl(SBUxMethod.get("APPLY_YN"));
        let PARENTING_WORK_TYPE_YN = gfn_nvl(SBUxMethod.get("PARENTING_WORK_TYPE_YN").PARENTING_WORK_TYPE_YN);

        var master = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            IV_P_APPOINT_NUM : APPOINT_NUM,
            V_P_APPOINT_TYPE : APPOINT_TYPE,
            V_P_APPOINT_DATE : APPOINT_DATE,
            V_P_APPOINT_TITLE : APPOINT_TITLE,
            V_P_DEPT_APPOINT_YN : DEPT_APPOINT_YN,
            V_P_POSITION_APPOINT_YN : POSITION_APPOINT_YN,
            V_P_DUTY_APPOINT_YN : DUTY_APPOINT_YN,
            V_P_JOB_RANK_APPOINT_YN : JOB_RANK_APPOINT_YN,
            V_P_JOB_GROUP_APPOINT_YN : JOB_GROUP_APPOINT_YN,
            V_P_JOB_APPOINT_YN : JOB_APPOINT_YN,
            V_P_REGION_APPOINT_YN : REGION_APPOINT_YN,
            V_P_JOB_FAMILY_APPOINT_YN : JOB_FAMILY_APPOINT_YN,
            V_P_MEMO : MEMO,
            V_P_APPLY_YN : APPLY_YN,
            V_P_PARENTING_WORK_TYPE_YN : PARENTING_WORK_TYPE_YN,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/insertHri1300Master.do", {
            getType				: 'json',
            workType			: editType,
            cv_count			: '0',
            params				: gfnma_objectToString(master)
        });
        const masterData = await postJsonPromise;

        try {
            if (_.isEqual("S", masterData.resultStatus)) {
                if(masterData.v_returnStr) {
                    let updatedData = bandgvwDetail.getUpdateData(true, 'all');
                    let returnData = [];

                    updatedData.forEach((item, index) => {
                        const param = {
                            cv_count: '0',
                            getType: 'json',
                            rownum: item.rownum,
                            workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                            params: gfnma_objectToString({
                                V_P_DEBUG_MODE_YN: '',
                                V_P_LANG_ID: '',
                                V_P_COMP_CODE: gv_ma_selectedCorpCd,
                                V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                                V_P_APPOINT_NUM: masterData.v_returnStr,
                                V_P_APPOINT_DATE: item.data.APPOINT_DATE,
                                V_P_EMP_CODE: item.data.EMP_CODE,
                                V_P_DEPT_CODE1: item.data.DEPT_CODE1,
                                V_P_POSITION_CODE1: item.data.POSITION_CODE1,
                                V_P_DUTY_CODE1: item.data.DUTY_CODE1,
                                V_P_JOB_RANK1: item.data.JOB_RANK1,
                                V_P_JOB_GROUP1: item.data.JOB_GROUP1,
                                V_P_JOB_CODE1: item.data.JOB_CODE1,
                                V_P_REGION_CODE1: item.data.REGION_CODE1,
                                V_P_COST_DEPT1: item.data.COST_DEPT1,
                                V_P_DEPT_CODE2: item.data.DEPT_CODE2,
                                V_P_POSITION_CODE2: item.data.POSITION_CODE2,
                                V_P_DUTY_CODE2: item.data.DUTY_CODE2,
                                V_P_JOB_RANK2: item.data.JOB_RANK2,
                                V_P_JOB_GROUP2: item.data.JOB_GROUP2,
                                V_P_JOB_CODE2: item.data.JOB_CODE2,
                                V_P_REGION_CODE2: item.data.REGION_CODE2,
                                V_P_COST_DEPT2: item.data.COST_DEPT2,
                                V_P_FIRST_APPOINT_NUM: item.data.FIRST_APPOINT_NUM,
                                V_P_APPOINT_REASON: item.data.APPOINT_REASON,
                                V_P_MEMO: item.data.MEMO,
                                V_P_START_DATE: item.data.START_DATE,
                                V_P_END_DATE: item.data.END_DATE,
                                V_P_TIME_OFF_TYPE: item.data.TIME_OFF_TYPE,
                                V_P_APPOINT_TYPE: item.data.APPOINT_TYPE,
                                V_P_JOB_FAMILY1: item.data.JOB_FAMILY1,
                                V_P_JOB_FAMILY2: item.data.JOB_FAMILY2,
                                V_P_SITE_CODE1: item.data.SITE_CODE1,
                                V_P_SITE_CODE2: item.data.SITE_CODE2,
                                V_P_PARENTING_WORK_TYPE: item.data.PARENTING_WORK_TYPE,
                                V_P_TIME_START_DAY_TYPE: item.data.TIME_START_DAY_TYPE,
                                V_P_TIME_START_HHMM: item.data.TIME_START_HHMM,
                                V_P_TIME_END_DAY_TYPE: item.data.TIME_END_DAY_TYPE,
                                V_P_TIME_END_HHMM: item.data.TIME_END_HHMM,
                                V_P_FORM_ID: p_formId,
                                V_P_MENU_ID: p_menuId,
                                V_P_PROC_ID: '',
                                V_P_USERID: '',
                                V_P_PC: ''
                            })
                        }
                        returnData.push(param);
                    });

                    if(returnData.length > 0) {
                        const postJsonPromise = gfn_postJSON("/hr/hri/hri/insertHri1300Sub.do", {listData: returnData});
                        const subData = await postJsonPromise;

                        try {
                            if (_.isEqual("S", subData.resultStatus)) {
                                if (APPOINT_TYPE == 'P5' || APPOINT_TYPE == 'O5' || APPOINT_TYPE == 'P6' || APPOINT_TYPE == 'O6') {
                                    let leadType = '';

                                    if (APPOINT_TYPE == 'P5' || APPOINT_TYPE == 'O5') leadType = 'N_LD'
                                    else leadType = 'D_LD';

                                    let leadSendData = [];

                                    updatedData.forEach((item, index) => {
                                        const param = {
                                            cv_count: '0',
                                            getType: 'json',
                                            rownum: item.rownum,
                                            workType: leadType,
                                            params: gfnma_objectToString({
                                                V_P_DEBUG_MODE_YN: '',
                                                V_P_LANG_ID: '',
                                                V_P_COMP_CODE: gv_ma_selectedCorpCd,
                                                V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                                                V_P_APPOINT_NUM: item.data.APPOINT_NUM,
                                                V_P_APPOINT_DATE: item.data.APPOINT_DATE,
                                                V_P_EMP_CODE: item.data.EMP_CODE,
                                                V_P_DEPT_CODE1: item.data.DEPT_CODE1,
                                                V_P_POSITION_CODE1: item.data.POSITION_CODE1,
                                                V_P_DUTY_CODE1: item.data.DUTY_CODE1,
                                                V_P_JOB_RANK1: item.data.JOB_RANK1,
                                                V_P_JOB_GROUP1: item.data.JOB_GROUP1,
                                                V_P_JOB_CODE1: item.data.JOB_CODE1,
                                                V_P_REGION_CODE1: item.data.REGION_CODE1,
                                                V_P_COST_DEPT1: item.data.COST_DEPT1,
                                                V_P_DEPT_CODE2: item.data.DEPT_CODE2,
                                                V_P_POSITION_CODE2: item.data.POSITION_CODE2,
                                                V_P_DUTY_CODE2: item.data.DUTY_CODE2,
                                                V_P_JOB_RANK2: item.data.JOB_RANK2,
                                                V_P_JOB_GROUP2: item.data.JOB_GROUP2,
                                                V_P_JOB_CODE2: item.data.JOB_CODE2,
                                                V_P_REGION_CODE2: item.data.REGION_CODE2,
                                                V_P_COST_DEPT2: item.data.COST_DEPT2,
                                                V_P_FIRST_APPOINT_NUM: item.data.FIRST_APPOINT_NUM,
                                                V_P_APPOINT_REASON: item.data.APPOINT_REASON,
                                                V_P_MEMO: item.data.MEMO,
                                                V_P_START_DATE: item.data.START_DATE,
                                                V_P_END_DATE: item.data.END_DATE,
                                                V_P_TIME_OFF_TYPE: item.data.TIME_OFF_TYPE,
                                                V_P_APPOINT_TYPE: item.data.APPOINT_TYPE,
                                                V_P_JOB_FAMILY1: item.data.JOB_FAMILY1,
                                                V_P_JOB_FAMILY2: item.data.JOB_FAMILY2,
                                                V_P_SITE_CODE1: item.data.SITE_CODE1,
                                                V_P_SITE_CODE2: item.data.SITE_CODE2,
                                                V_P_PARENTING_WORK_TYPE: item.data.PARENTING_WORK_TYPE,
                                                V_P_TIME_START_DAY_TYPE: item.data.TIME_START_DAY_TYPE,
                                                V_P_TIME_START_HHMM: item.data.TIME_START_HHMM,
                                                V_P_TIME_END_DAY_TYPE: item.data.TIME_END_DAY_TYPE,
                                                V_P_TIME_END_HHMM: item.data.TIME_END_HHMM,
                                                V_P_FORM_ID: p_formId,
                                                V_P_MENU_ID: p_menuId,
                                                V_P_PROC_ID: '',
                                                V_P_USERID: '',
                                                V_P_PC: ''
                                            })
                                        }
                                        leadSendData.push(param);
                                    });

                                    const postJsonPromise = gfn_postJSON("/hr/hri/hri/insertHri1300Sub.do", {listData: leadSendData});
                                    const leadData = await postJsonPromise;

                                    try {
                                        if (_.isEqual("S", leadData.resultStatus)) {
                                            gfn_comAlert("I0001");
                                            cfn_search();
                                        } else {
                                            alert(leadData.resultMessage);
                                        }
                                    } catch (e) {
                                        if (!(e instanceof Error)) {
                                            e = new Error(e);
                                        }
                                        console.error("failed", e.message);
                                        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
                                    }
                                } else {
                                    if (subData.resultMessage) {
                                        alert(subData.resultMessage);
                                    }
                                    cfn_search();
                                }
                            } else {
                                alert(subData.resultMessage);
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
            } else {
                alert(masterData.resultMessage);
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    // 삭제
    function cfn_del() {
        fn_delete();
    }

    // 삭제
    const fn_delete = async function() {
        let APPOINT_NUM = gfn_nvl(SBUxMethod.get("APPOINT_NUM"));
        let APPOINT_TYPE = gfn_nvl(SBUxMethod.get("APPOINT_TYPE"));
        let APPOINT_DATE = gfn_nvl(SBUxMethod.get("APPOINT_DATE"));
        let APPOINT_TITLE = gfn_nvl(SBUxMethod.get("APPOINT_TITLE"));
        let DEPT_APPOINT_YN = gfn_nvl(SBUxMethod.get("DEPT_APPOINT_YN").DEPT_APPOINT_YN);
        let POSITION_APPOINT_YN = gfn_nvl(SBUxMethod.get("POSITION_APPOINT_YN").POSITION_APPOINT_YN);
        let DUTY_APPOINT_YN = gfn_nvl(SBUxMethod.get("DUTY_APPOINT_YN").DUTY_APPOINT_YN);
        let JOB_RANK_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_RANK_APPOINT_YN").JOB_RANK_APPOINT_YN);
        let JOB_GROUP_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_GROUP_APPOINT_YN").JOB_GROUP_APPOINT_YN);
        let JOB_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_APPOINT_YN").JOB_APPOINT_YN);
        let REGION_APPOINT_YN = gfn_nvl(SBUxMethod.get("REGION_APPOINT_YN").REGION_APPOINT_YN);
        let JOB_FAMILY_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_FAMILY_APPOINT_YN").JOB_FAMILY_APPOINT_YN);
        let MEMO = gfn_nvl(SBUxMethod.get("MEMO"));
        let APPLY_YN = gfn_nvl(SBUxMethod.get("APPLY_YN"));
        let PARENTING_WORK_TYPE_YN = gfn_nvl(SBUxMethod.get("PARENTING_WORK_TYPE_YN").PARENTING_WORK_TYPE_YN);

        if(APPOINT_NUM == '') {
            return;
        }

        if(APPLY_YN == 'Y') {
            alert("발령대상자 정보를 입력해주세요.");
            return;
        }

        if(gfn_comConfirm("Q0001", "해당 발령대상자 정보 전체를 삭제")) {
            var paramObj = {
                V_P_DEBUG_MODE_YN: '',
                V_P_LANG_ID: '',
                V_P_COMP_CODE: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                IV_P_APPOINT_NUM: APPOINT_NUM,
                V_P_APPOINT_TYPE: APPOINT_TYPE,
                V_P_APPOINT_DATE: APPOINT_DATE,
                V_P_APPOINT_TITLE: APPOINT_TITLE,
                V_P_DEPT_APPOINT_YN: DEPT_APPOINT_YN,
                V_P_POSITION_APPOINT_YN: POSITION_APPOINT_YN,
                V_P_DUTY_APPOINT_YN: DUTY_APPOINT_YN,
                V_P_JOB_RANK_APPOINT_YN: JOB_RANK_APPOINT_YN,
                V_P_JOB_GROUP_APPOINT_YN: JOB_GROUP_APPOINT_YN,
                V_P_JOB_APPOINT_YN: JOB_APPOINT_YN,
                V_P_REGION_APPOINT_YN: REGION_APPOINT_YN,
                V_P_JOB_FAMILY_APPOINT_YN: JOB_FAMILY_APPOINT_YN,
                V_P_MEMO: MEMO,
                V_P_APPLY_YN: APPLY_YN,
                V_P_PARENTING_WORK_TYPE_YN: PARENTING_WORK_TYPE_YN,
                V_P_FORM_ID: p_formId,
                V_P_MENU_ID: p_menuId,
                V_P_PROC_ID: '',
                V_P_USERID: '',
                V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hri/hri/deleteHri1300.do", {
                getType: 'json',
                workType: 'D',
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
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

    // 인사기록반영취소
    const fn_cancelReflectionInfo = async function () {
        let APPOINT_NUM = gfn_nvl(SBUxMethod.get("APPOINT_NUM"));
        let APPOINT_TYPE = gfn_nvl(SBUxMethod.get("APPOINT_TYPE"));
        let APPOINT_DATE = gfn_nvl(SBUxMethod.get("APPOINT_DATE"));
        let APPOINT_TITLE = gfn_nvl(SBUxMethod.get("APPOINT_TITLE"));
        let DEPT_APPOINT_YN = gfn_nvl(SBUxMethod.get("DEPT_APPOINT_YN").DEPT_APPOINT_YN);
        let POSITION_APPOINT_YN = gfn_nvl(SBUxMethod.get("POSITION_APPOINT_YN").POSITION_APPOINT_YN);
        let DUTY_APPOINT_YN = gfn_nvl(SBUxMethod.get("DUTY_APPOINT_YN").DUTY_APPOINT_YN);
        let JOB_RANK_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_RANK_APPOINT_YN").JOB_RANK_APPOINT_YN);
        let JOB_GROUP_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_GROUP_APPOINT_YN").JOB_GROUP_APPOINT_YN);
        let JOB_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_APPOINT_YN").JOB_APPOINT_YN);
        let REGION_APPOINT_YN = gfn_nvl(SBUxMethod.get("REGION_APPOINT_YN").REGION_APPOINT_YN);
        let JOB_FAMILY_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_FAMILY_APPOINT_YN").JOB_FAMILY_APPOINT_YN);
        let MEMO = gfn_nvl(SBUxMethod.get("MEMO"));
        let APPLY_YN = gfn_nvl(SBUxMethod.get("APPLY_YN"));
        let PARENTING_WORK_TYPE_YN = gfn_nvl(SBUxMethod.get("PARENTING_WORK_TYPE_YN").PARENTING_WORK_TYPE_YN);

        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            IV_P_APPOINT_NUM : APPOINT_NUM,
            V_P_APPOINT_TYPE : APPOINT_TYPE,
            V_P_APPOINT_DATE : APPOINT_DATE,
            V_P_APPOINT_TITLE : APPOINT_TITLE,
            V_P_DEPT_APPOINT_YN : DEPT_APPOINT_YN,
            V_P_POSITION_APPOINT_YN : POSITION_APPOINT_YN,
            V_P_DUTY_APPOINT_YN : DUTY_APPOINT_YN,
            V_P_JOB_RANK_APPOINT_YN : JOB_RANK_APPOINT_YN,
            V_P_JOB_GROUP_APPOINT_YN : JOB_GROUP_APPOINT_YN,
            V_P_JOB_APPOINT_YN : JOB_APPOINT_YN,
            V_P_REGION_APPOINT_YN : REGION_APPOINT_YN,
            V_P_JOB_FAMILY_APPOINT_YN : JOB_FAMILY_APPOINT_YN,
            V_P_MEMO : MEMO,
            V_P_APPLY_YN : APPLY_YN,
            V_P_PARENTING_WORK_TYPE_YN : PARENTING_WORK_TYPE_YN,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/deleteHri1300.do", {
            getType				: 'json',
            workType			: 'CANCEL',
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

    // 인사기록반영
    const fn_reflectionInfo = async function () {
        let APPOINT_NUM = gfn_nvl(SBUxMethod.get("APPOINT_NUM"));
        let APPOINT_TYPE = gfn_nvl(SBUxMethod.get("APPOINT_TYPE"));
        let APPOINT_DATE = gfn_nvl(SBUxMethod.get("APPOINT_DATE"));
        let APPOINT_TITLE = gfn_nvl(SBUxMethod.get("APPOINT_TITLE"));
        let DEPT_APPOINT_YN = gfn_nvl(SBUxMethod.get("DEPT_APPOINT_YN").DEPT_APPOINT_YN);
        let POSITION_APPOINT_YN = gfn_nvl(SBUxMethod.get("POSITION_APPOINT_YN").POSITION_APPOINT_YN);
        let DUTY_APPOINT_YN = gfn_nvl(SBUxMethod.get("DUTY_APPOINT_YN").DUTY_APPOINT_YN);
        let JOB_RANK_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_RANK_APPOINT_YN").JOB_RANK_APPOINT_YN);
        let JOB_GROUP_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_GROUP_APPOINT_YN").JOB_GROUP_APPOINT_YN);
        let JOB_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_APPOINT_YN").JOB_APPOINT_YN);
        let REGION_APPOINT_YN = gfn_nvl(SBUxMethod.get("REGION_APPOINT_YN").REGION_APPOINT_YN);
        let JOB_FAMILY_APPOINT_YN = gfn_nvl(SBUxMethod.get("JOB_FAMILY_APPOINT_YN").JOB_FAMILY_APPOINT_YN);
        let MEMO = gfn_nvl(SBUxMethod.get("MEMO"));
        let APPLY_YN = gfn_nvl(SBUxMethod.get("APPLY_YN"));
        let PARENTING_WORK_TYPE_YN = gfn_nvl(SBUxMethod.get("PARENTING_WORK_TYPE_YN").PARENTING_WORK_TYPE_YN);

        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            IV_P_APPOINT_NUM : APPOINT_NUM,
            V_P_APPOINT_TYPE : APPOINT_TYPE,
            V_P_APPOINT_DATE : APPOINT_DATE,
            V_P_APPOINT_TITLE : APPOINT_TITLE,
            V_P_DEPT_APPOINT_YN : DEPT_APPOINT_YN,
            V_P_POSITION_APPOINT_YN : POSITION_APPOINT_YN,
            V_P_DUTY_APPOINT_YN : DUTY_APPOINT_YN,
            V_P_JOB_RANK_APPOINT_YN : JOB_RANK_APPOINT_YN,
            V_P_JOB_GROUP_APPOINT_YN : JOB_GROUP_APPOINT_YN,
            V_P_JOB_APPOINT_YN : JOB_APPOINT_YN,
            V_P_REGION_APPOINT_YN : REGION_APPOINT_YN,
            V_P_JOB_FAMILY_APPOINT_YN : JOB_FAMILY_APPOINT_YN,
            V_P_MEMO : MEMO,
            V_P_APPLY_YN : APPLY_YN,
            V_P_PARENTING_WORK_TYPE_YN : PARENTING_WORK_TYPE_YN,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/insertHri1300Master.do", {
            getType				: 'json',
            workType			: 'APPLY',
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

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    //상세정보 보기
    const fn_view = async function () {
        editType = "U";
        cfn_add();

        var nRow = gvwList.getRow();
        if (nRow < 1) {
            return;
        }

        let rowData = gvwList.getRowData(nRow);

        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = rowData.DEPT_CODE;
        let APPOINT_TYPE = gfn_nvl(gfnma_multiSelectGet('#SRCH_APPOINT_TYPE'));
        let APPOINT_NUM = rowData.APPOINT_NUM;
        let APPOINT_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_APPOINT_DATE_FR"));
        let APPOINT_DATE = gfn_nvl(SBUxMethod.get("SRCH_APPOINT_DATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedCorpCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd
            , V_P_APPOINT_NUM: APPOINT_NUM
            , V_P_APPOINT_DATE_FR: APPOINT_DATE_FR
            , V_P_APPOINT_DATE_TO: APPOINT_DATE
            , V_P_SITE_CODE: SITE_CODE
            , V_P_DEPT_CODE: ''
            , V_P_EMP_CODE: ''
            , V_P_POSITION_CODE: ''
            , V_P_DUTY_CODE: ''
            , V_P_JOB_RANK: ''
            , V_P_JOB_GROUP: ''
            , V_P_JOB_CODE: ''
            , V_P_WORK_REGION: ''
            , V_P_APPOINT_TYPE: APPOINT_TYPE
            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1300List.do", {
            getType: 'json',
            workType: 'DETAIL',
            cv_count: '3',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                fn_setMasterData(data.cv_1[0]);

                data.cv_2.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        EMP_CODE : item.EMP_CODE,
                        EMP_FULL_NAME : item.EMP_FULL_NAME,
                        DEPT_CODE1 : item.DEPT_CODE1,
                        DEPT_NAME1 : item.DEPT_NAME1,
                        POSITION_CODE1 : item.POSITION_CODE1,
                        DUTY_CODE1 : item.DUTY_CODE1,
                        JOB_RANK1 : item.JOB_RANK1,
                        JOB_GROUP1 : item.JOB_GROUP1,
                        JOB_CODE1 : item.JOB_CODE1,
                        REGION_CODE1 : item.REGION_CODE1,
                        JOB_FAMILY1 : item.JOB_FAMILY1,
                        COST_DEPT1 : item.COST_DEPT1,
                        COST_DEPT1_NAME : item.COST_DEPT1_NAME,
                        DEPT_CODE2 : item.DEPT_CODE2,
                        DEPT_NAME2 : item.DEPT_NAME2,
                        DEPT_NAME3 : item.DEPT_NAME3,
                        POSITION_CODE2 : item.POSITION_CODE2,
                        DUTY_CODE2 : item.DUTY_CODE2,
                        JOB_RANK2 : item.JOB_RANK2,
                        JOB_GROUP2 : item.JOB_GROUP2,
                        JOB_CODE2 : item.JOB_CODE2,
                        REGION_CODE2 : item.REGION_CODE2,
                        JOB_FAMILY2 : item.JOB_FAMILY2,
                        COST_DEPT2 : item.COST_DEPT2,
                        COST_DEPT2_NAME : item.COST_DEPT2_NAME,
                        FIRST_APPOINT_NUM : item.FIRST_APPOINT_NUM,
                        APPOINT_REASON : item.APPOINT_REASON,
                        MEMO : item.MEMO,
                        START_DATE : item.START_DATE,
                        END_DATE : item.END_DATE,
                        TIME_OFF_TYPE : item.TIME_OFF_TYPE,
                        APPOINT_TYPE : item.APPOINT_TYPE,
                        SITE_CODE1 : item.SITE_CODE1,
                        SITE_CODE2 : item.SITE_CODE2,
                        PARENTING_WORK_TYPE : item.PARENTING_WORK_TYPE,
                        TIME_START_DAY_TYPE : item.TIME_START_DAY_TYPE,
                        TIME_START_HHMM : item.TIME_START_HHMM,
                        TIME_END_DAY_TYPE : item.TIME_END_DAY_TYPE,
                        TIME_END_HHMM : item.TIME_END_HHMM
                    }
                    jsonBandgvwDetailList.push(msg);
                });

                _SBGrid.destroy('bandgvwDetail');
                fn_createBandgvwDetailGrid(true);
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

    // 마스터정보 set
    const fn_setMasterData = async function (data) {
        SBUxMethod.set("APPOINT_NUM", data.APPOINT_NUM);
        SBUxMethod.set("APPOINT_DATE", data.APPOINT_DATE);
        SBUxMethod.set("APPOINT_TYPE", data.APPOINT_TYPE);
        SBUxMethod.set("APPOINT_TYPE_NAME", data.APPOINT_TYPE_NAME);
        SBUxMethod.set("APPOINT_TITLE", data.APPOINT_TITLE);
        SBUxMethod.set("APPLY_YN", data.APPLY_YN);
        SBUxMethod.set("STATUS_CODE", data.STATUS_CODE);
        SBUxMethod.set("MEMO", data.MEMO);
        SBUxMethod.set("APPROVE_DATE", data.APPROVE_DATE);
        SBUxMethod.set("DEPT_APPOINT_YN", data.DEPT_APPOINT_YN);
        SBUxMethod.set("POSITION_APPOINT_YN", data.POSITION_APPOINT_YN);
        SBUxMethod.set("DUTY_APPOINT_YN", data.DUTY_APPOINT_YN);
        SBUxMethod.set("JOB_RANK_APPOINT_YN", data.JOB_RANK_APPOINT_YN);
        SBUxMethod.set("JOB_GROUP_APPOINT_YN", data.JOB_GROUP_APPOINT_YN);
        SBUxMethod.set("JOB_APPOINT_YN", data.JOB_APPOINT_YN);
        SBUxMethod.set("JOB_FAMILY_APPOINT_YN", data.JOB_FAMILY_APPOINT_YN);
        SBUxMethod.set("REGION_APPOINT_YN", data.REGION_APPOINT_YN);
        SBUxMethod.set("PARENTING_WORK_TYPE_YN", data.PARENTING_WORK_TYPE_YN);

        if(data.APPLY_YN == 'Y') {
            SBUxMethod.attr('btnAddAll', 'disabled', 'true');
            SBUxMethod.attr('btnReflectionInfo', 'disabled', 'true');
            SBUxMethod.attr('btnDeleteAll', 'disabled', 'false');
        } else {
            SBUxMethod.attr('btnAddAll', 'disabled', 'false');
            SBUxMethod.attr('btnReflectionInfo', 'disabled', 'false');
            SBUxMethod.attr('btnDeleteAll', 'disabled', 'true');
        }
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
    const fn_addRow = async function () {
        let rowVal = bandgvwDetail.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            bandgvwDetail.addRow(true);
        }else{
            bandgvwDetail.insertRow(rowVal);
        }
    }

    // 행삭제
    const fn_deleteRow = async function () {
        let rowVal = bandgvwDetail.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            bandgvwDetail.deleteRow(rowVal);
        }
    }

    // 일괄추가
    const fn_addAll = async function () {
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SITE_CODE'));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("DEPT_CODE"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("EMP_CODE"));
        let POSITION_CODE = gfn_nvl(SBUxMethod.get("POSITION_CODE"));
        let DUTY_CODE = gfn_nvl(gfnma_multiSelectGet('#DUTY_CODE'));
        let JOB_RANK = gfn_nvl(SBUxMethod.get("JOB_RANK"));
        let JOB_GROUP = gfn_nvl(SBUxMethod.get("JOB_GROUP"));
        let JOB_CODE = gfn_nvl(gfnma_multiSelectGet('#JOB_CODE'));
        let WORK_REGION = gfn_nvl(gfnma_multiSelectGet('#WORK_REGION'));
        let APPOINT_TYPE = gfn_nvl(gfnma_multiSelectGet('#SRCH_APPOINT_TYPE'));

        let APPOINT_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_APPOINT_DATE_FR"));
        let APPOINT_DATE = gfn_nvl(SBUxMethod.get("SRCH_APPOINT_DATE"));


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedCorpCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd
            , V_P_APPOINT_NUM: ''
            , V_P_APPOINT_DATE_FR: APPOINT_DATE_FR
            , V_P_APPOINT_DATE_TO: APPOINT_DATE
            , V_P_SITE_CODE: SITE_CODE
            , V_P_DEPT_CODE: DEPT_CODE
            , V_P_EMP_CODE: EMP_CODE
            , V_P_POSITION_CODE: POSITION_CODE
            , V_P_DUTY_CODE: DUTY_CODE
            , V_P_JOB_RANK: JOB_RANK
            , V_P_JOB_GROUP: JOB_GROUP
            , V_P_JOB_CODE: JOB_CODE
            , V_P_WORK_REGION: WORK_REGION
            , V_P_APPOINT_TYPE: APPOINT_TYPE
            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1300List.do", {
            getType: 'json',
            workType: 'SEARCH',
            cv_count: '3',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                data.cv_3.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        EMP_CODE : item.EMP_CODE,
                        EMP_FULL_NAME : item.EMP_FULL_NAME,
                        DEPT_CODE1 : item.DEPT_CODE1,
                        DEPT_NAME1 : item.DEPT_NAME1,
                        POSITION_CODE1 : item.POSITION_CODE1,
                        DUTY_CODE1 : item.DUTY_CODE1,
                        JOB_RANK1 : item.JOB_RANK1,
                        JOB_GROUP1 : item.JOB_GROUP1,
                        JOB_CODE1 : item.JOB_CODE1,
                        REGION_CODE1 : item.REGION_CODE1,
                        JOB_FAMILY1 : item.JOB_FAMILY1,
                        COST_DEPT1 : item.COST_DEPT1,
                        COST_DEPT1_NAME : item.COST_DEPT1_NAME,
                        SITE_CODE1 : item.SITE_CODE1,
                        DEPT_CODE2 : item.DEPT_CODE2,
                        DEPT_NAME2 : item.DEPT_NAME2,
                        POSITION_CODE2 : item.POSITION_CODE2,
                        DUTY_CODE2 : item.DUTY_CODE2,
                        JOB_RANK2 : item.JOB_RANK2,
                        JOB_GROUP2 : item.JOB_GROUP2,
                        JOB_CODE2 : item.JOB_CODE2,
                        JOB_FAMILY2 : item.JOB_FAMILY2,
                        REGION_CODE2 : item.REGION_CODE2,
                        COST_DEPT2 : item.COST_DEPT2,
                        COST_DEPT2_NAME : item.COST_DEPT2_NAME,
                        FIRST_APPOINT_NUM : item.FIRST_APPOINT_NUM,
                        APPOINT_REASON : item.APPOINT_REASON,
                        MEMO : item.MEMO,
                        APPOINT_NUM : item.APPOINT_NUM,
                        TIME_OFF_TYPE : item.TIME_OFF_TYPE,
                        APPOINT_TYPE : item.APPOINT_TYPE,
                        DEPT_NAME2 : item.DEPT_NAME2,
                        DEPT_NAME3 : item.DEPT_NAME3,
                        SITE_CODE2 : item.SITE_CODE2,
                        TIME_START_DAY_TYPE : item.TIME_START_DAY_TYPE,
                        TIME_START_HHMM : item.TIME_START_HHMM,
                        TIME_END_DAY_TYPE : item.TIME_END_DAY_TYPE,
                        TIME_END_HHMM : item.TIME_END_HHMM,
                        START_DATE : gfn_nvl(SBUxMethod.get("SRCH_APPOINT_DATE")),
                        END_DATE : "99991231"
                }
                    jsonBandgvwDetailList.push(msg);
                });

                bandgvwDetail.rebuild();

                fnDeptAppointYnChange(null);
                fnPositionAppointYnChange(null);
                fnDutyAppointYnChange(null);
                fnJobRankAppointYnChange(null);
                fnJobGroupAppointYnChange(null);
                fnJobAppointYnChange(null);
                fnJobFamilyAppointYnChange(null);
                fnRegionAppointYnChange(null);
                fnParentingWorkTypeYnChange(null);

                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("DEPT_CODE1"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("DEPT_NAME1"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("POSITION_CODE1"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("DUTY_CODE1"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("JOB_RANK1"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("COST_DEPT1"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("COST_DEPT1_NAME"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("JOB_CODE1"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("JOB_FAMILY1"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("JOB_GROUP1"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("REGION_CODE1"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("SITE_CODE1"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("TIME_START_HHMM"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("TIME_START_DAY_TYPE"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("TIME_END_DAY_TYPE"), true);
                bandgvwDetail.setColDisabled(bandgvwDetail.getColRef("TIME_END_HHMM"), true);


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

    // 일괄삭제
    const fn_deleteAll = async function () {
        const allData = bandgvwDetail.getGridDataAll();
        let returnData = [];

        allData.forEach((item, index) => {
            if (item.CHK_YN === "Y") {
                let rowData = gvwList.getRowData(index);
                const param = {
                    cv_count: '0',
                    getType: 'json',
                    workType: 'CHK_D',
                    params: gfnma_objectToString({
                        V_P_DEBUG_MODE_YN: '',
                        V_P_LANG_ID: '',
                        V_P_COMP_CODE: gv_ma_selectedCorpCd,
                        V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                        V_P_APPOINT_NUM: rowData.APPOINT_NUM,
                        V_P_APPOINT_DATE: '',
                        V_P_EMP_CODE: rowData.EMP_CODE,
                        V_P_DEPT_CODE1: '',
                        V_P_POSITION_CODE1: '',
                        V_P_DUTY_CODE1: '',
                        V_P_JOB_RANK1: '',
                        V_P_JOB_GROUP1: '',
                        V_P_JOB_CODE1: '',
                        V_P_REGION_CODE1: '',
                        V_P_COST_DEPT1: '',
                        V_P_DEPT_CODE2: '',
                        V_P_POSITION_CODE2: '',
                        V_P_DUTY_CODE2: '',
                        V_P_JOB_RANK2: '',
                        V_P_JOB_GROUP2: '',
                        V_P_JOB_CODE2: '',
                        V_P_REGION_CODE2: '',
                        V_P_COST_DEPT2: '',
                        V_P_FIRST_APPOINT_NUM: '',
                        V_P_APPOINT_REASON: '',
                        V_P_MEMO: '',
                        V_P_START_DATE: '',
                        V_P_END_DATE: '',
                        V_P_TIME_OFF_TYPE: '',
                        V_P_APPOINT_TYPE: '',
                        V_P_JOB_FAMILY1: '',
                        V_P_JOB_FAMILY2: '',
                        V_P_SITE_CODE1: '',
                        V_P_SITE_CODE2: '',
                        V_P_PARENTING_WORK_TYPE: '',
                        V_P_TIME_START_DAY_TYPE: '',
                        V_P_TIME_START_HHMM: '',
                        V_P_TIME_END_DAY_TYPE: '',
                        V_P_TIME_END_HHMM: '',
                        V_P_FORM_ID: p_formId,
                        V_P_MENU_ID: p_menuId,
                        V_P_PROC_ID: '',
                        V_P_USERID: '',
                        V_P_PC: ''
                    })
                }
                returnData.push(param);
            }
        });

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/insertHri1300Sub.do", {listData: returnData});

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
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


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>