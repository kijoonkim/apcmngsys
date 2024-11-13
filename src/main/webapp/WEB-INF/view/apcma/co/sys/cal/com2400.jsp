<%
    /**
     * @Class Name 		: COM2400.jsp
     * @Description 	: 달력
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.04
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.04  	천용진		최초 생성
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
    <title>title : 달력</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <style>
        .calendar { width: 100%; }
        .clickDate { color: black; font-weight: bold; background-color: skyblue; opacity: 0.5; }
        /*.calendar table { width: 100%; }*/
        .calendar table > caption { font-size: larger; font-weight: bolder; color: red; text-align: center; padding: 20px 20px; display: flex; align-items: center; }
        .calendar table > tbody > tr  { padding: 10px; }
        .calendar table > tbody > tr > td { text-align: center; vertical-align: top; margin: 10px; padding: 10px;}
        .calendar table > tbody > tr > td > span { display: block; }
        .calendar table > tbody > tr > td > span:hover { color: black; font-weight: bold; background-color: skyblue; opacity: 0.5; }
        .calendar table > tbody > tr > td.today { border: 1px solid grey; color: white; background-color: grey; opacity: 0.5; }
        .calendar table > tbody > tr > td > span.saturday { color: red; }
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
	            <!--[pp] 검색 -->
	            <!--[APC] START -->
	            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
	            <!--[APC] END -->
	            <table class="table table-bordered tbl_fixed table-search-ma">
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
	                    <td colspan="5"></td>
	                    <td class="td_input" style="border-right:hidden;" align="right">
	                        <sbux-button id="btnBeforeYear" name="btnBeforeYear" 	uitype="normal" text="◀" class="btn btn-xs btn-outline-danger" onclick="fn_beforeYear"></sbux-button>
	                    </td>
	                    <td colspan ="2" class="td_input" style="border-right:hidden;">
	                        <sbux-input id="SRCH_YYYY" uitype="text" placeholder="" class="form-control input-sm" readonly style="text-align:center !important;"></sbux-input>
	                    </td>
	                    <td class="td_input" style="border-right:hidden;">
	                        <sbux-button id="btnNextYear" name="btnNextYear" 	uitype="normal" text="▶" class="btn btn-xs btn-outline-danger" onclick="fn_nextYear"></sbux-button>
	                    </td>
	                    <td colspan="8"></td>
	                </tr>
	                </tbody>
	            </table>
	        </div>    
            <div class="row">
                <div class="col-sm-7">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>달력</span>
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
                                    <span>달력 정보</span>
                                </li>
                            </ul>
                        </div>
                        <div>
                            <table id="dataArea1" class="table table-bordered tbl_fixed">
                                <colgroup>
                                    <col style="width:13%">
                                    <col style="width:19%">
                                    <col style="width:13%">
                                    <col style="width:19%">
                                    <col style="width:13%">
                                    <col style="width:19%">
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
                                                date-format="yyyy-mm-dd"
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
                                                date-format="yyyy-mm-dd"
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
                                    <th scope="row" class="th_bg">일정명</th>
                                    <td class="td_input" colspan="5">
                                        <sbux-input id="SCHEDULE_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">휴일</th>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="HOLIDAY_YN" class="form-control input-sm check" text="예" true-value="Y" false-value="N"/>
                                    </td>
                                    <td class="ad_input" colspan="4">
                                        <sbux-input id="HOLIDAY_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="th_bg">영업일</th>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="BUSINESS_DAY_YN" name="BUSINESS_DAY_YN" class="form-control input-sm check" text="예" true-value="Y" false-value="N"/>
                                    </td>
                                    <th scope="row" class="th_bg">근무일</th>
                                    <td class="ad_input">
                                        <sbux-checkbox uitype="normal" id="WORKING_DAY_YN" name="WORKING_DAY_YN" class="form-control input-sm check" text="예" true-value="Y" false-value="N"/>
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


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 근무유형
//             gfnma_setComSelect(['WORK_TYPE_CODE'], jsonWorkTypeCode, 'L_HRB001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'WORK_TYPE_CODE', 'WORK_TYPE_NAME', 'Y', ''),
            // 휴일유형
