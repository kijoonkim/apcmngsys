<%
    /**
     * @Class Name 		: hri1000.jsp
     * @Description 	: 인사정보등록 화면
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
    <title>title : 인사정보 등록</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../../frame/inc/clipreport.jsp" %>
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
                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="cfn_add" ></sbux-button>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="cfn_save"></sbux-button>
                <sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="cfn_del"></sbux-button>--%>
                <%--<sbux-button id="btnRegistCommonCode" name="btnRegistCommonCode" uitype="normal" class="btn btn-sm btn-outline-danger" text="공통코드등록" onclick="fn_registCommonCode"></sbux-button>--%>
                <sbux-button id="btnPrint" name="btnPrint" uitype="normal" class="btn btn-sm btn-outline-danger" text="출력" onclick="fn_print('PRINT')"></sbux-button>
                <sbux-button id="btnCopyHistory" name="btnCopyHistory" uitype="normal" class="btn btn-sm btn-outline-danger" text="이력복사" onclick="fn_copyHistory"></sbux-button>
                <sbux-button id="btnJoinCompnay" name="btnJoinCompnay" uitype="normal" class="btn btn-sm btn-outline-danger" text="입사처리" onclick="fn_joinCompnay"></sbux-button>
                <sbux-button id="btnRegistResignation" name="btnRegistResignation" uitype="normal" class="btn btn-sm btn-outline-danger" text="퇴사발령등록" onclick="fn_registResignation"></sbux-button>
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
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                    <col style="width: 6.25%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">사업장</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">재직구분</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">직군</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td colspan="2"></td>
                    <th scope="row" class="th_bg">성별</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_GENDER" uitype="single" jsondata-ref="jsonGender" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findEmpCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg">입사일</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_ENTER_DATE_FR"
                                name="SRCH_ENTER_DATE_FR"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <span> ~ </span>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_ENTER_DATE_TO"
                                name="SRCH_ENTER_DATE_TO"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                    <th scope="row" class="th_bg">기산일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_INITIAL_DATE"
                                name="SRCH_INITIAL_DATE"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                style="width:100%;"
                        />
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="col-sm-2">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>사원 리스트</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwList" style="height:1200px;"></div>
                    </div>
                </div>
                <div class="col-sm-10">
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>기본정보편집</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:15%">
                                    <col style="width:8%">
                                    <col style="width:7%">
                                    <col style="width:7%">
                                    <col style="width:10%">
                                    <col style="width:9%">
                                    <col style="width:9%">
                                    <col style="width:9%">
                                    <col style="width:8%">
                                    <col style="width:8%">
                                    <col style="width:8%">
                                    <col style="width:8%">
                                    <col style="width:8%">
                                    <col style="width:8%">
                                    <col style="width:8%">
                                </colgroup>
                                <tr>
                                    <td rowspan="5" id="empPhotoArea" class="td_input" style="position: relative; vertical-align: top;">
                                        <img id="EMP_PHOTO" style="width: 100%; height: 100%; position: absolute;">
                                        <div id="DIV_EMP_PHOTO" style="position: absolute; width: 100%; height: 100%; display: flex; align-items: center; justify-content: center;">
                                            <span>사진 업로드</span>
                                        </div>
                                        <input type="file" name="EMP_PHOTO_FILE" id="EMP_PHOTO_FILE" accept="image/*" style="display: none;">
                                    </td>
                                    <th scope="row" class="th_bg">사번</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="EMP_CODE" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                                        <sbux-input id="EMP_PHOTO_PATH" class="form-control input-sm" uitype="hidden" style="width:100%;" readonly></sbux-input>
                                        <sbux-input id="EMP_PHOTO_NAME" class="form-control input-sm" uitype="hidden" style="width:100%;" readonly></sbux-input>
                                        <sbux-input id="SIGN_IMG_PATH" class="form-control input-sm" uitype="hidden" style="width:100%;" readonly></sbux-input>
                                        <sbux-input id="SIGN_IMG_NAME" class="form-control input-sm" uitype="hidden" style="width:100%;" readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>주민등록번호</th>
                                    <td colspan="3" class="td_input">
                                        <sbux-input id="DISPLAY_SOCIAL_NUM" class="form-control input-sm" uitype="text" style="width:100%;"></sbux-input>
                                        <sbux-input id="SOCIAL_NUM" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" mask = "999999-9999999" onchange="fnSocialNumChange(SOCIAL_NUM)" required></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>직위</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="POSITION_CODE" uitype="single" jsondata-ref="jsonPositionCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="POSITION_CODE_PERIOD" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>이름</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="EMP_NAME" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" required></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>생년월일</th>
                                    <td class="td_input">
                                        <sbux-input id="BIRTHDAY" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" mask = "{ 'alias': 'yyyy-mm-dd', 'autoUnmask': true}" required></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-select id="BIRTHDAY_TYPE" uitype="single" jsondata-ref="jsonBirthdayType" unselected-text="" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-checkbox
                                                uitype="normal"
                                                id="LEAP_MONTH_YN"
                                                name="LEAP_MONTH_YN"
                                                uitype="normal"
                                                class="form-control input-sm check"
                                                text="윤달"
                                                true-value="Y" false-value="N"
                                        />
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>직군</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">호봉</th>
                                    <td class="td_input">
                                        <sbux-select id="SALARY_CLASS" uitype="single" jsondata-ref="jsonSalaryClass" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">이름(영문)</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="EMP_NAME_ENG" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>성별</th>
                                    <td class="td_input">
                                        <sbux-select id="GENDER" uitype="single" jsondata-ref="jsonGender" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">나이</th>
                                    <td class="td_input">
                                        <sbux-input id="AGE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>직원하위그룹</th>
                                    <td class="td_input">
                                        <sbux-select id="JOB_FAMILY" uitype="single" jsondata-ref="jsonJobFamily" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="SALARY_LEVEL" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">이름(한문)</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="EMP_NAME_CHN" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>직책</th>
                                    <td colspan="2" class="td_input">
                                        <%--<sbux-select id="DUTY_CODE" uitype="single" jsondata-ref="jsonDutyCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>--%>
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="DUTY_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="DUTY_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="DUTY_CODE_PERIOD" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">직무</th>
                                    <td colspan="2" class="td_input">
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
                                    <td class="td_input">
                                        <%--<sbux-select id="JOB_SUB_CODE" uitype="single" jsondata-ref="jsonSubJobCode" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="JOB_SUB_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="JOB_SUB_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="td_input">
                                        <%--<sbux-select id="JOB_DETAIL_CODE" uitype="single" jsondata-ref="jsonDetailJobCode" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="JOB_DETAIL_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="JOB_DETAIL_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="JOB_CODE_PERIOD" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>인건비분류</th>
                                    <td colspan="2" class="td_input">
                                        <%--<sbux-select id="LABOR_COST_GROUP" uitype="single" jsondata-ref="jsonLaborCostGroup" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>--%>
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="LABOR_COST_GROUP" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="LABOR_COST_GROUP" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>직급</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="JOB_RANK" uitype="single" jsondata-ref="jsonJobRank" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="JOB_RANK_PERIOD" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td colspan="5" class="td_input">
                                        <p class="ad_input_row">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="BOARD_DIRECTOR_YN"
                                                    name="BOARD_DIRECTOR_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="등기이사"
                                                    true-value="Y" false-value="N"
                                            />
                                        </p>
                                        <p class="ad_input_row">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="SALES_EMP_YN"
                                                    name="SALES_EMP_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="영업사원"
                                                    true-value="Y" false-value="N"
                                            />
                                        </p>
                                        <p class="ad_input_row">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="RE_ENTER_YN"
                                                    name="RE_ENTER_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="재입사"
                                                    true-value="Y" false-value="N"
                                            />
                                        </p>
                                        <p class="ad_input_row">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="TO_YN"
                                                    name="TO_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="TO여부"
                                                    true-value="Y" false-value="N"
                                            />
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="8"></td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>사업장</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>소속부서</th>
                                    <td class="td_input">
                                        <sbux-input id="DEPT_CODE" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" required></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="DEPT_NAME" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" required></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="찾기" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findDeptCode"
                                        ></sbux-button>
                                    </td>
                                    <th scope="row" class="th_bg">상위부서</th>
                                    <td class="td_input">
                                        <sbux-input id="PARENT_DEPT" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="PARENT_DEPT_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="찾기" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findParentDeptCode"
                                        ></sbux-button>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>신고사업장</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="TAX_SITE_CODE" uitype="single" jsondata-ref="jsonTaxSiteCode" unselected-text="" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>귀속부서</th>
                                    <td class="td_input">
                                        <sbux-input id="COST_DEPT_CODE" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" required></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="COST_DEPT_NAME" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" required></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="찾기" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findCostDeptCode"
                                        ></sbux-button>
                                    </td>
                                    <th scope="row" class="th_bg">겸직부서</th>
                                    <td class="td_input">
                                        <sbux-input id="DEPT_CODE2" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="DEPT_NAME2" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="찾기" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findDeptCode2"
                                        ></sbux-button>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>근무지</th>
                                    <td colspan="2" class="td_input">
                                        <%--<sbux-select id="WORK_REGION" uitype="single" jsondata-ref="jsonWorkRegion" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>--%>
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="WORK_REGION" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="WORK_REGION" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>사원구분</th>
                                    <td class="td_input">
                                        <sbux-select id="EMP_TYPE" uitype="single" jsondata-ref="jsonEmpType" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                    </td>
                                    <td colspan="2" class="td_input">
                                        <p class="ad_input_row">
                                            <sbux-checkbox
                                                    uitype="normal"
                                                    id="PARTNER_FIRM_EMP_YN"
                                                    name="PARTNER_FIRM_EMP_YN"
                                                    uitype="normal"
                                                    class="form-control input-sm check"
                                                    text="협력사사원"
                                                    true-value="Y" false-value="N"
                                            />
                                        </p>
                                    </td>
                                    <th scope="row" class="th_bg">협력사</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="PARTNER_FIRM_CODE" uitype="single" jsondata-ref="jsonPartnerFirmCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">겸직직책</th>
                                    <td class="td_input">
                                        <%--<sbux-select id="DUTY_CODE2" uitype="single" jsondata-ref="jsonDutyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>--%>
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="DUTY_CODE2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="DUTY_CODE2" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>재직구분</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">종전사원</th>
                                    <td class="td_input">
                                        <sbux-input id="OLD_EMP_CODE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="OLD_EMP_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="찾기" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findOldEmpCode"
                                        ></sbux-button>
                                    </td>
                                    <th scope="row" class="th_bg">입사직위</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="START_POSITION_CODE" uitype="single" jsondata-ref="jsonPositionCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>인정경력</th>
                                    <td class="td_input">
                                        <sbux-input id="CAREER_TRACK" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" mask="{'alias': 'numeric'}" maxlength="25" required></sbux-input><span>개월</span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>입사구분</th>
                                    <td colspan="2" class="td_input">
                                        <%--<sbux-select id="ENTER_TYPE" uitype="single" jsondata-ref="jsonEnterType" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>--%>
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="ENTER_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="ENTER_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row" class="th_bg">추천자</th>
                                    <td class="td_input">
                                        <sbux-input id="INTRODUCER_CODE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="INTRODUCER_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-button
                                                class="btn btn-xs btn-outline-dark"
                                                text="찾기" uitype="modal"
                                                target-id="modal-compopup1"
                                                onclick="fn_findIntroducerCode"
                                        ></sbux-button>
                                    </td>
                                    <th scope="row" class="th_bg">근속기준일</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="CAREER_DATE"
                                                name="CAREER_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
                                    <th scope="row" id="START_PAY_GRADE_TH" class="th_bg"><span class="data_required"></span>PayGrade(입사)</th>
                                    <td class="td_input" id="START_PAY_GRADE_TD">
                                        <sbux-input id="START_PAY_GRADE" class="form-control input-sm input-sm-ast inpt_data_reqed" uitype="text" style="width:100%" mask="{'alias': 'numeric'}" maxlength="25" required></sbux-input><span>개월</span>
                                    </td>
                                    <th scope="row" id="CAREER_TRACK_ENTER_DATE_TH" class="th_bg">기준일(PG)</th>
                                    <td class="td_input" id="CAREER_TRACK_ENTER_DATE_TD">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="CAREER_TRACK_ENTER_DATE"
                                                name="CAREER_TRACK_ENTER_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>입사일</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="ENTER_DATE"
                                                name="ENTER_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                style="width:100%;"
                                                required
                                        />
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>연차기산일(재직)</th>
                                    <td colspan="3" class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="ANNUAL_INITIAL_DATE"
                                                name="ANNUAL_INITIAL_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                style="width:100%;"
                                                required
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">연차기산일(퇴사)</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="ANNUAL_BASE_DATE"
                                                name="ANNUAL_BASE_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
                                    <th scope="row" id="CURRENT_PAY_GRADE_TH" class="th_bg"><span class="data_required"></span>PayGrade(현재)</th>
                                    <td class="td_input" id="CURRENT_PAY_GRADE_TD">
                                        <sbux-input id="CURRENT_PAY_GRADE" class="form-control input-sm input-sm-ast inpt_data_reqed" uitype="text" style="width:100%" mask="{'alias': 'numeric'}" maxlength="25" required></sbux-input><span>개월</span>
                                    </td>
                                    <th scope="row" id="CURRENT_PAY_GRADE_DATE_TH" class="th_bg">기준일(PG)</th>
                                    <td class="td_input" id="CURRENT_PAY_GRADE_DATE_TD">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="CURRENT_PAY_GRADE_DATE"
                                                name="CURRENT_PAY_GRADE_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
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
                            <jsp:include page="./hri1000TabContents.jsp"></jsp:include>
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

<div>
    <sbux-modal style="width:600px" id="modal-comPopHri1000Report" name="modal-comPopHri1000Report" uitype="middle" header-title="" body-html-id="body-modal-comPopHri1000Report" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-comPopHri1000Report">
    <jsp:include page="../../../com/popup/comPopHri1000Report.jsp"></jsp:include>
</div>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    var p_languageId = "${loginVO.maLanguageID}";
    //-----------------------------------------------------------

    var editType			= "N";

    var empPhotoInfo = {};
    var signImgInfo = {};

    var jsonSiteCode	= [];	// 사업장
    var jsonEmpState = []; // 재직구분
    var jsonDutyCode = []; // 직책
    var jsonJobFamily = []; // 직종
    var jsonGender = []; // 성별
    var jsonPositionCode = []; // 직위
    var jsonJobGroup = []; // 직급
    var jsonJobRank = []; // 직급
    var jsonJobCode = []; // 직무
    var jsonSubJobCode = [];
    var jsonDetailJobCode = [];
    var jsonEnterType = []; // 입사구분
    var jsonBirthdayType = []; // 양력/음력
    var jsonSalaryClass = []; // 호봉
    var jsonLaborCostGroup = []; // 인건비분류
    var jsonTaxSiteCode = []; // 신고사업장
    var jsonWorkRegion = []; // 근무지
    var jsonEmpType = []; // 사원구분
    var jsonPartnerFirmCode = []; // 협력사
    var jsonNationCode = []; // 국적
    var jsonRetireReason = []; // 퇴사사유
    var jsonRetireInReason = []; // 퇴사사내사유
    var jsonBloodTypeRh = []; // RH
    var jsonBloodTypeAbo = []; // ABO
    var jsonUseYn = []; // 사용여부
    var jsonReligionCode = []; // 종교
    var jsonHouseType = []; // 주거구분
    var jsonHouseKind = []; // 주거유형
    var jsonMarriageYn = []; // 결혼여부
    var jsonRelation = []; // 가족관계
    var jsonYeartaxRelation = []; // 연말정산부양관계
    var jsonSchoolType = []; // 최종학력
    var jsonDegreeType = []; // 학위구분
    var jsonManageCode = []; // 소재지
    var jsonCampusBranchType = []; // 본교구분
    var jsonDayNightType = []; // 주야간구분
    var jsonGraduateType = []; // 졸업구분
    var jsonCareerType = []; // 경력구분
    var jsonLicenseCategory = []; // 면허종별
    var jsonLicenseCode = []; // 자격증코드
    var jsonTestType = []; // 시험구분
    var jsonLevelCode = []; // 수준
    var jsonFileType = []; // 파일 타입
    var jsonEduMethod = []; // 교육구분
    var jsonEduType = []; // 교육방법
    var jsonArmyType = []; // 병역구분
    var jsonArmyPart = []; // 병역병과
    var jsonArmyKind = []; // 병역군별
    var jsonArmyDischargeType = []; // 전역구분
    var jsonArmyGrade = []; // 병역계급
    var jsonVeteransGrade = []; // 보훈등급
    var jsonHandicapGrade = []; // 장애등급
    var jsonGuaranteeType = []; // 보증구분
    var jsonPrizeType = []; // 상벌구분
    var jsonPrizeCategory = []; // 상벌유형
    var jsonPrizeInoutType = []; // 사내외구분
    var jsonPrizeTarget = []; // 대상구분
    var jsonCheckType = []; // 검진구분
    var jsonAddJobDeptCode = []; // 겸직부서
    var jsonTimeOffType = []; // 휴직유형
    var jsonGroupInsureCode = []; // 보험상품
    var jsonDiseaseType = []; // 상해/질병구분
    var jsonEvalPositionCode = []; // 평가차수
    var jsonContractDegree = []; // 계약차수
    var jsonWorkplanType = []; // 근무계획
    var jsonWorkPatternCode = []; // 근무패턴코드
    var jsonWelfareType = []; // 경조사유

    // Tab Data
    var jsonTabData = [
        { "id" : "0",   "pid" : "-1",   "order" : "1",      "text" : "기본인적",             "targetid" : "tpgMasterSub",    "targetvalue" : "기본인적" },
        { "id" : "1",   "pid" : "-1",   "order" : "2",      "text" : "주거/생활/신체",        "targetid" : "tpgMasterSubDetail",    "targetvalue" : "주거/생활/신체" },
        { "id" : "2",   "pid" : "-1",   "order" : "3",      "text" : "가족사항",             "targetid" : "tpgFAMILY",    "targetvalue" : "가족사항" },
        { "id" : "3",   "pid" : "-1",   "order" : "4",      "text" : "학력사항",             "targetid" : "tpgSCHOOL",    "targetvalue" : "학력사항" },
        { "id" : "4",   "pid" : "-1",   "order" : "5",      "text" : "경력사항",             "targetid" : "tpgCAREER",    "targetvalue" : "경력사항" },
        { "id" : "5",   "pid" : "-1",   "order" : "6",      "text" : "자격사항",             "targetid" : "tpgLICENSE",    "targetvalue" : "자격사항" },
        { "id" : "6",   "pid" : "-1",   "order" : "7",      "text" : "어학/컴퓨터활용능력",    "targetid" : "tpgLANGUAGE",    "targetvalue" : "어학/컴퓨터활용능력" },
        { "id" : "7",   "pid" : "-1",   "order" : "8",      "text" : "파일",                "targetid" : "tpgFILE",    "targetvalue" : "파일" },
        { "id" : "8",   "pid" : "-1",   "order" : "9",      "text" : "교육사항",             "targetid" : "tpgEducation",    "targetvalue" : "교육사항" },
        { "id" : "9",   "pid" : "-1",   "order" : "10",     "text" : "병역사항",             "targetid" : "tpgMasterSubDetail2",    "targetvalue" : "병역사항" },
        { "id" : "10",  "pid" : "-1",   "order" : "11",     "text" : "보훈/장애/여권/비자",    "targetid" : "tpgMasterSubDetail3",    "targetvalue" : "보훈/장애/여권/비자" },
        { "id" : "11",  "pid" : "-1",   "order" : "12",     "text" : "보증보험",            "targetid" : "tpgMasterSubDetail4",    "targetvalue" : "보증보험" },
        { "id" : "12",  "pid" : "-1",   "order" : "13",     "text" : "상벌사항",            "targetid" : "tpgPrize",    "targetvalue" : "상벌사항" },
        { "id" : "13",  "pid" : "-1",   "order" : "14",     "text" : "건강검진내역",         "targetid" : "tpgHealth",    "targetvalue" : "건강검진내역" },
        { "id" : "14",  "pid" : "-1",   "order" : "15",     "text" : "발령사항",            "targetid" : "tpgAppointment",    "targetvalue" : "발령사항" },
        { "id" : "15",  "pid" : "-1",   "order" : "16",     "text" : "겸직",               "targetid" : "tabPageEx1",    "targetvalue" : "겸직" },
        { "id" : "16",  "pid" : "-1",   "order" : "17",     "text" : "휴직이력",            "targetid" : "tpgTimeOffHistory",    "targetvalue" : "휴직이력" },
        { "id" : "17",  "pid" : "-1",   "order" : "18",     "text" : "단체보험",            "targetid" : "tpgGroupInsurance",    "targetvalue" : "단체보험" },
        { "id" : "18",  "pid" : "-1",   "order" : "19",     "text" : "상해/질병",           "targetid" : "tpgDisease",    "targetvalue" : "상해/질병" },
        { "id" : "19",  "pid" : "-1",   "order" : "20",     "text" : "평가",                "targetid" : "tpgPersonnelEvaluation",    "targetvalue" : "평가" },
        { "id" : "20",  "pid" : "-1",   "order" : "21",     "text" : "공상발생",             "targetid" : "tpgOfficialInjury",    "targetvalue" : "공상발생" },
        { "id" : "21",  "pid" : "-1",   "order" : "22",     "text" : "계약차수",             "targetid" : "tpgContractDeg",    "targetvalue" : "계약차수" },
        { "id" : "22",  "pid" : "-1",   "order" : "23",     "text" : "근무계획",             "targetid" : "tpgWORKPLAN",    "targetvalue" : "근무계획" },
        { "id" : "23",  "pid" : "-1",   "order" : "24",     "text" : "근무조",               "targetid" : "tpgEmp",    "targetvalue" : "근무조" },
        { "id" : "24",  "pid" : "-1",   "order" : "25",     "text" : "경조사비내역",          "targetid" : "tpgExpenditurewelfare",    "targetvalue" : "경조사비내역" }
    ];

    const fn_initSBSelect = async function() {
        SBUxMethod.set("SRCH_INITIAL_DATE", gfn_dateToYmd(new Date()));
        SBUxMethod.set("CAREER_TRACK", 0);
        SBUxMethod.set("START_PAY_GRADE", 0);
        SBUxMethod.set("CURRENT_PAY_GRADE", 0);
        SBUxMethod.hide('DISPLAY_SOCIAL_NUM');
        SBUxMethod.show('SOCIAL_NUM');

        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['SRCH_SITE_CODE', 'SITE_CODE', 'gvwTimeOffHistory'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 재직구분
            gfnma_setComSelect(['gvwList','SRCH_EMP_STATE', 'EMP_STATE', 'gvwEmp'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직군
            gfnma_setComSelect(['SRCH_JOB_GROUP','JOB_GROUP'], jsonJobGroup, 'L_HRI047', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['gvwList', 'gvwAddJob', 'gvwEmp'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#DUTY_CODE', '#DUTY_CODE2']
                ,compCode		: gv_ma_selectedApcCd
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
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 직종
            gfnma_setComSelect(['JOB_FAMILY'], jsonJobFamily, 'L_HRI004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 성별
            gfnma_setComSelect(['SRCH_GENDER', 'GENDER'], jsonGender, 'L_HRM002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['gvwList','POSITION_CODE', 'START_POSITION_CODE', 'gvwAddJob', 'gvwEmp'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직급
            gfnma_setComSelect(['JOB_RANK', 'gvwAddJob', 'gvwEmp'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직무
            /*gfnma_setComSelect(['JOB_CODE'], jsonJobCode, 'L_HRI006', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#JOB_CODE']
                ,compCode		: gv_ma_selectedApcCd
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
                    {caption: "직무",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "담당자명", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            /*gfnma_setComSelect(['JOB_SUB_CODE'], jsonSubJobCode, 'L_HRI073_A', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#JOB_SUB_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI073_A'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            /*gfnma_setComSelect(['JOB_DETAIL_CODE'], jsonDetailJobCode, 'L_HRI073_B', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#JOB_DETAIL_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI073_B'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 입사구분
            /*gfnma_setComSelect(['ENTER_TYPE'], jsonEnterType, 'L_HRI041_01', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#ENTER_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI041_01'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 양력/음력
            gfnma_setComSelect(['gvwFamily','BIRTHDAY_TYPE'], jsonBirthdayType, 'L_HRM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 호봉
            gfnma_setComSelect(['SALARY_CLASS'], jsonSalaryClass, 'L_HRI011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'GRADE_HOBONG_CODE', 'GRADE_HOBONG_NAME', 'Y', ''),
            // 인건비분류
            /*gfnma_setComSelect(['LABOR_COST_GROUP'], jsonLaborCostGroup, 'L_HRI007', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#LABOR_COST_GROUP']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI007'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 신고사업장
            gfnma_setComSelect(['TAX_SITE_CODE'], jsonTaxSiteCode, 'L_ORG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TAX_SITE_CODE', 'TAX_SITE_NAME', 'Y', ''),
            // 근무지
            /*gfnma_setComSelect(['WORK_REGION'], jsonWorkRegion, 'L_HRI999', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#WORK_REGION']
                ,compCode		: gv_ma_selectedApcCd
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
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 사원구분
            gfnma_setComSelect(['EMP_TYPE'], jsonEmpType, 'L_HRI008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 협력사
            gfnma_setComSelect(['PARTNER_FIRM_CODE'], jsonPartnerFirmCode, 'L_HRI065', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 국적
            gfnma_setComSelect(['NATION_CODE'], jsonNationCode, 'L_COM015_2', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'NATION_CODE', 'NATION_NAME', 'Y', ''),
            // 퇴사사유
            /*gfnma_setComSelect(['RETIRE_REASON'], jsonRetireReason, 'L_HRI013', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#RETIRE_REASON']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI013'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 퇴사사내사유
            /*gfnma_setComSelect(['RETIRE_IN_REASON'], jsonRetireInReason, 'L_HRI041_02', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#RETIRE_IN_REASON']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI041_02'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // RH
            /*gfnma_setComSelect(['BLOOD_TYPE_RH'], jsonBloodTypeRh, 'L_HRI014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#BLOOD_TYPE_RH']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI014'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // ABO
            /*gfnma_setComSelect(['BLOOD_TYPE_ABO'], jsonBloodTypeAbo, 'L_HRI015', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#BLOOD_TYPE_ABO']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI015'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 사용여부
            gfnma_setComSelect(['COLOR_BLIND_YN', 'HOUSE_OWN_YN', 'CAR_OWN_YN', 'gvwLicense', 'gvwEducation', 'VETERANS_YN', 'VETERANS_ORDER_YN'],
                jsonUseYn, 'L_COM014', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 종교
            /*gfnma_setComSelect(['RELIGION_CODE'], jsonReligionCode, 'L_HRI038', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#RELIGION_CODE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI038'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 주거구분
            /*gfnma_setComSelect(['HOUSE_TYPE'], jsonHouseType, 'L_HRI017', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#HOUSE_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI017'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 주거유형
            /*gfnma_setComSelect(['HOUSE_KIND'], jsonHouseKind, 'L_HRI018', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#HOUSE_KIND']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI018'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 결혼여부
            /*gfnma_setComSelect(['MARRIAGE_YN'], jsonMarriageYn, 'L_HRI016', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#MARRIAGE_YN']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI016'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 가족관계
            gfnma_setComSelect(['gvwFamily', 'gvwExpenditurewelfare'],
                jsonRelation, 'L_HRI025', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#VETERANS_RELATION', '#GUARANTOR1_RELATION', '#GUARANTOR2_RELATION']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI025'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 연말정산부양관계
            gfnma_setComSelect(['gvwFamily'], jsonYeartaxRelation, 'L_HRI026', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 최종학력
            gfnma_setComSelect(['gvwFamily'], jsonSchoolType, 'L_HRI027', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 학위구분
            gfnma_setComSelect(['gvwSchool'], jsonDegreeType, 'L_HRI054', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 소재지
            gfnma_setComSelect(['gvwSchool', 'gvwCareer'], jsonManageCode, 'L_HRI028', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 본교구분
            gfnma_setComSelect(['gvwSchool'], jsonCampusBranchType, 'L_HRI049', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 본교구분
            gfnma_setComSelect(['gvwSchool'], jsonDayNightType, 'L_HRI057', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 졸업구분
            gfnma_setComSelect(['gvwSchool'], jsonGraduateType, 'L_HRI029', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 경력구분
            gfnma_setComSelect(['gvwCareer'], jsonCareerType, 'L_HRI030', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 면허종별
            gfnma_setComSelect(['gvwLicense'], jsonLicenseCategory, 'L_HRI031', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 자격증코드
            gfnma_setComSelect(['gvwLicense'], jsonLicenseCode, 'L_HRI068', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 시험구분
            gfnma_setComSelect(['gvwLanguage'], jsonTestType, 'L_HRI032', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 수준
            gfnma_setComSelect(['gvwLanguage', 'gvwComputerSkill'], jsonLevelCode, 'L_HRI045', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 파일타입
            gfnma_setComSelect(['gvwFile'], jsonFileType, 'L_HRI061', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 교육구분
            gfnma_setComSelect(['gvwEducation'], jsonEduMethod, 'L_HRI034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 교육방법
            gfnma_setComSelect(['gvwEducation'], jsonEduType, 'L_HRI039', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 병역구분
            /*gfnma_setComSelect(['ARMY_TYPE'], jsonArmyType, 'L_HRI019', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#ARMY_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI019'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 병역병과
            /*gfnma_setComSelect(['ARMY_PART'], jsonArmyPart, 'L_HRI021', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#ARMY_PART']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI021'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 병역군별
            /*gfnma_setComSelect(['ARMY_KIND'], jsonArmyKind, 'L_HRI020', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#ARMY_KIND']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI020'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 전역구분
            /*gfnma_setComSelect(['ARMY_DISCHARGE_TYPE'], jsonArmyDischargeType, 'L_HRI023', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#ARMY_DISCHARGE_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI023'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 병역계급
            /*gfnma_setComSelect(['ARMY_GRADE'], jsonArmyGrade, 'L_HRI022', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#ARMY_GRADE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI022'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 보훈등급
            /*gfnma_setComSelect(['VETERANS_GRADE'], jsonVeteransGrade, 'L_HRI055', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#VETERANS_GRADE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI055'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 장애등급
            /*gfnma_setComSelect(['HANDICAP_GRADE'], jsonHandicapGrade, 'L_HRI053', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#HANDICAP_GRADE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI053'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "SUB_CODE",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "CODE_NAME", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 보증구분
            gfnma_setComSelect(['GUARANTEE_TYPE'], jsonGuaranteeType, 'L_HRI024', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상벌구분
            gfnma_setComSelect(['gvwPrize'], jsonPrizeType, 'L_HRI035', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상벌유형
            gfnma_setComSelect(['gvwPrize'], jsonPrizeCategory, 'L_HRI060', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 사내외구분
            gfnma_setComSelect(['gvwPrize'], jsonPrizeInoutType, 'L_HRI030', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 대상구분
            gfnma_setComSelect(['gvwPrize'], jsonPrizeTarget, 'L_HRI036', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 검진구분
            gfnma_setComSelect(['gvwHealth'], jsonCheckType, 'L_HRI037', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 겸직부서
            gfnma_setComSelect(['gvwAddJob'], jsonAddJobDeptCode, 'L_ORG900', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 휴직유형
            gfnma_setComSelect(['gvwTimeOffHistory'], jsonTimeOffType, 'L_HRT003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 보험상품
            gfnma_setComSelect(['gvwGroupInsurance'], jsonGroupInsureCode, 'L_HRI062', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상해/질병구분
            gfnma_setComSelect(['gvwDisease'], jsonDiseaseType, 'L_HRI063', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 평가차수
            gfnma_setComSelect(['gvwPersonnelEvaluation'], jsonEvalPositionCode, 'L_HRIZ04', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 계약차수
            gfnma_setComSelect(['gvwContractDeg'], jsonContractDegree, 'L_HRIZ03', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무계획
            gfnma_setComSelect(['gvwWorkPlan'], jsonWorkplanType, 'L_HRI070', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무패턴코드
            gfnma_setComSelect(['gvwEmp'], jsonWorkPatternCode, 'L_HRT020', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 경조사유
            gfnma_setComSelect(['gvwExpenditurewelfare'], jsonWelfareType, 'L_HRW103_02', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

        ]);
    }

    const fnSocialNumChange = function(socialNum) {
        if (socialNum.length != 14) return;

        let SRCH_INITIAL_DATE = SBUxMethod.get("SRCH_INITIAL_DATE");
        let dtDate = new Date(SRCH_INITIAL_DATE.substring(0, 4)+ "-" + SRCH_INITIAL_DATE.substring(4, 6) + "-" + SRCH_INITIAL_DATE.substring(6, 8)); // 계산전 기산일을 가져옴

        // 남자
        if (socialNum.substring(7, 8) == "1" || socialNum.substring(7, 8) == "3") {
            SBUxMethod.set('GENDER', "M");
        }
        // 여자
        else if (socialNum.substring(7, 8) == "2" || socialNum.substring(7, 8) == "4") {
            SBUxMethod.set('GENDER', "F");
        }

        let strsocial_num = socialNum.replace("-", "");

        // 만 나이를 구함
        if (strsocial_num.length == 13) {
            // 주민등록번호를 이용하여 생년월일, 성별을 추가함
            if (strsocial_num.substring(6, 7) == "1" || strsocial_num.substring(6, 7) == "2") {
                SBUxMethod.set('BIRTHDAY', ("19" + strsocial_num.substring(0, 6)));
            } else if (strsocial_num.substring(6, 7) == "3" || strsocial_num.substring(6, 7) == "4") {
                SBUxMethod.set('BIRTHDAY', ("20" + strsocial_num.substring(0, 6)));
            }

            if (strsocial_num.substring(6, 7) == "1" || strsocial_num.substring(6, 7) == "2"
                || strsocial_num.substring(6, 7) == "5" || strsocial_num.substring(6, 7) == "6") {
                let dt = new Date("19" + strsocial_num.substring(0, 2) + "-" + strsocial_num.substring(2, 4) + "-" + strsocial_num.substring(4, 6));
                let iyyyy = dtDate.getFullYear() - dt.getFullYear();

                if (dtDate.getMonth() <= dt.getMonth()) {
                    if (dtDate.getDay() <= dt.getDay()) {
                        SBUxMethod.set('AGE', iyyyy - 1);
                    } else {
                        SBUxMethod.set('AGE', iyyyy);
                    }
                } else {
                    SBUxMethod.set('AGE', iyyyy);
                }
            } else if (strsocial_num.substring(6, 7) == "3" || strsocial_num.substring(6, 7) == "4"
                || strsocial_num.substring(6, 7) == "7" || strsocial_num.substring(6, 7) == "8") {
                let dt = new Date("20" + strsocial_num.substring(0, 2) + "-" + strsocial_num.substring(2, 4) + "-" + strsocial_num.substring(4, 6));
                let iyyyy = dtDate.getFullYear() - dt.getFullYear();

                if (dtDate.getMonth() <= dt.getMonth()) {
                    if (dtDate.getDay() <= dt.getDay()) {
                        SBUxMethod.set('AGE', iyyyy - 1);
                    } else {
                        SBUxMethod.set('AGE', iyyyy);
                    }
                } else {
                    SBUxMethod.set('AGE', iyyyy);
                }

            }
        }
    }

    const fn_findEmpCode = function() {
        var searchCode 		= gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 	= "_DEPT_NAME_";
        var replaceText1 	= "_EMP_CODE_";
        var replaceText2 	= "_EMP_NAME_";
        var replaceText3 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_CODE LIKE '%" + replaceText1 + "%' AND X.EMP_NAME LIKE '%" + replaceText2 + "%' AND X.EMP_STATE LIKE '%" + replaceText3 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
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
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
            },
        });
    }

    const fn_findOldEmpCode = function() {
        var searchCode 		= gfnma_nvl(SBUxMethod.get("OLD_EMP_CODE"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("OLD_EMP_NAME"));
        var replaceText0 	= "_DEPT_NAME_";
        var replaceText1 	= "_EMP_CODE_";
        var replaceText2 	= "_EMP_NAME_";
        var replaceText3 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_CODE LIKE '%" + replaceText1 + "%' AND X.EMP_NAME LIKE '%" + replaceText2 + "%' AND X.EMP_STATE LIKE '%" + replaceText3 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
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
                console.log('callback data:', data);
                SBUxMethod.set('OLD_EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('OLD_EMP_CODE', data.EMP_CODE);
            },
        });
    }

    const fn_findIntroducerCode = function() {
        var searchCode 		= gfnma_nvl(SBUxMethod.get("INTRODUCER_CODE"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("INTRODUCER_NAME"));
        var replaceText0 	= "_DEPT_NAME_";
        var replaceText1 	= "_EMP_CODE_";
        var replaceText2 	= "_EMP_NAME_";
        var replaceText3 	= "_EMP_STATE_";
        var strWhereClause 	= "AND X.DEPT_NAME LIKE '%" + replaceText0 + "%' AND X.EMP_CODE LIKE '%" + replaceText1 + "%' AND X.EMP_NAME LIKE '%" + replaceText2 + "%' AND X.EMP_STATE LIKE '%" + replaceText3 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		"재직상태"]
            ,searchInputFields		: ["DEPT_NAME", 	"EMP_CODE",		"EMP_NAME",		"EMP_STATE"]
            ,searchInputValues		: ["", 			searchCode,  searchName,		""]
            ,searchInputTypes		: ["input", 	"input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"", "",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('INTRODUCER_NAME', data.EMP_NAME);
                SBUxMethod.set('INTRODUCER_CODE', data.EMP_CODE);
            },
        });
    }

    var fn_findSrchDeptCode = function() {
        var searchCode 		= gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
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
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    var fn_findDeptCode = function() {
        var searchCode 		= gfnma_nvl(SBUxMethod.get("DEPT_CODE"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
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
                console.log('callback data:', data);
                SBUxMethod.set('DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findParentDeptCode = function() {
        var searchCode 		= gfnma_nvl(SBUxMethod.get("PARENT_DEPT"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("PARENT_DEPT_NAME"));
        var replaceText0 	= "_CC_CODE_";
        var replaceText1 	= "_CC_NAME_";
        var strWhereClause 	= "AND CC_CODE LIKE '%" + replaceText0 + "%' AND CC_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG010'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["원가조직코드", 		"원가조직명"]
            ,searchInputFields		: ["CC_CODE", 		"CC_NAME"]
            ,searchInputValues		: [searchCode, 			searchName]
            ,height					: '400px'
            ,tableHeader			: ["원가조직코드", "원가조직명"]
            ,tableColumnNames		: ["CC_CODE", "CC_NAME"]
            ,tableColumnWidths		: ["80px", "80px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('PARENT_DEPT_NAME', data.CC_NAME);
                SBUxMethod.set('PARENT_DEPT', data.CC_CODE);
            },
        });
    }

    const fn_findCostDeptCode = function() {
        var searchCode 		= gfnma_nvl(SBUxMethod.get("COST_DEPT_CODE"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("COST_DEPT_NAME"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_NAME_";
        var strWhereClause 	= "AND DEPT_CODE LIKE '%" + replaceText0 + "%' AND DEPT_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'L_ORG900_ESS'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서", 		"부서명"]
            ,searchInputFields		: ["CODE", 		"NAME"]
            ,searchInputValues		: [searchCode, 			searchName]
            ,height					: '400px'
            ,tableHeader			: ["부서", "부서명"]
            ,tableColumnNames		: ["CODE", "NAME"]
            ,tableColumnWidths		: ["80px", "80px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('COST_DEPT_NAME', data.NAME);
                SBUxMethod.set('COST_DEPT_CODE', data.CODE);
            },
        });
    }

    const fn_findDeptCode2 = function() {
        var searchCode 		= gfnma_nvl(SBUxMethod.get("DEPT_CODE2"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("DEPT_NAME2"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_NAME_";
        var strWhereClause 	= "AND DEPT_CODE LIKE '%" + replaceText0 + "%' AND DEPT_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'L_ORG900_ESS'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서", 		"부서명"]
            ,searchInputFields		: ["CODE", 		"NAME"]
            ,searchInputValues		: [searchCode, 			searchName]
            ,height					: '400px'
            ,tableHeader			: ["부서", "부서명"]
            ,tableColumnNames		: ["CODE", "NAME"]
            ,tableColumnWidths		: ["80px", "80px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('DEPT_NAME2', data.NAME);
                SBUxMethod.set('DEPT_CODE2', data.CODE);
            },
        });
    }

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        document.getElementById('empPhotoArea').addEventListener('click', function() {
            document.getElementById('EMP_PHOTO_FILE').click();
        });

        document.getElementById('signImgArea').addEventListener('click', function() {
            document.getElementById('SIGN_IMG_FILE').click();
        });

        document.getElementById('EMP_PHOTO_FILE').addEventListener('change', function(event) {
            const file = event.target.files[0];
            let EMP_CODE = gfn_nvl(SBUxMethod.get("EMP_CODE"));

            if(EMP_CODE != "") {
                fn_imgUpload(EMP_CODE, file, "1");
            }
        });

        document.getElementById('SIGN_IMG_FILE').addEventListener('change', function(event) {
            const file = event.target.files[0];
            let EMP_CODE = gfn_nvl(SBUxMethod.get("EMP_CODE"));

            if(EMP_CODE != "") {
                fn_imgUpload(EMP_CODE, file, "2");
            }
        });

        fn_initSBSelect();
        fn_createGvwListGrid();
        fn_createGvwFamilyGrid();
        fn_createGvwSchoolGrid();
        fn_createGvwCareerGrid();
        fn_createGvwLicenseGrid();
        fn_createGvwLanguageGrid();
        fn_createGvwComputerSkillGrid();
        fn_createGvwFileGrid();
        fn_createGvwEducationGrid();
        fn_createGvwPrizeGrid();
        fn_createGvwHealthGrid();
        fn_createGvwAppointmentGrid();
        fn_createGvwAddJobGrid();
        fn_createGvwTimeOffHistoryGrid();
        fn_createGvwGroupInsuranceGrid();
        fn_createGvwDiseaseGrid();
        fn_createGvwPersonnelEvaluationGrid();
        fn_createGvwOfficialInjuryGrid();
        fn_createGvwContractDegGrid();
        fn_createGvwWorkPlanGrid();
        fn_createGvwEmpGrid();
        fn_createGvwExpenditurewelfareGrid();
        cfn_search();
    });

    //grid 초기화
    var gvwList; 			// 그리드를 담기위한 객체 선언
    var gvwFamily;
    var gvwSchool;
    var gvwCareer;
    var gvwLicense;
    var gvwLanguage;
    var gvwComputerSkill;
    var gvwFile;
    var gvwEducation;
    var gvwPrize;
    var gvwHealth;
    var gvwAppointment;
    var gvwAddJob;
    var gvwTimeOffHistory;
    var gvwGroupInsurance;
    var gvwDisease;
    var gvwPersonnelEvaluation;
    var gvwOfficialInjury;
    var gvwContractDeg;
    var gvwWorkPlan;
    var gvwEmp;
    var gvwExpenditurewelfare;

    var jsonEmpTotalList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonFamilyList = [];
    var jsonSchoolList = [];
    var jsonCareerList = [];
    var jsonLicenseList = [];
    var jsonLanguageList = [];
    var jsonComputerSkillList = [];
    var jsonFileList = [];
    var jsonEducationList = [];
    var jsonPrizeList = [];
    var jsonHealthList = [];
    var jsonAppointmentList = [];
    var jsonAddJobList = [];
    var jsonTimeOffHistoryList = [];
    var jsonGroupInsuranceList = [];
    var jsonDiseaseList = [];
    var jsonPersonnelEvaluationList = [];
    var jsonOfficialInjuryList = [];
    var jsonContractDegList = [];
    var jsonWorkPlanList = [];
    var jsonEmpList = [];
    var jsonExpenditurewelfareList = [];

    // 그리드 생성
    function fn_createGvwListGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwList';
        SBGridProperties.id 				= 'gvwList';
        SBGridProperties.jsonref 			= 'jsonEmpTotalList';
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
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true}},
            {caption: ["사번"], 	        ref: 'EMP_CODE',    	        type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["이름"],  		ref: 'EMP_NAME',    			type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["상위부서"],       ref: 'PARENT_DEPT_NAME', 		type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서"],          ref: 'DEPT_NAME', 		        type:'output',  	width:'140px',  style:'text-align:left'},
            {caption: ["직위"],          ref: 'POSITION_CODE', 		    type:'combo',  	width:'100px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["직책"],      	ref: 'DUTY_CODE', 		        type:'combo',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["재직구분"],     	ref: 'EMP_STATE', 		        type:'combo',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonEmpState',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["입사일"],        ref: 'ENTER_DATE', 		         type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["퇴사일"],        ref: 'RETIRE_DATE', 		     type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            }
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        gvwList.bind('click', 'fn_view');
    }

    // 신규
    function cfn_add() {
        fn_create();
    }

    var fn_findDeptCodeForGvwCareer = function(row, col) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= '';
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: ["", 				searchText,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                gvwCareer.setCellData(row, col, data['DEPT_NAME']);
            },
        });
    }

    var fn_findDeptCodeForGvwTimeOffHistory = function(row, col) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= '';
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: ["", 				searchText,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                gvwTimeOffHistory.setCellData(row, (col-1), data['DEPT_CODE']);
                gvwTimeOffHistory.setCellData(row, col, data['DEPT_NAME']);
            },
        });
    }


    /**
     * 신규등록
     */
    const fn_create = async function() {
        editType = "N";
        SBUxMethod.set("EMP_CODE", "");
        SBUxMethod.set("DISPLAY_SOCIAL_NUM", "");
        SBUxMethod.set("SOCIAL_NUM", "");
        SBUxMethod.set("POSITION_CODE", "");
        SBUxMethod.set("POSITION_CODE_PERIOD", "");
        SBUxMethod.set("EMP_NAME", "");
        SBUxMethod.set("BIRTHDAY", "");
        SBUxMethod.set("BIRTHDAY_TYPE", "");
        SBUxMethod.set("LEAP_MONTH_YN", "");
        SBUxMethod.set("JOB_GROUP", "");
        SBUxMethod.set("SALARY_CLASS", "");
        SBUxMethod.set("EMP_NAME_ENG", "");
        SBUxMethod.set("GENDER", "");
        SBUxMethod.set("AGE", "");
        SBUxMethod.set("JOB_FAMILY", "");
        SBUxMethod.set("SALARY_LEVEL", "");
        SBUxMethod.set("EMP_NAME_CHN", "");
        gfnma_multiSelectSet('#DUTY_CODE', '', '', '');
        SBUxMethod.set("DUTY_CODE_PERIOD", "");
        gfnma_multiSelectSet('#JOB_CODE', '', '', '');
        gfnma_multiSelectSet('#JOB_SUB_CODE', '', '', '');
        gfnma_multiSelectSet('#JOB_DETAIL_CODE', '', '', '');
        SBUxMethod.set("JOB_CODE_PERIOD", "");
        gfnma_multiSelectSet('#LABOR_COST_GROUP', '', '', '');
        SBUxMethod.set("JOB_RANK", "");
        SBUxMethod.set("JOB_RANK_PERIOD", "");
        SBUxMethod.set("BOARD_DIRECTOR_YN", "");
        SBUxMethod.set("SALES_EMP_YN", "");
        SBUxMethod.set("RE_ENTER_YN", "");
        SBUxMethod.set("TO_YN", "");
        SBUxMethod.set("SITE_CODE", "");
        SBUxMethod.set("DEPT_CODE", "");
        SBUxMethod.set("DEPT_NAME", "");
        SBUxMethod.set("PARENT_DEPT", "");
        SBUxMethod.set("PARENT_DEPT_NAME", "");
        SBUxMethod.set("TAX_SITE_CODE", "");
        SBUxMethod.set("COST_DEPT_CODE", "");
        SBUxMethod.set("COST_DEPT_NAME", "");
        SBUxMethod.set("DEPT_CODE2", "");
        SBUxMethod.set("DEPT_NAME2", "");
        gfnma_multiSelectSet('#WORK_REGION', '', '', '');
        SBUxMethod.set("EMP_TYPE", "");
        SBUxMethod.set("PARTNER_FIRM_EMP_YN", "");
        SBUxMethod.set("PARTNER_FIRM_CODE", "");
        gfnma_multiSelectSet('#DUTY_CODE2', '', '', '');
        SBUxMethod.set("EMP_STATE", "");
        SBUxMethod.set("OLD_EMP_CODE", "");
        SBUxMethod.set("OLD_EMP_NAME", "");
        SBUxMethod.set("START_POSITION_CODE", "");
        SBUxMethod.set("CAREER_TRACK", 0);
        gfnma_multiSelectSet('#ENTER_TYPE', '', '', '');
        SBUxMethod.set("INTRODUCER_CODE", "");
        SBUxMethod.set("INTRODUCER_NAME", "");
        SBUxMethod.set("CAREER_DATE", "");
        SBUxMethod.set("START_PAY_GRADE", 0);
        SBUxMethod.set("CAREER_TRACK_ENTER_DATE", "");
        SBUxMethod.set("ENTER_DATE", "");
        SBUxMethod.set("ANNUAL_INITIAL_DATE", "");
        SBUxMethod.set("ANNUAL_BASE_DATE", "");
        SBUxMethod.set("CURRENT_PAY_GRADE", 0);
        SBUxMethod.set("CURRENT_PAY_GRADE_DATE", "");
        SBUxMethod.hide('DISPLAY_SOCIAL_NUM');
        SBUxMethod.show('SOCIAL_NUM');
        SBUxMethod.attr('EMP_CODE', 'readonly', 'false');
        SBUxMethod.attr('POSITION_CODE', 'readonly', 'false');
        SBUxMethod.attr('JOB_GROUP', 'readonly', 'false');
        SBUxMethod.attr('JOB_CODE', 'readonly', 'false');
        SBUxMethod.attr('DUTY_CODE', 'readonly', 'false');
        SBUxMethod.attr('JOB_RANK', 'readonly', 'false');
        SBUxMethod.attr('ENTER_TYPE', 'readonly', 'false');
        SBUxMethod.attr('EMP_TYPE', 'readonly', 'false');
        SBUxMethod.attr('VETERANS_RELATION', 'readonly', 'false');
        SBUxMethod.attr('VETERANS_NUM', 'readonly', 'false');
        SBUxMethod.attr('VETERANS_ORDER_YN', 'readonly', 'false');
        SBUxMethod.attr('VETERANS_ORDER_DATE', 'readonly', 'false');

        $('#START_PAY_GRADE_TH').show();
        $('#START_PAY_GRADE_TD').show();
        $('#CAREER_TRACK_ENTER_DATE_TH').show();
        $('#CAREER_TRACK_ENTER_DATE_TD').show();
        $('#CURRENT_PAY_GRADE_TH').show();
        $('#CURRENT_PAY_GRADE_TD').show();
        $('#CURRENT_PAY_GRADE_DATE_TH').show();
        $('#CURRENT_PAY_GRADE_DATE_TD').show();

        clearTabContents();
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    /**
     * 저장
     */
    const fn_save = async function() {
        if(!SBUxMethod.validateRequired()) {
            return false;
        }

        const master = await getParamForHri1000S();
        console.log(master)
        if (new Date(master.V_P_UNION_JOIN_START_DATE) > new Date(master.V_P_UNION_JOIN_END_DATE))
        {
            alert("노조탈퇴일이 노조가입일보다 빠를 수 없습니다.")
            return false;
        }

        const postJsonPromiseMaster = gfn_postJSON("/hr/hri/hri/insertHri1000Master.do", {
            getType				: 'json',
            workType			: editType,
            cv_count			: '0',
            params				: gfnma_objectToString(master)
        });
        const masterData = await postJsonPromiseMaster;

        try {
            if (_.isEqual("S", masterData.resultStatus)) {
                var empCode = editType == 'U' ? gfnma_nvl(SBUxMethod.get("EMP_CODE")) : masterData.v_returnStr;
                SBUxMethod.set("EMP_CODE", empCode);
                if(empCode) {
                    const postJsonPromiseSub = gfn_postJSON("/hr/hri/hri/insertHri1000Sub.do", {
                        getType: 'json',
                        workType: editType,
                        cv_count: '0',
                        params: gfnma_objectToString(await getParamForHri1000S1(empCode))
                    });
                    const subData = await postJsonPromiseSub;

                    try {
                        if (_.isEqual("S", subData.resultStatus)) {
                            var paramObj = {
                                P_HRI1000_S2: await getParamForHri1000S2(empCode),
                                //P_HRI1000_S3: await getParamForHri1000S3(editType, empCode),
                                P_HRI1000_S4: await getParamForHri1000S4(empCode),
                                P_HRI1000_S5: await getParamForHri1000S5(empCode),
                                P_HRI1000_S6: await getParamForHri1000S6(empCode),
                                P_HRI1000_S7: await getParamForHri1000S7(empCode),
                                P_HRI1000_S8: await getParamForHri1000S8(empCode),
                                P_HRI1000_S9: await getParamForHri1000S9(empCode),
                                P_HRI1000_S10: await getParamForHri1000S10(empCode),
                                P_HRI1000_S11: await getParamForHri1000S11(empCode),
                                P_HRI1000_S12: await getParamForHri1000S12(empCode),
                                P_HRI1000_S13: await getParamForHri1000S13(empCode),
                                P_HRI1000_S14: await getParamForHri1000S14(empCode),
                                P_HRI1000_S15: await getParamForHri1000S15(empCode),
                                P_HRI1000_S16: await getParamForHri1000S16(empCode),
                                P_HRI1000_S17: await getParamForHri1000S17(empCode),
                                P_HRI1000_S18: await getParamForHri1000S18(empCode),
                                P_HRI1000_S19: await getParamForHri1000S19(empCode),
                                P_HRI1000_S21: await getParamForHri1000S21(editType, empCode),
                                P_HRI1000_S22: await getParamForHri1000S22(empCode),
                                P_HRI1000_S23: await getParamForHri1000S23(editType, empCode),
                                P_HRI1000_S24: await getParamForHri1000S24(empCode),
                            }

                            const postJsonPromiseDetail = gfn_postJSON("/hr/hri/hri/insertHri1000Detail.do", paramObj);
                            const detailData = await postJsonPromiseDetail;

                            try {
                                if (_.isEqual("S", detailData.resultStatus)) {
                                    gfn_comAlert("I0001");
                                    cfn_search();
                                } else {
                                    alert(detailData.resultMessage);
                                }

                            } catch (e) {
                                if (!(e instanceof Error)) {
                                    e = new Error(e);
                                }
                                console.error("failed", e.message);
                                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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

    //선택 삭제
    const fn_delete = async function() {
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        let EMP_NAME = gfnma_nvl(SBUxMethod.get("EMP_NAME"));

        if(EMP_NAME == '' || EMP_CODE == '') return;

        if(gfn_comConfirm("Q0001", EMP_NAME + " 사원의 정보를 삭제")) {
            const postJsonPromise = gfn_postJSON("/hr/hri/hri/deleteHri1000List.do", {
                getType				: 'json',
                workType			: 'D',
                cv_count			: '0',
                params				: gfnma_objectToString(await getParamForHri1000S())
            });
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");					// I0001 처리 되었습니다.
                    cfn_add();
                    cfn_search();
                } else {
                    gfn_comAlert("E0001");					// E0001 오류가 발생하였습니다.
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

    /**
     * 이력복사
     */
    const fn_copyHistory = async function() {

    }

    /**
     * 입사처리
     */
    const fn_joinCompnay = async function() {
        let EMP_CODE_LIST = "";
        const allData = gvwList.getGridDataAll();

        allData.forEach((item, index) => {
            let rowData = gvwList.getRowData(index);
            if (item.CHK_YN === "Y") {
                EMP_CODE_LIST += rowData.EMP_CODE + '|'
            }
        });

        if (EMP_CODE_LIST.length == 0) {
            gfn_comAlert("W0001", "사원");		//	W0001	{0}을/를 선택하세요.
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_EMP_CODE_LIST : EMP_CODE_LIST,
            V_P_ENTER_DATE : '',
            V_P_FORM_ID	: p_formId,
            V_P_MENU_ID	: p_menuId,
            V_P_PROC_ID	: '',
            V_P_USERID : '',
            V_P_PC : '',
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/insertHri1000EnterEmp.do", {
            getType				: 'json',
            workType			: 'N',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
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

    /**
     * 퇴사발령등록
     */
    const fn_registResignation = async function() {

    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    /**
     * 목록 조회
     */
    const fn_search = async function() {
        editType = "N";
        SBUxMethod.attr('EMP_CODE', 'readonly', 'true');
        let SITE_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let EMP_STATE	    = gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let JOB_GROUP	    = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let GENDER	        = gfnma_nvl(SBUxMethod.get("SRCH_GENDER"));
        let DEPT_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let ENTER_DATE_FR	    = gfnma_nvl(SBUxMethod.get("SRCH_ENTER_DATE_FR"));
        let ENTER_DATE_TO	    = gfnma_nvl(SBUxMethod.get("SRCH_ENTER_DATE_TO"));
        let INITIAL_DATE	= gfnma_nvl(SBUxMethod.get("SRCH_INITIAL_DATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_DEPT_CODE      : DEPT_CODE
            ,V_P_EMP_CODE       : EMP_CODE
            ,V_P_EMP_STATE      : EMP_STATE
            ,V_P_JOB_GROUP      : JOB_GROUP
            ,V_P_GENDER         : GENDER
            ,IV_P_ENTER_DATE_FR : ENTER_DATE_FR
            ,IV_P_ENTER_DATE_TO : ENTER_DATE_TO
            ,V_P_EMP_CODE1      : ''
            ,V_P_INITIAL_DATE   : INITIAL_DATE
            ,V_P_EMP_STATE2     : ''
            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1000List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '39',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {

                jsonEmpTotalList.length = 0;
                /** @type {number} **/
                data.cv_1.forEach((item, index) => {
                    const msg = {
                         EMP_CODE           : item.EMP_CODE
                        ,EMP_NAME           : item.EMP_NAME
                        ,PARENT_DEPT_NAME   : item.PARENT_DEPT_NAME
                        ,DEPT_NAME          : item.DEPT_NAME
                        ,POSITION_CODE      : item.POSITION_CODE
                        ,DUTY_CODE          : item.DUTY_CODE
                        ,EMP_STATE          : item.EMP_STATE
                        ,ENTER_DATE         : item.ENTER_DATE
                        ,RETIRE_DATE        : item.RETIRE_DATE
                    }
                    jsonEmpTotalList.push(msg);
                });

                gvwList.rebuild();

                if(jsonEmpTotalList.length > 0) {
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

    const fn_setMasterData = async function(data) {
        SBUxMethod.set("EMP_CODE", data.EMP_CODE);
        SBUxMethod.set("DISPLAY_SOCIAL_NUM", data.DISPLAY_SOCIAL_NUM);
        SBUxMethod.set("SOCIAL_NUM", data.SOCIAL_NUM);
        SBUxMethod.set("POSITION_CODE", data.POSITION_CODE);
        SBUxMethod.set("POSITION_CODE_PERIOD", data.POSITION_CODE_PERIOD);
        SBUxMethod.set("EMP_NAME", data.EMP_NAME);
        SBUxMethod.set("BIRTHDAY", data.BIRTHDAY);
        SBUxMethod.set("BIRTHDAY_TYPE", data.BIRTHDAY_TYPE);
        SBUxMethod.set("LEAP_MONTH_YN", data.LEAP_MONTH_YN);
        SBUxMethod.set("JOB_GROUP", data.JOB_GROUP);
        SBUxMethod.set("SALARY_CLASS", data.SALARY_CLASS);
        SBUxMethod.set("EMP_NAME_ENG", data.EMP_NAME_ENG);
        SBUxMethod.set("GENDER", data.GENDER);
        SBUxMethod.set("AGE", data.AGE);
        SBUxMethod.set("JOB_FAMILY", data.JOB_FAMILY);
        SBUxMethod.set("SALARY_LEVEL", data.SALARY_LEVEL);
        SBUxMethod.set("EMP_NAME_CHN", data.EMP_NAME_CHN);
        gfnma_multiSelectSet('#DUTY_CODE', 'SUB_CODE', 'CODE_NAME', data.DUTY_CODE);
        SBUxMethod.set("DUTY_CODE_PERIOD", data.DUTY_CODE_PERIOD);
        gfnma_multiSelectSet('#JOB_CODE', 'SUB_CODE', 'CODE_NAME', data.JOB_CODE);
        gfnma_multiSelectSet('#JOB_SUB_CODE', 'SUB_CODE', 'CODE_NAME', data.JOB_SUB_CODE);
        gfnma_multiSelectSet('#JOB_DETAIL_CODE', 'SUB_CODE', 'CODE_NAME', data.JOB_DETAIL_CODE);
        SBUxMethod.set("JOB_CODE_PERIOD", data.JOB_CODE_PERIOD);
        gfnma_multiSelectSet('#LABOR_COST_GROUP', 'SUB_CODE', 'CODE_NAME', data.LABOR_COST_GROUP);
        SBUxMethod.set("JOB_RANK", data.JOB_RANK);
        SBUxMethod.set("JOB_RANK_PERIOD", data.JOB_RANK_PERIOD);
        SBUxMethod.set("BOARD_DIRECTOR_YN", data.BOARD_DIRECTOR_YN);
        SBUxMethod.set("SALES_EMP_YN", data.SALES_EMP_YN);
        SBUxMethod.set("RE_ENTER_YN", data.RE_ENTER_YN);
        SBUxMethod.set("TO_YN", data.TO_YN);
        SBUxMethod.set("SITE_CODE", data.SITE_CODE);
        SBUxMethod.set("DEPT_CODE", data.DEPT_CODE);
        SBUxMethod.set("DEPT_NAME", data.DEPT_NAME);
        SBUxMethod.set("PARENT_DEPT", data.PARENT_DEPT);
        SBUxMethod.set("PARENT_DEPT_NAME", data.PARENT_DEPT_NAME);
        SBUxMethod.set("TAX_SITE_CODE", data.TAX_SITE_CODE);
        SBUxMethod.set("COST_DEPT_CODE", data.COST_DEPT_CODE);
        SBUxMethod.set("COST_DEPT_NAME", data.COST_DEPT_NAME);
        SBUxMethod.set("DEPT_CODE2", data.DEPT_CODE2);
        SBUxMethod.set("DEPT_NAME2", data.DEPT_NAME2);
        gfnma_multiSelectSet('#WORK_REGION', 'SUB_CODE', 'CODE_NAME', data.WORK_REGION);
        SBUxMethod.set("EMP_TYPE", data.EMP_TYPE);
        SBUxMethod.set("PARTNER_FIRM_EMP_YN", data.PARTNER_FIRM_EMP_YN);
        SBUxMethod.set("PARTNER_FIRM_CODE", data.PARTNER_FIRM_CODE);
        gfnma_multiSelectSet('#DUTY_CODE2', 'SUB_CODE', 'CODE_NAME', data.DUTY_CODE2);
        SBUxMethod.set("EMP_STATE", data.EMP_STATE);
        SBUxMethod.set("OLD_EMP_CODE", data.OLD_EMP_CODE);
        SBUxMethod.set("OLD_EMP_NAME", data.OLD_EMP_NAME);
        SBUxMethod.set("START_POSITION_CODE", data.START_POSITION_CODE);
        SBUxMethod.set("CAREER_TRACK", data.CAREER_TRACK);
        gfnma_multiSelectSet('#ENTER_TYPE', 'SUB_CODE', 'CODE_NAME', data.ENTER_TYPE);
        SBUxMethod.set("INTRODUCER_CODE", data.INTRODUCER_CODE);
        SBUxMethod.set("INTRODUCER_NAME", data.INTRODUCER_NAME);
        SBUxMethod.set("CAREER_DATE", data.CAREER_DATE);
        SBUxMethod.set("START_PAY_GRADE", data.START_PAY_GRADE);
        SBUxMethod.set("CAREER_TRACK_ENTER_DATE", data.CAREER_TRACK_ENTER_DATE);
        SBUxMethod.set("ENTER_DATE", data.ENTER_DATE);
        SBUxMethod.set("ANNUAL_INITIAL_DATE", data.ANNUAL_INITIAL_DATE);
        SBUxMethod.set("ANNUAL_BASE_DATE", data.ANNUAL_BASE_DATE);
        SBUxMethod.set("CURRENT_PAY_GRADE", data.CURRENT_PAY_GRADE);
        SBUxMethod.set("CURRENT_PAY_GRADE_DATE", data.CURRENT_PAY_GRADE_DATE);
        if(gfn_nvl(data.EMP_PHOTO_NAME) != "") {
            SBUxMethod.set("EMP_PHOTO_NAME", data.EMP_PHOTO_NAME);
            $("#EMP_PHOTO").attr("src", "/com/getFileImage.do?fkey="+data.EMP_PHOTO_NAME+"&comp_code="+gv_ma_selectedApcCd+"&client_code=" + gv_ma_selectedClntCd );
            $("#DIV_EMP_PHOTO").hide();
        }

        if(gfn_nvl(data.SIGN_IMG_NAME) != "") {
            SBUxMethod.set("SIGN_IMG_NAME", data.SIGN_IMG_NAME);
            $("#SIGN_IMG").attr("src", "/com/getFileImage.do?fkey="+data.SIGN_IMG_NAME+"&comp_code="+gv_ma_selectedApcCd+"&client_code=" + gv_ma_selectedClntCd );
            $("#DIV_SIGN_IMG").hide();
        }

        if(data.JOB_GROUP == '3') {
            $('#START_PAY_GRADE_TH').hide();
            $('#START_PAY_GRADE_TD').hide();
            $('#CAREER_TRACK_ENTER_DATE_TH').hide();
            $('#CAREER_TRACK_ENTER_DATE_TD').hide();
            $('#CURRENT_PAY_GRADE_TH').hide();
            $('#CURRENT_PAY_GRADE_TD').hide();
            $('#CURRENT_PAY_GRADE_DATE_TH').hide();
            $('#CURRENT_PAY_GRADE_DATE_TD').hide();
        } else {
            $('#START_PAY_GRADE_TH').show();
            $('#START_PAY_GRADE_TD').show();
            $('#CAREER_TRACK_ENTER_DATE_TH').show();
            $('#CAREER_TRACK_ENTER_DATE_TD').show();
            $('#CURRENT_PAY_GRADE_TH').show();
            $('#CURRENT_PAY_GRADE_TD').show();
            $('#CURRENT_PAY_GRADE_DATE_TH').show();
            $('#CURRENT_PAY_GRADE_DATE_TD').show();
        }
    }

    //상세정보 보기
    const fn_view = async function() {
        cfn_add();
        editType = "U";
        SBUxMethod.show('DISPLAY_SOCIAL_NUM');
        SBUxMethod.hide('SOCIAL_NUM');
        SBUxMethod.attr('EMP_CODE', 'readonly', 'true');
        SBUxMethod.attr('POSITION_CODE', 'readonly', 'true');
        SBUxMethod.attr('JOB_GROUP', 'readonly', 'true');
        SBUxMethod.attr('JOB_CODE', 'readonly', 'true');
        SBUxMethod.attr('DUTY_CODE', 'readonly', 'true');
        SBUxMethod.attr('JOB_RANK', 'readonly', 'true');
        SBUxMethod.attr('ENTER_TYPE', 'readonly', 'false');
        SBUxMethod.attr('EMP_TYPE', 'readonly', 'false');

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

        let SITE_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let EMP_STATE	    = gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let JOB_GROUP	    = gfnma_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let GENDER	        = gfnma_nvl(SBUxMethod.get("SRCH_GENDER"));
        let DEPT_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let ENTER_DATE_FR	    = gfnma_nvl(SBUxMethod.get("SRCH_ENTER_DATE_FR"));
        let ENTER_DATE_TO	    = gfnma_nvl(SBUxMethod.get("SRCH_ENTER_DATE_TO"));
        let INITIAL_DATE	= gfnma_nvl(SBUxMethod.get("SRCH_INITIAL_DATE"));


        var paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_DEPT_CODE      : DEPT_CODE
            ,V_P_EMP_CODE       : rowData.EMP_CODE
            ,V_P_EMP_STATE      : EMP_STATE
            ,V_P_JOB_GROUP      : JOB_GROUP
            ,V_P_GENDER         : GENDER
            ,IV_P_ENTER_DATE_FR : ENTER_DATE_FR
            ,IV_P_ENTER_DATE_TO : ENTER_DATE_TO
            ,V_P_EMP_CODE1      : ''
            ,V_P_INITIAL_DATE   : INITIAL_DATE
            ,V_P_EMP_STATE2     : ''
            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        };

        const postJsonPromiseForMaster = gfn_postJSON("/hr/hri/hri/selectHri1000List.do", {
            getType				: 'json',
            workType			: 'MASTER',
            cv_count			: '39',
            params				: gfnma_objectToString(paramObj)
        });

        const postJsonPromiseForDetail = gfn_postJSON("/hr/hri/hri/selectHri1000List.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '39',
            params				: gfnma_objectToString(paramObj)
        });

        const masterData = await postJsonPromiseForMaster;
        const detailData = await postJsonPromiseForDetail;

        try {
            if (_.isEqual("S", masterData.resultStatus)) {

                // master 정보
                fn_setMasterData(masterData.cv_2[0]);
            } else {
                alert(data.resultMessage);
            }

            if (_.isEqual("S", detailData.resultStatus)) {

                // detail 정보
                // 기본인적사항
                fn_setTpgMasterSub(detailData.cv_3[0]);

                // 주거/생활/신체
                fn_setTpgMasterSubDetail(detailData.cv_4[0]);

                // 가족사항
                detailData.cv_5.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        NAME : item.NAME,
                        RELATION : item.RELATION,
                        SOCIAL_NO_REAL : item.SOCIAL_NO_REAL,
                        SOCIAL_NO : item.SOCIAL_NO,
                        BIRTHDAY : item.BIRTHDAY,
                        BIRTHDAY_TYPE : item.BIRTHDAY_TYPE,
                        LEAP_MONTH_YN : item.LEAP_MONTH_YN,
                        SCHOOL_TYPE : item.SCHOOL_TYPE,
                        ZIP_CODE : item.ZIP_CODE,
                        ADDRESS : item.ADDRESS,
                        SUPPORT_YN : item.SUPPORT_YN,
                        WH_TAX_YN : item.WH_TAX_YN,
                        YEARTAX_YN : item.YEARTAX_YN,
                        YEARTAX_RELATION : item.YEARTAX_RELATION,
                        FOREIGNER_YN : item.FOREIGNER_YN,
                        HANDICAP_YN : item.HANDICAP_YN,
                        LIVE_TOGETHER_YN : item.LIVE_TOGETHER_YN,
                        JOB : item.JOB,
                        TEL : item.TEL,
                        LIFE_YN : item.LIFE_YN,
                        HEALTH_INSURE_YN : item.HEALTH_INSURE_YN,
                        MEMO : item.MEMO,
                        START_DATE : item.START_DATE,
                        END_DATE : item.END_DATE
                    }
                    jsonFamilyList.push(msg);
                });

                gvwFamily.rebuild();

                // 학력사항
                detailData.cv_6.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        SCHOOL_TYPE : item.SCHOOL_TYPE,
                        MANAGE_CODE : item.MANAGE_CODE,
                        SCHOOL_NAME : item.SCHOOL_NAME,
                        CAMPUS_BRANCH_TYPE : item.CAMPUS_BRANCH_TYPE,
                        DAY_NIGHT_TYPE : item.DAY_NIGHT_TYPE,
                        MAJOR : item.MAJOR,
                        GRADUATE_TYPE : item.GRADUATE_TYPE,
                        LAST_SCHOOL_YN : item.LAST_SCHOOL_YN,
                        COMPLE_POINT : item.COMPLE_POINT,
                        GPA_POINT : item.GPA_POINT,
                        INTO_DATE : item.INTO_DATE,
                        GRADUATE_DATE : item.GRADUATE_DATE,
                        AFTER_ENTER_YN : item.AFTER_ENTER_YN,
                        MEMO : item.MEMO
                    }
                    jsonSchoolList.push(msg);
                });

                gvwSchool.rebuild();

                // 경력사항
                detailData.cv_7.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        CAREER_TYPE : item.CAREER_TYPE,
                        START_DATE : item.START_DATE,
                        END_DATE : item.END_DATE,
                        CAREER_YEAR : item.CAREER_YEAR,
                        CAREER_MONTH : item.CAREER_MONTH,
                        COMP_NAME : item.COMP_NAME,
                        DEPT_NAME : item.DEPT_NAME,
                        POSITION : item.POSITION,
                        JOB : item.JOB,
                        WORK : item.WORK,
                        REGION_CODE : item.REGION_CODE,
                        RETIRE_MEMO : item.RETIRE_MEMO,
                        MEMO : item.MEMO,
                        SALARY_LEVEL : item.SALARY_LEVEL
                    }
                    jsonCareerList.push(msg);
                });

                gvwCareer.rebuild();

                // 자격사항
                detailData.cv_8.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        LICENSE_CATEGORY : item.LICENSE_CATEGORY,
                        LICENSE_CODE : item.LICENSE_CODE,
                        LICENSE_GRADE : item.LICENSE_GRADE,
                        LICENSE_NUM : item.LICENSE_NUM,
                        LICENSE_NAME : item.LICENSE_NAME,
                        ISSUE_INSTITUTE : item.ISSUE_INSTITUTE,
                        ISSUE_DATE : item.ISSUE_DATE,
                        RENEW_DATE : item.RENEW_DATE,
                        LICENSE_WAGES_AMT : item.LICENSE_WAGES_AMT,
                        APPOINT_YN : item.APPOINT_YN,
                        APPOINT_DEPT_CODE : item.APPOINT_DEPT_CODE,
                        APPOINT_START_DATE : item.APPOINT_START_DATE,
                        APPOINT_END_DATE : item.APPOINT_END_DATE,
                        MEMO : item.MEMO,
                        PAY_YN : item.PAY_YN
                    }
                    jsonLicenseList.push(msg);
                });

                gvwLicense.rebuild();

                // 어학사항
                detailData.cv_9.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        TEST_TYPE : item.TEST_TYPE,
                        TEST_DATE : item.TEST_DATE,
                        AVAILABLE_DATE : item.AVAILABLE_DATE,
                        ISSUE_INSTITUTION : item.ISSUE_INSTITUTION,
                        TOTAL_SCORE : item.TOTAL_SCORE,
                        SCORE1 : item.SCORE1,
                        SCORE2 : item.SCORE2,
                        SCORE3 : item.SCORE3,
                        SCORE4 : item.SCORE4,
                        TEST_LEVEL : item.TEST_LEVEL,
                        MEMO : item.MEMO
                    }
                    jsonLanguageList.push(msg);
                });

                gvwLanguage.rebuild();

                // 컴퓨터활용능력
                detailData.cv_10.forEach((item, index) => {
                    const msg = {
                        EMP_CODE           : item.EMP_CODE
                        ,EMP_NAME           : item.EMP_NAME
                        ,PARENT_DEPT_NAME   : item.PARENT_DEPT_NAME
                        ,DEPT_NAME          : item.DEPT_NAME
                        ,POSITION_CODE      : item.POSITION_CODE
                        ,DUTY_CODE          : item.DUTY_CODE
                        ,EMP_STATE          : item.EMP_STATE
                        ,ENTER_DATE         : item.ENTER_DATE
                        ,RETIRE_DATE        : item.RETIRE_DATE
                    }
                    jsonComputerSkillList.push(msg);
                });

                gvwComputerSkill.rebuild();

                // 인사파일
                detailData.cv_11.forEach((item, index) => {
                    const msg = {
                        EMP_CODE : item.EMP_CODE,
                        SEQ : item.SEQ,
                        OA_NAME : item.OA_NAME,
                        OA_SKILL_LEVEL : item.OA_SKILL_LEVEL,
                        MEMO : item.MEMO
                    }
                    jsonEmpTotalList.push(msg);
                });

                // 병역사항
                fn_setTpgMasterSubDetail2(detailData.cv_13[0]);

                // 보훈사항
                fn_setTpgMasterSubDetail3(detailData.cv_14[0]);

                // 보증보험
                fn_setTpgMasterSubDetail4(detailData.cv_15[0]);

                // 상벌사항
                detailData.cv_16.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        PRIZE_TYPE : item.PRIZE_TYPE,
                        PRIZE_DATE : item.PRIZE_DATE,
                        PRIZE_CATEGORY : item.PRIZE_CATEGORY,
                        PRIZE_INOUT_TYPE : item.PRIZE_INOUT_TYPE,
                        PRIZE_TARGET : item.PRIZE_TARGET,
                        PRIZE_NAME : item.PRIZE_NAME,
                        PRIZE_REASON : item.PRIZE_REASON,
                        PRIZE_DETAIL : item.PRIZE_DETAIL,
                        PRIZE_MAKER : item.PRIZE_MAKER,
                        PUNISH_START_DATE : item.PUNISH_START_DATE,
                        PUNISH_END_DATE : item.PUNISH_END_DATE,
                        APPLY_PAY_YN : item.APPLY_PAY_YN,
                        BASE_PAY_DOWN_RATE : item.BASE_PAY_DOWN_RATE,
                        BONUS_PAY_DOWN_RATE : item.BONUS_PAY_DOWN_RATE
                    }
                    jsonPrizeList.push(msg);
                });

                gvwPrize.rebuild();

                // 건강검진내역
                detailData.cv_17.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        CHECK_TYPE : item.CHECK_TYPE,
                        CHECK_DATE : item.CHECK_DATE,
                        CHECK_INSTITUTE : item.CHECK_INSTITUTE,
                        RESULT : item.RESULT,
                        COMPANY_RESULT : item.COMPANY_RESULT,
                        MEMO : item.MEMO
                    }
                    jsonHealthList.push(msg);
                });

                gvwHealth.rebuild();

                // 발령사항
                detailData.cv_18.forEach((item, index) => {
                    const msg = {
                        APPOINT_NUM : item.APPOINT_NUM,
                        APPOINT_DATE : item.APPOINT_DATE,
                        START_DATE : item.START_DATE,
                        END_DATE : item.END_DATE,
                        APPOINT_NAME : item.APPOINT_NAME,
                        APPOINT_TITLE : item.APPOINT_TITLE,
                        DEPT_NAME2 : item.DEPT_NAME2,
                        POSITION_NAME2 : item.POSITION_NAME2,
                        DUTY_NAME2 : item.DUTY_NAME2,
                        JOB_RANK_NAME2 : item.JOB_RANK_NAME2,
                        JOB_FAMILY_NAME2 : item.JOB_FAMILY_NAME2,
                        JOB_NAME2 : item.JOB_NAME2,
                        REGION_NAME2 : item.REGION_NAME2,
                        APPOINT_REASON : item.APPOINT_REASON,
                        MEMO : item.MEMO
                    }
                    jsonAppointmentList.push(msg);
                });

                gvwAppointment.rebuild();

                // 겸직부서
                detailData.cv_37.forEach((item, index) => {
                    const msg = {
                        APPOINT_NUM : item.APPOINT_NUM,
                        START_DATE : item.START_DATE,
                        END_DATE : item.END_DATE,
                        DEPT_CODE : item.DEPT_CODE,
                        POSITION_CODE : item.POSITION_CODE,
                        DUTY_CODE : item.DUTY_CODE,
                        JOB_RANK : item.JOB_RANK
                    }
                    jsonAddJobList.push(msg);
                });

                gvwAddJob.rebuild();

                // 휴직이력
                detailData.cv_19.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        TIME_OFF_TYPE : item.TIME_OFF_TYPE,
                        START_DATE : item.START_DATE,
                        END_DATE : item.END_DATE,
                        TIME_OFF_CNT : item.TIME_OFF_CNT,
                        SITE_CODE : item.SITE_CODE,
                        DEPT_CODE : item.DEPT_CODE,
                        DEPT_NAME : item.DEPT_NAME,
                        MEMO : item.MEMO
                    }
                    jsonTimeOffHistoryList.push(msg);
                });

                gvwTimeOffHistory.rebuild();

                // 단체보험
                detailData.cv_20.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        GROUP_INSURE_CODE : item.GROUP_INSURE_CODE,
                        INSURE_NUM : item.INSURE_NUM,
                        INSURE_START_DATE : item.INSURE_START_DATE,
                        INSURE_DUE_DATE : item.INSURE_DUE_DATE,
                        INSURE_END_DATE : item.INSURE_END_DATE,
                        GROUP_INSURE_AMT : item.GROUP_INSURE_AMT,
                        MEMO : item.MEMO
                    }
                    jsonGroupInsuranceList.push(msg);
                });

                gvwGroupInsurance.rebuild();

                // 상해/질병정보
                detailData.cv_21.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        DISEASE_TYPE : item.DISEASE_TYPE,
                        DISEASE_REASON : item.DISEASE_REASON,
                        DISEASE_START_DATE : item.DISEASE_START_DATE,
                        SICK_LEAVE_REQUEST_YN : item.SICK_LEAVE_REQUEST_YN,
                        SICK_LEAVE_CHARGE_DATE_FR : item.SICK_LEAVE_CHARGE_DATE_FR,
                        SICK_LEAVE_CHARGE_DATE_TO : item.SICK_LEAVE_CHARGE_DATE_TO,
                        SICK_LEAVE_FREE_DATE_FR : item.SICK_LEAVE_FREE_DATE_FR,
                        SICK_LEAVE_FREE_DATE_TO : item.SICK_LEAVE_FREE_DATE_TO,
                        GROUP_INSURE_REQUEST_YN : item.GROUP_INSURE_REQUEST_YN,
                        MEMO : item.MEMO
                    }
                    jsonDiseaseList.push(msg);
                });

                gvwDisease.rebuild();

                // 평가항목
                detailData.cv_22.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        EVAL_YEAR : item.EVAL_YEAR,
                        POSITION_CODE : item.POSITION_CODE,
                        EVAL_KPI_GRADE : item.EVAL_KPI_GRADE,
                        EVAL_KBI_GRADE : item.EVAL_KBI_GRADE,
                        MEMO : item.MEMO
                    }
                    jsonPersonnelEvaluationList.push(msg);
                });

                gvwPersonnelEvaluation.rebuild();

                // 공상발생
                detailData.cv_23.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        OFFICIAL_INJURY_START_DATE : item.OFFICIAL_INJURY_START_DATE,
                        OFFICIAL_INJURY_DESCR : item.OFFICIAL_INJURY_DESCR,
                        MEMO : item.MEMO,
                    }
                    jsonOfficialInjuryList.push(msg);
                });

                gvwOfficialInjury.rebuild();

                // 계약차수
                detailData.cv_35.forEach((item, index) => {
                    const msg = {
                        CONTRACT_DEGREE : item.CONTRACT_DEGREE,
                        CONTRACT_START_DATE : item.CONTRACT_START_DATE,
                        CONTRACT_END_DATE : item.CONTRACT_END_DATE,
                        CONTRACT_CHANGE_MEMO : item.CONTRACT_CHANGE_MEMO,
                        MEMO : item.MEMO,
                        CONTRACT_DAY : item.CONTRACT_DAY
                    }
                    jsonContractDegList.push(msg);
                });

                gvwContractDeg.rebuild();

                // 근무계획
                detailData.cv_38.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        WORKPLAN_TYPE : item.WORKPLAN_TYPE,
                        START_DATE : item.START_DATE,
                        END_DATE : item.END_DATE
                    }
                    jsonWorkPlanList.push(msg);
                });

                gvwWorkPlan.rebuild();

                // 근무조
                detailData.cv_39.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        DEPT_CODE : item.DEPT_CODE,
                        DEPT_NAME : item.DEPT_NAME,
                        EMP_CODE : item.EMP_CODE,
                        EMP_NAME : item.EMP_NAME,
                        POSITION_CODE : item.POSITION_CODE,
                        DUTY_CODE : item.DUTY_CODE,
                        JOB_RANK : item.JOB_RANK,
                        ENTER_DATE : item.ENTER_DATE,
                        RETIRE_DATE : item.RETIRE_DATE,
                        EMP_STATE : item.EMP_STATE,
                        MEMO : item.MEMO,
                        START_DATE : item.START_DATE,
                        END_DATE : item.END_DATE,
                        TXN_ID : item.TXN_ID,
                        EMP_BASE_FLAG : item.EMP_BASE_FLAG,
                        WORK_PATTERN_CODE : item.WORK_PATTERN_CODE,
                        SORT_SEQ : item.SORT_SEQ
                    }
                    jsonEmpList.push(msg);
                });

                gvwEmp.rebuild();

                // 경조사비
                detailData.cv_24.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        NAME : item.NAME,
                        RELATION : item.RELATION,
                        WELFARE_CODE : item.WELFARE_CODE,
                        WELFARE_TYPE : item.WELFARE_TYPE,
                        WELFARE_DATE : item.WELFARE_DATE,
                        REQUEST_YM : item.REQUEST_YM,
                        REQUEST_EVIDENCE : item.REQUEST_EVIDENCE,
                        WELFARE_AMOUNT : item.WELFARE_AMOUNT,
                        DESCRIPTION : item.DESCRIPTION
                    }
                    jsonExpenditurewelfareList.push(msg);
                });

                gvwExpenditurewelfare.rebuild();

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

    const getParamForHri1000S = async function() {
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE"));
        let EMP_NAME = gfnma_nvl(SBUxMethod.get("EMP_NAME"));
        let EMP_NAME_CHN = gfnma_nvl(SBUxMethod.get("EMP_NAME_CHN"));
        let EMP_NAME_ENG = gfnma_nvl(SBUxMethod.get("EMP_NAME_ENG"));
        let SOCIAL_NUM = gfnma_nvl(SBUxMethod.get("SOCIAL_NUM"));
        let BIRTHDAY = gfnma_nvl(SBUxMethod.get("BIRTHDAY"));
        let BIRTHDAY_TYPE = gfnma_nvl(SBUxMethod.get("BIRTHDAY_TYPE"));
        let LEAP_MONTH_YN = gfnma_nvl(SBUxMethod.get("LEAP_MONTH_YN"));
        let GENDER = gfnma_nvl(SBUxMethod.get("GENDER"));
        let FAMILY_CLAN = gfnma_nvl(SBUxMethod.get("FAMILY_CLAN"));
        let FOREIGNER_YN = gfnma_nvl(SBUxMethod.get("FOREIGNER_YN"));
        let FAMILY_OWNER_YN = gfnma_nvl(SBUxMethod.get("FAMILY_OWNER_YN"));
        let GROUP_ENTER_DATE = gfnma_nvl(SBUxMethod.get("GROUP_ENTER_DATE"));
        let ENTER_DATE = gfnma_nvl(SBUxMethod.get("ENTER_DATE"));
        let ENTER_TYPE = gfnma_nvl(gfnma_multiSelectGet('#ENTER_TYPE'));
        let POSITION_CODE = gfnma_nvl(SBUxMethod.get("POSITION_CODE"));
        let DUTY_CODE = gfnma_nvl(gfnma_multiSelectGet('#DUTY_CODE'));
        let JOB_FAMILY = gfnma_nvl(SBUxMethod.get("JOB_FAMILY"));
        let JOB_GROUP = gfnma_nvl(SBUxMethod.get("JOB_GROUP"));
        let JOB_RANK = gfnma_nvl(SBUxMethod.get("JOB_RANK"));
        let JOB_CODE = gfnma_nvl(gfnma_multiSelectGet('#JOB_CODE'));
        let LABOR_COST_GROUP = gfnma_nvl(gfnma_multiSelectGet('#LABOR_COST_GROUP'));
        let COST_DEPT_CODE = gfnma_nvl(SBUxMethod.get("COST_DEPT_CODE"));
        let TIME_CHECK_YN = gfnma_nvl(SBUxMethod.get("TIME_CHECK_YN"));
        let EMP_TYPE = gfnma_nvl(SBUxMethod.get("EMP_TYPE"));
        let EMP_STATE = gfnma_nvl(SBUxMethod.get("EMP_STATE"));
        let SALARY_CLASS = gfnma_nvl(SBUxMethod.get("SALARY_CLASS"));
        let SITE_CODE = gfnma_nvl(SBUxMethod.get("SITE_CODE"));
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("DEPT_CODE"));
        let SALES_EMP_YN = gfnma_nvl(SBUxMethod.get("SALES_EMP_YN"));
        let TAX_SITE_CODE = gfnma_nvl(SBUxMethod.get("TAX_SITE_CODE"));
        let NATION_CODE = gfnma_nvl(SBUxMethod.get("NATION_CODE"));
        let REGISTER_ZIP_CODE = gfnma_nvl(SBUxMethod.get("REGISTER_ZIP_CODE"));
        let REGISTER_ADDRESS = gfnma_nvl(SBUxMethod.get("REGISTER_ADDRESS"));
        let RESIDENCE_ZIP_CODE = gfnma_nvl(SBUxMethod.get("RESIDENCE_ZIP_CODE"));
        let RESIDENCE_ADDRESS = gfnma_nvl(SBUxMethod.get("RESIDENCE_ADDRESS"));
        let OFFICE_TEL_NUM = gfnma_nvl(SBUxMethod.get("OFFICE_TEL_NUM"));
        let FAX_NUM = gfnma_nvl(SBUxMethod.get("FAX_NUM"));
        let INTER_PHONE = gfnma_nvl(SBUxMethod.get("INTER_PHONE"));
        let CELLPHONE_NUM = gfnma_nvl(SBUxMethod.get("CELLPHONE_NUM"));
        let HOME_TEL_NUM = gfnma_nvl(SBUxMethod.get("HOME_TEL_NUM"));
        let IN_EMAIL = gfnma_nvl(SBUxMethod.get("IN_EMAIL"));
        let OUT_EMAIL = gfnma_nvl(SBUxMethod.get("OUT_EMAIL"));
        let TEMP_END_DATE = gfnma_nvl(SBUxMethod.get("TEMP_END_DATE"));
        let BONUS_APPLY_START_DATE = gfnma_nvl(SBUxMethod.get("BONUS_APPLY_START_DATE"));
        let UNION_JOIN_YN = gfnma_nvl(SBUxMethod.get("UNION_JOIN_YN"));
        let UNION_JOIN_START_DATE = gfnma_nvl(SBUxMethod.get("UNION_JOIN_START_DATE"));
        let UNION_JOIN_END_DATE = gfnma_nvl(SBUxMethod.get("UNION_JOIN_END_DATE"));
        let RETIRE_DATE = gfnma_nvl(SBUxMethod.get("RETIRE_DATE"));
        let RETIRE_REASON = gfnma_nvl(SBUxMethod.get("RETIRE_REASON"));
        let RETIRE_IN_REASON = gfnma_nvl(SBUxMethod.get("RETIRE_IN_REASON"));
        let RETIRE_INITIAL_DATE = gfnma_nvl(SBUxMethod.get("RETIRE_INITIAL_DATE"));
        let RETIRE_PENSION_JOIN_YN = gfnma_nvl(SBUxMethod.get("RETIRE_PENSION_JOIN_YN"));
        let CAREER_DATE = gfnma_nvl(SBUxMethod.get("CAREER_DATE"));
        let PREMATURE_DATE = gfnma_nvl(SBUxMethod.get("PREMATURE_DATE"));
        let WORK_REGION = gfnma_nvl(gfnma_multiSelectGet('#WORK_REGION'));
        let EMP_MEMO = gfnma_nvl(SBUxMethod.get("EMP_MEMO"));
        let TELEWORKING_YN = gfnma_nvl(SBUxMethod.get("TELEWORKING_YN"));
        let TELEWORKING_ADDRESS = gfnma_nvl(SBUxMethod.get("TELEWORKING_ADDRESS"));
        let ORDER_SEQ = gfnma_nvl(SBUxMethod.get("ORDER_SEQ"));
        let EMP_PHOTO_PATH = gfnma_nvl(SBUxMethod.get("EMP_PHOTO_PATH"));
        let EMP_PHOTO_NAME = gfnma_nvl(SBUxMethod.get("EMP_PHOTO_NAME"));
        let SIGN_IMG_PATH = gfnma_nvl(SBUxMethod.get("SIGN_IMG_PATH"));
        let SIGN_IMG_NAME = gfnma_nvl(SBUxMethod.get("SIGN_IMG_NAME"));
        let START_POSITION_CODE = gfnma_nvl(SBUxMethod.get("START_POSITION_CODE"));
        let CAREER_TRACK = gfnma_nvl(SBUxMethod.get("CAREER_TRACK"));
        let BOARD_DIRECTOR_YN = gfnma_nvl(SBUxMethod.get("BOARD_DIRECTOR_YN"));
        let INTRODUCER_CODE = gfnma_nvl(SBUxMethod.get("INTRODUCER_CODE"));
        let RE_ENTER_YN = gfnma_nvl(SBUxMethod.get("RE_ENTER_YN"));
        let ANNUAL_INITIAL_DATE = gfnma_nvl(SBUxMethod.get("ANNUAL_INITIAL_DATE"));
        let PARTNER_FIRM_EMP_YN = gfnma_nvl(SBUxMethod.get("PARTNER_FIRM_EMP_YN"));
        let PARTNER_FIRM_CODE = gfnma_nvl(SBUxMethod.get("PARTNER_FIRM_CODE"));
        let SOCIAL_NUM_DATE = gfnma_nvl(SBUxMethod.get("SOCIAL_NUM_DATE"));
        let SALARY_LEVEL = gfnma_nvl(SBUxMethod.get("SALARY_LEVEL"));
        let FAMILY_REGISTER_ZIP_CODE = gfnma_nvl(SBUxMethod.get("FAMILY_REGISTER_ZIP_CODE"));
        let FAMILY_REGISTER_ADDRESS = gfnma_nvl(SBUxMethod.get("FAMILY_REGISTER_ADDRESS"));
        let EMERGENCY_ZIP_CODE = gfnma_nvl(SBUxMethod.get("EMERGENCY_ZIP_CODE"));
        let EMERGENCY_ADDRESS = gfnma_nvl(SBUxMethod.get("EMERGENCY_ADDRESS"));
        let EMERGENCY_TEL_NUM = gfnma_nvl(SBUxMethod.get("EMERGENCY_TEL_NUM"));
        let OLD_EMP_CODE = gfnma_nvl(SBUxMethod.get("OLD_EMP_CODE"));
        let COMP_ENTER_DATE = gfnma_nvl(SBUxMethod.get("COMP_ENTER_DATE"));
        let PROMOTION_BASE_DATE = gfnma_nvl(SBUxMethod.get("PROMOTION_BASE_DATE"));
        let RETIRE_BASE_DATE = gfnma_nvl(SBUxMethod.get("RETIRE_BASE_DATE"));
        let RET_RENS_ST_DAT = gfnma_nvl(SBUxMethod.get("RET_RENS_ST_DAT"));
        let ANNUAL_BASE_DATE = gfnma_nvl(SBUxMethod.get("ANNUAL_BASE_DATE"));
        let AGREE_DATE = gfnma_nvl(SBUxMethod.get("AGREE_DATE"));
        let AGREE_YN = gfnma_nvl(SBUxMethod.get("AGREE_YN"));
        let START_PAY_GRADE = gfnma_nvl(SBUxMethod.get("START_PAY_GRADE"));
        let JOB_SUB_CODE = gfnma_nvl(gfnma_multiSelectGet('#JOB_SUB_CODE'));
        let JOB_DETAIL_CODE = gfnma_nvl(gfnma_multiSelectGet('#JOB_DETAIL_CODE'));
        let TO_YN = gfnma_nvl(SBUxMethod.get("TO_YN"));

        return {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_NAME : EMP_NAME,
            V_P_EMP_NAME_CHN : EMP_NAME_CHN,
            V_P_EMP_NAME_ENG : EMP_NAME_ENG,
            V_P_SOCIAL_NUM : SOCIAL_NUM,
            V_P_BIRTHDAY : BIRTHDAY,
            V_P_BIRTHDAY_TYPE : BIRTHDAY_TYPE,
            V_P_LEAP_MONTH_YN : LEAP_MONTH_YN.LEAP_MONTH_YN,
            V_P_GENDER : GENDER,
            V_P_FAMILY_CLAN : FAMILY_CLAN,
            V_P_FOREIGNER_YN : FOREIGNER_YN.FOREIGNER_YN,
            V_P_FAMILY_OWNER_YN : FAMILY_OWNER_YN.FAMILY_OWNER_YN,
            V_P_GROUP_ENTER_DATE : GROUP_ENTER_DATE,
            V_P_ENTER_DATE : ENTER_DATE,
            V_P_ENTER_TYPE : ENTER_TYPE,
            V_P_POSITION_CODE : POSITION_CODE,
            V_P_DUTY_CODE : DUTY_CODE,
            V_P_JOB_FAMILY : JOB_FAMILY,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_JOB_RANK : JOB_RANK,
            V_P_JOB_CODE : JOB_CODE,
            V_P_LABOR_COST_GROUP : LABOR_COST_GROUP,
            V_P_COST_DEPT_CODE : COST_DEPT_CODE,
            V_P_TIME_CHECK_YN : TIME_CHECK_YN,
            V_P_EMP_TYPE : EMP_TYPE,
            V_P_EMP_STATE : EMP_STATE,
            V_P_SALARY_CLASS : SALARY_CLASS,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_SALES_EMP_YN : SALES_EMP_YN.SALES_EMP_YN,
            V_P_TAX_SITE_CODE : TAX_SITE_CODE,
            V_P_NATION_CODE : NATION_CODE,
            V_P_REGISTER_ZIP_CODE : REGISTER_ZIP_CODE,
            V_P_REGISTER_ADDRESS : REGISTER_ADDRESS,
            V_P_RESIDENCE_ZIP_CODE : RESIDENCE_ZIP_CODE,
            V_P_RESIDENCE_ADDRESS : RESIDENCE_ADDRESS,
            V_P_OFFICE_TEL_NUM : OFFICE_TEL_NUM,
            V_P_FAX_NUM : FAX_NUM,
            V_P_INTER_PHONE : INTER_PHONE,
            V_P_CELLPHONE_NUM : CELLPHONE_NUM,
            V_P_HOME_TEL_NUM : HOME_TEL_NUM,
            V_P_IN_EMAIL : IN_EMAIL,
            V_P_OUT_EMAIL : OUT_EMAIL,
            V_P_TEMP_END_DATE : TEMP_END_DATE,
            V_P_BONUS_APPLY_START_DATE : BONUS_APPLY_START_DATE,
            V_P_UNION_JOIN_YN : UNION_JOIN_YN.UNION_JOIN_YN,
            V_P_UNION_JOIN_START_DATE : UNION_JOIN_START_DATE,
            V_P_UNION_JOIN_END_DATE : UNION_JOIN_END_DATE,
            V_P_RETIRE_DATE : RETIRE_DATE,
            V_P_RETIRE_REASON : RETIRE_REASON,
            V_P_RETIRE_IN_REASON : RETIRE_IN_REASON,
            V_P_RETIRE_INITIAL_DATE : RETIRE_INITIAL_DATE,
            V_P_RETIRE_PENSION_JOIN_YN : RETIRE_PENSION_JOIN_YN.RETIRE_PENSION_JOIN_YN,
            V_P_CAREER_DATE : CAREER_DATE,
            V_P_PREMATURE_DATE : PREMATURE_DATE,
            V_P_WORK_REGION : WORK_REGION,
            V_P_EMP_MEMO : EMP_MEMO,
            V_P_TELEWORKING_YN : TELEWORKING_YN.TELEWORKING_YN,
            V_P_TELEWORKING_ADDRESS : TELEWORKING_ADDRESS,
            V_P_ORDER_SEQ : ORDER_SEQ,
            V_P_EMP_PHOTO_PATH : EMP_PHOTO_PATH,
            V_P_EMP_PHOTO_NAME : EMP_PHOTO_NAME,
            V_P_SIGN_IMG_PATH : SIGN_IMG_PATH,
            V_P_SIGN_IMG_NAME : SIGN_IMG_NAME,
            V_P_START_POSITION_CODE : START_POSITION_CODE,
            V_P_CAREER_TRACK : CAREER_TRACK,
            V_P_BOARD_DIRECTOR_YN : BOARD_DIRECTOR_YN.BOARD_DIRECTOR_YN,
            V_P_INTRODUCER_CODE : INTRODUCER_CODE,
            V_P_RE_ENTER_YN : RE_ENTER_YN.RE_ENTER_YN,
            V_P_ANNUAL_INITIAL_DATE : ANNUAL_INITIAL_DATE,
            V_P_PARTNER_FIRM_EMP_YN : PARTNER_FIRM_EMP_YN.PARTNER_FIRM_EMP_YN,
            V_P_PARTNER_FIRM_CODE : PARTNER_FIRM_CODE,
            V_P_SOCIAL_NUM_DATE : SOCIAL_NUM_DATE,
            V_P_SALARY_LEVEL : SALARY_LEVEL,
            V_P_FAMILY_REGISTER_ZIP_CODE : FAMILY_REGISTER_ZIP_CODE,
            V_P_FAMILY_REGISTER_ADDRESS : FAMILY_REGISTER_ADDRESS,
            V_P_EMERGENCY_ZIP_CODE : EMERGENCY_ZIP_CODE,
            V_P_EMERGENCY_ADDRESS : EMERGENCY_ADDRESS,
            V_P_EMERGENCY_TEL_NUM : EMERGENCY_TEL_NUM,
            V_P_OLD_EMP_CODE : OLD_EMP_CODE,
            V_P_COMP_ENTER_DATE : COMP_ENTER_DATE,
            V_P_PROMOTION_BASE_DATE : PROMOTION_BASE_DATE,
            V_P_RETIRE_BASE_DATE : RETIRE_BASE_DATE,
            V_P_RET_RENS_ST_DAT : RET_RENS_ST_DAT,
            V_P_ANNUAL_BASE_DATE : ANNUAL_BASE_DATE,
            V_P_AGREE_DATE : AGREE_DATE,
            V_P_AGREE_YN : AGREE_YN.AGREE_YN,
            V_P_START_PAY_GRADE : START_PAY_GRADE,
            V_P_JOB_SUB_CODE : JOB_SUB_CODE,
            V_P_JOB_DETAIL_CODE : JOB_DETAIL_CODE,
            V_P_TO_YN : TO_YN.TO_YN,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        }
    }

    const fn_imgUpload = async function(empCd, file, type) {
        var paramData 	= new FormData();
        paramData.append("files", 			file);
        paramData.append("type", 			type);		// 1:사진 , 2:싸인
        paramData.append("empCode", 		empCd);
        paramData.append("comp_code", 		gv_ma_selectedApcCd);
        paramData.append("client_code", 	gv_ma_selectedClntCd);
        paramData.append("formID", 			p_formId);
        paramData.append("menuId", 			p_menuId);

        const postJsonPromise = gfn_postFormData("/com/hrImageUpload.do", paramData);
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(type == "1") {
                    SBUxMethod.set("EMP_PHOTO_NAME", data.imgKey);
                    SBUxMethod.set("EMP_PHOTO_PATH", data.params[6]);
                    $("#EMP_PHOTO").attr("src", "/com/getFileImage.do?fkey="+data.imgKey+"&comp_code="+gv_ma_selectedApcCd+"&client_code=" + gv_ma_selectedClntCd );
                    $("#DIV_EMP_PHOTO").hide();
                } else if(type == "2") {
                    SBUxMethod.set("SIGN_IMG_NAME", data.imgKey);
                    SBUxMethod.set("SIGN_IMG_PATH", data.params[6]);
                    $("#SIGN_IMG").attr("src", "/com/getFileImage.do?fkey="+data.imgKey+"&comp_code="+gv_ma_selectedApcCd+"&client_code=" + gv_ma_selectedClntCd );
                    $("#DIV_SIGN_IMG").hide();
                }
                console.log('result =====>>>>>>>', data);
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

        //이미지(사진,싸인) 보여줄때
        // <img src="/com/getFileImage.do?fkey=fdf31133e11545f0b2f0ada67efcd5e8.png&comp_code=8888&client_code=100" />

    }

    const fn_print = async function(strview_type) {
        // TODO : 레포트 개발 필요
        const param = [];
        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHK_YN"), true);

        if (gvwListCheckedList.length < 1) {
            gfn_comAlert("E0000", "사원을 선택해주세요.");
            return;
        }

        var reportFilePath = await gfnma_findReportFilePath("R_PERSON");

        for(var i = 0; i < gvwListCheckedList.length; i++) {
            var paramObj = {
                V_P_DEBUG_MODE_YN	: ''
                ,V_P_LANG_ID		: ''
                ,V_P_COMP_CODE		: gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
                ,V_P_SITE_CODE      : ''
                ,V_P_DEPT_CODE      : ''
                ,V_P_EMP_CODE       : gfn_nvl(gvwList.getCellData(gvwListCheckedList[i], gvwList.getColRef("EMP_CODE")))
                ,V_P_EMP_STATE      : ''
                ,V_P_JOB_GROUP      : ''
                ,V_P_GENDER         : ''
                ,IV_P_ENTER_DATE_FR : ''
                ,IV_P_ENTER_DATE_TO : ''
                ,V_P_EMP_CODE1      : ''
                ,V_P_INITIAL_DATE   : ''
                ,V_P_EMP_STATE2     : ''
                ,V_P_FORM_ID		: p_formId
                ,V_P_MENU_ID		: p_menuId
                ,V_P_PROC_ID		: ''
                ,V_P_USERID			: ''
                ,V_P_PC				: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1000List.do", {
                getType				: 'json',
                workType			: 'REPORT',
                cv_count			: '39',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;
            console.log('data:', data);
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    param.push()

                    var keys = Object.keys(data);
                    for (var i=0; i<keys.length; i++) {
                        if(keys[i].indexOf("cv_") > -1) {
                            param.forEach((item) => {
                                item.data.root.hasOwnProperty(keys[i])
                            })

                            param.push({data: {root: json[keys[i]]}})
                        }
                    }

                    console.log(data)
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

        console.log(param);

        gfn_popClipReportPost(
            "인사기록카드",
            reportFilePath,
            null,
            param
        );
        /*        SBUxMethod.attr('modal-comPopHri1000Report', 'header-title', '인사기록카드 출력');
                SBUxMethod.openModal('modal-comPopHri1000Report');

                comPopHri1000Report({
                    height			: '400px'
                    ,callbackEvent	: async function (data) {
                        $.extend(param, data);

                        var emp_codes = param["EMP_CODE_LIST"].split('|');

                        for (var k = 0; k < emp_codes.length; k++){
                            let emp_code = "";                   //초기화
                            emp_code = emp_codes[k];

                            var paramObj = {
                                V_P_DEBUG_MODE_YN	: ''
                                ,V_P_LANG_ID		: ''
                                ,V_P_COMP_CODE		: gv_ma_selectedApcCd
                                ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
                                ,V_P_SITE_CODE      : ''
                                ,V_P_DEPT_CODE      : ''
                                ,V_P_EMP_CODE       : emp_code
                                ,V_P_EMP_STATE      : ''
                                ,V_P_JOB_GROUP      : ''
                                ,V_P_GENDER         : ''
                                ,IV_P_ENTER_DATE_FR : ''
                                ,IV_P_ENTER_DATE_TO : ''
                                ,V_P_EMP_CODE1      : ''
                                ,V_P_INITIAL_DATE   : ''
                                ,V_P_EMP_STATE2     : ''
                                ,V_P_FORM_ID		: p_formId
                                ,V_P_MENU_ID		: p_menuId
                                ,V_P_PROC_ID		: ''
                                ,V_P_USERID			: ''
                                ,V_P_PC				: ''
                            };

                            const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1000List.do", {
                                getType				: 'json',
                                workType			: param["WORK_TYPE"],
                                cv_count			: '39',
                                params				: gfnma_objectToString(paramObj)
                            });

                            const data = await postJsonPromise;
                            console.log('data:', data);
                            try {
                                if (_.isEqual("S", data.resultStatus)) {
                                    let strsocial_num = "";

                                    for (var i = 0; i < data.cv_1.length; i++) {
                                        if (gfn_nvl(data.cv_1[i]["SOCIAL_NUM"]) != "") {
                                            strsocial_num = data.cv_1[i]["SOCIAL_NUM"];
                                        }

                                        if (strsocial_num.length > 0) {
                                            if (strsocial_num.length == 13) {
                                                let yyyy_yy = "20";

                                                if (strsocial_num.substring(6, 7) == "1" || strsocial_num.substring(6, 7) == "2"
                                                    || strsocial_num.substring(6, 7) == "5" || strsocial_num.substring(6, 7) == "6") {
                                                    yyyy_yy = "19";
                                                }

                                                let birthYear = yyyy_yy + "-" + strsocial_num.substring(0, 2); // 2자리 연도 가져와서 19XX년으로 만들기
                                                let birthMonth = strsocial_num.substring(2, 4); // 달 가져오기
                                                let birthDay = strsocial_num.substring(4, 6); // 날짜 가져오기
                                                let dateTime = new Date(parseInt(birthYear), parseInt(birthMonth), parseInt(birthDay)); // 생년월일로 DateTime 객체 초기화
                                                let dateToday = new Date(); // 오늘 날짜

                                                let age = dateToday.getFullYear() - dateTime.getFullYear(); // 오늘 날짜에서 생년월일 빼서 몇 년이 되는지 구함. 만나이로 출력

                                                if(dateToday >= new Date(dateToday.getFullYear(), birthMonth, birthDay)) {
                                                    age++
                                                }

                                                data.cv_1[i]["SOCIAL_NUM_REAL"] = birthYear + "-" + birthMonth + "-" + birthDay + "(만" + age + "세)";
                                            }
                                        } else {
                                            data.cv_1[i]["SOCIAL_NUM_REAL"] = " 세";
                                        }

                                        // 조합가입여부 옵션
                                        if (param["UNION_JOIN_YN"] != "Y") {
                                            data.cv_1[i]["UNION_JOIN_YN_STR"] = "";
                                        }
                                    }

                                    for (var i = 0; i < data.cv_5.length; i++) {
                                        strsocial_num = "";
                                        if (gfn_nvl(data.cv_5[i]["SOCIAL_NO"]) != "") {
                                            strsocial_num = data.cv_5[i]["SOCIAL_NO"];
                                        }

                                        var dt1;

                                        if (strsocial_num.length > 0) {
                                            if (strsocial_num.substring(6, 7) == "1" || strsocial_num.substring(6, 7) == "2"
                                                || strsocial_num.substring(6, 7) == "5" || strsocial_num.substring(6, 7) == "6") {
                                                dt1 = new Date("19" + strsocial_num.substring(0, 2) + "-" + strsocial_num.substring(2, 4) + "-" + strsocial_num.substring(4, 6));
                                            } else {
                                                dt1 = new Date("20" + strsocial_num.substring(0, 2) + "-" + strsocial_num.substring(2, 4) + "-" + strsocial_num.substring(4, 6));
                                            }

                                            let dtDate1 = new Date();
                                            let currYear = parseInt(dtDate1.getFullYear());
                                            let currMonth = parseInt(dtDate1.getMonth().toString().padStart(2, '0'));
                                            let currDay = parseInt(dtDate1.getDay().toString().padStart(2, '0'));

                                            let iyyyy1 = currYear - dt1.getFullYear();
                                            let imonth1 = currMonth - dt1.getMonth();

                                            if (currMonth < parseInt(dt1.getMonth().toString().padStart(2, '0'))) {
                                                data.cv_5[i]["AGE"] = iyyyy1 - 1;
                                            } else if (currMonth == parseInt(dt1.getMonth().toString().padStart(2, '0'))) {
                                                if (currDay <= parseInt(dt1.getDay().toString().padStart(2, '0'))) {
                                                    data.cv_5[i]["AGE"] = iyyyy1 - 1;
                                                } else {
                                                    data.cv_5[i]["AGE"] = iyyyy1;
                                                }
                                            } else {
                                                data.cv_5[i]["AGE"] = iyyyy1;
                                            }

                                            // 가족나이
                                            if (strsocial_num.length > 9) {
                                                data.cv_5[i]["SOCIAL_NO_REAL"] = strsocial_num;
                                            }
                                        } else {
                                            dt1 = new Date(gfn_nvl(data.cv_5[i]["BIRTHDAY"]).substring(0, 4) + "-"
                                                + gfn_nvl(data.cv_5[i]["BIRTHDAY"]).substring(4, 6) + "-"
                                                + gfn_nvl(data.cv_5[i]["BIRTHDAY"]).substring(6, 8));

                                            let dtDate1 = new Date();
                                            let currYear = parseInt(dtDate1.getFullYear());
                                            let currMonth = parseInt(dtDate1.getMonth().toString().padStart(2, '0'));
                                            let currDay = parseInt(dtDate1.getDay().toString().padStart(2, '0'));
                                            let iyyyy1 = currYear - dt1.getFullYear();

                                            if (currMonth < parseInt(dt1.getMonth().toString().padStart(2, '0'))) {
                                                data.cv_5[i]["AGE"] = iyyyy1 - 1;
                                            } else if (currMonth == parseInt(dt1.getMonth().toString().padStart(2, '0'))) {
                                                if (currDay <= parseInt(dt1.getDay().toString().padStart(2, '0'))) {
                                                    data.cv_5[i]["AGE"] = iyyyy1 - 1;
                                                } else {
                                                    data.cv_5[i]["AGE"] = iyyyy1;
                                                }
                                            } else {
                                                data.cv_5[i]["AGE"] = iyyyy1;
                                            }

                                            data.cv_5[i]["SOCIAL_NO_REAL"] = strsocial_num;
                                        }

                                        // 부양가족 옵션(동거)
                                        if (param["FAMILY_WITH_YN"] != "Y") {
                                            data.cv_5[i]["SUPPORT_YN"] = "";
                                        }

                                        // 부양가족 옵션(사망포함)
                                        if (param["FAMILY_LIFE_YN"] != "Y" && gfn_nvl(data.cv_5[i]["LIFE_YN"]) == "N") {
                                            data.cv_5.splice(i, 1);
                                        }
                                    }

                                    // 경력사항 옵션
                                    if (param["CAREER"] != "Y") {
                                        data.cv_4.length = 0;
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

                        gfn_popClipReport("인사기록카드", reportFilePath, param);
                    }
                });*/

    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
