<%
    /**
     * @Class Name        : hrp1000.jsp
     * @Description       : 연말정산 마감 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.09.17
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.09.17   	표주완		최초 생성
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
    <title>title : 연말정산 마감</title>
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
                <sbux-button
                        id="btnUnconfirm" name="btnUnconfirm" uitype="normal" text="확정취소"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnUnconfirm" style="float: right;"
                ></sbux-button>
                <sbux-button
                        id="btnConfirm" name="btnConfirm" uitype="normal" text="확정"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnConfirm" style="float: right;"
                ></sbux-button>
                <sbux-button
                        id="btnCancel" name="btnCancel" uitype="normal" text="납부세액취소"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnCancel" style="float: right;"
                ></sbux-button>
                <sbux-button
                        id="btnEnd" name="btnEnd" uitype="normal" text="납부세액계산"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnEnd" style="float: right;"
                ></sbux-button>
            </div>
        </div>

        <!--[pp] 검색 -->
        <!--[APC] START -->
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
                <th scope="row" class="th_bg">정산연도</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="SRCH_YE_TX_YYYY"
                            name="SRCH_YE_TX_YYYY"
                            uitype="popup"
                            datepicker-mode="year"
                            date-format="yyyy"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            required>
                        <%--onchange="fn_payDate"--%>
                    </sbux-datepicker>
                </td>
                <td colspan="2" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">정산구분</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="SRCH_YE_TX_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="SRCH_YE_TX_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="2" style="border-right: hidden;"></td>
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
                <td class="td_input" data-group="EMP">
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup2"
                    ></sbux-button>
                </td>
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
            </tr>
            </tbody>
        </table>

        <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
                <li>
                    <span>연말정산마감</span>
                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                </li>
            </ul>
        </div>
        <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
        </sbux-tabs>
        <div class="tab-content">
            <div id="tabInfo1" >
                <div>
                    <div id="sb-area-gvwYearEndTaxBase" style="height:520px; width:100%;"></div>
                </div>
            </div>
            <div id="tabInfo2" >
                <div style="margin-left: auto;">
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
                <div>
                    <div id="sb-area-gvwYearEndTaxResult" style="height:500px; width:100%;"></div>
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

</body>
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    //grid 초기화
    var gvwYearEndTaxBaseGrid; 			// 그리드를 담기위한 객체 선언
    var jsonYearEndTaxBaseList = []; 	// 그리드의 참조 데이터 주소 선언
    var gvwYearEndTaxResultGrid;
    var jsonYearEndTaxResultList = [];


    var jsonYeTxType = []; //출력구분 ( L_HRA029 )SRCH_YE_TX_TYPE
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )SRCH_PAY_AREA_TYPE
    var jsonSiteCode = []; //사업장 ( L_ORG001 )SRCH_SITE_CODE
    var jsonCloseState = []; //사업장 ( L_HRA010 )CLOSE_STATE
    var jsonDeptCode = []; //사업장 ( P_ORG004 )DEPT_CODE


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['gvwYearEndTaxBaseGrid','gvwYearEndTaxResultGrid'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwYearEndTaxBaseGrid','gvwYearEndTaxResultGrid'], jsonYeTxType, 'L_HRA029', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwYearEndTaxBaseGrid','gvwYearEndTaxResultGrid'], jsonCloseState, 'L_HRA010', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwYearEndTaxResultGrid'], jsonDeptCode, 'P_ORG004', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'DEPT_CODE', 'DEPT_NAME', 'Y', ''),


            //사업장
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

            //정산구분
            gfnma_multiSelectInit({
                target			: ['#SRCH_YE_TX_TYPE']
                ,compCode		: gv_ma_selectedApcCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA029'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'CODE_NAME',    		width:'150px',  	style:'text-align:left'}
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
                console.log('callback data:', data);
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
                console.log('callback data:', data);
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CODE);
            },
        });

    }

    var tabJsonData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "정산자료 마감",     "targetid" : "tabInfo1" ,     "targetvalue" : "정산자료 마감"},
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "계산결과 마감",     "targetid" : "tabInfo2" ,     "targetvalue" : "계산결과 마감"},
        /*{ "id" : "2", "pid" : "-1", "order" : "3", "text" : "정산명세",     "targetid" : "tabInfo3" ,     "targetvalue" : "정산명세"} = 정산명세 이전버전*/
    ];

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        fn_createGrid();
        fn_createResultGrid('clear');

        let openDate = gfn_dateToYear(new Date());
        SBUxMethod.set('SRCH_YE_TX_YYYY', openDate);

        SBUxMethod.hideTab('tabJson','tabInfo1');

    }



    function cfn_save() {

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            fn_save('U', '', 'tabInfo2');

        }

    }

    function cfn_search() {

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

    //정산자료마감 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwYearEndTaxBase';
        SBGridProperties.id = 'gvwYearEndTaxBaseGrid';
        SBGridProperties.jsonref = 'jsonYearEndTaxBaseList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["마감상태"], ref : 'CLOSE_STATE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonCloseState', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["확정"], ref: 'CONFIRM_FLAG', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["정산구분"], ref : 'YE_TX_TYPE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonYeTxType', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption : ["사업장"], ref : 'SITE_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption : ["부서명"], ref : 'DEPT_NAME', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["생성자"], ref: 'INSERT_USERID', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ['생성일시'], ref: 'INSERT_TIME', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true, hidden : true},
            {caption: ["생성PC"], ref: 'INSERT_PC', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["변경자"], ref: 'UPDATE_USERID', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ['변경일시'], ref: 'UPDATE_TIME', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true, hidden : true},
            {caption: ["변경PC"], ref: 'UPDATE_PC', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ['시작월'], ref: 'YE_YYYYMM', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true, hidden : true},
            {caption: ["마감여부"], ref: 'SPLIT_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },

        ];

        gvwYearEndTaxBaseGrid = _SBGrid.create(SBGridProperties);

    }

    //계산결과 마감 리스트
    function fn_createResultGrid(chMode, rowData) {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwYearEndTaxResult';
        SBGridProperties.id = 'gvwYearEndTaxResultGrid';
        SBGridProperties.jsonref = 'jsonYearEndTaxResultList';
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
        SBGridProperties.extendlastcol = 'scroll';
        /*SBGridProperties.frozencols = 3;*/
        //그리드 총계 하단 고정
        SBGridProperties.frozenbottomrows 	= 1;
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [1],
                sum : [13,14,15,16,17,18,19,20,21]
            },
            /*subtotalrow : {
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
            },*/
            datasorting	: true,
            usedecimal : false
        };
        SBGridProperties.columns = [
            {caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["마감상태"], ref : 'CLOSE_STATE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonCloseState', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["확정"], ref: 'CONFIRM_FLAG', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["정산구분"], ref : 'YE_TX_TYPE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonYeTxType', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption : ["사업장"], ref : 'SITE_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption : ["부서코드"], ref : 'DEPT_CODE', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonDeptCode', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption : ["부서명"], ref : 'DEPT_NAME', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode', displayui : true, label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ['시작월'], ref: 'YE_YYYYMM', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true, hidden : true},
            {caption: ["분납여부"], ref: 'SPLIT_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: false, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["분납월수"], ref: 'SPLIT_MONTH', type: 'output', width: '120px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' }},
            {caption: ["총세금"], ref: 'TAX_TOT', type: 'output', width: '120px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["총소득세"], ref: 'INC_TAX_TOT', type: 'output', width: '120px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["총지방소득세"], ref: 'LOCAL_TAX_TOT', type: 'output', width: '120px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["소득세(당월)"], ref: 'INC_TAX_01', type: 'output', width: '120px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["지방소득세(당월)"], ref: 'LOCAL_TAX_01', type: 'output', width: '120px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["소득세(M1)"], ref: 'INC_TAX_02', type: 'output', width: '120px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["지방소득세(M1)"], ref: 'LOCAL_TAX_02', type: 'output', width: '120px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["소득세(M2)"], ref: 'INC_TAX_03', type: 'output', width: '120px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["지방소득세(M2)"], ref: 'LOCAL_TAX_03', type: 'output', width: '120px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###' ,  emptyvalue:'0'}},
            {caption: ["생성자"], ref: 'INSERT_USERID', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ['생성일시'], ref: 'INSERT_TIME', 	width:'100px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true, hidden : true},
            {caption: ["생성PC"], ref: 'INSERT_PC', type: 'output', width: '140px', style: 'text-align:left'},

        ];

        gvwYearEndTaxResultGrid = _SBGrid.create(SBGridProperties);

        if (rowData != null){
            gvwYearEndTaxResultGrid.push(rowData);
        }

        /*gvwYearEndTaxResultGrid.bind('valuechanged','gridValueChanged');*/
    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let SITE_CODE           = gfnma_multiSelectGet('#SRCH_SITE_CODE'); //사업장
        let YE_TX_TYPE          = gfnma_multiSelectGet('#SRCH_YE_TX_TYPE'); //정산구분
        let YE_TX_YYYY          = gfnma_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도
        let PAY_AREA_TYPE       = gfnma_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let DEPT_CODE           = gfnma_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE            = gfnma_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_YE_TX_YYYY       : YE_TX_YYYY
            ,V_P_YEAR_END_TX_TYPE : YE_TX_TYPE
            ,V_P_SITE_CODE        : SITE_CODE
            ,V_P_DEPT_CODE        : DEPT_CODE
            ,V_P_EMP_CODE         : EMP_CODE
            ,V_P_PAY_AREA_TYPE    : PAY_AREA_TYPE


            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra2900List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '2',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {


                /** @type {number} **/
                let totalRecordCount = 0;

                jsonYearEndTaxBaseList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN 			                : gfnma_nvl(item.CHK_YN)
                        ,CLOSE_STATE 			        : gfnma_nvl(item.CLOSE_STATE)
                        ,YE_TX_TYPE 			        : gfnma_nvl(item.YE_TX_TYPE)
                        ,SITE_CODE 			            : gfnma_nvl(item.SITE_CODE)
                        ,DEPT_CODE 			            : gfnma_nvl(item.DEPT_CODE)
                        ,DEPT_NAME 			            : gfnma_nvl(item.DEPT_NAME)
                        ,EMP_CODE 			            : gfnma_nvl(item.EMP_CODE)
                        ,EMP_NAME 			            : gfnma_nvl(item.EMP_NAME)
                        ,INSERT_USERID 			        : gfnma_nvl(item.INSERT_USERID)
                        ,INSERT_TIME 			        : gfnma_nvl(item.INSERT_TIME)
                        ,INSERT_PC 			            : gfnma_nvl(item.INSERT_PC)
                        ,UPDATE_USERID 			        : gfnma_nvl(item.UPDATE_USERID)
                        ,UPDATE_TIME 			        : gfnma_nvl(item.UPDATE_TIME)

                    }
                    jsonYearEndTaxBaseList.push(msg);
                    totalRecordCount ++;
                });

                gvwYearEndTaxBaseGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                jsonYearEndTaxResultList.length = 0;
                data.cv_2.forEach((item, index) => {
                    const msg = {
                        CHK_YN 			                : gfnma_nvl(item.CHK_YN)
                        ,CLOSE_STATE 			        : gfnma_nvl(item.CLOSE_STATE)
                        ,CONFIRM_FLAG 			        : gfnma_nvl(item.CONFIRM_FLAG)
                        ,YE_TX_TYPE 			        : gfnma_nvl(item.YE_TX_TYPE)
                        ,SITE_CODE 			            : gfnma_nvl(item.SITE_CODE)
                        ,DEPT_CODE 			            : gfnma_nvl(item.DEPT_CODE)
                        ,DEPT_NAME 			            : gfnma_nvl(item.DEPT_NAME)
                        ,EMP_CODE 			            : gfnma_nvl(item.EMP_CODE)
                        ,EMP_NAME 			            : gfnma_nvl(item.EMP_NAME)
                        ,INSERT_USERID 			        : gfnma_nvl(item.INSERT_USERID)
                        ,INSERT_TIME 			        : gfnma_nvl(item.INSERT_TIME)
                        ,INSERT_PC 			            : gfnma_nvl(item.INSERT_PC)
                        ,SPLIT_YN 			            : gfnma_nvl(item.SPLIT_YN)
                        ,SPLIT_MONTH 			        : gfnma_nvl(item.SPLIT_MONTH)
                        ,YE_YYYYMM 			            : gfnma_nvl(item.YE_YYYYMM)
                        ,TAX_TOT 			            : gfnma_nvl(item.TAX_TOT)
                        ,INC_TAX_TOT 			        : gfnma_nvl(item.INC_TAX_TOT)
                        ,LOCAL_TAX_TOT 			        : gfnma_nvl(item.LOCAL_TAX_TOT)
                        ,INC_TAX_01 			        : gfnma_nvl(item.INC_TAX_01)
                        ,LOCAL_TAX_01 			        : gfnma_nvl(item.LOCAL_TAX_01)
                        ,INC_TAX_02 			        : gfnma_nvl(item.INC_TAX_02)
                        ,LOCAL_TAX_02 			        : gfnma_nvl(item.LOCAL_TAX_02)
                        ,INC_TAX_03 			        : gfnma_nvl(item.INC_TAX_03)
                        ,LOCAL_TAX_03 			        : gfnma_nvl(item.LOCAL_TAX_03)

                    }
                    jsonYearEndTaxResultList.push(msg);
                });

                gvwYearEndTaxResultGrid.rebuild();

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
    const fn_save = async function (strWorkType, strStatus, targetid) {

        let returnData = [];

        let isCount         = false;
        let stremp_code     = '';
        let strsplit_yn     = '';
        let strsplit_month  = '';
        let strinc_tax_01   = '';
        let strlocal_tax_01 = '';
        let strinc_tax_02   = '';
        let strlocal_tax_02 = '';
        let strinc_tax_03   = '';
        let strlocal_tax_03 = '';


        if (_.isEqual(targetid, 'tabInfo2')) {

            let updateData = gvwYearEndTaxResultGrid.getGridDataAll();

            updateData.forEach((item, index) => {

                if (_.isEqual(item.CHK_YN, 'Y')) {


                    isCount = true;
                    stremp_code     += item.EMP_CODE    + '|';
                    strsplit_yn     += item.SPLIT_YN    + '|';
                    strsplit_month  += gfnma_nvl(item.SPLIT_MONTH ) == '' ? 0 + '|' : item.SPLIT_MONTH + '|';
                    strinc_tax_01   += gfnma_nvl(item.INC_TAX_01  ) == '' ? 0 + '|' : item.INC_TAX_01  + '|';
                    strlocal_tax_01 += gfnma_nvl(item.LOCAL_TAX_01) == '' ? 0 + '|' : item.LOCAL_TAX_01+ '|';
                    strinc_tax_02   += gfnma_nvl(item.INC_TAX_02  ) == '' ? 0 + '|' : item.INC_TAX_02  + '|';
                    strlocal_tax_02 += gfnma_nvl(item.LOCAL_TAX_02) == '' ? 0 + '|' : item.LOCAL_TAX_02+ '|';
                    strinc_tax_03   += gfnma_nvl(item.INC_TAX_03  ) == '' ? 0 + '|' : item.INC_TAX_03  + '|';
                    strlocal_tax_03 += gfnma_nvl(item.LOCAL_TAX_03) == '' ? 0 + '|' : item.LOCAL_TAX_03+ '|';
                }
            })

            if (isCount == false) {
                gfn_comAlert("W0003", "저장");		//	W0003	{0}할 대상이 없습니다.
                /*SetMessageBox("저장할 대상이 없습니다.");*/
                return false;
            }
        }

        if (stremp_code != '')
        {
            stremp_code = stremp_code.slice(0, -1)
        }
        if (strsplit_yn != '')
        {
            strsplit_yn = strsplit_yn.slice(0, -1)
        }

        if (strsplit_month != '')
        {
            strsplit_month = strsplit_month.slice(0, -1)

        }
        if (strinc_tax_01 != '')
        {
            strinc_tax_01 = strinc_tax_01.slice(0, -1)

        }
        if (strlocal_tax_01 != '')
        {
            strlocal_tax_01 = strlocal_tax_01.slice(0, -1)

        }
        if (strinc_tax_02 != '')
        {
            strinc_tax_02 = strinc_tax_02.slice(0, -1)

        }
        if (strlocal_tax_02 != '')
        {
            strlocal_tax_02 = strlocal_tax_02.slice(0, -1)

        }
        if (strinc_tax_03 != '')
        {
            strinc_tax_03 = strinc_tax_03.slice(0, -1);

        }
        if (strlocal_tax_03 != '')
        {
            strlocal_tax_03 = strlocal_tax_03.slice(0, -1)
        }

        let YE_TX_TYPE          = gfnma_multiSelectGet('#SRCH_YE_TX_TYPE'); //정산구분
        let YE_TX_YYYY          = gfnma_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_YE_TX_YYYY       : YE_TX_YYYY
            ,V_P_YEAR_END_TX_TYPE : YE_TX_TYPE
            ,V_P_EMP_CODE         : stremp_code
            ,V_P_SPLIT_YN         : strsplit_yn
            ,V_P_SPLIT_MONTH      : strsplit_month
            ,V_P_INC_TAX_01       : strinc_tax_01
            ,V_P_LOCAL_TAX_01     : strlocal_tax_01
            ,V_P_INC_TAX_02       : strinc_tax_02
            ,V_P_LOCAL_TAX_02     : strlocal_tax_02
            ,V_P_INC_TAX_03       : strinc_tax_03
            ,V_P_LOCAL_TAX_03     : strlocal_tax_03
            ,V_P_CLOSE_STATE      : strStatus

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra2900.do", {
            getType: 'json',
            workType: strWorkType,
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
                    cfn_search()
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


    //확정취소
    const fn_btnUnconfirm = async function () {

        var targetid = SBUxMethod.get('tabJson');

        if (_.isEqual(targetid, 'tabInfo1')){

            fn_save('UNCONFIRM', 'CLOSE', targetid);

        }else if (_.isEqual(targetid, 'tabInfo2')){

            fn_save('UNCONFIRM', 'CLOSE', targetid);

        }

    }
    //확정
    const fn_btnConfirm = async function () {

        var targetid = SBUxMethod.get('tabJson');

        if (_.isEqual(targetid, 'tabInfo1')){

            fn_save('CONFIRM', 'CLOSE', targetid);

        }else if (_.isEqual(targetid, 'tabInfo2')){

            fn_save('CONFIRM', 'CLOSE', targetid);

        }
    }

    //납부세액취소
    const fn_btnCancel = async function (type) {

        var targetid = SBUxMethod.get('tabJson');

        if (_.isEqual(targetid, 'tabInfo1')){

            fn_save('BAL_CLOSE', 'P_CLOSE', targetid);

        }else if (_.isEqual(targetid, 'tabInfo2')){

            fn_save('CALC_CLOSE', 'CALCULATE', targetid);

        }

    }

    //납부세액계산
    const fn_btnEnd = async function (type) {

        var targetid = SBUxMethod.get('tabJson');

        if (_.isEqual(targetid, 'tabInfo1')){

            fn_save('BAL_CLOSE', 'CLOSE', targetid);

        }else if (_.isEqual(targetid, 'tabInfo2')){

            fn_save('CALC_CLOSE', 'CLOSE', targetid);

        }

    }

    const fn_gridCopyClear = function (){ /*셀복사 해제 (복사해제모드)*/
        $('#btnCopyClear').hide();
        $('#btnCopyLine').show();
        $('#btnCopyCell').hide();

        /*grdFimList.bind('selectmode', 'free');*/

        let datas = gvwYearEndTaxResultGrid.getGridDataAll();
        _SBGrid.destroy('grdDetail');

        let line = 'line'; //그리드 프로퍼티스 라인모드

        fn_createResultGrid(line, datas);


    }
    const fn_gridCopyLine = function () { /*행복사 (행복사모드)*/
        $('#btnCopyClear').hide();
        $('#btnCopyLine').hide();
        $('#btnCopyCell').show();

        let datas = gvwYearEndTaxResultGrid.getGridDataAll();
        _SBGrid.destroy('grdDetail');

        let cell = 'cell'; //그리드 프로퍼티스 셀모드

        fn_createResultGrid(cell, datas);

    }
    const fn_gridCopyCell = function () { /*셀복사 (셀복사모드)*/
        $('#btnCopyClear').show();
        $('#btnCopyLine').hide();
        $('#btnCopyCell').hide();

        let datas = gvwYearEndTaxResultGrid.getGridDataAll();
        _SBGrid.destroy('grdDetail');

        let clear = 'clear'; //그리드 프로퍼티스 클리어모드

        fn_createResultGrid(clear, datas);
    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>

