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
                </h3>
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnSearch" name="btnSearch" 	uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="신규" class="btn btn-sm btn-outline-danger" onclick="fn_create" ></sbux-button>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
                <sbux-button id="btnDelete" name="btnDelete" uitype="normal" class="btn btn-sm btn-outline-danger" text="삭제" onclick="fn_delete"></sbux-button>
                <sbux-button id="btnRegistCommonCode" name="btnRegistCommonCode" uitype="normal" class="btn btn-sm btn-outline-danger" text="공통코드등록" onclick="fn_registCommonCode"></sbux-button>
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
                    <th scope="row" class="th_bg">사업장</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">재직구분</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
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
                                        <sbux-select id="POSITION_CODE" uitype="single" jsondata-ref="jsonJobCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                                        <sbux-select id="JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">호봉</th>
                                    <td class="td_input">
                                        <sbux-select id="SALARY_CLASS" uitype="single" jsondata-ref="jsonSalaryClass" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">이름(영문)</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="EMP_NAME_ENG" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">성별</th>
                                    <td class="td_input">
                                        <sbux-select id="GENDER" uitype="single" jsondata-ref="jsonGender" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">나이</th>
                                    <td class="td_input">
                                        <sbux-input id="AGE" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">직원하위그룹</th>
                                    <td class="td_input">
                                        <sbux-select id="JOB_FAMILY" uitype="single" jsondata-ref="jsonJobFamily" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                                        <sbux-select id="DUTY_CODE" uitype="single" jsondata-ref="jsonDutyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="DUTY_CODE_PERIOD" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">직무</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="JOB_CODE" uitype="single" jsondata-ref="jsonJobCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-select id="JOB_SUB_CODE" uitype="single" jsondata-ref="jsonSubJobCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-select id="JOB_DETAIL_CODE" uitype="single" jsondata-ref="jsonDetailJobCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <td class="td_input">
                                        <sbux-input id="JOB_CODE_PERIOD" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">인건비분류</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="LABOR_COST_GROUP" uitype="single" jsondata-ref="jsonLaborCostGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">직급</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="JOB_RANK" uitype="single" jsondata-ref="jsonJobRank" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                                        <sbux-select id="SITE_CODE" uitype="single" jsondata-ref="jsonJobCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                                        <sbux-select id="WORK_REGION" uitype="single" jsondata-ref="jsonWorkRegion" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">사원구분</th>
                                    <td class="td_input">
                                        <sbux-select id="EMP_TYPE" uitype="single" jsondata-ref="jsonEmpType" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                                        <sbux-select id="PARTNER_FIRM_CODE" uitype="single" jsondata-ref="jsonPartnerFirmCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">겸직직책</th>
                                    <td class="td_input">
                                        <sbux-select id="DUTY_CODE2" uitype="single" jsondata-ref="jsonDutyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                                        <sbux-select id="START_POSITION_CODE" uitype="single" jsondata-ref="jsonPositionCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">인정경력</th>
                                    <td class="td_input">
                                        <sbux-input id="CAREER_TRACK" class="form-control input-sm" uitype="text" required style="width:100%"></sbux-input><span>개월</span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">입사구분</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-select id="ENTER_TYPE" uitype="single" jsondata-ref="jsonEnterType" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                            <%@ include file="./hri1000TabContents.jsp" %>
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

        let rst = await Promise.all([
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
        gvwList.bind('click', 'fn_view');
        gvwList.bind('beforepagechanged', 'fn_pagingTotalEmpList');
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
     * 신규등록
     */
    const fn_create = async function() {
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
        SBUxMethod.set("DUTY_CODE", "");
        SBUxMethod.set("DUTY_CODE_PERIOD", "");
        SBUxMethod.set("JOB_CODE", "");
        SBUxMethod.set("JOB_SUB_CODE", "");
        SBUxMethod.set("JOB_DETAIL_CODE", "");
        SBUxMethod.set("JOB_CODE_PERIOD", "");
        SBUxMethod.set("LABOR_COST_GROUP", "");
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
        SBUxMethod.set("WORK_REGION", "");
        SBUxMethod.set("EMP_TYPE", "");
        SBUxMethod.set("PARTNER_FIRM_EMP_YN", "");
        SBUxMethod.set("PARTNER_FIRM_CODE", "");
        SBUxMethod.set("DUTY_CODE2", "");
        SBUxMethod.set("EMP_STATE", "");
        SBUxMethod.set("OLD_EMP_CODE", "");
        SBUxMethod.set("OLD_EMP_NAME", "");
        SBUxMethod.set("START_POSITION_CODE", "");
        SBUxMethod.set("CAREER_TRACK", "");
        SBUxMethod.set("ENTER_TYPE", "");
        SBUxMethod.set("INTRODUCER_CODE", "");
        SBUxMethod.set("INTRODUCER_NAME", "");
        SBUxMethod.set("CAREER_DATE", "");
        SBUxMethod.set("START_PAY_GRADE", "");
        SBUxMethod.set("CAREER_TRACK_ENTER_DATE", "");
        SBUxMethod.set("ENTER_DATE", "");
        SBUxMethod.set("ANNUAL_INITIAL_DATE", "");
        SBUxMethod.set("ANNUAL_BASE_DATE", "");
        SBUxMethod.set("CURRENT_PAY_GRADE", "");
        SBUxMethod.set("CURRENT_PAY_GRADE_DATE", "");

        clearTabContents();
    }

    /**
     * 저장
     */
    const fn_save = async function() {

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
     * 공통코드등록
     */
    const fn_registCommonCode = async function() {

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

    }

    /**
     * 퇴사발령등록
     */
    const fn_registResignation = async function() {

    }

    /**
     * 사원 목록 조회
     */
    const fn_pagingTotalEmpList = async function() {
        let recordCountPerPage 	= gvwList.getPageSize();   			// 몇개의 데이터를 가져올지 설정
        let currentPageNo 		= gvwList.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
        var getColRef 			= gvwList.getColRef("checked");
        gvwList.setFixedcellcheckboxChecked(0, getColRef, false);
        fn_setTotalEmpList(recordCountPerPage, currentPageNo);
    }

    /**
     * @param {number} pageSize
     * @param {number} pageNo
     */
    const fn_setTotalEmpList = async function(pageSize, pageNo) {
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
        console.log('masterData:', masterData);
        console.log('detailData:', detailData);
        try {
            if (_.isEqual("S", masterData.resultStatus)) {

                // master 정보
                var data = masterData.cv_2[0];


            } else {
                alert(data.resultMessage);
            }

            if (_.isEqual("S", detailData.resultStatus)) {

                // detail 정보
                // 기본인적사항
                detailData.cv_3[0];

                // 주거/생활/신체
                detailData.cv_4[0];

                // 가족사항
                detailData.cv_5.forEach((item, index) => {
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

                // 학력사항
                detailData.cv_6.forEach((item, index) => {
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

                // 경력사항
                detailData.cv_7.forEach((item, index) => {
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

                // 자격사항
                detailData.cv_8.forEach((item, index) => {
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

                // 어학사항
                detailData.cv_9.forEach((item, index) => {
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
                    jsonEmpTotalList.push(msg);
                });

                // 인사파일
                detailData.cv_11.forEach((item, index) => {
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

                // 병역사항
                detailData.cv_13[0];

                // 보훈사항
                detailData.cv_14[0];

                // 보증보험
                detailData.cv_15[0];

                // 상벌사항
                detailData.cv_16.forEach((item, index) => {
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

                // 건강검진내역
                detailData.cv_17.forEach((item, index) => {
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

                // 발령사항
                detailData.cv_18.forEach((item, index) => {
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

                // 겸직부서
                detailData.cv_37.forEach((item, index) => {
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

                // 휴직이력
                detailData.cv_19.forEach((item, index) => {
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

                // 단체보험
                detailData.cv_20.forEach((item, index) => {
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

                // 상해/질병정보
                detailData.cv_21.forEach((item, index) => {
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

                // 평가항목
                detailData.cv_22.forEach((item, index) => {
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

                // 공상발생
                detailData.cv_23.forEach((item, index) => {
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

                // 계약차수
                detailData.cv_35.forEach((item, index) => {
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

                // 근무계획
                detailData.cv_38.forEach((item, index) => {
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

                // 근무조
                detailData.cv_39.forEach((item, index) => {
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

                // 경조사비
                detailData.cv_24.forEach((item, index) => {
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


        SBUxMethod.set("NATION_CODE", 			rowData.NATION_CODE);

    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
