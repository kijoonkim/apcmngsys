<%
    /**
     * @Class Name        : hrp1000.jsp
     * @Description       : 급여 전표처리 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.06.24
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.24   	표주완		최초 생성
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
    <title>title : 급여 전표처리 정보</title>
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
                </h3><!-- 급여 전표처리 -->
            </div>
        </div>
        <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
        <table id="dataArea1" class="table table-bordered tbl_fixed">
            <caption>검색 조건 설정</caption>
            <colgroup>
                <col style="width: 7%">
                <col style="width: 7%">
                <col style="width: 5%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 7%">
                <col style="width: 5%">
                <col style="width: 3%">

                <col style="width: 7%">
                <col style="width: 7%">
                <col style="width: 6%">
                <col style="width: 2%">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row" class="th_bg">급여영역</th>
                <td class="td_input">
                   <%-- <sbux-select
                            id="srch-pay_area_type"
                            uitype="single"
                            jsondata-ref="jsonPayAreaType"
                            unselected-text=""
                            class="form-control input-sm inpt_data_reqed"
                            onchange="fn_payDate">
                            required
                    ></sbux-select>--%>
                    <sbux-select
                            id="srch-pay_area_type"
                            uitype="single"
                            jsondata-ref="jsonPayAreaType"
                            unselected-text="선택"
                            class="form-control input-sm inpt_data_reqed"
                            required>
                    </sbux-select>
                </td>
                <td colspan="10" style="border-right: hidden;">&nbsp;</td>
            </tr>
            <tr>
                <th scope="row" class="th_bg">귀속년월</th>
                <td class="td_input" style="border-right: hidden;">
                    <sbux-datepicker
                            id="srch-pay_yyyymm"
                            name="srch-pay_yyyymm"
                            uitype="popup"
                            datepicker-mode="month"
                            date-format="yyyymm"
                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                            onchange="fn_payDate"
                            required>
                    <%--onchange="fn_payDate"--%>
                    </sbux-datepicker>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">지급구분</th>
                <td class="td_input">
                   <%-- <sbux-select
                            id="srch-pay_type"
                            uitype="single"
                            jsondata-ref="jsonPayType"
                            unselected-text=""
                            class="form-control input-sm inpt_data_reqed"
                            onchange="fn_payDate"
                            required
                    ></sbux-select>--%>
                    <sbux-select
                            id="srch-pay_type"
                            uitype="single"
                            jsondata-ref="jsonPayType"
                            unselected-text="선택"
                            class="form-control input-sm inpt_data_reqed"
                            onchange="fn_payDate"
                            required>
                    </sbux-select>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">지급일자</th>
                <td class="td_input">
                    <sbux-select
                            id="srch-pay_date"
                            uitype="single"
                            jsondata-ref="jsonPayDate"
                            unselected-text=""
                            class="form-control input-sm inpt_data_reqed"
                            required
                    ></sbux-select>
                </td>
                <td colspan="2" style="border-right: hidden;">&nbsp;</td>
            </tr>
            </tbody>
        </table>

        <div class="row">
            <div class="col-sm-4">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>전표 리스트</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwDocList" style="height:800px; width:100%;"></div>
                </div>
            </div>


            <div class="col-sm-8">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>급상여 회계처리 헤더</span></li>
                    </ul>
                    <div class="ad_tbl_toplist">
                        <sbux-button
                                id="btnDocQ"
                                name="btnDocQ"
                                uitype="normal"
                                text="전표조회"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_btnDocQ"
                                style="float: right;"
                        >
                        </sbux-button>
                        <sbux-button
                                id="btnCancelPosting"
                                name="btnCancelPosting"
                                uitype="normal"
                                text="반영취소"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_btnPayResult('PAYROLLD')"
                                style="float: right;"
                        >
                        </sbux-button>
                        <sbux-button
                                id="btnCreatePosting"
                                name="btnCreatePosting"
                                uitype="normal"
                                text="회계반영"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_btnPayResult('PAYROLLN')"
                                style="float: right;"
                        ></sbux-button>
                        <sbux-button
                                id="btnCancel"
                                name="btnCancel"
                                uitype="normal"
                                text="전표처리내역 취소"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_btnCancel"
                                style="float: right;"
                        ></sbux-button>
                        <sbux-button
                                id="btnPosting"
                                name="btnPosting"
                                uitype="normal"
                                text="전표처리내역 집계"
                                class="btn btn-sm btn-outline-danger"
                                onclick="fn_btnPosting"
                                style="float: right;"
                        ></sbux-button>
                    </div>
                </div>

                <div>
                    <table id="dataArea2" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:1%">

                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:1%">

                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:1%">

                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:1%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">지급일</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="EXPECTED_PAY_DATE"
                                        name="EXPECTED_PAY_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast "
                                        >
                                </sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">회계일자(퇴직일)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker
                                        id="POSTING_DATE"
                                        name="POSTING_DATE"
                                        uitype="popup"
                                        date-format="yyyymmdd"
                                        class="form-control input-sm input-sm-ast "
                                        >
                                </sbux-datepicker>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">전표번호</th>
                            <td class="td_input" style="border-right:hidden;">
                                <sbux-input id="DOC_NAME" uitype="text" style="width:100%" placeholder=""
                                            class="form-control input-sm"></sbux-input>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">진행상태</th>
                            <td class="td_input">
                                <%--<sbux-select
                                        id="POSTING_STATUS"
                                        uitype="single"
                                        jsondata-ref="jsonPostingStatus"
                                        unselected-text="선택"
                                        class="form-control input-sm"
                                        readonly
                                ></sbux-select>--%>
                                <sbux-select
                                        id="POSTING_STATUS"
                                        uitype="single"
                                        jsondata-ref="jsonPostingStatus"
                                        unselected-text="선택"
                                        class="form-control input-sm"
                                        readonly>
                                </sbux-select>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">거래처</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-input
                                        uitype="text"
                                        id="CS_CODE"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input
                                       <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="CS_NAME"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" >
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
                                        id="EMP_CODE"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" style="border-right: hidden;">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="EMP_NAME"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td colspan="2" class="td_input" >
                                <sbux-button
                                        class="btn btn-xs btn-outline-dark"
                                        text="찾기" uitype="modal"
                                        target-id="modal-compopup1"
                                        onclick="fn_compopup2"
                                ></sbux-button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">비고</th>
                            <td colspan="11" class="td_input" >
                                <sbux-textarea id="MEMO" name="MEMO" uitype="normal" cols="120"></sbux-textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table id="dataArea3" class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:1%">

                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:1%">

                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:1%">

                            <col style="width:5%">
                            <col style="width:5%">
                            <col style="width:1%">
                        </colgroup>
                        <tr>
                            <td class="td_input" style="border-right: hidden; display: none;">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="DOC_ID"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                            <td colspan="11" class="td_input" style="border-right: hidden; display: none;">
                                <sbux-input
                                <%-- uitype="hidden"--%>
                                        uitype="text"
                                        id="SOURCE_DOC"
                                        class="form-control input-sm"
                                ></sbux-input>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>급상여 회계처리 라인</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-gvwInfo" style="height:630px; width:100%;"></div>
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
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    var p_userId = '${loginVO.id}';
    //-----------------------------------------------------------

    var editType			= "N";   //신규,수정 체크변수 [신규 : N 수정 : E]


    //grid 초기화
    var gvwInfoGrid; 			// 그리드를 담기위한 객체 선언
    var jsonInfoList = []; 	// 그리드의 참조 데이터 주소 선언
    var gvwDocListGrid;
    var jsonDocListList = [];


    var jsonPayAreaType = []; //급여영역 //srch-pay_area_type	  //L_HRP034
    var jsonPayType = []; //지급구분 //srch-pay_type	          //L_HRB008
    var jsonPayDate = []; //지급일자 //srch-pay_date	          //L_HRP027
    var jsonPostingStatus = []; //진행상태 //POSTING_STATUS	          //L_HRP032
    var jsonSiteCode = []; //사업장 //SITE_CODE	          //L_ORG001
    var jsonCurrencyCode = []; //사업장 //CURRENCY_CODE	          //L_COM001


    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            gfnma_setComSelect(['srch-pay_area_type'], jsonPayAreaType, 'L_HRP034', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['srch-pay_type'], jsonPayType, 'L_HRB008', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['POSTING_STATUS'], jsonPostingStatus, 'L_HRP032', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            gfnma_setComSelect(['gvwInfoGrid'], jsonCurrencyCode, 'L_COM001', '', gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'CURRENCY_CODE', 'CURRENCY_NAME', 'Y', ''),



        ]);
    }
    const fn_compopup1 = function() {
        var searchText 		= gfnma_nvl(SBUxMethod.get("CS_NAME"));
        var replaceText0 	= "_CS_CODE_";
        var replaceText1 	= "_CS_NAME_";
        var replaceText2 	= "_BIZ_REGNO_";
        var strWhereClause 	= "AND a.CS_CODE LIKE '%" + replaceText0 + "%' AND a.CS_NAME LIKE '%" + replaceText1 + "%' AND a.BIZ_REGNO LIKE '%"+ replaceText2 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '거래처 정보');
        compopup1({
            compCode				: gv_ma_selectedApcCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM004'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["거래처코드"  , 	"거래처명",  "사엄자번호" ]
            ,searchInputFields		: ["CS_CODE"   , 	"CS_NAME",  "BIZ_REGNO"]
            ,searchInputValues		: [""          , 	searchText, ""         ]
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명", "사업자번호" , "대표자"     ,"업태"          ,"종목"      ,"주소"    ,"전화"  ,"팩스"]
            ,tableColumnNames		: ["CS_CODE" , "CS_NAME", "BIZ_REGNO", "CHIEF_NAME","BIZ_CATEGORY" ,"BIZ_ITEMS","ADDRESS","TEL"   ,"FAX"]
            ,tableColumnWidths		: ["100px"    , "130px" , "100px"    , "120px"     ,"120px"        ,"100px"    ,"200px"  ,"100px" ,"100px"]
            ,itemSelectEvent		: function (data){
                console.log('callback data:', data);
                SBUxMethod.set('CS_NAME', data.CS_NAME);
                SBUxMethod.set('CS_CODE', data.CS_CODE);
            },
        });
    }

    const fn_compopup2 = function() {

        var searchText = gfnma_nvl(SBUxMethod.get("srch-dept_name"));
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
            , searchInputValues: [""           , searchText ,""             ,""         ,""]
            , height: '400px'
            , tableHeader:       ["사번"       , "이름"       , "부서"        ,"사업장"      ,"재직구분"]
            , tableColumnNames:  ["EMP_CODE"  , "EMP_NAME"  , "DEPT_NAME"   ,"SITE_NAME"  ,"EMP_STATE_NAME"]
            , tableColumnWidths: ["80px"      , "80px"      , "100px"       , "100px"     , "80px"]
            , itemSelectEvent: function (data) {
                console.log('callback data:', data);
                SBUxMethod.set('EMP_NAME', data.EMP_NAME);
                SBUxMethod.set('EMP_CODE', data.EMP_CODE);
            },
        });

    }


    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_initSBSelect();
        fn_init();

    });

    // only message
   /* window.addEventListener('message', async function(event){
        let obj = event.data;

        console.log('-------start-------', obj);

        if(!gfn_isEmpty(obj)){
            await fn_onload(obj);
        } else {
            await fn_onload();
        }
    });*/

    const fn_init = async function () {

        let openDate = gfn_dateToYm(new Date());

        SBUxMethod.set('srch-pay_yyyymm', openDate);

        fn_createGrid();
        fn_createInfoGrid();
    }

    // 신규
    function cfn_add() {
        fn_add();
    }
    // 저장
    function cfn_save() {
        fn_save();
    }
    // 삭제
    function cfn_del() {

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

    //전표 리스트
    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwDocList';
        SBGridProperties.id = 'gvwDocListGrid';
        SBGridProperties.jsonref = 'jsonDocListList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true;
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ['기준일(퇴직일)'], ref: 'EXPECTED_PAY_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},
            {caption: ["비고"], ref: 'MEMO', type: 'output', width: '200px', style: 'text-align:left'},
            {caption: ["소스번호"], ref: 'SOURCE_DOC', type: 'output', width: '120px', style: 'text-align:left'},
            {caption: ["배치번호"], ref: 'INVOICE_BATCH_NO', type: 'output', width: '120px', style: 'text-align:left'},
            {caption: ["전표번호"], ref: 'DOC_NAME', type: 'output', width: '120px', style: 'text-align:left'},
            {caption: ['회계처리일자'], ref: 'POSTING_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},

         /*   {caption: ['급여영역'], ref: 'PAY_YYYYMM', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm', origin:'yyyymm'}, disabled: true, hidden: true},
            {caption : ["지급구분"], ref : 'PAY_TYPE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPayType', displayui : true, label : 'label', value : 'value'},
            },
            {caption: ['기준일(퇴직일)'], ref: 'PAY_DATE', 	width:'120px',	type: 'datepicker', style: 'text-align: center', sortable: false,
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}, disabled: true},*/
            /*{caption : ["지급구분"], ref : 'POSTING_STATUS', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonPostingStatus', displayui : true, label : 'label', value : 'value'},
            },*/

        ];

        gvwDocListGrid = _SBGrid.create(SBGridProperties);
        gvwDocListGrid.bind('click', 'fn_view');
    }


    //급상여 회계처리 리스트
    function fn_createInfoGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-gvwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.filtering = true;
        /*SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )*/
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.total = {
            type 		: 'subgrand',
            position	: 'bottom',
            columns		: {
                standard : [1],
                sum : [11,12]
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
            {caption: ["순    번"], ref: 'POSTING_SEQ', type: 'output', width: '120px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, },  format : {type:'number'}},
            {caption: ["회계단위"], ref: 'FI_ORG_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["회계단위명"], ref: 'FI_ORG_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption : ["통화"], ref : 'CURRENCY_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {ref : 'jsonCurrencyCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption : ["사업장"], ref : 'SITE_CODE', width : '100px', style : 'text-align:center', type : 'combo', /*disabled: true,*/
                typeinfo : {ref : 'jsonSiteCode', displayui : true, label : 'label', value : 'value'}
            },
            {caption: ["부서코드"], ref: 'DEPT_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["부 서 명"], ref: 'DEPT_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["원가중심점코드"], ref: 'CC_CODE', type: 'output', width: '100px', style: 'text-align:left', hidden: true},
            {caption: ["원가중심점명"], ref: 'CC_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["계정코드"], ref: 'ACC_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["계정명"], ref: 'ACC_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["차변금액"], ref: 'DEBIT_AMT', type: 'output', width: '120px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,##0.00' }},
            {caption: ["대변금액"], ref: 'CREDIT_AMT', type: 'output', width: '120px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}/*, maxlength : 10*/},  format : { type:'number' , rule:'#,##0.00' }},
            {caption: ["거래처"], ref: 'CS_NAME', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["거래처코드"], ref: 'CS_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사원코드"], ref: 'EMP_CODE', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["사 원 명"], ref: 'EMP_NAME', type: 'output', width: '100px', style: 'text-align:left'},
            {caption: ["적    요"], ref: 'MEMO', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["사원번호필수입력"], ref: 'NEED_EMP_CODE_YN', type: 'checkbox', width: '70px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }, hidden: true
            },
            {caption: ["집계결과 조정가능"], ref: 'POSTING_RESULT_ADJUST_YN', type: 'checkbox', width: '70px', style: 'text-align:center', disabled: true,
                typeinfo: { ignoreupdate: true, fixedcellcheckbox: { usemode: true, rowindex: 1, deletecaption: false},
                    checkedvalue: 'Y', uncheckedvalue: 'N'
                }, hidden: true
            },
            {caption: ["소스번호"], ref: 'SOURCE_DOC', type: 'output', width: '120px', style: 'text-align:left'
                , typeinfo : { mask : {alias : 'numeric', unmaskvalue : false}, /*maxlength : 10*/},  format : {type:'number'}}

        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
    }

    //상세정보 보기
    async function fn_view() {

        gfnma_uxDataClear('#dataArea2');

        editType = "E";

        let nRow = gvwDocListGrid.getRow();

        if (nRow == -1){
            nRow = 1;
        }

        let rowData = gvwDocListGrid.getRowData(nRow);


        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let PAY_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm")); //귀속년월
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
        let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); //지급일자

        if (!_.isEmpty(rowData)){

            var paramObj = {
                V_P_DEBUG_MODE_YN: 'N'
                , V_P_LANG_ID: 'KOR'
                , V_P_COMP_CODE: gv_ma_selectedApcCd
                , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                ,V_P_PAY_YYYYMM  : PAY_YYYYMM
                ,V_P_PAY_TYPE    : PAY_TYPE
                ,V_P_PAY_DATE    : PAY_DATE
                ,V_P_PAY_AREA    : PAY_AREA_TYPE
                ,V_P_SOURCE_DOC  : rowData.SOURCE_DOC

                , V_P_FORM_ID: p_formId
                , V_P_MENU_ID: p_menuId
                , V_P_PROC_ID: ''
                , V_P_USERID: ''
                , V_P_PC: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/pay/selectHrp4200List.do", {
                getType: 'json',
                workType: 'Q',
                cv_count: '2',
                params: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {

                    data.cv_1.forEach((item, index) => {

                        SBUxMethod.set("EXPECTED_PAY_DATE", item.EXPECTED_PAY_DATE);
                        SBUxMethod.set("POSTING_DATE", item.POSTING_DATE);
                        SBUxMethod.set("DOC_NAME", item.DOC_NAME);
                        SBUxMethod.set("POSTING_STATUS", item.POSTING_STATUS);
                        SBUxMethod.set("CS_CODE", item.CS_CODE);
                        SBUxMethod.set("CS_NAME", item.CS_NAME);
                        SBUxMethod.set("EMP_CODE", item.EMP_CODE);
                        SBUxMethod.set("EMP_NAME", item.EMP_NAME);
                        SBUxMethod.set("MEMO", item.MEMO);
                        SBUxMethod.set("SOURCE_DOC", item.SOURCE_DOC);
                        SBUxMethod.set("DOC_ID", item.DOC_ID);

                    });

                    jsonInfoList.length = 0;
                    data.cv_2.forEach((item, index) => {
                        const msg = {
                            PAY_YYYYMM                : gfnma_nvl(item.PAY_YYYYMM),
                            PAY_TYPE                  : gfnma_nvl(item.PAY_TYPE),
                            PAY_DATE                  : gfnma_nvl(item.PAY_DATE),
                            POSTING_SEQ               : gfnma_nvl(item.POSTING_SEQ),
                            FI_ORG_CODE               : gfnma_nvl(item.FI_ORG_CODE),
                            FI_ORG_NAME               : gfnma_nvl(item.FI_ORG_NAME),
                            SITE_CODE                 : gfnma_nvl(item.SITE_CODE),
                            SITE_NAME                 : gfnma_nvl(item.SITE_NAME),
                            DEPT_CODE                 : gfnma_nvl(item.DEPT_CODE),
                            DEPT_NAME                 : gfnma_nvl(item.DEPT_NAME),
                            CC_CODE                   : gfnma_nvl(item.CC_CODE),
                            CC_NAME                   : gfnma_nvl(item.CC_NAME),
                            DEBIT_CREDIT              : gfnma_nvl(item.DEBIT_CREDIT),
                            ACC_CODE                  : gfnma_nvl(item.ACC_CODE),
                            ACC_NAME                  : gfnma_nvl(item.ACC_NAME),
                            CURRENCY_CODE             : gfnma_nvl(item.CURRENCY_CODE),
                            EMP_CODE                  : gfnma_nvl(item.EMP_CODE),
                            EMP_NAME                  : gfnma_nvl(item.EMP_NAME),
                            DEBIT_AMT                 : gfnma_nvl(item.DEBIT_AMT),
                            CREDIT_AMT                : gfnma_nvl(item.CREDIT_AMT),
                            CS_CODE                   : gfnma_nvl(item.CS_CODE),
                            CS_NAME                   : gfnma_nvl(item.CS_NAME),
                            MEMO                      : gfnma_nvl(item.MEMO),
                            NEED_EMP_CODE_YN          : gfnma_nvl(item.NEED_EMP_CODE_YN),
                            POSTING_RESULT_ADJUST_YN  : gfnma_nvl(item.POSTING_RESULT_ADJUST_YN),
                            SOURCE_DOC                : gfnma_nvl(item.SOURCE_DOC)

                        }
                        jsonInfoList.push(msg);
                    });

                    gvwInfoGrid.rebuild();

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
     * 지급일자 조회
     */
    var fn_payDate = function() {

        let PAY_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm")); //귀속년월
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역

        let V_P_WHERE_CLAUSE = "WHERE site_code IN (select site_code from orgsite where comp_code ='"+gv_ma_selectedApcCd+ "') AND pay_yyyymm = '"
            + PAY_YYYYMM + "' AND pay_type = '" + PAY_TYPE + "'AND pay_area_type ='" + PAY_AREA_TYPE + "'";

        gfnma_setComSelect(['srch-pay_date'], jsonPayDate, 'L_HRP027', V_P_WHERE_CLAUSE, gv_ma_selectedApcCd, gv_ma_selectedClntCd, 'PAY_DATE', 'PAY_DATE2', 'Y', '');

    }

    /**
     * 목록 조회
     */
    const fn_search = async function (/*tabMoveVal*/) {

        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let PAY_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm")); //귀속년월
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
        let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); //지급일자


        if (!PAY_AREA_TYPE) {
            gfn_comAlert("W0002", "급여영역");
            return;
        }
        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일자");
            return;
        }

        /*//필수값 검증
        if(!SBUxMethod.validateRequired({
            isDetectAttack: true,
            group_id : 'dataArea1'})) {
            return false;
        }*/


        var paramObj = {
            V_P_DEBUG_MODE_YN: 'N'
            , V_P_LANG_ID: 'KOR'
            , V_P_COMP_CODE: gv_ma_selectedApcCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd

            ,V_P_PAY_YYYYMM  : PAY_YYYYMM
            ,V_P_PAY_TYPE    : PAY_TYPE
            ,V_P_PAY_DATE    : PAY_DATE
            ,V_P_PAY_AREA    : PAY_AREA_TYPE
            ,V_P_SOURCE_DOC  : ''

            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/selectHrp4200List.do", {
            getType: 'json',
            workType: 'LIST',
            cv_count: '2',
            params: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {

                /** @type {number} **/
                let totalRecordCount = 0;

                jsonDocListList.length = 0;
                data.cv_1.forEach((item, index) => {
                    const msg = {
                        PAY_YYYYMM          : gfnma_nvl(item.PAY_YYYYMM),
                        PAY_TYPE            : gfnma_nvl(item.PAY_TYPE),
                        PAY_DATE            : gfnma_nvl(item.PAY_DATE),
                        EXPECTED_PAY_DATE   : gfnma_nvl(item.EXPECTED_PAY_DATE),
                        SOURCE_DOC          : gfnma_nvl(item.SOURCE_DOC),
                        POSTING_DATE        : gfnma_nvl(item.POSTING_DATE),
                        POSTING_STATUS      : gfnma_nvl(item.POSTING_STATUS),
                        INVOICE_BATCH_NO    : gfnma_nvl(item.INVOICE_BATCH_NO),
                        DOC_ID              : gfnma_nvl(item.DOC_ID),
                        DOC_NAME            : gfnma_nvl(item.DOC_NAME),
                        MEMO                : gfnma_nvl(item.MEMO)

                    }
                    jsonDocListList.push(msg);
                    totalRecordCount++;
                });

                gvwDocListGrid.rebuild();
                document.querySelector('#listCount').innerText = totalRecordCount;

                fn_view();
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

        if (editType=="N") {

            // 신규 등록
            if (gfn_comConfirm("Q0001", "신규 등록")) {

                var paramObj =await getParamForm();

                if (_.isEmpty(paramObj)){
                    return;
                }

                const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp4200S2.do", {
                    getType: 'json',
                    workType: 'U',
                    cv_count: '0',
                    params: gfnma_objectToString(paramObj)
                });

                const data = await postJsonPromise;

                try {
                    if (_.isEqual("S", data.resultStatus)) {
                        if (data.resultMessage) {
                            alert(data.resultMessage);
                        }
                        fn_saveS3();
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
        }else if (editType=="E"){

            // 수정 저장
            if(gfn_comConfirm("Q0001", "수정 저장")){

                var paramObj =await getParamForm();

                if (_.isEmpty(paramObj)){
                    return;
                }

                const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp4200S2.do", {
                    getType: 'json',
                    workType: 'U',
                    cv_count: '0',
                    params: gfnma_objectToString(paramObj)
                });

                const data = await postJsonPromise;

                try {
                    if (_.isEqual("S", data.resultStatus)) {
                        if (data.resultMessage) {
                            alert(data.resultMessage);
                        }
                        fn_saveS3();
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

    const getParamForm = async function(){

        //let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let PAY_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm")); //귀속년월
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
        let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); //지급일자

        let EXPECTED_PAY_DATE = gfnma_nvl(SBUxMethod.get("EXPECTED_PAY_DATE"));
        let MEMO = gfnma_nvl(SBUxMethod.get("MEMO"));
        let SOURCE_DOC = gfnma_nvl(SBUxMethod.get("SOURCE_DOC"));


       /* if (!PAY_AREA_TYPE) {
            gfn_comAlert("W0002", "급여영역");
            return;
        }*/
        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일자");
            return;
        }

        if (!EXPECTED_PAY_DATE) {
            gfn_comAlert("W0002", "지급일");
            return;
        }


        let paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd

            ,V_P_PAY_YYYYMM          : PAY_YYYYMM
            ,V_P_PAY_TYPE            : PAY_TYPE
            ,V_P_PAY_DATE            : PAY_DATE
            ,V_P_EXPECTED_PAY_DATE   : EXPECTED_PAY_DATE
            ,V_P_MEMO                : MEMO
            ,V_P_SOURCE_DOC          : SOURCE_DOC

            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        }
        return paramObj;
    }

    //신규 작성
    function fn_add() {

        editType = "N";

        gfnma_uxDataClear('#dataArea2');

        jsonInfoList.length = 0;
        gvwInfoGrid.rebuild();

    }

    //급상여 회계처리 라인 그리드 저장,수정
    const fn_saveS3 = async function () {

        let listData = [];
        listData =  await getParamFormS2();

        if (listData.length > 0) {

            const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp4200S3.do", {listData: listData});

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


    const getParamFormS2 = async function(){

        let PAY_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm")); //귀속년월
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
        let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); //지급일자
        let SOURCE_DOC = gfnma_nvl(SBUxMethod.get("SOURCE_DOC")); //지급일자

        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일자");
            return;
        }

        let updatedData = gvwInfoGrid.getUpdateData(true, 'all');
        let returnData = [];

        updatedData.forEach((item, index) => {

            let DEBIT_AMT = gfnma_nvl(item.data.DEBIT_AMT);
            let CREDIT_AMT = gfnma_nvl(item.data.CREDIT_AMT);

            let DEBIT_CREDIT =  (DEBIT_AMT != null && DEBIT_AMT != 0) ? 'D' : 'C';
            let POSTING_AMT =  (DEBIT_AMT != null && DEBIT_AMT != 0) ? DEBIT_AMT : CREDIT_AMT;

            const param = {

                cv_count : '0',
                getType : 'json',
                workType : item.status == 'i' ? 'N' : (item.status == 'u' ? 'U' : 'D'),
                params: gfnma_objectToString({

                    V_P_DEBUG_MODE_YN			: ''
                    ,V_P_LANG_ID				: ''
                    ,V_P_COMP_CODE				: gv_ma_selectedApcCd
                    ,V_P_CLIENT_CODE			: gv_ma_selectedClntCd

                    ,V_P_PAY_YYYYMM   : PAY_YYYYMM
                    ,V_P_PAY_TYPE     : PAY_TYPE
                    ,V_P_PAY_DATE     : PAY_DATE
                    ,IV_P_POSTING_SEQ : gfnma_nvl(item.data.POSTING_SEQ)
                    ,V_P_CC_CODE      : gfnma_nvl(item.data.CC_CODE)
                    ,V_P_DEBIT_CREDIT : DEBIT_CREDIT
                    ,V_P_ACC_CODE     : gfnma_nvl(item.data.ACC_CODE)
                    ,V_P_POSTING_AMT  : POSTING_AMT
                    ,V_P_EMP_CODE     : gfnma_nvl(item.data.EMP_CODE)
                    ,V_P_MEMO         : gfnma_nvl(item.data.MEMO)
                    ,V_P_SOURCE_DOC   : SOURCE_DOC

                    ,V_P_FORM_ID: p_formId
                    ,V_P_MENU_ID: p_menuId
                    ,V_P_PROC_ID: ''
                    ,V_P_USERID: ''
                    ,V_P_PC: ''

                })
            }
            returnData.push(param);
        });

        return  returnData;

    }

    //전표처리내역 집계
    const fn_btnPosting = async function () {

        let EXPECTED_PAY_DATE = gfnma_nvl(SBUxMethod.get("EXPECTED_PAY_DATE")); //지급일
        let POSTING_DATE = gfnma_nvl(SBUxMethod.get("POSTING_DATE")); //회계일자(퇴직일)
        let CS_CODE = gfnma_nvl(SBUxMethod.get("CS_CODE")); //거래처

        if (!EXPECTED_PAY_DATE) {
            gfn_comAlert("W0002", "지급일");
            return;
        }
        if (!POSTING_DATE) {
            gfn_comAlert("W0002", "회계일자");
            return;
        }
        if (!CS_CODE) {
            gfn_comAlert("W0002", "거래처");
            return;
        }

        let listData = [];
        listData = await getParamFormBatch('BATCH');

        if (listData.length > 0) {

            const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp4200S.do", {listData: listData});

            const data = await postJsonPromise;


            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }
                    /*fn_saveS3();*/
                } else {
                    alert(data.resultMessage);
                }
            } catch (e) {

                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001", e.message);	//	E0001	오류가 발생하였습니다.
            }
        }
    }

    const getParamFormBatch = async function(type){

        let EXPECTED_PAY_DATE = gfnma_nvl(SBUxMethod.get("EXPECTED_PAY_DATE")); //지급일
        let POSTING_DATE = gfnma_nvl(SBUxMethod.get("POSTING_DATE")); //회계일자(퇴직일)
        let CS_CODE = gfnma_nvl(SBUxMethod.get("CS_CODE")); //거래처

        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let PAY_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm")); //귀속년월
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
        let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); //지급일자

        let EMP_CODE = gfnma_nvl(SBUxMethod.get("EMP_CODE")); //사원코드
        let MEMO = gfnma_nvl(SBUxMethod.get("MEMO")); //사원코드
        let SOURCE_DOC = gfnma_nvl(SBUxMethod.get("SOURCE_DOC")); //

        let updatedData = gvwInfoGrid.getGridDataAll();
        let returnData = [];


        updatedData.forEach((item, index) => {

            if (!_.isEqual(item.POSTING_SEQ, '합계')) {
                const param = {

                    cv_count: '0',
                    getType: 'json',
                    workType: type,
                    params: gfnma_objectToString({

                        V_P_DEBUG_MODE_YN: ''
                        , V_P_LANG_ID: ''
                        , V_P_COMP_CODE: gv_ma_selectedApcCd
                        , V_P_CLIENT_CODE: gv_ma_selectedClntCd

                        , V_P_PAY_YYYYMM: PAY_YYYYMM
                        , V_P_PAY_TYPE: PAY_TYPE
                        , V_P_PAY_DATE: PAY_DATE
                        , V_P_POSTING_DATE: POSTING_DATE
                        , V_P_PAY_AREA: PAY_AREA_TYPE     //급여영역
                        , V_P_CS_CODE: CS_CODE
                        , V_P_EMP_CODE: EMP_CODE     // 사원개별전표를 위해 20181218 추가
                        , V_P_SOURCE_DOC: SOURCE_DOC    // 개별전표순번 20181218 추가
                        , IV_P_MEMO: MEMO     //신규
                        , V_P_POSTING_SEQ: item.POSTING_SEQ
                        , V_P_MEMO_DETAIL: item.MEMO
                        , V_P_EXPECTED_PAY_DATE: EXPECTED_PAY_DATE

                        , V_P_FORM_ID: p_formId
                        , V_P_MENU_ID: p_menuId
                        , V_P_PROC_ID: ''
                        , V_P_USERID: ''
                        , V_P_PC: ''

                    })
                }

                returnData.push(param);
            }
        });


        return  returnData;

    }

    //전표처리내역 취소
    const fn_btnCancel = async function () {
        /*
        let POSTING_DATE = gfnma_nvl(SBUxMethod.get("POSTING_DATE")); //회계일자(퇴직일)
        let CS_CODE = gfnma_nvl(SBUxMethod.get("CS_CODE")); //거래처

        if (!POSTING_DATE) {
            gfn_comAlert("W0002", "회계일자");
            return;
        }
        if (!CS_CODE) {
            gfn_comAlert("W0002", "거래처");
            return;
        }*/

        let listData = [];
        listData = await getParamFormBatch('CANCEL');

        if (listData.length > 0) {

            const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp4200S.do", {listData: listData});

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    if (data.resultMessage) {
                        alert(data.resultMessage);
                    }
                    /*fn_saveS3();*/
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

    //회계반영  [프로시저 변경 : P_Z_IF_PayResult_S = 'N'  -> P_HRP4200_S1 = 'PayRollN']
    const fn_btnPayResult = async function (type) {

        let PAY_AREA_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_area_type")); //급여영역
        let PAY_YYYYMM = gfnma_nvl(SBUxMethod.get("srch-pay_yyyymm")); //귀속년월
        let PAY_TYPE = gfnma_nvl(SBUxMethod.get("srch-pay_type")); //지급구분
        let PAY_DATE = gfnma_nvl(SBUxMethod.get("srch-pay_date")); //지급일자

        let POSTING_DATE = gfnma_nvl(SBUxMethod.get("POSTING_DATE")); //회계일자(퇴직일)
        let EXPECTED_PAY_DATE = gfnma_nvl(SBUxMethod.get("EXPECTED_PAY_DATE")); //지급일
        let SOURCE_DOC = gfnma_nvl(SBUxMethod.get("SOURCE_DOC")); //SOURCE_DOC

        if (!PAY_AREA_TYPE) {
            gfn_comAlert("W0002", "급여영역");
            return;
        }
        if (!PAY_YYYYMM) {
            gfn_comAlert("W0002", "귀속년월");
            return;
        }
        if (!PAY_TYPE) {
            gfn_comAlert("W0002", "지급구분");
            return;
        }
        if (!PAY_DATE) {
            gfn_comAlert("W0002", "지급일자");
            return;
        }

        let grdData = gvwInfoGrid.getGridDataAll();

        grdData.forEach((item, index) => {

            if (_.isEqual(item.NEED_EMP_CODE_YN, 'Y') && gfnma_nvl(item.EMP_CODE) == '' ){
                gfn_comAlert("Q0000", "사원코드 필수입력 항목입니다.");
                return false;
            }
        });

        let paramObj = {
            V_P_DEBUG_MODE_YN	: ''
            ,V_P_LANG_ID		: ''
            ,V_P_COMP_CODE		: gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE	: gv_ma_selectedClntCd

            /*,V_P_PAY_YYYYMM            : PAY_YYYYMM
            ,V_P_PAY_TYPE              : PAY_TYPE
            ,V_P_PAY_DATE              : PAY_DATE
            ,V_P_POSTING_DATE          : POSTING_DATE
            ,V_P_EXPECTED_PAY_DATE     : EXPECTED_PAY_DATE
            ,V_P_SOURCE_DOC            : SOURCE_DOC  //추가 20181218*/

            ,V_P_PERIOD_YYYYMM     : PAY_YYYYMM
            ,V_P_PAY_TYPE          : PAY_TYPE
            ,V_P_PAY_DATE          : PAY_DATE
            ,V_P_SOURCE_DOC        : SOURCE_DOC //추가 20181218


            ,V_P_FORM_ID		: p_formId
            ,V_P_MENU_ID		: p_menuId
            ,V_P_PROC_ID		: ''
            ,V_P_USERID			: ''
            ,V_P_PC				: ''
        }

        const postJsonPromise = gfn_postJSON("/hr/hrp/pay/insertHrp4200S1.do", {
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

    //전표조회
    const fn_btnDocQ = async function () {

        let gvwInfoGrid= gvwInfoGrid.getGridDataAll();

        if (_.isEmpty(gvwInfoGrid)){
            return;
        }
        let DOC_ID = gfnma_nvl(SBUxMethod.get("DOC_ID")); //사원코드
        if (DOC_ID == ''){

            gfn_comAlert("Q0000", "생성된 전표번호가 없습니다."); //HRP4200_004

            //SetMessageBox(GetFormMessage("HRP4200_004")); //// 생성된 전표번호가 없습니다.
            //SetMessageBox(GetFormMessage("HRW3300_007")); // 생성된 전표번호가 없습니다.
            return;
        }

        var ht = {};

        ht["WORK_TYPE"] = 'VIEW';
        ht["DOC_ID"] = DOC_ID;

        ht["target"] = 'MA_A20_030_020_150';
        let json = JSON.stringify(ht);

        window.parent.cfn_openTabSearch(json);


    }

</script>
</body>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
