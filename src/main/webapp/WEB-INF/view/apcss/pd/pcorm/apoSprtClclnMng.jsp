<%
  /**
   * @Class Name : apoSprtClclnMng.jsp
   * @Description : 산지조직지원 정산관리
   * @author SI개발부
   * @since 2025.7.8
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2025.07.07   유민지	    최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 산지조직지원정산관리</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
  <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<style>
  .btnClass {
    vertical-align: middle;
    line-height: normal;
    padding-top: 2px;
  }

  .btnClass:hover {
    background-color: #0d6efd;
    color: white;
  }

  table.sub td {
    background-color: #f5fafe;
    color: black;
    height: 24px;
    border: 1px solid #e8f1f9;
    text-align: center;
    padding: 4px;
  }
</style>
<body oncontextmenu="return false">
<section>
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start;" >
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 산지조직지원정산관리 -->
      </div>
      <div style="margin-left: auto;">
        <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
      </div>
    </div>
    <div class="box-body">

      <table class="table table-bordered tbl_fixed">
        <caption>산지조직지원 정산관리</caption>
        <tbody>
        <tr>
          <th scope="row" class="th_bg">연도</th>
          <td class="td_input">
            <sbux-spinner id="dtl-spi-yr" name="dtl-spi-yr" uitype="normal" class="form-control input-sm" step-value="1" wrap-style="width:100%;"></sbux-spinner>
          </td>
          <th scope="row" class="th_bg">사업자번호</th>
          <td class="td_input">
            <sbux-input id="dtl-inp-brno" name="dtl-inp-brno" uitype="text" class="form-control input-sm" ></sbux-input>
          </td>
          <th scope="row" class="th_bg">법인명</th>
          <td class="td_input">
            <sbux-input id="dtl-inp-corpNm" name="dtl-inp-corpNm" uitype="text" class="form-control input-sm" ></sbux-input>
          </td>
        </tr>
        </tbody>
      </table>

      <div style="height: 10px"></div>

      <div>
        <sbux-tabs
                id="idxTab_norm"
                name="idxTab_norm"
                uitype="normal"
                is-scrollable="false"
                jsondata-ref="tabJsonData"
        ></sbux-tabs>

        <div class="tab-content" style="height: 600px">
          <div id="dtbnMngTab"><%--교부관리--%>
            <div class="ad_tbl_top">
              <ul class="ad_tbl_count">
                <li>
                  <span>교부 관리</span>
                  <span style="font-size:12px">(조회건수 <span id="dtbnMngList">0</span>건 )</span>
                </li>
              </ul>
              <%--저장버튼--%>
              <%--        <div><sbux-button id="btnSaveDtbnMng" name="btnSaveDtbnMng" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_saveDtbnMng"></sbux-button></div>--%>
            </div>
            <div class="ad_tbl_toplist"></div>
            <div id="sb-area-dtbnMng" style="height: 300px"></div>

            <%--교부관리 소계--%>
            <table class="sub" style="width: 100%; table-layout: fixed; border-collapse: collapse; font-size: 13px; margin-top: 3px;">
              <colgroup>
                <col style="width: 3%">
                <col style="width: 5%">
                <col style="width: 10%">
                <col style="width: 7%">
                <col style="width: 5%">
                <col style="width: 5%">
                <col style="width: 5%">
                <col style="width: 8%">
                <col style="width: 8%">
                <col style="width: 7%">
                <col style="width: 8%">
                <col style="width: 7%">
                <col style="width: 5%">
                <col style="width: 14%">
              </colgroup>
              <tr>
                <td>소계</td>
                <td colspan="3"></td>
                <td>제출 : <span id="dtbnAplySbmsn">0</span> 개</td>
                <td>확인 : <span id="dtbnAplyAplyAprv">0</span> 개</td>
                <td></td>

                <td><span id="rpnAmtNe">0</span></td>
                <td><span id="dtbnDcsnAmt1"></span></td>
                <td></td>
                <td><span id="dtbnDcsnAmt2"></span></td>
                <td></td>
                <td><span id="blnc"></span></td>
                <td></td>
              </tr>
            </table>

            <div style="height: 10px"></div>

            <div class="ad_tbl_top">
              <ul class="ad_tbl_count">
                <li><span>교부신청서 등록</span></li>
              </ul>
            </div>

            <table class="table table-bordered tbl_fixed">

              <caption>교부신청서 법인 정보</caption>
              <tbody>
              <tr>
                <th scope="row" class="th_bg">법인명</th>
                <td class="td_input">
                  <sbux-input id="dtl-inp-dtbnMngCorpNm" name="dtl-inp-dtbnMngCorpNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                </td>
                <th scope="row" class="th_bg">사업자번호</th>
                <td class="td_input">
                  <sbux-input id="dtl-inp-dtbnMngBrno" name="dtl-inp-dtbnMngBrno" uitype="text" class="form-control input-sm" mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}" readonly></sbux-input>
                </td>
                <%--<th scope="row" class="th_bg">법인등록번호</th>
                <td class="td_input">
                  <sbux-input id="dtl-inp-dtbnMngCrno" name="dtl-inp-dtbnMngCrno" uitype="text" class="form-control input-sm" readonly></sbux-input>
                </td>--%>
                <sbux-input id="dtl-inp-dtbnSprtBizYr" name="dtl-inp-dtbnSprtBizYr" uitype="hidden"></sbux-input>
                <sbux-input id="dtl-inp-dtbnSprtBizCd" name="dtl-inp-dtbnSprtBizCd" uitype="hidden"></sbux-input>
                <sbux-input id="dtl-inp-dtbnSprtOgnzId" name="dtl-inp-dtbnSprtOgnzId" uitype="hidden"></sbux-input>
              </tr>
              </tbody>
            </table>

            <div style="height: 10px"></div>

            <table class="table table-bordered tbl_fixed">
              <caption>교부신청서 등록</caption>
              <colgroup>
                <col style="width: 20%">
                <col style="width: 30%">
                <col style="width: 10%">
                <col style="width: 35%">
                <col style="width: 5%">
              </colgroup>
              <tbody>
              <tr>
                <th scope="row" class="th_bg text-center">제출서류</th>
                <th scope="row" class="th_bg text-center">기제출서류</th>
                <th scope="row" class="th_bg text-center">확인여부</th>
                <th scope="row" class="th_bg text-center">신규(변경) 제출서류</th>
                <th scope="row" class="th_bg text-center"></th>
              </tr>
              <tr>
                <th scope="row" class="th_bg text-center">교부신청서(pdf)</th>
                <%--기제출서류--%>
                <td class="td_input">
                  <sbux-input id="dtl-inp-exsDtbnAplyDoc" name="dtl-inp-exsDtbnAplyDoc" uitype="text" class="form-control input-sm" readonly></sbux-input>
                </td>
                <%--확인여부--%>
                <td class="td_input">
                  <sbux-input id="dtl-inp-dtbnAplyDocIdntyYn" name="dtl-inp-dtbnAplyDocIdntyYn" uitype="text" class="form-control input-sm" readonly></sbux-input>
                </td>
                <%--파일선택--%>
                <td class="td_input" style="border-right: hidden">
                  <input type="file" id="dtbnAplyDoc" onchange="fn_selectFilePdf(this.files,'dtbnAplyDoc')">
                </td>
                <td class="td_input text-center">
                  <sbux-button id="btnSbmsnDtbnAplyDoc" name="btnSbmsnDtbnAplyDoc" uitype="normal" text="제출" class="btn btn-sm btn-primary" onclick="fn_sbmsnDtbnAply()"></sbux-button>
                </td>
              </tr>
              </tbody>
            </table>

            <%--관리자화면에만 보이도록 설정--%>
            <c:if test="${loginVO.untyAuthrtType eq '00' || loginVO.untyAuthrtType eq '10'}">
              <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                  <li><span>교부결정서 등록</span></li>
                </ul>
              </div>

              <table class="table table-bordered tbl_fixed">
                <caption>교부 관리 교부결정서 등록</caption>
                <colgroup>
                  <col style="width: 20%">
                  <col style="width: 30%">
                  <col style="width: 45%">
                  <col style="width: 5%">
                </colgroup>
                <tbody>
                <tr>
                  <th scope="row" class="th_bg text-center"></th>
                  <th scope="row" class="th_bg text-center">기제출서류</th>
                  <th scope="row" class="th_bg text-center">제출서류</th>
                  <th scope="row" class="th_bg text-center"></th>
                </tr>
                <tr>
                  <th scope="row" class="th_bg text-center">1차 교부결정서(pdf)</th>
                    <%--제출서류--%>
                  <td class="td_input">
                    <sbux-input id="dtl-inp-exsDtbnDcsnDoc1" name="dtl-inp-exsDtbnDcsnDoc1" uitype="text" class="form-control input-sm" readonly></sbux-input>
                  </td>
                    <%--파일선택--%>
                  <td class="td_input" style="border-right: hidden">
                    <input type="file" id="dtbnDcsnDoc1" accept=".pdf">
                  </td>
                  <td class="td_input text-center">
                    <sbux-button id="btnSbmsnDtbnDcsnDoc1" name="btnSbmsnDtbnDcsnDoc1" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_sbmsnDtbnDcsnDoc(1)"></sbux-button>
                  </td>
                </tr>

                <tr>
                  <th scope="row" class="th_bg text-center">2차 교부결정서(pdf)</th>
                    <%--제출서류--%>
                  <td class="td_input">
                    <sbux-input id="dtl-inp-exsDtbnDcsnDoc2" name="dtl-inp-exsDtbnDcsnDoc2" uitype="text" class="form-control input-sm" readonly></sbux-input>
                  </td>
                    <%--파일선택--%>
                  <td class="td_input" style="border-right: hidden">
                    <input type="file" id="dtbnDcsnDoc2" accept=".pdf">
                  </td>
                  <td class="td_input text-center">
                    <sbux-button id="btnSbmsnDtbnDcsnDoc2" name="btnSbmsnDtbnDcsnDoc2" uitype="normal" text="등록" class="btn btn-sm btn-primary" onclick="fn_sbmsnDtbnDcsnDoc(2)"></sbux-button>
                  </td>
                </tr>
                </tbody>
              </table>
            </c:if>
          </div>

          <%--산지조직지원 정산신청--%>
          <div id="clclnAplyTab">
            <div class="ad_tbl_top">
              <ul class="ad_tbl_count">
                <li>
                  <span>산지조직지원 정산신청</span>
                  <span style="font-size:12px">(조회건수 <span id="clclnAplyList">0</span>건 )</span>
                </li>
              </ul>
            </div>
            <div class="ad_tbl_toplist"></div>
            <div id="sb-area-clclnAply" style="height: 300px"></div>

            <div style="height: 10px"></div>

            <table class="table table-bordered tbl_fixed">
              <colgroup>
                <col style="width: 10%">
                <col style="width: 10%">
                <col style="width: 15%">
                <col style="width: 25%">
                <col style="width: 15%">
                <col style="width: 25%">
              </colgroup>
              <caption>정산신청</caption>
              <tbody>
              <tr>
                <th scope="row" class="th_bg">회차</th>
                <td class="td_input">
                  <%--<sbux-input id="dtl-inp-clclnAplySeq" name="dtl-inp-clclnAplySeq" uitype="text" class="form-control input-sm" readonly></sbux-input>--%>
                  <sbux-select id="dtl-slt-clclnAplySeq" name="dtl-slt-clclnAplySeq" class="form-control input-sm" uitype="single" jsondata-ref="jsonClclnSeq"></sbux-select>
                </td>
                <th scope="row" class="th_bg">법인명</th>
                <td class="td_input">
                  <sbux-input id="dtl-inp-clclnAplyCorpNm" name="dtl-inp-clclnAplyCorpNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                </td>
                <th scope="row" class="th_bg">사업자번호</th>
                <td class="td_input">
                  <sbux-input id="dtl-inp-clclnAplyBrno" name="dtl-inp-clclnAplyBrno" uitype="text" class="form-control input-sm" mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}" readonly></sbux-input>
                </td>

                <sbux-input id="dtl-inp-clclnAplySprtBizYr" name="dtl-inp-clclnAplySprtBizYr" uitype="hidden"></sbux-input>
                <sbux-input id="dtl-inp-clclnAplySprtBizCd" name="dtl-inp-clclnAplySprtBizCd" uitype="hidden"></sbux-input>
                <sbux-input id="dtl-inp-clclnAplySprtOgnzId" name="dtl-inp-clclnAplySprtOgnzId" uitype="hidden"></sbux-input>
              </tr>
              </tbody>
            </table>
            <div style="height: 10px"></div>

            <%--정산요청서--%>
            <div class="ad_tbl_top">
              <ul class="ad_tbl_count">
                <li><span>정산요청서 등록</span></li>
              </ul>
            </div>
            <table class="table table-bordered tbl_fixed">
              <colgroup>
                <col style="width: 20%">
                <col style="width: 30%">
                <col style="width: 10%">
                <col style="width: 35%">
                <col style="width: 5%">
              </colgroup>
              <caption>정산요청서</caption>
              <tbody>
              <tr>
                <th scope="row" class="th_bg text-center"></th>
                <th scope="row" class="th_bg text-center">기제출서류</th>
                <th scope="row" class="th_bg text-center">확인여부</th>
                <th scope="row" class="th_bg text-center">신규(변경) 제출서류</th>
                <th scope="row" class="th_bg text-center"></th>
              </tr>
              <tr>
                <th scope="row" class="th_bg text-center">정산요청서(pdf)</th>
                <%--기제출서류--%>
                <td class="td_input">
                  <sbux-input id="dtl-inp-exsClclnAplyDoc" name="dtl-inp-exsClclnAplyDoc" uitype="text" class="form-control input-sm" readonly></sbux-input>
                </td>
                <%--확인여부--%>
                <td class="td_input">
                  <sbux-input id="dtl-inp-clclnAplyDocAprvYn" name="dtl-inp-clclnAplyDocAprvYn" uitype="hidden" class="form-control input-sm" readonly></sbux-input>
                  <sbux-input id="dtl-inp-clclnAplyDocAprvYnNm" name="dtl-inp-clclnAplyDocAprvYnNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                </td>
                <%--파일선택--%>
                <td class="td_input" style="border-right: hidden">
                  <input type="file" id="clclnAplyDoc" onchange="fn_selectFilePdf(this.files,'clclnAplyDoc')">
                </td>
                <td class="td_input">
                  <sbux-button id="btnSbmsnClclnAplyDoc" name="btnSbmsnClclnAplyDoc" uitype="normal" text="제출" class="btn btn-sm btn-primary" onclick="fn_sbmsnClclnAplyDoc(2)"></sbux-button>
                </td>
              </tr>
              <tr>
                <th scope="row" class="th_bg text-center">엑셀 세부내역서</th>
                <%--기제출서류--%>
                <td class="td_input">
                  <sbux-input id="dtl-inp-exsExcelDsctnDoc" name="dtl-inp-exsExcelDsctnDoc" uitype="text" class="form-control input-sm" readonly></sbux-input>
                </td>
                <%--확인여부--%>
                <td class="td_input">
                  <sbux-input id="dtl-inp-excelDsctnDocAprvYn" name="dtl-inp-excelDsctnDocAprvYn" uitype="hidden" class="form-control input-sm" readonly></sbux-input>
                  <sbux-input id="dtl-inp-excelDsctnDocAprvYnNm" name="dtl-inp-excelDsctnDocAprvYnNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                </td>
                <%--파일선택--%>
                <td class="td_input" style="border-right: hidden">
                  <input type="file" id="excelDsctnDoc" onchange="fn_selectFileExcel(this.files,'excelDsctnDoc')">
                </td>
                <td class="td_input">
                  <sbux-button id="btnSbmsnClclnExcelDoc" name="btnSbmsnClclnExcelDoc" uitype="normal" text="제출" class="btn btn-sm btn-primary" onclick="fn_sbmsnClclnAplyDoc(3)"></sbux-button>
                </td>
              </tr>
              <tr>
                <th scope="row" class="th_bg text-center">증빙서류 체크리스트(pdf)</th>
                <%--기제출서류--%>
                <td class="td_input">
                  <sbux-input id="dtl-inp-exsClclnCheckList" name="dtl-inp-exsClclnCheckList" uitype="text" class="form-control input-sm" readonly></sbux-input>
                </td>
                <%--확인여부--%>
                <td class="td_input">
                  <sbux-input id="dtl-inp-clclnCheckListAprvYn" name="dtl-inp-clclnCheckListAprvYn" uitype="hidden" class="form-control input-sm" readonly></sbux-input>
                  <sbux-input id="dtl-inp-clclnCheckListAprvYnNm" name="dtl-inp-clclnCheckListAprvYnNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
                </td>
                <%--파일선택--%>
                <td class="td_input" style="border-right: hidden">
                  <input type="file" id="clclnCheckList" onchange="fn_selectFilePdf(this.files,'clclnCheckList')">
                </td>
                <td class="td_input">
                  <sbux-button id="btnSbmsnClclnChkDoc" name="btnSbmsnClclnChkDoc" uitype="normal" text="제출" class="btn btn-sm btn-primary" onclick="fn_sbmsnClclnAplyDoc(4)"></sbux-button>
                </td>
              </tr>
              </tbody>
            </table>

            <div style="height: 10px"></div>
            <%--정산신청 증빙서류--%>
         <%--   <div>
              <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                  <li><span>정산신청 증빙서류 제출</span></li>
                </ul>
                <div>
                  <sbux-button id="btnSbmsnPrufAddRow" name="btnSbmsnPrufAddRow" uitype="normal" text="항목추가" class="btn btn-sm btn-primary" onclick="fn_prufAddRow"></sbux-button>
                  <sbux-button id="btnSbmsnPrufDelRow" name="btnSbmsnPrufDelRow" uitype="normal" text="행삭제" class="btn btn-sm btn-primary" onclick="fn_prufDelRow"></sbux-button>
                  <sbux-button id="btnSbmsnPrufDoc" name="btnSbmsnPrufDoc" uitype="normal" text="증빙서류제출" class="btn btn-sm btn-primary" onclick="fn_clclnPrufSbmsn"></sbux-button>
                </div>
              </div>

              &lt;%&ndash;증빙서류&ndash;%&gt;
              <div class="clclnPruf-wrap">

                <div class="prufTableWrap">
                  <div class="prufTableScroll">
                    <table class="table table-bordered tbl_fixed">
                      <colgroup>
                        <col style="width: 3%">
                        <col style="width: 10%">
                      </colgroup>
                      <tr>
                        <th scope="col" class="th_bg text-center">선택</th>
                        <th scope="col" class="th_bg text-center">주요항목</th>
                        <th scope="col" class="th_bg text-center">세부항목</th>
                        <th scope="col" class="th_bg text-center">내용</th>
                        <th scope="col" class="th_bg text-center">정산요청액(원)</th>
                        <th scope="col" class="th_bg text-center">공통증빙</th>
                        <th scope="col" class="th_bg text-center">세부증빙</th>
                        <th scope="col" class="th_bg text-center">비고</th>
                      </tr>
                      <tbody id="pruf-tbody"></tbody>
                    </table>
                  </div>
                 &lt;%&ndash; <div class="sum">
                    <span>총 건수: <strong id="clcln-count">0</strong> 건</span>
                    <span>합계: <strong class="money" id="clcln-total">0</strong> 원</span>
                  </div>&ndash;%&gt;
                </div>
            </div>
            </div>--%>

          </div>

          <div id="clclnRsltTab"><%--정산결과--%>
            <div class="ad_tbl_top">
              <ul class="ad_tbl_count">
                <li>
                  <span>산지조직지원 정산결과</span>
                  <span style="font-size:12px">(조회건수 <span id="clclnRsltList">0</span>건 )</span>
                </li>
              </ul>
              <%--저장버튼--%>
              <%--        <div><sbux-button id="btnSaveClclnRslt" name="btnSaveClclnRslt" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_saveClclnAply"></sbux-button></div>--%>
            </div>
            <div class="ad_tbl_toplist"></div>
            <div id="sb-area-clclnRslt" style="height: 300px"></div>
          </div>
        </div>
      </div>

    </div>
  </div>

</section>

</body>
<script type="text/javascript">

  /** 증빙코드 **/
  var jsonCmnsPrufCd = []; // 공통증빙코드
  var jsonPrufCd = []; // 세부

  /** 정산 신청 **/
  var gridClclnAply;
  var jsonClclnAply = [];

  /** 정산 결과 **/
  var gridClclnRslt;
  var jsonClclnRslt = [];

  /** 교부 관리 **/
  var gridDtbnMng;
  var jsonDtbnMng = [];

  /** tab **/
  var tabJsonData = [
    { "id" : "0", "pid" : "-1", "order" : "1", "text" : "교부관리", "targetid" : "dtbnMngTab", "targetvalue" : "교부관리" },
    { "id" : "1", "pid" : "-1", "order" : "2", "text" : "정산신청", "targetid" : "clclnAplyTab", "targetvalue" : "정산신청" },
    { "id" : "2", "pid" : "-1", "order" : "2", "text" : "정산결과", "targetid" : "clclnRsltTab", "targetvalue" : "정산결과" },
  ];

  /** 차수 **/
  var jsonClclnSeq = [
    {value : "1", text :"1차"},
    {value : "2", text :"2차"},
  ]

  window.addEventListener('DOMContentLoaded', async function(e) {
    await fn_init()
  });

  /**
   * @name fn_init
   * @description fn_init
   */
  const fn_init = async function() {
    fn_createClclnAplyGrid(); // 정산신청 그리드
    fn_createClclnRsltGrid(); // 정산결과 그리드
    fn_createDtbnMng(); // 교부관리 그리드
    SBUxMethod.set('dtl-spi-yr',gfn_dateToYear(new Date())); // 연도
<%--    <c:if test="${loginVO.userType eq '10' || loginVO.userType eq '21'}">--%>
<%--      SBUxMethod.set('dtl-inp-brno',${loginVO.brno});--%>
<%--      SBUxMethod.set('dtl-inp-corpNm',${loginVO.corpNm});--%>
<%--      SBUxMethod.attr('dtl-inp-brno', 'disabled', 'true');--%>
<%--      SBUxMethod.attr('dtl-inp-corpNm', 'disabled', 'true');--%>
<%--    </c:if>--%>
    await fn_searchPrufCd(); // 증빙코드 조회
    fn_search();
  }

  const fn_searchPrufCd = async function() {
    const sprtBizYr = SBUxMethod.get('dtl-spi-yr');

    const postJsonPromise = gfn_postJSON("/pd/sprt/selectSprtPrufCdList.do", {
      sprtBizYr: sprtBizYr,
      sprtBizCd: 'SRPT_001',
      artclKnd: 'PRUF_ARTCL_KND'
    });

    const data = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus)) {
        data.resultList.forEach(item => {
          const artclKnd = item.artclKnd; // 항목종류
          const majorNm = item.majorArtclNm; // 주요항목
          const majorCd = item.majorArtclCd; // 주요항목
          const majorSeq = item.majorArtclIndctSeq; // 주요항목 순서
          const subNm   = item.dtlArtclNm;   // 세부항목
          const subCd   = item.dtlArtclCd;   // 세부항목
          const subSeq = item.dtlArtclIndctSeq; // 세부항목순서
          const prufKnd  = item.prufArtclKnd;       // 증빙종류
          const prufCd  = item.prufArtclCd;       // 증빙코드
          const prufNm  = item.prufIndctNm;       // 증빙명
          const prufSeq = item.prufIndctSeq; // 증빙순서


          if (majorCd === "PRUF_BSC") { // 공통증빙
            if (!jsonCmnsPrufCd[subCd]) {
              jsonCmnsPrufCd.push({
                artclKnd : artclKnd,
                majorCd : majorCd,
                majorNm : majorNm,
                majorSeq : majorSeq,
                subCd : subCd,
                subNm : subNm,
                subSeq : subSeq,
                atrbCd : item.majorAtrbCd,
                value : subCd,
                text : subNm
              });
            }

          } else { // 세부
            if (!jsonPrufCd[majorCd]) {
              jsonPrufCd[majorCd] = {
                name: majorNm,
                cd : majorCd,
                majorSeq : majorSeq,
                subItems: {}
              };
            }

            if (!jsonPrufCd[majorCd].subItems[subCd]) {
              jsonPrufCd[majorCd].subItems[subCd] = {
                name: subNm,
                cd : subCd,
                subSeq : subSeq,
                pruf: []
              };
            }

            jsonPrufCd[majorCd].subItems[subCd].pruf.push({
              prufKnd,
              prufCd,
              prufNm,
              prufSeq
            });
          }
        });

      }

      } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }
  }

  /**
   * @name fn_createClclnAplyGrid
   * @description 정산신청 그리드
   */
  const fn_createClclnAplyGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-clclnAply';
    SBGridProperties.id = 'gridClclnAply';
    SBGridProperties.jsonref = 'jsonClclnAply';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.allowcopy = true;
    SBGridProperties.extendlastcol = 'scroll';
    //SBGridProperties.mergecells = 'bycol';

    SBGridProperties.columns = [
      {caption: ['연도','연도'],			ref: 'sprtBizYr', 	    width: '5%', type: 'output',style: 'text-align:center', merge : false},
      {caption: ['법인명','법인명'], 			ref: 'corpNm', 	width: '15%', type: 'output', style: 'text-align:left',userattr : {colNm :"corpNm"}},
      {caption: ['회차','회차'], 			ref: 'clclnSeqNm', 		width: '6%', type: 'output', style: 'text-align:center', merge : false},
      {caption: ['정산가능액(A)\n(천원)','정산가능액(A)\n(천원)'], 			ref: 'clclnPsbltyAmt', 		width: '7%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}, merge : false},
      {caption: ['정산요청서','제출여부'], 			ref: 'clclnDmndSbmsnYn', 		width: '7%', type: 'output', style: 'text-align:center', merge : false},
      {caption: ['정산요청서','확인여부'], 			ref: 'clclnDmndAprvYn', 		width: '7%', type: 'output', style: 'text-align:center', merge : false},
      {caption: ['정산요청서','미리보기'], 			ref: 'clclnDmndPrvw', 		width: '7%', type: 'button', style: 'text-align:center',typeinfo : {buttonclass:'btn btn-sm btn-outline-danger btnClass', buttonvalue: '팝업 열기', callback: fn_openClclnAplyPrvw}, merge : false},
      {caption: ['정산요청서','정산요청액'], 			ref: 'clclnDmndAmt', 		width: '7%', type: 'output', style: 'text-align:center', merge : false},
      {caption: ['증빙서류','제출여부'], 			ref: 'prufSbmsnYn', 	width: '7%', type: 'output', style: 'text-align:right', merge : false},
      {caption: ['증빙서류','확인여부'], 			ref: 'prufAprvYn', 		width: '7%', type: 'output', style: 'text-align:center', merge : false},
      {caption: ['증빙서류','미리보기'], 			ref: 'prufPrvw', 		width: '7%', type: 'button', style: 'text-align:center',typeinfo : {buttonclass:'btn btn-sm btn-outline-danger btnClass', buttonvalue: '팝업 열기'}, merge : false},
      {caption: ['증빙서류','비고'], 			ref: 'prufRmrk', 		width: '23%', type: 'input', style: 'text-align:left', merge : false},
    ];
    gridClclnAply = _SBGrid.create(SBGridProperties);
    gridClclnAply.bind('click','fn_clickGridClclnAply');
  }


  /**
   * @name fn_createClclnRsltGrid
   * @description 정산결과 그리드
   */
  const fn_createClclnRsltGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-clclnRslt';
    SBGridProperties.id = 'gridClclnRslt';
    SBGridProperties.jsonref = 'jsonClclnRslt';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.allowcopy = true;
    SBGridProperties.extendlastcol = 'scroll';

    SBGridProperties.columns = [
      {caption: ['연도','연도'],			ref: 'yr', 	    width: '6%', type: 'output',style: 'text-align:center'},
      {caption: ['법인명','법인명'], 			ref: 'corpNm', 	width: '16%', type: 'output', style: 'text-align:left'},
      {caption: ['회차','회차'], 			ref: 'tngtrn', 		width: '6%', type: 'output', style: 'text-align:center'},
      {caption: ['정산가능액(A)\n(천원)','정산가능액(A)\n(천원)'], 			ref: 'clclnPsbltyAmt', 		width: '11%', type: 'output', style: 'text-align:center'},
      {caption: ['정산요청액','정산요청액'], 			ref: 'clclnDmndAmt', 		width: '11%', type: 'output', style: 'text-align:center',typeinfo : {buttonclass:'btnClass', buttonvalue: '팝업 열기', callback: fn_openDtbnAplyDocPrvw}},
      {caption: ['정산인정액(B)\n(천원)','정산인정액(B)\n(천원)'], 			ref: 'clclnAprvAmt', 		width: '11%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}, userattr : {colNm :"rpnAmtNe"}},
      {caption: ['잔액','불인정'], 			ref: 'blncUnaprv', 		width: '11%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'},userattr : {colNm :"dtbnDcsnAmt1"}},
      {caption: ['잔액','미사용액'], 			ref: 'blncUnuseAmt', 		width: '11%', type: 'input', style: 'text-align:center',typeinfo : {buttonvalue: '다운로드', callback: fn_dwnldDtbnDcsnDoc}},
      {caption: ['잔액','합계'], 			ref: 'blncTot', 		width: '11%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'},userattr : {colNm :"dtbnDcsnAmt2"}},
      {caption: ['집행률','집행률'], 			ref: 'implRt', 		width: '11%', type: 'output', style: 'text-align:center',typeinfo : {buttonvalue: '다운로드', callback: fn_dwnldDtbnDcsnDoc}},
    ];
    gridClclnRslt = _SBGrid.create(SBGridProperties);
  }


  /**
   * @name fn_createDtbnMng
   * @description 교부관리 그리드
   */
  const fn_createDtbnMng = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-dtbnMng';
    SBGridProperties.id = 'gridDtbnMng';
    SBGridProperties.jsonref = 'jsonDtbnMng';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.allowcopy = true;
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [

      {
        caption : ["<input type='checkbox' onchange='fn_checkAll(gridDtbnMng, this);'>","<input type='checkbox' onchange='fn_checkAll(gridDtbnMng, this);'>"],
        ref: 'checkedYn', type: 'checkbox',  width:'3%',
        style: 'text-align:center',
        userattr: {colNm: "checkedYn"},
        typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true, fixedcellcheckbox : {usemode : false, rowindex : 0}}
      },

      {caption: ['연도','연도'],			ref: 'yr', 	    width: '5%', type: 'output',style: 'text-align:center'},
      {caption: ['법인명','법인명'], 			ref: 'corpNm', 	width: '12%', type: 'output', style: 'text-align:left'},
      {caption: ['사업자번호','사업자번호'], 			ref: 'brno', 	width: '6%', type: 'output', style: 'text-align:center'},
      {caption: ['교부신청서','제출여부'], 			ref: 'dtbnAplyDocSbmsnYn', 		width: '5%', type: 'output', style: 'text-align:center'},
      {caption: ['교부신청서','확인여부'], 			ref: 'dtbnAplyDocAprvYn', 		width: '5%', type: 'output', style: 'text-align:center'},
      {caption: ['교부신청서','미리보기'], 			ref: 'dtbnAplyDocPrvw', 		width: '5%', type: 'button', style: 'text-align:center',typeinfo : {buttonclass:'btn btn-sm btn-outline-danger btnClass', buttonvalue: '팝업 열기', callback: fn_openDtbnAplyDocPrvw}},
      {caption: ['배정예산(국고 50)','배정예산(국고 50)'], 			ref: 'rpnAmtNe', 		width: '8%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}, userattr : {colNm :"rpnAmtNe"}},
      {caption: ['1차 교부결정액','금액'], 			ref: 'dtbnDcsnAmt1', 		width: '6%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'},userattr : {colNm :"dtbnDcsnAmt1"}},
      {caption: ['1차 교부결정액','교부결정서'], 			ref: 'dtbnDcsnDoc1', 		width: '6%', type: 'button', style: 'text-align:center',typeinfo : {buttonclass:'btn btn-sm btn-outline-danger btnClass', buttonvalue: '다운로드', callback: function(){fn_dwnldDtbnDcsnDoc(1)}}},
      {caption: ['2차 교부결정액','금액'], 			ref: 'dtbnDcsnAmt2', 		width: '6%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'},userattr : {colNm :"dtbnDcsnAmt2"}},
      {caption: ['2차 교부결정액','교부결정서'], 			ref: 'dtbnDcsnDoc2', 		width: '6%', type: 'button', style: 'text-align:center',typeinfo : {buttonclass:'btn btn-sm btn-outline-danger btnClass', buttonvalue: '다운로드', callback: function(){fn_dwnldDtbnDcsnDoc(2)}}},
      {caption: ['잔액','잔액'], 			ref: 'blnc', 		width: '7%', type: 'output', style: 'text-align:right; background-color: #eee',userattr : {colNm :"blnc"}},
      {caption: ['비고','비고'], 			ref: 'rmrk', 		width: '20%', type: 'output', style: 'text-align:center ; background-color: #eee'},
    ];
    gridDtbnMng = _SBGrid.create(SBGridProperties);
    gridDtbnMng.bind('valuechanged','fn_gridDtbnMngValueChange');
    gridDtbnMng.bind('click','fn_clickDtbnMngGrid');
  }

  /**
   * @name fn_clear
   * @description 초기화
   */
  const fn_clear = function () {
    // 교부 관리
    SBUxMethod.set('dtl-inp-dtbnMngCorpNm',null);
    SBUxMethod.set('dtl-inp-dtbnMngBrno',null);
    SBUxMethod.set('dtl-inp-dtbnSprtBizYr',null);
    SBUxMethod.set('dtl-inp-dtbnSprtBizCd',null);
    SBUxMethod.set('dtl-inp-dtbnSprtOgnzId',null);
    SBUxMethod.set('dtl-inp-exsDtbnAplyDoc',null);
    SBUxMethod.set('dtl-inp-dtbnAplyDocIdntyYn',null);

    document.querySelector('#dtbnAplyDoc').value = null;

    SBUxMethod.attr('btnSbmsnDtbnAplyDoc','disabled','true');

    // 교부결정서
    SBUxMethod.set('dtl-inp-exsDtbnDcsnDoc1',null);
    SBUxMethod.set('dtl-inp-exsDtbnDcsnDoc2',null);
    <c:if test="${loginVO.untyAuthrtType eq '00' || loginVO.untyAuthrtType eq '10'}">
      document.querySelector('#dtbnDcsnDoc1').value = null;
      document.querySelector('#dtbnDcsnDoc2').value = null;
    </c:if>

    // 정산신청
    SBUxMethod.set('dtl-inp-clclnAplySeq',null);
    SBUxMethod.set('dtl-inp-clclnAplyCorpNm',null);
    SBUxMethod.set('dtl-inp-clclnAplyBrno',null);
    SBUxMethod.set('dtl-inp-clclnAplySprtBizYr',null);
    SBUxMethod.set('dtl-inp-clclnAplySprtBizCd',null);
    SBUxMethod.set('dtl-inp-clclnAplySprtOgnzId',null);

    // 정산요청서
    SBUxMethod.set('dtl-inp-exsClclnAplyDoc',null); // 제출서류
    SBUxMethod.set('dtl-inp-clclnAplyDocAprvYn',null); // 확인여부
    SBUxMethod.set('dtl-inp-clclnAplyDocAprvYnNm',null); // 확인여부
    document.querySelector('#clclnAplyDoc').value = null;

    // 엑셀 세부내역서
    SBUxMethod.set('dtl-inp-exsExcelDsctnDoc',null); // 제출서류
    SBUxMethod.set('dtl-inp-excelDsctnDocAprvYn',null); // 확인여부
    SBUxMethod.set('dtl-inp-excelDsctnDocAprvYnNm',null); // 확인여부
    document.querySelector('#excelDsctnDoc').value = null;

    // 증빙서류 체크리스트
    SBUxMethod.set('dtl-inp-exsClclnCheckList',null); // 제출서류
    SBUxMethod.set('dtl-inp-clclnCheckListAprvYn',null); // 확인여부
    SBUxMethod.set('dtl-inp-clclnCheckListAprvYnNm',null); // 확인여부
    document.querySelector('#clclnCheckList').value = null;

  }

  /**
   * @name fn_search
   * @description 조회
   */
  const fn_search = async function () {
    await fn_searchClclnAply(); // 정산신청
    await fn_searchDtbnMng(); // 교부관리
  }
  /**
   * @name fn_searchDtbnMng
   * @description 교부신청 조회
   */
  const fn_searchDtbnMng = async function () {
    <%--console.log("untyAuthrtType","${loginVO.untyAuthrtType}","untyOgnzCd","${loginVO.untyOgnzCd}","apoSe","${loginVO.apoSe}", "userType", "${loginVO.userType}", "brno", "${loginVO.brno}","crno","${loginVO.crno}","corpNm","${loginVO.corpNm}");--%>
    fn_clear();
    jsonDtbnMng.length = 0;
    let brno = SBUxMethod.get('dtl-inp-brno');
    const crtrYr = SBUxMethod.get('dtl-spi-yr');
    const corpNm = SBUxMethod.get('dtl-inp-corpNm');

    <c:if test="${loginVO.userType ne '00' and loginVO.userType ne '01'}">
      brno = "${loginVO.brno}";
    </c:if>
    const postJsonPromise = gfn_postJSON("/pd/sprt/selectSprtBizClclnList.do", {
      crtrYr: crtrYr,
      brno: brno,
      corpNm: corpNm,
    });

    const data = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus)) {
        <c:if test="${loginVO.userType ne '00' and loginVO.userType ne '01'}">
          if (data.resultList.length == 1) {
            SBUxMethod.set('dtl-inp-brno',data.resultList[0].brno);
            SBUxMethod.set('dtl-inp-corpNm',data.resultList[0].corpNm);
            SBUxMethod.attr('dtl-inp-brno', 'disabled', 'true');
            SBUxMethod.attr('dtl-inp-corpNm', 'disabled', 'true');
          }
        </c:if>
        data.resultList.forEach(item => {
          // 제출
          let sbmsnYn;
          let atchFileSn = item.atchFileSn
          if (gfn_isEmpty(atchFileSn) || _.isEqual(atchFileSn,0)) {
            sbmsnYn = "미제출";
          } else if (atchFileSn > 0 && _.isEqual(item.chgYn, "Y")) {
            sbmsnYn = "제출(변경)";
          } else {
            sbmsnYn = "제출";
          }

          // 확인여부
          let aprvYnNm;
          if (gfn_isEmpty(atchFileSn) || _.isEqual(atchFileSn,0)) {
            aprvYnNm = null;
          } else if (atchFileSn > 0 && gfn_isEmpty(item.aprvYn)) {
            aprvYnNm = "미확인";
          } else if (atchFileSn > 0 && _.isEqual(item.aprvYn,"Y")) {
            aprvYnNm = "확인";
          } else if (atchFileSn > 0 && _.isEqual(item.aprvYn,"N")) {
            aprvYnNm = "수정요청";
          }

          const vo = {
            yr : item.sprtBizYr,
            sprtBizCd : item.sprtBizCd,
            sprtOgnzId : item.sprtOgnzId,
            aplyDocCd : item.aplyDocCd,
            corpNm : item.corpNm,
            brno : item.brno,
            crno : item.crno,
            dtbnAplyDocSbmsnYn : sbmsnYn,
            atchFileSn : item.atchFileSn,
            dtbnAplyDocAprvYn : aprvYnNm,
            aprvYn : item.aprvYn,
            rpnAmtNe : item.rpnAmtNe,
            rmrk : item.dtbnRmrk,
            lgcFileNm : item.lgcFileNm,

            rgtr : item.rgtr,
            regDt : item.regDt,
            idfr : item.idfr,
            idfrDt : item.idfrDt,

            // 교부결정
            clclnSeqFirst : item.clclnSeqFirst,
            docSeqFirst : item.docSeqFirst,
            atchFileSnFirst : item.atchFileSnFirst,
            lgcFileNmFirst : item.lgcFileNmFirst,
            dtbnDcsnAmt1 : item.dtbnDcsnAmtFirst,

            clclnSeqSecond : item.clclnSeqSecond,
            docSeqSecond : item.docSeqSecond,
            atchFileSnSecond : item.atchFileSnSecond,
            lgcFileNmSecond : item.lgcFileNmSecond,
            dtbnDcsnAmt2 : item.dtbnDcsnAmtSecond
          }
          jsonDtbnMng.push(vo);
        });

        document.querySelector('#dtbnMngList').innerText = data.resultList.length;
        fn_setTotal();
      } else {
        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
      }
      gridDtbnMng.refresh();
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }

  }

  /**
   * @name fn_gridDtbnMngValueChange
   * @description 교부관리그리드 값 변경
   */
  function fn_gridDtbnMngValueChange() {
    const row = gridDtbnMng.getRow();
    const col = gridDtbnMng.getCol();
    const colNm = gridDtbnMng.getColUserAttr(col).colNm;
    const rowData = gridDtbnMng.getRowData(row, false); // false : 'call by refrence'로 반환

    if (gfn_isEmpty(rowData)) {
      return;
    }
    if (gfn_isEmpty(colNm)) {
      return;
    }

    if (_.isEqual(colNm, "dtbnDcsnAmt1") || _.isEqual(colNm, "dtbnDcsnAmt2")) {
      const rpnAmtNe = rowData.rpnAmtNe;
      const dtbnDcsnAmt1 = rowData.dtbnDcsnAmt1;
      const dtbnDcsnAmt2 = rowData.dtbnDcsnAmt2;
      const blnc = rpnAmtNe - dtbnDcsnAmt1 - dtbnDcsnAmt2;
      rowData.blnc = blnc;
      rowData.checkedYn = 'Y'
      gridDtbnMng.refresh();
    }

   /* let checkedCount = 0;
    if (_.isEqual(colNm, "checkedYn")) {
      const allData = gridDtbnMng.getGridDataAll();

      for (let i = 0; i < allData.length; i++) {
        if (_.isEqual(allData[i].checkedYn, "Y")) {
          checkedCount++;
          let dtbnAplySbmsn = 0; // 교부신청서 제출
          let dtbnAplyAplyAprv = 0; // 교부신청서 확인
          let rpnAmtNe = 0; // 배정예산
          let dtbnDcsnAmt1 = 0; // 1차 교부결정액
          let dtbnDcsnAmt2 = 0; // 2차 교부결정액
          let blnc = 0; // 잔액

          for (let i = 0; i <allData.length; i++) {
            if(_.isEqual(allData[i].checkedYn,"Y")) {
              rpnAmtNe += parseInt(allData[i].rpnAmtNe || 0);
              blnc += parseInt(allData[i].blnc || 0);

              if (parseInt(allData[i].atchFileSn) > 0) {
                dtbnAplySbmsn++
              }
              if (_.isEqual(allData[i].aprvYn,"Y")) {
                dtbnAplyAplyAprv++
              }
            }
          }

          document.querySelector('#dtbnAplySbmsn').innerText = dtbnAplySbmsn;
          document.querySelector('#dtbnAplyAplyAprv').innerText = dtbnAplyAplyAprv;
          document.querySelector('#rpnAmtNe').innerText = rpnAmtNe.toLocaleString();
          gridDtbnMng.refresh();
        }
      }
    }
    if (checkedCount === 0 ) {
      fn_setTotal();
    }*/
    if (_.isEqual(colNm, "checkedYn")) {

      const allData = gridDtbnMng.getGridDataAll();

      if (gfn_isEmpty(allData)) {
        return;
      }

      const checkedData = allData.filter(item => item.checkedYn === "Y");

      if (checkedData.length === 0) {
        fn_calcDtbnSum(allData); // 전체
      } else {
        fn_calcDtbnSum(checkedData); // 선택
      }
      gridDtbnMng.refresh();
    }
  }

  /**
   * @name fn_clickDtbnMngGrid
   * @description 교부관리그리드 클릭 이벤트
   */
  const fn_clickDtbnMngGrid = function () {
    fn_clear();

    const row = gridDtbnMng.getRow();
    const rowData = gridDtbnMng.getRowData(row);

    if (gfn_isEmpty(rowData)) {
      return;
    }

    SBUxMethod.set('dtl-inp-dtbnMngCorpNm',rowData.corpNm); // 법인명
    SBUxMethod.set('dtl-inp-dtbnMngBrno',rowData.brno); // 사업자번호
    SBUxMethod.set('dtl-inp-dtbnSprtBizYr',rowData.yr); // 지업사업연도
    SBUxMethod.set('dtl-inp-dtbnSprtBizCd',rowData.sprtBizCd); // 지업사업코드
    SBUxMethod.set('dtl-inp-dtbnSprtOgnzId',rowData.sprtOgnzId); // 지업조직아이디

    SBUxMethod.set('dtl-inp-exsDtbnAplyDoc',rowData.lgcFileNm); // 기제출서류
    SBUxMethod.set('dtl-inp-dtbnAplyDocIdntyYn',rowData.dtbnAplyDocAprvYn); // 확인여부

    // 교부결정서
    SBUxMethod.set('dtl-inp-exsDtbnDcsnDoc1',rowData.lgcFileNmFirst);
    SBUxMethod.set('dtl-inp-exsDtbnDcsnDoc2',rowData.lgcFileNmSecond);

    const aprvYn = rowData.aprvYn;

    if (_.isEqual(aprvYn,"Y")) {
      SBUxMethod.attr('btnSbmsnDtbnAplyDoc','disabled','true');
    } else {
      SBUxMethod.attr('btnSbmsnDtbnAplyDoc','disabled','false');
    }
  }

  /**
   * @name fn_openDtbnAplyDocPrvw
   * @description 교부신청서 미리보기
   */
  const fn_openDtbnAplyDocPrvw = function (){
    const row = gridDtbnMng.getRow();
    const rowData = gridDtbnMng.getRowData(row);

    if (gfn_isEmpty(rowData)) {
      return;
    }

    const brno = rowData.brno;

    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
      return;
    }

    const url = "/pd/sprt/dtbnAplyPrvwPopup.do";
    const title = "교부신청서 미리보기";
    window.open(url, title, "width=1000px,height=900px");
  }

  /**
   * @name fn_sbmsnDtbnAply
   * @description 교부신청서 제출
   */
  const fn_sbmsnDtbnAply = function (){
    const corpNm = SBUxMethod.get('dtl-inp-dtbnMngCorpNm'); // 법인명
    const brno = SBUxMethod.get('dtl-inp-dtbnMngBrno'); // 사업자번호
    const sprtBizYr = SBUxMethod.get('dtl-inp-dtbnSprtBizYr'); // 지업사업연도
    const sprtBizCd = SBUxMethod.get('dtl-inp-dtbnSprtBizCd'); // 지업사업코드
    const sprtOgnzId = SBUxMethod.get('dtl-inp-dtbnSprtOgnzId'); // 지업조직아이디

    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
      return;
    }

    var formData = new FormData();

    const dtbnAplyDocFile = $('#dtbnAplyDoc')[0].files; // 교부신청서

    // 제출허용 확장자
    const allowExtn = ['pdf'];

    if (dtbnAplyDocFile.length == 0) {
      gfn_comAlert("W0005","교부신청서 제출할 파일"); // W0005  {0}이/가 없습니다.
      return;
    }

    if (dtbnAplyDocFile.length > 0) {
      for (var i = 0; i < dtbnAplyDocFile.length; i++) {
        const extension = dtbnAplyDocFile[i].name.split('.').pop().toLowerCase();
        if (allowExtn.includes(extension)) {
          formData.append('dtbnAplyFiles', dtbnAplyDocFile[i]);
        } else {
          gfn_comAlert("W0021","교부신청서 확장자","pdf"); // W0021 {0}은/는 {1}만 가능합니다.
          return;
        }
      }
    }

    formData.append('sprtBizYr',gfn_nvl(sprtBizYr));
    formData.append('sprtBizCd',gfn_nvl(sprtBizCd));
    formData.append('sprtOgnzId',gfn_nvl(sprtOgnzId));
    formData.append('brno',gfn_nvl(brno));

    /*const obj = {};
    formData.forEach((value,key) => {
      obj[key] = value;
    });
    console.log("제출할때",obj);*/

    if (!gfn_comConfirm("Q0001", "교부신청서 제출")) {	//	Q0001	{0} 하시겠습니까?
      return;
    }

    $.ajax({
      type: 'POST',
      url: '/pd/sprt/dtbnAplyDocReg.do',
      data: formData,
      processData: false,
      contentType: false,
      success: function (response) {
        gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        fn_searchDtbnMng();
      },
      error: function (error) {
        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        //gfn_comAlert(error.resultCode, error.resultMessage);
      }
    });

  }

  /**
   * @name fn_getDtbnMngRowData
   * @description 교부신청서 팝업
   */
  function fn_getDtbnMngRowData(){
    const rowData = gridDtbnMng.getRowData(gridDtbnMng.getRow());
    if (gfn_isEmpty(rowData)) {
      return;
    }
    return rowData;
  }

  /**
   * @name fn_dwnldDtbnDcsnDoc
   * @description 교부결정서 다운로드
   */
  function fn_dwnldDtbnDcsnDoc(seq) {
    const row = gridDtbnMng.getRow();
    const rowData = gridDtbnMng.getRowData(row);

    let fileSn;
    if (seq === 1 ) {
      fileSn = rowData.atchFileSnFirst;
    } else if (seq === 2) {
      fileSn = rowData.atchFileSnSecond;
    }

    if (gfn_isEmpty(fileSn)) {
      gfn_comAlert("W0005", "다운로드할 교부결정서"); // W0005 {0}이/가 없습니다.
      return;
    }

    if (!gfn_comConfirm("Q0001", "교부결정서 다운로드")) {	//	Q0001	{0} 하시겠습니까?
      return;
    }

    const url = "/pd/downloadSrptClclnAtchFile.do?fileSn=" + fileSn;
    window.open(url);
  }

  /**
   * @name fn_checkAll
   * @description 그리드 체크박스 전체 선택
   */
  const fn_checkAll = function (grid, obj) {

    const checkedYn = obj.checked ? "Y" : "N";
    //체크박스 열 index
    const getColRef = grid.getColRef("checkedYn");
    for (var i=0; i<grid.getGridDataAll().length; i++ ){
      grid.setCellData(i+2, getColRef, checkedYn, true, false);
    }

    grid.refresh();
    fn_setTotal();
  }

  /**
   * @name fn_selectFilePdf
   * @description 파일선택시 event
   */
  function fn_selectFilePdf(files, targetId) {

    if (!files || files.length == 0) {
      return;
    }
    const file = files[0];
    const fileName = file.name;
    const extension = fileName.split('.').pop().toLowerCase();

    if (!_.isEqual(extension,"pdf")) {
      gfn_comAlert("W0021","제출파일","PDF"); // W0021  {0}은/는 {1}만 가능합니다.
      document.getElementById(targetId).value = '';
      return;
    }
  }

  /**
   * @name fn_selectFileExcel
   * @description 파일선택시 event
   */
  function fn_selectFileExcel(files,targetId) {

    if (!files || files.length == 0) {
      return;
    }
    const file = files[0];
    const fileName = file.name;
    const extension = fileName.split('.').pop().toLowerCase();

    const allow = ["xls", "xlsx"];

    if (!allow.includes(extension)) {
      gfn_comAlert("W0021", "제출파일", "엑셀"); // {0}은/는 {1}만 가능합니다.
      if (targetId) {
        document.getElementById(targetId).value = '';
      }
      return;
    }
  }

  function fn_setTotal() {
    const allData = gridDtbnMng.getGridDataAll();
    if (!gfn_isEmpty(allData)) {
      fn_calcDtbnSum(allData);
    }
  }

  function fn_calcDtbnSum(dataList) {
    let dtbnAplySbmsn = 0;
    let dtbnAplyAplyAprv = 0;
    let rpnAmtNe = 0;
    let dtbnDcsnAmt1 = 0;
    let dtbnDcsnAmt2 = 0;
    let blnc = 0;

    for (let i = 0; i < dataList.length; i++) {
      const row = dataList[i];
      rpnAmtNe += parseInt(row.rpnAmtNe || 0);
      dtbnDcsnAmt1 += parseInt(row.dtbnDcsnAmt1 || 0);
      dtbnDcsnAmt2 += parseInt(row.dtbnDcsnAmt2 || 0);
      blnc += parseInt(row.blnc || 0);

      if (parseInt(row.atchFileSn) > 0) {
        dtbnAplySbmsn++;
      }
      if (_.isEqual(row.aprvYn, "Y")) {
        dtbnAplyAplyAprv++;
      }
    }

    document.querySelector('#dtbnAplySbmsn').innerText = dtbnAplySbmsn;
    document.querySelector('#dtbnAplyAplyAprv').innerText = dtbnAplyAplyAprv;
    document.querySelector('#rpnAmtNe').innerText = rpnAmtNe.toLocaleString();
    // document.querySelector('#dtbnDcsnAmt1').innerText = dtbnDcsnAmt1.toLocaleString();
    // document.querySelector('#dtbnDcsnAmt2').innerText = dtbnDcsnAmt2.toLocaleString();
    // document.querySelector('#blnc').innerText = blnc.toLocaleString();
  }

  /**
   * @name fn_sbmsnDtbnDcsnDoc
   * @description 교부결정서 등록
   */
  const fn_sbmsnDtbnDcsnDoc = function (sn) {
    const brno = SBUxMethod.get('dtl-inp-dtbnMngBrno'); // 사업자번호
    const sprtBizYr = SBUxMethod.get('dtl-inp-dtbnSprtBizYr'); // 지업사업연도
    const sprtBizCd = SBUxMethod.get('dtl-inp-dtbnSprtBizCd'); // 지업사업코드
    const sprtOgnzId = SBUxMethod.get('dtl-inp-dtbnSprtOgnzId'); // 지업조직아이디

    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
      return;
    }

    var formData = new FormData();

    const dtbnDcsnDocFile = $(`#dtbnDcsnDoc${'${sn}'}`)[0].files; // 교부결정서

    if (dtbnDcsnDocFile.length == 0) {
      gfn_comAlert("W0005","교부결정서 등록할 파일"); // W0005  {0}이/가 없습니다.
      return;
    }

    // 제출허용 확장자
    const allowExtn = ['pdf'];

    if (dtbnDcsnDocFile.length > 0) {
      for (let i = 0; i<dtbnDcsnDocFile.length; i++) {
        const extension = dtbnDcsnDocFile[i].name.split('.').pop().toLowerCase();
        if (allowExtn.includes(extension)) {
          formData.append('dtbnDscnDocFiles', dtbnDcsnDocFile[i]);
        } else {
          gfn_comAlert("W0021","교부결정서 확장자","pdf"); // W0021 {0}은/는 {1}만 가능합니다.
          return;
        }
      }
    }

    formData.append('sprtBizYr',gfn_nvl(sprtBizYr));
    formData.append('sprtBizCd',gfn_nvl(sprtBizCd));
    formData.append('sprtOgnzId',gfn_nvl(sprtOgnzId));
    formData.append('brno',gfn_nvl(brno));
    formData.append('clclnSeq',sn);
    formData.append('docSeq',1);


    if (!gfn_comConfirm("Q0001", `${'${sn}'}차 교부결정서 등록`)) {	//	Q0001	{0} 하시겠습니까?
      return;
    }

    $.ajax({
      type: 'POST',
      url: '/pd/sprt/dtbnDcsnDocReg.do',
      data: formData,
      processData: false,
      contentType: false,
      success: function (response) {
        if (_.isEqual("S", response.resultStatus)) {
          gfn_comAlert("I0001");	// I0001	처리 되었습니다.
          fn_searchDtbnMng();
        }
      },
      error: function (error) {
        // gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        gfn_comAlert(error.resultCode, error.resultMessage);
      }
    });
  }

  /**
   * @name fn_searchClclnAply
   * @description 정산신청 조회
   */
  const fn_searchClclnAply = async function() {
    fn_clear();
    jsonClclnAply.length = 0;
    let brno = SBUxMethod.get('dtl-inp-brno');
    const crtrYr = SBUxMethod.get('dtl-spi-yr');
    const corpNm = SBUxMethod.get('dtl-inp-corpNm');
    <c:if test="${loginVO.userType ne '00' and loginVO.userType ne '01'}">
    brno = "${loginVO.brno}";
    </c:if>

    const postJsonPromise = gfn_postJSON("/pd/sprt/selectSprtBizClclnAplyList.do", {
      crtrYr: crtrYr,
      brno: brno,
      corpNm: corpNm,
    });
    const data = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus)) {
        data.resultList.forEach(item => {
          // 제출
          let sbmsnYn;
          let atchFileSn = item.aplyAtchFileSn;
          if (gfn_isEmpty(atchFileSn) || _.isEqual(atchFileSn,0)) {
            sbmsnYn = "미제출";
          } else if (atchFileSn > 0 && _.isEqual(item.chgYn, "Y")) {
            sbmsnYn = "제출(변경)";
          } else {
            sbmsnYn = "제출";
          }

          // 정산 요청서 확인여부
          let aplyAprvYnNm;
          if (gfn_isEmpty(atchFileSn) || _.isEqual(atchFileSn,0)) {
            aplyAprvYnNm = null;
          } else if (atchFileSn > 0 && gfn_isEmpty(item.aplyAprvYn)) {
            aplyAprvYnNm = "미확인";
          } else if (atchFileSn > 0 && _.isEqual(item.aplyAprvYn,"Y")) {
            aplyAprvYnNm = "확인";
          } else if (atchFileSn > 0 && _.isEqual(item.aplyAprvYn,"N")) {
            aplyAprvYnNm = "수정요청";
          }
          // 엑셀 세부내역서 확인여부
          let excelAprvYnNm;
          const excelAtchFileSn = item.excelAtchFileSn;
          if (gfn_isEmpty(excelAtchFileSn) || _.isEqual(excelAtchFileSn,0)) {
            excelAprvYnNm = null;
          } else if (excelAtchFileSn > 0 && gfn_isEmpty(item.excelAprvYn)) {
            excelAprvYnNm = "미확인";
          } else if (excelAtchFileSn > 0 && _.isEqual(item.excelAprvYn,"Y")) {
            excelAprvYnNm = "확인";
          } else if (excelAtchFileSn > 0 && _.isEqual(item.excelAprvYn,"N")) {
            excelAprvYnNm = "수정요청";
          }

          // 체크리스트 확인여부
          let chkAprvYnNm;
          const chkAtchFileSn = item.chkAtchFileSn;
          if (gfn_isEmpty(chkAtchFileSn) || _.isEqual(chkAtchFileSn,0)) {
            chkAprvYnNm = null;
          } else if (chkAtchFileSn > 0 && gfn_isEmpty(item.chkAprvYn)) {
            chkAprvYnNm = "미확인";
          } else if (chkAtchFileSn > 0 && _.isEqual(item.chkAprvYn,"Y")) {
            chkAprvYnNm = "확인";
          } else if (chkAtchFileSn > 0 && _.isEqual(item.chkAprvYn,"N")) {
            chkAprvYnNm = "수정요청";
          }

          /*let clclnSeqNm;
          if (item.clclnSeq == 1) {
            clclnSeqNm = "1차";
          } else if (item.clclnSeq == 2) {
            clclnSeqNm == "2차";
          }*/

          const vo = {
            sprtBizYr: item.sprtBizYr,
            sprtBizCd: item.sprtBizCd,
            sprtOgnzId: item.sprtOgnzId,
            corpNm : item.corpNm,
            brno : item.brno,
            crno : item.crno,
            clclnSeq : item.clclnSeq,
            clclnSeqNm : '1차',
            clclnPsbltyAmt : item.clclnPsbltyAmt,
            clclnDmndSbmsnYn : sbmsnYn,
            clclnDmndAprvYn : aplyAprvYnNm,

            aplyAtchFileSn : item.aplyAtchFileSn,
            aplyLgcFileNm : item.aplyLgcFileNm,
            aplyDocSeq : item.aplyDocSeq,
            aplyAprvYn : item.aplyAprvYn,
            aplyAprvYnNm : aplyAprvYnNm,
            aplyChgYn : item.aplyChgYn,

            excelAtchFileSn : item.excelAtchFileSn,
            excelDocSeq : item.excelDocSeq,
            excelLgcFileNm : item.excelLgcFileNm,
            excelAprvYn : item.excelAprvYn,
            excelAprvYnNm : excelAprvYnNm,
            excelChgYn : item.excelChgYn,

            chkAtchFileSn : item.chkAtchFileSn,
            chkDocSeq : item.chkDocSeq,
            chkLgcFileNm : item.chkLgcFileNm,
            chkAprvYn : item.chkAprvYn,
            chkAprvYnNm : chkAprvYnNm,
            chkChgYn : item.chkChgYn,
          };

          const vo1 = { ...vo, clclnSeq: item.clclnSeq};
          const vo2 = { ...vo, clclnSeq: 2, clclnSeqNm: '2차'};

          if (!item.clclnSeq || item.clclnSeq === 0) {
            jsonClclnAply.push(vo);
          } else if (item.clclnSeq === 1) {
            jsonClclnAply.push(vo1);
          } else if (item.clclnSeq === 2) {
            jsonClclnAply.push(vo2);
          }

        });
        document.querySelector('#clclnAplyList').innerText = data.resultList.length;
      }
      gridClclnAply.refresh();
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }

  }

  /**
   * @name fn_clickGridClclnAply
   * @description 정산신청 그리드 클릭 event
   */
  function fn_clickGridClclnAply() {
    fn_clear();
    const row = gridClclnAply.getRow();
    const col = gridClclnAply.getCol();
    const rowData = gridClclnAply.getRowData(row);
    //const userAttr = gridClclnAply.getColUserAttr(col);
    if (gfn_isEmpty(rowData)) return;

    SBUxMethod.set('dtl-slt-clclnAplySeq',rowData.clclnSeq);
    SBUxMethod.set('dtl-inp-clclnAplyCorpNm',rowData.corpNm);
    SBUxMethod.set('dtl-inp-clclnAplyBrno',rowData.brno);
    SBUxMethod.set('dtl-inp-clclnAplySprtBizYr',rowData.sprtBizYr);
    SBUxMethod.set('dtl-inp-clclnAplySprtBizCd',rowData.sprtBizCd);
    SBUxMethod.set('dtl-inp-clclnAplySprtOgnzId',rowData.sprtOgnzId);

    const clclnSeq = rowData.clclnSeq;
    // 정산요청서
    SBUxMethod.set('dtl-inp-exsClclnAplyDoc',rowData.aplyLgcFileNm); // 제출서류
    SBUxMethod.set('dtl-inp-clclnAplyDocAprvYnNm',rowData.aplyAprvYnNm); // 확인여부
    SBUxMethod.set('dtl-inp-clclnAplyDocAprvYn',rowData.aplyAprvYn); // 확인여부
    // 엑셀 세부내역서
    SBUxMethod.set('dtl-inp-exsExcelDsctnDoc',rowData.excelLgcFileNm); // 제출서류
    SBUxMethod.set('dtl-inp-excelDsctnDocAprvYnNm',rowData.excelAprvYnNm); // 확인여부
    SBUxMethod.set('dtl-inp-excelDsctnDocAprvYn',rowData.excelAprvYn); // 확인여부
    // 증빙서류 체크리스트
    SBUxMethod.set('dtl-inp-exsClclnCheckList',rowData.chkLgcFileNm); // 제출서류
    SBUxMethod.set('dtl-inp-clclnCheckListAprvYnNm',rowData.chkAprvYnNm); // 확인여부
    SBUxMethod.set('dtl-inp-clclnCheckListAprvYn',rowData.chkAprvYn); // 확인여부
  }

  /**
   * @name fn_sbmsnClclnAplyDoc
   * @description 정산요청서 등록
   */
  function fn_sbmsnClclnAplyDoc(docSeq) {
    const brno = SBUxMethod.get('dtl-inp-clclnAplyBrno'); // 사업자번호
    const clclnSeq = SBUxMethod.get('dtl-slt-clclnAplySeq'); // 회차
    const sprtBizYr = SBUxMethod.get('dtl-inp-clclnAplySprtBizYr'); // 지업사업연도
    const sprtBizCd = SBUxMethod.get('dtl-inp-clclnAplySprtBizCd'); // 지업사업코드
    const sprtOgnzId = SBUxMethod.get('dtl-inp-clclnAplySprtOgnzId'); // 지업조직아이디


    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
      return;
    }
    if (gfn_isEmpty(clclnSeq)) {
      gfn_comAlert("W0001", "회차"); // W0001 {0}을/를 선택하세요.
      return;
    }
    if (gfn_isEmpty(docSeq)) {
      gfn_comAlert("W0005", "문서순번"); // W0005 {0}이/가 없습니다
      return;
    }

    var formData = new FormData();

    let aprvYn;
    let docNm;
    let clclnDoc;
    let aplyDocCd;

    switch (docSeq) {
      case 2: // 정산요청서
        clclnDoc = $('#clclnAplyDoc')[0].files; // 정산요청서
        aprvYn = SBUxMethod.get('dtl-inp-clclnAplyDocAprvYn');
        docNm = "정산요청서";
        aplyDocCd = "CLCLN_APLY"
        break;

      case 3: // 엑셀 세부내역
        clclnDoc = $('#excelDsctnDoc')[0].files; // 엑셀 세부내역서
        aprvYn = SBUxMethod.get('dtl-inp-excelDsctnDocAprvYn');
        docNm = "엑셀 세부내역서";
        aplyDocCd = "EXCEL_DTL"
        break;

      case 4: // 증빙서류 체크리스트
        clclnDoc = $('#clclnCheckList')[0].files; // 체크리스트
        aprvYn = SBUxMethod.get('dtl-inp-clclnCheckListAprvYn');
        docNm = "증빙서류 체크리스트";
        aplyDocCd = "CLCLN_CHK"
        break;
    }

    if (_.isEqual(aprvYn,"Y")) {
      gfn_comAlert("W0010","확인",docNm); // W0010  이미 {0}된 {1} 입니다.
      return;
    }


    if (clclnDoc.length == 0) {
      gfn_comAlert("W0005",`${'${docNm}'} 등록할 파일`); // W0005  {0}이/가 없습니다.
      return;
    }


    // 제출허용 확장자
    const allowExtnPdf = ['pdf'];
    const allowExtnExcel = ['xlsx','xls'];

    for (let i = 0; i < clclnDoc.length; i++) {
      const extension = clclnDoc[i].name.split('.').pop().toLowerCase();

      if (docSeq == 3) { // 엑셀 세부내역
        if (!allowExtnExcel.includes(extension)) {
          gfn_comAlert("W0021", `${'${docNm}'}파일`, "xls,xlsx");  // W0021 {0}은/는 {1}만 가능합니다.
          return;
        }
      } else { // 나머지는 PDF
        if (!allowExtnPdf.includes(extension)) {
          gfn_comAlert("W0021",`${'${docNm}'}파일`, "pdf");  // W0021 {0}은/는 {1}만 가능합니다.
          return;
        }
      }

      formData.append("clclnAplyDocFiles", clclnDoc[i]);
    }


    formData.append('sprtBizYr',gfn_nvl(sprtBizYr));
    formData.append('sprtBizCd',gfn_nvl(sprtBizCd));
    formData.append('sprtOgnzId',gfn_nvl(sprtOgnzId));
    formData.append('brno',gfn_nvl(brno));
    formData.append('clclnSeq',clclnSeq);
    formData.append('docSeq',docSeq);
    formData.append('aplyDocCd',aplyDocCd);

    /*const obj = {};
    formData.forEach((value,key) => {
      obj[key] = value;
    });*/


    if (!gfn_comConfirm("Q0001", `${'${clclnSeq}'}차 ${'${docNm}'} 등록`)) {	//	Q0001	{0} 하시겠습니까?
      return;
    }

    $.ajax({
      type: 'POST',
      url: '/pd/sprt/clclnAplyDocReg.do',
      data: formData,
      processData: false,
      contentType: false,
      success: function (response) {
        if (_.isEqual("S", response.resultStatus)) {
          gfn_comAlert("I0001");	// I0001	처리 되었습니다.
          fn_searchClclnAply();
        }
      },
      error: function (error) {
        console.log(error);
        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        //gfn_comAlert(error.resultCode, error.resultMessage);
      }
    });
  }

  /**
   * @name fn_openClclnAplyPrvw
   * @description 정산요청서 미리보기
   */
  const fn_openClclnAplyPrvw = function (){
    const row = gridClclnAply.getRow();
    const rowData = gridClclnAply.getRowData(row);

    if (gfn_isEmpty(rowData)) {
      return;
    }

    const brno = rowData.brno;
    const clclnSeq = rowData.clclnSeq;

    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
      return;
    }

    if (gfn_isEmpty(clclnSeq)) {
      gfn_comAlert("W0005", "회차"); // W0005 {0}이/가 없습니다.
      return;
    }

    const url = "/pd/sprt/clclnAplyDocPrvwPopup.do";
    const title = "정산요청서 미리보기";
    window.open(url, title, "width=1000px,height=900px");
  }

  /**
   * @name fn_getClclnAplyRowData
   * @description 정산요청서 팝업
   */
  function fn_getClclnAplyRowData(){
    const rowData = gridClclnAply.getRowData(gridClclnAply.getRow());
    if (gfn_isEmpty(rowData)) {
      return;
    }
    return rowData;
  }


  // 세부항목 셀렉트 재생성(+부분 렌더)
  function refreshSubSelect(sltSub, majorCd){
    while(sltSub.firstChild) sltSub.removeChild(sltSub.firstChild);
    appendOptionToSbuxSelect(sltSub, '', '선택', true);
    getSubs(majorCd).forEach(function(s){
      appendOptionToSbuxSelect(sltSub, s.cd, s.name, false);
    });
    // 이 셀렉트만 렌더
    SBUxMethod.render('#' + sltSub.id);
  }

  // ===================== 핵심: 행 추가 =====================
  function fn_prufAddRow(){
    console.log("행추가");
    var tbody = document.getElementById('pruf-tbody');
    var rowNo = tbody.querySelectorAll('tr').length + 1;
    console.log("tbody",tbody);
    console.log('rowNo',rowNo);

    var tr = document.createElement('tr');

    // 선택
    var tdSel = document.createElement('td');
    var check = document.createElement('sbux-checkbox');
    check.setAttribute('id', 'dtl-chk-prufCheck' + rowNo);
    check.setAttribute('name', 'dtl-chk-prufCheck' + rowNo);
    check.setAttribute('uitype', 'normal');
    check.setAttribute('true-value', 'Y');
    check.setAttribute('false-value', 'N');
    check.setAttribute('class', 'form-control input-sm');
    tdSel.appendChild(check);

    // 주요항목
    var tdMajor = document.createElement('td');
    var sltMajor = document.createElement('sbux-select');
    sltMajor.setAttribute('id', 'dtl-slt-prufMajor' + rowNo);
    sltMajor.setAttribute('name', 'dtl-slt-prufMajor' + rowNo);
    sltMajor.setAttribute('uitype', 'single');
    sltMajor.setAttribute('jsondata-ref', 'jsonCmnsPrufCd');
    sltMajor.setAttribute('class', 'form-control input-sm');
    tdMajor.appendChild(sltMajor);

    // 세부항목
    var tdSub = document.createElement('td');
    var sltSub = document.createElement('sbux-select');
    sltSub.setAttribute('id', 'dtl-slt-prufSub' + rowNo);
    sltSub.setAttribute('name', 'dtl-slt-prufSub' + rowNo);
    sltSub.setAttribute('uitype', 'single');
    sltSub.setAttribute('jsondata-ref', 'jsonDtlArtcl');
    sltSub.setAttribute('class', 'form-control input-sm');
    console.log("sltSUb",sltSub);
    tdSub.appendChild(sltSub);

    // 내용
    var tdTitle = document.createElement('td');
    var inpTitle = document.createElement('sbux-input');
    inpTitle.setAttribute('id', 'dtl-inp-prufTitle' + rowNo);
    inpTitle.setAttribute('name', 'dtl-inp-prufTitle' + rowNo);
    inpTitle.setAttribute('uitype','text');
    inpTitle.setAttribute('class', 'form-control input-sm');
    inpTitle.setAttribute('placeholder','예) 딸기농가교육');
    tdTitle.appendChild(inpTitle);

    // 정산요청액
    var tdAmt = document.createElement('td');
    var inpAmt = document.createElement('sbux-input');
    inpAmt.setAttribute('id', 'dtl-inp-clclnDmndAmt' + rowNo);
    inpAmt.setAttribute('name', 'dtl-inp-clclnDmndAmt' + rowNo);
    inpAmt.setAttribute('class', 'form-control input-sm');
    inpAmt.setAttribute('uitype','text');
    tdAmt.appendChild(inpAmt);

    // 공통증빙
    var tdCommon = document.createElement('td');
    console.log(jsonCmnsPrufCd);

    // 세부증빙
    var tdDetail = document.createElement('td');

    // 비고
    var tdRmrk   = document.createElement('td');
    var inpRmrk  = document.createElement('sbux-input');
    inpRmrk.setAttribute('id', 'dtl-inp-prufRmrk' + rowNo);
    inpRmrk.setAttribute('name', 'dtl-inp-prufRmrk' + rowNo);
    inpRmrk.setAttribute('uitype','text');
    inpRmrk.setAttribute('class', 'form-control input-sm');
    tdRmrk.appendChild(inpRmrk);

    tr.appendChild(tdSel);
    tr.appendChild(tdMajor);
    tr.appendChild(tdSub);
    tr.appendChild(tdTitle);
    tr.appendChild(tdAmt);
    tr.appendChild(tdCommon);
    tr.appendChild(tdDetail);
    tr.appendChild(tdRmrk);

    // tbody에 삽입
    tbody.appendChild(tr);
    SBUxMethod.render('^pruf-tbody');

  }


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
