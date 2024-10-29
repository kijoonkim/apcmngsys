<%
    /**
     * @Class Name        : hrw5100.jsp
     * @Description       : 국민연금 내역 관리 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.06.27
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.27   	표주완		최초 생성
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
    <title>title : 국민연금 내역 관리 정보</title>
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
                </h3><!-- 국민연금 내역 관리 -->
            </div>
        </div>
        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
        </sbux-tabs>
        <div class="tab-content">
            <div id="tabInfo1">
                <div style="padding-bottom: 10px">
                    <table id="dataArea1" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:6%">
                            <col style="width:6%">
                            <col style="width:1%">

                            <col style="width:6%">
                            <col style="width:6%">
                            <col style="width:1%">

                            <col style="width:6%">
                            <col style="width:6%">
                            <col style="width:6%">
                            <col style="width:3%">
                            <col style="width:1%">

                            <col style="width:6%">
                            <col style="width:6%">
                            <col style="width:6%">
                            <col style="width:3%">
                            <col style="width:1%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">보험년월</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="SRCH_YYYYMM_FR"
                                        name="SRCH_YYYYMM_FR"
                                        uitype="popup"
                                        datepicker-mode="month"
                                        date-format="yyyymm"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        required>
                                    <%--onchange="fn_payDate"--%>
                                </sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;"></td>

                            <th scope="row" class="th_bg">지급구분</th>
                            <td class="td_input">
                                <sbux-select
                                        id="SRCH_PAY_AREA_TYPE"
                                        uitype="single"
                                        jsondata-ref="jsonPayAreaType"
                                        unselected-text="선택"
                                        class="form-control input-sm inpt_data_reqed"
                                        onchange="fn_payType">
                                </sbux-select>
                            </td>
                            <td style="border-right: hidden;"></td>

                            <th scope="row" class="th_bg">부서</th>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                                <sbux-input
                                        uitype="text"
                                        id="DEPT_CODE"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="DEPT_NAME"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" data-group="DEPT">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup1"
                                ></sbux-button>
                            </td>

                            <th scope="row" class="th_bg">사원</th>
                            <td class="td_input" style="border-right: hidden;" data-group="EMP">
                                <sbux-input
                                        uitype="text"
                                        id="EMP_CODE"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td class="td_input" style="border-right: hidden;" data-group="EMP">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="EMP_NAME"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" data-group="EMP">
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup2"
                                ></sbux-button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>국민연금 실적</span></li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;"
                               onchange="fn_importExcelData(event)">
                        <sbux-button
                                id="btnUpload"
                                name="btnUpload"
                                uitype="normal"
                                text="Excel 업로드"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_uld"
                                style="float: right; margin-left: 15px;"
                        ></sbux-button>
                        <sbux-button
                                id="btnDownload" name="btnDownload" uitype="normal" text="Excel 양식받기"
                                class="btn btn-sm btn-outline-danger" onclick="fn_exportData"
                                style="float: right; margin-left: 15px; display: none;"
                        ></sbux-button>
                        <sbux-button
                                id="btnDataCheck"
                                name="btnDataCheck"
                                uitype="normal"
                                text="데이터검증" <%--그리드 복사 불가. 붙여넣기 불가.--%>
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_btnDataCheck"
                                style="float: right; margin-left: 15px; "
                        ></sbux-button>
                        <sbux-button
                                id="btmCopyClear"
                                name="btmCopyClear"
                                uitype="normal"
                                text="복사해제모드" <%--그리드 복사 불가. 붙여넣기 불가.--%>
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_gridCopyClear"
                                style="float: right; display: block; margin-left: 15px;"
                        ></sbux-button>
                        <sbux-button
                                id="btmCopyLine"
                                name="btmCopyLine"
                                uitype="normal"
                                text="행복사모드" <%--행단위로 복사--%>
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_gridCopyLine"
                                style="float: right; display: none; margin-left: 15px;"
                        ></sbux-button>
                        <sbux-button
                                id="btmCopyCell"
                                name="btmCopyCell"
                                uitype="normal"
                                text="셀복사모드" <%--셀단위로 복사--%>
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_gridCopyCell"
                                style="float: right; display: none; margin-left: 15px;"
                        ></sbux-button>
                        <sbux-button
                                class="btn btn-sm btn-outline-danger"
                                text="급여반영취소" uitype="modal"
                                onclick="fn_compopup3('CANCEL')"
                                style="float: right; margin-left: 5px;"
                        ></sbux-button>
                        <sbux-button
                                class="btn btn-sm btn-outline-danger"
                                text="급여반영" uitype="modal"
                                onclick="fn_compopup3('APPLY')"
                                style="float: right;"
                        ></sbux-button>
                    </div>
                </div>
                <div>
                    <div id="sb-area-gvwList" style="height:530px; width:100%;"></div>
                </div>
            </div>
            <div id="tabInfo2">
                <div style="padding-bottom: 10px">
                    <table id="dataArea2" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:6%">
                            <col style="width:6%">
                            <col style="width:1%">

                            <col style="width:6%">
                            <col style="width:6%">
                            <col style="width:1%">

                            <col style="width:6%">
                            <col style="width:6%">
                            <col style="width:6%">
                            <col style="width:3%">
                            <col style="width:1%">

                            <col style="width:6%">
                            <col style="width:6%">
                            <col style="width:6%">
                            <col style="width:3%">
                            <col style="width:1%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">기간</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="YYYYMM_FR"
                                        name="YYYYMM_FR"
                                        uitype="popup"
                                        datepicker-mode="month"
                                        date-format="yyyymm"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        required>
                                    <%--onchange="fn_payDate"--%>
                                </sbux-datepicker>
                            </td>
                            <td>~</td>
                            <td colspan="13" class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="YYYYMM_TO"
                                        name="YYYYMM_TO"
                                        uitype="popup"
                                        datepicker-mode="month"
                                        date-format="yyyymm"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                        required>
                                    <%--onchange="fn_payDate"--%>
                                </sbux-datepicker>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>내역 집계</span></li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwgrdPivotList" style="height:540px; width:100%;"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title=""
                body-html-id="body-modal-compopup1" header-is-close-button="false"
                footer-is-close-button="false"></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>
<div>
    <sbux-modal style="width:600px; height: 300px;" id="modal-compopup2" name="modal-compopup2" uitype="middle"
                header-title=""
                body-html-id="body-modal-compopup2" header-is-close-button="false"
                footer-is-close-button="false"></sbux-modal>
</div>
<div id="body-modal-compopup2">
    <jsp:include page="../../../com/popup/comPopup2.jsp"></jsp:include>
</div>
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    var editType = "N";

    //grid 초기화
    var gvwListGrid; 			// 그리드를 담기위한 객체 선언
    var jsonGvwList = []; 	// 그리드의 참조 데이터 주소 선언
    var gvwPivotListGrid;
    var jsonPivotList = [];

    var jsonPayAreaType = []; //지급구분 //SRCH_PAY_AREA_TYPE, PAY_AREA_TYPE  //L_HRP034
    var jsonPayItem = []; //급여항목 //EMP_PAY_ITEM, COMP_PAY_ITEM ,EMP_HEALTH_PAY_ITEM//L_HRP004
    //var jsonPositionCode = []; //직위 //POSITION_CODE //L_HRI002

    var tabJsonData = [
        {
            "id": "0",
            "pid": "-1",
            "order": "1",
            "text": "국민연금 내역 등록",
            "targetid": "tabInfo1",
            "targetvalue": "국민연금 내역 등록"
        },
        {
            "id": "1",
            "pid": "-1",
            "order": "2",
            "text": "국민연금 내역 조회",
            "targetid": "tabInfo2",
            "targetvalue": "국민연금 내역 조회"
        }
    ];

    const fn_initSBSelect = async function () {
        let rst = await Promise.all([

            gfnma_setComSelect(['gvwListGrid', 'SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwListGrid'], jsonPayItem, 'L_HRP004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            //gfnma_setComSelect(['gvwListGrid'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', '')

        ]);
    }

    var fn_compopup1 = function () {
        var searchText = gfnma_nvl(SBUxMethod.get("DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode: gv_ma_selectedApcCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_ORG001'
            , popupType: 'B'
            , whereClause: ''
            , searchCaptions: ["부서코드", "부서명", "기준일"]
            , searchInputFields: ["DEPT_CODE", "DEPT_NAME", "BASE_DATE"]
            , searchInputValues: ["", searchText, ""]

            , searchInputTypes: ["input", "input", "datepicker"]		//input, datepicker가 있는 경우

            , height: '400px'
            , tableHeader: ["기준일", "사업장", "부서명", "사업장코드"]
            , tableColumnNames: ["START_DATE", "SITE_NAME", "DEPT_NAME", "SITE_CODE"]
            , tableColumnWidths: ["100px", "150px", "100px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('DEPT_NAME', data.DEPT_NAME);
                SBUxMethod.set('DEPT_CODE', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width: '800px'})
    }

    const fn_compopup2 = function () {

        var searchText = gfnma_nvl(SBUxMethod.get("EMP_NAME"));
        var replaceText0 = "_EMP_CODE_";
        var replaceText1 = "_EMP_NAME_";
        var replaceText2 = "_DEPT_CODE_";
        var replaceText3 = "_DEPT_NAME_";
        var replaceText4 = "_EMP_STATE_";
        var strWhereClause = "AND x.EMP_CODE LIKE '%" + replaceText0 + "%' AND x.DEPT_NAME LIKE '%" + replaceText1 + "%' AND x.DEPT_CODE LIKE '%" + replaceText2
            + "%' AND x.DEPT_NAME LIKE '%" + replaceText3 + "%' AND x.EMP_STATE LIKE '%" + replaceText4 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
        compopup1({
            compCode: gv_ma_selectedApcCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_HRI001'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions: ["부서코드", "부서명", "사원코드", "사원명", "재직상태"]
            , searchInputFields: ["DEPT_CODE", "DEPT_NAME", "EMP_CODE", "EMP_NAME", "EMP_STATE"]
            , searchInputValues: ["", "", "", searchText, ""]
            , height: '400px'
            , tableHeader: ["사번", "이름", "부서", "사업장", "재직구분"]
            , tableColumnNames: ["EMP_CODE", "EMP_NAME", "DEPT_NAME", "SITE_NAME", "EMP_STATE_NAME"]
            , tableColumnWidths: ["80px", "80px", "100px", "100px", "80px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('EMP_CODE', data.EMP_CODE);
            },
        });

    }

    var fn_compopup3 = function (type) {
        var yyyymm_fr = gfnma_nvl(SBUxMethod.get("SRCH_YYYYMM_FR")); //보험년월
        var pay_area_type = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //지급구분

        if (yyyymm_fr == "") {
            gfn_comAlert("W0002", "보험년월");
            return;
        }

        if (pay_area_type == "") {
            gfn_comAlert("W0002", "지급구분");
            return;
        }

        SBUxMethod.attr('modal-compopup1', 'header-title', '');
        SBUxMethod.openModal('modal-compopup2');
        compopup2({
            yyyymm: yyyymm_fr
            , payAreaType: pay_area_type
            , compCode: gv_ma_selectedApcCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'L_HRB008'
            , code: "SUB_CODE"
            , name: "CODE_NAME"
            , itemSelectEvent: function (data) {
                fn_btnApply(data, type);
            },
        });
        /*SBUxMethod.setModalCss('modal-compopup2', {width:'400px'})*/
    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();


    });

    const fn_init = async function () {

        let openDate = gfn_dateToYm(new Date());

        let openDateFr = openDate - 5;

        SBUxMethod.set('SRCH_YYYYMM_FR', openDate); //보험년월
        SBUxMethod.set('YYYYMM_FR', openDateFr); //기간 시작시간
        SBUxMethod.set('YYYYMM_TO', openDate);  //기간 종료시간

        fn_createGrid('clear');
        fn_createPivotGrid();

        fn_search('LIST');
    }

    /**
     * 신규
     */
    function cfn_add() {

        editType = "N";

        jsonGvwList.length = 0;
        gvwListGrid.rebuild();

        //데이터검증 버튼 활성화
        SBUxMethod.attr('btnDataCheck', 'disabled', false);
        //엑셀업로드 버튼 활성화
        SBUxMethod.attr('btnUpload', 'disabled', false);
        //엑셀다운로드 버튼 활성화
        SBUxMethod.attr('btnDownload', 'disabled', false);

        //신규작성시 그리드의 타입콤보박스 disabled : true로 콤보박스값 선택 가능하게 설정
        gvwListGrid.setColDisabled(6, false);
        gvwListGrid.setColDisabled(19, false);
        gvwListGrid.setColDisabled(21, false);
    }

    /**
     * 저장
     */
    function cfn_save() {

        let gridUpdateData = gvwListGrid.getUpdateData(true, 'i');
        let gridInsertData = gvwListGrid.getUpdateData(true, 'u');

        if (_.isEmpty(gridUpdateData) || _.isEmpty(gridInsertData)) {
            gfn_comConfirm("Q0000", "신규 및 수정된 데이터가 존재하지 않습니다.");
        }

        //검증되지 않은 데이터가 있습니다. 검증 후 저장하세요.
        let btnDataCheckAttrValue = $('#btnDataCheck').attr('disabled');

        if (!_.isEqual(btnDataCheckAttrValue, 'disabled')) {
            gfn_comConfirm("Q0000", "검증되지 않은 데이터가 있습니다. 검증 후 저장하세요.");
            return false;
        }

        if (_.isEqual(editType, 'N')) {

            fn_check();

            if (gfn_comConfirm("Q0001", "신규 등록")) {
                fn_save();
            }

        } else if (_.isEqual(editType, 'E')) {

            // 수정 저장
            if (gfn_comConfirm("Q0001", "수정 저장")) {
                fn_save();
            }

        }

    }

    /**
     * 삭제
     */
    function cfn_del() {

        let gridDeleteData = gvwListGrid.getUpdateData(true, 'd');

        if (_.isEmpty(gridUpdateData) || _.isEmpty(gridDeleteData)) {
            gfn_comConfirm("Q0000", "삭제 처리된 데이터가 존재하지 않습니다.");
        }

        if (gfn_comConfirm("Q0001", "삭제")) {
            fn_del();
        }
    }

    /**
     * 조회
     */
    function cfn_search() {
        editType = "E";


        let tabId = SBUxMethod.get('tabJson');

        if (_.isEqual(tabId, 'tabInfo1')) { //국민연금 내역 등록 tab 리스트 조회시 (WORK_TYPE IN LIST)

            fn_search('LIST');

        } else if (_.isEqual(tabId, 'tabInfo2')) { //국민연금 내역 조회 tab 피벗 리스트 조회시(WORK_TYPE IN SUMMARY)

            fn_search('SUMMARY');

        }


    }

    /**
     * 초기화
     */
    var cfn_init = function () {
        gfnma_uxDataClear('#dataArea1');
    }


    //국민연금 실적 리스트
    function fn_createGrid(chMode, rowData, type) {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwList';
        SBGridProperties.id = 'gvwListGrid';
        SBGridProperties.jsonref = 'jsonGvwList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사

        if (_.isEqual(chMode, 'clear')) { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if (_.isEqual(chMode, 'line')) { //행복사모드
            SBGridProperties.selectmode = 'byrow'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.

        } else if (_.isEqual(chMode, 'cell')) { //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }
        /*SBGridProperties.explorerbar = 'move';*/				// 개인화 컬럼 이동 가능
        /* SBGridProperties.contextmenu = true;*/				// 우클린 메뉴 호출 여부
        /*SBGridProperties.contextmenulist = objMenuList1;*/	// 우클릭 메뉴 리스트
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.frozencols = 3;
        SBGridProperties.columns = [
            {
                caption: [""], ref: 'CHECK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: {
                    ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["성명"], ref: 'EMP_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["부서명"], ref: 'DEPT_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ['보험년월'], ref: 'INSURE_YYYYMM', width: '100px', type: 'datepicker', style: 'text-align: center', sortable: false,
                format: {type: 'date', rule: 'yyyy-mm', origin: 'yyyymm'}, disabled: true, hidden: true},
            {caption: ["급여영역"], ref: 'PAY_AREA_TYPE', width: '100px', style: 'text-align:center', type: 'combo', disabled: true,
                typeinfo: {ref: 'jsonPayAreaType', displayui: true, label: 'label', value: 'value'}
            },
            {caption: ["직위"], ref: 'POSITION_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["주민등록번호"], ref: 'SOCIAL_NO', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["기준소득월액"], ref: 'BASE_INCOME_AMT', type: 'output', width: '120px', style: 'text-align:right',
                typeinfo: {mask: {alias: 'numeric', unmaskvalue: false}/*, maxlength : 10*/}, format: {type: 'number', rule: '#,###'}},
            {caption: ["월보험료(계)"], ref: 'TOTAL_INSURE_AMT', type: 'output', width: '120px', style: 'text-align:right',
                typeinfo: {mask: {alias: 'numeric', unmaskvalue: false}/*, maxlength : 10*/}, format: {type: 'number', rule: '#,###'}},
            {caption: ["사용자부담금"], ref: 'COMP_INSURE_AMT', type: 'output', width: '120px', style: 'text-align:right',
                typeinfo: {mask: {alias: 'numeric', unmaskvalue: false}/*, maxlength : 10*/}, format: {type: 'number', rule: '#,###'}},
            {caption: ["본인기여금"], ref: 'EMP_INSURE_AMT', type: 'output', width: '120px', style: 'text-align:right',
                typeinfo: {mask: {alias: 'numeric', unmaskvalue: false}/*, maxlength : 10*/}, format: {type: 'number', rule: '#,###'}},
            {caption: ["비고"], ref: 'MEMO', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["데이터확인"], ref: 'DATA_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: {
                    ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }, disabled: true
            },
            {caption: ["급여반영"], ref: 'PAY_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: {
                    ignoreupdate: true, fixedcellcheckbox: {usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }, disabled: true
            },
            {caption: ['급여월'], ref: 'PAY_YYYYMM', width: '100px', type: 'datepicker', style: 'text-align: center', sortable: false,
                format: {type: 'date', rule: 'yyyy-mm', origin: 'yyyymm'}, disabled: true},
            {caption: ["급여유형"], ref: 'PAY_TYPE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ['급여일'], ref: 'PAY_DATE', width: '100px', type: 'datepicker', style: 'text-align: center', sortable: false,
                format: {type: 'date', rule: 'yyyy-mm-dd', origin: 'yyyymmdd'}, disabled: true},
            {caption: ["급여항목(직원)"], ref: 'EMP_PAY_ITEM', width: '100px', style: 'text-align:center', type: 'combo', disabled: true,
                typeinfo: {ref: 'jsonPayItem', displayui: true, label: 'label', value: 'value'}},
            {caption: ["급여(직원)"], ref: 'EMP_PAY_AMT', type: 'output', width: '120px', style: 'text-align:right',
                typeinfo: {mask: {alias: 'numeric', unmaskvalue: false}/*, maxlength : 10*/}, format: {type: 'number', rule: '#,###'}},
            {caption: ["급여항목(회사)"], ref: 'COMP_PAY_ITEM', width: '100px', style: 'text-align:center', type: 'combo', disabled: true,
                typeinfo: {ref: 'jsonPayItem', displayui: true, label: 'label', value: 'value'}},
            {caption: ["급여(회사)"], ref: 'COMP_PAY_AMT', type: 'output', width: '120px', style: 'text-align:right',
                typeinfo: {mask: {alias: 'numeric', unmaskvalue: false}/*, maxlength : 10*/}, format: {type: 'number', rule: '#,###'}}

        ];


        gvwListGrid = _SBGrid.create(SBGridProperties);

        //행복사모드 일시 ctrl + v 시 맨아래행 추가 후 복사된 행 데이터 set
        if (_.isEqual(chMode, 'line')) {
            gvwListGrid.bind('beforepaste', 'gridBeforePaste');
        }
    }

    let columns1 = [
        {
            caption: ["사번"],
            ref: 'EMP_CODE',
            type: 'output',
            width: '100px',
            style: 'text-align:left'
            ,
            typeinfo: {mask: {alias: 'numeric', unmaskvalue: false}/*, maxlength : 10*/},
            format: {type: 'number' /*, rule:'#' */}
        },
        {caption: ["성명"], ref: 'EMP_NAME', type: 'output', width: '100px', style: 'text-align:left'},
        {caption: ["항목"], ref: 'ITEM', type: 'output', width: '100px', style: 'text-align:left', merge : false},
        {caption: [""], ref: 'MEMO', type: 'output', width: '100px', style: 'text-align:left', merge : false},
        /* {caption: ["분기"], ref: 'DATE_QUARTER', type: 'output', width: '100px', style: 'text-align:left'},
         {caption: ["월"], ref: 'DATE_MONTH', type: 'output', width: '100px', style: 'text-align:left'
             , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/!*, maxlength : 10*!/},  format : { type:'number' , rule:'#' }},
         {caption: ["기준소득월액"], ref: 'BASE_INCOME_AMT', type: 'output', width: '120px', style: 'text-align:left'
             , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/!*, maxlength : 10*!/},  format : { type:'number' , rule:'#,###' }},
         {caption: ["월보험료(계)"], ref: 'TOTAL_INSURE_AMT', type: 'output', width: '120px', style: 'text-align:left'
             , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/!*, maxlength : 10*!/},  format : { type:'number' , rule:'#,###' }},
         {caption: ["사용자부담금"], ref: 'COMP_INSURE_AMT', type: 'output', width: '120px', style: 'text-align:left'
             , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/!*, maxlength : 10*!/},  format : { type:'number' , rule:'#,###' }},
         {caption: ["본인기여금"], ref: 'EMP_INSURE_AMT', type: 'output', width: '120px', style: 'text-align:left'
             , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/!*, maxlength : 10*!/},  format : { type:'number' , rule:'#,###' }},*/
    ];

    function fn_createPivotGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwgrdPivotList';
        SBGridProperties.id = 'gvwPivotListGrid';
        SBGridProperties.jsonref = 'jsonPivotList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.mergecells = 'bycolrec';


        SBGridProperties.columns = [];

        columns1.forEach((col) => {
            SBGridProperties.columns.push(col);
        });

        gvwPivotListGrid = _SBGrid.create(SBGridProperties);
       /* gvwPivotListGrid.bind('click', 'fn_view');*/
    }

    //피벗 그리드 상세정보 보기
    function fn_view() {

    }

    function fn_createPivot(pivotData) {

        columns1 = [
            {caption: ["", "사번"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'
                , typeinfo: {mask: {alias: 'numeric', unmaskvalue: false}/*, maxlength : 10*/}, format: {type: 'number' /*, rule:'#' */}},
            {caption: ["", "성명"], ref: 'EMP_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["", "항목"], ref: 'ITEM', type: 'output', width: '140px', style: 'text-align:left', merge : false},];



        //분기 항목 정의
        let DATE_QUARTER_ARR = [];
        //분기 항목 년월
        let DATE_MONTH_ARR = [];
        //분기 항목 + 분기 항목 년월
        let DATE_QUARTER_MONTH_ARR = [];

        pivotData.forEach((item, index) => {

            //분기 데이터
            let DATE_QUARTER = gfnma_nvl(item.DATE_QUARTER);
            DATE_QUARTER = DATE_QUARTER.trim();
            //분기별 년월 데이터
            let DATE_MONTH = gfnma_nvl(item.DATE_MONTH);
            DATE_MONTH = DATE_MONTH.trim();

            //분기 및 분기별 년월 데이터가 다르면 컬럼 추가.
            if (DATE_QUARTER_ARR.includes(DATE_QUARTER) == false || DATE_MONTH_ARR.includes(DATE_MONTH) == false) {

                //컬럼의 ref를 저장
                DATE_QUARTER_MONTH_ARR.push(DATE_QUARTER + DATE_MONTH);

                if (DATE_QUARTER_ARR.includes(DATE_QUARTER) == false) {


                    if (_.isEmpty(DATE_QUARTER_ARR) == false) {

                        let quarterTotal = DATE_QUARTER_ARR[DATE_QUARTER_ARR.length - 1] + ' Total'

                        const columns = {
                            caption: [quarterTotal , quarterTotal],
                            ref: quarterTotal,
                            type: 'output',
                            width: '100px',
                            style: 'text-align:right'
                            , merge: false
                            , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }
                        };

                        columns1.push(columns);
                    }

                    DATE_QUARTER_ARR.push(DATE_QUARTER);
                }
                if (DATE_MONTH_ARR.includes(DATE_MONTH) == false) {
                    DATE_MONTH_ARR.push(DATE_MONTH);
                }

                // caption = //ref = 분기 + 분기별 년월
                const columns = {
                    caption: [DATE_QUARTER, DATE_MONTH],
                    ref: DATE_QUARTER + DATE_MONTH,
                    type: 'output',
                    width: '100px',
                    style: 'text-align:right'
                    , merge : false
                    , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }
                };

                columns1.push(columns);
            }

        });
        //마지막 분기 데이터 Total  컬럼 생성
        if (_.isEmpty(DATE_QUARTER_ARR) == false) {

            let quarterTotal = DATE_QUARTER_ARR[DATE_QUARTER_ARR.length - 1] + ' Total'

            const columns = {
                caption: [quarterTotal , quarterTotal],
                ref: quarterTotal,
                type: 'output',
                width: '100px',
                style: 'text-align:right'
                , merge: false
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }
            };

            columns1.push(columns);
        }

        const columns = {
            caption: ["" ,""],
            ref: 'memo',
            type: 'output',
            width: '100px',
            style: 'text-align:left'
            , merge: false
        };
        columns1.push(columns);

        fn_createPivotGrid();

        let EMP_CODE_ARR = [];
        let EMP_NAME_ARR = [];
        let EMP_ARR = [];

        jsonPivotList.length = 0
        pivotData.forEach((item, index) => {

            let EMP_CODE = gfnma_nvl(item.EMP_CODE);            //사번
            let EMP_NAME = gfnma_nvl(item.EMP_NAME);            //성명

            if (EMP_CODE_ARR.includes(EMP_CODE) == false || EMP_NAME_ARR.includes(EMP_NAME) == false) {
                EMP_CODE_ARR.push(EMP_CODE);
                EMP_NAME_ARR.push(EMP_NAME);

                let EMP_ARR_JSON = {EMP_CODE: EMP_CODE, EMP_NAME: EMP_NAME};
                EMP_ARR.push(EMP_ARR_JSON);
            }


        });

        /*

         msg.ITEM = incomeItem == 'BASE_INCOME_AMT' ? '기준소득월액' : (incomeItem == 'TOTAL_INSURE_AMT' ? '월보험료(계)' :
             (incomeItem == 'COMP_INSURE_AMT' ? '사용자부담금' : (incomeItem == 'EMP_INSURE_AMT' ? '본인기여금' : '')));*/
        let INCOME_NM = ['BASE_INCOME_AMT', 'TOTAL_INSURE_AMT', 'COMP_INSURE_AMT', 'EMP_INSURE_AMT']


        jsonPivotList.length = 0;
        EMP_ARR.forEach((empItem, empIndex) => { //사원리스트

            INCOME_NM.forEach((incomeItem, incomeIndex) => {

                let totalVal = ''; // 분기별 총액 값
                let DATE_QUARTER_TOTAL = ''; // 분기별 총액 로우 ref
                let DATE_QUARTER_ARR = []; //분기검사 arr
                let quarterTotal = ''; //값의 ref명

                let msg = {
                    EMP_CODE: gfnma_nvl(empItem.EMP_CODE),            //사번
                    EMP_NAME: gfnma_nvl(empItem.EMP_NAME),            //성명
                }

                if (_.isEqual(incomeItem,'BASE_INCOME_AMT')){
                    msg.ITEM = '기준소득월액'
                }else if (_.isEqual(incomeItem,'TOTAL_INSURE_AMT')){
                    msg.ITEM = '월보험료(계)'
                }else if (_.isEqual(incomeItem,'COMP_INSURE_AMT')){
                    msg.ITEM = '사용자부담금'
                }else if (_.isEqual(incomeItem,'EMP_INSURE_AMT')){
                    msg.ITEM = '본인기여금'
                }

                DATE_QUARTER_MONTH_ARR.forEach((item1, index1) => { //컬럼리스트


                    pivotData.forEach((dataItem, dataIndex) => { //데이터

                        if (_.isEqual(empItem.EMP_CODE, dataItem.EMP_CODE) && _.isEqual(empItem.EMP_NAME, dataItem.EMP_NAME)) {

                            let DATE_QUARTER = gfnma_nvl(dataItem.DATE_QUARTER);        //분기
                            DATE_QUARTER = DATE_QUARTER.trim();
                            let DATE_MONTH = gfnma_nvl(dataItem.DATE_MONTH);          //월
                            DATE_MONTH = DATE_MONTH.trim();
                            let DATE_QUARTER_MONTH = DATE_QUARTER + DATE_MONTH   //ref 명 조합


                            if (_.isEqual(item1, DATE_QUARTER_MONTH)) { //컬럼 생성시 ref 명 조합과 return data의 분기+월 조합이 같으면 데이터 set

                                msg[item1] = gfnma_nvl(dataItem[incomeItem]) ;  //액
                                totalVal = Number(totalVal) + Number(gfnma_nvl(dataItem[incomeItem])); //총액값

                                //분기별로 총액값 set
                                if (DATE_QUARTER_ARR.includes(DATE_QUARTER) == false){

                                    if (_.isEmpty(DATE_QUARTER_ARR) == false){

                                        totalVal = Number(totalVal) - Number(gfnma_nvl(dataItem[incomeItem])); //다른 분기 값이기 때문에 빼주고 아래서 추가

                                        quarterTotal = DATE_QUARTER_ARR[DATE_QUARTER_ARR.length - 1] + ' Total'
                                        msg[quarterTotal] = totalVal ;  //액

                                        totalVal = ''; // 분기별 총액 값 [초기화]
                                        DATE_QUARTER_TOTAL = ''; // 분기별 총액 로우 ref [초기화]
                                        quarterTotal = ''; //값의 ref명 [초기화]

                                        totalVal = Number(gfnma_nvl(dataItem[incomeItem]));//다른 분기 값이기 때문에 빼주고 아래서 추가

                                    }
                                    DATE_QUARTER_ARR.push(DATE_QUARTER);//분기별 Total 확인 arr
                                }

                            }
                        }
                    });
                });

                quarterTotal = DATE_QUARTER_ARR[DATE_QUARTER_ARR.length - 1] + ' Total'
                msg[quarterTotal] = totalVal ;  //액

                jsonPivotList.push(msg);

                totalVal = ''; // 분기별 총액 값 [초기화]
                DATE_QUARTER_TOTAL = ''; // 분기별 총액 로우 ref [초기화]
                DATE_QUARTER_ARR = []; //분기검사 arr [초기화]
                quarterTotal = ''; //값의 ref명 [초기화]

            });

        });

        gvwPivotListGrid.rebuild();

    }


    //행복사모드 일시 ctrl + v 시 맨아래행 추가 후 복사된 행 데이터 set
    async function gridBeforePaste() {

        var nRow = gvwListGrid.getRow();

        var nCol = gvwListGrid.getCol();


        if (nCol < 1) {
            return;
        }
        if (nRow < 1) {
            return;
        }

        var rowData = gvwListGrid.getRowData(nRow);

        gvwListGrid.addRow(true, rowData);
    }

    // 지급구분 변경시 국민연금 내역 관리 재조회
    const fn_payType = async function () {

        fn_search('LIST');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function (workType) {

        let YYYYMM;
        let PAY_AREA_TYPE;
        let DEPT_CODE;
        let EMP_CODE;

        let YYYYMM_FR;
        let YYYYMM_TO;

        if (_.isEqual(workType, 'LIST')) { //국민연금내역 등록 조회시

            YYYYMM          = gfnma_nvl(SBUxMethod.get("SRCH_YYYYMM_FR")); //보험년월
            PAY_AREA_TYPE   = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //지급구분
            DEPT_CODE       = gfnma_nvl(SBUxMethod.get("DEPT_CODE")); //부서코드
            EMP_CODE        = gfnma_nvl(SBUxMethod.get("EMP_CODE")); //사원코드

            YYYYMM_FR = '';
            YYYYMM_TO = '';

            if (!YYYYMM) {
                gfn_comAlert("W0002", "보험년월");
                return;
            }
        } else if (_.isEqual(workType, 'SUMMARY')) { //국민연금 내역 조회 시

            YYYYMM = '';
            PAY_AREA_TYPE = '';
            DEPT_CODE = '';
            EMP_CODE = '';

            YYYYMM_FR = gfnma_nvl(SBUxMethod.get("YYYYMM_FR")); //기간
            YYYYMM_TO = gfnma_nvl(SBUxMethod.get("YYYYMM_TO")); //기간


            if (!YYYYMM_FR) {
                gfn_comAlert("W0002", "기간 시간월");
                return;
            }
            if (!YYYYMM_TO) {
                gfn_comAlert("W0002", "기간 종료월");
                return;
            }

        }
        //필수값 검증
        /*if (!SBUxMethod.validateRequired({
            isDetectAttack: true,
            group_id: 'dataArea1'})) {
            return false;
        }*/

        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_INSURE_YYYYMM     : YYYYMM
            , V_P_PAY_AREA_TYPE     : PAY_AREA_TYPE
            , V_P_DEPT_CODE         : DEPT_CODE
            , V_P_EMP_CODE          : EMP_CODE
            , V_P_SOCIAL_NO         : ''
            , V_P_YYYYMM_FR         : YYYYMM_FR    /*YYYYMM_FR*/
            , V_P_YYYYMM_TO         : YYYYMM_TO    /*YYYYMM_TO*/

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/selectHrp5100List.do", {
            getType: 'json',
            workType: workType,
            cv_count: '3',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                jsonGvwList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHECK_YN            : gfnma_nvl(item.CHECK_YN),
                        INSURE_YYYYMM       : gfnma_nvl(item.INSURE_YYYYMM),
                        DEPT_CODE           : gfnma_nvl(item.DEPT_CODE),
                        DEPT_NAME           : gfnma_nvl(item.DEPT_NAME),
                        POSITION_CODE       : gfnma_nvl(item.POSITION_CODE),
                        PAY_AREA_TYPE       : gfnma_nvl(item.PAY_AREA_TYPE),
                        EMP_CODE            : gfnma_nvl(item.EMP_CODE),
                        EMP_NAME            : gfnma_nvl(item.EMP_NAME),
                        SOCIAL_NO           : gfnma_nvl(item.SOCIAL_NO),
                        BASE_INCOME_AMT     : gfnma_nvl(item.BASE_INCOME_AMT),
                        TOTAL_INSURE_AMT    : gfnma_nvl(item.TOTAL_INSURE_AMT),
                        EMP_INSURE_AMT      : gfnma_nvl(item.EMP_INSURE_AMT),
                        COMP_INSURE_AMT     : gfnma_nvl(item.COMP_INSURE_AMT),
                        MEMO                : gfnma_nvl(item.MEMO),
                        PAY_YN              : gfnma_nvl(item.PAY_YN),
                        PAY_YYYYMM          : gfnma_nvl(item.PAY_YYYYMM),
                        PAY_TYPE            : gfnma_nvl(item.PAY_TYPE),
                        PAY_DATE            : gfnma_nvl(item.PAY_DATE),
                        EMP_PAY_ITEM        : gfnma_nvl(item.EMP_PAY_ITEM),
                        EMP_PAY_AMT         : gfnma_nvl(item.EMP_PAY_AMT),
                        COMP_PAY_ITEM       : gfnma_nvl(item.COMP_PAY_ITEM),
                        COMP_PAY_AMT        : gfnma_nvl(item.COMP_PAY_AMT),
                        DATA_YN             : gfnma_nvl(item.DATA_YN)

                    }
                    jsonGvwList.push(msg);
                });

                gvwListGrid.rebuild();

                let pivotData = [];
                pivotData = data.cv_3;

                //조회된 데이터로 피벗 그리드 생성
                if (!_.isEmpty(pivotData)) {
                    fn_createPivot(pivotData);
                }

                /* jsonPivotList.length = 0;
                 data.cv_3.forEach((item, index) => {
                     const msg = {
                         EMP_CODE             : gfnma_nvl(item.EMP_CODE),            //사번
                         EMP_NAME             : gfnma_nvl(item.EMP_NAME),            //성명
                         DATE_QUARTER         : gfnma_nvl(item.DATE_QUARTER),        //분기
                         DATE_MONTH           : gfnma_nvl(item.DATE_MONTH),          //월
                         BASE_INCOME_AMT      : gfnma_nvl(item.BASE_INCOME_AMT),     //기준소득월액
                         TOTAL_INSURE_AMT     : gfnma_nvl(item.TOTAL_INSURE_AMT),    //월보험료(계)
                         EMP_INSURE_AMT       : gfnma_nvl(item.EMP_INSURE_AMT),      //본인기여금
                         COMP_INSURE_AMT      : gfnma_nvl(item.COMP_INSURE_AMT)      //사용자부담금
                     }
                     jsonPivotList.push(msg);
                 });

                 gvwPivotListGrid.rebuild();*/

                SBUxMethod.attr('btnDataCheck', 'disabled', true);
                if (jsonGvwList.length >= 1) {
                    /*SBUxMethod.attr('btnDataCheck',	'disabled', true);*/
                    SBUxMethod.attr('btnUpload', 'disabled', true);
                    SBUxMethod.attr('btnDownload', 'disabled', true);
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


    const fn_gridCopyClear = function () { /*셀복사 해제 (복사해제모드)*/
        $('#btmCopyClear').hide();
        $('#btmCopyLine').show();
        $('#btmCopyCell').hide();

        /*grdFimList.bind('selectmode', 'free');*/

        let datas = gvwListGrid.getGridDataAll();
        _SBGrid.destroy('gvwListGrid');

        let line = 'line'; //그리드 프로퍼티스 라인모드

        fn_createGrid(line, datas);


    }
    const fn_gridCopyLine = function () { /*행복사 (행복사모드)*/
        $('#btmCopyClear').hide();
        $('#btmCopyLine').hide();
        $('#btmCopyCell').show();

        let datas = gvwListGrid.getGridDataAll();
        _SBGrid.destroy('gvwListGrid');

        let cell = 'cell'; //그리드 프로퍼티스 셀모드

        fn_createGrid(cell, datas);

    }
    const fn_gridCopyCell = function () { /*셀복사 (셀복사모드)*/
        $('#btmCopyClear').show();
        $('#btmCopyLine').hide();
        $('#btmCopyCell').hide();

        let datas = gvwListGrid.getGridDataAll();
        _SBGrid.destroy('gvwListGrid');

        let clear = 'clear'; //그리드 프로퍼티스 클리어모드

        fn_createGrid(clear, datas);
    }

    //급여반영,취소
    const fn_btnApply = async function (reData, type) {

        let YYYYMM = gfnma_nvl(SBUxMethod.get("SRCH_YYYYMM_FR")); //보험년월
        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //지급구분

        let pay_yyyymm = reData.pay_yyyymm;
        let pay_type = reData.pay_type;
        let pay_date = reData.pay_date;

        let grdList = gvwListGrid.getGridDataAll();

        let isChecked = false;
        let stremp_code_d = '';

        grdList.forEach((item, index) => {

            if (_.isEqual(item.CHECK_YN, 'Y')) {

                isChecked = true;
            }
        })

        if (isChecked) {
            grdList.forEach((item, index) => {
                if (_.isEqual(item.CHECK_YN, 'Y')) {

                    stremp_code_d = item.EMP_CODE + '|';
                }
            });

            if (stremp_code_d.length > 0) {
                stremp_code_d = stremp_code_d.slice(0, -1);
            } else {

                gfn_comAlert("W0001", "대상자");
                return false;

            }
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_INSURE_YYYYMM : YYYYMM
            , V_P_PAY_AREA_TYPE : PAY_AREA_TYPE
            , V_P_PAY_YYYYMM    : pay_yyyymm
            , V_P_PAY_TYPE      : pay_type
            , V_P_PAY_DATE      : pay_date
            , V_P_EMP_CODE_D    : stremp_code_d

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp5100S1.do", {
            getType: 'json',
            workType: type,
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                if (data.resultMessage) {
                    alert(data.resultMessage);
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

    //데이터 검증
    const fn_btnDataCheck = async function () {

        let YYYYMM          = gfnma_nvl(SBUxMethod.get("SRCH_YYYYMM_FR")); //보험년월
        let PAY_AREA_TYPE   = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //지급구분
        let DEPT_CODE       = gfnma_nvl(SBUxMethod.get("DEPT_CODE")); //부서코드
        let EMP_CODE        = gfnma_nvl(SBUxMethod.get("EMP_CODE")); //사원코드

        if (!YYYYMM) {
            gfn_comAlert("W0002", "보험년월");
            return;
        }

        let grdList = gvwListGrid.getGridDataAll();

        let isChecked       = false;
        let strSocial_no    = '';
        let strSocial_no2   = '';

        grdList.forEach((item, index) => {

            if (_.isEqual(item.CHECK_YN, 'Y')) {

                isChecked = true;
            }
        })

        if (!isChecked) {
            gfn_comAlert("W0004", "선택");
            return false;
        }

        grdList.forEach((item, index) => {

            if (_.isEqual(item.CHECK_YN, 'Y')) {

                strSocial_no    = item.SOCIAL_NO.replace("-", "") + '|';
                strSocial_no2   = item.SOCIAL_NO.replace("-", "") + '|';
            }
        })

        if (strSocial_no.length > 0) {
            strSocial_no = strSocial_no.slice(0, -1);
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_INSURE_YYYYMM     : YYYYMM
            , V_P_PAY_AREA_TYPE     : PAY_AREA_TYPE
            , V_P_DEPT_CODE         : DEPT_CODE
            , V_P_EMP_CODE          : EMP_CODE
            , V_P_SOCIAL_NO         : strSocial_no
            , V_P_YYYYMM_FR         : ''    /*YYYYMM_FR*/
            , V_P_YYYYMM_TO         : ''    /*YYYYMM_TO*/

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/selectHrp5100List.do", {
            getType: 'json',
            workType: 'CHECK',
            cv_count: '3',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                data.cv_1.forEach((item, index) => {
                    const msg = {
                        EMP_CODE    : gfnma_nvl(item.EMP_CODE),
                        EMP_NAME    : gfnma_nvl(item.EMP_NAME),
                        SOCIAL_NO   : gfnma_nvl(item.SOCIAL_NO)

                    }
                });

                SBUxMethod.attr('btnDataCheck', 'disabled', false);

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

    const fn_importExcelData = function (e) {
        SBUxMethod.openModal('modal-excel');
        /*fn_createGridGdsPopup();*/
        jsonGvwList = 0;
        gvwListGrid.rebuild();

        gvwListGrid.importExcelData(e);
    }

    const fn_uld = async function () {
        document.querySelector("#btnFileUpload").value = "";
        $("#btnFileUpload").click();

    }

    const fn_exportData = function () {

        if (gfn_comConfirm("Q0000", "엑셀의 양식을 xlsx으로 다운로드 받으시겠습니까?")) {
            gvwListGrid.exportData("xlsx", "국민연금 내역 등록", true);
        }

    }

    //저장 전 년월로 저장한 정보 체크
    const fn_check = async function () {

        let YYYYMM = gfnma_nvl(SBUxMethod.get("SRCH_YYYYMM_FR")); //보험년월
        /*let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //지급구분
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("DEPT_CODE")); //부서코드
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE")); //사원코드*/

        if (!YYYYMM) {
            gfn_comAlert("W0002", "보험년월");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_INSURE_YYYYMM         : YYYYMM
            , V_P_EMP_CODE_D            : ''
            , V_P_BASE_INCOME_AMT_D     : ''
            , V_P_TOTAL_INSURE_AMT_D    : ''
            , V_P_COMP_INSURE_AMT_D     : ''
            , V_P_EMP_INSURE_AMT_D      : ''

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp5100S.do", {
            getType: 'json',
            workType: 'CHECK',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                if (data.resultMessage) {
                    alert(data.resultMessage);
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

    //저장
    const fn_save = async function () {

        let YYYYMM          = gfnma_nvl(SBUxMethod.get("SRCH_YYYYMM_FR")); //보험년월
        let PAY_AREA_TYPE   = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //지급구분
        let DEPT_CODE       = gfnma_nvl(SBUxMethod.get("DEPT_CODE")); //부서코드
        let EMP_CODE        = gfnma_nvl(SBUxMethod.get("EMP_CODE")); //사원코드

        /*  let YYYYMM_FR = gfnma_nvl(SBUxMethod.get("YYYYMM_FR")); //기간
          let YYYYMM_TO = gfnma_nvl(SBUxMethod.get("YYYYMM_TO")); //기간*/

        if (!YYYYMM) {
            gfn_comAlert("W0002", "보험년월");
            return;
        }

        let stremp_code_d           = '';
        let strbase_income_amt_d    = '';
        let strtotal_insure_amt_d   = '';
        let strcomp_insure_amt_d    = '';
        let stremp_insure_amt_d     = '';
        let isChecked               = '';

        let updateData = gvwListGrid.getGridDataAll();

        updateData.forEach((item, index) => {

            if (!_.isEqual(gfnma_nvl(item.EMP_CODE), '')) {
                stremp_code_d           += item.EMP_CODE + '|';
                strbase_income_amt_d    += item.BASE_INCOME_AMT + '|';
                strtotal_insure_amt_d   += item.TOTAL_INSURE_AMT + '|';
                strcomp_insure_amt_d    += item.COMP_INSURE_AMT + '|';
                stremp_insure_amt_d     += item.EMP_INSURE_AMT + '|';
            }
        })

        if (stremp_code_d.length > 0) {
            stremp_code_d           = stremp_code_d.slice(0, -1);
            strbase_income_amt_d    = strbase_income_amt_d.slice(0, -1);
            strtotal_insure_amt_d   = strtotal_insure_amt_d.slice(0, -1);
            strcomp_insure_amt_d    = strcomp_insure_amt_d.slice(0, -1);
            stremp_insure_amt_d     = stremp_insure_amt_d.slice(0, -1);
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_INSURE_YYYYMM         : YYYYMM
            , V_P_EMP_CODE_D            : stremp_code_d
            , V_P_BASE_INCOME_AMT_D     : strbase_income_amt_d
            , V_P_TOTAL_INSURE_AMT_D    : strtotal_insure_amt_d
            , V_P_COMP_INSURE_AMT_D     : strcomp_insure_amt_d
            , V_P_EMP_INSURE_AMT_D      : stremp_insure_amt_d

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp5100S.do", {
            getType: 'json',
            workType: 'N',
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                if (data.resultMessage) {
                    alert(data.resultMessage);
                }

                gfn_comAlert("I0001"); // I0001	처리 되었습니다.

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


    //삭제
    const fn_del = async function () {

        let YYYYMM = gfnma_nvl(SBUxMethod.get("SRCH_YYYYMM_FR")); //보험년월

        if (!YYYYMM) {
            gfn_comAlert("W0002", "보험년월");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_INSURE_YYYYMM         : YYYYMM
            , V_P_EMP_CODE_D            : ''
            , V_P_BASE_INCOME_AMT_D     : ''
            , V_P_TOTAL_INSURE_AMT_D    : ''
            , V_P_COMP_INSURE_AMT_D     : ''
            , V_P_EMP_INSURE_AMT_D      : ''

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp5100S.do", {
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
                    gfn_comAlert("I0001"); // I0001	처리 되었습니다.
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


</script>
</body>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
