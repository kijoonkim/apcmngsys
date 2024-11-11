<%
    /**
     * @Class Name 		: fit2140.jsp
     * @Description 	: 세금계산서합계표(매입매출) 화면
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
                            <sbux-input readonly id="srch-dtp-ymdstandardTermFr" uitype="text" style="text-align: center" class="form-control input-sm"></sbux-input>
                            <p style="text-align: center;line-height: 30px">~</p>
                            <sbux-input readonly id="srch-dtp-ymdstandardTermTo" uitype="text" style="text-align: center" class="form-control input-sm"></sbux-input>
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
                            <li><span>사업장 리스트</span></li>
                        </ul>
                    </div>
                    <div id="sb-area-grdListGrid" style="width: 100%"></div>
                </div>
                <div id="resizer"></div>
                <div style="padding: 10px;flex: 1;display: flex;flex-direction: column">
                    <div style="flex: 1">
                        <div style="flex: 1">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>세금계산서합계표</span></li>
                                </ul>
                            </div>
                        </div>
                        <sbux-tabs id="tabVATtax" name="tabVATtax" uitype="normal" is-scrollable="false"
                                   title-target-id-array="tpgAR^tpgAP" callback-after-select="fn_afterSelectTab"
                                   title-text-array="매출^매입">
                        </sbux-tabs>
                        <div class="tab-content" style="height: auto">
                            <div id="tpgAR">
                                <table style="width: 100%;text-align: center">
                                    <colgroup>
                                        <col style="width: 20%">
                                        <col style="width: 20%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <td colspan="2">구&emsp;&emsp;&emsp;&emsp;분</td>
                                        <td>매출처수</td>
                                        <td>매수</td>
                                        <td>공급가액</td>
                                        <td>세액</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">합&emsp;&emsp;&emsp;&emsp;계</td>
                                        <td>
                                            <sbux-input id="totalCustomerCnt" name="totalCustomerCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="totalBillCnt" name="totalBillCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="totalSupplyAmt" name="totalSupplyAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="totalVatAmt" name="totalVatAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="3">과세기간 종료일 다음 달11일까지 전송된 전자세금 계산서 발급분</td>
                                        <td>사업자등록번호 발급분</td>
                                        <td>
                                            <sbux-input id="etaxCorpRegnoCustomerCnt" name="etaxCorpRegnoCustomerCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxCorpRegnoBillCnt" name="etaxCorpRegnoBillCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxCorpRegnoSupplyAmt" name="etaxCorpRegnoSupplyAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxCorpRegnoVatAmt" name="etaxCorpRegnoVatAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>주민등록번호 발급분</td>
                                        <td>
                                            <sbux-input id="etaxResidentRegnoCustomerC" name="etaxResidentRegnoCustomerC" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxResidentRegnoBillCnt" name="etaxResidentRegnoBillCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxResidentRegnoSupplyAmt" name="etaxResidentRegnoSupplyAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxResidentRegnoVatAmt" name="etaxResidentRegnoVatAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>소계</td>
                                        <td>
                                            <sbux-input id="etaxSumCustomerCnt" name="etaxSumCustomerCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxSumBillCnt" name="etaxSumBillCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxSumSupplyAmt" name="etaxSumSupplyAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxSupplyVatAmt" name="etaxSupplyVatAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="3">위 전자세금계산서 외의 발급분</td>
                                        <td>사업자등록번호 발급분</td>
                                        <td>
                                            <sbux-input id="corpRegnoCustomerCnt" name="corpRegnoCustomerCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="corpRegnoBillCnt" name="corpRegnoBillCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="corpRegnoSupplyAmt" name="corpRegnoSupplyAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="corpRegnoVatAmt" name="corpRegnoVatAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>주민등록번호 발급분</td>
                                        <td>
                                            <sbux-input id="residentRegnoCustomerCnt" name="residentRegnoCustomerCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="residentRegnoBillCnt" name="residentRegnoBillCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="residentRegnoSupplyAmt" name="residentRegnoSupplyAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="residentRegnoVatAmt" name="residentRegnoVatAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>소계</td>
                                        <td>
                                            <sbux-input id="sumCustomerCnt" name="sumCustomerCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="sumBillCnt" name="sumBillCnt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="sumSupllyAmt" name="sumSupllyAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="supplyVatAmt" name="supplyVatAmt" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li><span>과세기간 종료일 다음달 11일까지 전송된 전자세금계산서외 발급분 매출처별 명세</span></li>
                                    </ul>
                                </div>
                                <div id="sb-area-grdAr" style="width: 100%; height: 100%"></div>
                            </div>
                            <div id="tpgAP">
                                <table style="width: 100%;text-align: center">
                                    <colgroup>
                                        <col style="width: 20%">
                                        <col style="width: 20%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                        <col style="width: 15%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <td colspan="2">구&emsp;&emsp;&emsp;&emsp;분</td>
                                        <td>매출처수</td>
                                        <td>매수</td>
                                        <td>공급가액</td>
                                        <td>세액</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">합&emsp;&emsp;&emsp;&emsp;계</td>
                                        <td>
                                            <sbux-input id="totalCustomerCnt2" name="totalCustomerCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="totalBillCnt2" name="totalBillCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="totalSupplyAmt2" name="totalSupplyAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="totalVatAmt2" name="totalVatAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="3">과세기간 종료일 다음 달11일까지 전송된 전자세금 계산서 발급분</td>
                                        <td>사업자등록번호 발급분</td>
                                        <td>
                                            <sbux-input id="etaxCorpRegnoCustomerCnt2" name="etaxCorpRegnoCustomerCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxCorpRegnoBillCnt2" name="etaxCorpRegnoBillCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxCorpRegnoSupplyAmt2" name="etaxCorpRegnoSupplyAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxCorpRegnoVatAmt2" name="etaxCorpRegnoVatAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>주민등록번호 발급분</td>
                                        <td>
                                            <sbux-input id="etaxResidentRegnoCustomerC2" name="etaxResidentRegnoCustomerC2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxResidentRegnoBillCnt2" name="etaxResidentRegnoBillCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxResidentRegnoSupplyAmt2" name="etaxResidentRegnoSupplyAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxResidentRegnoVatAmt2" name="etaxResidentRegnoVatAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>소계</td>
                                        <td>
                                            <sbux-input id="etaxSumCustomerCnt2" name="etaxSumCustomerCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxSumBillCnt2" name="etaxSumBillCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxSumSupplyAmt2" name="etaxSumSupplyAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="etaxSupplyVatAmt2" name="etaxSupplyVatAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td rowspan="3">위 전자세금계산서 외의 발급분</td>
                                        <td>사업자등록번호 발급분</td>
                                        <td>
                                            <sbux-input id="corpRegnoCustomerCnt2" name="corpRegnoCustomerCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="corpRegnoBillCnt2" name="corpRegnoBillCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="corpRegnoSupplyAmt2" name="corpRegnoSupplyAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="corpRegnoVatAmt2" name="corpRegnoVatAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>주민등록번호 발급분</td>
                                        <td>
                                            <sbux-input id="residentRegnoCustomerCnt2" name="residentRegnoCustomerCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="residentRegnoBillCnt2" name="residentRegnoBillCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="residentRegnoSupplyAmt2" name="residentRegnoSupplyAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="residentRegnoVatAmt2" name="residentRegnoVatAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>소계</td>
                                        <td>
                                            <sbux-input id="sumCustomerCnt2" name="sumCustomerCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="sumBillCnt2" name="sumBillCnt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="sumSupllyAmt2" name="sumSupllyAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                        <td>
                                            <sbux-input id="supplyVatAmt2" name="supplyVatAmt2" uitype="text"
                                                        class="tpgTd" init="0" readonly
                                                        mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                                            </sbux-input>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li><span>과세기간 종료일 다음달 11일까지 전송된 전자세금계산서외 발급분 매입처별 명세</span></li>
                                    </ul>
                                </div>
                                <div id="sb-area-grdAp" style="width: 100%; height: 100%"></div>
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

    var jsonCorpNm = [];
    var jsonGrdList = [];
    var jsonGrdAr = [];
    var jsonGrdAp = [];

    var grdListGrid;
    var grdAr;
    var grdAp;

    window.addEventListener("DOMContentLoaded",function(e){
        fn_createGrid();
        fn_createGridAr();
        fn_createGridAp();
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
    async function fn_choice(_value){
        /** reset **/
       let tabType = SBUxMethod.get('tabVATtax');
       let inputs;
       if(tabType === 'tpgAR'){
           inputs = document.querySelectorAll("#tpgAR input");
           jsonGrdAr.length = 0;
           grdAr.rebuild();
       }else{
           inputs = document.querySelectorAll("#tpgAP input");
           jsonGrdAp.length = 0;
           grdAp.rebuild();
       }
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
            ,V_P_AR_AP_TYPE         : ''
            ,V_P_FORM_ID            : p_formId
            ,V_P_MENU_ID            : p_menuId
            ,V_P_PROC_ID            : ''
            ,V_P_USERID             : ''
            ,V_P_PC                 : ''
        }

        let postFlag = gfnma_getTableElement("srchTable","srch-",paramObj,"V_P_",['taxSiteName','bizRegno']);
        paramObj.V_P_SEQ = _value;
        let arapType = SBUxMethod.get('tabVATtax') === 'tpgAR'? 'AR_TAX_BILL':'AP_TAX_BILL';
        paramObj.V_P_AR_AP_TYPE = arapType;

        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2110.do", {
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
                let workType = SBUxMethod.get('tabVATtax') === 'tpgAR'? 'Q':'Q1';
                paramObj.V_P_TAX_SITE_CODE = grdListGrid.getRowData(1).TAX_SITE_CODE;
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
    const fn_createGridAr = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdAr';
        SBGridProperties.id = 'grdAr';
        SBGridProperties.jsonref = 'jsonGrdAr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['순번'],               ref : 'TAX_BILL_SEQ',        width : '10%',    style : 'text-align:center',    type : 'output'},
            {caption : ['사업자번호'],          ref : 'BIZ_REGNO',      width : '20%',   style : 'text-align:center',    type : 'output'},
            {caption : ['상호(법인명)'],          ref : 'CS_NAME',      width : '30%',   style : 'text-align:center',    type : 'output'},
            {caption : ['매수'],          ref : 'BILL_CNT',      width : '10%',   style : 'text-align:center',    type : 'output'},
            {caption : ['공급가액'],          ref : 'SUPPLY_AMT',      width : '15%',   style : 'text-align:center',    type : 'output'},
            {caption : ['세액'],          ref : 'VAT_AMT',      width : '15%',   style : 'text-align:center',    type : 'output'},
        ];
        grdAr = _SBGrid.create(SBGridProperties);
    }
    const fn_createGridAp = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdAp';
        SBGridProperties.id = 'grdAp';
        SBGridProperties.jsonref = 'jsonGrdAp';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['순번'],               ref : 'TAX_BILL_SEQ',        width : '10%',    style : 'text-align:center',    type : 'output'},
            {caption : ['사업자번호'],          ref : 'BIZ_REGNO',      width : '20%',   style : 'text-align:center',    type : 'output'},
            {caption : ['상호(법인명)'],          ref : 'CS_NAME',      width : '30%',   style : 'text-align:center',    type : 'output'},
            {caption : ['매수'],          ref : 'BILL_CNT',      width : '10%',   style : 'text-align:center',    type : 'output'},
            {caption : ['공급가액'],          ref : 'SUPPLY_AMT',      width : '15%',   style : 'text-align:center',    type : 'output'},
            {caption : ['세액'],          ref : 'VAT_AMT',      width : '15%',   style : 'text-align:center',    type : 'output'},
        ];
        grdAp = _SBGrid.create(SBGridProperties);
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
            ,V_P_COMP_CODE          : gv_ma_selectedApcCd
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
        let arapType = _id === 'tpgAR'? 'AR_TAX_BILL':'AP_TAX_BILL';
        let seq = gfnma_multiSelectGet("#src-btn-currencyCode");
        let workType = _id === 'tpgAR'? 'Q':'Q1';

        paramObj.V_P_AR_AP_TYPE = arapType;
        paramObj.V_P_SEQ = seq;

        /** 사업장 리스트 chk **/
        let gridIdx = grdListGrid.getRow();
        if(gridIdx < 0){
            return;
        }

        paramObj.V_P_TAX_SITE_CODE = grdListGrid.getRowData(gridIdx).TAX_SITE_CODE;

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
            ,V_P_COMP_CODE          : gv_ma_selectedApcCd
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
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
