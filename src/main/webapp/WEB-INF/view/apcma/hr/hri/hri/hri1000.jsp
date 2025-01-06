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
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
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
                <sbux-button id="btnPrint" name="btnPrint" uitype="normal" class="btn btn-sm btn-outline-danger" text="출력" onclick="fn_print()"></sbux-button>
                <sbux-button id="btnCopyHistory" name="btnCopyHistory" uitype="normal" class="btn btn-sm btn-outline-danger" text="이력복사" onclick="fn_copyHistory"></sbux-button>
                <sbux-button id="btnJoinCompnay" name="btnJoinCompnay" uitype="normal" class="btn btn-sm btn-outline-danger" text="입사처리" onclick="fn_joinCompnay"></sbux-button>
                <sbux-button id="btnRegistResignation" name="btnRegistResignation" uitype="normal" class="btn btn-sm btn-outline-danger" text="퇴사발령등록" onclick="fn_registResignation"></sbux-button>
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
                        <sbux-select id="SRCH_SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">재직구분</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">직군</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">성별</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-select id="SRCH_GENDER" uitype="single" jsondata-ref="jsonGender" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">부서</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-input id="SRCH_DEPT_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-input id="SRCH_DEPT_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_DEPT">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findSrchDeptCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg_search">사원</th>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-input id="SRCH_EMP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-input id="SRCH_EMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;" data-group="SRCH_EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_findEmpCode"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg_search">입사일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_ENTER_DATE_FR"
                                name="SRCH_ENTER_DATE_FR"
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
                                id="SRCH_ENTER_DATE_TO"
                                name="SRCH_ENTER_DATE_TO"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                        />
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">기산일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_INITIAL_DATE"
                                name="SRCH_INITIAL_DATE"
                                date-format="yyyy-mm-dd"
                                group-id="panHeader"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                required
                        />
                    </td>
                    <td colspan="3"></td>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>사원 리스트</span>
                                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwList" style="height:750px;"></div>
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
                                    <col style="width:10%">
                                    <col style="width:8%">
                                    <col style="width:12%">
                                    <col style="width:8%">
                                    <col style="width:12%">
                                    <col style="width:8%">
                                    <col style="width:12%">
                                    <col style="width:8%">
                                    <col style="width:12%">
                                    <col style="width:10%">
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
                                    <td class="td_input">
                                        <sbux-input id="EMP_CODE" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                                        <sbux-input id="EMP_PHOTO_PATH" class="form-control input-sm" uitype="hidden" style="width:100%;" readonly></sbux-input>
                                        <sbux-input id="EMP_PHOTO_NAME" class="form-control input-sm" uitype="hidden" style="width:100%;" readonly></sbux-input>
                                        <sbux-input id="SIGN_IMG_PATH" class="form-control input-sm" uitype="hidden" style="width:100%;" readonly></sbux-input>
                                        <sbux-input id="SIGN_IMG_NAME" class="form-control input-sm" uitype="hidden" style="width:100%;" readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>주민등록번호</th>
                                    <td colspan="2" class="td_input">
                                        <sbux-input id="DISPLAY_SOCIAL_NUM" class="form-control input-sm" uitype="text" style="width:100%;"></sbux-input>
                                        <sbux-input id="SOCIAL_NUM" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" mask = "999999-9999999" onchange="fnSocialNumChange(SOCIAL_NUM)" group-id="panInfo" required></sbux-input>
                                    </td>
                                    <td></td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>재직구분</th>
                                    <td class="td_input">
                                        <sbux-select id="EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="" class="form-control input-sm inpt_data_reqed" group-id="panInfo" required></sbux-select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>이름</th>
                                    <td class="td_input">
                                        <sbux-input id="EMP_NAME" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" required></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>생년월일</th>
                                    <td class="td_input">
                                        <sbux-input id="BIRTHDAY" class="form-control input-sm inpt_data_reqed" uitype="text" style="width:100%" mask = "{ 'alias': 'yyyy-mm-dd', 'autoUnmask': true}" group-id="panInfo" required></sbux-input>
                                    </td>
                                    <td class="td_input">
                                        <sbux-select id="BIRTHDAY_TYPE" uitype="single" jsondata-ref="jsonBirthdayType" unselected-text="" class="form-control input-sm inpt_data_reqed" group-id="panInfo" required></sbux-select>
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
                                    <th scope="row" class="th_bg"><span class="data_required"></span>사원구분</th>
                                    <td class="td_input">
                                        <sbux-select id="EMP_TYPE" uitype="single" jsondata-ref="jsonEmpType" unselected-text="선택" class="form-control input-sm inpt_data_reqed" group-id="panInfo" required></sbux-select>
                                    </td>
                                    <td class="td_input">
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
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">이름(영문)</th>
                                    <td class="td_input">
                                        <sbux-input id="EMP_NAME_ENG" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>성별</th>
                                    <td class="td_input">
                                        <sbux-select id="GENDER" uitype="single" jsondata-ref="jsonGender" unselected-text="선택" class="form-control input-sm inpt_data_reqed" group-id="panInfo" required></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">나이</th>
                                    <td class="td_input">
                                        <sbux-input id="AGE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">협력사</th>
                                    <td class="td_input">
                                        <sbux-select id="PARTNER_FIRM_CODE" uitype="single" jsondata-ref="jsonPartnerFirmCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">이름(한문)</th>
                                    <td class="td_input">
                                        <sbux-input id="EMP_NAME_CHN" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>입사구분</th>
                                    <td class="td_input">
                                        <%--<sbux-select id="ENTER_TYPE" uitype="single" jsondata-ref="jsonEnterType" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>--%>
                                        <div class="dropdown">
                                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="ENTER_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" group-id="panInfo" required>
                                                <font>선택</font>
                                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="ENTER_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                            </div>
                                        </div>
                                    </td>
                                    <th scope="row" class="th_bg"><span class="data_required"></span>입사일</th>
                                    <td class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="ENTER_DATE"
                                                name="ENTER_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                                style="width:100%;"
                                                group-id="panInfo"
                                                required
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">근속기준일</th>
                                    <td class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="CAREER_DATE"
                                                name="CAREER_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                                style="width:100%;"
                                        />
                                    </td>
                                    <td class="td_input" style="display:none;">
                                        <sbux-input id="DUTY_CODE_PERIOD" class="form-control input-sm" uitype="hidden" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">그룹입사일</th>
                                    <td class="td_input" style="border-right:hidden;">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="GROUP_ENTER_DATE"
                                                name="GROUP_ENTER_DATE"
                                                date-format="yyyy-mm-dd"
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
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
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
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
                                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                                style="width:100%;"
                                        />
                                    </td>
                                    <th scope="row" class="th_bg">인정경력</th>
                                    <td class="td_input" style="display: flex; align-items: center;">
                                        <sbux-input id="CAREER_TRACK" class="form-control input-sm" uitype="text" style="width:100%" mask="{'alias': 'numeric'}" maxlength="25"></sbux-input>
                                        <span style="text-align: center; width: 30px;">개월</span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <sbux-input id="APPOINT_YN" class="form-control input-sm" uitype="hidden" ></sbux-input>
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
        { "id" : "0",   "pid" : "-1",   "order" : "1",      "text" : "소속정보",             "targetid" : "tpgMaster",    "targetvalue" : "소속정보" },
        { "id" : "1",   "pid" : "-1",   "order" : "2",      "text" : "기본인적",             "targetid" : "tpgMasterSub",    "targetvalue" : "기본인적" },
        { "id" : "2",   "pid" : "-1",   "order" : "3",      "text" : "주거/생활/신체",        "targetid" : "tpgMasterSubDetail",    "targetvalue" : "주거/생활/신체" },
        { "id" : "3",   "pid" : "-1",   "order" : "4",      "text" : "가족사항",             "targetid" : "tpgFAMILY",    "targetvalue" : "가족사항" },
        { "id" : "4",   "pid" : "-1",   "order" : "5",      "text" : "학력사항",             "targetid" : "tpgSCHOOL",    "targetvalue" : "학력사항" },
        { "id" : "5",   "pid" : "-1",   "order" : "6",      "text" : "경력사항",             "targetid" : "tpgCAREER",    "targetvalue" : "경력사항" },
        { "id" : "6",   "pid" : "-1",   "order" : "7",      "text" : "자격사항",             "targetid" : "tpgLICENSE",    "targetvalue" : "자격사항" },
        { "id" : "7",   "pid" : "-1",   "order" : "8",      "text" : "어학/컴퓨터활용능력",    "targetid" : "tpgLANGUAGE",    "targetvalue" : "어학/컴퓨터활용능력" },
        { "id" : "8",   "pid" : "-1",   "order" : "9",      "text" : "파일",                "targetid" : "tpgFILE",    "targetvalue" : "파일" },
        { "id" : "9",   "pid" : "-1",   "order" : "10",      "text" : "교육사항",             "targetid" : "tpgEducation",    "targetvalue" : "교육사항" },
        { "id" : "10",   "pid" : "-1",   "order" : "11",     "text" : "병역사항",             "targetid" : "tpgMasterSubDetail2",    "targetvalue" : "병역사항" },
        { "id" : "11",  "pid" : "-1",   "order" : "12",     "text" : "보훈/장애/여권/비자",    "targetid" : "tpgMasterSubDetail3",    "targetvalue" : "보훈/장애/여권/비자" },
        { "id" : "12",  "pid" : "-1",   "order" : "13",     "text" : "보증보험",            "targetid" : "tpgMasterSubDetail4",    "targetvalue" : "보증보험" },
        { "id" : "13",  "pid" : "-1",   "order" : "14",     "text" : "상벌사항",            "targetid" : "tpgPrize",    "targetvalue" : "상벌사항" },
        { "id" : "14",  "pid" : "-1",   "order" : "15",     "text" : "건강검진내역",         "targetid" : "tpgHealth",    "targetvalue" : "건강검진내역" },
        { "id" : "15",  "pid" : "-1",   "order" : "16",     "text" : "발령사항",            "targetid" : "tpgAppointment",    "targetvalue" : "발령사항" },
        { "id" : "16",  "pid" : "-1",   "order" : "17",     "text" : "겸직",               "targetid" : "tabPageEx1",    "targetvalue" : "겸직" },
        { "id" : "17",  "pid" : "-1",   "order" : "18",     "text" : "휴직이력",            "targetid" : "tpgTimeOffHistory",    "targetvalue" : "휴직이력" },
        { "id" : "18",  "pid" : "-1",   "order" : "19",     "text" : "단체보험",            "targetid" : "tpgGroupInsurance",    "targetvalue" : "단체보험" },
        { "id" : "19",  "pid" : "-1",   "order" : "20",     "text" : "상해/질병",           "targetid" : "tpgDisease",    "targetvalue" : "상해/질병" },
        { "id" : "20",  "pid" : "-1",   "order" : "21",     "text" : "평가",                "targetid" : "tpgPersonnelEvaluation",    "targetvalue" : "평가" },
        { "id" : "21",  "pid" : "-1",   "order" : "22",     "text" : "공상발생",             "targetid" : "tpgOfficialInjury",    "targetvalue" : "공상발생" },
        { "id" : "22",  "pid" : "-1",   "order" : "23",     "text" : "계약차수",             "targetid" : "tpgContractDeg",    "targetvalue" : "계약차수" },
        { "id" : "23",  "pid" : "-1",   "order" : "24",     "text" : "근무계획",             "targetid" : "tpgWORKPLAN",    "targetvalue" : "근무계획" },
        { "id" : "24",  "pid" : "-1",   "order" : "25",     "text" : "근무조",               "targetid" : "tpgEmp",    "targetvalue" : "근무조" },
        { "id" : "25",  "pid" : "-1",   "order" : "26",     "text" : "경조사비내역",          "targetid" : "tpgExpenditurewelfare",    "targetvalue" : "경조사비내역" }
    ];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['SRCH_SITE_CODE', 'SITE_CODE', 'gvwTimeOffHistory'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CD', 'SITE_NM', 'Y', ''),
            // 재직구분
            gfnma_setComSelect(['gvwList','SRCH_EMP_STATE', 'EMP_STATE', 'gvwEmp'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직군
            gfnma_setComSelect(['SRCH_JOB_GROUP','JOB_GROUP'], jsonJobGroup, 'L_HRI047', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직책
            gfnma_setComSelect(['gvwList', 'gvwAddJob', 'gvwEmp'], jsonDutyCode, 'L_HRI003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#DUTY_CODE', '#DUTY_CODE2']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI003'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 직종
            gfnma_setComSelect(['JOB_FAMILY'], jsonJobFamily, 'L_HRI004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 성별
            gfnma_setComSelect(['SRCH_GENDER', 'GENDER'], jsonGender, 'L_HRM002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직위
            gfnma_setComSelect(['gvwList','POSITION_CODE', 'START_POSITION_CODE', 'gvwAddJob', 'gvwEmp'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직급
            gfnma_setComSelect(['JOB_RANK', 'gvwAddJob', 'gvwEmp'], jsonJobRank, 'L_HRI005', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 직무
            /*gfnma_setComSelect(['JOB_CODE'], jsonJobCode, 'L_HRI006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
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
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "직무",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "담당자명", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            /*gfnma_setComSelect(['JOB_SUB_CODE'], jsonSubJobCode, 'L_HRI073_A', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#JOB_SUB_CODE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI073_A'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            /*gfnma_setComSelect(['JOB_DETAIL_CODE'], jsonDetailJobCode, 'L_HRI073_B', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#JOB_DETAIL_CODE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI073_B'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 입사구분
            /*gfnma_setComSelect(['ENTER_TYPE'], jsonEnterType, 'L_HRI041_01', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#ENTER_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI041_01'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 양력/음력
            gfnma_setComSelect(['gvwFamily','BIRTHDAY_TYPE'], jsonBirthdayType, 'L_HRM001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 호봉
            gfnma_setComSelect(['SALARY_CLASS'], jsonSalaryClass, 'L_HRI011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'JBCD_SLRCL_CD', 'GRADE_HOBONG_NAME', 'Y', ''),
            // 인건비분류
            /*gfnma_setComSelect(['LABOR_COST_GROUP'], jsonLaborCostGroup, 'L_HRI007', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#LABOR_COST_GROUP']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI007'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 신고사업장
            gfnma_setComSelect(['TAX_SITE_CODE'], jsonTaxSiteCode, 'L_ORG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TX_SITE_CD', 'TX_SITE_NM', 'Y', ''),
            // 근무지
            /*gfnma_setComSelect(['WORK_REGION'], jsonWorkRegion, 'L_HRI999', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
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
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 사원구분
            gfnma_setComSelect(['EMP_TYPE'], jsonEmpType, 'L_HRI008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 협력사
            gfnma_setComSelect(['PARTNER_FIRM_CODE'], jsonPartnerFirmCode, 'L_HRI065', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 국적
            gfnma_setComSelect(['NATION_CODE'], jsonNationCode, 'L_COM015_2', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'NTN_CD', 'NTN_NM', 'Y', ''),
            // 퇴사사유
            /*gfnma_setComSelect(['RETIRE_REASON'], jsonRetireReason, 'L_HRI013', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#RETIRE_REASON']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI013'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 퇴사사내사유
            /*gfnma_setComSelect(['RETIRE_IN_REASON'], jsonRetireInReason, 'L_HRI041_02', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#RETIRE_IN_REASON']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI041_02'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // RH
            /*gfnma_setComSelect(['BLOOD_TYPE_RH'], jsonBloodTypeRh, 'L_HRI014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#BLOOD_TYPE_RH']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI014'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // ABO
            /*gfnma_setComSelect(['BLOOD_TYPE_ABO'], jsonBloodTypeAbo, 'L_HRI015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#BLOOD_TYPE_ABO']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI015'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 사용여부
            gfnma_setComSelect(['COLOR_BLIND_YN', 'HOUSE_OWN_YN', 'CAR_OWN_YN', 'gvwLicense', 'gvwEducation', 'MNATONLM_YN', 'MNATONLM_HIRE_CMD_YN'],
                jsonUseYn, 'L_COM014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 종교
            /*gfnma_setComSelect(['RELIGION_CODE'], jsonReligionCode, 'L_HRI038', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#RELIGION_CODE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI038'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 주거구분
            /*gfnma_setComSelect(['HOUSE_TYPE'], jsonHouseType, 'L_HRI017', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#HOUSE_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI017'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 주거유형
            /*gfnma_setComSelect(['HOUSE_KIND'], jsonHouseKind, 'L_HRI018', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#HOUSE_KIND']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI018'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 결혼여부
            /*gfnma_setComSelect(['MARRIAGE_YN'], jsonMarriageYn, 'L_HRI016', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#MARRIAGE_YN']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI016'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 가족관계
            gfnma_setComSelect(['gvwFamily', 'gvwExpenditurewelfare'],
                jsonRelation, 'L_HRI025', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#VETERANS_RELATION', '#GUARANTOR1_RELATION', '#GUARANTOR2_RELATION']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI025'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 연말정산부양관계
            gfnma_setComSelect(['gvwFamily'], jsonYeartaxRelation, 'L_HRI026', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 최종학력
            gfnma_setComSelect(['gvwFamily'], jsonSchoolType, 'L_HRI027', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 학위구분
            gfnma_setComSelect(['gvwSchool'], jsonDegreeType, 'L_HRI054', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 소재지
            gfnma_setComSelect(['gvwSchool', 'gvwCareer'], jsonManageCode, 'L_HRI028', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 본교구분
            gfnma_setComSelect(['gvwSchool'], jsonCampusBranchType, 'L_HRI049', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 본교구분
            gfnma_setComSelect(['gvwSchool'], jsonDayNightType, 'L_HRI057', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 졸업구분
            gfnma_setComSelect(['gvwSchool'], jsonGraduateType, 'L_HRI029', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 경력구분
            gfnma_setComSelect(['gvwCareer'], jsonCareerType, 'L_HRI030', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 면허종별
            gfnma_setComSelect(['gvwLicense'], jsonLicenseCategory, 'L_HRI031', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 자격증코드
            gfnma_setComSelect(['gvwLicense'], jsonLicenseCode, 'L_HRI068', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 시험구분
            gfnma_setComSelect(['gvwLanguage'], jsonTestType, 'L_HRI032', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 수준
            gfnma_setComSelect(['gvwLanguage', 'gvwComputerSkill'], jsonLevelCode, 'L_HRI045', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 파일타입
            gfnma_setComSelect(['gvwFile'], jsonFileType, 'L_HRI061', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 교육구분
            gfnma_setComSelect(['gvwEducation'], jsonEduMethod, 'L_HRI034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 교육방법
            gfnma_setComSelect(['gvwEducation'], jsonEduType, 'L_HRI039', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 병역구분
            /*gfnma_setComSelect(['ARMY_TYPE'], jsonArmyType, 'L_HRI019', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#ARMY_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI019'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
                ,callback : function(data) {
                    if(data == "3") {
                        $("#ARMY_PART").attr("disabled", true);
                        $("#ARMY_KIND").attr("disabled", true);
                        $("#ARMY_DISCHARGE_TYPE").attr("disabled", true);
                        $("#ARMY_GRADE").attr("disabled", true);
                        SBUxMethod.attr("ARMY_INDUSTRY_YN", "disabled", "true");
                        SBUxMethod.attr("ARMY_START_DATE", "disabled", "true");
                        SBUxMethod.attr("ARMY_END_DATE", "disabled", "true");
                        SBUxMethod.attr("ARMY_EXEMPTION_DESCR", "disabled", "true");
                        SBUxMethod.attr("ARMY_DESCR", "disabled", "true");

                        gfnma_multiSelectSet('#ARMY_TYPE', '', '', '');
                        SBUxMethod.set("ARMY_INDUSTRY_YN", "N");
                        gfnma_multiSelectSet('#ARMY_PART', '', '', '');
                        gfnma_multiSelectSet('#ARMY_KIND', '', '', '');
                        gfnma_multiSelectSet('#ARMY_DISCHARGE_TYPE', '', '', '');
                        gfnma_multiSelectSet('#ARMY_GRADE', '', '', '');
                        SBUxMethod.set("ARMY_START_DATE", "");
                        SBUxMethod.set("ARMY_END_DATE", "");
                        SBUxMethod.set("ARMY_EXEMPTION_DESCR", "");
                        SBUxMethod.set("ARMY_DESCR", "");

                    } else {
                        $("#ARMY_PART").removeAttr("disabled", false);
                        $("#ARMY_KIND").removeAttr("disabled", false);
                        $("#ARMY_DISCHARGE_TYPE").removeAttr("disabled", false);
                        $("#ARMY_GRADE").removeAttr("disabled", false);
                        SBUxMethod.attr("ARMY_START_DATE", "disabled", "false");
                        SBUxMethod.attr("ARMY_END_DATE", "disabled", "false");
                        SBUxMethod.attr("ARMY_EXEMPTION_DESCR", "disabled", "false");
                        SBUxMethod.attr("ARMY_DESCR", "disabled", "false");
                    }
                }
            }),
            // 병역병과
            /*gfnma_setComSelect(['ARMY_PART'], jsonArmyPart, 'L_HRI021', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#ARMY_PART']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI021'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 병역군별
            /*gfnma_setComSelect(['ARMY_KIND'], jsonArmyKind, 'L_HRI020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#ARMY_KIND']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI020'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 전역구분
            /*gfnma_setComSelect(['ARMY_DISCHARGE_TYPE'], jsonArmyDischargeType, 'L_HRI023', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#ARMY_DISCHARGE_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI023'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 병역계급
            /*gfnma_setComSelect(['ARMY_GRADE'], jsonArmyGrade, 'L_HRI022', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#ARMY_GRADE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI022'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 보훈등급
            /*gfnma_setComSelect(['VETERANS_GRADE'], jsonVeteransGrade, 'L_HRI055', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#VETERANS_GRADE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI055'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 장애등급
            /*gfnma_setComSelect(['HANDICAP_GRADE'], jsonHandicapGrade, 'L_HRI053', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),*/
            gfnma_multiSelectInit({
                target			: ['#HANDICAP_GRADE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI053'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
            // 보증구분
            gfnma_setComSelect(['GUARANTEE_TYPE'], jsonGuaranteeType, 'L_HRI024', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 상벌구분
            gfnma_setComSelect(['gvwPrize'], jsonPrizeType, 'L_HRI035', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 상벌유형
            gfnma_setComSelect(['gvwPrize'], jsonPrizeCategory, 'L_HRI060', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 사내외구분
            gfnma_setComSelect(['gvwPrize'], jsonPrizeInoutType, 'L_HRI030', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 대상구분
            gfnma_setComSelect(['gvwPrize'], jsonPrizeTarget, 'L_HRI036', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 검진구분
            gfnma_setComSelect(['gvwHealth'], jsonCheckType, 'L_HRI037', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 겸직부서
            gfnma_setComSelect(['gvwAddJob'], jsonAddJobDeptCode, 'L_ORG900', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 휴직유형
            gfnma_setComSelect(['gvwTimeOffHistory'], jsonTimeOffType, 'L_HRT003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 보험상품
            gfnma_setComSelect(['gvwGroupInsurance'], jsonGroupInsureCode, 'L_HRI062', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 상해/질병구분
            gfnma_setComSelect(['gvwDisease'], jsonDiseaseType, 'L_HRI063', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 평가차수
            gfnma_setComSelect(['gvwPersonnelEvaluation'], jsonEvalPositionCode, 'L_HRIZ04', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 계약차수
            gfnma_setComSelect(['gvwContractDeg'], jsonContractDegree, 'L_HRIZ03', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 근무계획
            gfnma_setComSelect(['gvwWorkPlan'], jsonWorkplanType, 'L_HRI070', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 근무패턴코드
            gfnma_setComSelect(['gvwEmp'], jsonWorkPatternCode, 'L_HRT020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            // 경조사유
            gfnma_setComSelect(['gvwExpenditurewelfare'], jsonWelfareType, 'L_HRW103_02', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),

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
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 	= "_DEPT_NM_";
        var replaceText1 	= "_EMP_CD_";
        var replaceText2 	= "_EMP_NM_";
        var replaceText3 	= "_EMP_STTS_";
        var strWhereClause 	= "AND X.DEPT_NM LIKE '%" + replaceText0 + "%' AND X.EMP_CD LIKE '%" + replaceText1 + "%' AND X.EMP_NM LIKE '%" + replaceText2 + "%' AND X.EMP_STTS LIKE '%" + replaceText3 + "%'";
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		"재직상태"]
            ,searchInputFields		: ["DEPT_NM", 	"EMP_CD",		"EMP_NM",		"EMP_STTS"]
            ,searchInputValues		: ["", 			searchCode, searchName,		""]
            ,searchInputTypes		: ["input", 	"input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"", "",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CD", "EMP_NM",  "DEPT_NM", "SITE_NM", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NM);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CD);
            },
        });
    }

    const fn_findOldEmpCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("OLD_EMP_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("OLD_EMP_NAME"));
        var replaceText0 	= "_DEPT_NM_";
        var replaceText1 	= "_EMP_CD_";
        var replaceText2 	= "_EMP_NM_";
        var replaceText3 	= "_EMP_STTS_";
        var strWhereClause 	= "AND X.DEPT_NM LIKE '%" + replaceText0 + "%' AND X.EMP_CD LIKE '%" + replaceText1 + "%' AND X.EMP_NM LIKE '%" + replaceText2 + "%' AND X.EMP_STTS LIKE '%" + replaceText3 + "%'";
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		"재직상태"]
            ,searchInputFields		: ["DEPT_NM", 	"EMP_CD",		"EMP_NM",		"EMP_STTS"]
            ,searchInputValues		: ["", 			searchCode, searchName,		""]
            ,searchInputTypes		: ["input", 	"input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"", "",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CD", "EMP_NM",  "DEPT_NM", "SITE_NM", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('OLD_EMP_NAME', data.EMP_NM);
                SBUxMethod.set('OLD_EMP_CODE', data.EMP_CD);
            },
        });
    }

    const fn_findIntroducerCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("INTRODUCER_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("INTRODUCER_NAME"));
        var replaceText0 	= "_DEPT_NM_";
        var replaceText1 	= "_EMP_CD_";
        var replaceText2 	= "_EMP_NM_";
        var replaceText3 	= "_EMP_STTS_";
        var strWhereClause 	= "AND X.DEPT_NM LIKE '%" + replaceText0 + "%' AND X.EMP_CD LIKE '%" + replaceText1 + "%' AND X.EMP_NM LIKE '%" + replaceText2 + "%' AND X.EMP_STTS LIKE '%" + replaceText3 + "%'";
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서명", 		"사원코드",		"사원명",		"재직상태"]
            ,searchInputFields		: ["DEPT_NM", 	"EMP_CD",		"EMP_NM",		"EMP_STTS"]
            ,searchInputValues		: ["", 			searchCode,  searchName,		""]
            ,searchInputTypes		: ["input", 	"input", 	"input",		"select"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", 			"", "",				jsonEmpState]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["사번", "사원명", "부서", "사업장", "재직상태"]
            ,tableColumnNames		: ["EMP_CD", "EMP_NM",  "DEPT_NM", "SITE_NM", "EMP_STATE_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "120px", "120px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('INTRODUCER_NAME', data.EMP_NM);
                SBUxMethod.set('INTRODUCER_CODE', data.EMP_CD);
            },
        });
    }

    var fn_findSrchDeptCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: [searchCode, 				searchName,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["BGNG_YMD",	"SITE_NM", 	"DEPT_NM",  	"SITE_CD"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NM);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
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
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: [searchCode, 				searchName,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["BGNG_YMD",	"SITE_NM", 	"DEPT_NM",  	"SITE_CD"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('DEPT_NAME', data.DEPT_NM);
                SBUxMethod.set('DEPT_CODE', data.DEPT_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findParentDeptCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("PARENT_DEPT"));
        var searchName 		= gfn_nvl(SBUxMethod.get("PARENT_DEPT_NAME"));
        var replaceText0 	= "_CSTCT_CD_";
        var replaceText1 	= "_CSTCT_NM_";
        var strWhereClause 	= "AND CSTCT_CD LIKE '%" + replaceText0 + "%' AND CSTCT_NM LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG010'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["원가조직코드", 		"원가조직명"]
            ,searchInputFields		: ["CSTCT_CD", 		"CSTCT_NM"]
            ,searchInputValues		: [searchCode, 			searchName]
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

    const fn_findCostDeptCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("COST_DEPT_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("COST_DEPT_NAME"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_FAM_NM_";
        var strWhereClause 	= "AND DEPT_CD LIKE '%" + replaceText0 + "%' AND DEPT_NM LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'L_ORG900_ESS'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서", 		"부서명"]
            ,searchInputFields		: ["CODE", 		"FAM_NM"]
            ,searchInputValues		: [searchCode, 			searchName]
            ,height					: '400px'
            ,tableHeader			: ["부서", "부서명"]
            ,tableColumnNames		: ["CODE", "FAM_NM"]
            ,tableColumnWidths		: ["80px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('COST_DEPT_NAME', data.FAM_NM);
                SBUxMethod.set('COST_DEPT_CODE', data.CODE);
            },
        });
    }

    const fn_findDeptCode2 = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("DEPT_CODE2"));
        var searchName 		= gfn_nvl(SBUxMethod.get("DEPT_NAME2"));
        var replaceText0 	= "_CODE_";
        var replaceText1 	= "_FAM_NM_";
        var strWhereClause 	= "AND DEPT_CD LIKE '%" + replaceText0 + "%' AND DEPT_NM LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'L_ORG900_ESS'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["부서", 		"부서명"]
            ,searchInputFields		: ["CODE", 		"FAM_NM"]
            ,searchInputValues		: [searchCode, 			searchName]
            ,height					: '400px'
            ,tableHeader			: ["부서", "부서명"]
            ,tableColumnNames		: ["CODE", "FAM_NM"]
            ,tableColumnWidths		: ["80px", "80px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('DEPT_NAME2', data.FAM_NM);
                SBUxMethod.set('DEPT_CODE2', data.CODE);
            },
        });
    }

    const fn_onload = async function () {
        // TODO : 단위테스트 요청으로 숨김처리 (Grid 생성부분도 주석처리함)
        SBUxMethod.hideTab('idxTab_norm', 'tpgEducation');
        SBUxMethod.hideTab('idxTab_norm', 'tpgMasterSubDetail4');
        SBUxMethod.hideTab('idxTab_norm', 'tpgHealth');
        SBUxMethod.hideTab('idxTab_norm', 'tpgGroupInsurance');
        SBUxMethod.hideTab('idxTab_norm', 'tpgDisease');
        SBUxMethod.hideTab('idxTab_norm', 'tpgOfficialInjury');
        SBUxMethod.hideTab('idxTab_norm', 'tpgContractDeg');
        SBUxMethod.hideTab('idxTab_norm', 'tpgWORKPLAN');
        SBUxMethod.hideTab('idxTab_norm', 'tpgExpenditurewelfare');
        SBUxMethod.hideTab('idxTab_norm', 'tpgPersonnelEvaluation');
        $('#START_PAY_GRADE_TH').hide();
        $('#START_PAY_GRADE_TD').hide();
        $('#CAREER_TRACK_ENTER_DATE_TH').hide();
        $('#CAREER_TRACK_ENTER_DATE_TD').hide();
        $('#CURRENT_PAY_GRADE_TH').hide();
        $('#CURRENT_PAY_GRADE_TD').hide();
        $('#CURRENT_PAY_GRADE_DATE_TH').hide();
        $('#CURRENT_PAY_GRADE_DATE_TD').hide();

        SBUxMethod.set("SRCH_EMP_STATE", "WORK");
        SBUxMethod.set("LEAP_MONTH_YN", "N");
        SBUxMethod.set("BIRTHDAY_TYPE", "2");
        SBUxMethod.set("FOREIGNER_YN", "N");
        SBUxMethod.set("FAMILY_OWNER_YN", "N");
        SBUxMethod.set("TIME_CHECK_YN", "N");
        SBUxMethod.set("SALES_EMP_YN1", "N");
        SBUxMethod.set("UNION_JOIN_YN", "N");
        SBUxMethod.set("RETIRE_PENSION_JOIN_YN", "N");
        SBUxMethod.set("TELEWORKING_YN", "N");
        SBUxMethod.set("BOARD_DIRECTOR_YN", "N");
        SBUxMethod.set("RE_ENTER_YN", "N");
        SBUxMethod.set("PARTNER_FIRM_EMP_YN", "N");
        SBUxMethod.set("ARMY_INDUSTRY_YN", "N");
        SBUxMethod.set("AGREE_YN", "N");
        SBUxMethod.set("APPOINT_YN", "Y");
        SBUxMethod.set("PAGE_ALL", "Y");
        SBUxMethod.set("CAREER_TRACK", 0);
        SBUxMethod.set("START_PAY_GRADE", 0);
        SBUxMethod.set("CURRENT_PAY_GRADE", 0);
        SBUxMethod.hide('DISPLAY_SOCIAL_NUM');
        SBUxMethod.show('SOCIAL_NUM');

        SBUxMethod.set("SRCH_INITIAL_DATE", gfn_dateToYmd(new Date()));

        $("#btnRegistResignation").attr('disabled', 'true');
        $("#btnCopyHistory").attr('disabled', 'true');

        await fn_search();
    }

    // only document
    window.addEventListener('DOMContentLoaded', async function(e) {
        document.getElementById('empPhotoArea').addEventListener('click', function() {
            let EMP_CODE = gfn_nvl(SBUxMethod.get("EMP_CODE"));
            if(EMP_CODE != "") {
                document.getElementById('EMP_PHOTO_FILE').click();
            }
        });

        document.getElementById('signImgArea').addEventListener('click', function() {
            let EMP_CODE = gfn_nvl(SBUxMethod.get("EMP_CODE"));
            if(EMP_CODE != "") {
                document.getElementById('SIGN_IMG_FILE').click();
            }
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

        // TODO : 단위테스트 요청으로 탭 숨김처리하면서 그리드도 같이 주석 처리
        await fn_initSBSelect();
        fn_createGvwListGrid();
        fn_createGvwFamilyGrid();
        fn_createGvwSchoolGrid();
        fn_createGvwCareerGrid();
        fn_createGvwLicenseGrid();
        fn_createGvwLanguageGrid();
        fn_createGvwComputerSkillGrid();
        fn_createGvwFileGrid();
        /*fn_createGvwEducationGrid();*/
        fn_createGvwPrizeGrid();
        /*fn_createGvwHealthGrid();*/
        fn_createGvwAppointmentGrid();
        fn_createGvwAddJobGrid();
        fn_createGvwTimeOffHistoryGrid();
        /*fn_createGvwGroupInsuranceGrid();
        fn_createGvwDiseaseGrid();
        fn_createGvwPersonnelEvaluationGrid();
        /*fn_createGvwOfficialInjuryGrid();
        fn_createGvwContractDegGrid();
        fn_createGvwWorkPlanGrid();*/
        fn_createGvwEmpGrid();
        /*fn_createGvwExpenditurewelfareGrid();*/

        await fn_onload();
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
        SBGridProperties.useinitsorting 	= true;
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
            {caption: ["입사일"],        ref: 'ENTER_DATE', 		         type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["퇴사일"],        ref: 'RETIRE_DATE', 		     type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            }
        ];

        gvwList = _SBGrid.create(SBGridProperties);
        gvwList.bind('click', 'fn_view');
        gvwList.bind('keyup', 'fn_keyup');
    }

    // 신규
    function cfn_add() {
        fn_create();
    }

    var fn_findDeptCodeForGvwCareer = function(row) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= '';
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: ["", 				searchText,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["BGNG_YMD",	"SITE_NM", 	"DEPT_NM",  	"SITE_CD"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                gvwCareer.setCellData(row, gvwCareer.getColRef("DEPT_CODE"), data['DEPT_CD']);
                gvwCareer.setCellData(row, gvwCareer.getColRef("DEPT_NAME"), data['DEPT_NM']);
            },
        });
    }

    var fn_findDeptCodeForGvwTimeOffHistory = function(row) {
        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= '';
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: ["", 				searchText,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["BGNG_YMD",	"SITE_NM", 	"DEPT_NM",  	"SITE_CD"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                gvwTimeOffHistory.setCellData(row, gvwTimeOffHistory.getColRef("DEPT_CODE"), data['DEPT_CD']);
                gvwTimeOffHistory.setCellData(row, gvwTimeOffHistory.getColRef("DEPT_NAME"), data['DEPT_NM']);
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
        SBUxMethod.set("LEAP_MONTH_YN", "N");
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
        SBUxMethod.set("BOARD_DIRECTOR_YN", "N");
        SBUxMethod.set("SALES_EMP_YN", "N");
        SBUxMethod.set("RE_ENTER_YN", "N");
        SBUxMethod.set("TO_YN", "N");
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
        SBUxMethod.set("PARTNER_FIRM_EMP_YN", "N");
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

        $('#START_PAY_GRADE_TH').hide();
        $('#START_PAY_GRADE_TD').hide();
        $('#CAREER_TRACK_ENTER_DATE_TH').hide();
        $('#CAREER_TRACK_ENTER_DATE_TD').hide();
        $('#CURRENT_PAY_GRADE_TH').hide();
        $('#CURRENT_PAY_GRADE_TD').hide();
        $('#CURRENT_PAY_GRADE_DATE_TH').hide();
        $('#CURRENT_PAY_GRADE_DATE_TD').hide();

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
        if(!SBUxMethod.validateRequired({group_id: "panInfo"}) || !validateRequired("panInfo")) {
            return false;
        }

        const master = await getParamForHri1000S();

        if (new Date(master.V_P_UNION_JOIN_START_DATE) > new Date(master.V_P_UNION_JOIN_END_DATE)) {
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
                var empCode = editType == 'U' ? gfn_nvl(SBUxMethod.get("EMP_CODE")) : masterData.v_returnStr;
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
                            // TODO : 단위테스트 요청으로 숨김처리 (Grid 생성부분도 주석처리함)
                            var paramObj = {
                                SP_HRI1000_S2: await getParamForHri1000S2(empCode),
                                //P_HRI1000_S3: await getParamForHri1000S3(editType, empCode),
                                SP_HRI1000_S4: await getParamForHri1000S4(empCode),
                                SP_HRI1000_S5: await getParamForHri1000S5(empCode),
                                SP_HRI1000_S6: await getParamForHri1000S6(empCode),
                                SP_HRI1000_S7: await getParamForHri1000S7(empCode),
                                SP_HRI1000_S8: await getParamForHri1000S8(empCode),
                                /*SP_HRI1000_S9: await getParamForHri1000S9(empCode),*/
                                SP_HRI1000_S10: await getParamForHri1000S10(empCode),
                                /*SP_HRI1000_S11: await getParamForHri1000S11(empCode),*/
                                SP_HRI1000_S12: await getParamForHri1000S12(empCode),
                                SP_HRI1000_S13: await getParamForHri1000S13(empCode),
                                SP_HRI1000_S14: await getParamForHri1000S14(empCode),
                                /*SP_HRI1000_S15: await getParamForHri1000S15(empCode),*/
                                /*SP_HRI1000_S16: await getParamForHri1000S16(empCode),*/
                                /*SP_HRI1000_S17: await getParamForHri1000S17(empCode),*/
                                /*SP_HRI1000_S18: await getParamForHri1000S18(empCode),*/
                                /*SP_HRI1000_S19: await getParamForHri1000S19(empCode),*/
                                SP_HRI1000_S21: await getParamForHri1000S21(editType, empCode),
                                /*SP_HRI1000_S22: await getParamForHri1000S22(empCode),*/
                                SP_HRI1000_S23: await getParamForHri1000S23(editType, empCode),
                                /*SP_HRI1000_S24: await getParamForHri1000S24(empCode),*/
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
        let EMP_CODE = gfn_nvl(SBUxMethod.get("EMP_CODE"));
        let EMP_NAME = gfn_nvl(SBUxMethod.get("EMP_NAME"));

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
        if (gfn_nvl(SBUxMethod.get("RETIRE_DATE")) == "") {
            gfn_comAlert("E0000", "퇴직일자가 없으면 처리할수 없습니다.");
            return ;
        }

        SBUxMethod.attr('EMP_CODE', 'readonly', 'true');

        SBUxMethod.set("OLD_EMP_CODE", SBUxMethod.get("EMP_CODE"));
        SBUxMethod.set("OLD_EMP_NAME", SBUxMethod.get("EMP_NAME"));

        SBUxMethod.attr('JOB_GROUP', 'readonly', 'false');
        SBUxMethod.attr('JOB_RANK', 'readonly', 'false');

        SBUxMethod.set('EMP_CODE', "");

        SBUxMethod.set('ENTER_DATE', gfn_dateToYmd(new Date()));

        SBUxMethod.focus("ENTER_TYPE");

        SBUxMethod.attr('POSITION_CODE', 'readonly', 'false');
        SBUxMethod.attr('DUTY_CODE', 'readonly', 'false');
        SBUxMethod.attr('JOB_FAMILY', 'readonly', 'false');

        //가족사항
        for(var i = 1; i <= jsonFamilyList.length; i++) {
            gvwFamily.setRowStatus(i, 0);
        }

        // 학력사항
        for(var i = 1; i <= jsonSchoolList.length; i++) {
            gvwSchool.setRowStatus(i, 0);
        }

        // 경력사항
        for(var i = 1; i <= jsonCareerList.length; i++) {
            gvwCareer.setRowStatus(i, 0);
        }

        // 자격사항
        for(var i = 1; i <= jsonLicenseList.length; i++) {
            gvwLicense.setRowStatus(i, 0);
        }

        // 어학/컴퓨터활용능력
        for(var i = 1; i <= jsonLanguageList.length; i++) {
            gvwLanguage.setRowStatus(i, 0);
        }

        for(var i = 1; i <= jsonComputerSkillList.length; i++) {
            gvwComputerSkill.setRowStatus(i, 0);
        }

        // 파일
        for(var i = 1; i <= jsonFileList.length; i++) {
            gvwFile.setRowStatus(i, 0);
        }

        // 상벌사항
        for(var i = 1; i <= jsonPrizeList.length; i++) {
            gvwPrize.setRowStatus(i, 0);
        }

        // 건강검진내역
        for(var i = 1; i <= jsonHealthList.length; i++) {
            gvwHealth.setRowStatus(i, 0);
        }

        //상해질병
        for(var i = 1; i <= jsonDiseaseList.length; i++) {
            gvwDisease.setRowStatus(i, 0);
        }

        //공상발생
        for(var i = 1; i <= jsonOfficialInjuryList.length; i++) {
            gvwOfficialInjury.setRowStatus(i, 0);
        }

        //근무계획
        for(var i = 1; i <= jsonWorkPlanList.length; i++) {
            gvwWorkPlan.setRowStatus(i, 0);
        }
    }

    /**
     * 입사처리
     */
    const fn_joinCompnay = async function() {
        let EMP_CODE_LIST = "";
        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHK_YN"), true);

        gvwListCheckedList.forEach((item, index) => {
            EMP_CODE_LIST += gvwList.getCellData(item, gvwList.getColRef("EMP_CODE")) + "|";
        });

        EMP_CODE_LIST = EMP_CODE_LIST.substring(0, EMP_CODE_LIST.length - 1);

        if (EMP_CODE_LIST.length == 0) {
            gfn_comAlert("W0001", "사원");		//	W0001	{0}을/를 선택하세요.
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
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
        let APPOINT_YN = SBUxMethod.get("APPOINT_YN");
        if (APPOINT_YN == "Y") {
            gfn_comAlert("E0000", "발령등록이 이미 처리되었습니다.")
            return;
        } else {
            let EMP_STATE = gfn_nvl(SBUxMethod.get("EMP_STATE"));
            let RETIRE_DATE = gfn_nvl(SBUxMethod.get("RETIRE_DATE"));
            let RETIRE_IN_REASON = gfn_nvl(gfnma_multiSelectGet('#RETIRE_IN_REASON'));
            //퇴사인경우
            if (EMP_STATE == "RETI") {
                if (RETIRE_DATE == "") {
                    gfn_comAlert("E0000", "퇴사일자가 없으면 발령처리 할수 없습니다.")
                    return;
                }

                if (RETIRE_IN_REASON == "") {
                    gfn_comAlert("E0000", "퇴사사내사유가 없으면 발령처리 할수 없습니다.")
                    return;
                }

                var param = {
                    APPOINT_TYPE: gfnma_multiSelectGet('#RETIRE_IN_REASON'),
                    APPOINT_TYPE_NAME: gfnma_multiSelectGet('#RETIRE_IN_REASON', true)['CODE_NAME'],
                    APPOINT_DATE: gfn_addDate(RETIRE_DATE, 1),
                    EMP_CODE: gfn_nvl(SBUxMethod.get("EMP_CODE")),
                    EMP_NAME: gfn_nvl(SBUxMethod.get("EMP_NAME")),
                    START_DATE: gfn_nvl(SBUxMethod.get("RETIRE_DATE")),
                    END_DATE: "",
                    DEPT_CODE1: gfn_nvl(SBUxMethod.get("DEPT_CODE")),
                    POSITION_CODE1: gfn_nvl(SBUxMethod.get("POSITION_CODE")),
                    DUTY_CODE1: gfn_nvl(SBUxMethod.get("DUTY_CODE")),
                    JOB_RANK1: gfn_nvl(SBUxMethod.get("JOB_RANK")),
                    JOB_GROUP1: gfn_nvl(SBUxMethod.get("JOB_GROUP")),
                    JOB_CODE1: gfn_nvl(SBUxMethod.get("JOB_CODE")),
                    REGION_CODE1: gfn_nvl(SBUxMethod.get("WORK_REGION")),
                    COST_DEPT1: gfn_nvl(SBUxMethod.get("COST_DEPT_CODE")),
                    DEPT_CODE2: "",
                    POSITION_CODE2: "",
                    DUTY_CODE2: "",
                    JOB_RANK2: "",
                    JOB_GROUP2: "",
                    JOB_CODE2: "",
                    REGION_CODE2: "",
                    COST_DEPT2: "",
                    target: "MA_A10_010_010_040"
                };

                let json = JSON.stringify(param);
                window.parent.cfn_openTabSearch(json);
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
        if (!SBUxMethod.validateRequired({group_id:'panHeader'})) {
            return false;
        }

        editType = "N";
        SBUxMethod.attr('EMP_CODE', 'readonly', 'true');
        let SITE_CODE	    = gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let EMP_STATE	    = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let JOB_GROUP	    = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let GENDER	        = gfn_nvl(SBUxMethod.get("SRCH_GENDER"));
        let DEPT_CODE	    = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE	    = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let ENTER_DATE_FR	    = gfn_nvl(SBUxMethod.get("SRCH_ENTER_DATE_FR"));
        let ENTER_DATE_TO	    = gfn_nvl(SBUxMethod.get("SRCH_ENTER_DATE_TO"));
        let INITIAL_DATE	= gfn_nvl(SBUxMethod.get("SRCH_INITIAL_DATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedCorpCd
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

        try {
            if (_.isEqual("S", data.resultStatus)) {

                jsonEmpTotalList.length = 0;
                /** @type {number} **/
                data.cv_1.forEach((item, index) => {
                    const msg = {
                         EMP_CODE           : item.EMP_CD
                        ,EMP_NAME           : item.EMP_NM
                        ,PARENT_DEPT_NAME   : item.PARENT_DEPT_NAME
                        ,DEPT_NAME          : item.DEPT_NM
                        ,POSITION_CODE      : item.JBPS_CD
                        ,DUTY_CODE          : item.JBTTL_CD
                        ,EMP_STATE          : item.EMP_STTS
                        ,ENTER_DATE         : item.JNCMP_YMD
                        ,RETIRE_DATE        : item.RTRM_YMD
                    }
                    jsonEmpTotalList.push(msg);
                });

                gvwList.rebuild();
                document.querySelector('#listCount').innerText = jsonEmpTotalList.length;

                if(jsonEmpTotalList.length > 0) {
                    gvwList.clickCell(1, 1);
                } else {
                    fn_create();
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
        SBUxMethod.set("APPOINT_YN", data.APNT_YN);
        SBUxMethod.set("EMP_CODE", data.EMP_CD);
        SBUxMethod.set("DISPLAY_SOCIAL_NUM", data.DISPLAY_SOCIAL_NUM);
        SBUxMethod.set("SOCIAL_NUM", data.RRNO_ENCPT);
        SBUxMethod.set("POSITION_CODE", data.JBPS_CD);
        SBUxMethod.set("POSITION_CODE_PERIOD", data.POSITION_CODE_PERIOD);
        SBUxMethod.set("EMP_NAME", data.EMP_NM);
        SBUxMethod.set("BIRTHDAY", data.BRDT);
        SBUxMethod.set("BIRTHDAY_TYPE", data.BRTH_TYPE);
        SBUxMethod.set("LEAP_MONTH_YN", data.LPMM_YN);
        SBUxMethod.set("JOB_GROUP", data.JOB_GROUP);
        SBUxMethod.set("SALARY_CLASS", data.SLRCL_NM);
        SBUxMethod.set("EMP_NAME_ENG", data.EMP_NM_ENG);
        SBUxMethod.set("GENDER", data.GNDR);
        SBUxMethod.set("AGE", data.AGE);
        SBUxMethod.set("JOB_FAMILY", data.JOB_LWRNK_GROUP);
        SBUxMethod.set("SALARY_LEVEL", data.SLRY_LVL);
        SBUxMethod.set("EMP_NAME_CHN", data.EMP_NM_CHN);
        gfnma_multiSelectSet('#DUTY_CODE', 'SBSD_CD', 'CD_NM', data.JBTTL_CD);
        SBUxMethod.set("DUTY_CODE_PERIOD", data.DUTY_CODE_PERIOD);
        gfnma_multiSelectSet('#JOB_CODE', 'SBSD_CD', 'CD_NM', data.JOB_CD);
        gfnma_multiSelectSet('#JOB_SUB_CODE', 'SBSD_CD', 'CD_NM', data.DUTY_SBSD_CD);
        gfnma_multiSelectSet('#JOB_DETAIL_CODE', 'SBSD_CD', 'CD_NM', data.JOB_DTL_CD);
        SBUxMethod.set("JOB_CODE_PERIOD", data.JOB_CODE_PERIOD);
        gfnma_multiSelectSet('#LABOR_COST_GROUP', 'SBSD_CD', 'CD_NM', data.LBRCO_GROUP);
        SBUxMethod.set("JOB_RANK", data.JBGD_CD);
        SBUxMethod.set("JOB_RANK_PERIOD", data.JOB_RANK_PERIOD);
        SBUxMethod.set("BOARD_DIRECTOR_YN", data.RG_EXC_YN);
        SBUxMethod.set("SALES_EMP_YN", data.SALS_EMP_YN);
        SBUxMethod.set("RE_ENTER_YN", data.REPT_JNCMP_YN);
        SBUxMethod.set("TO_YN", data.TRGT_YN);
        SBUxMethod.set("SITE_CODE", data.SITE_CD);
        SBUxMethod.set("DEPT_CODE", data.DEPT_CD);
        SBUxMethod.set("DEPT_NAME", data.DEPT_NM);
        SBUxMethod.set("PARENT_DEPT", data.PRNT_DEPT);
        SBUxMethod.set("PARENT_DEPT_NAME", data.PARENT_DEPT_NAME);
        SBUxMethod.set("TAX_SITE_CODE", data.TX_SITE_CD);
        SBUxMethod.set("COST_DEPT_CODE", data.CSTCT_CD);
        SBUxMethod.set("COST_DEPT_NAME", data.CSTCT_NM);
        SBUxMethod.set("DEPT_CODE2", data.DEPT_CD2);
        SBUxMethod.set("DEPT_NAME2", data.DEPT_NM2);
        gfnma_multiSelectSet('#WORK_REGION', 'SBSD_CD', 'CD_NM', data.WORK_RGN_CD);
        SBUxMethod.set("EMP_TYPE", data.EMP_TYPE);
        SBUxMethod.set("PARTNER_FIRM_EMP_YN", data.CRPRTN_CO_EMP_YN);
        SBUxMethod.set("PARTNER_FIRM_CODE", data.CRPRTN_CO_CD);
        gfnma_multiSelectSet('#DUTY_CODE2', 'SBSD_CD', 'CD_NM', data.JBTTL_CD2);
        SBUxMethod.set("EMP_STATE", data.EMP_STTS);
        SBUxMethod.set("OLD_EMP_CODE", data.BFR_EMP_CD);
        SBUxMethod.set("OLD_EMP_NAME", data.OLD_EMP_NAME);
        SBUxMethod.set("START_POSITION_CODE", data.JNCMP_JBPS_CD);
        SBUxMethod.set("CAREER_TRACK", data.CRR_RCG);
        gfnma_multiSelectSet('#ENTER_TYPE', 'SBSD_CD', 'CD_NM', data.JNCMP_TYPE);
        SBUxMethod.set("INTRODUCER_CODE", data.RCMDTN_PRSN_CD);
        SBUxMethod.set("INTRODUCER_NAME", data.INTRODUCER_NAME);
        SBUxMethod.set("CAREER_DATE", data.CRR_YMD);
        SBUxMethod.set("START_PAY_GRADE", data.JNCMP_SLRY_GRD);
        SBUxMethod.set("CAREER_TRACK_ENTER_DATE", data.CAREER_TRACK_ENTER_DATE);
        SBUxMethod.set("ENTER_DATE", data.JNCMP_YMD);
        SBUxMethod.set("ANNUAL_INITIAL_DATE", data.ANNLV_RCK_YMD);
        SBUxMethod.set("ANNUAL_BASE_DATE", data.ANNLV_BASE_YMD);
        SBUxMethod.set("CURRENT_PAY_GRADE", data.NOW_SLRY_GRD);
        SBUxMethod.set("CURRENT_PAY_GRADE_DATE", data.CURRENT_PAY_GRADE_DATE);
        SBUxMethod.set("EMP_PHOTO_NAME", gfn_nvl(data.EMP_PHOTO_NM));
        if(gfn_nvl(data.EMP_PHOTO_NM) != "") {
            $("#EMP_PHOTO").attr("src", "/com/getFileImage.do?fkey="+data.EMP_PHOTO_NM+"&comp_code="+gv_ma_selectedCorpCd+"&client_code=" + gv_ma_selectedClntCd );
            $("#DIV_EMP_PHOTO").hide();
        } else {
            $("#EMP_PHOTO").attr("src", "");
            $("#DIV_EMP_PHOTO").show();
        }

        SBUxMethod.set("SIGN_IMG_NAME", gfn_nvl(data.SIGN_IMG_NM));
        if(gfn_nvl(data.SIGN_IMG_NM) != "") {
            $("#SIGN_IMG").attr("src", "/com/getFileImage.do?fkey="+data.SIGN_IMG_NAME+"&comp_code="+gv_ma_selectedCorpCd+"&client_code=" + gv_ma_selectedClntCd );
            $("#DIV_SIGN_IMG").hide();
        } else {
            $("#SIGN_IMG").attr("src", "");
            $("#DIV_SIGN_IMG").show();
        }

        /*if(data.JOB_GROUP == '3') {
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
        }*/

        $('#START_PAY_GRADE_TH').hide();
        $('#START_PAY_GRADE_TD').hide();
        $('#CAREER_TRACK_ENTER_DATE_TH').hide();
        $('#CAREER_TRACK_ENTER_DATE_TD').hide();
        $('#CURRENT_PAY_GRADE_TH').hide();
        $('#CURRENT_PAY_GRADE_TD').hide();
        $('#CURRENT_PAY_GRADE_DATE_TH').hide();
        $('#CURRENT_PAY_GRADE_DATE_TD').hide();

        $("#btnRegistResignation").removeAttr('disabled');
        $("#btnCopyHistory").removeAttr('disabled');
    }

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    //상세정보 보기
    const fn_view = async function() {
        var nRow = gvwList.getRow();
        if (nRow < 1) {
            return;
        }

        var nCol = gvwList.getCol();
        if (nCol < 1) {
            return;
        }

        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHK_YN"), true);

        gvwListCheckedList.forEach((item, index) => {
            gvwList.setCellData(item, gvwList.getColRef("CHK_YN"), "N");
        });

        gvwList.setCellData(nRow, gvwList.getColRef("CHK_YN"), "Y");

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

        let rowData = gvwList.getRowData(nRow);

        let SITE_CODE	    = gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE"));
        let EMP_STATE	    = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));
        let JOB_GROUP	    = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let GENDER	        = gfn_nvl(SBUxMethod.get("SRCH_GENDER"));
        let DEPT_CODE	    = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE	    = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let ENTER_DATE_FR	    = gfn_nvl(SBUxMethod.get("SRCH_ENTER_DATE_FR"));
        let ENTER_DATE_TO	    = gfn_nvl(SBUxMethod.get("SRCH_ENTER_DATE_TO"));
        let INITIAL_DATE	= gfn_nvl(SBUxMethod.get("SRCH_INITIAL_DATE"));


        var paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedCorpCd
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
                        NAME : item.FAM_NM,
                        RELATION : item.FAM_REL,
                        SOCIAL_NO_REAL : item.SOCIAL_NO_REAL,
                        SOCIAL_NO : item.RGDT_NO,
                        BIRTHDAY : item.BRDT,
                        BIRTHDAY_TYPE : item.BRTH_TYPE,
                        LEAP_MONTH_YN : item.LPMM_YN,
                        SCHOOL_TYPE : item.DGR_TYPE,
                        ZIP_CODE : item.ZIP_CD,
                        ADDRESS : item.ADDR,
                        SUPPORT_YN : item.SPT_FAM_YN,
                        WH_TAX_YN : item.WTHD_TX_YN,
                        YEARTAX_YN : item.YRTXCAL_YN,
                        YEARTAX_RELATION : item.YRTXCAL_FAM_REL,
                        FOREIGNER_YN : item.FRGNR_YN,
                        HANDICAP_YN : item.DSBLTY_YN,
                        LIVE_TOGETHER_YN : item.CHBTN_YN,
                        JOB : item.JOB,
                        TEL : item.TELNO,
                        LIFE_YN : item.LIF_YN,
                        HEALTH_INSURE_YN : item.HLTH_INSRNC_YN,
                        MEMO : item.MEMO,
                        START_DATE : item.BGNG_YMD,
                        END_DATE : item.END_DT
                    }
                    jsonFamilyList.push(msg);
                });

                gvwFamily.rebuild();

                // 학력사항
                detailData.cv_6.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        SCHOOL_TYPE : item.DGR_TYPE,
                        MANAGE_CODE : item.MJR_CD,
                        SCHOOL_NAME : item.SCHL_NM,
                        CAMPUS_BRANCH_TYPE : item.CMPS_PRC_TYPE,
                        DAY_NIGHT_TYPE : item.NGHT_TYPE,
                        MAJOR : item.MJR,
                        GRADUATE_TYPE : item.SCHL_LOCTN,
                        LAST_SCHOOL_YN : item.LAST_ACBG_YN,
                        COMPLE_POINT : item.CMPTN_SCR,
                        GPA_POINT : item.EVL_SCR,
                        INTO_DATE : item.MTCLTN_YMD,
                        GRADUATE_DATE : item.GRDTN_YMD,
                        AFTER_ENTER_YN : item.JNCMP_AFTR_YN,
                        MEMO : item.MEMO
                    }
                    jsonSchoolList.push(msg);
                });

                gvwSchool.rebuild();

                // 경력사항
                detailData.cv_7.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        CAREER_TYPE : item.CRR_TYPE,
                        START_DATE : item.BGNG_YMD,
                        END_DATE : item.END_DT,
                        CAREER_YEAR : item.CRR_YR,
                        CAREER_MONTH : item.CRR_MM,
                        COMP_NAME : item.CORP_NM,
                        DEPT_NAME : item.DEPT_NM,
                        POSITION : item.JBPS,
                        JOB : item.JOB,
                        WORK : item.TKCG_TASK,
                        REGION_CODE : item.RGN_CD,
                        RETIRE_MEMO : item.RTRM_MEMO,
                        MEMO : item.MEMO,
                        SALARY_LEVEL : item.SLRY_LVL
                    }
                    jsonCareerList.push(msg);
                });

                gvwCareer.rebuild();

                // 자격사항
                detailData.cv_8.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        LICENSE_CATEGORY : item.LCNS_CTRGY,
                        LICENSE_CODE : item.LCNS_CD,
                        LICENSE_GRADE : item.LCNS_GRD,
                        LICENSE_NUM : item.LCNS_NO,
                        LICENSE_NAME : item.LCNS_NM,
                        ISSUE_INSTITUTE : item.ISSU_INST,
                        ISSUE_DATE : item.ISSU_YMD,
                        RENEW_DATE : item.UPDT_YMD,
                        LICENSE_WAGES_AMT : item.CRTFCT_ALWNC_AMT,
                        APPOINT_YN : item.APNT_YN,
                        APPOINT_DEPT_CODE : item.APNT_DEPT_CD,
                        APPOINT_START_DATE : item.APNT_BGNG_YMD,
                        APPOINT_END_DATE : item.APNT_END_YMD,
                        MEMO : item.MEMO,
                        PAY_YN : item.SLRY_YN
                    }
                    jsonLicenseList.push(msg);
                });

                gvwLicense.rebuild();

                // 어학사항
                detailData.cv_9.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        TEST_TYPE : item.TEST_TYPE,
                        TEST_DATE : item.TEST_YMD,
                        AVAILABLE_DATE : item.VLD_YMD,
                        ISSUE_INSTITUTION : item.ISSU_INST,
                        TOTAL_SCORE : item.TOT_SCR,
                        SCORE1 : item.SCR1,
                        SCORE2 : item.SCR2,
                        SCORE3 : item.SCR3,
                        SCORE4 : item.SCR4,
                        TEST_LEVEL : item.TEST_LVL,
                        MEMO : item.MEMO
                    }
                    jsonLanguageList.push(msg);
                });

                gvwLanguage.rebuild();

                // 컴퓨터활용능력
                detailData.cv_10.forEach((item, index) => {
                    const msg = {
                        EMP_CODE : item.EMP_CD,
                        SEQ : item.SEQ,
                        OA_NAME : item.PC_UTLZ_ABLT_NM,
                        OA_SKILL_LEVEL : item.PC_UTLZ_ABLT_LVL,
                        MEMO : item.MEMO
                    }
                    jsonComputerSkillList.push(msg);
                });

                gvwComputerSkill.rebuild();

                // 인사파일
                detailData.cv_11.forEach((item, index) => {
                    const msg = {
                        FILE_TYPE : item.FILE_TYPE,
                        FILE_NAME : item.FILE_NM,
                        FILE_SERVER_PATH : item.FILE_SRVR_PATH,
                        CREATE_TIME : item.WRT_DT,
                        CREATE_USER : item.INPT_USER,
                        MEMO : item.MEMO
                    }
                    jsonFileList.push(msg);
                });

                gvwFile.rebuild();

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
                        PRIZE_TYPE : item.PZDC_TYPE,
                        PRIZE_DATE : item.PZDC_YMD,
                        PRIZE_CATEGORY : item.PZDC_CTRGY,
                        PRIZE_INOUT_TYPE : item.PZDC_OTSD_TYPE,
                        PRIZE_TARGET : item.PZDC_TRGT,
                        PRIZE_NAME : item.PZDC_NM,
                        PRIZE_REASON : item.PZDC_RSN,
                        PRIZE_DETAIL : item.PZDC_DTL,
                        PRIZE_MAKER : item.PZDC_INST,
                        PUNISH_START_DATE : item.DSPN_BGNG_YMD,
                        PUNISH_END_DATE : item.DSPN_END_YMD,
                        APPLY_PAY_YN : item.APLY_SLRY_YN,
                        BASE_PAY_DOWN_RATE : item.SLRY_RA_RT,
                        BONUS_PAY_DOWN_RATE : item.BONUS_RA_RT
                    }
                    jsonPrizeList.push(msg);
                });

                gvwPrize.rebuild();

                // 건강검진내역
                // TODO : 단위테스트 요청으로 숨김처리 (Grid 생성부분도 주석처리함)
                /*detailData.cv_17.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        CHECK_TYPE : item.HLTH_CKUP_TYPE,
                        CHECK_DATE : item.HLTH_CKUP_YMD,
                        CHECK_INSTITUTE : item.HLTH_CKUP_INST_NM,
                        RESULT : item.RSLT,
                        COMPANY_RESULT : item.CO_ACTN_DSCTN,
                        MEMO : item.MEMO
                    }
                    jsonHealthList.push(msg);
                });

                gvwHealth.rebuild();*/

                // 발령사항
                detailData.cv_18.forEach((item, index) => {
                    const msg = {
                        APPOINT_NUM : item.APNT_NO,
                        APPOINT_DATE : item.APNT_YMD,
                        START_DATE : item.BGNG_YMD,
                        END_DATE : item.END_DT,
                        APPOINT_NAME : item.APNT_NM,
                        APPOINT_TITLE : item.APNT_TTL,
                        DEPT_NAME2 : item.DEPT_NM2,
                        POSITION_NAME2 : item.JBPS_NM2,
                        DUTY_NAME2 : item.JBTTL_NM2,
                        JOB_RANK_NAME2 : item.JBCD_NM2,
                        JOB_FAMILY_NAME2 : item.JOB_LWRNK_GROUP_NM2,
                        JOB_NAME2 : item.DUTY_NM2,
                        REGION_NAME2 : item.RGN_NM2,
                        APPOINT_REASON : item.APNT_RSN,
                        MEMO : item.MEMO
                    }
                    jsonAppointmentList.push(msg);
                });

                gvwAppointment.rebuild();

                // 겸직부서
                detailData.cv_37.forEach((item, index) => {
                    const msg = {
                        APPOINT_NUM : item.APNT_NO,
                        START_DATE : item.BGNG_YMD,
                        END_DATE : item.END_DT,
                        DEPT_CODE : item.DEPT_CD,
                        POSITION_CODE : item.JBPS_CD,
                        DUTY_CODE : item.JBTTL_CD,
                        JOB_RANK : item.JBGD_CD
                    }
                    jsonAddJobList.push(msg);
                });

                gvwAddJob.rebuild();

                // 휴직이력
                detailData.cv_19.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        TIME_OFF_TYPE : item.LVABSN_TYPE,
                        START_DATE : item.BGNG_YMD,
                        END_DATE : item.END_DT,
                        TIME_OFF_CNT : item.LVABSN_DCNT,
                        SITE_CODE : item.SITE_CD,
                        DEPT_CODE : item.DEPT_CD,
                        DEPT_NAME : item.DEPT_NM,
                        MEMO : item.MEMO
                    }
                    jsonTimeOffHistoryList.push(msg);
                });

                gvwTimeOffHistory.rebuild();

                // TODO : 단위테스트 요청으로 숨김처리 (Grid 생성부분도 주석처리함)
                // 단체보험
                /*detailData.cv_20.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        GROUP_INSURE_CODE : item.GRP_INSRNC_CD,
                        INSURE_NUM : item.INSRNC_NM,
                        INSURE_START_DATE : item.INSRNC_JOIN_YMD,
                        INSURE_DUE_DATE : item.INSRNC_MTRY_YMD,
                        INSURE_END_DATE : item.INSRNC_CNCLTN_YMD,
                        GROUP_INSURE_AMT : item.GRP_INSRNC_AMT,
                        MEMO : item.MEMO
                    }
                    jsonGroupInsuranceList.push(msg);
                });

                gvwGroupInsurance.rebuild();*/

                // TODO : 단위테스트 요청으로 숨김처리 (Grid 생성부분도 주석처리함)
                // 상해/질병정보
                /*detailData.cv_21.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        DISEASE_TYPE : item.DSS_TYPE,
                        DISEASE_REASON : item.DSS_RSN,
                        DISEASE_START_DATE : item.ACDNT_OCRN_YMD,
                        SICK_LEAVE_REQUEST_YN : item.SKLV_RQST_YN,
                        SICK_LEAVE_CHARGE_DATE_FR : item.PADLV_SKLV_BGNG_YMD,
                        SICK_LEAVE_CHARGE_DATE_TO : item.PADLV_SKLV_END_YMD,
                        SICK_LEAVE_FREE_DATE_FR : item.UPADLV_SKLV_BGNG_YMD,
                        SICK_LEAVE_FREE_DATE_TO : item.UPADLV_SKLV_END_YMD,
                        GROUP_INSURE_REQUEST_YN : item.GRP_INSRNC_RQST_YN,
                        MEMO : item.MEMO
                    }
                    jsonDiseaseList.push(msg);
                });

                gvwDisease.rebuild();*/

                // TODO : 단위테스트 요청으로 숨김처리 (Grid 생성부분도 주석처리함)
                // 평가항목
               /* detailData.cv_22.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        EVAL_YEAR : item.EVL_YR,
                        POSITION_CODE : item.JBPS_CD,
                        EVAL_KPI_GRADE : item.EVL_KPI_GRD,
                        EVAL_KBI_GRADE : item.CMPTNY_KPI_GRD,
                        MEMO : item.MEMO
                    }
                    jsonPersonnelEvaluationList.push(msg);
                });

                gvwPersonnelEvaluation.rebuild();*/

                // TODO : 단위테스트 요청으로 숨김처리 (Grid 생성부분도 주석처리함)
                // 공상발생
                /*detailData.cv_23.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        OFFICIAL_INJURY_START_DATE : item.RCG_INJR_BGNG_YMD,
                        OFFICIAL_INJURY_DESCR : item.RCG_INJR_DCNT,
                        MEMO : item.MEMO,
                    }
                    jsonOfficialInjuryList.push(msg);
                });

                gvwOfficialInjury.rebuild();*/

                // TODO : 단위테스트 요청으로 숨김처리 (Grid 생성부분도 주석처리함)
                // 계약차수
                /*detailData.cv_35.forEach((item, index) => {
                    const msg = {
                        CONTRACT_DEGREE : item.CTRT_CYCL,
                        CONTRACT_START_DATE : item.CTRT_BGNG_YMD,
                        CONTRACT_END_DATE : item.CTRT_END_YMD,
                        CONTRACT_CHANGE_MEMO : item.CTRT_CHG_MEMO,
                        MEMO : item.MEMO,
                        CONTRACT_DAY : item.CONTRACT_DAY
                    }
                    jsonContractDegList.push(msg);
                });

                gvwContractDeg.rebuild();*/

                // TODO : 단위테스트 요청으로 숨김처리 (Grid 생성부분도 주석처리함)
                // 근무계획
                /*detailData.cv_38.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        WORKPLAN_TYPE : item.FLCTN_WORK_TYPE,
                        START_DATE : item.BGNG_YMD,
                        END_DATE : item.END_DT
                    }
                    jsonWorkPlanList.push(msg);
                });

                gvwWorkPlan.rebuild();*/

                // 근무조
                detailData.cv_39.forEach((item, index) => {
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

                // TODO : 단위테스트 요청으로 숨김처리 (Grid 생성부분도 주석처리함)
                // 경조사비
                /*detailData.cv_24.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        NAME : item.FAM_NM,
                        RELATION : item.FAM_REL,
                        WELFARE_CODE : item.WFR_CD,
                        WELFARE_TYPE : item.WFR_TYPE,
                        WELFARE_DATE : item.WFR_YMD,
                        REQUEST_YM : item.RQST_YM,
                        REQUEST_EVIDENCE : item.RQST_EVDNC,
                        WELFARE_AMOUNT : item.WFR_AMT,
                        DESCRIPTION : item.DSCTN
                    }
                    jsonExpenditurewelfareList.push(msg);
                });

                gvwExpenditurewelfare.rebuild();*/

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
        let EMP_CODE = gfn_nvl(SBUxMethod.get("EMP_CODE"));
        let EMP_NAME = gfn_nvl(SBUxMethod.get("EMP_NAME"));
        let EMP_NAME_CHN = gfn_nvl(SBUxMethod.get("EMP_NAME_CHN"));
        let EMP_NAME_ENG = gfn_nvl(SBUxMethod.get("EMP_NAME_ENG"));
        let SOCIAL_NUM = gfn_nvl(SBUxMethod.get("SOCIAL_NUM"));
        let BIRTHDAY = gfn_nvl(SBUxMethod.get("BIRTHDAY"));
        let BIRTHDAY_TYPE = gfn_nvl(SBUxMethod.get("BIRTHDAY_TYPE"));
        let LEAP_MONTH_YN = gfn_nvl(SBUxMethod.get("LEAP_MONTH_YN").LEAP_MONTH_YN);
        let GENDER = gfn_nvl(SBUxMethod.get("GENDER"));
        let FAMILY_CLAN = gfn_nvl(SBUxMethod.get("FAMILY_CLAN"));
        let FOREIGNER_YN = gfn_nvl(SBUxMethod.get("FOREIGNER_YN").FOREIGNER_YN);
        let FAMILY_OWNER_YN = gfn_nvl(SBUxMethod.get("FAMILY_OWNER_YN").FAMILY_OWNER_YN);
        let GROUP_ENTER_DATE = gfn_nvl(SBUxMethod.get("GROUP_ENTER_DATE"));
        let ENTER_DATE = gfn_nvl(SBUxMethod.get("ENTER_DATE"));
        let ENTER_TYPE = gfn_nvl(gfnma_multiSelectGet('#ENTER_TYPE'));
        let POSITION_CODE = gfn_nvl(SBUxMethod.get("POSITION_CODE"));
        let DUTY_CODE = gfn_nvl(gfnma_multiSelectGet('#DUTY_CODE'));
        let JOB_FAMILY = gfn_nvl(SBUxMethod.get("JOB_FAMILY"));
        let JOB_GROUP = gfn_nvl(SBUxMethod.get("JOB_GROUP"));
        let JOB_RANK = gfn_nvl(SBUxMethod.get("JOB_RANK"));
        let JOB_CODE = gfn_nvl(gfnma_multiSelectGet('#JOB_CODE'));
        let LABOR_COST_GROUP = gfn_nvl(gfnma_multiSelectGet('#LABOR_COST_GROUP'));
        let COST_DEPT_CODE = gfn_nvl(SBUxMethod.get("COST_DEPT_CODE"));
        let TIME_CHECK_YN = gfn_nvl(SBUxMethod.get("TIME_CHECK_YN"));
        let EMP_TYPE = gfn_nvl(SBUxMethod.get("EMP_TYPE"));
        let EMP_STATE = gfn_nvl(SBUxMethod.get("EMP_STATE"));
        let SALARY_CLASS = gfn_nvl(SBUxMethod.get("SALARY_CLASS"));
        let SITE_CODE = gfn_nvl(SBUxMethod.get("SITE_CODE"));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("DEPT_CODE"));
        let SALES_EMP_YN = gfn_nvl(SBUxMethod.get("SALES_EMP_YN").SALES_EMP_YN);
        let TAX_SITE_CODE = gfn_nvl(SBUxMethod.get("TAX_SITE_CODE"));
        let NATION_CODE = gfn_nvl(SBUxMethod.get("NATION_CODE"));
        let REGISTER_ZIP_CODE = gfn_nvl(SBUxMethod.get("REGISTER_ZIP_CODE"));
        let REGISTER_ADDRESS = gfn_nvl(SBUxMethod.get("REGISTER_ADDRESS"));
        let RESIDENCE_ZIP_CODE = gfn_nvl(SBUxMethod.get("RESIDENCE_ZIP_CODE"));
        let RESIDENCE_ADDRESS = gfn_nvl(SBUxMethod.get("RESIDENCE_ADDRESS"));
        let OFFICE_TEL_NUM = gfn_nvl(SBUxMethod.get("OFFICE_TEL_NUM"));
        let FAX_NUM = gfn_nvl(SBUxMethod.get("FAX_NUM"));
        let INTER_PHONE = gfn_nvl(SBUxMethod.get("INTER_PHONE"));
        let CELLPHONE_NUM = gfn_nvl(SBUxMethod.get("CELLPHONE_NUM"));
        let HOME_TEL_NUM = gfn_nvl(SBUxMethod.get("HOME_TEL_NUM"));
        let IN_EMAIL = gfn_nvl(SBUxMethod.get("IN_EMAIL"));
        let OUT_EMAIL = gfn_nvl(SBUxMethod.get("OUT_EMAIL"));
        let TEMP_END_DATE = gfn_nvl(SBUxMethod.get("TEMP_END_DATE"));
        let BONUS_APPLY_START_DATE = gfn_nvl(SBUxMethod.get("BONUS_APPLY_START_DATE"));
        let UNION_JOIN_YN = gfn_nvl(SBUxMethod.get("UNION_JOIN_YN").UNION_JOIN_YN);
        let UNION_JOIN_START_DATE = gfn_nvl(SBUxMethod.get("UNION_JOIN_START_DATE"));
        let UNION_JOIN_END_DATE = gfn_nvl(SBUxMethod.get("UNION_JOIN_END_DATE"));
        let RETIRE_DATE = gfn_nvl(SBUxMethod.get("RETIRE_DATE"));
        let RETIRE_REASON = gfn_nvl(SBUxMethod.get("RETIRE_REASON"));
        let RETIRE_IN_REASON = gfn_nvl(gfnma_multiSelectGet('#RETIRE_IN_REASON'));
        let RETIRE_INITIAL_DATE = gfn_nvl(SBUxMethod.get("RETIRE_INITIAL_DATE"));
        let RETIRE_PENSION_JOIN_YN = gfn_nvl(SBUxMethod.get("RETIRE_PENSION_JOIN_YN").RETIRE_PENSION_JOIN_YN);
        let CAREER_DATE = gfn_nvl(SBUxMethod.get("CAREER_DATE"));
        let PREMATURE_DATE = gfn_nvl(SBUxMethod.get("PREMATURE_DATE"));
        let WORK_REGION = gfn_nvl(gfnma_multiSelectGet('#WORK_REGION'));
        let EMP_MEMO = gfn_nvl(SBUxMethod.get("EMP_MEMO"));
        let TELEWORKING_YN = gfn_nvl(SBUxMethod.get("TELEWORKING_YN").TELEWORKING_YN);
        let TELEWORKING_ADDRESS = gfn_nvl(SBUxMethod.get("TELEWORKING_ADDRESS"));
        let ORDER_SEQ = gfn_nvl(SBUxMethod.get("ORDER_SEQ"));
        let EMP_PHOTO_PATH = gfn_nvl(SBUxMethod.get("EMP_PHOTO_PATH"));
        let EMP_PHOTO_NAME = gfn_nvl(SBUxMethod.get("EMP_PHOTO_NAME"));
        let SIGN_IMG_PATH = gfn_nvl(SBUxMethod.get("SIGN_IMG_PATH"));
        let SIGN_IMG_NAME = gfn_nvl(SBUxMethod.get("SIGN_IMG_NAME"));
        let START_POSITION_CODE = gfn_nvl(SBUxMethod.get("START_POSITION_CODE"));
        let CAREER_TRACK = gfn_nvl(SBUxMethod.get("CAREER_TRACK"));
        let BOARD_DIRECTOR_YN = gfn_nvl(SBUxMethod.get("BOARD_DIRECTOR_YN").BOARD_DIRECTOR_YN);
        let INTRODUCER_CODE = gfn_nvl(SBUxMethod.get("INTRODUCER_CODE"));
        let RE_ENTER_YN = gfn_nvl(SBUxMethod.get("RE_ENTER_YN").RE_ENTER_YN);
        let ANNUAL_INITIAL_DATE = gfn_nvl(SBUxMethod.get("ANNUAL_INITIAL_DATE"));
        let PARTNER_FIRM_EMP_YN = gfn_nvl(SBUxMethod.get("PARTNER_FIRM_EMP_YN").PARTNER_FIRM_EMP_YN);
        let PARTNER_FIRM_CODE = gfn_nvl(SBUxMethod.get("PARTNER_FIRM_CODE"));
        let SOCIAL_NUM_DATE = gfn_nvl(SBUxMethod.get("SOCIAL_NUM_DATE"));
        let SALARY_LEVEL = gfn_nvl(SBUxMethod.get("SALARY_LEVEL"));
        let FAMILY_REGISTER_ZIP_CODE = gfn_nvl(SBUxMethod.get("FAMILY_REGISTER_ZIP_CODE"));
        let FAMILY_REGISTER_ADDRESS = gfn_nvl(SBUxMethod.get("FAMILY_REGISTER_ADDRESS"));
        let EMERGENCY_ZIP_CODE = gfn_nvl(SBUxMethod.get("EMERGENCY_ZIP_CODE"));
        let EMERGENCY_ADDRESS = gfn_nvl(SBUxMethod.get("EMERGENCY_ADDRESS"));
        let EMERGENCY_TEL_NUM = gfn_nvl(SBUxMethod.get("EMERGENCY_TEL_NUM"));
        let OLD_EMP_CODE = gfn_nvl(SBUxMethod.get("OLD_EMP_CODE"));
        let COMP_ENTER_DATE = gfn_nvl(SBUxMethod.get("COMP_ENTER_DATE"));
        let PROMOTION_BASE_DATE = gfn_nvl(SBUxMethod.get("PROMOTION_BASE_DATE"));
        let RETIRE_BASE_DATE = gfn_nvl(SBUxMethod.get("RETIRE_BASE_DATE"));
        let RET_RENS_ST_DAT = gfn_nvl(SBUxMethod.get("RET_RENS_ST_DAT"));
        let ANNUAL_BASE_DATE = gfn_nvl(SBUxMethod.get("ANNUAL_BASE_DATE"));
        let AGREE_DATE = gfn_nvl(SBUxMethod.get("AGREE_DATE"));
        let AGREE_YN = gfn_nvl(SBUxMethod.get("AGREE_YN").AGREE_YN);
        let START_PAY_GRADE = gfn_nvl(SBUxMethod.get("START_PAY_GRADE"));
        let JOB_SUB_CODE = gfn_nvl(gfnma_multiSelectGet('#JOB_SUB_CODE'));
        let JOB_DETAIL_CODE = gfn_nvl(gfnma_multiSelectGet('#JOB_DETAIL_CODE'));
        let TO_YN = gfn_nvl(SBUxMethod.get("TO_YN").TO_YN);

        return {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_NAME : EMP_NAME,
            V_P_EMP_NAME_CHN : EMP_NAME_CHN,
            V_P_EMP_NAME_ENG : EMP_NAME_ENG,
            V_P_SOCIAL_NUM : SOCIAL_NUM,
            V_P_BIRTHDAY : BIRTHDAY,
            V_P_BIRTHDAY_TYPE : BIRTHDAY_TYPE,
            V_P_LEAP_MONTH_YN : LEAP_MONTH_YN,
            V_P_GENDER : GENDER,
            V_P_FAMILY_CLAN : FAMILY_CLAN,
            V_P_FOREIGNER_YN : FOREIGNER_YN,
            V_P_FAMILY_OWNER_YN : FAMILY_OWNER_YN,
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
            V_P_SALES_EMP_YN : SALES_EMP_YN,
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
            V_P_UNION_JOIN_YN : UNION_JOIN_YN,
            V_P_UNION_JOIN_START_DATE : UNION_JOIN_START_DATE,
            V_P_UNION_JOIN_END_DATE : UNION_JOIN_END_DATE,
            V_P_RETIRE_DATE : RETIRE_DATE,
            V_P_RETIRE_REASON : RETIRE_REASON,
            V_P_RETIRE_IN_REASON : RETIRE_IN_REASON,
            V_P_RETIRE_INITIAL_DATE : RETIRE_INITIAL_DATE,
            V_P_RETIRE_PENSION_JOIN_YN : RETIRE_PENSION_JOIN_YN,
            V_P_CAREER_DATE : CAREER_DATE,
            V_P_PREMATURE_DATE : PREMATURE_DATE,
            V_P_WORK_REGION : WORK_REGION,
            V_P_EMP_MEMO : EMP_MEMO,
            V_P_TELEWORKING_YN : TELEWORKING_YN,
            V_P_TELEWORKING_ADDRESS : TELEWORKING_ADDRESS,
            V_P_ORDER_SEQ : ORDER_SEQ,
            V_P_EMP_PHOTO_PATH : EMP_PHOTO_PATH,
            V_P_EMP_PHOTO_NAME : EMP_PHOTO_NAME,
            V_P_SIGN_IMG_PATH : SIGN_IMG_PATH,
            V_P_SIGN_IMG_NAME : SIGN_IMG_NAME,
            V_P_START_POSITION_CODE : START_POSITION_CODE,
            V_P_CAREER_TRACK : CAREER_TRACK,
            V_P_BOARD_DIRECTOR_YN : BOARD_DIRECTOR_YN,
            V_P_INTRODUCER_CODE : INTRODUCER_CODE,
            V_P_RE_ENTER_YN : RE_ENTER_YN,
            V_P_ANNUAL_INITIAL_DATE : ANNUAL_INITIAL_DATE,
            V_P_PARTNER_FIRM_EMP_YN : PARTNER_FIRM_EMP_YN,
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
            V_P_AGREE_YN : AGREE_YN,
            V_P_START_PAY_GRADE : START_PAY_GRADE,
            V_P_JOB_SUB_CODE : JOB_SUB_CODE,
            V_P_JOB_DETAIL_CODE : JOB_DETAIL_CODE,
            V_P_TO_YN : TO_YN,
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
        paramData.append("comp_code", 		gv_ma_selectedCorpCd);
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
                    $("#EMP_PHOTO").attr("src", "/com/getFileImage.do?fkey="+data.imgKey+"&comp_code="+gv_ma_selectedCorpCd+"&client_code=" + gv_ma_selectedClntCd );
                    $("#DIV_EMP_PHOTO").hide();
                } else if(type == "2") {
                    SBUxMethod.set("SIGN_IMG_NAME", data.imgKey);
                    SBUxMethod.set("SIGN_IMG_PATH", data.params[6]);
                    $("#SIGN_IMG").attr("src", "/com/getFileImage.do?fkey="+data.imgKey+"&comp_code="+gv_ma_selectedCorpCd+"&client_code=" + gv_ma_selectedClntCd );
                    $("#DIV_SIGN_IMG").hide();
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

        //이미지(사진,싸인) 보여줄때
        // <img src="/com/getFileImage.do?fkey=fdf31133e11545f0b2f0ada67efcd5e8.png&comp_code=8888&client_code=100" />

    }

    const fn_print = async function() {
        let gvwListCheckedList = gvwList.getCheckedRows(gvwList.getColRef("CHK_YN"), true);
        let gvwListCheckedRowsData = gvwList.getCheckedRowData(gvwList.getColRef("CHK_YN"));

        var conn = '';

        if (gvwListCheckedRowsData.length < 1) {
            gfn_comAlert("E0000", "사원을 선택해주세요.");
            return;
        }else if(gvwListCheckedRowsData.length == 1){
            conn = await fn_GetReportData(gvwListCheckedRowsData[0].data);
            conn = await gfnma_convertDataForReport(conn);
            await gfn_popClipReportPost("인사기록카드", "ma/RPT_HRI1000.crf", null, conn );
        }else{
            let empCodeList = "";
            gvwListCheckedList.forEach((item, index) => {
                empCodeList += gvwList.getCellData(item, gvwList.getColRef("EMP_CODE")) + "|";
            });

            empCodeList = empCodeList.substring(0, empCodeList.length - 1);

            conn = await fn_GetReportData({EMP_CODE: empCodeList});
            conn = await gfnma_convertDataForReport(conn);
            await gfn_popClipReportPost("인사기록카드" + i, "ma/RPT_HRI1000.crf", null, conn );
        }
    }

    const fn_GetReportData = async function(obj) {
        var paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd
            ,V_P_SITE_CODE      : ''
            ,V_P_DEPT_CODE      : ''
            ,V_P_EMP_CODE       : ''
            ,V_P_EMP_STATE      : ''
            ,V_P_JOB_GROUP      : ''
            ,V_P_GENDER         : ''
            ,IV_P_ENTER_DATE_FR : ''
            ,IV_P_ENTER_DATE_TO : ''
            ,V_P_EMP_CODE1      : obj.EMP_CODE
            ,V_P_INITIAL_DATE   : ''
            ,V_P_EMP_STATE2     : ''
            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        };
        const postJsonPromise = gfn_postJSON("/hr/hri/hri/selectHri1000ReportList.do", {
            getType				: 'json',
            workType			: 'REPORT',
            cv_count			: '39',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
            	if(data.cv_1.length > 0){
            		data.cv_1[0].CORP_LOGO = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfn_nvl(data.cv_1[0].LOGO_FILE_NAME) +"&comp_code="+ gv_ma_selectedCorpCd +"&client_code=" + gv_ma_selectedClntCd;
            		data.cv_1[0].EMP_PHOTO = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfn_nvl(data.cv_1[0].EMP_PHOTO_NM) +"&comp_code="+ gv_ma_selectedCorpCd +"&client_code=" + gv_ma_selectedClntCd;
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
        return data;
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
