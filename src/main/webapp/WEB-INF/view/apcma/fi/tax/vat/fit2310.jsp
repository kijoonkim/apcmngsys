<%
    /**
     * @Class Name 		: fit2140.jsp
     * @Description 	: 수출실적명세서 화면
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
        table[id="panRightHeader"] td{
            text-align: center;
            border: solid 1px blue;
            padding: 5px;
        }
        .tpgTd{
            border: 0 !important;
            background-color : white !important;
            border-radius: 0 !important;
            padding: 0px 12px !important;
            height: auto;
        }
        #page{
            display: grid;
            grid-template-rows: 1fr 5px 2fr;
            grid-template-columns: 1fr 5px 3fr;
            height: 80vh;
            grid-template-areas:
            'leftcol leftresizer rightTop'
            'leftcol leftresizer rightresizer'
            'leftcol leftresizer rightBottom'
        }
        #leftcol{
            padding: 10px;
            grid-area: leftcol;
            overflow: hidden;
        }
        #rightTop{
            padding: 10px;
            grid-area: rightTop;
            overflow: hidden;
        }
        #rightBottom{
            grid-area: rightBottom;
            overflow: hidden;
        }
        #leftresizer{
            cursor: ew-resize;
            grid-area: leftresizer;
            background-image:url('/static/resource/svg/dot_h.svg');
            background-repeat: no-repeat;
            background-position: center;
            background-size: 17px;
            background-color: rgba(43, 45, 48, 0.07);
            height: 100%;
            width: 5px;
        }
        #rightresizer{
            cursor: ns-resize;
            grid-area: rightresizer;
            background-image:url('/static/resource/svg/dot_w.svg');
            background-repeat: no-repeat;
            background-position: center;
            background-size: 17px;
            background-color: rgba(43, 45, 48, 0.07);
            height: 5px;
            width: 100%;
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
                        <sbux-datepicker id="srch-dtp-yyyy"
                                         name="srch-dtp-yyyy"
                                         uitype="popup"
                                         datepicker-mode="year"
                                         date-format="yyyy"
                                         class="table-datepicker-ma"
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
                <div id="page" onmouseup="EndDrag()" onmousemove="OnDrag(event)">
                <div id="leftcol">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎ 사업장 리스트</span></li>
                        </ul>
                    </div>
                    <div id="sb-area-grdListGrid" style="width: 100%"></div>
                </div>
                <div id="leftresizer" onmousedown="StartHDrag(1)"></div>
                <div id="rightTop">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎ 수출재화 집계내역</span></li>
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
                            <td class="td_headP">구분</td>
                            <td class="td_headP">건&emsp;&emsp;수</td>
                            <td class="td_headP">외화금액</td>
                            <td class="td_headP">원화금액</td>
                        </tr>
                        <tr>
                            <td class="td_headP">⑨합&emsp;&emsp;계</td>
                            <td>
                                <sbux-input id="SUM_CNT" name="SUM_CNT" uitype="text"
                                            class="tpgTd" init="0" readonly
                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                </sbux-input>
                            </td>
                            <td>
                                <sbux-input id="EXPORT_SUM_AMT" name="EXPORT_SUM_AMT" uitype="text"
                                            class="tpgTd" init="0" readonly
                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                </sbux-input>
                            </td>
                            <td>
                                <sbux-input id="EXPORT_SUM_KRW_AMT" name="EXPORT_SUM_KRW_AMT" uitype="text"
                                            class="tpgTd" init="0" readonly
                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                </sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_headP">⑩ 수출재화</td>
                            <td>
                                <sbux-input id="EXPORT_CNT" name="EXPORT_CNT" uitype="text"
                                            class="tpgTd" init="0" readonly
                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                </sbux-input>
                            </td>
                            <td>
                                <sbux-input id="EXPRT_AMT" name="EXPRT_AMT" uitype="text"
                                            class="tpgTd" init="0" readonly
                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                </sbux-input>
                            </td>
                            <td>
                                <sbux-input id="EXPORT_KRW_AMT" name="EXPORT_KRW_AMT" uitype="text"
                                            class="tpgTd" init="0" readonly
                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                </sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_headP">⑪ 기타 영세율적용</td>
                            <td>
                                <sbux-input id="ETC_CNT" name="ETC_CNT" uitype="text"
                                            class="tpgTd" init="0" readonly
                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                </sbux-input>
                            </td>
                            <td>
                                <sbux-input id="ETC_AMT" name="ETC_AMT" uitype="text"
                                            class="tpgTd" init="0" readonly
                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                </sbux-input>
                            </td>
                            <td>
                                <sbux-input id="ETC_KRW_AMT" name="ETC_KRW_AMT" uitype="text"
                                            class="tpgTd" init="0" readonly
                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                </sbux-input>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div id="rightresizer" onmousedown="StartVDrag(1)"></div>
                <div id="rightBottom">
                    <div style="flex: 1; display: flex; flex-direction: column; height: 100%">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>◎ 수출재화신고내역</span></li>
                            </ul>
                        </div>
                        <div id="sb-area-grdDetailGrid" style="flex: 1"></div>
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
    /** resizer **/
    let cols = ['1fr','5px','3fr'];
    let colns = ['leftcol','','rightBottom'];
    let Tcols = [];
 
    let rows = ['1fr','5px','2fr'];
    let rowns = ['rightTop','','rightBottom'];
    let Trows = [];
    let CLfactor;
    let CRfactor;
    let gWcol = -1;
    let gWrow = -1;
 
 
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
        SBUxMethod.set('srch-dtp-yyyy',yyyy);
 
        /** 신고구분명 select **/
        await fn_setMultSelect(yyyy);
    }
    async function fn_setMultSelect(yyyy){
        SBUxMethod.set("srch-dtp-ymdstandardTermFr","");
        SBUxMethod.set("srch-dtp-ymdstandardTermTo","");
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
 
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2310.do", {
            getType				: 'json',
            cv_count			: '8',
            workType            : 'LIST',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
        console.log(data,"첫번째");
        if(data.resultStatus === 'S') {
            jsonGrdList = data.cv_1;
            grdListGrid.rebuild();
 
            if (grdListGrid.getRows() === 2) {
                grdListGrid.setRow(1);
                paramObj.V_P_TAX_SITE_CODE = grdListGrid.getRowData(1).TAX_SITE_CODE;
                const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2310.do", {
                    getType: 'json',
                    cv_count: '8',
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
 
    const fn_createGridDetail = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdDetailGrid';
        SBGridProperties.id = 'grdDetailGrid';
        SBGridProperties.jsonref = 'jsonGrdDetail';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {
                caption: ['⑫ 일련번호', '⑫ 일련번호'],
                ref: 'EXPORT_SEQ',
                width: '20%',
                style: 'text-align:center',
                type: 'output'
            },
            {
                caption: ['⑬ 수출신고번호', '⑬ 수출신고번호'],
                ref: 'EXPRT_LCNS_NO',
                width: '15%',
                style: 'text-align:center',
                type: 'output'
            },
            {
                caption: ['⑭ 선(기)적일자', '⑭ 선(기)적일자'],
                ref: 'SHPG_YMD',
                width: '20%',
                style: 'text-align:center',
                type: 'output'
            },
            {
                caption: ['⑮ 통화코드', '⑮ 통화코드'],
                ref: 'CRN_CD',
                width: '10%',
                style: 'text-align:center',
                type: 'output'
            },
            {caption: ['환율', '환율'], ref: 'EXCHRT', width: '15%', style: 'text-align:center', type: 'output'},
            {caption: ['금액', '외화'], ref: 'EXPRT_FRCNCY_AMT', width: '15%', style: 'text-align:center', type: 'output'},
            {caption: ['금액', '원화'], ref: 'KRW_AMT', width: '15%', style: 'text-align:center', type: 'output'},
        ];
        grdDetailGrid = _SBGrid.create(SBGridProperties);
    }
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
 
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2310.do", {
            getType: 'json',
            cv_count: '8',
            workType: 'DETAIL',
            params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
    }
 
    /** resizer fn **/
    function StartHDrag(pWcol) {
        isHDragging = true;
        CLfactor = parseFloat(cols[pWcol - 1]) / document.getElementById(colns[pWcol - 1]).clientWidth;
        CRfactor = parseFloat(cols[pWcol + 1]) / document.getElementById(colns[pWcol + 1]).clientWidth;
        Tcols = cols.map(parseFloat);
        gWcol = pWcol;
    }
 
    function StartVDrag(pRow) {
        isVDragging = true;
        CLfactor = parseFloat(rows[pRow - 1]) / document.getElementById(rowns[pRow - 1]).clientHeight;
        CRfactor = parseFloat(rows[pRow + 1]) / document.getElementById(rowns[pRow + 1]).clientHeight;
        Trows = rows.map(parseFloat);
        gWrow = pRow;
    }
 
    function EndDrag() {
        isHDragging = false;
        isVDragging = false;
        grdListGrid.rebuild();
        grdDetailGrid.rebuild();
    }
 
    function OnDrag(event) {
        if (isHDragging) {
            Tcols[gWcol - 1] += (CLfactor * event.movementX);
            Tcols[gWcol + 1] -= (CLfactor * event.movementX);
 
            cols[gWcol - 1] = Math.max(Tcols[gWcol - 1], 0.01) + "fr";
            cols[gWcol + 1] = Math.max(Tcols[gWcol + 1], 0.01) + "fr";
            let newColDefn = cols.join(" ");
            page.style.gridTemplateColumns = newColDefn;
 
        } else if (isVDragging) {
            Trows[gWrow - 1] += (CLfactor * event.movementY);
            Trows[gWrow + 1] -= (CLfactor * event.movementY);
 
            rows[gWrow - 1] = Math.max(Trows[gWrow - 1], 0.01) + "fr";
            rows[gWrow + 1] = Math.max(Trows[gWrow + 1], 0.01) + "fr";
            let newRowDefn = rows.join(" ");
            page.style.gridTemplateRows = newRowDefn;
            //document.getElementById("footer").innerHTML = newRowDefn;
            $('#footer').html(newRowDefn);
        }
        event.preventDefault()
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
