<%
    /**
     * @Class Name        : hrp2436.jsp
     * @Description       : 급여명세서 메일발송 정보 화면
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
    <title>title : 급여명세서 메일발송</title>
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
                <sbux-button id="btnFile" name="btnFile" uitype="normal" text="파일저장"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnFile"></sbux-button>
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnSendEmail" name="btnFile" uitype="normal" text="Email 발송"
                             class="btn btn-sm btn-outline-danger" onclick="fn_btnSendEmail"></sbux-button>
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
                        <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="srch-site_code" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <font>선택</font>
                            <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="srch-site_code" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                        </div>
                    </div>
                </td>
                <td colspan="2" style="border-right: hidden;"></td>

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
                <td <%--colspan="2"--%> class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-pay_yyyymm_fr"
                            name="srch-pay_yyyymm_fr"
                            uitype="popup"
                            datepicker-mode="month"
                            date-format="yyyymm"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            style="width: 95%;"
                            required
                            onchange="fn_payDate">
                    </sbux-datepicker>
                </td>
              <%--  <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-pay_yyyymm_fr2"
                            name="srch-pay_yyyymm_fr2"
                            uitype="popup"
                            datepicker-mode="month"
                            date-format="yyyymm"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            style="width: 95%;"
                            required>
                        &lt;%&ndash;onchange="fn_payDate"&ndash;%&gt;
                    </sbux-datepicker>
                </td>--%>
                <td colspan="2" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">지급구분</th>
                <td class="td_input">
                    <sbux-select
                            id="srch-pay_type"
                            uitype="single"
                            jsondata-ref="jsonPayType"
                            unselected-text="선택"
                            class="form-control input-sm inpt_data_reqed"
                            required
                            onchange="fn_payDate">
                    </sbux-select>
                </td>
                <td colspan="2" style="border-right: hidden;"></td>
                <th scope="row" class="th_bg">지급일</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-select
                            id="srch-pay_date"
                            uitype="single"
                            jsondata-ref="jsonPayDate"
                            unselected-text="선택"
                            class="form-control input-sm inpt_data_reqed"
                            required
                    <%--onchange="fn_payType"--%>>
                    </sbux-select>
                </td>
                <th scope="row" class="th_bg" style="display: none">연간누계 출력여부</th>
                <td class="td_input" style="border-right: hidden; display: none">
                    <sbux-checkbox
                            id="srch-multi_yn"
                            name="srch-multi_yn"
                            uitype="normal"
                            text=""
                            true-value="Y"
                            false-value="N"
                    ></sbux-checkbox>
                </td>
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
                <td class="td_input" style="border-right: hidden;">
                    <sbux-checkbox
                            id="chkmulti_cs_yn"
                            name="chkmulti_cs_yn"
                            uitype="normal"
                            text="복수선택"
                            text-left-padding="5px"
                            text-right-padding="25px"
                            true-value="Y"
                            false-value="N"
                    ></sbux-checkbox>
                </td>
                <td class="td_input" style="border-right: hidden; display: none;">
                    <sbux-input
                            uitype="text"
                            id="strCsCodeList"
                            class="form-control input-sm"
                    ></sbux-input>
                </td>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-button
                            id="btnMultiCs"
                            name="btnMultiCs"
                            uitype="normal"
                            text="복수사원"
                            class="btn btn-sm btn-outline-danger"
                            onclick="fn_compopup4"
                    >
                    </sbux-button>
                </td>
                <th scope="row" class="th_bg">파일암호 적용여부</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-checkbox
                            id="chkpassword_yn"
                            name="chkpassword_yn"
                            uitype="normal"
                            text=""
                            text-left-padding="5px"
                            text-right-padding="25px"
                            true-value="Y"
                            false-value="N"
                    ></sbux-checkbox>
                </td>
            </tr>
            <%-- /************** 숨겨져 있는 컬럼 목록 **************/--%>
            <%--<tr>
                <td class="td_input" style="display: none;">
                    <sbux-select
                            id="PAY_DATE"
                            uitype="single"
                            jsondata-ref="jsonPayDate"
                            unselected-text="선택"
                            class="form-control input-sm inpt_data_reqed"
                    &lt;%&ndash;onchange="fn_payType"&ndash;%&gt;>
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
            </tr>--%>
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
        <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
                <li>
                    <span>메일정보</span>
                </li>
            </ul>
        </div>
        <div>
            <table id="dataArea2" class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 3%">
                    <col style="width: 6%">
                    <col style="width: 3%">

                    <col style="width: 3%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">메일제목</th>
                    <td colspan="2" class="td_input" >
                        <sbux-input
                                uitype="text"
                                id="EMAIL_SUBJECT"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="3" class="td_input" >
                        <p>※ 저장된 내용이 발송되므로 편집 후 반드시 저장하세요.</p>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">메일내용</th>
                    <td colspan="2" class="td_input" >
                        <sbux-textarea id="EMAIL_BODY" class="form-control input-sm" uitype="normal" style="width:100%; height: 68px;"></sbux-textarea>
                    </td>
                    <th scope="row" rowspan="2" class="th_bg">급여산정기준</th>
                    <td colspan="2"  rowspan="2" class="td_input" >
                        <sbux-textarea id="PAY_CALCULATE_MEMO" rows="2" class="form-control" uitype="normal" style="width:100%; height: 156px;"></sbux-textarea>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">공지사항</th>
                    <td colspan="2" class="td_input" >
                        <sbux-textarea id="NOTICE_MEMO" class="form-control" uitype="normal" style="width:100%; height:88px;"></sbux-textarea>
                    </td>
                </tr>
                </tbody>
            </table>
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

