<%
    /**
     * @Class Name        : hrp1000.jsp
     * @Description       : 연말정산 계산 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.08.12
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.08.12   	표주완		최초 생성
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
    <title>title : 연말정산 계산</title>
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
                        id="btnCancel" name="btnCancel" uitype="normal" text="계산취소"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnCancel" style="float: right;"
                ></sbux-button>
                <sbux-button
                        id="btnCalculation_Auto" name="btnCalculation_Auto" uitype="normal" text="세액계산표준세액 자동 계산"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnCalculation_Auto" style="float: right;"
                ></sbux-button>
                <sbux-button
                        id="btnCalculation" name="btnCalculation" uitype="normal" text="세액계산"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnCalculation" style="float: right;"
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
                <col style="width: 1%">
                <col style="width: 6%">
                <col style="width: 2%">
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
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">급여영역</th>
                <td class="td_input">
                    <sbux-select
                            id="srch-pay_area_type"
                            uitype="single"
                            jsondata-ref="jsonPayAreaType"
                            unselected-text="선택"
                            class="form-control input-sm"
                    <%--onchange="fn_payType"--%>>
                    </sbux-select>
                </td>
                <td colspan="7" style="border-right: hidden;"></td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">정산연도</th>
                <td class="td_input" style="border-right: hidden;">
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
                <td colspan="2" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">정산구분</th>
                <td class="td_input" style="border-right: hidden;">
                    <div class="dropdown">
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button" id="srch-ye_tx_type" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="srch-ye_tx_type" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">계산일</th>
                <td colspan="2" class="td_input inpt_data_reqed" >
                    <sbux-radio id="RETIRE" name="CALC_DATE_TYPE" uitype="normal"
                                text="퇴사일" value="RETIRE"  onchange="fn_changeDate()" checked>
                    </sbux-radio>
                    <sbux-radio id="BASE" name="CALC_DATE_TYPE" uitype="normal"
                                text="기준일" value="BASE" onchange="fn_changeDate()">
                    </sbux-radio>
                </td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-calc_dat"
                            name="srch-calc_dat"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast"
                            style="background-color: #FFC0CB; color: #0a0a0a;"
                    ></sbux-datepicker>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">부서</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-input
                            uitype="text"
                            id="srch-dept_code"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-input
                    <%-- uitype="hidden"--%>
                            uitype="text"
                            id="srch-dept_name"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td <%--colspan="2"--%> class="td_input" >
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup1"
                    ></sbux-button>
                </td>
                <th scope="row" class="th_bg">사원</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-input
                            uitype="text"
                            id="srch-emp_code"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-input
                    <%-- uitype="hidden"--%>
                            uitype="text"
                            id="srch-emp_name"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td class="td_input" >
                    <sbux-button
                            class="btn btn-xs btn-outline-dark"
                            text="찾기" uitype="modal"
                            target-id="modal-compopup1"
                            onclick="fn_compopup2"
                    ></sbux-button>
                </td>
                <th scope="row" class="th_bg">퇴사일</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-retire_date_fr"
                            name="srch-retire_date_fr"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast"
                    ></sbux-datepicker>
                </td>
                <td>~</td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-retire_date_to"
                            name="srch-retire_date_to"
                            uitype="popup"
                            date-format="yyyymmdd"
                            class="form-control input-sm input-sm-ast"
                    ></sbux-datepicker>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="row">
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>연말정산계산</span>
                        <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                    </li>
                </ul>
            </div>
            <div>
                <div id="sb-area-gvwInfo" style="height:530px; width:100%;"></div>
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
    var gvwInfoGrid; 			// 그리드를 담기위한 객체 선언
    var jsonInfoList = []; 	// 그리드의 참조 데이터 주소 선언

    var jsonSiteCode = []; //사업장 ( L_ORG001 )srch-site_code
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )srch-pay_area_type


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['srch-pay_area_type'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonPayAreaType, 'L_HRA033', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),


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

            //사업장
            gfnma_multiSelectInit({
                target			: ['#srch-ye_tx_type']
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
        var searchText 		= gfnma_nvl(SBUxMethod.get("srch-dept_name"));

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
                SBUxMethod.set('srch-dept_name', data.DEPT_NAME);
                SBUxMethod.set('srch-dept_code', data.DEPT_CODE);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {

        var searchText = gfnma_nvl(SBUxMethod.get("srch-emp_name"));
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
                SBUxMethod.set('srch-emp_name', data.EMP_NAME);
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

        fn_createGrid();
        SBUxMethod.attr('srch-calc_dat',	'readonly', true);
        SBUxMethod.hide('srch-calc_dat');

        let openDate = gfn_dateToYm(new Date());
        SBUxMethod.set('srch-ye_tx_yyyy', openDate);
        /*fn_createGrid('clear');

        let openDate = gfn_dateToYm(new Date());

        SBUxMethod.set('srch-pay_yyyymm_fr', openDate);
        SBUxMethod.set('srch-pay_yyyymm_to', openDate);*/

    }



    function cfn_save() {
        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

                fn_save();

        }
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

        //라디오버튼 초기화시 리플레시 해줘야함
        SBUxMethod.refresh('CALC_DATE_TYPE')
    }

    /**
     * 계산일
     */
    var fn_changeDate = function() {

        let DATE_TYPE 	= gfnma_nvl(SBUxMethod.get("CALC_DATE_TYPE"));

        if (_.isEqual(DATE_TYPE, 'RETIRE'))
        {
            SBUxMethod.attr('srch-calc_dat',	'readonly', true);
            SBUxMethod.hide('srch-calc_dat')
            /*ymdcalc_date.Properties.AllowBlank = true;
            ymdcalc_date.Properties.Appearance.BackColor = Color.WhiteSmoke;
            ymdcalc_date.Visible = false;*/
        }
        else if ( _.isEqual(DATE_TYPE, 'BASE'))
        {
            SBUxMethod.attr('srch-calc_dat',	'readonly', false);
            SBUxMethod.show('srch-calc_dat')

            let openDate = gfn_dateToYmd(new Date());


            SBUxMethod.set('srch-calc_dat', openDate);
            /*ymdcalc_date.Properties.AllowBlank = false;
            ymdcalc_date.Properties.Appearance.BackColor = Color.MistyRose;
            ymdcalc_date.Visible = true;
            ymdcalc_date.Text = CurrentDate("");*/
        }
    }


    //연말정산계산 리스트
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
        //그리드 총계 하단 고정
        /*SBGridProperties.frozenbottomrows 	= 1;*/
        SBGridProperties.rowheader = ['update'];
        SBGridProperties.columns = [
            {caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption : ["계산상태"], ref : 'CALC_STATUS', width : '140px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : '', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["부서명"], ref: 'DEPT_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["입사일"],       ref: 'ENTER_DATE', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["퇴사일"],       ref: 'RETIRE_DATE', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["계산일"],       ref: 'CALC_DAT', 		type:'datepicker',  	width:'90px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["표준세액공제 적용"], ref: 'STD_TX_DED_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["표준세액공제 적용 결과"], ref: 'CALC_INC_TX_AMT_STD_APPLY', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},
            {caption: ["표준세액공제 미적용 결과"], ref: 'CALC_INC_TX_AMT_STD_NOAPY', type: 'output', width: '140px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,###' }},

        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        /*gvwInfoGrid.bind('click', 'fn_view');*/
    }

    /**
     * 목록 조회
     */
    const fn_search = async function (/*tabMoveVal*/) {

        let SITE_CODE       = gfnma_multiSelectGet('#srch-site_code'); //사업장
        let PAY_AREA_TYPE   = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let YE_TX_YYYY      = gfnma_nvl(SBUxMethod.get("srch-ye_tx_yyyy")); //정산연도
        let YE_TX_TYPE      = gfnma_multiSelectGet('#srch-ye_tx_type'); //정산구분
        let CALC_DATE_TYPE  = gfnma_nvl(SBUxMethod.get("CALC_DATE_TYPE")); //계산일
        let CALC_DAT        = gfnma_nvl(SBUxMethod.get("srch-calc_dat")); //계산일
        let DEPT_CODE       = gfnma_nvl(SBUxMethod.get("srch-dept_code")); //부서
        let EMP_CODE        = gfnma_nvl(SBUxMethod.get("srch-emp_code")); //사원
        let RETIRE_DATE_FR  = gfnma_nvl(SBUxMethod.get("srch-retire_date_fr")); //퇴사일
        let RETIRE_DATE_TO  = gfnma_nvl(SBUxMethod.get("srch-retire_date_to")); //퇴사일

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }
        if (!CALC_DATE_TYPE) {
            gfn_comAlert("W0002", "계산일");
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
            ,V_P_RET_DAT_FR       : RETIRE_DATE_FR
            ,V_P_RET_DAT_TO       : RETIRE_DATE_TO
            ,V_P_PAY_AREA_TYPE    : PAY_AREA_TYPE


            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };
        console.log('paramObj:', paramObj);

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1500List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log('data:', data);
        try {
            if (_.isEqual("S", data.resultStatus)) {


                /** @type {number} **/
                let totalRecordCount = 0;

                jsonInfoList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        CHK_YN 			                : gfnma_nvl(item.CHK_YN)
                        ,CALC_STATUS 			        : gfnma_nvl(item.CALC_STATUS)
                        ,DEPT_CODE 			            : gfnma_nvl(item.DEPT_CODE)
                        ,DEPT_NAME 			            : gfnma_nvl(item.DEPT_NAME)
                        ,EMP_CODE 			            : gfnma_nvl(item.EMP_CODE)
                        ,EMP_NAME 			            : gfnma_nvl(item.EMP_NAME)
                        ,EMP_FULL_NAME 			        : gfnma_nvl(item.EMP_FULL_NAME)
                        ,ENTER_DATE 			        : gfnma_nvl(item.ENTER_DATE)
                        ,RETIRE_DATE 			        : gfnma_nvl(item.RETIRE_DATE)
                        ,CALC_DAT 			            : gfnma_nvl(item.CALC_DAT)
                        ,STD_TX_DED_YN 			        : gfnma_nvl(item.STD_TX_DED_YN)
                        ,CALC_INC_TX_AMT_STD_APPLY 		: gfnma_nvl(item.CALC_INC_TX_AMT_STD_APPLY)
                        ,CALC_INC_TX_AMT_STD_NOAPY 		: gfnma_nvl(item.CALC_INC_TX_AMT_STD_NOAPY)

                    }
                    jsonInfoList.push(msg);
                    totalRecordCount ++;
                });

                gvwInfoGrid.rebuild();
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
    const fn_save = async function (type) {


            let listData = [];
            listData =  await getParamForm(type);
            /* var paramObj = {
                 P_HRP1170_S: await getParamForm('u')
             }*/

            console.log('--------listData save--------', listData);

            if (listData.length > 0) {

                const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1500.do", {listData: listData});

                const data = await postJsonPromise;

                console.log('--------listData data--------', data);

                try {
                    if (_.isEqual("S", data.resultStatus)) {
                        if (_.isEqual(data.v_errorCode, 'MSG0001') || _.isEqual(data.v_errorCode, 'MSG0002')) {
                            return true;
                        }else{
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
            }else{
                return false;
            }

    }

    const getParamForm = async function (type) {

        let returnData = [];

        let SITE_CODE       = gfnma_multiSelectGet('#srch-site_code'); //사업장
        let PAY_AREA_TYPE   = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let YE_TX_YYYY      = gfnma_nvl(SBUxMethod.get("srch-ye_tx_yyyy")); //정산연도
        let YE_TX_TYPE      = gfnma_multiSelectGet('#srch-ye_tx_type'); //정산구분
        let CALC_DATE_TYPE  = gfnma_nvl(SBUxMethod.get("CALC_DATE_TYPE")); //계산일
        let CALC_DAT        = gfnma_nvl(SBUxMethod.get("srch-calc_dat")); //계산일
        let DEPT_CODE       = gfnma_nvl(SBUxMethod.get("srch-dept_code")); //부서
        let EMP_CODE        = gfnma_nvl(SBUxMethod.get("srch-emp_code")); //사원
        let RETIRE_DATE_FR  = gfnma_nvl(SBUxMethod.get("srch-retire_date_fr")); //퇴사일
        let RETIRE_DATE_TO  = gfnma_nvl(SBUxMethod.get("srch-retire_date_to")); //퇴사일

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }
        if (!CALC_DATE_TYPE) {
            gfn_comAlert("W0002", "계산일");
            return;
        }


        let infoGridData = gvwInfoGrid.getGridDataAll();

        let stremp_code = '';
        let strcalc_date = '';
        let strstandard_tax_ded_yn = '';

        let sendWorkType = 'N';
        let IntRowCount = 0;
        let IntChkCount = 0;

        if (_.isEqual(type, 'PREWORK')) {
            infoGridData.forEach((item, index) => {

                if (item.CHK_YN == 'Y') {
                    IntRowCount++;
                }

            });

            if (IntRowCount > 0) {

                infoGridData.forEach((item, index) => {

                    if (item.CHK_YN == 'Y') {
                        IntChkCount++;

                        if (stremp_code != '') {
                            stremp_code += "|";
                            strstandard_tax_ded_yn += "|";
                            strcalc_date += "|";
                        }

                        stremp_code += item.EMP_CODE;
                        strstandard_tax_ded_yn += item.STD_TX_DED_YN;

                        if (CALC_DATE_TYPE == 'RETIRE') {
                            strcalc_date += item.RETIRE_DATE;
                        } else if (CALC_DATE_TYPE == 'BASE') {
                            strcalc_date += CALC_DAT;
                        }

                        if (IntChkCount % 1000 == 0 || IntChkCount + 1 > IntRowCount) {

                            const param = {

                                cv_count: '0',
                                getType: 'json',
                                workType: type,
                                params: gfnma_objectToString({

                                    V_P_DEBUG_MODE_YN: ''
                                    , V_P_LANG_ID: ''
                                    , V_P_COMP_CODE: gv_ma_selectedApcCd
                                    , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                                    , V_P_YE_TX_YYYY: YE_TX_YYYY
                                    , V_P_YEAR_END_TX_TYPE: YE_TX_TYPE
                                    , V_P_EMP_CODE: stremp_code
                                    , V_P_CALC_DAT: strcalc_date
                                    , V_P_STD_TX_DED_YN: strstandard_tax_ded_yn


                                    , V_P_FORM_ID: p_formId
                                    , V_P_MENU_ID: p_menuId
                                    , V_P_PROC_ID: ''
                                    , V_P_USERID: ''
                                    , V_P_PC: ''
                                })
                            }

                            console.log("---------param--------- : ", param);
                            returnData.push(param);


                        }
                    }

                });
                console.log("---------returnData--------- : ", returnData);
                return returnData;

            } else {
                gfn_comAlert("E0000", "선택한 데이터가 없습니다.");
                return false;
             /*   SetMessageBox("선택한 데이터가 없습니다.");
                return false;*/
            }

        } else {


            const param = {

                cv_count: '0',
                getType: 'json',
                workType: type,
                params: gfnma_objectToString({

                    V_P_DEBUG_MODE_YN: ''
                    , V_P_LANG_ID: ''
                    , V_P_COMP_CODE: gv_ma_selectedApcCd
                    , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                    , V_P_YE_TX_YYYY: YE_TX_YYYY
                    , V_P_YEAR_END_TX_TYPE: YE_TX_TYPE
                    , V_P_EMP_CODE: stremp_code
                    , V_P_CALC_DAT: strcalc_date
                    , V_P_STD_TX_DED_YN: strstandard_tax_ded_yn

                    , V_P_FORM_ID: p_formId
                    , V_P_MENU_ID: p_menuId
                    , V_P_PROC_ID: ''
                    , V_P_USERID: ''
                    , V_P_PC: ''
                })
            }

            console.log("---------param--------- : ", param);
            returnData.push(param);


            console.log("---------returnData--------- : ", returnData);
            return returnData;

        }
    }

    //저장
    const fn_saveS1 = async function (type) {

        let SITE_CODE = gfnma_multiSelectGet('#srch-site_code'); //사업장
        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let YE_TX_YYYY = gfnma_nvl(SBUxMethod.get("srch-ye_tx_yyyy")); //정산연도
        let YE_TX_TYPE = gfnma_multiSelectGet('#srch-ye_tx_type'); //정산구분
        let CALC_DATE_TYPE = gfnma_nvl(SBUxMethod.get("CALC_DATE_TYPE")); //계산일
        let CALC_DAT = gfnma_nvl(SBUxMethod.get("srch-calc_dat")); //계산일
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("srch-dept_code")); //부서
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("srch-emp_code")); //사원
        let RETIRE_DATE_FR = gfnma_nvl(SBUxMethod.get("srch-retire_date_fr")); //퇴사일
        let RETIRE_DATE_TO = gfnma_nvl(SBUxMethod.get("srch-retire_date_to")); //퇴사일

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }
        if (!CALC_DATE_TYPE) {
            gfn_comAlert("W0002", "계산일");
            return;
        }


        let stremp_code = '';
        let strcalc_date = '';

        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            , V_P_YE_TX_YYYY: YE_TX_YYYY
            , V_P_YEAR_END_TX_TYPE: YE_TX_TYPE
            , V_P_EMP_CODE: stremp_code
            , V_P_CALC_DAT: strcalc_date

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''


        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1500S1.do", {
            getType: 'json',
            workType: type,
            cv_count: '0',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if (_.isEqual(data.v_errorCode, 'MSG0001') || _.isEqual(data.v_errorCode, 'MSG0002')) {
                    return true;
                } else {
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

    //세액계산
    const fn_btnCalculation = async function () {

        if (await fn_save('PREWORK'))
        {
            if (await fn_save('CALC'))
            {
                gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                fn_search();
            }
        }

    }

    //계산취소
    const fn_btnCancel = async function () {
        if (await fn_save('PREWORK'))
        {
            if (await fn_save('CANCEL'))
            {
                gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                fn_search();
            }
        }
    }

    //세액계산표준세액 자동 계산
    const fn_btnCalculation_Auto = async function () {

       /* if (await fn_save('PREWORK'))
        {*/
            //MessageBox.Show("세액계산표준세액 자동계산 시작!!");
            if (await fn_saveS1("AUTO"))
            {
                gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                fn_search();
            }
        //}

    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
