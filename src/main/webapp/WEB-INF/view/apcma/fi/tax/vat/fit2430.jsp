<%
    /**
     * @Class Name 		: fit2430.jsp
     * @Description 	: 단위과세부가세납부세액명세서 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.15
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.11   	신정철		최초 생성
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
    <title>title : 단위과세부가세납부세액명세서</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
    <style>
        #Sales > table > tbody > tr > td,#Purchase > table > tbody > tr > td{
            text-align: center;
            border: 1px solid #e8f1f9 !important;
        }
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
    </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid" style="border-radius: 0">
        <div class="box-header">
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
                                         date-format="yyyy"class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed"
                        >
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
                            <sbux-input readonly id="srch-dtp-ymdstandardTermFr" uitype="text" class="form-control input-sm" style="text-align: center;"></sbux-input>
                            <p style="text-align: center;line-height: 30px">~</p>
                            <sbux-input readonly id="srch-dtp-ymdstandardTermTo" uitype="text" class="form-control input-sm" style="text-align: center"></sbux-input>
                        </div>
                    </td>
                    <td></td>
                    <th scope="row" >단위과세승인번호</th>
                    <td colspan="3" class="td_input">
                        <sbux-input id="srch-inp-wholePaySiteNo" name="srch-inp-wholePaySiteNo" uitype="text" class="form-control input-sm" ></sbux-input>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            </div>
            <div>
                <div id="sb-area-grdListGrid" style="width: 100%; height: 600px"></div>
            </div>
        </div>
    </div>
</section>
</body>
<script>
    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------
    var jsonCorpNm = [];
    var jsonGrdList = [];
 
    var grdListGrid;
 
    /** DOM load **/
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createGrid();
        fn_init();
    });
    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdListGrid';
        SBGridProperties.id = 'grdListGrid';
        SBGridProperties.jsonref = 'jsonGrdList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.frozencols = 3;
        SBGridProperties.columns = [
            {caption : ['사업장','종사업장번호'],ref : 'TX_SITE_NM',width : '100px', style : 'text-align:center', type : 'output'},
            {caption : ['사업장','신고사업장명'],ref : 'TX_SITE_NM',width : '100px', style : 'text-align:center', type : 'output'},
            {caption : ['사업장','사업장등록번호'],ref : 'TX_SITE_NM',width : '100px', style : 'text-align:center', type : 'output'},
            {caption : ['매출세액','구분'], ref : 'BRNO', width : '100px',style : 'text-align:center', type : 'output'},
            {caption : ['매출세액','상세구분'], ref : 'BRNO', width : '100px',style : 'text-align:center', type : 'output'},
            {caption : ['매출세액','과세표준'], ref : 'BRNO', width : '100px',style : 'text-align:center', type : 'output'},
            {caption : ['매출세액','세액'], ref : 'BRNO', width : '100px',style : 'text-align:center', type : 'output'},
            {caption : ['매입세액','구분'], ref : 'BRNO', width : '100px',style : 'text-align:center', type : 'output'},
            {caption : ['매입세액','상세구분'], ref : 'BRNO', width : '100px',style : 'text-align:center', type : 'output'},
            {caption : ['매입세액','과세표준'], ref : 'BRNO', width : '100px',style : 'text-align:center', type : 'output'},
            {caption : ['매입세액','세액'], ref : 'BRNO', width : '100px',style : 'text-align:center', type : 'output'},
            {caption : ['가산세','가산세'], ref : 'BRNO', width : '100px',style : 'text-align:center', type : 'output'},
            {caption : ['공제세액','공제세액'], ref : 'BRNO', width : '100px',style : 'text-align:center', type : 'output'},
            {caption : ['납부세액','납부세액'], ref : 'BRNO', width : '100px',style : 'text-align:center', type : 'output'},
            {caption : ['비고','비고'], ref : 'BRNO', width : '100px',style : 'text-align:center', type : 'output'},
        ];
        grdListGrid = _SBGrid.create(SBGridProperties);
    };
    const fn_init = async function(){
        /** 법인 select **/
        jsonCorpNm = await gfnma_getComSelectList('L_ORG000','','','','CO_CD',"CORP_NM");
        SBUxMethod.refresh('srch-slt-corpNm');
        SBUxMethod.setValue('srch-slt-corpNm',gv_ma_selectedCorpCd);
 
        /** 기준연도 **/
        SBUxMethod.set('srch-dtp-yyyy',gfn_dateToYear(new Date()));
 
        /** 신고구분명 select **/
        gfnma_multiSelectInit({
            target			: ['#src-btn-currencyCode']
            ,compCode		: gv_ma_selectedCorpCd
            ,clientCode		: gv_ma_selectedClntCd
            ,bizcompId		: 'L_FIT030'
            ,whereClause	: ''
            ,formId			: p_formId
            ,menuId			: p_menuId
            ,selectValue	: ''
            ,dropType		: 'down' 	// up, down
            ,dropAlign		: 'right' 	// left, right
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
        })
    }
    async function fn_choice(_value) {
        /** reset **/
        // jsonGrdList.length = 0;
        // grdListGrid.rebuild();
 
        const inputs = document.querySelectorAll('#panRightHeader input');
        inputs.forEach(input => {
            input.value = 0;
        });
 
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
 
        let postFlag = gfnma_getTableElement("srchTable", "srch-", paramObj, "V_P_", ['wholePaySiteNo']);
        paramObj.V_P_SEQ = _value;
 
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2430.do", {
            getType: 'json',
            cv_count: '4',
            workType: 'DETAIL',
            params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
    }
    function cfn_search(){
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
    function cfn_init(){
        fn_reset();
    }
    function fn_reset(){
        jsonGrdList.length = 0;
        grdListGrid.rebuild();
        jsonGrdAr.length = 0;
        grdAr.rebuild();
        jsonGrdAp.length = 0;
        grdAp.rebuild();
 
        gfnma_multiSelectSet('#src-btn-currencyCode','', '', '');
        SBUxMethod.set("srch-dtp-ymdstandardTermFr","");
        SBUxMethod.set("srch-dtp-ymdstandardTermTo","");
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
