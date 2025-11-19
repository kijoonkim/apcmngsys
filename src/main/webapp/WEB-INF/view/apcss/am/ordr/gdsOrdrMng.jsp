<%
    /**
     * @Class Name : gdsOrdrMng.jsp
     * @Description : 상품발주관리 화면
     * @author SI개발부
     * @since 2025.11.12
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2025.11.12   	손민성			최초 생성
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
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>

    <jsp:include page="../../../frame/inc/reactLoader.jsp">
        <jsp:param name="reactEntry" value="ordr/GdsOrdrMng" />
    </jsp:include>


</head>
<body oncontextmenu="return false">
<div id="root"></div>
</body>
<script>
    (function() {
        const rootEl = document.getElementById('root');
        if (rootEl && typeof gv_selectedApcCd !== 'undefined') {
            rootEl.setAttribute('data-apc-cd', gv_selectedApcCd);
            rootEl.setAttribute('data-apc-Nm', gv_selectedApcNm);
        } else {
        }
    })();
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
