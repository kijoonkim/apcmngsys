<%
    /**
     * @Class Name 		: fit1400.jsp
     * @Description 	: 부가세기준정보
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
                                             date-format="yyyy" class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                                             onchange="fn_setMultSelect(srch-dtp-yyyy)">
                            </sbux-datepicker>
                        </td>
                        <td></td>
                        <th scope="row" >신고구분명</th>
                        <td colspan="3" class="td_input" style="border-right: hidden;">
                            <div class="dropdown">
                                <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="SRCH_SEQ" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu " aria-labelledby="SRCH_SEQ" style="width:750px;height:250px;padding-top:0px;overflow:auto">
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
                                    <sbux-datepicker id="reg-dtp-YR" name="reg-dtp-YR" uitype="popup" datepicker-mode="year" date-format="yyyy"
                                                     class="table-datepicker-ma inpt_data_reqed" onchange="fn_setVatNm()" group-id="panAppoint" required>
                                    </sbux-datepicker>
                                    <sbux-input id="reg-inp-seq" name="reg-inp-seq" uitype="text" style="display: none" value="0">

                                    </sbux-input>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">부가세기간구분</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-select id="reg-slt-TX_PRD" name="reg-slt-TX_PRD" uitype="single" jsondata-ref="jsonCbotaxTerm" unselected-text="선택" class="form-control input-sm inpt_data_reqed" group-id="panAppoint" required onchange="fn_setVatNm()"></sbux-select>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">신고구분</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-select id="reg-slt-VAT_RPT_DTL_TYPE" name="reg-slt-VAT_RPT_DTL_TYPE" uitype="single" jsondata-ref="jsonCbotaxRepDtlType" unselected-text="선택" class="form-control input-sm inpt_data_reqed" group-id="panAppoint" required onchange="fn_setVatNm()"></sbux-select>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">부가세 서식명</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-input id="reg-inp-VAT_TMPLT_NM" name="reg-inp-VAT_TMPLT_NM" uitype="text" class="inpt_data_reqed" group-id="panAppoint" required></sbux-input>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">신고기준월</th>
                                <td class="td_input" style="border-right: hidden" colspan="2">
                                    <div style="display: flex; gap: 10px">
                                        <sbux-datepicker id="reg-dtp-DCLR_BGNG_MM"
                                                         name="reg-dtp-DCLR_BGNG_MM"
                                                         uitype="popup" datepicker-mode="month"
                                                         date-format="yyyy-mm"
                                                         class="table-datepicker-ma inpt_data_reqed"
                                                         group-id="panAppoint" required>
                                        </sbux-datepicker>
                                        <sbux-datepicker id="reg-dtp-DCLR_END_MM"
                                                         name="reg-dtp-DCLR_END_MM"
                                                         uitype="popup" datepicker-mode="month"
                                                         date-format="yyyy-mm"
                                                         class="table-datepicker-ma inpt_data_reqed"
                                                         group-id="panAppoint" required>
                                        </sbux-datepicker>
                                    </div>
                                </td>

                                <th scope="row" class="th_bg">신고일</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-datepicker
                                            id="reg-dtp-RPT_YMD"
                                            name="reg-dtp-RPT_YMD"
                                            uitype="popup"
                                            class="table-datepicker-ma inpt_data_reqed" date-format="yyyy-mm-dd"
                                            group-id="panAppoint" required>
                                    </sbux-datepicker>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">조기환급 신고여부</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-checkbox id="reg-chk-ERLS_RFND_YN" name="reg-chk-ERLS_RFND_YN" uitype="normal" text="조기환급신고" false-value="N" true-value="Y">
                                    </sbux-checkbox>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">환급구분</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-select id="reg-slt-RFND_TYPE" name="reg-slt-RFND_TYPE" uitype="single" jsondata-ref="jsonCboRfType" unselected-text="선택" class="form-control input-sm"></sbux-select>
                                </td>
                                <td></td>
                                <th scope="row" class="th_bg">조기환급취소여부</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-checkbox id="reg-chk-ERLS_RFND_CNCL_YN" name="reg-chk-ERLS_RFND_CNCL_YN" uitype="normal" text="조기환급취소여부" true-value="Y" false-value="N" >
                                    </sbux-checkbox>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">총괄(단위과세)번호</th>
                                <td class="td_input" style="border-right: hidden">
                                    <sbux-input id="reg-inp-OVS_PAY_NO" name="reg-inp-OVS_PAY_NO" uitype="text"></sbux-input>
                                </td>
                                <td colspan="7"></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg">비고</th>
                                <td class="td_input" colspan="8">
                                    <sbux-textarea id="reg-txa-MEMO" name="reg-txa-MEMO"  uitype="normal" rows="2" wrap-style="width:100%">
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
        jsonCorpNm = await gfnma_getComSelectList('L_ORG000','',gv_ma_selectedCorpCd,gv_ma_selectedClntCd,'CO_CD',"CORP_NM");
        SBUxMethod.refresh('srch-slt-corpNm');
        SBUxMethod.setValue('srch-slt-corpNm',gv_ma_selectedCorpCd);

        /** 기준연도 **/
        let yyyy = gfn_dateToYear(new Date());
        SBUxMethod.set('srch-dtp-yyyy',yyyy);

        /** 신고구분명 select **/
        await fn_setMultSelect(yyyy);

        /** 등록조건_부가세기준정보 select **/
        jsonCbotaxTerm = await gfnma_getComSelectList('L_FIT002','',gv_ma_selectedCorpCd,gv_ma_selectedClntCd,'SBSD_CD',"CD_NM");
        SBUxMethod.refresh("reg-slt-TX_PRD");

        /** 등록조건_신고구분 select **/
        jsonCbotaxRepDtlType = await gfnma_getComSelectList('L_FIT035','',gv_ma_selectedCorpCd,gv_ma_selectedClntCd,'SBSD_CD',"CD_NM");
        SBUxMethod.refresh("reg-slt-VAT_RPT_DTL_TYPE");

        /** 등록조건_환급구분 select **/
        jsonCboRfType = await gfnma_getComSelectList('L_FIT023','',gv_ma_selectedCorpCd,gv_ma_selectedClntCd,'SBSD_CD',"CD_NM");
        SBUxMethod.refresh("reg-slt-RFND_TYPE");

        await fn_search();
    }





    async function fn_setMultSelect(yyyy){
        /** 신고구분명 select **/
        gfnma_multiSelectInit({
            target			: ['#SRCH_SEQ']
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
        let tr = $('#SRCH_SEQ').siblings().find('tr.clickable-row.active');
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
        SBGridProperties.explorerbar = 'sort';
        SBGridProperties.useinitsorting	= true;
        SBGridProperties.columns = [
            {caption: ['기준연도'], 			        ref: 'YR', 		width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['부가세기간구분'], 			    ref: 'TX_PRD', 		width: '7%',	type: 'combo',	style:'text-align: center', typeinfo : {ref:'jsonCbotaxTerm', label:'label', value:'value'}},
            {caption: ['신고구분'],				    ref: 'VAT_RPT_DTL_TYPE', 		width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['부가세 서식명'],				ref: 'VAT_TMPLT_NM', 		width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고기준시작월'], 				ref: 'DCLR_BGNG_MM', 	width: '7%',	type: 'output',	style:'text-align: center',format : {type:'date', rule:'yyyy-mm', origin : 'yyyymm'}},
            {caption: ['신고기준종료월'], 				ref: 'DCLR_END_MM', 	width: '7%',	type: 'output',	style:'text-align: center',format : {type:'date', rule:'yyyy-mm', origin : 'yyyymm'}},
            {caption: ['신고사업장수'], 				ref: 'SITE_CNT', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고일'], 				    ref: 'RPT_YMD', 	width: '7%',	type: 'output',	style:'text-align: center',format : {type:'date', rule:'yyyy-mm-dd', origin : 'yyyymmdd'}},
            {caption: ['비고'], 				        ref: 'MEMO', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['총괄납부(단위과세)관리번호'], 	ref: 'OVS_PAY_NO', 	width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['조기환급신고여부'], 			ref: 'ERLS_RFND_YN', 	width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['환급구분'], 				    ref: 'RFND_TYPE', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['환급취소여부'], 				ref: 'ERLS_RFND_CNCL_YN', 	width: '7%',	type: 'output',	style:'text-align: center'},
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
        SBGridProperties.explorerbar = 'sort';
        SBGridProperties.useinitsorting	= true;
        SBGridProperties.columns = [
            {caption: ['신고사업장명'], 			ref: 'TX_SITE_NM', 	width: '50%',	type: 'output',	style:'text-align: center'},
            {caption: ['사업자번호'], 			ref: 'BRNO', 		width: '30%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고여부'],				ref: 'CHK_YN', 		width: '20%',   style:'text-align: center', type : 'checkbox', typeinfo : {checkedvalue : 'Y', uncheckedvalue : 'N'}},
            {caption: ['신고사업장코드'],			ref: 'TX_SITE_CD', 	width: '1%',    type: 'output', hidden: true},
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
        SBGridProperties.explorerbar = 'sort';
        SBGridProperties.useinitsorting	= true;
        SBGridProperties.columns =[
            {caption: ['순번'], 			ref: 'REPORT_SEQ', 		width: '20%',	type: 'output',	style:'text-align: center'},
            {caption: ['서식명'], 			ref: 'VAT_RPT_TMPLT_NM', 		width: '50%',	type: 'output',	style:'text-align: center'},
            {caption: ['작성대상'],				ref: 'USE_YN', 		width: '30%',	style:'text-align: center', type : 'checkbox', typeinfo : {checkedvalue : 'Y', uncheckedvalue : 'N'}},
        ]
        vatGrid = _SBGrid.create(SBGridProperties);
    }


    /** grid click event mdTable 셋팅 **/
    const fn_setMdGrid = async function(){
        let idx = rptStdGrid.getRow();
        let data = rptStdGrid.getRowData(idx);

        console.log('row data', data);
        let cnt = rptStdGrid.getRows();
        let table = document.getElementById("middleTable");
        let regs = table.querySelectorAll(`[id^="reg-"]`);
        for (const item of regs) {
        	let wordIdx = item.id.lastIndexOf('-') + 1;
        	let key = item.id.substring(wordIdx);
        	await SBUxMethod.set(item.id, data[key]);
        }

        /** middle seq는 선택된 로우의 seq가 아니라 전체 행의 갯수 **/
        SBUxMethod.set("reg-inp-seq", data.SEQ);
        /** 연도 readOnly **/
        SBUxMethod.attr('reg-dtp-YR', 'readonly', 'true');
        SBUxMethod.attr('reg-slt-taxTerm', 'readonly', 'true');

        await fn_searchRepSite("Q1"); //신고사업장 정보 리스트 그리드

    }





/**
** 신고 기준정보 리스트 조회 **
* @returns {Promise<void>}
 * */
    const fn_searchStdRep = async function(){
        /** 조회 결과 초기화 **/
        jsonRptStdGrid.length = 0;
        rptStdGrid.rebuild();
        let V_P_YYYY = gfnma_nvl(SBUxMethod.get("srch-dtp-yyyy"));
        let V_P_SEQ = gfnma_multiSelectGet("#SRCH_SEQ");

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
                    jsonRptStdGrid = data.cv_1;
                    rptStdGrid.rebuild();
                    if(jsonRptStdGrid.length > 0){
                        rptStdGrid.clickRow(1);
                    }
                }else{
                	//데이터 없는 경우 초기화
                	if(jsonRptStdGrid.length == 0){
                        let table = document.getElementById("middleTable");
                        let regs = table.querySelectorAll(`[id^="reg-"]`);
                        for (const item of regs) {
                            await SBUxMethod.set(item.id,'');
                        }
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
    const fn_searchRepSite = async function(work_type){

        jsonRptSiteGrid.length = 0;
        rptSiteGrid.rebuild();

        const V_P_YYYY = gfnma_nvl2(SBUxMethod.get("srch-dtp-yyyy"));
        const V_P_SEQ = gfnma_nvl2(SBUxMethod.get("reg-inp-seq"));

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
            workType			: work_type,
            cv_count			: '5',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try{
            if (_.isEqual("S", data.resultStatus)) {
                if(work_type === "Q1"){
                    if(!gfn_isEmpty(data.cv_2)){


                        jsonRptSiteGrid = data.cv_2;
                        rptSiteGrid.rebuild();


                        const seq = gfnma_nvl2(SBUxMethod.get("reg-inp-seq"));
                        if(gfnma_nvl2(seq) == 0){
                            await fn_searchVatDom("NEW_Q2")
                        }else{
                            await fn_searchVatDom("Q2")
                        }
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





    /** 부가세 부속서류 리스트 조회 **/
    const fn_searchVatDom = async function(work_type){

        /** 조회 결과 초기화 **/
        jsonVatGrid.length = 0;
        vatGrid.rebuild();

        /** 조회 결과 초기화 **/
console.log("jsonRptSiteGrid -->", jsonRptSiteGrid);
        let V_P_TAX_SITE_CODE = '';
        if(work_type === "Q2"){
            V_P_TAX_SITE_CODE = gfnma_nvl2(jsonRptSiteGrid[0].TX_SITE_CD);
        }
        const V_P_YYYY = gfnma_nvl2(SBUxMethod.get("srch-dtp-yyyy"));
        const V_P_SEQ = gfnma_nvl2(SBUxMethod.get("reg-inp-seq"));

        var paramObj = {
            V_P_DEBUG_MODE_YN        : ""
            ,V_P_LANG_ID              : ""
            ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
            ,V_P_YYYY                 : V_P_YYYY
            ,V_P_SEQ                  : V_P_SEQ
            ,V_P_TAX_SITE_CODE        : V_P_TAX_SITE_CODE
            ,V_P_FORM_ID              : p_formId
            ,V_P_MENU_ID              : p_formId
            ,V_P_PROC_ID              : ""
            ,V_P_USERID               : p_formId
            ,V_P_PC                   : ""
        };

        const postJsonPromise = gfn_postJSON("/fi/tax/selectFit1400Q.do", {
            getType				: 'json',
            workType			: work_type,
            cv_count			: '5',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;

        try{
            if (_.isEqual("S", data.resultStatus)) {
                if(work_type === "NEW_Q2" && !gfn_isEmpty(data.cv_5)){
                    jsonVatGrid = data.cv_5;
                }else if(work_type === "Q2" && !gfn_isEmpty(data.cv_3)){
                    jsonVatGrid = data.cv_3;
                }
                vatGrid.rebuild();
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }




    async function cfn_save() {
        if(!gfn_comConfirm("Q0001","저장")){
            return;
        }
        if (!SBUxMethod.validateRequired({group_id:'panAppoint'}) || !validateRequired("panAppoint")) {
            return false;
        }
        if( await fn_save() ){
            if( await fn_saveS2() ){
                gfn_comAlert("I0001");
                await fn_search();
            }
        }
    }





    function cfn_add() {
        fn_create();

    }




     async function cfn_del() {
        await fn_delete();
     }




     async function cfn_search() {
        await fn_search();
     }




     function cfn_init(){
        fn_reset();
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

        let status = "";
        let seq = "";

        let nRow = rptStdGrid.getRow();
        let rowData = rptStdGrid.getRowData(nRow);
        if($("#reg-dtp-YR").prop('readonly')){
            status = "U";
            seq = gfnma_multiSelectGet("#SRCH_SEQ") == "" ? rowData.SEQ : gfnma_multiSelectGet("#SRCH_SEQ");
        }else{
            status = "N";
            seq = gfnma_nvl2(0);
        }


        const VL_P_YR = gfnma_nvl2(SBUxMethod.get("reg-dtp-YR"));
        const V_P_SEQ = seq;
        const V_P_TX_PRD = gfnma_nvl2(SBUxMethod.get("reg-slt-TX_PRD"));
        const V_P_VAT_RPT_DTL_TYPE = gfnma_nvl2(SBUxMethod.get("reg-slt-VAT_RPT_DTL_TYPE"));
        const V_P_ERLS_RFND_YN = gfnma_nvl2(SBUxMethod.getCheckbox("reg-chk-ERLS_RFND_YN")["reg-chk-ERLS_RFND_YN"]);
        const V_P_VAT_TMPLT_NM = gfnma_nvl2(SBUxMethod.get("reg-inp-VAT_TMPLT_NM"));
        const V_P_DCLR_BGNG_MM = gfnma_nvl2(SBUxMethod.get("reg-dtp-DCLR_BGNG_MM"));
        const V_P_DCLR_END_MM = gfnma_nvl2(SBUxMethod.get("reg-dtp-DCLR_END_MM"));
        const V_P_RPT_YMD = gfnma_nvl2(SBUxMethod.get("reg-dtp-RPT_YMD"));
        const V_P_OVS_PAY_NO = gfnma_nvl2(SBUxMethod.get("reg-inp-OVS_PAY_NO"));
        const V_P_MEMO = gfnma_nvl2(SBUxMethod.get("reg-txa-MEMO"));
        const V_P_RFND_TYPE = gfnma_nvl2(SBUxMethod.get("reg-slt-RFND_TYPE"));
        const V_P_ERLS_RFND_CNCL_YN = gfnma_nvl2(SBUxMethod.getCheckbox("reg-chk-ERLS_RFND_CNCL_YN")["reg-chk-ERLS_RFND_CNCL_YN"]);

        var paramObj = {
             V_P_DEBUG_MODE_YN              : ''
            ,V_P_LANG_ID                    : ''
            ,V_P_COMP_CODE                  : gv_ma_selectedCorpCd
            ,V_P_CLIENT_CODE                : gv_ma_selectedClntCd
            ,VL_P_YR                        : VL_P_YR
            ,V_P_SEQ                        : V_P_SEQ
            ,V_P_TX_PRD                     : V_P_TX_PRD
            ,V_P_VAT_RPT_DTL_TYPE           : V_P_VAT_RPT_DTL_TYPE
            ,V_P_ERLS_RFND_YN               : V_P_ERLS_RFND_YN
            ,V_P_VAT_TMPLT_NM               : V_P_VAT_TMPLT_NM
            ,V_P_DCLR_BGNG_MM               : V_P_DCLR_BGNG_MM
            ,V_P_DCLR_END_MM                : V_P_DCLR_END_MM
            ,V_P_RPT_YMD                    : V_P_RPT_YMD
            ,V_P_OVS_PAY_NO                 : V_P_OVS_PAY_NO
            ,V_P_MEMO                       : V_P_MEMO
            ,V_P_RFND_TYPE                  : V_P_RFND_TYPE
            ,V_P_ERLS_RFND_CNCL_YN          : V_P_ERLS_RFND_CNCL_YN
            ,V_P_FORM_ID                    : p_formId
            ,V_P_MENU_ID                    : p_menuId
            ,V_P_PROC_ID                    : ''
            ,V_P_USERID			            : ''
            ,V_P_PC				            : ''
        }


        const postJsonPromise = gfn_postJSON("/fi/tax/insertFit1400S.do", {
            getType				: 'json',
            cv_count			: '0',
            workType            : status,
            params				: gfnma_objectToString(paramObj, true)
        });
        const data = await postJsonPromise;

        if(data.resultStatus === "S"){
            if(status === 'N'){
                await SBUxMethod.set("reg-inp-seq", gfnma_nvl2(data.v_returnStr) );
            }
            return true;
        }else{
            return false;
        }
    }


const fn_saveS2 = async function(){

    let siteGridUpdateData = rptSiteGrid.getUpdateData(true, 'u');
    let vatGridUpdateData = vatGrid.getUpdateData(true, 'u');

    if(siteGridUpdateData.length === 0 && vatGridUpdateData.length === 0){
        return true;
    }

    let siteGridData = rptSiteGrid.getGridDataAll();
    let vatGridData = vatGrid.getGridDataAll();
    let yyyy = gfnma_nvl2( SBUxMethod.get("reg-dtp-YR") );
    let seq = gfnma_nvl2( await SBUxMethod.get("reg-inp-seq") );

    let str_V_P_YYYY_D = '';
    let str_V_P_SEQ_D = '';
    let str_V_P_TAX_SITE_CODE_D = '';
    let str_V_P_VAT_REPORT_CODE_D = '';
    let str_V_P_REPORTING_DATE_D = '';
    let str_V_P_USE_YN_D = '';

    vatGridData.forEach(function(item){
        if(item.USE_YN === 'Y'){
            if(str_V_P_YYYY_D != ''){
                str_V_P_YYYY_D 			    += "|";
                str_V_P_SEQ_D 				+= "|";
                str_V_P_TAX_SITE_CODE_D 	+= "|";
                str_V_P_VAT_REPORT_CODE_D	+= "|";
                str_V_P_REPORTING_DATE_D	+= "|";
                str_V_P_USE_YN_D			+= "|";
            }
            str_V_P_YYYY_D 			    += yyyy;
            str_V_P_SEQ_D				+= seq;
            str_V_P_TAX_SITE_CODE_D 	+= siteGridData[0].TX_SITE_CD;
            str_V_P_VAT_REPORT_CODE_D 	+= item.VAT_RPT_CD;
            str_V_P_REPORTING_DATE_D 	+= gfnma_nvl2(SBUxMethod.get("reg-dtp-RPT_YMD"))
            str_V_P_USE_YN_D 			+= item.USE_YN;
        }
    });


    var paramObj = {
        V_P_DEBUG_MODE_YN        : ""
        ,V_P_LANG_ID              : ""
        ,V_P_COMP_CODE            : gv_ma_selectedCorpCd
        ,V_P_CLIENT_CODE          : gv_ma_selectedClntCd
        ,VL_P_YYYY                : yyyy
        ,V_P_SEQ                  : seq
        ,V_P_TAX_SITE_CODE        : siteGridData[0].TX_SITE_CD
        ,V_P_CONFIRM_YN           : siteGridData[0].CHK_YN
        ,V_P_YYYY_D               : str_V_P_YYYY_D
        ,V_P_SEQ_D                : str_V_P_SEQ_D
        ,V_P_TAX_SITE_CODE_D      : str_V_P_TAX_SITE_CODE_D
        ,V_P_VAT_REPORT_CODE_D    : str_V_P_VAT_REPORT_CODE_D
        ,V_P_REPORTING_DATE_D     : str_V_P_REPORTING_DATE_D
        ,V_P_USE_YN_D             : str_V_P_USE_YN_D
        ,V_P_FORM_ID              : p_formId
        ,V_P_MENU_ID              : p_formId
        ,V_P_PROC_ID              : ""
        ,V_P_USERID               : p_formId
        ,V_P_PC                   : ""
    };

    const postJsonPromise = gfn_postJSON("/fi/tax/insertFit1400S2.do", {
        getType				: 'json',
        workType			: 'N',
        cv_count			: '0',
        params				: gfnma_objectToString(paramObj, true)
    });

    const data = await postJsonPromise;

    if(data.resultStatus === 'S'){
    	return true;
    }else{
    	alert(data.resultMessage);
    	return false;
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

    SBUxMethod.attr('reg-dtp-YR', 'readonly', 'false');
    SBUxMethod.attr('reg-slt-taxTerm', 'readonly', 'false');
    let ymd = SBUxMethod.get('srch-dtp-yyyy');
    SBUxMethod.set('reg-dtp-YR',ymd);

    let V_P_YYYY = gfnma_nvl(SBUxMethod.get("srch-dtp-yyyy"));
    let V_P_SEQ = gfnma_multiSelectGet("#SRCH_SEQ");

    //신고사업장 정보 리스트 초기화
    jsonRptSiteGrid.length = 0;
    rptSiteGrid.rebuild();

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
    try{
    	if (_.isEqual("S", data.resultStatus)) {
	        if(!gfn_isEmpty(data.cv_4)){
	            jsonRptSiteGrid = data.cv_4;
	            rptSiteGrid.rebuild();
	        }
    	}
    }catch (e) {
        if (!(e instanceof Error)) {
            e = new Error(e);
        }
        console.error("failed", e.message);
        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }
}




const fn_delete = async function() {
    if(!gfn_comConfirm("Q0001","삭제")){
        return;
    }

    let nRow = rptStdGrid.getRow();
    let rowData = rptStdGrid.getRowData(nRow);

    const VL_P_YR = gfnma_nvl2(SBUxMethod.get("reg-dtp-YR"));
    const V_P_SEQ = gfnma_multiSelectGet("#SRCH_SEQ") == "" ? rowData.SEQ : gfnma_multiSelectGet("#SRCH_SEQ");
    const V_P_TX_PRD = gfnma_nvl2(SBUxMethod.get("reg-slt-TX_PRD"));
    const V_P_VAT_RPT_DTL_TYPE = gfnma_nvl2(SBUxMethod.get("reg-slt-VAT_RPT_DTL_TYPE"));
    const V_P_ERLS_RFND_YN = gfnma_nvl2(SBUxMethod.getCheckbox("reg-chk-ERLS_RFND_CNCL_YN")["reg-chk-ERLS_RFND_CNCL_YN"]);
    const V_P_VAT_TMPLT_NM = gfnma_nvl2(SBUxMethod.get("reg-inp-VAT_TMPLT_NM"));
    const V_P_DCLR_BGNG_MM = gfnma_nvl2(SBUxMethod.get("reg-dtp-DCLR_BGNG_MM"));
    const V_P_DCLR_END_MM = gfnma_nvl2(SBUxMethod.get("reg-dtp-DCLR_END_MM"));
    const V_P_RPT_YMD = gfnma_nvl2(SBUxMethod.get("reg-dtp-RPT_YMD"));
    const V_P_OVS_PAY_NO = gfnma_nvl2(SBUxMethod.get("reg-inp-OVS_PAY_NO"));
    const V_P_MEMO = gfnma_nvl2(SBUxMethod.get("reg-txa-MEMO"));
    const V_P_RFND_TYPE = gfnma_nvl2(SBUxMethod.get("reg-slt-RFND_TYPE"));
    const V_P_ERLS_RFND_CNCL_YN = gfnma_nvl2(SBUxMethod.getCheckbox("reg-chk-ERLS_RFND_CNCL_YN")["reg-chk-ERLS_RFND_CNCL_YN)"]);

    var paramObj = {
        V_P_DEBUG_MODE_YN              : ''
        ,V_P_LANG_ID                    : ''
        ,V_P_COMP_CODE                  : gv_ma_selectedCorpCd
        ,V_P_CLIENT_CODE                : gv_ma_selectedClntCd
        ,VL_P_YR                        : VL_P_YR
        ,V_P_SEQ                        : V_P_SEQ
        ,V_P_TX_PRD                     : V_P_TX_PRD
        ,V_P_VAT_RPT_DTL_TYPE           : V_P_VAT_RPT_DTL_TYPE
        ,V_P_ERLS_RFND_YN               : V_P_ERLS_RFND_YN
        ,V_P_VAT_TMPLT_NM               : V_P_VAT_TMPLT_NM
        ,V_P_DCLR_BGNG_MM               : V_P_DCLR_BGNG_MM
        ,V_P_DCLR_END_MM                : V_P_DCLR_END_MM
        ,V_P_RPT_YMD                    : V_P_RPT_YMD
        ,V_P_OVS_PAY_NO                 : V_P_OVS_PAY_NO
        ,V_P_MEMO                       : V_P_MEMO
        ,V_P_RFND_TYPE                  : V_P_RFND_TYPE
        ,V_P_ERLS_RFND_CNCL_YN          : V_P_ERLS_RFND_CNCL_YN
        ,V_P_FORM_ID                    : p_formId
        ,V_P_MENU_ID                    : p_menuId
        ,V_P_PROC_ID                    : ''
        ,V_P_USERID			            : ''
        ,V_P_PC				            : ''
    }
    const postJsonPromise = gfn_postJSON("/fi/tax/insertFit1400S.do", {
        getType				: 'json',
        cv_count			: '0',
        workType            : "D",
        params				: gfnma_objectToString(paramObj, true)
    });
    const data = await postJsonPromise;
    try {
        if (_.isEqual("S", data.resultStatus)) {
            if(data.resultMessage){
                gfn_comAlert("Q0000",data.resultMessage);
            }else{
                gfn_comAlert("I0001");
            }
            await fn_search();
        }else{
            gfn_comAlert("Q0000",data.resultMessage);
        }
    }catch (e) {
        if (!(e instanceof Error)) {
            e = new Error(e);
        }
        console.error("failed", e.message);
        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }

}




    const fn_search = async function(){
        await fn_searchStdRep();
    }


    const fn_setVatNm = function(){

        const YR = gfnma_nvl2(SBUxMethod.get("reg-dtp-YR"));
        const TX_PRD_TXT = gfnma_nvl2(SBUxMethod.getText("reg-slt-TX_PRD"));
        const TX_PRD = gfnma_nvl2(SBUxMethod.get("reg-slt-TX_PRD"));
        const VAT_RPT_DTL_TYPE = gfnma_nvl2(SBUxMethod.getText("reg-slt-VAT_RPT_DTL_TYPE"));

        const str = YR + "년 " + TX_PRD_TXT + " " + VAT_RPT_DTL_TYPE;
        SBUxMethod.set("reg-inp-VAT_TMPLT_NM", str);

        if(TX_PRD){
            switch (TX_PRD)
            {
                case "11":
                    SBUxMethod.set("reg-dtp-DCLR_BGNG_MM", YR + "01");
                    SBUxMethod.set("reg-dtp-DCLR_END_MM", YR + "03");
                    break;
                case "12":
                    SBUxMethod.set("reg-dtp-DCLR_BGNG_MM", YR + "04");
                    SBUxMethod.set("reg-dtp-DCLR_END_MM", YR + "06");
                    break;
                case "21":
                    SBUxMethod.set("reg-dtp-DCLR_BGNG_MM", YR + "07");
                    SBUxMethod.set("reg-dtp-DCLR_END_MM", YR + "09");
                    break;
                case "22":
                    SBUxMethod.set("reg-dtp-DCLR_BGNG_MM", YR + "10");
                    SBUxMethod.set("reg-dtp-DCLR_END_MM", YR + "12");
                    break;
                default:
                    break;
            }
        }

    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
