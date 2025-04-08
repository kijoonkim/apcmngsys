<%--
  Created by IntelliJ IDEA.
  User: mycom
  Date: 2025-04-08
  Time: 오후 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 웹 시스템 사용 현황</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
  <meta charset="UTF-8">
</head>
<body oncontextmenu="return false">
  <section>
    <div class="box box-solid">
      <div class="box-header" style="display:flex; justify-content: flex-start;">
        <div>
          <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
          <h3 class="box-title"> ➡️ <c:out value='${menuNm}'></c:out></h3><!-- 웹 시스템 사용자 현황 -->
        </div>
        <div style="margin-left: auto;">
          <sbux-button id="btnSearch" name="btnSearch" uitype="normal"  text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
        </div>
      </div>

      <div class="box-userTraffic">
        <h4 class="box-title2"> ▶ 사용자 및 트래픽</h4>
        <table class="table table-striped table-bordered">
          <tr>
            <th rowspan="2">항목</th>
            <th rowspan="2">현월</th>
            <th rowspan="2">전월</th>
            <th colspan="2">차이(전월대비)</th>
          </tr>
          <tr>
            <th>건수</th>
            <th>증감</th>
          </tr>
          <tr>
            <td>총방문자</td>
            <td id="tMVstr">0</td>
            <td id="prvMVstr">0</td>
            <td id="">0</td>
            <td>0</td>
          </tr>
          <tr>
            <td>일 평균 방문자</td>
            <td id="tMAvgVstr">0</td>
            <td id="prvMAvgVstr">0</td>
            <td>0</td>
            <td>0</td>
          </tr>
          <tr>
            <td>총 페이지뷰(PV)</td>
            <td id="tMTotPV">0</td>
            <td id="prvMTotPV">0</td>
            <td>0</td>
            <td>0</td>
          </tr>
        </table>
      </div>
    </div>
  </section>
</body>



