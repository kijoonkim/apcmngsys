<%
    /**
     * @Class Name 		: fit2140.jsp
     * @Description 	: 건물등감가상각자산취득명세서 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.18
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.18   	이경한		최초 생성
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
    <title>Title</title><title>title : 건물등감가상각자산취득명세서</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
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
        #resizer{
             background-image:url('/static/resource/svg/dot_h.svg');
             background-repeat: no-repeat;
             background-position: center;
             background-size: 17px;
             cursor:ew-resize;
             background-color: rgba(43, 45, 48, 0.07);
             height: 100%;
             width: 5px;
         }
        td.td_head{
            background-color: #f7f7f7;
            border: 2px solid #0b3ba2;
            text-align: center;
            padding: 0 !important;
            font-size: 13px;
        }
        .td_headP{
            background-color: #f7f7f7;
            border: 2px solid #0b3ba2;
            text-align: center;
            font-size: 17px;
            padding: 8px;
        }
        .tpgTd {
            text-align: right !important;
            background-color: white !important;
            font-size: 15px !important;
            border: 0 !important;
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
            <!--[APC] START -->
            <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
            <!--[APC] END -->
            <!-- content_header start -->
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
                    <td colspan="7" class="td_input">
                        <div style="display: flex;gap: 5px">
                            <div class="dropdown">
                                <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="src-btn-currencyCode" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <font>선택</font>
                                    <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="src-btn-currencyCode" style="width:750px;height:150px;padding-top:0px;overflow:auto">
                                </div>
                            </div>
                            <sbux-input readonly id="srch-dtp-ymdstandardTermFr" style="text-align: center" uitype="text" class="form-control input-sm"></sbux-input>
                            <p style="text-align: center;line-height: 30px">~</p>
                            <sbux-input readonly id="srch-dtp-ymdstandardTermTo" style="text-align: center" uitype="text" class="form-control input-sm"></sbux-input>
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
                <div style="width: 30%;padding: 10px">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>◎ 사업장 리스트</span></li>
                        </ul>
                    </div>
                    <div id="sb-area-grdListGrid" style="width: 100%"></div>
                </div>
                <div id="resizer"></div>
                <div style="padding: 10px;flex: 1;display: flex;flex-direction: column">
                    <div style="flex: 1">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>◎ 제출자 인적사항</span></li>
                            </ul>
                        </div>
                        <table id="panRightHeader" style="width: 100%; height: auto">
                            <colgroup>
                                <col style="width: 25%">
                                <col style="width: 25%">
                                <col style="width: 25%">
                                <col style="width: 25%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td class="td_head">상호(법인명)</td>
                                    <td style="border: 1px solid grey">
                                        <input id="TAX_SITE_NAME1" name="TAX_SITE_NAME1" class="output" type="text" style="padding-left: 5px;background-color: white;border: 0" readonly />
                                    </td>
                                    <td class="td_head">사업자번호</td>
                                    <td style="border: 1px solid grey">
                                        <input id="BIZ_REGNO1" name="BIZ_REGNO1" class="output" type="text" readonly style="padding-left: 5px; background-color: white;border: 0"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_head">업태</td>
                                    <td style="border: 1px solid grey">
                                        <input id="BIZ_CATEGORY" name="BIZ_CATEGORY" class="output" type="text" style="padding-left: 5px;background-color: white;border: 0" readonly />
                                    </td>
                                    <td class="td_head">종목</td>
                                    <td style="border: 1px solid grey">
                                        <input id="BIZ_ITEMS" name="BIZ_ITEMS" class="output" type="text" style="padding-left: 5px;background-color: white;border: 0" readonly />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="flex: 1">
                        <div style="flex: 1">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>◎ 감가상각자산 취득명세 합계</span></li>
                                </ul>
                            </div>
                            <table id="panRightMiddle" style="width: 100%; height: auto">
                                <colgroup>
                                    <col style="width: 25%">
                                    <col style="width: 25%">
                                    <col style="width: 25%">
                                    <col style="width: 25%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <td class="td_headP">감가상각자산 종류</td>
                                    <td class="td_headP">건&emsp;&emsp;수</td>
                                    <td class="td_headP">공급가액</td>
                                    <td class="td_headP">세&emsp;&emsp;액</td>
                                </tr>
                                <tr>
                                    <td class="td_headP">합&emsp;&emsp;계</td>
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
                                    <td class="td_headP">건물, 구축물</td>
                                    <td>
                                        <sbux-input id="BUILDING_CNT" name="BUILDING_CNT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="BUILDING_AMT" name="BUILDING_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="BUILDING_VAT_AMT" name="BUILDING_VAT_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_headP">기 계 장 치</td>
                                    <td>
                                        <sbux-input id="MACHINE_CNT" name="MACHINE_CNT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="MACHINE_AMT" name="MACHINE_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="MACHINE_VAT_AMT" name="MACHINE_VAT_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_headP">차 량 운 반 구</td>
                                    <td>
                                        <sbux-input id="CAR_CNT" name="CAR_CNT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="CAR_AMT" name="CAR_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                    <td>
                                        <sbux-input id="CAR_VAT_AMT" name="CAR_VAT_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_headP">그 밖의 감가상각자산</td>
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
                                        <sbux-input id="ETC_VAT_AMT" name="ETC_VAT_AMT" uitype="text"
                                                    class="tpgTd" init="0" readonly
                                                    mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                        </sbux-input>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div style="flex:1">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>◎ 수취구분별 합계</span></li>
                            </ul>
                        </div>
                        <table id="panRightBottom" style="width: 100%; height: auto">
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
                                <td class="td_headP">공급가액</td>
                                <td class="td_headP">세&emsp;&emsp;액</td>
                            </tr>
                            <tr>
                                <td class="td_headP">합&emsp;&emsp;계</td>
                                <td>
                                    <sbux-input id="SUM_CNT1" name="SUM_CNT1" uitype="text"
                                                class="tpgTd" init="0" readonly
                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                    </sbux-input>
                                </td>
                                <td>
                                    <sbux-input id="SUM_AMT1" name="SUM_AMT1" uitype="text"
                                                class="tpgTd" init="0" readonly
                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                    </sbux-input>
                                </td>
                                <td>
                                    <sbux-input id="SUM_VAT_AMT1" name="SUM_VAT_AMT1" uitype="text"
                                                class="tpgTd" init="0" readonly
                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                    </sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_headP">세금계산서 수취분</td>
                                <td>
                                    <sbux-input id="TAX_CNT" name="TAX_CNT" uitype="text"
                                                class="tpgTd" init="0" readonly
                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                    </sbux-input>
                                </td>
                                <td>
                                    <sbux-input id="TAX_AMT" name="TAX_AMT" uitype="text"
                                                class="tpgTd" init="0" readonly
                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                    </sbux-input>
                                </td>
                                <td>
                                    <sbux-input id="TAX_VAT_AMT" name="TAX_VAT_AMT" uitype="text"
                                                class="tpgTd" init="0" readonly
                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                    </sbux-input>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_headP">신용카드매출전표 등<br>수취명세서 제출분</td>
                                <td>
                                    <sbux-input id="CARD_CNT" name="CARD_CNT" uitype="text"
                                                class="tpgTd" init="0" readonly
                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                    </sbux-input>
                                </td>
                                <td>
                                    <sbux-input id="CARD_AMT" name="CARD_AMT" uitype="text"
                                                class="tpgTd" init="0" readonly
                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                    </sbux-input>
                                </td>
                                <td>
                                    <sbux-input id="CARD_VAT_AMT" name="CARD_VAT_AMT" uitype="text"
                                                class="tpgTd" init="0" readonly
                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                    </sbux-input>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------
    /** 부가세기간 구분 **/
    var jsonCbotaxTerm = [];
    /** 신고 구분 **/
    var jsonCbotaxRepDtlType = [];
    /** 환급 구분 **/
    var jsonCboRfType = [];
    var jsonGrdList = [];
    var grdListGrid;

    /** DOM load **/
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createGrid();
        fn_init();
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
    async function fn_choice(_value) {
        /** panRight reset **/
        const inputs = document.querySelectorAll('#panRightHeader input');
        const numInputs = document.querySelectorAll('#panRightMiddle input, #panRightBottom input');
        inputs.forEach(input => {
            input.value = '';
        });
        numInputs.forEach(input => {
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

        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2150.do", {
            getType				: 'json',
            cv_count			: '4',
            workType            : 'LIST',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        if(data.resultStatus === 'S') {
            jsonGrdList = data.cv_1;
            grdListGrid.rebuild();
            if (grdListGrid.getRows() === 2) {
                /** panRightHeader SET **/
                let resultData = data.cv_1[0];
                $("#TAX_SITE_NAME1").val(resultData.TAX_SITE_NAME);
                $("#BIZ_REGNO1").val(resultData.BIZ_REGNO);
                $("#BIZ_CATEGORY").val(resultData.BIZ_CATEGORY);
                $("#BIZ_ITEMS").val(resultData.BIZ_ITEMS);

                grdListGrid.setRow(1);
                paramObj.V_P_TAX_SITE_CODE = grdListGrid.getRowData(1).TAX_SITE_CODE;

                const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2150.do", {
                    getType: 'json',
                    cv_count: '4',
                    workType: 'DETAIL',
                    params: gfnma_objectToString(paramObj)
                });
                const data1 = await postJsonPromise;

                if(data1.resultStatus === 'S'){
                    let middleData = data1.cv_2[0];
                    let bottomData = data1.cv_3[0];

                    for(let key in middleData){
                        $(`#${'${key}'}`).val(middleData[key]);
                    }
                    for(let key in bottomData){
                        $(`#${'${key}'}`).val(bottomData[key]);
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
        grdAr.resize();
        grdAp.resize();
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

        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2150.do", {
            getType: 'json',
            cv_count: '4',
            workType: 'DETAIL',
            params: gfnma_objectToString(paramObj)
        });
        const data1 = await postJsonPromise;

        if(data1.resultStatus === 'S'){
            let middleData = data1.cv_2[0];
            let bottomData = data1.cv_3[0];

            for(let key in middleData){
                $(`#${'${key}'}`).val(middleData[key]);
            }
            for(let key in bottomData){
                $(`#${'${key}'}`).val(bottomData[key]);
            }
        }
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
