<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%--    <%@ include file="../frame/inc/headerMeta.jsp" %>--%>
<%--    <%@ include file="../frame/inc/headerScript.jsp" %>--%>

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Title</title>
</head>
<body>
<%--<div style="width: 1000px;height: 1000px;border: 1px solid black">이런 씨빨</div>--%>
<div id="react-dashboard-root"></div>

<link rel="stylesheet" href="/static/css/agentDashboard.css"/>
<script type="module" src="/js/out/agentDashboard.bundle.js"></script>
</body>
<script type="application/javascript">
    <c:set scope="request" var="apcCd" value="${loginVO.apcCd}"></c:set>
    const gv_selectedApcCd = '${apcCd}';
    console.log(gv_selectedApcCd);
</script>
</html>
