<%
    /**
     * @Class Name 		: hri1100.jsp
     * @Description 	: 인사정보조회(인사담당자용) 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.05.13
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.05.13   	이경한		최초 생성
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
    <title>title : 인사정보조회(인사담당자용)</title>
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
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 3%">
                    <col style="width: 3%">

                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 3%">
                    <col style="width: 3%">

                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">

                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">법인</th>
                    <td colspan="5" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_COMP_CODE" uitype="single" jsondata-ref="jsonCompCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">사업장</th>
                    <td colspan="5" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">재직구분</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">부서</th>
                    <td colspan="5" class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_DEPT_CODE" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                        <sbux-input id="SRCH_DEPT_NAME" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">직책</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_DUTY_CODE" uitype="single" jsondata-ref="jsonDutyCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">직종</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_JOB_FAMILY" uitype="single" jsondata-ref="jsonJobFamily" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">성별</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_GENDER" uitype="single" jsondata-ref="jsonGender" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">급여영역</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_PAY_AREA_TYPE" uitype="single" jsondata-ref="jsonPayAreaType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">사번</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">이름</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" style="width:200px" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">직위</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_POSITION_CODE" uitype="single" jsondata-ref="jsonPositionCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">직급</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_JOB_RANK" uitype="single" jsondata-ref="jsonJobRank" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">직무</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_JOB_CODE" uitype="single" jsondata-ref="jsonJobCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">기산일</th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
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
                <div>
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>인사정보조회</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwList" style="height:616px;"></div>
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
    var jsonPayAreaType = []; // 급여영역
    var jsonPositionCode = []; // 직위
    var jsonJobRank = []; // 직위
    var jsonJobCode = []; // 직무
    var jsonEnterType = []; // 입사구분
    var jsonArmyType = []; // 병역구분

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 법인
            gfnma_setComSelect(['SRCH_COMP_CODE'], jsonCompCode, 'L_ORG000', '', '', 'COMP_CODE', 'COMP_NAME', 'Y', ''),
            // 사업장
            gfnma_setComSelect(['SRCH_SITE_CODE'], jsonSiteCode, 'L_ORG001', '', '', 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 재직구분
            gfnma_setComSelect(['SRCH_EMP_STATE'], jsonEmpState, 'L_HRI009', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직책
            gfnma_setComSelect(['SRCH_DUTY_CODE'], jsonDutyCode, 'L_HRI003', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직종
            gfnma_setComSelect(['SRCH_JOB_FAMILY'], jsonJobFamily, 'L_HRI004', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 성별
            gfnma_setComSelect(['SRCH_GENDER'], jsonGender, 'L_HRM002', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 급여영역
            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['SRCH_POSITION_CODE'], jsonPositionCode, 'L_HRI002', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직급
            gfnma_setComSelect(['SRCH_JOB_RANK'], jsonJobRank, 'L_HRI005', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직무
            gfnma_setComSelect(['SRCH_JOB_CODE'], jsonJobCode, 'L_HRI006', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 입사구분
            gfnma_setComSelect(['gvwList'], jsonEnterType, 'L_HRI041_01', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 병역구분
            gfnma_setComSelect(['gvwList'], jsonArmyType, 'L_HRI019', '', '', 'SUB_CODE', 'CODE_NAME', 'Y', ''),
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
    var jsonHriList = []; 	// 그리드의 참조 데이터 주소 선언

    function fn_createGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwList';
        SBGridProperties.id 				= 'gvwList';
        SBGridProperties.jsonref 			= 'jsonHriList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.rowheader 			= 'seq';
        SBGridProperties.rowheadercaption 	= {seq: 'No'};
        SBGridProperties.rowheaderwidth 	= {seq: '60'};
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.paging = {
            'type' 			: 'page',
            'count' 		: 5,
            'size' 			: 20,
            'sorttype' 		: 'page',
            'showgoalpageui': true
        };
        SBGridProperties.columns = [
            {caption: ["담당"],		        	ref: 'DEPT_CODE1', 			        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["담당명"], 	        	ref: 'DEPT_NAME1',    	            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["실"],  		            ref: 'DEPT_CODE2',    			    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["실명"],                 	ref: 'DEPT_NAME2', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["팀"],                	ref: 'DEPT_CODE', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["팀명"],               	ref: 'DEPT_NAME', 		            type:'output',  	width:'115px',  style:'text-align:left'},
            {caption: ["귀속(코스트센터)"],      	ref: 'COST_DEPT_CODE', 		        type:'output',  	width:'92px',  	style:'text-align:left'},
            {caption: ["귀속(코스트센터명)"],     	ref: 'COST_DEPT_NAME', 		        type:'output',  	width:'127px',  style:'text-align:left'},
            {caption: ["사번"],                 	ref: 'EMP_CODE', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["성명"],                	ref: 'EMP_NAME', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["한자이름"],             	ref: 'EMP_NAME_CHN', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["영문이름"],             	ref: 'EMP_NAME_ENG', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["사원구분"],             	ref: 'EMP_TYPE_NAME', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["포지션"],              	ref: 'JOB_CODE', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["포지션명"],             	ref: 'JOB_CODE_NAME', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["직급"],               	ref: 'JOB_RANK_NAME', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["호봉"],               	ref: 'SALARY_CLASS_NAME', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["시급"],               	ref: 'HOURLY_BASE_AMT', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["직위"],               	ref: 'POSITION_CODE_NAME', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["직책"],               	ref: 'DUTY_CODE_NAME', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["인사하위영역"],          	ref: 'SITE_NAME', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["근무지"],              	ref: 'WORK_REGION', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["직군"],      	        ref: 'JOB_GROUP_GOBUN', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["사원하위영역"],          	ref: 'JOB_FAMILY_NAME', 		    type:'output',  	width:'86px',  	style:'text-align:left'},
            {caption: ["근무유형"],      	    ref: 'WORK_PATTERN_CODE', 		    type:'output',  	width:'61px',  	style:'text-align:left'},
            {caption: ["근무패턴명"],      	    ref: 'WORK_PATTERN_NAME', 		    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["연령"],      	        ref: 'AGE', 		                type:'output',  	width:'52px',  	style:'text-align:left'},
            {caption: ["연령(년초)"],      	    ref: 'AGE_YY', 		                type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["성별"],      	        ref: 'GENDER', 		                type:'output',  	width:'42px',  	style:'text-align:left'},
            {caption: ["주민등록번호"],      	    ref: 'SOCIAL_NUM_REAL', 		    type:'output',  	width:'85px',  	style:'text-align:left'},
            {caption: ["생년월일"],      	    ref: 'BIRTHDAY', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["근속개월"],      	    ref: 'ENTER_MONTH', 		        type:'output',  	width:'63px',  	style:'text-align:left'},
            {caption: ["인정경력"],      	    ref: 'CAREER_TRACK', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["총인정경력"],      	    ref: 'TOT_CAREER_TRACK', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["승진연차"],      	    ref: 'POSITION_YEAR', 		        type:'output',  	width:'55px',  	style:'text-align:left'},
            {caption: ["보임연차"],      	    ref: 'DUTY_YEAR', 		            type:'output',  	width:'60px',  	style:'text-align:left'},
            {caption: ["핸드폰번호"],      	    ref: 'CELLPHONE_NUM', 		        type:'output',  	width:'97px',  	style:'text-align:left'},
            {caption: ["E-MAIL(사내)"],      	ref: 'IN_EMAIL', 		            type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["E-MAIL(사외)"],      	ref: 'OUT_EMAIL', 		            type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["사내전화"],      	    ref: 'OFFICE_TEL_NUM', 		        type:'output',  	width:'81px',  	style:'text-align:left'},
            {caption: ["비상연락망"],      	    ref: 'EMERGENCY_TEL_NUM', 		    type:'output',  	width:'91px',  	style:'text-align:left'},
            {caption: ["고등학교"],      	    ref: 'HIGHSCHOOL_NAME', 		    type:'output',  	width:'128px',  style:'text-align:left'},
            {caption: ["졸업년도(고)"],      	    ref: 'HIGHSCHOOL_GRADUATE_DATE', 	type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["대학교"],              	ref: 'BACHELOR_SCHOOL_NAME', 		type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["학사(전공)"],           	ref: 'BACHELOR_MAJOR', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["졸업년도(학사)"],      	ref: 'BACHELOR_GRADUATE_DATE', 		type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["대학원(석)"],           	ref: 'MASTER_SCHOOL_NAME', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["석사(전공)"],           	ref: 'MASTER_MAJOR', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["졸업년도(석사)"],      	ref: 'MASTER_GRADUATE_DATE', 		type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["대학교(박)"],           	ref: 'DOCTOR_SCHOOL_NAME', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["박사(전공)"],           	ref: 'DOCTOR_MAJOR', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["졸업년도(박사)"],      	ref: 'DOCTOR_GRADUATE_DATE', 		type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["최종학력"],             	ref: 'LAST_SCHOOL_NAME', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["최종학교"],             	ref: 'LAST_MAJOR', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["전공"],      	        ref: 'LAST_GRADUATE_DATE', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["타사경력기간"],          	ref: 'CAREER', 		                type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["현주소 우편번호"],      	ref: 'RESIDENCE_ZIP_CODE', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["현주소"],      	        ref: 'RESIDENCE_ADDRESS', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["결혼여부"],      	    ref: 'MARRIAGE_YN', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["보훈대상"],      	    ref: 'VETERANS_YN', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["장애인구분"],      	    ref: 'HANDICAP', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["장애유형"],      	    ref: 'HANDICAP_GRADE', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["장애등급"],      	    ref: 'HANDICAP_TYPE', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["장애인정일"],      	    ref: 'HANDICAP_ISSUE_DATE', 		type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["중증여부"],      	    ref: 'HANDICAP_REASON', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["노조원구분"],      	    ref: 'UNION_JOIN_YN', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서1코드"],      	    ref: 'D1_CODE', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서1명"],      	        ref: 'D1_NAME', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서2코드"],      	    ref: 'D2_CODE', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서2명"],      	        ref: 'D2_NAME', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서3코드"],            	ref: 'D3_CODE', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서3명"],      	        ref: 'D3_NAME', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서4코드"],      	    ref: 'D4_CODE', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서4명"],      	        ref: 'D4_NAME', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서5코드"],      	    ref: 'D5_CODE', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서5명"],      	        ref: 'D5_NAME', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서6코드"],      	    ref: 'D6_NAME', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서6명"],      	        ref: 'D6_NAME', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서7코드"],      	    ref: 'D7_NAME', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["부서7명"],      	        ref: 'D7_NAME', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["입사일"],      	        ref: 'ENTER_DATE', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["근속기준일"],      	    ref: 'CAREER_DATE', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["당사입사일"],      	    ref: 'COMP_ENTER_DATE', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["그룹입사일"],      	    ref: 'GROUP_ENTER_DATE', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["연차기산일(재직)"],      	ref: 'ANNUAL_INITIAL_DATE', 		type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["연차기산일(퇴직)"],      	ref: 'ANNUAL_BASE_DATE', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["퇴직기산일"],      	    ref: 'RETIRE_BASE_DATE', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["승진일"],      	        ref: 'POSITION_DATE', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["승진기준일"],      	    ref: 'POSITION_DATE1', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["보임기준일"],      	    ref: 'DUTY_DATE', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["최종승호일"],      	    ref: 'LAST_SALARYCLASS_START_DATE', type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["퇴사일"],      	        ref: 'RETIRE_DATE', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["퇴사사유"],      	    ref: 'RETIRE_REASON', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["COLSOCIAL_NUM"],      	ref: 'COLSOCIAL_NUM', 		        type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["휴직여부"],      	    ref: 'HOLI_YN', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["재직구분"],      	    ref: 'EMP_STATE', 		            type:'output',  	width:'75px',  	style:'text-align:left'},
            {caption: ["입사구분"],      	    ref: 'ENTER_TYPE', 		            type:'output',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonEnterType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }},
            {caption: ["병역구분"],      	    ref: 'ARMY_TYPE', 		            type:'output',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonArmyType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }},
            {caption: ["협력사 최초 입사일"],      ref: 'PREV_ENTER_DATE', 		    type:'output',  	width:'75px',  	style:'text-align:left'},
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        gvwList.bind('beforepagechanged', 'fn_pagingHriList');
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
    const fn_pagingHriList = async function() {
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
        let COMP_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_COMP_CODE"));
        let SITE_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let EMP_STATE	    = gfnma_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let DEPT_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let DUTY_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_DUTY_CODE"));
        let JOB_FAMILY	    = gfnma_nvl(SBUxMethod.get("SRCH_JOB_FAMILY"));
        let GENDER	        = gfnma_nvl(SBUxMethod.get("SRCH_GENDER"));
        let PAY_AREA_TYPE	= gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE"));
        let EMP_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_NAME	    = gfnma_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        let POSITION_CODE	= gfnma_nvl(SBUxMethod.get("SRCH_POSITION_CODE"));
        let JOB_RANK	    = gfnma_nvl(SBUxMethod.get("SRCH_JOB_RANK"));
        let JOB_CODE	    = gfnma_nvl(SBUxMethod.get("SRCH_JOB_CODE"));
        let INITIAL_DATE	= gfnma_nvl(SBUxMethod.get("SRCH_INITIAL_DATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: 'N'
            ,V_P_LANG_ID		: 'KOR'
            ,V_P_COMP_CODE		: COMP_CODE
            ,V_P_CLIENT_CODE	: ''
            ,V_P_SITE_CODE      : SITE_CODE
            ,V_P_DEPT_CODE      : DEPT_CODE
            ,V_P_EMP_CODE       : EMP_CODE
            ,V_P_EMP_NAME       : EMP_NAME
            ,V_P_POSITION_CODE  : POSITION_CODE
            ,V_P_DUTY_CODE      : DUTY_CODE
            ,V_P_JOB_FAMILY     : JOB_FAMILY
            ,V_P_JOB_RANK       : JOB_RANK
            ,V_P_JOB_CODE       : JOB_CODE
            ,V_P_GENDER         : GENDER
            ,V_P_EMP_STATE      : EMP_STATE
            ,V_P_INITIAL_DATE   : INITIAL_DATE
            ,V_P_PAY_AREA_TYPE  : PAY_AREA_TYPE
            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri5100List.do", {
            getType				: 'json',
            workType			: 'LIST',
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
                         DEPT_CODE1                     : item.DEPT_CODE1
                        ,DEPT_NAME1                     : item.DEPT_NAME1
                        ,DEPT_CODE2                     : item.DEPT_CODE2
                        ,DEPT_NAME2                     : item.DEPT_NAME2
                        ,DEPT_CODE                      : item.DEPT_CODE
                        ,DEPT_NAME                      : item.DEPT_NAME
                        ,COST_DEPT_CODE                 : item.COST_DEPT_CODE
                        ,COST_DEPT_NAME                 : item.COST_DEPT_NAME
                        ,EMP_CODE                       : item.EMP_CODE
                        ,EMP_NAME                       : item.EMP_NAME
                        ,EMP_NAME_CHN                   : item.EMP_NAME_CHN
                        ,EMP_NAME_ENG                   : item.EMP_NAME_ENG
                        ,EMP_TYPE_NAME                  : item.EMP_TYPE_NAME
                        ,JOB_CODE                       : item.JOB_CODE
                        ,JOB_CODE_NAME                  : item.JOB_CODE_NAME
                        ,JOB_RANK_NAME                  : item.JOB_RANK_NAME
                        ,SALARY_CLASS_NAME              : item.SALARY_CLASS_NAME
                        ,HOURLY_BASE_AMT                : item.HOURLY_BASE_AMT
                        ,POSITION_CODE_NAME             : item.POSITION_CODE_NAME
                        ,DUTY_CODE_NAME                 : item.DUTY_CODE_NAME
                        ,SITE_NAME                      : item.SITE_NAME
                        ,WORK_REGION                    : item.WORK_REGION
                        ,JOB_GROUP_GOBUN                : item.JOB_GROUP_GOBUN
                        ,JOB_FAMILY_NAME                : item.JOB_FAMILY_NAME
                        ,WORK_PATTERN_CODE              : item.WORK_PATTERN_CODE
                        ,WORK_PATTERN_NAME              : item.WORK_PATTERN_NAME
                        ,AGE                            : item.AGE
                        ,AGE_YY                         : item.AGE_YY
                        ,GENDER                         : item.GENDER
                        ,SOCIAL_NUM_REAL                : item.SOCIAL_NUM_REAL
                        ,BIRTHDAY                       : item.BIRTHDAY
                        ,ENTER_MONTH                    : item.ENTER_MONTH
                        ,CAREER_TRACK                   : item.CAREER_TRACK
                        ,TOT_CAREER_TRACK               : item.TOT_CAREER_TRACK
                        ,POSITION_YEAR                  : item.POSITION_YEAR
                        ,DUTY_YEAR                      : item.DUTY_YEAR
                        ,CELLPHONE_NUM                  : item.CELLPHONE_NUM
                        ,IN_EMAIL                       : item.IN_EMAIL
                        ,OUT_EMAIL                      : item.OUT_EMAIL
                        ,OFFICE_TEL_NUM                 : item.OFFICE_TEL_NUM
                        ,EMERGENCY_TEL_NUM              : item.EMERGENCY_TEL_NUM
                        ,HIGHSCHOOL_NAME                : item.HIGHSCHOOL_NAME
                        ,HIGHSCHOOL_GRADUATE_DATE       : item.HIGHSCHOOL_GRADUATE_DATE
                        ,BACHELOR_SCHOOL_NAME           : item.BACHELOR_SCHOOL_NAME
                        ,BACHELOR_MAJOR                 : item.BACHELOR_MAJOR
                        ,BACHELOR_GRADUATE_DATE         : item.BACHELOR_GRADUATE_DATE
                        ,MASTER_SCHOOL_NAME             : item.MASTER_SCHOOL_NAME
                        ,MASTER_MAJOR                   : item.MASTER_MAJOR
                        ,MASTER_GRADUATE_DATE           : item.MASTER_GRADUATE_DATE
                        ,DOCTOR_SCHOOL_NAME             : item.DOCTOR_SCHOOL_NAME
                        ,DOCTOR_MAJOR                   : item.DOCTOR_MAJOR
                        ,DOCTOR_GRADUATE_DATE           : item.DOCTOR_GRADUATE_DATE
                        ,LAST_SCHOOL_NAME               : item.LAST_SCHOOL_NAME
                        ,LAST_MAJOR                     : item.LAST_MAJOR
                        ,LAST_GRADUATE_DATE             : item.LAST_GRADUATE_DATE
                        ,CAREER                         : item.CAREER
                        ,RESIDENCE_ZIP_CODE             : item.RESIDENCE_ZIP_CODE
                        ,RESIDENCE_ADDRESS              : item.RESIDENCE_ADDRESS
                        ,MARRIAGE_YN                    : item.MARRIAGE_YN
                        ,VETERANS_YN                    : item.VETERANS_YN
                        ,HANDICAP                       : item.HANDICAP
                        ,HANDICAP_GRADE                 : item.HANDICAP_GRADE
                        ,HANDICAP_TYPE                  : item.HANDICAP_TYPE
                        ,HANDICAP_ISSUE_DATE            : item.HANDICAP_ISSUE_DATE
                        ,HANDICAP_REASON                : item.HANDICAP_REASON
                        ,UNION_JOIN_YN                  : item.UNION_JOIN_YN
                        ,D1_CODE                        : item.D1_CODE
                        ,D1_NAME                        : item.D1_NAME
                        ,D2_CODE                        : item.D2_CODE
                        ,D2_NAME                        : item.D2_NAME
                        ,D3_CODE                        : item.D3_CODE
                        ,D3_NAME                        : item.D3_NAME
                        ,D4_CODE                        : item.D4_CODE
                        ,D4_NAME                        : item.D4_NAME
                        ,D5_CODE                        : item.D5_CODE
                        ,D5_NAME                        : item.D5_NAME
                        ,D6_NAME                        : item.D6_NAME
                        ,D6_NAME                        : item.D6_NAME
                        ,D7_NAME                        : item.D7_NAME
                        ,D7_NAME                        : item.D7_NAME
                        ,ENTER_DATE                     : item.ENTER_DATE
                        ,CAREER_DATE                    : item.CAREER_DATE
                        ,COMP_ENTER_DATE                : item.COMP_ENTER_DATE
                        ,GROUP_ENTER_DATE               : item.GROUP_ENTER_DATE
                        ,ANNUAL_INITIAL_DATE            : item.ANNUAL_INITIAL_DATE
                        ,ANNUAL_BASE_DATE               : item.ANNUAL_BASE_DATE
                        ,RETIRE_BASE_DATE               : item.RETIRE_BASE_DATE
                        ,POSITION_DATE                  : item.POSITION_DATE
                        ,POSITION_DATE1                 : item.POSITION_DATE1
                        ,DUTY_DATE                      : item.DUTY_DATE
                        ,LAST_SALARYCLASS_START_DATE    : item.LAST_SALARYCLASS_START_DATE
                        ,RETIRE_DATE                    : item.RETIRE_DATE
                        ,RETIRE_REASON                  : item.RETIRE_REASON
                        ,COLSOCIAL_NUM                  : item.COLSOCIAL_NUM
                        ,HOLI_YN                        : item.HOLI_YN
                        ,EMP_STATE                      : item.EMP_STATE
                        ,ENTER_TYPE                     : item.ENTER_TYPE
                        ,ARMY_TYPE                      : item.ARMY_TYPE
                        ,PREV_ENTER_DATE                : item.PREV_ENTER_DATE
                    }
                    jsonHriList.push(msg);
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
