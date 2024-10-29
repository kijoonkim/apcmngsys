<%
    /**
     * @Class Name        : hrp2420.jsp
     * @Description       : 급여대장( 급여명세서 일괄출력 ) 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.07.08
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.08   	표주완		최초 생성
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
    <title>title : 급여대장</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../../frame/inc/clipreport.jsp" %>

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
                <sbux-button id="btnFile" name="btnFile" uitype="normal" text="파일저장"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnFile"></sbux-button>
                <sbux-button id="btnPrint" name="btnPrint" uitype="normal" text="출력"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnPrint"></sbux-button>
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
                <th scope="row" class="th_bg">사업장</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_SITE_CODE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="SRCH_SITE_CODE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="2" style="border-right: hidden;"></td>

                <th scope="row" class="th_bg">급여영역</th>
                <td class="td_input">
                    <sbux-select
                            id="SRCH_PAY_AREA_TYPE"
                            uitype="single"
                            jsondata-ref="jsonPayAreaType"
                            unselected-text="선택"
                            class="form-control input-sm"
                            <%--onchange="fn_payType"--%>>
                    </sbux-select>
                </td>
                <td colspan="2" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">발송구분</th>
                <td colspan="3" class="td_input">
                    <sbux-radio id="ALL" name="SENDTYPE" uitype="normal"
                                text="전체" value="ALL" checked>
                    </sbux-radio>
                    <sbux-radio id="PAY" name="SENDTYPE" uitype="normal"
                                text="급여명세" value="PAY">
                    </sbux-radio>
                    <sbux-radio id="WORK" name="SENDTYPE" uitype="normal"
                                text="근태현황" value="WORK">
                    </sbux-radio>
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">귀속년월</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_PAY_YYYYMM_FR"
                            name="SRCH_PAY_YYYYMM_FR"
                            uitype="popup"
                            datepicker-mode="month"
                            date-format="yyyymm"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            style="width: 95%;"
                            required>
                        <%--onchange="fn_payDate"--%>
                    </sbux-datepicker>
                </td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_PAY_YYYYMM_FR2"
                            name="SRCH_PAY_YYYYMM_FR2"
                            uitype="popup"
                            datepicker-mode="month"
                            date-format="yyyymm"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            style="width: 95%;"
                            required>
                        <%--onchange="fn_payDate"--%>
                    </sbux-datepicker>
                </td>
                <td style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">지급구분</th>
                <td class="td_input">
                    <sbux-select
                            id="SRCH_PAY_TYPE"
                            uitype="single"
                            jsondata-ref="jsonPayType"
                            unselected-text="선택"
                            class="form-control input-sm inpt_data_reqed"
                            required
                    <%--onchange="fn_payType"--%>>
                    </sbux-select>
                </td>
                <td colspan="2" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">연간누계 출력여부</th>
                <td colspan="3" class="td_input" style="border-right: hidden;">
                    <sbux-checkbox
                            id="SRCH_MULTI_YN"
                            name="SRCH_MULTI_YN"
                            uitype="normal"
                            text=""
                            true-value="Y"
                            false-value="N"
                    ></sbux-checkbox>
                </td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">부서</th>
                <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                    <sbux-input
                            uitype="text"
                            id="SRCH_DEPT_CODE"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                    <sbux-input
                    <%-- uitype="hidden"--%>
                            uitype="text"
                            id="SRCH_DEPT_NAME"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td <%--colspan="2"--%> class="td_input" data-group="DEPT">
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
                            id="SRCH_EMP_CODE"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td class="td_input" style="border-right: hidden;" data-group="EMP">
                    <sbux-input
                    <%-- uitype="hidden"--%>
                            uitype="text"
                            id="SRCH_EMP_NAME"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td colspan="5" class="td_input" data-group="EMP">
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup2"
                    ></sbux-button>
                </td>
            </tr>
           <%-- /************** 숨겨져 있는 컬럼 목록 **************/--%>
            <tr>
                <td class="td_input" style="display: none;">
                    <sbux-select
                            id="PAY_DATE"
                            uitype="single"
                            jsondata-ref="jsonPayDate"
                            unselected-text="선택"
                            class="form-control input-sm inpt_data_reqed"
                    <%--onchange="fn_payType"--%>>
                    </sbux-select>
                </td>
                <td class="td_input" style="border-right: hidden; display: none;">
                    <sbux-input
                            uitype="text"
                            id="EMAIL_SUBJECT"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td class="td_input" style="border-right: hidden; display: none;">
                    <sbux-input
                            uitype="text"
                            id="EMAIL_BODY"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
            </tr>
            </tbody>
        </table>


        <%--<div class="row">--%>
        <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
                <li>
                    <span>급여내역</span>
                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                </li>
            </ul>
        </div>
        <div>
            <div id="sb-area-gvwInfo" style="height:300px; width:100%;"></div>
        </div>
        <%-- </div>--%>

        <div class="row">
            <div class="col-sm-5">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>지급항목</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwPay" style="height:230px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-7">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>공제항목</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwDed" style="height:230px; width:100%;"></div>
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
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    //grid 초기화
    var gvwInfoGrid; 			// 그리드를 담기위한 객체 선언
    var jsonInfoList = []; 	    // 그리드의 참조 데이터 주소 선언
    var gvwPayGrid;
    var jsonPayList = [];
    var gvwDedGrid;
    var jsonDedList = [];

    var jsonSiteCode = []; //사업장 ( L_ORG001 )SRCH_SITE_CODE, 	SITE_CODE
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )SRCH_PAY_AREA_TYPE
    var jsonPayType = []; //지급구분 ( L_HRB008 )SRCH_PAY_TYPE, 	PAY_TYPE
    var jsonPayDate = []; //지급일자 ( L_HRP027 )PAY_DATE
    var jsonPositionCode = []; //직위 ( L_HRI002 )POSITION_CODE
    var jsonPayItemCode = []; //급여항목 ( L_HRP011 )PAY_ITEM_CODE
    var jsonPayItemCode2 = []; //공제항목 ( L_HRP012 )PAY_ITEM_CODE

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_TYPE','gvwInfoGrid'], jsonPayType, 'L_HRB008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['PAY_DATE'], jsonPayDate, 'L_HRP027', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_DATE', 'PAY_DATE2', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwPayGrid'], jsonPayItemCode, 'L_HRP011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwDedGrid'], jsonPayItemCode2, 'L_HRP012', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),


            //지급구분
            gfnma_multiSelectInit({
                target			: ['#SRCH_SITE_CODE']
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

    var fn_compopup1 = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CODE", 	"DEPT_NAME",	"BASE_DATE"]
            ,searchInputValues		: ["", 				searchText,		""]

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

    const fn_compopup2 = function() {

        var searchText = gfnma_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 = "_EMP_CODE_";
        var replaceText1 = "_EMP_NAME_";
        var replaceText2 = "_DEPT_CODE_";
        var replaceText3 = "_DEPT_NAME_";
        var replaceText4 = "_EMP_STATE_";
        var strWhereClause = "AND x.EMP_CODE LIKE '%" + replaceText0 + "%' AND x.DEPT_NAME LIKE '%" + replaceText1 + "%' AND x.DEPT_CODE LIKE '%"+replaceText2
            + "%' AND x.DEPT_NAME LIKE '%" + replaceText3 +  "%' AND x.EMP_STATE LIKE '%"+replaceText4+"%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
        compopup1({
            compCode: gv_ma_selectedApcCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_HRI001'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions:    ["부서코드"    , "부서명"     , "사원코드"    ,"사원명"     ,"재직상태"]
            , searchInputFields: ["DEPT_CODE"  , "DEPT_NAME", "EMP_CODE"   ,"EMP_NAME"  ,"EMP_STATE"]
            , searchInputValues: [""           , ""         ,""             ,searchText         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CODE"  , "EMP_NAME"  , "DEPT_NAME"   ,"SITE_NAME"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
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

        let openDate = gfn_dateToYmd(new Date());

        SBUxMethod.set('SRCH_PAY_YYYYMM_FR', openDate);
        SBUxMethod.set('SRCH_PAY_YYYYMM_FR2', openDate);

        fn_createGrid();
        fn_createPayGrid();
        fn_createDedGrid();
    }

    // 신규
    /*  function cfn_add() {
          fn_create();
      }*/
   /* // 저장
    function cfn_save() {
        fn_save();
    }*/
    // 삭제
    /*function cfn_del() {
        fn_delete();
    }*/

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

    //급여내역 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.frozencols = 7;
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [0],
                sum : [10,11,12,13]
            },
            subtotalrow : {
                1: {
                    titlecol: 0,
                    titlevalue: '합계',
                    style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol: 0
                },
            },
            grandtotalrow : {
                titlecol 	: 0,
                titlevalue	: '합계',
                style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                stylestartcol	: 0
            },
            datasorting	: false,
            usedecimal : false,
        };
        SBGridProperties.columns = [
            {caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["사업장"], ref : 'SITE_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '140px', style: 'text-align:left', hidden : true},
            {caption: ["부서"], ref: 'DEPT_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption : ["직위"], ref : 'POSITION_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPositionCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ['귀속년월'], ref: 'PAY_YYYYMM', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true},
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ['지급일'], ref: 'PAY_DATE', width:'140px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["지급총액"], ref: 'PAY_TOTAL_AMT', type: 'output', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["비과세액"], ref: 'TAX_FREE_AMT', type: 'output', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["공제총액"], ref: 'PAY_DEDUCTION_AMT', type: 'output', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["실지급액"], ref: 'PAY_NET_AMT', type: 'output', width: '140px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: [""], ref: 'empty', type: 'output', width: '80px', style: 'text-align:left'}

        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        gvwInfoGrid.bind('click', 'fn_view');
    }

    //지급항목 리스트
    function fn_createPayGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwPay';
        SBGridProperties.id = 'gvwPayGrid';
        SBGridProperties.jsonref = 'jsonPayList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [2],
                sum : [1]
            },
            subtotalrow : {
                1: {
                    titlecol: 0,
                    titlevalue: '합계',
                    style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol: 0
                },
            },
            grandtotalrow : {
                titlecol 	: 0,
                titlevalue	: '합계',
                style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                stylestartcol	: 0
            },
            datasorting	: false,
            usedecimal : false,
        };
        SBGridProperties.columns = [
            {caption : ["급여항목"], ref : 'PAY_ITEM_CODE', width : '170px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'output', width: '250px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["비과세금액"], ref: 'TAX_FREE_AMT', type: 'output', width: '150px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: [""], ref: 'empty', type: 'output', width: '80px', style: 'text-align:left'}

        ];

        gvwPayGrid = _SBGrid.create(SBGridProperties);
        /*gvwPayGrid.bind('click', 'fn_view');*/
    }


    //공제항목 리스트
    function fn_createDedGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwDed';
        SBGridProperties.id = 'gvwDedGrid';
        SBGridProperties.jsonref = 'jsonDedList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [1],
                sum : [1]
            },
            subtotalrow : {
                1: {
                    titlecol: 0,
                    titlevalue: '합계',
                    style: 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                    stylestartcol: 0
                },
            },
            grandtotalrow : {
                titlecol 	: 0,
                titlevalue	: '합계',
                style : 'background-color: rgb(146, 178, 197); font-weight: bold; color: rgb(255, 255, 255);',
                stylestartcol	: 0
            },
            datasorting	: false,
            usedecimal : false,
        };
        SBGridProperties.columns = [
            {caption : ["공제항목"], ref : 'PAY_ITEM_CODE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayItemCode2', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["금액"], ref: 'PAY_AMT', type: 'output', width: '120px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: [""], ref: 'empty', type: 'output', width: '80px', style: 'text-align:left'}
        ];

        gvwDedGrid = _SBGrid.create(SBGridProperties);
        /*gvwPayGrid.bind('click', 'fn_view');*/
    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let SITE_CODE           = gfnma_nvl(SBUxMethod.get("SRCH_SITE_CODE")); //사업장
        let PAY_AREA_TYPE       = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let SENDTYPE            = gfnma_nvl(SBUxMethod.get("SENDTYPE")); //발송구분
        let PAY_YYYYMM_FR       = gfnma_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM_FR")); //귀속년월
        let PAY_YYYYMM_FR2      = gfnma_nvl(SBUxMethod.get("SRCH_PAY_YYYYMM_FR2")); //귀속년월
        let PAY_TYPE            = gfnma_nvl(SBUxMethod.get("SRCH_PAY_TYPE")); //지급구분
        let MULTI_YN            = gfnma_nvl(SBUxMethod.get("SRCH_MULTI_YN")); //연간누계 출력여부
        let DEPT_CODE           = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE            = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원
        let PAY_DATE            = gfnma_nvl(SBUxMethod.get("PAY_DATE")); //지급일자


        if (!PAY_YYYYMM_FR) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_YYYYMM_FR2) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_SITE_CODE     : SITE_CODE
            ,V_P_DEPT_CODE     : DEPT_CODE
            ,V_P_EMP_CODE      : EMP_CODE
            ,V_P_PAY_YYYYMM    : PAY_YYYYMM_FR
            ,V_P_PAY_YYYYMM1   : PAY_YYYYMM_FR2
            ,V_P_PAY_TYPE      : PAY_TYPE
            ,V_P_PAY_DATE      : PAY_DATE
            ,V_P_EMP_CODE_LIST : ''
            ,V_P_PAY_YYYYMM2   : ''
            ,V_P_PAY_TYPE1     : ''
            ,V_P_PAY_DATE1     : ''
            ,V_P_PAY_AREA_TYPE : PAY_AREA_TYPE
            ,V_P_REPORT_TYPE   : SENDTYPE

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };


        const postJsonPromise = gfn_postJSON("/hr/hrp/rep/selectHrp2420List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '20',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {


                /** @type {number} **/
                let totalRecordCount = 0;

                jsonInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN		        : gfnma_nvl(item.CHK_YN),
                        SITE_CODE		    : gfnma_nvl(item.SITE_CODE),
                        DEPT_CODE		    : gfnma_nvl(item.DEPT_CODE),
                        DEPT_NAME		    : gfnma_nvl(item.DEPT_NAME),
                        POSITION_CODE	    : gfnma_nvl(item.POSITION_CODE),
                        POSITION_NAME	    : gfnma_nvl(item.POSITION_NAME),
                        EMP_CODE		    : gfnma_nvl(item.EMP_CODE),
                        EMP_NAME		    : gfnma_nvl(item.EMP_NAME),
                        IN_EMAIL		    : gfnma_nvl(item.IN_EMAIL),
                        PAY_YYYYMM		    : gfnma_nvl(item.PAY_YYYYMM),
                        PAY_TYPE		    : gfnma_nvl(item.PAY_TYPE),
                        PAY_DATE		    : gfnma_nvl(item.PAY_DATE),
                        PAY_TOTAL_AMT		: gfnma_nvl(item.PAY_TOTAL_AMT),
                        TAX_FREE_AMT		: gfnma_nvl(item.TAX_FREE_AMT),
                        PAY_DEDUCTION_AMT	: gfnma_nvl(item.PAY_DEDUCTION_AMT),
                        PAY_NET_AMT		    : gfnma_nvl(item.PAY_NET_AMT),
                        DEPT_CODE_SEQ		: gfnma_nvl(item.DEPT_CODE_SEQ),
                        POSITION_CODE_SEQ	: gfnma_nvl(item.POSITION_CODE_SEQ),

                    }
                    jsonInfoList.push(msg);
                    totalRecordCount ++;
                });

                gvwInfoGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                if(jsonInfoList.length > 0) {
                    gvwInfoGrid.clickRow(1);
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

        let nRow = gvwInfoGrid.getRow();
        let nCol = gvwInfoGrid.getCol();

        if (nCol == -1) {
            return;
        }
        if (nRow < 1) {
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);
        if (!_.isEmpty(rowData)) {

            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                ,V_P_LANG_ID: ''
                ,V_P_COMP_CODE: gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

                ,V_P_SITE_CODE     : ''
                ,V_P_DEPT_CODE     : ''
                ,V_P_EMP_CODE      : rowData.EMP_CODE
                ,V_P_PAY_YYYYMM    : rowData.PAY_YYYYMM
                ,V_P_PAY_YYYYMM1   : rowData.PAY_YYYYMM
                ,V_P_PAY_TYPE      : rowData.PAY_TYPE
                ,V_P_PAY_DATE      : rowData.PAY_DATE
                ,V_P_EMP_CODE_LIST : ''
                ,V_P_PAY_YYYYMM2   : ''
                ,V_P_PAY_TYPE1     : ''
                ,V_P_PAY_DATE1     : ''
                ,V_P_PAY_AREA_TYPE : ''
                ,V_P_REPORT_TYPE   : ''

                ,V_P_FORM_ID: p_formId
                ,V_P_MENU_ID: p_menuId
                ,V_P_PROC_ID: ''
                ,V_P_USERID: ''
                ,V_P_PC: ''
            };


            const postJsonPromise = gfn_postJSON("/hr/hrp/rep/selectHrp2420List.do", {
                getType				: 'json',
                workType			: 'DETAIL',
                cv_count			: '20',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    jsonPayList.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_CODE		: gfnma_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT		        : gfnma_nvl(item.PAY_AMT),
                            TAX_FREE_AMT		: gfnma_nvl(item.TAX_FREE_AMT),

                        }
                        jsonPayList.push(msg);
                    });

                    gvwPayGrid.rebuild();

                    jsonDedList.length = 0;
                    data.cv_3.forEach((item, index) => {
                        const msg = {
                            PAY_ITEM_CODE		: gfnma_nvl(item.PAY_ITEM_CODE),
                            PAY_AMT		        : gfnma_nvl(item.PAY_AMT)

                        }
                        jsonDedList.push(msg);
                    });

                    gvwDedGrid.rebuild();


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

    /**
     * 파일저장
     */
    const fn_btnFile = async function (/*tabMoveVal*/) {

    }
    
    /**
     * 출력
     */
    const fn_btnPrint = async function() {
        var nRow = gvwInfoGrid.getRow();
    	var conn = '';
    	var SENDTYPE = gfnma_nvl(SBUxMethod.get("SENDTYPE")); //발송구분
    	if (nRow < 1) {
            return;
        }
        
        let rowData = gvwInfoGrid.getRowData(nRow);
        
    	if (SENDTYPE == "ALL") {
            conn = await fn_GetReportData('REPORT5', rowData);
            conn = await gfnma_convertDataForReport(conn);
    		gfn_popClipReportPost("", "ma/RPT_HRP2436_Q_ALL.crf", null, conn );	
        } else if(SENDTYPE == "PAY") {
            conn = await fn_GetReportData('REPORT3', rowData);
            conn = await gfnma_convertDataForReport(conn);
    		gfn_popClipReportPost("급여명세서", "ma/RPT_HRP2436_Q_PAY.crf", null, conn );
        } else if(SENDTYPE == "WORK") {
            conn = await fn_GetReportData('REPORT4', rowData);
            conn = await gfnma_convertDataForReport(conn);
    		gfn_popClipReportPost("근태현황", "ma/RPT_HRP2436_Q_WORK.crf", null, conn );
        }
    }
    const fn_GetReportData = async function(workType, obj) {
    	var SENDTYPE = gfnma_nvl(SBUxMethod.get("SENDTYPE")); //발송구분
        var paramObj = {
            V_P_DEBUG_MODE_YN 		: '',
            V_P_LANG_ID 			: '',
            V_P_COMP_CODE 			: gv_ma_selectedApcCd,
            V_P_CLIENT_CODE 		: gv_ma_selectedClntCd,
            
            V_P_SITE_CODE 			: '',
            V_P_DEPT_CODE 			: '',
            V_P_EMP_CODE     		: gfnma_nvl(obj.EMP_CODE),
            V_P_PAY_YYYYMM    		: gfnma_nvl(obj.PAY_YYYYMM),
            V_P_PAY_YYYYMM1       	: gfnma_nvl(obj.PAY_YYYYMM),
            V_P_PAY_TYPE        	: gfnma_nvl(obj.PAY_TYPE),
            V_P_PAY_DATE			: gfnma_nvl(obj.PAY_DATE),
            V_P_EMP_CODE_LIST 		: gfnma_nvl(obj.EMP_CODE),
            V_P_PAY_YYYYMM2 		: gfnma_nvl(obj.PAY_YYYYMM),
            V_P_PAY_TYPE1     		: gfnma_nvl(obj.PAY_TYPE),
            V_P_PAY_DATE1    		: gfnma_nvl(obj.PAY_DATE),
            V_P_PAY_AREA_TYPE       : '',
            V_P_REPORT_TYPE        	: SENDTYPE,
        	
            V_P_FORM_ID 			: p_formId,
            V_P_MENU_ID 			: p_menuId,
            V_P_PROC_ID 			: '',
            V_P_USERID 				: '',
            V_P_PC 					: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/rep/selectHrp2420ReportList.do", {
            getType				: 'json',
            workType			: workType,
            cv_count			: '15',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try { 
            if (_.isEqual("S", data.resultStatus)) {
                if(data.cv_6.length > 0){
					if(SENDTYPE == 'WORK'){
    	                data.cv_6[0].COMP_LOGO = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfnma_nvl(data.cv_6[0].LOGO_FILE_NAME) +"&comp_code="+ gv_ma_selectedApcCd +"&client_code=" + gv_ma_selectedClntCd;
                	}else if(SENDTYPE == 'PAY'){
    	                data.cv_6[0].COMP_LOGO = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfnma_nvl(data.cv_6[0].LOGO_FILE_NAME) +"&comp_code="+ gv_ma_selectedApcCd +"&client_code=" + gv_ma_selectedClntCd;
    	                data.cv_6[0].COMP_STAMP = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfnma_nvl(data.cv_6[0].STAMP_FILE_NAME) +"&comp_code="+ gv_ma_selectedApcCd +"&client_code=" + gv_ma_selectedClntCd;
                	}else if(SENDTYPE == 'ALL'){
    	                data.cv_6[0].COMP_LOGO = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfnma_nvl(data.cv_6[0].LOGO_FILE_NAME) +"&comp_code="+ gv_ma_selectedApcCd +"&client_code=" + gv_ma_selectedClntCd;
    	                data.cv_6[0].COMP_STAMP = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfnma_nvl(data.cv_6[0].STAMP_FILE_NAME) +"&comp_code="+ gv_ma_selectedApcCd +"&client_code=" + gv_ma_selectedClntCd;
                	}
                }
                if(data.cv_13.length > 0){
					if(SENDTYPE == 'ALL'){
    	                data.cv_13[0].COMP_LOGO = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfnma_nvl(data.cv_6[0].LOGO_FILE_NAME) +"&comp_code="+ gv_ma_selectedApcCd +"&client_code=" + gv_ma_selectedClntCd;
    	                data.cv_13[0].COMP_STAMP = data.SERVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfnma_nvl(data.cv_6[0].STAMP_FILE_NAME) +"&comp_code="+ gv_ma_selectedApcCd +"&client_code=" + gv_ma_selectedClntCd;
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
        return data;
    }
    

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
