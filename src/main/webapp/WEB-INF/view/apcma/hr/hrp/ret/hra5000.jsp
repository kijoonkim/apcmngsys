<%
    /**
     * @Class Name        : hra5000.jsp
     * @Description       : 퇴직정산기준 등록 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.07.11
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.11   	표주완		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 퇴직정산기준 등록</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>

    <title>Calculator</title>
    <link rel="stylesheet" href="/resource/css/ma_custom.css">
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
                <sbux-button id="btnCopy" name="btnCopy" uitype="normal" text="전년도 자료복사"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnCopy"></sbux-button>
            </div>
        </div>

        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <table id="dataArea1" class="table table-bordered tbl_fixed">
            <caption>검색 조건 설정</caption>
            <colgroup>
                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 6%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 6%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 6%">
                <col style="width: 3%">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row" class="th_bg">기준년도</th>
                <td colspan="11" class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-ye_tx_yyyy"
                            name="srch-ye_tx_yyyy"
                            uitype="popup"
                            datepicker-mode="year"
                            date-format="yyyy"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            required>
                        <%--onchange="fn_payDate"--%>
                    </sbux-datepicker>
                </td>
            </tr>
            </tbody>
        </table>


        <div class="row">
            <div class="col-sm-4">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>기준년도별 퇴직기준정보</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwMaster" style="height:610px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-8">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>퇴직정산 기준정보</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <table id="dataArea2" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:6%">
                            <col style="width:2%">

                            <col style="width:5%">
                            <col style="width:6%">
                            <col style="width:0.5%">
                            <col style="width:6%">
                            <col style="width:2%">

                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">기준년도</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="YYYY"
                                        name="YYYY"
                                        uitype="popup"
                                        datepicker-mode="year"
                                        date-format="yyyy"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        required>
                                    <%--onchange="fn_payDate"--%>
                                </sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">적용기간</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="APPLY_START_DATE"
                                        name="APPLY_START_DATE"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                        style="width:100%;"
                                />
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <span> ~ </span>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-datepicker
                                        uitype="popup"
                                        id="APPLY_END_DATE"
                                        name="APPLY_END_DATE"
                                        date-format="yyyy-mm-dd"
                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                        style="width:100%;"
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">기본공제</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="RETIRE_INCOME_DED_RATE" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm inpt_data_reqed"
                                            mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }">
                                </sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <span> % </span>
                            </td>
                            <th scope="row" class="th_bg">임원지급배수</th>
                            <td colspan="" class="td_input" style="border-right:hidden;">
                                <sbux-input id="EXECUTIVE_PAY_MULTIPLE" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm inpt_data_reqed"
                                            mask = "{ 'alias': 'decimal' , 'digits': 2, 'radixPoint': '.', 'autoFillDigits': true }">
                                </sbux-input>
                            </td>
                            <td class="td_input" style="border-right:hidden;">
                                <span> % </span>
                            </td>
                            <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">메모</th>
                            <td colspan="7" class="td_input">
                                <sbux-textarea id="MEMO" <%--rows="3" --%>class="form-control input-sm" uitype="normal" style="width:100%"></sbux-textarea>
                            </td>
                        </tr>
                    </table>
                </div>

                <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
                </sbux-tabs>

                <div class="tab-content">
                    <div id="detailTab" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>근속연수공제</span>
                                </li>
                            </ul>
                            <div class="ad_tbl_toplist">
                                <sbux-button
                                        id="detailDel"
                                        name="detailDel"
                                        uitype="normal"
                                        text="행삭제"
                                        class="btn btn-sm btn-outline-danger"
                                        onclick="fn_detailDelRow"
                                        style="float: right;"
                                >
                                </sbux-button>
                                <sbux-button
                                        id="detailAdd"
                                        name="detailAdd"
                                        uitype="normal"
                                        text="행추가"
                                        class="btn btn-sm btn-outline-danger"
                                        onclick="fn_detailAddRow"
                                        style="float: right;"
                                ></sbux-button>
                            </div>
                        </div>
                        <div>
                            <div id="sb-area-gvwDetail" style="height:410px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="dayTab" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>누진일수</span>
                                </li>
                            </ul>
                            <div class="ad_tbl_toplist">
                                <sbux-button
                                        id="dayDel"
                                        name="dayDel"
                                        uitype="normal"
                                        text="행삭제"
                                        class="btn btn-sm btn-outline-danger"
                                        onclick="fn_dayDelRow"
                                        style="float: right;"
                                >
                                </sbux-button>
                                <sbux-button
                                        id="dayAdd"
                                        name="dayAdd"
                                        uitype="normal"
                                        text="행추가"
                                        class="btn btn-sm btn-outline-danger"
                                        onclick="fn_dayAddRow"
                                        style="float: right;"
                                ></sbux-button>
                            </div>
                        </div>
                        <div>
                            <div id="sb-area-gvwDay" style="height:410px; width:100%;"></div>
                        </div>
                    </div>
                    <div id="convertTab" >
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li>
                                    <span>환산급여</span>
                                </li>
                            </ul>
                            <div class="ad_tbl_toplist">
                                <sbux-button
                                        id="convertDel"
                                        name="convertDel"
                                        uitype="normal"
                                        text="행삭제"
                                        class="btn btn-sm btn-outline-danger"
                                        onclick="fn_convertDelRow"
                                        style="float: right;"
                                >
                                </sbux-button>
                                <sbux-button
                                        id="convertAdd"
                                        name="convertAdd"
                                        uitype="normal"
                                        text="행추가"
                                        class="btn btn-sm btn-outline-danger"
                                        onclick="fn_convertAddRow"
                                        style="float: right;"
                                ></sbux-button>
                            </div>
                        </div>
                        <div>
                            <div id="sb-area-gvwConvertIncome" style="height:410px; width:100%;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    var editType			= 'N';

    //grid 초기화
    var gvwInfoGrid; 			// 그리드를 담기위한 객체 선언
    var jsonInfoList = []; 	    // 그리드의 참조 데이터 주소 선언
    var gvwDetailGrid;
    var jsonDetailList = [];
    var gvwDayGrid;
    var jsonDayList = [];
    var gvwConvertGrid;
    var jsonConvertList = [];


    var tabJsonData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "근속연수공제",     "targetid" : "detailTab" ,   "targetvalue" : "근속연수공제"},
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "누진일수"   ,     "targetid" : "dayTab"     ,  "targetvalue" : "누진일수"},
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "환산급여"   ,     "targetid" : "convertTab" ,  "targetvalue" : "환산급여"}
    ];

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_init();

    });

    const fn_init = async function () {

        SBUxMethod.attr('YYYY',	'readonly', true);

        fn_createGrid();
        fn_createDetailGrid();
        fn_createDayGrid();
        fn_createConvertGrid();

        fn_search();
    }

    // 신규
      function cfn_add() {
          fn_add();
      }
     // 저장
    function cfn_save() {

        //저장 성고 : 실패 구분
        let complateCode = true;

        if (_.isEqual(editType, "N")) {
            // 수정 저장
            if (gfn_comConfirm("Q0001", "신규 등록")) {

                complateCode = fn_save('N');

                //근속연수공제
                let detailData = gvwDetailGrid.getUpdateData(true, 'all');
                if (_.isEmpty(detailData) == false){
                    complateCode = fn_saveS1(detailData);
                }
                //누진일수
                let dayData = gvwDayGrid.getUpdateData(true, 'all');
                if (_.isEmpty(dayData) == false){
                    complateCode = fn_saveS2(dayData);
                }
                //환산급여
                let convertData = gvwConvertGrid.getUpdateData(true, 'all');
                if (_.isEmpty(convertData) == false){
                    complateCode = fn_saveS3(convertData);
                }

            }
        } else if (_.isEqual(editType, "U")) {
            // 수정 저장
            if (gfn_comConfirm("Q0001", "수정 저장")) {

                complateCode = fn_save('U');

                //근속연수공제
                let detailData = gvwDetailGrid.getUpdateData(true, 'all');
                if (_.isEmpty(detailData) == false){
                    complateCode = fn_saveS1(detailData);
                }
                //누진일수
                let dayData = gvwDayGrid.getUpdateData(true, 'all');
                if (_.isEmpty(dayData) == false){
                    complateCode = fn_saveS2(dayData);
                }
                //환산급여
                let convertData = gvwConvertGrid.getUpdateData(true, 'all');
                if (_.isEmpty(convertData) == false){
                    complateCode = fn_saveS3(convertData);
                }
            }
        }

        if (complateCode){
            gfn_comAlert("I0001"); // I0001	처리 되었습니다.
            fn_search();
        }

    }
    // 삭제
    function cfn_del() {
        fn_del();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }


    //기준년도별 퇴직기준정보 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwMaster';
        SBGridProperties.id = 'gvwMasterGrid';
        SBGridProperties.jsonref = 'jsonMasterList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['기준년도'], ref: 'YYYY', width:'170px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy', origin:'yyyy'}, disabled: true},
            {caption: ['적용시작일'], ref: 'APPLY_START_DATE', width:'170px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ['적용종료일'], ref: 'APPLY_END_DATE', width:'170px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["퇴직소득공제율"], ref: 'RETIRE_INCOME_DED_RATE', type: 'output', width: '170px', style: 'text-align:right', hidden: true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,##' }},
            {caption: ["임원지급배수"], ref: 'EXECUTIVE_PAY_MULTIPLE', type: 'output', width: '170px', style: 'text-align:right', hidden: true
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,##' }},
            {caption: ["메모"], ref: 'MEMO', type: 'output', width: '170px', style: 'text-align:left'},
        ];

        gvwMasterGrid = _SBGrid.create(SBGridProperties);
        gvwMasterGrid.bind('click', 'fn_view')
    }

    //근속연수공제 리스트
    function fn_createDetailGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwDetail';
        SBGridProperties.id = 'gvwDetailGrid';
        SBGridProperties.jsonref = 'jsonDetailList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["근속년수하한(초과)"], ref: 'WORK_YEAR_FR', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["근속년수상한(이하)"], ref: 'WORK_YEAR_TO', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["근속공제액"], ref: 'CUMULATIVE_TAX_DED_AMT', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["최대치"], ref: 'MAX_AMT', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값

        ];

        gvwDetailGrid = _SBGrid.create(SBGridProperties);
    }

    //누진일수 리스트
    function fn_createDayGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwDay';
        SBGridProperties.id = 'gvwDayGrid';
        SBGridProperties.jsonref = 'jsonDayList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["근속년수하한(초과)"], ref: 'WORK_YEAR_FROM', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["근속년수상한(이하)"], ref: 'WORK_YEAR_TO', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["누진일수"], ref: 'CUMULATIVE_DAY_CNT', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값
        ];

        gvwDayGrid = _SBGrid.create(SBGridProperties);

    }

    //환산급여 리스트
    function fn_createConvertGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwConvertIncome';
        SBGridProperties.id = 'gvwConvertGrid';
        SBGridProperties.jsonref = 'jsonConvertList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["환산급여 하한(초과)"], ref: 'PAY_AMT_FR', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["환산급여 상한(이상)"], ref: 'PAY_AMT_TO', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["공제세율(%)"], ref: 'TX_R', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,##0.00' }},
            {caption: ["누진공제액"], ref: 'CUMULATIVE_TAX_DED_AMT', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'}//스타일상 빈값
        ];

        gvwConvertGrid = _SBGrid.create(SBGridProperties);

    }


    // 근속연수공제 행 추가
    const fn_detailAddRow = function () {

        let rowVal = gvwDetailGrid.getRow();

        const msg = {
            WORK_YEAR_FR                : 0,
            WORK_YEAR_TO                : 0,
            CUMULATIVE_TAX_DED_AMT      : 0,
            MAX_AMT                     : 0,

            status: 'i'
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwDetailGrid.addRow(true, msg);
        }else{
            gvwDetailGrid.insertRow(rowVal, 'below', msg);
        }
        //grdFimList.refresh();
    }

    // 근속연수공제 행삭제
    const fn_detailDelRow = async function () {

        let rowVal = gvwDetailGrid.getRow();

        if (rowVal == -1) {

            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwDetailGrid.deleteRow(rowVal);
        }
    }

    // 누진일수 행 추가
    const fn_dayAddRow = function () {

        let rowVal = gvwDayGrid.getRow();

        const msg = {
            WORK_YEAR_FROM          : 0,
            WORK_YEAR_TO            : 0,
            CUMULATIVE_DAY_CNT      : 0,


            status: 'i'
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwDayGrid.addRow(true, msg);
        }else{
            gvwDayGrid.insertRow(rowVal, 'below', msg);
        }
        //grdFimList.refresh();
    }

    // 누진일수 행삭제
    const fn_dayDelRow = async function () {

        let rowVal = gvwDayGrid.getRow();

        if (rowVal == -1) {

            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwDayGrid.deleteRow(rowVal);
        }
    }

    // 환산급여 행 추가
    const fn_convertAddRow = function () {
        let rowVal = gvwConvertGrid.getRow();

        const msg = {
            PAY_AMT_FR          : 0,
            PAY_AMT_TO            : 0,
            TX_R      : 0,
            CUMULATIVE_TAX_DED_AMT      : 0,

            status: 'i'
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwConvertGrid.addRow(true, msg);
        }else{
            gvwConvertGrid.insertRow(rowVal, 'below', msg);
        }
        //grdFimList.refresh();
    }

    // 환산급여 행삭제
    const fn_convertDelRow = async function () {

        let rowVal = gvwConvertGrid.getRow();

        if (rowVal == -1) {

            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {
            gvwConvertGrid.deleteRow(rowVal);
        }
    }

    /**
     * 목록 조회
     */
    const fn_search = async function (/*tabMoveVal*/) {

        let YE_TX_YYYY = gfnma_nvl(SBUxMethod.get("srch-ye_tx_yyyy")); //기준년도

        /*if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "기준년도");
            return;
        }*/

        var paramObj = {
            V_P_DEBUG_MODE_YN   : ''
            ,V_P_LANG_ID        : ''
            ,V_P_COMP_CODE      : gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE    : gv_ma_selectedClntCd

            ,V_P_YYYY           : YE_TX_YYYY

            ,V_P_FORM_ID        : p_formId
            ,V_P_MENU_ID        : p_menuId
            ,V_P_PROC_ID        : ''
            ,V_P_USERID         : ''
            ,V_P_PC             : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/ret/selectHra5000List.do", {
            getType				: 'json',
            workType			: 'MASTER',
            cv_count			: '4',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {


                /** @type {number} **/
                let totalRecordCount = 0;

                jsonMasterList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        YYYY 			        : gfnma_nvl(item.YYYY),
                        APPLY_START_DATE 	    : gfnma_nvl(item.APPLY_START_DATE),
                        APPLY_END_DATE 			: gfnma_nvl(item.APPLY_END_DATE),
                        RETIRE_INCOME_DED_RATE 	: gfnma_nvl(item.RETIRE_INCOME_DED_RATE),
                        EXECUTIVE_PAY_MULTIPLE 	: gfnma_nvl(item.EXECUTIVE_PAY_MULTIPLE),
                        MEMO 			        : gfnma_nvl(item.MEMO),
                    }
                    jsonMasterList.push(msg);
                    totalRecordCount ++;
                });

                gvwMasterGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if(jsonMasterList.length > 0) {
                    gvwMasterGrid.clickRow(1);
                }
                //fn_view();


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
    async function fn_view() {

        editType = 'U';

        gfnma_uxDataClear('#dataArea2');

        jsonDetailList.length = 0;
        gvwDetailGrid.rebuild();

        jsonDayList.length = 0;
        gvwDayGrid.rebuild();

        jsonConvertList.length = 0;
        gvwConvertGrid.rebuild();

        let nCol = gvwMasterGrid.getCol();
        let nRow = gvwMasterGrid.getRow();

        if (nCol == -1) {
            return;
        }
        if (nRow == -1) {
            return;
        }

        let rowData = gvwMasterGrid.getRowData(nRow);

        if (!_.isEmpty(rowData)) {

            gfnma_uxDataSet('#dataArea2', rowData);

            var paramObj = {
                V_P_DEBUG_MODE_YN   : ''
                ,V_P_LANG_ID        : ''
                ,V_P_COMP_CODE      : gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE    : gv_ma_selectedClntCd

                ,V_P_YYYY           : rowData.YYYY

                ,V_P_FORM_ID        : p_formId
                ,V_P_MENU_ID        : p_menuId
                ,V_P_PROC_ID        : ''
                ,V_P_USERID         : ''
                ,V_P_PC             : ''
            };


            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/selectHra5000List.do", {
                getType				: 'json',
                workType			: 'DETAIL',
                cv_count			: '4',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    jsonDetailList.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            WORK_YEAR_FR		    : gfnma_nvl(item.WORK_YEAR_FR),
                            WORK_YEAR_TO		    : gfnma_nvl(item.WORK_YEAR_TO),
                            CUMULATIVE_TAX_DED_AMT	: gfnma_nvl(item.CUMULATIVE_TAX_DED_AMT),
                            MAX_AMT		            : gfnma_nvl(item.MAX_AMT),

                        }
                        jsonDetailList.push(msg);
                    });

                    gvwDetailGrid.rebuild();

                    if (jsonDetailList.length > 0){
                        jsonDetailList.forEach((item, index) => {
                            gvwDetailGrid.setCellDisabled(index+1, 0, index+1, 1, true, false, true);
                        })
                    }

                    jsonDayList.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            YYYY		        : gfnma_nvl(item.YYYY),
                            WORK_YEAR_FROM		: gfnma_nvl(item.WORK_YEAR_FROM),
                            WORK_YEAR_TO		: gfnma_nvl(item.WORK_YEAR_TO),
                            CUMULATIVE_DAY_CNT	: gfnma_nvl(item.CUMULATIVE_DAY_CNT),

                        }
                        jsonDayList.push(msg);
                    });

                    gvwDayGrid.rebuild();

                    jsonConvertList.length = 0;
                    data.cv_4.forEach((item, index) => {
                        const msg = {
                            YYYY		        : gfnma_nvl(item.YYYY),
                            PAY_AMT_FR		: gfnma_nvl(item.PAY_AMT_FR),
                            PAY_AMT_TO		: gfnma_nvl(item.PAY_AMT_TO),
                            TX_R		: gfnma_nvl(item.TX_R),
                            CUMULATIVE_TAX_DED_AMT	: gfnma_nvl(item.CUMULATIVE_TAX_DED_AMT),

                        }
                        jsonConvertList.push(msg);
                    });

                    gvwConvertGrid.rebuild();


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

    //신규 작성
    function fn_add() {
        editType = 'N';

        SBUxMethod.attr('YYYY',	'readonly', false);

        gfnma_uxDataClear('#dataArea2');

        jsonDetailList.length = 0
        gvwDetailGrid.rebuild();

        jsonDayList.length = 0
        gvwDayGrid.rebuild();

        jsonConvertList.length = 0
        gvwConvertGrid.rebuild();
    }

    //저장
    const fn_save = async function (workType) {

        let YYYY 			        = gfnma_nvl(SBUxMethod.get("YYYY"));//기준년도
        let APPLY_START_DATE 		= gfnma_nvl(SBUxMethod.get("APPLY_START_DATE"));//적용기간
        let APPLY_END_DATE 			= gfnma_nvl(SBUxMethod.get("APPLY_END_DATE"));//적용기간
        let RETIRE_INCOME_DED_RATE 	= gfnma_nvl(SBUxMethod.get("RETIRE_INCOME_DED_RATE"));//기본공제
        let EXECUTIVE_PAY_MULTIPLE 	= gfnma_nvl(SBUxMethod.get("EXECUTIVE_PAY_MULTIPLE"));//임원지급배수
        let MEMO 			        = gfnma_nvl(SBUxMethod.get("MEMO"));//메모

        if (!YYYY) {
            gfn_comAlert("W0002", "기준년도");
            return;
        }
        if (!APPLY_START_DATE) {
            gfn_comAlert("W0002", "적용기간");
            return;
        }
        if (!APPLY_END_DATE) {
            gfn_comAlert("W0002", "적용기간");
            return;
        }
        if (!RETIRE_INCOME_DED_RATE) {
            gfn_comAlert("W0002", "기본공제");
            return;
        }
        if (!EXECUTIVE_PAY_MULTIPLE) {
            gfn_comAlert("W0002", "임원지급배수");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN			: ''
            ,V_P_LANG_ID				: ''
            ,V_P_COMP_CODE				: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

            ,V_P_YYYY                   : YYYY
            ,V_P_APPLY_ST_DAT           : APPLY_START_DATE
            ,V_P_APPLY_END_DAT          : APPLY_END_DATE
            ,V_P_RETIRE_INCOME_DER      : RETIRE_INCOME_DED_RATE
            ,V_P_EXECUTIVE_PAY_MULTIPLE : EXECUTIVE_PAY_MULTIPLE
            ,V_P_MEMO                   : MEMO

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''

        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5000.do", {
            getType: 'json',
            workType: workType,
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (data.resultMessage) {
                    alert(data.resultMessage);

                    return false;
                }else{
                    return true;
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

    //근속연수 공제 저장
    const fn_saveS1 = async function (updateData) {

        let listData = [];
        listData =  await getParamFormS1(updateData);

        if (listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5000S1.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    if (data.resultMessage) {
                        alert(data.resultMessage);
                        return false;
                    }else{
                        return true;
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

    //근속연수 공제 저장 ParamForm
    const getParamFormS1 = async function(updateData){

        let returnData = [];

        let YYYY 	= gfnma_nvl(SBUxMethod.get("YYYY"));//기준년도

        updateData.forEach((item, index) => {

            const param = {

                cv_count: '0',
                getType: 'json',
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({

                    V_P_DEBUG_MODE_YN   : ''
                    , V_P_LANG_ID       : ''
                    , V_P_COMP_CODE     : gv_ma_selectedApcCd
                    , V_P_CLIENT_CODE   : gv_ma_selectedClntCd

                    ,V_P_YYYY                   : YYYY
                    ,V_P_WORK_YEAR_FR           : item.data.WORK_YEAR_FR
                    ,V_P_WORK_YEAR_TO           : item.data.WORK_YEAR_TO
                    ,V_P_CUMULATIVE_TAX_DED_AMT : item.data.CUMULATIVE_TAX_DED_AMT
                    ,V_P_MAX_AMT                : item.data.MAX_AMT

                    , V_P_FORM_ID       : p_formId
                    , V_P_MENU_ID       : p_menuId
                    , V_P_PROC_ID       : ''
                    , V_P_USERID        : ''
                    , V_P_PC            : ''

                })
            }
            returnData.push(param);
        });

        return  returnData;
    }

    //누진일수 공제 저장
    const fn_saveS2 = async function (updateData) {

        let listData = [];
        listData =  await getParamFormS2(updateData);

        if (listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5000S2.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    if (data.resultMessage) {
                        alert(data.resultMessage);
                        return false;
                    }else{
                        return true;
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

    //누진일수 공제 저장 ParamForm
    const getParamFormS2 = async function(updateData){

        let returnData = [];

        let YYYY 	= gfnma_nvl(SBUxMethod.get("YYYY"));//기준년도

        updateData.forEach((item, index) => {

            const param = {

                cv_count: '0',
                getType: 'json',
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({

                    V_P_DEBUG_MODE_YN   : ''
                    , V_P_LANG_ID       : ''
                    , V_P_COMP_CODE     : gv_ma_selectedApcCd
                    , V_P_CLIENT_CODE   : gv_ma_selectedClntCd

                    ,V_P_YYYY               : YYYY
                    ,V_P_WORK_YEAR_FROM     : item.data.WORK_YEAR_FROM
                    ,V_P_WORK_YEAR_TO       : item.data.WORK_YEAR_TO
                    ,V_P_CUMULATIVE_DAY_CNT : item.data.CUMULATIVE_DAY_CNT

                    , V_P_FORM_ID       : p_formId
                    , V_P_MENU_ID       : p_menuId
                    , V_P_PROC_ID       : ''
                    , V_P_USERID        : ''
                    , V_P_PC            : ''

                })
            }
            returnData.push(param);
        });

        return  returnData;
    }

    //환산급여 공제 저장
    const fn_saveS3 = async function (updateData) {

        let listData = [];
        listData =  await getParamFormS3(updateData);

        if (listData.length > 0) {
            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5000S3.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    if (data.resultMessage) {
                        alert(data.resultMessage);
                        return false;
                    }else{
                        return true;
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

    //환산급여 공제 저장 ParamForm
    const getParamFormS3 = async function(updateData){

        let returnData = [];

        let YYYY 	= gfnma_nvl(SBUxMethod.get("YYYY"));//기준년도

        updateData.forEach((item, index) => {

            const param = {

                cv_count: '0',
                getType: 'json',
                workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({

                    V_P_DEBUG_MODE_YN   : ''
                    , V_P_LANG_ID       : ''
                    , V_P_COMP_CODE     : gv_ma_selectedApcCd
                    , V_P_CLIENT_CODE   : gv_ma_selectedClntCd

                    ,V_P_YYYY                   : YYYY
                    ,V_P_PAY_AMT_FR             : item.data.PAY_AMT_FR
                    ,V_P_PAY_AMT_TO             : item.data.PAY_AMT_TO
                    ,V_P_TX_R                   : item.data.TX_R
                    ,V_P_CUMULATIVE_TAX_DED_AMT : item.data.CUMULATIVE_TAX_DED_AMT

                    , V_P_FORM_ID       : p_formId
                    , V_P_MENU_ID       : p_menuId
                    , V_P_PROC_ID       : ''
                    , V_P_USERID        : ''
                    , V_P_PC            : ''

                })
            }
            returnData.push(param);
        });

        return  returnData;
    }

    //삭제
    const fn_del = async function () {

        if (gfn_comConfirm("Q0001", "삭제")) {

            let YYYY 			        = gfnma_nvl(SBUxMethod.get("YYYY"));//기준년도
            let APPLY_START_DATE 		= gfnma_nvl(SBUxMethod.get("APPLY_START_DATE"));//적용기간
            let APPLY_END_DATE 			= gfnma_nvl(SBUxMethod.get("APPLY_END_DATE"));//적용기간
            let RETIRE_INCOME_DED_RATE 	= gfnma_nvl(SBUxMethod.get("RETIRE_INCOME_DED_RATE"));//기본공제
            let EXECUTIVE_PAY_MULTIPLE 	= gfnma_nvl(SBUxMethod.get("EXECUTIVE_PAY_MULTIPLE"));//임원지급배수
            let MEMO 			        = gfnma_nvl(SBUxMethod.get("MEMO"));//메모

            if (!YYYY) {
                gfn_comAlert("W0002", "기준년도");
                return;
            }

            var paramObj = {
                V_P_DEBUG_MODE_YN			: ''
                ,V_P_LANG_ID				: ''
                ,V_P_COMP_CODE				: gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

                ,V_P_YYYY                   : YYYY
                ,V_P_APPLY_ST_DAT           : APPLY_START_DATE
                ,V_P_APPLY_END_DAT          : APPLY_END_DATE
                ,V_P_RETIRE_INCOME_DER      : RETIRE_INCOME_DED_RATE
                ,V_P_EXECUTIVE_PAY_MULTIPLE : EXECUTIVE_PAY_MULTIPLE
                ,V_P_MEMO                   : MEMO

                ,V_P_FORM_ID: p_formId
                ,V_P_MENU_ID: p_menuId
                ,V_P_PROC_ID: ''
                ,V_P_USERID: ''
                ,V_P_PC: ''

            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5000.do", {
                getType: 'json',
                workType: 'D',
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }else{
                        fn_search();
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


    //전년도 자료복사 버튼 클릭
    const fn_btnCopy = async function () {
        if (gfn_comConfirm("Q0001", "전년도 자료복사")) {

            let YYYY 			        = gfnma_nvl(SBUxMethod.get("YYYY"));//기준년도
            let APPLY_START_DATE 		= gfnma_nvl(SBUxMethod.get("APPLY_START_DATE"));//적용기간
            let APPLY_END_DATE 			= gfnma_nvl(SBUxMethod.get("APPLY_END_DATE"));//적용기간
            let RETIRE_INCOME_DED_RATE 	= gfnma_nvl(SBUxMethod.get("RETIRE_INCOME_DED_RATE"));//기본공제
            let EXECUTIVE_PAY_MULTIPLE 	= gfnma_nvl(SBUxMethod.get("EXECUTIVE_PAY_MULTIPLE"));//임원지급배수
            let MEMO 			        = gfnma_nvl(SBUxMethod.get("MEMO"));//메모

            if (!YYYY) {
                gfn_comAlert("W0002", "기준년도");
                return;
            }
           /* if (!APPLY_START_DATE) {
                gfn_comAlert("W0002", "적용기간");
                return;
            }
            if (!APPLY_END_DATE) {
                gfn_comAlert("W0002", "적용기간");
                return;
            }
            if (!RETIRE_INCOME_DED_RATE) {
                gfn_comAlert("W0002", "기본공제");
                return;
            }
            if (!EXECUTIVE_PAY_MULTIPLE) {
                gfn_comAlert("W0002", "임원지급배수");
                return;
            }*/

            var paramObj = {
                V_P_DEBUG_MODE_YN			: ''
                ,V_P_LANG_ID				: ''
                ,V_P_COMP_CODE				: gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

                ,V_P_YYYY                   : YYYY
                ,V_P_APPLY_ST_DAT           : ''
                ,V_P_APPLY_END_DAT          : ''
                ,V_P_RETIRE_INCOME_DER      : ''
                ,V_P_EXECUTIVE_PAY_MULTIPLE : ''
                ,V_P_MEMO                   : ''


                ,V_P_FORM_ID: p_formId
                ,V_P_MENU_ID: p_menuId
                ,V_P_PROC_ID: ''
                ,V_P_USERID: ''
                ,V_P_PC: ''

            };


            const postJsonPromise = gfn_postJSON("/hr/hrp/ret/insertHra5000.do", {
                getType: 'json',
                workType: 'BEFORE',
                cv_count: '0',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;


            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }else{
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        fn_search();
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

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
