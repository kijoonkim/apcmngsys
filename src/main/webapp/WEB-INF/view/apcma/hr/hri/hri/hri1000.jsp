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
                        <sbux-input id="SRCH_DEPT_CODE" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DEPT_NAME" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">사원</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
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
                        <div id="sb-area-gvwList" style="height:800px;"></div>
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
                        <div class="table-responsive tbl_scroll_sm">
                            <sbux-tabs id="idxTab_norm" name="idxTab_norm" uitype="normal" is-scrollable="false" jsondata-ref="jsonTabData">
                            </sbux-tabs>
                            <div class="tab-content">
                                <div id="tpgMasterSub">
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
                                                <sbux-input id="FAMILY_REGISTER_ZIP_CODE" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button id="btnZip1" name="btnUserEnd" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger"></sbux-button>
                                            </td>
                                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="FAMILY_REGISTER_ADDRESS" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
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
                                                <sbux-input id="REGISTER_ZIP_CODE" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button id="btnZip2" name="btnUserEnd" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger"></sbux-button>
                                            </td>
                                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="REGISTER_ADDRESS" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">휴대폰번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="CELLPHONE_NUM" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
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
                                                <sbux-input id="EMERGENCY_ZIP_CODE" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button id="btnZip3" name="btnUserEnd" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger"></sbux-button>
                                            </td>
                                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="EMERGENCY_ADDRESS" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">비상연락전화</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="EMERGENCY_TEL_NUM" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">현거주주소</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="RESIDENCE_ZIP_CODE" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-button id="btnZip4" name="btnUserEnd" uitype="normal" text="검색" class="btn btn-sm btn-outline-danger"></sbux-button>
                                            </td>
                                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="RESIDENCE_ADDRESS" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">자택전화번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="HOME_TEL_NUM" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">회사전화번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="OFFICE_TEL_NUM" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">FAX번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="FAX_NUM" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">내선번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="INTER_PHONE" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
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
                                                <sbux-input id="IN_EMAIL" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">사외이메일</th>
                                            <td colspan="3" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="OUT_EMAIL" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
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
                                                <sbux-input id="TELEWORKING_ADDRESS" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
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
                                                <sbux-input id="EMP_MEMO" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
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
                                <div id="tpgMasterSubDetail">주거/생활/신체</div>
                                <div id="tpgFAMILY">가족사항</div>
                                <div id="tpgSCHOOL">학력사항</div>
                                <div id="tpgCAREER">경력사항</div>
                                <div id="tpgLICENSE">자격사항</div>
                                <div id="tpgLANGUAGE">어학/컴퓨터활용능력</div>
                                <div id="tpgFILE">파일</div>
                                <div id="tpgEducation">교육사항</div>
                                <div id="tpgMasterSubDetail2">병역사항</div>
                                <div id="tpgMasterSubDetail3">보훈/장애/여권/비자</div>
                                <div id="tpgMasterSubDetail4">보증보험</div>
                                <div id="tpgPrize">상벌사항</div>
                                <div id="tpgHealth">건강검진내역</div>
                                <div id="tpgAppointment">발령사항</div>
                                <div id="tabPageEx1">겸직</div>
                                <div id="tpgTimeOffHistory">휴직이력</div>
                                <div id="tpgGroupInsurance">단체보험</div>
                                <div id="tpgDisease">상해/질병</div>
                                <div id="tpgPersonnelEvaluation">평가</div>
                                <div id="tpgOfficialInjury">공상발생</div>
                                <div id="tpgContractDeg">계약차수</div>
                                <div id="tpgWORKPLAN">근무계획</div>
                                <div id="tpgEmp">근무조</div>
                                <div id="tpgExpenditurewelfare">경조사비내역</div>
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
            gfnma_setComSelect(['SRCH_SITE_CODE', 'SITE_CODE'], jsonSiteCode, 'L_ORG001', '', '', 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 재직구분
            gfnma_setComSelect(['gvwList','SRCH_EMP_STATE', 'EMP_STATE'], jsonEmpState, 'L_HRI009', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직군
            gfnma_setComSelect(['SRCH_JOB_GROUP','JOB_GROUP'], jsonJobGroup, 'L_HRI047', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['gvwList', 'DUTY_CODE', 'DUTY_CODE2'], jsonDutyCode, 'L_HRI003', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직종
            gfnma_setComSelect(['JOB_FAMILY'], jsonJobFamily, 'L_HRI004', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 성별
            gfnma_setComSelect(['SRCH_GENDER', 'GENDER'], jsonGender, 'L_HRM002', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['gvwList', 'START_POSITION_CODE'], jsonPositionCode, 'L_HRI002', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직급
            gfnma_setComSelect(['JOB_RANK'], jsonJobRank, 'L_HRI005', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직무
            gfnma_setComSelect(['JOB_CODE'], jsonJobCode, 'L_HRI006', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['JOB_SUB_CODE'], jsonSubJobCode, 'L_HRI073_A', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['JOB_DETAIL_CODE'], jsonDetailJobCode, 'L_HRI073_B', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 입사구분
            gfnma_setComSelect(['ENTER_TYPE'], jsonEnterType, 'L_HRI041_01', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 양력/음력
            gfnma_setComSelect(['BIRTHDAY_TYPE'], jsonBirthdayType, 'L_HRM001', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
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
        ]);
    }

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {

        fn_initSBSelect();
        fn_createGrid();
        fn_search();
    });

    //grid 초기화
    var gvwList; 			// 그리드를 담기위한 객체 선언
    var jsonEmpList = []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
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
        gvwList.bind('beforepagechanged', 'fn_pagingEmpList');
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
</html>
