<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title : SBUx2.6</title>
   	<%@ include file="../../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body>
	<!-- <div id="div-rpt-clipReportPopup" class="box box-solid" style="position:absolute;top:50px;left:5px;right:5px;bottom:5px;">  -->
	<!-- <div id="div-rpt-clipReportPopup" style="width:1000px;height:600px;"> -->
	<div id="div-rpt-clipReportPopup" style="width:1000px;height:80vh;"></div>
</body>
<script type="text/javascript">
	const popClipReport = {
		modalView: async function(modalId, title, fileName, param) {

			SBUxMethod.setModalTitle(modalId, title);
			SBUxMethod.openModal(modalId);
			await gfn_viewClipReport(
					"div-rpt-clipReportPopup",
					fileName,
					param,
					modalId
				);
		},
		print: function() {

		}
	}
</script>
</html>