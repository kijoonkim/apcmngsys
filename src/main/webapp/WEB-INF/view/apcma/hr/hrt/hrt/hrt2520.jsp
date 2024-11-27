<%
    /**
     * @Class Name 		: hrt2520.jsp
     * @Description 	: 월별근태조정 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.06.03
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.03   	이경한		최초 생성
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
    <title>title : 월별근태조정</title>
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
            <div style="margin-left: auto;">
                <sbux-button id="btnCancel" name="btnCancel" uitype="normal" text="확정취소" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_cancel"></sbux-button>
                <sbux-button id="btnConfirm" name="btnConfirm" uitype="normal" text="확정" class="btn btn-sm btn-outline-danger" style="float: right;" onclick="fn_confirm"></sbux-button>
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
                    <th scope="row" class="th_bg_search">근태년월</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YYYYMM"
                                name="SRCH_YYYYMM"
                                date-format="yyyy-mm"
                                datepicker-mode="month"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td colspan="3"></td>
                    <th scope="row" class="th_bg_search">소급년월</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_ACCT_YYYYMM"
                                name="SRCH_ACCT_YYYYMM"
                                date-format="yyyy-mm"
                                datepicker-mode="month"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td colspan="3"></td>
                    <th scope="row" class="th_bg_search">직종</th>
                    <td colspan="3" class="td_input">
                        <sbux-select id="SRCH_JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
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
                                onclick="fn_findDeptCode"
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
                </tr>
                </tbody>
            </table>
            </div>
            <div class="row">
                <div>
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>집계이력</span>
                                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwInfo" style="height:616px;"></div>
                    </div>
                </div>
                <div id="detailArea">
                    <div class="ad_tbl_top2">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>상세정보</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-grdDetail" style="height:250px;"></div>
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
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    var jsonJobGroup = []; // 직군
    var jsonEmpState = []; // 재직구분
    var jsonSiteCode = []; // 사업장
    var jsonPositionCode = []; // 직위

    //grid 초기화
    var gvwInfo; 			// 그리드를 담기위한 객체 선언
    var grdDetail;

    var jsonSummaryHistoryList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonDetailHistoryList = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['gvwInfo'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#SRCH_SITE_CODE']
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
            // 직군
            gfnma_setComSelect(['SRCH_JOB_GROUP'], jsonJobGroup, 'L_HRI047_03', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 재직구분
            gfnma_setComSelect(['SRCH_EMP_STATE'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['gvwInfo'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwInfo';
        SBGridProperties.id 				= 'gvwInfo';
        SBGridProperties.jsonref 			= 'jsonSummaryHistoryList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.frozencols = 11;
        SBGridProperties.frozenbottomrows = 1;
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [4],
                sum : [15, 16, 17, 18, 19, 20,
                    21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
                    31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
                    41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
                    51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
                    61, 62, 63, 64, 65, 66, 67, 68, 69, 70,
                    71, 72, 73, 74, 75, 76, 77, 78, 79, 80,
                    81, 82, 83, 84, 85, 86, 87, 88, 89, 90,
                    91, 92, 93, 94, 95, 96, 97, 98, 99, 100,
                    101, 102, 103, 104, 105, 106, 107, 108, 109, 110,
                    111, 112, 113, 114, 115, 116, 117, 118, 119, 120,
                ],
                count : [4]
            },
            datasorting	: true,
            usedecimal : false,
        };
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["부서"],         ref: 'DEPT_NAME',    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["사번"],         ref: 'EMP_CODE',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["이름"],         ref: 'EMP_NAME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["직위"], 		ref: 'POSITION_CODE',   	    type:'combo', style:'text-align:left' ,width: '82px',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["확정"],      	ref: 'WORK_SUMMARY_CONFIRM_YN', 		        type:'checkbox',  	width:'50px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
            {caption: ["확정일자"],       ref: 'CONFIRM_DATE', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["근태년월"],       ref: 'YYYYMM', 		type:'inputdate',  	width:'70px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm'},
                format : {type:'date', rule:'yyyy-mm', origin:'YYYYMM'}
                , disabled: true
                , hidden: true
            },
            {caption: ["소급월"],       ref: 'ACCT_YYYYMM', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm'},
                format : {type:'date', rule:'yyyy-mm', origin:'YYYYMM'}
            },
            {caption: ["집계시작일"],       ref: 'WORK_SUMMARY_START_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["집계종료일"],       ref: 'WORK_SUMMARY_END_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["급여집계시작일"],       ref: 'PAY_SUMMARY_START_DATE', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["급여집계종료일"],       ref: 'PAY_SUMMARY_END_DATE', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["OT시간(합계)"],         ref: 'TIME_SUM',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["근속년수"],         ref: 'WORK_YEARS',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["기본근무시간"],         ref: 'BASE_WORK_TIME',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["참조시간10"],         ref: 'ATTR10_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["전체일수"],         ref: 'TOT_DAY',    type:'input',  	width:'70px',  style:'text-align:right'},
            {caption: ["근무일수"],         ref: 'WORK_DAY',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["질병휴직"],         ref: 'EXTRA_FIELD5',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["유급휴일"],         ref: 'PAID_HOLIDAY',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["무급휴일"],         ref: 'NONPAID_HOLIDAY',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["총근무시간"],         ref: 'TOTAL_WORK_TIME',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["휴직(고용유지)"],         ref: 'ATTR10_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["향군근무"],         ref: 'EXTRA_FIELD1',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["교육시간"],         ref: 'EDU_DAY',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["연장근로"],         ref: 'OVER_TIME',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["휴일근로"],         ref: 'HOLIDAY_TIME',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["휴일연장"],         ref: 'HOLIDAY_OVER_TIME',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["유휴연장"],         ref: 'ATTR4_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["명절근로"],         ref: 'ATTR3_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["명절연장"],         ref: 'ATTR5_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["향군(연장)"],         ref: 'ATTR1_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["교육(연장)"],         ref: 'ATTR2_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["야간근로"],         ref: 'NIGHT_TIME',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["연차사용"],         ref: 'ANNUAL_USE_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["특휴사용"],         ref: 'EXTRA_FIELD3',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["하기휴가사용"],         ref: 'EXTRA_FIELD4',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["청원휴가사용"],         ref: 'EXTRA_FIELD2',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["지각시간"],         ref: 'LATE_TIME',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["조퇴시간"],         ref: 'EARLY_LEAVE_TIME',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["외출시간"],         ref: 'GO_OUT_TIME',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["유계결근"],         ref: 'ABSENCE_DAY',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["무계결근"],         ref: 'EXTRA_FIELD6',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["파업시간"],         ref: 'EXTRA_FIELD10',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["백신휴가인정시간"],         ref: 'ATTR7_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["무급휴가사용"],         ref: 'ATTR6_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["대체휴가사용"],         ref: 'REPLACE_VACATION_DAY',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["교육기타(기본)"],         ref: 'ATTR6_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["교육기타(통상)"],         ref: 'ATTR7_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["고정연장"],         ref: 'ATTR5_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["연차발생"],         ref: 'ANNUAL_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["조합활동일"],         ref: 'ATTR1_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["휴일근무일수"],         ref: 'HOLIDAY_WORK_DAY',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["공상일수"],         ref: 'OFFICIAL_INJURY_DAY',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["휴업시간"],         ref: 'ATTR2_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["지각횟수"],         ref: 'LATE_CNT',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["조퇴횟수"],         ref: 'EARLY_LEAVE_CNT',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["외출횟수"],         ref: 'GO_OUT_CNT',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["외근횟수"],         ref: 'OUTSIDE_CNT',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["육아휴직"],         ref: 'EXTRA_FIELD7',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["일반휴직"],         ref: 'EXTRA_FIELD8',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["산재휴직"],         ref: 'EXTRA_FIELD9',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["산전후휴가일수"],         ref: 'ATTR4_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["외근시간"],         ref: 'OUTSIDE_TIME',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["실근무일수"],         ref: 'REAL_WORK_DAY',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["추가일수"],         ref: 'ADD_DAY',    type:'input',  	width:'80px',  style:'text-align:right'},
            {caption: ["공휴근무"],         ref: 'EXTRA_FIELD18',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["공휴연장"],         ref: 'EXTRA_FIELD19',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["반차일수"],         ref: 'ATTR11_DAY',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["주휴공제"],         ref: 'ATTR12_DAY',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["무급휴직"],         ref: 'ATTR13_DAY',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["정직일수"],         ref: 'ATTR14_DAY',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["조합원교육시간"],         ref: 'ATTR15_DAY',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["코로나검사일수"],         ref: 'ATTR11_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["공휴시간"],         ref: 'ATTR12_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["공휴사용일수"],         ref: 'ATTR13_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["코로나검사일수(차감)"],         ref: 'ATTR14_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["교육(휴일)"],         ref: 'ATTR15_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["코로나검사(교대)"],         ref: 'ATTR16_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["교대조여부(통상)"],         ref: 'EXTRA_FIELD17',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["명절근무일수"],         ref: 'EXTRA_FIELD16',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["13유휴(유휴)"],         ref: 'ATTR8_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["월중휴(월지정휴)"],         ref: 'ATTR9_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["부족휴(보휴)"],         ref: 'ATTR8_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["연중휴(연휴)"],         ref: 'ATTR9_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["명절근무일수"],         ref: 'EXTRA_FIELD11',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["안전교육시간1"],         ref: 'EXTRA_FIELD12',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["안전교육시간2"],         ref: 'EXTRA_FIELD13',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["교대조여부"],         ref: 'EXTRA_FIELD14',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["조합활동시간(휴일)"],         ref: 'EXTRA_FIELD15',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["교육(휴일+연장)"],         ref: 'ATTR3_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["참조시간17"],         ref: 'ATTR17_TIME',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["잔여연차"],         ref: 'ANNUAL_REMAIN_DAY',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["경조휴가"],         ref: 'CELEBRATE_DAY',    type:'input',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["시간외A시간"],         ref: 'AFTER_HOURS_TIME1',    type:'input',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["시간외B시간"],         ref: 'AFTER_HOURS_TIME2',    type:'input',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["월차발생"],         ref: 'MONTHLY_DAY',    type:'input',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["월차사용"],         ref: 'MONTHLY_USE_DAY',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["생휴발생"],         ref: 'MENSTRUEL_DAY',    type:'input',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["생휴사용"],         ref: 'MENSTRUEL_USE_DAY',    type:'input',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["당직일수"],         ref: 'NIGHT_DUTY_DAY',    type:'input',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["일요일시간"],         ref: 'SUNDAY_TIME',    type:'input',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["일요일연장시간"],         ref: 'SUNDAY_OVER_TIME',    type:'input',  	width:'100px',  style:'text-align:right', hidden: true},
            {caption: ["주휴일수"],         ref: 'WEEKLY_HOLIDAY_DAY',    type:'input',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["여유필드20"],         ref: 'EXTRA_FIELD10',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조일수16"],         ref: 'ATTR16_DAY',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조일수17"],         ref: 'ATTR17_DAY',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조일수18"],         ref: 'ATTR18_DAY',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조일수19"],         ref: 'ATTR19_DAY',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조일수20"],         ref: 'ATTR20_DAY',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조시간18"],         ref: 'ATTR18_TIME',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조시간19"],         ref: 'ATTR19_TIME',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조시간20"],         ref: 'ATTR20_TIME',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
        ];

        gvwInfo = _SBGrid.create(SBGridProperties);
        gvwInfo.bind('click', 'fn_view');
        gvwInfo.bind('valuechanged', 'fn_gvwInfoValueChanged');
        gvwInfo.bind('keyup', 'fn_keyup');
    }

    const fn_gvwInfoValueChanged = async function () {
        var nRow = gvwInfo.getRow();
        var nCol = gvwInfo.getCol();
        var rowData = gvwInfo.getRowData(nRow);

        if (nRow < 0)
            return;

        if (nCol == gvwInfo.getColRef("AFTER_HOURS_TIME1") || nCol == gvwInfo.getColRef("AFTER_HOURS_TIME2")
            || nCol == gvwInfo.getColRef("OVER_TIME") || nCol == gvwInfo.getColRef("NIGHT_TIME")
            || nCol == gvwInfo.getColRef("HOLIDAY_TIME") || nCol == gvwInfo.getColRef("HOLIDAY_OVER_TIME")
            || nCol == gvwInfo.getColRef("SUNDAY_TIME")  || nCol == gvwInfo.getColRef("SUNDAY_OVER_TIME")
            || nCol == gvwInfo.getColRef("EXTRA_FIELD1") || nCol == gvwInfo.getColRef("EXTRA_FIELD2")) {
            let dafter_hours_time1 = parseInt(rowData.AFTER_HOURS_TIME1);
            let dafter_hours_time2 = parseInt(rowData.AFTER_HOURS_TIME2);
            let dover_time = parseInt(rowData.OVER_TIME);
            let dnight_time = parseInt(rowData.NIGHT_TIME);
            let dholiday_time = parseInt(rowData.HOLIDAY_TIME);
            let dholiday_over_time = parseInt(rowData.HOLIDAY_OVER_TIME);
            let dsunday_time = parseInt(rowData.SUNDAY_TIME);
            let dsunday_over_time = parseInt(rowData.SUNDAY_OVER_TIME);
            let dextra_field1 = parseInt(rowData.EXTRA_FIELD1);
            let dextra_field2 = parseInt(rowData.EXTRA_FIELD2);

            gvwInfo.setCellData(nRow, gvwInfo.getColRef("TIME_SUM"), (dafter_hours_time1 + dafter_hours_time2 + dover_time + dnight_time + dholiday_time + dholiday_over_time + dsunday_time + dsunday_over_time + dextra_field1 + dextra_field2));
        }
    }

    function fn_createGrdDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-grdDetail';
        SBGridProperties.id 				= 'grdDetail';
        SBGridProperties.jsonref 			= 'jsonDetailHistoryList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.frozencols = 11;
        SBGridProperties.frozenbottomrows = 1;
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [4],
                sum : [15, 16, 17, 18, 19, 20,
                    21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
                    31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
                    41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
                    51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
                    61, 62, 63, 64, 65, 66, 67, 68, 69, 70,
                    71, 72, 73, 74, 75, 76, 77, 78, 79, 80,
                    81, 82, 83, 84, 85, 86, 87, 88, 89, 90,
                    91, 92, 93, 94, 95, 96, 97, 98, 99, 100,
                    101, 102, 103, 104, 105, 106, 107, 108, 109, 110,
                    111, 112, 113, 114, 115, 116, 117, 118, 119, 120,
                ],
                count : [4]
            },
            datasorting	: true,
            usedecimal : false,
        };
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["부서"],         ref: 'DEPT_NAME',    type:'output',  	width:'120px',  style:'text-align:left'},
            {caption: ["사번"],         ref: 'EMP_CODE',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["이름"],         ref: 'EMP_NAME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["직위"], 		ref: 'POSITION_CODE',   	    type:'combo', style:'text-align:left' ,width: '82px',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["확정"],      	ref: 'WORK_SUMMARY_CONFIRM_YN', 		        type:'checkbox',  	width:'50px',  	style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
            {caption: ["확정일자"],       ref: 'CONFIRM_DATE', 		type:'inputdate',  	width:'100px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["근태년월"],       ref: 'YYYYMM', 		type:'inputdate',  	width:'70px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm'},
                format : {type:'date', rule:'yyyy-mm', origin:'YYYYMM'}
                , disabled: true
                , hidden: true
            },
            {caption: ["소급월"],       ref: 'ACCT_YYYYMM', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm'},
                format : {type:'date', rule:'yyyy-mm', origin:'YYYYMM'}
            },
            {caption: ["시작일자"],       ref: 'START_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["종료일자"],       ref: 'END_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["OT시간(합계)"],         ref: 'TIME_SUM',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["근속년수"],         ref: 'WORK_YEARS',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["기본근무시간"],         ref: 'BASE_WORK_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["참조시간10"],         ref: 'ATTR10_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["전체일수"],         ref: 'TOT_DAY',    type:'output',  	width:'70px',  style:'text-align:right'},
            {caption: ["근무일수"],         ref: 'WORK_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["질병휴직"],         ref: 'EXTRA_FIELD5',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["유급휴일"],         ref: 'PAID_HOLIDAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["무급휴일"],         ref: 'NONPAID_HOLIDAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["총근무시간"],         ref: 'TOTAL_WORK_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["휴직(고용유지)"],         ref: 'ATTR10_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["향군근무"],         ref: 'EXTRA_FIELD1',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["교육시간"],         ref: 'EDU_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["연장근로"],         ref: 'OVER_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["휴일근로"],         ref: 'HOLIDAY_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["휴일연장"],         ref: 'HOLIDAY_OVER_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["유휴연장"],         ref: 'ATTR4_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["명절근로"],         ref: 'ATTR3_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["명절연장"],         ref: 'ATTR5_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["향군(연장)"],         ref: 'ATTR1_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["교육(연장)"],         ref: 'ATTR2_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["야간근로"],         ref: 'NIGHT_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["연차사용"],         ref: 'ANNUAL_USE_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["특휴사용"],         ref: 'EXTRA_FIELD3',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["하기휴가사용"],         ref: 'EXTRA_FIELD4',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["청원휴가사용"],         ref: 'EXTRA_FIELD2',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["지각시간"],         ref: 'LATE_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["조퇴시간"],         ref: 'EARLY_LEAVE_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["외출시간"],         ref: 'GO_OUT_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["유계결근"],         ref: 'ABSENCE_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["무계결근"],         ref: 'EXTRA_FIELD6',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["파업시간"],         ref: 'EXTRA_FIELD10',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["백신휴가인정시간"],         ref: 'ATTR7_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["무급휴가사용"],         ref: 'ATTR6_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["대체휴가사용"],         ref: 'REPLACE_VACATION_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["교육기타(기본)"],         ref: 'ATTR6_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["교육기타(통상)"],         ref: 'ATTR7_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["고정연장"],         ref: 'ATTR5_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["연차발생"],         ref: 'ANNUAL_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["조합활동일"],         ref: 'ATTR1_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["휴일근무일수"],         ref: 'HOLIDAY_WORK_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["공상일수"],         ref: 'OFFICIAL_INJURY_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["휴업시간"],         ref: 'ATTR2_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["지각횟수"],         ref: 'LATE_CNT',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["조퇴횟수"],         ref: 'EARLY_LEAVE_CNT',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["외출횟수"],         ref: 'GO_OUT_CNT',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["외근횟수"],         ref: 'OUTSIDE_CNT',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["육아휴직"],         ref: 'EXTRA_FIELD7',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["일반휴직"],         ref: 'EXTRA_FIELD8',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["산재휴직"],         ref: 'EXTRA_FIELD9',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["산전후휴가일수"],         ref: 'ATTR4_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["외근시간"],         ref: 'OUTSIDE_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["실근무일수"],         ref: 'REAL_WORK_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["추가일수"],         ref: 'ADD_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["공휴근무"],         ref: 'EXTRA_FIELD18',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["공휴연장"],         ref: 'EXTRA_FIELD19',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["반차일수"],         ref: 'ATTR11_DAY',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["주휴공제"],         ref: 'ATTR12_DAY',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["무급휴직"],         ref: 'ATTR13_DAY',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["정직일수"],         ref: 'ATTR14_DAY',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["조합원교육시간"],         ref: 'ATTR15_DAY',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["코로나검사일수"],         ref: 'ATTR11_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["공휴시간"],         ref: 'ATTR12_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["공휴사용일수"],         ref: 'ATTR13_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["코로나검사일수(차감)"],         ref: 'ATTR14_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["교육(휴일)"],         ref: 'ATTR15_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["코로나검사(교대)"],         ref: 'ATTR16_TIME',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["교대조여부(통상)"],         ref: 'EXTRA_FIELD17',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["명절근무일수"],         ref: 'EXTRA_FIELD16',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["13유휴(유휴)"],         ref: 'ATTR8_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["월중휴(월지정휴)"],         ref: 'ATTR9_DAY',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["부족휴(보휴)"],         ref: 'ATTR8_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["연중휴(연휴)"],         ref: 'ATTR9_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["명절근무일수"],         ref: 'EXTRA_FIELD11',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["안전교육시간1"],         ref: 'EXTRA_FIELD12',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["안전교육시간2"],         ref: 'EXTRA_FIELD13',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["교대조여부"],         ref: 'EXTRA_FIELD14',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["조합활동시간(휴일)"],         ref: 'EXTRA_FIELD15',    type:'output',  	width:'75px',  style:'text-align:right'},
            {caption: ["교육(휴일+연장)"],         ref: 'ATTR3_TIME',    type:'output',  	width:'80px',  style:'text-align:right'},
            {caption: ["참조시간17"],         ref: 'ATTR17_TIME',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["잔여연차"],         ref: 'ANNUAL_REMAIN_DAY',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["경조휴가"],         ref: 'CELEBRATE_DAY',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["시간외A시간"],         ref: 'AFTER_HOURS_TIME1',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["시간외B시간"],         ref: 'AFTER_HOURS_TIME2',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["월차발생"],         ref: 'MONTHLY_DAY',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["월차사용"],         ref: 'MONTHLY_USE_DAY',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["생휴발생"],         ref: 'MENSTRUEL_DAY',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["생휴사용"],         ref: 'MENSTRUEL_USE_DAY',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["당직일수"],         ref: 'NIGHT_DUTY_DAY',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["일요일시간"],         ref: 'SUNDAY_TIME',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["일요일연장시간"],         ref: 'SUNDAY_OVER_TIME',    type:'output',  	width:'100px',  style:'text-align:right', hidden: true},
            {caption: ["주휴일수"],         ref: 'WEEKLY_HOLIDAY_DAY',    type:'output',  	width:'80px',  style:'text-align:right', hidden: true},
            {caption: ["여유필드20"],         ref: 'EXTRA_FIELD10',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조일수16"],         ref: 'ATTR16_DAY',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조일수17"],         ref: 'ATTR17_DAY',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조일수18"],         ref: 'ATTR18_DAY',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조일수19"],         ref: 'ATTR19_DAY',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조일수20"],         ref: 'ATTR20_DAY',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조시간18"],         ref: 'ATTR18_TIME',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조시간19"],         ref: 'ATTR19_TIME',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["참조시간20"],         ref: 'ATTR20_TIME',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
        ];

        grdDetail = _SBGrid.create(SBGridProperties);
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwInfoGrid();
        fn_createGrdDetailGrid();
        await fn_onload();
    });

    var fn_findDeptCode = function() {
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
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: [searchCode, 				searchName,		gfn_dateToYmd(new Date())]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["START_DATE",	"SITE_NAME", 	"DEPT_NAME",  	"SITE_CODE"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_findEmpCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
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
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
            },
        });
    }

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_save = async function () {
        let updatedData = gvwInfo.getUpdateData(true, 'all');
        let listData = [];

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
                    V_P_YYYYMM : YYYYMitem.data.YYYYMM,
                    V_P_ACCT_YYYYMM : item.data.ACCT_YYYYMM,
                    V_P_SITE_CODE : item.data.SITE_CODE,
                    V_P_EMP_CODE : item.data.EMP_CODE,
                    V_P_TOT_DAY : item.data.TOT_DAY,
                    V_P_WORK_DAY : item.data.WORK_DAY,
                    V_P_PAID_HOLIDAY : item.data.PAID_HOLIDAY,
                    V_P_NONPAID_HOLIDAY : item.data.NONPAID_HOLIDAY,
                    V_P_REAL_WORK_DAY : item.data.REAL_WORK_DAY,
                    V_P_WORK_YEARS : item.data.WORK_YEARS,
                    V_P_ANNUAL_DAY : item.data.ANNUAL_DAY,
                    V_P_ANNUAL_USE_DAY : item.data.ANNUAL_USE_DAY,
                    V_P_ANNUAL_REMAIN_DAY : item.data.ANNUAL_REMAIN_DAY,
                    V_P_CELEBRATE_DAY : item.data.CELEBRATE_DAY,
                    V_P_REPLACE_VACATION_DAY : item.data.REPLACE_VACATION_DAY,
                    V_P_EDU_DAY : item.data.EDU_DAY,
                    V_P_HOLIDAY_WORK_DAY : item.data.HOLIDAY_WORK_DAY,
                    V_P_ABSENCE_DAY : item.data.ABSENCE_DAY,
                    V_P_ADD_DAY : item.data.ADD_DAY,
                    V_P_TOTAL_WORK_TIME : item.data.TOTAL_WORK_TIME,
                    V_P_AFTER_HOURS_TIME1 : item.data.AFTER_HOURS_TIME1,
                    V_P_AFTER_HOURS_TIME2 : item.data.AFTER_HOURS_TIME2,
                    V_P_OVER_TIME : item.data.OVER_TIME,
                    V_P_NIGHT_TIME : item.data.NIGHT_TIME,
                    V_P_HOLIDAY_TIME : item.data.HOLIDAY_TIME,
                    V_P_HOLIDAY_OVER_TIME : item.data.HOLIDAY_OVER_TIME,
                    V_P_LATE_CNT : item.data.LATE_CNT,
                    V_P_LATE_TIME : item.data.LATE_TIME,
                    V_P_EARLY_LEAVE_CNT : item.data.EARLY_LEAVE_CNT,
                    V_P_EARLY_LEAVE_TIME : item.data.EARLY_LEAVE_TIME,
                    V_P_GO_OUT_CNT : item.data.GO_OUT_CNT,
                    V_P_GO_OUT_TIME : item.data.GO_OUT_TIME,
                    V_P_OUTSIDE_CNT : item.data.OUTSIDE_CNT,
                    V_P_OUTSIDE_TIME : item.data.OUTSIDE_TIME,
                    V_P_MONTHLY_DAY : gfn_nvl(item.data.MONTHLY_DAY) == "" ? 0 : parseInt(item.data.MONTHLY_DAY),
                    V_P_MONTHLY_USE_DAY : gfn_nvl(item.data.MONTHLY_USE_DAY) == "" ? 0 : parseInt(item.data.MONTHLY_USE_DAY),
                    V_P_MENSTRUEL_DAY : gfn_nvl(item.data.MENSTRUEL_DAY) == "" ? 0 : parseInt(item.data.MENSTRUEL_DAY),
                    V_P_MENSTRUEL_USE_DAY : gfn_nvl(item.data.MENSTRUEL_USE_DAY) == "" ? 0 : parseInt(item.data.MENSTRUEL_USE_DAY),
                    V_P_NIGHT_DUTY_DAY : gfn_nvl(item.data.NIGHT_DUTY_DAY) == "" ? 0 : parseInt(item.data.NIGHT_DUTY_DAY),
                    V_P_SUNDAY_TIME : gfn_nvl(item.data.SUNDAY_TIME) == "" ? 0 : parseInt(item.data.SUNDAY_TIME),
                    V_P_SUNDAY_OVER_TIME : gfn_nvl(item.data.SUNDAY_OVER_TIME) == "" ? 0 : parseInt(item.data.SUNDAY_OVER_TIME),
                    V_P_OFFICIAL_INJURY_DAY : gfn_nvl(item.data.OFFICIAL_INJURY_DAY) == "" ? 0 : parseInt(item.data.OFFICIAL_INJURY_DAY),
                    V_P_WEEKLY_HOLIDAY_DAY : gfn_nvl(item.data.WEEKLY_HOLIDAY_DAY) == "" ? 0 : parseInt(item.data.WEEKLY_HOLIDAY_DAY),
                    V_P_EXTRA_FIELD1 : gfn_nvl(item.data.EXTRA_FIELD1) == "" ? 0 : parseInt(item.data.EXTRA_FIELD1),
                    V_P_EXTRA_FIELD2 : gfn_nvl(item.data.EXTRA_FIELD2) == "" ? 0 : parseInt(item.data.EXTRA_FIELD2),
                    V_P_EXTRA_FIELD3 : gfn_nvl(item.data.EXTRA_FIELD3) == "" ? 0 : parseInt(item.data.EXTRA_FIELD3),
                    V_P_EXTRA_FIELD4 : gfn_nvl(item.data.EXTRA_FIELD4) == "" ? 0 : parseInt(item.data.EXTRA_FIELD4),
                    V_P_EXTRA_FIELD5 : gfn_nvl(item.data.EXTRA_FIELD5) == "" ? 0 : parseInt(item.data.EXTRA_FIELD5),
                    V_P_EXTRA_FIELD6 : gfn_nvl(item.data.EXTRA_FIELD6) == "" ? 0 : parseInt(item.data.EXTRA_FIELD6),
                    V_P_EXTRA_FIELD7 : gfn_nvl(item.data.EXTRA_FIELD7) == "" ? 0 : parseInt(item.data.EXTRA_FIELD7),
                    V_P_EXTRA_FIELD8 : gfn_nvl(item.data.EXTRA_FIELD8) == "" ? 0 : parseInt(item.data.EXTRA_FIELD8),
                    V_P_EXTRA_FIELD9 : gfn_nvl(item.data.EXTRA_FIELD9) == "" ? 0 : parseInt(item.data.EXTRA_FIELD9),
                    V_P_EXTRA_FIELD10 : gfn_nvl(item.data.EXTRA_FIELD10) == "" ? 0 : parseInt(item.data.EXTRA_FIELD10),
                    V_P_ATTR1_DAY : gfn_nvl(item.data.ATTR1_DAY) == "" ? 0 : parseInt(item.data.ATTR1_DAY),
                    V_P_ATTR2_DAY : gfn_nvl(item.data.ATTR2_DAY) == "" ? 0 : parseInt(item.data.ATTR2_DAY),
                    V_P_ATTR3_DAY : gfn_nvl(item.data.ATTR3_DAY) == "" ? 0 : parseInt(item.data.ATTR3_DAY),
                    V_P_ATTR4_DAY : gfn_nvl(item.data.ATTR4_DAY) == "" ? 0 : parseInt(item.data.ATTR4_DAY),
                    V_P_ATTR5_DAY : gfn_nvl(item.data.ATTR5_DAY) == "" ? 0 : parseInt(item.data.ATTR5_DAY),
                    V_P_ATTR6_DAY : gfn_nvl(item.data.ATTR6_DAY) == "" ? 0 : parseInt(item.data.ATTR6_DAY),
                    V_P_ATTR7_DAY : gfn_nvl(item.data.ATTR7_DAY) == "" ? 0 : parseInt(item.data.ATTR7_DAY),
                    V_P_ATTR8_DAY : gfn_nvl(item.data.ATTR8_DAY) == "" ? 0 : parseInt(item.data.ATTR8_DAY),
                    V_P_ATTR9_DAY : gfn_nvl(item.data.ATTR9_DAY) == "" ? 0 : parseInt(item.data.ATTR9_DAY),
                    V_P_ATTR10_DAY : gfn_nvl(item.data.ATTR10_DAY) == "" ? 0 : parseInt(item.data.ATTR10_DAY),
                    V_P_ATTR1_TIME : gfn_nvl(item.data.ATTR1_TIME) == "" ? 0 : parseInt(item.data.ATTR1_TIME),
                    V_P_ATTR2_TIME : gfn_nvl(item.data.ATTR2_TIME) == "" ? 0 : parseInt(item.data.ATTR2_TIME),
                    V_P_ATTR3_TIME : gfn_nvl(item.data.ATTR3_TIME) == "" ? 0 : parseInt(item.data.ATTR3_TIME),
                    V_P_ATTR4_TIME : gfn_nvl(item.data.ATTR4_TIME) == "" ? 0 : parseInt(item.data.ATTR4_TIME),
                    V_P_ATTR5_TIME : gfn_nvl(item.data.ATTR5_TIME) == "" ? 0 : parseInt(item.data.ATTR5_TIME),
                    V_P_ATTR6_TIME : gfn_nvl(item.data.ATTR6_TIME) == "" ? 0 : parseInt(item.data.ATTR6_TIME),
                    V_P_ATTR7_TIME : gfn_nvl(item.data.ATTR7_TIME) == "" ? 0 : parseInt(item.data.ATTR7_TIME),
                    V_P_ATTR8_TIME : gfn_nvl(item.data.ATTR8_TIME) == "" ? 0 : parseInt(item.data.ATTR8_TIME),
                    V_P_ATTR9_TIME : gfn_nvl(item.data.ATTR9_TIME) == "" ? 0 : parseInt(item.data.ATTR9_TIME),
                    V_P_ATTR10_TIME : gfn_nvl(item.data.ATTR10_TIME) == "" ? 0 : parseInt(item.data.ATTR10_TIME),
                    V_P_EXTRA_FIELD11 : gfn_nvl(item.data.EXTRA_FIELD11) == "" ? 0 : parseInt(item.data.EXTRA_FIELD11),
                    V_P_EXTRA_FIELD12 : gfn_nvl(item.data.EXTRA_FIELD12) == "" ? 0 : parseInt(item.data.EXTRA_FIELD12),
                    V_P_EXTRA_FIELD13 : gfn_nvl(item.data.EXTRA_FIELD13) == "" ? 0 : parseInt(item.data.EXTRA_FIELD13),
                    V_P_EXTRA_FIELD14 : gfn_nvl(item.data.EXTRA_FIELD14) == "" ? 0 : parseInt(item.data.EXTRA_FIELD14),
                    V_P_EXTRA_FIELD15 : gfn_nvl(item.data.EXTRA_FIELD15) == "" ? 0 : parseInt(item.data.EXTRA_FIELD15),
                    V_P_EXTRA_FIELD16 : gfn_nvl(item.data.EXTRA_FIELD16) == "" ? 0 : parseInt(item.data.EXTRA_FIELD16),
                    V_P_EXTRA_FIELD17 : gfn_nvl(item.data.EXTRA_FIELD17) == "" ? 0 : parseInt(item.data.EXTRA_FIELD17),
                    V_P_EXTRA_FIELD18 : gfn_nvl(item.data.EXTRA_FIELD18) == "" ? 0 : parseInt(item.data.EXTRA_FIELD18),
                    V_P_EXTRA_FIELD19 : gfn_nvl(item.data.EXTRA_FIELD19) == "" ? 0 : parseInt(item.data.EXTRA_FIELD19),
                    V_P_EXTRA_FIELD20 : gfn_nvl(item.data.EXTRA_FIELD20) == "" ? 0 : parseInt(item.data.EXTRA_FIELD20),
                    V_P_ATTR11_DAY : gfn_nvl(item.data.ATTR11_DAY) == "" ? 0 : parseInt(item.data.ATTR11_DAY),
                    V_P_ATTR12_DAY : gfn_nvl(item.data.ATTR12_DAY) == "" ? 0 : parseInt(item.data.ATTR12_DAY),
                    V_P_ATTR13_DAY : gfn_nvl(item.data.ATTR13_DAY) == "" ? 0 : parseInt(item.data.ATTR13_DAY),
                    V_P_ATTR14_DAY : gfn_nvl(item.data.ATTR14_DAY) == "" ? 0 : parseInt(item.data.ATTR14_DAY),
                    V_P_ATTR15_DAY : gfn_nvl(item.data.ATTR15_DAY) == "" ? 0 : parseInt(item.data.ATTR15_DAY),
                    V_P_ATTR16_DAY : gfn_nvl(item.data.ATTR16_DAY) == "" ? 0 : parseInt(item.data.ATTR16_DAY),
                    V_P_ATTR17_DAY : gfn_nvl(item.data.ATTR17_DAY) == "" ? 0 : parseInt(item.data.ATTR17_DAY),
                    V_P_ATTR18_DAY : gfn_nvl(item.data.ATTR18_DAY) == "" ? 0 : parseInt(item.data.ATTR18_DAY),
                    V_P_ATTR19_DAY : gfn_nvl(item.data.ATTR19_DAY) == "" ? 0 : parseInt(item.data.ATTR19_DAY),
                    V_P_ATTR20_DAY : gfn_nvl(item.data.ATTR20_DAY) == "" ? 0 : parseInt(item.data.ATTR20_DAY),
                    V_P_ATTR11_TIME : gfn_nvl(item.data.ATTR11_TIME) == "" ? 0 : parseInt(item.data.ATTR11_TIME),
                    V_P_ATTR12_TIME : gfn_nvl(item.data.ATTR12_TIME) == "" ? 0 : parseInt(item.data.ATTR12_TIME),
                    V_P_ATTR13_TIME : gfn_nvl(item.data.ATTR13_TIME) == "" ? 0 : parseInt(item.data.ATTR13_TIME),
                    V_P_ATTR14_TIME : gfn_nvl(item.data.ATTR14_TIME) == "" ? 0 : parseInt(item.data.ATTR14_TIME),
                    V_P_ATTR15_TIME : gfn_nvl(item.data.ATTR15_TIME) == "" ? 0 : parseInt(item.data.ATTR15_TIME),
                    V_P_ATTR16_TIME : gfn_nvl(item.data.ATTR16_TIME) == "" ? 0 : parseInt(item.data.ATTR16_TIME),
                    V_P_ATTR17_TIME : gfn_nvl(item.data.ATTR17_TIME) == "" ? 0 : parseInt(item.data.ATTR17_TIME),
                    V_P_ATTR18_TIME : gfn_nvl(item.data.ATTR18_TIME) == "" ? 0 : parseInt(item.data.ATTR18_TIME),
                    V_P_ATTR19_TIME : gfn_nvl(item.data.ATTR19_TIME) == "" ? 0 : parseInt(item.data.ATTR19_TIME),
                    V_P_ATTR20_TIME : gfn_nvl(item.data.ATTR20_TIME) == "" ? 0 : parseInt(item.data.ATTR20_TIME),
                    V_P_BATCH_EMP_LIST : '',
                    V_P_FORM_ID: p_formId,
                    V_P_MENU_ID: p_menuId,
                    V_P_PROC_ID: '',
                    V_P_USERID: '',
                    V_P_PC: ''
                })
            }
            listData.push(param);
        });

        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt5200List.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    let updatedDetailData = grdDetail.getUpdateData(true, 'all');
                    let detailListData = [];

                    updatedDetailData.forEach((item, index) => {
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
                                V_P_YYYYMM : item.data.YYYYMM,
                                V_P_ACCT_YYYYMM : item.data.ACCT_YYYYMM,
                                V_P_SITE_CODE : item.data.SITE_CODE,
                                V_P_EMP_CODE : item.data.EMP_CODE,
                                V_P_MONTH_TYPE : item.data.MONTH_TYPE,
                                V_P_START_DATE : item.data.START_DATE,
                                V_P_TOT_DAY : item.data.TOT_DAY,
                                V_P_WORK_DAY : item.data.WORK_DAY,
                                V_P_PAID_HOLIDAY : item.data.PAID_HOLIDAY,
                                V_P_NONPAID_HOLIDAY : item.data.NONPAID_HOLIDAY,
                                V_P_REAL_WORK_DAY : item.data.REAL_WORK_DAY,
                                V_P_WORK_YEARS : item.data.WORK_YEARS,
                                V_P_ANNUAL_DAY : item.data.ANNUAL_DAY,
                                V_P_ANNUAL_USE_DAY : item.data.ANNUAL_USE_DAY,
                                V_P_ANNUAL_REMAIN_DAY : item.data.ANNUAL_REMAIN_DAY,
                                V_P_CELEBRATE_DAY : item.data.CELEBRATE_DAY,
                                V_P_REPLACE_VACATION_DAY : item.data.REPLACE_VACATION_DAY,
                                V_P_EDU_DAY : item.data.EDU_DAY,
                                V_P_HOLIDAY_WORK_DAY : item.data.HOLIDAY_WORK_DAY,
                                V_P_ABSENCE_DAY : item.data.ABSENCE_DAY,
                                V_P_ADD_DAY : item.data.ADD_DAY,
                                V_P_TOTAL_WORK_TIME : item.data.TOTAL_WORK_TIME,
                                V_P_AFTER_HOURS_TIME1 : item.data.AFTER_HOURS_TIME1,
                                V_P_AFTER_HOURS_TIME2 : item.data.AFTER_HOURS_TIME2,
                                V_P_OVER_TIME : item.data.OVER_TIME,
                                V_P_NIGHT_TIME : item.data.NIGHT_TIME,
                                V_P_HOLIDAY_TIME : item.data.HOLIDAY_TIME,
                                V_P_HOLIDAY_OVER_TIME : item.data.HOLIDAY_OVER_TIME,
                                V_P_LATE_CNT : item.data.LATE_CNT,
                                V_P_LATE_TIME : item.data.LATE_TIME,
                                V_P_EARLY_LEAVE_CNT : item.data.EARLY_LEAVE_CNT,
                                V_P_EARLY_LEAVE_TIME : item.data.EARLY_LEAVE_TIME,
                                V_P_GO_OUT_CNT : item.data.GO_OUT_CNT,
                                V_P_GO_OUT_TIME : item.data.GO_OUT_TIME,
                                V_P_OUTSIDE_CNT : item.data.OUTSIDE_CNT,
                                V_P_OUTSIDE_TIME : item.data.OUTSIDE_TIME,
                                V_P_MONTHLY_DAY : gfn_nvl(item.data.MONTHLY_DAY) == "" ? 0 : parseInt(item.data.MONTHLY_DAY),
                                V_P_MONTHLY_USE_DAY : gfn_nvl(item.data.MONTHLY_USE_DAY) == "" ? 0 : parseInt(item.data.MONTHLY_USE_DAY),
                                V_P_MENSTRUEL_DAY : gfn_nvl(item.data.MENSTRUEL_DAY) == "" ? 0 : parseInt(item.data.MENSTRUEL_DAY),
                                V_P_MENSTRUEL_USE_DAY : gfn_nvl(item.data.MENSTRUEL_USE_DAY) == "" ? 0 : parseInt(item.data.MENSTRUEL_USE_DAY),
                                V_P_NIGHT_DUTY_DAY : gfn_nvl(item.data.NIGHT_DUTY_DAY) == "" ? 0 : parseInt(item.data.NIGHT_DUTY_DAY),
                                V_P_SUNDAY_TIME : gfn_nvl(item.data.SUNDAY_TIME) == "" ? 0 : parseInt(item.data.SUNDAY_TIME),
                                V_P_SUNDAY_OVER_TIME : gfn_nvl(item.data.SUNDAY_OVER_TIME) == "" ? 0 : parseInt(item.data.SUNDAY_OVER_TIME),
                                V_P_OFFICIAL_INJURY_DAY : gfn_nvl(item.data.OFFICIAL_INJURY_DAY) == "" ? 0 : parseInt(item.data.OFFICIAL_INJURY_DAY),
                                V_P_WEEKLY_HOLIDAY_DAY : gfn_nvl(item.data.WEEKLY_HOLIDAY_DAY) == "" ? 0 : parseInt(item.data.WEEKLY_HOLIDAY_DAY),
                                V_P_EXTRA_FIELD1 : gfn_nvl(item.data.EXTRA_FIELD1) == "" ? 0 : parseInt(item.data.EXTRA_FIELD1),
                                V_P_EXTRA_FIELD2 : gfn_nvl(item.data.EXTRA_FIELD2) == "" ? 0 : parseInt(item.data.EXTRA_FIELD2),
                                V_P_EXTRA_FIELD3 : gfn_nvl(item.data.EXTRA_FIELD3) == "" ? 0 : parseInt(item.data.EXTRA_FIELD3),
                                V_P_EXTRA_FIELD4 : gfn_nvl(item.data.EXTRA_FIELD4) == "" ? 0 : parseInt(item.data.EXTRA_FIELD4),
                                V_P_EXTRA_FIELD5 : gfn_nvl(item.data.EXTRA_FIELD5) == "" ? 0 : parseInt(item.data.EXTRA_FIELD5),
                                V_P_EXTRA_FIELD6 : gfn_nvl(item.data.EXTRA_FIELD6) == "" ? 0 : parseInt(item.data.EXTRA_FIELD6),
                                V_P_EXTRA_FIELD7 : gfn_nvl(item.data.EXTRA_FIELD7) == "" ? 0 : parseInt(item.data.EXTRA_FIELD7),
                                V_P_EXTRA_FIELD8 : gfn_nvl(item.data.EXTRA_FIELD8) == "" ? 0 : parseInt(item.data.EXTRA_FIELD8),
                                V_P_EXTRA_FIELD9 : gfn_nvl(item.data.EXTRA_FIELD9) == "" ? 0 : parseInt(item.data.EXTRA_FIELD9),
                                V_P_EXTRA_FIELD10 : gfn_nvl(item.data.EXTRA_FIELD10) == "" ? 0 : parseInt(item.data.EXTRA_FIELD10),
                                V_P_ATTR1_DAY : gfn_nvl(item.data.ATTR1_DAY) == "" ? 0 : parseInt(item.data.ATTR1_DAY),
                                V_P_ATTR2_DAY : gfn_nvl(item.data.ATTR2_DAY) == "" ? 0 : parseInt(item.data.ATTR2_DAY),
                                V_P_ATTR3_DAY : gfn_nvl(item.data.ATTR3_DAY) == "" ? 0 : parseInt(item.data.ATTR3_DAY),
                                V_P_ATTR4_DAY : gfn_nvl(item.data.ATTR4_DAY) == "" ? 0 : parseInt(item.data.ATTR4_DAY),
                                V_P_ATTR5_DAY : gfn_nvl(item.data.ATTR5_DAY) == "" ? 0 : parseInt(item.data.ATTR5_DAY),
                                V_P_ATTR6_DAY : gfn_nvl(item.data.ATTR6_DAY) == "" ? 0 : parseInt(item.data.ATTR6_DAY),
                                V_P_ATTR7_DAY : gfn_nvl(item.data.ATTR7_DAY) == "" ? 0 : parseInt(item.data.ATTR7_DAY),
                                V_P_ATTR8_DAY : gfn_nvl(item.data.ATTR8_DAY) == "" ? 0 : parseInt(item.data.ATTR8_DAY),
                                V_P_ATTR9_DAY : gfn_nvl(item.data.ATTR9_DAY) == "" ? 0 : parseInt(item.data.ATTR9_DAY),
                                V_P_ATTR10_DAY : gfn_nvl(item.data.ATTR10_DAY) == "" ? 0 : parseInt(item.data.ATTR10_DAY),
                                V_P_ATTR1_TIME : gfn_nvl(item.data.ATTR1_TIME) == "" ? 0 : parseInt(item.data.ATTR1_TIME),
                                V_P_ATTR2_TIME : gfn_nvl(item.data.ATTR2_TIME) == "" ? 0 : parseInt(item.data.ATTR2_TIME),
                                V_P_ATTR3_TIME : gfn_nvl(item.data.ATTR3_TIME) == "" ? 0 : parseInt(item.data.ATTR3_TIME),
                                V_P_ATTR4_TIME : gfn_nvl(item.data.ATTR4_TIME) == "" ? 0 : parseInt(item.data.ATTR4_TIME),
                                V_P_ATTR5_TIME : gfn_nvl(item.data.ATTR5_TIME) == "" ? 0 : parseInt(item.data.ATTR5_TIME),
                                V_P_ATTR6_TIME : gfn_nvl(item.data.ATTR6_TIME) == "" ? 0 : parseInt(item.data.ATTR6_TIME),
                                V_P_ATTR7_TIME : gfn_nvl(item.data.ATTR7_TIME) == "" ? 0 : parseInt(item.data.ATTR7_TIME),
                                V_P_ATTR8_TIME : gfn_nvl(item.data.ATTR8_TIME) == "" ? 0 : parseInt(item.data.ATTR8_TIME),
                                V_P_ATTR9_TIME : gfn_nvl(item.data.ATTR9_TIME) == "" ? 0 : parseInt(item.data.ATTR9_TIME),
                                V_P_ATTR10_TIME : gfn_nvl(item.data.ATTR10_TIME) == "" ? 0 : parseInt(item.data.ATTR10_TIME),
                                V_P_EXTRA_FIELD11 : gfn_nvl(item.data.EXTRA_FIELD11) == "" ? 0 : parseInt(item.data.EXTRA_FIELD11),
                                V_P_EXTRA_FIELD12 : gfn_nvl(item.data.EXTRA_FIELD12) == "" ? 0 : parseInt(item.data.EXTRA_FIELD12),
                                V_P_EXTRA_FIELD13 : gfn_nvl(item.data.EXTRA_FIELD13) == "" ? 0 : parseInt(item.data.EXTRA_FIELD13),
                                V_P_EXTRA_FIELD14 : gfn_nvl(item.data.EXTRA_FIELD14) == "" ? 0 : parseInt(item.data.EXTRA_FIELD14),
                                V_P_EXTRA_FIELD15 : gfn_nvl(item.data.EXTRA_FIELD15) == "" ? 0 : parseInt(item.data.EXTRA_FIELD15),
                                V_P_EXTRA_FIELD16 : gfn_nvl(item.data.EXTRA_FIELD16) == "" ? 0 : parseInt(item.data.EXTRA_FIELD16),
                                V_P_EXTRA_FIELD17 : gfn_nvl(item.data.EXTRA_FIELD17) == "" ? 0 : parseInt(item.data.EXTRA_FIELD17),
                                V_P_EXTRA_FIELD18 : gfn_nvl(item.data.EXTRA_FIELD18) == "" ? 0 : parseInt(item.data.EXTRA_FIELD18),
                                V_P_EXTRA_FIELD19 : gfn_nvl(item.data.EXTRA_FIELD19) == "" ? 0 : parseInt(item.data.EXTRA_FIELD19),
                                V_P_EXTRA_FIELD20 : gfn_nvl(item.data.EXTRA_FIELD20) == "" ? 0 : parseInt(item.data.EXTRA_FIELD20),
                                V_P_ATTR11_DAY : gfn_nvl(item.data.ATTR11_DAY) == "" ? 0 : parseInt(item.data.ATTR11_DAY),
                                V_P_ATTR12_DAY : gfn_nvl(item.data.ATTR12_DAY) == "" ? 0 : parseInt(item.data.ATTR12_DAY),
                                V_P_ATTR13_DAY : gfn_nvl(item.data.ATTR13_DAY) == "" ? 0 : parseInt(item.data.ATTR13_DAY),
                                V_P_ATTR14_DAY : gfn_nvl(item.data.ATTR14_DAY) == "" ? 0 : parseInt(item.data.ATTR14_DAY),
                                V_P_ATTR15_DAY : gfn_nvl(item.data.ATTR15_DAY) == "" ? 0 : parseInt(item.data.ATTR15_DAY),
                                V_P_ATTR16_DAY : gfn_nvl(item.data.ATTR16_DAY) == "" ? 0 : parseInt(item.data.ATTR16_DAY),
                                V_P_ATTR17_DAY : gfn_nvl(item.data.ATTR17_DAY) == "" ? 0 : parseInt(item.data.ATTR17_DAY),
                                V_P_ATTR18_DAY : gfn_nvl(item.data.ATTR18_DAY) == "" ? 0 : parseInt(item.data.ATTR18_DAY),
                                V_P_ATTR19_DAY : gfn_nvl(item.data.ATTR19_DAY) == "" ? 0 : parseInt(item.data.ATTR19_DAY),
                                V_P_ATTR20_DAY : gfn_nvl(item.data.ATTR20_DAY) == "" ? 0 : parseInt(item.data.ATTR20_DAY),
                                V_P_ATTR11_TIME : gfn_nvl(item.data.ATTR11_TIME) == "" ? 0 : parseInt(item.data.ATTR11_TIME),
                                V_P_ATTR12_TIME : gfn_nvl(item.data.ATTR12_TIME) == "" ? 0 : parseInt(item.data.ATTR12_TIME),
                                V_P_ATTR13_TIME : gfn_nvl(item.data.ATTR13_TIME) == "" ? 0 : parseInt(item.data.ATTR13_TIME),
                                V_P_ATTR14_TIME : gfn_nvl(item.data.ATTR14_TIME) == "" ? 0 : parseInt(item.data.ATTR14_TIME),
                                V_P_ATTR15_TIME : gfn_nvl(item.data.ATTR15_TIME) == "" ? 0 : parseInt(item.data.ATTR15_TIME),
                                V_P_ATTR16_TIME : gfn_nvl(item.data.ATTR16_TIME) == "" ? 0 : parseInt(item.data.ATTR16_TIME),
                                V_P_ATTR17_TIME : gfn_nvl(item.data.ATTR17_TIME) == "" ? 0 : parseInt(item.data.ATTR17_TIME),
                                V_P_ATTR18_TIME : gfn_nvl(item.data.ATTR18_TIME) == "" ? 0 : parseInt(item.data.ATTR18_TIME),
                                V_P_ATTR19_TIME : gfn_nvl(item.data.ATTR19_TIME) == "" ? 0 : parseInt(item.data.ATTR19_TIME),
                                V_P_ATTR20_TIME : gfn_nvl(item.data.ATTR20_TIME) == "" ? 0 : parseInt(item.data.ATTR20_TIME),
                                V_P_FORM_ID: p_formId,
                                V_P_MENU_ID: p_menuId,
                                V_P_PROC_ID: '',
                                V_P_USERID: '',
                                V_P_PC: ''
                            })
                        }
                        detailListData.push(param);
                    });

                    if(detailListData.length > 0) {
                        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt2520DetailList.do", {listData: detailListData});

                        const data = await postJsonPromise;

                        try {
                            if (_.isEqual("S", data.resultStatus)) {
                                gfn_comAlert("I0001");
                                fn_search();
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

    const fn_onload = async function () {
        SBUxMethod.set("SRCH_YYYYMM",gfn_dateToYm(new Date()));
        SBUxMethod.set("SRCH_ACCT_YYYYMM",gfn_dateToYm(new Date()));

        await fn_search();
    }

    const fn_search = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_YYYYMM"));
        let ACCT_YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_ACCT_YYYYMM"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMM : YYYYMM,
            V_P_ACCT_YYYYMM : ACCT_YYYYMM,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_EMP_CODE : EMP_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2520List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '5',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                jsonSummaryHistoryList.length = 0;
                listData.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        YYYYMM : item.YYYYMM,
                        ACCT_YYYYMM : item.ACCT_YYYYMM,
                        SITE_CODE : item.SITE_CODE,
                        EMP_CODE : item.EMP_CODE,
                        EMP_NAME : item.EMP_NAME,
                        DEPT_CODE : item.DEPT_CODE,
                        DEPT_NAME : item.DEPT_NAME,
                        POSITION_CODE : item.POSITION_CODE,
                        WORK_SUMMARY_CONFIRM_YN : item.WORK_SUMMARY_CONFIRM_YN,
                        CONFIRM_DATE : item.CONFIRM_DATE,
                        BASE_WORK_TIME : item.BASE_WORK_TIME,
                        TOT_DAY : item.TOT_DAY,
                        WORK_DAY : item.WORK_DAY,
                        PAID_HOLIDAY : item.PAID_HOLIDAY,
                        NONPAID_HOLIDAY : item.NONPAID_HOLIDAY,
                        REAL_WORK_DAY : item.REAL_WORK_DAY,
                        WORK_YEARS : item.WORK_YEARS,
                        ANNUAL_DAY : item.ANNUAL_DAY,
                        ANNUAL_USE_DAY : item.ANNUAL_USE_DAY,
                        ANNUAL_REMAIN_DAY : item.ANNUAL_REMAIN_DAY,
                        CELEBRATE_DAY : item.CELEBRATE_DAY,
                        REPLACE_VACATION_DAY : item.REPLACE_VACATION_DAY,
                        EDU_DAY : item.EDU_DAY,
                        HOLIDAY_WORK_DAY : item.HOLIDAY_WORK_DAY,
                        ABSENCE_DAY : item.ABSENCE_DAY,
                        ADD_DAY : item.ADD_DAY,
                        TOTAL_WORK_TIME : item.TOTAL_WORK_TIME,
                        AFTER_HOURS_TIME1 : item.AFTER_HOURS_TIME1,
                        AFTER_HOURS_TIME2 : item.AFTER_HOURS_TIME2,
                        OVER_TIME : item.OVER_TIME,
                        NIGHT_TIME : item.NIGHT_TIME,
                        HOLIDAY_TIME : item.HOLIDAY_TIME,
                        HOLIDAY_OVER_TIME : item.HOLIDAY_OVER_TIME,
                        TIME_SUM : item.TIME_SUM,
                        LATE_CNT : item.LATE_CNT,
                        LATE_TIME : item.LATE_TIME,
                        EARLY_LEAVE_CNT : item.EARLY_LEAVE_CNT,
                        EARLY_LEAVE_TIME : item.EARLY_LEAVE_TIME,
                        GO_OUT_CNT : item.GO_OUT_CNT,
                        GO_OUT_TIME : item.GO_OUT_TIME,
                        OUTSIDE_CNT : item.OUTSIDE_CNT,
                        OUTSIDE_TIME : item.OUTSIDE_TIME,
                        MONTHLY_DAY : item.MONTHLY_DAY,
                        MONTHLY_USE_DAY : item.MONTHLY_USE_DAY,
                        MENSTRUEL_DAY : item.MENSTRUEL_DAY,
                        MENSTRUEL_USE_DAY : item.MENSTRUEL_USE_DAY,
                        NIGHT_DUTY_DAY : item.NIGHT_DUTY_DAY,
                        SUNDAY_TIME : item.SUNDAY_TIME,
                        SUNDAY_OVER_TIME : item.SUNDAY_OVER_TIME,
                        OFFICIAL_INJURY_DAY : item.OFFICIAL_INJURY_DAY,
                        WEEKLY_HOLIDAY_DAY : item.WEEKLY_HOLIDAY_DAY,
                        EXTRA_FIELD1 : item.EXTRA_FIELD1,
                        EXTRA_FIELD2 : item.EXTRA_FIELD2,
                        EXTRA_FIELD3 : item.EXTRA_FIELD3,
                        EXTRA_FIELD4 : item.EXTRA_FIELD4,
                        EXTRA_FIELD5 : item.EXTRA_FIELD5,
                        EXTRA_FIELD6 : item.EXTRA_FIELD6,
                        EXTRA_FIELD7 : item.EXTRA_FIELD7,
                        EXTRA_FIELD8 : item.EXTRA_FIELD8,
                        EXTRA_FIELD9 : item.EXTRA_FIELD9,
                        EXTRA_FIELD10 : item.EXTRA_FIELD10,
                        ATTR1_DAY : item.ATTR1_DAY,
                        ATTR2_DAY : item.ATTR2_DAY,
                        ATTR3_DAY : item.ATTR3_DAY,
                        ATTR4_DAY : item.ATTR4_DAY,
                        ATTR5_DAY : item.ATTR5_DAY,
                        ATTR6_DAY : item.ATTR6_DAY,
                        ATTR7_DAY : item.ATTR7_DAY,
                        ATTR8_DAY : item.ATTR8_DAY,
                        ATTR9_DAY : item.ATTR9_DAY,
                        ATTR10_DAY : item.ATTR10_DAY,
                        ATTR1_TIME : item.ATTR1_TIME,
                        ATTR2_TIME : item.ATTR2_TIME,
                        ATTR3_TIME : item.ATTR3_TIME,
                        ATTR4_TIME : item.ATTR4_TIME,
                        ATTR5_TIME : item.ATTR5_TIME,
                        ATTR6_TIME : item.ATTR6_TIME,
                        ATTR7_TIME : item.ATTR7_TIME,
                        ATTR8_TIME : item.ATTR8_TIME,
                        ATTR9_TIME : item.ATTR9_TIME,
                        ATTR10_TIME : item.ATTR10_TIME,
                        EXTRA_FIELD11 : item.EXTRA_FIELD11,
                        EXTRA_FIELD12 : item.EXTRA_FIELD12,
                        EXTRA_FIELD13 : item.EXTRA_FIELD13,
                        EXTRA_FIELD14 : item.EXTRA_FIELD14,
                        EXTRA_FIELD15 : item.EXTRA_FIELD15,
                        EXTRA_FIELD16 : item.EXTRA_FIELD16,
                        EXTRA_FIELD17 : item.EXTRA_FIELD17,
                        EXTRA_FIELD18 : item.EXTRA_FIELD18,
                        EXTRA_FIELD19 : item.EXTRA_FIELD19,
                        EXTRA_FIELD20 : item.EXTRA_FIELD20,
                        ATTR11_DAY : item.ATTR11_DAY,
                        ATTR12_DAY : item.ATTR12_DAY,
                        ATTR13_DAY : item.ATTR13_DAY,
                        ATTR14_DAY : item.ATTR14_DAY,
                        ATTR15_DAY : item.ATTR15_DAY,
                        ATTR16_DAY : item.ATTR16_DAY,
                        ATTR17_DAY : item.ATTR17_DAY,
                        ATTR18_DAY : item.ATTR18_DAY,
                        ATTR19_DAY : item.ATTR19_DAY,
                        ATTR20_DAY : item.ATTR20_DAY,
                        ATTR11_TIME : item.ATTR11_TIME,
                        ATTR12_TIME : item.ATTR12_TIME,
                        ATTR13_TIME : item.ATTR13_TIME,
                        ATTR14_TIME : item.ATTR14_TIME,
                        ATTR15_TIME : item.ATTR15_TIME,
                        ATTR16_TIME : item.ATTR16_TIME,
                        ATTR17_TIME : item.ATTR17_TIME,
                        ATTR18_TIME : item.ATTR18_TIME,
                        ATTR19_TIME : item.ATTR19_TIME,
                        ATTR20_TIME : item.ATTR20_TIME,
                        WORK_SUMMARY_START_DATE : item.WORK_SUMMARY_START_DATE,
                        WORK_SUMMARY_END_DATE : item.WORK_SUMMARY_END_DATE,
                        PAY_SUMMARY_START_DATE : item.PAY_SUMMARY_START_DATE,
                        PAY_SUMMARY_END_DATE : item.PAY_SUMMARY_END_DATE,
                        DEPT_CATEGORY : item.DEPT_CATEGORY,
                        SORT_SEQ : item.SORT_SEQ,
                        PARENT_DEPT : item.PARENT_DEPT,
                        POSITION_CODE_SEQ : item.POSITION_CODE_SEQ
                    }
                    jsonSummaryHistoryList.push(msg);
                });

                if(listData.cv_2.length > 0) {
                    let gvwInfoCaptionList = gvwInfo.getCaption('array');

                    listData.cv_2.forEach((item, index) => {
                        let nCol = gvwInfo.getColRef(item.TIME_FIELD_NAME.toUpperCase());

                        if (item.USE_YN == "Y") {
                            gvwInfo.setColHidden(nCol, false, false);
                            gvwInfoCaptionList[nCol] = item.TIME_SUMMARY_NAME;
                        } else {
                            gvwInfo.setColHidden(nCol, true, false);
                        }
                    });

                    let stringGvwInfoCaptionList = "";
                    gvwInfoCaptionList.forEach((item, index) => {
                        stringGvwInfoCaptionList += item + "^";
                    });

                    gvwInfo.setCaption(stringGvwInfoCaptionList.substring(0, stringGvwInfoCaptionList.length-1));

                    listData.cv_2.forEach((item, index) => {
                        let nCol = gvwInfo.getColRef(item.TIME_FIELD_NAME.toUpperCase());

                        if (item.USE_YN == "Y") {
                            gvwInfo.moveColumn(nCol, (item.SORT_SEQ + 6));
                        }
                    });
                }

                let existsYn = gfn_nvl(listData.cv_3[0]["EXISTS_YN"]);

                if(existsYn == "Y") {
                    $("#detailArea").show();
                } else {
                    $("#detailArea").hide();
                }

                gvwInfo.rebuild();
                document.querySelector('#listCount').innerText = jsonSummaryHistoryList.length;
            } else {
                alert(listData.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error(e);
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    const fn_view = async function () {
        var nRow = gvwInfo.getRow();
        if(nRow < 1) return;
        var rowData = gvwInfo.getRowData(nRow);

        // 확정일 경우 수정 불가능
        if (rowData.WORK_SUMMARY_CONFIRM_YN == "Y") {
            fnColumnsEditSet(true);
        } else {
            fnColumnsEditSet(false);
        }

        let YYYYMM = gfn_nvl(rowData.YYYYMM);
        let ACCT_YYYYMM = gfn_nvl(rowData.ACCT_YYYYMM);
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let EMP_CODE = gfn_nvl(rowData.EMP_CODE);
        let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMM : YYYYMM,
            V_P_ACCT_YYYYMM : ACCT_YYYYMM,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_EMP_CODE : EMP_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2520List.do", {
            getType				: 'json',
            workType			: 'Q1',
            cv_count			: '5',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                jsonDetailHistoryList.length = 0;
                listData.cv_4.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        YYYYMM : item.YYYYMM,
                        ACCT_YYYYMM : item.ACCT_YYYYMM,
                        START_DATE : item.START_DATE,
                        END_DATE : item.END_DATE,
                        SITE_CODE : item.SITE_CODE,
                        EMP_CODE : item.EMP_CODE,
                        EMP_NAME : item.EMP_NAME,
                        DEPT_CODE : item.DEPT_CODE,
                        DEPT_NAME : item.DEPT_NAME,
                        GRADE_HOBONG_CODE : item.GRADE_HOBONG_CODE,
                        POSITION_CODE : item.POSITION_CODE,
                        MONTH_TYPE : item.MONTH_TYPE,
                        WORK_SUMMARY_CONFIRM_YN : item.WORK_SUMMARY_CONFIRM_YN,
                        CONFIRM_DATE : item.CONFIRM_DATE,
                        TOT_DAY : item.TOT_DAY,
                        WORK_DAY : item.WORK_DAY,
                        PAID_HOLIDAY : item.PAID_HOLIDAY,
                        NONPAID_HOLIDAY : item.NONPAID_HOLIDAY,
                        REAL_WORK_DAY : item.REAL_WORK_DAY,
                        WORK_YEARS : item.WORK_YEARS,
                        ANNUAL_DAY : item.ANNUAL_DAY,
                        ANNUAL_USE_DAY : item.ANNUAL_USE_DAY,
                        ANNUAL_REMAIN_DAY : item.ANNUAL_REMAIN_DAY,
                        CELEBRATE_DAY : item.CELEBRATE_DAY,
                        REPLACE_VACATION_DAY : item.REPLACE_VACATION_DAY,
                        EDU_DAY : item.EDU_DAY,
                        HOLIDAY_WORK_DAY : item.HOLIDAY_WORK_DAY,
                        ABSENCE_DAY : item.ABSENCE_DAY,
                        ADD_DAY : item.ADD_DAY,
                        TOTAL_WORK_TIME : item.TOTAL_WORK_TIME,
                        AFTER_HOURS_TIME1 : item.AFTER_HOURS_TIME1,
                        AFTER_HOURS_TIME2 : item.AFTER_HOURS_TIME2,
                        OVER_TIME : item.OVER_TIME,
                        NIGHT_TIME : item.NIGHT_TIME,
                        HOLIDAY_TIME : item.HOLIDAY_TIME,
                        HOLIDAY_OVER_TIME : item.HOLIDAY_OVER_TIME,
                        TIME_SUM : item.TIME_SUM,
                        LATE_CNT : item.LATE_CNT,
                        LATE_TIME : item.LATE_TIME,
                        EARLY_LEAVE_CNT : item.EARLY_LEAVE_CNT,
                        EARLY_LEAVE_TIME : item.EARLY_LEAVE_TIME,
                        GO_OUT_CNT : item.GO_OUT_CNT,
                        GO_OUT_TIME : item.GO_OUT_TIME,
                        OUTSIDE_CNT : item.OUTSIDE_CNT,
                        OUTSIDE_TIME : item.OUTSIDE_TIME,
                        MONTHLY_DAY : item.MONTHLY_DAY,
                        MONTHLY_USE_DAY : item.MONTHLY_USE_DAY,
                        MENSTRUEL_DAY : item.MENSTRUEL_DAY,
                        MENSTRUEL_USE_DAY : item.MENSTRUEL_USE_DAY,
                        NIGHT_DUTY_DAY : item.NIGHT_DUTY_DAY,
                        SUNDAY_TIME : item.SUNDAY_TIME,
                        SUNDAY_OVER_TIME : item.SUNDAY_OVER_TIME,
                        OFFICIAL_INJURY_DAY : item.OFFICIAL_INJURY_DAY,
                        WEEKLY_HOLIDAY_DAY : item.WEEKLY_HOLIDAY_DAY,
                        EXTRA_FIELD1 : item.EXTRA_FIELD1,
                        EXTRA_FIELD2 : item.EXTRA_FIELD2,
                        EXTRA_FIELD3 : item.EXTRA_FIELD3,
                        EXTRA_FIELD4 : item.EXTRA_FIELD4,
                        EXTRA_FIELD5 : item.EXTRA_FIELD5,
                        EXTRA_FIELD6 : item.EXTRA_FIELD6,
                        EXTRA_FIELD7 : item.EXTRA_FIELD7,
                        EXTRA_FIELD8 : item.EXTRA_FIELD8,
                        EXTRA_FIELD9 : item.EXTRA_FIELD9,
                        EXTRA_FIELD10 : item.EXTRA_FIELD10,
                        ATTR1_DAY : item.ATTR1_DAY,
                        ATTR2_DAY : item.ATTR2_DAY,
                        ATTR3_DAY : item.ATTR3_DAY,
                        ATTR4_DAY : item.ATTR4_DAY,
                        ATTR5_DAY : item.ATTR5_DAY,
                        ATTR6_DAY : item.ATTR6_DAY,
                        ATTR7_DAY : item.ATTR7_DAY,
                        ATTR8_DAY : item.ATTR8_DAY,
                        ATTR9_DAY : item.ATTR9_DAY,
                        ATTR10_DAY : item.ATTR10_DAY,
                        ATTR1_TIME : item.ATTR1_TIME,
                        ATTR2_TIME : item.ATTR2_TIME,
                        ATTR3_TIME : item.ATTR3_TIME,
                        ATTR4_TIME : item.ATTR4_TIME,
                        ATTR5_TIME : item.ATTR5_TIME,
                        ATTR6_TIME : item.ATTR6_TIME,
                        ATTR7_TIME : item.ATTR7_TIME,
                        ATTR8_TIME : item.ATTR8_TIME,
                        ATTR9_TIME : item.ATTR9_TIME,
                        ATTR10_TIME : item.ATTR10_TIME,
                        EXTRA_FIELD11 : item.EXTRA_FIELD11,
                        EXTRA_FIELD12 : item.EXTRA_FIELD12,
                        EXTRA_FIELD13 : item.EXTRA_FIELD13,
                        EXTRA_FIELD14 : item.EXTRA_FIELD14,
                        EXTRA_FIELD15 : item.EXTRA_FIELD15,
                        EXTRA_FIELD16 : item.EXTRA_FIELD16,
                        EXTRA_FIELD17 : item.EXTRA_FIELD17,
                        EXTRA_FIELD18 : item.EXTRA_FIELD18,
                        EXTRA_FIELD19 : item.EXTRA_FIELD19,
                        EXTRA_FIELD20 : item.EXTRA_FIELD20,
                        ATTR11_DAY : item.ATTR11_DAY,
                        ATTR12_DAY : item.ATTR12_DAY,
                        ATTR13_DAY : item.ATTR13_DAY,
                        ATTR14_DAY : item.ATTR14_DAY,
                        ATTR15_DAY : item.ATTR15_DAY,
                        ATTR16_DAY : item.ATTR16_DAY,
                        ATTR17_DAY : item.ATTR17_DAY,
                        ATTR18_DAY : item.ATTR18_DAY,
                        ATTR19_DAY : item.ATTR19_DAY,
                        ATTR20_DAY : item.ATTR20_DAY,
                        ATTR11_TIME : item.ATTR11_TIME,
                        ATTR12_TIME : item.ATTR12_TIME,
                        ATTR13_TIME : item.ATTR13_TIME,
                        ATTR14_TIME : item.ATTR14_TIME,
                        ATTR15_TIME : item.ATTR15_TIME,
                        ATTR16_TIME : item.ATTR16_TIME,
                        ATTR17_TIME : item.ATTR17_TIME,
                        ATTR18_TIME : item.ATTR18_TIME,
                        ATTR19_TIME : item.ATTR19_TIME,
                        ATTR20_TIME : item.ATTR20_TIME,
                        WORK_SUMMARY_START_DATE : item.WORK_SUMMARY_START_DATE,
                        WORK_SUMMARY_END_DATE : item.WORK_SUMMARY_END_DATE,
                        DEPT_CATEGORY : item.DEPT_CATEGORY,
                        SORT_SEQ : item.SORT_SEQ,
                        PARENT_DEPT : item.PARENT_DEPT,
                        POSITION_CODE_SEQ : item.POSITION_CODE_SEQ

                    }
                    jsonDetailHistoryList.push(msg);
                });

                if(listData.cv_5.length > 0) {
                    let grdDetailCaptionList = grdDetail.getCaption('array');

                    listData.cv_5.forEach((item, index) => {
                        let nCol = grdDetail.getColRef(item.TIME_FIELD_NAME.toUpperCase());

                        if (item.USE_YN == "Y") {
                            grdDetail.setColHidden(nCol, false, false);
                            grdDetailCaptionList[nCol] = item.TIME_SUMMARY_NAME;
                        } else {
                            grdDetail.setColHidden(nCol, true, false);
                        }
                    });

                    let stringGrdDetailCaptionList = "";
                    grdDetailCaptionList.forEach((item, index) => {
                        stringGrdDetailCaptionList += item + "^";
                    });

                    grdDetail.setCaption(stringGrdDetailCaptionList.substring(0, stringGrdDetailCaptionList.length-1));
                }

                grdDetail.rebuild();
            } else {
                alert(listData.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fnColumnsEditSet = async function (bState) {
        gvwInfo.setColDisabled(gvwInfo.getColRef("TOT_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("WORK_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("PAID_HOLIDAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("NONPAID_HOLIDAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("REAL_WORK_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("BASE_WORK_TIME"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("WORK_YEARS"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("CELEBRATE_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("REPLACE_VACATION_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("EDU_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("HOLIDAY_WORK_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("ABSENCE_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("ADD_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("TOTAL_WORK_TIME"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("AFTER_HOURS_TIME1"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("AFTER_HOURS_TIME2"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("OVER_TIME"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("NIGHT_TIME"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("HOLIDAY_TIME"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("HOLIDAY_OVER_TIME"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("LATE_CNT"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("LATE_TIME"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("EARLY_LEAVE_CNT"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("EARLY_LEAVE_TIME"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("GO_OUT_CNT"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("GO_OUT_TIME"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("OUTSIDE_CNT"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("OUTSIDE_TIME"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("MONTHLY_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("MENSTRUEL_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("MENSTRUEL_USE_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("NIGHT_DUTY_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("SUNDAY_TIME"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("SUNDAY_OVER_TIME"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("OFFICIAL_INJURY_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("WEEKLY_HOLIDAY_DAY"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("EXTRA_FIELD1"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("EXTRA_FIELD2"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("EXTRA_FIELD3"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("EXTRA_FIELD4"), bState);;
        gvwInfo.setColDisabled(gvwInfo.getColRef("EXTRA_FIELD5"), bState);;
    }

    const fn_confirm = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let grdRows = gvwInfo.getCheckedRows(gvwInfo.getColRef("CHK_YN"), true);
        let YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_YYYYMM"));
        let strbatch_emp_list = "";

        grdRows.forEach((item, index) => {
            strbatch_emp_list += gvwInfo.getRowData(item).EMP_CODE + "|";
        });

        if (strbatch_emp_list.length > 0) {
            strbatch_emp_list = strbatch_emp_list.substring(0, strbatch_emp_list.length - 1);
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMM : YYYYMM,
            V_P_ACCT_YYYYMM : '',
            V_P_SITE_CODE : '',
            V_P_EMP_CODE : '',
            V_P_TOT_DAY : 0,
            V_P_WORK_DAY : 0,
            V_P_PAID_HOLIDAY : 0,
            V_P_NONPAID_HOLIDAY : 0,
            V_P_REAL_WORK_DAY : 0,
            V_P_WORK_YEARS : 0,
            V_P_ANNUAL_DAY : 0,
            V_P_ANNUAL_USE_DAY : 0,
            V_P_ANNUAL_REMAIN_DAY : 0,
            V_P_CELEBRATE_DAY : 0,
            V_P_REPLACE_VACATION_DAY : 0,
            V_P_EDU_DAY : 0,
            V_P_HOLIDAY_WORK_DAY : 0,
            V_P_ABSENCE_DAY : 0,
            V_P_ADD_DAY : 0,
            V_P_TOTAL_WORK_TIME : 0,
            V_P_AFTER_HOURS_TIME1 : 0,
            V_P_AFTER_HOURS_TIME2 : 0,
            V_P_OVER_TIME : 0,
            V_P_NIGHT_TIME : 0,
            V_P_HOLIDAY_TIME : 0,
            V_P_HOLIDAY_OVER_TIME : 0,
            V_P_LATE_CNT : 0,
            V_P_LATE_TIME : 0,
            V_P_EARLY_LEAVE_CNT : 0,
            V_P_EARLY_LEAVE_TIME : 0,
            V_P_GO_OUT_CNT : 0,
            V_P_GO_OUT_TIME : 0,
            V_P_OUTSIDE_CNT : 0,
            V_P_OUTSIDE_TIME : 0,
            V_P_MONTHLY_DAY : 0,
            V_P_MONTHLY_USE_DAY : 0,
            V_P_MENSTRUEL_DAY : 0,
            V_P_MENSTRUEL_USE_DAY : 0,
            V_P_NIGHT_DUTY_DAY : 0,
            V_P_SUNDAY_TIME : 0,
            V_P_SUNDAY_OVER_TIME : 0,
            V_P_OFFICIAL_INJURY_DAY : 0,
            V_P_WEEKLY_HOLIDAY_DAY : 0,
            V_P_EXTRA_FIELD1 : 0,
            V_P_EXTRA_FIELD2 : 0,
            V_P_EXTRA_FIELD3 : 0,
            V_P_EXTRA_FIELD4 : 0,
            V_P_EXTRA_FIELD5 : 0,
            V_P_EXTRA_FIELD6 : 0,
            V_P_EXTRA_FIELD7 : 0,
            V_P_EXTRA_FIELD8 : 0,
            V_P_EXTRA_FIELD9 : 0,
            V_P_EXTRA_FIELD10 : 0,
            V_P_ATTR1_DAY : 0,
            V_P_ATTR2_DAY : 0,
            V_P_ATTR3_DAY : 0,
            V_P_ATTR4_DAY : 0,
            V_P_ATTR5_DAY : 0,
            V_P_ATTR6_DAY : 0,
            V_P_ATTR7_DAY : 0,
            V_P_ATTR8_DAY : 0,
            V_P_ATTR9_DAY : 0,
            V_P_ATTR10_DAY : 0,
            V_P_ATTR1_TIME : 0,
            V_P_ATTR2_TIME : 0,
            V_P_ATTR3_TIME : 0,
            V_P_ATTR4_TIME : 0,
            V_P_ATTR5_TIME : 0,
            V_P_ATTR6_TIME : 0,
            V_P_ATTR7_TIME : 0,
            V_P_ATTR8_TIME : 0,
            V_P_ATTR9_TIME : 0,
            V_P_ATTR10_TIME : 0,
            V_P_EXTRA_FIELD11 : 0,
            V_P_EXTRA_FIELD12 : 0,
            V_P_EXTRA_FIELD13 : 0,
            V_P_EXTRA_FIELD14 : 0,
            V_P_EXTRA_FIELD15 : 0,
            V_P_EXTRA_FIELD16 : 0,
            V_P_EXTRA_FIELD17 : 0,
            V_P_EXTRA_FIELD18 : 0,
            V_P_EXTRA_FIELD19 : 0,
            V_P_EXTRA_FIELD20 : 0,
            V_P_ATTR11_DAY : 0,
            V_P_ATTR12_DAY : 0,
            V_P_ATTR13_DAY : 0,
            V_P_ATTR14_DAY : 0,
            V_P_ATTR15_DAY : 0,
            V_P_ATTR16_DAY : 0,
            V_P_ATTR17_DAY : 0,
            V_P_ATTR18_DAY : 0,
            V_P_ATTR19_DAY : 0,
            V_P_ATTR20_DAY : 0,
            V_P_ATTR11_TIME : 0,
            V_P_ATTR12_TIME : 0,
            V_P_ATTR13_TIME : 0,
            V_P_ATTR14_TIME : 0,
            V_P_ATTR15_TIME : 0,
            V_P_ATTR16_TIME : 0,
            V_P_ATTR17_TIME : 0,
            V_P_ATTR18_TIME : 0,
            V_P_ATTR19_TIME : 0,
            V_P_ATTR20_TIME : 0,
            V_P_BATCH_EMP_LIST : strbatch_emp_list,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/insertHrt2520.do", {
            getType				: 'json',
            workType			: 'CONFIRM',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                gfn_comAlert("I0001");
                fn_search();
            } else {
                alert(listData.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_cancel = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let grdRows = gvwInfo.getCheckedRows(gvwInfo.getColRef("CHK_YN"), true);
        let YYYYMM = gfn_nvl(SBUxMethod.get("SRCH_YYYYMM"));
        let strbatch_emp_list = "";

        grdRows.forEach((item, index) => {
            strbatch_emp_list += gvwInfo.getRowData(item).EMP_CODE + "|";
        });

        if (strbatch_emp_list.length > 0) {
            strbatch_emp_list = strbatch_emp_list.substring(0, strbatch_emp_list.length - 1);
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMM : YYYYMM,
            V_P_ACCT_YYYYMM : '',
            V_P_SITE_CODE : '',
            V_P_EMP_CODE : '',
            V_P_TOT_DAY : 0,
            V_P_WORK_DAY : 0,
            V_P_PAID_HOLIDAY : 0,
            V_P_NONPAID_HOLIDAY : 0,
            V_P_REAL_WORK_DAY : 0,
            V_P_WORK_YEARS : 0,
            V_P_ANNUAL_DAY : 0,
            V_P_ANNUAL_USE_DAY : 0,
            V_P_ANNUAL_REMAIN_DAY : 0,
            V_P_CELEBRATE_DAY : 0,
            V_P_REPLACE_VACATION_DAY : 0,
            V_P_EDU_DAY : 0,
            V_P_HOLIDAY_WORK_DAY : 0,
            V_P_ABSENCE_DAY : 0,
            V_P_ADD_DAY : 0,
            V_P_TOTAL_WORK_TIME : 0,
            V_P_AFTER_HOURS_TIME1 : 0,
            V_P_AFTER_HOURS_TIME2 : 0,
            V_P_OVER_TIME : 0,
            V_P_NIGHT_TIME : 0,
            V_P_HOLIDAY_TIME : 0,
            V_P_HOLIDAY_OVER_TIME : 0,
            V_P_LATE_CNT : 0,
            V_P_LATE_TIME : 0,
            V_P_EARLY_LEAVE_CNT : 0,
            V_P_EARLY_LEAVE_TIME : 0,
            V_P_GO_OUT_CNT : 0,
            V_P_GO_OUT_TIME : 0,
            V_P_OUTSIDE_CNT : 0,
            V_P_OUTSIDE_TIME : 0,
            V_P_MONTHLY_DAY : 0,
            V_P_MONTHLY_USE_DAY : 0,
            V_P_MENSTRUEL_DAY : 0,
            V_P_MENSTRUEL_USE_DAY : 0,
            V_P_NIGHT_DUTY_DAY : 0,
            V_P_SUNDAY_TIME : 0,
            V_P_SUNDAY_OVER_TIME : 0,
            V_P_OFFICIAL_INJURY_DAY : 0,
            V_P_WEEKLY_HOLIDAY_DAY : 0,
            V_P_EXTRA_FIELD1 : 0,
            V_P_EXTRA_FIELD2 : 0,
            V_P_EXTRA_FIELD3 : 0,
            V_P_EXTRA_FIELD4 : 0,
            V_P_EXTRA_FIELD5 : 0,
            V_P_EXTRA_FIELD6 : 0,
            V_P_EXTRA_FIELD7 : 0,
            V_P_EXTRA_FIELD8 : 0,
            V_P_EXTRA_FIELD9 : 0,
            V_P_EXTRA_FIELD10 : 0,
            V_P_ATTR1_DAY : 0,
            V_P_ATTR2_DAY : 0,
            V_P_ATTR3_DAY : 0,
            V_P_ATTR4_DAY : 0,
            V_P_ATTR5_DAY : 0,
            V_P_ATTR6_DAY : 0,
            V_P_ATTR7_DAY : 0,
            V_P_ATTR8_DAY : 0,
            V_P_ATTR9_DAY : 0,
            V_P_ATTR10_DAY : 0,
            V_P_ATTR1_TIME : 0,
            V_P_ATTR2_TIME : 0,
            V_P_ATTR3_TIME : 0,
            V_P_ATTR4_TIME : 0,
            V_P_ATTR5_TIME : 0,
            V_P_ATTR6_TIME : 0,
            V_P_ATTR7_TIME : 0,
            V_P_ATTR8_TIME : 0,
            V_P_ATTR9_TIME : 0,
            V_P_ATTR10_TIME : 0,
            V_P_EXTRA_FIELD11 : 0,
            V_P_EXTRA_FIELD12 : 0,
            V_P_EXTRA_FIELD13 : 0,
            V_P_EXTRA_FIELD14 : 0,
            V_P_EXTRA_FIELD15 : 0,
            V_P_EXTRA_FIELD16 : 0,
            V_P_EXTRA_FIELD17 : 0,
            V_P_EXTRA_FIELD18 : 0,
            V_P_EXTRA_FIELD19 : 0,
            V_P_EXTRA_FIELD20 : 0,
            V_P_ATTR11_DAY : 0,
            V_P_ATTR12_DAY : 0,
            V_P_ATTR13_DAY : 0,
            V_P_ATTR14_DAY : 0,
            V_P_ATTR15_DAY : 0,
            V_P_ATTR16_DAY : 0,
            V_P_ATTR17_DAY : 0,
            V_P_ATTR18_DAY : 0,
            V_P_ATTR19_DAY : 0,
            V_P_ATTR20_DAY : 0,
            V_P_ATTR11_TIME : 0,
            V_P_ATTR12_TIME : 0,
            V_P_ATTR13_TIME : 0,
            V_P_ATTR14_TIME : 0,
            V_P_ATTR15_TIME : 0,
            V_P_ATTR16_TIME : 0,
            V_P_ATTR17_TIME : 0,
            V_P_ATTR18_TIME : 0,
            V_P_ATTR19_TIME : 0,
            V_P_ATTR20_TIME : 0,
            V_P_BATCH_EMP_LIST : strbatch_emp_list,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/insertHrt2520.do", {
            getType				: 'json',
            workType			: 'CANCEL',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                gfn_comAlert("I0001");
                fn_search();
            } else {
                alert(listData.resultMessage);
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