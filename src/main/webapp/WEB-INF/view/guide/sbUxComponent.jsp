<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../frame/inc/headerMeta.jsp" %>
	<%@ include file="../frame/inc/headerScript.jsp" %>
<title>SBUx Component</title>
</head>
<body oncontextmenu="return false">

<sbux-select id="cmbMenuType" name="cmbMenuType" uitype="single" jsondata-ref="jsonComCdMenuType" unselected-text="선택" style="width:100%"></sbux-select>

<!-- inline scripts related to this page -->
<script type="text/javascript">
var jsonComCdMenuType = [];
// only document
window.addEventListener('DOMContentLoaded', function(e) {
	gfn_setComCdSelect("cmbMenuType", jsonComCdMenuType, "MENU_TYPE");
});
</script>

</body>


</html>