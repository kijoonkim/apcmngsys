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
                        <div id="grdAR_AP"></div>
                        <div id="grdAR"></div>
                        <div id="grdAP"></div>
                        <div id="grdAR_TAX_BILL"></div>
                        <div id="grdAR_BILL"></div>
                        <div id="grdAR_ZERO_TAX"></div>
                        <div id="grdAR_CARD"></div>
                        <div id="grdAR_EXPORT"></div>
                        <div id="grdAR_CREDIT"></div>
                        <div id="grdAP_TAX_BILL"></div>
                        <div id="grdAP_BILL"></div>
                        <div id="grdAP_DEEMED"></div>
                        <div id="grdAP_ASSET"></div>
                        <div id="grdAP_NONDED"></div>
                        <div id="grdAP_CARD"></div>
                        <div id="tpgAR_ZERO_REPORT"></div>
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

    var jsonCorpNm = [];
    var jsonGrdList = [];
    var jsonGrdDivision = [];
    var jsonGrdCalc = [];
    var jsonGrdReCalc = [];

    var grdListGrid;
    var grdDivision;
    var grdCalc;
    var grdReCalc;

    window.addEventListener("DOMContentLoaded",function(){
        fn_createGrid();
        fn_createGridDivision();
        fn_createGridCalc();
        fn_createGridReCalc();
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
        return;
        if(data.resultStatus === 'S'){
            jsonGrdList = data.cv_1;
            grdListGrid.rebuild();
            if(grdListGrid.getRows() === 2){
                grdListGrid.setRow(1);
                let workType = 'Q';
                paramObj.V_P_TAX_SITE_CODE = grdListGrid.getRowData(1).TAX_SITE_CODE;
                const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFIt5180.do", {
                    getType				: 'json',
                    cv_count			: '13',
                    workType            : workType,
                    params				: gfnma_objectToString(paramObj)
                });
                const data = await postJsonPromise;

                if(data.resultStatus === 'S'){
                    let resultObj = data.cv_1[0];
                    for(let key in resultObj){
                        let elId = "#" + gfnma_snakeToCamel(key);
                        $(elId).val(parseInt(resultObj[key]));
                    }
                }
            }
        }
    }

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
        grdListGrid.bind("click","fn_setSiteCode");
    }
    const fn_createGridDivision = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdDivision';
        SBGridProperties.id = 'grdDivision';
        SBGridProperties.jsonref = 'jsonGrdDivision';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['부동산 소재지'],ref : 'REAL_ESTATE_ADDR',width : '20%',    style : 'text-align:center',    type : 'input'},
            {caption : ['임대인사업자등록번호'],ref : 'LESSOR_BIZ_REGNO',width : '20%',    style : 'text-align:center',    type : 'input'},
            {caption : ['종사업자일련번호'],ref : 'BIZ_SUBNO',width : '20%',    style : 'text-align:center',    type : 'input'},
            {caption : ['이자율'],ref : 'INTEREST_RATE', width : '20%',    style : 'text-align:center',    type : 'input'},
            {caption : ['총일수'],ref : 'LEAP_YEAR_TYPE', width : '20%',    style : 'text-align:center',    type : 'input'},
        ];
        grdDivision = _SBGrid.create(SBGridProperties);
    }
    const fn_createGridCalc = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdCalc';
        SBGridProperties.id = 'grdCalc';
        SBGridProperties.jsonref = 'jsonGrdCalc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.rowheight = '25';
        SBGridProperties.columns = [
            {caption : ['총공통매입세액','총공통매입세액'], ref : 'CALC_TOTAL_COM_IN_TAX_AMT',        width : '20%',    style : 'text-align:center',    type : 'input'},
            {caption : ['면세사업등확정비율','면세공급가액'], ref : 'EXEMPTION_SUPPLY_AMT',      width : '10%',   style : 'text-align:center',    type : 'input'},
            {caption : ['면세사업등확정비율','총공급가액'], ref : 'TOTAL_SUPPLY_AMT',      width : '10%',   style : 'text-align:center',    type : 'input'},
            {caption : ['면세사업등확정비율','확정비율(%)'], ref : 'CALC_EXEMPTION_RATE',      width : '10%',   style : 'text-align:center',    type : 'input'},
            {caption : ['불공제 매입세액총액','불공제 매입세액총액'], ref : 'CALC_TOTAL_NOND_IN_TAX_AMT',      width : '15%',   style : 'text-align:center',    type : 'input'},
            {caption : ['기 불공제 매입세액','기 불공제 매입세액'], ref : 'CALC_BEF_NOND_IN_TAX_AMT',      width : '15%',   style : 'text-align:center',    type : 'input'},
            {caption : ['가산 또는 공제되는 매입세액','가산 또는 공제되는 매입세액'], ref : 'CALC_INPUT_TAX_AMT',      width : '20%',   style : 'text-align:center',    type : 'input'},
        ];
        grdCalc = _SBGrid.create(SBGridProperties);
    }
    const fn_createGridReCalc = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdReCalc';
        SBGridProperties.id = 'grdReCalc';
        SBGridProperties.jsonref = 'jsonGrdReCalc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.rowheight = '25';
        SBGridProperties.columns = [
            {caption : ['동'], ref : 'BUILDING_ADDR', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['지상여부'], ref : 'GROUND_TYPE', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['층'], ref : 'FLOOR_ADDR', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['호'], ref : 'NUMBER_ADDR', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['임대면적(㎡)'], ref : 'BUILDING_AREA', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['거래처코드'], ref : 'CS_CODE', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['상호(성명)'], ref : 'TENANT_NAME', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['사업자(주민)등록번호'], ref : 'TENANT_BIZ_REGNO', width : '150px', style : 'text-align:center', type : 'input'},
            {caption : ['갱신일'], ref : 'CHANGE_DATE', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['입주일'], ref : 'MOVE_IN_DATE', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['퇴거일'], ref : 'MOVE_OUT_DATE', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['경과일자'], ref : 'DAYS', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['보증금'], ref : 'DEPOSIT_AMT', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['월 임대료'], ref : 'CONTRACT_MONTH_AMT', width : '80px', style : 'text-align:center', type : 'input'},
            {caption : ['임대수입합계(과세표준)'], ref : 'INCOME_SUM', width : '150px', style : 'text-align:center', type : 'input'},
            {caption : ['보증금이자(계)'], ref : 'INTEREST_AMT', width : '100px', style : 'text-align:center', type : 'input'},
            {caption : ['월 임대료(계)'], ref : 'MONTH_AMT', width : '100px', style : 'text-align:center', type : 'input'}
        ];
        grdReCalc = _SBGrid.create(SBGridProperties);
    }
    const fn_addRow = async function(_id){
        window[_id].addRow(true,[0,0,0,0,0,0,0]);
    }
    const fn_removeRow = async function(_id){
        let idx = window[_id].getRow(true);
        if(idx === -1){
            return;
        }
        window[_id].deleteRow(idx);
    }
    async function fn_setSiteCode(){
        var paramObj = {
            V_P_DEBUG_MODE_YN      : ''
            ,V_P_LANG_ID            : ''
            ,V_P_COMP_CODE          : gv_ma_selectedApcCd
            ,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
            ,V_P_YYYY               : ''
            ,V_P_SEQ                : ''
            ,V_P_TAX_SITE_CODE      : ''
            ,V_P_TAX_SITE_NAME      : ''
            ,V_P_BIZ_REGNO          : ''
            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''
        }

        let postFlag = gfnma_getTableElement("srchTable","srch-",paramObj,"V_P_",['taxSiteName','bizRegno']);
        paramObj.V_P_SEQ = gfnma_multiSelectGet('#src-btn-currencyCode');
        paramObj.V_P_TAX_SITE_CODE = jsonGrdList[grdListGrid.getRow()-1].TAX_SITE_CODE;

        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFIt5180.do", {
            getType				: 'json',
            cv_count			: '13',
            workType            : 'Q',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        if(data.resultStatus === 'S'){
            let resultObj = data.cv_1[0];
            for(let key in resultObj){
                let elId = "#" + gfnma_snakeToCamel(key);
                $(elId).val(parseInt(resultObj[key]));
            }
        }
    }
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
