<%
  /**
   * @Class Name : wghCurInq.jsp
   * @Description : 계량현황조회 화면
   * @author SI개발부
   * @since 2024.11.25
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일        수정자        수정내용
   * @ ---------- ---------- ---------------------------
   * @ 2024.11.25     손민성       최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 계량현황 조회</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start;">
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 계량현황조회 -->
      </div>
      <%--            /** 상단 버튼 **/--%>
      <div style="margin-left: auto;">
        <%--                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_create"></sbux-button>--%>
        <sbux-button disabled="true" id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
        <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
        <%--                <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>--%>
        <%--                <sbux-button disabled="true" id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>--%>
      </div>
    </div>
    <div class="box-body">
      <%@ include file="../../../frame/inc/apcSelect.jsp" %>
      <table class="table table-bordered tbl_fixed">
        <colgroup>
          <col style="width: 7%">
          <col style="width: 6%">
          <col style="width: 6%">
          <col style="width: 3%">
          <col style="width: 7%">
          <col style="width: 6%">
          <col style="width: 3%">
          <col style="width: 3%">
          <col style="width: 3%">
          <col style="width: 7%">
          <col style="width: 6%">
          <col style="width: 3%">
          <col style="width: 6%">
        </colgroup>
        <tbody>
        <tr>
          <th scope="row" class="th_bg">계획일자</th>
          <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
            <sbux-datepicker id="srch-slt-wghYmd"
                             name="srch-slt-wghYmd"
                             class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                             wrap-style="width:80%"
                             uitype="popup">
            </sbux-datepicker>
          </td>
          <th scope="row" class="th_bg">계획번호</th>
          <td class="td_input" colspan="4" style="border-right: hidden;border-top: hidden">
            <sbux-select id="srch-slt-sortFcltCd"
                         name="srch-slt-sortFcltCd"
                         uitype="single"
                         unselected-text="전체"
                         class="form-control input-sm"
                         style="width: 80%"
                         jsondata-ref="jsonSortFclt">
            </sbux-select>
          </td>
          <td colspan="4" style="border-top: hidden"></td>
        </tr>
        </tbody>
      </table>
      <div style="display: flex; flex-direction: column; gap: 10px;margin-top: 15px">
        <div style="flex: 1">
          <div style="display: flex; justify-content: space-between;margin-bottom: 10px">
                        <span style="margin-right: 3px; font-weight: 600; color: #3c6dbc;align-content: end">
                           실사 재고 목록
                        </span>
            <div style="display: flex">
              <div style="font-size: 13px;
                            text-align: right; border-color: #e8f1f9;width: 150px;
                            background-color: #e8f1f9; font-weight: 700;padding: 8px"
              >실사일자
              </div>
              <div class="td_input">
                <sbux-datepicker id="srch-dtl-wghYmd1"
                                 name="srch-dtl-wghYmd1"
                                 class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                                 uitype="popup">
                </sbux-datepicker>
              </div>
            </div>
          </div>
          <div id="sb-area-rtnCrtr"></div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
<script type="application/javascript">
  /** grid 변수 셋팅 **/
  var jsonRtnCrtr = [];
  let gridRtnCrtr;

  window.addEventListener("DOMContentLoaded",function(){
    fn_init();
  });
  const fn_init = async function(){
    await fn_create_rtnCrtr();
  }

  const fn_create_rtnCrtr = async function(){
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-rtnCrtr';
    SBGridProperties.id = 'gridRtnCrtr';
    SBGridProperties.jsonref = 'jsonRtnCrtr';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.datamergefalseskip = true;
    SBGridProperties.columns = [
      {caption: [""],	ref: 'fcltCd',		type:'output',  width:'6%', style: 'text-align:center;'},
      {caption: ["기준명"],	ref: 'wghYmd',		type:'output',  width:'20%', style: 'text-align:center;'},
      {caption: ["품목"],	ref: 'wghFcltCd',		type:'output',  width:'12%', style: 'text-align:center;'},
      {caption: ["품종"],	ref: 'wghFcltCd',		type:'output',  width:'12%', style: 'text-align:center;'},
      {caption: ["수량"],	ref: 'vhclno',		type:'output',  width:'12%', style: 'text-align:center;'},
      {caption: ["중량"],	ref: 'vhclno',		type:'output',  width:'12%', style: 'text-align:center;'},
      {caption: ["저장위치"],	ref: 'vhclno',		type:'output',  width:'13%', style: 'text-align:center;'},
      {caption: ["비고"],	ref: 'vhclno',		type:'output',  width:'13%', style: 'text-align:center;'},
    ]
    gridRtnCrtr = _SBGrid.create(SBGridProperties);
  }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>