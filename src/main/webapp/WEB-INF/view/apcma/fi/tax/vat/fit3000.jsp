<%
    /**
     * @Class Name 		: fit3000.jsp
     * @Description 	: 부가세전자신고파일생성 화면
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
    <title>title : 부가세전자신고파일생성</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
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
        .box.box-solid{
            border-radius: 0 !important;
        }
        input[type="number"] {
            border: hidden;
            box-sizing: border-box;
            text-align: right;
            width: 100%;
        }
        .th_cs{
            font-size: 10px;

        }
        #headerTable, #headerTable th, #headerTable td{
            border: 0!important;
        }
        #headerTable th{
            padding: 3px 0px !important;
        }
        #headerTable input{
            font-size: 10px;
            padding: 0px 5px !important;
            height: 20px!important;
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
                    <td colspan="7" class="td_input" style="border-top: hidden;">
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
                    <td colspan="7" class="td_input">
                        <sbux-input id="srch-inp-bizRegno" name="srch-inp-bizRegno" uitype="text" class="form-control input-sm" style="width: 35%"></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
            <div style=" height: 80vh; display: flex">
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎사업장 리스트</span></li>
                        </ul>
                    </div>
                    <div id="sb-area-grdListGrid" style="width: 100%"></div>
                </div>
                <div style="flex: 4;display: flex;flex-direction: column">
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>◎전자신고 생성정보</span></li>
                            </ul>
                        </div>
                        <div style="display: flex; gap: 10px">
                            <div style="flex-basis:65%">
                                <table id="headerTable" class="table table-bordered tbl_fixed">
                                    <colgroup>
                                        <col style="width: 10%">
                                        <col style="width: 60%">
                                        <col style="width: 10%">
                                        <col style="width: 20%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" class="th_cs">신고사업장명</th>
                                        <td class="td_input" style="border-right: hidden">
                                            <sbux-input id="TAX_SITE_NAME" name="TAX_SITE_NAME" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                        </td>
                                        <th scope="row" class="th_cs">사업자번호</th>
                                        <td class="td_input">
                                            <sbux-input id="BIZ_REGNO" name="BIZ_REGNO" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_cs">홈택스ID</th>
                                        <td class="td_input" style="border-right: hidden">
                                            <sbux-input id="HOME_TAX_ID" name="HOME_TAX_ID" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                        </td>
                                        <th scope="row" class="th_cs">제출일</th>
                                        <td class="td_input">
                                            <sbux-input id="DATA_HANDOUT_DATE" name="DATA_HANDOUT_DATE" uitype="text" class="form-control input-sm" readonly></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_cs">비고</th>
                                        <td colspan="3" class="td_input">
                                            <sbux-input id="MEMO" name="MEMO" uitype="text" class="form-control input-sm" ></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_cs">파일저장경로</th>
                                        <td colspan="3" class="td_input">
                                            <sbux-input id="FILE_STRECOURS" name="FILE_STRECOURS" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <sbux-button
                                        id="btnRese1t"
                                        name="btnRese1t"
                                        uitype="normal"
                                        style="width: 170px;margin-left: calc(100% - 173px);"
                                        class="btn btn-sm btn-outline-danger"
                                        text="전자신고 파일생성"
                                        onclick="fn_1"
                                ></sbux-button>
                            </div>
                            <div style="display: grid;grid-template-rows: repeat(4, 1fr); grid-template-columns: repeat(2,minmax(100px, 1fr)); grid-auto-flow: column; gap: 5px;">
                                <sbux-button
                                        id="btnReset"
                                        name="btnReset"
                                        uitype="normal"
                                        class="btn btn-sm btn-outline-danger"
                                        text="매출 세금계산서"
                                        onclick="fn_1"
                                ></sbux-button>
                                <sbux-button
                                        id="btnReset2"
                                        name="btnReset2"
                                        uitype="normal"
                                        class="btn btn-sm btn-outline-danger"
                                        text="매출/매입 계산서"
                                        onclick="fn_2"
                                ></sbux-button>
                                <sbux-button
                                        id="btnReset3"
                                        name="btnReset3"
                                        uitype="normal"
                                        class="btn btn-sm btn-outline-danger"
                                        text="신용카드매출전표등수령명세서"
                                        onclick="fn_3"
                                ></sbux-button>
                                <sbux-button
                                        id="btnReset4"
                                        name="btnReset4"
                                        uitype="normal"
                                        class="btn btn-sm btn-outline-danger"
                                        text="수출실적명세서"
                                        onclick="fn_4"
                                ></sbux-button>
                                <sbux-button
                                        id="btnReset5"
                                        name="btnReset5"
                                        uitype="normal"
                                        class="btn btn-sm btn-outline-danger"
                                        text="매입 세금계산서"
                                        onclick="fn_5"
                                ></sbux-button>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>◎첨부 신고서류 리스트</span></li>
                            </ul>
                        </div>
                        <div id="sb-area-grdMiddle" style="width: 50%"></div>
                    </div>
                    <div>
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>◎전자신고 파일생성 로그</span></li>
                            </ul>
                        </div>
                        <div id="sb-area-grdBottom" style="width: 100%"></div>
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
    /** 신고 구분명 **/
    var jsonCorpNm = [];

    /** 신고 사업장 그리드 **/
    var jsonGrdList = [];
    var grdListGrid;

    /** 첨부 신고서류 리스트 **/
    var jsonGrdMiddle = [];
    var grdMiddle;

    /** 전자신고 파일생성 로그 **/
    var jsonGrdBottom = [];
    var grdBottom;

    window.addEventListener("DOMContentLoaded",function(){
        fn_createGrid();
        fn_createGridMiddle();
        fn_createGridBottom();


        fn_init();

    });

    const fn_init = async function(){
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
    };
    async function fn_choice(_value){
        /** reset **/

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
            ,V_P_TAX_SITE_CODE      : ''
            ,V_P_DATA_HANDOUT_DATE  : ''
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

        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit3000.do", {
            getType				: 'json',
            cv_count			: '7',
            workType            : 'SITELIST',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        console.log(data);
        if(data.resultStatus === 'S') {
            jsonGrdList = data.cv_1;
            grdListGrid.rebuild();
            if(grdListGrid.getRows() === 2) {
                grdListGrid.setRow(1);
                paramObj.V_P_TAX_SITE_CODE = grdListGrid.getRowData(1).TAX_SITE_CODE;
                const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit3000.do", {
                    getType: 'json',
                    cv_count: '7',
                    workType: 'SITEINFO',
                    params: gfnma_objectToString(paramObj)
                });
                let data = await postJsonPromise;
                console.log(data,"두번쨰");
                if(data.resultStatus === 'S'){
                    let tableData = data.cv_2[0];
                    for(let key in tableData){
                        SBUxMethod.set(key,tableData[key]);
                    }
                    jsonGrdMiddle = data.cv_3;
                    grdMiddle.rebuild();
                }
            }
        }
    }
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
    /** 첨부 신고서류 리스트 **/
    const fn_createGridMiddle = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdMiddle';
        SBGridProperties.id = 'grdMiddle';
        SBGridProperties.jsonref = 'jsonGrdMiddle';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],               ref : 'REPORT_SEQ',        width : '10%',    style : 'text-align:center',    type : 'output'},
            {caption : ['부가세 서식명'],          ref : 'VAT_REPORT_NAME',      width : '90%',   style : 'text-align:center',    type : 'output'},
        ];
        grdMiddle = _SBGrid.create(SBGridProperties);
    }
    /** 전자신고 파일생성 로그 **/
    const fn_createGridBottom = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdBottom';
        SBGridProperties.id = 'grdBottom';
        SBGridProperties.jsonref = 'jsonGrdBottom';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['연번'],               ref : 'TAX_SITE_NAME',        width : '50%',    style : 'text-align:center',    type : 'output'},
            {caption : ['신고사업장명'],          ref : 'BIZ_REGNO',      width : '50%',   style : 'text-align:center',    type : 'output'},
            {caption : ['제출일자'],          ref : 'BIZ_REGNO',      width : '50%',   style : 'text-align:center',    type : 'output'},
            {caption : ['생성자ID'],          ref : 'BIZ_REGNO',      width : '50%',   style : 'text-align:center',    type : 'output'},
            {caption : ['생성일시'],          ref : 'BIZ_REGNO',      width : '50%',   style : 'text-align:center',    type : 'output'},
            {caption : ['생성자PC'],          ref : 'BIZ_REGNO',      width : '50%',   style : 'text-align:center',    type : 'output'},
            {caption : ['비고'],          ref : 'BIZ_REGNO',      width : '50%',   style : 'text-align:center',    type : 'output'},
        ];
        grdBottom = _SBGrid.create(SBGridProperties);
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
