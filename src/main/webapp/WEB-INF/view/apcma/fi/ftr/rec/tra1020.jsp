<%
    /**
     * @Class Name 		: tra1020.jsp
     * @Description 	: 예금입금등록 화면
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
    <title>title : 예금입금등록</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
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
            <table class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width: 15%">
                    <col style="width: 10%">
                    <col style="width: 8%">
                    <col style="width: 15%">
                    <col style="width: 10%">
                    <col style="width: 8%">
                    <col style="width: 15%">
                    <col style="width: 10%">
                    <col style="width: 8%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">법인</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">기준연도</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-select id="기준연도" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">신고구분명</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-select id="신고구분명" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">신고사업장</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input id="신고사업장" uitype="text" class="form-control input-sm"></sbux-input>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">사업자번호</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input id="사업자번호" uitype="text" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="4"></td>
                </tr>
                </tbody>
            </table>
            <div style=" height: 80vh; display: flex">
                <div style="flex: 1">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>사업장 리스트</span></li>
                        </ul>
                    </div>
                    <div id="사업장리스트그리드" style="width: 100%"></div>
                </div>
                <div style="flex: 4;display: flex;flex-direction: column">
                    <div style="flex: 1">
                        <div style="flex: 1">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>공제받지 못할 매입세액 명세</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="tab-content" style="height: auto">
                            <div id="Sales">
                                <table style="width: 60%">
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
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                        </tr>
                                        <tr>
                                            <td>② 사업과 직접 관련 없는 지출</td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                        </tr>
                                        <tr>
                                            <td>③ 비영업용 소형승용자동차 구입 ㆍ유지 및 임차</td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                        </tr>
                                        <tr>
                                            <td>④ 접대비 및 이와 유사한 비용 관련</td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                        </tr>
                                        <tr>
                                            <td>⑤ 면세사업등 관련</td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                        </tr>
                                        <tr>
                                            <td>⑥ 토지의 자본적 지출 관련</td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                        </tr>
                                        <tr>
                                            <td>⑦ 사업자등록 전 매입세액</td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                        </tr>
                                        <tr>
                                            <td>⑧ 금,구리 스크랩 거래계좌 미사용 관련 매입세액</td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                        </tr>
                                        <tr>
                                            <td>⑨ 합계</td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                            <td><input type="number" value="0"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="normal" is-scrollable="false"
                                           title-target-id-array="Sales2^Purchase"
                                           title-text-array="안분계산 명세^정산 및 재계산 명세">
                                </sbux-tabs>
                                <div class="tab-content" style="height: auto">
                                    <div id="Sales2">
                                        <div class="ad_tbl_top">
                                            <ul class="ad_tbl_count">
                                                <li><span>공통매입세액 안분 계산 명세</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div id="Purchase"></div>
                                </div>

                                <div class="ad_tbl_top">
                                    <ul class="ad_tbl_count">
                                        <li><span>과세기간 종료일 다음달 11일까지 전송된 전자세금계산서외 발급분 매출처별 명세</span></li>
                                    </ul>
                                </div>
                                <div id="매출그리드" style="width: 100%; height: 100%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script>
    let json사업장리스트 = [];
    let json매출 = [];
    let json매입 = [];

    let 사업장grid;
    let 매출grid;
    let 매입grid;



    window.addEventListener("DOMContentLoaded",function(){
        fn_createGrid();
        fn_create매출();
        fn_create매입();
    });

    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = '사업장리스트그리드';
        SBGridProperties.id = '사업장리스트그리드';
        SBGridProperties.jsonref = 'json사업장리스트';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['신고사업장명'],               ref : 'check',        width : '50%',    style : 'text-align:center',    type : 'checkbox'},
            {caption : ['사업자번호'],          ref : 'academy',      width : '50%',   style : 'text-align:center',    type : 'input'},
        ];
        사업장grid = _SBGrid.create(SBGridProperties);
    }
    const fn_create매출 = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = '매출그리드';
        SBGridProperties.id = '매출그리드';
        SBGridProperties.jsonref = 'json매출';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['순번'],               ref : 'check',        width : '10%',    style : 'text-align:center',    type : 'checkbox'},
            {caption : ['사업자번호'],          ref : 'academy',      width : '20%',   style : 'text-align:center',    type : 'input'},
            {caption : ['상호(법인명)'],          ref : 'academy',      width : '30%',   style : 'text-align:center',    type : 'input'},
            {caption : ['매수'],          ref : 'academy',      width : '10%',   style : 'text-align:center',    type : 'input'},
            {caption : ['공급가액'],          ref : 'academy',      width : '15%',   style : 'text-align:center',    type : 'input'},
            {caption : ['세액'],          ref : 'academy',      width : '15%',   style : 'text-align:center',    type : 'input'},
        ];
        매출grid = _SBGrid.create(SBGridProperties);
    }
    const fn_create매입 = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = '매입그리드';
        SBGridProperties.id = '매입그리드';
        SBGridProperties.jsonref = 'json매입';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['순번'],               ref : 'check',        width : '10%',    style : 'text-align:center',    type : 'checkbox'},
            {caption : ['사업자번호'],          ref : 'academy',      width : '20%',   style : 'text-align:center',    type : 'input'},
            {caption : ['상호(법인명)'],          ref : 'academy',      width : '30%',   style : 'text-align:center',    type : 'input'},
            {caption : ['매수'],          ref : 'academy',      width : '10%',   style : 'text-align:center',    type : 'input'},
            {caption : ['공급가액'],          ref : 'academy',      width : '15%',   style : 'text-align:center',    type : 'input'},
            {caption : ['세액'],          ref : 'academy',      width : '15%',   style : 'text-align:center',    type : 'input'},
        ];
        매출grid = _SBGrid.create(SBGridProperties);
    }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
