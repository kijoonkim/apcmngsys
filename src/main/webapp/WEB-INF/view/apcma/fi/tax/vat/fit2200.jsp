<%
    /**
     * @Class Name 		: fit2200.jsp
     * @Description 	: 의제매입세액신고서 화면
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
    <title>title : 신용카드수령명세서(매입)</title>
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
        .tpgTd{
            border: 0 !important;
            background-color : white !important;
            border-radius: 0 !important;
            padding: 0px 12px !important;
            height: auto;
        }
        table td {
            border: 1px solid #b0b2fe;
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
        #tpgAR table select, #tpgAP table select, #tpgAdjust3 table select{
            border: hidden !important;
            padding: 0 !important;
        }
        #tpgAR table td, #tpgAP table td, #tpgAdjust3 table td{
            padding: 0 !important;
        }
        #tpgAdjust3 table select{
            min-width: inherit;
            width: 100%;
        }
        .th_bg{
            text-align: center;
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
                    <td colspan="8" class="td_input">
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
                    <td colspan="3" class="td_input">
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
                <div id="resizer"></div>
                <div style="padding: 10px;flex: 1;display: flex;flex-direction: column">
                    <div style="flex: 1">
                        <sbux-tabs id="tabVATtax" name="tabVATtax" uitype="normal" is-scrollable="false"
                                   title-target-id-array="tpgAR^tpgAP" callback-after-select="fn_afterSelectTab"
                                   title-text-array="매입내역^정산내역">
                        </sbux-tabs>
                        <div class="tab-content" style="height: auto">
                            <div id="tpgAR">
                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li><span>▶ 면세 농산물 매입가액 합계</span></li>
                                    </ul>
                                </div>
                                <table style="width: 100%;text-align: center">
                                    <colgroup>
                                        <col style="width: 15%">
                                        <col style="width: 16%">
                                        <col style="width: 12%">
                                        <col style="width: 12%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <td colspan="2">구&emsp;&emsp;&emsp;&emsp;분</td>
                                        <td>매입처수</td>
                                        <td>건수</td>
                                        <td>매입가액</td>
                                        <td>공제율</td>
                                        <td>의무매입세액</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">합&emsp;&emsp;&emsp;&emsp;계</td>
                                        <td>
                                            <sbux-input id="PURCHASE_CNT_SUM" name="PURCHASE_CNT_SUM" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="CNT_SUM" name="CNT_SUM" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="AMT_SUM" name="AMT_SUM" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-select id="DDC_RT_SUM" name="DDC_RT_SUM" uitype="single" jsondata-ref="selectJsonData">
                                            </sbux-select>
                                        </td>
                                        <td>
                                            <sbux-input id="DMINPT_TAX_AMT_SUM" name="DMINPT_TAX_AMT_SUM" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2">사업자로부터의 매입분</td>
                                        <td>계산서</td>
                                        <td>
                                            <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXIV_CNT" name="TXIV_CNT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXIV_AMT" name="TXIV_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-select id="DDC_BLL_RT" name="DDC_BLL_RT" uitype="single" jsondata-ref="selectJsonData">
                                            </sbux-select>
                                        </td>
                                        <td>
                                            <sbux-input id="DMINPT_TAX_AMT_BLL" name="DMINPT_TAX_AMT_BLL" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>신용카드 등</td>
                                        <td>
                                            <sbux-input id="CARD_PURCHASE_CNT" name="CARD_PURCHASE_CNT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
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
                                            <sbux-select id="DDC_CARD_RT" name="DDC_CARD_RT" uitype="single" jsondata-ref="selectJsonData">
                                            </sbux-select>
                                        </td>
                                        <td>
                                            <sbux-input id="CARD_DMINPT_TAX_AMT" name="CARD_DMINPT_TAX_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">농어민등으로부터의 매입분</td>
                                        <td>
                                            <sbux-input id="FARMER_SUM_CNT" name="FARMER_SUM_CNT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="FARMER_SUM_CNT" name="FARMER_SUM_CNT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="FARMER_SUM_AMT" name="AMT_SUM" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-select id="DDC_FRMER_RT" name="DDC_FRMER_RT" uitype="single" jsondata-ref="selectJsonData">
                                            </sbux-select>
                                        </td>
                                        <td>
                                            <sbux-input id="DMINPT_TAX_AMT_FARMER" name="DMINPT_TAX_AMT_FARMER" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li><span>▶ 농어민 등으로부터의 매입분에 대한 명세</span></li>
                                    </ul>
                                </div>
                                <div id="sb-area-grdFarmer" style="width: 100%; height: 100%"></div>
                            </div>
                            <div id="tpgAP">
                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li><span>▶ 매입세금계산서 총합계</span></li>
                                    </ul>
                                </div>
                                <table style="width: 100%;text-align: center; margin-bottom: 10px">
                                    <colgroup>
                                        <col style="width: 15%">
                                        <col style="width: 16%">
                                        <col style="width: 12%">
                                        <col style="width: 12%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <td colspan="2">구&emsp;&emsp;&emsp;&emsp;분</td>
                                        <td>매입처수</td>
                                        <td>건수</td>
                                        <td>매입가액</td>
                                        <td>공제율</td>
                                        <td>의무매입세액</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">합&emsp;&emsp;&emsp;&emsp;계</td>
                                        <td>
                                            <sbux-input id="PURCHASE_CNT_SUM" name="PURCHASE_CNT_SUM" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="CNT_SUM" name="CNT_SUM" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="AMT_SUM" name="AMT_SUM" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-select id="DDC_RT_SUM" name="DDC_RT_SUM" uitype="single" jsondata-ref="selectJsonData">
                                            </sbux-select>
                                        </td>
                                        <td>
                                            <sbux-input id="DMINPT_TAX_AMT_SUM" name="DMINPT_TAX_AMT_SUM" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2">사업자로부터의 매입분</td>
                                        <td>계산서</td>
                                        <td>
                                            <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXIV_CNT" name="TXIV_CNT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXIV_AMT" name="TXIV_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-select id="DDC_BLL_RT" name="DDC_BLL_RT" uitype="single" jsondata-ref="selectJsonData">
                                            </sbux-select>
                                        </td>
                                        <td>
                                            <sbux-input id="DMINPT_TAX_AMT_BLL" name="DMINPT_TAX_AMT_BLL" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>신용카드 등</td>
                                        <td>
                                            <sbux-input id="CARD_PURCHASE_CNT" name="CARD_PURCHASE_CNT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
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
                                            <sbux-select id="DDC_CARD_RT" name="DDC_CARD_RT" uitype="single" jsondata-ref="selectJsonData">
                                            </sbux-select>
                                        </td>
                                        <td>
                                            <sbux-input id="CARD_DMINPT_TAX_AMT" name="CARD_DMINPT_TAX_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">농어민등으로부터의 매입분</td>
                                        <td>
                                            <sbux-input id="FARMER_SUM_CNT" name="FARMER_SUM_CNT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="FARMER_SUM_CNT" name="FARMER_SUM_CNT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="FARMER_SUM_AMT" name="AMT_SUM" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-select id="DDC_FRMER_RT" name="DDC_FRMER_RT" uitype="single" jsondata-ref="selectJsonData">
                                            </sbux-select>
                                        </td>
                                        <td>
                                            <sbux-input id="DMINPT_TAX_AMT_FARMER" name="DMINPT_TAX_AMT_FARMER" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                               <!-- inner tabs -->
                                <sbux-tabs id="TabAdjust" name="TabAdjust" uitype="normal" is-scrollable="false"
                                           title-target-id-array="tpgAdjust3^tpgManufacture" callback-after-select="fn_afterSelectTab"
                                           title-text-array="정산내역 상세^매입시기 집중 제조업">
                                </sbux-tabs>
                                <div class="tab-content" style="height: auto">
                                    <!-- inner left S -->
                                    <div id="tpgAdjust3">
                                        <div class="ad_tbl_top">
                                            <ul class="ad_tbl_count">
                                                <li><span>▶ 면세농산물등 의제매입세액 관련 신고내용</span></li>
                                            </ul>
                                        </div>
                                        <table class="table table-bordered tbl_fixed; margin-bottom: 10px">
                                            <colgroup>
                                                <col style="width: 15%">
                                                <col style="width: 15%">
                                                <col style="width: 15%">
                                                <col style="width: 12.5%">
                                                <col style="width: 12.5%">
                                                <col style="width: 15%">
                                                <col style="width: 15%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <td colspan="7">가. 과세기간 과세표준 및 공제 가능한 금액 등</td>
                                            </tr>
                                            <tr>
                                                <th colspan="3" scope="row" class="th_bg">
                                                    과세표준
                                                </th>
                                                <th colspan="2" scope="row" class="th_bg">
                                                    대상액 한도계산
                                                </th>
                                                <th rowspan="2" scope="row" class="th_bg">
                                                    당기매입액
                                                </th>
                                                <th rowspan="2" scope="row" class="th_bg">
                                                    공제대상금액
                                                </th>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">합계</th>
                                                <th scope="row" class="th_bg">예정분</th>
                                                <th scope="row" class="th_bg">확정분</th>
                                                <th scope="row" class="th_bg">한도율</th>
                                                <th scope="row" class="th_bg">한도액</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-select id="LMT_RT" name="LMT_RT" uitype="single" jsondata-ref="jsonLimitRate"
                                                                 jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                    </sbux-select>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-bordered tbl_fixed;">
                                            <colgroup>
                                                <col style="width: 15%">
                                                <col style="width: 15%">
                                                <col style="width: 15%">
                                                <col style="width: 15%">
                                                <col style="width: 15%">
                                                <col style="width: 25%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <td colspan="6">나. 과세기간 공제할 세액</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg" colspan="2">공제대상 세액</th>
                                                <th scope="row" class="th_bg" colspan="3">이미공제받은 세액</th>
                                                <th scope="row" class="th_bg" rowspan="2">공제(납부)할 세액</th>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">공제율</th>
                                                <th scope="row" class="th_bg">공제대상세액</th>
                                                <th scope="row" class="th_bg">합계</th>
                                                <th scope="row" class="th_bg">예정신고분</th>
                                                <th scope="row" class="th_bg">월별조기분</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <sbux-select id="DDC_RT_SUM" name="DDC_RT_SUM" uitype="single" jsondata-ref="selectJsonData">
                                                    </sbux-select>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- inner left E -->
                                    <!-- inner right S -->
                                    <div id="tpgManufacture">
                                        <div class="ad_tbl_top">
                                            <ul class="ad_tbl_count">
                                                <li><span>▶ 매입시기 집중 제조업 면세농산물등 의제매입세액 관련 신고내용</span></li>
                                            </ul>
                                        </div>
                                        <table class="table table-bordered tbl_fixed; margin-bottom: 10px">
                                            <colgroup>
                                                <col style="width: 10%">
                                                <col style="width: 10%">
                                                <col style="width: 10%">
                                                <col style="width: 10%">
                                                <col style="width: 10%">
                                                <col style="width: 10%">
                                                <col style="width: 10%">
                                                <col style="width: 10%">
                                                <col style="width: 20%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <td colspan="9">가. 과세기간 과세표준 및 공제 가능한 금액 등</td>
                                            </tr>
                                            <tr>
                                                <th colspan="3" scope="row" class="th_bg">
                                                    과세표준
                                                </th>
                                                <th colspan="2" scope="row" class="th_bg">
                                                    대상액 한도계산
                                                </th>
                                                <th colspan="3" scope="row" class="th_bg">
                                                    1역년 매입액
                                                </th>
                                                <th rowspan="2" scope="row" class="th_bg">
                                                    공제대상금액
                                                </th>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">합계</th>
                                                <th scope="row" class="th_bg">제1기</th>
                                                <th scope="row" class="th_bg">제2기</th>
                                                <th scope="row" class="th_bg">한도율</th>
                                                <th scope="row" class="th_bg">한도액</th>
                                                <th scope="row" class="th_bg">합계</th>
                                                <th scope="row" class="th_bg">제1기</th>
                                                <th scope="row" class="th_bg">제2기</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-select id="DMINPT_TRGT_LIM_RT" name="DMINPT_TRGT_LIM_RT" uitype="single" jsondata-ref="jsonLimitRate"
                                                        jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                    </sbux-select>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <table class="table table-bordered tbl_fixed;">
                                            <colgroup>
                                                <col style="width: 14%">
                                                <col style="width: 14%">
                                                <col style="width: 14%">
                                                <col style="width: 10%">
                                                <col style="width: 10%">
                                                <col style="width: 10%">
                                                <col style="width: 14%">
                                                <col style="width: 14%">
                                            </colgroup>
                                            <tbody>
                                            <tr>
                                                <td colspan="8">나. 제2기 과세기간 공제할 세액</td>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg" colspan="2">공제대상 세액</th>
                                                <th scope="row" class="th_bg" colspan="6">이미공제받은 세액</th>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg" rowspan="2">공제율</th>
                                                <th scope="row" class="th_bg" rowspan="2">공제대상세액</th>
                                                <th scope="row" class="th_bg" rowspan="2">1월총합계</th>
                                                <th scope="row" class="th_bg" rowspan="2">2월제1기</th>
                                                <th scope="row" class="th_bg" colspan="3">제2기</th>
                                                <th scope="row" class="th_bg" rowspan="2">공제(납부)할세액</th>
                                            </tr>
                                            <tr>
                                                <th scope="row" class="th_bg">합계</th>
                                                <th scope="row" class="th_bg">예정신고분</th>
                                                <th scope="row" class="th_bg">월별조기분</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <sbux-select id="DDC_RT_SUM" name="DDC_RT_SUM" uitype="single" jsondata-ref="selectJsonData">
                                                    </sbux-select>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                                <td>
                                                    <sbux-input id="BILL_PURCHASE_CNT" name="BILL_PURCHASE_CNT" uitype="text"
                                                                class="tpgTd" init="0" readonly
                                                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                    </sbux-input>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- inner right E -->
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
    var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId 	= '${comMenuVO.menuId}';
    //-----------------------------------------------------------
    /** 부가세기간 구분 **/
    var jsonCbotaxTerm = [];
    /** 신고 구분 **/
    var jsonCbotaxRepDtlType = [];
    /** 환급 구분 **/
    var jsonCboRfType = [];
    /** 한도율 **/
    var jsonLimitRate = [];
 
    var jsonCorpNm = [];
 
    var jsonGrdList = [];
    var grdListGrid;
 
    var jsonGrdFarmer = [];
    var grdFarmer;
 
    window.addEventListener("DOMContentLoaded",function(e){
        fn_createGrid();
        fn_createFarmerGrid();
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
        /** 한도율 **/
        jsonLimitRateData = await gfnma_getComList('L_FIT027','',gv_ma_selectedCorpCd,gv_ma_selectedClntCd,'CO_CD',"CORP_NM");
        jsonLimitRate = jsonLimitRateData.cv_1;
        SBUxMethod.refresh('DMINPT_TRGT_LIM_RT');
        SBUxMethod.set('DMINPT_TRGT_LIM_RT','3');
        SBUxMethod.refresh('LMT_RT');
        SBUxMethod.set('LMT_RT','3');
        /** 신고구분명 select **/
        await fn_setMultSelect(yyyy);
    }
    async function fn_setMultSelect(yyyy) {
        SBUxMethod.set("srch-dtp-ymdstandardTermFr","");
        SBUxMethod.set("srch-dtp-ymdstandardTermTo","");
        /** 신고구분명 select **/
        gfnma_multiSelectInit({
            target: ['#src-btn-currencyCode']
            , compCode: gv_ma_selectedCorpCd
            , clientCode: gv_ma_selectedClntCd
            , bizcompId: 'L_FIT030'
            , whereClause: 'AND A.YR = ' + "'" + yyyy + "'"
            , formId: p_formId
            , menuId: p_menuId
            , selectValue: ''
            , dropType: 'down' 	// up, down
            , dropAlign: '' 	// left, right
            , colValue: 'SEQ'
            , colLabel: 'VAT_TMPLT_NM'
            , columns: [
                {caption: "부가세유형", ref: 'VAT_TMPLT_NM', width: '120px', style: 'text-align:left'},
                {caption: "신고기준시작월", ref: 'STANDARD_TERM_FR', width: '150px', style: 'text-align:left'},
                {caption: "신고기준종료월", ref: 'STANDARD_TERM_TO', width: '150px', style: 'text-align:left'},
                {caption: "총괄납부사업장번호", ref: 'UNIT_NO', width: '180px', style: 'text-align:left'},
                {caption: "단위과세번호", ref: 'OVS_BPLC_NO', width: '150px', style: 'text-align:left'},
                {caption: "확정여부", ref: 'CFMTN_YN', width: '150px', style: 'text-align:left'},
                {caption: "SEQ", ref: 'SEQ', width: '150px', style: 'text-align:left;display:none',}
            ]
            , callback: fn_choice
        });
    }
    async function fn_choice(_value){
        /** reset **/
      /** 여기는 좀 다름**/
 
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
 
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2200.do", {
            getType				: 'json',
            cv_count			: '11',
            workType            : 'LIST',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
        if(data.resultStatus === 'S'){
            jsonGrdList = data.cv_1;
            grdListGrid.rebuild();
            if(grdListGrid.getRows() === 2){
                grdListGrid.setRow(1);
                paramObj.V_P_TAX_SITE_CODE = grdListGrid.getRowData(1).TAX_SITE_CODE;
                const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2200.do", {
                    getType				: 'json',
                    cv_count			: '11',
                    workType            : 'DETAIL',
                    params				: gfnma_objectToString(paramObj)
                });
                const data = await postJsonPromise;

                if(data.resultStatus === 'S'){
                    let resultObj = data.cv_2[0];
                    for(let key in resultObj){
                        let elId = "#" + key;
                        $(elId).val(parseInt(resultObj[key]) || 0);
                    }
                    let resultObj2 = data.cv_3[0];
                    for(let key in resultObj2){
                        let elId = "#" + key;
                        $(elId).val(parseInt(resultObj2[key]) || 0);
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
    }
 
    const fn_createFarmerGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdFarmer';
        SBGridProperties.id = 'grdFarmer';
        SBGridProperties.jsonref = 'jsonGrdFarmer';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['일련번호','일련번호'],               ref : 'DEEMED_SEQ',        width : '10%',    style : 'text-align:center',    type : 'output'},
            {caption : ['면세농산물등을 공급한 농어민 등','성명'],          ref : 'DMINPT_NM',      width : '15%',   style : 'text-align:center',    type : 'output'},
            {caption : ['면세농산물등을 공급한 농어민 등','주민등록번호'],          ref : 'DMINPT_RRNO',      width : '15%',   style : 'text-align:center',    type : 'output'},
            {caption : ['건수','건수'],               ref : 'DMINPT_CNT',        width : '15%',    style : 'text-align:center',    type : 'output'},
            {caption : ['품명','품명'],               ref : 'DMINPT_GDS_NM',        width : '15%',    style : 'text-align:center',    type : 'output'},
            {caption : ['수량','수량'],               ref : 'DMINPT_QNTT',        width : '15%',    style : 'text-align:center',    type : 'output'},
            {caption : ['매입가액','매입가액'],               ref : 'DMINPT_AMT',        width : '15%',    style : 'text-align:center',    type : 'output'},
        ];
        grdFarmer = _SBGrid.create(SBGridProperties);
    }
 
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
 
    function cfn_save() {
        fn_save();
    }
    function cfn_add() {
        fn_create();
    }
    function cfn_del() {
        fn_delete();
    }
    function cfn_init(){
        fn_reset();
    }
    function fn_reset(){
        jsonGrdList.length = 0;
        grdListGrid.rebuild();
 
        jsonGrdFarmer.length = 0;
        grdFarmer.rebuild();
 
        gfnma_multiSelectSet('#src-btn-currencyCode','', '', '');
        SBUxMethod.set("srch-dtp-ymdstandardTermFr","");
        SBUxMethod.set("srch-dtp-ymdstandardTermTo","");
 
        let inputs = document.querySelectorAll("div.tab-content table input");
        inputs.forEach(function(item){
           $(item).val(0);
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
 
    async function fn_afterSelectTab(_id){
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
            ,V_P_AR_AP_TYPE         : ''
            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''
        }
        gfnma_getTableElement("srchTable","srch-",paramObj,"V_P_",['taxSiteName','bizRegno','ymdstandardTermFr','ymdstandardTermTo']);
        let seq = gfnma_multiSelectGet("#src-btn-currencyCode");
        let workType = _id === 'tpgAR'? 'Q':'Q1';
 
        paramObj.V_P_SEQ = seq;
 
        /** 사업장 리스트 chk **/
        let gridIdx = grdListGrid.getRow();
        if(gridIdx < 0){
            return;
        }
 
        paramObj.V_P_TAX_SITE_CODE = grdListGrid.getRowData(gridIdx).TAX_SITE_CODE;
 
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2200.do", {
            getType				: 'json',
            cv_count			: '11',
            workType            : 'DETAIL',
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
        if(data.resultStatus === 'S'){
            if(workType === 'Q'){
                let resultObj = data.cv_2[0];
                for(let key in resultObj){
                    let elId = "#" + key;
                    $(elId).val(parseInt(resultObj[key]) || 0);
                }
                jsonGrdFarmer = data.cv_3;
                grdFarmer.rebuild();
            }else{
                let resultObj = data.cv_4[0];
                for(let key in resultObj){
                    let elId = "#" + key + '2';
                    $(elId).val(parseInt(resultObj[key]) || 0);
                }
            }
        }
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
