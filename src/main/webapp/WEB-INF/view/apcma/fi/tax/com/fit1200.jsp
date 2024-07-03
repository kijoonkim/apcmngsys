<%
    /**
     * @Class Name 		: fit1200.jsp
     * @Description 	: 부가가치세 환경설정 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.03
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.03   	이경한		최초 생성
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
    <title>title : 부가가치세 환경설정</title>
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
                    <td style="border-right: hidden"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">기준연도</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-select id="기준연도" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">신고구분명</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-select id="신고구분명" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td colspan="4"></td>
                </tr>
                </tbody>
            </table>
            <!-- content_header end -->
            <!-- content_body start -->
            <div style="display: flex; flex-direction: column; height: 80vh">
                <div style="flex: 1; margin-top: 2vh">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>신고사업장정보</span></li>
                        </ul>
                    </div>
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
                            <th scope="row" class="th_bg">사업장 구분</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">사업장 코드</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="기준연도" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">신고번호</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="신고구분명" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">손채권세액공제비율(분자)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">의제매입세액(분자)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td style="border-right: hidden"></td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">손채권세액공제비율(분모)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">의제매입세액(분모)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">한도율(분자)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="border-right: hidden"></td>
                            <th scope="row" class="th_bg">한도율(분모)</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                            </td>
                            <td colspan="4"></td>
                        </tr>
                        </tbody>
                    </table>
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
    });

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
