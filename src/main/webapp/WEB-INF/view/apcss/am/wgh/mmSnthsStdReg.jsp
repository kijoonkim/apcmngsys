<%
    /**
     * @Class Name : mmSnthsStdReg.jsp
     * @Description : 월별종합표준등록 화면
     * @author SI개발부
     * @since 2023.08.31
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.04.24	김은총		입고등록/선별등록/포장등록/출하등록 탭 및 페이지 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 월별종합표준등록</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <style>
        .displayFlex {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 월별종합표준등록 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        onclick="fn_save"
                        text="저장"
                ></sbux-button>
            </div>
        </div>

        <div class="box-body srch-keyup-area">
            <sbux-tabs id="tab_norm" name="tab_norm"
                       uitype="normal"
                       is-scrollable=:Q
                       title-target-id-array="tab_wrhsStdReg^tab_sortStdReg^tab_pckgStdReg^tab_spmtStdReg"
                       title-text-array="입고등록^선별등록^포장등록^출하등록" onclick="fn_changeTab()">
            </sbux-tabs>

            <div>
                <!--[APC] START -->
                <%@ include file="../../../frame/inc/apcSelect.jsp" %>
                <!--[APC] END -->
                <div class="tab-content">
                    <!-- 입고등록 탭 화면 -->
                    <div id="tab_wrhsStdReg">
                        <jsp:include page="../../am/wgh/mmWrhsStdReg.jsp"></jsp:include>
                    </div>
                    <!-- 선별등록 탭 화면 -->
                    <div id="tab_sortStdReg">
                        <jsp:include page="../../am/wgh/mmSortStdReg.jsp"></jsp:include>
                    </div>
                    <!-- 포장등록 탭 화면 -->
                    <div id="tab_pckgStdReg">
                        <jsp:include page="../../am/wgh/mmPckgStdReg.jsp"></jsp:include>
                    </div>
                    <!-- 출하등록 탭 화면 -->
                    <div id="tab_spmtStdReg">
                        <jsp:include page="../../am/wgh/mmSpmtStdReg.jsp"></jsp:include>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>

<script type="text/javascript">

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>