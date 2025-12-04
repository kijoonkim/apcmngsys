<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<%
    String bundleName = request.getParameter("bundleName");
    if (bundleName == null || bundleName.isEmpty()) {
        out.println("<!-- ERROR: bundleName 필요 -->");
        return;
    }

    // Context Path 가져오기
    String contextPath = request.getContextPath();
    String bundleBase = contextPath + "/bundles";

    String manifestPath = application.getRealPath("/bundles/.vite/manifest.json");
    if (manifestPath == null || !new File(manifestPath).exists()) {
        manifestPath = application.getRealPath("/WEB-INF/classes/static/bundles/.vite/manifest.json");
    }

    String jsFile = null;
    String cssFile = null;

    if (manifestPath != null && new File(manifestPath).exists()) {
        try {
            String manifestJson = new String(Files.readAllBytes(Paths.get(manifestPath)), "UTF-8");
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> manifest = mapper.readValue(manifestJson, Map.class);

            String entryKey = "src/entries/" + bundleName + ".tsx";

            if (manifest.containsKey(entryKey)) {
                Map<String, Object> entry = (Map<String, Object>) manifest.get(entryKey);
                jsFile = (String) entry.get("file");

                if (entry.containsKey("css")) {
                    List<String> cssList = (List<String>) entry.get("css");
                    if (cssList != null && !cssList.isEmpty()) {
                        cssFile = cssList.get(0);
                    }
                }
                out.println("<!-- ✅ manifest 사용 -->");
            } else {
                out.println("<!-- ⚠️ manifest에 엔트리 없음, 고정 파일명 사용 -->");
                jsFile = bundleName + ".js";
                cssFile = bundleName + ".css";
            }
        } catch (Exception e) {
            out.println("<!-- ⚠️ manifest 파싱 실패: " + e.getMessage() + ", 고정 파일명 사용 -->");
            jsFile = bundleName + ".js";
            cssFile = bundleName + ".css";
        }
    } else {
        out.println("<!-- ⚠️ manifest 없음, 고정 파일명 사용 -->");
        jsFile = bundleName + ".js";
        cssFile = bundleName + ".css";
    }

    // 전체 경로 생성
    String cssPath = cssFile != null ? bundleBase + "/" + cssFile : null;
    String jsPath = bundleBase + "/" + jsFile;
%>
<% if (cssPath != null) { %>
<link rel="stylesheet" href="<%= cssPath %>">
<% } %>
<script type="module" src="<%= jsPath %>"></script>
<!-- Bundle: <%= bundleName %> | Context: <%= contextPath %> | JS: <%= jsFile %> | CSS: <%= cssFile %> -->
