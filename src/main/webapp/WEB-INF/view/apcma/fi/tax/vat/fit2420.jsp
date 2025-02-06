<%
    /**
     * @Class Name 		: fit2330.jsp
     * @Description 	: 영세율매출명세서 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.10.16
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
    <title>Title</title><title>title : 신용카드수령명세서(매입)</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <style>
        #Sales > table > tbody > tr > td{
            text-align: center;
            border: 1px solid #e8f1f9 !important;
        }
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        table[id="panRightHeader"] td, table[id="panRightMiddle"] td{
            text-align: center;
            border: solid 1px blue;
            padding: 5px;
        }
        .resizer[data-direction="horizontal"] {
            background-color: #cbd5e0;
            cursor: ew-resize;
            height: 100%;
            width: 2px;
        }
        .resizer[data-direction="vertical"] {
            background-color: #cbd5e0;
            cursor: ns-resize;
            height: 2px;
            width: 100%;
        }
        .tpgTd{
            border: 0 !important;
            background-color : white !important;
            border-radius: 0 !important;
            padding: 0px 12px !important;
            height: auto;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid" style="border-radius: 0">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
        </div>
        <div class="box-body">
            <div class="box-search-ma">
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <!-- content_header start -->
            <table id="srchTable" class="table table-bordered tbl_fixed table-search-ma">
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
                    <th scope="row" >기준연도</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-datepicker id="srch-dtp-yyyy" name="srch-dtp-yyyy" uitype="popup" datepicker-mode="year"
                                         date-format="yyyy" class="table-datepicker-ma"
                                         onchange="fn_setMultSelect(srch-dtp-yyyy)">
                        </sbux-datepicker>
                    </td>
                    <td></td>
                    <th scope="row" >신고구분명</th>
                    <td colspan="8" class="td_input" style="border-right: hidden;">
                        <div style="display: flex;gap: 5px">
                            <div class="dropdown">
                                <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="src-btn-currencyCode" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="src-btn-currencyCode" style="width:750px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                            <sbux-input readonly id="srch-dtp-ymdstandardTermFr" uitype="text" class="form-control input-sm" style="text-align: center"></sbux-input>
                            <p style="text-align: center;line-height: 30px">~</p>
                            <sbux-input readonly id="srch-dtp-ymdstandardTermTo" uitype="text" class="form-control input-sm" style="text-align: center"></sbux-input>
                        </div>
                    </td>
                    <td></td>
                    <th scope="row" >총괄납부관리번호</th>
                    <td colspan="3" class="td_input" style="border-top: hidden" >
                        <sbux-input id="srch-inp-wholePaySiteNo" name="srch-inp-wholePaySiteNo" uitype="text" class="form-control input-sm"></sbux-input>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            </div>
                <div style=" height: 80vh; display: flex">
               <div id="sb-area-grdReport" style="width: 100%; height: 600px"></div>
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
    var jsonGrdReport = [];
    var grdReport;
 
    /** DOM load **/
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createGrid();
        fn_init();
    });
 
    const fn_init = async function() {
        /** 법인 select **/
        jsonCorpNm = await gfnma_getComSelectList('L_ORG000', '', '', '', 'CO_CD', "CORP_NM");
        jsonReasonCodeData = await gfnma_getComList('L_FIT025', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CO_CD', "CORP_NM");
        jsonReasonCode = jsonReasonCodeData.cv_1;
        SBUxMethod.refresh('srch-slt-corpNm');
        SBUxMethod.setValue('srch-slt-corpNm', gv_ma_selectedCorpCd);
        /** 제출사유 **/
        SBUxMethod.refresh('SBMSN_RSN_CD');
        /** 기준연도 **/
        let yyyy = gfn_dateToYear(new Date());
        SBUxMethod.set('srch-dtp-yyyy', yyyy);

        /** 신고구분명 select **/
        await fn_setMultSelect(yyyy);
    }
    async function fn_setMultSelect(yyyy){
        /** 신고구분명 select **/
        gfnma_multiSelectInit({
            target			: ['#src-btn-currencyCode']
            ,compCode		: gv_ma_selectedCorpCd
            ,clientCode		: gv_ma_selectedClntCd
            ,bizcompId		: 'L_FIT030'
            ,whereClause	: 'AND A.YR = ' + "'" + yyyy + "'"
            ,formId			: p_formId
            ,menuId			: p_menuId
            ,selectValue	: ''
            ,dropType		: 'down' 	// up, down
            ,dropAlign		: '' 	// left, right
            ,colValue		: 'SEQ'
            ,colLabel		: 'VAT_TMPLT_NM'
            ,columns		:[
                {caption: "부가세유형",		ref: 'VAT_TMPLT_NM', 			width:'120px',  	style:'text-align:left'},
                {caption: "신고기준시작월", 		ref: 'STANDARD_TERM_FR',    		width:'150px',  	style:'text-align:left'},
                {caption: "신고기준종료월", 		ref: 'STANDARD_TERM_TO',    		width:'150px',  	style:'text-align:left'},
                {caption: "총괄납부사업장번호", 		ref: 'UNIT_NO',    		width:'180px',  	style:'text-align:left'},
                {caption: "단위과세번호", 		ref: 'OVS_BPLC_NO',    		width:'150px',  	style:'text-align:left'},
                {caption: "확정여부", 		ref: 'CFMTN_YN',    		width:'150px',  	style:'text-align:left'},
                {caption: "SEQ", 		ref: 'SEQ',    		width:'150px',  	style:'text-align:left;display:none',}
            ]
            ,callback       : fn_choice
        });
    }
    async function fn_choice(_value) {
        /** reset **/
        jsonGrdReport.length = 0;
        grdReport.rebuild();
 
        let tr = $('#src-btn-currencyCode').siblings().find('tr.clickable-row.active');
        if (tr.length) {
            let termFr = tr.find('td[cu-code="STANDARD_TERM_FR"]');
            if (termFr.length) {
                SBUxMethod.set("srch-dtp-ymdstandardTermFr", termFr.text());
                SBUxMethod.set('srch-dtp-yyyy', termFr.text().split('-')[0]);
            }
 
            let termTo = tr.find('td[cu-code="STANDARD_TERM_TO"]');
            if (termTo.length) {
                SBUxMethod.set('srch-dtp-ymdstandardTermTo', termTo.text());
            }
        }
        var paramObj = {
            V_P_DEBUG_MODE_YN      : ''
            ,V_P_LANG_ID            : ''
            ,V_P_COMP_CODE          : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
            ,V_P_YYYY               : ''
            ,V_P_SEQ                : ''
            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''
        }
 
        let postFlag = gfnma_getTableElement("srchTable","srch-",paramObj,"V_P_",['wholePaySiteNo']);
        paramObj.V_P_SEQ = _value;
 
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2420.do", {
            getType				: 'json',
            cv_count		    : '5',
            workType            : 'DETAIL',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
    }
 
    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdReport';
        SBGridProperties.id = 'grdReport';
        SBGridProperties.jsonref = 'jsonGrdReport';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.frozencols = 2;
        SBGridProperties.columns = [
            {caption : ['사업장','신고사업장코드'],               ref : 'TX_SITE_CD',        width : '100px',    style : 'text-align:center',    type : 'output'},
            {caption : ['사업장','사업장등록번호'],          ref : 'BRNO',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매출세액','구분'],          ref : 'BRNO',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매출세액','과세표준'],          ref : 'BRNO',      width : '120px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매출세액','세율'],          ref : 'BRNO',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매출세액','세액'],          ref : 'BRNO',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매입세액','구분'],          ref : 'BRNO',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매입세액','과세표준'],          ref : 'BRNO',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매입세액','세율'],          ref : 'BRNO',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['매입세액','세액'],          ref : 'BRNO',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['가산세','가산세'],          ref : 'BRNO',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['공제세액','공제세액'],          ref : 'BRNO',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['납부세액','납부세액'],          ref : 'BRNO',      width : '150px',   style : 'text-align:center',    type : 'output'},
            {caption : ['내부거래(판매목적)','반출액'],          ref : 'BRNO',      width : '100px',   style : 'text-align:center',    type : 'output'},
            {caption : ['내부거래(판매목적)','반입액'],          ref : 'BRNO',      width : '100px',   style : 'text-align:center',    type : 'output'},
        ];
        grdReport = _SBGrid.create(SBGridProperties);
    }
 
    /** resizer set **/
    const resizer = document.getElementById('resizer');
    const leftSide = resizer.previousElementSibling;
    const rightSide = resizer.nextElementSibling;
 
    let x = 0;
    let y = 0;
 
    let leftWidth = 0;
 
    const mouseDownHandler = function (e) {
        x = e.clientX;
        y = e.clientY;
        leftWidth = leftSide.getBoundingClientRect().width;
 
        document.addEventListener('mousemove', mouseMoveHandler);
        document.addEventListener('mouseup', mouseUpHandler);
    };
 
    const mouseMoveHandler = function (e) {
        const dx = e.clientX - x;
        const dy = e.clientY - y;
 
        document.body.style.cursor = 'col-resize';
 
        leftSide.style.userSelect = 'none';
        leftSide.style.pointerEvents = 'none';
 
        rightSide.style.userSelect = 'none';
        rightSide.style.pointerEvents = 'none';
 
        const newLeftWidth = ((leftWidth + dx) * 100) / resizer.parentNode.getBoundingClientRect().width;
        leftSide.style.width = `${'${newLeftWidth}'}%`;
        grdListGrid.resize();
        grdDetailGrid.resize();
    };
 
    const mouseUpHandler = function () {
        resizer.style.removeProperty('cursor');
        document.body.style.removeProperty('cursor');
 
        leftSide.style.removeProperty('user-select');
        leftSide.style.removeProperty('pointer-events');
 
        rightSide.style.removeProperty('user-select');
        rightSide.style.removeProperty('pointer-events');
 
        document.removeEventListener('mousemove', mouseMoveHandler);
        document.removeEventListener('mouseup', mouseUpHandler);
    };
    resizer.addEventListener('mousedown', mouseDownHandler);
    /** 공통버튼 **/
    function cfn_init(){
        fn_reset();
    }
    function fn_reset(){
        jsonGrdReport.length = 0;
        grdReport.rebuild();
 
        gfnma_multiSelectSet('#src-btn-currencyCode','', '', '');
        SBUxMethod.set("srch-dtp-ymdstandardTermFr","");
        SBUxMethod.set("srch-dtp-ymdstandardTermTo","");
    }
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
    async function fn_setSiteCode() {
        var paramObj = {
            V_P_DEBUG_MODE_YN: ''
            , V_P_LANG_ID: ''
            , V_P_COMP_CODE: gv_ma_selectedCorpCd
            , V_P_CLIENT_CODE: gv_ma_selectedClntCd
            , V_P_YYYY: ''
            , V_P_SEQ: ''
            , V_P_TAX_SITE_CODE: ''
            , V_P_TAX_SITE_NAME: ''
            , V_P_BIZ_REGNO: ''
            , V_P_FORM_ID: p_formId
            , V_P_MENU_ID: p_menuId
            , V_P_PROC_ID: ''
            , V_P_USERID: ''
            , V_P_PC: ''
        }
        let postFlag = gfnma_getTableElement("srchTable", "srch-", paramObj, "V_P_", ['taxSiteName', 'bizRegno']);
        paramObj.V_P_SEQ = gfnma_multiSelectGet('#src-btn-currencyCode');
        paramObj.V_P_TAX_SITE_CODE = jsonGrdList[grdListGrid.getRow() - 1].TAX_SITE_CODE;
 
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2330.do", {
            getType: 'json',
            cv_count: '5',
            workType: 'DETAIL',
            params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
