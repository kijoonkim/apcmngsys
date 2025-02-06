<%
    /**
     * @Class Name 		: fit2140.jsp
     * @Description 	: 신용카드수령명세서(매입) 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.03
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
        table[id="panRightHeader"] td{
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
<section class="content container-fluid">
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
                            <sbux-input readonly id="srch-dtp-ymdstandardTermFr" uitype="text" class="form-control input-sm" style="text-align: center"></sbux-input>
                            <p style="text-align: center;line-height: 30px">~</p>
                            <sbux-input readonly id="srch-dtp-ymdstandardTermTo" uitype="text" class="form-control input-sm" style="text-align: center"></sbux-input>
                        </div>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row" >신고사업장</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-input id="srch-inp-taxSiteName" name="srch-inp-taxSiteName" uitype="text" class="form-control input-sm"></sbux-input>
                    </td>
                    <td></td>
                    <th scope="row" >사업자번호</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-input id="srch-inp-bizRegno" name="srch-inp-bizRegno" uitype="text" class="form-control input-sm"></sbux-input>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            </div>
                <div style=" height: 80vh; display: flex">
                <div style="width: 30%;padding: 10px">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>사업장 리스트</span></li>
                        </ul>
                    </div>
                    <div id="sb-area-grdListGrid" style="width: 100%"></div>
                </div>
                <div class="resizer" data-direction="horizontal"></div>
                <div style="padding: 10px;flex: 1;display: flex;flex-direction: column">
                    <div style="height: 50%">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>신용카드 등 매입명세 합계</span></li>
                                </ul>
                            </div>
                            <table id="panRightHeader" style="width: 100%;">
                                <colgroup>
                                    <col style="width: 25%">
                                    <col style="width: 25%">
                                    <col style="width: 25%">
                                    <col style="width: 25%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <td>구&emsp;&emsp;&emsp;&emsp;분</td>
                                    <td>거래건수 합계</td>
                                    <td>공급가액 합계</td>
                                    <td>세액 합계</td>
                                </tr>
                                <tr>
                                    <td>⑤ 합&emsp;&emsp;&emsp;계</td>
                                    <td>
                                        <sbux-input id="SUM_CNT" name="SUM_CNT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="SUM_AMT" name="SUM_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="SUM_VAT_AMT" name="SUM_VAT_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <td>⑥ 현금&emsp;영수증</td>
                                    <td>
                                        <sbux-input id="CASH_CNT" name="CASH_CNT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="CASH_AMT" name="CASH_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="CASH_VAT_AMT" name="CASH_VAT_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <td>⑦ 복&emsp;지&emsp;카&emsp;드</td>
                                    <td>
                                        <sbux-input id="WELFARE_CARD_CNT" name="WELFARE_CARD_CNT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="WELFARE_CARD_AMT" name="WELFARE_CARD_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="WELFARE_CARD_VAT_AMT" name="WELFARE_CARD_VAT_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <td>⑧ 사업용&emsp;신용카드</td>
                                    <td>
                                        <sbux-input id="BIZ_CARD_CNT" name="BIZ_CARD_CNT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="BIZ_CARD_AMT" name="BIZ_CARD_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="BIZ_CARD_VAT_AMT" name="BIZ_CARD_VAT_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <td>⑨ 그 밖의&emsp;신용카드</td>
                                    <td>
                                        <sbux-input id="ETC_CARD_CNT" name="ETC_CARD_CNT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="ETC_CARD_AMT" name="ETC_CARD_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="ETC_CARD_VAT_AMT" name="ETC_CARD_VAT_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    <div class="resizer" data-direction="vertical"></div>
                    <div style="flex: 1; background-color: white">
                        <div style="flex: 1; display: flex; flex-direction: column; height: 100%">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>그 밖의 신용,직불카드 및 기명식 선불카드 매출전표 수령금액 합계</span></li>
                                </ul>
                            </div>
                            <div id="sb-area-grdDetailGrid" style="flex: 1"></div>
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
    var jsonCorpNm = [];
    var jsonGrdList = [];
    var jsonGrdDetail = [];
 
    var grdDetailGrid;
    var grdListGrid;
 
    /** DOM load **/
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createGrid();
        fn_createGridDetail();
        fn_init();
    });
 
    const fn_init = async function(){
        /** 법인 select **/
        jsonCorpNm = await gfnma_getComSelectList('L_ORG000','','','','CO_CD',"CORP_NM");
        SBUxMethod.refresh('srch-slt-corpNm');
        SBUxMethod.setValue('srch-slt-corpNm',gv_ma_selectedCorpCd);
        /** 기준연도 **/
        let yyyy = gfn_dateToYear(new Date());
        SBUxMethod.set('srch-dtp-yyyy', yyyy);

        /** 신고구분명 select **/
        await fn_setMultSelect(yyyy);
    }
    async function fn_setMultSelect(yyyy) {
        SBUxMethod.set("srch-dtp-ymdstandardTermFr","");
        SBUxMethod.set("srch-dtp-ymdstandardTermTo","");
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
        jsonGrdList.length = 0;
        grdListGrid.rebuild();
        jsonGrdDetail.length = 0;
        grdDetailGrid.rebuild();
 
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
            V_P_DEBUG_MODE_YN      : ''
            ,V_P_LANG_ID            : ''
            ,V_P_COMP_CODE          : gv_ma_selectedCorpCd
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
        paramObj.V_P_SEQ = _value;
 
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2140.do", {
            getType				: 'json',
            cv_count			: '7',
            workType            : 'LIST',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
        if(data.resultStatus === 'S') {
            jsonGrdList = data.cv_1;
            grdListGrid.rebuild();
 
            if (grdListGrid.getRows() === 2) {
                grdListGrid.setRow(1);
                paramObj.V_P_TAX_SITE_CODE = grdListGrid.getRowData(1).TAX_SITE_CODE;
                const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2140.do", {
                    getType: 'json',
                    cv_count: '7',
                    workType: 'DETAIL',
                    params: gfnma_objectToString(paramObj)
                });
                const data = await postJsonPromise;
 
                if (data.resultStatus === 'S') {
                    let header = data.cv_2[0];
                    jsonGrdDetail = data.cv_3;
                    grdDetailGrid.rebuild();
                    for (let key in header ) {
                        $(`#${'${key}'}`).val(header[key]);
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
            {caption : ['신고사업장명'],               ref : 'TX_SITE_NM',        width : '50%',    style : 'text-align:center',    type : 'output'},
            {caption : ['사업자번호'],          ref : 'BRNO',      width : '50%',   style : 'text-align:center',    type : 'output'},
        ];
        grdListGrid = _SBGrid.create(SBGridProperties);
        grdListGrid.bind("click","fn_setSiteCode");
    }
 
    const fn_createGridDetail = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdDetailGrid';
        SBGridProperties.id = 'grdDetailGrid';
        SBGridProperties.jsonref = 'jsonGrdDetail';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['NO','NO'], ref : 'CARD_SEQ', width : '5%', style : 'text-align:center',    type : 'output'},
            {caption : ['⑩ 카드회원번호','⑩ 카드회원번호'], ref : 'CARD_NO', width : '20%', style : 'text-align:center',    type : 'output'},
            {caption : ['거래처명','거래처명'], ref : 'CNPT_NM', width : '15%', style : 'text-align:center',    type : 'output'},
            {caption : ['⑪ 공급자 사업자등록번호','⑪ 공급자 사업자등록번호'], ref : 'BRNO', width : '20%', style : 'text-align:center',    type : 'output'},
            {caption : ['⑫ 그 밖의 신용카드 등 거래명세 합계','거래건수'], ref : 'ETC_CARD_CNT', width : '10%', style : 'text-align:center',    type : 'output'},
            {caption : ['⑫ 그 밖의 신용카드 등 거래명세 합계','공급가액'], ref : 'SPLY_AMT', width : '15%', style : 'text-align:center',    type : 'output'},
            {caption : ['⑫ 그 밖의 신용카드 등 거래명세 합계','세액'], ref : 'VAT_AMT', width : '15%', style : 'text-align:center',    type : 'output'},
        ];
        grdDetailGrid = _SBGrid.create(SBGridProperties);
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
        jsonGrdList.length = 0;
        grdListGrid.rebuild();
        jsonGrdDetail.length = 0;
        grdDetailGrid.rebuild();
 
        gfnma_multiSelectSet('#src-btn-currencyCode','', '', '');
        SBUxMethod.set("srch-dtp-ymdstandardTermFr","");
        SBUxMethod.set("srch-dtp-ymdstandardTermTo","");
 
        const inputs = document.querySelectorAll('#panRightHeader input');
        inputs.forEach(input => {
            input.value = 0;
        });
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
    async function fn_setSiteCode(){
        var paramObj = {
            V_P_DEBUG_MODE_YN      : ''
            ,V_P_LANG_ID            : ''
            ,V_P_COMP_CODE          : gv_ma_selectedCorpCd
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
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2140.do", {
            getType: 'json',
            cv_count: '7',
            workType: 'DETAIL',
            params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
 
        if (data.resultStatus === 'S') {
            let header = data.cv_2[0];
            jsonGrdDetail = data.cv_3;
            grdDetailGrid.rebuild();
            for (let key in header ) {
                $(`#${'${key}'}`).val(header[key]);
            }
        }
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
