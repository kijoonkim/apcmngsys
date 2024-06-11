<%
    /**
     * @Class Name 		: hrb1100.jsp
     * @Description 	: 캘린더생성 화면
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
    <title>title : 캘린더생성</title>
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
                <sbux-button id="btn_copyPrevYear" name="btn_copyPrevYear" uitype="normal" text="전년도자료복사" class="btn btn-sm btn-outline-danger" onclick="fn_copyPrevYear" ></sbux-button>
                <sbux-button id="btn_createCalendar" name="btn_createCalendar" uitype="normal" text="캘린더생성" class="btn btn-sm btn-outline-danger" onclick="fn_createCalendar"></sbux-button>
                <sbux-button id="btn_reflectChangeCalendar" name="btn_reflectChangeCalendar" uitype="normal" text="캘린더 변경반영" class="btn btn-sm btn-outline-danger" onclick="fn_reflectChangeCalendar" ></sbux-button>
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
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 80%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">기준년도</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="SRCH_YYYY"
                                name="SRCH_YYYY"
                                date-format="yyyy"
                                datepicker-mode="year"
                                class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
                        />
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div class="col-sm-4">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>요일설정</span>
                            </li>
                        </ul>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwDay" style="height:580px;"></div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>특정일설정</span>
                            </li>
                        </ul>
                        <div class="ad_tbl_toplist">
                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" ></sbux-button>
                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow"></sbux-button>
                        </div>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwHoliday" style="height:580px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
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

    var jsonWorkTypeCode	= []; // 근무유형
    var jsonShiftCode       = []; // 휴일유형
    var jsonCalendarType    = []; // 구분

    //grid 초기화
    var gvwDay; 			// 그리드를 담기위한 객체 선언
    var gvwHoliday;

    var jsonDayList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonHolidayList = [];

    const fn_initSBSelect = async function() {
        SBUxMethod.set("SRCH_YYYY", gfn_dateToYmd(new Date()));

        let rst = await Promise.all([
            // 근무유형
            gfnma_setComSelect(['gvwDay', 'gvwHoliday'], jsonWorkTypeCode, 'L_HRB001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'WORK_TYPE_CODE', 'WORK_TYPE_NAME', 'Y', ''),
            // 휴일유형
            gfnma_setComSelect(['gvwDay', 'gvwHoliday'], jsonShiftCode, 'L_HRT_SHIFT_HOLIDAY', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SHIFT_CODE', 'SHIFT_NAME', 'Y', ''),
            // 구분
            gfnma_setComSelect(['gvwDay'], jsonCalendarType, 'L_COM091', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
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
        SBGridProperties.columns = [
            {caption: ["연번"], 		ref: 'SEQ',   	    type:'output', style:'text-align:center' ,width: '46px'},
            {caption: ["요일"],      ref: 'DAY_NAME',    type:'output',  	width:'60px',  style:'text-align:left'},
            {caption: ["근무유형"], 	        ref: 'WORK_TYPE_CODE',    	    type:'combo',  	width:'100px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWorkTypeCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["휴일여부"],  		ref: 'HOLIDAY_YN',    			type:'checkbox',  	width:'70px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["휴일구분"],       ref: 'SHIFT_CODE', 		type:'combo',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonShiftCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }},
        ];

        gvwDay = _SBGrid.create(SBGridProperties);
    }

    function fn_createGvwHolidayGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwHoliday';
        SBGridProperties.id 				= 'gvwHoliday';
        SBGridProperties.jsonref 			= 'jsonHolidayList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.selectmode 		= 'byrow';
        SBGridProperties.explorerbar 		= 'sortmove';
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["시작일"], 		ref: 'START_DAY',   	type:'datepicker', style:'text-align:center' ,width: '90px',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["종료일"], 		ref: 'END_DAY',   	type:'datepicker', style:'text-align:center' ,width: '90px',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["양력여부"],  		ref: 'LEAP_MONTH_YN',    			type:'checkbox',  	width:'69px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["윤달여부"],  		ref: 'SOLAR_YN',    			type:'checkbox',  	width:'69px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["근무유형"], 	        ref: 'WORK_TYPE_CODE',    	    type:'combo',  	width:'99px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonWorkTypeCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["특정일명칭"],  		ref: 'DAY_TITLE',    			type:'input',  	width:'148px',  	style:'text-align:left'},
            {caption: ["공휴일여부"],  		ref: 'HOLIDAY_YN',    			type:'checkbox',  	width:'70px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["명절여부"],  		ref: 'HOLIDAY2_YN',    			type:'checkbox',  	width:'67px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["공휴특휴"],  		ref: 'HOLIDAY_TYPE1_YN',    			type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["공휴"],  		ref: 'HOLIDAY_TYPE2_YN',    			type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["휴일구분"],          ref: 'SHIFT_CODE', 		        type:'combo',  	width:'75px',  style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonShiftCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["비고"],  		ref: 'MEMO',    			type:'output',  	width:'200px',  	style:'text-align:left'},
            {caption: ["순번"],       ref: 'TXN_ID', 		type:'output',  	width:'75px',  	style:'text-align:left', hidden: true},
            {caption: ["시작일(양)"],          ref: 'START_DAY_SOLAR', 		        type:'datepicker',  	width:'94px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["종료일(양)"],          ref: 'END_DAY_SOLAR', 		        type:'datepicker',  	width:'91px',  style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
            },
            {caption: ["법인"],          ref: 'COMP_CODE', 		        type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["시작(요일)"],          ref: 'START_WEEK_NAME', 		        type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["종료(요일)"],          ref: 'END_WEEK_NAME', 		        type:'output',  	width:'75px',  style:'text-align:left'},
            {caption: ["휴일수"],          ref: 'HOLIDAY_COUNT', 		        type:'output',  	width:'85px',  style:'text-align:left'},
            {caption: ["휴일(주말제외)"],          ref: 'HOLIDAY_COUNT2', 		        type:'output',  	width:'99px',  style:'text-align:left'},
        ];

        gvwHoliday = _SBGrid.create(SBGridProperties);
    }

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createGvwDayGrid();
        fn_createGvwHolidayGrid();
        fn_search();
    });


    // 행 추가
    const fn_addRow = function() {
        let rowVal = gvwHoliday.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwHoliday.addRow(true);
        }else{
            gvwHoliday.insertRow(rowVal);
        }
    }

    const fn_deleteRow = function() {
        let rowVal = gvwHoliday.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwHoliday.deleteRow(rowVal);
        }
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    const fn_search = async function() {
        let YYYY = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
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
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonDayList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        SEQ : item.SEQ,
                        DAY_NAME : item.DAY_NAME,
                        WORK_TYPE_CODE : item.WORK_TYPE_CODE,
                        SHIFT_CODE : item.SHIFT_CODE,
                        HOLIDAY_YN : item.HOLIDAY_YN
                    }
                    jsonDayList.push(msg);
                });

                gvwDay.rebuild();

                jsonHolidayList.length = 0;
                data.cv_2.forEach((item, index) => {
                    const msg = {
                        START_DAY : item.START_DAY,
                        END_DAY : item.END_DAY,
                        DAY_TITLE : item.DAY_TITLE,
                        HOLIDAY_YN : item.HOLIDAY_YN,
                        HOLIDAY2_YN : item.HOLIDAY2_YN,
                        WORK_TYPE_CODE : item.WORK_TYPE_CODE,
                        SHIFT_CODE : item.SHIFT_CODE,
                        SOLAR_YN : item.SOLAR_YN,
                        LEAP_MONTH_YN : item.LEAP_MONTH_YN,
                        MEMO : item.MEMO,
                        LEAP_MONTH_YN : item.LEAP_MONTH_YN,
                        HOLIDAY_TYPE1_YN : item.HOLIDAY_TYPE1_YN,
                        HOLIDAY_TYPE2_YN : item.HOLIDAY_TYPE2_YN,
                        COMP_CODE : item.COMP_CODE,
                        TXN_ID : item.TXN_ID,
                        START_DAY_SOLAR : item.START_DAY_SOLAR,
                        END_DAY_SOLAR : item.END_DAY_SOLAR,
                        START_WEEK_NAME : item.START_WEEK_NAME,
                        END_WEEK_NAME : item.END_WEEK_NAME,
                        HOLIDAY_COUNT : item.HOLIDAY_COUNT,
                        HOLIDAY_COUNT2 : item.HOLIDAY_COUNT2
                    }
                    jsonHolidayList.push(msg);
                });

                gvwHoliday.rebuild();
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

    const fn_save = async function() {
        let YYYY = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));

        jsonDayList.forEach((item, index) => {
            if(item.WORK_TYPE_CODE == "") {
                alert("근무유형 은(는) 필수입력항목입니다.");
                throw new Error();
            }
        });

        const master = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_WORK_TYPE_SUN : gfnma_nvl(jsonDayList[0].WORK_TYPE_CODE),
            V_P_WORK_TYPE_MON : gfnma_nvl(jsonDayList[1].WORK_TYPE_CODE),
            V_P_WORK_TYPE_TUE : gfnma_nvl(jsonDayList[2].WORK_TYPE_CODE),
            V_P_WORK_TYPE_WED : gfnma_nvl(jsonDayList[3].WORK_TYPE_CODE),
            V_P_WORK_TYPE_THU : gfnma_nvl(jsonDayList[4].WORK_TYPE_CODE),
            V_P_WORK_TYPE_FRI : gfnma_nvl(jsonDayList[5].WORK_TYPE_CODE),
            V_P_WORK_TYPE_SAT : gfnma_nvl(jsonDayList[6].WORK_TYPE_CODE),
            V_P_SUN_HOLIDAY_YN : gfnma_nvl(jsonDayList[0].HOLIDAY_YN),
            V_P_MON_HOLIDAY_YN : gfnma_nvl(jsonDayList[1].HOLIDAY_YN),
            V_P_TUE_HOLIDAY_YN : gfnma_nvl(jsonDayList[2].HOLIDAY_YN),
            V_P_WED_HOLIDAY_YN : gfnma_nvl(jsonDayList[3].HOLIDAY_YN),
            V_P_THU_HOLIDAY_YN : gfnma_nvl(jsonDayList[4].HOLIDAY_YN),
            V_P_FRI_HOLIDAY_YN : gfnma_nvl(jsonDayList[5].HOLIDAY_YN),
            V_P_SAT_HOLIDAY_YN : gfnma_nvl(jsonDayList[6].HOLIDAY_YN),
            V_P_SHIFT_SUN : gfnma_nvl(jsonDayList[0].SHIFT_CODE),
            V_P_SHIFT_MON : gfnma_nvl(jsonDayList[1].SHIFT_CODE),
            V_P_SHIFT_TUE : gfnma_nvl(jsonDayList[2].SHIFT_CODE),
            V_P_SHIFT_WED : gfnma_nvl(jsonDayList[3].SHIFT_CODE),
            V_P_SHIFT_THU : gfnma_nvl(jsonDayList[4].SHIFT_CODE),
            V_P_SHIFT_FRI : gfnma_nvl(jsonDayList[5].SHIFT_CODE),
            V_P_SHIFT_SAT : gfnma_nvl(jsonDayList[6].SHIFT_CODE),
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        }

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrb1100Master.do", {
            getType				: 'json',
            workType			: 'N',
            cv_count			: '0',
            params				: gfnma_objectToString(master)
        });
        const masterData = await postJsonPromise;

        try {
            if (_.isEqual("S", masterData.resultStatus)) {
                let updatedData = gvwHoliday.getUpdateData(true, 'all');
                let returnData = [];

                updatedData.forEach((item, index) => {
                    const param = {
                        cv_count: '0',
                        getType: 'json',
                        workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                        params: gfnma_objectToString({
                            V_P_DEBUG_MODE_YN: '',
                            V_P_LANG_ID: '',
                            V_P_COMP_CODE: gv_ma_selectedApcCd,
                            V_P_CLIENT_CODE: gv_ma_selectedClntCd,
                            V_P_YYYY : YYYY,
                            V_P_TXN_ID : gfn_nvl(item.data.TXN_ID) == '' ? 0 : item.data.TXN_ID,
                            V_P_WORK_TYPE_CODE : item.data.WORK_TYPE_CODE,
                            V_P_SHIFT_CODE : item.data.SHIFT_CODE,
                            V_P_START_DAY : item.data.START_DAY,
                            V_P_END_DAY : item.data.END_DAY,
                            V_P_SOLAR_YN : item.data.SOLAR_YN,
                            V_P_LEAP_MONTH_YN : item.data.LEAP_MONTH_YN,
                            V_P_DAY_TITLE : item.data.DAY_TITLE,
                            V_P_HOLIDAY_YN : item.data.HOLIDAY_YN,
                            V_P_HOLIDAY2_YN : item.data.HOLIDAY2_YN,
                            V_P_MEMO : item.data.MEMO,
                            V_P_HOLIDAY_TYPE1_YN : item.data.HOLIDAY_TYPE1_YN,
                            V_P_HOLIDAY_TYPE2_YN : item.data.HOLIDAY_TYPE2_YN,
                            V_P_FORM_ID: p_formId,
                            V_P_MENU_ID: p_menuId,
                            V_P_PROC_ID: '',
                            V_P_USERID: '',
                            V_P_PC: ''
                        })
                    }
                    returnData.push(param);
                });

                if(returnData.length > 0) {
                    const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrb1100Sub.do", {subData: returnData});
                    const subData = await postJsonPromise;

                    try {
                        if (_.isEqual("S", subData.resultStatus)) {
                            fn_search();
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

    const fn_copyPrevYear = async function() {
        let YYYY = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));

        jsonDayList.forEach((item, index) => {
            if(item.WORK_TYPE_CODE == "") {
                alert("근무유형 은(는) 필수입력항목입니다.");
                throw new Error();
            }
        });

        const master = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_YYYY : YYYY,
            V_P_WORK_TYPE_SUN : '',
            V_P_WORK_TYPE_MON : '',
            V_P_WORK_TYPE_TUE : '',
            V_P_WORK_TYPE_WED : '',
            V_P_WORK_TYPE_THU : '',
            V_P_WORK_TYPE_FRI : '',
            V_P_WORK_TYPE_SAT : '',
            V_P_SUN_HOLIDAY_YN : '',
            V_P_MON_HOLIDAY_YN : '',
            V_P_TUE_HOLIDAY_YN : '',
            V_P_WED_HOLIDAY_YN : '',
            V_P_THU_HOLIDAY_YN : '',
            V_P_FRI_HOLIDAY_YN : '',
            V_P_SAT_HOLIDAY_YN : '',
            V_P_SHIFT_SUN : '',
            V_P_SHIFT_MON : '',
            V_P_SHIFT_TUE : '',
            V_P_SHIFT_WED : '',
            V_P_SHIFT_THU : '',
            V_P_SHIFT_FRI : '',
            V_P_SHIFT_SAT : '',
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        }

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrb1100Master.do", {
            getType				: 'json',
            workType			: 'BEFORE',
            cv_count			: '0',
            params				: gfnma_objectToString(master)
        });
        const masterData = await postJsonPromise;

        try {
            if (_.isEqual("S", masterData.resultStatus)) {
                alert(masterData.resultMessage);
                fn_search();
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

    const fn_createCalendar = async function() {
        await fn_save();

        let YYYY = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
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
            workType			: 'CREATE',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {
                alert("달력이 생성되었습니다.");
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

    const fn_reflectChangeCalendar = async function() {
        await fn_save();

        let YYYY = gfnma_nvl(SBUxMethod.get("SRCH_YYYY"));
        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
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
            workType			: 'MODIFY',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {
                alert("달력이 변경되었습니다.");
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

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>