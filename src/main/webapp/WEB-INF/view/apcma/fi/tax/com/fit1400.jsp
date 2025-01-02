<%
    /**
     * @Class Name 		: fit1400.jsp
     * @Description 	: 부가가치세 기준정보 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.06.28
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.06.28   	이경한		최초 생성
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
    <title>title : 부가가치세 기준정보</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
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
                <table class="table table-bordered tbl_fixed table-search-ma">
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
                        <th scope="row" >기준년도</th>
                        <td colspan="3" class="td_input" style="border-right: hidden;">
                            <sbux-datepicker id="srch-dtp-yyyy" name="srch-dtp-yyyy" uitype="popup" datepicker-mode="year"
                                             date-format="yyyy" class="table-datepicker-ma"
                                             onchange="fn_setMultSelect(srch-dtp-yyyy)">
                            </sbux-datepicker>
                        </td>
                        <td></td>
                        <th scope="row" >신고구분명</th>
                        <td colspan="3" class="td_input" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="src-btn-currencyCode" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="src-btn-currencyCode" style="width:750px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                        </td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
                <!-- content_header end -->
            </div>
 
            <!-- content_body start -->
            <div style="display: flex; flex-direction: column; height: 85vh">
                <div style="flex: 1;">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎ 신고 기준정보 리스트</span></li>
                        </ul>
                    </div>
                    <div id="sb-area-rptStdGrid"></div>
                </div>
                <div style="flex: 1;">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎ 신고 기준정보 편집</span></li>
                        </ul>
                    </div>
                    <div>
                        <table id="middleTable" class="table table-bordered tbl_fixed">
                            <caption>검색 조건 설정</caption>
                            <colgroup>
                                <col style="width: 10%">
                                <col style="width: 9%">
                                <col style="width: 3%">
                                <col style="width: 10%">
                                <col style="width: 9%">
                                <col style="width: 3%">
                                <col style="width: 10%">
                                <col style="width: 9%">
                                <col style="width: 3%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" class="th_bg">기준연도</th> <!--class="data_required" 필수 표기 -->
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-datepicker id="reg-dtp-yyyy" name="reg-dtp-yyyy" uitype="popup" datepicker-mode="year" date-format="yyyy"
                                                     class="table-datepicker-ma" onchange="fn_seqChange(reg-dtp-yyyy)">
                                    </sbux-datepicker>
                                    <sbux-input id="reg-inp-seq" name="reg-inp-seq" uitype="text" style="display: none">
 
                                    </sbux-input>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">부가세기간구분</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-select id="reg-slt-taxTerm" name="reg-slt-taxTerm" uitype="single" jsondata-ref="jsonCbotaxTerm" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">신고구분</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-select id="reg-slt-vatRepDetailType" name="reg-slt-vatRepDetailType" uitype="single" jsondata-ref="jsonCbotaxRepDtlType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">부가세 서식명</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-input id="reg-inp-vatTypeName" name="reg-inp-vatTypeName" uitype="text"></sbux-input>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">신고기준월</th>
                                <td class="td_input" style="border-right: hidden" colspan="2">
                                    <div style="display: flex; gap: 10px">
                                        <sbux-datepicker id="reg-dtp-standardMonthFr"
                                                         name="reg-dtp-standardMonthFr"
                                                         uitype="popup" datepicker-mode="month"
                                                         date-format="yyyy-mm"
                                                         class="table-datepicker-ma">
                                        </sbux-datepicker>
                                        <sbux-datepicker id="reg-dtp-standardMonthTo"
                                                         name="reg-dtp-standardMonthTo"
                                                         uitype="popup" datepicker-mode="month"
                                                         date-format="yyyy-mm"
                                                         class="table-datepicker-ma">
                                        </sbux-datepicker>
                                    </div>
                                </td>
 
                                <th scope="row" class="th_bg">신고일</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-datepicker
                                            id="reg-dtp-reportDate"
                                            name="reg-dtp-reportDate"
                                            uitype="popup"
                                            class="table-datepicker-ma" date-format="yyyy-mm-dd">
                                    </sbux-datepicker>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">조기환급 신고여부</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-checkbox id="reg-chk-refundYn" name="reg-chk-refundYn" uitype="normal" text="조기환급신고" false-value="N" true-value="Y">
                                    </sbux-checkbox>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">환급구분</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-select id="reg-slt-refundType" name="reg-slt-refundType" uitype="single" jsondata-ref="jsonCboRfType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">조기환급취소여부</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-checkbox id="reg-chk-refundCancelYn" name="reg-chk-refundCancelYn" uitype="normal" text="조기환급취소여부" false-value="N" true-value="Y">
                                    </sbux-checkbox>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">총괄(단위과세)번호</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-input id="reg-inp-payOrgsiteNo" name="reg-inp-payOrgsiteNo" uitype="text"></sbux-input>
                                </td>
                                <td colspan="7"></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">비고</th>
                                <td class="td_input" colspan="8">
                                    <sbux-textarea id="reg-txa-memo" name="reg-txa-memo"  uitype="normal" rows="2" wrap-style="width:100%">
                                    </sbux-textarea>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div style="flex: 1;">
                    <div style="display: flex;gap:100px;">
                        <div style="width: 35%">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>◎ 신고사업장 정보 리스트</span></li>
                                </ul>
                            </div>
                            <div id="sb-area-rptSiteGrid"></div>
                        </div>
                        <div style="width: 50%">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>◎ 부가세 부속서류 첨부 리스트</span></li>
                                </ul>
                            </div>
                            <div id="sb-area-attVatDom"></div>
                        </div>
 
                    </div>
                </div>
            </div>
            <!-- content_body end -->
 
        </div>
    </div>
</section>
 
 
</body>
<script type="text/javascript">
    // common ---------------------------------------------------
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------
    /** 부가세기간 구분 **/
    var jsonCbotaxTerm = [];
    /** 신고 구분 **/
    var jsonCbotaxRepDtlType = [];
    /** 환급 구분 **/
    var jsonCboRfType = [];
 
 
    /** DOM load **/
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createRptStdGrid();
        fn_createRptSiteGrid();
        fn_createAttVatDom();
 
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
 
        /** 등록조건_부가세기준정보 select **/
        jsonCbotaxTerm = await gfnma_getComSelectList('L_FIT002','',gv_ma_selectedCorpCd,gv_ma_selectedClntCd,'SBSD_CD',"CD_NM");
        SBUxMethod.refresh("reg-slt-taxTerm");
 
        /** 등록조건_신고구분 select **/
        jsonCbotaxRepDtlType = await gfnma_getComSelectList('L_FIT035','',gv_ma_selectedCorpCd,gv_ma_selectedClntCd,'SBSD_CD',"CD_NM");
        SBUxMethod.refresh("reg-slt-vatRepDetailType");
 
        /** 등록조건_환급구분 select **/
        jsonCboRfType = await gfnma_getComSelectList('L_FIT023','',gv_ma_selectedCorpCd,gv_ma_selectedClntCd,'SBSD_CD',"CD_NM");
        SBUxMethod.refresh("reg-slt-refundType");
 
        await fn_search();
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
 
    async function fn_choice(_value){
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
    }
 
 
    /** 기준정보 리스트 **/
    let rptStdGrid;
    var jsonRptStdGrid = [];
 
    /** 신고사업장 리스트**/
    let rptSiteGrid;
    var jsonRptSiteGrid = [];
 
    /** 부가세 부속서류 첨부 리스트**/
    let vatGrid;
    var jsonVatGrid = [];
 
 
    var jsonCorpNm =[];
 
    /** 기준정보 GRID **/
    function fn_createRptStdGrid(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-rptStdGrid';
        SBGridProperties.id = 'rptStdGrid';
        SBGridProperties.jsonref = 'jsonRptStdGrid';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.emptyareaindexclear = false;
        SBGridProperties.columns =[
            {caption: ['기준연도'], 			ref: 'yyyy', 		width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['부가세기간구분'], 			ref: 'taxTerm', 		width: '7%',	type: 'combo',	style:'text-align: center', typeinfo : {ref:'jsonCbotaxTerm', label:'label', value:'value'}},
            {caption: ['신고구분'],				ref: 'vatRepDetailType', 		width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['부가세 서식명'],				ref: 'vatTypeName', 		width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고기준시작월'], 				ref: 'standardMonthFr', 	width: '7%',	type: 'output',	style:'text-align: center',format : {type:'date', rule:'yyyy-mm', origin : 'yyyymm'}},
            {caption: ['신고기준종료월'], 				ref: 'standardMonthTo', 	width: '7%',	type: 'output',	style:'text-align: center',format : {type:'date', rule:'yyyy-mm', origin : 'yyyymm'}},
            {caption: ['신고사업장수'], 				ref: 'siteCnt', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고일'], 				ref: 'reportDate', 	width: '7%',	type: 'output',	style:'text-align: center',format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd'}},
            {caption: ['비고'], 				ref: 'memo', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['총괄납부(단위과세)관리번호'], 				ref: 'payOrgsiteNo', 	width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['조기환급신고여부'], 				ref: 'refundYn', 	width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['환급구분'], 				ref: 'refundType', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['환급취소여부'], 				ref: 'refundCancelYn', 	width: '7%',	type: 'output',	style:'text-align: center'},
        ]
        rptStdGrid = _SBGrid.create(SBGridProperties);
        rptStdGrid.bind('click','fn_setMdGrid');
    }
 
    /** 신고사업장 정보 GRID **/
    function fn_createRptSiteGrid(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-rptSiteGrid';
        SBGridProperties.id = 'rptSiteGrid';
        SBGridProperties.jsonref = 'jsonRptSiteGrid';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns =[
            {caption: ['신고사업장명'], 			ref: 'taxSiteName', 		width: '50%',	type: 'output',	style:'text-align: center'},
            {caption: ['사업자번호'], 			ref: 'bizRegno', 		width: '30%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고여부'],				ref: 'chkYn', 		width: '20%',   style:'text-align: center', type : 'checkbox', typeinfo : {checkedvalue : 'Y', uncheckedvalue : 'N'}},
        ]
        rptSiteGrid = _SBGrid.create(SBGridProperties);
    }
 
    /** 부가세 첨부서류 GRID **/
    function fn_createAttVatDom(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-attVatDom';
        SBGridProperties.id = 'vatGrid';
        SBGridProperties.jsonref = 'jsonVatGrid';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns =[
            {caption: ['순번'], 			ref: 'reportSeq', 		width: '20%',	type: 'output',	style:'text-align: center'},
            {caption: ['서식명'], 			ref: 'vatReportName', 		width: '50%',	type: 'output',	style:'text-align: center'},
            {caption: ['작성대상'],				ref: 'useYn', 		width: '30%',	style:'text-align: center', type : 'checkbox', typeinfo : {checkedvalue : 'Y', uncheckedvalue : 'N'}},
        ]
        vatGrid = _SBGrid.create(SBGridProperties);
    }
    /** camelCase FN **/
    function toCamelCase(snakeStr) {
        return snakeStr.toLowerCase().replace(/_([a-z])/g, (match, letter) => letter.toUpperCase());
    }
 
    function convertArrayToCamelCase(array) {
        return array.map(obj => {
            return Object.keys(obj).reduce((acc, key) => {
                const camelKey = toCamelCase(key);
                acc[camelKey] = obj[key];
                return acc;
            }, {});
        });
    }
 
 
 
    /** grid click event mdTable 셋팅 **/
    const fn_setMdGrid = async function(){
        let idx = rptStdGrid.getRow();
        let data = rptStdGrid.getRowData(idx);
        let cnt = rptStdGrid.getRows();
 
        let table = document.getElementById("middleTable");
        let regs = table.querySelectorAll(`[id^="reg-"]`);
 
        for (const item of regs) {
           let wordIdx = item.id.lastIndexOf('-') + 1;
           let key = item.id.substring(wordIdx);
           await SBUxMethod.set(item.id,data[key]);
        }
 
        /** middle seq는 선택된 로우의 seq가 아니라 전체 행의 갯수 **/
        SBUxMethod.set("reg-inp-seq",cnt);
        /** 연도 readOnly **/
        SBUxMethod.attr('reg-dtp-yyyy', 'readonly', 'true');
        SBUxMethod.attr('reg-slt-taxTerm', 'readonly', 'true');
        let idx2 = rptStdGrid.getRow();
    }
    /** 신고 기준정보 리스트 조회 **/
    const fn_searchStdRep = async function(){
        /** 조회 결과 초기화 **/
        rptStdGrid.length = 0;
        rptStdGrid.rebuild();
        let V_P_YYYY = gfnma_nvl(SBUxMethod.get("srch-dtp-yyyy"));
        let V_P_SEQ = gfnma_multiSelectGet("#src-btn-currencyCode");
 
        var paramObj = {
            V_P_DEBUG_MODE_YN        : ""
            ,V_P_LANG_ID              : ""
            ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
            ,V_P_YYYY                 : V_P_YYYY
            ,V_P_SEQ                  : V_P_SEQ
            ,V_P_TAX_SITE_CODE        : ""
            ,V_P_FORM_ID              : p_formId
            ,V_P_MENU_ID              : p_formId
            ,V_P_PROC_ID              : ""
            ,V_P_USERID               : p_formId
            ,V_P_PC                   : ""
        };
 
        const postJsonPromise = gfn_postJSON("/fi/tax/selectFit1400Q.do", {
            getType				: 'json',
            workType			: 'Q',
            cv_count			: '5',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
 
        try{
            if (_.isEqual("S", data.resultStatus)) {
                if(!gfn_isEmpty(data.cv_1)){
                    const camelCasedArray = convertArrayToCamelCase(data.cv_1);
                    jsonRptStdGrid = camelCasedArray;
                    rptStdGrid.rebuild();
                    if(jsonRptStdGrid.length > 0){
                        rptStdGrid.clickRow(0);
                    }
                }
            }
 
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
 
    /** 신고사업장 목록 조회 **/
    const fn_searchRepSite = async function(){
 
        jsonRptSiteGrid.length = 0;
        rptSiteGrid.rebuild();
 
        var paramObj = {
            V_P_DEBUG_MODE_YN        : ""
            ,V_P_LANG_ID              : ""
            ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
            ,V_P_YYYY                 : ""
            ,V_P_SEQ                  : ""
            ,V_P_TAX_SITE_CODE        : ""
            ,V_P_FORM_ID              : p_formId
            ,V_P_MENU_ID              : p_formId
            ,V_P_PROC_ID              : ""
            ,V_P_USERID               : p_formId
            ,V_P_PC                   : ""
        };
 
        const postJsonPromise = gfn_postJSON("/fi/tax/selectFit1400Q.do", {
            getType				: 'json',
            workType			: 'Q1',
            cv_count			: '5',
            params				: gfnma_objectToString(paramObj)
        });
 
        const data = await postJsonPromise;
 
        try{
            if (_.isEqual("S", data.resultStatus)) {
                if(!gfn_isEmpty(data.cv_2)){
                    const camelCasedArray = convertArrayToCamelCase(data.cv_2);
                    jsonRptSiteGrid = camelCasedArray;
                    rptSiteGrid.rebuild();
                }
            }
 
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
 
    /** 부가세 부속서류 리스트 조회 **/
    const fn_searchVatDom = async function(){
 
        /** 조회 결과 초기화 **/
        jsonVatGrid.length = 0;
        vatGrid.rebuild();
 
        var paramObj = {
            V_P_DEBUG_MODE_YN        : ""
            ,V_P_LANG_ID              : ""
            ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
            ,V_P_YYYY                 : ""
            ,V_P_SEQ                  : ""
            ,V_P_TAX_SITE_CODE        : ""
            ,V_P_FORM_ID              : p_formId
            ,V_P_MENU_ID              : p_formId
            ,V_P_PROC_ID              : ""
            ,V_P_USERID               : p_formId
            ,V_P_PC                   : ""
        };
 
        const postJsonPromise = gfn_postJSON("/fi/tax/selectFit1400Q.do", {
            getType				: 'json',
            workType			: 'NEW_Q2',
            cv_count			: '5',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
 
        try{
            if (_.isEqual("S", data.resultStatus)) {
                if(!gfn_isEmpty(data.cv_5)){
                    const camelCasedArray = convertArrayToCamelCase(data.cv_5);
                    jsonVatGrid = camelCasedArray;
                    vatGrid.rebuild();
                }
            }
 
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
 function cfn_save() {
        fn_save();
 }
 function cfn_add() {
        fn_create();
 }
 function cfn_del() {
        fn_delete();
 }
 function cfn_search() {
        fn_search();
 }
 function cfn_init(){
        fn_reset();
 }
 const fn_seqChange = async function(_id){
        await SBUxMethod.set("srch-dtp-yyyy",_id);
        await fn_search();
 }
const fn_reset = async function(){
    await fn_init();
    let table = document.getElementById("middleTable");
    let regs = table.querySelectorAll(`[id^="reg-"]`);
    for (const item of regs) {
        await SBUxMethod.set(item.id,'');
    }
}
 
const fn_save = async function(){
 
    if(!gfn_comConfirm("Q0001","저장")){
        return;
    }
    let status = "";
    let rowIdx = rptStdGrid.getRow();
 
    if($("#reg-dtp-yyyy").prop('readonly')){
        status = "U";
    }else{
        status = "N";
    }
    var paramObj = {
         V_P_DEBUG_MODE_YN              : ''
        ,V_P_LANG_ID                    : ''
        ,V_P_COMP_CODE                  : gv_ma_selectedCorpCd
        ,V_P_CLIENT_CODE                : gv_ma_selectedClntCd
        ,VL_P_YYYY                      : ''
        ,V_P_SEQ                        : ''
        ,V_P_TAX_TERM                   : ''
        ,V_P_VAT_REP_DETAIL_TYPE        : ''
        ,V_P_REFUND_YN                  : ''
        ,V_P_VAT_TYPE_NAME              : ''
        ,V_P_STANDARD_MONTH_FR          : ''
        ,V_P_STANDARD_MONTH_TO          : ''
        ,V_P_REPORT_DATE                : ''
        ,V_P_PAY_ORGSITE_NO             : ''
        ,V_P_MEMO                       : ''
        ,V_P_REFUND_TYPE                : ''
        ,V_P_REFUND_CANCEL_YN           : ''
        ,V_P_FORM_ID                    : p_formId
        ,V_P_MENU_ID                    : p_menuId
        ,V_P_PROC_ID                    : ''
        ,V_P_USERID			            : ''
        ,V_P_PC				            : ''
    }
    let postFlag = gfnma_getTableElement("middleTable","reg-",paramObj,"V_P_",["memo","seq"]);
 
    if(!postFlag){
        return;
    }
    /** 공통으로 get 불가능한 요소 **/
    let seq = '';
    if(status === 'U'){
        seq = gfnma_nvl(rptStdGrid.getRowData(rowIdx).seq);
    }else if(status === 'N'){
        seq = gfnma_nvl(rptStdGrid.getRows());
    }
 
    paramObj.V_P_SEQ = seq;
 
    const postJsonPromise = gfn_postJSON("/fi/tax/insertFit1400S.do", {
        getType				: 'json',
        cv_count			: '0',
        workType            : status,
        params				: gfnma_objectToString(paramObj)
    });
    const data = await postJsonPromise;
 
    if(data.resultStatus === "S"){
        gfn_comAlert("Q0000",data.resultMessage);
        await fn_saveS2();
        // await fn_search();
    }
}
const fn_saveS2 = async function(){
    let yyyy = SBUxMethod.get("reg-dtp-yyyy");
    let numseq = gfnma_nvl(rptStdGrid.getRows());
    var paramObj = {
        V_P_DEBUG_MODE_YN        : ""
        ,V_P_LANG_ID              : ""
        ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
        ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
        ,VL_P_YYYY                : ""
        ,V_P_SEQ                  : ""
        ,V_P_TAX_SITE_CODE        : ""
        ,V_P_CONFIRM_YN           : ""
        ,V_P_YYYY_D               : ""
        ,V_P_SEQ_D                : ""
        ,V_P_TAX_SITE_CODE_D      : ""
        ,V_P_VAT_REPORT_CODE_D    : ""
        ,V_P_REPORTING_DATE_D     : ""
        ,V_P_USE_YN_D             : ""
        ,V_P_FORM_ID              : p_formId
        ,V_P_MENU_ID              : p_formId
        ,V_P_PROC_ID              : ""
        ,V_P_USERID               : p_formId
        ,V_P_PC                   : ""
    };
    let postFlag = gfnma_getTableElement("middleTable","reg-",paramObj,"V_P_",["memo","seq"]);
    if(!postFlag){
        return;
    }
    let seq = gfnma_nvl(rptStdGrid.getRows());
    paramObj.V_P_SEQ = seq;
 
    let taxSiteCode = jsonRptSiteGrid[0].taxSiteCode;
    let useYn = jsonRptSiteGrid[0].chkYn;
 
    let reportingDate = SBUxMethod.get("reg-dtp-reportDate");
 
        jsonVatGrid.forEach(function(item){
            if(item.useYn === 'Y'){
                if(paramObj.V_P_YYYY_D === ''){
                    paramObj.V_P_YYYY_D += yyyy;
                    paramObj.V_P_SEQ_D += numseq;
                    paramObj.V_P_TAX_SITE_CODE_D += taxSiteCode;
                    paramObj.V_P_VAT_REPORT_CODE_D += item.vatReportCode;
                    paramObj.V_P_REPORTING_DATE_D += reportingDate;
                    paramObj.V_P_USE_YN_D += item.useYn;
                }else{
                    paramObj.V_P_YYYY_D += '|' + yyyy;
                    paramObj.V_P_SEQ_D += '|' + numseq;
                    paramObj.V_P_TAX_SITE_CODE_D += '|' + taxSiteCode;
                    paramObj.V_P_VAT_REPORT_CODE_D += '|' + item.vatReportCode;
                    paramObj.V_P_REPORTING_DATE_D += '|' + reportingDate;
                    paramObj.V_P_USE_YN_D += '|' + item.useYn;
                }
            }
        });
        paramObj.V_P_TAX_SITE_CODE = taxSiteCode;
        paramObj.V_P_CONFIRM_YN = useYn;
 
    const postJsonPromise = gfn_postJSON("/fi/tax/insertFit1400S2.do", {
        getType				: 'json',
        workType			: 'N',
        cv_count			: '0',
        params				: gfnma_objectToString(paramObj)
    });
    const data = await postJsonPromise;
    if(data.resultStatus === 'S'){
        gfn_comAlert("Q0000",data.resultMessage);
        await fn_search();
    }
}
const fn_create = async function(){
    /** 신고 기준정보 초기화 **/
    let table = document.getElementById("middleTable");
    let regs = table.querySelectorAll(`[id^="reg-"]`);
    for (const item of regs) {
        await SBUxMethod.set(item.id,'');
    }
    /** grid focus remove **/
    rptStdGrid.clearSelection();
 
    SBUxMethod.attr('reg-dtp-yyyy', 'readonly', 'false');
    SBUxMethod.attr('reg-slt-taxTerm', 'readonly', 'false');
    let ymd = SBUxMethod.get('srch-dtp-yyyy');
    SBUxMethod.set('reg-dtp-yyyy',ymd);
 
    let V_P_YYYY = gfnma_nvl(SBUxMethod.get("srch-dtp-yyyy"));
    let V_P_SEQ = gfnma_multiSelectGet("#src-btn-currencyCode");
 
    var paramObj = {
        V_P_DEBUG_MODE_YN        : ""
        ,V_P_LANG_ID              : ""
        ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
        ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
        ,V_P_YYYY                 : V_P_YYYY
        ,V_P_SEQ                  : V_P_SEQ
        ,V_P_TAX_SITE_CODE        : ""
        ,V_P_FORM_ID              : p_formId
        ,V_P_MENU_ID              : p_formId
        ,V_P_PROC_ID              : ""
        ,V_P_USERID               : p_formId
        ,V_P_PC                   : ""
    };
 
    const postJsonPromise = gfn_postJSON("/fi/tax/selectFit1400Q.do", {
        getType				: 'json',
        workType			: 'NEW',
        cv_count			: '5',
        params				: gfnma_objectToString(paramObj)
    });
    const data = await postJsonPromise;
}
const fn_delete = async function() {
    if(!gfn_comConfirm("Q0001","삭제")){
        return;
    }
 
    let status = "D";
    let rowIdx = rptStdGrid.getRow();
    var paramObj = {
        V_P_DEBUG_MODE_YN: ''
        , V_P_LANG_ID: ''
        , V_P_COMP_CODE: gv_ma_selectedCorpCd
        , V_P_CLIENT_CODE: gv_ma_selectedClntCd
        , VL_P_YYYY: ''
        , V_P_SEQ: ''
        , V_P_TAX_TERM: ''
        , V_P_VAT_REP_DETAIL_TYPE: ''
        , V_P_REFUND_YN: ''
        , V_P_VAT_TYPE_NAME: ''
        , V_P_STANDARD_MONTH_FR: ''
        , V_P_STANDARD_MONTH_TO: ''
        , V_P_REPORT_DATE: ''
        , V_P_PAY_ORGSITE_NO: ''
        , V_P_MEMO: ''
        , V_P_REFUND_TYPE: ''
        , V_P_REFUND_CANCEL_YN: ''
        , V_P_FORM_ID: p_formId
        , V_P_MENU_ID: p_menuId
        , V_P_PROC_ID: ''
        , V_P_USERID: ''
        , V_P_PC: ''
    }
    /** 공통으로 get 불가능한 요소 **/
    let seq = gfnma_nvl(rptStdGrid.getRowData(rowIdx).seq);
    paramObj.V_P_SEQ = seq;
    let postFlag = gfnma_getTableElement("middleTable","reg-",paramObj,"V_P_");
 
    if(!postFlag){
        return;
    }
    const postJsonPromise = gfn_postJSON("/fi/tax/insertFit1400S.do", {
        getType				: 'json',
        cv_count			: '0',
        workType            : status,
        params				: gfnma_objectToString(paramObj)
    });
    const data = await postJsonPromise;
 
    if(data.resultStatus === "S"){
        gfn_comAlert("Q0000",data.resultMessage);
        await fn_search();
    }
}
const fn_search = async function(){
    let rst = await Promise.all([
        fn_searchStdRep(),
        fn_searchRepSite(),
        fn_searchVatDom()
    ]);
}
const fn_fit1400S = async function(){
 
}
const fn_fit1400S2 = async function(){
 
}
 
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
