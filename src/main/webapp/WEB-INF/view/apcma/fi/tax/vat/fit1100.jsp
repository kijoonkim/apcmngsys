<%
    /**
     * @Class Name 		: fit5180.jsp
     * @Description 	: 부동산임대소득공급가액명세서 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.11.04
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.11   	이경한		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Title</title><title>title : 공제받지못할매입세액명세서</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        input[type="number"] {
            border: hidden;
            box-sizing: border-box;
            text-align: right;
            width: 100%;
        }
        .tpgTd{
            background-color : white !important;
            border-radius: 0 !important;
            padding: 0px 12px !important;
            height: auto;
        }
        .box.box-solid{
            border-radius: 0 !important;
        }
        #panRightMiddle tbody td{
            border: 0 !important;
        }
        .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-nor-bd .sbux-tabs-content{
            padding: 0!important;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
        </div>
        <div class="box-body">
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <table id="srchTable" class="table table-bordered tbl_fixed">
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
                    <th scope="row" class="th_bg">기준연도</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-datepicker id="srch-dtp-yyyy" name="srch-dtp-yyyy" uitype="popup" datepicker-mode="year"
                                         date-format="yyyy"class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed"
                        >
                        </sbux-datepicker>
                    </td>

                    <th scope="row" class="th_bg">신고구분명</th>
                    <td colspan="7" class="td_input" style="border-right: hidden;">
                        <div style="display: flex;gap: 5px">
                            <div class="dropdown">
                                <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="src-btn-currencyCode" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="src-btn-currencyCode" style="width:750px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                            <sbux-input readonly id="srch-dtp-ymdstandardTermFr" uitype="text" class="form-control input-sm"></sbux-input>
                            <p style="text-align: center;line-height: 30px">~</p>
                            <sbux-input readonly id="srch-dtp-ymdstandardTermTo" uitype="text" class="form-control input-sm"></sbux-input>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">신고사업장</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-input id="srch-inp-taxSiteName" name="srch-inp-taxSiteName" uitype="text" class="form-control input-sm" style="width: 50%"></sbux-input>
                    </td>
                    <th scope="row" class="th_bg">사업자번호</th>
                    <td colspan="7" class="td_input" style="border-right: hidden;">
                        <sbux-input id="srch-inp-bizRegno" name="srch-inp-bizRegno" uitype="text" class="form-control input-sm" style="width: 35%"></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
            <div style=" height: 90vh; display: flex; gap: 10px">
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎사업장 리스트</span></li>
                        </ul>
                    </div>
                    <div id="sb-area-grdListGrid" style="width: 100%"></div>
                </div>
                <div style="flex: 4">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎부가세집계</span></li>
                        </ul>
                    </div>
                    <sbux-tabs id="tabTopJson" name="tabTopJson" uitype="webacc" is-scrollable="false" jsondata-ref="tabJsonData"
                               callback-after-select="fn_switchTab">
                    </sbux-tabs>
                    <div class="tab-content">
                        <div id="grdAR_AP">
                            <div id="sb-area-grdArAp" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR">
                            <div id="sb-area-grdAr" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP">
                            <div id="sb-area-grdAp" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_TAX_BILL">
                            <div id="sb-area-grdArTaxBill" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_BILL">
                            <div id="sb-area-grdArBill" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_ZERO_TAX">
                            <div id="sb-area-grdArZeroTax" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_CARD">
                            <div id="sb-area-grdArCard" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_EXPORT">
                            <div id="sb-area-grdArExport" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAR_CREDIT">
                            <div id="sb-area-grdArCredit" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP_TAX_BILL">
                            <div id="sb-area-grdApTaxBill" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP_BILL">
                            <div id="sb-area-grdApBill" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP_DEEMED">
                            <div id="sb-area-grdApDeemed" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP_ASSET">
                            <div id="sb-area-grdApAsset" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP_NONDED">
                            <div id="sb-area-grdApNonded" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="grdAP_CARD">
                            <div id="sb-area-grdApCard" style="width: 100%; height: 500px"></div>
                        </div>
                        <div id="tpgAR_ZERO_REPORT">
                            <div id="sb-area-grdArZeroReport" style="width: 100%; height: 500px"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------
    var tabJsonData = [
        { "id" : "0", "pid" : "-1", "order" : "1", "text" : "전체", "targetid" : "grdAR_AP" , "targetvalue" : "grdAR_AP","cssstyleKey" : "width:100px;"  },
        { "id" : "1", "pid" : "-1", "order" : "2", "text" : "매출전체","targetid" : "grdAR" , "targetvalue" : "grdAR" },
        { "id" : "2", "pid" : "-1", "order" : "3", "text" : "매입전체","targetid" : "grdAP" , "targetvalue" : "grdAP" },
        { "id" : "3", "pid" : "-1", "order" : "4", "text" : "매출세금계산서","targetid" : "grdAR_TAX_BILL" , "targetvalue" : "grdAR_TAX_BILL" },
        { "id" : "4", "pid" : "-1", "order" : "5", "text" : "매출계산서","targetid" : "grdAR_BILL" , "targetvalue" : "grdAR_BILL" },
        { "id" : "5", "pid" : "-1", "order" : "6", "text" : "영세율첨부서류","targetid" : "grdAR_ZERO_TAX" , "targetvalue" : "grdAR_ZERO_TAX" },
        { "id" : "6", "pid" : "-1", "order" : "7", "text" : "신용카드매출","targetid" : "grdAR_CARD" , "targetvalue" : "grdAR_CARD" },
        { "id" : "7", "pid" : "-1", "order" : "8", "text" : "수출실적" ,"targetid": "grdAR_EXPORT" , "targetvalue" : "grdAR_EXPORT" },
        { "id" : "8", "pid" : "-1", "order" : "9", "text" : "내국신용장","targetid" : "grdAR_CREDIT" , "targetvalue" : "grdAR_CREDIT" },
        { "id" : "9", "pid" : "-1", "order" : "10", "text" : "영세율매출명세서","targetid" : "tpgAR_ZERO_REPORT" , "targetvalue" : "tpgAR_ZERO_REPORT" },
        { "id" : "10", "pid" : "-1", "order" : "11", "text" : "매입세금계산서","targetid" : "grdAP_TAX_BILL" , "targetvalue" : "grdAP_TAX_BILL" },
        { "id" : "11", "pid" : "-1", "order" : "12", "text" : "매입계산서" ,"targetid": "grdAP_BILL" , "targetvalue" : "grdAP_BILL" },
        { "id" : "12", "pid" : "-1", "order" : "13", "text" : "의제매입세액명세","targetid" : "grdAP_DEEMED" , "targetvalue" : "grdAP_DEEMED" },
        { "id" : "13", "pid" : "-1", "order" : "14", "text" : "건물등감가상각" ,"targetid": "grdAP_ASSET" , "targetvalue" : "grdAP_ASSET" },
        { "id" : "14", "pid" : "-1", "order" : "15", "text" : "공제받지못할매입세액명세","targetid" : "grdAP_NONDED" , "targetvalue" : "grdAP_NONDED" },
        { "id" : "15", "pid" : "-1", "order" : "16", "text" : "신용카드수령금액명세","targetid" : "grdAP_CARD" , "targetvalue" : "grdAP_CARD" }
    ];

    /** 신고 구분명 **/
    var jsonCorpNm = [];

    /** 신고 사업장 그리드 **/
    var jsonGrdList = [];
    var grdListGrid;

    /** 전체 그리드 **/
    var jsonGrdArAp = [];
    var grdArAp;

    /** 매출전체 **/
    var jsonGrdAr = [];
    var grdAr;

    /** 매입전체 **/
    var jsonGrdAp = [];
    var grdAp;

    /** 매출세금계산서 **/
    var jsonGrdArTaxBill = [];
    var grdArTaxBill;

    /** 매출계산서 **/
    var jsonGrdArBill = [];
    var grdArBill;

    /** 영세율 첨부서류제출명세 **/
    var jsonGrdArZeroTax = [];
    var grdArZeroTax;

    /** 신용카드매출전표발행집계표 **/
    var jsonGrdArCard = [];
    var grdArCard;

    /** 수출실적명세서 **/
    var jsonGrdArExport = [];
    var grdArExport;

    /** 내국신용장 **/
    var jsonGrdArCredit = [];
    var grdArCredit;

    /** 매입세금계산서 **/
    var jsonGrdApTaxBill = [];
    var grdApTaxBill;

    /** 매입계산서 **/
    var jsonGrdApBill = [];
    var grdApBill;

    /** 의제매입세액 **/
    var jsonGrdApDeemed = [];
    var grdApDeemed;

    /** 건물등감가상각자산취득명세 **/
    var jsonGrdApAsset = [];
    var grdApAsset;

    /** 공제받지못할매입세액명세 **/
    var jsonGrdApNonded = [];
    var grdApNonded;

    /** 신용카드수령금액명세서 **/
    var jsonGrdApCard = [];
    var grdApCard;


    window.addEventListener("DOMContentLoaded",function(){
        fn_createGrid();
        fn_createGridArAp();
        fn_createGridAr();
        fn_createGridAp();
        fn_createGridArTaxBill();
        fn_createGridArBill();
        fn_createGridArZeroTax();
        fn_createGridArCard();
        fn_createGridArExport();
        fn_createGridArExport();
        fn_createGridArCredit();
        fn_createGridApTaxBill();
        fn_createGridApBill();
        fn_createGridApDeemed();
        fn_createGridApAsset();
        fn_createGridApNonded();
        fn_createGridApCard();

        fn_init();

        window.parent.document.getElementById("main-btn-save").style.display = "none";
    });

    const fn_init = async function(){
        /** ul style 정리 **/
        $("#tabTopJson_ul").css({"display":"grid","grid-template-columns": "repeat(8, auto)"});


        /** 법인 select **/
        jsonCorpNm = await gfnma_getComSelectList('L_ORG000','','','','COMP_CODE',"COMP_NAME");
        SBUxMethod.refresh('srch-slt-corpNm');
        SBUxMethod.setValue('srch-slt-corpNm',gv_ma_selectedApcCd);
        /** 기준연도 **/
        SBUxMethod.set('srch-dtp-yyyy',gfn_dateToYear(new Date()));
        /** tab 정렬 **/
        SBUxMethod.selectTab('tabTopJson', 'grdAR_AP');

        /** 신고구분명 select **/
        gfnma_multiSelectInit({
            target			: ['#src-btn-currencyCode']
            ,compCode		: gv_ma_selectedApcCd
            ,clientCode		: gv_ma_selectedClntCd
            ,bizcompId		: 'L_FIT030'
            ,whereClause	: ''
            ,formId			: p_formId
            ,menuId			: p_menuId
            ,selectValue	: ''
            ,dropType		: 'down' 	// up, down
            ,dropAlign		: 'right' 	// left, right
            ,colValue		: 'SEQ'
            ,colLabel		: 'VAT_TYPE_NAME'
            ,columns		:[
                {caption: "부가세유형",		ref: 'VAT_TYPE_NAME', 			width:'120px',  	style:'text-align:left'},
                {caption: "신고기준시작월", 		ref: 'STANDARD_TERM_FR',    		width:'150px',  	style:'text-align:left'},
                {caption: "신고기준종료월", 		ref: 'STANDARD_TERM_TO',    		width:'150px',  	style:'text-align:left'},
                {caption: "총괄납부사업장번호", 		ref: 'UNIT_NO',    		width:'180px',  	style:'text-align:left'},
                {caption: "단위과세번호", 		ref: 'WHOLE_PAY_SITE_NO',    		width:'150px',  	style:'text-align:left'},
                {caption: "확정여부", 		ref: 'CONFIRM_YN',    		width:'150px',  	style:'text-align:left'},
                {caption: "SEQ", 		ref: 'SEQ',    		width:'150px',  	style:'text-align:left;display:none',}
            ]
            ,callback       : fn_choice
        })
    }

    async function fn_choice(_value){
        /** reset **/
            // jsonGrdList.length = 0;
            // jsonGrdDivision.length = 0;
            // jsonGrdCalc.length = 0;
            // jsonGrdReCalc.length = 0;
            //
            // grdListGrid.rebuild();
            // grdDivision.rebuild();
            // grdCalc.rebuild();
            // grdReCalc.rebuild();

        const inputs = document.querySelectorAll('#panRightHeader input');
        inputs.forEach(input => {
            input.value = 0;
        });

        let tr = $('#src-btn-currencyCode').siblings().find('tr.clickable-row.active');
        if (tr.length) {
            let termFr = tr.find('td[cu-code="STANDARD_TERM_FR"]');
            if (termFr.length) {
                SBUxMethod.set("srch-dtp-ymdstandardTermFr", termFr.text());
                SBUxMethod.set('srch-dtp-yyyy',termFr.text().split('-')[0]);
            }

            let termTo = tr.find('td[cu-code="STANDARD_TERM_TO"]');
            if (termTo.length) {
                SBUxMethod.set('srch-dtp-ymdstandardTermTo', termTo.text());
            }
        }
        var paramObj = {
            V_P_DEBUG_MODE_YN      : ''
            ,V_P_LANG_ID            : ''
            ,V_P_COMP_CODE          : gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
            ,V_P_YYYY               : ''
            ,V_P_SEQ                : ''
            ,V_P_AR_AP_TYPE         : ''
            ,V_P_CS_CODE            : ''
            ,V_P_BIZ_REGNO          : ''
            ,V_P_TAX_SITE_NAME      : ''
            ,V_P_TAX_SITE_CODE      : ''
            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''
        }

        let postFlag = gfnma_getTableElement("srchTable","srch-",paramObj,"V_P_",['taxSiteName','bizRegno']);
        paramObj.V_P_SEQ = _value;

        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit1100.do", {
            getType				: 'json',
            cv_count			: '17',
            workType            : 'LIST',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log(data);
        if(data.resultStatus === 'S'){
            jsonGrdList = data.cv_1;
            grdListGrid.rebuild();
            if(grdListGrid.getRows() === 2){
                grdListGrid.setRow(1);
                let workType = 'DETAIL';
                paramObj.V_P_TAX_SITE_CODE = grdListGrid.getRowData(1).TAX_SITE_CODE;
                const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit1100.do", {
                    getType				: 'json',
                    cv_count			: '17',
                    workType            : workType,
                    params				: gfnma_objectToString(paramObj)
                });
                const data = await postJsonPromise;
                console.log(data,"두번쨰");




                if(data.resultStatus === 'S'){
                  jsonGrdArAp = data.cv_2;
                  grdArAp.rebuild();
                  jsonGrdAr = data.cv_3;
                  grdAr.rebuild();
                  jsonGrdAp = data.cv_4;
                  grdAp.rebuild();
                  jsonGrdArTaxBill = data.cv_5;
                  grdArTaxBill.rebuild();
                  jsonGrdArBill = data.cv_6;
                  grdArBill.rebuild();
                  jsonGrdArZeroTax = data.cv_7;
                  grdArZeroTax.rebuild();
                  jsonGrdArCard = data.cv_8;
                  grdArCard.rebuild();
                  jsonGrdArExport = data.cv_9;
                  grdArExport.rebuild();
                  jsonGrdArCredit = data.cv_10;
                  grdArCredit.rebuild();
                  jsonGrdApTaxBill = data.cv_11;
                  grdApTaxBill.rebuild();
                  jsonGrdApBill = data.cv_12;
                  grdApBill.rebuild();
                  jsonGrdApDeemed = data.cv_13;
                  grdApDeemed.rebuild();
                  jsonGrdApAsset = data.cv_14;
                  grdApAsset.rebuild();
                  jsonGrdApNonded = data.cv_15;
                  grdApNonded.rebuild();
                  jsonGrdApCard = data.cv_16;
                  grdApCard.rebuild();
                }
            }
        }
    }
    /** grid create  --S **/
    /** 신고 사업장 **/
    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdListGrid';
        SBGridProperties.id = 'grdListGrid';
        SBGridProperties.jsonref = 'jsonGrdList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['신고사업장명'],               ref : 'TAX_SITE_NAME',        width : '50%',    style : 'text-align:center',    type : 'output'},
            {caption : ['사업자번호'],          ref : 'BIZ_REGNO',      width : '50%',   style : 'text-align:center',    type : 'output'},
        ];
        grdListGrid = _SBGrid.create(SBGridProperties);
        // grdListGrid.bind("click","fn_setSiteCode");
    }
    /** AR_AP 전체 **/
    const fn_createGridArAp = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArAp';
        SBGridProperties.id = 'grdArAp';
        SBGridProperties.jsonref = 'jsonGrdArAp';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['종사업장번호'],ref : 'SUB_REG_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['세액'],ref : 'VAT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전자발행구분'],ref : 'ETAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['11일외전송구분'],ref : 'AFTER_DUE_DATE_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['중복발행구분'],ref : 'DUP_ISSUE_BILL_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수입금액제외구분'],ref : 'EXCLUDE_REV_AMT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['봉사료'],ref : 'SERV_CHARGE_CARD_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['영세율첨부서류'],ref : 'ZERO_REPORT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['내국신용장구분'],ref : 'LOCAL_CREDIT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['서류명'],ref : 'DOCUMENT_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['발급자'],ref : 'ISSUE_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['발급일자'],ref : 'DOCUMENT_ISSUE_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출신고번호'],ref : 'EXPORT_LICENSE_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['선적일자'],ref : 'SHIPPING_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['통화코드'],ref : 'CURRENCY_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['환율'],ref : 'EXCHANGE_RATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기제출 외화'],ref : 'EXPORT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기제출 원화'],ref : 'EXPORT_AMT_KRW', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기신고 외화'],ref : 'VAT_EXPORT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기신고 원화'],ref : 'VAT_EXPORT_AMT_KRW', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출외화 금액'],ref : 'FOREIGN_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출원화 금액'],ref : 'WON_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['서류번호'],ref : 'DOCUMENT_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['영세율적용구분'],ref : 'ZERO_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['카드용도구분'],ref : 'CARD_USE_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['카드번호'],ref : 'CARD_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['불공제사유 유형'],ref : 'VAT_NOT_DED_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['감가상각자산유형'],ref : 'VAT_ASSET_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['의제매입구분'],ref : 'DEEMED_INPUT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['의제품명'],ref : 'GOODS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['의제수량'],ref : 'PURCHASE_QUANTITY', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입자납부'],ref : 'CS_PAY_VAT_FLAG', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['감가상각자산건수'],ref : 'ASSET_VAT_COUNT', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdArAp = _SBGrid.create(SBGridProperties);
    }
    /** AR **/
    const fn_createGridAr = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdAr';
        SBGridProperties.id = 'grdAr';
        SBGridProperties.jsonref = 'jsonGrdAr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['종사업장번호'],ref : 'SUB_REG_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['세액'],ref : 'VAT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전자발행구분'],ref : 'ETAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['11일외전송구분'],ref : 'AFTER_DUE_DATE_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['중복발행구분'],ref : 'DUP_ISSUE_BILL_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수입금액제외구분'],ref : 'EXCLUDE_REV_AMT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['봉사료'],ref : 'SERV_CHARGE_CARD_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['내국신용장구분'],ref : 'LOCAL_CREDIT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['영세율첨부서류'],ref : 'ZERO_REPORT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['서류명'],ref : 'DOCUMENT_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['발급자'],ref : 'ISSUE_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['발급일자'],ref : 'DOCUMENT_ISSUE_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출신고번호'],ref : 'EXPORT_LICENSE_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['선적일자'],ref : 'SHIPPING_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['통화코드'],ref : 'CURRENCY_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['환율'],ref : 'EXCHANGE_RATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기제출 외화'],ref : 'EXPORT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기제출 원화'],ref : 'EXPORT_AMT_KRW', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기신고 외화'],ref : 'VAT_EXPORT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기신고 원화'],ref : 'VAT_EXPORT_AMT_KRW', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출외화 금액'],ref : 'FOREIGN_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출원화 금액'],ref : 'WON_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['서류번호'],ref : 'DOCUMENT_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['영세율적용구분'],ref : 'ZERO_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입자납부'],ref : 'CS_PAY_VAT_FLAG', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdAr = _SBGrid.create(SBGridProperties);
    }
    /** AP **/
    const fn_createGridAp = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdAp';
        SBGridProperties.id = 'grdAp';
        SBGridProperties.jsonref = 'jsonGrdAp';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ['연번'], ref: 'BILL_SEQ', width: '80px', style: 'text-align:center', type: 'output'},
            {caption: ['부가세유형'], ref: 'VAT_TYPE', width: '80px', style: 'text-align:center', type: 'output'},
            {caption: ['회계전표번호'], ref: 'DOC_NUM', width: '80px', style: 'text-align:center', type: 'output'},
            {caption: ['전표명'], ref: 'DOC_NAME', width: '80px', style: 'text-align:center', type: 'output'},
            {caption: ['거래일자'], ref: 'BILL_DATE', width: '80px', style: 'text-align:center', type: 'output'},
            {caption: ['신고기준일자'], ref: 'STANDARD_DATE', width: '80px', style: 'text-align:center', type: 'output'},
            {caption: ['거래처명'], ref: 'CS_NAME', width: '80px', style: 'text-align:center', type: 'output'},
            {caption: ['사업자(주민)번호'], ref: 'BIZ_REGNO', width: '80px', style: 'text-align:center', type: 'output'},
            {caption: ['종사업장번호'], ref: 'SUB_REG_NO', width: '80px', style: 'text-align:center', type: 'output'},
            {caption: ['공급가액'], ref: 'SUPPLY_AMT', width: '80px', style: 'text-align:center', type: 'output'},
            {caption: ['세액'], ref: 'VAT_AMT', width: '80px', style: 'text-align:center', type: 'output'},
            {caption: ['전자발행구분'], ref: 'ETAX_TYPE', width: '80px', style: 'text-align:center', type: 'output'},
            {
                caption: ['11일외전송구분'],
                ref: 'AFTER_DUE_DATE_YN',
                width: '80px',
                style: 'text-align:center',
                type: 'output'
            },
            {caption: ['예정신고누락구분'], ref: 'REPORT_OMIT_YN', width: '80px', style: 'text-align:center', type: 'output'},
            {caption : ['카드용도구분'],ref : 'CARD_USE_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['카드번호'],ref : 'CARD_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['불공제사유 유형'],ref : 'VAT_NOT_DED_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['감가상각자산유형'],ref : 'VAT_ASSET_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['의제매입구분'],ref : 'DEEMED_INPUT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['의제품명'],ref : 'GOODS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['의제수량'],ref : 'PURCHASE_QUANTITY', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입자납부'],ref : 'CS_PAY_VAT_FLAG', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['감가상각자산건수'],ref : 'ASSET_VAT_COUNT', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdAp = _SBGrid.create(SBGridProperties);
    }
    /** AR_TAX_BILL **/
    const fn_createGridArTaxBill = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArTaxBill';
        SBGridProperties.id = 'grdArTaxBill';
        SBGridProperties.jsonref = 'jsonGrdArTaxBill';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['종사업장번호'],ref : 'SUB_REG_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['세액'],ref : 'VAT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전자발행구분'],ref : 'ETAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['11일외전송구분'],ref : 'AFTER_DUE_DATE_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['중복발행구분'],ref : 'DUP_ISSUE_BILL_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수입금액제외구분'],ref : 'EXCLUDE_REV_AMT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입자납부'],ref : 'CS_PAY_VAT_FLAG', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdArTaxBill = _SBGrid.create(SBGridProperties);
    }
    /** AR_BILL **/
    const fn_createGridArBill = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArBill';
        SBGridProperties.id = 'grdArBill';
        SBGridProperties.jsonref = 'jsonGrdArBill';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['종사업장번호'],ref : 'SUB_REG_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['세액'],ref : 'VAT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전자발행구분'],ref : 'ETAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['11일외전송구분'],ref : 'AFTER_DUE_DATE_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['중복발행구분'],ref : 'DUP_ISSUE_BILL_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수입금액제외구분'],ref : 'EXCLUDE_REV_AMT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdArBill = _SBGrid.create(SBGridProperties);
    }
    /** AR_ZERO_TAX **/
    const fn_createGridArZeroTax = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArZeroTax';
        SBGridProperties.id = 'grdArZeroTax';
        SBGridProperties.jsonref = 'jsonGrdArZeroTax';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['종사업장번호'],ref : 'SUB_REG_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['세액'],ref : 'VAT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전자발행구분'],ref : 'ETAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['11일외전송구분'],ref : 'AFTER_DUE_DATE_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['중복발행구분'],ref : 'DUP_ISSUE_BILL_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수입금액제외구분'],ref : 'EXCLUDE_REV_AMT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['서류명'],ref : 'DOCUMENT_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['발급자'],ref : 'ISSUE_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['발급일자'],ref : 'DOCUMENT_ISSUE_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['선적일자'],ref : 'SHIPPING_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['통화코드'],ref : 'CURRENCY_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['환율'],ref : 'EXCHANGE_RATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기제출 외화'],ref : 'EXPORT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기제출 원화'],ref : 'EXPORT_AMT_KRW', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기신고 외화'],ref : 'VAT_EXPORT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기신고 원화'],ref : 'VAT_EXPORT_AMT_KRW', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['내국신용장_서류번호'],ref : 'DOCUMENT_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출신고번호'],ref : 'EXPORT_LICENSE_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['환율'],ref : 'EXCHANGE_RATE', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdArZeroTax = _SBGrid.create(SBGridProperties);
    }
    /** AR_CARD **/
    const fn_createGridArCard = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArCard';
        SBGridProperties.id = 'grdArCard';
        SBGridProperties.jsonref = 'jsonGrdArCard';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['종사업장번호'],ref : 'SUB_REG_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['세액'],ref : 'VAT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['중복발행구분'],ref : 'DUP_ISSUE_BILL_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수입금액제외구분'],ref : 'EXCLUDE_REV_AMT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['봉사료'],ref : 'SERV_CHARGE_CARD_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdArCard = _SBGrid.create(SBGridProperties);
    }
    /** AR_EXPORT **/
    const fn_createGridArExport = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArExport';
        SBGridProperties.id = 'grdArExport';
        SBGridProperties.jsonref = 'jsonGrdArExport';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['종사업장번호'],ref : 'SUB_REG_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수입금액제외구분'],ref : 'EXCLUDE_REV_AMT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출신고번호'],ref : 'EXPORT_LICENSE_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['선적일자'],ref : 'SHIPPING_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['통화코드'],ref : 'CURRENCY_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['환율'],ref : 'EXCHANGE_RATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출외화 금액'],ref : 'FOREIGN_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출원화 금액'],ref : 'WON_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['영세율적용구분'],ref : 'ZERO_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdArExport = _SBGrid.create(SBGridProperties);
    }
    /** AR_CREDIT **/
    const fn_createGridArCredit = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdArCredit';
        SBGridProperties.id = 'grdArCredit';
        SBGridProperties.jsonref = 'jsonGrdArCredit';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수입금액제외구분'],ref : 'EXCLUDE_REV_AMT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['내국신용장구분'],ref : 'LOCAL_CREDIT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['서류명'],ref : 'DOCUMENT_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['발급일자'],ref : 'DOCUMENT_ISSUE_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['서류번호'],ref : 'DOCUMENT_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['영세율적용구분'],ref : 'ZERO_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['선적일자'],ref : 'SHIPPING_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['통화코드'],ref : 'CURRENCY_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['환율'],ref : 'EXCHANGE_RATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기제출금 외화'],ref : 'EXPORT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['당기신고해당분 외화'],ref : 'VAT_EXPORT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출 외화금액'],ref : 'FOREIGN_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출 원화금액'],ref : 'WON_AMT', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdArCredit = _SBGrid.create(SBGridProperties);
    }
    /** AP_TAX_BILL **/
    const fn_createGridApTaxBill = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdApTaxBill';
        SBGridProperties.id = 'grdApTaxBill';
        SBGridProperties.jsonref = 'jsonGrdApTaxBill';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['종사업장번호'],ref : 'SUB_REG_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['세액'],ref : 'VAT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전자발행구분'],ref : 'ETAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['11일외전송구분'],ref : 'AFTER_DUE_DATE_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['내국신용장 서류번호'],ref : 'CS_PAY_VAT_FLAG', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수출신고번호'],ref : 'EXPORT_LICENSE_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['환율'],ref : 'EXCHANGE_RATE', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdApTaxBill = _SBGrid.create(SBGridProperties);
    }
    /** AP_BILL **/
    const fn_createGridApBill = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdApBill';
        SBGridProperties.id = 'grdApBill';
        SBGridProperties.jsonref = 'jsonGrdApBill';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['종사업장번호'],ref : 'SUB_REG_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['세액'],ref : 'VAT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전자발행구분'],ref : 'ETAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['11일외전송구분'],ref : 'AFTER_DUE_DATE_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdApBill = _SBGrid.create(SBGridProperties);
    }
    /** AP_DEEMED **/
    const fn_createGridApDeemed = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdApDeemed';
        SBGridProperties.id = 'grdApDeemed';
        SBGridProperties.jsonref = 'jsonGrdApDeemed';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['종사업장번호'],ref : 'SUB_REG_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['의제매입구분'],ref : 'DEEMED_INPUT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['의제품명'],ref : 'GOODS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['의제수량'],ref : 'PURCHASE_QUANTITY', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdApDeemed = _SBGrid.create(SBGridProperties);
    }
    /** AP_ASSET **/
    const fn_createGridApAsset = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdApAsset';
        SBGridProperties.id = 'grdApAsset';
        SBGridProperties.jsonref = 'jsonGrdApAsset';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['세액'],ref : 'VAT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['감가상각자산유형'],ref : 'VAT_ASSET_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdApAsset = _SBGrid.create(SBGridProperties);
    }
    /** AP_NONDED **/
    const fn_createGridApNonded = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdApNonded';
        SBGridProperties.id = 'grdApNonded';
        SBGridProperties.jsonref = 'jsonGrdApNonded';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['종사업장번호'],ref : 'SUB_REG_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['세액'],ref : 'VAT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['불공제사유 유형'],ref : 'VAT_NOT_DED_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdApNonded = _SBGrid.create(SBGridProperties);
    }
    /** AP_CARD **/
    const fn_createGridApCard = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdApCard';
        SBGridProperties.id = 'grdApCard';
        SBGridProperties.jsonref = 'jsonGrdApCard';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],ref : 'BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['부가세유형'],ref : 'VAT_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['회계전표번호'],ref : 'DOC_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['전표명'],ref : 'DOC_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래일자'],ref : 'BILL_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['신고기준일자'],ref : 'STANDARD_DATE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처명'],ref : 'CS_NAME', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['사업자(주민)번호'],ref : 'BIZ_REGNO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['종사업장번호'],ref : 'SUB_REG_NO', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['공급가액'],ref : 'SUPPLY_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['세액'],ref : 'VAT_AMT', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['예정신고누락구분'],ref : 'REPORT_OMIT_YN', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['카드용도구분'],ref : 'CARD_USE_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['카드번호'],ref : 'CARD_NUM', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['거래처코드'],ref : 'CS_CODE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['매입매출구분'],ref : 'AR_AP_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정신고구분'],ref : 'AMENDED_TAX_TYPE', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['정기신고분연번'],ref : 'REGULAR_BILL_SEQ', width : '80px',style : 'text-align:center',type : 'output'},
            {caption : ['수정여부'],ref : 'MODIFIED_YN', width : '80px',style : 'text-align:center',type : 'output'},
        ];
        grdApCard = _SBGrid.create(SBGridProperties);
    }

    /** grid create  --E **/






    /** tab Switch **/
    function fn_switchTab(selectId, selectJson){
        const li = document.querySelectorAll(".sbux-tabs-item");
        /** 해당 탭 줄 확인 **/
        li.forEach(function(item,idx){
            if($(item).data("sbuxId") === selectId){
                if(idx < 8){
                    fn_switchRows();
                }
            }
        });
    }
    /** li switch **/
    function fn_switchRows(){
        const ul = document.getElementById("tabTopJson_ul");
        const items = Array.from(ul.children);

        const firstRow = items.slice(0, 8);
        const secondRow = items.slice(8, 16);

        ul.innerHTML = "";
        secondRow.forEach(item => ul.appendChild(item));
        firstRow.forEach(item => ul.appendChild(item));
    }

    /** 공통버튼 **/
    function cfn_search() {
        fn_search();
    }
    const fn_search = async function(){
        let _value = gfnma_multiSelectGet('#src-btn-currencyCode');
        if(gfn_isEmpty(_value)){
            gfn_comAlert("W0002", "신고구분명");
            return;
        }
        await fn_choice(_value);
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
