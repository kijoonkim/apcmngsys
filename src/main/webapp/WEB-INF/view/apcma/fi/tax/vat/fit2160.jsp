<%
    /**
     * @Class Name 		: fit2140.jsp
     * @Description 	: 공제받지못할매입세액명세서 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.15
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
        #tab-wrap > table > tbody > tr > td,#Purchase > table > tbody > tr > td{
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
        .tpgTd{
            border: 0 !important;
            background-color : white !important;
            border-radius: 0 !important;
            padding: 0px 12px !important;
            height: auto;
        }
        .box.box-solid{
            border-radius: 0 !important;
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
            <div style=" height: 90vh; display: flex">
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>사업장 리스트</span></li>
                        </ul>
                    </div>
                    <div id="sb-area-grdListGrid" style="width: 100%"></div>
                </div>
                <div style="flex: 4;display: flex;flex-direction: column">
                    <div style="display: flex; flex-direction: column; flex: 1">
                        <div>
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>공제받지 못할 매입세액 명세</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="tab-content" style="height: auto;flex: 1">
                            <div id="tab-wrap" style="height: 100%; display: flex; flex-direction: column" >
                                <table id="panRightHeader" style="width: 100%; text-align:center">
                                    <colgroup>
                                        <col style="width: 60%">
                                        <col style="width: 10%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <td rowspan="2">매입세액불공제사유</td>
                                            <td colspan="3">세금계산서</td>
                                        </tr>
                                        <tr>
                                            <td>매수</td>
                                            <td>공급가액</td>
                                            <td>세액</td>
                                        </tr>
                                        <tr>
                                            <td>① 필요적 기재사항 누락 등</td>
                                            <td>
                                                <sbux-input id="omissionCnt" name="totalCustomerCnt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="omissionSupplyAmt" name="totalCustomerCnt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="omissionVatAmt" name="totalCustomerCnt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>② 사업과 직접 관련 없는 지출</td>
                                            <td>
                                                <sbux-input id="unrelatedCnt" name="unrelatedCnt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="unrelatedSupplyAmt" name="unrelatedSupplyAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="unrelatedVatAmt" name="unrelatedVatAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>③ 비영업용 소형승용자동차 구입 ㆍ유지 및 임차</td>
                                            <td>
                                                <sbux-input id="carCnt" name="carCnt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="carSupplyAmt" name="carSupplyAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="carVatAmt" name="carVatAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>④ 접대비 및 이와 유사한 비용 관련</td>
                                            <td>
                                                <sbux-input id="entertainCnt" name="entertainCnt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="entertainSupplyAmt" name="entertainSupplyAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="entertainVatAmt" name="entertainVatAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>⑤ 면세사업등 관련</td>
                                            <td>
                                                <sbux-input id="exemptionCnt" name="exemptionCnt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="exemptionSupplyAmt" name="exemptionSupplyAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="exemptionVatAmt" name="exemptionVatAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>⑥ 토지의 자본적 지출 관련</td>
                                            <td>
                                                <sbux-input id="landCnt" name="landCnt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="landSupplyAmt" name="landSupplyAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="landVatAmt" name="landVatAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>⑦ 사업자등록 전 매입세액</td>
                                            <td>
                                                <sbux-input id="registrationCnt" name="registrationCnt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="registrationSupplyAmt" name="registrationSupplyAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="registrationVatAmt" name="registrationVatAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>⑧ 금,구리 스크랩 거래계좌 미사용 관련 매입세액</td>
                                            <td>
                                                <sbux-input id="copperCnt" name="copperCnt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="copperSupplyAmt" name="copperSupplyAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="copperVatAmt" name="copperVatAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>⑨ 합계</td>
                                            <td>
                                                <sbux-input id="sumCnt" name="sumCnt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="sumSupplyAmt" name="sumSupplyAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="sumVatAmt" name="sumVatAmt" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="normal" is-scrollable="false"
                                           title-target-id-array="tpgDivision^tpgCalc"
                                           title-text-array="안분계산 명세^정산 및 재계산 명세">
                                </sbux-tabs>
                                <div class="tab-content" style="height: auto;flex: 1">
                                    <div id="tpgDivision" style="height: 100%">
                                        <div class="ad_tbl_top">
                                            <ul class="ad_tbl_count">
                                                <li><span>◎통매입세액 안분 계산 명세</span></li>
                                            </ul>
                                        </div>
                                        <div id="sb-area-grdDivision" style="width: 100%"></div>
                                    </div>
                                    <div id="tpgCalc" style="height: 100%">
                                        <div class="ad_tbl_top">
                                            <ul class="ad_tbl_count">
                                                <li><span>◎공통매입세액의 정산 명세</span></li>
                                            </ul>
                                            <sbux-button id="btn_add_grdCalc" name="btn_add_grdCalc" uitype="normal" text="행 추가"
                                                         image-src="/static/resource/svg/grdPlus.svg"
                                                         image-style="width:3rem;height:20px"
                                                         image-placement="front"
                                                         onclick="fn_addRow('grdCalc')">
                                            </sbux-button>
                                            <sbux-button id="btn_remove_grdCalc" name="btn_remove_grdCalc" uitype="normal" text="행 삭제"
                                                         image-src="/static/resource/svg/grdMinus.svg"
                                                         image-style="width:3rem;height:20px"
                                                         image-placement="front"
                                                         onclick="fn_removeRow('grdCalc')">
                                            </sbux-button>
                                        </div>
                                        <div id="sb-area-grdCalc" style="height: 150px;"></div>
                                        <div class="ad_tbl_top">
                                            <ul class="ad_tbl_count">
                                                <li><span>◎납부세액 또는 환급세액 재계산 명세</span></li>
                                            </ul>
                                            <sbux-button id="btn_add_grdReCalc" name="btn_add_grdReCalc" uitype="normal" text="행 추가"
                                                         image-src="/static/resource/svg/grdPlus.svg"
                                                         image-style="width:3rem;height:20px"
                                                         image-placement="front"
                                                         onclick="fn_addRow('grdReCalc')">
                                            </sbux-button>
                                            <sbux-button id="btn_remove_grdReCalc" name="btn_remove_grdReCalc" uitype="normal" text="행 삭제"
                                                         image-src="/static/resource/svg/grdMinus.svg"
                                                         image-style="width:3rem;height:20px"
                                                         image-placement="front"
                                                         onclick="fn_removeRow('grdReCalc')">
                                            </sbux-button>
                                        </div>
                                        <div id="sb-area-grdReCalc" style="height: 150px"></div>
                                    </div>
                                </div>
                            </div>
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
        jsonGrdList.length = 0;
        jsonGrdDivision.length = 0;
        jsonGrdCalc.length = 0;
        jsonGrdReCalc.length = 0;

        grdListGrid.rebuild();
        grdDivision.rebuild();
        grdCalc.rebuild();
        grdReCalc.rebuild();

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

        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2160.do", {
            getType				: 'json',
            cv_count			: '13',
            workType            : 'LIST',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;
        if(data.resultStatus === 'S'){
            jsonGrdList = data.cv_1;
            grdListGrid.rebuild();
            if(grdListGrid.getRows() === 2){
                grdListGrid.setRow(1);
                let workType = 'Q';
                paramObj.V_P_TAX_SITE_CODE = grdListGrid.getRowData(1).TAX_SITE_CODE;
                const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2160.do", {
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
            {caption : ['과세,면세사업등 공통매입','공급가액'],               ref : 'DIV_COM_IN_AMT',        width : '20%',    style : 'text-align:center',    type : 'input'},
            {caption : ['과세,면세사업등 공통매입','세액'],               ref : 'DIV_COM_IN_TAX_AMT',        width : '20%',    style : 'text-align:center',    type : 'input'},
            {caption : ['총공급가액','총공급가액'],          ref : 'DIV_TOTAL_SUPPLY_AMT',      width : '20%',   style : 'text-align:center',    type : 'input'},
            {caption : ['면세공급가액등','면세공급가액등'],          ref : 'DIV_EXEM_SUPPLY_AMT',      width : '20%',   style : 'text-align:center',    type : 'input'},
            {caption : ['불공제매입액','불공제매입액'],          ref : 'DIV_NOND_TAX_AMT',      width : '20%',   style : 'text-align:center',    type : 'input'},
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
            {caption : ['해당재화의매입세액','해당재화의매입세액'], ref : 'RECALC_GOODS_IN_TAX_AMT',        width : '20%',    style : 'text-align:center',    type : 'input'},
            {caption : ['경감률','비율(%)'], ref : 'RECALC_RATE',      width : '10%',   style : 'text-align:center',    type : 'input'},
            {caption : ['경감률','경과된 과세기간수'], ref : 'RECALC_ELAPSE_CNT',      width : '10%',   style : 'text-align:center',    type : 'input'},
            {caption : ['경감률','경감률(%)'], ref : 'RECALC_REDUCTION_RATE',      width : '10%',   style : 'text-align:center',    type : 'input'},
            {caption : ['증가 또는 감소된 면세공급가액(사용면적)비율(%)','증가 또는 감소된 면세공급가액(사용면적)비율(%)'], ref : 'RECALC_EXEM_RATE',      width : '35%',   style : 'text-align:center',    type : 'input'},
            {caption : ['가산 또는 공제되는 매입세액','가산 또는 공제되는 매입세액'], ref : 'RECALC_INPUT_TAX_AMT',      width : '15%',   style : 'text-align:center',    type : 'input'},
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

        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2160.do", {
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
