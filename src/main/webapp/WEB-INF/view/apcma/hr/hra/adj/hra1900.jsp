<%
    /**
     * @Class Name        : hra1900.jsp
     * @Description       : 연말정산 전산매체생성 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.08.28
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.08.28   	표주완		최초 생성
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
    <title>title : 연말정산 전산매체생성 결과조회</title>
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
                <sbux-button
                        id="btnFile" name="btnFile" uitype="normal" text="파일생성"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnFile" style="float: right;"
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
                    <th scope="row" class="th_bg_search">정산연도</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_YE_TX_YYYY"
                                name="SRCH_YE_TX_YYYY"
                                uitype="popup"
                                datepicker-mode="year"
                                date-format="yyyy"
                                class="table-datepicker-ma inpt_data_reqed"
                                required>
                            <%--onchange="fn_payDate"--%>
                        </sbux-datepicker>
                    </td>
                    <td colspan="3" style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">정산구분</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div class="dropdown">
                            <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle"
                                    type="button" id="SRCH_YE_TX_TYPE" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_YE_TX_TYPE"
                                 style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td colspan="11" style="border-right: hidden;">&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
                <li>
                    <span>파일생성 정보</span>
                </li>
            </ul>
        </div>

        <div>
            <table id="dataArea2" class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width:5%">
                    <col style="width:5%">
                    <col style="width:0.5%">

                    <col style="width:5%">
                    <col style="width:5%">
                    <col style="width:0.5%">

                    <col style="width:5%">
                    <col style="width:5%">
                    <col style="width:0.5%">

                </colgroup>
                <tr>
                    <th scope="row" class="th_bg">제출신고사업장</th>
                    <td class="td_input">
                        <sbux-select
                                id="TX_SITE_CODE"
                                uitype="single"
                                jsondata-ref="jsonTxSiteCode"
                                unselected-text="선택"
                                class="form-control input-sm inpt_data_reqed">
                        </sbux-select>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg">홈택스ID</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="HOME_TAX_ID"
                                class="form-control input-sm inpt_data_reqed"
                        ></sbux-input>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg">제출일</th>
                    <td colspan="2" class="td_input">
                        <sbux-datepicker
                                id="SUBMIT_DATE"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="form-control input-sm input-sm-ast inpt_data_reqed">
                        </sbux-datepicker>
                    </td>
                   <%-- <td style="border-right: hidden;"></td>--%>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">담당자 부서</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="DEPT_NAME"
                                class="form-control input-sm inpt_data_reqed"
                        ></sbux-input>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg">담당자 성명</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="EMP_NAME"
                                class="form-control input-sm inpt_data_reqed"
                        ></sbux-input>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg">담당자 전화번호</th>
                    <td <%--colspan="2"--%> class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="TEL"
                                class="form-control input-sm inpt_data_reqed"
                        ></sbux-input>
                    </td>
                    <td style="border-right: hidden;"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">비고</th>
                    <td colspan="8" class="td_input">
                        <sbux-textarea id="MEMO" name="MEMO"  uitype="normal" rows="3" wrap-style="width:100%">
                        </sbux-textarea>
                    </td>
                    <%--<td style="border-right: hidden;"></td>--%>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">파일생성경로</th>
                    <td colspan="4" class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="FILE_PATH"
                                class="form-control input-sm inpt_data_reqed"
                                readonly
                        ></sbux-input>
                        <input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="fn_importExcelData(event)">
                    </td>
                    <td style="border-right: hidden;"></td>
                    <td colspan="3" class="td_input" >
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="찾기" uitype="normal"
                                onclick="fn_file"
                        ></sbux-button>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">파일생성 암호</th>
                    <td colspan="4" class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="PASSWORD"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="4" style="border-right: hidden;"></td>
                </tr>
            </table>
        </div>
        <sbux-tabs id="tabJson" name="tabJson" uitype="normal" jsondata-ref="tabJsonData" is-scrollable="false">
        </sbux-tabs>
        <div class="tab-content">
            <div id="tabInfo1" >
                <div>
                    <div id="sb-area-gvwC" style="height:380px; width:100%;"></div>
                </div>
            </div>
            <div id="tabInfo2" >
                <div>
                    <div id="sb-area-gvwCA" style="height:380px; width:100%;"></div>
                </div>
            </div>
            <div id="tabInfo3" >
                <div>
                    <div id="sb-area-gvwH" style="height:380px; width:100%;"></div>
                </div>
            </div>
        </div>

        <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
                <li>
                    <span>파일생성 이력</span>
                </li>
            </ul>
        </div>
        <div>
            <div id="sb-area-gvwHistory" style="height:380px; width:100%;"></div>
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
    var p_empCd  = '${loginVO.empCd}';
    //-----------------------------------------------------------


    //grid 초기화
    var gvwCGrid; 			// 그리드를 담기위한 객체 선언
    var jsonCList = []; 	// 그리드의 참조 데이터 주소 선언
    var gvwCAGrid;
    var jsonCAList = [];
    var gvwHGrid;
    var jsonHList = [];
    var gvwHistoryGrid;
    var jsonHistoryList = [];



    var jsonYeTxType = []; //출력구분 ( L_HRA029 )SRCH_YE_TX_TYPE
    var jsonTxSiteCode = []; //제출신고사업장 ( L_ORG003 )TX_SITE_CODE
    var jsonSiteCode = []; //사업장 ( L_ORG001 )SRCH_SITE_CODE
    var jsonMedSocialNoReal = []; //대상자 주민등록번호 ( L_HRA042 )MED_SOCIAL_NO_REAL
    var jsonMedCertificateCode = []; //의료증빙코드 ( L_HRA007 )MED_CERTIFICATE_CODE

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['gvwCGrid','gvwCAGrid','gvwHGrid'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['TX_SITE_CODE'], jsonTxSiteCode, 'L_ORG003', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TAX_SITE_CODE', 'TAX_SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwCGrid','gvwCAGrid','gvwHGrid'], jsonYeTxType, 'L_HRA029', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'TAX_SITE_CODE', 'TAX_SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwCAGrid'], jsonMedSocialNoReal, 'L_HRA042', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwCAGrid'], jsonMedCertificateCode, 'L_HRA007', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),


            //사업장
            /*gfnma_multiSelectInit({
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
            }),*/

            //출력구분
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

    var tabJsonData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "근로소득 지급명세서",     "targetid" : "tabInfo1" ,     "targetvalue" : "근로소득 지급명세서"},
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "의료비 지급명세서",       "targetid" : "tabInfo2" ,     "targetvalue" : "의료비 지급명세서"},
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "기부금 지급명세서",       "targetid" : "tabInfo3" ,     "targetvalue" : "기부금 지급명세서"}
    ];

    var fn_compopup1 = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

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

        var searchText = gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
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

    var tabJsonData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "근로소득 지급명세서",     "targetid" : "tabInfo1" ,     "targetvalue" : "근로소득 지급명세서"},
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "의료비 지급명세서", "targetid" : "tabInfo2" ,     "targetvalue" : "의료비 지급명세서"},
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "기부금 지급명세서",     "targetid" : "tabInfo3" ,     "targetvalue" : "기부금 지급명세서"}
    ];

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        fn_createGrid();
        fn_createCAGrid();
        fn_createHGrid();
        fn_createHistoryGrid();

        let openDate = gfn_dateToYear(new Date());
        SBUxMethod.set('SRCH_YE_TX_YYYY', openDate);

    }



    function cfn_save() {

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            fn_save();

        }
    }

    function cfn_search() {

        fn_search('LIST');


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

    //근로소득 지급명세서 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwC';
        SBGridProperties.id = 'gvwCGrid';
        SBGridProperties.jsonref = 'jsonCList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader =['update'];
        SBGridProperties.columns = [
            {caption : ["정산구분"], ref : 'YE_TX_TYPE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonYeTxType',  label : 'label', value : 'value'}, hidden : true
            },
            {caption : ["사업장"], ref : 'SITE_CODE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode',  label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["부서명"], ref: 'DEPT_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["기부건수"], ref: 'DONATION_COUNT', type: 'output', width: '200px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' /*, rule:'#,###'*/ }, hidden : true},
            {caption: ["기부금액"], ref: 'DONATION_AMT', type: 'output', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }, hidden : true},
            {caption: ["총급여"], ref: 'INC_TOT_AMT', type: 'output', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["결정세액"], ref: 'CALC_INC_TX_AMT', type: 'output', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: ["차감징수세액"], ref: 'INC_TX_AMT', type: 'output', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'},//스타일상 빈값
        ];

        gvwCGrid = _SBGrid.create(SBGridProperties);
        /*   gvwInfoGrid.bind('click', 'fn_view');*/
    }

    //의료비 지급명세서 리스트
    function fn_createCAGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwCA';
        SBGridProperties.id = 'gvwCAGrid';
        SBGridProperties.jsonref = 'jsonCAList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader =['update'];
        SBGridProperties.columns = [
            {caption : ["정산구분"], ref : 'YE_TX_TYPE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonYeTxType',  label : 'label', value : 'value'}, hidden : true
            },
            {caption : ["사업장"], ref : 'SITE_CODE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode',  label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["부서명"], ref: 'DEPT_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption : ["대상자 주민등록번호"], ref : 'MED_SOCIAL_NO_REAL', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonMedSocialNoReal',  label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["사업자등록번호"], ref: 'MED_COM_NUM', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["상호"], ref: 'MED_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption : ["의료증빙코드"], ref : 'MED_CERTIFICATE_CODE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonMedCertificateCode',  label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["건수"], ref: 'MED_COUNT', type: 'output', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' /*, rule:'#,###'*/ , emptyvalue:'0'}},
            {caption: ["금액"], ref: 'MED_EXP_AMT', type: 'output', width: '200px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'},//스타일상 빈값
        ];

        gvwCAGrid = _SBGrid.create(SBGridProperties);
        /*   gvwInfoGrid.bind('click', 'fn_view');*/
    }


    //기부금 지급명세서 리스트
    function fn_createHGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwH';
        SBGridProperties.id = 'gvwHGrid';
        SBGridProperties.jsonref = 'jsonHList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader =['update'];
        SBGridProperties.columns = [
            {caption : ["정산구분"], ref : 'YE_TX_TYPE', width : '230px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonYeTxType',  label : 'label', value : 'value'}, hidden : true
            },
            {caption : ["사업장"], ref : 'SITE_CODE', width : '230px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonSiteCode',  label : 'label', value : 'value'}, hidden : true
            },
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '230px', style: 'text-align:left'},
            {caption: ["부서명"], ref: 'DEPT_NAME', type: 'output', width: '230px', style: 'text-align:left'},
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '230px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '230px', style: 'text-align:left'},
            {caption: ["건수"], ref: 'DON_COUNT', type: 'output', width: '230px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' /*, rule:'#,###'*/ , emptyvalue:'0'}},
            {caption: ["금액"], ref: 'DON_AMT', type: 'output', width: '230px', style: 'text-align:right'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}},  format : { type:'number' , rule:'#,###', emptyvalue:'0' }},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'},//스타일상 빈값
        ];

        gvwHGrid = _SBGrid.create(SBGridProperties);
        /*   gvwInfoGrid.bind('click', 'fn_view');*/
    }

    //기부금 지급명세서 리스트
    function fn_createHistoryGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwHistory';
        SBGridProperties.id = 'gvwHistoryGrid';
        SBGridProperties.jsonref = 'jsonHistoryList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.rowheader =['update'];
        SBGridProperties.columns = [
            {caption: ["연번"], ref: 'SEQ', type: 'output', width: '230px', style: 'text-align:left'},
            {caption: ["생성자"], ref: 'INSERT_USERID', type: 'output', width: '230px', style: 'text-align:left'},
            {caption: ['생성일시'], ref: 'INSERT_TIME', 	width:'230px',	type: 'inputdate', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["생성PC"], ref: 'INSERT_PC', type: 'output', width: '230px', style: 'text-align:left'},
            {caption: ["생성조건"], ref: 'CREATE_COND', type: 'output', width: '230px', style: 'text-align:left'},
            {caption: ["비고"], ref: 'MEMO', type: 'output', width: '350px', style: 'text-align:left'},
            {caption: [""], ref: 'empty', type: 'output', width: '100px', style: 'text-align:left'},//스타일상 빈값

        ];

        gvwHistoryGrid = _SBGrid.create(SBGridProperties);
        /*   gvwInfoGrid.bind('click', 'fn_view');*/
    }

    /**
     * 목록 조회
     */
    const fn_search = async function (strWorkType) {

        let YE_TX_YYYY          = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도
        let YE_TX_TYPE          = gfnma_multiSelectGet('#SRCH_YE_TX_TYPE'); //정산구분

        let TX_SITE_CODE        = gfn_nvl(SBUxMethod.get("TX_SITE_CODE")); //제출신고사업장
        let HOME_TAX_ID         = gfn_nvl(SBUxMethod.get("HOME_TAX_ID")); //홈택스ID
        let SUBMIT_DATE         = gfn_nvl(SBUxMethod.get("SUBMIT_DATE")); //제출일
        let DEPT_NAME           = gfn_nvl(SBUxMethod.get("DEPT_NAME")); //담당자 부서
        let EMP_NAME            = gfn_nvl(SBUxMethod.get("EMP_NAME")); //담당자 성명
        let TEL                 = gfn_nvl(SBUxMethod.get("TEL")); //담당자 전화번호
        let FILE_PATH           = gfn_nvl(SBUxMethod.get("FILE_PATH")); //파일생성경로
        let MEMO                = gfn_nvl(SBUxMethod.get("MEMO")); //비고

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_YE_TX_YYYY         : YE_TX_YYYY
            ,V_P_YEAR_END_TX_TYPE   : YE_TX_TYPE
            ,V_P_EMP_CODE           : p_empCd
            //-- 접속한 사용자 정보
            //-- 파일생성 정보
            ,V_P_TX_SITE_CODE       : TX_SITE_CODE
            ,V_P_HOME_TAX_ID        : HOME_TAX_ID
            ,V_P_SUBMIT_DATE        : SUBMIT_DATE
            ,V_P_DEPT_NAME          : DEPT_NAME
            ,V_P_EMP_NAME           : EMP_NAME
            ,V_P_TEL                : TEL
            ,V_P_MEMO               : MEMO

            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1900List.do", {
            getType				: 'json',
            workType			: strWorkType,
            cv_count			: '12',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {


                jsonCList.length = 0;
                data.cv_2.forEach((item, index) => {
                    const msg = {
                        YE_TX_TYPE 			: gfn_nvl(item.YE_TX_TYPE)
                        ,SITE_CODE 			: gfn_nvl(item.SITE_CODE)
                        ,DEPT_CODE 			: gfn_nvl(item.DEPT_CODE)
                        ,DEPT_NAME 			: gfn_nvl(item.DEPT_NAME)
                        ,EMP_CODE 			: gfn_nvl(item.EMP_CODE)
                        ,EMP_NAME 			: gfn_nvl(item.EMP_NAME)
                        ,INC_TOT_AMT 		: gfn_nvl(item.INC_TOT_AMT)
                        ,CALC_INC_TX_AMT 	: gfn_nvl(item.CALC_INC_TX_AMT)
                        ,NOW_INC_TX_AMT 	: gfn_nvl(item.NOW_INC_TX_AMT)
                        ,INC_TX_AMT 		: gfn_nvl(item.INC_TX_AMT)

                    }
                    jsonCList.push(msg);
                });

                gvwCGrid.rebuild();


                jsonCAList.length = 0;
                data.cv_3.forEach((item, index) => {
                    const msg = {
                        YE_TX_TYPE 			    : gfn_nvl(item.YE_TX_TYPE)
                        ,SITE_CODE 			    : gfn_nvl(item.SITE_CODE)
                        ,DEPT_CODE 			    : gfn_nvl(item.DEPT_CODE)
                        ,DEPT_NAME 			    : gfn_nvl(item.DEPT_NAME)
                        ,EMP_CODE 			    : gfn_nvl(item.EMP_CODE)
                        ,EMP_NAME 			    : gfn_nvl(item.EMP_NAME)
                        ,MED_SOCNO 			    : gfn_nvl(item.MED_SOCNO)
                        ,MED_SOCIAL_NO_REAL 	: gfn_nvl(item.MED_SOCIAL_NO_REAL)
                        ,MED_COM_NUM 			: gfn_nvl(item.MED_COM_NUM)
                        ,MED_NAME 			    : gfn_nvl(item.MED_NAME)
                        ,MED_CERTIFICATE_CODE 	: gfn_nvl(item.MED_CERTIFICATE_CODE)
                        ,MED_COUNT 			    : gfn_nvl(item.MED_COUNT)
                        ,MED_EXP_AMT 			: gfn_nvl(item.MED_EXP_AMT)

                    }
                    jsonCAList.push(msg);
                });

                gvwCAGrid.rebuild();

                jsonHList.length = 0;
                data.cv_4.forEach((item, index) => {
                    const msg = {
                        YE_TX_TYPE 			: gfn_nvl(item.YE_TX_TYPE)
                        ,SITE_CODE 			: gfn_nvl(item.SITE_CODE)
                        ,DEPT_CODE 			: gfn_nvl(item.DEPT_CODE)
                        ,DEPT_NAME 			: gfn_nvl(item.DEPT_NAME)
                        ,EMP_CODE 			: gfn_nvl(item.EMP_CODE)
                        ,EMP_NAME 			: gfn_nvl(item.EMP_NAME)
                        ,DON_COUNT 			: gfn_nvl(item.DON_COUNT)
                        ,DON_AMT 			: gfn_nvl(item.DON_AMT)

                    }
                    jsonHList.push(msg);
                });

                gvwHGrid.rebuild();

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


    const fn_file = async function() {
        document.querySelector("#btnFileUpload").value = "";
        $("#btnFileUpload").click();

    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>


