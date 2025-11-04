<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agent Dashboard</title>

    <!-- ✅ css/ 제거 -->
    <link rel="stylesheet" href="/static/bundles/ApcDashboard.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
</head>
<body>
<div id="react-dashboard-root" data-app-props="${apcCode}"></div>
<script type="module" src="/static/bundles/ApcDashboard.js"></script>
</body>
</html>