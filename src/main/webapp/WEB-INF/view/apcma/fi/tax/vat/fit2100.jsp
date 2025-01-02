<%
    /**
     * @Class Name 		: fit2100.jsp
     * @Description 	: 부가가치세신고서 화면
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
        input[type="number"] , div.tab-content input[type="text"]{
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
        #tabvat_1 table select, #tabvat_2 table select, #tabvat_3 table select{
            border: hidden !important;
            padding: 0 !important;
        }
        #tabvat_1 table td, #tabvat_2 table td, #tabvat_3 table td{
            padding: 0 !important;
        }
        #tabvat_1 table select,#tabvat_2 table select,#tabvat_3 table select{
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
                                         date-format="yyyy"class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed"
                        >
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
            <div style=" height: 82vh; display: flex">
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
                                   title-target-id-array="tabvat_1^tabvat_2^tabvat_3" callback-after-select="fn_afterSelectTab"
                                   title-text-array="1장^2장^과세표준명세">
                        </sbux-tabs>
                        <div class="tab-content" style="height: auto">
                            <!-- 1장 S-->
                            <div id="tabvat_1" style="height: 500px">
                                <table class="table table-bordered tbl_fixed" style="overflow: scroll">
                                    <colgroup>
                                        <col style="width: 5%">
                                        <col style="width: 5%">
                                        <col style="width: 10%">
                                        <col style="width: 20%">
                                        <col style="width: 6%">
                                        <col style="width: 24%">
                                        <col style="width: 10%">
                                        <col style="width: 20%">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="8">1.신고내용</th>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="5">구분</th>
                                            <th scope="row" class="th_bg" >금액</th>
                                            <th scope="row" class="th_bg" >세율</th>
                                            <th scope="row" class="th_bg" >세액</th>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" rowspan="9" style="padding: 0px 12px">과세표준및매출세액</th>
                                            <th scope="row" class="th_bg" rowspan="4" >과세</th>
                                            <th scope="row" class="th_bg" colspan="2">세금계산서 발급본</th>
                                            <th scope="row" class="th_bg" style="padding: 0">(1)</th>
                                            <td>
                                                <sbux-input id="AR_TXTN_TXIV_AMT" name="AR_TXTN_TXIV_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL27" name="LABEL_CONTROL27" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="AR_TXTN_TXIV_TXAMT" name="AR_TXTN_TXIV_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="2">매입자 발행 세금계산서</th>
                                            <th scope="row" class="th_bg" style="padding: 0">(2)</th>
                                            <td>
                                                <sbux-input id="AR_TXTN_TXIV_CNPT_AMT" name="AR_TXTN_TXIV_CNPT_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL28" name="LABEL_CONTROL27" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="AR_TXTN_TXIV_CNPT_TXAMT" name="AR_TXTN_TXIV_CNPT_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="2">신용카드  ·  현금영수증 발행분</th>
                                            <th scope="row" class="th_bg" style="padding: 0">(3)</th>
                                            <td>
                                                <sbux-input id="AR_TXTN_CARD_CASH_AMT" name="AR_TXTN_CARD_CASH_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL29" name="LABEL_CONTROL27" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="AR_TXTN_CARD_CASH_TXAMT" name="AR_TXTN_CARD_CASH_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="2">기타(정규 영수증외 매출분)</th>
                                            <th scope="row" class="th_bg" style="padding: 0">(4)</th>
                                            <td>
                                                <sbux-input id="AR_TXTN_ETC_AMT" name="AR_TXTN_ETC_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL30" name="LABEL_CONTROL27" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="AR_TXTN_ETC_TXAMT" name="AR_TXTN_ETC_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" rowspan="2">영세율</th>
                                            <th scope="row" class="th_bg" colspan="2">세금계산서발급분</th>
                                            <th scope="row" class="th_bg" style="padding: 0">(5)</th>
                                            <td>
                                                <sbux-input id="AR_ZRT_TXIV_AMT" name="AR_ZRT_TXIV_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL31" name="LABEL_CONTROL27" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL179" name="LABEL_CONTROL179" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="2">세금계산서발급분</th>
                                            <th scope="row" class="th_bg" style="padding: 0">(6)</th>
                                            <td>
                                                <sbux-input id="AR_ZRT_ETC_AMT" name="AR_ZRT_ETC_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL32" name="LABEL_CONTROL27" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL188" name="LABEL_CONTROL179" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="3">예정신고누락분</th>
                                            <th scope="row" class="th_bg" style="padding: 0">(7)</th>
                                            <td>
                                                <sbux-input id="AR_PRNMNT_NRPT_AMT2" name="AR_PRNMNT_NRPT_AMT2" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL33" name="LABEL_CONTROL27" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="AR_PRNMNT_NRPT_TXAMT2" name="AR_PRNMNT_NRPT_TXAMT2" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="3">대손세액가감</th>
                                            <th scope="row" class="th_bg" style="padding: 0">(8)</th>
                                            <td>
                                                <sbux-input id="AR_BADDT_AMT" name="AR_BADDT_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL34" name="LABEL_CONTROL27" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="AR_BADDT_VAT_AMT" name="AR_BADDT_VAT_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="3">합계</th>
                                            <th scope="row" class="th_bg" style="padding: 0">(9)</th>
                                            <td>
                                                <sbux-input id="AR_SUM_AMT" name="AR_SUM_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL35" name="LABEL_CONTROL27" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="AR_SUM_TXAMT" name="AR_SUM_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" rowspan="9" style="padding: 0px 12px">매입세액</th>
                                            <th scope="row" class="th_bg" rowspan="3" colspan="2">세금계산서 수취분</th>
                                            <th scope="row" class="th_bg">일반매입</th>
                                            <th scope="row" class="th_bg" style="padding: 0">(10)</th>
                                            <td>
                                                <sbux-input id="APS_TXIV_AMT" name="APS_TXIV_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL54" name="LABEL_CONTROL54" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="APS_TXIV_VAT_AMT" name="APS_TXIV_VAT_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">수출기업 수입분 납부유</th>
                                            <th scope="row" class="th_bg" style="padding: 0; font-size: 10px">(10-1)</th>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL232" name="LABEL_CONTROL232" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL212" name="LABEL_CONTROL212" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="APS_SBTR_VAT_AMT" name="APS_SBTR_VAT_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">고정자산매입</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(11)</th>
                                            <td>
                                                <sbux-input id="INPTVAT_TXIV_AST_AMT" name="INPTVAT_TXIV_AST_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL55" name="LABEL_CONTROL55" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="INPTVAT_TXIV_AST_TXAMT" name="INPTVAT_TXIV_AST_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="3">예정신고누락분</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(12)</th>
                                            <td>
                                                <sbux-input id="APS_DCLR_OMISN_AMT2" name="APS_DCLR_OMISN_AMT2" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL56" name="LABEL_CONTROL56" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="APS_DCLR_OMISN_VAT_AMT" name="APS_DCLR_OMISN_VAT_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="3">매입자발행세금계산서</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(13)</th>
                                            <td>
                                                <sbux-input id="INPTVAT_TXIV_PRCHSPT_AMT" name="INPTVAT_TXIV_PRCHSPT_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL57" name="LABEL_CONTROL57" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="INPTVAT_TXIV_PRCHSPT_TXAMT" name="INPTVAT_TXIV_PRCHSPT_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="3">그밖의 공제매입세액</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(14)</th>
                                            <td>
                                                <sbux-input id="APS_ETC_DDC_AMT2" name="APS_ETC_DDC_AMT2" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL58" name="LABEL_CONTROL58" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="APS_ETC_DDC_VAT_AMT2" name="APS_ETC_DDC_VAT_AMT2" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="3">합계</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(15)</th>
                                            <td>
                                                <sbux-input id="APS_SUM_AMT" name="APS_SUM_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL59" name="LABEL_CONTROL59" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="APS_SUM_VAT_AMT" name="APS_SUM_VAT_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="3">공제받지못할 매입세액</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(16)</th>
                                            <td>
                                                <sbux-input id="APS_NDDC_AMT2" name="APS_NDDC_AMT2" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-select id="LABEL_CONTROL60" name="LABEL_CONTROL60" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD" readonly>
                                                </sbux-select>
                                            </td>
                                            <td>
                                                <sbux-input id="APS_NDDC_VAT_AMT2" name="APS_NDDC_VAT_AMT2" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="3">차감계((15)-(16))</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(17)</th>
                                            <td>
                                                <sbux-input id="APS_SBTR_AMT" name="APS_SBTR_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL61" name="LABEL_CONTROL61" uitype="text">㉯</sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="APS_NDDC_VAT_AMT2" name="APS_NDDC_VAT_AMT2" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="6">납 부 ( 환 급 ) 세 액  ( 매 출 세 액 ㉮ - 매 입 세 액 ㉯ )</th>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL63" name="LABEL_CONTROL63" uitype="text">㉰</sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="PAY_VAT_SBSD_TXAMT" name="PAY_VAT_SBSD_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="2" rowspan="3" >경감·공제세액</th>
                                            <th scope="row" class="th_bg" colspan="2" >그밖의경감·공제세액</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(18)</th>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL250" name="LABEL_CONTROL250" uitype="text">㉰</sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL71" name="LABEL_CONTROL71" uitype="text">㉰</sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="RDCTN_ETC_DDC_TXAMT2" name="RDCTN_ETC_DDC_TXAMT2" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="2" >신용카드매출전표등발행공제등</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(19)</th>
                                            <td>
                                                <sbux-input id="RDCTN_CARD_DDC_AMT" name="RDCTN_CARD_DDC_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL72" name="LABEL_CONTROL72" uitype="text">㉰</sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="RDCTN_CARD_DDC_TXAMT" name="RDCTN_CARD_DDC_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="2" >합계</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(20)</th>
                                            <td>
                                                <sbux-input id="RDCTN_SUM_DDC_AMT" name="RDCTN_SUM_DDC_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL72" name="LABEL_CONTROL72" uitype="text">㉱</sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="RDCTN_SUM_DDC_TXAMT" name="RDCTN_SUM_DDC_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="4">예정신고미환급세액</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(21)</th>
                                            <td>
                                                <sbux-input id="NO_REBATE_AMT" name="NO_REBATE_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL72" name="LABEL_CONTROL72" uitype="text">㉲</sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="PRNMNT_RPT_N_RMBR_TXAMT" name="PRNMNT_RPT_N_RMBR_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="4">예정고지세액</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(22)</th>
                                            <td>
                                                <sbux-input id="PREPAYMENT_AMT" name="PREPAYMENT_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL72" name="LABEL_CONTROL72" uitype="text">㉳</sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="PRNMNT_TXAMT" name="PRNMNT_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="4">사업양수자의대리납부 기납부세</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(23)</th>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL251" name="LABEL_CONTROL251" uitype="text"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL72" name="LABEL_CONTROL72" uitype="text">㉴</sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="AGT_VAT_AMT" name="AGT_VAT_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="4">매입자 납부특례 기납부세액</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(24)</th>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL249" name="LABEL_CONTROL251" uitype="text"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL359" name="LABEL_CONTROL72" uitype="text">㉵</sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="PRCHSPT_PAY_SPCS_VAT_AMT" name="PRCHSPT_PAY_SPCS_VAT_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="4">가산세액계</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(25)</th>
                                            <td>
                                                <sbux-input id="ADD_TAX_AMT2" name="ADD_TAX_AMT2" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="LABEL_CONTROL85" name="LABEL_CONTROL72" uitype="text">㉶</sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="ADTN_VAT_AMT2" name="ADTN_VAT_AMT2" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="6">차가감하여 납부할 세액 (환급받을 세액) (㉰ - ㉱ - ㉲ - ㉳ - ㉴ + ㉵)</th>
                                            <th scope="row" class="th_bg" style="padding: 0;">(26)</th>
                                            <td>
                                                <sbux-input id="SUM_TXAMT" name="SUM_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="7">총 괄  납 부  사 업 자 가   납 부 할  세 액  (환 급 받 을  세 액)</th>
                                            <td>
                                                <sbux-input id="PAY_VAT_TXAMT" name="PAY_VAT_TXAMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table class="table table-bordered tbl_fixed" style="margin-top: 10px">
                                    <colgroup>
                                        <col style="width: 6%">
                                        <col style="width: 19%">
                                        <col style="width: 18%">
                                        <col style="width: 19%">
                                        <col style="width: 19%">
                                        <col style="width: 19%">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="6">4.과세표준명세</th>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" colspan="2">업태</th>
                                            <th scope="row" class="th_bg">종목</th>
                                            <th scope="row" class="th_bg">생산요소</th>
                                            <th scope="row" class="th_bg">업종코드</th>
                                            <th scope="row" class="th_bg">금액</th>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" style="padding: 0">(27)</th>
                                            <td>
                                                <sbux-input id="TXBS_BZSTAT1" name="TXBS_BZSTAT1" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_ITEM1" name="TXBS_ITEM1" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="PRDCTN_ELMT1" name="PRDCTN_ELMT1" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_TPBIZ_CD1" name="TXBS_TPBIZ_CD1" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_AMT1" name="TXBS_AMT1" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" style="padding: 0">(28)</th>
                                            <td>
                                                <sbux-input id="TXBS_BZSTAT2" name="TXBS_BZSTAT2" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_ITEM2" name="TXBS_ITEM2" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="PRDCTN_ELMT2" name="PRDCTN_ELMT2" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_TPBIZ_CD2" name="TXBS_TPBIZ_CD2" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_AMT2" name="TXBS_AMT2" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" style="padding: 0">(29)</th>
                                            <td>
                                                <sbux-input id="TXBS_BZSTAT3" name="TXBS_BZSTAT3" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_ITEM3" name="TXBS_ITEM3" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="PRDCTN_ELMT3" name="PRDCTN_ELMT3" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_TPBIZ_CD3" name="TXBS_TPBIZ_CD3" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_AMT3" name="TXBS_AMT3" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" style="padding: 0">(30)</th>
                                            <td>
                                                <th scope="row" class="th_bg" style="font-size: 11px">수입금액 제외</th>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_EXCL_ITEM" name="TXBS_EXCL_ITEM" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="PRDCTN_ELMT4" name="PRDCTN_ELMT4" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_EXCL_TPBIZ_CD" name="TXBS_EXCL_TPBIZ_CD" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg" style="padding: 0">(31)</th>
                                            <td>
                                            <th scope="row" class="th_bg" style="font-size: 11px">합계</th>
                                            </td>
                                            <td>
                                                <sbux-input id="TAX_BIZ_ITEMS_SUM" name="TAX_BIZ_ITEMS_SUM" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="LABELCONTROL279" name="LABELCONTROL279" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="LABELCONTROL205" name="LABELCONTROL205" uitype="text" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td>
                                                <sbux-input id="TXBS_SUM_AMT" name="TXBS_SUM_AMT" uitype="text"
                                                            class="tpgTd" init="0" readonly
                                                            mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                                </sbux-input>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
 
                            </div>
                            <!-- 1장 E-->
                            <!-- 2장 S-->
                            <div id="tabvat_2" style="height: 500px">
                                <table class="table table-bordered tbl_fixed" style="overflow: scroll">
                                    <colgroup>
                                        <col style="width: 15%">
                                        <col style="width: 5%">
 
                                        <col style="width: 7%">
                                        <col style="width: 10%">
                                        <col style="width: 10%">
                                        <col style="width: 5%">
 
                                        <col style="width: 20%">
                                        <col style="width: 8%">
                                        <col style="width: 20%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="9">
                                            1.신고내용
                                        </th>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="9">
                                            예정신고 누락 분 명세
                                        </th>
                                        <th scope="row" class="th_bg" rowspan="6">
                                            (7)매출
                                        </th>
                                        <th scope="row" class="th_bg" colspan="4">
                                            구분
                                        </th>
                                        <th scope="row" class="th_bg">
                                            금액
                                        </th>
                                        <th scope="row" class="th_bg">
                                            세율
                                        </th>
                                        <th scope="row" class="th_bg">
                                            세액
                                        </th>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="2">
                                            과세
                                        </th>
                                        <th scope="row" class="th_bg" colspan="2">
                                            세금계산서
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (32)
                                        </th>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2">
                                            기타
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (33)
                                        </th>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="2">
                                            영세율
                                        </th>
                                        <th scope="row" class="th_bg" colspan="2">
                                            세금계산서
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0 !important;">
                                            (34)
                                        </th>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2">
                                            기타
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (35)
                                        </th>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            합계
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (36)
                                        </th>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th rowspan="3" scope="row" class="th_bg">
                                            (12)매입
                                        </th>
                                        <th rowspan="row" class="th_bg" colspan="3">
                                            세금계산
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (37)
                                        </th>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th rowspan="row" class="th_bg" colspan="3">
                                            기타공제매입세
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (38)
                                        </th>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th rowspan="row" class="th_bg" colspan="3">
                                            합계
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (39)
                                        </th>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="TXBS_EXCL_AMT" name="TXBS_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="10" colspan="2">
                                            (14)그 밖의 공제 매입세액 명세
                                        </th>
                                        <th scope="row" class="th_bg" colspan="4">
                                            구분
                                        </th>
                                        <th scope="row" class="th_bg">
                                            금액
                                        </th>
                                        <th scope="row" class="th_bg">
                                            세율
                                        </th>
                                        <th scope="row" class="th_bg">
                                            세액
                                        </th>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2" rowspan="2">
                                            신용카드매출전표등 수령명세서 제출분
                                        </th>
                                        <th scope="row" class="th_bg">
                                            일반매입
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (40)
                                        </th>
                                        <td>
                                            <sbux-input id="ETC_INPTVAT_CARD_GNRL_AMT" name="ETC_INPTVAT_CARD_GNRL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABEL_CONTROLLER172" name="LABEL_CONTROLLER172" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="ETC_INPTVAT_CARD_GNRL_TXAMT" name="ETC_INPTVAT_CARD_GNRL_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg">
                                            고정자산 매입
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (41)
                                        </th>
                                        <td>
                                            <sbux-input id="ETC_INPTVAT_CARD_AST_AMT" name="ETC_INPTVAT_CARD_AST_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL171" name="LABEL_CONTROLLER172" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="ETC_INPTVAT_CARD_AST_TXAMT" name="ETC_INPTVAT_CARD_AST_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            의제매입세
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (42)
                                        </th>
                                        <td>
                                            <sbux-input id="ETC_INPTVAT_DMINPT_AMT" name="ETC_INPTVAT_DMINPT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            뒤쪽참조
                                        </td>
                                        <td>
                                            <sbux-input id="ETC_INPTVAT_DMINPT_TXAMT" name="ETC_INPTVAT_DMINPT_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            재활용폐자원등매입세액
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (43)
                                        </th>
                                        <td>
                                            <sbux-input id="ETC_DDC_RUSE_AMT" name="ETC_DDC_RUSE_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            뒤쪽참조
                                        </td>
                                        <td>
                                            <sbux-input id="ETC_DDC_RUSE_TXAMT" name="ETC_DDC_RUSE_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            과세사업전환매입세액
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (44)
                                        </th>
                                        <td>
                                            <sbux-input id="LABELCONTROL198" name="LABELCONTROL198" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL167" name="LABELCONTROL167" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="ETC_DDC_SWIC_TXAMT" name="ETC_DDC_SWIC_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            재고매입세
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (45)
                                        </th>
                                        <td>
                                            <sbux-input id="LABELCONTROL199" name="LABELCONTROL199" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL166" name="LABELCONTROL166" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="ETC_DDC_INVT_TXAMT" name="ETC_DDC_INVT_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            변제대손세
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (46)
                                        </th>
                                        <td>
                                            <sbux-input id="LABELCONTROL200" name="LABELCONTROL200" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL165" name="LABELCONTROL165" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="ETC_DDC_BADDT_TXAMT" name="ETC_DDC_BADDT_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            외국인 관광객에 대한 환급세
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (47)
                                        </th>
                                        <td>
                                            <sbux-input id="LABELCONTROL201" name="LABELCONTROL201" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL92" name="LABELCONTROL92" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="FRGNR_RMBR_TXAMT" name="FRGNR_RMBR_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            합계
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (48)
                                        </th>
                                        <td>
                                            <sbux-input id="APS_ETC_DDC_AMT" name="APS_ETC_DDC_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL164" name="LABELCONTROL164" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="APS_ETC_DDC_VAT_AMT" name="APS_ETC_DDC_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="5" colspan="2">
                                            (16)공제받지 못할 매입세액 명세
                                        </th>
                                        <th scope="row" class="th_bg" colspan="4">
                                            구분
                                        </th>
                                        <th scope="row" class="th_bg">
                                            금액
                                        </th>
                                        <th scope="row" class="th_bg">
                                            세율
                                        </th>
                                        <th scope="row" class="th_bg">
                                            세액
                                        </th>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            공제받지 못할 매입세
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (49)
                                        </th>
                                        <td>
                                            <sbux-input id="APS_NDDC_DTL_VAT_AMT" name="APS_NDDC_DTL_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL96" name="LABELCONTROL96" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="NDDC_INPTVAT_DTL_TXAMT" name="NDDC_INPTVAT_DTL_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            공통매입세액면세사업
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (50)
                                        </th>
                                        <td>
                                            <sbux-input id="APS_NDDC_COM_AMT" name="APS_NDDC_COM_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL95" name="LABELCONTROL95" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="NDDC_INPTVAT_COM_TXAMT" name="NDDC_INPTVAT_COM_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            대손처분받은세
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (51)
                                        </th>
                                        <td>
                                            <sbux-input id="NDDC_BADDT_AMT" name="NDDC_BADDT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL94" name="LABELCONTROL94" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="NDDC_BADDT_TXAMT" name="NDDC_BADDT_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            합계
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (52)
                                        </th>
                                        <td>
                                            <sbux-input id="APS_NDDC_AMT" name="APS_NDDC_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL89" name="LABELCONTROL89" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="APS_NDDC_VAT_AMT" name="APS_NDDC_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="7" colspan="2">
                                            (18)그밖의경감·공제세액명세
                                        </th>
                                        <th scope="row" class="th_bg" colspan="4">
                                            구분
                                        </th>
                                        <th scope="row" class="th_bg">
                                            금액
                                        </th>
                                        <th scope="row" class="th_bg">
                                            세율
                                        </th>
                                        <th scope="row" class="th_bg">
                                            세액
                                        </th>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            전자신고세액공제
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (53)
                                        </th>
                                        <td>
                                            <sbux-input id="LABELCONTROL203" name="LABELCONTROL203" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL102" name="LABELCONTROL102" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="ETC_ELCTRN_RPT_DDC_TXAMT" name="ETC_ELCTRN_RPT_DDC_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            전자세금 계산서 발급세액 공제
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (54)
                                        </th>
                                        <td>
                                            <sbux-input id="LABELCONTROL204" name="LABELCONTROL204" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL101" name="LABELCONTROL101" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="ETC_ELCTRN_TXIV_RDCTN_TXAMT" name="ETC_ELCTRN_TXIV_RDCTN_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                           택시운송사업자 경감세
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (55)
                                        </th>
                                        <td>
                                            <sbux-input id="LABELCONTROL210" name="LABELCONTROL210" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL100" name="LABELCONTROL100" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="ETC_DDC_TRSPRT_TXAMT" name="ETC_DDC_TRSPRT_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            현금영수증 사업자 세액공제
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (56)
                                        </th>
                                        <td>
                                            <sbux-input id="LABELCONTROL209" name="LABELCONTROL209" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL130" name="LABELCONTROL130" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="ETC_CASH_VAT_TXAMT" name="ETC_CASH_VAT_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                           기타
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (57)
                                        </th>
                                        <td>
                                            <sbux-input id="LABELCONTROL248" name="LABELCONTROL248" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL133" name="LABELCONTROL133" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="ETC_RDCTN_TXAMT_DSCTN_AMT" name="ETC_RDCTN_TXAMT_DSCTN_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            합계
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (58)
                                        </th>
                                        <td>
                                            <sbux-input id="LABELCONTROL211" name="LABELCONTROL211" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="LABELCONTROL218" name="LABELCONTROL218" uitype="text" class="form-control input-sm"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="RDCTN_ETC_DDC_TXAMT" name="RDCTN_ETC_DDC_TXAMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="20" colspan="2">
                                            (25)가산세명세
                                        </th>
                                        <th scope="row" class="th_bg" colspan="4">
                                            구분
                                        </th>
                                        <th scope="row" class="th_bg">
                                            금액
                                        </th>
                                        <th scope="row" class="th_bg">
                                            세율
                                        </th>
                                        <th scope="row" class="th_bg">
                                            세액
                                        </th>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            사업자미등록등
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (59)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_UNREG_AMT" name="ADDTX_UNREG_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            1/100
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_UNREG_VAT_AMT" name="ADDTX_UNREG_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="3">
                                            세금계산서
                                        </th>
                                        <th scope="row" class="th_bg" colspan="2">
                                            지연발급등
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (60)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_ETXIV_DLY_ISSU_AMT" name="ADDTX_ETXIV_DLY_ISSU_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            1/100
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_ETXIV_DLY_ISSU_VAT_AMT" name="ADDTX_ETXIV_DLY_ISSU_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2">
                                            지연수취
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (61)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_ETXIV_DLY_RCPTN_AMT" name="ADDTX_ETXIV_DLY_RCPTN_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            5/1000
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_ETXIV_DLY_RCPTN_VAT_AMT" name="ADDTX_ETXIV_DLY_RCPTN_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2">
                                           미발급등
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (62)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_ETXIV_NISSU_AMT" name="ADDTX_ETXIV_NISSU_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            2/100
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_ETXIV_NISSU_VAT_AMT" name="ADDTX_ETXIV_NISSU_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="2">
                                            전자세금계산서 발급명세 전송
                                        </th>
                                        <th scope="row" class="th_bg" colspan="2">
                                            지연전송
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (63)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_DLY_ISSU_AMT" name="ADDTX_DLY_ISSU_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            5/1000
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_DLY_ISSU_VAT_AMT" name="ADDTX_DLY_ISSU_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2">
                                            미전송
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (64)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_ETXIV_NTRSM_AMT" name="ADDTX_ETXIV_NTRSM_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            1/100
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_ETXIV_NTRSM_VAT_AMT" name="ADDTX_ETXIV_NTRSM_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="2">
                                            세금계산서 합계표
                                        </th>
                                        <th scope="row" class="th_bg" colspan="2">
                                            제출 불성실
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (65)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_ETXIV_NPRT_AMT" name="ADDTX_ETXIV_NPRT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            5/1000
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_ETXIV_NPRT_VAT_AMT" name="ADDTX_ETXIV_NPRT_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2">
                                            지연제출
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (66)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_ETXIV_DLY_RPT_AMT" name="ADDTX_ETXIV_DLY_RPT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            3/1000
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_ETXIV_DLY_RPT_VAT_AMT" name="ADDTX_ETXIV_DLY_RPT_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="4">
                                            신고불성실
                                        </th>
                                        <th scope="row" class="th_bg" colspan="2">
                                            무신고(일반)
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (67)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_NPRT_GNRL_AMT" name="ADDTX_NPRT_GNRL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            뒤쪽참조
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_NPRT_GNRL_VAT_AMT" name="ADDTX_NPRT_GNRL_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2">
                                            무신고(부당)
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (68)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_NPRT_INJSTCL_AMT" name="ADDTX_NPRT_INJSTCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            뒤쪽참조
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_NPRT_INJSTCL_VAT_AMT" name="ADDTX_NPRT_INJSTCL_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2">
                                            과소,초과환급신고(일반)
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (69)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_UNSTLD_GNRL_AMT" name="ADDTX_UNSTLD_GNRL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            뒤쪽참조
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_UNSTLD_GNRL_VAT_AMT" name="ADDTX_UNSTLD_GNRL_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2">
                                            과소,초과환급신고(부당)
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (70)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_UNSTLD_INJSTC_AMT" name="ADDTX_UNSTLD_INJSTC_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            뒤쪽참조
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_UNSTLD_INJSTC_VAT_AMT" name="ADDTX_UNSTLD_INJSTC_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            난부불성
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (71)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_PAY_AMT" name="ADDTX_PAY_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            뒤쪽참조
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_PAY_VAT_AMT" name="ADDTX_PAY_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            영세율과세표준신고불성실
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                           (72)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_ZRT_TXBS_RPT_AMT" name="ADDTX_ZRT_TXBS_RPT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            5/1000
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_ZRT_TXBS_RPT_VAT_AMT" name="ADDTX_ZRT_TXBS_RPT_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            현금매출 명세서 미제출
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (73)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_CASH_STTS_AMT" name="ADDTX_CASH_STTS_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            1/100
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_CASH_STTS_VAT_AMT" name="ADDTX_CASH_STTS_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            부동산 임대공급 가액명세서 불성실
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (74)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_REST_RNT_AMT" name="ADDTX_REST_RNT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            1/100
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_REST_RNT_VAT_AMT" name="ADDTX_REST_RNT_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="2">
                                            매입자 납부특례
                                        </th>
                                        <th scope="row" class="th_bg" colspan="2">
                                            거래계좌 미사용
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (75)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_DSCS_BACNT_AMT" name="ADDTX_DSCS_BACNT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            뒤쪽참조
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_DSCS_BACNT_VAT_AMT" name="ADDTX_DSCS_BACNT_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2">
                                            거래계좌 지연입금
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (76)
                                        </th>
                                        <td>
                                            <sbux-input id="ADDTX_BACNT_AMT" name="ADDTX_BACNT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            뒤쪽참조
                                        </td>
                                        <td>
                                            <sbux-input id="ADDTX_BACNT_VAT_AMT" name="ADDTX_BACNT_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            합계
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important;">
                                            (77)
                                        </th>
                                        <td>
                                            <sbux-input id="LABEL_CONTROL202" name="LABEL_CONTROL202" uitype="text">㉳</sbux-input>
                                        </td>
                                        <td>
                                            1/100
                                        </td>
                                        <td>
                                            <sbux-input id="ADTN_VAT_AMT" name="ADTN_VAT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
 
                            </div>
                            <!-- 2장 E-->
                            <!-- 3장 S-->
                            <div id="tabvat_3" style="height: 500px">
                                <table class="table table-bordered tbl_fixed" style="overflow: scroll">
                                    <colgroup>
                                        <col style="width: 12%">
 
                                        <col style="width: 7%">
                                        <col style="width: 15%">
 
                                        <col style="width: 22%">
                                        <col style="width: 22%">
                                        <col style="width: 22%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row" class="th_bg" rowspan="5">
                                            면세사업 수입금액
                                        </th>
                                        <th scope="row" class="th_bg" colspan="2">
                                            업태
                                        </th>
                                        <th scope="row" class="th_bg">
                                            종목
                                        </th>
                                        <th scope="row" class="th_bg">
                                            코드번호
                                        </th>
                                        <th scope="row" class="th_bg">
                                            금액
                                        </th>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" style="padding: 0!important">
                                            (78)
                                        </th>
                                        <td>
                                            <sbux-input id="EXMPTN_BIZ_CTRGY" name="EXMPTN_BIZ_CTRGY" uitype="text"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="EXMPTN_BIZ_ITEM" name="EXMPTN_BIZ_ITEM" uitype="text"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="EXMPTN_BIZ_CD" name="EXMPTN_BIZ_CD" uitype="text"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="EXMPTN_BIZ_AMT" name="EXMPTN_BIZ_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" style="padding: 0!important">
                                            (79)
                                        </th>
                                        <td>
                                            <sbux-input id="EXMPTN_BIZ_CTGRY2" name="EXMPTN_BIZ_CTGRY2" uitype="text"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="EXMPTN_BIZ_ITEM2" name="EXMPTN_BIZ_ITEM2" uitype="text"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="EXMPTN_BIZ_CD2" name="EXMPTN_BIZ_CD2" uitype="text"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="EXMPTN_BIZ_AMT2" name="EXMPTN_BIZ_AMT2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" style="padding: 0!important">
                                            (80)
                                        </th>
                                        <td>
                                            수익금액 제외
                                        </td>
                                        <td>
                                            <sbux-input id="EXMPTN_EXCL_ITEM" name="EXMPTN_EXCL_ITEM" uitype="text"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="EXMPTN_EXCL_CD" name="EXMPTN_EXCL_CD" uitype="text"></sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="EXMPTN_EXCL_AMT" name="EXMPTN_EXCL_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2" style="padding: 0!important">
 
                                        </th>
                                        <th scope="row" class="th_bg">
 
                                        </th>
                                        <th scope="row" class="th_bg" style="padding: 0!important; font-width: bold;">
                                            (81)합계
                                        </th>
                                        <td>
                                            <sbux-input id="EXMPTN_BIZ_SUM_AMT" name="EXMPTN_BIZ_SUM_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="2" rowspan="2">
                                            계산서 교부 및 수취명세
                                        </th>
                                        <th scope="row" class="th_bg" colspan="3">
                                            (82) 계산서 발급금액
                                        </th>
                                        <td>
                                            <sbux-input id="EXMPTN_ISSU_AMT" name="EXMPTN_ISSU_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row" class="th_bg" colspan="3">
                                            (83) 계산서 수취금액
                                        </th>
                                        <td>
                                            <sbux-input id="EXMPTN_RCPT_AMT" name="EXMPTN_RCPT_AMT" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <table class="table tbl_fixed" style="margin-top: 10px; border: 0!important;">
                                   <colgroup>
                                       <col style="width: 19%">
                                       <col style="width: 81%">
                                   </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row">
                                            일반과세자구분
                                        </th>
                                        <td class="td_input">
                                            <div style="width: 40%">
                                                <sbux-select id="TXPR_TYPE" name="TXPR_TYPE" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD">
                                                </sbux-select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            환급은행
                                        </th>
                                        <td class="td_input">
                                            <div style="display: flex; gap: 5px">
                                                <sbux-input id="srch-pop-subCode" name="srch-pop-subCode" uitype="text" class="form-control input-sm" wrap-style="flex-basis:30%"></sbux-input>
                                                <div style="display: flex;position: relative">
                                                    <sbux-input id="srch-pop-subName" name="srch-pop-subName" uitype="text" class="form-control input-sm"></sbux-input>
                                                    <sbux-button
                                                            id="srch-btn-txtcreated-dept"
                                                            text="" uitype="modal"
                                                            target-id="modal-compopup1"
                                                            onclick="fn_compopup1"
                                                            style="width: 1vw;background-image:url('/static/resource/svg/dot_w.svg');background-repeat: no-repeat; background-position: center;
                                                    background-size: contain; position: absolute; right: 1px; top: 1px; bottom: 1px; border: 0; background-color: white;"
                                                    ></sbux-button>
<%--                                                    <button style="width: 1vw;background-image:url('/static/resource/svg/dot_w.svg');background-repeat: no-repeat; background-position: center;--%>
<%--                                                    background-size: contain; position: absolute; right: 1px; top: 1px; bottom: 1px; border: 0; background-color: white;" onclick="fn_compopup1()"></button>--%>
                                                </div>
                                                <sbux-input id="srch-pop-branchName" name="srch-pop-branchName" uitype="text" class="form-control input-sm" wrap-style="flex-basis:30%"></sbux-input>
                                                <label style="line-height: 2.4">지점</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            환급 계좌번호
                                        </th>
                                        <td>
                                            <sbux-input id="srch-inp-bizRegno" name="srch-inp-bizRegno" uitype="text" class="form-control input-sm" style="width: 35%"></sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            폐업일자
                                        </th>
                                        <td class="td_input">
                                            <div style="width: 30%">
                                                <sbux-select id="1TAXPAYER_TYPE" name="1TAXPAYER_TYPE" uitype="single" jsondata-ref="jsonLimitRate"
                                                             jsondata-text="CD_NM" jsondata-value="SBSD_CD">
                                                </sbux-select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            폐업사유
                                        </th>
                                        <td>
                                            <sbux-input id="1srch-inp-bizRegno" name="1srch-inp-bizRegno" uitype="text" class="form-control input-sm" style="width: 35%"></sbux-input>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- 3장 S-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div>
    <sbux-modal style="width:700px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>
 
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
        SBUxMethod.set('srch-dtp-yyyy',gfn_dateToYear(new Date()));
        /** 한도율 **/
        jsonLimitRateData = await gfnma_getComList('L_FIT027','',gv_ma_selectedCorpCd,gv_ma_selectedClntCd,'CO_CD',"CORP_NM");
        jsonLimitRate = jsonLimitRateData.cv_1;
        SBUxMethod.refresh('DMINPT_TRGT_LIM_RT');
        SBUxMethod.set('DMINPT_TRGT_LIM_RT','3');
        SBUxMethod.refresh('LMT_RT');
        SBUxMethod.set('LMT_RT','3');
 
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
                    if(workType === 'Q'){
                        let resultObj = data.cv_2[0];
                        for(let key in resultObj){
                            let elId = "#" + gfnma_snakeToCamel(key);
                            $(elId).val(parseInt(resultObj[key]));
                        }
                    }else{
                        let resultObj = data.cv_3[0];
                        for(let key in resultObj){
                            let elId = "#" + gfnma_snakeToCamel(key);
                            $(elId).val(parseInt(resultObj[key]));
                        }
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
    function fn_reset(){
        gfnma_multiSelectSet('#src-btn-currencyCode','', '', '');
        SBUxMethod.set("srch-dtp-ymdstandardTermFr","");
        SBUxMethod.set("srch-dtp-ymdstandardTermTo","");
 
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
                    let elId = "#" + gfnma_snakeToCamel(key);
                    $(elId).val(parseInt(resultObj[key]));
                }
                jsonGrdAr = data.cv_3;
                grdAr.rebuild();
            }else{
                let resultObj = data.cv_4[0];
                for(let key in resultObj){
                    let elId = "#" + gfnma_snakeToCamel(key) + '2';
                    $(elId).val(parseInt(resultObj[key]));
                }
                jsonGrdAp = data.cv_5;
                grdAp.rebuild();
            }
        }
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
            ,V_P_AR_AP_TYPE         : ''
            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''
        }
 
        let postFlag = gfnma_getTableElement("srchTable","srch-",paramObj,"V_P_",['taxSiteName','bizRegno']);
        paramObj.V_P_SEQ = gfnma_multiSelectGet('#src-btn-currencyCode');
        let arapType = SBUxMethod.get('tabVATtax') === 'tpgAR'? 'AR_TAX_BILL':'AP_TAX_BILL';
        paramObj.V_P_AR_AP_TYPE = arapType;
        let workType = SBUxMethod.get('tabVATtax') === 'tpgAR'? 'Q':'Q1';
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2110.do", {
            getType				: 'json',
            cv_count			: '13',
            workType            : workType,
            params				: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
        if(data.resultStatus === 'S'){
            if(workType === 'Q'){
                let resultObj = data.cv_2[0];
                for(let key in resultObj){
                    let elId = "#" + gfnma_snakeToCamel(key);
                    $(elId).val(parseInt(resultObj[key]));
                }
            }else{
                let resultObj = data.cv_3[0];
                for(let key in resultObj){
                    let elId = "#" + gfnma_snakeToCamel(key);
                    $(elId).val(parseInt(resultObj[key]));
                }
            }
        }
    }
    const fn_openPopup = function(){
        SBUxMethod.openModal('wholePaySitePopup');
        popFit2100.fn_init(dblclick);
    }
    var fn_compopup1 = function() {
 
        //type A 형 팝업
 
        var searchCode      = gfnma_nvl(SBUxMethod.get("srch-pop-subCode"));
        var searchName 		= gfnma_nvl(SBUxMethod.get("srch-pop-subName"));
        var replaceText0 	= "_SBSD_CD_";
        var replaceText1 	= "_SUB_NAME_";
        var strWhereClause 	= "AND A.SBSD_CD LIKE '%" + replaceText0 + "%' AND A.SUB_NAME LIKE '%" + replaceText1 + "%' ";
 
        SBUxMethod.attr('modal-compopup1', 'header-title', '공통은행정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_FIT037'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", 	"은행명"]
            ,searchInputFields		: ["SBSD_CD", 	"SUB_NAME"]
            ,searchInputValues		: [searchCode,	searchName]
            ,width					: '600px'
            ,height					: '400px'
            ,tableHeader			: ["은행코드", 	"환급은행명"]
            ,tableColumnNames		: ["SBSD_CD", 	"CD_NM"]
            ,tableColumnWidths		: ["100px", 	"150px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('srch-pop-subCode', data.SBSD_CD);
                SBUxMethod.set('srch-pop-subName', data.CD_NM);
            },
        });
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
