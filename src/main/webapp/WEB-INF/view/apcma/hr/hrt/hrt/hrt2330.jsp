<%
    /**
     * @Class Name 		: hrt2330.jsp
     * @Description 	: 일근태조회 화면
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
    <title>title : 일근태조회</title>
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
                    <th scope="row" class="th_bg_search">재직구분</th>
                    <td colspan="3" class="td_input">
                        <sbux-select id="SRCH_EMP_STATE" uitype="single" jsondata-ref="jsonEmpState" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">년월</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_PERIOD_YYYYMM"
                                name="SRCH_PERIOD_YYYYMM"
                                date-format="yyyy-mm"
                                datepicker-mode="month"
                                class="form-control pull-right sbux-pik-group-apc input-sm input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                onchange="fn_changePeriodYyyymm(SRCH_PERIOD_YYYYMM)"
                        />
                    </td>
                    <td colspan="3"></td>
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
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">직군</th>
                    <td colspan="3" class="td_input">
                        <sbux-select id="SRCH_JOB_GROUP" uitype="single" jsondata-ref="jsonJobGroup" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg_search">근태일</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YYYYMMDD_FR"
                                name="SRCH_YYYYMMDD_FR"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <span> ~ </span>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YYYYMMDD_TO"
                                name="SRCH_YYYYMMDD_TO"
                                date-format="yyyy-mm-dd"
                                class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast table-datepicker-ma"
                                style="width:100%;"
                                group-id="panHeader"
                                required
                        />
                    </td>
                    <td></td>
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
                    <td colspan="5">
                        <div style="margin-left: 100px; display: grid; grid-auto-flow: column;">
                            <span style="background-color: #DEB887; width: 70px; height: 25px; margin-left: 10px; text-align: center;">미작성</span>
                            <span style="background-color: #FFB6C1; width: 70px; height: 25px; margin-left: 10px; text-align: center;">미확정</span>
                            <span style="background-color: #D3D3D3; width: 70px; height: 25px; margin-left: 10px; text-align: center;">미승인</span>
                            <span style="background-color: #ADD8E6; width: 70px; height: 25px; margin-left: 10px; text-align: center;">승인중</span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>사원리스트</span>
                                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwShift" style="height:580px;"></div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>사원별 일근태 실적</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwDetail" style="height:580px;"></div>
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

    var jsonSiteCode = []; // 사업장
    var jsonEmpState = []; // 재직구분
    var jsonJobGroup = []; // 직군
    var jsonPositionCode = []; // 직위
    var jsonShiftCode = []; // 교대조
    var jsonWorkPatternCode = []; // 근무패턴
    var jsonHolidayYn = []; // 휴일여부
    var jsonWorkDayType = []; // 근무일 구분
    var jsonTimeCategory = []; // 구분
    var jsonTimeItemCode = []; // 근태항목
    var jsonStartEndDayType = []; // 시작/종료구분
    var jsonStatusCode = []; // 상태

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['gvwDetail'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
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
            // 재직구분
            gfnma_setComSelect(['SRCH_EMP_STATE', 'gvwShift'], jsonEmpState, 'L_HRI009', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직군
            gfnma_setComSelect(['SRCH_JOB_GROUP'], jsonJobGroup, 'L_HRI047', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 직위
            gfnma_setComSelect(['gvwShift', 'gvwDetail'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 교대조
            gfnma_setComSelect(['gvwShift'], jsonShiftCode, 'L_HRT_SHIFTCODE', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SHIFT_CODE', 'SHIFT_NAME', 'Y', ''),
            // 근무패턴
            gfnma_setComSelect(['gvwShift'], jsonWorkPatternCode, 'L_HRT020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 휴일여부
            gfnma_setComSelect(['gvwDetail'], jsonHolidayYn, 'L_HRT015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근무일구분
            gfnma_setComSelect(['gvwDetail'], jsonWorkDayType, 'L_HRT019', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 구분
            gfnma_setComSelect(['gvwDetail'], jsonTimeCategory, 'L_HRT024_05', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 근태항목
            gfnma_setComSelect(['gvwDetail'], jsonTimeItemCode, 'L_HRT004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'TIME_ITEM_CODE', 'TIME_ITEM_NAME', 'Y', ''),
            // 시작/종료일자유형
            gfnma_setComSelect(['gvwDetail'], jsonStartEndDayType, 'L_HRT011', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 상태
            gfnma_setComSelect(['gvwDetail'], jsonStatusCode, 'L_FIG002', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    function fn_createGvwShiftGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwShift';
        SBGridProperties.id 				= 'gvwShift';
        SBGridProperties.jsonref 			= 'jsonEmpList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'85px',  style:'text-align:left', hidden: true},
            {caption: ["부서명"],         ref: 'DEPT_NAME',    type:'output',  	width:'85px',  style:'text-align:left'},
            {caption: ["직위"], 		ref: 'POSITION_CODE',   	    type:'combo', style:'text-align:left' ,width: '82px',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["사번"],         ref: 'EMP_CODE',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["이름"],         ref: 'EMP_NAME',    type:'output',  	width:'92px',  style:'text-align:left'},
            {caption: ["입사일"],       ref: 'ENTER_DATE', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["작성일수"],         ref: 'CREATE_CNT',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["확정일수"],         ref: 'CONFIRM_CNT',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["승인일수"],         ref: 'APPR_CNT',    type:'output',  	width:'75px',  style:'text-align:right', hidden: true},
            {caption: ["퇴사일"],       ref: 'RETIRE_DATE', 		type:'inputdate',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["재직상태"], 		ref: 'EMP_STATE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonEmpState',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["교대조"], 		ref: 'SHIFT_CODE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonShiftCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["근무패턴"], 		ref: 'WORK_PATTERN_CODE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonWorkPatternCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["근태관리"],         ref: 'WORK_TIME_YN',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwShift = _SBGrid.create(SBGridProperties);
        gvwShift.bind('click', 'fn_view');
        gvwShift.bind('keyup', 'fn_keyup');
    }

    function fn_createGvwDetailGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDetail';
        SBGridProperties.id 				= 'gvwDetail';
        SBGridProperties.jsonref 			= 'jsonDayShiftList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.frozencols = 7;
        SBGridProperties.allowcopy = true; //복사
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
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: [""],			    ref: 'CHK_YN', 			        type:'checkbox',  	width:'45px',  	style:'text-align:center', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}},
            {caption: ["일자"],       ref: 'YYYYMMDD', 		type:'inputdate',  	width:'101px',  	style:'text-align:left',
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
            {caption: ["확정"], 		ref: 'WORK_SUMMARY_CONFIRM_YN',   	    type:'combo', style:'text-align:left' ,width: '50px', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
            {caption: ["확정일자"],       ref: 'CONFIRM_DATE', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["소급월"],       ref: 'ACCT_YYYYMMDD', 		type:'inputdate',  	width:'75px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["사번"],         ref: 'EMP_CODE',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["이름"],         ref: 'EMP_NAME',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["부서코드"],         ref: 'DEPT_CODE',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["부서"],         ref: 'DEPT_NAME',    type:'output',  	width:'120px',  style:'text-align:left', hidden: true},
            {caption: ["직위"], 		ref: 'POSITION_CODE',   	    type:'combo', style:'text-align:left' ,width: '80px',
                typeinfo: {
                    ref			: 'jsonPositionCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["근속년수"],         ref: 'WORK_YEARS',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["총일수"],         ref: 'TOT_DAY',    type:'output',  	width:'70px',  style:'text-align:left'},
            {caption: ["근무일수"],         ref: 'WORK_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["유급휴일"],         ref: 'PAID_HOLIDAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["무급휴일"],         ref: 'NONPAID_HOLIDAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["실근무일수"],         ref: 'REAL_WORK_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["OT시간(합계)"],         ref: 'TIME_SUM',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["연차발생"],         ref: 'ANNUAL_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["향군근무"],         ref: 'EXTRA_FIELD1',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["연차사용"],         ref: 'ANNUAL_USE_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["잔여연차"],         ref: 'ANNUAL_REMAIN_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["대체휴가"],         ref: 'REPLACE_VACATION_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["교육일수"],         ref: 'EDU_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["휴일근무일수"],         ref: 'HOLIDAY_WORK_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["결근일수"],         ref: 'ABSENCE_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["추가일수"],         ref: 'ADD_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["공상일수"],         ref: 'OFFICIAL_INJURY_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["여유컬럼3"],         ref: 'EXTRA_FIELD3',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["야간시간"],         ref: 'NIGHT_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["정상시간"],         ref: 'TOTAL_WORK_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["연장시간"],         ref: 'OVER_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["휴일시간"],         ref: 'HOLIDAY_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["휴일연장시간"],         ref: 'HOLIDAY_OVER_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["유휴근로"],         ref: 'ATTR3_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["유휴연장"],         ref: 'ATTR4_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["참조시간6"],         ref: 'ATTR6_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["참조시간7"],         ref: 'ATTR7_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["향군(연장)"],         ref: 'ATTR1_TIME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["교육(연장)"],         ref: 'ATTR2_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["지각횟수"],         ref: 'LATE_CNT',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["지각시간"],         ref: 'LATE_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["조퇴횟수"],         ref: 'EARLY_LEAVE_CNT',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["조퇴시간"],         ref: 'EARLY_LEAVE_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["외출횟수"],         ref: 'GO_OUT_CNT',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["외출시간"],         ref: 'GO_OUT_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["외근횟수"],         ref: 'OUTSIDE_CNT',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["외근시간"],         ref: 'OUTSIDE_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["청원휴가사용"],         ref: 'EXTRA_FIELD2',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["여유컬럼4"],         ref: 'EXTRA_FIELD4',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["여유컬럼5"],         ref: 'EXTRA_FIELD5',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["참조일수10"],         ref: 'ATTR10_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["여유컬럼6"],         ref: 'EXTRA_FIELD6',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["여유컬럼7"],         ref: 'EXTRA_FIELD7',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["여유컬럼8"],         ref: 'EXTRA_FIELD8',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["여유컬럼9"],         ref: 'EXTRA_FIELD9',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["여유컬럼10"],         ref: 'EXTRA_FIELD10',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["참조시간5"],         ref: 'ATTR5_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["참조시간8"],         ref: 'ATTR8_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["참조시간9"],         ref: 'ATTR9_TIME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["참조일수1"],         ref: 'ATTR1_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["참조일수2"],         ref: 'ATTR2_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["참조일수4"],         ref: 'ATTR4_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["참조일수6"],         ref: 'ATTR6_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["참조일수7"],         ref: 'ATTR7_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["여유필드11"],         ref: 'EXTRA_FIELD11',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["여유필드12"],         ref: 'EXTRA_FIELD12',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["여유필드13"],         ref: 'EXTRA_FIELD13',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["여유필드14"],         ref: 'EXTRA_FIELD14',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["여유필드15"],         ref: 'EXTRA_FIELD15',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["여유필드16"],         ref: 'EXTRA_FIELD16',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["여유필드17"],         ref: 'EXTRA_FIELD17',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["여유필드18"],         ref: 'EXTRA_FIELD18',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["여유필드19"],         ref: 'EXTRA_FIELD19',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["참조일수11"],         ref: 'ATTR11_DAY',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["참조일수12"],         ref: 'ATTR12_DAY',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["참조일수13"],         ref: 'ATTR13_DAY',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["참조일수14"],         ref: 'ATTR14_DAY',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["참조일수15"],         ref: 'ATTR15_DAY',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["참조시간11"],         ref: 'ATTR11_TIME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["참조시간12"],         ref: 'ATTR12_TIME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["참조시간13"],         ref: 'ATTR13_TIME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["참조시간14"],         ref: 'ATTR14_TIME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["참조시간15"],         ref: 'ATTR15_TIME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["참조시간16"],         ref: 'ATTR16_TIME',    type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["참조일수8"],         ref: 'ATTR8_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["참조일수9"],         ref: 'ATTR9_DAY',    type:'output',  	width:'80px',  style:'text-align:left'},

            {caption: ["경조휴가"],         ref: 'CELEBRATE_DAY',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["시간외A시간"],         ref: 'AFTER_HOURS_TIME1',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["시간외B시간"],         ref: 'AFTER_HOURS_TIME2',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["월차발생"],         ref: 'MONTHLY_DAY',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["월차사용"],         ref: 'MONTHLY_USE_DAY',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["생휴발생"],         ref: 'MENSTRUEL_DAY',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["생휴사용"],         ref: 'MENSTRUEL_USE_DAY',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["당직일수"],         ref: 'NIGHT_DUTY_DAY',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["일요일시간"],         ref: 'SUNDAY_TIME',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["일요일연장시간"],         ref: 'SUNDAY_OVER_TIME',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true},
            {caption: ["주휴일수"],         ref: 'WEEKLY_HOLIDAY_DAY',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["참조시간10"],         ref: 'ATTR10_TIME',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["명절근로"],         ref: 'ATTR3_DAY',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["명절연장"],         ref: 'ATTR5_DAY',    type:'output',  	width:'80px',  style:'text-align:left', hidden: true},
            {caption: ["여유필드20"],         ref: 'EXTRA_FIELD20',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["참조일수16"],         ref: 'ATTR16_DAY',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["참조일수17"],         ref: 'ATTR17_DAY',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["참조일수18"],         ref: 'ATTR18_DAY',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["참조일수19"],         ref: 'ATTR19_DAY',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["참조일수20"],         ref: 'ATTR20_DAY',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["참조시간17"],         ref: 'ATTR17_TIME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["참조시간18"],         ref: 'ATTR18_TIME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["참조시간19"],         ref: 'ATTR19_TIME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["참조시간20"],         ref: 'ATTR20_TIME',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
        ];

        gvwDetail = _SBGrid.create(SBGridProperties);
    }

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    const fn_view = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        var nRow = gvwShift.getRow();
        if(nRow < 1) return;
        var rowData = gvwShift.getRowData(nRow);

        let YYYYMMDD_FR = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_FR"));
        let YYYYMMDD_TO = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_TO"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(rowData.DEPT_CODE);
        let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let EMP_CODE = gfn_nvl(rowData.EMP_CODE);
        let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMMDD_FR : YYYYMMDD_FR,
            V_P_YYYYMMDD_TO : YYYYMMDD_TO,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_STATE : EMP_STATE,
            V_P_LOGIN_DEPT_CODE : '',
            V_P_HR_MANAGER_YN : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2330List.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '4',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                jsonDayShiftList.length = 0;
                listData.cv_2.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        TXN_ID : item.TXN_ID,
                        SEQ_NO : item.SEQ_NO,
                        STATUS_CODE : item.STATUS_CODE,
                        APPROVE_DATE : item.APPROVE_DATE,
                        SITE_CODE : item.SITE_CODE,
                        DEPT_CODE : item.DEPT_CODE,
                        DEPT_NAME : item.DEPT_NAME,
                        WORK_PATTERN_CODE : item.WORK_PATTERN_CODE,
                        SHIFT_CODE : item.SHIFT_CODE,
                        POSITION_CODE : item.POSITION_CODE,
                        EMP_CODE : item.EMP_CODE,
                        EMP_NAME : item.EMP_NAME,
                        HOLIDAY_YN : item.HOLIDAY_YN,
                        HOLIDAY2_YN : item.HOLIDAY2_YN,
                        WORK_DAY_TYPE : item.WORK_DAY_TYPE,
                        WORK_TIMES : item.WORK_TIMES,
                        TIME_CATEGORY : item.TIME_CATEGORY,
                        TIME_ITEM_CODE : item.TIME_ITEM_CODE,
                        TIME_ITEM_NAME : item.TIME_ITEM_NAME,
                        TIME_ITEM_CODE_ORIG : item.TIME_ITEM_CODE_ORIG,
                        BASE_YYYYMMDD : item.BASE_YYYYMMDD,
                        WORK_YYYYMMDD : item.WORK_YYYYMMDD,
                        START_DAY_TYPE : item.START_DAY_TYPE,
                        TIME_START_HHMM : item.TIME_START_HHMM,
                        END_DAY_TYPE : item.END_DAY_TYPE,
                        TIME_END_HHMM : item.TIME_END_HHMM,
                        TIME_HOURS : item.TIME_HOURS,
                        MEMO : item.MEMO,
                        CAUSE : item.CAUSE,
                        POSITION_CODE_SEQ : item.POSITION_CODE_SEQ,
                        CONFIRM_YN : item.CONFIRM_YN,
                        CONFIRM_TIME : item.CONFIRM_TIME,
                        ACCRUAL_FLAG : item.ACCRUAL_FLAG,
                        ACCT_YYYYMMDD : item.ACCT_YYYYMMDD,
                        SOURCE_TYPE : item.SOURCE_TYPE,
                        SOURCE_CODE : item.SOURCE_CODE,
                        MODIFIED_YN : item.MODIFIED_YN,
                        DEPT_CATEGORY : item.DEPT_CATEGORY,
                        SORT_SEQ : item.SORT_SEQ,
                        PARENT_DEPT : item.PARENT_DEPT,
                        NIGHT_TIME_ITEM_CODE : item.NIGHT_TIME_ITEM_CODE,
                        NIGHT_START_DAY_TYPE : item.NIGHT_START_DAY_TYPE,
                        NIGHT_START_HHMM : item.NIGHT_START_HHMM,
                        NIGHT_END_DAY_TYPE : item.NIGHT_END_DAY_TYPE,
                        NIGHT_END_HHMM : item.NIGHT_END_HHMM,
                        NIGHT_HOURS : item.NIGHT_HOURS,
                        APPROVE_GROUP : item.APPROVE_GROUP,
                        INSERT_USERID : item.INSERT_USERID,
                        INSERT_EMP_CODE : item.INSERT_EMP_CODE,
                        INSERT_GROUP : item.INSERT_GROUP,
                        INSERT_GROUP2 : item.INSERT_GROUP2,
                        CURRENT_APPROVE_EMP_CODE : item.CURRENT_APPROVE_EMP_CODE,
                        CURRENT_APPROVE_EMP_NAME : item.CURRENT_APPROVE_EMP_NAME,
                        PROXY_EMP_CODE : item.PROXY_EMP_CODE,
                        PROXY_EMP_NAME : item.PROXY_EMP_NAME,
                        CURRENT_DUTY_CODE : item.CURRENT_DUTY_CODE,
                        APPR_COUNT : item.APPR_COUNT,
                        APPR_ID : item.APPR_ID,
                        FINAL_APPROVER : item.FINAL_APPROVER,
                        WORK_DATA_SOURCE : item.WORK_DATA_SOURCE,
                        WORK_TIME : item.WORK_TIME,
                        OVERTIME_CNT : item.OVERTIME_CNT,
                        VACCINE_WORK_YN : item.VACCINE_WORK_YN,
                        BREAK_APPLY_YN : item.BREAK_APPLY_YN,
                        ALTER_WORK_YN : item.ALTER_WORK_YN,
                        ALTER_REQ_YN : item.ALTER_REQ_YN,
                        SHIFT_WORK_YN : item.SHIFT_WORK_YN,
                        BREAK_START_DAY_TYPE1 : item.BREAK_START_DAY_TYPE1,
                        BREAK_START_HHMM1 : item.BREAK_START_HHMM1,
                        BREAK_END_DAY_TYPE1 : item.BREAK_END_DAY_TYPE1,
                        BREAK_END_HHMM1 : item.BREAK_END_HHMM1,
                        DINNER_YN : item.DINNER_YN
                    }
                    jsonDayShiftList.push(msg);
                });

                gvwDetail.rebuild();

                if(listData.cv_3.length > 0) {
                    let gvwDetailCaptionList = gvwDetail.getCaption('array');

                    listData.cv_3.forEach((item, index) => {
                        let nCol = gvwDetail.getColRef(item.TIME_FIELD_NAME.toUpperCase());

                        if (item.USE_YN == "Y") {
                            gvwDetail.setColHidden(nCol, false, false);
                            gvwDetailCaptionList[nCol] = item.TIME_SUMMARY_NAME;
                        } else {
                            gvwDetail.setColHidden(nCol, true, false);
                        }
                    });

                    let stringGvwDetailCaptionList = "";
                    gvwDetailCaptionList.forEach((item, index) => {
                        stringGvwDetailCaptionList += item + "^";
                    });


                    stringGvwDetailCaptionList = stringGvwDetailCaptionList.substring(0, stringGvwDetailCaptionList.length-1)

                    gvwDetail.setCaption(stringGvwDetailCaptionList);
                }
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

    const fn_changePeriodYyyymm = function(data) {
        SBUxMethod.set("SRCH_YYYYMMDD_FR", data+"01");
        SBUxMethod.set("SRCH_YYYYMMDD_TO", gfn_dateLastYmd(new Date(data.substring(0,4)+"-"+data.substring(4,6)+"-01")));
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwShiftGrid();
        fn_createGvwDetailGrid();
        await fn_onload();
    });

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_onload = async function () {
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();
        SBUxMethod.set("SRCH_PERIOD_YYYYMM",gfn_dateToYm(new Date()));
        SBUxMethod.set("SRCH_YYYYMMDD_FR",gfn_dateFirstYmd(new Date()));
        SBUxMethod.set("SRCH_YYYYMMDD_TO", gfn_dateToYmd(new Date()));

        await fn_search();
    }

    const fn_search = async function () {
        if(!SBUxMethod.validateRequired({group_id: "panHeader"})) {
            return false;
        }

        let YYYYMMDD_FR = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_FR"));
        let YYYYMMDD_TO = gfn_nvl(SBUxMethod.get("SRCH_YYYYMMDD_TO"));
        let SITE_CODE = gfn_nvl(gfnma_multiSelectGet('#SRCH_SITE_CODE'));
        let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE"));
        let JOB_GROUP = gfn_nvl(SBUxMethod.get("SRCH_JOB_GROUP"));
        let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE"));
        let EMP_STATE = gfn_nvl(SBUxMethod.get("SRCH_EMP_STATE"));

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMMDD_FR : YYYYMMDD_FR,
            V_P_YYYYMMDD_TO : YYYYMMDD_TO,
            V_P_SITE_CODE : SITE_CODE,
            V_P_DEPT_CODE : DEPT_CODE,
            V_P_JOB_GROUP : JOB_GROUP,
            V_P_EMP_CODE : EMP_CODE,
            V_P_EMP_STATE : EMP_STATE,
            V_P_LOGIN_DEPT_CODE : '',
            V_P_HR_MANAGER_YN : '',
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromiseForList = gfn_postJSON("/hr/hrt/hrt/selectHrt2330List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '4',
            params				: gfnma_objectToString(paramObj)
        });

        const listData = await postJsonPromiseForList;

        try {
            if (_.isEqual("S", listData.resultStatus)) {
                jsonEmpList.length = 0;
                listData.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN : item.CHK_YN,
                        DEPT_NAME : item.DEPT_NAME,
                        EMP_CODE : item.EMP_CODE,
                        EMP_NAME : item.EMP_NAME,
                        POSITION_CODE : item.POSITION_CODE,
                        SITE_CODE : item.SITE_CODE,
                        DEPT_CODE : item.DEPT_CODE,
                        ENTER_DATE : item.ENTER_DATE,
                        RETIRE_DATE : item.RETIRE_DATE,
                        EMP_STATE : item.EMP_STATE,
                        SORT_SEQ : item.SORT_SEQ,
                        SORT_SEQ2 : item.SORT_SEQ2,
                        WORK_TIME_YN : item.WORK_TIME_YN,
                        CREATE_CNT : item.CREATE_CNT,
                        CONFIRM_CNT : item.CONFIRM_CNT,
                        APPR_CNT : item.APPR_CNT
                    }
                    jsonEmpList.push(msg);
                });

                gvwShift.rebuild();
                document.querySelector('#listCount').innerText = jsonEmpList.length;

                if(jsonEmpList.length > 0) {
                    gvwShift.clickRow(1);
                }

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