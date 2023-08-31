<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

    <!------------------ CLIPSOFT CSS ------------------>
    <link href="/resource/clip/css/clipreport5.css" rel="stylesheet" type="text/css">
    <link href="/resource/clip/css/UserConfig5.css" rel="stylesheet" type="text/css">
    <link href="/resource/clip/css/font.css" rel="stylesheet" type="text/css">
    <!------------------ CLIPSOFT JS ------------------>
    <script type="text/javascript" src="/resource/clip/js/clipreport5.js"></script>
    <script type="text/javascript" src="/resource/clip/js/UserConfig5.js"></script>
    <script type="text/javascript" src="/resource/clip/js/oof/OOFDocument.js"></script>

    <script src="/resource/script/comReport.js"></script>

	<script type="text/javascript">

		gv_reportDbName = '${reportDbName}';
		gv_reportUrl = '${reportUrl}';
		gv_reportType = '${reportType}';
		gv_reportPath = '${reportPath}';

	/*
	gv_reportDbName = 'tibero';
	gv_reportUrl = 'http://133.186.212.16/ClipReport/report_server.jsp';
	gv_reportType = 'crf.root';
	gv_reportPath = '%root%/crf/';
	 */
	</script>
