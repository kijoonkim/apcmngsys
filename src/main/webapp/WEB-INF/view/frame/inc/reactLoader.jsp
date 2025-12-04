<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="egovframework.com.cmm.service.ManifestService" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="java.util.List" %>
<%
    String reactEntry = request.getParameter("reactEntry");

    System.out.println("=== reactLoader.jsp 시작 ===");
    System.out.println("받은 reactEntry: " + reactEntry);

    if (reactEntry == null || reactEntry.isEmpty()) {
        System.out.println("❌ reactEntry가 비어있음!");
        return;
    }

    ManifestService manifestService = WebApplicationContextUtils
            .getWebApplicationContext(application)
            .getBean(ManifestService.class);

    System.out.println("✅ ManifestService 빈 로드 성공");

    String jsFile = manifestService.getJsFile(reactEntry);
    List<String> cssFiles = manifestService.getCssFiles(reactEntry);

    System.out.println("JS 파일: " + jsFile);
    System.out.println("CSS 파일: " + cssFiles);

    // CSS 로드
    if (cssFiles != null && !cssFiles.isEmpty()) {
        for (String css : cssFiles) {
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bundles/<%= css %>">
<%
            System.out.println("CSS 추가: " + css);
        }
    }

    // JS 로드
    if (jsFile != null) {
%>
<script type="module" src="${pageContext.request.contextPath}/bundles/<%= jsFile %>"></script>
<%
    }
%>