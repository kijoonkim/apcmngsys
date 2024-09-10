<%
  /**
   * @Class Name : clclnMng.jsp
   * @Description : 정산관리 화면
   * @author SI개발부
   * @since 2024.09.10
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2024.09.10   	손민성		최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 정산관리</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start;" >
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 정산정보조회 -->
      </div>
      <div style="margin-left: auto;">
        <sbux-button
                id="btnReset"
                name="btnReset"
                uitype="normal"
                class="btn btn-sm btn-outline-danger"
                text="초기화"
                onclick="fn_reset"
        ></sbux-button>
        <sbux-button
                id="btnSearch"
                name="btnSearch"
                uitype="normal"
                class="btn btn-sm btn-outline-danger"
                text="조회"
                onclick="fn_search"
        ></sbux-button>
      </div>
    </div>
    <div class="box-body">
      <table class="table table-bordered tbl_fixed">
        <caption>검색 조건 설정</caption>
        <colgroup>
          <col style="width: 20%">
          <col style="width: 30%">
          <col style="width: 20%">
          <col style="width: 30%">
        </colgroup>
        <tbody>
        <tr>
          <th scope="row" class="th_bg">APC명</th>
          <td class="td_input">
            <div style="display: flex">
              <sbux-input
                      id="gsb-slt-apcCd"
                      name="gsb-slt-apcCd"
                      uitype="text"
                      class="form-control input-sm"
                      style="flex-basis:60%"
                      readonly
                      value="${apcNm}"
              ></sbux-input>
            </div>
          </td>
          <th scope="row" class="th_bg">정산년도/차수</th>
          <td class="td_input">
            <div style="display: flex;gap: 10px">
              <sbux-datepicker
                      id="srch-dtp-clclnY"
                      name="srch-dtp-clclnY"
                      uitype="popup"
                      date-format="yyyy"
                      datepicker-mode="year"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      style="height: 28px"
              ></sbux-datepicker>
              <sbux-spinner id="spinner_normal" name="spinner_normal"
                            wrap-style="flex-basis:20%"
                            uitype="normal"  number-min-value="1"
                            number-max-value="10" number-suffix-text="차수"
              ></sbux-spinner>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">정산구분</th>
          <td class="td_input">
            <div style="display: flex">
              <sbux-select
                      id="srch-slt-crtrCd"
                      name="srch-slt-crtrCd"
                      uitype="single"
                      unselected-text="전체"
                      class="form-control input-sm"
                      style="flex-basis: 50%"
                      jsondata-ref=""
              ></sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">정산분류</th>
          <td class="td_input">
            <div style="display: flex">
              <sbux-select
                      id="srch-slt-crtrCd1"
                      name="srch-slt-crtrCd1"
                      uitype="single"
                      unselected-text="전체"
                      class="form-control input-sm"
                      style="flex-basis: 50%"
                      jsondata-ref=""
              ></sbux-select>
            </div>
          </td>
        </tr>
        </tbody>
      </table>
      <div class="ad_tbl_top">
        <ul class="ad_tbl_count">
          <li>
            <span>단가 상세</span>
          </li>
        </ul>
      </div>
      <div id="sb-area-1"></div>
      <div id="sb-area-2"></div>
    </div>
  </div>
</section>
</body>
<script type="text/javascript">
  var grdGdsInvntr;
  window.addEventListener('DOMContentLoaded', async function(e) {
  });


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
