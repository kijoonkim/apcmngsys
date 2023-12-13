<%
 /**
  * @Class Name : openClipReportPopup.jsp
  * @Description : 클립리포트 Open Popup 화면
  * @author SI개발부
  * @since 2023.08.31
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.08.31   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String reportKey = request.getParameter("reportKey");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title>title : 클립리포트 팝업</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body>
	<div id="div-rpt-clipReport" style="width:1000px;height:80vh;"></div>
	<script type="text/javascript">
		const reportKey = "<%=reportKey%>";
		gfn_drawClipReport("div-rpt-clipReport", reportKey);
	</script>
</body>
</html>

