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
            <div style="margin-left: auto;">
                <sbux-button id="btnSearch" name="btnSearch" 	uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
            </div>
        </div>
        <div class="box-body">

            <!--[pp] 검색 -->
            <table class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 9%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 9%">
                    <col style="width: 8%">
                    <col style="width: 8%">
                    <col style="width: 9%">
                    <col style="width: 8%">
                    <col style="width: 2%">
                    <col style="width: 2%">
                    <col style="width: 2%">
                    <col style="width: 2%">
                    <col style="width: 8%">
                    <col style="width: 9%">
                    <col style="width: 8%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">법인</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_COMP_CODE" uitype="single" jsondata-ref="jsonCompCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">사업장</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">재직구분</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th colspan="4" scope="row" class="th_bg">직군</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
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
                    <th scope="row" class="th_bg">사원</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">입사일</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
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
                        <div class="table-responsive tbl_scroll_xs">
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
                                    <td rowspan="13" class="td_input">
                                        이미지 자리
                                    </td>
                                    <th scope="row" class="th_bg">사번</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="EMP_CODE" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">주민등록번호</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="DISPLAY_SOCIAL_NUM" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="SOCIAL_NUM" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">직위</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="POSITION_CODE" uitype="single" jsondata-ref="jsonJobCode" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="POSITION_CODE_PERIOD" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">이름</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="EMP_NAME" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">생년월일</th>
                                    <td class="td_input">
                                        <sbux-input id="BIRTHDAY" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-select id="BIRTHDAY_TYPE" uitype="single" jsondata-ref="jsonBirthdayType" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-checkbox
                                                uitype="normal"
                                                id="LEAP_MONTH_YN"
                                                name="LEAP_MONTH_YN"
                                                uitype="normal"
                                                class="form-control input-sm check"
                                                text="윤달"
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">직군</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">호봉</th>
                                    <td class="td_input">
                                        <sbux-select id="SALARY_CLASS" uitype="single" jsondata-ref="jsonSalaryClass" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">이름(영문)</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="EMP_NAME_ENG" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">성별</th>
                                    <td class="td_input">
                                        <sbux-select id="GENDER" uitype="single" jsondata-ref="jsonGender" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">나이</th>
                                    <td class="td_input">
                                        <sbux-input id="AGE" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">직원하위그룹</th>
                                    <td class="td_input">
                                        <sbux-select id="JOB_FAMILY" uitype="single" jsondata-ref="jsonJobFamily" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="SALARY_LEVEL" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">이름(한문)</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="EMP_NAME_CHN" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">직책</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="DUTY_CODE" uitype="single" jsondata-ref="jsonDutyCode" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="DUTY_CODE_PERIOD" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">직무</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="JOB_CODE" uitype="single" jsondata-ref="jsonJobCode" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-select id="JOB_SUB_CODE" uitype="single" jsondata-ref="jsonSubJobCode" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-select id="JOB_DETAIL_CODE" uitype="single" jsondata-ref="jsonDetailJobCode" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="JOB_CODE_PERIOD" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">인건비분류</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="LABOR_COST_GROUP" uitype="single" jsondata-ref="jsonLaborCostGroup" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">직급</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="JOB_RANK" uitype="single" jsondata-ref="jsonJobRank" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="JOB_RANK_PERIOD" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
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
                                            />
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">사업장</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="SITE_CODE" uitype="single" jsondata-ref="jsonJobCode" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">소속부서</th>
                                    <td class="td_input">
                                        <sbux-input id="DEPT_CODE" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="DEPT_NAME" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">상위부서</th>
                                    <td class="td_input">
                                        <sbux-input id="PARENT_DEPT" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="PARENT_DEPT_NAME" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">신고사업장</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="TAX_SITE_CODE" uitype="single" jsondata-ref="jsonTaxSiteCode" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">귀속부서</th>
                                    <td class="td_input">
                                        <sbux-input id="COST_DEPT_CODE" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="COST_DEPT_NAME" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">겸직부서</th>
                                    <td class="td_input">
                                        <sbux-input id="DEPT_CODE2" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="DEPT_NAME2" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">근무지</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="WORK_REGION" uitype="single" jsondata-ref="jsonWorkRegion" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">사원구분</th>
                                    <td class="td_input">
                                        <sbux-select id="EMP_TYPE" uitype="single" jsondata-ref="jsonEmpType" unselected-text="" class="form-control input-sm"></sbux-select>
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
                                            />
                                        </p>
                                    </td>
                                    <th scope="row" class="th_bg">협력사</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="PARTNER_FIRM_CODE" uitype="single" jsondata-ref="jsonPartnerFirmCode" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">겸직직책</th>
                                    <td class="td_input">
                                        <sbux-select id="DUTY_CODE2" uitype="single" jsondata-ref="jsonDutyCode" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">재직구분</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">종전사원</th>
                                    <td class="td_input">
                                        <sbux-input id="OLD_EMP_CODE" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="OLD_EMP_NAME" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">입사직위</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="START_POSITION_CODE" uitype="single" jsondata-ref="jsonPositionCode" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">인정경력</th>
                                    <td class="td_input">
                                        <sbux-input id="CAREER_TRACK" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input><span>개월</span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">입사구분</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="ENTER_TYPE" uitype="single" jsondata-ref="jsonEnterType" unselected-text="" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">추천자</th>
                                    <td class="td_input">
                                        <sbux-input id="INTRODUCER_CODE" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="INTRODUCER_NAME" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">근속기준일</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="CAREER_DATE"
                                                name="CAREER_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">PayGrade(입사)</th>
                                    <td class="td_input">
                                        <sbux-input id="START_PAY_GRADE" class="form-control input-sm input-sm-ast inpt_data_reqed" uitype="text" required style="width:100%"></sbux-input><span>개월</span>
                                    </td>
                                    <th scope="row" class="th_bg">기준일(PG)</th>
                                    <td class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="CAREER_TRACK_ENTER_DATE"
                                                name="CAREER_TRACK_ENTER_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">입사일</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="ENTER_DATE"
                                                name="ENTER_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">연차기산일(재직)</th>
                                    <td colspan="3" class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="ANNUAL_INITIAL_DATE"
                                                name="ANNUAL_INITIAL_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">연차기산일(퇴사)</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="ANNUAL_BASE_DATE"
                                                name="ANNUAL_BASE_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                style="width:100%;"
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">PayGrade(현재)</th>
                                    <td class="td_input">
                                        <sbux-input id="CURRENT_PAY_GRADE" class="form-control input-sm input-sm-ast inpt_data_reqed" uitype="text" required style="width:100%"></sbux-input><span>개월</span>
                                    </td>
                                    <th scope="row" class="th_bg">기준일(PG)</th>
                                    <td class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="CURRENT_PAY_GRADE_DATE"
                                                name="CURRENT_PAY_GRADE_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
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
                        <div class="table-responsive tbl_scroll_xs">
                            <sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="normal" is-scrollable="false" jsondata-ref="jsonTabData">
                            </sbux-tabs>
                            <div class="tab-content">
                                <div id="tpgMasterSub" style="height: 596px;">
                                    <table class="table table-bordered tbl_fixed">
                                        <caption>기본인적</caption>
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
                                            <col style="width: 11%">
                                            <col style="width: 11%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" class="th_bg">국적</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-select id="NATION_CODE" uitype="single" jsondata-ref="jsonNationCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                            </td>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-checkbox
                                                        uitype="normal"
                                                        id="FOREIGNER_YN"
                                                        name="FOREIGNER_YN"
                                                        uitype="normal"
                                                        class="form-control input-sm check"
                                                        text="외국인"
                                                />
                                                <sbux-checkbox
                                                        uitype="normal"
                                                        id="FAMILY_OWNER_YN"
                                                        name="FAMILY_OWNER_YN"
                                                        uitype="normal"
                                                        class="form-control input-sm check"
                                                        text="세대주"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">본관</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="FAMILY_CLAN" class="form-control input-sm input-sm-ast inpt_data_reqed" uitype="text" required style="width:100%"></sbux-input>
                                            </td>
                                            <th rowspan="2" scope="row" class="th_bg">서명</th>
                                            <td rowspan="2" class="td_input" style="border-right:hidden;">
                                                이미지 자리
                                            </td>
                                            <th scope="row" class="th_bg">상여수습종료일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="BONUS_APPLY_START_DATE"
                                                        name="BONUS_APPLY_START_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">본적주소</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="FAMILY_REGISTER_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button id="btnZip1" name="btnUserEnd" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger"></sbux-button>
                                            </td>
                                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="FAMILY_REGISTER_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">노조가입일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="UNION_JOIN_START_DATE"
                                                        name="UNION_JOIN_START_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">주민등록지</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="REGISTER_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button id="btnZip2" name="btnUserEnd" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger"></sbux-button>
                                            </td>
                                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="REGISTER_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">휴대폰번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="CELLPHONE_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">노조탈퇴일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="UNION_JOIN_END_DATE"
                                                        name="UNION_JOIN_END_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">비상연락처</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="EMERGENCY_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button id="btnZip3" name="btnUserEnd" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger"></sbux-button>
                                            </td>
                                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="EMERGENCY_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">비상연락전화</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="EMERGENCY_TEL_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">현거주주소</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="RESIDENCE_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button id="btnZip4" name="btnUserEnd" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger"></sbux-button>
                                            </td>
                                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="RESIDENCE_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">자택전화번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="HOME_TEL_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">회사전화번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="OFFICE_TEL_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">FAX번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="FAX_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">내선번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="INTER_PHONE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-checkbox
                                                        uitype="normal"
                                                        id="UNION_JOIN_YN"
                                                        name="UNION_JOIN_YN"
                                                        uitype="normal"
                                                        class="form-control input-sm check"
                                                        text="노조가입"
                                                />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">사내이메일</th>
                                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="IN_EMAIL" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">사외이메일</th>
                                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="OUT_EMAIL" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">급여수습종료일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="TEMP_END_DATE"
                                                        name="TEMP_END_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">그룹입사일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="GROUP_ENTER_DATE"
                                                        name="GROUP_ENTER_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">당사입사일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="COMP_ENTER_DATE"
                                                        name="COMP_ENTER_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">승진기준일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="PROMOTION_BASE_DATE"
                                                        name="PROMOTION_BASE_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">퇴사일(최종근무일)</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="RETIRE_DATE"
                                                        name="RETIRE_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">퇴사사유</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-select id="RETIRE_REASON" uitype="single" jsondata-ref="jsonRetireReason" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                            </td>
                                            <th scope="row" class="th_bg">퇴사사내사유</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-select id="RETIRE_IN_REASON" uitype="single" jsondata-ref="jsonRetireInReason" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                            </td>
                                            <th scope="row" class="th_bg">퇴직기산일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="RETIRE_BASE_DATE"
                                                        name="RETIRE_BASE_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">중간정산일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="PREMATURE_DATE"
                                                        name="PREMATURE_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-checkbox
                                                        uitype="normal"
                                                        id="RETIRE_PENSION_JOIN_YN"
                                                        name="RETIRE_PENSION_JOIN_YN"
                                                        uitype="normal"
                                                        class="form-control input-sm check"
                                                        text="퇴직연금(DC형)가입"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">퇴직연금최종불입일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="RETIRE_INITIAL_DATE"
                                                        name="RETIRE_INITIAL_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">퇴직연금(DB형)가입일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="RET_RENS_ST_DAT"
                                                        name="RET_RENS_ST_DAT"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">자택근무</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-checkbox
                                                        uitype="normal"
                                                        id="TELEWORKING_YN"
                                                        name="TELEWORKING_YN"
                                                        uitype="normal"
                                                        class="form-control input-sm check"
                                                        text="예"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">자택근무주소</th>
                                            <td colspan="6" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="TELEWORKING_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">승급일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="PROMOTION_DATA"
                                                        name="PROMOTION_DATA"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">비고</th>
                                            <td colspan="6" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="EMP_MEMO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">개인정보동의일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="AGREE_DATE"
                                                        name="AGREE_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-checkbox
                                                        uitype="normal"
                                                        id="AGREE_YN"
                                                        name="AGREE_YN"
                                                        uitype="normal"
                                                        class="form-control input-sm check"
                                                        text="개인정보동의"
                                                />
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="tpgMasterSubDetail" style="height: 596px;">
                                    <div class="col-sm-4">
                                        <div class="ad_tbl_top2">
                                            <ul class="ad_tbl_count">
                                                <li>
                                                    <span>신체</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div>
                                            <table class="table table-bordered tbl_fixed">
                                            <caption>신체</caption>
                                            <colgroup>
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row" class="th_bg">RH</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="BLOOD_TYPE_RH" uitype="single" jsondata-ref="jsonBloodTypeRh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                </td>
                                                <th scope="row" class="th_bg">ABO</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="BLOOD_TYPE_ABO" uitype="single" jsondata-ref="jsonBloodTypeAbo" unselected-text="" class="form-control input-sm"></sbux-select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">체중</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="WEIGHT" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">키</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="HEIGHT" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">좌안</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="LEFT_EYE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">우안</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="RIGHT_EYE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">색맹여부</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="COLOR_BLIND_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">상의 치수</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="JACKET_SIZE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">하의 치수</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="PANTS_SIZE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">신발 치수</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="SHOE_SIZE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div>
                                            <div class="ad_tbl_top2">
                                                <ul class="ad_tbl_count">
                                                    <li>
                                                        <span>취미/특기/종교</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div>
                                                <table class="table table-bordered tbl_fixed">
                                                <caption>취미/특기/종교</caption>
                                                <colgroup>
                                                    <col style="width: 50%">
                                                    <col style="width: 50%">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th scope="row" class="th_bg">취미</th>
                                                    <td class="td_input" style="border-right:hidden;">
                                                        <sbux-select id="HOBBY" uitype="single" jsondata-ref="jsonBloodTypeRh" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" class="th_bg">특기</th>
                                                    <td class="td_input" style="border-right:hidden;">
                                                        <sbux-input id="SPECIAL_ABILITY" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" class="th_bg">종교</th>
                                                    <td class="td_input" style="border-right:hidden;">
                                                        <sbux-select id="RELIGION_CODE" uitype="single" jsondata-ref="jsonReligionCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="ad_tbl_top2">
                                                <ul class="ad_tbl_count">
                                                    <li>
                                                        <span>주거</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div>
                                                <table class="table table-bordered tbl_fixed">
                                                <caption>주거</caption>
                                                <colgroup>
                                                    <col style="width: 50%">
                                                    <col style="width: 50%">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th scope="row" class="th_bg">주택소유여부</th>
                                                    <td class="td_input" style="border-right:hidden;">
                                                        <sbux-select id="HOUSE_OWN_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" class="th_bg">주거구분</th>
                                                    <td class="td_input" style="border-right:hidden;">
                                                        <sbux-select id="HOUSE_TYPE" uitype="single" jsondata-ref="jsonHouseType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" class="th_bg">주택유형</th>
                                                    <td class="td_input" style="border-right:hidden;">
                                                        <sbux-select id="HOUSE_KIND" uitype="single" jsondata-ref="jsonHouseKind" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div>
                                            <div class="ad_tbl_top2">
                                                <ul class="ad_tbl_count">
                                                    <li>
                                                        <span>결혼</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div>
                                                <table class="table table-bordered tbl_fixed">
                                                <caption>결혼</caption>
                                                <colgroup>
                                                    <col style="width: 50%">
                                                    <col style="width: 50%">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th scope="row" class="th_bg">결혼여부</th>
                                                    <td class="td_input" style="border-right:hidden;">
                                                        <sbux-select id="MARRIAGE_YN" uitype="single" jsondata-ref="jsonMarriageYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" class="th_bg">결혼기념일</th>
                                                    <td class="td_input" style="border-right:hidden;">
                                                        <sbux-datepicker
                                                                uitype="popup"
                                                                id="MARRIAGE_DATE"
                                                                name="MARRIAGE_DATE"
                                                                date-format="yyyy-mm-dd"
                                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                                style="width:100%;"
                                                        />
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="ad_tbl_top2">
                                                <ul class="ad_tbl_count">
                                                    <li>
                                                        <span>차량</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div>
                                                <table class="table table-bordered tbl_fixed">
                                                <caption>차량</caption>
                                                <colgroup>
                                                    <col style="width: 50%">
                                                    <col style="width: 50%">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <th scope="row" class="th_bg">차량소유여부</th>
                                                    <td class="td_input" style="border-right:hidden;">
                                                        <sbux-select id="CAR_OWN_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" class="th_bg">차량번호</th>
                                                    <td class="td_input" style="border-right:hidden;">
                                                        <sbux-input id="CAR_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row" class="th_bg">차종</th>
                                                    <td class="td_input" style="border-right:hidden;">
                                                        <sbux-input id="CAR_KIND" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tpgFAMILY">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>가족사항</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwFamily" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwFamily"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwFamily" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgSCHOOL">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>학력사항</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwSchool" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwSchool"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwSchool" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgCAREER">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>경력사항</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwCareer" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwCareer"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwCareer" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgLICENSE">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>경력사항</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwLicense" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwLicense"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwLicense" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgLANGUAGE">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>어학</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwLanguage" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwLanguage"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwLanguage" style="height:200px;"></div>
                                    </div>
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>컴퓨터활용능력</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwComputerSkill" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwComputerSkill"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwComputerSkill" style="height:320px;"></div>
                                    </div>
                                </div>
                                <div id="tpgFILE">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>파일정보</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwFile" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwFile"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwFile" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgEducation">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>교육사항</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwEducation" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwEducation"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwEducation" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgMasterSubDetail2" style="height: 596px;">
                                    <div class="table-responsive tbl_scroll_xs">
                                        <table class="table table-bordered tbl_fixed">
                                            <caption>병역사항</caption>
                                            <colgroup>
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row" class="th_bg">병역구분</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="ARMY_TYPE" uitype="single" jsondata-ref="jsonArmyType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                </td>
                                                <td colspan="2" class="td_input" style="border-right:hidden;">
                                                    <sbux-checkbox
                                                            uitype="normal"
                                                            id="ARMY_INDUSTRY_YN"
                                                            name="ARMY_INDUSTRY_YN"
                                                            uitype="normal"
                                                            class="form-control input-sm check"
                                                            text="병역특례"
                                                    />
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>병역사항</span></li>
                                        </ul>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <table class="table table-bordered tbl_fixed">
                                            <caption>신체</caption>
                                            <colgroup>
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row" class="th_bg">병역병과</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="ARMY_PART" uitype="single" jsondata-ref="jsonArmyPart" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                </td>
                                                <th scope="row" class="th_bg">병역군별</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="ARMY_KIND" uitype="single" jsondata-ref="jsonArmyKind" unselected-text="" class="form-control input-sm"></sbux-select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">전역구분</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="ARMY_DISCHARGE_TYPE" uitype="single" jsondata-ref="jsonArmyDischargeType" unselected-text="" class="form-control input-sm"></sbux-select>
                                                </td>
                                                <th scope="row" class="th_bg">병역계급</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="ARMY_GRADE" uitype="single" jsondata-ref="jsonArmyGrade" unselected-text="" class="form-control input-sm"></sbux-select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">복무시작일</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="ARMY_START_DATE"
                                                            name="ARMY_START_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                            style="width:100%;"
                                                    />
                                                </td>
                                                <th scope="row" class="th_bg">복무종료일</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="ARMY_END_DATE"
                                                            name="ARMY_END_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                            style="width:100%;"
                                                    />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">면제사유</th>
                                                <td colspan="3" class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ARMY_EXEMPTION_DESCR" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">병역사항</th>
                                                <td colspan="3" class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="ARMY_DESCR" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="tpgMasterSubDetail3" style="height: 596px;">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>보훈</span></li>
                                        </ul>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <table class="table table-bordered tbl_fixed">
                                            <caption>보훈</caption>
                                            <colgroup>
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row" class="th_bg">보훈대상여부</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="VETERANS_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                </td>
                                                <th scope="row" class="th_bg">보훈등급</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="VETERANS_GRADE" uitype="single" jsondata-ref="jsonVeteransGrade" unselected-text="" class="form-control input-sm"></sbux-select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">보훈내용</th>
                                                <td colspan="3" class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="VETERANS_MEMO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">유공자와의관계</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="VETERANS_RELATION" uitype="single" jsondata-ref="jsonRelation" unselected-text="" class="form-control input-sm"></sbux-select>
                                                </td>
                                                <th scope="row" class="th_bg">보훈번호</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="VETERANS_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">고용명령여부</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="VETERANS_ORDER_YN" uitype="single" jsondata-ref="jsonUseYn" unselected-text="" class="form-control input-sm"></sbux-select>
                                                </td>
                                                <th scope="row" class="th_bg">고용명령일</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="VETERANS_ORDER_DATE"
                                                            name="VETERANS_ORDER_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                            style="width:100%;"
                                                    />
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>장애</span></li>
                                        </ul>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <table class="table table-bordered tbl_fixed">
                                            <caption>장애</caption>
                                            <colgroup>
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row" class="th_bg">장애등급</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="HANDICAP_GRADE" uitype="single" jsondata-ref="jsonHandicapGrade" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                </td>
                                                <th scope="row" class="th_bg">장애유형</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="HANDICAP_TYPE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">장애내역</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="HANDICAP_REASON" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">장애등록일</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="HANDICAP_ISSUE_DATE"
                                                            name="HANDICAP_ISSUE_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                            style="width:100%;"
                                                    />
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>여권/비자</span></li>
                                        </ul>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <table class="table table-bordered tbl_fixed">
                                            <caption>여권/비자</caption>
                                            <colgroup>
                                                <col style="width: 16%">
                                                <col style="width: 16%">
                                                <col style="width: 16%">
                                                <col style="width: 16%">
                                                <col style="width: 16%">
                                                <col style="width: 16%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row" class="th_bg">여권번호</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="PASSPORT_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">여권발급일자</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="PASSPORT_ISSUE_DATE"
                                                            name="PASSPORT_ISSUE_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                            style="width:100%;"
                                                    />
                                                </td>
                                                <th scope="row" class="th_bg">여권만료일자</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="PASSPORT_EXPIRE_DATE"
                                                            name="PASSPORT_EXPIRE_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                            style="width:100%;"
                                                    />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">비자번호</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="VISA_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">비자발급일자</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="VISA_ISSUE_DATE"
                                                            name="VISA_ISSUE_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                            style="width:100%;"
                                                    />
                                                </td>
                                                <th scope="row" class="th_bg">비자만료일자</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="VISA_EXPIRE_DATE"
                                                            name="VISA_EXPIRE_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                            style="width:100%;"
                                                    />
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="tpgMasterSubDetail4" style="height: 596px;">
                                    <div class="table-responsive tbl_scroll_xs">
                                        <table class="table table-bordered tbl_fixed">
                                            <caption>보증구분</caption>
                                            <colgroup>
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                                <col style="width: 25%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row" class="th_bg">보증구분</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="GUARANTEE_TYPE" uitype="single" jsondata-ref="jsonGuaranteeType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>보증보험</span></li>
                                        </ul>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <table class="table table-bordered tbl_fixed">
                                            <caption>보증보험</caption>
                                            <colgroup>
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row" class="th_bg">보험사</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="INSURE_COMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">보험명</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="INSURE_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">보험번호</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="INSURE_NUM" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">보험액</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="INSURE_AMOUNT" uitype="number" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">보험가액</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="INSURE_VALUE" uitype="number" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">보험시작일</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="INSURE_START_DATE"
                                                            name="INSURE_START_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                            style="width:100%;"
                                                    />
                                                </td>
                                                <th scope="row" class="th_bg">보험종료일</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="INSURE_END_DATE"
                                                            name="INSURE_END_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                            style="width:100%;"
                                                    />
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>인보증1</span></li>
                                        </ul>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <table class="table table-bordered tbl_fixed">
                                            <caption>인보증1</caption>
                                            <colgroup>
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <th scope="row" class="th_bg">성명</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="GUARANTOR1_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">거민신분번호</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="GUARANTOR1_SOCIAL_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">관계</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-select id="GUARANTOR1_RELATION" uitype="single" jsondata-ref="jsonRelation" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">전화번호</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="GUARANTOR1_COMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">비고</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="GUARANTOR1_POSITION" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">시작일</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="GUARANTOR1_START_DATE"
                                                            name="GUARANTOR1_START_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                            style="width:100%;"
                                                    />
                                                </td>
                                                <th scope="row" class="th_bg">종료일</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-datepicker
                                                            uitype="popup"
                                                            id="GUARANTOR1_END_DATE"
                                                            name="GUARANTOR1_END_DATE"
                                                            date-format="yyyy-mm-dd"
                                                            class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                            style="width:100%;"
                                                    />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">우편번호</th>
                                                <td class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="GUARANTOR1_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                                <th scope="row" class="th_bg">주소</th>
                                                <td colspan="5" class="td_input" style="border-right:hidden;">
                                                    <sbux-input id="GUARANTOR1_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>인보증2</span></li>
                                        </ul>
                                    </div>
                                    <table class="table table-bordered tbl_fixed">
                                        <caption>인보증2</caption>
                                        <colgroup>
                                            <col style="width: 12.5%">
                                            <col style="width: 12.5%">
                                            <col style="width: 12.5%">
                                            <col style="width: 12.5%">
                                            <col style="width: 12.5%">
                                            <col style="width: 12.5%">
                                            <col style="width: 12.5%">
                                            <col style="width: 12.5%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" class="th_bg">성명</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="GUARANTOR2_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">거민신분번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="GUARANTOR2_SOCIAL_NO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">관계</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-select id="GUARANTOR2_RELATION" uitype="single" jsondata-ref="jsonRelation" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">전화번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="GUARANTOR2_COMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">비고</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="GUARANTOR2_POSITION" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">시작일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="GUARANTOR2_START_DATE"
                                                        name="GUARANTOR2_START_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                            <th scope="row" class="th_bg">종료일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="GUARANTOR2_END_DATE"
                                                        name="GUARANTOR2_END_DATE"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">우편번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="GUARANTOR2_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">주소</th>
                                            <td colspan="5" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="GUARANTOR2_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="tpgPrize">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>상벌사항</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwPrize" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwPrize"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwPrize" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgHealth">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>건강검진내역</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwHealth" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwHealth"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwHealth" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgAppointment">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>발령사항</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwAppointment" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwAppointment"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwAppointment" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tabPageEx1">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>겸직부서</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwAddJob" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwAddJob"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwAddJob" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgTimeOffHistory">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>휴직이력</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwTimeOffHistory" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwTimeOffHistory"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwTimeOffHistory" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgGroupInsurance">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>단체보험</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwGroupInsurance" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwGroupInsurance"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwGroupInsurance" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgDisease">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>상해/질병</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwDisease" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwDisease"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwDisease" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgPersonnelEvaluation">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>평가</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwPersonnelEvaluation" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwPersonnelEvaluation"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwPersonnelEvaluation" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgOfficialInjury">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>공상발생</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwOfficialInjury" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwOfficialInjury"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwOfficialInjury" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgContractDeg">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>계약차수</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwContractDeg" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwContractDeg"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwContractDeg" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgWORKPLAN">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>근무계획</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwWorkPlan" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwWorkPlan"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwWorkPlan" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgEmp">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>근무조</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwEmp" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwEmp"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwEmp" style="height:560px;"></div>
                                    </div>
                                </div>
                                <div id="tpgExpenditurewelfare">
                                    <div class="ad_tbl_top2">
                                        <ul class="ad_tbl_count">
                                            <li><span>경조사비내역</span></li>
                                        </ul>
                                        <div class="ad_tbl_toplist">
                                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRowForGvwExpenditurewelfare" ></sbux-button>&nbsp;
                                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRowForGvwExpenditurewelfare"></sbux-button>
                                        </div>
                                    </div>
                                    <div class="table-responsive tbl_scroll_xs">
                                        <div id="sb-area-gvwExpenditurewelfare" style="height:560px;"></div>
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
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    var editType			= "N";

    var jsonCompCode		= [];	// 법인
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
        let rst = await Promise.all([
            // 법인
            gfnma_setComSelect(['SRCH_COMP_CODE'], jsonCompCode, 'L_ORG000', '', '', 'COMP_CODE', 'COMP_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SRCH_SITE_CODE', 'SITE_CODE', 'gvwTimeOffHistory'], jsonSiteCode, 'L_ORG001', '', '', 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 재직구분
            gfnma_setComSelect(['gvwList','SRCH_EMP_STATE', 'EMP_STATE', 'gvwEmp'], jsonEmpState, 'L_HRI009', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직군
            gfnma_setComSelect(['SRCH_JOB_GROUP','JOB_GROUP'], jsonJobGroup, 'L_HRI047', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['gvwList', 'DUTY_CODE', 'DUTY_CODE2', 'gvwAddJob', 'gvwEmp'], jsonDutyCode, 'L_HRI003', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직종
            gfnma_setComSelect(['JOB_FAMILY'], jsonJobFamily, 'L_HRI004', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 성별
            gfnma_setComSelect(['SRCH_GENDER', 'GENDER'], jsonGender, 'L_HRM002', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['gvwList', 'START_POSITION_CODE', 'gvwAddJob', 'gvwEmp'], jsonPositionCode, 'L_HRI002', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직급
            gfnma_setComSelect(['JOB_RANK', 'gvwAddJob', 'gvwEmp'], jsonJobRank, 'L_HRI005', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직무
            gfnma_setComSelect(['JOB_CODE'], jsonJobCode, 'L_HRI006', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['JOB_SUB_CODE'], jsonSubJobCode, 'L_HRI073_A', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['JOB_DETAIL_CODE'], jsonDetailJobCode, 'L_HRI073_B', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 입사구분
            gfnma_setComSelect(['ENTER_TYPE'], jsonEnterType, 'L_HRI041_01', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 양력/음력
            gfnma_setComSelect(['gvwFamily','BIRTHDAY_TYPE'], jsonBirthdayType, 'L_HRM001', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 호봉
            gfnma_setComSelect(['SALARY_CLASS'], jsonSalaryClass, 'L_HRI011', '', '', 'GRADE_HOBONG_CODE', 'GRADE_HOBONG_NAME', 'Y', ''),
            // 인건비분류
            gfnma_setComSelect(['LABOR_COST_GROUP'], jsonLaborCostGroup, 'L_HRI007', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 신고사업장
            gfnma_setComSelect(['TAX_SITE_CODE'], jsonTaxSiteCode, 'L_ORG003', '', '', 'TAX_SITE_CODE', 'TAX_SITE_NAME', 'Y', ''),
            // 근무지
            gfnma_setComSelect(['WORK_REGION'], jsonWorkRegion, 'L_HRI999', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 사원구분
            gfnma_setComSelect(['EMP_TYPE'], jsonEmpType, 'L_HRI008', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 협력사
            gfnma_setComSelect(['PARTNER_FIRM_CODE'], jsonPartnerFirmCode, 'L_HRI065', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 국적
            gfnma_setComSelect(['NATION_CODE'], jsonNationCode, 'L_COM015_2', '', '', 'NATION_CODE', 'NATION_NAME', 'Y', ''),
            // 퇴사사유
            gfnma_setComSelect(['RETIRE_REASON'], jsonRetireReason, 'L_HRI013', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 퇴사사내사유
            gfnma_setComSelect(['RETIRE_IN_REASON'], jsonRetireInReason, 'L_HRI041_02', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // RH
            gfnma_setComSelect(['BLOOD_TYPE_RH'], jsonBloodTypeRh, 'L_HRI014', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // ABO
            gfnma_setComSelect(['BLOOD_TYPE_ABO'], jsonBloodTypeAbo, 'L_HRI015', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 사용여부
            gfnma_setComSelect(['COLOR_BLIND_YN', 'HOUSE_OWN_YN', 'CAR_OWN_YN', 'gvwLicense', 'gvwEducation', 'VETERANS_YN', 'VETERANS_ORDER_YN'],
                jsonUseYn, 'L_COM014', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 종교
            gfnma_setComSelect(['RELIGION_CODE'], jsonReligionCode, 'L_HRI038', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 주거구분
            gfnma_setComSelect(['HOUSE_TYPE'], jsonHouseType, 'L_HRI017', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 주거유형
            gfnma_setComSelect(['HOUSE_KIND'], jsonHouseKind, 'L_HRI018', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 결혼여부
            gfnma_setComSelect(['MARRIAGE_YN'], jsonMarriageYn, 'L_HRI016', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 가족관계
            gfnma_setComSelect(['gvwFamily', 'VETERANS_RELATION', 'GUARANTOR1_RELATION', 'GUARANTOR2_RELATION', 'gvwExpenditurewelfare'],
                jsonRelation, 'L_HRI025', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 연말정산부양관계
            gfnma_setComSelect(['gvwFamily'], jsonYeartaxRelation, 'L_HRI026', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 최종학력
            gfnma_setComSelect(['gvwFamily'], jsonSchoolType, 'L_HRI027', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 학위구분
            gfnma_setComSelect(['gvwSchool'], jsonDegreeType, 'L_HRI054', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 소재지
            gfnma_setComSelect(['gvwSchool', 'gvwCareer'], jsonManageCode, 'L_HRI028', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 본교구분
            gfnma_setComSelect(['gvwSchool'], jsonCampusBranchType, 'L_HRI049', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 본교구분
            gfnma_setComSelect(['gvwSchool'], jsonDayNightType, 'L_HRI057', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 졸업구분
            gfnma_setComSelect(['gvwSchool'], jsonGraduateType, 'L_HRI029', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 경력구분
            gfnma_setComSelect(['gvwCareer'], jsonCareerType, 'L_HRI029', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 면허종별
            gfnma_setComSelect(['gvwLicense'], jsonLicenseCategory, 'L_HRI031', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 자격증코드
            gfnma_setComSelect(['gvwLicense'], jsonLicenseCode, 'L_HRI068', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 시험구분
            gfnma_setComSelect(['gvwLanguage'], jsonTestType, 'L_HRI032', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 수준
            gfnma_setComSelect(['gvwLanguage', 'gvwComputerSkill'], jsonLevelCode, 'L_HRI045', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 파일타입
            gfnma_setComSelect(['gvwFile'], jsonFileType, 'L_HRI061', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 교육구분
            gfnma_setComSelect(['gvwEducation'], jsonEduMethod, 'L_HRI034', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 교육방법
            gfnma_setComSelect(['gvwEducation'], jsonEduType, 'L_HRI039', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 병역구분
            gfnma_setComSelect(['ARMY_TYPE'], jsonArmyType, 'L_HRI019', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 병역병과
            gfnma_setComSelect(['ARMY_PART'], jsonArmyPart, 'L_HRI021', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 병역군별
            gfnma_setComSelect(['ARMY_KIND'], jsonArmyKind, 'L_HRI020', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 전역구분
            gfnma_setComSelect(['ARMY_DISCHARGE_TYPE'], jsonArmyDischargeType, 'L_HRI023', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 병역계급
            gfnma_setComSelect(['ARMY_GRADE'], jsonArmyGrade, 'L_HRI022', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 보훈등급
            gfnma_setComSelect(['VETERANS_GRADE'], jsonVeteransGrade, 'L_HRI055', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 장애등급
            gfnma_setComSelect(['HANDICAP_GRADE'], jsonHandicapGrade, 'L_HRI053', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 보증구분
            gfnma_setComSelect(['GUARANTEE_TYPE'], jsonGuaranteeType, 'L_HRI024', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상벌구분
            gfnma_setComSelect(['gvwPrize'], jsonPrizeType, 'L_HRI035', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상벌유형
            gfnma_setComSelect(['gvwPrize'], jsonPrizeCategory, 'L_HRI060', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 사내외구분
            gfnma_setComSelect(['gvwPrize'], jsonPrizeInoutType, 'L_HRI030', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 대상구분
            gfnma_setComSelect(['gvwPrize'], jsonPrizeTarget, 'L_HRI036', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 검진구분
            gfnma_setComSelect(['gvwHealth'], jsonCheckType, 'L_HRI037', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 겸직부서
            gfnma_setComSelect(['gvwAddJob'], jsonAddJobDeptCode, 'L_ORG900', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 휴직유형
            gfnma_setComSelect(['gvwTimeOffHistory'], jsonTimeOffType, 'L_HRT003', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 보험상품
            gfnma_setComSelect(['gvwGroupInsurance'], jsonGroupInsureCode, 'L_HRI062', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상해/질병구분
            gfnma_setComSelect(['gvwDisease'], jsonDiseaseType, 'L_HRI063', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 평가차수
            gfnma_setComSelect(['gvwPersonnelEvaluation'], jsonEvalPositionCode, 'L_HRIZ04', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 계약차수
            gfnma_setComSelect(['gvwContractDeg'], jsonContractDegree, 'L_HRIZ03', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무계획
            gfnma_setComSelect(['gvwWorkPlan'], jsonWorkplanType, 'L_HRI070', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무패턴코드
            gfnma_setComSelect(['gvwEmp'], jsonWorkPatternCode, 'L_HRT020', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 경조사유
            gfnma_setComSelect(['gvwExpenditurewelfare'], jsonWelfareType, 'L_HRW103_02', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),

        ]);
    }

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

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
        fn_search();
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
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:left', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }}},
            {caption: ["사번"], 	        ref: 'EMP_CODE',    	        type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["이름"],  		ref: 'EMP_NAME',    			type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["상위부서"],       ref: 'PARENT_DEPT_NAME', 		type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서"],          ref: 'DEPT_NAME', 		        type:'output',  	width:'140px',  style:'text-align:left'},
            {caption: ["직위"],          ref: 'POSITION_CODE', 		    type:'output',  	width:'100px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }},
            {caption: ["직책"],      	ref: 'DUTY_CODE', 		        type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["재직구분"],     	ref: 'EMP_STATE', 		        type:'output',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonEmpState',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["입사일"],        ref: 'ENTER_DATE', 		         type:'output',  	width:'90px',  	style:'text-align:left'},
            {caption: ["퇴사일"],        ref: 'RETIRE_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left'}
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        //gvwList.bind('beforepagechanged', 'fn_pagingEmpList');
    }

    function fn_createGvwFamilyGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwFamily';
        SBGridProperties.id 				= 'gvwFamily';
        SBGridProperties.jsonref 			= 'jsonFamilyList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["가족성명"], 	        ref: 'NAME',    	        type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["가족관계"],  		ref: 'RELATION',    			type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonRelation',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["가족주민등록번호"],       ref: 'SOCIAL_NO_REAL', 		type:'output',  	width:'135px',  	style:'text-align:left'},
            {caption: ["가족주민등록번호2"],          ref: 'SOCIAL_NO', 		        type:'output',  	width:'140px',  style:'text-align:left'},
            {caption: ["생년월일"],          ref: 'BIRTHDAY', 		    type:'datepicker',  	width:'100px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["음양구분"],      	ref: 'BIRTHDAY_TYPE', 		        type:'output',  	width:'70px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonBirthdayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["시작일자"],     	ref: 'START_DATE', 		         type:'datepicker',  	width:'75px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["종료일자"],     	ref: 'END_DATE', 		         type:'datepicker',  	width:'75px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["부양가족"],        ref: 'SUPPORT_YN', 		         type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["연말정산"],        ref: 'YEARTAX_YN', 		     type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["연말정산부양관계"],  		ref: 'YEARTAX_RELATION',    			type:'output',  	width:'120px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonYeartaxRelation',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["외국인"],        ref: 'FOREIGNER_YN', 		     type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["장애"],        ref: 'HANDICAP_YN', 		     type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["동거"],        ref: 'LIVE_TOGETHER_YN', 		     type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["생존여부"],        ref: 'LIFE_YN', 		     type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["건강보험피부양자"],        ref: 'HEALTH_INSURE_YN', 		     type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["직업"],        ref: 'JOB', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["원천징수공제"],        ref: 'WH_TAX_YN', 		     type:'output',  	width:'79px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["우편번호"],        ref: 'ZIP_CODE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["주소"],        ref: 'ADDRESS', 		     type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["연락처"],        ref: 'TEL', 		     type:'output',  	width:'130px',  	style:'text-align:left'},
            {caption: ["최종학력"],        ref: 'SCHOOL_TYPE', 		     type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSchoolType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
        ];

        gvwFamily = _SBGrid.create(SBGridProperties);
        //gvwFamily.bind('beforepagechanged', 'fn_pagingFamilyList');
    }

    function fn_createGvwSchoolGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwSchool';
        SBGridProperties.id 				= 'gvwSchool';
        SBGridProperties.jsonref 			= 'jsonSchoolList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["학위구분"], 	        ref: 'SCHOOL_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDegreeType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["소재지"],  		ref: 'MANAGE_CODE',    			type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonManageCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["본교구분"],       ref: 'CAMPUS_BRANCH_TYPE', 		type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCampusBranchType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["학교명"],          ref: 'SCHOOL_NAME', 		        type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["주야간구분"],          ref: 'DAY_NIGHT_TYPE', 		    type:'output',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDayNightType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["전공명"],      	ref: 'MAJOR', 		        type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["졸업구분"],     	ref: 'GRADUATE_TYPE', 		         type:'output',  	width:'80px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonGraduateType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["최종학력"],     	ref: 'LAST_SCHOOL_YN', 		         type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["이수학점"],        ref: 'COMPLE_POINT', 		         type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["평점"],        ref: 'GPA_POINT', 		     type:'output',  	width:'70px',  	style:'text-align:left'},
            {caption: ["입학일"],  		ref: 'INTO_DATE',    			type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["졸업일"],        ref: 'GRADUATE_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["입사후"],        ref: 'AFTER_ENTER_YN', 		     type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'}
        ];

        gvwSchool = _SBGrid.create(SBGridProperties);
        //gvwSchool.bind('beforepagechanged', 'fn_pagingSchoolList');
    }

    function fn_createGvwCareerGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwCareer';
        SBGridProperties.id 				= 'gvwCareer';
        SBGridProperties.jsonref 			= 'jsonCareerList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["경력구분"], 	        ref: 'CAREER_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCareerType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근무시작일"],  		ref: 'START_DATE',    			type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["근무종료일"],       ref: 'END_DATE', 		type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["경력년수"],          ref: 'CAREER_YEAR', 		        type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["경력개월"],          ref: 'CAREER_MONTH', 		        type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["회사명"],          ref: 'COMP_NAME', 		        type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["부서명"],          ref: 'DEPT_NAME', 		    type:'output',  	width:'120px',  style:'text-align:left'}, // TODO: P_ORG001 팝업 적용 필요
            {caption: ["직위"],      	ref: 'POSITION', 		        type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["직종"],     	ref: 'JOB', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["담당업무"],     	ref: 'WORK', 		         type:'output',  	width:'180px',  style:'text-align:left'},
            {caption: ["소재지"],        ref: 'REGION_CODE', 		         type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonManageCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["연봉수준"],        ref: 'SALARY_LEVEL', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["퇴직사유"],  		ref: 'RETIRE_MEMO',    			type:'datepicker',  	width:'200px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwCareer = _SBGrid.create(SBGridProperties);
        //gvwCareer.bind('beforepagechanged', 'fn_pagingCareerList');
    }

    function fn_createGvwLicenseGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwLicense';
        SBGridProperties.id 				= 'gvwLicense';
        SBGridProperties.jsonref 			= 'jsonLicenseList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["종별"], 	        ref: 'LICENSE_CATEGORY',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonLicenseCategory',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["자격증코드"],  		ref: 'LICENSE_CODE',    			type:'output',  	width:'104px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonLicenseCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["자격등급"],     	ref: 'LICENSE_GRADE', 		         type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["자격번호"],     	ref: 'LICENSE_NUM', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["면허명(자격명)"],     	ref: 'LICENSE_NAME', 		         type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["발행기관"],     	ref: 'ISSUE_INSTITUTE', 		         type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["취득일"],       ref: 'ISSUE_DATE', 		type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["갱신일"],       ref: 'RENEW_DATE', 		type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["자격수당금액"],     	ref: 'LICENSE_WAGES_AMT', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["급여지급"],          ref: 'PAY_YN', 		        type:'output',  	width:'75px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonUseYn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["법정선임여부"],          ref: 'APPOINT_YN', 		        type:'output',  	width:'100px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonUseYn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["법정선임부서"],          ref: 'APPOINT_DEPT_CODE', 		        type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["법정선임시작일"],       ref: 'APPOINT_START_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["법정선임종료일"],       ref: 'APPOINT_END_DATE', 		type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwLicense = _SBGrid.create(SBGridProperties);
        //gvwLicense.bind('beforepagechanged', 'fn_pagingLicenseList');
    }

    function fn_createGvwLanguageGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwLanguage';
        SBGridProperties.id 				= 'gvwLanguage';
        SBGridProperties.jsonref 			= 'jsonLanguageList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["시험구분"], 	        ref: 'TEST_TYPE',    	        type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonTestType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["시험일"],       ref: 'TEST_DATE', 		type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["유효일"],       ref: 'AVAILABLE_DATE', 		type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["발행기관"],     	ref: 'ISSUE_INSTITUTION', 		         type:'output',  	width:'150px',  style:'text-align:left'},
            {caption: ["총점수"],     	ref: 'TOTAL_SCORE', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["점수1"],     	ref: 'SCORE1', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["점수2"],     	ref: 'SCORE2', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["점수3"],     	ref: 'SCORE3', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["점수4"],     	ref: 'SCORE4', 		         type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["수준"],  		ref: 'TEST_LEVEL',    			type:'output',  	width:'104px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonLevelCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwLanguage = _SBGrid.create(SBGridProperties);
        //gvwLanguage.bind('beforepagechanged', 'fn_pagingLanguageList');
    }

    function fn_createGvwComputerSkillGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwComputerSkill';
        SBGridProperties.id 				= 'gvwComputerSkill';
        SBGridProperties.jsonref 			= 'jsonComputerSkillList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["사용가능OA명"], 	        ref: 'OA_NAME',    	        type:'output',  	width:'190px',  	style:'text-align:left'},
            {caption: ["활용수준"],  		ref: 'OA_SKILL_LEVEL',    			type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonLevelCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwComputerSkill = _SBGrid.create(SBGridProperties);
        //gvwComputerSkill.bind('beforepagechanged', 'fn_pagingComputerSkillList');
    }

    function fn_createGvwFileGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwFile';
        SBGridProperties.id 				= 'gvwFile';
        SBGridProperties.jsonref 			= 'jsonFileList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["파일명"], 	        ref: 'FILE_NAME',    	        type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["파일서버경로"],        ref: 'FILE_SERVER_PATH', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["구분"],  		ref: 'FILE_TYPE',    			type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonFileType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["생성일시"],        ref: 'CREATE_TIME', 		     type:'output',  	width:'140px',  	style:'text-align:left'},
            {caption: ["생성자"],        ref: 'CREATE_USER', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwFile = _SBGrid.create(SBGridProperties);
        //gvwFile.bind('beforepagechanged', 'fn_pagingFileList');
    }

    function fn_createGvwEducationGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwEducation';
        SBGridProperties.id 				= 'gvwEducation';
        SBGridProperties.jsonref 			= 'jsonEducationList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["교육과정명"], 	        ref: 'EDU_NAME',    	        type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["교육구분"],        ref: 'EDU_METHOD', 		     type:'output',  	width:'92px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonEduMethod',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["교육방법"],  		ref: 'EDU_TYPE',    			type:'output',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonEduType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["교육기관"],        ref: 'EDU_INSTITUTE', 		     type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["교육시작일"],        ref: 'EDU_START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["교육종료일"],        ref: 'EDU_END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["교육점수"],        ref: 'EDU_SCORE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["교육비용"],        ref: 'EDU_TOTAL_EXPENSE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["고용보험환급액"],        ref: 'RETURN_EXPENSE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["실지급액"],        ref: 'PAYMENT_EXPENSE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["이수여부"],  		ref: 'EDU_PASS_YN',    			type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonUseYn',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwEducation = _SBGrid.create(SBGridProperties);
        //gvwEducation.bind('beforepagechanged', 'fn_pagingEducationList');
    }

    function fn_createGvwPrizeGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwPrize';
        SBGridProperties.id 				= 'gvwPrize';
        SBGridProperties.jsonref 			= 'jsonPrizeList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["상벌구분"], 	        ref: 'PRIZE_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPrizeType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }},
            {caption: ["상벌일자"],        ref: 'PRIZE_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["상벌유형"],  		ref: 'PRIZE_CATEGORY',    			type:'output',  	width:'120px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPrizeCategory',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["사내외구분"],        ref: 'PRIZE_INOUT_TYPE', 		     type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPrizeInoutType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["대상구분"],        ref: 'PRIZE_TARGET', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPrizeTarget',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["상벌명"],        ref: 'PRIZE_NAME', 		     type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["상벌사유"],        ref: 'PRIZE_REASON', 		     type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["상벌내용"],        ref: 'PRIZE_DETAIL', 		     type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["시행기관"],        ref: 'PRIZE_MAKER', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["징계시작일"],        ref: 'PUNISH_START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["징계종료일"],        ref: 'PUNISH_END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["급여반영여부"],  		ref: 'APPLY_PAY_YN',    			type:'output',  	width:'90px',  	style:'text-align:left'},
            {caption: ["급여감봉율"],  		ref: 'BASE_PAY_DOWN_RATE',    			type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["상여감봉율"],        ref: 'BONUS_PAY_DOWN_RATE', 		     type:'output',  	width:'80px',  	style:'text-align:left'}
        ];

        gvwPrize = _SBGrid.create(SBGridProperties);
        //gvwPrize.bind('beforepagechanged', 'fn_pagingPrizeList');
    }

    function fn_createGvwHealthGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwHealth';
        SBGridProperties.id 				= 'gvwHealth';
        SBGridProperties.jsonref 			= 'jsonHealthList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["검진구분"], 	        ref: 'CHECK_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCheckType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["검진일자"],        ref: 'CHECK_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["검진기관"],  		ref: 'CHECK_INSTITUTE',    			type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["검진결과"],        ref: 'RESULT', 		     type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["회사조치사항"],        ref: 'COMPANY_RESULT', 		     type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'}
        ];

        gvwHealth = _SBGrid.create(SBGridProperties);
        //gvwHealth.bind('beforepagechanged', 'fn_pagingHealthList');
    }

    function fn_createGvwAppointmentGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwAppointment';
        SBGridProperties.id 				= 'gvwAppointment';
        SBGridProperties.jsonref 			= 'jsonAppointmentList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["발령일자"], 	        ref: 'APPOINT_DATE',    	 type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["시작일자"],        ref: 'START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["종료일자"],        ref: 'END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["발령구분"],  		ref: 'APPOINT_TYPE',    			type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["발령명칭"],        ref: 'APPOINT_TITLE', 		     type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["발령부서"],        ref: 'DEPT_CODE2', 		     type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["발령직위"],        ref: 'POSITION_CODE2', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["발령직책"],        ref: 'DUTY_CODE2', 		     type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["발령직급"],        ref: 'JOB_RANK2', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["발령직군"],        ref: 'JOB_GROUP2', 		     type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["발령직무"],        ref: 'JOB_CODE2', 		     type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["발령근무지"],  		ref: 'REGION_CODE2',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["발령사유"],  		ref: 'APPOINT_REASON',    			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwAppointment = _SBGrid.create(SBGridProperties);
        //gvwAppointment.bind('beforepagechanged', 'fn_pagingAppointmentList');
    }

    function fn_createGvwAddJobGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwAddJob';
        SBGridProperties.id 				= 'gvwAddJob';
        SBGridProperties.jsonref 			= 'jsonAddJobList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["겸직발령일자"], 	        ref: 'START_DATE',    	        type:'output',  	width:'104px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["겸직해제일자"],        ref: 'END_DATE', 		     type:'output',  	width:'119px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["겸직부서"],  		ref: 'DEPT_CODE',    			type:'output',  	width:'126px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonAddJobDeptCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["겸직직위"],        ref: 'POSITION_CODE', 		     type:'output',  	width:'113px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["겸직직책"],        ref: 'DUTY_CODE', 		     type:'output',  	width:'115px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["겸직직급"],        ref: 'JOB_RANK', 		     type:'output',  	width:'163px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonJobRank',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            }
        ];

        gvwAddJob = _SBGrid.create(SBGridProperties);
        //gvwAddJob.bind('beforepagechanged', 'fn_pagingAddJobList');
    }

    function fn_createGvwTimeOffHistoryGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwTimeOffHistory';
        SBGridProperties.id 				= 'gvwTimeOffHistory';
        SBGridProperties.jsonref 			= 'jsonTimeOffHistoryList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["휴직유형"], 	        ref: 'TIME_OFF_TYPE',    	        type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonTimeOffType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["적용시작일"],        ref: 'START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["적용종료일"],        ref: 'END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["휴직일수"],        ref: 'TIME_OFF_CNT', 		     type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["소속사업장"],        ref: 'SITE_CODE', 		     type:'output',  	width:'120px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["소속부서코드"],  		ref: 'DEPT_CODE',    			type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["소속부서"],        ref: 'DEPT_NAME', 		     type:'output',  	width:'150px',  	style:'text-align:left'}, // TODO: P_ORG001 팝업 적용 필요
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwTimeOffHistory = _SBGrid.create(SBGridProperties);
        //gvwTimeOffHistory.bind('beforepagechanged', 'fn_pagingTimeOffHistoryList');
    }

    function fn_createGvwGroupInsuranceGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwGroupInsurance';
        SBGridProperties.id 				= 'gvwGroupInsurance';
        SBGridProperties.jsonref 			= 'jsonGroupInsuranceList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["보험상품"], 	        ref: 'GROUP_INSURE_CODE',    	        type:'output',  	width:'150px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonGroupInsureCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["증권번호"],        ref: 'INSURE_NUM', 		     type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["보험가입일"],        ref: 'INSURE_START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["보험만기일"],        ref: 'INSURE_DUE_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["보험해지일"],        ref: 'INSURE_END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["불입금액"],        ref: 'GROUP_INSURE_AMT', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'}
        ];

        gvwGroupInsurance = _SBGrid.create(SBGridProperties);
        //gvwGroupInsurance.bind('beforepagechanged', 'fn_pagingGroupInsuranceList');
    }

    function fn_createGvwDiseaseGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDisease';
        SBGridProperties.id 				= 'gvwDisease';
        SBGridProperties.jsonref 			= 'jsonDiseaseList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["구분"], 	        ref: 'DISEASE_TYPE',    	        type:'output',  	width:'120px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDiseaseType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["발생사유"],        ref: 'DISEASE_REASON', 		     type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["사고발생일"],        ref: 'DISEASE_START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["병가신청여부"],        ref: 'SICK_LEAVE_REQUEST_YN', 		     type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["병가일자(유료) 시작일"],        ref: 'SICK_LEAVE_CHARGE_DATE_FR', 		     type:'output',  	width:'130px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["병가일자(유료) 종료일"],        ref: 'SICK_LEAVE_CHARGE_DATE_TO', 		     type:'output',  	width:'130px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["병가일자(무료) 시작일"],        ref: 'SICK_LEAVE_FREE_DATE_FR', 		     type:'output',  	width:'130px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["병가일자(무료) 종료일"],        ref: 'SICK_LEAVE_FREE_DATE_TO', 		     type:'output',  	width:'130px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["단체근로자보험신청여부"],        ref: 'GROUP_INSURE_REQUEST_YN', 		     type:'output',  	width:'150px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'}
        ];

        gvwDisease = _SBGrid.create(SBGridProperties);
        //gvwDisease.bind('beforepagechanged', 'fn_pagingDiseaseList');
    }

    function fn_createGvwPersonnelEvaluationGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwPersonnelEvaluation';
        SBGridProperties.id 				= 'gvwPersonnelEvaluation';
        SBGridProperties.jsonref 			= 'jsonPersonnelEvaluationList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["평가년도"], 	        ref: 'EVAL_YEAR',    	        type:'output',  	width:'70px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy'},
                format : {type:'year', rule:'yyyy', origin:'YYYY'}
            },
            {caption: ["평가차수"],        ref: 'POSITION_CODE', 		     type:'output',  	width:'120px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonEvalPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["성과평가"],        ref: 'EVAL_KPI_GRADE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["역량평가"],        ref: 'EVAL_KBI_GRADE', 		     type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'}
        ];

        gvwPersonnelEvaluation = _SBGrid.create(SBGridProperties);
        //gvwPersonnelEvaluation.bind('beforepagechanged', 'fn_pagingPersonnelEvaluationList');
    }

    function fn_createGvwOfficialInjuryGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwOfficialInjury';
        SBGridProperties.id 				= 'gvwOfficialInjury';
        SBGridProperties.jsonref 			= 'jsonOfficialInjuryList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["사고발생일"],        ref: 'OFFICIAL_INJURY_START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["사고내용"], 	        ref: 'OFFICIAL_INJURY_DESCR',    	        type:'output',  	width:'300px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'200px',  	style:'text-align:left'}
        ];

        gvwOfficialInjury = _SBGrid.create(SBGridProperties);
        //gvwOfficialInjury.bind('beforepagechanged', 'fn_pagingOfficialInjuryList');
    }

    function fn_createGvwContractDegGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwContractDeg';
        SBGridProperties.id 				= 'gvwContractDeg';
        SBGridProperties.jsonref 			= 'jsonContractDegList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["계약차수"], 	        ref: 'CONTRACT_DEGREE',    	        type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonContractDegree',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["계약시작일"],        ref: 'CONTRACT_START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["계약종료일"],        ref: 'CONTRACT_END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["계약기간"],        ref: 'CONTRACT_DAY', 		     type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["계약변경사항"],        ref: 'CONTRACT_CHANGE_MEMO', 		     type:'output',  	width:'250px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'250px',  	style:'text-align:left'}
        ];

        gvwContractDeg = _SBGrid.create(SBGridProperties);
        //gvwContractDeg.bind('beforepagechanged', 'fn_pagingContractDegList');
    }

    function fn_createGvwWorkPlanGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwWorkPlan';
        SBGridProperties.id 				= 'gvwWorkPlan';
        SBGridProperties.jsonref 			= 'jsonWorkPlanList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["근무계획"], 	        ref: 'WORKPLAN_TYPE',    	        type:'output',  	width:'167px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWorkplanType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["적용시작일"],        ref: 'START_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["적용종료일"],        ref: 'END_DATE', 		     type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
        ];

        gvwWorkPlan = _SBGrid.create(SBGridProperties);
        //gvwWorkPlan.bind('beforepagechanged', 'fn_pagingWorkPlanList');
    }

    function fn_createGvwEmpGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwEmp';
        SBGridProperties.id 				= 'gvwEmp';
        SBGridProperties.jsonref 			= 'jsonEmpList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [""], 	        ref: 'CHK_YN',    	        type:'checkbox',  	width:'45px',  	style:'text-align:left', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }}},
            {caption: ["부서코드"],        ref: 'DEPT_CODE', 		     type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서"],  		ref: 'DEPT_NAME',    			type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["사번"],        ref: 'EMP_CODE', 		     type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["이름"],        ref: 'EMP_NAME', 		     type:'output',  	width:'94px',  	style:'text-align:left'},
            {caption: ["입사일"],        ref: 'ENTER_DATE', 		     type:'output',  	width:'95px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["비고"],        ref: 'MEMO', 		     type:'output',  	width:'218px',  	style:'text-align:left'},
            {caption: ["시작일자"],        ref: 'START_DATE', 		     type:'output',  	width:'122px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["종료일자"],        ref: 'END_DATE', 		     type:'output',  	width:'108px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["순번"],        ref: 'TXN_ID', 		     type:'output',  	width:'54px',  	style:'text-align:left'},
            {caption: ["사원별적용"],        ref: 'EMP_BASE_FLAG', 		     type:'checkbox',  	width:'82px',  	style:'text-align:left'},
            {caption: ["근무패턴코드"],  		ref: 'WORK_PATTERN_CODE',    			type:'output',  	width:'116px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWorkPatternCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["퇴사일"],        ref: 'RETIRE_DATE', 		     type:'output',  	width:'106px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["재직구분"],  		ref: 'EMP_STATE',    			type:'output',  	width:'85px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonEmpState',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["직위"],  		ref: 'POSITION_CODE',    			type:'output',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["직책"],  		ref: 'DUTY_CODE',    			type:'output',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonDutyCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["직급"],  		ref: 'JOB_RANK',    			type:'output',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonJobRank',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            }
        ];

        gvwEmp = _SBGrid.create(SBGridProperties);
        //gvwEmp.bind('beforepagechanged', 'fn_pagingEmpList');
    }

    function fn_createGvwExpenditurewelfareGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwExpenditurewelfare';
        SBGridProperties.id 				= 'gvwExpenditurewelfare';
        SBGridProperties.jsonref 			= 'jsonExpenditurewelfareList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["경조일자"], 	        ref: 'WELFARE_DATE',    	        type:'output',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["신청년월"],        ref: 'REQUEST_YM', 		     type:'output',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm'},
                format : {type:'month', rule:'yyyy-mm', origin:'YYYYMM'}
            },
            {caption: ["경조구분"],        ref: 'WELFARE_CODE', 		     type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["경조사유"],        ref: 'WELFARE_TYPE', 		     type:'output',  	width:'150px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWelfareType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["가족관계"],  		ref: 'RELATION',    			type:'output',  	width:'80px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonRelation',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["경조대상자 이름"],        ref: 'NAME', 		     type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["경조금액"],        ref: 'WELFARE_AMOUNT', 		     type:'output',  	width:'120px',  	style:'text-align:left'},
            {caption: ["비고"],        ref: 'DESCRIPTION', 		     type:'output',  	width:'300px',  	style:'text-align:left'}
        ];

        gvwExpenditurewelfare = _SBGrid.create(SBGridProperties);
        //gvwExpenditurewelfare.bind('beforepagechanged', 'fn_pagingExpenditurewelfareList');
    }

    // 행 추가
    const fn_addRowForGvwFamily = function() {
        let rowVal = gvwFamily.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwFamily.addRow(true);
        }else{
            gvwFamily.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwSchool = function() {
        let rowVal = gvwSchool.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwSchool.addRow(true);
        }else{
            gvwSchool.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwCareer = function() {
        let rowVal = gvwCareer.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwCareer.addRow(true);
        }else{
            gvwCareer.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwLicense = function() {
        let rowVal = gvwLicense.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwLicense.addRow(true);
        }else{
            gvwLicense.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwLanguage = function() {
        let rowVal = gvwLanguage.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwLanguage.addRow(true);
        }else{
            gvwLanguage.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwComputerSkill = function() {
        let rowVal = gvwComputerSkill.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwComputerSkill.addRow(true);
        }else{
            gvwComputerSkill.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwFile = function() {
        let rowVal = gvwFile.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwFile.addRow(true);
        }else{
            gvwFile.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwEducation = function() {
        let rowVal = gvwEducation.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwEducation.addRow(true);
        }else{
            gvwEducation.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwPrize = function() {
        let rowVal = gvwPrize.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwPrize.addRow(true);
        }else{
            gvwPrize.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwHealth = function() {
        let rowVal = gwHealth.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gwHealth.addRow(true);
        }else{
            gwHealth.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwAppointment = function() {
        let rowVal = gvwAppointment.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwAppointment.addRow(true);
        }else{
            gvwAppointment.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwAddJob = function() {
        let rowVal = gvwAddJob.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwAddJob.addRow(true);
        }else{
            gvwAddJob.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwTimeOffHistory = function() {
        let rowVal = gvwTimeOffHistory.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwTimeOffHistory.addRow(true);
        }else{
            gvwTimeOffHistory.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwGroupInsurance = function() {
        let rowVal = gvwGroupInsurance.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwGroupInsurance.addRow(true);
        }else{
            gvwGroupInsurance.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwDisease = function() {
        let rowVal = gvwDisease.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwDisease.addRow(true);
        }else{
            gvwDisease.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwPersonnelEvaluation = function() {
        let rowVal = gvwPersonnelEvaluation.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwPersonnelEvaluation.addRow(true);
        }else{
            gvwPersonnelEvaluation.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwOfficialInjury = function() {
        let rowVal = gvwOfficialInjury.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwOfficialInjury.addRow(true);
        }else{
            gvwOfficialInjury.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwContractDeg = function() {
        let rowVal = gvwContractDeg.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwContractDeg.addRow(true);
        }else{
            gvwContractDeg.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwWorkPlan = function() {
        let rowVal = gvwWorkPlan.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwWorkPlan.addRow(true);
        }else{
            gvwWorkPlan.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwEmp = function() {
        let rowVal = gvwEmp.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwEmp.addRow(true);
        }else{
            gvwEmp.insertRow(rowVal);
        }
    }

    const fn_addRowForGvwExpenditurewelfare = function() {
        let rowVal = gvwExpenditurewelfare.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwExpenditurewelfare.addRow(true);
        }else{
            gvwExpenditurewelfare.insertRow(rowVal);
        }
    }

    //선택된 행 삭제
    const fn_deleteRowForGvwFamily = function() {

        let grdRows = gvwFamily.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwFamily.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwFamily.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwFamily.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwSchool = function() {

        let grdRows = gvwSchool.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwSchool.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwSchool.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwSchool.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwCareer = function() {

        let grdRows = gvwCareer.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwCareer.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwCareer.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwCareer.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwLicense = function() {

        let grdRows = gvwLicense.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwLicense.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwLicense.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwLicense.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwLanguage = function() {

        let grdRows = gvwLanguage.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwLanguage.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwLanguage.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwLanguage.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwComputerSkill = function() {

        let grdRows = gvwComputerSkill.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwComputerSkill.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwComputerSkill.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwComputerSkill.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwFile = function() {

        let grdRows = gvwFile.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwFile.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwFile.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwFile.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwEducation = function() {

        let grdRows = gvwEducation.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwEducation.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwEducation.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwEducation.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwPrize = function() {

        let grdRows = gvwPrize.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwPrize.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwPrize.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwPrize.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwHealth = function() {

        let grdRows = gvwHealth.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwHealth.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwHealth.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwHealth.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwAppointment = function() {

        let grdRows = gvwAppointment.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwAppointment.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwAppointment.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwAppointment.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwAddJob = function() {

        let grdRows = gvwAddJob.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwAddJob.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwAddJob.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwAddJob.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwTimeOffHistory = function() {

        let grdRows = gvwTimeOffHistory.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwTimeOffHistory.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwTimeOffHistory.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwTimeOffHistory.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwGroupInsurance = function() {

        let grdRows = gvwGroupInsurance.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwGroupInsurance.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwGroupInsurance.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwGroupInsurance.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwDisease = function() {

        let grdRows = gvwDisease.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwDisease.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwDisease.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwDisease.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwPersonnelEvaluation = function() {

        let grdRows = gvwPersonnelEvaluation.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwPersonnelEvaluation.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwPersonnelEvaluation.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwPersonnelEvaluation.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwOfficialInjury = function() {

        let grdRows = gvwOfficialInjury.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwOfficialInjury.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwOfficialInjury.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwOfficialInjury.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwContractDeg = function() {

        let grdRows = gvwContractDeg.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwContractDeg.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwContractDeg.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwContractDeg.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwWorkPlan = function() {

        let grdRows = gvwWorkPlan.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwWorkPlan.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwWorkPlan.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwWorkPlan.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwEmp = function() {

        let grdRows = gvwEmp.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwEmp.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwEmp.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwEmp.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    const fn_deleteRowForGvwExpenditurewelfare = function() {

        let grdRows = gvwExpenditurewelfare.getCheckedRows(0);
        let delList = [];

        for(let i=grdRows.length; i>0; i--){
            let nRow = grdRows[i-1];
            let rowData = gvwExpenditurewelfare.getRowData(nRow)
            if(rowData.addYn == "Y"){
                gvwExpenditurewelfare.deleteRow(nRow);
            }else {
                delList.push(rowData);
                gvwExpenditurewelfare.deleteRow(nRow);
            }
        }

        if (grdRows.length < 1) {
            gfn_comAlert("W0003", "행삭제")				//W0003	{0}할 대상이 없습니다.
            return;
        }
        if(delList.length > 0){
            if(gfn_comConfirm("Q0001", "등록된 행입니다. ", "삭제")){
                //fn_delete(delList);
            }
        }
    }

    //선택 삭제
    const fn_delete = async function(comUiList) {

        const postJsonPromise = gfn_postJSON("/co/menu/deleteComUiList.do", comUiList);
        const data = await postJsonPromise;

        try{
            if(_.isEqual("S", data.resultStatus)){
                gfn_comAlert("I0001");					// I0001 처리 되었습니다.
            }else{
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
     * 사원 목록 조회
     */
    const fn_pagingEmpList = async function() {
        let recordCountPerPage 	= gvwList.getPageSize();   			// 몇개의 데이터를 가져올지 설정
        let currentPageNo 		= gvwList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
        var getColRef 			= gvwList.getColRef("checked");
        gvwList.setFixedcellcheckboxChecked(0, getColRef, false);
        fn_setEmpList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setEmpList = async function(pageSize, pageNo) {
        let COMP_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_COMP_CODE"));
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
            V_P_DEBUG_MODE_YN	: 'N'
            ,V_P_LANG_ID		: 'KOR'
            ,V_P_COMP_CODE		: COMP_CODE
            ,V_P_CLIENT_CODE	: ''
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
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {

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
