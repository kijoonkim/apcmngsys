<%
 /**
  * @Class Name : accessError.jsp
  * @Description : 오류표시 화면
  * @author SI개발부
  * @since 2023.11.09
  * @version 1.0
  * @Modification Information
  * @
  * @ 수정일       	수정자      	수정내용
  * @ ----------	----------	---------------------------
  * @ 2023.11.09   	신정철			최초 생성
  * @see
  *
  */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<title>접근오류</title>
   	<%@ include file="../../frame/inc/headerMeta.jsp" %>
	<%@ include file="../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<c:set var="errorMessage" value="${errorMessage}"></c:set>
	<section>
		<div class="box box-solid">
			<div class="box-header" style="display:flex; justify-content: flex-start;" >
				<div>
					<p>
						<span style="font-weight:bold;"><c:out value='${errorMessage}'></c:out></span>
					</p>
					<!--
					<p>
						<span style="color:black; font-weight:bold;">대형마트 발주서 접수관리는 발주정보를 자동으로 수집하기 위한 입력정보 입니다.</span>
					</p>
					 -->
				</div>
			</div>
		</div>
	</section>
</body>
</html>
