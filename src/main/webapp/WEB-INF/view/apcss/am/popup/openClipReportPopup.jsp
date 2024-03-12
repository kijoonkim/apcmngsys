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
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String title = "";
String fileName = "";
String param = "";
String exePrintYn = "";
//String reportKey = request.getParameter("reportKey");
request.setCharacterEncoding("UTF-8");

Enumeration params = request.getParameterNames();
while ( params.hasMoreElements() ){
	String paramName = (String) params.nextElement();
	String paramValue = request.getParameter(paramName);

	if (paramValue == null) {
		continue;
	}

	if ("title".equals(paramName)) {
		title = paramValue;
	} else if ("fileName".equals(paramName)) {
		fileName = paramValue;
	} else if ("exePrintYn".equals(paramName)){
		exePrintYn = paramValue;
	}
	  else {
		paramValue = paramValue.replace("SELECT", "");
		paramValue = paramValue.replace("UPDATE", "");
		paramValue = paramValue.replace("INSERT", "");
		paramValue = paramValue.replace("DELETE", "");
		paramValue = paramValue.replace("UNION", "");
		paramValue = paramValue.replace("--", "");
		paramValue = paramValue.replace("*", "");
		paramValue = paramValue.replace("/", "");
		paramValue = paramValue.replace("\\", "");
		paramValue = paramValue.replace(";", "");
		paramValue = paramValue.replace(" OR ", "");
		paramValue = paramValue.replace("(", "");
		paramValue = paramValue.replace(")", "");

		param += "\""+ paramName + "\":\"" + paramValue + "\",";
	}
}

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <title><%=title %> 클립 리포트 팝업</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
	<div id="div-rpt-clipReport" style="width:1000px;height:80vh;"></div>
	<script type="text/javascript">
		const fn_drawClipReport = async function() {
			const fileName = "<%=fileName%>";
			const exePrintYn = "<%=exePrintYn%>";
			const param = {<%=param%>};
			const reportKey = await gfn_getReportKey(fileName, param);
			const check = {
					exePrintYn : exePrintYn
			}
			gfn_drawClipReport("div-rpt-clipReport", reportKey,check);
		}
		fn_drawClipReport();
	</script>
</body>
</html>