//             gfnma_setComSelect(['SHIFT_CODE'], jsonShiftCode, 'L_HRT_SHIFT_HOLIDAY', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SHIFT_CODE', 'SHIFT_NAME', 'Y', ''),
        ]);
    }


    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        calendarYear(new Date());
        fn_search();
    });

    // 저장
    function cfn_save() {
		if(gfn_comConfirm("Q0001", "저장")){ //{0} 하시겠습니까?
	        fn_save();
		}
    }

    const fn_save = async function() {
        let YYYYMMDD 			= gfn_nvl(SBUxMethod.get("YYYYMMDD"));
        let SCHEDULE_NAME 		= gfn_nvl(SBUxMethod.get("SCHEDULE_NAME"));
        let HOLIDAY_YN 			= gfn_nvl(SBUxMethod.get("HOLIDAY_YN").HOLIDAY_YN);
        let HOLIDAY_NAME 		= gfn_nvl(SBUxMethod.get("HOLIDAY_NAME"));
        let BUSINESS_DAY_YN 	= gfn_nvl(SBUxMethod.get("BUSINESS_DAY_YN").BUSINESS_DAY_YN);
        let WORKING_DAY_YN 		= gfn_nvl(SBUxMethod.get("WORKING_DAY_YN").WORKING_DAY_YN);
        let LUNAR_DATE 			= gfn_nvl(SBUxMethod.get("LUNAR_DATE"));
        let LEAP_MONTH_YN 		= gfn_nvl(SBUxMethod.get("LEAP_MONTH_YN").LEAP_MONTH_YN);
        let WEEK_SEQ 			= gfn_nvl(SBUxMethod.get("WEEK_SEQ"));
        let DAY_SEQ 			= gfn_nvl(SBUxMethod.get("DAY_SEQ"));
        let DESCR 				= gfn_nvl(SBUxMethod.get("DESCR"));
        
        var paramObj = {
       		   V_P_DEBUG_MODE_YN         : ''
   			   ,V_P_LANG_ID              : ''
   			   ,V_P_COMP_CODE            : gv_ma_selectedApcCd
   			   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
   			   ,V_P_YYYYMMDD             : YYYYMMDD
   			   ,V_P_WORKING_DAY_YN       : WORKING_DAY_YN
   			   ,V_P_HOLIDAY_YN           : HOLIDAY_YN
   			   ,V_P_BUSINESS_DAY_YN      : BUSINESS_DAY_YN
   			   ,V_P_SCHEDULE_NAME        : SCHEDULE_NAME
   			   ,V_P_HOLIDAY_NAME         : HOLIDAY_NAME
   			   ,V_P_LUNAR_DATE           : LUNAR_DATE
   			   ,V_P_LEAP_MONTH_YN        : LEAP_MONTH_YN
   			   ,V_P_DESCR                : DESCR
   			   ,V_P_FORM_ID              : p_formId
   			   ,V_P_MENU_ID              : p_menuId
   			   ,V_P_PROC_ID              : ''
   			   ,V_P_USERID               : ''
   			   ,V_P_PC                   : ''
        };

        const postJsonPromise = gfn_postJSON("/co/sys/cal/insertCom2400.do", {
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

    // 조회
    function cfn_search() {
        fn_search();
    }

    const fn_search = async function(type) {
    	
        let SRCH_YYYY = gfn_nvl(SBUxMethod.get("SRCH_YYYY"));
        
		if(type == 'before'){
			SRCH_YYYY = Number(SRCH_YYYY) - 1;
		}else if(type == 'next'){
			SRCH_YYYY = Number(SRCH_YYYY) + 1;
		}
        var paramObj = {
       		   V_P_DEBUG_MODE_YN         : '' 
   			   ,V_P_LANG_ID              : ''
   			   ,V_P_COMP_CODE            : gv_ma_selectedApcCd
   			   ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
   			   ,V_P_YYYY                 : SRCH_YYYY
   			   ,V_P_YYYYMMDD             : ''
   			   ,V_P_FORM_ID              : p_formId
   			   ,V_P_MENU_ID              : p_menuId
   			   ,V_P_PROC_ID              : ''
   			   ,V_P_USERID               : ''
   			   ,V_P_PC                   : ''
         };

        const postJsonPromise = gfn_postJSON("/co/sys/cal/selectCom2400.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
            	holidayList = [];
                data.cv_1.forEach((item, index) => {
                    if(item.HOLIDAY_YN == "Y") {
       					let YYYYMMDD_START = item.YYYYMMDD_START.substring(5);
       					let mon = YYYYMMDD_START.substr(0, 2);
       					mon = Number(mon);
       					let day = YYYYMMDD_START.substr(3, 4);
       					day = Number(day);
       					let holiday =  mon.toString() + '-' + day.toString();
                        holidayList[holiday] = {"title" : item.HOLIDAY_NAME};
                    }
                });

			let currentDate = new Date();
			currentDate.setFullYear(SRCH_YYYY);
			calendarYear(currentDate);
			
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
     * 초기화
     */
    function cfn_init() {
    	//검색하는 기능이 없어 우선 주석처리
//     	gfnma_uxDataClear('#srchArea1');
    }
    
    const fn_beforeYear = async function() {
        fn_search('before');
    }

    const fn_nextYear = async function() {
        fn_search('next');
    }

    const fn_today = async function() {
        calendarYear(new Date());
        fn_search();
    }

    const fn_view = async function(date) {
        SBUxMethod.set("YYYYMMDD", date);
        let YYYYMMDD 	= gfn_nvl(SBUxMethod.get("YYYYMMDD"));
        let YYYY 		= gfn_nvl(SBUxMethod.get("SRCH_YYYY"));

        var paramObj = {
       		   V_P_DEBUG_MODE_YN    :'' 
   			   ,V_P_LANG_ID         : ''
   			   ,V_P_COMP_CODE       : gv_ma_selectedApcCd
   			   ,V_P_CLIENT_CODE     : gv_ma_selectedClntCd
   			   ,V_P_YYYY            : YYYY
   			   ,V_P_YYYYMMDD        : YYYYMMDD
   			   ,V_P_FORM_ID         : p_formId
   			   ,V_P_MENU_ID         : p_menuId
   			   ,V_P_PROC_ID         : ''
   			   ,V_P_USERID          : ''
   			   ,V_P_PC              : ''
        };

        const postJsonPromise = gfn_postJSON("/co/sys/cal/selectCom2400.do", {
            getType				: 'json',
            workType			: 'DETAIL',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const detailData = await postJsonPromise;
        try {
            if (_.isEqual("S", detailData.resultStatus)) {
            	var responseData = detailData.cv_2[0];
                if(responseData) {
                    SBUxMethod.set("SCHEDULE_NAME", 	responseData.LUNAR_DATE);
                    SBUxMethod.set("HOLIDAY_YN", 		responseData.HOLIDAY_YN);
                    SBUxMethod.set("HOLIDAY_NAME", 		responseData.HOLIDAY_NAME);
                    SBUxMethod.set("BUSINESS_DAY_YN", 	responseData.BUSINESS_DAY_YN);
                    SBUxMethod.set("WORKING_DAY_YN", 	responseData.WORKING_DAY_YN);
                    SBUxMethod.set("LUNAR_DATE", 		responseData.LUNAR_DATE);
                    SBUxMethod.set("LEAP_MONTH_YN", 	responseData.LEAP_MONTH_YN);
                    SBUxMethod.set("WEEK_SEQ", 			responseData.WEEK_SEQ);
                    SBUxMethod.set("DAY_SEQ", 			responseData.DAY_SEQ);
                    SBUxMethod.set("DESCR", 			responseData.DESCR);
                } else {
                    SBUxMethod.set("SCHEDULE_NAME", 	'');
                    SBUxMethod.set("HOLIDAY_YN", 		'');
                    SBUxMethod.set("HOLIDAY_NAME", 		'');
                    SBUxMethod.set("BUSINESS_DAY_YN", 	'');
                    SBUxMethod.set("WORKING_DAY_YN", 	'');
                    SBUxMethod.set("LUNAR_DATE", 		'');
                    SBUxMethod.set("LEAP_MONTH_YN", 	'');
                    SBUxMethod.set("WEEK_SEQ", 			'');
                    SBUxMethod.set("DAY_SEQ", 			'');
                    SBUxMethod.set("DESCR", 			'');
                }
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
        // 년도
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
        hashmapHoliday["1-1"]	= {"title" : "새해"};
        hashmapHoliday["3-1"]	= {"title" : "삼일절"};
        hashmapHoliday["5-5"]	= {"title" : "어린이날"};
        hashmapHoliday["6-6"]	= {"title" : "현충일"};
        hashmapHoliday["8-15"]	= {"title" : "광복절"};
        hashmapHoliday["10-3"]	= {"title" : "개천절"};
        hashmapHoliday["10-9"]	= {"title" : "한글날"};
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