<%
    /**
     * @Class Name : rawMtrWrhsReg.jsp
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
        </div>

        <div class="box-body srch-keyup-area">
            <sbux-tabs id="tab_norm" name="tab_norm"
                       uitype="normal"
                       is-scrollable=:Q
                       title-target-id-array="tab_rawMtrWrhsStdReg^tab_rawMtrSortStdReg^tab_rawMtrPckgStdReg^tab_rawMtrSpmtStdReg"
                       title-text-array="입고등록^선별등록^포장등록^출하등록" onclick="fn_changeTab()">
            </sbux-tabs>

            <div>
                <!--[APC] START -->
                <%@ include file="../../../frame/inc/apcSelect.jsp" %>
                <!--[APC] END -->
                <div class="tab-content">
                    <!-- 입고등록 탭 화면 -->
                    <div id="tab_rawMtrWrhsStdReg">
                        <jsp:include page="../../am/wgh/rawMtrWrhsStdReg.jsp"></jsp:include>
                    </div>
                    <!-- 선별등록 탭 화면 -->
                    <div id="tab_rawMtrSortStdReg">
                        <jsp:include page="../../am/wgh/rawMtrSortStdReg.jsp"></jsp:include>
                    </div>
                    <!-- 포장등록 탭 화면 -->
                    <div id="tab_rawMtrPckgStdReg">
                        <jsp:include page="../../am/wgh/rawMtrPckgStdReg.jsp"></jsp:include>
                    </div>
                    <!-- 출하등록 탭 화면 -->
                    <div id="tab_rawMtrSpmtStdReg">
                        <jsp:include page="../../am/wgh/rawMtrSpmtStdReg.jsp"></jsp:include>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div>
    <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-prdcr">
    <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
</div>

</body>

<script type="text/javascript">
    /**
     * @name fn_choicePrdcr
     * @description 생산자 선택 popup 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>