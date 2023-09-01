<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- <div id="div-rpt-clipReportPopup" class="box box-solid" style="position:absolute;top:50px;left:5px;right:5px;bottom:5px;">  -->
	<!-- <div id="div-rpt-clipReportPopup" style="width:1000px;height:600px;"> -->
	<div id="div-rpt-clipReportPopup" style="width:1000px;height:80vh;"></div>

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
