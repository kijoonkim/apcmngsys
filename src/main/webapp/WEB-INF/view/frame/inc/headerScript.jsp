<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <link href="/resource/css/template_com.css" rel="stylesheet" type="text/css">
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
    <script src="/resource/sbux/SBUx.js"></script>
    <script src="/resource/script/common.js"></script>
    <!------------------ 컴포넌트 테마 CSS ------------------>     
    <link href="/resource/css/blue_comp_style.css" rel="stylesheet" type="text/css">
    <!------------------ 스타일 테마 CSS ------------------>      
    <link href="/resource/css/blue_style.css" rel="stylesheet" type="text/css">
    <!------------------ 커스텀 테마 CSS ------------------>  
    <link href="/resource/css/sbgrid_custom.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		const comUiJson = ${comUiJson};
		gfn_setSysPrgrmId(comUiJson.menuId);
	</script>