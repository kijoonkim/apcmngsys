<%
    /**
     * @Class Name 		: hrb1300.jsp
     * @Description 	: 캘린더 화면
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
    <title>title : 캘린더</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <style>
        .calendar { width: 100%; }
        .clickDate { color: black; font-weight: bold; background-color: skyblue; opacity: 0.5; }
        /*.calendar table { width: 100%; }*/
        .calendar table > caption { font-size: larger; font-weight: bolder; color: red; text-align: center; padding: 20px 20px; display: flex; align-items: center; }
        .calendar table > thead > tr > th.saturday { color: gray; }
        .calendar table > thead > tr > th.sunday { color: red; }
        .calendar table > tbody > tr  { padding: 10px; }
        .calendar table > tbody > tr > td { text-align: center; vertical-align: top; margin: 10px; padding: 10px;}
        .calendar table > tbody > tr > td > span { display: block; }
        .calendar table > tbody > tr > td > span:hover { color: black; font-weight: bold; background-color: skyblue; opacity: 0.5; }
        .calendar table > tbody > tr > td.today { border: 1px solid grey; color: white; background-color: grey; opacity: 0.5; }
        .calendar table > tbody > tr > td > span.saturday { color: gray; }
        .calendar table > tbody > tr > td > span.sunday { color: red; }
        .calendar table > tbody > tr > td > span.holiday { color: red; }
        /* calendar month */
        .calendar.month table > tbody > tr > td { padding: 10px 10px; }
        .calendar.month table > tbody > tr > td > span { padding: 10px 10px; }
        .calendar.month table > tbody > tr > td > span.today { padding: 9px 9px; }
        /* calendar year */
        .calendar.year table { font-size: 12px; }
        .calendar.year table > thead > tr > th { font-weight: normal; text-align: center; }
        .calendar.year table > tbody > tr > td > span { width: 20px; height: 20px; }
        .calendar.year .calendar-month { height: 30px; font-size: 14px; font-weight: bolder; text-align: center; line-height: 30px; margin-left: 4px; }
    </style>
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
                    <col style="width: 42%">
                    <col style="width: 3%">
                    <col style="width: 5%">
                    <col style="width: 3%">
                    <col style="width: 42%">
                </colgroup>
                <tbody>
                <tr>
                    <td></td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button id="btnBeforeYear" name="btnBeforeYear" 	uitype="normal" text="◀" class="btn btn-xs btn-outline-danger" onclick="fn_beforeYear"></sbux-button>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_YYYY" uitype="text" placeholder="" class="form-control input-sm inpt_data_reqed" readonly></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button id="btnNextYear" name="btnNextYear" 	uitype="normal" text="▶" class="btn btn-xs btn-outline-danger" onclick="fn_nextYear"></sbux-button>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="row">
                <div class="col-sm-7">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>캘린더</span>
                            </li>
                        </ul>
                        <div class="ad_tbl_toplist">
                            <sbux-button id="btnToday" name="btnToday" uitype="normal" text="Today" class="btn btn-sm btn-outline-danger" onclick="fn_today" style="float: right;"></sbux-button>
                        </div>
                    </div>
                    <div class="calendar year">
                        <div id="calendar"></div>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>캘린더정보</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:16%">
                                    <col style="width:16%">
                                    <col style="width:16%">
                                    <col style="width:16%">
                                    <col style="width:16%">
                                    <col style="width:16%">
                                </colgroup>
                                <tr>
                                    <th scope="row" class="th_bg">기준일</th>
                                    <td class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="YYYYMMDD"
                                                name="YYYYMMDD"
                                                class="input-sm"
                                                autocomplete="off"
                                                readonly
                                        ></sbux-datepicker>
                                    </td>
                                    <th scope="row" class="th_bg">음력</th>
                                    <td class="td_input">
                                        <sbux-datepicker
                                                uitype="popup"
                                                id="LUNAR_DATE"
                                                name="LUNAR_DATE"
                                                class="input-sm"
                                                autocomplete="off"
                                                readonly
                                        ></sbux-datepicker>
                                    </td>
                                    <th scope="row" class="th_bg">윤달</th>
                                    <td class="td_input">
                                        <sbux-checkbox
                                                uitype="normal"
                                                id="LEAP_MONTH_YN"
                                                name="LEAP_MONTH_YN"
                                                uitype="normal"
                                                class="form-control input-sm check"
                                                text="예"
                                                true-value="Y" false-value="N"
                                        />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">주차</th>
                                    <td class="td_input">
                                        <sbux-input id="WEEK_SEQ" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                    <th scope="row" class="th_bg">일수</th>
                                    <td class="td_input">
                                        <sbux-input id="DAY_SEQ" class="form-control input-sm" uitype="text" style="width:100%" readonly></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">근무유형</th>
                                    <td class="td_input">
                                        <sbux-select id="WORK_TYPE_CODE" uitype="single" jsondata-ref="jsonWorkTypeCode" unselected-text="선택" class="form-control input-sm" readonly></sbux-select>
                                    </td>
                                    <th scope="row" class="th_bg">휴일유형</th>
                                    <td class="td_input">
                                        <sbux-select id="SHIFT_CODE" uitype="single" jsondata-ref="jsonShiftCode" unselected-text="" class="form-control input-sm" readonly></sbux-select>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">휴일</th>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="HOLIDAY_YN" name="HOLIDAY_YN" class="form-control input-sm check" text="예" true-value="Y" false-value="N"/>
                                    </td>
                                    <th scope="row" class="th_bg">명절</th>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="HOLIDAY2_YN" name="HOLIDAY2_YN" class="form-control input-sm check" text="얘" true-value="Y" false-value="N" onchange="fnPositionAppointYnChange(POSITION_APPOINT_YN)"/>
                                    </td>
                                    <td class="ad_input">
                                        <sbux-input id="HOLIDAY_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">공휴특휴</th>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="HOLIDAY_TYPE1_YN" name="HOLIDAY_TYPE1_YN" class="form-control input-sm check" text="예" true-value="Y" false-value="N"/>
                                    </td>
                                    <th scope="row" class="th_bg">공휴</th>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="HOLIDAY_TYPE2_YN" name="HOLIDAY_TYPE2_YN" class="form-control input-sm check" text="얘" true-value="Y" false-value="N" onchange="fnPositionAppointYnChange(POSITION_APPOINT_YN)"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">비고</th>
                                    <td colspan="5" class="ad_input">
                                        <sbux-input id="DESCR" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="ad_tbl_top2">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>생일정보</span>
                                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                </li>
                            </ul>
                        </div>
                        <div class="table-responsive tbl_scroll_sm">
                            <div id="sb-area-gvwDay" style="height:900px;"></div>
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
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    // 공휴일리스트
    var holidayList= [];

    var jsonWorkTypeCode	= []; // 근무유형
    var jsonShiftCode       = []; // 휴일유형
    var jsonCalendarType    = []; // 구분

    //grid 초기화
    var gvwDay; 			// 그리드를 담기위한 객체 선언

    var jsonDayList = []; 	// 그리드의 참조 데이터 주소 선언

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 근무유형
            gfnma_setComSelect(['WORK_TYPE_CODE'], jsonWorkTypeCode, 'L_HRB001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'WORK_TYPE_CODE', 'WORK_TYPE_NAME', 'Y', ''),
            // 휴일유형
            gfnma_setComSelect(['SHIFT_CODE'], jsonShiftCode, 'L_HRT_SHIFT_HOLIDAY', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SHIFT_CODE', 'SHIFT_NAME', 'Y', ''),
            // 구분
            gfnma_setComSelect(['gvwDay'], jsonCalendarType, 'L_COM091', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
        ]);
    }

    // 그리드 생성
    function fn_createGvwDayGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwDay';
        SBGridProperties.id 				= 'gvwDay';
        SBGridProperties.jsonref 			= 'jsonDayList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption: ["연번"], 		ref: 'SEQ',   	type:'output', style:'text-align:center' ,width: '46px'},
            {caption: ["구분"], 	        ref: 'CALENDAR_TYPE',    	    type:'combo',  	width:'68px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonCalendarType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            },
            {caption: ["사번"],  		ref: 'EMP_CODE',    			type:'output',  	width:'80px',  	style:'text-align:left'},
            {caption: ["사원명"],       ref: 'EMP_NAME', 		type:'output',  	width:'100px',  	style:'text-align:left'},
            {caption: ["생일"],          ref: 'CALENDAR_DAY', 		        type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["실제생일"],          ref: 'ORIGINAL_DAY', 		        type:'output',  	width:'75px',  style:'text-align:left'}
        ];

        gvwDay = _SBGrid.create(SBGridProperties);
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwDayGrid();
        calendarYear(new Date());
        await fn_search();
    });

    // 저장
    function cfn_save() {
        fn_save();
    }

    const fn_save = async function() {
        let YYYYMMDD = gfn_nvl(SBUxMethod.get("YYYYMMDD"));
        let WORK_DAY_TYPE = gfn_nvl(SBUxMethod.get("WORK_TYPE_CODE"));
        let SHIFT_CODE = gfn_nvl(SBUxMethod.get("SHIFT_CODE"));
        let HOLIDAY_YN = gfn_nvl(SBUxMethod.get("HOLIDAY_YN").HOLIDAY_YN);
        let HOLIDAY_NAME = gfn_nvl(SBUxMethod.get("HOLIDAY_NAME"));
        let HOLIDAY2_YN = gfn_nvl(SBUxMethod.get("HOLIDAY2_YN").HOLIDAY2_YN);
        let LUNAR_DATE = gfn_nvl(SBUxMethod.get("LUNAR_DATE"));
        let LEAP_MONTH_YN = gfn_nvl(SBUxMethod.get("LEAP_MONTH_YN").LEAP_MONTH_YN);
        let DESCR = gfn_nvl(SBUxMethod.get("DESCR"));
        let HOLIDAY_TYPE1_YN = gfn_nvl(SBUxMethod.get("HOLIDAY_TYPE1_YN").HOLIDAY_TYPE1_YN);
        let HOLIDAY_TYPE2_YN = gfn_nvl(SBUxMethod.get("HOLIDAY_TYPE2_YN").HOLIDAY_TYPE2_YN);

        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMMDD : YYYYMMDD,
            V_P_WORK_DAY_TYPE : WORK_DAY_TYPE,
            V_P_SHIFT_CODE : SHIFT_CODE,
            V_P_HOLIDAY_YN : HOLIDAY_YN,
            V_P_HOLIDAY_NAME : HOLIDAY_NAME,
            V_P_HOLIDAY2_YN : HOLIDAY2_YN,
            V_P_LUNAR_DATE : LUNAR_DATE,
            V_P_LEAP_MONTH_YN : LEAP_MONTH_YN,
            V_P_DESCR : DESCR,
            V_P_HOLIDAY_TYPE1_YN : HOLIDAY_TYPE1_YN,
            V_P_HOLIDAY_TYPE2_YN : HOLIDAY_TYPE2_YN,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/saveHrb1300.do", {
            getType				: 'json',
            workType			: 'U',
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
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

    // 초기화
    function cfn_init() {
        calendarYear(new Date());
        fn_search();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_search = async function() {
        let YYYY = gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/selectHrb1100List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                data.cv_1.forEach((item, index) => {
                    if(item.HOLIDAY_YN == "Y") {
                        holidayList[item.YYYYMMDD_START] = {"title" : item.HOLIDAY_NAME};
                    }
                });

                calendarYear(new Date());
                fn_view(gfn_dateToYmd(new Date()));
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

    const fn_beforeYear = async function() {
        var year = $("#calendar").attr("data-date");
        calendarYear(new Date(parseInt(year) - 1, 1, 1));
        fn_search();
    }

    const fn_nextYear = async function() {
        var year = $("#calendar").attr("data-date");
        calendarYear(new Date(parseInt(year) + 1, 1, 1));
        fn_search();
    }

    const fn_today = async function() {
        calendarYear(new Date());
        fn_search();
    }

    const fn_view = async function(date) {
        SBUxMethod.set("YYYYMMDD", date);
        let YYYYMMDD = gfn_nvl(SBUxMethod.get("YYYYMMDD"));
        let YYYYMM = YYYYMMDD.substring(0.6);
        let YYYY = gfn_nvl(SBUxMethod.get("SRCH_YYYY"));

        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYYMM : YYYYMM,
            V_P_YYYYMMDD : YYYYMMDD,
            V_P_YYYY : YYYY,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/selectHrb1300List.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '4',
            params				: gfnma_objectToString(paramObj)
        });

        const detailData = await postJsonPromise;

        try {
            if (_.isEqual("S", detailData.resultStatus)) {
                var responseData = detailData.cv_2[0];

                if(responseData) {
                    SBUxMethod.set("WORK_TYPE_CODE", responseData.WORK_TYPE_CODE);
                    SBUxMethod.set("SHIFT_CODE", responseData.SHIFT_CODE);
                    SBUxMethod.set("HOLIDAY_YN", responseData.HOLIDAY_YN);
                    SBUxMethod.set("HOLIDAY_NAME", responseData.HOLIDAY_NAME);
                    SBUxMethod.set("HOLIDAY2_YN", responseData.HOLIDAY2_YN);
                    SBUxMethod.set("LUNAR_DATE", responseData.LUNAR_DATE);
                    SBUxMethod.set("LEAP_MONTH_YN", responseData.LEAP_MONTH_YN);
                    SBUxMethod.set("WEEK_SEQ", responseData.WEEK_SEQ);
                    SBUxMethod.set("DAY_SEQ", responseData.DAY_SEQ);
                    SBUxMethod.set("DESCR", responseData.DESCR);
                    SBUxMethod.set("MODIFIED_YN", responseData.MODIFIED_YN);
                    SBUxMethod.set("HOLIDAY_TYPE1_YN", responseData.HOLIDAY_TYPE1_YN);
                    SBUxMethod.set("HOLIDAY_TYPE2_YN", responseData.HOLIDAY_TYPE2_YN);
                } else {
                    SBUxMethod.set("WORK_TYPE_CODE", "");
                    SBUxMethod.set("SHIFT_CODE", "");
                    SBUxMethod.set("HOLIDAY_YN", "N");
                    SBUxMethod.set("HOLIDAY_NAME", "");
                    SBUxMethod.set("HOLIDAY2_YN", "N");
                    SBUxMethod.set("LUNAR_DATE", "");
                    SBUxMethod.set("LEAP_MONTH_YN", "N");
                    SBUxMethod.set("WEEK_SEQ", 0);
                    SBUxMethod.set("DAY_SEQ", 0);
                    SBUxMethod.set("DESCR", "");
                    SBUxMethod.set("MODIFIED_YN", "");
                    SBUxMethod.set("HOLIDAY_TYPE1_YN", "N");
                    SBUxMethod.set("HOLIDAY_TYPE2_YN", "N");
                }

                const postJsonPromise = gfn_postJSON("/hr/hrt/com/selectHrb1300List.do", {
                    getType				: 'json',
                    workType			: 'EVENT',
                    cv_count			: '4',
                    params				: gfnma_objectToString(paramObj)
                });

                const eventData = await postJsonPromise;

                try {
                    if (_.isEqual("S", eventData.resultStatus)) {

                        jsonDayList.length = 0;
                        /** @type {number} **/
                        eventData.cv_4.forEach((item, index) => {
                            const msg = {
                                SEQ : item.SEQ,
                                CALENDAR_TYPE : item.CALENDAR_TYPE,
                                EMP_CODE : item.EMP_CODE,
                                EMP_NAME : item.EMP_NAME,
                                CALENDAR_DAY : item.CALENDAR_DAY,
                                ORIGINAL_DAY : item.ORIGINAL_DAY
                            }
                            jsonDayList.push(msg);
                        });

                        gvwDay.rebuild();
                        document.querySelector('#listCount').innerText = jsonDayList.length;
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

    // 날짜 클릭
    $(document).on("click", ".calendar table > tbody > tr > td", function(event) {
        event.stopPropagation();
        var eventTarget = event.target;

        while (eventTarget.tagName != "TD") {
            eventTarget = eventTarget.parentElement;
        }
        if ($(eventTarget).attr("data-date") != undefined) {
            $(".clickDate").attr("class", "");
            $(eventTarget).attr("class", "clickDate");
            fn_view($(eventTarget).attr("data-date"));
        }
    });

    function calendarYear(date) {
        // 년
        SBUxMethod.set("SRCH_YYYY", date.getFullYear());

        var options = {
            showDay : true,
            showToday : true,
            arHoliday : holidayList
        };

        var html = "";
        html += "<table style='margin-left: auto; margin-right: auto;'>";
        html += "<tbody>";
        for (var index1 = 0; index1 < 4; index1++) {
            html += "<tr>";
            for (var index2 = 0; index2 < 3; index2++) {
                html += "<td>";
                html += "<div class=\"calendar-month\">" + (index1 * 3 + index2 + 1) + "월</div>";
                html += calendarHTML(new Date(date.getFullYear(), (index1 * 3 + index2), 1), options);
                html += "</td>";
            }
            html += "</tr>";
        }
        html += "</tbody>";
        html += "</table>";

        $("#calendar").attr("data-date", date.getFullYear());
        $("#calendar").html(html);
    }

    function calendarHTML(date, options) {
        // 데이터 검증
        if (date == undefined || date == null || typeof date != "object" || !date instanceof Date) {
            return "";
        }

        // 기본값 처리
        if (options.showDay == undefined || options.showDay == null || typeof options.showDay != "boolean") {
            options.showDay = true;
        }
        if (options.showFullDayName == undefined || options.showFullDayName == null || typeof options.showFullDayName != "boolean") {
            options.showFullDayName = false;
        }
        if (options.showToday == undefined || options.showToday == null || typeof options.showToday != "boolean") {
            options.showToday = true;
        }

        // 공휴일
        var hashmapHoliday = [];
        hashmapHoliday["1-1"] = {"title" : "새해"};
        hashmapHoliday["3-1"] = {"title" : "삼일절"};
        hashmapHoliday["5-5"] = {"title" : "어린이날"};
        hashmapHoliday["6-6"] = {"title" : "현충일"};
        hashmapHoliday["8-15"] = {"title" : "광복절"};
        hashmapHoliday["10-3"] = {"title" : "개천절"};
        hashmapHoliday["10-9"] = {"title" : "한글날"};
        hashmapHoliday["12-25"] = {"title" : "성탄절"};

        if (options.arHoliday != undefined && options.arHoliday != null && Array.isArray(options.arHoliday)) {
            Object.assign(hashmapHoliday, options.arHoliday);
        }

        // 요일
        var days = ["일", "월", "화", "수", "목", "금", "토"];

        // 달력 연도
        var calendarYear = date.getFullYear();
        // 달력 월
        var calendarMonth = date.getMonth() + 1;
        // 달력 일
        var calendarToday = date.getDate();

        var monthLastDate = new Date(calendarYear, calendarMonth, 0);
        // 달력 월의 마지막 일
        var calendarMonthLastDate = monthLastDate.getDate();

        var monthStartDay = new Date(calendarYear, date.getMonth(), 1);
        // 달력 월의 시작 요일
        var calendarMonthStartDay = monthStartDay.getDay();

        // 주 카운트
        var calendarWeekCount = Math.ceil((calendarMonthStartDay + calendarMonthLastDate) / 7);

        // 오늘
        var today = new Date();

        var html = "";
        html += "<table>";
        if (options.showDay) {
            html += "<thead><tr>";
            for (var index = 0; index < days.length; index++) {
                html += "<th";
                if (index == 0) {
                    html += " class=\"sunday\"";
                } else if (index == 6) {
                    html += " class=\"saturday\"";
                }
                html += ">" + days[index];
                if (options.showFullDayName) {
                    html += "요일";
                }
                html += "</th>";
            }
            html += "</tr></thead>";
        }
        html += "<tbody>";
        // 위치
        var calendarPos = 0;
        // 날짜
        var calendarDay = 0;
        for (var index1 = 0; index1 < calendarWeekCount; index1++) {
            html += "<tr>";
            for (var index2 = 0; index2 < 7; index2++) {
                html += "<td";
                if (calendarMonthStartDay <= calendarPos && calendarDay < calendarMonthLastDate) {
                    calendarDay++;
                    if (options.showToday && calendarYear == today.getFullYear() && calendarMonth == today.getMonth() + 1
                        && calendarDay == today.getDate()) {
                        html += " class=\"today\"";
                    }
                    html += " data-date=\"" + calendarYear + "-" + (calendarMonth < 10 ? "0" : "") + calendarMonth + "-" + (calendarDay < 10 ? "0" : "") + calendarDay +  "\">";
                    html += "<span";

                    var holiday = false;
                    if (Object.keys(hashmapHoliday).length > 0) {
                        // 공휴일(임시 공휴일 포함)
                        var holidayInfo = hashmapHoliday[calendarYear + "-" + calendarMonth + "-" + calendarDay];
                        if (holidayInfo == undefined || holidayInfo == null) {
                            holidayInfo = hashmapHoliday[calendarMonth + "-" + calendarDay];
                        }
                        if (holidayInfo != undefined && holidayInfo != null) {
                            html += " class=\"holiday\"";
                            holiday = true;
                        }
                    }
                    if (!holiday) {
                        if (index2 == 0) {
                            html += " class=\"sunday\"";
                        } else if (index2 == 6) {
                            html += " class=\"saturday\"";
                        }
                    }

                    if (Object.keys(hashmapHoliday).length > 0) {
                        // 공휴일(임시 공휴일 포함)
                        var holidayInfo = hashmapHoliday[calendarYear + "-" + calendarMonth + "-" + calendarDay];
                        if (holidayInfo == undefined || holidayInfo == null) {
                            holidayInfo = hashmapHoliday[calendarMonth + "-" + calendarDay];
                        }
                        if (holidayInfo != undefined && holidayInfo != null) {
                            html += " title=\"" + holidayInfo.title + "\"";
                        }
                    }
                    html += ">" + calendarDay + "</span>";
                } else {
                    html += ">";
                }
                html += "</td>";
                calendarPos++;
            }
            html += "</tr>";
        }
        html += "</tbody>";
        html += "</table>";
        return html;
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>