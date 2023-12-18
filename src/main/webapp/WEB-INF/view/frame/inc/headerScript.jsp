<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link href="/resource/css/template_com.css" rel="stylesheet" type="text/css">
    <title>header</title>
    <script>
        var SBUxConfig = {
            Path: '/resource/sbux/',
            SBGrid: {
                Version2_5: true
            },
            SBChart: {
                Version2_0: true
            }
        }
    </script>
    <script src="/resource/sbux/assets/js/sbchart/sbchart.js"></script>
    <link rel="stylesheet" href="/resource/sbux/assets/js/sbchart/sbchart.css">
    <script src="/resource/sbux/SBUx.js"></script>
    <script src="/resource/script/common.js"></script>
    <script src="/resource/script/comDate.js"></script>
    <script src="/resource/script/comAuthrt.js"></script>
    <script src="/resource/script/comApcUtil.js"></script>
    <script src="/resource/script/comApcGrd.js"></script>

    <script src="/resource/script/hangul.min.js"></script>
    <!------------------ 컴포넌트 테마 CSS ------------------>
    <link href="/resource/css/blue_comp_style.css" rel="stylesheet" type="text/css">
    <!------------------ 스타일 테마 CSS ------------------>
    <link href="/resource/css/blue_style.css" rel="stylesheet" type="text/css">
    <!------------------ 커스텀 테마 CSS ------------------>
    <link href="/resource/css/sbgrid_custom.css" rel="stylesheet" type="text/css">

	<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드 CSS 영역 시작-->
	<!-- favicon -->
	<link rel="apple-touch-icon" href="../../../images/favicon.png">
	<link rel="shortcut icon" href="../../../images/favicon.ico">
	<!-- //favicon -->

	<!-- [pp] icon -->
	<link rel="stylesheet" href="../../../src/font-awesome/css/font-awesome.min.css">
    <!-- [pp] font-awesome 파이어폭스 미출력 에러 대응 -->
    <link rel="stylesheet" href="../../../src/font-awesome/css/fontawesome.css">
    <!-- [pp] //font-awesome 파이어폭스 미출력 에러 대응 -->
    <link rel="stylesheet" href="../../../src/remixicon/fonts/remixicon.css">
	<!-- [pp] //icon -->

	<!-- css -->
	<link rel="stylesheet" href="../../../src/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../../src/bootstrap-adminLTE/css/AdminLTE.css">
	<link rel="stylesheet" href="../../../src/bootstrap-adminLTE/css/_all-skins.min.css">
	<link rel="stylesheet" href="../../../src/bootstrap-datepicker/css/bootstrap-datepicker.min.css">
	<link rel="stylesheet" href="../../../src/mCustomScrollbar/css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="../../../src/select2/css/select2.css">
	<link rel="stylesheet" href="../../../src/apexchart/css/apexcharts.css">
	<link rel="stylesheet" href="../../../css/dl_global.css">
	<link rel="stylesheet" href="../../../css/admin/dl_common.css">
	<link rel="stylesheet" href="../../../css/admin/dl_custom.css">
	<link rel="stylesheet" href="../../../css/admin/dl_table.css">
	<link rel="stylesheet" href="../../../css/admin/dl_ui.css">
	<link rel="stylesheet" href="../../../css/admin/dl_popup.css">
	<link rel="stylesheet" href="../../../css/admin/dl_apc.css">
	<!-- //css -->

	<!-- js -->
	<!--       <script src="../../../src/jquery/js/jquery-3.5.1.min.js"></script> -->
	<script src="../../../src/jquery/js/jquery-3.5.1.min.js"></script>
	<script src="../../../src/jquery/js/jquery.mousewheel.min.js"></script>
	<!--[if lt IE 9]>
	<script src="../../../src/jquery/js/jquery-1.12.3.min.js"></script>
	<script src="../../../src/jquery/js/html5shiv.js"></script>
	<script src="../../../src/jquery/js/IE9.js"></script>
	<script src="../../../src/jquery/js/respond.min.js"></script>
	<![endif]-->
	<script src="../../../src/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../../src/bootstrap-adminLTE/js/adminlte.js"></script>
	<script src="../../../src/bootstrap-adminLTE/js/demo.js"></script>
	<script src="../../../src/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
	<script src="../../../src/mCustomScrollbar/js/jquery.mCustomScrollbar.min.js"></script>
	<script src="../../../src/select2/js/select2.min.js"></script>
	<script src="../../../src/apexchart/js/apexcharts.js"></script>
	<script src="../../../js/admin/pp_ui.js"></script>
	 <!-- //js -->

	<!-- APC지원시스템, 생산관리시스템, 산지유통평가등록, 서비스 포털 스타일 가이드 CSS 영역 완료-->

    <!-- ComUi json -->
	<script type="text/javascript">
		<c:set scope="request" var="comUiJson" value="${comUiJson}"></c:set>
		const comUiJson = ${comUiJson};
		gfn_setSysPrgrmId(comUiJson.menuId);

	<c:choose>
		<c:when test="${loginVO != null && loginVO.id != null}">
		<c:set scope="request" var="apcCd" value="${loginVO.apcCd}"></c:set>
		<c:set scope="request" var="apcNm" value="${loginVO.apcNm}"></c:set>
		<c:set scope="request" var="apcSeCd" value="${loginVO.apcSeCd}"></c:set>
		<c:set scope="request" var="userType" value="${loginVO.userType}"></c:set>
		<c:set scope="request" var="userNm" value="${loginVO.name}"></c:set>
		
		const gv_apcCd = '${apcCd}';
		const gv_apcNm = '${apcNm}';
		const gv_apcSeCd = '${apcSeCd}';
		const gv_userType = '${userType}';
		const gv_userNm = '${userNm}';
		
		</c:when>
		<c:otherwise>
		const gv_apcCd = '';
		const gv_apcNm = '';
		const gv_apcSeCd = '';
		const gv_userType = '';
		</c:otherwise>
	</c:choose>
		// 선택 APC코드 설정
		gv_selectedApcCd = gv_apcCd;
		gv_selectedApcNm = gv_apcNm;
		gv_selectedApcSeCd = gv_apcSeCd;
		gv_selectedUserType = gv_userType;
	</script>

<sbux-progress name="main-loading" uitype="loading" openlayer-title="Loading..." show-openlayer="true" animation="true" animation-type="fadeOut" ></sbux-progress>