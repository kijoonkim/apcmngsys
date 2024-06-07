<%
    /**
     * @Class Name        : hrp1000.jsp
     * @Description       : 월별 급상여 예외자 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.06.05
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.05   	표주완		최초 생성
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
    <title>title : 월별 급상여 예외자</title>
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
                <input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="fn_importExcelData(event)">
                <sbux-button
                        id="btnUpload" name="btnUpload" uitype="normal" text="Excel 업로드"
                        class="btn btn-sm btn-outline-danger" onclick="fn_uld" style="float: right;"
                ></sbux-button>
                <sbux-button
                        id="btnDownload" name="btnDownload" uitype="normal" text="Excel 양식받기"
                        class="btn btn-sm btn-outline-danger" onclick="fn_exportData" style="float: right;"
                ></sbux-button>
                <%-- <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="신규"
                              class="btn btn-sm btn-outline-danger"
                              onclick="fn_create"></sbux-button>--%>
               <%-- <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"
                             onclick="fn_save"></sbux-button>--%>
                <%--<sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제"
                             class="btn btn-sm btn-outline-danger"
                             onclick="fn_delete"></sbux-button>--%>
                <%--<sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회"
                             class="btn btn-sm btn-outline-danger"
                             onclick="fn_search"></sbux-button>--%>
            </div>
        </div>

        <!--[pp] 검색 -->
        <!--[APC] START -->
        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <table class="table table-bordered tbl_fixed">
            <caption>검색 조건 설정</caption>
            <colgroup>
                <col style="width: 7%">
                <col style="width: 5%">
                <col style="width: 2%">
                <col style="width: 5%">
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
                <th scope="row" class="th_bg">사업장</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="srch-site_code" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="srch-site_code" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">지급구분</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="srch-pay_type"
                            name="srch-pay_type"
                            class="form-control input-sm"
                            jsondata-ref="jsonEmpState"
                    />
                </td>
                <td colspan="5" style="border-right: hidden;">&nbsp;</td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">귀속년월</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-pay_yyyymm_fr"
                            name="srch-pay_yyyymm_fr"
                            uitype="popup"
                            datepicker-mode="month"
                            date-format="yyyymm"
                            class="form-control input-sm input-sm-ast inpt_data_reqed">
                    </sbux-datepicker>
                </td>
                <th>~</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-pay_yyyymm_to"
                            name="srch-pay_yyyymm_to"
                            uitype="popup"
                            datepicker-mode="month"
                            date-format="yyyymm"
                            class="form-control input-sm input-sm-ast inpt_data_reqed">
                    </sbux-datepicker>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">급여항목</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="srch-pay_item_code" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="srch-pay_item_code" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="3" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">사원</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-input
                            uitype="hidden"
                            uitype="text"
                            id="srch-emp_code"
                            class="form-control input-sm"
                    ></sbux-input>
                    <sbux-input
                            uitype="hidden"
                            uitype="text"
                            id="srch-emp_full_name"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td class="td_input" >
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup1"
                    ></sbux-button>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
            </tr>
            </tbody>
        </table>

        <div class="row">
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span> 월별 급상여 예외자</span>
                        <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                    </li>
                </ul>
                <div class="ad_tbl_toplist">
                    <sbux-button
                            id="btnDel"
                            name="btnDel"
                            uitype="normal"
                            text="행삭제"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_delRow"
                            style="float: right;"
                    >
                    </sbux-button>
                    <sbux-button
                            id="btnAdd"
                            name="btnAdd"
                            uitype="normal"
                            text="행추가"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_addRow"
                            style="float: right;"
                    ></sbux-button>
                    <sbux-button
                            id="btnCopyClear"
                            name="btnCopyClear"
                            uitype="normal"
                            text="복사모드해제" <%--그리드 복사 불가. 붙여넣기 불가.--%>
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_gridCopyClear"
                            style="float: right; display: block"
                    ></sbux-button>
                    <sbux-button
                            id="btnCopyLine"
                            name="btnCopyLine"
                            uitype="normal"
                            text="행복사모드" <%--행단위로 복사--%>
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_gridCopyLine"
                            style="float: right; display: none;"
                    ></sbux-button>
                    <sbux-button
                            id="btnCopyCell"
                            name="btnCopyCell"
                            uitype="normal"
                            text="셀복사모드" <%--셀단위로 복사--%>
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_gridCopyCell"
                            style="float: right; display: none;"
                    ></sbux-button>
                </div>
            </div>
            <div>
                <div id="sb-area-gvwException" style="height:430px; width:100%;"></div>
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
</body>
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    //grid 초기화
    var NationInGrid; 			// 그리드를 담기위한 객체 선언
    var jsonNationList = []; 	// 그리드의 참조 데이터 주소 선언

    var jsonSiteCode = []; //사업장 ( L_ORG001 )srch-site_code
    var jsonPayType = []; //지급구분 ( L_HRB008 )srch-pay_type, PAY_TYPE
    var jsonApplyType = []; //적용구분 ( L_HRP021 )pay_apply_type, APPLY_TYPE

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['srch-pay_type'], jsonPayType, 'L_USER', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect([''], jsonApplyType, 'L_USER', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),

            //사업장
            gfnma_multiSelectInit({
                target			: ['#srch-site_code']
                ,compCode		: gv_ma_selectedApcCd
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
                    {caption: "코드",		ref: 'SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

        ]);
    }

    const fn_compopup1 = function() {
        var searchText = gfnma_nvl(SBUxMethod.get("srch-dept_name"));
        var replaceText0 = "_EMP_CODE";
        var replaceText1 = "_EMP_NAME";
        var replaceText2 = "_DEPT_CODE";
        var replaceText3 = "_DEPT_NAME";
        var replaceText4 = "_EMP_STATE";
        var strWhereClause = "AND X.EMP_CODE LIKE '%" + replaceText0 + "%' AND X.DEPT_NAME LIKE '%" + replaceText1 + "%' AND X.DEPT_CODE ="+replaceText2
            + "%' AND X.DEPT_NAME LIKE '%" + replaceText3 + "%' AND X.EMP_STATE ="+replaceText4;

        SBUxMethod.attr('modal-compopup1', 'header-title', '입력부서');
        compopup1({
            compCode: gv_ma_selectedApcCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_HRI001'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions:    ["부서코드"    , "부서명"     , "사원코드"    ,"사원명"     ,"재직상태"]
            , searchInputFields: ["DEPT_CODE"  , "DEPT_NAME", "EMP_CODE"   ,"EMP_NAME"  ,"EMP_STATE"]
            , searchInputValues: [""           , searchText ,""             ,""         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CODE"  , "EMP_NAME"  , "DEPT_NAME"   ,"SITE_NAME"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                console.log('callback data:', data);
                SBUxMethod.set('srch-emp_full_name', data.EMP_NAME);
                SBUxMethod.set('srch-emp_code', data.EMP_CODE);
            },
        });

    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        fn_createGrid('clear');

        let openDate = gfn_dateToYm(new Date());

        SBUxMethod.set('srch-pay_yyyymm_fr', openDate);
        SBUxMethod.set('srch-pay_yyyymm_to', openDate);

    }



    function cfn_save() {
        fn_save();
    }

    function cfn_search(){
        fn_search();
    }

   /* function cfn_add(){

    }
    function cfn_del(){
    }*/


    const fn_createGrid = function(chMode, rowData) {

        console.log("-----chMode-------",chMode);
        console.log("-----rowData-------",rowData);

        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwException';
        SBGridProperties.id = 'grdExceptionList';
        SBGridProperties.jsonref = 'jsonExceptionList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사

        if (chMode == 'clear') { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if(chMode == 'line'){ //행복사모드
            SBGridProperties.selectmode = 'byrow'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.

        } else if(chMode == 'cell'){ //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }
        /*SBGridProperties.explorerbar = 'move';*/				// 개인화 컬럼 이동 가능
        /* SBGridProperties.contextmenu = true;*/				// 우클린 메뉴 호출 여부
        /*SBGridProperties.contextmenulist = objMenuList1;*/	// 우클릭 메뉴 리스트
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : '', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'input', width: '100px', style: 'text-align:left'},
            {caption : ["급여항목"], ref : 'PAY_ITEM_CODE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : '', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['귀속년월(FROM)'], ref: 'PAY_YYYYMM_FR', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption: ['귀속년월(TO)'], ref: 'PAY_YYYYMM_TO', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}},
            {caption : ["적용구분"], ref : 'PAY_APPLY_TYPE', width : '100px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : '', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["적용비율"], ref: 'PAY_APPLY_RATE', type: 'output', width: '100px', style: 'text-align:left',
                format : {type:'number', rule:'#,##', emptyvalue:'0.00'}},
            {caption: ["적용금액"], ref: 'PAY_APPLY_AMT', type: 'output', width: '100px', style: 'text-align:left',
                format : {type:'number', rule:'#', emptyvalue:'0'}},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '100px', style: 'text-align:left'}

        ];

        grdExceptionList = _SBGrid.create(SBGridProperties);

        if (rowData != null){
            grdExceptionList.push(rowData);
        }

    }


    // 행 추가
    const fn_addRow = function() {
        let rowVal = grdExceptionList.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            grdExceptionList.addRow(true);
        }else{
            grdExceptionList.insertRow(rowVal);
        }
    }

    // 행삭제
    const fn_delRow = async function () {

        let rowVal = grdExceptionList.getRow();

        if (rowVal == -1) {

            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {

            grdExceptionList.deleteRow(rowVal);

        }
    }

    const fn_gridCopyClear = function (){ /*셀복사 해제 (복사해제모드)*/
        $('#btnCopyClear').hide();
        $('#btnCopyLine').show();
        $('#btnCopyCell').hide();

        /*grdFimList.bind('selectmode', 'free');*/

        let datas = grdExceptionList.getGridDataAll();
        _SBGrid.destroy('grdExceptionList');

        let line = 'line'; //그리드 프로퍼티스 라인모드

        fn_createGrid(line, datas);


    }
    const fn_gridCopyLine = function () { /*행복사 (행복사모드)*/
        $('#btnCopyClear').hide();
        $('#btnCopyLine').hide();
        $('#btnCopyCell').show();

        let datas = grdExceptionList.getGridDataAll();
        _SBGrid.destroy('grdExceptionList');

        let cell = 'cell'; //그리드 프로퍼티스 셀모드

        fn_createGrid(cell, datas);

    }
    const fn_gridCopyCell = function () { /*셀복사 (셀복사모드)*/
        $('#btnCopyClear').show();
        $('#btnCopyLine').hide();
        $('#btnCopyCell').hide();

        let datas = grdExceptionList.getGridDataAll();
        _SBGrid.destroy('grdExceptionList');

        let clear = 'clear'; //그리드 프로퍼티스 클리어모드

        fn_createGrid(clear, datas);
    }

    /**
     * 목록 조회
     */
    const fn_search = async function (/*tabMoveVal*/) {

        let SITE_CODE = gfnma_nvl(SBUxMethod.get("srch-site_code")); //사업장
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
        let PAY_YYYYMM_FR = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm_fr")); // 귀속년월 시작
        let PAY_YYYYMM_TO = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm_to")); // 귀속년월 종료
        let PAY_ITEM_CODE = gfnma_nvl(SBUxMethod.get("srch-pay_item_code")); //급여항목
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("srch-emp_code")); //사원코드


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_PAY_YYYYMM_FR : PAY_YYYYMM_FR
            ,V_P_PAY_YYYYMM_TO : PAY_YYYYMM_TO
            ,V_P_PAY_TYPE      : PAY_TYPE
            ,V_P_PAY_ITEM_CODE : PAY_ITEM_CODE
            ,V_P_EMP_CODE      : EMP_CODE

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/com/selectHrp1170List.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        //console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {


                /** @type {number} **/
                let totalRecordCount = 0;

                jsonExceptionList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        PAY_TYPE		: item.PAY_TYPE,
                        EMP_CODE		: item.EMP_CODE,
                        EMP_NAME		: item.EMP_NAME,
                        PAY_ITEM_CODE   : item.PAY_ITEM_CODE,
                        PAY_YYYYMM_FR	: item.PAY_YYYYMM_FR,
                        PAY_YYYYMM_TO	: item.PAY_YYYYMM_TO,
                        PAY_APPLY_TYPE	: item.PAY_APPLY_TYPE,
                        PAY_APPLY_RATE	: item.PAY_APPLY_RATE,
                        PAY_APPLY_AMT	: item.PAY_APPLY_AMT,
                        MEMO 			: item.MEMO
                    }
                    jsonExceptionList.push(msg);
                    totalRecordCount ++;
                });

                grdExceptionList.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

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

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            var paramObj = {
                P_HRP1000_S1: await getParamForm('u')
            }

            const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1170.do",paramObj );

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }
                    fn_search();
                    /*fn_search(/!*tabId*!/); *///현재 저장했던 탭위치 ID를 넘겨준다.
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

    const getParamForm = async function(typeData){

        let updateData;

        if (typeData == 'u') { //업데이트

            updateData = grdExceptionList.getUpdateData(true, 'all');

        }else if(typeData == 'd'){

            updateData = grdExceptionList.getUpdateData(true, 'd');

        }

        if (!_.isEmpty(updateData)){

            updatedData.forEach((item, index) => {
                const param = {

                    cv_count: '0',
                    getType: 'json',
                    workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                    params: gfnma_objectToString({

                        V_P_DEBUG_MODE_YN: ''
                        , V_P_LANG_ID: ''
                        , V_P_COMP_CODE: gv_ma_selectedApcCd
                        , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                        , V_P_PAY_TYPE: updateData.data.PAY_TYPE
                        , V_P_EMP_CODE: updateData.data.EMP_CODE
                        , V_P_PAY_ITEM_CODE: updateData.data.PAY_ITEM_CODE
                        , V_P_PAY_YYYYMM_FR: updateData.data.PAY_YYYYMM_FR
                        , V_P_PAY_YYYYMM_TO: updateData.data.PAY_YYYYMM_TO
                        , V_P_PAY_APPLY_TYPE: updateData.data.PAY_APPLY_TYPE
                        , V_P_PAY_APPLY_RATE: updateData.data.PAY_APPLY_RAT
                        , V_P_PAY_APPLY_AMT: updateData.data.PAY_APPLY_AMT
                        , V_P_MEMO: updateData.data.MEMO

                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''
                    })
                }
            });
        }
    }

    const fn_importExcelData = function (e){
        SBUxMethod.openModal('modal-excel');
        /*fn_createGridGdsPopup();*/
        jsonExceptionList = 0;
        grdExceptionList.rebuild();

        grdExceptionList.importExcelData(e);
    }
    const fn_uld = async function() {
        document.querySelector("#btnFileUpload").value = "";
        $("#btnFileUpload").click();

    }

    const fn_exportData = function () {

        if(gfn_comConfirm("Q0000","엑셀의 양식을 xlsx으로 다운로드 받으시겠습니까?")){
            grdExceptionList.exportData("xlsx","급여 변동항목 등록_복지포인트정산",true);
        }
        //gvwDetallGrid.exportData("xlsx",'급여 변동항목 등록_복지포인트정산 [호환모드]', true , true);

    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
