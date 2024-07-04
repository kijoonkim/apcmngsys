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
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
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
            <!-- content_header start -->
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
                </tbody>
            </table>
            <!-- content_header end -->
            <!-- content_body start -->
            <div style="display: flex; flex-direction: column; height: 80vh">
                <div style="flex: 1;">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>신고 기준정보 리스트</span></li>
                        </ul>
                    </div>
                    <div id="sb-area-기준정보"></div>
                </div>
                <div style="flex: 1;">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>신고 기준정보 편집</span></li>
                        </ul>
                    </div>
                    <div>
                        <table class="table table-bordered tbl_fixed">
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
                                <th scope="row" class="th_bg"><span></span>기준연도</th> <!--class="data_required" 필수 표기 -->
                                <td></td>
                                <td></td>
                                <th scope="row" class="th_bg"><span ></span>부가세기간구분</th>
                                <td></td>
                                <td></td>
                                <th scope="row" class="th_bg"><span ></span>신고구분</th>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"><span ></span>부가세 서식명</th>
                                <td></td>
                                <td></td>
                                <th scope="row" class="th_bg"><span ></span>신고기준월</th>
                                <td></td>
                                <td></td>
                                <th scope="row" class="th_bg"><span ></span>신고일</th>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"><span ></span>조기환급 신고여부</th>
                                <td></td>
                                <td></td>
                                <th scope="row" class="th_bg"><span ></span>환급구분</th>
                                <td></td>
                                <td></td>
                                <th scope="row" class="th_bg"><span ></span>조기환급취소여부</th>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"><span ></span>총괄(단위과세)번호</th>
                                <td></td>
                                <td colspan="7"></td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg"><span ></span>비고</th>
                                <td></td>
                                <td colspan="7"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div style="flex: 1;">
                    <div style="display: flex;justify-content: space-between;">
                        <div style="width: 35%">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>신고사업장 정보 리스트</span></li>
                                </ul>
                            </div>
                            <div id="sb-area-신고사업장"></div>
                        </div>
                        <div style="width: 50%">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>부가세 부속서류 첨부 리스트</span></li>
                                </ul>
                            </div>
                            <div id="sb-area-부가세"></div>
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
    /** DOM load **/
    window.addEventListener('DOMContentLoaded', function(e) {
       fn_create부가세();
       fn_create기준정보();
       fn_create신고사업장();
    });

    let 기준정보;
    let 신고사업장;
    let 부가세;

    let json기준정보 = [{}];

    /** 기준정보 GRID **/
    function fn_create기준정보(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-기준정보';
        SBGridProperties.id = '기준정보';
        SBGridProperties.jsonref = 'json기준정보';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns =[
            {caption: ['기준연도'], 			ref: 'brndNm', 		width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['부가세기간구분'], 			ref: 'cnptNm', 		width: '7%',	type: 'inputcombo',	style:'text-align: center'},
            {caption: ['신고구분'],				ref: 'itemNm', 		width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['부가세 서식명'],				ref: 'vrtyNm', 		width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고기준시작월'], 				ref: 'spcfctNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고기준종료월'], 				ref: 'gdsGrdNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고사업장수'], 				ref: 'gdsGrdNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['신고일'], 				ref: 'gdsGrdNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['비고'], 				ref: 'gdsGrdNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['총괄납부(단위과세)관리번호'], 				ref: 'gdsGrdNm', 	width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['조기환급신고여부'], 				ref: 'gdsGrdNm', 	width: '10%',	type: 'output',	style:'text-align: center'},
            {caption: ['환급구분'], 				ref: 'gdsGrdNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
            {caption: ['환급취소여부'], 				ref: 'gdsGrdNm', 	width: '7%',	type: 'output',	style:'text-align: center'},
        ]
        기준정보 = _SBGrid.create(SBGridProperties);
    }

    /** 신고사업장 정보 GRID **/
    function fn_create신고사업장(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-신고사업장';
        SBGridProperties.id = '신고사업장';
        SBGridProperties.jsonref = 'json신고사업장';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns =[
            {caption: ['신고사업장명'], 			ref: 'brndNm', 		width: '100px',	type: 'output',	style:'text-align: center'},
            {caption: ['사업자번호'], 			ref: 'cnptNm', 		width: '130px',	type: 'output',	style:'text-align: center'},
            {caption: ['공백'],				ref: 'itemNm', 		width: '80px',	type: 'output',	style:'text-align: center'},
            {caption: ['신고여부'],				ref: 'vrtyNm', 		width: '80px',	type: 'output',	style:'text-align: center'},
        ]
        신고사업장 = _SBGrid.create(SBGridProperties);
    }

    /** 신고사업장 정보 GRID **/
    function fn_create부가세(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-부가세';
        SBGridProperties.id = '부가세';
        SBGridProperties.jsonref = 'json부가세';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns =[
            {caption: ['순번'], 			ref: 'brndNm', 		width: '100px',	type: 'output',	style:'text-align: center'},
            {caption: ['서식명'], 			ref: 'cnptNm', 		width: '130px',	type: 'output',	style:'text-align: center'},
            {caption: ['공백'],				ref: 'itemNm', 		width: '80px',	type: 'output',	style:'text-align: center'},
            {caption: ['공백'],				ref: 'itemNm', 		width: '80px',	type: 'output',	style:'text-align: center'},
            {caption: ['공백'],				ref: 'itemNm', 		width: '80px',	type: 'output',	style:'text-align: center'},
            {caption: ['작성대상'],				ref: 'vrtyNm', 		width: '80px',	type: 'output',	style:'text-align: center'},
            {caption: ['공백'],				ref: 'itemNm', 		width: '80px',	type: 'output',	style:'text-align: center'},
        ]
        부가세 = _SBGrid.create(SBGridProperties);
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
