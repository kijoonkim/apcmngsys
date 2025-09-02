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
   .tableWrap{background:var(--card);border:1px solid var(--line);border-radius:16px;padding:12px}
  .tableScroll{overflow:auto}
  .tbl_doc{width:100%;border-collapse:separate;border-spacing:0;min-width:1100px}
  .thd_doc th{position:sticky;top:0;background:#e6e6fa;border-bottom:1px solid var(--line);padding:10px 12px;text-align:left;color:#0f172a;font-size:12px}
  .tbd_doc td{border-bottom:1px solid var(--line);vertical-align:top !important;padding:10px 12px}
  .tbd_doc tr:hover{background:#f5f5f5}
  .pickCell{width:68px;text-align:center}
  .evGroup{display:grid;gap:8px}
  .evItem{border:1px dashed #263455;border-radius:10px;padding:8px;background:#f5f5f5}
  .evHead{display:flex;align-items:center;gap:8px;margin-bottom:6px}
  .evName{font-size:13px;color:#0f172a}
  .badgeTiny{font-size:11px;padding:1px 6px;border-radius:999px;border:1px solid var(--line);}
  .files{display:flex;flex-wrap:wrap;gap:6px;margin-top:6px}
  .chip{border:1px solid #314064;border-radius:8px;padding:3px 8px;font-size:12px;color:#4169e1}
  .sum{display:flex;justify-content:flex-end;gap:16px;align-items:center;margin-top:14px;color:#cbd5e1}
  .sum strong{font-size:18px}
  .hint{font-size:12px;color:#93c5fd;margin-top:10px}
  .money{font-variant-numeric: tabular-nums}
  .txa-resize{resize:both}
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

            <%-- 제출된 증빙서류 --%>
            <div id="exsPrufDoc" style="display: none">
              <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                  <li><span>제출된 증빙서류 목록</span></li>
                </ul>
                <div>
                  <sbux-button id="btnExsSbmsnPrufDoc" name="btnExsSbmsnPrufDoc" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_addPrufSbmsn"></sbux-button>
                </div>
              </div>

              <%--증빙서류--%>
              <div class="clclnPruf-wrap">
                <div class="prufTableWrap">
                  <div class="prufTableScroll">
                    <table class="table table-bordered tbl_fixed">
                      <colgroup>
                        <col style="width: 3%">
                        <col style="width: 10%">
                        <col style="width: 15%">
                        <col style="width: 14%">
                        <col style="width: 10%">
                        <col style="width: 18%">
                        <col style="width: 18%">
                        <col style="width: 12%">
                      </colgroup>
                      <tr>
                        <th scope="col" class="th_bg text-center">No.</th>
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

                </div>
              </div>
            </div>

            <div style="height: 20px"></div>

            <%--정산신청 증빙서류--%>
            <div>
              <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                  <li><span>정산신청 증빙서류 제출</span></li>
                </ul>
                <div>
                  <sbux-button id="btnSbmsnPrufAddRow" name="btnSbmsnPrufAddRow" uitype="normal" text="항목추가" class="btn btn-sm btn-primary" onclick="fn_docNewRow"></sbux-button>
                  <sbux-button id="btnSbmsnPrufDelRow" name="btnSbmsnPrufDelRow" uitype="normal" text="행삭제" class="btn btn-sm btn-primary" onclick="fn_prufDelRow"></sbux-button>
                  <sbux-button id="btnSbmsnPrufDoc" name="btnSbmsnPrufDoc" uitype="normal" text="증빙서류제출" class="btn btn-sm btn-primary" onclick="fn_clclnPrufSbmsn"></sbux-button>
                </div>
              </div>

              <%--증빙서류--%>
              <div class="clclnPruf-wrap">

                <div class="prufTableWrap">
                  <div class="prufTableScroll">
                    <table class="table table-bordered tbl_fixed">
                      <colgroup>
                        <col style="width: 3%">
                        <col style="width: 10%">
                        <col style="width: 17%">
                        <col style="width: 14%">
                        <col style="width: 10%">
                        <col style="width: 18%">
                        <col style="width: 18%">
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
                      <tbody id="doc-tbd-newData" class="tbd_doc"></tbody>
                    </table>
                  </div>
                 <%-- <div class="sum">
                    <span>합계: <strong class="money" id="clcln-total">0</strong> 원</span>
                  </div>--%>
                </div>
            </div>
            </div>

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
              <div><sbux-button id="btnSaveClclnRslt" name="btnSaveClclnRslt" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_saveClclnRslt"></sbux-button></div>
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
  var jsonCmnsPrufCd = []; // 공통 증빙
  var jsonDtlPrufCd = []; // 세부 증빙
  var jsonMajorArtcl = []; // 주요 항목
  var jsonDtlArtcl = []; // 세부 항목

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
    {value : 1, text :"1차"},
    {value : 2, text :"2차"},
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
        var majorMap = {};
        var dtlMap = {};
        var dtlPrufMap = {};
        var dtlExclude = ["B102", "D203"];

        data.resultList.forEach(item => {
          // 공통 증빙
          if (item.majorArtclCd === "PRUF_BSC") {
           if (!jsonCmnsPrufCd[item.dtlArtclCd]) {
             jsonCmnsPrufCd.push({
               value: item.dtlArtclCd,
               text: item.dtlArtclNm
             });
           }
          }

          // 주요항목
          if (_.isEqual(item.majorArtclCd,"PRUF_BSC")) return;
          if (!majorMap[item.majorArtclCd]) {
            majorMap[item.majorArtclCd] = {
              value: item.majorArtclCd,
              text: item.majorArtclNm,
              seq: item.majorArtclIndctSeq
            };
          }

          // 세부항목
          if (!item.dtlArtclCd || dtlExclude.includes(item.dtlArtclCd)) return;
          if (!dtlMap[item.dtlArtclCd]) {
            dtlMap[item.dtlArtclCd] = {
              value: item.dtlArtclCd,
              text: item.dtlArtclNm,
              seq : item.dtlArtclIndctSeq,
              mastervalue : item.majorArtclCd
            };
          }

          // 세부증빙
          jsonDtlPrufCd.push({
            value : item.prufArtclCd,
            text : item.prufIndctNm,
            artclCd : item.prufArtclKnd,
            seq : item.prufIndctSeq
          })

        });
        jsonMajorArtcl = Object.values(majorMap);
        jsonDtlArtcl = Object.values(dtlMap);
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

    SBGridProperties.columns = [
      {caption: ['연도','연도'],			ref: 'sprtBizYr', 	    width: '5%', type: 'output',style: 'text-align:center'},
      {caption: ['법인명','법인명'], 			ref: 'corpNm', 	width: '15%', type: 'output', style: 'text-align:left',userattr : {colNm :"corpNm"}},
      {caption: ['회차','회차'], 			ref: 'clclnSeq', 		width: '6%', type: 'output', style: 'text-align:center'},
      {caption: ['정산가능액(A)\n(천원)','정산가능액(A)\n(천원)'], 			ref: 'clclnPsbltyAmt', 		width: '7%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
      {caption: ['정산요청서','제출여부'], 			ref: 'clclnDmndSbmsnYn', 		width: '7%', type: 'output', style: 'text-align:center'},
      {caption: ['정산요청서','확인여부'], 			ref: 'clclnDmndAprvYn', 		width: '7%', type: 'output', style: 'text-align:center'},
      {caption: ['정산요청서','미리보기'], 			ref: 'clclnDmndPrvw', 		width: '7%', type: 'button', style: 'text-align:center',typeinfo : {buttonclass:'btn btn-sm btn-outline-danger btnClass', buttonvalue: '팝업 열기', callback: fn_openClclnAplyPrvw}},
      {caption: ['정산요청서','정산요청액'], 			ref: 'dmndAmtTot', 		width: '7%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
      /*{caption: ['증빙서류','제출여부'], 			ref: 'prufSbmsnYn', 	width: '7%', type: 'output', style: 'text-align:right'},
      {caption: ['증빙서류','확인여부'], 			ref: 'prufAprvYn', 		width: '7%', type: 'output', style: 'text-align:center'},*/
      {caption: ['증빙서류','미리보기'], 			ref: 'prufPrvw', 		width: '7%', type: 'button', style: 'text-align:center',typeinfo : {buttonclass:'btn btn-sm btn-outline-danger btnClass', buttonvalue: '팝업 열기', callback: fn_opoenClclnPrufPrvw}},
      {caption: ['증빙서류','비고'], 			ref: 'prufRmrk', 		width: '37%', type: 'output', style: 'text-align:left'},
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
      {
        caption : ["<input type='checkbox' onchange='fn_checkAll(gridClclnRslt, this);'>","<input type='checkbox' onchange='fn_checkAll(gridClclnRslt, this);'>"],
        ref: 'checkedYn', type: 'checkbox',  width:'3%',
        style: 'text-align:center',
        userattr: {colNm: "checkedYn"},
        typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N', ignoreupdate : true, fixedcellcheckbox : {usemode : false, rowindex : 0}}
      },
      {caption: ['연도','연도'],			ref: 'sprtBizYr', 	    width: '6%', type: 'output',style: 'text-align:center'},
      {caption: ['법인명','법인명'], 			ref: 'corpNm', 	width: '16%', type: 'output', style: 'text-align:left'},
      {caption: ['회차','회차'], 			ref: 'clclnSeq', 		width: '6%', type: 'output', style: 'text-align:center'},
      {caption: ['정산가능액(A)\n(천원)','정산가능액(A)\n(천원)'], 		ref: 'clclnPsbltyAmt', 		width: '10%', type: 'output', style: 'text-align:right', typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
      {caption: ['정산요청액','정산요청액'], 			ref: 'clclnDmndAmt', 		width: '10%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
      {caption: ['정산인정액(B)\n(천원)','정산인정액(B)\n(천원)'], 		ref: 'clclnAprvAmt', 		width: '10%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
      {caption: ['잔액','불인정'], 			ref: 'clclnRjctAmt', 	width: '10%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
      {caption: ['잔액','미사용액'], 			ref: 'unuseAmt', 		width: '10%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
      {caption: ['잔액','합계'], 			ref: 'blncTot', 		width: '10%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
      {caption: ['집행률','집행률'], 			ref: 'implRt', 		width: '19%', type: 'output', style: 'text-align:center',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
    ];
    gridClclnRslt = _SBGrid.create(SBGridProperties);
    gridClclnRslt.bind('valuechanged','fn_clclnRsltValueChange');
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
      {caption: ['배정예산(국고 50)','배정예산(국고 50)'], 			ref: 'rpnAmtNe', 		width: '8%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
      {caption: ['1차 교부결정액','금액'], 			ref: 'dtbnDcsnAmt1', 		width: '6%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
      {caption: ['1차 교부결정액','교부결정서'], 			ref: 'dtbnDcsnDoc1', 		width: '6%', type: 'button', style: 'text-align:center',typeinfo : {buttonclass:'btn btn-sm btn-outline-danger btnClass', buttonvalue: '다운로드', callback: function(){fn_dwnldDtbnDcsnDoc(1)}}},
      {caption: ['2차 교부결정액','금액'], 			ref: 'dtbnDcsnAmt2', 		width: '6%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
      {caption: ['2차 교부결정액','교부결정서'], 			ref: 'dtbnDcsnDoc2', 		width: '6%', type: 'button', style: 'text-align:center',typeinfo : {buttonclass:'btn btn-sm btn-outline-danger btnClass', buttonvalue: '다운로드', callback: function(){fn_dwnldDtbnDcsnDoc(2)}}},
      {caption: ['잔액','잔액'], 			ref: 'blnc', 		width: '7%', type: 'output', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}},
      {caption: ['비고','비고'], 			ref: 'rmrk', 		width: '20%', type: 'input', style: 'text-align:center'},
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
    SBUxMethod.set('dtl-inp-dtbnMngCorpNm','');
    SBUxMethod.set('dtl-inp-dtbnMngBrno','');
    SBUxMethod.set('dtl-inp-dtbnSprtBizYr','');
    SBUxMethod.set('dtl-inp-dtbnSprtBizCd','');
    SBUxMethod.set('dtl-inp-dtbnSprtOgnzId','');
    SBUxMethod.set('dtl-inp-exsDtbnAplyDoc','');
    SBUxMethod.set('dtl-inp-dtbnAplyDocIdntyYn','');

    document.querySelector('#dtbnAplyDoc').value = null;

    SBUxMethod.attr('btnSbmsnDtbnAplyDoc','disabled','true');

    // 교부결정서
    SBUxMethod.set('dtl-inp-exsDtbnDcsnDoc1','');
    SBUxMethod.set('dtl-inp-exsDtbnDcsnDoc2','');
    <c:if test="${loginVO.untyAuthrtType eq '00' || loginVO.untyAuthrtType eq '10'}">
      document.querySelector('#dtbnDcsnDoc1').value = null;
      document.querySelector('#dtbnDcsnDoc2').value = null;
    </c:if>

    // 정산신청
    SBUxMethod.set('dtl-inp-clclnAplySeq','');
    SBUxMethod.set('dtl-inp-clclnAplyCorpNm','');
    SBUxMethod.set('dtl-inp-clclnAplyBrno','');
    SBUxMethod.set('dtl-inp-clclnAplySprtBizYr','');
    SBUxMethod.set('dtl-inp-clclnAplySprtBizCd','');
    SBUxMethod.set('dtl-inp-clclnAplySprtOgnzId','');

    // 정산요청서
    SBUxMethod.set('dtl-inp-exsClclnAplyDoc',''); // 제출서류
    SBUxMethod.set('dtl-inp-clclnAplyDocAprvYn',''); // 확인여부
    SBUxMethod.set('dtl-inp-clclnAplyDocAprvYnNm',''); // 확인여부
    document.querySelector('#clclnAplyDoc').value = null;
    SBUxMethod.attr('btnSbmsnClclnAplyDoc','disabled','true');

    // 엑셀 세부내역서
    SBUxMethod.set('dtl-inp-exsExcelDsctnDoc',''); // 제출서류
    SBUxMethod.set('dtl-inp-excelDsctnDocAprvYn',''); // 확인여부
    SBUxMethod.set('dtl-inp-excelDsctnDocAprvYnNm',''); // 확인여부
    document.querySelector('#excelDsctnDoc').value = null;
    SBUxMethod.attr('btnSbmsnClclnExcelDoc','disabled','true');

    // 증빙서류 체크리스트
    SBUxMethod.set('dtl-inp-exsClclnCheckList',''); // 제출서류
    SBUxMethod.set('dtl-inp-clclnCheckListAprvYn',''); // 확인여부
    SBUxMethod.set('dtl-inp-clclnCheckListAprvYnNm',''); // 확인여부
    document.querySelector('#clclnCheckList').value = null;
    SBUxMethod.attr('btnSbmsnClclnChkDoc','disabled','true');

  }

  /**
   * @name fn_search
   * @description 조회
   */
  const fn_search = async function () {
    await fn_searchClclnAply(); // 정산신청
    await fn_searchDtbnMng(); // 교부관리
    await fn_searchClclnRslt(); // 정산결과
  }

  /**
   * @name fn_searchClclnRslt
   * @description 정산결과 조회
   */
  const fn_searchClclnRslt = async function() {
    jsonClclnRslt.length = 0;

    let brno = SBUxMethod.get('dtl-inp-brno');
    const crtrYr = SBUxMethod.get('dtl-spi-yr');
    const corpNm = SBUxMethod.get('dtl-inp-corpNm');

    <c:if test="${loginVO.userType ne '00' and loginVO.userType ne '01'}">
    brno = "${loginVO.brno}";
    </c:if>

    const postJsonPromise = gfn_postJSON("/pd/sprt/selectSprtClclnRsltList.do", {
      crtrYr: crtrYr,
      brno: brno,
      corpNm: corpNm,
    });
    const data = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus)) {
          data.resultList.forEach(item => {
            const clclnPsbltyAmt = item.clclnPsbltyAmt ?? 0; // 정산가능액
            const dmndAmtTot = item.dmndAmtTot ?? 0; // 정산요청액
            const clclnAprvAmt = item.clclnAprvAmt ?? 0; // 정산인정액
            const clclnRjctAmt = dmndAmtTot - clclnAprvAmt; // 불인정액
            const unuseAmt = clclnPsbltyAmt - clclnAprvAmt - clclnRjctAmt; // 미사용액
            const blncTot = clclnRjctAmt + unuseAmt;
            /** 집행률 계산**/

            jsonClclnRslt.push({
              sprtBizYr : item.sprtBizYr,
              sprtBizCd : item.sprtBizCd,
              sprtOgnzId : item.sprtOgnzId,
              corpNm : item.corpNm,
              brno : item.brno,
              clclnSeq : item.clclnSeq == 0 ? 1 : item.clclnSeq,
              clclnPsbltyAmt : clclnPsbltyAmt,
              clclnDmndAmt : dmndAmtTot,
              clclnAprvAmt : clclnAprvAmt,
              clclnRjctAmt : clclnRjctAmt,
              unuseAmt : unuseAmt,
              blncTot : blncTot
            })
          });
        document.querySelector('#clclnRsltList').innerText = data.resultList.length;
      }
      gridClclnRslt.refresh();
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }
  }

  /**
   * @name fn_clclnRsltValueChange
   * @description 정산결과 값변경
   */
  function fn_clclnRsltValueChange() {
    const row = gridClclnRslt.getRow();
    const rowData = gridClclnRslt.getRowData(row, false); // false : 'call by refrence'로 반환
    if (gfn_isEmpty(rowData)) {
      return;
    }
    const clclnAprvAmt = Number(rowData.clclnAprvAmt); // 정산인정액
    const psbltyAmt = rowData.clclnPsbltyAmt; // 정산가능액
    const dmndAmt = rowData.clclnDmndAmt; // 정산요청액
    const rjctAmt = dmndAmt - clclnAprvAmt; // 불인정 = 정산요청액 - 정산인정액
    const unuseAmt = psbltyAmt - clclnAprvAmt - rjctAmt; // 미사용액 = 정산가능액 - 정산인정액 - 불인정액
    const blncTot = rjctAmt + unuseAmt; // 잔액합계 = 불인정 + 미사용액
    /** 집행률 넣기 **/
    rowData.clclnRjctAmt = rjctAmt;
    rowData.unuseAmt = unuseAmt;
    rowData.blncTot = blncTot;
    rowData.checkedYn = "Y";

    gridClclnRslt.refresh();
  }

  /**
   * @name fn_saveClclnRslt
   * @description 정산결과 저장
   */
  const fn_saveClclnRslt = async function() {
    const allData = gridClclnRslt.getGridDataAll();

    let saveList = [];

    for (let i = 0; i < allData.length; i++) {
      if (_.isEqual(allData[i].checkedYn,"Y")) { // 체크가 된경우
        saveList.push({
          sprtBizYr : allData[i].sprtBizYr,
          sprtBizCd : allData[i].sprtBizCd,
          sprtOgnzId : allData[i].sprtOgnzId,
          clclnSeq : allData[i].clclnSeq,
          clclnAprvAmt : Number(allData[i].clclnAprvAmt),
        });
      }
    }

    if (gfn_isEmpty(saveList)) {
      gfn_comAlert("W0003", "정산결과 저장"); // W0003 {0}할 대상이 없습니다.
      return;
    }

    if (!gfn_comConfirm("Q0001", "정산결과 저장")) {	//	Q0001	{0} 하시겠습니까?
      return;
    }

    const postJsonPromise = gfn_postJSON("/pd/sprt/updateClclnAprvAmt.do", saveList);
    const data = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus)) {
        gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        fn_search();
      } else {
        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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
   * @name fn_searchDtbnMng
   * @description 교부신청 조회
   */
  const fn_searchDtbnMng = async function () {
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

          const rpnAmtNe = item.rpnAmtNe ?? 0;
          const dtbnDcsnAmtFirst = item.dtbnDcsnAmtFirst ?? 0;
          const dtbnDcsnAmtSecond = item.dtbnDcsnAmtSecond ?? 0;
          const blnc = rpnAmtNe - dtbnDcsnAmtFirst - dtbnDcsnAmtSecond;

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
            rpnAmtNe : rpnAmtNe,
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
            dtbnDcsnAmt1 : dtbnDcsnAmtFirst,

            clclnSeqSecond : item.clclnSeqSecond,
            docSeqSecond : item.docSeqSecond,
            atchFileSnSecond : item.atchFileSnSecond,
            lgcFileNmSecond : item.lgcFileNmSecond,
            dtbnDcsnAmt2 : dtbnDcsnAmtSecond,

            // 잔액
            blnc : blnc,
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

          const vo = {
            sprtBizYr: item.sprtBizYr,
            sprtBizCd: item.sprtBizCd,
            sprtOgnzId: item.sprtOgnzId,
            corpNm : item.corpNm,
            brno : item.brno,
            crno : item.crno,
            clclnSeq : item.clclnSeq == 0 ? 1 : item.clclnSeq,
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

            dmndAmtTot : item.dmndAmtTot,
          };

         /* const vo1 = { ...vo, clclnSeq: item.clclnSeq};
          const vo2 = { ...vo, clclnSeq: 2, clclnSeqNm: '2차'};

          if (!item.clclnSeq || item.clclnSeq === 0) {
            jsonClclnAply.push(vo);
          } else if (item.clclnSeq === 1) {
            jsonClclnAply.push(vo1);
          } else if (item.clclnSeq === 2) {
            jsonClclnAply.push(vo2);
          }*/
          jsonClclnAply.push(vo);
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
  async function fn_clickGridClclnAply() {
    fn_clear();
    const row = gridClclnAply.getRow();
    const col = gridClclnAply.getCol();
    const rowData = gridClclnAply.getRowData(row);
    //const userAttr = gridClclnAply.getColUserAttr(col);
    if (gfn_isEmpty(rowData)) return;

    SBUxMethod.set('dtl-slt-clclnAplySeq', String(rowData.clclnSeq));
    SBUxMethod.set('dtl-inp-clclnAplyCorpNm', rowData.corpNm);
    SBUxMethod.set('dtl-inp-clclnAplyBrno', rowData.brno);
    SBUxMethod.set('dtl-inp-clclnAplySprtBizYr', rowData.sprtBizYr);
    SBUxMethod.set('dtl-inp-clclnAplySprtBizCd', rowData.sprtBizCd);
    SBUxMethod.set('dtl-inp-clclnAplySprtOgnzId', rowData.sprtOgnzId);

    const clclnSeq = rowData.clclnSeq;
    // 정산요청서
    SBUxMethod.set('dtl-inp-exsClclnAplyDoc', rowData.aplyLgcFileNm); // 제출서류
    SBUxMethod.set('dtl-inp-clclnAplyDocAprvYnNm', rowData.aplyAprvYnNm); // 확인여부
    SBUxMethod.set('dtl-inp-clclnAplyDocAprvYn', rowData.aplyAprvYn); // 확인여부
    if (_.isEqual(rowData.aplyAprvYn,"Y")) {
      SBUxMethod.attr('btnSbmsnClclnAplyDoc','disabled','true');
    } else {
      SBUxMethod.attr('btnSbmsnClclnAplyDoc','disabled','false');
    }

    // 엑셀 세부내역서
    SBUxMethod.set('dtl-inp-exsExcelDsctnDoc', rowData.excelLgcFileNm); // 제출서류
    SBUxMethod.set('dtl-inp-excelDsctnDocAprvYnNm', rowData.excelAprvYnNm); // 확인여부
    SBUxMethod.set('dtl-inp-excelDsctnDocAprvYn', rowData.excelAprvYn); // 확인여부
    if (_.isEqual(rowData.excelAprvYn,"Y")) {
      SBUxMethod.attr('btnSbmsnClclnExcelDoc','disabled','true');
    } else {
      SBUxMethod.attr('btnSbmsnClclnExcelDoc','disabled','false');
    }

    // 증빙서류 체크리스트
    SBUxMethod.set('dtl-inp-exsClclnCheckList', rowData.chkLgcFileNm); // 제출서류
    SBUxMethod.set('dtl-inp-clclnCheckListAprvYnNm', rowData.chkAprvYnNm); // 확인여부
    SBUxMethod.set('dtl-inp-clclnCheckListAprvYn', rowData.chkAprvYn); // 확인여부
    if (_.isEqual(rowData.chkAprvYn,"Y")) {
      SBUxMethod.attr('btnSbmsnClclnChkDoc','disabled','true');
    } else {
      SBUxMethod.attr('btnSbmsnClclnChkDoc','disabled','false');
    }

    // 제출된 증빙서류
    await fn_searchPrufDoc(); // 제출된 증빙서류 조회

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

  /** 증빙서류 **/
   const objDoc = {
    maxSeq : -1,
    prefix : "tbl-doc-",
    getInitCol: function(_knd) {
      let col = -1;
      switch (_knd) {
        case "DOC_CHECK":	// 선택
          col = 0;
          break;
        case "MAJOR_ARTICLE":	// 주요항목
          col = 1;
          break;
        case "ARTICLE":			// 세부항목
          col = 2;
          break;
        case "DMND_CN":			// 요청내용
          col = 3;
          break;
        case "DMND_AMT":		// 요청금액
          col = 4;
          break;
        case "PRUF_DOC_BSC":	// 공통증빙
          col = 5;
          break;
        case "PRUF_DOC":		// 증빙서류
          col = 6;
          break;
        case "DMND_RMRK":		// 비고
          col = 7;
          break;
      }
      return col;
    },
    initList : [
      // attribute default (id, name)
      // 체크
      {
        isSBUx: true,
        elementKey: "dmndCheck",
        type: "sbux-checkbox",
        id: "chk-dmndCheck",
        attributes: {
          "uitype": "normal",
          "class": "form-control input-sm input-sm-ast",
          "true-value": "Y",
          "false-value": "N",
        },
        exAttributes: {

        },
        exEvents: [],
      },
      // 1 행 : 주요항목
      {
        isSBUx: true,
        elementKey: "dmndArtclKnd",
        type: "sbux-select",
        id: "slt-majorArticle",
        attributes: {
          "uitype": "single",
          "unselected-text": "선택",
          "class": "form-control input-sm input-sm-ast",
          "jsondata-ref": "jsonMajorArtcl",
        },
        exAttributes: {

        },
        exEvents: [{
          key: "onchange",
          name: "fn_onChangeMajorArticle"
        }],
      },
      // 2 행 : 세부항목
      {
        isSBUx: true,
        elementKey: "dmndArtclCd",
        type: "sbux-select",
        id: "slt-article",
        attributes: {
          "uitype": "single",
          //"unselected-text": "선택",
          "class": "form-control input-sm input-sm-ast",
          "jsondata-ref": "jsonDtlArtcl",
          "jsondata-filter": "mastervalue"
        },
        exAttributes: {
          "filter-source-name": "slt-majorArticle"
        },
        exEvents: [{
          key: "onchange",
          name: "fn_onChangeArticle"
        }],
      },
      // 3 행 : 내용
      {
        isSBUx: true,
        elementKey: "dmndCn",
        type: "sbux-input",
        id: "inp-dmndCn",
        attributes: {
          "uitype": "text",
          "autocomplete": "off",
          "placeholder": "예) 딸기농가교육",
          "class": "form-control input-sm",
        },
        exAttributes: {
        },
        exEvents: [],
      },
      // 4 행 : 정산요청액
      {
        isSBUx: true,
        elementKey: "dmndAmt",
        type: "sbux-input",
        id: "inp-dmndAmt",
        attributes: {
          "uitype": "text",
          "class": "form-control input-sm input-sm-ast inpt_data_reqed",
          "maxlength": "15",
          "autocomplete": "off",
          "mask": "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}",
        },
        exAttributes: {
          "filter-source-name": "slt-majorArticle"
        },
        exEvents: [{
          key: "onchange",
          name: "fn_onChangeDmndAmt"
        }],
      },
      // 5 행 : 공통증빙
      {
        isSBUx: false,
        elementKey: "pfudDocBsc",
        type: "div",
        id: 'div-prufDocBsc',
        attributes: {
        },
        contents: {
          "classList": ["evGroup"]
        }
      },
      // 6행 : 증빙서류
      {
        isSBUx: false,
        elementKey: "pfudDoc",
        type: "div",
        id: 'div-prufDoc',
        attributes: {
        },
        contents: {
          "textContent": "세부항목 선택 시 표시",
          "classList": ["evGroup"]
        }
      },
      // 7 행 : 비고
      {
        isSBUx: true,
        elementKey: "dmndRmrk",
        type: "sbux-textarea",
        id: "txa-dmndRmrk",
        attributes: {
          "uitype": "normal",
          "class": "form-control input-sm input-sm-ast txa-resize",
          "resize": "true",
          //"auto-resize": "true",
          "detect-attack": "true"
        },
        exAttributes: {

        },
        exEvents: [],
      },
    ],
  }

  function ClclnDmndRow(_nRow) {
    this.row = _nRow;
    this.elementsId = {
      dmndCheck: {id: ""},
      dmndArtclKnd: {id: ""},
      dmndArtclCd: {id: ""},
      dmndCn: {id: ""},
      dmndAmt: {id: ""},
      dmndRmrk: {id: ""},
      pfudDocBsc: {id: "", sub: []},
      pfudDoc: {id: "", sub: []},
    };
    this.files = {};
  }


  // const objRows = [];
  const objRows = Object.create(null); // key: seq, value: ClclnDmndRow
  const __ACCEPT = ['pdf','jpg','jpeg','png','hwp','hwpx'];

  // FileList 재구성을 위한 helper
  function buildFileList(files){
    const dt = new DataTransfer();
    files.forEach(f=> dt.items.add(f));
    return dt.files;
  }

  function getSubEntry(bucket, code) {
    let entry = bucket.find(x => x.code === code);
    if (!entry) {
      entry = { code, files: [] };   // files: File[]
      bucket.push(entry);
    }
    return entry;
  }

  // 공통증빙
  const fn_renderPrufDocBsc = function(_row) {
    if (_row < 0) return;

    const row = objRows[_row];
    if (!row) { console.warn('row not found', _row, objRows); return; }

    const parentId = "tbl-doc-div-prufDocBsc" + String(_row);
    const parentEl = document.getElementById(parentId);
    while (parentEl.firstChild) parentEl.removeChild(parentEl.lastChild);

    const docs = jsonCmnsPrufCd;
    if (!docs || docs.length === 0) {
      parentEl.style.color = '#94a3b8';
      parentEl.textContent = '공통증빙 없음';
      return;
    }

    // ★ 저장소: row.elementsId.pfudDocBsc.sub (Array<{code, files[]}>)
    const bucket = row.elementsId.pfudDocBsc.sub;

    docs.forEach(doc => {
      const entry = getSubEntry(bucket, doc.value);  // doc.value별 파일리스트 보관

      const elBox  = document.createElement('div');
      elBox.className = 'evItem';

      const elHead = document.createElement('div');
      elHead.className = 'evHead';

      const elName = document.createElement('div');
      elName.className = 'evName';
      elName.textContent = doc.text;

      const elFile = document.createElement('input');
      elFile.type = 'file';
      elFile.multiple = true;
      elFile.accept = __ACCEPT.map(x => '.' + x).join(',');
      elFile.id = doc.value + '-' + String(_row);    // 행별 유니크 id

      const elChips = document.createElement('div');
      elChips.className = 'files';

      function refreshChips() {
        elChips.innerHTML = '';
        (entry.files || []).forEach((f, idx) => {
          const c = document.createElement('span');
          c.className = 'chip';
          c.textContent = f.name + ' ';

          const x = document.createElement('span');
          x.className = 'x';
          x.textContent = '×';
          x.title = '이 파일 제거';
          x.onclick = () => {
            const files = entry.files.slice();
            files.splice(idx, 1);
            entry.files = files;                 // 상태 갱신
            elFile.value = '';
            elFile.files = buildFileList(files); // input 동기화
            refreshChips();
          };

          c.appendChild(x);
          elChips.appendChild(c);
        });
      }

      elFile.onchange = (e) => {
        const files = Array.from(e.target.files || []);
        const safe = files.filter(f => __ACCEPT.includes(f.name.split('.').pop().toLowerCase()));
        const merged = (entry.files || []).concat(safe);
        entry.files = merged;                    // 상태 저장
        elFile.files = buildFileList(merged);    // input 동기화
        refreshChips();
      };

      // 초기 동기화
      if (entry.files && entry.files.length > 0) {
        elFile.files = buildFileList(entry.files);
      }
      refreshChips();

      elHead.append(elName);
      elBox.append(elHead, elFile, elChips);
      parentEl.appendChild(elBox);
    });
  };

  // 세부증빙
  const fn_renderPrufDoc = function(_row, _article) {
    try {
      if (_row < 0) return;
      const row = objRows[_row];
      if (!row) { console.warn('row not found', _row, objRows); return; }

      const parentId = "tbl-doc-div-prufDoc" + String(_row);
      const parentEl = document.getElementById(parentId);
      while (parentEl.firstChild) parentEl.removeChild(parentEl.lastChild);

      if (gfn_isEmpty(_article)) return;

      const docs = gfn_getJsonFilter(jsonDtlPrufCd, "artclCd", _article);
      if (docs.length === 0) {
        parentEl.style.color = '#94a3b8';
        parentEl.textContent = '세부항목 선택 시 표시';
        return;
      }

      // ★ 저장소: row.elementsId.pfudDoc.sub (Array<{code, files[]}>)
      const bucket = row.elementsId.pfudDoc.sub;

      docs.forEach(doc => {
        const entry = getSubEntry(bucket, doc.value);

        const elBox  = document.createElement('div');
        elBox.className = 'evItem';

        const elHead = document.createElement('div');
        elHead.className = 'evHead';

        const elName = document.createElement('div');
        elName.className = 'evName';
        elName.textContent = doc.text;

        const elFile = document.createElement('input');
        elFile.type = 'file';
        elFile.multiple = true;
        elFile.accept = __ACCEPT.map(x => '.' + x).join(',');
        elFile.id = doc.value + '-' + String(_row); // 유니크 id

        const elChips = document.createElement('div');
        elChips.className = 'files';

        function refreshChips() {
          elChips.innerHTML = '';
          (entry.files || []).forEach((f, idx) => {
            const c = document.createElement('span');
            c.className = 'chip';
            c.textContent = f.name + ' ';

            const x = document.createElement('span');
            x.className = 'x';
            x.textContent = '×';
            x.title = '이 파일 제거';
            x.onclick = () => {
              const files = entry.files.slice();
              files.splice(idx, 1);
              entry.files = files;                 // 상태 갱신
              elFile.value = '';
              elFile.files = buildFileList(files); // input 동기화
              refreshChips();
            };

            c.appendChild(x);
            elChips.appendChild(c);
          });
        }

        elFile.onchange = (e) => {
          const files = Array.from(e.target.files || []);
          const safe  = files.filter(f => __ACCEPT.includes(f.name.split('.').pop().toLowerCase()));
          const merged = (entry.files || []).concat(safe);
          entry.files = merged;                    // 상태 저장
          elFile.files = buildFileList(merged);    // input 동기화
          refreshChips();
        };

        if (entry.files && entry.files.length > 0) {
          elFile.files = buildFileList(entry.files);
        }
        refreshChips();

        elHead.append(elName);
        elBox.append(elHead, elFile, elChips);
        parentEl.appendChild(elBox);
      });

    } catch (e) {
      if (!(e instanceof Error)) e = new Error(e);
      console.error("failed", e.message);
    }
  };

  // 세부항목 변경
  const fn_onChangeArticle = function(_nRow) {

    const col = objDoc.getInitCol("ARTICLE");
    if (col < 0) {
      return;
    }

    fn_renderPrufDocBsc(_nRow); // 공통증빙
    const id = objDoc.prefix + objDoc.initList[col].id + String(_nRow);

    const article = SBUxMethod.get(id);
    fn_renderPrufDoc(_nRow, article); // 세부증빙
  }



  // 행추가
  const fn_docNewRow = function() {
    const brno = SBUxMethod.get('dtl-inp-clclnAplyBrno') ; // 사업자번호

    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0001", "조직"); // W0001  {0}을/를 선택하세요.
      return;
    }

    try {

      objDoc.maxSeq++;

      const seq = objDoc.maxSeq;
      const row = new ClclnDmndRow(seq); // 객체 만들기

      const sbuxList = [];
      const newRow = document.createElement("tr"); // 새로운 행
      newRow.setAttribute("id", objDoc.prefix + "tr"  + String(seq)); // tbl-doc-tr+seq
      newRow.setAttribute("data-seq",seq);

      // objDoc.initList의 객체 만큼
      objDoc.initList.forEach(item => {
        const td = document.createElement("td");

        const id = objDoc.prefix + item.id + String(seq);
        const element = document.createElement(item.type); // sbux-input, subx-select, div
        element.setAttribute("id", id);
        element.setAttribute("name", id);

        if (item.hasOwnProperty("elementKey")) {
          row.elementsId[item.elementKey].id = id;
        }

        for (const key in item.attributes) {
          if (item.attributes.hasOwnProperty(key)) { // 객체의 속성인지 확인 (상속받은 속성 제외)
            element.setAttribute(key, item.attributes[key]);
          }
        }

        if (item.isSBUx) {
          for (const key in item.exAttributes) {
            if (item.exAttributes.hasOwnProperty(key)) { // 객체의 속성인지 확인 (상속받은 속성 제외)
              element.setAttribute(key, objDoc.prefix + item.exAttributes[key] + String(seq));
            }
          }

          // item의 이벤트 -> onchange
          item.exEvents.forEach(evt => {
            element.setAttribute(evt.key, evt.name + "(" + String(seq) + ")");
          });
          sbuxList.push(id);
        } else {
          for (const key in item.contents) {
            if (item.contents.hasOwnProperty(key)) { // 객체의 속성인지 확인 (상속받은 속성 제외)
              switch (key) {
                case "textContent":
                  element.textContent = item.contents[key];
                  break;
                case "classList":
                  if (Array.isArray(item.contents[key])) {
                    item.contents[key].forEach(clazz => {element.classList.add(clazz);});
                  }
                  break;
              }
            }
          }
        }

        td.append(element);
        newRow.appendChild(td);
      });

      const elTbody = document.getElementById("doc-tbd-newData"); // tbody에 append
      elTbody.appendChild(newRow);

      sbuxList.forEach(id => {
        SBUxMethod.render("#" + id);
      });

      // objRows.push(row);
      // 삭제때문 변경

      objRows[seq] = row;

    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }

  // 주요항목 변경
  const fn_onChangeMajorArticle = function(_nRow) {
    const col = objDoc.getInitCol("MAJOR_ARTICLE");
    if (col < 0) {
      return;
    }
    const id = objDoc.prefix + objDoc.initList[col].id + String(_nRow);
    fn_clearArticle(_nRow); // 세부항목 초기화 + render
    fn_onChangeArticle(_nRow); // 세부항목 변경
  }

  const fn_clearArticle = function(_nRow) {
    const col = objDoc.getInitCol("ARTICLE");
    if (col < 0) {
      return;
    }
    const id = objDoc.prefix + objDoc.initList[col].id + String(_nRow);

    SBUxMethod.set(id, "");
    SBUxMethod.refresh(id);
    fn_renderPrufDoc(_nRow); // 세부증빙 render
  }

  // 공통증빙 변경
  const fn_onChangePrufDocBsc = function(_nRow) {
    const col = objDoc.getInitCol("PRUF_DOC_BSC");
    if (col < 0) {
      return;
    }
    const id = objDoc.prefix + objDoc.initList[col].id + String(_nRow);
    alert(SBUxMethod.get(id));
  }

  // 정산요금 변경
  const fn_onChangeDmndAmt = function(_nRow) {
    const col = objDoc.getInitCol("DMND_AMT");
    if (col < 0) {
      return;
    }
    const id = objDoc.prefix + objDoc.initList[col].id + String(_nRow);
  }

  // 체크 행 삭제
  function fn_prufDelRow() {
    const tbody = document.getElementById('doc-tbd-newData');
    // 직계 tr만 수집
    const trs = Array.from(tbody.querySelectorAll(':scope > tr'));
    if (trs.length === 0) {
      gfn_comAlert("W0003","행삭제"); // W0003 {0}할 대상이 없습니다.
      return;
    }

    const trPrefix  = objDoc.prefix + 'tr';             // "tbl-doc-tr"
    const chkPrefix = objDoc.prefix + 'chk-dmndCheck';  // "tbl-doc-chk-dmndCheck"

    // 삭제할 리스트
    const deleteList = [];

    trs.forEach(tr => {
      const trId = tr.id || '';
      if (!trId.startsWith(trPrefix)) return;

      const seq = Number(trId.slice(trPrefix.length));
      const chkId = chkPrefix + String(seq);


      let checked = false;
      checked = (SBUxMethod.get(chkId)[chkId] === 'Y');
      if (checked) deleteList.push({ tr, seq });
    });

    if (deleteList.length === 0) {
      gfn_comAlert("W0003","행삭제"); // W0003 {0}할 대상이 없습니다.
      return;
    }

    // 삭제
    deleteList.forEach(({ tr, seq }) => {
      tr.remove();
      delete objRows[seq];
    });

  }

  // 증빙서류 제출
  async function fn_clclnPrufSbmsn() {

    const brno = SBUxMethod.get('dtl-inp-clclnAplyBrno') ; // 사업자번호
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

    const tbody = document.getElementById('doc-tbd-newData');
    const trs = Array.from(tbody.querySelectorAll(':scope > tr'));
    if (trs.length === 0) {
      gfn_comAlert("W0003", "제출"); // W0003 {0}할 대상이 없습니다.
      return;
    }

    const trPrefix = objDoc.prefix + 'tr';             // "tbl-doc-tr"
    const chkPrefix = objDoc.prefix + 'chk-dmndCheck';  // "tbl-doc-chk-dmndCheck"

    // 저장목록
    const saveSeqList = [];

    trs.forEach(tr => {
      const trId = tr.id || '';
      if (!trId.startsWith(trPrefix)) return;

      const seq = Number(trId.slice(trPrefix.length));
      const chkId = chkPrefix + String(seq);

      let checked = false;
      checked = (SBUxMethod.get(chkId)[chkId] === 'Y');
      if (checked) saveSeqList.push({tr, seq});
    });

    if (gfn_isEmpty(saveSeqList)) {
      gfn_comAlert("W0003","증빙서류 제출"); // W0003 {0}할 대상이 없습니다.
      return;
    }

    var formData = new FormData(); // 기본정보, 파일정보리스트, 파일리스트

    // 저장 obj
    const saveObj = {
      sprtBizYr : sprtBizYr,
      sprtBizCd : sprtBizCd,
      sprtOgnzId : sprtOgnzId,
      clclnSeq : clclnSeq,
      clclnDInfoList: [], // 지원사업 정산요청 문서 정보 목록
      clclnFileInfoList: [] // 파일정보리스트
    };

    for (let i = 0; i < saveSeqList.length; i++) {
      const seq = saveSeqList[i].seq;
      const objRow = objRows[seq];
      const elementId = objRow.elementsId;

      // elementId
      const majorId = elementId.dmndArtclKnd.id;  // 주요항목
      const artclId = elementId.dmndArtclCd.id;   // 세부항목
      const cnId = elementId.dmndCn.id;        // 내용
      const amtId = elementId.dmndAmt.id;       // 금액
      const rmrkId = elementId.dmndRmrk.id;      // 비고
      // 증빙서류
      const prufDocBsc = elementId.pfudDocBsc.sub; // 공통증빙
      const prufDoc = elementId.pfudDoc.sub; // 세부증빙

      const majorVl = SBUxMethod.get(majorId); // 주요항목
      const artclVl = SBUxMethod.get(artclId); // 세부항목
      const titleVl = SBUxMethod.get(cnId); // 내용
      const amtVl = SBUxMethod.get(amtId); // 금액
      const rmrkVl = SBUxMethod.get(rmrkId); // 비고

      /** 주요항목,세부항목,금액 없을때 **/
      if (gfn_isEmpty(majorVl)) {
        gfn_comAlert("W0001", "주요항목"); // W0001 {0}을/를 선택하세요.
        return;
      }
      if (gfn_isEmpty(artclVl)) {
        gfn_comAlert("W0001", "세부항목"); // W0001 {0}을/를 선택하세요.
        return;
      }
      if (gfn_isEmpty(amtVl)) {
        gfn_comAlert("W0002", "금액"); // W0002 {0}을/를 입력하세요.
        return;
      }

      // 정산요청정보
      saveObj.clclnDInfoList.push({
        dmndArtclKnd: majorVl,
        dmndArtclCd: artclVl,
        dmndCn: titleVl,
        dmndAmt: amtVl,
        dmndRmrk: rmrkVl,
        seq : seq,
      });

      // 공통증빙
      prufDocBsc.forEach(item => {
        if (!gfn_isEmpty(item.files)) {
          for (let k = 0; k < item.files.length; k++) {
            // 파일 고유 식별자(UUID)
            const file = item.files[k];
            const originalFileName = file.name; // 기존 파일명
            const uuid = self.crypto.randomUUID();
            const extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
            const newFileNm = `${'${uuid}'}${'${extension}'}`;
            const newFile = new File([file], newFileNm, {type : file.type});

            // 공통증빙 파일리스트 추가
            saveObj.clclnFileInfoList.push({
              docKnd: 'PRUF_BSC',
              docCd: item.code,
              originalFileName: originalFileName,
              fileSize: file.size,
              fileType: file.type,
              fileId : newFileNm,
              seq : seq,
            });
            formData.append('prufFileList', newFile);
          }
        }
      });

      // 세부증빙
      prufDoc.forEach(item => {
        if (!gfn_isEmpty(item.files)) {
          for (let k = 0; k < item.files.length; k++) {
            // 파일 고유 식별자(UUID)
            const file = item.files[k];
            const originalFileName = file.name; // 기존 파일명
            const uuid = self.crypto.randomUUID(); // 파일 식별자
            const extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
            const newFileNm = `${'${uuid}'}${'${extension}'}`;
            const newFile = new File([file], newFileNm, {type : file.type});

            // 세부증빙 파일리스트 추가
            saveObj.clclnFileInfoList.push({
              docKnd: artclVl,
              docCd: item.code,
              originalFileName: originalFileName,
              fileSize: file.size,
              fileType: file.type,
              fileId : newFileNm,
              seq : seq
            });
            formData.append('prufFileList', newFile);
          }
        }
      });

    }
    formData.append('saveObj',JSON.stringify(saveObj));

    return;
    if (!gfn_comConfirm("Q0001", "정산신청 증빙서류 제출")) {	//	Q0001	{0} 하시겠습니까?
      return;
    }

    const postJsonPromise = gfn_postFormData('/pd/sprt/clclnDDocReg.do', formData, 'PD_014_002');

    const data = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus)) {
        fn_clear();
        fn_clearPruf(); // 증빙서류 초기화
        gfn_comAlert("I0001");					// I0001 처리 되었습니다.
      }
    } catch(e) {
      console.log(data.resultMessage);
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }
  }

  // 정산 증빙서류 초기화
  function fn_clearPruf() {
    const tbody = document.getElementById('doc-tbd-newData');

    // tbody비우기
    for (let i = tbody.children.length - 1; i >= 0; i--) {
      tbody.removeChild(tbody.children[i]);
    }
    // 상태 초기화
    const keys = Object.keys(objRows);
    for (let i = 0; i < keys.length; i++) {
      delete objRows[keys[i]];
    }
    // 번호가 0 부터 시작
    objDoc.maxSeq = -1;
  }

  // 정산 등록된 증빙서류 조회
  async function fn_searchPrufDoc() {
    fn_clearExsPruf();
    const brno = SBUxMethod.get('dtl-inp-clclnAplyBrno') ; // 사업자번호
    const clclnSeq = SBUxMethod.get('dtl-slt-clclnAplySeq'); // 회차
    const sprtBizYr = SBUxMethod.get('dtl-inp-clclnAplySprtBizYr'); // 지업사업연도
    const sprtBizCd = SBUxMethod.get('dtl-inp-clclnAplySprtBizCd'); // 지업사업코드
    const sprtOgnzId = SBUxMethod.get('dtl-inp-clclnAplySprtOgnzId'); // 지업조직아이디

    const postJsonPromise = gfn_postJSON("/pd/sprt/selectClclnPrufList.do", {
      sprtBizYr: sprtBizYr,
      sprtBizCd: sprtBizCd,
      sprtOgnzId: sprtOgnzId,
      clclnSeq: clclnSeq,
    });
    const data = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus) && data.resultList.length > 0) {

        const prufObj = {
          sprtBizYr: data.resultList[0].sprtBizYr,
          sprtBizCd: data.resultList[0].sprtBizCd,
          sprtOgnzId: data.resultList[0].sprtOgnzId,
          clclnSeq: data.resultList[0].clclnSeq,
          clclnDInfoList: []
        }

        // 요청순서별로
        const dmndMap = {};

        data.resultList.forEach(item => {
          const dmndSeq = item.dmndSeq; // 요청순서
          const dmndArtclKnd = item.dmndArtclKnd; // 주요항목코드
          const dmndArtclKndNm = item.dmndArtclKndNm; // 주요항목명
          const dmndArtclCd = item.dmndArtclCd; // 세부항목코드
          const dmndArtclCdNm = item.dmndArtclCdNm; // 세부항목명
          const dmndAmt = item.dmndAmt;
          const dmndCn = item.dmndCn;
          const dmndRmrk = item.dmndRmrk;
          const docKnd = item.docKnd; // 문서종류(공통/세부)

          if (!dmndMap[dmndSeq]) {
            dmndMap[dmndSeq] = {
              dmndSeq : dmndSeq,
              dmndArtclKnd : dmndArtclKnd,
              dmndArtclKndNm : dmndArtclKndNm,
              dmndArtclCd : dmndArtclCd,
              dmndArtclCdNm : dmndArtclCdNm,
              dmndAmt : dmndAmt,
              dmndCn : dmndCn,
              dmndRmrk : dmndRmrk,
              clclnBscFileInfoList: [],
              clclnDtlFileInfoList: []
            };
          }

          if (docKnd === "PRUF_BSC") { // 곻통증빙
            dmndMap[dmndSeq].clclnBscFileInfoList.push({
              docKnd : item.docKnd,
              docNm : item.docNm,
              lgcFileNm : item.lgcFileNm,
              docCd : item.docCd,
              atchFileSn : item.atchFileSn,
              docSeq : item.docSeq
            });
          } else { // 세부증빙
            dmndMap[dmndSeq].clclnDtlFileInfoList.push({
              docKnd : item.docKnd,
              docNm : item.docNm,
              lgcFileNm : item.lgcFileNm,
              docCd : item.docCd,
              atchFileSn : item.atchFileSn,
              docSeq : item.docSeq
            });
          }
        });

        prufObj.clclnDInfoList = Object.values(dmndMap);
        /** 등록된 제출서류 보여주기 **/
        fn_createExsDocRow(prufObj);
      }
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }
  }


  const exsObjPrufDoc = {
    maxSeq : -1,
    prefix : "tbl-exs-doc-",
    getInitCol: function(_knd) {
      let col = -1;
      switch (_knd) {
        case "DMND_SEQ":	// 요청순서
          col = 0;
          break;
        case "MAJOR_ARTICLE":	// 주요항목
          col = 1;
          break;
        case "ARTICLE":			// 세부항목
          col = 2;
          break;
        case "DMND_CN":			// 요청내용
          col = 3;
          break;
        case "DMND_AMT":		// 요청금액
          col = 4;
          break;
        case "PRUF_DOC_BSC":	// 공통증빙
          col = 5;
          break;
        case "PRUF_DOC":		// 증빙서류
          col = 6;
          break;
        case "DMND_RMRK":		// 비고
          col = 7;
          break;
      }
      return col;
    },
    initList : [
      // attribute default (id, name)
      // 요청순서
      {
        isSBUx: true,
        elementKey: "dmndSeq",
        type: "sbux-label",
        id: "inp-dmndSeq",
        attributes: {
          "uitype":"normal",
        },
        contents: {
        }
      },
      // 1 행 : 주요항목
      {
        isSBUx: true,
        elementKey: "dmndArtclKndNm",
        type: "sbux-input",
        id: "inp-majorArticleNm",
        attributes: {
          "uitype": "text",
          "class": "form-control input-sm input-sm-ast",
          "readonly" : "true"
        },
        exAttributes: {

        },
        exEvents: [],
      },
      // 2 행 : 세부항목
      {
        isSBUx: true,
        elementKey: "dmndArtclNm",
        type: "sbux-input",
        id: "inp-articleNm",
        attributes: {
          "uitype": "text",
          "class": "form-control input-sm input-sm-ast",
          "readonly" : "true"
        },
        exAttributes: {
        },
        exEvents: [],
      },
      // 3 행 : 내용
      {
        isSBUx: true,
        elementKey: "dmndCn",
        type: "sbux-input",
        id: "inp-dmndCn",
        attributes: {
          "uitype": "text",
          "autocomplete": "off",
          "placeholder": "예) 딸기농가교육",
          "class": "form-control input-sm",
        },
        exAttributes: {
        },
        exEvents: [],
      },
      // 4 행 : 정산요청액
      {
        isSBUx: true,
        elementKey: "dmndAmt",
        type: "sbux-input",
        id: "inp-dmndAmt",
        attributes: {
          "uitype": "text",
          "class": "form-control input-sm input-sm-ast",
          "maxlength": "15",
          "autocomplete": "off",
          "mask": "{'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true}",
        },
        exAttributes: {
        },
        exEvents: [],
      },
      // 5 행 : 공통증빙
      {
        isSBUx: false,
        elementKey: "pfudDocBsc",
        type: "div",
        id: 'div-prufDocBsc',
        attributes: {
        },
        contents: {
          "classList": ["evGroup"]
        }
      },
      // 6행 : 증빙서류
      {
        isSBUx: false,
        elementKey: "pfudDoc",
        type: "div",
        id: 'div-prufDoc',
        attributes: {
        },
        contents: {
          "classList": ["evGroup"]
        }
      },
      // 7 행 : 비고
      {
        isSBUx: true,
        elementKey: "dmndRmrk",
        type: "sbux-textarea",
        id: "txa-dmndRmrk",
        attributes: {
          "uitype": "normal",
          "class": "form-control input-sm input-sm-ast txa-resize",
          "resize": "true",
          "detect-attack": "true"
        },
        exAttributes: {
        },
        exEvents: [],
      },
            // 주요항목코드
      {
        isSBUx: true,
        elementKey: "dmndArtclKnd",
        type: "sbux-input",
        id: "inp-majorArticle",
        attributes: {
          "uitype": "hidden",
          "class": "form-control input-sm input-sm-ast",
          "readonly" : "true"
        },
        exAttributes: {

        },
        exEvents: [],
      },
            // 세부항목 코드
      {
        isSBUx: true,
        elementKey: "dmndArtclCd",
        type: "sbux-input",
        id: "inp-article",
        attributes: {
          "uitype": "hidden",
          "class": "form-control input-sm input-sm-ast",
          "readonly" : "true"
        },
        exAttributes: {
        },
        exEvents: [],
      },
    ],
  }


  function ExsDmndRow(_nRow) {
    this.row = _nRow;
    this.elementsId = {
      dmndSeq : {id:""},
      dmndArtclKndNm: {id: ""},
      dmndArtclKnd: {id: ""},
      dmndArtclNm: {id: ""},
      dmndArtclCd: {id: ""},
      dmndCn: {id: ""},
      dmndAmt: {id: ""},
      dmndRmrk: {id: ""},
      pfudDocBsc: {id: "", sub: []},
      pfudDoc: {id: "", sub: []},
    };
    this.files = {};
  }

  // 추가제출용
  const exsRows = Object.create(null);

  const fn_createExsDocRow = function(_prufObj) {
    const div = document.getElementById('exsPrufDoc');
    div.style.display = "block";

    // 초기화
    const tbody = document.getElementById('pruf-tbody');
    for (let i = tbody.children.length - 1; i >= 0; i--) {
      tbody.removeChild(tbody.children[i]);
    }

    try {

      exsObjPrufDoc.maxSeq = -1;

      const rows = _prufObj.clclnDInfoList || [];
      if (!Array.isArray(rows) || rows.length === 0) return;

      rows.forEach(row => {

        exsObjPrufDoc.maxSeq++;
        const seq = exsObjPrufDoc.maxSeq;
        const rowObj = new ExsDmndRow(seq); // 객체 만들기

        // tr 생성
        const tr = document.createElement('tr');
        tr.id = exsObjPrufDoc.prefix + 'tr' + seq;
        tr.setAttribute('data-seq', seq);

        const sbuxList = [];

        exsObjPrufDoc.initList.forEach(item => {
          const td = document.createElement('td');
          td.style.verticalAlign = 'top';

          const id = exsObjPrufDoc.prefix + item.id + seq;
          const el = document.createElement(item.type); // sbux-input / sbux-textarea / div / label
          el.setAttribute('id', id);
          el.setAttribute('name', id);

          if (item.hasOwnProperty("elementKey")) {
            rowObj.elementsId[item.elementKey].id = id;
          }

          // 공통 attributes
          const attrs = item.attributes || {};
          Object.keys(attrs).forEach(k => el.setAttribute(k, attrs[k]));

          if (item.isSBUx) {
            sbuxList.push(id);
          } else {
            const c = item.contents || {};
            if (c.textContent) el.textContent = c.textContent;
            if (Array.isArray(c.classList)) c.classList.forEach(cls => el.classList.add(cls));
          }

          td.appendChild(el);
          tr.appendChild(td);
          exsRows[seq] = rowObj;
        });

        // tbody에 append
        tbody.appendChild(tr);
        // sbux render
        sbuxList.forEach(id => SBUxMethod.render("#" + id));

        // 값 set
        const idDmndSeq = exsObjPrufDoc.prefix + 'inp-dmndSeq' + seq;
        const idMajorNm   = exsObjPrufDoc.prefix + 'inp-majorArticleNm' + seq;
        const idArticleNm = exsObjPrufDoc.prefix + 'inp-articleNm' + seq;
        const idCn      = exsObjPrufDoc.prefix + 'inp-dmndCn' + seq;
        const idAmt     = exsObjPrufDoc.prefix + 'inp-dmndAmt' + seq;
        const idRmrk    = exsObjPrufDoc.prefix + 'txa-dmndRmrk' + seq;
        const idMajor   = exsObjPrufDoc.prefix + 'inp-majorArticle' + seq;
        const idArticle = exsObjPrufDoc.prefix + 'inp-article' + seq;

        document.getElementById(idDmndSeq).innerText = row.dmndSeq;
        SBUxMethod.set(idMajorNm,row.dmndArtclKndNm);
        SBUxMethod.set(idMajor,row.dmndArtclKnd);
        SBUxMethod.set(idArticleNm,row.dmndArtclCdNm);
        SBUxMethod.set(idArticle,row.dmndArtclCd);
        SBUxMethod.set(idCn, row.dmndCn);
        SBUxMethod.set(idAmt, row.dmndAmt);
        SBUxMethod.set(idRmrk, row.dmndRmrk);

        /** 공통,세부 증빙 넣기!! **/
        // 공통/세부 컨테이너
        const idBscDiv = exsObjPrufDoc.prefix + 'div-prufDocBsc' + seq;
        const idDtlDiv = exsObjPrufDoc.prefix + 'div-prufDoc'    + seq;
        const bscWrap  = document.getElementById(idBscDiv);
        const dtlWrap  = document.getElementById(idDtlDiv);

        /** 공통증빙 **/
        const requiredBsc = jsonCmnsPrufCd || [];
        // 기존 파일을 코드별로 매핑
        const bscMap = {};
        (row.clclnBscFileInfoList || []).forEach(f => {
          (bscMap[f.docCd] ||= []).push(f);
        });

        requiredBsc.forEach(def => {
          const box = document.createElement('div');
          box.className = 'evItem';

          // 기존 파일칩
          const exist = document.createElement('div');
          fn_renderExistingChips(exist, bscMap[def.value] || [], def.text, row.dmndSeq);
          box.appendChild(exist);

          // 파일추가업로드
          fn_renderAddUploader({
            container: box,
            dmndSeq: row.dmndSeq,
            artclCd : row.dmndArtclCd,
            docKnd: "PRUF_BSC",
            docCd: def.value,
            seq : seq,
          });
          bscWrap.appendChild(box);
        });

        /** 세부증빙 **/
        const requiredDtl = (jsonDtlPrufCd || []).filter(function(d){ return d.artclCd === row.dmndArtclCd; });
        const dtlMap = {};
        (row.clclnDtlFileInfoList || []).forEach(function(f){
          if (!dtlMap[f.docCd]) dtlMap[f.docCd] = [];
          dtlMap[f.docCd].push(f);
        });

        requiredDtl.forEach(def => {
          const box = document.createElement('div');
          box.className = 'evItem';

          // 기존 파일칩
          const exist = document.createElement('div');
          fn_renderExistingChips(exist, dtlMap[def.value] || [], def.text, row.dmndSeq);
          box.appendChild(exist);

          // 파일추가업로드
          fn_renderAddUploader({
            container: box,
            dmndSeq: row.dmndSeq,
            artclCd : row.dmndArtclCd,
            docKnd: row.dmndArtclCd,
            docCd: def.value,
            seq : seq,
          });
          dtlWrap.appendChild(box);
        });

      }); // rows.forEach

    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }

  /**
   * @name fn_renderExistingChips
   * @description 등록된 파일칩 render
   */
  function fn_renderExistingChips(container, files, titleText, dmndSeq) {
    container.innerHTML = '';

    // 증빙head
    const head = document.createElement('div');
    head.className = 'evHead';

    const nm = document.createElement('div');
    nm.className = 'evName';
    nm.textContent = titleText;

    head.appendChild(nm);
    container.appendChild(head);

    // 파일 목록
    const box = document.createElement('div');
    box.className = 'files';

    if (!files || files.length === 0) {
      const none = document.createElement('div');
      none.className = 'hint';
      none.textContent = '제출된 파일 없음';
      box.appendChild(none);

    } else {
      files.forEach(file => {
        const item  = document.createElement('div');
        item.className = 'chip'; // 칩 스타일 재활용

        // 파일명
        const label = document.createElement('span');
        const name  = file.lgcFileNm;
        label.textContent = name;

        // 다운로드 버튼
        const btn = document.createElement('button');
        btn.type = 'button';
        btn.className = 'btn btn-xs btn-outline-primary btnClass';
        btn.textContent = '삭제';

        btn.onclick = function () {
         fn_deleteExsPruf(file, dmndSeq); // 파일삭제
        };

        item.appendChild(label);
        item.appendChild(document.createTextNode(' ')); // 간격
        item.appendChild(btn);
        box.appendChild(item);
      });
    }

    container.appendChild(box);
  }

  /**
   * @name fn_renderAddUploader
   * @description 등록된 파일 보여주는곳에서 파일추가
   */
  function fn_renderAddUploader(opts) {
    const container = opts.container; // 부모 container
    const dmndSeq = opts.dmndSeq; // 요청순서
    const docKnd = opts.docKnd; //
    const docCd = opts.docCd; // 문서코드
    const seq = opts.seq; // 순서
    const artclCd = opts.artclCd;

    const row = exsRows[seq];
    if (!row) { console.warn('exsRows not found for seq:', seq, exsRows); return; }

    let bucket;
    if (_.isEqual(docKnd,'PRUF_BSC')) {
      bucket = row.elementsId.pfudDocBsc.sub
    } else {
      bucket = row.elementsId.pfudDoc.sub
    }

    // 항목에 맞는거만 가져옴
    const entry = getSubEntry(bucket, docCd);

    // wrap
    const wrap = document.createElement('div');
    wrap.className = 'evItem';
    wrap.style.marginTop = '8px';

    // 헤더
    const head = document.createElement('div');
    head.className = 'evHead';
    head.textContent = '파일추가';

    wrap.appendChild(head);

    // 파일 input
    const elFile = document.createElement('input');
    elFile.type = 'file';
    elFile.multiple = true;
    elFile.accept = __ACCEPT.map(x => '.' + x).join(',');
    elFile.id = 'add-' + String(dmndSeq) + '-' + String(docKnd) + '-' + String(docCd) + '-' + String(seq);

    // 칩 영역
    const elChips = document.createElement('div');
    elChips.className = 'files';

    function refreshChips() {
      elChips.innerHTML = '';
      (entry.files || []).forEach((f, idx) => {
        const c = document.createElement('span');
        c.className = 'chip';
        c.textContent = f.name + ' ';

        const x = document.createElement('span');
        x.className = 'x';
        x.textContent = '×';
        x.title = '추가한 파일 제거';
        x.onclick = () => {
          const files = (entry.files || []).slice();
          files.splice(idx, 1);
          entry.files = files;                 // 상태 갱신
          elFile.value = '';
          const fl = buildFileList(files);
          if (fl) elFile.files = fl;           // 가능 환경에서 동기화
          refreshChips();
        };

        c.appendChild(x);
        elChips.appendChild(c);
      });
    }

    elFile.onchange = (e) => {
      const files  = Array.from(e.target.files || []);
      const safe   = files.filter(f => __ACCEPT.includes(f.name.split('.').pop().toLowerCase()));
      const merged = (entry.files || []).concat(safe);
      entry.files  = merged;                   // 상태 저장
      const fl = buildFileList(merged);
      if (fl) elFile.files = fl;               // 가능 환경에서 동기화
      refreshChips();
    };

    if (entry.files && entry.files.length > 0) {
      const fl = buildFileList(entry.files);
      if (fl) elFile.files = fl;
    }
    refreshChips();


    wrap.appendChild(elFile);
    wrap.appendChild(elChips);

    container.appendChild(wrap);
  }


  /**
   * @name fn_deleteExsPruf
   * @description 증빙서류 삭제
   */
  async function fn_deleteExsPruf(file, dmndSeq) {
    const clclnSeq = SBUxMethod.get('dtl-slt-clclnAplySeq'); // 회차
    const sprtBizYr = SBUxMethod.get('dtl-inp-clclnAplySprtBizYr'); // 지업사업연도
    const sprtBizCd = SBUxMethod.get('dtl-inp-clclnAplySprtBizCd'); // 지업사업코드
    const sprtOgnzId = SBUxMethod.get('dtl-inp-clclnAplySprtOgnzId'); // 지업조직아이디

    if (!gfn_comConfirm("Q0001","등록된 증빙서류입니다. 삭제")) { //	Q0001	{0} 하시겠습니까?
      return;
    }

    const postJsonPromise = gfn_postJSON("/pd/sprt/deleteClclnPrufDoc.do", {
      sprtBizYr: sprtBizYr,
      sprtBizCd: sprtBizCd,
      sprtOgnzId: sprtOgnzId,
      clclnSeq: clclnSeq,
      atchFileSn : file.atchFileSn,
      docSeq : file.docSeq,
      dmndSeq : dmndSeq
    });
    const data = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus)) {
        fn_clear();
        fn_clearExsPruf(); // 기제출 증빙서류 초기화
        gfn_comAlert("I0001");	// I0001	처리 되었습니다.
      }

    }  catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.log(data.resultMessage);
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }
  }

  /**
   * @name fn_addPrufSbmsn
   * @description 증빙서류 추가 제출
   */
  const fn_addPrufSbmsn = async function () {

    const brno = SBUxMethod.get('dtl-inp-clclnAplyBrno') ; // 사업자번호
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

    const tbody = document.getElementById('pruf-tbody');
    const trs = Array.from(tbody.querySelectorAll(':scope > tr'));
    if (trs.length === 0) {
      gfn_comAlert("W0003", "저장"); // W0003 {0}할 대상이 없습니다.
      return;
    }

    var formData = new FormData();

    // 저장 obj
    const updateObj = {
      sprtBizYr : sprtBizYr,
      sprtBizCd : sprtBizCd,
      sprtOgnzId : sprtOgnzId,
      clclnSeq : clclnSeq,
      clclnDInfoList: [], // 지원사업 정산요청 문서 정보 목록
      clclnFileInfoList: [] // 파일정보리스트
    }

    Object.keys(exsRows).forEach(function(seq){
      const row = exsRows[seq];
      const elementsId = row.elementsId;

      // elementId
      const majorId = elementsId.dmndArtclKnd.id;  // 주요항목
      const artclId = elementsId.dmndArtclCd.id;   // 세부항목
      const cnId = elementsId.dmndCn.id;        // 내용
      const amtId = elementsId.dmndAmt.id;       // 금액
      const rmrkId = elementsId.dmndRmrk.id;      // 비고
      const dmndSeqId = elementsId.dmndSeq.id; // 정산요청순번

      // 증빙서류
      const prufDocBsc = elementsId.pfudDocBsc.sub; // 공통증빙
      const prufDoc = elementsId.pfudDoc.sub; // 세부증빙

      const majorVl = SBUxMethod.get(majorId); // 주요항목
      const artclVl = SBUxMethod.get(artclId); // 세부항목
      const titleVl = SBUxMethod.get(cnId); // 내용
      const amtVl = SBUxMethod.get(amtId); // 금액
      const rmrkVl = SBUxMethod.get(rmrkId); // 비고
      const dmndSeq = document.getElementById(dmndSeqId).textContent; // 정산요청순번


      // 정산요청정보
      updateObj.clclnDInfoList.push({
        dmndArtclKnd: majorVl,
        dmndArtclCd: artclVl,
        dmndCn: titleVl,
        dmndAmt: amtVl,
        dmndRmrk: rmrkVl,
        dmndSeq : dmndSeq,
      });

      // 공통증빙
      prufDocBsc.forEach(item => {
        if (!gfn_isEmpty(item.files)) {
          for (let k = 0; k < item.files.length; k++) {
            // 파일 고유 식별자(UUID)
            const file = item.files[k];
            const originalFileName = file.name; // 기존 파일명
            const uuid = self.crypto.randomUUID();
            const extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
            const newFileNm = `${'${uuid}'}${'${extension}'}`;
            const newFile = new File([file], newFileNm, {type : file.type});

            // 공통증빙 파일리스트 추가
            updateObj.clclnFileInfoList.push({
              docKnd: 'PRUF_BSC',
              docCd: item.code,
              originalFileName: originalFileName,
              fileSize: file.size,
              fileType: file.type,
              fileId : newFileNm,
              dmndSeq : dmndSeq,
            });
            formData.append('prufFileList', newFile);
          }
        }
      });

      // 세부증빙
      prufDoc.forEach(item => {
        if (!gfn_isEmpty(item.files)) {
          for (let k = 0; k < item.files.length; k++) {
            // 파일 고유 식별자(UUID)
            const file = item.files[k];
            const originalFileName = file.name; // 기존 파일명
            const uuid = self.crypto.randomUUID(); // 파일 식별자
            const extension = originalFileName.substring(originalFileName.lastIndexOf('.'));
            const newFileNm = `${'${uuid}'}${'${extension}'}`;
            const newFile = new File([file], newFileNm, {type : file.type});

            // 세부증빙 파일리스트 추가
            updateObj.clclnFileInfoList.push({
              docKnd: artclVl,
              docCd: item.code,
              originalFileName: originalFileName,
              fileSize: file.size,
              fileType: file.type,
              fileId : newFileNm,
              dmndSeq : dmndSeq
            });
            formData.append('prufFileList', newFile);
          }
        }
      });

    });
    formData.append('updateObj',JSON.stringify(updateObj));

    if (!gfn_comConfirm("Q0001", "증빙서류 변경 저장")) {	//	Q0001	{0} 하시겠습니까?
      return;
    }

    const postJsonPromise = gfn_postFormData('/pd/sprt/updateClclnPrufDoc.do', formData, 'PD_014_002');
    const data = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus)) {
        fn_clear();
        fn_clearExsPruf(); // 기제출 증빙서류 초기화
        gfn_comAlert("I0001"); // I0001 처리 되었습니다.
      }
    } catch(e) {
      console.log(data.resultMessage);
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }
  }

  /**
   * @name fn_clearExsPruf
   * @description 증빙서류 초기화
   */
  function fn_clearExsPruf() {
    const tbody = document.getElementById('pruf-tbody');

    // tbody비우기
    for (let i = tbody.children.length - 1; i >= 0; i--) {
      tbody.removeChild(tbody.children[i]);
    }
    // 상태 초기화
    const keys = Object.keys(exsRows);
    for (let i = 0; i < keys.length; i++) {
      delete exsRows[keys[i]];
    }
    // 번호가 0 부터 시작
    exsObjPrufDoc.maxSeq = -1;

    // 영역 숨기기
    const div = document.getElementById('exsPrufDoc');
    div.style.display = "none";

  }

  /**
   * @name fn_opoenClclnPrufPrvw
   * @description 증빙서류 미리보기
   */
  const fn_opoenClclnPrufPrvw = function () {
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

    const url = "/pd/sprt/clclnPurfPrvwPopup.do";
    const title = "증빙서류 미리보기";
    window.open(url, title, "width=1000px,height=900px");
  }

  function fn_getJsonCmnsPrufCd() {
    return jsonCmnsPrufCd;
  }

  function fn_getJsonDtlPrufCd() {
    return jsonDtlPrufCd;
  }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