<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:700px" id="modal-compopup3" name="modal-compopup3" uitype="middle" header-title="" body-html-id="body-modal-compopup3" header-is-close-button="false" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup3">
    <jsp:include page="../../../com/popup/comPopup3.jsp"></jsp:include>
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

    var jsonSiteCode = []; //사업장 ( L_ORG001 )srch-site_code, 	SITE_CODE
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )srch-pay_area_type
    var jsonPayType = []; //지급구분 ( L_HRB008 )srch-pay_type, 	PAY_TYPE
    var jsonPayDate = []; //지급일자 ( L_HRP027 )PAY_DATE
    var jsonPositionCode = []; //직위 ( L_HRI002 )POSITION_CODE
    var jsonPayItemCode = []; //급여항목 ( L_HRP011 )PAY_ITEM_CODE
    var jsonPayItemCode2 = []; //공제항목 ( L_HRP012 )PAY_ITEM_CODE

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['srch-pay_area_type'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['srch-pay_type','gvwInfoGrid'], jsonPayType, 'L_HRB008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['PAY_DATE','srch-pay_date'], jsonPayDate, 'L_HRP027', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_DATE', 'PAY_DATE2', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonPositionCode, 'L_HRI002', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwPayGrid'], jsonPayItemCode, 'L_HRP011', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwDedGrid'], jsonPayItemCode2, 'L_HRP012', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_ITEM_CODE', 'PAY_ITEM_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwDedGrid'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),


            //지급구분
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

    /**
     * 복수코드 팝업
     */
    var fn_compopup4 = function() {

        let strCsCodeList = '';

        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                console.log('callback data:', data);

                if (!_.isEmpty(data)){

                    data.forEach((item, index)=>{
                        strCsCodeList += item +'|'
                    });

                    if (strCsCodeList.length > 0){
                        strCsCodeList = strCsCodeList.slice(0, -1);
                    }

                    SBUxMethod.set("strCsCodeList", strCsCodeList);

                    if (strCsCodeList.replace("|", "") == ""){
                        SBUxMethod.set("chkmulti_cs_yn", 'N');
                    }else {
                        SBUxMethod.set("chkmulti_cs_yn", 'Y');
                    }
                }

            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }
    /**
     * 지급일자 조회
     */
    var fn_payDate = function() {

        let PAY_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm_fr")); //귀속년월
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분

        let V_P_WHERE_CLAUSE = "WHERE site_code IN (select site_code from orgsite where comp_code ='"+gv_ma_selectedApcCd+ "') AND pay_yyyymm = '"
            + PAY_YYYYMM + "' AND pay_type = '" + PAY_TYPE + "'";

        gfnma_setComSelect(['srch-pay_date'], jsonPayDate, 'L_HRP027', V_P_WHERE_CLAUSE, gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_DATE', 'PAY_DATE2', 'Y', '');


    }


    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        let openDate = gfn_dateToYmd(new Date());

        SBUxMethod.set('srch-pay_yyyymm_fr', openDate);
        /*SBUxMethod.set('srch-pay_yyyymm_fr2', openDate);*/

        fn_createGrid();
    }

    // 신규
    /*  function cfn_add() {
          fn_create();
      }*/
     // 저장
     function cfn_save() {
         fn_save();
     }
    // 삭제
    function cfn_del() {
        fn_delete();
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
        SBGridProperties.frozencols = 11;
        SBGridProperties.total = {
            type 		: 'grand',
            position	: 'bottom',
            columns		: {
                standard : [1],
                sum : [9,15,16,17,18]
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
            {caption: ["메일전송(급여명세)"], ref: 'MAIL_SEND_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["메일전송일(급여명세)"], ref: 'MAIL_SEND_TIME', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["메일전송(근태현황)"], ref: 'MAIL_SEND_YN1', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["메일전송일(근태현황)"], ref: 'MAIL_SEND_TIME1', type: 'output', width: '140px', style: 'text-align:left'},
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
            {caption: ["사내이메일"], ref: 'IN_EMAIL', type: 'output', width: '140px', style: 'text-align:left'},
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
            {caption: ["메일전송결과(급여명세)"], ref: 'MAIL_SEND_MSG', type: 'output', width: '140px', style: 'text-align:left'},
            {caption: ["메일전송결과(근태현황)"], ref: 'MAIL_SEND_MSG1', type: 'output', width: '140px', style: 'text-align:left'}

        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        gvwInfoGrid.bind('click', 'fn_view');
    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

        let SITE_CODE = gfnma_nvl(SBUxMethod.get("srch-site_code")); //사업장
        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let SENDTYPE = gfnma_nvl(SBUxMethod.get("SENDTYPE")); //발송구분
        let PAY_YYYYMM_FR = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm_fr")); //귀속년월
      /*  let PAY_YYYYMM_FR2 = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm_fr2")); //귀속년월*/
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
        let MULTI_YN = gfnma_nvl(SBUxMethod.get("srch-multi_yn")); //연간누계 출력여부
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("srch-dept_code")); //부서
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("srch-emp_code")); //사원
        let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); //지급일자

        let CODELIST = gfnma_nvl(SBUxMethod.get("strCsCodeList")); //사원복수선택



        if (!PAY_YYYYMM_FR) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
      /*  if (!PAY_YYYYMM_FR2) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }*/
        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일");
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
            ,V_P_PAY_YYYYMM1   : PAY_YYYYMM_FR
            ,V_P_PAY_TYPE      : PAY_TYPE
            ,V_P_PAY_DATE      : PAY_DATE
            ,V_P_EMP_CODE_LIST : CODELIST
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

        const postJsonPromise = gfn_postJSON("/hr/hrp/rep/selectHrp2436List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '15',
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
                        MAIL_SEND_YN		: gfnma_nvl(item.MAIL_SEND_YN),
                        MAIL_SEND_TIME		: gfnma_nvl(item.MAIL_SEND_TIME),
                        MAIL_SEND_MSG		: gfnma_nvl(item.MAIL_SEND_MSG),
                        MAIL_SEND_YN1		: gfnma_nvl(item.MAIL_SEND_YN1),
                        MAIL_SEND_TIME1		: gfnma_nvl(item.MAIL_SEND_TIME1),
                        MAIL_SEND_MSG1		: gfnma_nvl(item.MAIL_SEND_MSG1),
                        SITE_CODE		    : gfnma_nvl(item.SITE_CODE),
                        DEPT_CODE		    : gfnma_nvl(item.DEPT_CODE),
                        DEPT_NAME		    : gfnma_nvl(item.DEPT_NAME),
                        POSITION_CODE		: gfnma_nvl(item.POSITION_CODE),
                        POSITION_NAME		: gfnma_nvl(item.POSITION_NAME),
                        EMP_CODE		    : gfnma_nvl(item.EMP_CODE),
                        EMP_NAME		    : gfnma_nvl(item.EMP_NAME),
                        IN_EMAIL		    : gfnma_nvl(item.IN_EMAIL),
                        PAY_YYYYMM		    : gfnma_nvl(item.PAY_YYYYMM),
                        PAY_TYPE		    : gfnma_nvl(item.PAY_TYPE),
                        PAY_DATE		    : gfnma_nvl(item.PAY_DATE),
                        PAY_TOTAL_AMT		: gfnma_nvl(item.PAY_TOTAL_AMT),
                        TAX_FREE_AMT		: gfnma_nvl(item.TAX_FREE_AMT),
                        PAY_DEDUCTION_AMT   : gfnma_nvl(item.PAY_DEDUCTION_AMT),
                        PAY_NET_AMT		    : gfnma_nvl(item.PAY_NET_AMT),
                        DEPT_CODE_SEQ		: gfnma_nvl(item.DEPT_CODE_SEQ),
                        POSITION_CODE_SEQ   : gfnma_nvl(item.POSITION_CODE_SEQ)

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
        if (nRow  < 1) {
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);

        let SITE_CODE = gfnma_nvl(SBUxMethod.get("srch-site_code")); //사업장
        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let SENDTYPE = gfnma_nvl(SBUxMethod.get("SENDTYPE")); //발송구분
        let PAY_YYYYMM_FR = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm_fr")); //귀속년월
        /*  let PAY_YYYYMM_FR2 = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm_fr2")); //귀속년월*/
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
        let MULTI_YN = gfnma_nvl(SBUxMethod.get("srch-multi_yn")); //연간누계 출력여부
        let DEPT_CODE = gfnma_nvl(SBUxMethod.get("srch-dept_code")); //부서
        let EMP_CODE = gfnma_nvl(SBUxMethod.get("srch-emp_code")); //사원
        let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); //지급일자

        let CODELIST = gfnma_nvl(SBUxMethod.get("strCsCodeList")); //사원복수선택

        if (!_.isEmpty(rowData)) {

            var paramObj = {
                V_P_DEBUG_MODE_YN: ''
                ,V_P_LANG_ID: ''
                ,V_P_COMP_CODE: gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

                ,V_P_SITE_CODE     : SITE_CODE
                ,V_P_DEPT_CODE     : DEPT_CODE
                ,V_P_EMP_CODE      : rowData.EMP_CODE
                ,V_P_PAY_YYYYMM    : rowData.PAY_YYYYMM
                ,V_P_PAY_YYYYMM1   : rowData.PAY_YYYYMM
                ,V_P_PAY_TYPE      : rowData.PAY_TYPE
                ,V_P_PAY_DATE      : rowData.PAY_DATE
                ,V_P_EMP_CODE_LIST : CODELIST
                ,V_P_PAY_YYYYMM2   : rowData.PAY_YYYYMM
                ,V_P_PAY_TYPE1     : rowData.PAY_TYPE
                ,V_P_PAY_DATE1     : rowData.PAY_DATE
                ,V_P_PAY_AREA_TYPE : PAY_AREA_TYPE
                ,V_P_REPORT_TYPE   : SENDTYPE

                ,V_P_FORM_ID: p_formId
                ,V_P_MENU_ID: p_menuId
                ,V_P_PROC_ID: ''
                ,V_P_USERID: ''
                ,V_P_PC: ''
            };


            const postJsonPromise = gfn_postJSON("/hr/hrp/rep/selectHrp2436List.do", {
                getType				: 'json',
                workType			: 'DETAIL',
                cv_count			: '15',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {


                    data.cv_4.forEach((item, index) => {

                        SBUxMethod.set("EMAIL_SUBJECT", 	gfnma_nvl(item.EMAIL_SUBJECT));
                        SBUxMethod.set("EMAIL_BODY", 	gfnma_nvl(item.EMAIL_BODY));
                        SBUxMethod.set("NOTICE_MEMO", 	gfnma_nvl(item.NOTICE_MEMO));
                        /*SBUxMethod.set("NOTICE_MEMO2", 	gfnma_nvl(item.NOTICE_MEMO2),);*/
                        SBUxMethod.set("PAY_CALCULATE_MEMO", 	gfnma_nvl(item.PAY_CALCULATE_MEMO));

                    });


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

    //저장
    const fn_save = async function () {

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            let PAY_YYYYMM_FR = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm_fr")); //귀속년월
            let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
            let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); //지급일자

            if (!PAY_YYYYMM_FR) {
                gfn_comAlert("W0002", "귀속년월");
                return;
            }
            if (!PAY_TYPE) {
                gfn_comAlert("W0002", "지급구분");
                return;
            }
            if (!PAY_DATE) {
                gfn_comAlert("W0002", "지급일");
                return;
            }

            let EMAIL_SUBJECT 		= gfnma_nvl(SBUxMethod.get("EMAIL_SUBJECT"));
            let EMAIL_BODY 			= gfnma_nvl(SBUxMethod.get("EMAIL_BODY"));
            let PAY_CALCULATE_MEMO  = gfnma_nvl(SBUxMethod.get("PAY_CALCULATE_MEMO"));
            let NOTICE_MEMO 		= gfnma_nvl(SBUxMethod.get("NOTICE_MEMO"));

            if (!EMAIL_SUBJECT) {
                gfn_comAlert("W0002", "메일제목");
                return;
            }
            if (!EMAIL_BODY) {
                gfn_comAlert("W0002", "메일내용");
                return;
            }

            var paramObj = {
                V_P_DEBUG_MODE_YN	    : ''
                ,V_P_LANG_ID		    : ''
                ,V_P_COMP_CODE		    : gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE	    : gv_ma_selectedClntCd

                ,V_P_PAY_YYYYMM         : PAY_YYYYMM_FR
                ,V_P_PAY_TYPE           : PAY_TYPE
                ,V_P_PAY_DATE           : PAY_DATE
                ,V_P_EMAIL_SUBJECT      : EMAIL_SUBJECT
                ,V_P_EMAIL_BODY         : EMAIL_BODY
                ,V_P_NOTICE_MEMO        : NOTICE_MEMO
                ,V_P_PAY_CALCULATE_MEMO : PAY_CALCULATE_MEMO

                ,V_P_FORM_ID            : p_formId
                ,V_P_MENU_ID            : p_menuId
                ,V_P_PROC_ID            : ''
                ,V_P_USERID             : ''
                ,V_P_PC                 : ''


            };
            const postJsonPromise = gfn_postJSON("/hr/hrp/rep/insertHrp2436.do", {
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
                    }else {
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        fn_view();
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

    //삭제
    const fn_del = async function () {
        if (gfn_comConfirm("Q0001", "삭제")) {

            let PAY_YYYYMM_FR = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm_fr")); //귀속년월
            let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
            let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); //지급일자

            if (!PAY_YYYYMM_FR) {
                gfn_comAlert("W0002", "귀속년월");
                return;
            }
            if (!PAY_TYPE) {
                gfn_comAlert("W0002", "지급구분");
                return;
            }
            if (!PAY_DATE) {
                gfn_comAlert("W0002", "지급일");
                return;
            }

            let EMAIL_SUBJECT 		= gfnma_nvl(SBUxMethod.get("EMAIL_SUBJECT"));
            let EMAIL_BODY 			= gfnma_nvl(SBUxMethod.get("EMAIL_BODY"));
            let PAY_CALCULATE_MEMO  = gfnma_nvl(SBUxMethod.get("PAY_CALCULATE_MEMO"));
            let NOTICE_MEMO 		= gfnma_nvl(SBUxMethod.get("NOTICE_MEMO"));

            if (!EMAIL_SUBJECT) {
                gfn_comAlert("W0002", "메일제목");
                return;
            }
            if (!EMAIL_BODY) {
                gfn_comAlert("W0002", "메일내용");
                return;
            }

            var paramObj = {
                V_P_DEBUG_MODE_YN	    : ''
                ,V_P_LANG_ID		    : ''
                ,V_P_COMP_CODE		    : gv_ma_selectedApcCd
                ,V_P_CLIENT_CODE	    : gv_ma_selectedClntCd

                ,V_P_PAY_YYYYMM         : PAY_YYYYMM_FR
                ,V_P_PAY_TYPE           : PAY_TYPE
                ,V_P_PAY_DATE           : PAY_DATE
                ,V_P_EMAIL_SUBJECT      : EMAIL_SUBJECT
                ,V_P_EMAIL_BODY         : EMAIL_BODY
                ,V_P_NOTICE_MEMO        : NOTICE_MEMO
                ,V_P_PAY_CALCULATE_MEMO : PAY_CALCULATE_MEMO

                ,V_P_FORM_ID            : p_formId
                ,V_P_MENU_ID            : p_menuId
                ,V_P_PROC_ID            : ''
                ,V_P_USERID             : ''
                ,V_P_PC                 : ''


            };
            const postJsonPromise = gfn_postJSON("/hr/hrp/rep/insertHrp2436.do", {
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
                    }else {
                        gfn_comAlert("I0001"); // I0001	처리 되었습니다.
                        fn_view();
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

    /**
     * 파일저장
     */
    const fn_btnFile = async function () {

    }

    /**
     * Email 발송
     */
    const fn_btnSendEmail = async function () {

    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
