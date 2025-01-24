<%
    /**
     * @Class Name        : hra1600.jsp
     * @Description       : 원천징수영수증 조회/출력 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.08.14
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.08.14   	표주완		최초 생성
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
    <title>title : 원천징수영수증 조회/출력</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <%@ include file="../../../../frame/inc/clipreport.jsp" %>
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
                        id="btnFile" name="btnFile" uitype="normal" text="파일저장"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnFile" style="float: right;"
                ></sbux-button>
                <sbux-button
                        id="btnSendEmail" name="btnSendEmail" uitype="normal" text="Email 발송"
                        class="btn btn-sm btn-outline-danger" onclick="fn_btnSendEmail" style="float: right;"
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
                    <th scope="row" class="th_bg_search">급여영역</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_PAY_AREA_TYPE"
                                uitype="single"
                                jsondata-ref="jsonPayAreaType"
                                unselected-text="선택"
                                class="form-control input-sm"
                        ></sbux-select>
                    </td>
                    <td style="border-right: hidden;"></td>
                    <th scope="row" class="th_bg_search">암호화여부</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-checkbox
                                id="SRCH_CHKENCRYPTION_YN"
                                name="SRCH_CHKENCRYPTION_YN"
                                uitype="normal"
                                text=""
                                true-value="Y"
                                false-value="N"
                        ></sbux-checkbox>
                    </td>
                    <td colspan="6" style="border-right: hidden;"></td>
                </tr>
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
                            <button style="width:100%;text-align:left"
                                    class="btn btn-sm btn-light dropdown-toggle inpt_data_reqed" type="button"
                                    id="SRCH_YE_TX_TYPE" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                <font>선택</font>
                                <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="SRCH_YE_TX_TYPE"
                                 style="width:300px;height:150px;padding-top:0px;overflow:auto">
                            </div>
                        </div>
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg_search">출력구분</th>
                    <td colspan="3" class="td_input">
                        <sbux-select
                                id="SRCH_PRINT_TYPE"
                                uitype="single"
                                jsondata-ref="jsonPrintType"
                                unselected-text="선택"
                                class="form-control input-sm inpt_data_reqed"
                        <%--onchange="fn_payType"--%>>
                        </sbux-select>
                    </td>
                    <td colspan="6" style="border-right: hidden;">&nbsp;</td>
                    <%-- <th scope="row" class="th_bg">출력유형</th>
                     <td class="td_input">
                         <sbux-select
                                 id="srch-print_type"
                                 uitype="single"
                                 jsondata-ref="jsonPayAreaType"
                                 unselected-text="선택"
                                 class="form-control input-sm"
                         &lt;%&ndash;onchange="fn_payType"&ndash;%&gt;>
                         </sbux-select>
                     </td>
                     <td colspan="3" style="border-right: hidden;">&nbsp;</td>--%>
                </tr>
                <tr>
                    <th scope="row" class="th_bg_search">부서</th>
                    <td class="td_input" style="border-right: hidden;" data-group="DEPT">
                        <sbux-input
                                uitype="text"
                                id="SRCH_DEPT_CODE"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;" data-group="DEPT">
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
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup1"
                        ></sbux-button>
                    </td>
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
                        <%-- uitype="hidden"--%>
                                uitype="text"
                                id="SRCH_EMP_NAME"
                                class="form-control input-sm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right: hidden;" data-group="EMP">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="…" uitype="modal"
                                target-id="modal-compopup1"
                                onclick="fn_compopup2"
                        ></sbux-button>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-checkbox
                                uitype="normal"
                                id="SRCH_MULTI_YN"
                                name="SRCH_MULTI_YN"
                                uitype="normal"
                                class="form-control input-sm"
                                text="복수선택"
                                true-value="Y" false-value="N"
                        />
                    </td>
                    <td colspan="4" class="td_input">
                        <sbux-button
                                class="btn btn-xs btn-outline-dark"
                                text="복수사원" uitype="modal"
                                target-id="modal-compopup3"
                                onclick="btnMultiEmp"
                        ></sbux-button>
                    </td>
                    <th scope="row" class="th_bg_search">근무종료일</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_RETIRE_DATE_FR"
                                name="SRCH_RETIRE_DATE_FR"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="table-datepicker-ma"
                        ></sbux-datepicker>
                    </td>
                    <td>~</td>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                id="SRCH_RETIRE_DATE_TO"
                                name="SRCH_RETIRE_DATE_TO"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="table-datepicker-ma"
                        ></sbux-datepicker>
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
                <li>
                    <span>원천징수영수증</span>
                    <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                </li>
            </ul>
        </div>
        <div>
            <div id="sb-area-gvwInfo" style="height:330px; width:100%;"></div>
        </div>

        <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
                <li>
                    <span>메일 정보</span>
                </li>
            </ul>
        </div>
        <div>
            <table id="dataArea2" class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">

                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">


                    <col style="width: 20%">

                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">메일제목</th>
                    <td colspan="2" class="td_input" >
                        <sbux-textarea id="EMAIL_SUBJECT" name="EMAIL_SUBJECT" rows="1"  uitype="normal" wrap-style="width:100%" class="inpt_data_reqed">
                        </sbux-textarea>
                    </td>
                    <td colspan="3" class="td_input" style="text-align: left;">※ 저장된 내용이 발송되므로 편집 후 반드시 저장하세요.</td>
                    <td rowspan="2" style="border-right: hidden;">&nbsp;</td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">메일내용</th>
                    <td colspan="2" class="td_input" >
                        <sbux-textarea id="EMAIL_BODY" name="EMAIL_BODY"  uitype="normal" rows="5" wrap-style="width:100%" class="inpt_data_reqed">
                        </sbux-textarea>
                    </td>
                    <th scope="row" class="th_bg">공지사항</th>
                    <td colspan="2" class="td_input" >
                        <sbux-textarea id="NOTICE_MEMO" name="NOTICE_MEMO"  uitype="normal" rows="5" wrap-style="width:100%">
                        </sbux-textarea>
                    </td>
                </tr>
                </tbody>
            </table>
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
    var jsonInfoList = []; 	// 그리드의 참조 데이터 주소 선언

    var jsonPrintType = []; //출력구분 ( L_HRA040 )srch-print_type
    var jsonPayAreaType = []; //급여영역 ( L_HRP034 )srch-pay_area_type
    var jsonYeTxType = []; //정산구분 ( L_HRA029 )YE_TX_TYPE

    let strEmail = '';
    let strSmtpHost = '';
    let IntSmtpPort = 25;
    let strUserName = '';
    let strPassword = '';

    let strEmpCodeList = '';

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([

            gfnma_setComSelect(['SRCH_PRINT_TYPE'], jsonPrintType, 'L_HRA040', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['SRCH_PAY_AREA_TYPE'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonYeTxType, 'L_HRA029', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SBSD_CD', 'CD_NM', 'Y', ''),


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
                ,colValue		: 'SITE_CD'
                ,colLabel		: 'SITE_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SITE_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'SITE_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),

            //정산구분
            gfnma_multiSelectInit({
                target			: ['#SRCH_YE_TX_TYPE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA029'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SBSD_CD'
                ,colLabel		: 'CD_NM'
                ,columns		:[
                    {caption: "코드",		ref: 'SBSD_CD', 			width:'150px',  	style:'text-align:left'},
                    {caption: "이름", 		ref: 'CD_NM',    		width:'150px',  	style:'text-align:left'}
                ]
            }),
        ]);


        //출력구분 = 원천징수영수증 값으로 고정
        SBUxMethod.set("SRCH_PRINT_TYPE", '10');
        SBUxMethod.attr('SRCH_PRINT_TYPE',	'readonly', true);
    }

    var fn_compopup1 = function() {
        var searchText 		= gfn_nvl(SBUxMethod.get("SRCH_DEPT_NAME"));

        SBUxMethod.attr('modal-compopup1', 'header-title', '부서정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_ORG001'
            ,popupType				: 'B'
            ,whereClause			: ''
            ,searchCaptions			: ["부서코드", 		"부서명",		"기준일"]
            ,searchInputFields		: ["DEPT_CD", 	"DEPT_NM",	"CRTR_YMD"]
            ,searchInputValues		: ["", 				searchText,		""]

            ,searchInputTypes		: ["input", 		"input",		"datepicker"]		//input, datepicker가 있는 경우

            ,height					: '400px'
            ,tableHeader			: ["기준일",		"사업장", 		"부서명", 		"사업장코드"]
            ,tableColumnNames		: ["BGNG_YMD",	"SITE_NM", 	"DEPT_NM",  	"SITE_CD"]
            ,tableColumnWidths		: ["100px", 		"150px", 		"100px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('SRCH_DEPT_NAME', data.DEPT_NM);
                SBUxMethod.set('SRCH_DEPT_CODE', data.DEPT_CD);
            },
        });
        SBUxMethod.setModalCss('modal-compopup1', {width:'800px'})
    }

    const fn_compopup2 = function() {

        var searchText = gfn_nvl(SBUxMethod.get("SRCH_EMP_NAME"));
        var replaceText0 = "_EMP_CD_";
        var replaceText1 = searchText;
        var replaceText2 = "_DEPT_CD_";
        var replaceText3 = "_DEPT_NM_";
        var replaceText4 = "_EMP_STTS_";
        var strWhereClause = "AND x.EMP_CD LIKE '%" + replaceText0 + "%' AND x.EMP_NM LIKE '%" + replaceText1 + "%' AND x.DEPT_CD LIKE '%"+replaceText2
            + "%' AND x.DEPT_NM LIKE '%" + replaceText3 +  "%' AND x.EMP_STTS LIKE '%"+replaceText4+"%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '사원정보');
        compopup1({
            compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'P_HRI001'
            , popupType: 'A'
            , whereClause: strWhereClause
            , searchCaptions:    ["부서코드"    , "부서명"     , "사원코드"    ,"사원명"     ,"재직상태"]
            , searchInputFields: ["DEPT_CD"  , "DEPT_NM", "EMP_CD"   ,"EMP_NM"  ,"EMP_STTS"]
            , searchInputValues: [""           , ""         ,""             ,searchText         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CD"  , "EMP_NM"  , "DEPT_NM"   ,"SITE_NM"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                SBUxMethod.set('SRCH_EMP_NAME', data.EMP_NM);
                SBUxMethod.set('SRCH_EMP_CODE', data.EMP_CD);
            },
        });

    }

    const btnMultiEmp = function() {
        SBUxMethod.attr('modal-compopup3', 'header-title', '복수코드');
        SBUxMethod.openModal('modal-compopup3');

        compopup3({
            height			: '400px'
            ,callbackEvent	: function (data){
                /*strDocNameList = "";*/
                data.forEach((item, index) => {
                    strEmpCodeList += item + "|";
                });

                if (strDocNameList.length > 0)
                    strEmpCodeList = strDocNameList.substring(0, strDocNameList.length - 1);

                if (strEmpCodeList.replaceAll("|", "") == "")
                    SBUxMethod.set("SRCH_MULTI_YN", "N");
                else
                    SBUxMethod.set("SRCH_MULTI_YN", "Y");
            },
        });
        SBUxMethod.setModalCss('modal-compopup3', {width:'400px'})
    }

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    const fn_init = async function () {

        fn_createGrid();

        let openDate = gfn_dateToYear(new Date());
        SBUxMethod.set('SRCH_YE_TX_YYYY', openDate);

    }



    function cfn_save() {

        // 수정 저장
        if (gfn_comConfirm("Q0001", "수정 저장")) {

            fn_save();

        }
    }

    function cfn_search(){
        if (strEmpCodeList != '')
        {
            fn_search('LIST', strEmpCodeList);
        }
        else
        {
            fn_search("LIST", "");
        }

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
        //출력구분 = 원천징수영수증 값으로 고정
        SBUxMethod.set("SRCH_PRINT_TYPE", '10');
        SBUxMethod.attr('SRCH_PRINT_TYPE',	'readonly', true);
    }

    //원천징수영수증 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        //SBGridProperties.filtering = true; //필터링
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.frozencols = 3;
        SBGridProperties.columns = [
            {caption: [""], ref: 'CHK_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["메일전송"], ref: 'MAIL_SEND_YN', type: 'checkbox', width: '70px', style: 'text-align:center',
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 0, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }
            },
            {caption: ["메일전송일"], ref: 'MAIL_SEND_TIME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["사내이메일"], ref: 'IN_EMAIL', type: 'output', width: '200px', style: 'text-align:left'},
            {caption : ["정산구분"], ref : 'YE_TX_TYPE', width : '200px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonYeTxType',  label : 'label', value : 'value'}
            },
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["부서명"], ref: 'DEPT_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["사번"], ref: 'EMP_CODE', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["이름"], ref: 'EMP_NAME', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["입사일"],       ref: 'ENTER_DATE', 		type:'inputdate',  	width:'200px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["퇴사일"],       ref: 'RETIRE_DATE', 		type:'inputdate',  	width:'200px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["계산일"],       ref: 'CALC_DAT', 		type:'inputdate',  	width:'200px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["근무시작일"],       ref: 'WORK_ST_DAT', 		type:'inputdate',  	width:'200px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            //바인딩 필드가 없음.
            {caption: ["근무종료일"],       ref: 'WORK_ST_DAT11', 		type:'inputdate',  	width:'200px',  	style:'text-align:left',
                typeinfo: {dateformat: 'yyyy-mm-dd'},
                format : {type:'date', rule:'yyyy-mm-dd', origin:'YYYYMMDD'}
                , disabled: true
            },
            {caption: ["메일전송결과"], ref: 'MAIL_SEND_MSG', type: 'output', width: '200px', style: 'text-align:left'},

        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        /* gvwInfoGrid.bind('click', 'fn_view');*/
    }


    /**
     * 목록 조회
     */
    const fn_search = async function (strWorkType, emp_code) {

        let stremp_code = '';

        let SITE_CODE           = gfnma_multiSelectGet('#SRCH_SITE_CODE'); //사업장
        let PAY_AREA_TYPE       = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let CHKENCRYPTION_YN    = gfn_nvl(SBUxMethod.get("SRCH_CHKENCRYPTION_YN").SRCH_CHKENCRYPTION_YN); //암호화여부
        let YE_TX_YYYY          = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도
        let YE_TX_TYPE          = gfnma_multiSelectGet('#SRCH_YE_TX_TYPE'); //정산구분
        let PRINT_TYPE          = gfn_nvl(SBUxMethod.get("SRCH_PRINT_TYPE")); //출력구분
        let DEPT_CODE           = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE            = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원
        let MULTI_YN            = gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN); //복수선택
        let RETIRE_DATE_FR      = gfn_nvl(SBUxMethod.get("SRCH_RETIRE_DATE_FR")); //근무종료일
        let RETIRE_DATE_TO      = gfn_nvl(SBUxMethod.get("SRCH_RETIRE_DATE_TO")); //근무종료일

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }
        if (!PRINT_TYPE) {
            gfn_comAlert("W0002", "출력구분");
            return;
        }

        if (strWorkType == "REPORT3" || strWorkType == "REPORT" || strWorkType == "REPORT_PEN" || strWorkType == "REPORT_MON" )
            //if (strWorkType == "REPORT3" )
        {
            if (emp_code == "")
            {
                gfn_comAlert("E0000", "소득공제신고서를 인쇄할 사원을 선택해주세요.");//W0001{0}
                /*SetMessageBox("소득공제신고서" + GetFormMessage("HRA1600_2023_001")); // 소득공제신고서를 인쇄할 사원을 선택해주세요.*/
                return false;
            }
            stremp_code = emp_code;
        }
        else if(strWorkType == "LIST")
        {
            stremp_code = emp_code;
        }


        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            ,V_P_LANG_ID: ''
            ,V_P_COMP_CODE: gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_YE_TX_YYYY       : YE_TX_YYYY
            ,V_P_YEAR_END_TX_TYPE : YE_TX_TYPE
            ,V_P_SITE_CODE        : SITE_CODE
            ,V_P_DEPT_CODE        : DEPT_CODE
            ,V_P_EMP_CODE         : EMP_CODE
            ,V_P_PRINT_TYPE       : PRINT_TYPE
            ,V_P_PRINT_TYPE1      : ''
            ,V_P_WORK_END_DAT_FR  : RETIRE_DATE_FR
            ,V_P_WORK_END_DAT_TO  : RETIRE_DATE_TO
            ,V_P_EMP_CODE_LIST    : stremp_code
            ,V_P_PAY_AREA_TYPE    : PAY_AREA_TYPE
            ,V_P_CONFIRM_PRINT_YN : ''


            ,V_P_FORM_ID: p_formId
            ,V_P_MENU_ID: p_menuId
            ,V_P_PROC_ID: ''
            ,V_P_USERID: ''
            ,V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1600List.do", {
            getType				: 'json',
            workType			: strWorkType,
            cv_count			: '8',
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
                        CHK_YN 			                : gfn_nvl(item.CHK_YN)
                        , MAIL_SEND_YN 			        : gfn_nvl(item.EML_SEND_YN)
                        , MAIL_SEND_TIME 			    : gfn_nvl(item.EML_SEND_DT)
                        , MAIL_SEND_MSG 			    : gfn_nvl(item.EML_SEND_MSG)
                        , IN_EMAIL 			            : gfn_nvl(item.CO_EML)
                        , YE_TX_TYPE 			        : gfn_nvl(item.YE_TX_TYPE)
                        , DEPT_CODE 			        : gfn_nvl(item.DEPT_CD)
                        , DEPT_NAME 			        : gfn_nvl(item.DEPT_NM)
                        , DEPT_NAME 			        : gfn_nvl(item.DEPT_NM)
                        , c 			                : gfn_nvl(item.c)//PARENT_DEPT??
                        , PARENT_DEPT_NAME 			    : gfn_nvl(item.PARENT_DEPT_NAME)
                        , EMP_CODE 			            : gfn_nvl(item.EMP_CD)
                        , EMP_NAME 			            : gfn_nvl(item.EMP_NM)
                        , ENTER_DATE 			        : gfn_nvl(item.JNCMP_YMD)
                        , RETIRE_DATE 			        : gfn_nvl(item.RTRM_YMD)
                        , CALC_DAT 			            : gfn_nvl(item.CALC_YMD)
                        , WORK_ST_DAT 			        : gfn_nvl(item.WORK_ST_DAT)
                        , WORK_END_DAT 			        : gfn_nvl(item.WORK_END_DAT)


                    }
                    jsonInfoList.push(msg);
                    totalRecordCount ++;
                });

                gvwInfoGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                /*****-- 2. 환결설정의 명세서전송EMAIL*****/
                /* data.cv_2.forEach((item, index) => {
                     SBUxMethod.set("PAY_SEND_EMAIL", 			item.PAY_SEND_EMAIL);//몬지 모르겠음

                 });*/

                //메일정보 테이블 초기화
                gfnma_uxDataClear('#dataArea2');
                /*********  -- 3. 메일 정보**********/
                data.cv_3.forEach((item, index) => {
                    SBUxMethod.set("EMAIL_SUBJECT"  , 			item.EML_SBJT);
                    SBUxMethod.set("EMAIL_BODY"     , 			item.EML_MTXT);
                    SBUxMethod.set("NOTICE_MEMO"    , 			item.NTC_MEMO);

                });

                /* fn_view();*/

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
    /* async function fn_view() {

         let nRow = gvwInfoGrid.getRow();

         if (nRow == -1) {
             nRow = 1;
         }

         let rowData = gvwInfoGrid.getRowData(nRow);

         if (_.isEmpty(rowData) == false) {


             let SITE_CODE = gfnma_multiSelectGet('#SRCH_SITE_CODE'); //사업장
             let PAY_AREA_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
             let CHKENCRYPTION_YN = gfn_nvl(SBUxMethod.get("SRCH_CHKENCRYPTION_YN").SRCH_CHKENCRYPTION_YN); //암호화여부
             let YE_TX_YYYY = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도
             let YE_TX_TYPE = gfnma_multiSelectGet('#SRCH_YE_TX_TYPE'); //정산구분
             let PRINT_TYPE = gfn_nvl(SBUxMethod.get("SRCH_PRINT_TYPE")); //출력구분
             let DEPT_CODE = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
             let EMP_CODE = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원
             let MULTI_YN = gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN); //복수선택
             let RETIRE_DATE_FR = gfn_nvl(SBUxMethod.get("SRCH_RETIRE_DATE_FR")); //근무종료일
             let RETIRE_DATE_TO = gfn_nvl(SBUxMethod.get("SRCH_RETIRE_DATE_TO")); //근무종료일

             if (!YE_TX_YYYY) {
                 gfn_comAlert("W0002", "정산연도");
                 return;
             }
             if (!YE_TX_TYPE) {
                 gfn_comAlert("W0002", "정산구분");
                 return;
             }
             if (!PRINT_TYPE) {
                 gfn_comAlert("W0002", "출력구분");
                 return;
             }

             var paramObj = {
                 V_P_DEBUG_MODE_YN: ''
                 , V_P_LANG_ID: ''
                 , V_P_COMP_CODE: gv_ma_selectedCorpCd
                 , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                 , V_P_YE_TX_YYYY: YE_TX_YYYY
                 , V_P_YEAR_END_TX_TYPE: YE_TX_TYPE
                 , V_P_SITE_CODE: SITE_CODE
                 , V_P_DEPT_CODE: DEPT_CODE
                 , V_P_EMP_CODE: rowData.EMP_CODE
                 , V_P_PRINT_TYPE: PRINT_TYPE
                 , V_P_PRINT_TYPE1: ''
                 , V_P_WORK_END_DAT_FR: RETIRE_DATE_FR
                 , V_P_WORK_END_DAT_TO: RETIRE_DATE_TO
                 , V_P_EMP_CODE_LIST: rowData.EMP_CODE
                 , V_P_PAY_AREA_TYPE: PAY_AREA_TYPE
                 , V_P_CONFIRM_PRINT_YN: ''


                 , V_P_FORM_ID: p_formId
                 , V_P_MENU_ID: p_menuId
                 , V_P_PROC_ID: ''
                 , V_P_USERID: ''
                 , V_P_PC: ''
             };


             const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHra1600List.do", {
                 getType: 'json',
                 workType: 'LIST',
                 cv_count: '8',
                 params: gfnma_objectToString(paramObj)
             });

             const data = await postJsonPromise;

             try {
                 if (_.isEqual("S", data.resultStatus)) {

                     /!*****-- 2. 환결설정의 명세서전송EMAIL*****!/
                     /!* data.cv_2.forEach((item, index) => {
                          SBUxMethod.set("PAY_SEND_EMAIL", 			item.PAY_SEND_EMAIL);//몬지 모르겠음

                      });*!/

                     //메일정보 테이블 초기화
                     gfnma_uxDataClear('#dataArea2');
                     /!*********  -- 3. 메일 정보**********!/
                     data.cv_3.forEach((item, index) => {
                         SBUxMethod.set("EMAIL_SUBJECT", item.EMAIL_SUBJECT);
                         SBUxMethod.set("EMAIL_BODY", item.EMAIL_BODY);
                         SBUxMethod.set("NOTICE_MEMO", item.NOTICE_MEMO);

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

     }*/


    //저장
    const fn_save = async function () {

        let emp_code = '';

        let YE_TX_YYYY          = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도
        let YE_TX_TYPE          = gfnma_multiSelectGet('#SRCH_YE_TX_TYPE'); //정산구분
        let PRINT_TYPE          = gfn_nvl(SBUxMethod.get("SRCH_PRINT_TYPE")); //출력구분

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }
        if (!PRINT_TYPE) {
            gfn_comAlert("W0002", "출력구분");
            return;
        }

        let EMAIL_SUBJECT      = gfn_nvl(SBUxMethod.get("EMAIL_SUBJECT")); //메일제목
        let EMAIL_BODY      = gfn_nvl(SBUxMethod.get("EMAIL_BODY")); //메일내용
        let NOTICE_MEMO      = gfn_nvl(SBUxMethod.get("NOTICE_MEMO")); //공지사항

        if (!EMAIL_SUBJECT) {
            gfn_comAlert("W0002", "메일제목");
            return;
        }
        if (!EMAIL_BODY) {
            gfn_comAlert("W0002", "메일내용");
            return;
        }

        let nRow = gvwInfoGrid.getRow();

        if (nRow == -1){
            gfn_comAlert("E0000", "원천징수영수증을 선택 해주세요.")
            return;
        }

        let rowData = gvwInfoGrid.getRowData(nRow);

        if (_.isEmpty(rowData) == false){

            emp_code = rowData.EMP_CODE;
        }


        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedCorpCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_YE_TX_YYYY       : YE_TX_YYYY
            ,V_P_YEAR_END_TX_TYPE : YE_TX_TYPE
            ,V_P_EMP_CODE         : emp_code              //v_p_emp_code
            ,V_P_PRINTABLE_YN     : ''              //v_p_printable_yn
            ,V_P_EMAIL_SUBJECT    : EMAIL_SUBJECT
            ,V_P_EMAIL_BODY       : EMAIL_BODY
            ,V_P_NOTICE_MEMO      : NOTICE_MEMO

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/insertHra1600.do", {
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

                cfn_search();

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

    /**
     * 파일저장
     */
    const fn_btnFile = async function() {

        let checkDatas = gvwInfoGrid.getCheckedRowData( gvwInfoGrid.getColRef('CHK_YN') );

        if (_.isEmpty(checkDatas)){
            gfn_comAlert("Q0000","파일 저장할 항목을 체크박스 선택하세요.");
            return;
        }

        for (let i = 0; i < checkDatas.length; i++) {

            let datas = [];
            datas.push(checkDatas[i]);

            conn = await fn_GetReportDataIncomeC(datas);
            conn = await gfnma_convertDataForReport(conn);
            let psw = conn[0].data.root[0].SOCIAL_NUM; //주민등록번호

            await gfn_getReportPdf("근로소득 원천징수영수증.pdf", "ma/RPT_HRA1600_INCOME_C.crf", conn, {	userPassword : psw, ownerPassword : '1111'},
                function(){
                    gfn_comConfirm("Q0001", "다운로드");
                }
            );
        }
    }

    //근로소득 원천징수영수증 리포트
    const fn_GetReportDataIncomeC = async function(checkData) {

        let obj = checkData[0].data;
        let YE_TX_YYYY          = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도
        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }

        let YEAR_END_TX_TYPE = gfn_nvl(obj.YE_TX_TYPE);
        let EMP_CODE = gfn_nvl(obj.EMP_CODE);
        //let INCOME_YEAR = gfn_nvl(obj.INCOME_YEAR);
        let INCOME_RECEIVE_START_DATE = gfn_nvl(obj.WORK_ST_DAT);
        let INCOME_RECEIVE_END_DATE = gfn_nvl(obj.WORK_END_DAT);
        let RETIRE_YYYY = gfn_nvl(obj.RETIRE_DATE) == '' ? '' : obj.RETIRE_DATE.substring(0, 4);

        /*  if(INCOME_YEAR == RETIRE_YYYY){
              YEAR_END_TX_TYPE = 'RETIRE';
          }else{
              YEAR_END_TX_TYPE = 'YEAREND';
          }*/
        var paramObj = {
            V_P_DEBUG_MODE_YN       : '',
            V_P_LANG_ID             : '',
            V_P_COMP_CODE           : gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE         : gv_ma_selectedClntCd,
            V_P_YE_TX_YYYY          : YE_TX_YYYY,
            V_P_YEAR_END_TX_TYPE    : YEAR_END_TX_TYPE,
            V_P_SITE_CODE           : '',
            V_P_DEPT_CODE           : '',
            V_P_EMP_CODE            : '',
            V_P_PRINT_TYPE          : '10',
            V_P_PRINT_TYPE1         : '30',
            V_P_WORK_END_DAT_FR     : INCOME_RECEIVE_START_DATE,
            V_P_WORK_END_DAT_TO     : INCOME_RECEIVE_END_DATE,
            V_P_EMP_CODE_LIST       : EMP_CODE,
            V_P_PAY_AREA_TYPE       : '',
            V_P_CONFIRM_PRINT_YN    : 'N',
            V_P_FORM_ID             : p_formId,
            V_P_MENU_ID             : p_menuId,
            V_P_PROC_ID             : '',
            V_P_USERID              : '',
            V_P_PC                  : ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hra/adj/selectHri1600ReportListIncomeC.do", {
            getType             : 'json',
            workType            : 'REPORT',
            cv_count            : '8',
            params              : gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(data.cv_1.length > 0){
                    data.cv_1[0].COMP_STAMP = data.SEVER_ROOT_PATH + "/com/getFileImage.do?fkey="+ gfn_nvl(data.cv_1[0].STAMP_FILE_NAME) +"&comp_code="+ gv_ma_selectedCorpCd +"&client_code=" + gv_ma_selectedClntCd;
                }
            } else {
                alert(data.resultMessage);
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");  //  E0001   오류가 발생하였습니다.
        }

        return data;
    }

    /**
     * Email 발송
     */
    const fn_btnSendEmail = async function () {

        let SITE_CODE           = gfnma_multiSelectGet('#SRCH_SITE_CODE'); //사업장
        let PAY_AREA_TYPE       = gfn_nvl(SBUxMethod.get("SRCH_PAY_AREA_TYPE")); //급여영역
        let CHKENCRYPTION_YN    = gfn_nvl(SBUxMethod.get("SRCH_CHKENCRYPTION_YN").SRCH_CHKENCRYPTION_YN); //암호화여부
        let YE_TX_YYYY          = gfn_nvl(SBUxMethod.get("SRCH_YE_TX_YYYY")); //정산연도
        let YE_TX_TYPE          = gfnma_multiSelectGet('#SRCH_YE_TX_TYPE'); //정산구분
        let PRINT_TYPE          = gfn_nvl(SBUxMethod.get("SRCH_PRINT_TYPE")); //출력구분
        let DEPT_CODE           = gfn_nvl(SBUxMethod.get("SRCH_DEPT_CODE")); //부서
        let EMP_CODE            = gfn_nvl(SBUxMethod.get("SRCH_EMP_CODE")); //사원
        let MULTI_YN            = gfn_nvl(SBUxMethod.get("SRCH_MULTI_YN").SRCH_MULTI_YN); //복수선택
        let RETIRE_DATE_FR      = gfn_nvl(SBUxMethod.get("SRCH_RETIRE_DATE_FR")); //근무종료일
        let RETIRE_DATE_TO      = gfn_nvl(SBUxMethod.get("SRCH_RETIRE_DATE_TO")); //근무종료일

        if (!YE_TX_YYYY) {
            gfn_comAlert("W0002", "정산연도");
            return;
        }
        if (!YE_TX_TYPE) {
            gfn_comAlert("W0002", "정산구분");
            return;
        }
        if (!PRINT_TYPE) {
            gfn_comAlert("W0002", "출력구분");
            return;
        }

        let EMAIL_SUBJECT       = gfn_nvl(SBUxMethod.get("EMAIL_SUBJECT")); //메일제목
        let EMAIL_BODY          = gfn_nvl(SBUxMethod.get("EMAIL_BODY")); //메일내용
        let NOTICE_MEMO         = gfn_nvl(SBUxMethod.get("NOTICE_MEMO")); //공지사항

        if (!EMAIL_SUBJECT) {
            gfn_comAlert("W0002", "메일제목");
            return;
        }
        if (!EMAIL_BODY) {
            gfn_comAlert("W0002", "메일내용");
            return;
        }




    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>

