<%
    /**
     * @Class Name 		: hrt1120.jsp
     * @Description 	: 근태항목 정보 화면
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
    <title>title : 근태항목 정보</title>
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
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 60%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">근태집계단위</th>
                    <td class="td_input">
                        <sbux-select id="SRCH_SUMMARY_SCALE" uitype="single" jsondata-ref="jsonSummaryScale" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <th scope="row" class="th_bg">근태분류</th>
                    <td class="td_input">
                        <sbux-select id="SRCH_TIME_CATEGORY" uitype="single" jsondata-ref="jsonTimeCategory" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">근태항목코드</th>
                    <td class="td_input">
                        <sbux-input id="SRCH_TIME_ITEM_CODE" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">근태항목명</th>
                    <td class="td_input">
                        <sbux-input id="SRCH_TIME_ITEM_NAME" class="form-control input-sm" uitype="text" style="width:100%"></sbux-input>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            <div class="row">
                <div>
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>근태항목정보</span>
                            </li>
                        </ul>
                        <div class="ad_tbl_toplist">
                            <sbux-button id="btnClearMode" name="btnClearMode" uitype="normal" text="복사해제모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('clear')"></sbux-button>
                            <sbux-button id="btnLineCopyMode" name="btnLineCopyMode" uitype="normal" text="행복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('line')"></sbux-button>
                            <sbux-button id="btnCellCopyMode" name="btnCellCopyMode" uitype="normal" text="셀복사모드" class="btn btn-sm btn-outline-danger" onclick="fn_toggleMode('cell')"></sbux-button>
                            <sbux-button id="btn_add" name="btn_add" uitype="normal" text="행추가" class="btn btn-sm btn-outline-danger" onclick="fn_addRow" ></sbux-button>
                            <sbux-button id="btn_del" name="btn_del" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_deleteRow"></sbux-button>
                        </div>
                    </div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwInfo" style="height:616px;"></div>
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


    var copyMode            = "clear";

    var jsonSummaryScale    = []; // 근태집계단위
    var jsonTimeCategory    = []; // 근태분류
    var jsonSummaryCodeTime = []; // 시간
    var jsonSummaryCodeCount = []; // 횟수
    var jsonStartEndDayType = []; // 시작/종료일자유형


    //grid 초기화
    var gvwInfo; 			// 그리드를 담기위한 객체 선언

    var jsonDayList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonNeglectOfDutyInfoList = [];

    const fn_initSBSelect = async function() {
        $("#btnClearMode").show();
        $("#btnLineCopyMode").hide();
        $("#btnCellCopyMode").hide();

        let rst = await Promise.all([
            // 집계기준
            gfnma_setComSelect(['SRCH_SUMMARY_SCALE', 'gvwInfo'], jsonSummaryScale, 'L_HRT001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 집계기준
            gfnma_setComSelect(['SRCH_TIME_CATEGORY', 'gvwInfo'], jsonTimeCategory, 'L_HRT024', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            // 시간
            gfnma_setComSelect(['gvwInfo'], jsonSummaryCodeTime, 'L_HRT006', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TIME_SUMMARY_CODE', 'TIME_SUMMARY_NAME', 'Y', ''),
            // 횟수
            gfnma_setComSelect(['gvwInfo'], jsonSummaryCodeCount, 'L_HRT007', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TIME_SUMMARY_CODE', 'TIME_SUMMARY_NAME', 'Y', ''),
            // 시작/종료일자유형
            gfnma_setComSelect(['gvwInfo'], jsonStartEndDayType, 'L_HRT011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TIME_SUMMARY_CODE', 'TIME_SUMMARY_NAME', 'Y', ''),
        ]);
    }

    // 그리드 생성
    function fn_createGvwInfoGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwInfo';
        SBGridProperties.id 				= 'gvwInfo';
        SBGridProperties.jsonref 			= 'jsonNeglectOfDutyInfoList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사

        if (copyMode == 'clear') { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if(copyMode == 'line'){ //행복사모드
            SBGridProperties.selectmode = 'byrow'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.
        } else if(copyMode == 'cell'){ //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }

        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["근태집계코드"], 		ref: 'TIME_CATEGORY',   	    type:'input', style:'text-align:left' ,width: '107px',
                typeinfo: {
                    ref			: 'jsonTimeCategory',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근태항목코드"],         ref: 'TIME_ITEM_CODE',    type:'input',  	width:'90px',  style:'text-align:left'},
            {caption: ["근태항목명"], 	        ref: 'TIME_ITEM_NAME',    	    type:'input',  	width:'150px',  	style:'text-align:left'},
            {caption: ["근태항목약칭"],       ref: 'TIME_ITEM_ABBR_NAME', 		type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["근태시간집계단위"],       ref: 'SUMMARY_SCALE', 		type:'combo',  	width:'124px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSummaryScale',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근무일수조정"],       ref: 'ADJUST_WORK_DAY', 		type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["실근무일수조정"],       ref: 'ADJUST_REAL_WORK_DAY', 		type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["연차일수조정"],       ref: 'ADJUST_ANNUAL_DAY', 		type:'input',  	width:'100px',  	style:'text-align:left'},
            {caption: ["기준근무일수"],       ref: 'BASE_WORK_DAY', 		type:'input',  	width:'75px',  	style:'text-align:left'
                ,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}
            },
            {caption: ["실근무일수"],       ref: 'REAL_WORK_DAY', 		type:'input',  	width:'75px',  	style:'text-align:left'
                ,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}
            },
            {caption: ["휴가일수"],       ref: 'VACATION_DAY', 		type:'input',  	width:'75px',  	style:'text-align:left'
                ,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}
            },
            {caption: ["유급일수"],       ref: 'PAID_DAY', 		type:'input',  	width:'75px',  	style:'text-align:left'
                ,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}
            },
            {caption: ["무급일수"],       ref: 'UNPAID_DAY', 		type:'input',  	width:'75px',  	style:'text-align:left'
                ,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}
            },
            {caption: ["시간"],       ref: 'SUMMARY_CODE_TIME', 		type:'combo',  	width:'135px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSummaryCodeTime',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["횟수"],       ref: 'SUMMARY_CODE_COUNT', 		type:'combo',  	width:'135px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSummaryCodeCount',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["근태집계지정"],       ref: 'SUMMARY_CODE_COUNT', 		type:'combo',  	width:'136px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonSummaryCodeTime',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["메모"],       ref: 'MEMO', 		type:'input',  	width:'180px',  	style:'text-align:left'},
            {caption: ["사용"],       ref: 'USE_YN', 		type:'checkbox',  	width:'80px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["현업입력여부"],       ref: 'INPUT_YN', 		type:'checkbox',  	width:'92px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["근태계획관리대상"],       ref: 'PLAN_YN', 		type:'checkbox',  	width:'107px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["ESS대상"],       ref: 'ESS_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["연차일수"],       ref: 'ANNUAL_DAY', 		type:'input',  	width:'75px',  	style:'text-align:left'
                ,typeinfo : {mask : {alias : 'numeric', unmaskvalue : false}, maxlength : 4}
            },
            {caption: ["근거규정"],       ref: 'BASE_RULE', 		type:'input',  	width:'175px',  	style:'text-align:left'},
            {caption: ["기술직적용"],       ref: 'WORKER_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["일반직적용"],       ref: 'GENERAL_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["시작일자유형"],       ref: 'START_DAY_TYPE', 		type:'combo',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["시작일자시각"],       ref: 'START_HHMM', 		type:'input',  	width:'75px',  	style:'text-align:left'},
            {caption: ["종료일자유형"],       ref: 'END_DAY_TYPE', 		type:'combo',  	width:'75px',  	style:'text-align:left',
                typeinfo: {
                    ref			: 'jsonStartEndDayType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
            },
            {caption: ["종료일자시각"],       ref: 'END_HHMM', 		type:'input',  	width:'75px',  	style:'text-align:left'},
            {caption: ["유급여부"],       ref: 'PAID_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["52시간 여부"],       ref: 'TIME52_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["연장근무여부"],       ref: 'OVERTIME_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["예외여부"],       ref: 'EXCEPT_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["야근근무여부"],       ref: 'NIGHT_TIME_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["근태결과관리"],       ref: 'RESULT_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["대체근무여부"],       ref: 'ALTER_WORK_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["대체근무신청대상"],       ref: 'ALTER_REQ_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {caption: ["교대수당대상"],       ref: 'SHIFT_WORK_YN', 		type:'checkbox',  	width:'75px',  	style:'text-align:center'
                , typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 1 , deletecaption : false }, checkedvalue: 'Y', uncheckedvalue: 'N'}
            }
        ];

        gvwInfo = _SBGrid.create(SBGridProperties);
    }

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_initSBSelect();
        fn_createGvwInfoGrid();
        fn_search();
    });

    // 조회
    function cfn_search() {
        fn_search();
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    const fn_search = async function () {
        let SUMMARY_SCALE = gfnma_nvl(SBUxMethod.get("SRCH_SUMMARY_SCALE"));
        let TIME_CATEGORY = gfnma_nvl(SBUxMethod.get("SRCH_TIME_CATEGORY"));
        let TIME_ITEM_CODE = gfnma_nvl(SBUxMethod.get("SRCH_TIME_ITEM_CODE"));
        let TIME_ITEM_NAME = gfnma_nvl(SBUxMethod.get("SRCH_TIME_ITEM_NAME"));

        var paramObj = {
            V_P_DEBUG_MODE_YN : '',
            V_P_LANG_ID	: '',
            V_P_COMP_CODE : gv_ma_selectedApcCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_SUMMARY_SCALE : SUMMARY_SCALE,
            V_P_TIME_ITEM_CODE : TIME_ITEM_CODE,
            V_P_TIME_ITEM_NAME : TIME_ITEM_NAME,
            V_P_TIME_CATEGORY : TIME_CATEGORY,
            V_P_FORM_ID : p_formId,
            V_P_MENU_ID : p_menuId,
            V_P_PROC_ID : '',
            V_P_USERID : '',
            V_P_PC : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrt/com/selectHrt1120List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {
                jsonNeglectOfDutyInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        TIME_ITEM_CODE : item.TIME_ITEM_CODE,
                        TIME_ITEM_NAME : item.TIME_ITEM_NAME,
                        TIME_ITEM_ABBR_NAME : item.TIME_ITEM_ABBR_NAME,
                        SUMMARY_SCALE : item.SUMMARY_SCALE,
                        SUMMARY_CODE_TIME : item.SUMMARY_CODE_TIME,
                        SUMMARY_CODE_COUNT : item.SUMMARY_CODE_COUNT,
                        ADJUST_WORK_DAY : item.ADJUST_WORK_DAY,
                        ADJUST_REAL_WORK_DAY : item.ADJUST_REAL_WORK_DAY,
                        ADJUST_ANNUAL_DAY : item.ADJUST_ANNUAL_DAY,
                        BASE_WORK_DAY : item.BASE_WORK_DAY,
                        REAL_WORK_DAY : item.REAL_WORK_DAY,
                        ANNUAL_DAY : item.ANNUAL_DAY,
                        VACATION_DAY : item.VACATION_DAY,
                        PAID_DAY : item.PAID_DAY,
                        UNPAID_DAY : item.UNPAID_DAY,
                        MEMO : item.MEMO,
                        USE_YN : item.USE_YN,
                        INPUT_YN : item.INPUT_YN,
                        PLAN_YN : item.PLAN_YN,
                        BASE_RULE : item.BASE_RULE,
                        WORKER_YN : item.WORKER_YN,
                        GENERAL_YN : item.GENERAL_YN,
                        START_DAY_TYPE : item.START_DAY_TYPE,
                        START_HHMM : item.START_HHMM,
                        END_DAY_TYPE : item.END_DAY_TYPE,
                        END_HHMM : item.END_HHMM,
                        TIME_CATEGORY : item.TIME_CATEGORY,
                        PAID_YN : item.PAID_YN,
                        ESS_YN : item.ESS_YN,
                        SUMMARY_ITEM_CODE : item.SUMMARY_ITEM_CODE,
                        TIME52_YN : item.TIME52_YN,
                        OVERTIME_YN : item.OVERTIME_YN,
                        EXCEPT_YN : item.EXCEPT_YN,
                        NIGHT_TIME_YN : item.NIGHT_TIME_YN,
                        RESULT_YN : item.RESULT_YN,
                        ALTER_WORK_YN : item.ALTER_WORK_YN,
                        ALTER_REQ_YN : item.ALTER_REQ_YN,
                        SHIFT_WORK_YN : item.SHIFT_WORK_YN,
                        CLIENT_CODE : item.CLIENT_CODE,
                        COMP_CODE : item.COMP_CODE
                    }
                    jsonNeglectOfDutyInfoList.push(msg);
                });

                gvwInfo.rebuild();
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

    const fn_save = async function () {
        let updatedData = gvwInfo.getUpdateData(true, 'all');
        let listData = [];

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
                    V_P_TIME_ITEM_CODE : gfnma_nvl(item.data.TIME_ITEM_CODE),
                    V_P_TIME_ITEM_NAME : gfnma_nvl(item.data.TIME_ITEM_NAME),
                    V_P_TIME_ITEM_ABBR_NAME : gfnma_nvl(item.data.TIME_ITEM_ABBR_NAME),
                    V_P_SUMMARY_SCALE : gfnma_nvl(item.data.SUMMARY_SCALE),
                    V_P_SUMMARY_CODE_TIME : gfnma_nvl(item.data.SUMMARY_CODE_TIME),
                    V_P_SUMMARY_CODE_COUNT : gfnma_nvl(item.data.SUMMARY_CODE_COUNT),
                    V_P_ADJUST_WORK_DAY : gfnma_nvl(item.data.ADJUST_WORK_DAY),
                    V_P_ADJUST_REAL_WORK_DAY : gfnma_nvl(item.data.ADJUST_REAL_WORK_DAY),
                    V_P_ADJUST_ANNUAL_DAY : gfnma_nvl(item.data.ADJUST_ANNUAL_DAY),
                    V_P_VACATION_DAY : gfnma_nvl(item.data.VACATION_DAY),
                    V_P_PAID_DAY : gfnma_nvl(item.data.PAID_DAY),
                    V_P_UNPAID_DAY : gfnma_nvl(item.data.UNPAID_DAY),
                    V_P_BASE_WORK_DAY : gfnma_nvl(item.data.BASE_WORK_DAY),
                    V_P_REAL_WORK_DAY : gfnma_nvl(item.data.REAL_WORK_DAY),
                    V_P_ANNUAL_DAY : gfnma_nvl(item.data.ANNUAL_DAY),
                    V_P_MEMO : gfnma_nvl(item.data.MEMO),
                    V_P_USE_YN : gfnma_nvl(item.data.USE_YN),
                    V_P_INPUT_YN : gfnma_nvl(item.data.INPUT_YN),
                    V_P_PLAN_YN : gfnma_nvl(item.data.PLAN_YN),
                    V_P_BASE_RULE : gfnma_nvl(item.data.BASE_RULE),
                    V_P_WORKER_YN : gfnma_nvl(item.data.WORKER_YN),
                    V_P_GENERAL_YN : gfnma_nvl(item.data.GENERAL_YN),
                    V_P_START_DAY_TYPE : gfnma_nvl(item.data.START_DAY_TYPE),
                    V_P_START_HHMM : gfnma_nvl(item.data.START_HHMM),
                    V_P_END_DAY_TYPE : gfnma_nvl(item.data.END_DAY_TYPE),
                    V_P_END_HHMM : gfnma_nvl(item.data.END_HHMM),
                    V_P_TIME_CATEGORY : gfnma_nvl(item.data.TIME_CATEGORY),
                    V_P_PAID_YN : gfnma_nvl(item.data.PAID_YN),
                    V_P_ESS_YN : gfnma_nvl(item.data.ESS_YN),
                    V_P_SUMMARY_ITEM_CODE : gfnma_nvl(item.data.SUMMARY_ITEM_CODE),
                    V_P_TIME52_YN : gfnma_nvl(item.data.TIME52_YN),
                    V_P_OVERTIME_YN : gfnma_nvl(item.data.OVERTIME_YN),
                    V_P_EXCEPT_YN : gfnma_nvl(item.data.EXCEPT_YN),
                    V_P_NIGHT_TIME_YN : gfnma_nvl(item.data.NIGHT_TIME_YN),
                    V_P_RESULT_YN : gfnma_nvl(item.data.RESULT_YN),
                    V_P_ALTER_WORK_YN : gfnma_nvl(item.data.ALTER_WORK_YN),
                    V_P_ALTER_REQ_YN : gfnma_nvl(item.data.ALTER_REQ_YN),
                    V_P_SHIFT_WORK_YN : gfnma_nvl(item.data.SHIFT_WORK_YN),
                    V_P_FORM_ID: p_formId,
                    V_P_MENU_ID: p_menuId,
                    V_P_PROC_ID: '',
                    V_P_USERID: '',
                    V_P_PC: ''
                })
            }
            listData.push(param);
        });
        console.log(listData);
        if(listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrt/com/insertHrt1120List.do", {listData: listData});

            const data = await postJsonPromise;
            console.log('data:', data);
            try {
                if (_.isEqual("S", data.resultStatus)) {
                    alert(data.resultMessage);
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
    }

    // 행추가
    const fn_addRow = async function () {
        let rowVal = gvwInfo.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.
            gvwInfo.addRow(true, { USE_YN: 'Y' });
        }else{
            gvwInfo.insertRow(rowVal);
        }
    }

    // 행삭제
    const fn_deleteRow = async function () {
        let rowVal = gvwInfo.getRow();
        if (rowVal == -1) {
            gfn_comAlert("W0003", "행 삭제");         // W0003   {0}할 대상이 없습니다.
            return;
        } else {
            gvwInfo.deleteRow(rowVal);
        }
    }

    // 복사모드토글
    const fn_toggleMode = async function (mode) {
        if(mode == "clear") {
            $("#btnClearMode").hide();
            $("#btnLineCopyMode").show();
            $("#btnCellCopyMode").hide();
            copyMode = "line";
        } else if(mode == "line") {
            $("#btnClearMode").hide();
            $("#btnLineCopyMode").hide();
            $("#btnCellCopyMode").show();
            copyMode = "cell";
        } else if (mode == "cell") {
            $("#btnClearMode").show();
            $("#btnLineCopyMode").hide();
            $("#btnCellCopyMode").hide();
            copyMode = "clear";
        }

        _SBGrid.destroy('gvwInfo');
        fn_createGvwInfoGrid();
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>