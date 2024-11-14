<%
    /**
     * @Class Name 		: hra3610.jsp
     * @Description 	: 용역소득마스터 정보 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.11.05
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.11.05   	이경한		최초 생성
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
    <title>title : 용역소득마스터</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
        </div>
        <div class="box-body">
            <div class="box-search-ma">
                <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
                <table id="srchArea" class="table table-bordered tbl_fixed table-search-ma">
                <caption>검색 조건 설정</caption>
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
                    <th scope="row" class="th_bg">소득자 성명</th>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_EARNER_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td></td>
                    <th id="TH_SRCH_BIZ_REGNO" scope="row" class="th_bg">사업자등록번호</th>
                    <td colspan="3" id="TD_SRCH_BIZ_REGNO" class="td_input" style="border-right:hidden;">
                        <sbux-input id="SRCH_BIZ_REGNO" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                    </td>
                    <td></td>
                </tr>
                </tbody>
            </table>
            </div>
            <div class="row">
                <sbux-tabs id="tabInfo" name="tabInfo" uitype="normal" is-scrollable="false" jsondata-ref="jsonTabData" onclick="fn_clickTab"></sbux-tabs>
                <div class="tab-content">
                    <div id="tpgResident">
                        <div class="col-sm-3">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li>
                                        <span>소득자 리스트</span>
                                        <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="table-responsive tbl_scroll_sm">
                                <div id="sb-area-gvwResident" style="height:605px;"></div>
                            </div>
                        </div>
                        <div class="col-sm-9">
                            <div>
                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li>
                                            <span>소득자 정보</span>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <table id="panResidentInfo" class="table table-bordered tbl_fixed">
                                        <colgroup>
                                            <col style="width:17%">
                                            <col style="width:17%">
                                            <col style="width:3%">
                                            <col style="width:17%">
                                            <col style="width:3%">
                                            <col style="width:17%">
                                            <col style="width:17%">
                                        </colgroup>
                                        <tr>
                                            <th scope="row" class="th_bg">소득자 코드</th>
                                            <td class="td_input" style="border-right:hidden;" data-group="EARNER">
                                                <sbux-input id="EARNER_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;" data-group="EARNER">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        image-src="../../../resource/images/find2.png" image-style="width:25px;height:15px;" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findEarnerCode"
                                                ></sbux-button>
                                            </td>
                                            <th scope="row" class="th_bg">사업장</th>
                                            <td colspan="2" class="td_input">
                                                <sbux-select id="SITE_CODE" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">소득자 성명</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="EARNER_NAME1" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td></td>
                                            <th scope="row" class="th_bg">주민등록번호</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="SOCIAL_NO1" uitype="text" placeholder="" class="form-control input-sm" mask = "999999-9999999"></sbux-input>
                                                <sbux-input id="JUMIN" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">사업자등록번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="BIZ_REGNO1" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td></td>
                                            <th scope="row" class="th_bg">상호</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="COMP_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">내·외국인구분</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="FOREIGN_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="FOREIGN_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                            <th scope="row" class="th_bg">거주지국</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-select id="NATION_CODE" uitype="single" jsondata-ref="jsonNationCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">근무지역</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="WORK_REGION" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="WORK_REGION" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                            <th scope="row" class="th_bg">개인/법인 구분</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="BUSINESS_TYPE1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="BUSINESS_TYPE1" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">소득종류</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INCOME_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="INCOME_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                            <th id="LBL_INCOME_SEC" scope="row" class="th_bg">소득구분</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INCOME_SEC" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="INCOME_SEC" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">신고사업장</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-select id="TAX_SITE_CODE1" uitype="single" jsondata-ref="jsonTaxSiteCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                            </td>
                                            <td></td>
                                            <th scope="row" class="th_bg">정산주기</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="PAY_CYCLE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="PAY_CYCLE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">사업장소재지</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="SITE_ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="SITE_ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">주소</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ZIP_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ADDRESS" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">은행</th>
                                            <td class="td_input" style="border-right:hidden;" data-group="BANK">
                                                <sbux-input id="BANK_CODE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td colspan="2" class="td_input" style="border-right:hidden;" data-group="BANK">
                                                <sbux-input id="BANK_NAME" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;" data-group="BANK">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        image-src="../../../resource/images/find2.png" image-style="width:25px;height:15px;" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findBankCode"
                                                ></sbux-button>
                                            </td>
                                            <th scope="row" class="th_bg">계좌번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="BANK_ACCOUNT" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                <sbux-input id="CHK" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">휴대폰번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="MOBILE_PHONE" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td></td>
                                            <th scope="row" class="th_bg">이메일</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="EMAIL" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">전화번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="TEL" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">비고</th>
                                            <td colspan="5" class="td_input">
                                                <sbux-textarea id="MEMO" class="form-control input-sm" uitype="normal" style="width:100%"></sbux-textarea>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tpgNonresident">
                        <div class="col-sm-3">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li>
                                        <span>소득자 리스트</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="table-responsive tbl_scroll_sm">
                                <div id="sb-area-gvwNonresident" style="height:605px;"></div>
                            </div>
                        </div>
                        <div class="col-sm-9">
                            <div>
                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li>
                                            <span>소득자 정보</span>
                                        </li>
                                    </ul>
                                </div>
                                <div>
                                    <table id="grpNonresidentInfo" class="table table-bordered tbl_fixed">
                                        <colgroup>
                                            <col style="width:17%">
                                            <col style="width:17%">
                                            <col style="width:17%">
                                            <col style="width:3%">
                                            <col style="width:17%">
                                            <col style="width:17%">
                                        </colgroup>
                                        <tr>
                                            <th scope="row" class="th_bg">소득자성명(상호)</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="EARNER_NAME3" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                <sbux-input id="EARNER_CODE1" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <th scope="row" class="th_bg">주민(사업자)등록번호</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="SOCIAL_NO3" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                                <sbux-input id="SITE_CODE1" uitype="hidden" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">내·외국인구분</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="FOREIGN_TYPE1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="FOREIGN_TYPE1" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">거주지국</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <sbux-select id="NATION_CODE1" uitype="single" jsondata-ref="jsonNationCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">근무지역</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="WORK_REGION1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="WORK_REGION1" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th scope="row" class="th_bg">개인/법인 구분</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="BUSINESS_TYPE" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="BUSINESS_TYPE" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">소득종류</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INCOME_TYPE1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="INCOME_TYPE1" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                            <th id="LBL_INCOME_SEC1" scope="row" class="th_bg">소득구분</th>
                                            <td colspan="2" class="td_input" style="border-right:hidden;">
                                                <div class="dropdown">
                                                    <button style="width:100%;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="INCOME_SEC1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <font>선택</font>
                                                        <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="INCOME_SEC1" style="width:300px;height:150px;padding-top:0px;overflow:auto">
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">신고사업장</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-select id="TAX_SITE_CODE2" uitype="single" jsondata-ref="jsonTaxSiteCode" unselected-text="선택" class="form-control input-sm inpt_data_reqed" required></sbux-select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">생년월일</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-datepicker
                                                        uitype="popup"
                                                        id="BIRTHDAY"
                                                        name="BIRTHDAY"
                                                        date-format="yyyy-mm-dd"
                                                        class="form-control pull-right sbux-pik-group-apc input-sm inpt_data_reqed input-sm-ast"
                                                        style="width:100%;"
                                                />
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">소득자주소</th>
                                            <td colspan="4" class="td_input" style="border-right:hidden;">
                                                <sbux-input id="ADDRESS1" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">은행</th>
                                            <td class="td_input" style="border-right:hidden;" data-group="BANK1">
                                                <sbux-input id="BANK_CODE1" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;" data-group="BANK1">
                                                <sbux-input id="BANK_NAME1" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                            <td class="td_input" style="border-right:hidden;" data-group="BANK1">
                                                <sbux-button
                                                        class="btn btn-xs btn-outline-dark"
                                                        image-src="../../../resource/images/find2.png" image-style="width:25px;height:15px;" uitype="modal"
                                                        target-id="modal-compopup1"
                                                        onclick="fn_findBankCode1"
                                                ></sbux-button>
                                            </td>
                                            <th scope="row" class="th_bg">계좌번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="BANK_ACCOUNT1" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">전화번호</th>
                                            <td class="td_input" style="border-right:hidden;">
                                                <sbux-input id="TEL1" uitype="text" placeholder="" class="form-control input-sm"></sbux-input>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row" class="th_bg">비고</th>
                                            <td colspan="5" class="td_input">
                                                <sbux-textarea id="MEMO1" class="form-control input-sm" uitype="normal" style="width:100%"></sbux-textarea>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- 팝업 Modal -->
<div>
    <sbux-modal style="width:600px" id="modal-compopup1" name="modal-compopup1" uitype="middle" header-title="" body-html-id="body-modal-compopup1" header-is-close-button="true" footer-is-close-button="false" ></sbux-modal>
</div>
<div id="body-modal-compopup1">
    <jsp:include page="../../../com/popup/comPopup1.jsp"></jsp:include>
</div>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    var jsonTabData = [
        {"id": "0", "pid": "-1", "order": "1", "text": "거주자", "targetid": "tpgResident", "targetvalue": "거주자"},
        {"id": "1", "pid": "-1", "order": "2", "text": "비거주자", "targetid": "tpgNonresident", "targetvalue": "비거주자"},
    ];

    var jsonSiteCode = []; // 사업장
    var jsonNationCode = []; // 거주지국
    var jsonTaxSiteCode = []; // 신고사업장
    var jsonForeignType = []; // 내외국민구분
    var jsonWorkRegion = []; // 근무지역
    var jsonBusinessType = []; // 개인/법인 구분
    var jsonIncomeType = []; // 소득종류

    //grid 초기화
    var gvwResident; 			// 그리드를 담기위한 객체 선언
    var gvwNonresident;

    var jsonResidentList = []; 	// 그리드의 참조 데이터 주소 선언
    var jsonNonResidentList = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            // 사업장
            gfnma_setComSelect(['SITE_CODE', 'gvwResident'], jsonSiteCode, 'L_ORG001', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 내외국민구분
            gfnma_setComSelect(['gvwResident'], jsonForeignType, 'L_HRA006', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#FOREIGN_TYPE', '#FOREIGN_TYPE1']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA006'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                ]
            }),
            // 거주지국
            gfnma_setComSelect(['NATION_CODE', 'NATION_CODE1', 'gvwResident'], jsonNationCode, 'L_COM015', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'NATION_CODE', 'NATION_NAME', 'Y', ''),
            // 근무지역
            gfnma_setComSelect(['gvwResident'], jsonWorkRegion, 'L_HRI999', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#WORK_REGION', '#WORK_REGION1']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRI999'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                ]
            }),
            // 개인/법인 구분
            gfnma_setComSelect(['gvwResident'], jsonBusinessType, 'L_HRA014', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#BUSINESS_TYPE', '#BUSINESS_TYPE1']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA014'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                ]
            }),
            // 소득종류
            gfnma_setComSelect(['gvwResident'], jsonIncomeType, 'L_HRA020', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SUB_CODE', 'CODE_NAME', 'Y', ''),
            gfnma_multiSelectInit({
                target			: ['#INCOME_TYPE', '#INCOME_TYPE1']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA020'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                ]
                ,callback : function(data) {
                    if (gfn_nvl(data) == "") {
                        return;
                    }

                    let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));
                    if(enableTab == "tpgResident") {
                        // 23 : 기타소득 / 24 : 사업소득
                        if (gfn_nvl(data) == "23") {
                            $("#LBL_INCOME_SEC").text("소득구분");
                            fn_dynamicMultiSelect("INCOME_SEC", "L_HRA023");
                            $("#INCOME_SEC").attr("readonly", false);
                        } else if (gfn_nvl(data) == "24") {
                            $("#LBL_INCOME_SEC").text("업종구분");
                            fn_dynamicMultiSelect("INCOME_SEC", "L_HRA048");
                            $("#INCOME_SEC").attr("readonly", false);
                        } else if (gfn_nvl(data) == "40") {
                            $("#LBL_INCOME_SEC").text("소득자구분");
                            fn_dynamicMultiSelect("INCOME_SEC", "L_HRA056");
                            $("#INCOME_SEC").attr("readonly", false);
                        } else {
                            $("#LBL_INCOME_SEC").text("소득구분");
                            fn_dynamicMultiSelect("INCOME_SEC", "L_HRA023");
                            $("#INCOME_SEC").attr("readonly", true);
                        }
                    } else if(enableTab == "tpgNonresident") {
                        // 23 : 기타소득 / 24 : 사업소득
                        if (gfn_nvl(data) == "23" || gfn_nvl(data) == "24") {
                            $("#LBL_INCOME_SEC1").text("소득구분");
                            fn_dynamicMultiSelect("INCOME_SEC1", "L_HRA024");
                            $("#INCOME_SEC1").attr("readonly", false);
                        } else if (gfn_nvl(data) == "40") {
                            $("#LBL_INCOME_SEC1").text("소득자구분");
                            fn_dynamicMultiSelect("INCOME_SEC1", "L_HRA056");
                            $("#INCOME_SEC1").attr("readonly", false);
                        } else {
                            $("#LBL_INCOME_SEC1").text("소득구분");
                            fn_dynamicMultiSelect("INCOME_SEC1", "L_HRA023");
                            $("#INCOME_SEC1").attr("readonly", true);
                        }
                    }
                }
            }),
            // 소득구분
            gfnma_multiSelectInit({
                target			: ['#INCOME_SEC', '#INCOME_SEC1']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA023'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                    {caption: "세율(%)", 		ref: 'TAX_RATE',    		width:'100px',  	style:'text-align:left'},
                    {caption: "경비율(%)", 		ref: 'EXPENSE_RATE',    		width:'100px',  	style:'text-align:left'},
                ]
                ,callback : function(data) {
                    fn_callbckIncomeSec(data);
                }
            }),
            // 신고사업장
            gfnma_setComSelect(['TAX_SITE_CODE1', 'TAX_SITE_CODE2', 'gvwResident'], jsonTaxSiteCode, 'L_ORG003', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'SITE_CODE', 'SITE_NAME', 'Y', ''),
            // 정산주기
            gfnma_multiSelectInit({
                target			: ['#PAY_CYCLE']
                ,compCode		: gv_ma_selectedCorpCd
                ,clientCode		: gv_ma_selectedClntCd
                ,bizcompId		: 'L_HRA021'
                ,whereClause	: ''
                ,formId			: p_formId
                ,menuId			: p_menuId
                ,selectValue	: ''
                ,dropType		: 'down' 	// up, down
                ,dropAlign		: 'right' 	// left, right
                ,colValue		: 'SUB_CODE'
                ,colLabel		: 'CODE_NAME'
                ,columns		:[
                    {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                    {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                ]
            })
        ]);
    }

    function fn_createGvwResidentGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwResident';
        SBGridProperties.id 				= 'gvwResident';
        SBGridProperties.jsonref 			= 'jsonResidentList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["소득자코드"],         ref: 'EARNER_CODE',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["소득자 성명"],         ref: 'EARNER_NAME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["주민등록번호"],         ref: 'SOCNO',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true},
            {caption: ["주민등록번호"],         ref: 'SOCNO_REAL',    type:'output',  	width:'110px',  style:'text-align:left'},
            {caption: ["사업자등록번호"],         ref: 'BIZ_REGNO',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["상호"],         ref: 'COMP_NAME',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true},
            {caption: ["거주지국"], 		ref: 'NATION_CODE',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonNationCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["내·외국인구분"], 		ref: 'FOREI_TYPE',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonForeignType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["근무지역"], 		ref: 'WORK_REGION',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonWorkRegion',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["소득종류"], 		ref: 'INC_TYPE',   	    type:'output', style:'text-align:left' ,width: '80px', hidden: true},
            {caption: ["구분"], 		ref: 'INC_SEC',   	    type:'output', style:'text-align:left' ,width: '75px', hidden: true},
            {caption: ["우편번호"], 		ref: 'SITE_ZIP_CODE',   	    type:'output', style:'text-align:left' ,width: '80px', hidden: true},
            {caption: ["사업장소재지"], 		ref: 'SITE_ADDRESS',   	    type:'output', style:'text-align:left' ,width: '200px', hidden: true},
            {caption: ["우편번호"], 		ref: 'ZIP_CODE',   	    type:'output', style:'text-align:left' ,width: '80px', hidden: true},
            {caption: ["주소"], 		ref: 'ADDRESS',   	    type:'output', style:'text-align:left' ,width: '200px', hidden: true},
            {caption: ["개인/법인 구분"], 		ref: 'BUSINESS_TYPE',   	    type:'combo', style:'text-align:left' ,width: '60px',
                typeinfo: {
                    ref			: 'jsonBusinessType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["은행코드"], 		ref: 'BANK_CODE',   	    type:'output', style:'text-align:left' ,width: '60px', hidden: true},
            {caption: ["은행"], 		ref: 'BANK_NAME',   	    type:'output', style:'text-align:left' ,width: '120px', hidden: true},
            {caption: ["계좌번호"], 		ref: 'BANK_ACC',   	    type:'output', style:'text-align:left' ,width: '100px', hidden: true},
            {caption: ["계좌번호"], 		ref: 'BANK_ACC_REAL',   	    type:'output', style:'text-align:left' ,width: '100px', hidden: true},
            {caption: ["전화번호"], 		ref: 'TEL',   	    type:'output', style:'text-align:left' ,width: '100px', hidden: true},
            {caption: ["비고"],         ref: 'MEMO',    type:'output',  	width:'200px',  style:'text-align:left', hidden: true},
            {caption: ["신고사업장"], 		ref: 'TAX_SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonTaxSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            }
        ];

        gvwResident = _SBGrid.create(SBGridProperties);
        gvwResident.bind('click', 'fn_view');
    }

    function fn_createGvwNonresidentGrid() {
        var SBGridProperties 				= {};
        SBGridProperties.parentid 			= 'sb-area-gvwNonresident';
        SBGridProperties.id 				= 'gvwNonresident';
        SBGridProperties.jsonref 			= 'jsonNonResidentList';
        SBGridProperties.emptyrecords 		= '데이터가 없습니다.';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.extendlastcol 		= 'scroll';
        SBGridProperties.columns = [
            {caption: ["소득자코드"],         ref: 'EARNER_CODE',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["사업장"], 		ref: 'SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["소득자성명(상호)"],         ref: 'EARNER_NAME',    type:'output',  	width:'80px',  style:'text-align:left'},
            {caption: ["주민등록번호"],         ref: 'SOCNO',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true},
            {caption: ["주민(사업자)등록번호"],         ref: 'SOCNO_REAL',    type:'output',  	width:'110px',  style:'text-align:left'},
            {caption: ["사업자등록번호"],         ref: 'BIZ_REGNO',    type:'output',  	width:'100px',  style:'text-align:left'},
            {caption: ["상호"],         ref: 'COMP_NAME',    type:'output',  	width:'100px',  style:'text-align:left', hidden: true},
            {caption: ["거주지국"], 		ref: 'NATION_CODE',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonNationCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["내·외국인구분"], 		ref: 'FOREI_TYPE',   	    type:'combo', style:'text-align:left' ,width: '100px',
                typeinfo: {
                    ref			: 'jsonForeignType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["근무지역"], 		ref: 'WORK_REGION',   	    type:'combo', style:'text-align:left' ,width: '120px',
                typeinfo: {
                    ref			: 'jsonWorkRegion',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["소득종류"], 		ref: 'INC_TYPE',   	    type:'output', style:'text-align:left' ,width: '80px', hidden: true},
            {caption: ["구분"], 		ref: 'INC_SEC',   	    type:'output', style:'text-align:left' ,width: '75px', hidden: true},
            {caption: ["우편번호"], 		ref: 'SITE_ZIP_CODE',   	    type:'output', style:'text-align:left' ,width: '80px', hidden: true},
            {caption: ["사업장소재지"], 		ref: 'SITE_ADDRESS',   	    type:'output', style:'text-align:left' ,width: '200px', hidden: true},
            {caption: ["우편번호"], 		ref: 'ZIP_CODE',   	    type:'output', style:'text-align:left' ,width: '80px', hidden: true},
            {caption: ["주소"], 		ref: 'ADDRESS',   	    type:'output', style:'text-align:left' ,width: '200px', hidden: true},
            {caption: ["개인/법인 구분"], 		ref: 'BUSINESS_TYPE',   	    type:'combo', style:'text-align:left' ,width: '60px',
                typeinfo: {
                    ref			: 'jsonBusinessType',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
                , hidden: true
            },
            {caption: ["은행코드"], 		ref: 'BANK_CODE',   	    type:'output', style:'text-align:left' ,width: '60px', hidden: true},
            {caption: ["은행"], 		ref: 'BANK_NAME',   	    type:'output', style:'text-align:left' ,width: '120px', hidden: true},
            {caption: ["계좌번호"], 		ref: 'BANK_ACC',   	    type:'output', style:'text-align:left' ,width: '100px', hidden: true},
            {caption: ["계좌번호"], 		ref: 'BANK_ACCOUNT_REAL',   	    type:'output', style:'text-align:left' ,width: '100px', hidden: true},
            {caption: ["전화번호"], 		ref: 'TEL',   	    type:'output', style:'text-align:left' ,width: '100px', hidden: true},
            {caption: ["비고"],         ref: 'MEMO',    type:'output',  	width:'200px',  style:'text-align:left', hidden: true},
            {caption: ["생년월일"],         ref: 'BIRTHDAY',    type:'output',  	width:'75px',  style:'text-align:left', hidden: true},
            {caption: ["신고사업장"], 		ref: 'TAX_SITE_CODE',   	    type:'combo', style:'text-align:left' ,width: '75px',
                typeinfo: {
                    ref			: 'jsonTaxSiteCode',
                    label		: 'label',
                    value		: 'value',
                    itemcount	: 10
                }
                , disabled: true
            }
        ];

        gvwNonresident = _SBGrid.create(SBGridProperties);
        gvwNonresident.bind('click', 'fn_view');
    }

    const fn_view = async function () {
        let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));

        if(enableTab == "tpgResident") {
            var nRow = gvwResident.getRow();
            let rowData = gvwResident.getRowData(nRow);

            SBUxMethod.set("EARNER_CODE", gfn_nvl(rowData.EARNER_CODE));
            SBUxMethod.set("SITE_CODE", gfn_nvl(rowData.SITE_CODE));
            SBUxMethod.set("TAX_SITE_CODE1", gfn_nvl(rowData.TAX_SITE_CODE));
            SBUxMethod.set("EARNER_NAME1", gfn_nvl(rowData.EARNER_NAME));
            SBUxMethod.set("SOCIAL_NO1", gfn_nvl(rowData.SOCNO_REAL));
            SBUxMethod.set("BIZ_REGNO1", gfn_nvl(rowData.BIZ_REGNO));
            SBUxMethod.set("COMP_NAME", gfn_nvl(rowData.COMP_NAME));
            SBUxMethod.set("NATION_CODE", gfn_nvl(rowData.NATION_CODE));
            gfnma_multiSelectSet('#FOREIGN_TYPE', 'SUB_CODE', 'CODE_NAME', gfn_nvl(rowData.FOREI_TYPE));
            gfnma_multiSelectSet('#WORK_REGION', 'SUB_CODE', 'CODE_NAME', gfn_nvl(rowData.WORK_REGION));
            gfnma_multiSelectSet('#INCOME_TYPE', 'SUB_CODE', 'CODE_NAME', gfn_nvl(rowData.INC_TYPE));
            gfnma_multiSelectSet('#INCOME_SEC', 'SUB_CODE', 'CODE_NAME', gfn_nvl(rowData.INC_SEC));
            SBUxMethod.set("SITE_ZIP_CODE", gfn_nvl(rowData.SITE_ZIP_CODE));
            SBUxMethod.set("SITE_ADDRESS", gfn_nvl(rowData.SITE_ADDRESS));
            SBUxMethod.set("ZIP_CODE", gfn_nvl(rowData.ZIP_CODE));
            SBUxMethod.set("ADDRESS", gfn_nvl(rowData.ADDRESS));
            gfnma_multiSelectSet('#BUSINESS_TYPE1', 'SUB_CODE', 'CODE_NAME', gfn_nvl(rowData.BUSINESS_TYPE));
            SBUxMethod.set("BANK_CODE", gfn_nvl(rowData.BANK_CODE));
            SBUxMethod.set("BANK_NAME", gfn_nvl(rowData.BANK_NAME));
            SBUxMethod.set("BANK_ACCOUNT", gfn_nvl(rowData.BANK_ACC_REAL));
            SBUxMethod.set("TEL", gfn_nvl(rowData.TEL));
            SBUxMethod.set("MOBILE_PHONE", gfn_nvl(rowData.MOBILE_PHONE));
            SBUxMethod.set("EMAIL", gfn_nvl(rowData.EMAIL));
            gfnma_multiSelectSet('#PAY_CYCLE', 'SUB_CODE', 'CODE_NAME', gfn_nvl(rowData.PAY_CYCLE));
            SBUxMethod.set("MEMO", gfn_nvl(rowData.MEMO));

            SBUxMethod.set("SOCIAL_NO1", gvwResident.getCellData(nRow, gvwResident.getColRef("SOCNO_REAL")));
            SBUxMethod.set("JUMIN", "");
        } else if(enableTab == "tpgNonresident") {
            var nRow = gvwNonresident.getRow();
            let rowData = gvwNonresident.getRowData(nRow);

            SBUxMethod.set("EARNER_CODE1", gfn_nvl(rowData.EARNER_CODE));
            SBUxMethod.set("SITE_CODE1", gfn_nvl(rowData.SITE_CODE));
            SBUxMethod.set("TAX_SITE_CODE2", gfn_nvl(rowData.TAX_SITE_CODE));
            SBUxMethod.set("EARNER_NAME3", gfn_nvl(rowData.EARNER_NAME));
            SBUxMethod.set("SOCIAL_NO3", gfn_nvl(rowData.SOCNO_REAL));
            SBUxMethod.set("NATION_CODE1", gfn_nvl(rowData.NATION_CODE));
            gfnma_multiSelectSet('#FOREIGN_TYPE1', 'SUB_CODE', 'CODE_NAME', gfn_nvl(rowData.FOREI_TYPE));
            gfnma_multiSelectSet('#WORK_REGION1', 'SUB_CODE', 'CODE_NAME', gfn_nvl(rowData.WORK_REGION));
            gfnma_multiSelectSet('#INCOME_TYPE1', 'SUB_CODE', 'CODE_NAME', gfn_nvl(rowData.INC_TYPE));
            gfnma_multiSelectSet('#INCOME_SEC1', 'SUB_CODE', 'CODE_NAME', gfn_nvl(rowData.INC_SEC));
            SBUxMethod.set("ADDRESS1", gfn_nvl(rowData.ADDRESS));
            gfnma_multiSelectSet('#BUSINESS_TYPE', 'SUB_CODE', 'CODE_NAME', gfn_nvl(rowData.BUSINESS_TYPE));
            SBUxMethod.set("BANK_CODE1", gfn_nvl(rowData.BANK_CODE));
            SBUxMethod.set("BANK_NAME", gfn_nvl(rowData.BANK_NAME));
            SBUxMethod.set("BANK_ACCOUNT1", gfn_nvl(rowData.BANK_ACC_REAL));
            SBUxMethod.set("TEL1", gfn_nvl(rowData.TEL));
            SBUxMethod.set("BIRTHDAY", gfn_nvl(rowData.BIRTHDAY));
            SBUxMethod.set("MEMO1", gfn_nvl(rowData.MEMO));

            SBUxMethod.set("SOCIAL_NO3", gvwNonresident.getCellData(nRow, gvwNonresident.getColRef("SOCNO_REAL")));
        }

        SBUxMethod.attr("EARNER_CODE", "readonly", true);
    }

    const fn_clickTab = async function () {
        let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));

        if(enableTab == "tpgResident") {
            $("#TH_SRCH_BIZ_REGNO").show();
            $("#TD_SRCH_BIZ_REGNO").show();
        } else if(enableTab == "tpgNonresident") {
            $("#TH_SRCH_BIZ_REGNO").hide();
            $("#TD_SRCH_BIZ_REGNO").hide();
        }

        await fn_search();
    }

    const fn_findEarnerCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("EARNER_CODE"));
        var replaceText0 	= "_EARNER_CODE_";
        var strWhereClause 	= "AND A.CS_CODE LIKE '%" + replaceText0 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '소득자코드 조회');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_HRA060'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "코드명"]
            ,searchInputFields		: ["CS_CODE", "CS_NAME"]
            ,searchInputValues		: [searchCode, ""]
            ,searchInputTypes		: ["input", "input"]			//input, select가 있는 경우
            ,searchInputTypeValues	: ["", ""]				//select 경우
            ,height					: '400px'
            ,tableHeader			: ["거래처코드", "거래처명"]
            ,tableColumnNames		: ["CS_CODE", "CS_NAME"]
            ,tableColumnWidths		: ["80px", "160px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('EARNER_CODE', data.CS_CODE);
            },
        });
    }

    const fn_findBankCode = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("BANK_CODE"));
        var searchName 		= gfn_nvl(SBUxMethod.get("BANK_NAME"));
        var replaceText0 	= "_BANK_CODE_";
        var replaceText1 	= "_BANK_NAME_";
        var strWhereClause 	= "AND SUB_CODE LIKE '%" + replaceText0 + "%' AND CODE_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '공통은행정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM027'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "은행명"]
            ,searchInputFields		: ["SUB_CODE", "CODE_NAME"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["코드", "명칭"]
            ,tableColumnNames		: ["SUB_CODE" , "CODE_NAME"]
            ,tableColumnWidths		: ["50px", "200px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('BANK_NAME', data.CODE_NAME);
                SBUxMethod.set('BANK_CODE', data.SUB_CODE);
            },
        });
    }

    const fn_findBankCode1 = function() {
        var searchCode 		= gfn_nvl(SBUxMethod.get("BANK_CODE1"));
        var searchName 		= gfn_nvl(SBUxMethod.get("BANK_NAME1"));
        var replaceText0 	= "_BANK_CODE_";
        var replaceText1 	= "_BANK_NAME_";
        var strWhereClause 	= "AND SUB_CODE LIKE '%" + replaceText0 + "%' AND CODE_NAME LIKE '%" + replaceText1 + "%'";

        SBUxMethod.attr('modal-compopup1', 'header-title', '공통은행정보');
        compopup1({
            compCode				: gv_ma_selectedCorpCd
            ,clientCode				: gv_ma_selectedClntCd
            ,bizcompId				: 'P_COM027'
            ,popupType				: 'A'
            ,whereClause			: strWhereClause
            ,searchCaptions			: ["코드", "은행명"]
            ,searchInputFields		: ["SUB_CODE", "CODE_NAME"]
            ,searchInputValues		: [searchCode, searchName]
            ,height					: '400px'
            ,tableHeader			: ["코드", "명칭"]
            ,tableColumnNames		: ["SUB_CODE" , "CODE_NAME"]
            ,tableColumnWidths		: ["50px", "200px"]
            ,itemSelectEvent		: function (data){
                SBUxMethod.set('BANK_NAME1', data.CODE_NAME);
                SBUxMethod.set('BANK_CODE1', data.SUB_CODE);
            },
        });
    }

    const fn_callbckIncomeSec = async function(data) {
        let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));

        if(enableTab == "tpgResident") {
            if(gfn_nvl(SBUxMethod.get("INCOME_TYPE")) == "" || gfn_nvl(data) == "") {
                return;
            }

            if (gfn_nvl(SBUxMethod.get("INCOME_TYPE")) == "24" && data == "851101") {
                $("#BIZ_REGNO1").attr("required", true);
                $("#BIZ_REGNO1").addClass("inpt_data_reqed");
                $("#COMP_NAME").attr("required", true);
                $("#COMP_NAME").addClass("inpt_data_reqed");
            } else {
                $("#BIZ_REGNO1").attr("required", false);
                $("#BIZ_REGNO1").removeClass("inpt_data_reqed");
                $("#COMP_NAME").attr("required", false);
                $("#COMP_NAME").removeClass("inpt_data_reqed");
            }
        } else if(enableTab == "tpgNonresident") {
            if (gfn_nvl(data) == "") {
                $("#BIRTHDAY").attr("required", false);
                $("#BIRTHDAY").removeClass("inpt_data_reqed");
                SBUxMethod.set("BIRTHDAY", "");
                return;
            }

            if (data == "121") {
                $("#BIRTHDAY").attr("required", true);
                $("#BIRTHDAY").addClass("inpt_data_reqed");
            } else {
                $("#BIRTHDAY").attr("required", false);
                $("#BIRTHDAY").removeClass("inpt_data_reqed");
                SBUxMethod.set("BIRTHDAY", "");
            }
        }
    }

    const fn_dynamicMultiSelect = async function(target, bizcompId) {
      switch (bizcompId) {
          case 'L_HRA023':
              gfnma_multiSelectInit({
                  target			: ['#'+target]
                  ,compCode		: gv_ma_selectedCorpCd
                  ,clientCode		: gv_ma_selectedClntCd
                  ,bizcompId		: 'L_HRA023'
                  ,whereClause	: ''
                  ,formId			: p_formId
                  ,menuId			: p_menuId
                  ,selectValue	: ''
                  ,dropType		: 'down' 	// up, down
                  ,dropAlign		: 'right' 	// left, right
                  ,colValue		: 'SUB_CODE'
                  ,colLabel		: 'CODE_NAME'
                  ,columns		:[
                      {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                      {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                      {caption: "세율(%)", 		ref: 'TAX_RATE',    		width:'100px',  	style:'text-align:left'},
                      {caption: "경비율(%)", 		ref: 'EXPENSE_RATE',    		width:'100px',  	style:'text-align:left'},
                  ]
                  ,callback : function(data) {
                      fn_callbckIncomeSec(data);
                  }
              });
              break;
          case 'L_HRA048':
              gfnma_multiSelectInit({
                  target			: ['#'+target]
                  ,compCode		: gv_ma_selectedCorpCd
                  ,clientCode		: gv_ma_selectedClntCd
                  ,bizcompId		: 'L_HRA048'
                  ,whereClause	: ''
                  ,formId			: p_formId
                  ,menuId			: p_menuId
                  ,selectValue	: ''
                  ,dropType		: 'down' 	// up, down
                  ,dropAlign		: 'right' 	// left, right
                  ,colValue		: 'SUB_CODE'
                  ,colLabel		: 'CODE_NAME'
                  ,columns		:[
                      {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                      {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                      {caption: "세율(%)", 		ref: 'TAX_RATE',    		width:'100px',  	style:'text-align:left'},
                      {caption: "경비율(%)", 		ref: 'EXPENSE_RATE',    		width:'100px',  	style:'text-align:left'},
                  ]
                  ,callback : function(data) {
                      fn_callbckIncomeSec(data);
                  }
              });
              break;
          case 'L_HRA056':
              gfnma_multiSelectInit({
                  target			: ['#'+target]
                  ,compCode		: gv_ma_selectedCorpCd
                  ,clientCode		: gv_ma_selectedClntCd
                  ,bizcompId		: 'L_HRA056'
                  ,whereClause	: ''
                  ,formId			: p_formId
                  ,menuId			: p_menuId
                  ,selectValue	: ''
                  ,dropType		: 'down' 	// up, down
                  ,dropAlign		: 'right' 	// left, right
                  ,colValue		: 'SUB_CODE'
                  ,colLabel		: 'CODE_NAME'
                  ,columns		:[
                      {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                      {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                  ]
                  ,callback : function(data) {
                      fn_callbckIncomeSec(data);
                  }
              });
              break;
          case 'L_HRA024':
              gfnma_multiSelectInit({
                  target			: ['#'+target]
                  ,compCode		: gv_ma_selectedCorpCd
                  ,clientCode		: gv_ma_selectedClntCd
                  ,bizcompId		: 'L_HRA024'
                  ,whereClause	: ''
                  ,formId			: p_formId
                  ,menuId			: p_menuId
                  ,selectValue	: ''
                  ,dropType		: 'down' 	// up, down
                  ,dropAlign		: 'right' 	// left, right
                  ,colValue		: 'SUB_CODE'
                  ,colLabel		: 'CODE_NAME'
                  ,columns		:[
                      {caption: "코드",		ref: 'SUB_CODE', 			width:'100px',  	style:'text-align:left'},
                      {caption: "명칭", 		ref: 'CODE_NAME',    		width:'100px',  	style:'text-align:left'},
                      {caption: "세율(%)", 		ref: 'TAX_RATE',    		width:'100px',  	style:'text-align:left'},
                      {caption: "경비율(%)", 		ref: 'EXPENSE_RATE',    		width:'100px',  	style:'text-align:left'},
                  ]
                  ,callback : function(data) {
                      fn_callbckIncomeSec(data);
                  }
              });
              break;
      }
    }

    window.addEventListener('DOMContentLoaded', async function(e) {
        await fn_initSBSelect();
        fn_createGvwResidentGrid();
        fn_createGvwNonresidentGrid();
        await fn_search();
    });

    // 초기화
    function cfn_init() {
        gfnma_uxDataClear('#srchArea');
    }

    // 저장
    function cfn_save() {
        fn_save();
    }

    // 삭제
    function cfn_del() {
        fn_delete();
    }

    // 조회
    function cfn_search() {
        fn_search();
    }

    // 신규
    function cfn_add() {
        fn_create();
    }

    const fn_save = async function () {
        let strStatus = "";
        let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));

        if(enableTab == "tpgResident") {
            if (gfn_nvl(SBUxMethod.get("CHK")) == "")
                strStatus = "N";
            else
                strStatus = "U";
        } else if(enableTab == "tpgNonresident") {
            if (gfn_nvl(SBUxMethod.get("EARNER_CODE1")) == "")
                strStatus = "N";
            else
                strStatus = "U";
        }

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            IV_P_EARNER_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("EARNER_CODE")) : gfn_nvl(SBUxMethod.get("EARNER_CODE1")),
            V_P_SITE_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SITE_CODE")) : gfn_nvl(SBUxMethod.get("SITE_CODE1")),
            V_P_EARNER_NAME : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("EARNER_NAME1")) : gfn_nvl(SBUxMethod.get("EARNER_NAME3")),
            V_P_SOCNO : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SOCIAL_NO1")) : gfn_nvl(SBUxMethod.get("SOCIAL_NO3")),
            V_P_BIZ_REGNO : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("BIZ_REGNO1")) : "",
            V_P_COMP_NAME : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("COMP_NAME")) : "",
            V_P_NATION_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("NATION_CODE")) : gfn_nvl(SBUxMethod.get("NATION_CODE1")),
            V_P_FOREI_TYPE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#FOREIGN_TYPE')) : gfn_nvl(gfnma_multiSelectGet('#FOREIGN_TYPE1')),
            V_P_RESIDE_TYPE : enableTab == "tpgResident" ? "1" : "2",
            V_P_SITE_ZIP_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SITE_ZIP_CODE")) : "",
            V_P_SITE_ADDRESS : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SITE_ADDRESS")) : "",
            V_P_ZIP_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("ZIP_CODE")) : "",
            V_P_ADDRESS : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("ADDRESS")) : gfn_nvl(SBUxMethod.get("ADDRESS1")),
            V_P_INC_TYPE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#INCOME_TYPE')) : gfn_nvl(gfnma_multiSelectGet('#INCOME_TYPE1')),
            V_P_INC_SEC : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#INCOME_SEC')) : gfn_nvl(gfnma_multiSelectGet('#INCOME_SEC1')),
            V_P_WORK_REGION : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#WORK_REGION')) : gfn_nvl(gfnma_multiSelectGet('#WORK_REGION1')),
            V_P_BUSINESS_TYPE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#BUSINESS_TYPE1')) : gfn_nvl(gfnma_multiSelectGet('#BUSINESS_TYPE')),
            V_P_BANK_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("BANK_CODE")) : gfn_nvl(SBUxMethod.get("BANK_CODE1")),
            V_P_BANK_ACC : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("BANK_ACCOUNT")) : gfn_nvl(SBUxMethod.get("BANK_ACCOUNT1")),
            V_P_TEL : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("TEL")) : gfn_nvl(SBUxMethod.get("TEL1")),
            V_P_BIRTHDAY : enableTab == "tpgResident" ? "" : gfn_nvl(SBUxMethod.get("BIRTHDAY")),
            V_P_MOBILE_PHONE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("MOBILE_PHONE")) : "",
            V_P_EMAIL : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("EMAIL")) : "",
            V_P_PAY_CYCLE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#PAY_CYCLE')) : "",
            V_P_MEMO : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("MEMO")) : gfn_nvl(SBUxMethod.get("MEMO1")),
            V_P_TAX_SITE_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("TAX_SITE_CODE1")) : gfn_nvl(SBUxMethod.get("TAX_SITE_CODE2")),
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3610.do", {
            getType				: 'json',
            workType			: strStatus,
            cv_count			: '0',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(enableTab == "tpgResident") {
                    let strFocus = gfn_nvl(SBUxMethod.get("EARNER_CODE"));
                    if(strStatus == "N") {
                        strFocus = data.v_returnStr;
                        SBUxMethod.set("EARNER_CODE", data.v_returnStr);
                    }

                    await fn_search();

                    gvwResident.clickRow(jsonResidentList.findIndex(item => item.EARNER_CODE == strFocus) + 1)
                } else if(enableTab == "tpgNonresident") {
                    let strFocus = gfn_nvl(SBUxMethod.get("EARNER_CODE1"));
                    if(strStatus == "N") {
                        strFocus = data.v_returnStr;
                        SBUxMethod.set("EARNER_CODE1", data.v_returnStr);
                    }

                    await fn_search();
                    gvwNonresident.clickRow(jsonNonResidentList.findIndex(item => item.EARNER_CODE == strFocus) + 1);
                }
            } else {
                alert(data.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_delete = async function () {
        let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));
        let strMessage = "";

        if(enableTab == "tpgResident") {
            strMessage = gfn_nvl(SBUxMethod.get("EARNER_CODE1")) + " 정보를 삭제하시겠습니까?";
        } else if(enableTab == "tpgNonresident") {
            strMessage = gfn_nvl(SBUxMethod.get("EARNER_CODE3")) + " 정보를 삭제하시겠습니까?";
        }

        if (gfn_comConfirm("Q0000", strMessage)) {
            let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));

            var paramObj = {
                V_P_DEBUG_MODE_YN	: '',
                V_P_LANG_ID		: '',
                V_P_COMP_CODE		: gv_ma_selectedCorpCd,
                V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
                IV_P_EARNER_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("EARNER_CODE")) : gfn_nvl(SBUxMethod.get("EARNER_CODE1")),
                V_P_SITE_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SITE_CODE")) : gfn_nvl(SBUxMethod.get("SITE_CODE1")),
                V_P_EARNER_NAME : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("EARNER_NAME1")) : gfn_nvl(SBUxMethod.get("EARNER_NAME3")),
                V_P_SOCNO : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SOCIAL_NO1")) : gfn_nvl(SBUxMethod.get("SOCIAL_NO3")),
                V_P_BIZ_REGNO : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("BIZ_REGNO1")) : "",
                V_P_COMP_NAME : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("COMP_NAME")) : "",
                V_P_NATION_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("NATION_CODE")) : gfn_nvl(SBUxMethod.get("NATION_CODE1")),
                V_P_FOREI_TYPE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#FOREIGN_TYPE')) : gfn_nvl(gfnma_multiSelectGet('#FOREIGN_TYPE1')),
                V_P_RESIDE_TYPE : enableTab == "tpgResident" ? "1" : "2",
                V_P_SITE_ZIP_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SITE_ZIP_CODE")) : "",
                V_P_SITE_ADDRESS : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SITE_ADDRESS")) : "",
                V_P_ZIP_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("ZIP_CODE")) : "",
                V_P_ADDRESS : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("ADDRESS")) : gfn_nvl(SBUxMethod.get("ADDRESS1")),
                V_P_INC_TYPE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#INCOME_TYPE')) : gfn_nvl(gfnma_multiSelectGet('#INCOME_TYPE1')),
                V_P_INC_SEC : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#INCOME_SEC')) : gfn_nvl(gfnma_multiSelectGet('#INCOME_SEC1')),
                V_P_WORK_REGION : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#WORK_REGION')) : gfn_nvl(gfnma_multiSelectGet('#WORK_REGION1')),
                V_P_BUSINESS_TYPE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#BUSINESS_TYPE1')) : gfn_nvl(gfnma_multiSelectGet('#BUSINESS_TYPE')),
                V_P_BANK_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("BANK_CODE")) : gfn_nvl(SBUxMethod.get("BANK_CODE1")),
                V_P_BANK_ACC : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("BANK_ACCOUNT")) : gfn_nvl(SBUxMethod.get("BANK_ACCOUNT1")),
                V_P_TEL : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("TEL")) : gfn_nvl(SBUxMethod.get("TEL1")),
                V_P_BIRTHDAY : enableTab == "tpgResident" ? "" : gfn_nvl(SBUxMethod.get("BIRTHDAY")),
                V_P_MOBILE_PHONE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("MOBILE_PHONE")) : "",
                V_P_EMAIL : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("EMAIL")) : "",
                V_P_PAY_CYCLE : enableTab == "tpgResident" ? gfn_nvl(gfnma_multiSelectGet('#PAY_CYCLE')) : "",
                V_P_MEMO : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("MEMO")) : gfn_nvl(SBUxMethod.get("MEMO1")),
                V_P_TAX_SITE_CODE : enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("TAX_SITE_CODE1")) : gfn_nvl(SBUxMethod.get("TAX_SITE_CODE2")),
                V_P_FORM_ID		: p_formId,
                V_P_MENU_ID		: p_menuId,
                V_P_PROC_ID		: '',
                V_P_USERID			: '',
                V_P_PC				: ''
            };

            const postJsonPromise = gfn_postJSON("/hr/hrp/svc/insertHra3610.do", {
                getType				: 'json',
                workType			: 'D',
                cv_count			: '0',
                params				: gfnma_objectToString(paramObj)
            });

            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");
                    await fn_search();
                } else {
                    alert(data.resultMessage);
                }

            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }
    }

    const fn_search = async function () {
        let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));
        let EARNER_NAME = gfn_nvl(SBUxMethod.get("SRCH_EARNER_NAME"));
        let BIZ_REGNO = enableTab == "tpgResident" ? gfn_nvl(SBUxMethod.get("SRCH_BIZ_REGNO")) : "";
        let RESIDE_TYPE = enableTab == "tpgResident" ? "1" : "2";

        var paramObj = {
            V_P_DEBUG_MODE_YN	: '',
            V_P_LANG_ID		: '',
            V_P_COMP_CODE		: gv_ma_selectedCorpCd,
            V_P_CLIENT_CODE	: gv_ma_selectedClntCd,
            V_P_EARNER_NAME : EARNER_NAME,
            V_P_BIZ_REGNO : BIZ_REGNO,
            V_P_RESIDE_TYPE : RESIDE_TYPE,
            V_P_FORM_ID		: p_formId,
            V_P_MENU_ID		: p_menuId,
            V_P_PROC_ID		: '',
            V_P_USERID			: '',
            V_P_PC				: ''
        };

        const postJsonPromise = gfn_postJSON("/hr/hrp/svc/selectHra3610List.do", {
            getType				: 'json',
            workType			: 'LIST',
            cv_count			: '1',
            params				: gfnma_objectToString(paramObj)
        });

        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                if(enableTab == "tpgResident") {
                    jsonResidentList.length = 0;
                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            CLIENT_CODE: item.CLIENT_CODE,
                            COMP_CODE: item.COMP_CODE,
                            EARNER_CODE: item.EARNER_CODE,
                            SITE_CODE: item.SITE_CODE,
                            TAX_SITE_CODE: item.TAX_SITE_CODE,
                            EARNER_NAME: item.EARNER_NAME,
                            SOCNO: item.SOCNO,
                            SOCNO_REAL: item.SOCNO_REAL,
                            BIZ_REGNO: item.BIZ_REGNO,
                            COMP_NAME: item.COMP_NAME,
                            NATION_CODE: item.NATION_CODE,
                            FOREI_TYPE: item.FOREI_TYPE,
                            WORK_REGION: item.WORK_REGION,
                            INC_TYPE: item.INC_TYPE,
                            INC_SEC: item.INC_SEC,
                            SITE_ZIP_CODE: item.SITE_ZIP_CODE,
                            SITE_ADDRESS: item.SITE_ADDRESS,
                            ZIP_CODE: item.ZIP_CODE,
                            ADDRESS: item.ADDRESS,
                            BUSINESS_TYPE: item.BUSINESS_TYPE,
                            BANK_CODE: item.BANK_CODE,
                            BANK_NAME: item.BANK_NAME,
                            BANK_ACC: item.BANK_ACC,
                            BANK_ACC_REAL: item.BANK_ACC_REAL,
                            TEL: item.TEL,
                            BIRTHDAY: item.BIRTHDAY,
                            MOBILE_PHONE: item.MOBILE_PHONE,
                            EMAIL: item.EMAIL,
                            PAY_CYCLE: item.PAY_CYCLE,
                            MEMO: item.MEMO,
                        }
                        jsonResidentList.push(msg);
                    });
                    gvwResident.rebuild();
                    gvwResident.sortColumn(0, 'desc');

                    document.querySelector('#listCount').innerText = jsonResidentList.length;

                    if (jsonResidentList.length > 0) {
                        gvwResident.clickRow(1);
                    } else {
                        fn_create();
                    }
                } else if(enableTab == "tpgNonresident") {
                    jsonNonResidentList.length = 0;
                    data.cv_1.forEach((item, index) => {
                        const msg = {
                            CLIENT_CODE: item.CLIENT_CODE,
                            COMP_CODE: item.COMP_CODE,
                            EARNER_CODE: item.EARNER_CODE,
                            SITE_CODE: item.SITE_CODE,
                            TAX_SITE_CODE: item.TAX_SITE_CODE,
                            EARNER_NAME: item.EARNER_NAME,
                            SOCNO: item.SOCNO,
                            SOCNO_REAL: item.SOCNO_REAL,
                            BIZ_REGNO: item.BIZ_REGNO,
                            COMP_NAME: item.COMP_NAME,
                            NATION_CODE: item.NATION_CODE,
                            FOREI_TYPE: item.FOREI_TYPE,
                            WORK_REGION: item.WORK_REGION,
                            INC_TYPE: item.INC_TYPE,
                            INC_SEC: item.INC_SEC,
                            SITE_ZIP_CODE: item.SITE_ZIP_CODE,
                            SITE_ADDRESS: item.SITE_ADDRESS,
                            ZIP_CODE: item.ZIP_CODE,
                            ADDRESS: item.ADDRESS,
                            BUSINESS_TYPE: item.BUSINESS_TYPE,
                            BANK_CODE: item.BANK_CODE,
                            BANK_NAME: item.BANK_NAME,
                            BANK_ACC: item.BANK_ACC,
                            BANK_ACC_REAL: item.BANK_ACC_REAL,
                            TEL: item.TEL,
                            BIRTHDAY: item.BIRTHDAY,
                            MOBILE_PHONE: item.MOBILE_PHONE,
                            EMAIL: item.EMAIL,
                            PAY_CYCLE: item.PAY_CYCLE,
                            MEMO: item.MEMO,
                        }
                        jsonNonResidentList.push(msg);
                    });
                    gvwNonresident.rebuild();

                    if (jsonNonResidentList.length > 0) {
                        gvwNonresident.clickRow(1);
                    } else {
                        fn_create();
                    }
                }
            } else {
                alert(data.resultMessage);
            }

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_create = async function () {
        let enableTab = gfn_nvl(SBUxMethod.get("tabInfo"));

        if(enableTab == "tpgResident") {
            gfnma_uxDataClear('#panResidentInfo');

            gfnma_multiSelectSet('#FOREIGN_TYPE', 'SUB_CODE', 'CODE_NAME', "1");
            SBUxMethod.attr("EARNER_CODE", "readonly", false);
            $("#SITE_CODE").focus();
        } else if(enableTab == "tpgNonresident") {
            gfnma_uxDataClear('#grpNonresidentInfo');

            gfnma_multiSelectSet('#FOREIGN_TYPE1', 'SUB_CODE', 'CODE_NAME', "1");
            $("#SITE_CODE").focus();
        }
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>