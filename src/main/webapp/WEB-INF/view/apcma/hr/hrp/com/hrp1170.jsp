<%
    /**
     * @Class Name        : hrp1170.jsp
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
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>

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
                <%--<input type="file" name="file" id="excelFile2" accept=".xls,.xlsx" style="display: none;">--%>
                <sbux-button
                        id="btnUpload" name="btnUpload" uitype="normal" text="Excel 업로드"
                        class="btn btn-sm btn-outline-danger" onclick="fn_uld" style="float: right;"
                ></sbux-button>
                <%--<sbux-button id="btnUpload2" name="btnUpload2" uitype="normal" class="btn btn-sm btn-outline-danger" text="Excel 양식받기" onclick="$('#excelFile2').click()"></sbux-button>--%>
                <sbux-button
                        id="btnDownload" name="btnDownload" uitype="normal" text="Excel 양식받기"
                        class="btn btn-sm btn-outline-danger" onclick="fn_exportData" style="float: right;"
                ></sbux-button>
            </div>
        </div>

        <div class="box-search-ma">
            <!--[pp] 검색 -->
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <table id="dataArea1" class="table table-bordered tbl_fixed table-search-ma">
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
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
                                    type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE"
                                 style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">지급구분</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-select
                                unselected-text="전체"
                                uitype="single"
                                id="SRCH_PAY_TYPE"
                                name="SRCH_PAY_TYPE"
                                class="form-control input-sm"
                                jsondata-ref="jsonPayType"
                        />
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">귀속년월</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_PAY_YYYYMM_FR"
                                name="SRCH_PAY_YYYYMM_FR"
                                uitype="popup"
                                datepicker-mode="month"
                                date-format="yyyy-mm"
                                class="table-datepicker-ma inpt_data_reqed">
                        </sbux-datepicker>
                    </td>
                    <th>~</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_PAY_YYYYMM_TO"
                                name="SRCH_PAY_YYYYMM_TO"
                                uitype="popup"
                                datepicker-mode="month"
                                date-format="yyyy-mm"
                                class="table-datepicker-ma inpt_data_reqed">
                        </sbux-datepicker>
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">급여항목</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
                                    type="button" id="SRCH_PAY_ITEM_CODE" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_PAY_ITEM_CODE"
                                 style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">사원</th>
                    <td class="td_input" style="border-right: hidden;" data-group="EMP">
                        <sbux-input
                                uitype="text"
                                id="SRCH_EMP_CODE"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;" data-group="EMP">
                        <sbux-input
                                uitype="text"
                                id="SRCH_EMP_FULL_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right: hidden;" data-group="EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup1"
                                text="…"
                        ></sbux-button>
                    </td>
                    <td colspan="15" style="border-right: hidden;">&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </div>

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
                <div id="sb-area-gvwException" style="height:550px; width:100%;"></div>
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
    var grdExceptionList; 			// 그리드를 담기위한 객체 선언
    var jsonExceptionList = []; 	// 그리드의 참조 데이터 주소 선언

    var jsonSiteCode = []; //사업장 ( L_ORG001 )SRCH_SITE_CODE
    var jsonPayType = []; //지급구분 ( L_HRB008 )SRCH_PAY_TYPE, PAY_TYPE
    var jsonApplyType = []; //적용구분 ( L_HRP021 )pay_apply_type, APPLY_TYPE
    var jsonPayItemCode = []; //급여항목 ( L_HRP004 )pay_apply_type, APPLY_TYPE

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['grdExceptionList', 'SRCH_PAY_TYPE'], jsonPayType, 'L_HRB008', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['grdExceptionList'], jsonApplyType, 'L_HRP021', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['grdExceptionList'], jsonPayItemCode, 'L_HRP004', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),

            //사업장
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
                    {caption: "코드",		ref: 'SITE_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'SITE_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

            //사업장
            gfnma_multiSelectInit({
                target			: ['#SRCH_PAY_ITEM_CODE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRP004'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'PAY_ITEM_CODE'
                ,colLabel		: 'PAY_ITEM_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'PAY_ITEM_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'PAY_ITEM_NAME',    		width:'150px',  	style:'text-align:left'}
                ]
            })

        ]);
    }

    function fn_compopup1() {

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');

        var searchText = gfn_nvl(SBUxMethod.get("srch-dept_name"));
        var replaceText0 = "_EMP_CODE_";
        var replaceText1 = "_EMP_NAME_";
        var replaceText2 = "_DEPT_CODE_";
        var replaceText3 = "_DEPT_NAME_";
        var replaceText4 = "_EMP_STATE_";
        var strWhereClause = "AND x.EMP_CODE LIKE '%" + replaceText0 + "%' AND x.DEPT_NAME LIKE '%" + replaceText1 + "%' AND x.DEPT_CODE LIKE '%"+replaceText2
            + "%' AND x.DEPT_NAME LIKE '%" + replaceText3 +  "%' AND x.EMP_STATE LIKE '%"+replaceText4+"%'";

        compopup1({
            compCode: gv_ma_selectedCorpCd
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
                SBUxMethod.set('SRCH_EMP_FULL_NAME', data.EMP_NAME);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
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

        SBUxMethod.set('SRCH_PAY_YYYYMM_FR', openDate);
        SBUxMethod.set('SRCH_PAY_YYYYMM_TO', openDate);

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

    /**
     * 초기화
     */
    var cfn_init = function() {
        gfnma_uxDataClear('#dataArea1');
    }


    const fn_createGrid = function(chMode, rowData) {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwException';
        SBGridProperties.id = 'grdExceptionList';
        SBGridProperties.jsonref = 'jsonExceptionList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.rowheader =['update'];
        if (_.isEqual(chMode, 'clear')) { //복사해제모드
            SBGridProperties.selectmode = 'free';
        } else if(_.isEqual(chMode, 'line')){ //행복사모드
            SBGridProperties.selectmode = 'byrow'; //byrow 선택row  채우는 방향 옵션
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
            SBGridProperties.selectcellfocus = true; //selectmode가 byrow, byrows일 때 선택한 셀을 표시 여부를 설정합니다.

        } else if(_.isEqual(chMode, 'cell')){ //셀복사모드
            SBGridProperties.selectmode = 'free';
            SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        }
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.columns = [
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonPayType', displayui : true,  label : 'label', value : 'value'}/*, disabled: true*/
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'input', width: '200px', style: 'text-align:left'/*, disabled: true*/},
            {caption: ["사원검색 팝업"], 	ref: 'POP_BTN', type:'button', width:'100px', style:'text-align:center', /*disabled: true,*/
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' class='ma-btn1' style='width:30px' onClick='fn_gridPopup(event, " + nRow + ", " + nCol + ")'>…</button>";
                }
            },
            {caption: ["이름"], ref: 'EMP_NAME', type: 'input', width: '200px', style: 'text-align:left'/*, disabled: true*/},
            {caption : ["급여항목"], ref : 'PAY_ITEM_CODE', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonPayItemCode',  displayui : true, label : 'label', value : 'value'}/*, disabled: true*/
            },
            {caption: ['귀속년월(FROM)'], ref: 'PAY_YYYYMM_FR', 	width:'200px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}/*, disabled: true*/},
            {caption: ['귀속년월(TO)'], ref: 'PAY_YYYYMM_TO', 	width:'200px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymmdd'}},
            {caption : ["적용구분"], ref : 'PAY_APPLY_TYPE', width : '200px', style : 'text-align:center', type : 'combo',
                typeinfo : {ref : 'jsonApplyType',  displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["적용비율"], ref: 'PAY_APPLY_RATE', type: 'input', width: '200px', style: 'text-align:right',
                format : {type:'number', rule:'#,##0.00', emptyvalue:'0.00'}},
            {caption: ["적용금액"], ref: 'PAY_APPLY_AMT', type: 'input', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' , emptyvalue:'0'}},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '100px', style: 'text-align:left'}

        ];

        grdExceptionList = _SBGrid.create(SBGridProperties);
        grdExceptionList.bind('valuechanged','gridValueChanged');
        grdExceptionList.bind('click', 'fn_view');
        grdExceptionList.bind('keyup', 'fn_keyup');
    }

    const fn_keyup = async function(event) {
        if(event.keyCode == 38 || event.keyCode == 40) {
            fn_view();
        }
    }

    //상세정보 보기
    async function fn_view() {
        var nCol = grdExceptionList.getCol();
        var nRow = grdExceptionList.getRow();

        if (nCol < 1){
            return;
        }

        if (nRow < 1){
            return;
        }

        let gridData = grdExceptionList.getRowData(nRow);

        fn_ColumnSetting(nRow,gridData.PAY_APPLY_TYPE);

    }


    /**
     * 그리드내 팝업 조회
     */
    function fn_gridPopup(event, row, col) {

      /*  if (!_.isEmpty(row)){
            grdExceptionList.setRowStatus(row, 'u', true);
        }*/

        let rowData = grdExceptionList.getRowData(row);
        let rowStatus = grdExceptionList.getRowStatus(row);


      /*  if (_.isEqual(rowStatus, 1) || _.isEqual(rowStatus, 3)){*/

        let searchText = '';
        if (!_.isEmpty(rowData)){
            searchText = rowData.EMP_CODE;
        }

        event.stopPropagation();	//이벤트가 그리드에 전파되는것 중지
        fn_compopup2(row, col, searchText);

       /* }else{
            return false;
        }*/


    }

    /**
     * 그리드내 공통팝업 오픈
     */
    var fn_compopup2 = function(row, col, searchTt) {

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원 조회');
        SBUxMethod.openModal('modal-compopup1');

        var searchText 		= searchTt;
        var replaceText0 	= "_EMP_CODE_";
        var replaceText1 	= "_EMP_NAME_";
        var strWhereClause 	= "AND X.EMP_CODE LIKE '%" + replaceText0 + "%' AND X.EMP_NAME LIKE '%" + replaceText1 + "%' AND X.EMP_STATE = 'WORK'";

        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRI001_ESS'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["사번", 		"사원명"]
            ,searchInputFields		: ["EMP_CODE", 	"EMP_NAME"]
            ,searchInputValues		: [searchText, 	""]
            ,height					: '400px'
            ,tableHeader			: ["사번", "직원명", "부서코드", "부서명", "사업장명","직위명"]
            ,tableColumnNames		: ["EMP_CODE", "EMP_NAME",  "DEPT_CODE", "DEPT_NAME","SITE_NAME","POSITION_NAME"]
            ,tableColumnWidths		: ["80px", "80px", "80px", "120px", "120px", "100px"]
            ,itemSelectEvent		: function (data){
                //그리드내 원하는 위치에 값 셋팅하기
                grdExceptionList.setCellData(row, (col-1), data['EMP_CODE']);
                grdExceptionList.setCellData(row, (col+1), data['EMP_NAME']);
            }
        });
    }


    // 행 추가
    const fn_addRow = function() {
        let rowVal = grdExceptionList.getRow();

        const msg = {
            PAY_TYPE                : '',
            EMP_CODE                : '',
            EMP_NAME                : '',
            PAY_ITEM_CODE           : '',
            PAY_YYYYMM_FR           : '',
            PAY_YYYYMM_TO           : '',
            PAY_APPLY_TYPE          : '',
            PAY_APPLY_RATE          : 0,
            PAY_APPLY_AMT           : 0,
            MEMO                    : '',

            status: 'i'
        }

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            grdExceptionList.addRow(true, msg);
           /* let rows = grdExceptionList.getRows()-2;
            grdExceptionList.setCellDisabled(rows, 0, rows, 5, false, true, true);*/

        }else{
            grdExceptionList.insertRow(rowVal, 'below', msg);
            /*grdExceptionList.setCellDisabled(rowVal, 0, rows, 5, false, true, true);*/
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

        let SITE_CODE       = gfn_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        let PAY_TYPE        = gfn_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let PAY_YYYYMM_FR   = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM_FR")); // 귀속년월 시작
        let PAY_YYYYMM_TO   = gfn_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM_TO")); // 귀속년월 종료
        let PAY_ITEM_CODE   = gfn_nvl(SBUxMethod.get("SRCH_PAY_ITEM_CODE")); //급여항목
        let EMP_CODE        = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원코드

        if (!PAY_YYYYMM_FR) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_YYYYMM_TO) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
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
        try {
            if (_.isEqual("S", data.resultStatus)) {


                /** @type {number} **/
                let totalRecordCount = 0;

                jsonExceptionList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        PAY_TYPE		: gfn_nvl(item.PAY_TYPE),
                        EMP_CODE		: gfn_nvl(item.EMP_CODE),
                        EMP_NAME		: gfn_nvl(item.EMP_NAME),
                        PAY_ITEM_CODE   : gfn_nvl(item.PAY_ITEM_CODE),
                        PAY_YYYYMM_FR	: gfn_nvl(item.PAY_YYYYMM_FR),
                        PAY_YYYYMM_TO	: gfn_nvl(item.PAY_YYYYMM_TO),
                        PAY_APPLY_TYPE	: gfn_nvl(item.PAY_APPLY_TYPE),
                        PAY_APPLY_RATE	: gfn_nvl(item.PAY_APPLY_RATE),
                        PAY_APPLY_AMT	: gfn_nvl(item.PAY_APPLY_AMT),
                        MEMO 			: gfn_nvl(item.MEMO)
                    }
                    jsonExceptionList.push(msg);
                    totalRecordCount ++;
                });

                grdExceptionList.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if (jsonExceptionList.length > 0){
                    jsonExceptionList.forEach((item, index) => {
                        grdExceptionList.setCellDisabled(index+1, 0, index+1, 5, true, false, true);
                    })
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

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            let listData = [];
            listData =  await getParamForm('u');
           /* var paramObj = {
                P_HRP1170_S: await getParamForm('u')
            }*/

            if (listData.length > 0) {

                const postJsonPromise = gfn_postJSON("/hr/hrp/com/insertHrp1170.do", {listData: listData});

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

    }

    const getParamForm = async function (typeData) {

        let updateData;
        let returnData = [];

        if (_.isEqual(typeData, 'u')) { //업데이트

            updateData = grdExceptionList.getUpdateData(true, 'all');

        } else if (_.isEqual(typeData, 'd')) {

            updateData = grdExceptionList.getUpdateData(true, 'd');

        }

        if (!_.isEmpty(updateData)) {

            updateData.forEach((item, index) => {
                const param = {

                    cv_count: '0',
                    getType: 'json',
                    workType: item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                    params: gfnma_objectToString({

                        V_P_DEBUG_MODE_YN: ''
                        , V_P_LANG_ID: ''
                        , V_P_COMP_CODE: gv_ma_selectedCorpCd
                        , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                        , V_P_PAY_TYPE          : gfn_nvl(item.data.PAY_TYPE)
                        , V_P_EMP_CODE          : gfn_nvl(item.data.EMP_CODE)
                        , V_P_PAY_ITEM_CODE     : gfn_nvl(item.data.PAY_ITEM_CODE)
                        , V_P_PAY_YYYYMM_FR     : gfn_nvl(item.data.PAY_YYYYMM_FR)
                        , V_P_PAY_YYYYMM_TO     : gfn_nvl(item.data.PAY_YYYYMM_TO)
                        , V_P_PAY_APPLY_TYPE    : gfn_nvl(item.data.PAY_APPLY_TYPE)
                        , V_P_PAY_APPLY_RATE    : gfn_nvl(item.data.PAY_APPLY_RATE) == '' ? 0 : item.data.PAY_APPLY_RATE
                        , V_P_PAY_APPLY_AMT     : gfn_nvl(item.data.PAY_APPLY_AMT) == '' ? 0 : item.data.PAY_APPLY_AMT
                        , V_P_MEMO              : gfn_nvl(item.data.MEMO)

                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''
                    })
                }

                returnData.push(param);

            });

            return returnData;

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

    //월별 급상여 예외자 그리드 변경
    async function gridValueChanged() {

        let nCol = grdExceptionList.getCol();
        let nRow = grdExceptionList.getRow();

        if (nCol == -1){
            return;
        }

        if (nRow == -1){
            return;
        }

        let gridData = grdExceptionList.getRowData(nRow);

        if (nCol == grdExceptionList.getColRef('PAY_APPLY_TYPE')){

            let strType = gridData.PAY_APPLY_TYPE;

            if (strType == 'AMOUNT'){
                grdExceptionList.setCellData(nRow,grdExceptionList.getColRef('PAY_APPLY_RATE'),0,true);
            } else if (strType == 'RATE'){
                grdExceptionList.setCellData(nRow,grdExceptionList.getColRef('PAY_APPLY_AMT'),0,true);
            }

            fn_ColumnSetting(nRow,strType);

           /* fnColumnSetting(strType);*/

        }

    }

    //월별 급상여 예외자 그리드 값 셋팅
    async function fn_ColumnSetting(nRow, strType) {

        if (strType == 'RATE')
        {
            grdExceptionList.setCellDisabled(nRow,grdExceptionList.getColRef('PAY_APPLY_RATE'),nRow, grdExceptionList.getColRef('PAY_APPLY_RATE'), false, false, true );
            grdExceptionList.setCellDisabled(nRow,grdExceptionList.getColRef('PAY_APPLY_AMT'),nRow, grdExceptionList.getColRef('PAY_APPLY_AMT'), true, false, true );
           /* grdExceptionList.setCellStyle('background-color', nRow,grdExceptionList.getColRef('PAY_APPLY_RATE'),nRow, grdExceptionList.getColRef('PAY_APPLY_RATE'), '#FFFFFF');
            grdExceptionList.setCellStyle('background-color', nRow,grdExceptionList.getColRef('PAY_APPLY_AMT'),nRow, grdExceptionList.getColRef('PAY_APPLY_AMT'), '#ccccc');
           */ /*gvwException.Columns["pay_apply_rate"].OptionsColumn.AllowEdit = false;
            //gvwException.Columns["pay_apply_rate"].AllowBlank = true;
            gvwException.Columns["pay_apply_rate"].AppearanceHeader.ForeColor = AppearanceGridForeColor;
            gvwException.Columns["pay_apply_amt"].OptionsColumn.AllowEdit = true;
            //gvwException.Columns["pay_apply_amt"].AllowBlank = false;
            gvwException.Columns["pay_apply_amt"].AppearanceHeader.ForeColor = AllowBlankGridColor;*/
        }
        else if (strType == 'AMOUNT')
        {
            grdExceptionList.setCellDisabled(nRow,grdExceptionList.getColRef('PAY_APPLY_RATE'),nRow, grdExceptionList.getColRef('PAY_APPLY_RATE'), true, false, true );
            grdExceptionList.setCellDisabled(nRow,grdExceptionList.getColRef('PAY_APPLY_AMT'),nRow, grdExceptionList.getColRef('PAY_APPLY_AMT'), false, false, true );
           /* grdExceptionList.setCellStyle('background-color', nRow,grdExceptionList.getColRef('PAY_APPLY_RATE'),nRow, grdExceptionList.getColRef('PAY_APPLY_RATE'), '#FFFFFF');
            grdExceptionList.setCellStyle('background-color', nRow,grdExceptionList.getColRef('PAY_APPLY_AMT'),nRow, grdExceptionList.getColRef('PAY_APPLY_AMT'), '#ccccc');
*/

            /*gvwException.Columns["pay_apply_rate"].OptionsColumn.AllowEdit = true;
            //gvwException.Columns["pay_apply_rate"].AllowBlank = false;
            gvwException.Columns["pay_apply_rate"].AppearanceHeader.ForeColor = AllowBlankGridColor;
            gvwException.Columns["pay_apply_amt"].OptionsColumn.AllowEdit = false;
            //gvwException.Columns["pay_apply_amt"].AllowBlank = true;
            gvwException.Columns["pay_apply_amt"].AppearanceHeader.ForeColor = AppearanceGridForeColor;*/
        }

    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
