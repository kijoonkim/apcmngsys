<%
  /**
   * @Class Name : uoSummry2026.jsp
   * @Description : 통합조직관리 총괄표 2026
   * @author SI개발부
   * @since 2025.11.24
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2025.11.24   유민지	    최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>title : 통합조직관리 - 총괄표 2026</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
  <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
<section>
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start; align-items: center;" >
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title" style="margin-top: 6px;"> ▶ <c:out value='${menuNm}'></c:out></h3>
        <!-- 통합조직 관리 총괄표 2026 -->
      </div>
      <div style="margin-left: auto;">
        <c:if test="${loginVO.userType eq '91'}">
          <!-- userType 91 농협관계자 조회 -->
          <sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
        </c:if>
        <c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02'}">
          <sbux-button id="btnRowData" name="btnRowData" uitype="normal" text="로우데이터 다운" class="btn btn-sm btn-outline-danger" onclick="fn_hiddenGrdSelect"></sbux-button>
          <sbux-button id="btnReportAll1" name="btnReportAll1" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_allReport"></sbux-button>
          <sbux-button id="btnOpenPopup" name="btnOpenPopup" uitype="normal" class="btn btn-sm btn-primary" text="과거실적 팝업" onclick="fn_openMaodal"></sbux-button>
          <sbux-button id="btnSearchFclt" name="btnSearchFclt" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
          <!--
          <sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report"></sbux-button>
          -->
        </c:if>
        <c:if test="${loginVO.apoSe eq '1'}">
          <sbux-button id="btnReportAll2" name="btnReportAll2" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_allReport"></sbux-button>
          <sbux-button id="btnOpenPopup" name="btnOpenPopup" uitype="normal" class="btn btn-sm btn-primary" text="과거실적 팝업" onclick="fn_openMaodal"></sbux-button>
          <%--<sbux-button id="btnPrfmncCorpDdlnYn01" name="btnPrfmncCorpDdlnYn01" uitype="normal" text="실적 법인체마감" class="btn btn-sm btn-outline-danger" onclick="fn_userPrfmncCorpDdlnYn"></sbux-button>--%>
          <sbux-button id="btnPrfmncCorpDdlnYn01" name="btnPrfmncCorpDdlnYn01" uitype="normal" text="최종제출" class="btn btn-sm btn-outline-danger" onclick="fn_lastSbmt"></sbux-button>
          <sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
        </c:if>
      </div>
    </div>
    <div class="box-body">
      <c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91'}">
        <!--[pp] 검색 -->
        <table class="table table-bordered tbl_fixed">
          <caption>검색 조건 설정</caption>
          <colgroup>
            <col style="width: 11%">
            <col style="width: 6%">
            <col style="width: 6%">
            <col style="width: 6%">
            <col style="width: 6%">

            <col style="width: 11%">
            <col style="width: 6%">
            <col style="width: 6%">
            <col style="width: 6%">
            <col style="width: 6%">
            <col style="width: 6%">

            <col style="width: 6%">
            <col style="width: 6%">
            <col style="width: 6%">
            <col style="width: 6%">
            <col style="width: 6%">
          </colgroup>
          <tbody>
          <tr>
            <th scope="row" class="th_bg" >신청년도</th>
            <td colspan="3" class="td_input" style="border-right:hidden;" >
              <sbux-select
                      id="slt-dtlPage"
                      name="slt-dtlPage"
                      uitype="single"
                      jsondata-ref="jsonDtlPage"
                      class="form-control input-sm"
                      onchange="fn_onChangePage(this)"
              ></sbux-select>
              <sbux-input id="srch-input-yr" name="srch-input-yr" uitype="hidden"></sbux-input>
              <sbux-checkbox
                      id="srch-input-yrChk"
                      name="srch-input-yrChk"
                      uitype="normal"
                      text="해당년도 신청사용자만 보기"
                      text-left-padding="5px"
                      text-right-padding="25px"
                      true-value="Y"
                      false-value="N"
                      checked
              ></sbux-checkbox>
            </td>
            <td style="border-right: hidden;"></td>
            <th scope="row" class="th_bg" >관할기관</th>
            <td colspan="3" class="td_input" style="border-right:hidden;" >
              <sbux-select
                      id="srch-input-cmptnInst"
                      name="srch-input-cmptnInst"
                      uitype="single"
                      jsondata-ref="jsonComCmptnInst"
                      unselected-text="전체"
                      class="form-control input-sm"
                      onchange="fn_onChangeSrchItemCd(this)"
              ></sbux-select>
            </td>
            <td style="border-right: hidden;"></td>
            <th colspan="2" scope="row" class="th_bg" >시도</th>
            <td colspan="3" class="td_input" style="border-right:hidden;">
              <sbux-select
                      id="srch-input-ctpv"
                      name="srch-input-ctpv"
                      uitype="single"
                      jsondata-ref="jsonComCtpv"
                      unselected-text="전체"
                      class="form-control input-sm"
                      onchange="fn_onChangeSrchItemCd(this)"
              ></sbux-select>
            </td>
            <td class="td_input">
            </td>
          </tr>
          <tr>
            <th scope="row" class="th_bg">법인구분</th>
            <td colspan="3" class="td_input" style="border-right:hidden;">
              <sbux-select
                      id="srch-input-corpSeCd"
                      name="srch-input-corpSeCd"
                      uitype="single"
                      jsondata-ref="jsonComCorpSeCd"
                      unselected-text="전체"
                      class="form-control input-sm"
                      onchange="fn_onChangeSrchItemCd(this)"
              ></sbux-select>
            </td>
            <td class="td_input" style="border-right: hidden;" >
            </td>
            <th scope="row" class="th_bg">법인형태</th>
            <td colspan="3" class="td_input" style="border-right:hidden;">
              <sbux-select
                      id="srch-input-corpDtlSeCd"
                      name="srch-input-corpDtlSeCd"
                      uitype="single"
                      jsondata-ref="jsonComCorpDtlSeCd"
                      unselected-text="전체"
                      class="form-control input-sm"
                      onchange="fn_onChangeSrchItemCd(this)"
              ></sbux-select>
            </td>
            <td class="td_input" style="border-right: hidden;" >
            </td>
            <th colspan="2" scope="row" class="th_bg">통합조직여부</th>
            <td colspan="3" class="td_input" style="border-right: hidden;">
              <sbux-select
                      id="srch-input-aprv"
                      name="srch-input-aprv"
                      uitype="single"
                      jsondata-ref="jsonComAprv"
                      unselected-text="전체"
                      class="form-control input-sm"
                      onchange="fn_onChangeSrchItemCd(this)"
              ></sbux-select>
            </td>
            <td class="td_input">
            </td>
          </tr>
          <tr>
            <th scope="row" class="th_bg">신청대상구분</th>
            <td colspan="3" class="td_input" style="border-right: hidden;">
              <sbux-select
                      id="srch-input-aplyTrgtSe"
                      name="srch-input-aplyTrgtSe"
                      uitype="single"
                      jsondata-ref="jsonComAplyTrgtSe"
                      unselected-text="전체"
                      class="form-control input-sm"
                      onchange="fn_onChangeSrchItemCd(this)"
              ></sbux-select>
            </td>
            <td class="td_input"  style="border-right: hidden;">
            </td>
            <th scope="row" class="th_bg">사업자번호</th>
            <td colspan="3" class="td_input" style="border-right: hidden;">
              <sbux-input
                      uitype="text"
                      id="srch-input-brno"
                      name="srch-input-brno"
                      class="form-control input-sm srch-keyup-area"
                      mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
                      autocomplete="off"
              ></sbux-input>
            </td>
            <td class="td_input">
            </td>
            <th colspan="2" scope="row" class="th_bg">법인명</th>
            <td colspan="3" class="td_input" style="border-right:hidden;" >
              <sbux-input
                      uitype="text"
                      id="srch-input-corpNm"
                      name="srch-input-corpNm"
                      class="form-control input-sm srch-keyup-area"
                      autocomplete="off"
              ></sbux-input>
            </td>
            <td class="td_input">
          </tr>
          <tr>
            <th scope="row" class="th_bg">적합품목 보유 여부</th>
            <td colspan="3" class="td_input" style="border-right: hidden;">
              <sbux-select
                      id="srch-input-stbltHldYn"
                      name="srch-input-stbltHldYn"
                      uitype="single"
                      jsondata-ref="jsonComStbltHldYn"
                      unselected-text="전체"
                      class="form-control input-sm"
              ></sbux-select>
            </td>
            <td class="td_input"></td>
            <th scope="row" class="th_bg">실적마감여부</th>
            <td colspan="3" class="td_input" style="border-right: hidden;">
              <sbux-select
                      id="srch-input-prfmncCorpDdlnYn"
                      name="srch-input-prfmncCorpDdlnYn"
                      uitype="single"
                      jsondata-ref="jsonComPrfmncCorpDdlnYn"
                      unselected-text="전체"
                      class="form-control input-sm"
              ></sbux-select>
            </td>
            <td class="td_input">
            </td>
            <td colspan="6" class="td_input" style="border-right: hidden;border-bottom: hidden;">
          </tr>
          </tbody>
        </table>

        <%-- 법인체마감 --%>
        <div style="display:flex; justify-content: flex-start; margin-top: 10px;" >
          <div style="margin-left: auto;">
            <c:if test="${loginVO.userType ne '02' && loginVO.userType ne '91'}"> <%--출자조직, 농협관계자 아닐때--%>
              <%--<sbux-button id="btnPrfmncCorpDdlnYnY" name="btnPrfmncCorpDdlnYnY" uitype="normal" text="실적 법인체 선택마감" class="btn btn-sm btn-outline-danger" onclick="fn_prfmncCorpDdlnYn(1)"></sbux-button>--%>
              <%--<sbux-button id="btnPrfmncCorpDdlnYnN" name="btnPrfmncCorpDdlnYnN" uitype="normal" text="실적 법인체 선택마감해제" class="btn btn-sm btn-outline-danger" onclick="fn_prfmncCorpDdlnYn(2)"></sbux-button>--%>
              <%--<sbux-button id="btnPrfmncCorpDdlnYnAllY" name="btnPrfmncCorpDdlnYnAllY" uitype="normal" text="실적 법인체 일괄마감" class="btn btn-sm btn-outline-danger" onclick="fn_prfmncCorpDdlnYnAll(1)"></sbux-button>
              <sbux-button id="btnPrfmncCorpDdlnYnAllN" name="btnPrfmncCorpDdlnYnAllN" uitype="normal" text="실적 법인체 일괄마감해제" class="btn btn-sm btn-outline-danger" onclick="fn_prfmncCorpDdlnYnAll(2)"></sbux-button>--%>
              <sbux-button id="btnLastSbmt" name="btnLastSbmt" uitype="normal" text="최종제출" class="btn btn-sm btn-outline-danger" onclick="fn_lastSbmt"></sbux-button>
              <sbux-button id="btnCnclLastSbmt" name="btnCnclLastSbmt" uitype="normal" text="최종제출 취소" class="btn btn-sm btn-outline-danger" onclick="fn_cnclLastSbmt"></sbux-button>
            </c:if>
          </div>
        </div>

        <div class="">
          <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
              <li>
                <span style="font-size:14px">▶통합조직 리스트</span>
                <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
              </li>
            </ul>
          </div>
          <!-- SBGrid를 호출합니다. -->
          <div id="sb-area-grdPrdcrOgnCurntMng" style="height:350px; width: 100%;"></div>
        </div>

        <br>

        <div class="box-header" style="display:flex; justify-content: flex-start;" >
          <div style="margin-left: auto;">
            <sbux-checkbox
                    id="dtl-chk-upbrToAprv"
                    name="dtl-chk-upbrToAprv"
                    uitype="normal"
                    text="육성형을 승인형으로 조회"
                    text-left-padding="5px"
                    text-right-padding="25px"
                    true-value="Y"
                    false-value="N"
            ></sbux-checkbox>
            <sbux-button id="btnSearchFclt1" name="btnSearchFclt1" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_dtlGridSearch"></sbux-button>
            <!--
            <sbux-button id="btnReport5" name="btnReport5" uitype="normal" class="btn btn-sm btn-primary" text="출력" onclick="fn_report2"></sbux-button>
            <sbux-button id="btnReportIso" name="btnReportIso" uitype="normal" class="btn btn-sm btn-primary" text="소속 출자출하조직 총괄표 출력" onclick="fn_reportIso"></sbux-button>
            <sbux-button id="btnReport6" name="btnReport6" uitype="normal" class="btn btn-sm btn-primary" text="전속(약정)출하 현황출력" onclick="fn_report3"></sbux-button>
            -->
          </div>
        </div>
      </c:if><!-- 관리자 권한인 경우 그리드 표기 -->
      <table class="table table-bordered tbl_fixed">
        <caption>통합조직 표기</caption>
        <tbody>
        <tr>
          <th scope="row" class="th_bg th_border_right">법인명</th>
          <sbux-input uitype="hidden" id="dtl-input-apoCd" name="dtl-input-apoCd"></sbux-input>
          <sbux-input uitype="hidden" id="dtl-input-apoSe" name="dtl-input-apoSe"></sbux-input>
          <sbux-input uitype="hidden" id="dtl-input-yr" name="dtl-input-yr"></sbux-input>
          <sbux-input uitype="hidden" id="dtl-input-prfmncCorpDdlnYn" name="dtl-input-prfmncCorpDdlnYn"></sbux-input>
          <td colspan="2" class="td_input">
            <sbux-input
                    uitype="text"
                    id="dtl-input-corpNm"
                    name="dtl-input-corpNm"
                    class="form-control input-sm"
                    autocomplete="off"
                    readonly
            ></sbux-input>
          </td>
          <td class="td_input"  style="border-left: hidden;">
          <th scope="row" class="th_bg th_border_right">사업자번호</th>
          <td colspan="2" class="td_input">
            <sbux-input
                    uitype="text"
                    id="dtl-input-brno"
                    name="dtl-input-brno"
                    class="form-control input-sm"
                    mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}"
                    autocomplete="off"
                    readonly
            ></sbux-input>
          </td>
          <td class="td_input"  style="border-left: hidden;">
          </td>
          <th scope="row" class="th_bg th_border_right">법인등록번호</th>
          <td colspan="2" class="td_input">
            <sbux-input
                    uitype="text"
                    id="dtl-input-crno"
                    name="dtl-input-crno"
                    class="form-control input-sm"
                    mask = "{ 'alias': '999999-9999999' , 'autoUnmask': true}"
                    autocomplete="off"
                    readonly
            ></sbux-input>
          </td>
          <td class="td_input"  style="border-left: hidden;">
        </tr>
        </tbody>
      </table>

      <!--[pp] 검색결과 상세보기-->
      <div class="ad_section_top">
        <div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
          <p>o 통합조직 총 취급실적 : 전문품목 매입매출 화면에서 품목별 총매출 실적이 불려옴</p>
          <p>o 생산자조직 전속출하실적 : 전문품목 매입매출 화면에서 "출자출하조직-전속출하 실적", "(통합조직직속) 전속출하 실적"의 합이 불려옴</p>
          <br>
          <p>　⇒ 생산자조직관리/출자출하조직관리/통합조직관리 실적입력 내용 확인 후 "법인체 마감"</p>
        </div>
        <div class="ad_tbl_top">
          <ul class="ad_tbl_count">
            <li>
              <span style="font-size:14px">▶총괄표</span>
              <!--
              <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
               -->
            </li>
          </ul>
        </div>
        <!-- SBGrid를 호출합니다. -->
        <div id="sb-area-grdPrdcrOgnCurntMng01" style="height:350px; width: 100%;"></div>
        <c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
          <div class="box-header" style="display:flex; justify-content: flex-start;" >
            <div style="margin-left: auto;">
              <sbux-button id="updateStbltYn1" name="updateStbltYn1" uitype="normal" text="적합여부 Y으로 변경" class="btn btn-sm btn-outline-danger" onclick="fn_updateStbltYn(1)"></sbux-button>
              <sbux-button id="updateStbltYn2" name="updateStbltYn2" uitype="normal" text="적합여부 N으로 변경" class="btn btn-sm btn-outline-danger" onclick="fn_updateStbltYn(2)"></sbux-button>
              <sbux-button id="updateStbltYn3" name="updateStbltYn3" uitype="normal" text="적합여부 빈칸으로 초기화" class="btn btn-sm btn-outline-danger" onclick="fn_updateStbltYn"></sbux-button>
              <!--
              <sbux-button id="updateStbltYn4" name="updateStbltYn4" uitype="normal" text="적합여부 전체 갱신" class="btn btn-sm btn-outline-danger" onclick="fn_updateAllUoStbltYn"></sbux-button>
              -->
              <sbux-button id="btnSave01" name="btnSave01" uitype="normal" text="조치사항 저장" class="btn btn-sm btn-outline-danger" onclick="fn_listSave"></sbux-button>
            </div>
          </div>
          <div style="display:flex; justify-content: flex-start;" >
            <div style="margin-left: auto;">
              <p>원래의 적합여부로 적용 하려면 전문품목 매입매출에서 저장</p>
            </div>
          </div>
        </c:if>
      </div>
      <%--요약 - 부류별 합계 화면에서 안보이게 처리 2025.05.28 --%>
      <%--<div class="ad_section_top">
          <div class="ad_tbl_top">
              <ul class="ad_tbl_count">
                  <li>
                      <span style="font-size:14px">▶요약 - 부류별 합계</span>
                  </li>
              </ul>
          </div>
          <!-- SBGrid를 호출합니다. -->
          <div id="sb-area-grdClsfTot" style="height:300px; width: 100%;"></div>
      </div>--%>

      <%-- 목표입력 (생산유통통합조직 등록, 총괄표 두군데에서) --%>
      <div style="height: 10px"></div>

      <div class="ad_tbl_top">
        <ul class="ad_tbl_count">
          <li>
            <span style="font-size:14px">▶품목 리스트</span>
          </li>
        </ul>
        <sbux-button id="btnSaveGpcList" name="btnSaveGpcList" uitype="normal" text="품목리스트 저장" class="btn btn-sm btn-outline-danger" onclick="fn_saveGpcList"></sbux-button>
      </div>
      <div style="border:1px solid #f4f4f4; background-color: #f4f4f4; border-radius: 10px; padding: 10px;">
        <p><b> o 품목리스트 : 2024년도에 생산유통통합조직에서 취급한 전문/육성 품목 뿐 아니라, 조직에서 취급하고 있는 기타품목까지 모두 등록<span style="color: red;">(출자출하조직 제외)</span></b></p>
        <p><b> - 여기에 등록해놓은 품목으로 조직의 2024년도 총 취급액을 확인할 수 있어야 함 (★ 실적점검 시 해당서류도 제출 필요)</b></p>
        <p> - 기본요건 확인 : 임산물류, 양곡류(미곡류 제외) 취급하는 조직의 경우, 원예농산물 대상품목(부류기준 : 청과부류, 화훼부류, 약용작물류) 취급액이 전체 취급액의 50% 이상 여부 확인</p>
        <p>　* 취급액이 너무 작은 품목(ex. 품목당 취급액 비중이 총취급액의 10% 미만 등)은 품목명을 "부류별 기타(ex.과실류기타, 과채류기타 등)"로 묶어서 작성 가능</p>
        <p> - 평가부류 : 세팅값은 있으나 조직별 재배기준에 따라 변경 가능하며, 해당 평가부류를 적용해서 "전문품목에 대한 부류별 평가"를 진행하오니 반드시 확인 필요</p>
        <p> - 취급액·취급률 목표 : 산지유통활성화자금 배정을 위한 평가에 반영("전문품목"만 해당하나, 육성품목 및 기타품목도 참고용으로 작성요청)<span style="color: red">*제시된 목표는 원칙적으로 수정 불가</span></p>
      </div>
      <div class="sb-area-grdGpcList">
        <!-- SBGrid를 호출합니다. -->
        <div id="sb-area-grdGpcList" style="height:200px; width: 100%;"></div>
      </div>

    </div>
    <div id="sb-area-hiddenGrd" style="height:400px; width: 100%; display: none;"></div>
  </div>
</section>

<!-- 품목 팝업 -->
<div>
  <sbux-modal
          id="modal-gpcList"
          name="modal-gpcList"
          uitype="middle"
          header-title="품목 선택"
          body-html-id="body-modal-gpcList"
          footer-is-close-button="false"
          style="width:800px"
  ></sbux-modal>
</div>
<div id="body-modal-gpcList">
  <jsp:include page="/WEB-INF/view/apcss/pd/popup/gpcSelectPopup.jsp"></jsp:include>
</div>

</body>
<script type="text/javascript">

  const initIndtfNo = "2026";

  var jsonDtlPage = [];

  const fn_setInitPage = async function(_targetId, _initIndtfNo) {

    jsonDtlPage.length = 0;
    const pruoMst = await gfn_getPruoRegMst();
    if (Array.isArray(pruoMst)) {
      pruoMst.forEach((item) => {
        jsonDtlPage.push({
          'text': item.indctNm,
          'label': item.indctNm,
          'value': item.crtrYr
        });
      });
      SBUxMethod.refresh(_targetId);
    }
    SBUxMethod.set(_targetId, _initIndtfNo);
  }

  const fn_onChangePage = function(page) {
    //window.location.reload();
    const baseUrl = window.location.pathname.split('?')[0];
    window.location.href = baseUrl + '?idntfNo=' + page.value;
  }

  window.addEventListener('DOMContentLoaded', async function(e) {

    await fn_setInitPage("slt-dtlPage", initIndtfNo);

    await fn_init();

    const elements = document.querySelectorAll(".srch-keyup-area");

    for (let i = 0; i < elements.length; i++) {
      const el = elements.item(i);
      el.addEventListener("keyup", (event) => {
        if (event.keyCode === 13 && !event.altKey && !event.ctrlKey && !event.shiftKey) {
          fn_search();
        }
      });
    }
  });

  /* 초기화면 로딩 기능*/
  const fn_init = async function() {

    SBUxMethod.hide('dtl-chk-upbrToAprv');

    await fn_setYear();//기본년도 세팅
    await fn_createGpcListGrid(); // 품목 리스트 그리드
    await fn_initSBSelect();
    await fn_fcltMngCreateGrid01();
    //fn_fcltMngCreateGrid02();
    // await fn_createGridClsfTot(); // 요약 - 부류별합계
    <c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91'}">
    await fn_fcltMngCreateGrid();
    await fn_search();
    </c:if>
    <c:if test="${loginVO.apoSe eq '1' || loginVO.apoSe eq '2'}">
    await fn_dtlSearch();
    </c:if>

  }

  /* 기본 년도값 세팅 */
  const fn_setYear = async function() {

    const year = initIndtfNo;

    //기본년도 세팅
    SBUxMethod.set("srch-input-yr", year);
    SBUxMethod.set("dtl-input-yr", year);
  }

  var jsonComCmptnInst = [];//관할기관
  var jsonComCtpv = [];//시도
  var jsonComSgg = [];//시군
  var jsonComCorpSeCd = [];//법인구분
  var jsonComCorpDtlSeCd = [];//법인형태
  var jsonComUoCd = [];//통합조직코드
  var jsonComAprv = [];//신청구분
  var jsonComAplyTrgtSe = [];//신청대상구분

  var jsonComGrdCtpv = [];//시도
  var jsonComGrdSgg = [];//시군
  var jsonComGrdCorpSeCd = [];//법인구분
  var jsonComGrdAprv = [];//신청구분

  var jsonComGrdAprv_1 = [];//통합조직 구분
  var jsonComGrdSttgUpbrItemSe_1 = [];//품목구분

  /** 품목그리드 **/
  var jsonComCtgryCd = [];//신규부류
  var jsonComClsfCd = [];//평가부류
  var jsonComSttgUpbrItemSe = [];//품목구분 전문/육성

  var grdGpcList;
  var jsonGpcList = [];

  //적합품목 보유 여부
  var jsonComStbltHldYn = [
    {'text': 'Y','label': 'Y', 'value': 'Y'},
    {'text': 'N','label': 'N', 'value': 'N'}
  ];
  //실적 법인체 마감 여부
  var jsonComPrfmncCorpDdlnYn = [
    {'text': 'Y','label': 'Y', 'value': 'Y'},
    {'text': 'N','label': 'N', 'value': 'N'}
  ];

  /**
   * combo 설정
   */
  const fn_initSBSelect = async function() {
    let rst = await Promise.all([
      //검색조건
      gfn_setComCdSBSelect('srch-input-cmptnInst', 	jsonComCmptnInst, 	'CMPTNC_INST'), //관할기관
      //gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 	'CMPTN_INST_CTPV'), //시도
      gfn_setComCdSBSelect('srch-input-ctpv', 		jsonComCtpv, 	'UNTY_CTPV'), //시도
      //gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComSgg, 	'CMPTN_INST_SIGUN'),//시군
      gfn_setComCdSBSelect('srch-input-corpSeCd', 	jsonComCorpSeCd, 	'CORP_SE_CD'), //법인구분
      gfn_setComCdSBSelect('srch-input-corpDtlSeCd', 	jsonComCorpDtlSeCd, 	'CORP_SHAP'), //법인형태
      //gfn_setComCdSBSelect('srch-input-uoCd', 		jsonComUoCd, 	'UO_CD'), //통합조직코드
      gfn_setComCdSBSelect('srch-input-aprv', 		jsonComAprv, 	'APRV_UPBR_SE_CD'), //신청구분
      gfn_setComCdSBSelect('srch-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분
      //gfn_setComCdSBSelect('dtl-input-aplyTrgtSe', 	jsonComAplyTrgtSe, 	'APLY_TRGT_SE'), //신청대상구분

      //gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCtpv, 	'CMPTN_INST_CTPV'), //시도
      gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCtpv, 	'UNTY_CTPV'), //시도
      //gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdSgg, 		'CMPTN_INST_SIGUN'),//시군
      gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdSgg, 		'UNTY_SGG'),//시군
      gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdCorpSeCd, 	'CORP_SE_CD'), //법인구분
      gfn_setComCdSBSelect('grdPrdcrOgnCurntMng', 	jsonComGrdAprv, 	'APRV_UPBR_SE_CD'), //신청구분

      gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonComGrdAprv_1, 	'APRV_UPBR_SE_CD'), //신청구분
      gfn_setComCdSBSelect('grdPrdcrOgnCurntMng01', 	jsonComGrdSttgUpbrItemSe_1, 	'STTG_UPBR_ITEM_SE'), //품목구분

      jsonComClsfCd = gfn_getComCdDtls('CLSF_CD'), // 신규부류
      jsonComCtgryCd = gfn_getComCdDtls('CTGRY_CD'), // 평가부류
      jsonComSttgUpbrItemSe = gfn_getComCdDtls('STTG_UPBR_ITEM_SE_1'), //품목구분(기타포함)
    ]);
    jsonComClsfCd = await gfn_getComCdDtls('CLSF_CD'); // 신규부류
    jsonComCtgryCd = await gfn_getComCdDtls('CTGRY_CD'); // 평가부류
    jsonComSttgUpbrItemSe = await gfn_getComCdDtls('STTG_UPBR_ITEM_SE_1'); //품목구분(기타포함)
  }

  /** 통합조직 리스트 그리드 **/
  var jsonPrdcrOgnCurntMng = []; // 그리드의 참조 데이터 주소 선언
  var grdPrdcrOgnCurntMng

  const objMenuList = {
    "excelDwnld": {
      "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
      "accesskey": "e",					//단축키
      "callback": fn_excelDwnld,			//콜백함수명
    }
  };

  function fn_excelDwnld() {
    grdPrdcrOgnCurntMng.exportLocalExcel("통합조직관리(조직 리스트)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
  }

  /* Grid 화면 그리기 기능*/
  const fn_fcltMngCreateGrid = async function() {

    let SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng';
    SBGridProperties.id = 'grdPrdcrOgnCurntMng';
    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
    SBGridProperties.contextmenulist = objMenuList;	// 우클릭 메뉴 리스트
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.oneclickedit = true;
    SBGridProperties.paging = {
      'type' : 'page',
      'count' : 5,
      'size' : 20,
      'sorttype' : 'page',
      'showgoalpageui' : true
    };
    SBGridProperties.columns = [
      {caption: ["seq"], 			ref: 'apoCd',   	hidden : true},
      {caption: ["등록년도"], 		ref: 'yr',   	type:'output',  width:'80px',	style:'text-align:center'},
      {caption: ["실적법인체마감"], 	ref: 'prfmncCorpDdlnYn',   	type:'output',  width:'100px',	style:'text-align:center'},
      {caption: ["통합조직여부"], 	ref: 'aprv',   type:'combo',  width:'80px',	style:'text-align:center',
        disabled: true,
        typeinfo : {ref:'jsonComGrdAprv', label:'label', value:'value', displayui : false}
      },
      {caption: ["법인명"], 		ref: 'corpNm',  type:'output',  width:'250px',	style:'text-align:left'},
      {caption: ["사업자번호"], 		ref: 'brno',   	type:'output',  width:'150px',	style:'text-align:center'},
      {caption: ["적합품목(전문품목)"], ref: 'stbltYnNmList1',   	type:'output',  width:'200px',    style:'text-align:left'},
      {caption: ["적합품목(육성품목)"], ref: 'stbltYnNmList2',   	type:'output',  width:'200px',    style:'text-align:left'},
      {caption: ["법인구분"], 		ref: 'corpSeCd',type:'combo',  width:'100px',	style:'text-align:center',
        disabled: true,
        typeinfo : {ref:'jsonComGrdCorpSeCd', label:'label', value:'value', displayui : false}
      },
      {caption: ["시도"], 			ref: 'ctpv',   	type:'combo',  width:'160px',	style:'text-align:left',
        disabled: true,
        typeinfo : {ref:'jsonComGrdCtpv', label:'label', value:'value', displayui : false}
      },
      {caption: ["시군구"], 		ref: 'sgg',   	type:'combo',  width:'160px',	style:'text-align:left',
        disabled:true,
        typeinfo : {ref:'jsonComGrdSgg', label:'label', value:'value', displayui : false}
      },
      {caption: ["비고"], 			ref: 'rmrk',   	type:'output',  width:'200px',	style:'text-align:center'}
    ];

    grdPrdcrOgnCurntMng = _SBGrid.create(SBGridProperties);

    //클릭 이벤트 바인드
    grdPrdcrOgnCurntMng.bind('click','fn_view');
    grdPrdcrOgnCurntMng.bind('beforepagechanged', 'fn_pagingBbsList');

  }

  /** 총괄표 그리드 **/
  var jsonPrdcrOgnCurntMng01 = []; // 그리드의 참조 데이터 주소 선언
  var grdPrdcrOgnCurntMng01;

  const objMenuList01 = {
    "excelDwnld": {
      "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
      "accesskey": "e",					//단축키
      "callback": fn_excelDwnld01,			//콜백함수명
    }
  };


  function fn_excelDwnld01() {
    grdPrdcrOgnCurntMng01.exportLocalExcel("통합조직(총괄표)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
  }

  /* Grid 화면 그리기 기능*/
  const fn_fcltMngCreateGrid01 = async function() {

    let SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdPrdcrOgnCurntMng01';
    SBGridProperties.id = 'grdPrdcrOgnCurntMng01';
    SBGridProperties.jsonref = 'jsonPrdcrOgnCurntMng01';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
    SBGridProperties.contextmenulist = objMenuList01;	// 우클릭 메뉴 리스트
    //SBGridProperties.mergecells = 'bycol';//동일한 열 병합처리
    SBGridProperties.datamergefalseskip = true;// merge false 된 열 병합 제외
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.oneclickedit = true;
    SBGridProperties.fixedrowheight=45;
    SBGridProperties.rowheight = 57;
    //SBGridProperties.whitespacemerge = true;//빈칸 자동병합
    //SBGridProperties.mergecellsverticalalign = 'bottom';
    SBGridProperties.explorerbar = 'sort'; // 정렬
    SBGridProperties.useinitsorting = true; // 3번 클릭시 정렬 상태 복원
    SBGridProperties.columns = [
      {caption: ["구분","구분"], 	ref: 'sttgUpbrItemSeNm',   	type:'output',  width:'100px',	style:'text-align:center;'},
      {caption: ["통합조직\n구분","통합조직\n구분" ], 	ref: 'aprv',   	type:'combo',  width:'100px',	style:'text-align:center;',
        disabled:true,
        typeinfo : {ref:'jsonComGrdAprv_1', label:'label', value:'value', displayui : false}
      },
      {caption: ["품목","품목"], 	ref: 'itemNm',   	type:'output',  width:'100px',	style:'text-align:center;'},
      {caption: ["부류","부류"], 	ref: 'ctgryNm',   	type:'output',  width:'100px',	style:'text-align:center;'},

      //{caption: ["구분","구분"], 		ref: 'sttgUpbrItemSe',   	type:'combo',  width:'100px',	style:'text-align:center;', disabled:true
      //,typeinfo : {ref:'jsonComGrdSttgUpbrItemSe_1', label:'label', value:'value', displayui : false}},
      {caption: ["통합조직 \n총 취급실적","총 취급물량\n(톤)"], 		ref: 'slsCnsgnSlsVlmTot',   	type:'output',  width:'100px',	style:'text-align:right;',
        typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},
        format : {type:'number', rule:'#,###'},
        datatype : 'number'
      },
      {caption: ["통합조직 \n총 취급실적","총 취급액\n(천원)(A)"], 		ref: 'slsCnsgnSlsAmtTot',   	type:'output',  width:'120px',	style:'text-align:right;',
        typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},
        format : {type:'number', rule:'#,###'},
        datatype : 'number'
      },
      {caption: ["생산자조직\n전속출하실적","생산자조직\n전속출하물량(톤)"], 	ref: 'slsCnsgnSlsVlm',   	type:'output',  width:'100px',	style:'text-align:right;',
        typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},
        format : {type:'number', rule:'#,###'},
        datatype : 'number'
      },
      {caption: ["생산자조직\n전속출하실적","생산자조직\n전속출하액(천원)(B)"], 	ref: 'slsCnsgnSlsAmt',   	type:'output',  width:'120px',	style:'text-align:right;',
        typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},
        format : {type:'number', rule:'#,###'},
        datatype : 'number'
      },
      {caption: ["전속취급률(%)\n(B/A)","전속취급률(%)\n(B/A)"], 			ref: 'slsCnsgnSlsAmtRt',   		type:'output',  width:'100px',	style:'text-align:right;',
        format: {type: 'string', rule: '@" %"'}
      },
      {caption: ["적합여부","적합여부"], 	ref: 'orgStbltYn',   		type:'output',  width:'100px',	style:'text-align:center;'},
      {caption: ["비고","비고"], 		ref: 'stbltYnNm',   	type:'textarea',  width:'200px',	style:'padding-left:10px',
        typeinfo : {textareanewline : true},
        disabled: true
      },
      <c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
      {caption: ["조치사항","조치사항"], 		ref: 'actnMttr',   	type:'input',  width:'200px',	style:'text-align:center'},
      </c:if>
      {caption: ["상세내역"], 	ref: 'apoCd',   		hidden : true},
      {caption: ["상세내역"], 	ref: 'apoSe',   		hidden : true},
      {caption: ["상세내역"], 	ref: 'brno',   			hidden : true},
      {caption: ["상세내역"], 	ref: 'crno',   			hidden : true},
      {caption: ["상세내역"], 	ref: 'yr',   			hidden : true},
      {caption: ["상세내역"], 	ref: 'ctgryCd',   		hidden : true},
      {caption: ["상세내역"], 	ref: 'itemCd',   		hidden : true},
      {caption: ["상세내역"], 	ref: 'sttgUpbrItemSe',  hidden : true},
      {caption: ["상세내역"], 	ref: 'trmtType',   		hidden : true},
      {caption: ["상세내역"], 	ref: 'aprv',   			hidden : true},
      {caption: ["상세내역"], 	ref: 'stbltYn',   		hidden : true},
    ];

    grdPrdcrOgnCurntMng01 = _SBGrid.create(SBGridProperties);
    //grdPrdcrOgnCurntMng01.bind('click','gridClick01');
    //grdPrdcrOgnCurntMng01.bind('afteredit','fn_AfterEdit01');
  }



  /**
   * 목록 조회
   */
  const fn_search = async function() {

    // set pagination
    let pageSize = grdPrdcrOgnCurntMng.getPageSize();
    let pageNo = 1;

    await fn_setGrdFcltList(pageSize, pageNo);
  }

  const fn_pagingBbsList = async function() {
    let recordCountPerPage = grdPrdcrOgnCurntMng.getPageSize();   		// 몇개의 데이터를 가져올지 설정
    let currentPageNo = grdPrdcrOgnCurntMng.getSelectPageIndex(); 		// 몇번째 인덱스 부터 데이터를 가져올지 설정
    fn_setGrdFcltList(recordCountPerPage, currentPageNo);
  }

  //통합리포트
  const fn_allReport = async function() {
    let yr = SBUxMethod.get("dtl-input-yr");//
    if(gfn_isEmpty(yr)){
      yr = SBUxMethod.get("srch-input-yr");//
    }
    //년도 검색값이 없는 경우 최신년도
    if(gfn_isEmpty(yr)){
      let now = new Date();
      let year = now.getFullYear();
      yr = year;
    }

    let brno = SBUxMethod.get("dtl-input-brno");//
    if(gfn_isEmpty(brno)){
      alert("통합조직을 선택해주세요");
      return ;
    }
    let crno = SBUxMethod.get("dtl-input-crno");//
    let corpNm = SBUxMethod.get("dtl-input-corpNm");//

    gfn_popClipReport("검색리스트", "pd/all1.crf", {
      yr			: gfn_nvl(yr)
      , brno		: gfn_nvl(brno)
      , uoBrno	: gfn_nvl(brno)
      , corpNm 	: gfn_nvl(corpNm)
      , crno 		: gfn_nvl(crno)
    });
  }

  const fn_report = async function() {
    let yr = SBUxMethod.get("srch-input-yr");//
    //년도 검색값이 없는 경우 최신년도
    if(gfn_isEmpty(yr)){
      let now = new Date();
      let year = now.getFullYear();
      yr = year;
    }
    <c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91'}">
    let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
    let ctpv = SBUxMethod.get("srch-input-ctpv");//

    let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
    let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

    let brno = SBUxMethod.get("srch-input-brno");//
    let uoBrno = SBUxMethod.get("srch-input-uoBrno");//
    let corpNm = SBUxMethod.get("srch-input-corpNm");//

    let apoSe = SBUxMethod.get("srch-input-apoSe");//
    let frmhsHldYn = SBUxMethod.get("srch-input-frmhsHldYn");//
    let aprv = SBUxMethod.get("srch-input-aprv");//

    //sbgrid 체크박스 값 사용
    let yrChk = SBUxMethod.get("srch-input-yrChk");//
    let keys = Object.getOwnPropertyNames(yrChk);
    let yrChkVal = null;
    for (let i=0; i<keys.length; i++){
      if(yrChk[keys[i]]){
        yrChkVal = yrChk[keys[i]];
      }
    }
    </c:if>

    <c:if test="${loginVO.apoSe eq '1'}">
    let brno = '${loginVO.brno}';
    if(gfn_isEmpty(brno)) return;
    </c:if>

    <c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91'}">
    gfn_popClipReport("검색리스트", "pd/searchList3.crf", {
      brno			: gfn_nvl(brno)
      , yr			: gfn_nvl(yr)
      , frmhsHld 		: "Y"
      , cmptnInst 	: gfn_nvl(cmptnInst)
      , ctpv 			: gfn_nvl(ctpv)
      , corpSeCd 		: gfn_nvl(corpSeCd)
      , corpDtlSeCd 	: gfn_nvl(corpDtlSeCd)
      , corpNm 		: gfn_nvl(corpNm)
      , aprv 			: gfn_nvl(aprv)
      , apoSe 		: gfn_nvl(apoSe)
      , frmhsHldYn 	: gfn_nvl(frmhsHldYn)
      , yrChk 		: gfn_nvl(yrChkVal)
      , uoBrno 		: gfn_nvl(uoBrno)
    });
    </c:if>
    <c:if test="${loginVO.apoSe eq '1'}">
    gfn_popClipReport("검색리스트", "pd/searchList3.crf", {
      brno		: gfn_nvl(brno)
      , yr		: gfn_nvl(yr)
      , frmhsHld 	: "Y"
      , userType 	: "21"
    });
    </c:if>
  }




  /* Grid Row 조회 기능*/
  const fn_setGrdFcltList = async function(pageSize, pageNo){

    SBUxMethod.refresh('dtl-chk-upbrToAprv');
    SBUxMethod.hide('dtl-chk-upbrToAprv');

    fn_clearForm();//초기화
    let yr = SBUxMethod.get("srch-input-yr");//
    //년도 검색값이 없는 경우 최신년도
    if (gfn_isEmpty(yr)) {
      let now = new Date();
      let year = now.getFullYear();
      yr = year;
    }

    // 요약 - 부류별합계
    // fn_createGridClsfTot();

    let cmptnInst = SBUxMethod.get("srch-input-cmptnInst");//
    let ctpv = SBUxMethod.get("srch-input-ctpv");//

    let corpSeCd = SBUxMethod.get("srch-input-corpSeCd");//
    let corpDtlSeCd = SBUxMethod.get("srch-input-corpDtlSeCd");//

    let brno = SBUxMethod.get("srch-input-brno");//
    let corpNm = SBUxMethod.get("srch-input-corpNm");//

    let aprv = SBUxMethod.get("srch-input-aprv");//

    //sbgrid 체크박스 값 사용
    let yrChk = SBUxMethod.get("srch-input-yrChk");//
    let keys = Object.getOwnPropertyNames(yrChk);
    let yrChkVal = null;
    for ( let i=0; i<keys.length; i++ ){
      if (yrChk[keys[i]]) {
        yrChkVal = yrChk[keys[i]];
      }
    }

    let stbltHldYn = SBUxMethod.get("srch-input-stbltHldYn");//
    let prfmncCorpDdlnYn = SBUxMethod.get("srch-input-prfmncCorpDdlnYn");

    let totalRecordCount = 0;

    try {
      const url = "/pd/aom/selectUoIsoOgnzList.do";
      //let postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
      const postJsonPromise = gfn_postJSON(url, {
        cmptnInst : cmptnInst,
        ctpv : ctpv,
        corpSeCd : corpSeCd,
        corpDtlSeCd : corpDtlSeCd,
        brno : brno,
        corpNm : corpNm,
        yr : yr,
        apoSe : '1',
        stbltYnNm: 'Y',
        yrChk : yrChkVal,
        stbltHldYn : stbltHldYn, 				//적합품목 보유 여부
        prfmncCorpDdlnYn : prfmncCorpDdlnYn, 	//실적 법인체 마감 여부
        aprv : aprv,
        //페이징
        pagingYn : 'Y',
        currentPageNo : pageNo,
        recordCountPerPage : pageSize
      });

      const data = await postJsonPromise ;

      jsonPrdcrOgnCurntMng.length = 0;

      data.resultList.forEach((item, index) => {
        let PrdcrOgnCurntMngVO = {
          apoCd: item.apoCd,
          apoSe: item.apoSe,
          ctpv: item.ctpv,
          aprv: item.aprv,
          sgg: item.sgg,
          corpNm: item.corpNm,
          crno: item.crno,
          brno: item.brno,
          yr: item.yr,
          corpSeCd: item.corpSeCd,
          stbltYnNm: item.stbltYnNm,
          stbltYnNmList: item.stbltYnNmList,
          stbltYnNmList1: item.stbltYnNmList1,
          stbltYnNmList2: item.stbltYnNmList2,
          prfmncCorpDdlnYn: item.prfmncCorpDdlnYn
        }
        jsonPrdcrOgnCurntMng.push(PrdcrOgnCurntMngVO);
        if (index === 0) {
          totalRecordCount = item.totalRecordCount;
        }
      });

      if (jsonPrdcrOgnCurntMng.length > 0) {

        if (grdPrdcrOgnCurntMng.getPageTotalCount() != totalRecordCount){   // TotalCount가 달라지면 rebuild, setPageTotalCount 해주는 부분입니다
          grdPrdcrOgnCurntMng.setPageTotalCount(totalRecordCount); 		// 데이터의 총 건수를 'setPageTotalCount' 메소드에 setting
          grdPrdcrOgnCurntMng.rebuild();
        } else {
          grdPrdcrOgnCurntMng.refresh()
        }
      } else {
        grdPrdcrOgnCurntMng.setPageTotalCount(totalRecordCount);
        grdPrdcrOgnCurntMng.rebuild();
      }
      document.querySelector('#listCount').innerText = totalRecordCount;
      //grdPrdcrOgnCurntMng.rebuild();

    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }


  //사용자 화면 조회
  const fn_dtlSearch = async function(){
    let brno = '${loginVO.brno}';
    if (gfn_isEmpty(brno)) return;
    let yr = SBUxMethod.get('dtl-input-yr');


    try {

      const postJsonPromise = gfn_postJSON("/pd/aom/selectPrdcrCrclOgnReqMngList.do", {
        brno : brno,
        yr : yr
      });
      const data = await postJsonPromise ;
      data.resultList.forEach((item, index) => {
        if (item.prfmncCorpDdlnYn == "Y") {
          //법인체마감 버튼 숨김 처리
          $("#btnPrfmncCorpDdlnYn01").hide();
          $("#btnSaveGpcList").hide(); // 품목리스트 저장버튼 숨김
        }
        SBUxMethod.set('dtl-input-apoCd',gfn_nvl(item.apoCd)); //통합조직 코드
        SBUxMethod.set('dtl-input-apoSe',gfn_nvl(item.apoSe)); //통합조직 구분
        SBUxMethod.set('dtl-input-corpNm',gfn_nvl(item.corpNm)); //법인명
        SBUxMethod.set('dtl-input-crno',gfn_nvl(item.crno)); //법인등록번호
        SBUxMethod.set('dtl-input-brno',gfn_nvl(item.brno)); //사업자등록번호
        SBUxMethod.set('dtl-input-prfmncCorpDdlnYn',gfn_nvl(item.prfmncCorpDdlnYn)); // 법인체마감
      });

      await fn_dtlGridSearch();

    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }


  //통합조직 리스트 그리드 클릭시  이벤트
  const fn_view = async function(){

    fn_clearForm();

    //데이터가 존재하는 그리드 범위 확인
    const nCol = grdPrdcrOgnCurntMng.getCol();
    if (nCol < 1) {
      return;
    }
    let nRow = grdPrdcrOgnCurntMng.getRow();
    if (nRow < 1) {
      return;
    }
    if (nRow == null){
      nRow = 1;
    }

    let rowData = grdPrdcrOgnCurntMng.getRowData(nRow);

    SBUxMethod.set('dtl-input-apoCd',gfn_nvl(rowData.apoCd));	//통합조직 코드
    SBUxMethod.set('dtl-input-apoSe',gfn_nvl(rowData.apoSe));	//통합조직 구분
    SBUxMethod.set('dtl-input-corpNm',gfn_nvl(rowData.corpNm));	//법인명
    SBUxMethod.set('dtl-input-crno',gfn_nvl(rowData.crno));		//법인등록번호
    SBUxMethod.set('dtl-input-brno',gfn_nvl(rowData.brno));		//사업자등록번호
    SBUxMethod.set('dtl-input-yr',gfn_nvl(rowData.yr));			//등록년도

    SBUxMethod.refresh('dtl-chk-upbrToAprv');
    <c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
    if (_.isEqual(rowData.aprv, "1")) {
      SBUxMethod.hide('dtl-chk-upbrToAprv');
    } else {
      SBUxMethod.show('dtl-chk-upbrToAprv');
    }
    </c:if>

  }

  //그리드 초기화
  async function fn_clearForm() {
    jsonPrdcrOgnCurntMng01.length= 0;
    grdPrdcrOgnCurntMng01.rebuild();
    jsonClsfTot.length= 0;
    // grdClsfTot.rebuild(); // 요약 - 부류별 합계
    SBUxMethod.set('dtl-input-apoCd',null)//통합조직 코드
    SBUxMethod.set('dtl-input-apoSe',null)//통합조직 구분
    SBUxMethod.set('dtl-input-corpNm',null)//법인명
    SBUxMethod.set('dtl-input-crno',null)//법인등록번호
    SBUxMethod.set('dtl-input-brno',null)//사업자등록번호
    SBUxMethod.set('dtl-input-yr',null)//등록년도

    /** 품목리스트 그리드 **/
    jsonGpcList.length = 0;
    grdGpcList.rebuild();
  }

  const fn_report2 = async function() {
    let reqBrno = SBUxMethod.get("dtl-input-brno");//
    let reqYr = SBUxMethod.get("dtl-input-yr");//

    if(!reqBrno){
      alert("법인체를 선택하세요");
      return false;
    }

    let reqCorpNm = $('#dtl-input-corpNm').val();
    let reqBuisNo = $('#dtl-input-brno').val();
    let reqCorpNo = $('#dtl-input-crno').val();

    gfn_popClipReport("통합조직관리 총괄표", "pd/docAll3.crf", {
      brno 		: gfn_nvl(reqBrno)
      , yr 		: gfn_nvl(reqYr)
      , corpnm 	: gfn_nvl(reqCorpNm)
      , buisno 	: gfn_nvl(reqBuisNo)
      , corpno 	: gfn_nvl(reqCorpNo)
    });
  }

  const fn_reportIso = async function() {
    let reqBrno = SBUxMethod.get("dtl-input-brno");//
    let reqYr = SBUxMethod.get("dtl-input-yr");//

    if(!reqBrno){
      alert("법인체를 선택하세요");
      return false;
    }

    let reqCorpNm = SBUxMethod.get("dtl-input-corpNm");//

    gfn_popClipReport("소속 출자출하조직 총괄표", "pd/docAll4.crf", {
      uobrno 		: gfn_nvl(reqBrno)
      , yr 		: gfn_nvl(reqYr)
      , allgroup 	: gfn_nvl(reqCorpNm)
    });
  }

  const fn_report3 = async function() {
    let reqBrno = SBUxMethod.get("dtl-input-brno");//
    let reqYr = SBUxMethod.get("dtl-input-yr");//

    if (!reqBrno) {
      alert("통합조직을 선택하세요");
      return false;
    }

    let reqCorpNm = $('#dtl-input-corpNm').val();
    let reqBuisNo = $('#dtl-input-brno').val();
    let reqCorpNo = $('#dtl-input-crno').val();

    gfn_popClipReport("전속(약정)출하 현황출력", "pd/docAll.crf", {
      brno: gfn_nvl(reqBrno),
      yr: gfn_nvl(reqYr),
      corpnm: gfn_nvl(reqCorpNm),
      buisno: gfn_nvl(reqBuisNo),
      corpno: gfn_nvl(reqCorpNo)
    });
  }

  /**
   * @name fn_dtlGridSearch
   * @description 총괄표 조회
   */
  const fn_dtlGridSearch = async function(){
    const brno = SBUxMethod.get("dtl-input-brno");
    const yr = SBUxMethod.get("dtl-input-yr");

    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
      return;
    }

    let upbrToAprvYn = "N";
    try {
      const chkObj = SBUxMethod.get("dtl-chk-upbrToAprv");		// 육성형을 승인형으로 조회할 것인가
      const keys = Object.getOwnPropertyNames(chkObj);
      for (let i=0; i<keys.length; i++){
        if (chkObj[keys[i]]) {
          upbrToAprvYn = chkObj[keys[i]];
        }
      }
    } catch (e) {

    }


    try {
      jsonPrdcrOgnCurntMng01.length = 0;
      // let totalRecordCount = 0;

      const defaultUrl = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngListNew.do";
      const upbrToAprvUrl = "/pd/pcom/selectUoPrchsSlsSummaryListForUpbrToAprv.do";
      const postUrl = _.isEqual("Y", upbrToAprvYn) ? upbrToAprvUrl : defaultUrl;

      const param = {
        brno: brno,
        yr: yr
      }


      const postJsonPromise = gfn_postJSON(postUrl, param);
      const data = await postJsonPromise;

      // //const url = "/pd/pcom/selectUoPrchsSlsSummaryList.do";
      // const url = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngListNew.do";
      // //let postJsonPromise = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnGenalTblMngListNew.do", {
      // const postJsonPromise = gfn_postJSON(url, {
      // 	brno : brno,
      // 	yr : yr
      // });

      if (_.isEqual("S", data['resultStatus'])) {
        data.resultList.forEach((item, index) => {
          jsonPrdcrOgnCurntMng01.push({
            sttgUpbrItemSe: item.sttgUpbrItemSe,
            sttgUpbrItemSeNm: item.sttgUpbrItemSeNm,
            sttgUpbrItemNm: item.sttgUpbrItemNm,
            itemCd: item.itemCd,
            itemNm: item.itemNm,
            ctgryCd: item.ctgryCd,
            ctgryNm: item.ctgryNm,
            aprv: item.aprv,

            slsCnsgnSlsAmt: item.slsCnsgnSlsAmt,
            slsCnsgnSlsAmtTot: item.slsCnsgnSlsAmtTot,
            slsCnsgnSlsAmtRt: item.slsCnsgnSlsAmtRt,

            slsCnsgnSlsVlm: item.slsCnsgnSlsVlm,
            slsCnsgnSlsVlmTot: item.slsCnsgnSlsVlmTot,

            stbltYn: 		item.stbltYn, 		//적합여부 기준 적용 결과
            // orgStbltYn: 	item.orgStbltYn, 	//적합여부 현재 적용 값
            orgStbltYn:		_.isEqual("Y", upbrToAprvYn) ? item.stbltYn : item.orgStbltYn,

            //stbltYnNm: 		item.stbltYnNm,		//fn_calStbltYn(item)
            stbltYnNm: 				_.isEqual("Y", upbrToAprvYn) ? item.stbltYnNm : fn_calStbltYn(item),
            // stbltYnNm: 		fn_calStbltYn(item),		//fn_calStbltYn(item)
            brno: 			item.brno,
            yr: 			item.yr,
            <c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00'}">
            actnMttr: 		item.actnMttr,
            </c:if>
          });
          //
          // if (index === 0) {
          // 	totalRecordCount = item.totalRecordCount;
          // }
        });
      } else {
        gfn_comAlert(data['resultCode'], data['resultMessage']);
      }

      grdPrdcrOgnCurntMng01.rebuild();
      //fn_gridCustom();
      // fn_dtlSearchClsfTot(); // 요약 - 부류별합계
      await fn_selectGpcList(); // 품목리스트 조회
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }

  //탈락적합 사유
  function fn_calStbltYn(item) {
    let stbltYnNmMng = [];

    //강제로 변경한 경우가 존재 함
    if(!gfn_isEmpty(item.orgStbltYn)){
      if (item.orgStbltYn == 'Y') {
        return "";
      }
    }

    //예외 품목인 경우
    if(item.aprv == '1' && item.chkItemA == 'Y'){
      item.ctgryCd = '2'
    }
    //예외 품목인 경우
    if(item.aprv == '1' && item.chkItemB == 'Y'){
      item.ctgryCd = '3'
    }
    //예외 품목인 경우
    if(item.aprv == '1' && item.chkItemC == 'Y'){
      item.ctgryCd = '1'
    }

    if(item.aprv == '1' && item.sttgUpbrItemSe == '1'){
      if(item.ctgryCd == '1'){
        if(item.chkAmtTotAA != 'Y'){
          stbltYnNmMng.push('총취급액 요건 미달');
        }
        if(item.chkAA == 'A'){
          if(item.chkRtAA != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }else if(item.chkAA == 'B'){
          if(item.chkRtAB != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }else if(item.chkAA == 'C'){
          if(item.chkRtAC != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }
      }else if(item.ctgryCd == '2'){
        if(item.chkAmtTotAB != 'Y'){
          stbltYnNmMng.push('총취급액 요건 미달');
        }
        if(item.chkAB == 'A'){
          if(item.chkRtAA != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }else if(item.chkAB == 'B'){
          if(item.chkRtAB != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }else if(item.chkAB == 'C'){
          if(item.chkRtAC != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }
      }else if(item.ctgryCd == '3'){
        if(item.chkAmtTotAC != 'Y'){
          stbltYnNmMng.push('총취급액 요건 미달');
        }
        if(item.chkAC == 'A'){
          if(item.chkRtAA != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }else if(item.chkAC == 'B'){
          if(item.chkRtAB != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }else if(item.chkAC == 'C'){
          if(item.chkRtAC != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }
      }
    }else if(item.aprv == '1' && item.sttgUpbrItemSe == '2'){
      if(item.ctgryCd == '1'){
        if(item.chkAmtTotBA != 'Y'){
          stbltYnNmMng.push('총취급액 요건 미달');
        }
        if(item.chkBA == 'A'){
          if(item.chkRtBA != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }else if(item.chkBA == 'B'){
          if(item.chkRtBB != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }else if(item.chkBA == 'C'){
          if(item.chkRtBC != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }
      }else if(item.ctgryCd == '2'){
        if(item.chkAmtTotBB != 'Y'){
          stbltYnNmMng.push('총취급액 요건 미달');
        }
        if(item.chkBB == 'A'){
          if(item.chkRtBA != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }else if(item.chkBB == 'B'){
          if(item.chkRtBB != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }else if(item.chkBB == 'C'){
          if(item.chkRtBC != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }
      }else if(item.ctgryCd == '3'){
        if(item.chkAmtTotAC != 'Y'){
          stbltYnNmMng.push('총취급액 요건 미달');
        }
        if(item.chkBC == 'A'){
          if(item.chkRtBA != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }else if(item.chkBC == 'B'){
          if(item.chkRtBB != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }else if(item.chkBC == 'C'){
          if(item.chkRtBC != 'Y'){
            stbltYnNmMng.push('전속취급률 요건 미달');
          }
        }
      }
    }else if(item.aprv == '2'){
      if(item.ctgryCd == '1'){
        if(item.chkAmtTotCA != 'Y'){
          stbltYnNmMng.push('약정취급액 요건 미달');
        }
      }else if(item.ctgryCd == '2'){
        if(item.chkAmtTotCB != 'Y'){
          stbltYnNmMng.push('약정취급액 요건 미달');
        }
      }else if(item.ctgryCd == '3'){
        if(item.chkAmtTotCC != 'Y'){
          stbltYnNmMng.push('약정취급액 요건 미달');
        }
      }
      if(item.chkRtC != 'Y'){
        stbltYnNmMng.push('약정취급률 요건 미달');
      }
    }
    return stbltYnNmMng.join(" \n");
  }

  //적합여부 변경
  async function fn_updateStbltYn(_chk){
    let nRow = grdPrdcrOgnCurntMng01.getRow();
    if(nRow < 1){
      return false;
    }

    //사업자번호
    let brno = SBUxMethod.get("dtl-input-brno");
    if(gfn_isEmpty(brno)) return;

    let stbltYn = '';
    if (_chk == '1') {
      stbltYn = 'Y'
    }else if (_chk == '2') {
      stbltYn = 'N'
    }

    let yr = SBUxMethod.get("dtl-input-yr");
    if (gfn_isEmpty(yr)) {
      let now = new Date();
      let year = now.getFullYear();
      yr = year;
    }

    let rowData = grdPrdcrOgnCurntMng01.getRowData(nRow);
    let itemCd = rowData.itemCd;

    let postJsonPromise = gfn_postJSON("/pd/pcom/updateStbltYn.do", {
      brno : brno
      ,stbltYn : stbltYn
      ,yr : yr
      ,itemCd : itemCd
    });
    let data = await postJsonPromise;

    try{
      if (_.isEqual("S", data.resultStatus)) {
        gfn_comAlert("I0001");// I0001	처리 되었습니다.
        fn_dtlGridSearch();
      }else{
        gfn_comAlert("E0001");//E0001 오류가 발생하였습니다.
      }
    }catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }

  //유저 실적 법인체 선택마감
  async function fn_userPrfmncCorpDdlnYn(){
    let brno = SBUxMethod.get('dtl-input-brno');
    if(gfn_isEmpty(brno)) return;

    let yr = SBUxMethod.get('dtl-input-yr');
    if(gfn_isEmpty(yr)){
      //현재년도
      let now = new Date();
      let year = now.getFullYear();
      yr = year;
    }

    let postJsonPromise = gfn_postJSON("/pd/pcom/updateUserPrfmncCorpDdlnYn.do", {
      brno : brno
      ,yr : yr
      ,prfmncCorpDdlnYn : 'Y'
    });
    let data = await postJsonPromise;

    try{
      if (_.isEqual("S", data.resultStatus)) {
        alert("실적 법인체 마감 되었습니다.");

        //사이드 메뉴를 누르기 전 상태로 돌려야함
        //removeTab 으로 탭 닫기 하는경우 문제가 있음
        //포키싱된 사이드 메뉴 상태가 남아서 사이드 메뉴의 빈공간을 누를시 포커싱된 메뉴가 열리는 현상이 있음
        //사이드 메뉴를 아무것도 선택안한 상태로 돌릴 방법이 필요함 -> 재호출 or 닫힘으로 처리
        //사이드 메뉴 재호출 처리
        parent.SBUxMethod.refresh('side_menu');

        //전체 탭 닫기
        //parent.SBUxMethod.removeAllTab("tab_menu");

        //iframe 밖의 탭 닫기
        //parent.tabJsonData 열린 탭 정보 리스트
        //parent.SBUxMethod.get('tab_menu') 현재 선택된 탭이름
        //현재 열린 탭리스트
        let tabList = parent.tabJsonData;
        //현재 열린 탭정보
        let tabInfo = _.find(tabList, {text: parent.SBUxMethod.get('tab_menu')});
        //PD에 속하는 탭 리스트
        let pdTabList = tabList.filter(item => item.targetid.startsWith('TAB_PD'));

        //현재 열린 탭과 공지사항을 제외한 탭 리스트
        const etcPdTabList = pdTabList.filter(item => item.targetid != tabInfo.targetid &&  item.targetid != "TAB_PD_009");
        //현재 열린 탭을 제외한 탭 우선 닫기
        etcPdTabList.forEach(item => {
          parent.gfn_tabClose(item.targetid);
        });
        //탭닫기
        parent.gfn_tabClose(tabInfo);

      }else{
        if(data.tempList != null){
          alert("임시저장 여부를 확인해주세요\n"+data.tempList);
        }else{
          alert("실적 법인체 마감 도중 오류가 발생 되었습니다.");
        }
      }
    }catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }

  //실적 법인체 선택마감
  async function fn_prfmncCorpDdlnYn(yn){
    let brno = SBUxMethod.get('dtl-input-brno');
    //let apoSe = SBUxMethod.get('dtl-input-apoSe');

    if(gfn_isEmpty(brno)) return;

    let prfmncCorpDdlnYn = null;
    if(yn == 1){
      prfmncCorpDdlnYn = 'Y'
    }else if(yn == 2){
      prfmncCorpDdlnYn = 'N'
    }

    let yr = SBUxMethod.get('dtl-input-yr');
    if(gfn_isEmpty(yr)){
      //현재년도
      let now = new Date();
      let year = now.getFullYear();
      yr = year;
    }

    let postJsonPromise = gfn_postJSON("/pd/pcom/updatePrfmncCorpDdlnYn.do", {
      brno : brno
      ,yr : yr
      ,prfmncCorpDdlnYn : prfmncCorpDdlnYn
    });

    const data = await postJsonPromise;

    try{
      if(_.isEqual("S", data.resultStatus)){
        if(yn == 1){
          alert("실적 법인체 마감 되었습니다.");
        }else if(yn == 2){
          alert("실적 법인체 마감 해제 되었습니다.");
        }
        fn_search();
      }else{
        if(yn == 1){
          alert("실적 법인체 마감 도중 오류가 발생 되었습니다.");
        }else if(yn == 2){
          alert("실적 법인체 마감 해제 도중 오류가 발생 되었습니다.");
        }
      }
    }catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }

  //통합조직 적합여부 전체 갱신
  async function fn_updateAllUoStbltYn(){

    if(!confirm("적합여부 전체 갱신 하시겠습니까? \n약 5~10분 정도 소요 됩니다.")){
      return;
    }

    let postJsonPromise = gfn_postJSON("/pd/pcom/updateAllUoStbltYn.do", {
    });
    let data = await postJsonPromise;
    try{
      if(_.isEqual("S", data.resultStatus)){
        alert("통합조직 적합여부 갱신 되었습니다.");
        fn_search();
      }else{
        alert("통합조직 적합여부 갱신 도중 오류가 발생 되었습니다.");
      }
    }catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }

  //실적 법인체 일괄 마감
  async function fn_prfmncCorpDdlnYnAll(yn){
    let prfmncCorpDdlnYn = null;
    if(yn == 1){
      prfmncCorpDdlnYn = 'Y'
    }else if(yn == 2){
      prfmncCorpDdlnYn = 'N'
    }

    let yr = SBUxMethod.get('dtl-input-yr');
    if(gfn_isEmpty(yr)){
      //현재년도
      let now = new Date();
      let year = now.getFullYear();
      yr = year;
    }

    let postJsonPromise = gfn_postJSON("/pd/pcom/updatePrfmncCorpDdlnYn.do", {
      yr : yr,
      prfmncCorpDdlnYn : prfmncCorpDdlnYn
    });
    let data = await postJsonPromise;

    try {

      if (_.isEqual("S", data.resultStatus)) {
        if(yn == 1){
          alert("실적 법인체 마감 되었습니다.");
        }else if(yn == 2){
          alert("실적 법인체 마감 해제 되었습니다.");
        }
        fn_search();
      } else {
        if (yn == 1) {
          alert("실적 법인체 마감 도중 오류가 발생 되었습니다.");
        } else if(yn == 2) {
          alert("실적 법인체 마감 해제 도중 오류가 발생 되었습니다.");
        }
      }
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }


  /* 매출현황 평가부류별 요약표 */
  var jsonClsfTot = []; // 그리드의 참조 데이터 주소 선언
  var grdClsfTot;

  const objMenuList04 = {
    "excelDwnld": {
      "name": "엑셀 다운로드",			//컨텍스트메뉴에 표시될 이름
      "accesskey": "e",					//단축키
      "callback": fn_excelDwnld04,			//콜백함수명
    }
  };

  function fn_excelDwnld04() {
    grdPrdcrOgnCurntMng04.exportLocalExcel("통합조직관리(총괄표 - 부류별 합계)", {bSaveLabelData: true, bNullToBlank: true, bSaveSubtotalValue: true, bCaptionConvertBr: true, arrSaveConvertText: true});
  }

  /* Grid 화면 그리기 기능*/
  const fn_createGridClsfTot = async function() {
    let yr = SBUxMethod.get('srch-input-yr');
    if(gfn_isEmpty(yr)){
      yr = SBUxMethod.get('dtl-input-yr');
    }
    let prvYr = Number(yr) - 1;
    let prvTotStr = prvYr + "년";
    let totStr = yr + "년";

    let SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdClsfTot';
    SBGridProperties.id = 'grdClsfTot';
    SBGridProperties.jsonref = 'jsonClsfTot';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.contextmenu = true;				// 우클린 메뉴 호출 여부
    SBGridProperties.contextmenulist = objMenuList04;	// 우클릭 메뉴 리스트
    //SBGridProperties.extendlastcol = 'scroll';
    //SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
    SBGridProperties.oneclickedit = true;
    SBGridProperties.mergecells = 'bycolrec';//병합 설정 bycol : 상하 , byrow : 좌우 , bycolrec : 상하 병합 후 좌우
    SBGridProperties.datamergefalseskip = true;//병합 제외 설정 merge : false
    SBGridProperties.explorerbar = 'sort'; // 정렬
    SBGridProperties.useinitsorting = true; // 3번 클릭시 정렬 상태 복원
    SBGridProperties.columns = [
      {caption: ["구분","구분"],	ref: 'clsfSeNm',		type:'output',  width:'100px',    style:'text-align:center'},
      {caption: ["부류","부류"],	ref: 'clsfNm',		type:'output',  width:'100px',    style:'text-align:center'},

      {caption: [prvTotStr,"취급 물량(톤)"],	ref: 'prvTotVlm',	type:'output',	width:'100px',    style:'text-align:right',
        merge : false,
        typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},
        format : {type:'number', rule:'#,###'},
        datatype : 'number'
      },
      {caption: [prvTotStr,"취급액(천원)"],	ref: 'prvTotAmt',	type:'output',  width:'100px',    style:'text-align:right',
        merge : false,
        typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},
        format : {type:'number', rule:'#,###'},
        datatype : 'number'
      },
      {caption: [totStr,"취급 물량(톤)"],		ref: 'totVlm',	type:'output',  width:'100px',    style:'text-align:right',
        merge : false,
        typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},
        format : {type:'number', rule:'#,###'},
        datatype : 'number'
      },
      {caption: [totStr,"취급액(천원)"],		ref: 'totAmt',	type:'output',  width:'100px',    style:'text-align:right',
        merge : false,
        typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},
        format : {type:'number', rule:'#,###'},
        datatype : 'number'
      },
      {caption: ["상세내역"], 	ref: 'clsfCd',		hidden : true},
    ];
    grdClsfTot = _SBGrid.create(SBGridProperties);
  }

  //부류별 합계 조회
  async function fn_dtlSearchClsfTot() {

    let brno = SBUxMethod.get('dtl-input-brno');
    if (gfn_isEmpty(brno)) {
      return;
    }
    let yr = SBUxMethod.get('dtl-input-yr');

    try {
      const postJsonPromise01 = gfn_postJSON("/pd/pcom/selectUoClsfTot.do", {
        uoBrno : brno,
        brno : brno,
        yr : yr
      });
      const data = await postJsonPromise01;

      jsonClsfTot.length = 0;
      data.resultList.forEach((item, index) => {
        let itemVO = {
          clsfCd: 		item.clsfCd,
          clsfNm: 		item.clsfNm,
          clsfSeNm: 		item.clsfSeNm,
          clsfSeCd: 		item.clsfSeCd,

          totVlm: 		item.totVlm,
          totAmt: 		item.totAmt,
          prvTotVlm: 		item.prvTotVlm,
          prvTotAmt: 		item.prvTotAmt
        };
        jsonClsfTot.push(itemVO);
      });

      grdClsfTot.rebuild();

      fn_clsfTot();
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }

  /* 부류별 합계 그리드 합계 */
  function fn_clsfTot(){
    // 합계를 저장할 변수 초기화
    let totalSum = {
      clsfNm: '합계',
      clsfSeNm: '합계',
      totVlm: 0,
      totAmt: 0,
      prvTotVlm: 0,
      prvTotAmt: 0
    };

    let objGrid = grdClsfTot;

    let col1 = objGrid.getColRef("clsfSeNm");//
    let col2 = objGrid.getColRef("clsfNm");//
    let col3 = objGrid.getColRef("totAmt");//

    let gridData01 = objGrid.getGridDataAll();
    let captionRow = objGrid.getFixedRows();
    for (let i = captionRow; i < gridData01.length + captionRow; i++) {
      // 현재 행 데이터 가져오기
      let rowData01 = objGrid.getRowData(i);
      if(rowData01.clsfNm !== '소계'){
        totalSum.totVlm 	+= Number(rowData01.totVlm || 0);
        totalSum.totAmt 	+= Number(rowData01.totAmt || 0);
        totalSum.prvTotVlm 	+= Number(rowData01.prvTotVlm || 0);
        totalSum.prvTotAmt 	+= Number(rowData01.prvTotAmt || 0);
      }else if(rowData01.clsfNm === '소계'){
        objGrid.setCellStyle('background-color', i, col2, i, col3, 'lightgray');
      }
    }

    objGrid.addRow();
    let lastRow = gridData01.length + captionRow-1;
    objGrid.setCellStyle('background-color', lastRow , col1, lastRow, col3, 'lightgray');
    // 합계 데이터를 objGrid에 설정
    Object.keys(totalSum).forEach((key) => {
      objGrid.setCellData( lastRow, objGrid.getColRef(key), totalSum[key]);
    });
    //objGrid.rebuild();
  }

  /* 로우데이터 요청 */
  var jsonHiddenGrd = []; // 그리드의 참조 데이터 주소 선언
  var hiddenGrd;

  /* Grid 화면 그리기 기능*/
  const fn_hiddenGrd = async function() {

    let SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-hiddenGrd';
    SBGridProperties.id = 'hiddenGrd';
    SBGridProperties.jsonref = 'jsonHiddenGrd';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.oneclickedit = true;
    SBGridProperties.rowheader="seq";
    SBGridProperties.columns = [
      {caption: ["신청년도"],			ref:'yr',			type:'output',width:'70px',style:'text-align:center'},
      {caption: ["선정년도"],			ref:'slctnYr',		type:'output',width:'70px',style:'text-align:center'},
      {caption: ["사업자번호"],		ref:'brno',			type:'output',width:'70px',style:'text-align:center'},
      {caption: ["법인명"],			ref:'corpNm',		type:'output',width:'70px',style:'text-align:center'},
      {caption: ["통합조직 구분"],		ref:'aprv',			type:'output',width:'70px',style:'text-align:center'},
      {caption: ["통합조직 구분명"],	ref:'aprvNm',		type:'output',width:'70px',style:'text-align:center'},
      {caption: ["품목코드"],			ref:'itemCd',		type:'output',width:'70px',style:'text-align:center'},
      {caption: ["품목명"],			ref:'itemNm',		type:'output',width:'70px',style:'text-align:center'},
      {caption: ["분류코드"],			ref:'ctgryCd',		type:'output',width:'70px',style:'text-align:center'},
      {caption: ["분류명"],			ref:'ctgryNm',			type:'output',width:'70px',style:'text-align:center'},
      {caption: ["전문/육성 구분코드"],	ref:'sttgUpbrItemSe',	type:'output',width:'70px',style:'text-align:center'},
      {caption: ["전문/육성 구분"],		ref:'sttgUpbrItemNm',	type:'output',width:'70px',style:'text-align:center'},

      {caption: ["통합조직 총 취급물량(톤)"],	ref:'slsCnsgnSlsVlmTot',	type:'output',width:'70px',style:'text-align:center'},
      {caption: ["(A)통합조직 총 취급액(천원)"],	ref:'slsCnsgnSlsAmtTot',	type:'output',width:'70px',style:'text-align:center'},
      {caption: ["생산자조직 전속출하물량(톤)"],	ref:'slsCnsgnSlsVlm',		type:'output',width:'70px',style:'text-align:center'},
      {caption: ["(B)생산자조직 전속출하액(천원)"],	ref:'slsCnsgnSlsAmt',	type:'output',width:'70px',style:'text-align:center'},
      {caption: ["(C)전속취급률(%)"],			ref:'slsCnsgnSlsAmtRt',		type:'output',width:'70px',style:'text-align:center'},

      {caption: ["취급액목표(신청관리)"],			ref:'trgtTrmtAmt',		type:'output',width:'70px',style:'text-align:center'},
      {caption: ["취급률목표(신청관리)"],			ref:'trgtTrmtRt',		type:'output',width:'70px',style:'text-align:center'},

      {caption: ["적합여부(기준적용)"],	ref:'stbltYn',		type:'output',width:'70px',style:'text-align:center'},
      {caption: ["적합여부(최종)"],		ref:'orgStbltYn',	type:'output',width:'70px',style:'text-align:center'},
      {caption: ["선정여부"],			ref:'lastStbltYn',	type:'output',width:'70px',style:'text-align:center'},
      {caption: ["비고"],				ref:'stbltYnNm',	type:'output',width:'70px',style:'text-align:center'},
      {caption: ["조치사항"],			ref:'actnMttr',		type:'output',width:'70px',style:'text-align:center'},
    ];
    hiddenGrd = _SBGrid.create(SBGridProperties);
  }

  /**
   * Rawdata 다운로드
   * @returns {Promise<void>}
   */
  const fn_hiddenGrdSelect = async function() {

    if (!gfn_comConfirm("Q0001", "Rawdata 다운로드")) {	//	Q0001	{0} 하시겠습니까?
      return;
    }

    await fn_hiddenGrd();
    let yr = SBUxMethod.get("srch-input-yr");
    if (gfn_isEmpty(yr)) {
      const now = new Date();
      yr = now.getFullYear();
    }

    try {
      //const url = "/pd/pcom/selectUoPrchsSlsSummaryList.do";
      const url = "/pd/pcom/selectPrdcrCrclOgnGenalTblMngRawDataList2025.do";
      //let postJsonPromise = gfn_postJSON("/pd/pcom/selectPrdcrCrclOgnGenalTblMngRawDataList2025.do", {
      const postJsonPromise = gfn_postJSON(url, {
        yr : yr
      });

      const data = await postJsonPromise;

      jsonHiddenGrd.length = 0;
      data.resultList.forEach((item, index) => {
        let hiddenGrdVO = {
          yr						:item.yr,
          slctnYr					:item.slctnYr,
          brno					:item.brno,
          corpNm					:item.corpNm,
          aprv					:item.aprv,
          aprvNm					:item.aprvNm,
          itemCd					:item.itemCd,
          itemNm					:item.itemNm,
          ctgryCd					:item.ctgryCd,
          ctgryNm					:item.ctgryNm,
          sttgUpbrItemSe			:item.sttgUpbrItemSe,
          sttgUpbrItemNm			:item.sttgUpbrItemNm,
          sttgUpbrItemSeNm		:item.sttgUpbrItemSeNm,
          slctnYr					:item.slctnYr,
          actnMttr				:item.actnMttr,
          slsCnsgnSlsAmt			:Number(item.slsCnsgnSlsAmt),
          slsCnsgnSlsAmtTot		:Number(item.slsCnsgnSlsAmtTot),
          slsCnsgnSlsAmtRt		:Number(item.slsCnsgnSlsAmtRt),

          slsCnsgnSlsVlm			:Number(item.slsCnsgnSlsVlm),
          slsCnsgnSlsVlmTot		:Number(item.slsCnsgnSlsVlmTot),

          stbltYn					:item.stbltYn,
          orgStbltYn				:item.orgStbltYn,
          lastStbltYn				:item.lastStbltYn,
          //stbltYnNm				:item.stbltYnNm,		//fn_calStbltYn(item)
          stbltYnNm				:fn_calStbltYn(item),

          trgtTrmtAmt				:item.trgtTrmtAmt,
          trgtTrmtRt				:item.trgtTrmtRt,
        }

        jsonHiddenGrd.push(hiddenGrdVO);
      });

      await hiddenGrd.rebuild();

      await fn_excelDown(yr);

    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }

  //로우 데이터 엑셀 다운로드
  function fn_excelDown(yr){
    const currentDate = new Date();
    const fileName = gfn_dateToYmd(currentDate) + "_총괄표_통합조직_로우데이터" + yr + "년";
    hiddenGrd.exportData("xlsx" , fileName , true , true);
  }


  //실적 저장
  const fn_listSave = async function(){

    let gridData01 = grdPrdcrOgnCurntMng01.getGridDataAll();
    let saveList = [];

    let brno = SBUxMethod.get('dtl-input-brno');
    if (gfn_isEmpty(brno)) {
      return false;
    }

    //그리드 해더 row수
    let captionRow = grdPrdcrOgnCurntMng01.getFixedRows();
    for ( let i = captionRow; i < gridData01.length + captionRow; i++ ){
      let rowData01 = grdPrdcrOgnCurntMng01.getRowData(i);
      let rowSts01 = grdPrdcrOgnCurntMng01.getRowStatus(i);
      //let delYn = rowData01.delYn;

      rowData01.rowSts = "I";
      saveList.push(rowData01);
      /*
      if (rowSts01 === 3){
          rowData01.rowSts = "I";
          saveList.push(rowData01);
      } else if (rowSts01 === 2){
          rowData01.rowSts = "I";
          saveList.push(rowData01);
      } else if (rowSts01 === 1){
          rowData01.rowSts = "I";
          saveList.push(rowData01);
      } else {
          continue;
      }
      */
    }
    if (saveList.length == 0) {
      gfn_comAlert("W0003", "저장");				//	W0003	{0}할 대상이 없습니다.
      return;
    }

    let regMsg = "저장 하시겠습니까?";
    if (confirm(regMsg)) {
      try {
        const postJsonPromise = gfn_postJSON("/pd/pcom/multiSaveItemUoActnMttr.do", saveList);
        const data = await postJsonPromise;

        if (_.isEqual("S", data.resultStatus)) {
          gfn_comAlert("I0001") 			// I0001 	처리 되었습니다.
          fn_dtlGridSearch();
          //fn_searchFcltList();
        } else {
          alert(data.resultMessage);
        }
      } catch (e) {
        if (!(e instanceof Error)) {
          e = new Error(e);
        }
        console.error("failed", e.message);
      }
    }
  }

  /* 과거 실적 조회 팝업 추가 */

  //과거 조회 팝업
  const fn_openMaodal = function() {
    //사업자번호
    let brno = SBUxMethod.get("dtl-input-brno");

    if(gfn_isEmpty(brno)){
      alert("선택된 조직이 없습니다");
      return;
    }

    //popBizPlanPdfViewer.init(rowData , fn_setPdfViewer);
    //SBUxMethod.openModal('modal-bizPlanPdfViewer');

    var url = "/pd/hisPopup/UoGenalTblHisPopup.do"
    var title = "제출실적 보기";
    //SBUxMethod.popupWindow(url, title, '600px','500px');

    window.open(url, title, "width=1000px,height=900px");
  }

  //팝업 새창에서 변수 확인
  function fn_getData() {
    let data = [];
    data.brno = SBUxMethod.get("dtl-input-brno");
    data.corpNm = SBUxMethod.get("dtl-input-corpNm");
    return data;
  }

  /**
   * @name fn_lastSbmt
   * @description 최종제출
   */
  const fn_lastSbmt = async function (){
    const brno = SBUxMethod.get('dtl-input-brno');
    const apoCd = SBUxMethod.get('dtl-input-apoCd');
    let yr = SBUxMethod.get("srch-input-yr");
    if(gfn_isEmpty(yr)){
      yr = SBUxMethod.get("dtl-input-yr");
    }

    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
      return;
    }

    if (!gfn_comConfirm("Q0001", "최종제출")) {	//	Q0001	{0} 하시겠습니까?
      return;
    }

    const postJsonPromise = gfn_postJSON("/pd/aom/insertPruoPrgrsApo.do", {
      crtrYr : yr,
      apoCd : apoCd,
      brno : brno,
      prgrsStpCd : "SBMT",
      prfmncCorpDdlnYn : "Y"
    });

    const data = await postJsonPromise;

    try {
      if(_.isEqual("S", data.resultStatus)){
        gfn_comAlert("I0001");	// I0001	처리 되었습니다.

        <c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91'}">
        await fn_search();
        </c:if>
        <c:if test="${loginVO.apoSe eq '1'}">
        await fn_dtlSearch();
        </c:if>
      } else {
        gfn_comAlert(data.resultCode, data.resultMessage);
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
   * @name fn_cnclLastSbmt
   * @description 최종제출 취소
   */
  const fn_cnclLastSbmt = async function (){
    const brno = SBUxMethod.get('dtl-input-brno');
    const apoCd = SBUxMethod.get('dtl-input-apoCd');
    let yr = SBUxMethod.get("srch-input-yr");
    if(gfn_isEmpty(yr)){
      yr = SBUxMethod.get("dtl-input-yr");
    }

    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
      return;
    }

    if (!gfn_comConfirm("Q0001", "최종제출 취소")) {	//	Q0001	{0} 하시겠습니까?
      return;
    }

    const postJsonPromise = gfn_postJSON("/pd/aom/insertPruoPrgrsApoCncl.do", {
      crtrYr : yr,
      apoCd : apoCd,
      brno : brno,
      prgrsStpCd : "SBMT",
      prfmncCorpDdlnYn : "N"
    });

    const data = await postJsonPromise;

    try {
      if(_.isEqual("S", data.resultStatus)){
        gfn_comAlert("I0001");	// I0001	처리 되었습니다.

        <c:if test="${loginVO.userType eq '01' || loginVO.userType eq '00' || loginVO.userType eq '02' || loginVO.userType eq '91'}">
        await fn_search();
        </c:if>
        <c:if test="${loginVO.apoSe eq '1'}">
        await fn_dtlSearch();
        </c:if>
      } else {
        gfn_comAlert(data.resultCode, data.resultMessage);
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
   * @name fn_createGpcListGrid
   * @description 품목그리드 리스트
   */
  const fn_createGpcListGrid = async function() {
    let yr = SBUxMethod.get("srch-input-yr");
    if(gfn_isEmpty(yr)){
      yr = SBUxMethod.get("dtl-input-yr");
    }
    const totStr = yr + "년";

    let SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdGpcList';
    SBGridProperties.id = 'grdGpcList';
    SBGridProperties.jsonref = 'jsonGpcList';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'byrow';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.rowheadercaption = {seq: 'No'};//seq 해더 추가
    SBGridProperties.emptyareaindexclear = false;//그리드 빈 영역 클릭시 인덱스 초기화 여부
    SBGridProperties.oneclickedit = true;//입력 활성화 true 1번클릭 false 더블클릭
    SBGridProperties.fixedrowheight=45;
    SBGridProperties.columns = [
      {caption: ["처리"], 				ref: 'delYn',   	type:'button', width:'60px',	style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
          <c:if test="${loginVO.userType ne '02' && loginVO.userType ne '91'}">
          let prfmncCorpDdlnYn = SBUxMethod.get("dtl-input-prfmncCorpDdlnYn");
          if(prfmncCorpDdlnYn != 'Y'){
            if(strValue== null || strValue == ""){
              return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"ADD\", \"grdGpcList\", " + nRow + ", " + nCol + ")'>추가</button>";
            }else{
              return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_procRow(\"DEL\", \"grdGpcList\", " + nRow + ")'>삭제</button>";
            }
          }
          </c:if>
          return "";
        }},


      {caption: ["전문/육성 구분"], 	ref: 'sttgUpbrItemSe',   type:'combo',  width:'150px',	style:'text-align:center',
        typeinfo : {ref:'jsonComSttgUpbrItemSe', label:'cdVlNm', value:'cdVl', displayui : true, itemcount : 5, position : 'bottom'},
        validate : fn_Validate},
      {caption: ["품목선택"], 				ref: 'sel',   	type:'button', width:'60px',	style:'text-align:center', renderer: function(objGrid, nRow, nCol, strValue, objRowData){
          let prfmncCorpDdlnYn = SBUxMethod.get("dtl-input-prfmncCorpDdlnYn");
          let delYnCol = objGrid.getColRef('delYn');
          let delYnVal = objGrid.getCellData(nRow,delYnCol);
          if(prfmncCorpDdlnYn != 'Y'){
            if(delYnVal == 'N'){
              return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_openMaodalGpcSelect(" + nRow + ")'>선택</button>";
            }
          }
          return "";
        }},
      {caption: ["부류"], 		ref: 'clsfCd',   	type:'combo',  width:'150px',	style:'text-align:center',
        typeinfo : {ref:'jsonComClsfCd', label:'cdVlNm', value:'cdVl', displayui : true, itemcount : 5, position : 'bottom'}},
      {caption: ["평가부류"], 		ref: 'ctgryCd',   	type:'combo',  width:'150px',	style:'text-align:center',
        typeinfo : {ref:'jsonComCtgryCd', label:'cdVlNm', value:'cdVl', displayui : true, itemcount : 5, position : 'bottom'}},

      {caption: ["품목명"], 			ref: 'itemNm',   		type:'output',  width:'150px',	style:'text-align:center'},
      {caption: ["품목코드"], 		ref: 'itemCd',   		type:'output',  width:'60px',	style:'text-align:center'},
      {caption: [totStr + "\n총취급액 목표(천원)"], 	ref: 'trgtTrmtAmt',   	type:'input',  width:'150px',	style:'text-align:center',typeinfo : {mask : {alias : 'numeric', unmaskvalue : true}, maxlength : 10},   format : { type:'number' , rule:'#,###' }},
      {caption: [totStr + "\n전속취급률 목표(%)"], 	ref: 'trgtTrmtRt',   	type:'input',  width:'110px',	style:'text-align:center',format: {type: 'number', rule: '#,##0.00'}},
      {caption: ["비고\n(품목명을 기타로 입력한 경우에는 세부 품목명 입력 필수)"], 			ref: 'rmrk',   			type:'input',  width:'150px',	style:'text-align:center'},

      {caption: ["통합조직코드"], 	ref: 'apoCd',   			hidden : true},
      {caption: ["통합조직코드"], 	ref: 'apoSe',   			hidden : true},
      {caption: ["통합조직코드"], 	ref: 'brno',   				hidden : true},
      {caption: ["통합조직코드"], 	ref: 'uoBrno',   			hidden : true},
      {caption: ["통합조직코드"], 	ref: 'yr',   				hidden : true},
      //{caption: ["품목코드"], 	ref: 'itemCd',   			hidden : true},
      {caption: ["상세내역"], 	ref: 'orgCtgryCd',   		hidden : true},
      {caption: ["상세내역"], 	ref: 'orgSttgUpbrItemSe',   hidden : true},
    ];

    grdGpcList = _SBGrid.create(SBGridProperties);
    // grdGpcList.bind('dblclick','gridClick');
  }

  function fn_Validate(objGrid, nRow, nCol, strValue) {
    let aprv = SBUxMethod.get("rdo-aprv");
    if (strValue != "") {
      if (gfn_isEmpty(aprv)) {
        alert('생산유통통합조직 승인형/육성형을 선택해주세요');
        objGrid.setCellData(nRow,nCol,"",true);
        return "";
      } else if(aprv == "2") {
        if (strValue == "2") {
          alert("육성형 조직은 전문품목만 선택가능합니다.");
          objGrid.setCellData(nRow,nCol,"1",true);
          return "1";
        }
      }
    }
    return strValue;
  }

  /**
   * @name fn_selectGpcList
   * @description 품목그리드 조회
   */
  const fn_selectGpcList = async function(){
    const apoCd = SBUxMethod.get('dtl-input-apoCd'); // 조직코드
    const brno = SBUxMethod.get('dtl-input-brno'); // 사업자번호
    const crno = SBUxMethod.get('dtl-input-crno'); // 법인등록번호
    let yr = SBUxMethod.get("srch-input-yr");
    if(gfn_isEmpty(yr)){
      yr = SBUxMethod.get("dtl-input-yr");
    }

    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
      return;
    }

    //없는경우 품목그리드 초기화
    //apoCd 가 없는 경우가 없어야 한데 현재는 있어서 추가 함
    if (gfn_isEmpty(apoCd)) {
      jsonGpcList.length = 0;
      grdGpcList.rebuild();
      return;
    }

    jsonGpcList.length = 0;

    const postJsonPromise = gfn_postJSON("/pd/aom/selectGpcList.do", {
      apoSe : '1'
      , brno : brno
      , crno : crno
      , yr : yr
    });
    const data = await postJsonPromise;

    try{
      if(_.isEqual("S", data.resultStatus)) {
        data.resultList.forEach((item, index) => {
          let vo = {
            yr: item.yr
            , sttgUpbrItemSe: item.sttgUpbrItemSe
            , ctgryCd: item.ctgryCd
            , ctgryNm: item.ctgryNm
            , itemCd: item.itemCd
            , itemNm: item.itemNm
            , rmrk: item.rmrk
            , delYn: item.delYn
            , apoCd: item.apoCd
            , apoSe: item.apoSe
            , brno: item.brno
            , uoBrno: item.uoBrno

            , clsfCd: item.clsfCd

            , trgtTrmtAmt: item.trgtTrmtAmt
            , trgtTrmtRt: item.trgtTrmtRt
          }
          jsonGpcList.push(vo);
        });

        grdGpcList.rebuild();
        const prfmncCorpDdlnYn = SBUxMethod.get("dtl-input-prfmncCorpDdlnYn");
        if (prfmncCorpDdlnYn != 'Y') {
          //비어 있는 마지막 줄 추가용도
          grdGpcList.addRow();
        }
        var nCol = grdGpcList.getColRef('sttgUpbrItemSe');
        window.scrollTo(0, 0);

        let rmrkCol = grdGpcList.getColRef('rmrk');//부류
        let clsfCdCol = grdGpcList.getColRef('clsfCd');//부류
        let ctgryCdCol = grdGpcList.getColRef('ctgryCd');//평가부류
        let sttgUpbrItemSeCol = grdGpcList.getColRef('sttgUpbrItemSe');//전문/육성 구분

        let grdData = grdGpcList.getGridDataAll();
        for (var i = 1; i <= grdData.length; i++) {
          let rowData = grdGpcList.getRowData(i);
          if (rowData.delYn != 'N') {
            //추가 row 비활성화
            grdGpcList.setCellDisabled(i, sttgUpbrItemSeCol, i, ctgryCdCol, true);
            grdGpcList.setCellStyle('background-color', i, sttgUpbrItemSeCol, i, rmrkCol, 'lightgray');
          }
        }

      }
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }
  }

  //품목선택 팝업 버튼
  function fn_openMaodalGpcSelect(nRow){
    let delYnCol = grdGpcList.getColRef('delYn');
    let delYnValue = grdGpcList.getCellData(nRow,delYnCol);
    if(delYnValue == '' || delYnValue == null){
      return
    }
    grdGpcList.setRow(nRow);
    popGpcSelect.init(fn_setGridItem , 'N');
    SBUxMethod.openModal('modal-gpcList');
  }

  // 그리드의 품목 선택 팝업 콜백 함수
  const fn_setGridItem = function(rowData) {
    if (!gfn_isEmpty(rowData)) {
      //setCellData (행,열,입력 데이터,[refresh여부],[행 상태 정보 update로 변경])
      //selGridRow : 선택된 행 값

      let selGridRow = grdGpcList.getRow();

      let colRefIdx1 = grdGpcList.getColRef("ctgryCd");//분류코드 인덱스
      //let colRefIdx2 = grdGpcList.getColRef("ctgryNm");//분류명 인덱스
      let colRefIdx3 = grdGpcList.getColRef("itemCd");//품목코드 인덱스
      let colRefIdx4 = grdGpcList.getColRef("itemNm");//품목명 인덱스
      let colRefIdx5 = grdGpcList.getColRef("rmrk");//기타 인덱스

      let gridData = grdGpcList.getGridDataAll();
      for(var i=1; i<=gridData.length; i++ ){
        let orgRowData = grdGpcList.getRowData(i);
        if ($.trim(rowData.itemCd) === $.trim(orgRowData.itemCd)){
          gfn_comAlert("E0000", "동일한 품목이 있습니다.");
          return false;
        }
      }

      let selRowData = grdGpcList.getRowData(selGridRow);
      let sttgUpbrItemSe = selRowData.sttgUpbrItemSe;

      //그리드 값 세팅
      if(!gfn_isEmpty(rowData.ctgryCd) && sttgUpbrItemSe != '3'){
        grdGpcList.setCellData(selGridRow,colRefIdx1,rowData.ctgryCd,true);
      }
      //grdGpcList.setCellData(selGridRow,colRefIdx2,rowData.ctgryNm,true);
      grdGpcList.setCellData(selGridRow,colRefIdx3,rowData.itemCd,true);
      grdGpcList.setCellData(selGridRow,colRefIdx4,rowData.itemNm,true);
      grdGpcList.setCellData(selGridRow,colRefIdx5,rowData.rmrk,true);

      let grdStatus = grdGpcList.getRowStatus(selGridRow);
      if(grdStatus != '1'){
        grdGpcList.setRowStatus(selGridRow,'update');
      }
    }
  }

  /**
   * @name fn_saveGpcList
   * @description 품목리스트 저장
   */
  const fn_saveGpcList = async function () {

    const gridDataAll = grdGpcList.getGridDataAll();
    const gpcSaveList = gridDataAll.filter(row => row.delYn == 'N');

    if (gfn_isEmpty(gpcSaveList)) {
      gfn_comAlert("W0003", "품목리스트 저장"); // W0003 {0}할 대상이 없습니다.
      return;
    }

    if (fn_checkRequiredInput()) {
      return;
    }

    const apoCd = SBUxMethod.get('dtl-input-apoCd'); // 조직코드
    const brno = SBUxMethod.get('dtl-input-brno'); // 사업자번호
    const crno = SBUxMethod.get('dtl-input-crno'); // 법인등록번호
    let yr = SBUxMethod.get("srch-input-yr");
    if(gfn_isEmpty(yr)){
      yr = SBUxMethod.get("dtl-input-yr");
    }

    const saveObj = {
      apoCd : apoCd,
      crtrYr : yr,
      brno : brno,
      gpcList : gpcSaveList,
    }

    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
      return;
    }

    if (!gfn_comConfirm("Q0001", "품목리스트 저장")) {	//	Q0001	{0} 하시겠습니까?
      return;
    }

    const postJsonPromise = gfn_postJSON("/pd/aom/insertPruoGpcList.do", saveObj);
    const data = await postJsonPromise;

    try {
      if(_.isEqual("S", data.resultStatus)) {
        gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        fn_dtlGridSearch();
      } else {
        gfn_comAlert(data.resultCode, data.resultMessage);
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
   * @name fn_checkRequiredInput
   * @description 품목리스트 필수값 확인
   */
  function fn_checkRequiredInput(){
    //품목 그리드 필수갑 확인
    let gridData = grdGpcList.getGridDataAll();
    for(var i=1; i<=gridData.length; i++ ){
      let rowData = grdGpcList.getRowData(i);

      if(rowData.delYn == 'N'){
        if(gfn_isEmpty(rowData.sttgUpbrItemSe)){
          gfn_comAlert("W0001", "품목리스트의 전문/육성 구분"); // {0}을/를 선택하세요.
          grdGpcList.focus();
          return true;
        }

        if(gfn_isEmpty(rowData.ctgryCd)){
          gfn_comAlert("W0001", "품목리스트의 평가부류"); // {0}을/를 선택하세요.
          grdGpcList.focus();//그리드 객체로 포커스 이동
          return true;
        }
        if(gfn_isEmpty(rowData.clsfCd)){
          gfn_comAlert("W0001", "품목리스트의 부류"); // {0}을/를 선택하세요.
          grdGpcList.focus();//그리드 객체로 포커스 이동
          return true;
        }
        if(gfn_isEmpty(rowData.itemCd)){
          gfn_comAlert("W0001", "품목리스트의 품목"); // {0}을/를 선택하세요.
          grdGpcList.focus();
          return true;
        }
        if(gfn_isEmpty(rowData.trgtTrmtAmt)){
          gfn_comAlert("W0002", "품목 리스트의 취급액 목표"); // W0002 {0}을/를 입력하세요.
          grdGpcList.focus();
          return true;
        }
        if(gfn_isEmpty(rowData.trgtTrmtRt)){
          gfn_comAlert("W0002", "품목 리스트의 취급률 목표"); // W0002 {0}을/를 입력하세요.
          grdGpcList.focus();
          return true;
        }
      }
    }
    return false;
  }

  function fn_procRow(gubun, grid, nRow, nCol) {
    if (gubun === "ADD") {
      if (grid === "grdGpcList") {
        grdGpcList.setCellData(nRow, nCol, "N", true);
        grdGpcList.addRow(true);

        let rmrkCol = grdGpcList.getColRef('rmrk');//부류
        let ctgryCdCol = grdGpcList.getColRef('ctgryCd');//평가부류
        let sttgUpbrItemSeCol = grdGpcList.getColRef('sttgUpbrItemSe');//전문/육성 구분
        //기존 row 활성화
        grdGpcList.setCellDisabled(nRow, sttgUpbrItemSeCol, nRow, ctgryCdCol, false);
        grdGpcList.setCellStyle('background-color', nRow, sttgUpbrItemSeCol, nRow, rmrkCol, 'white');
        //추가 row 비활성화
        grdGpcList.setCellDisabled(nRow+1, sttgUpbrItemSeCol, nRow+1, ctgryCdCol, true);
        grdGpcList.setCellStyle('background-color', nRow+1, sttgUpbrItemSeCol, nRow+1, rmrkCol, 'lightgray');
      }
    }
    else if (gubun === "DEL") {
      if (grid === "grdGpcList") {
        if(grdGpcList.getRowStatus(nRow) == 0 || grdGpcList.getRowStatus(nRow) == 2){
          var delMsg = "등록 된 행 입니다. 삭제 하시겠습니까?";
          if(confirm(delMsg)){
            var vo = grdGpcList.getRowData(nRow);
            fn_deleteRsrc(vo,nRow);
          }
        }else{
          grdGpcList.deleteRow(nRow);
        }
      }
    }
  }
  //품목 리스트 삭제
  async function fn_deleteRsrc(vo,nRow){
    let postJsonPromise = gfn_postJSON("/pd/aom/deleteGpc.do", vo);
    let data = await postJsonPromise;

    try{
      if(data.result > 0){
        grdGpcList.deleteRow(nRow);
        alert("삭제 되었습니다.");
      }else{
        alert("삭제 도중 오류가 발생 되었습니다.");
      }
    }catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }
  }

</script>
</html>
