<%
 /**
  * @Class Name : openClipReportPostPopup.jsp
  * @Description : 클립리포트 Open Popup 화면 (by Post)
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
String conn = "";
String exePrintYn = "";
//String reportKey = request.getParameter("reportKey");
request.setCharacterEncoding("UTF-8");

param = request.getParameter("param");
conn = request.getParameter("conn");

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
	<title><c:out value='${menuNm}'></c:out> 클립 리포트 팝업</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
	<%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">

<c:set scope="request" var="fileName" value="${fileName}"></c:set>

	<div id="div-rpt-clipReportJSON" style="width:1000px;height:80vh;"></div>
	<script type="text/javascript">
	
		const fn_drawClipReportJSON = async function() {
			const fileName = '<c:out value='${fileName}'></c:out>';
			const exePrintYn = "N";
			const param = <%=param%>;
			const conn = <%=conn%>;
			//const reportKey = await gfn_getReportKey(fileName, param);
			const reportKey = await gfn_getReportKeyByJson(fileName, param, conn);
			const check = {
				exePrintYn : exePrintYn
			}
			
			gfn_drawClipReportPOST("div-rpt-clipReportJSON", reportKey, check);
		}
		
		fn_drawClipReportJSON();
		
	</script>
</body>
</html>

