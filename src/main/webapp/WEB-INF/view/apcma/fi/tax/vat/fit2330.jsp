<%
  /**
   * @Class Name 		: fit2330.jsp
   * @Description 	: 영세율매출명세서 화면
   * @author 			: 인텔릭아이앤에스
   * @since 			: 2024.10.16
   * @version 		: 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      수정내용
   * @ ----------		----------	---------------------------
   * @ 2024.07.11   	이경한		최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Title</title><title>title : 신용카드수령명세서(매입)</title>
  <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../../frame/inc/headerScriptMa.jsp" %>
  <style>
    #Sales > table > tbody > tr > td{
      text-align: center;
      border: 1px solid #e8f1f9 !important;
    }
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
      -webkit-appearance: none;
      margin: 0;
    }
    table[id="panRightHeader"] td, table[id="panRightMiddle"] td{
      text-align: center;
      border: solid 1px blue;
      padding: 5px;
    }
    .resizer[data-direction="horizontal"] {
      background-color: #cbd5e0;
      cursor: ew-resize;
      height: 100%;
      width: 2px;
    }
    .resizer[data-direction="vertical"] {
      background-color: #cbd5e0;
      cursor: ns-resize;
      height: 2px;
      width: 100%;
    }
    .tpgTd{
      border: 0 !important;
      background-color : white !important;
      border-radius: 0 !important;
      padding: 0px 12px !important;
      height: auto;
    }
  </style>
</head>
<body oncontextmenu="return false">
<section>
  <div class="box box-solid" style="border-radius: 0">
    <div class="box-header" style="display:flex; justify-content: flex-start;">
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
        </h3>
      </div>
    </div>
    <div class="box-body">
      <div class="box-search-ma">
      <!--[APC] START -->
      <%@ include file="../../../../frame/inc/apcSelectMa.jsp" %>
      <!--[APC] END -->
      <!-- content_header start -->
      <table id="srchTable" class="table table-bordered tbl_fixed table-search-ma">
        <colgroup>
          <col style="width: 8%">
          <col style="width: 7%">
          <col style="width: 1%">
          <col style="width: 7%">
          <col style="width: 2%">
 
          <col style="width: 8%">
          <col style="width: 7%">
          <col style="width: 1%">
          <col style="width: 7%">
          <col style="width: 2%">
 
          <col style="width: 8%">
          <col style="width: 7%">
          <col style="width: 1%">
          <col style="width: 7%">
          <col style="width: 2%">
 
          <col style="width: 8%">
          <col style="width: 7%">
          <col style="width: 1%">
          <col style="width: 7%">
          <col style="width: 2%">
        </colgroup>
        <tbody>
        <tr>
          <th scope="row" >기준연도</th>
          <td colspan="3" class="td_input" style="border-right: hidden;">
            <sbux-datepicker id="srch-dtp-yyyy" name="srch-dtp-yyyy" uitype="popup" datepicker-mode="year"
                             date-format="yyyy" class="form-control sbux-pik-group-apc input-sm input-sm-ast inpt_data_reqed table-datepicker-ma"
                             onchange="fn_setMultSelect(srch-dtp-yyyy)">
            </sbux-datepicker>
          </td>
          <td></td>
          <th scope="row" >신고구분명</th>
          <td colspan="8" class="td_input" style="border-right: hidden;">
            <div style="display: flex;gap: 5px">
              <div class="dropdown">
                <button style="width:160px;text-align:left" class="btn btn-sm btn-light dropdown-toggle" type="button" id="src-btn-currencyCode" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <font>선택</font>
                  <i style="padding-left:10px" class="sbux-sidemeu-ico fas fa-angle-down"></i>
                </button>
                <div class="dropdown-menu" aria-labelledby="src-btn-currencyCode" style="width:750px;height:150px;padding-top:0px;overflow:auto">
                </div>
              </div>
              <sbux-input readonly id="srch-dtp-ymdstandardTermFr" uitype="text" class="form-control input-sm" style="text-align: center"></sbux-input>
              <p style="text-align: center;line-height: 30px">~</p>
              <sbux-input readonly id="srch-dtp-ymdstandardTermTo" uitype="text" class="form-control input-sm" style="text-align: center"></sbux-input>
            </div>
          </td>
          <td></td>
        </tr>
        <tr>
          <th scope="row" >신고사업장</th>
          <td colspan="3" class="td_input" style="border-right: hidden;">
            <sbux-input id="srch-inp-taxSiteName" name="srch-inp-taxSiteName" uitype="text" class="form-control input-sm"></sbux-input>
          </td>
          <td></td>
          <th scope="row" >사업자번호</th>
          <td colspan="3" class="td_input" style="border-right: hidden;">
            <sbux-input id="srch-inp-bizRegno" name="srch-inp-bizRegno" uitype="text" class="form-control input-sm"></sbux-input>
          </td>
          <td></td>
        </tr>
        </tbody>
      </table>
      </div>
        <div style=" height: 80vh; display: flex">
        <div style="width: 30%;padding: 10px">
          <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
              <li><span>◎ 사업장 리스트</span></li>
            </ul>
          </div>
          <div id="sb-area-grdListGrid" style="width: 100%"></div>
        </div>
        <div class="resizer" data-direction="horizontal"></div>
        <div style="padding: 10px;flex: 1;display: flex;flex-direction: column; overflow: scroll">
          <div style="flex: 1;">
            <div class="ad_tbl_top">
              <ul class="ad_tbl_count">
                <li><span>◎ 수출재화 집계내역</span></li>
              </ul>
            </div>
            <table id="panRightHeader" style="width: 100%; margin-bottom: 10px">
              <colgroup>
                <col style="width: 18%">
                <col style="width: 12%">
                <col style="width: 50%">
                <col style="width: 10%">
              </colgroup>
              <tbody>
                <tr>
                  <td rowspan="17" class="td_input">부가가치세법</td>
                  <td class="td_input">
                    조문
                  </td>
                  <td class="td_input">
                    내용
                  </td>
                  <td class="td_input">
                    금액(원)
                  </td>
                </tr>
                <tr>
                  <td rowspan="5" class="td_input">
                    제21조
                  </td>
                  <td class="td_input">
                    직접수출
                  </td>
                  <td>
                    <sbux-input id="DIRECT_EXPORT_AMT" name="DIRECT_EXPORT_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    중계무역위탁판매
                  </td>
                  <td>
                    <sbux-input id="INTERMEDIATE_AMT" name="INTERMEDIATE_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    내국신용장ㆍ구매확인서에 의하여 공급하는 재화
                  </td>
                  <td>
                    <sbux-input id="LOCAL_CREDIT_AMT" name="LOCAL_CREDIT_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    한국국제협력단등 공급하는 해외반출용 재화
                  </td>
                  <td>
                    <sbux-input id="INTERNATIONAL_COOPERATION_AGEN" name="INTERNATIONAL_COOPERATION_AGEN" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    수탁가공무역 수출용으로 공급하는 재화
                  </td>
                  <td>
                    <sbux-input id="PROCESSING_TRADE_AMT" name="PROCESSING_TRADE_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    제22조
                  </td>
                  <td class="td_input">
                    국외에서제공하는용역
                  </td>
                  <td>
                    <sbux-input id="FOREIGN_COUNTRY_AMT" name="FOREIGN_COUNTRY_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td rowspan="2" class="td_input">
                    제23조
                  </td>
                  <td class="td_input">
                    선박ㆍ항공기에 의한 외국항행용역
                  </td>
                  <td>
                    <sbux-input id="SHIPS_AIRCRAFTS_AMT" name="SHIPS_AIRCRAFTS_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    국제복합운송계약에 의한 외국항행용역
                  </td>
                  <td>
                    <sbux-input id="INTERNATIONAL_MULTIMODAL_CONTR" name="INTERNATIONAL_MULTIMODAL_CONTR" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td rowspan="8" class="td_input">
                    제24조
                  </td>
                  <td class="td_input">
                    국내에서 비거주자ㆍ외국법인에 공급되는 재화 또는 용역
                  </td>
                  <td>
                    <sbux-input id="NONRESIDENT_FOREIGN_CORPORATIO" name="NONRESIDENT_FOREIGN_CORPORATIO" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    수출재화임가공용역
                  </td>
                  <td>
                    <sbux-input id="EXPORT_GOODS_SERVICE_AMT" name="EXPORT_GOODS_SERVICE_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    외국항행 선박ㆍ항공기 등에 공급하는 재화 또는 용역
                  </td>
                  <td>
                    <sbux-input id="OVERSEAS_NAVIGATION_AMT" name="OVERSEAS_NAVIGATION_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    국내주재외교공관등에 공급하는 재화 또는 용역
                  </td>
                  <td>
                    <sbux-input id="DIPLOMATIC_OFFICES_AMT" name="DIPLOMATIC_OFFICES_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    외국인 관광객에게 공급하는 관광알선용역등
                  </td>
                  <td>
                    <sbux-input id="TOURISM_PROMOTION_AMT" name="TOURISM_PROMOTION_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    외국인전용판매장 또는 전용 유흥음식점에서 공급하는 재화
                  </td>
                  <td>
                    <sbux-input id="FOREIGNER_SALES_OUTLET_AMT" name="FOREIGNER_SALES_OUTLET_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    외교관 등에게 공급하는 재화 또는 용역
                  </td>
                  <td>
                    <sbux-input id="DIPLOMAT_SUPPLY_AMT" name="DIPLOMAT_SUPPLY_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    외국인환자 유치용역
                  </td>
                  <td>
                    <sbux-input id="FOREIGNER_PATIENT_AMT" name="FOREIGNER_PATIENT_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td colspan="3">
                    「부가가치세법」에 따른 영세율 적용 공급실적 합계
                  </td>
                  <td>
                    <sbux-input id="VAT_SUM_AMT" name="VAT_SUM_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
              </tbody>
            </table>
            <table id="panRightMiddle" style="width: 100%; margin-bottom: 10px">
              <colgroup>
                <col style="width: 18%">
                <col style="width: 12%">
                <col style="width: 50%">
                <col style="width: 10%">
              </colgroup>
              <tbody>
                <tr>
                  <td rowspan="9" class="td_input">
                    조세특례제한법
                  </td>
                  <td class="td_input">
                    105조 제1항1호
                  </td>
                  <td class="td_input">
                    방위산업물자 등에 지정된 자가 생산공급하는 시제품 등
                  </td>
                  <td>
                    <sbux-input id="DEFENSE_INDUSTRY_OIL_AMT" name="DEFENSE_INDUSTRY_OIL_AMT" uitype="text"
                              class="tpgTd" init="0" readonly
                              mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    105조 제1항2호
                  </td>
                  <td class="td_input">
                    국군조직법에 따라 부대 또는 기관에 공급하는 석유류
                  </td>
                  <td>
                    <sbux-input id="MILITARY_OIL_AMT" name="MILITARY_OIL_AMT" uitype="text"
                              class="tpgTd" init="0" readonly
                              mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    105조 제1항3호
                  </td>
                  <td class="td_input">
                    도시철도건설용역
                  </td>
                  <td>
                    <sbux-input id="URBAN_RAILWAY_AMT" name="URBAN_RAILWAY_AMT" uitype="text"
                              class="tpgTd" init="0" readonly
                              mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    105조 제1항3호
                  </td>
                  <td class="td_input">
                    국가ㆍ지방자치단체에 공급하는 사회기반시설 등
                  </td>
                  <td>
                    <sbux-input id="LOCAL_GOVERNMENTS_ASSOCIATION_" name="LOCAL_GOVERNMENTS_ASSOCIATION_" uitype="text"
                              class="tpgTd" init="0" readonly
                              mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    105조 제1항4호
                  </td>
                  <td class="td_input">
                    장애인용 보장구 및 장애인용 특수 정보통신기기 등
                  </td>
                  <td>
                    <sbux-input id="DISABLED_PERSON_ASSISTING_DEVI" name="DISABLED_PERSON_ASSISTING_DEVI" uitype="text"
                              class="tpgTd" init="0" readonly
                              mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    105조 제1항5호
                  </td>
                  <td class="td_input">
                    농민 또는 임업 종사자에게 공급하는 농축임기자재
                  </td>
                  <td>
                    <sbux-input id="FARMERS_FISHERMEN_APPARATUS_AM" name="FARMERS_FISHERMEN_APPARATUS_AM" uitype="text"
                              class="tpgTd" init="0" readonly
                              mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    105조 제1항6호
                  </td>
                  <td class="td_input">
                    어민에게공급하는어업용기자재
                  </td>
                  <td>
                    <sbux-input id="FISHERMEN_APPARATUS_AMT" name="FISHERMEN_APPARATUS_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    제107조
                  </td>
                  <td class="td_input">
                    외국인관광객등에게 공급하는 재화
                  </td>
                  <td>
                    <sbux-input id="FOREIGN_TOURIST_GOODS_AMT" name="FOREIGN_TOURIST_GOODS_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td class="td_input">
                    제121조의13
                  </td>
                  <td class="td_input">
                    제주특별자치도 면세품판매장에 판매,공급하는 물품
                  </td>
                  <td>
                    <sbux-input id="JEJU_DUTY_FREE_SHOP_AMT" name="JEJU_DUTY_FREE_SHOP_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td colspan="3" class="td_input">
                    「조세특례제한법」 및 법률에 따른 영세율 적용 공급실적 합계
                  </td>
                  <td class="td_input">
                    <sbux-input id="SPECIAL_TAX_TREATMENT_CONTROL_" name="SPECIAL_TAX_TREATMENT_CONTROL_" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
                <tr>
                  <td colspan="3" class="td_input">
                    영세율적용공급실적 총합계
                  </td>
                  <td class="td_input">
                    <sbux-input id="ZERO_TAX_SUPPLY_RESULT_AMT" name="ZERO_TAX_SUPPLY_RESULT_AMT" uitype="text"
                                class="tpgTd" init="0" readonly
                                mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true }">
                    </sbux-input>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
<script type="text/javascript">
  // common ---------------------------------------------------
  var p_formId	= gfnma_formIdStr('${comMenuVO.pageUrl}');
  var p_menuId 	= '${comMenuVO.menuId}';
  //-----------------------------------------------------------
  /** 제출사유 **/
  var jsonReasonCode = [];
  var jsonGrdList = [];
  var jsonGrdDetail = [];
 
  var grdDetailGrid;
  var grdListGrid;
 
  /** DOM load **/
  window.addEventListener('DOMContentLoaded', function(e) {
    fn_createGrid();
    fn_init();
  });
 
  const fn_init = async function() {
    /** 법인 select **/
    jsonCorpNm = await gfnma_getComSelectList('L_ORG000', '', '', '', 'CO_CD', "CORP_NM");
    jsonReasonCodeData = await gfnma_getComList('L_FIT025', '', gv_ma_selectedCorpCd, gv_ma_selectedClntCd, 'CO_CD', "CORP_NM");
    jsonReasonCode = jsonReasonCodeData.cv_1;
    SBUxMethod.refresh('srch-slt-corpNm');
    SBUxMethod.setValue('srch-slt-corpNm', gv_ma_selectedCorpCd);
    /** 제출사유 **/
    SBUxMethod.refresh('SBMSN_RSN_CD');
    /** 기준연도 **/
    let yyyy = gfn_dateToYear(new Date());
    SBUxMethod.set('srch-dtp-yyyy', yyyy);

    /** 신고구분명 select **/
    await fn_setMultSelect(yyyy);
  }
  async function fn_setMultSelect(yyyy){
    /** 신고구분명 select **/
    gfnma_multiSelectInit({
      target			: ['#src-btn-currencyCode']
      ,compCode		: gv_ma_selectedCorpCd
      ,clientCode		: gv_ma_selectedClntCd
      ,bizcompId		: 'L_FIT030'
      ,whereClause	: 'AND A.YR = ' + "'" + yyyy + "'"
      ,formId			: p_formId
      ,menuId			: p_menuId
      ,selectValue	: ''
      ,dropType		: 'down' 	// up, down
      ,dropAlign		: '' 	// left, right
      ,colValue		: 'SEQ'
      ,colLabel		: 'VAT_TMPLT_NM'
      ,columns		:[
        {caption: "부가세유형",		ref: 'VAT_TMPLT_NM', 			width:'120px',  	style:'text-align:left'},
        {caption: "신고기준시작월", 		ref: 'STANDARD_TERM_FR',    		width:'150px',  	style:'text-align:left'},
        {caption: "신고기준종료월", 		ref: 'STANDARD_TERM_TO',    		width:'150px',  	style:'text-align:left'},
        {caption: "총괄납부사업장번호", 		ref: 'UNIT_NO',    		width:'180px',  	style:'text-align:left'},
        {caption: "단위과세번호", 		ref: 'OVS_BPLC_NO',    		width:'150px',  	style:'text-align:left'},
        {caption: "확정여부", 		ref: 'CFMTN_YN',    		width:'150px',  	style:'text-align:left'},
        {caption: "SEQ", 		ref: 'SEQ',    		width:'150px',  	style:'text-align:left;display:none',}
      ]
      ,callback       : fn_choice
    });
  }
  async function fn_choice(_value) {
    /** reset **/
    jsonGrdList.length = 0;
    grdListGrid.rebuild();
 
    const inputs = document.querySelectorAll('#panRightHeader input, #panRightMiddle input');
    inputs.forEach(input => {
      input.value = 0;
    });
 
    let tr = $('#src-btn-currencyCode').siblings().find('tr.clickable-row.active');
    if (tr.length) {
      let termFr = tr.find('td[cu-code="STANDARD_TERM_FR"]');
      if (termFr.length) {
        SBUxMethod.set("srch-dtp-ymdstandardTermFr", termFr.text());
        SBUxMethod.set('srch-dtp-yyyy', termFr.text().split('-')[0]);
      }
 
      let termTo = tr.find('td[cu-code="STANDARD_TERM_TO"]');
      if (termTo.length) {
        SBUxMethod.set('srch-dtp-ymdstandardTermTo', termTo.text());
      }
    }
    var paramObj = {
      V_P_DEBUG_MODE_YN      : ''
      ,V_P_LANG_ID            : ''
      ,V_P_COMP_CODE          : gv_ma_selectedCorpCd
      ,V_P_CLIENT_CODE        : gv_ma_selectedClntCd
      ,V_P_YYYY               : ''
      ,V_P_SEQ                : ''
      ,V_P_TAX_SITE_CODE      : ''
      ,V_P_TAX_SITE_NAME      : ''
      ,V_P_BIZ_REGNO          : ''
      ,V_P_FORM_ID            : p_formId
      ,V_P_MENU_ID            : p_menuId
      ,V_P_PROC_ID            : ''
      ,V_P_USERID             : ''
      ,V_P_PC                 : ''
    }
 
    let postFlag = gfnma_getTableElement("srchTable","srch-",paramObj,"V_P_",['taxSiteName','bizRegno']);
    paramObj.V_P_SEQ = _value;
 
    const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2330.do", {
      getType				: 'json',
      cv_count		    	: '5',
      workType              : 'LIST',
      params				: gfnma_objectToString(paramObj)
    });
    const data = await postJsonPromise;
    if(data.resultStatus === 'S') {
      jsonGrdList = data.cv_1;
      grdListGrid.rebuild();
 
      if (grdListGrid.getRows() === 2) {
        grdListGrid.setRow(1);
        paramObj.V_P_TAX_SITE_CODE = grdListGrid.getRowData(1).TX_SITE_CD;
        const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2330.do", {
          getType: 'json',
          cv_count: '5',
          workType: 'DETAIL',
          params: gfnma_objectToString(paramObj)
        });
        const data = await postJsonPromise;
 
        if (data.resultStatus === 'S') {
          let tableData = data.cv_2[0];
 
          for(let key in tableData){
            $(`#${'${key}'}`).val(tableData[key]);
          }
        }
      }
    }
  }
 
  const fn_createGrid = function(){
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdListGrid';
    SBGridProperties.id = 'grdListGrid';
    SBGridProperties.jsonref = 'jsonGrdList';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.columns = [
      {caption : ['신고사업장명'],               ref : 'TX_SITE_NM',        width : '50%',    style : 'text-align:center',    type : 'output'},
      {caption : ['사업자번호'],          ref : 'BRNO',      width : '50%',   style : 'text-align:center',    type : 'output'},
    ];
    grdListGrid = _SBGrid.create(SBGridProperties);
    grdListGrid.bind("click","fn_setSiteCode");
  }
 
  /** resizer set **/
  const resizer = document.getElementById('resizer');
  const leftSide = resizer.previousElementSibling;
  const rightSide = resizer.nextElementSibling;
 
  let x = 0;
  let y = 0;
 
  let leftWidth = 0;
 
  const mouseDownHandler = function (e) {
    x = e.clientX;
    y = e.clientY;
    leftWidth = leftSide.getBoundingClientRect().width;
 
    document.addEventListener('mousemove', mouseMoveHandler);
    document.addEventListener('mouseup', mouseUpHandler);
  };
 
  const mouseMoveHandler = function (e) {
    const dx = e.clientX - x;
    const dy = e.clientY - y;
 
    document.body.style.cursor = 'col-resize';
 
    leftSide.style.userSelect = 'none';
    leftSide.style.pointerEvents = 'none';
 
    rightSide.style.userSelect = 'none';
    rightSide.style.pointerEvents = 'none';
 
    const newLeftWidth = ((leftWidth + dx) * 100) / resizer.parentNode.getBoundingClientRect().width;
    leftSide.style.width = `${'${newLeftWidth}'}%`;
    grdListGrid.resize();
    grdDetailGrid.resize();
  };
 
  const mouseUpHandler = function () {
    resizer.style.removeProperty('cursor');
    document.body.style.removeProperty('cursor');
 
    leftSide.style.removeProperty('user-select');
    leftSide.style.removeProperty('pointer-events');
 
    rightSide.style.removeProperty('user-select');
    rightSide.style.removeProperty('pointer-events');
 
    document.removeEventListener('mousemove', mouseMoveHandler);
    document.removeEventListener('mouseup', mouseUpHandler);
  };
  resizer.addEventListener('mousedown', mouseDownHandler);
  /** 공통버튼 **/
  function cfn_init(){
    fn_reset();
  }
  function fn_reset(){
    jsonGrdList.length = 0;
    grdListGrid.rebuild();
 
    const inputs = document.querySelectorAll('#panRightHeader input, #panRightMiddle input');
    inputs.forEach(input => {
      input.value = 0;
    });
  }
  async function cfn_search() {
	    let _value = gfnma_multiSelectGet('#src-btn-currencyCode');
	    if(gfn_isEmpty(_value)){
	      gfn_comAlert("W0002", "신고구분명");
	      return;
	    }
	    await fn_choice(_value);
  }
  async function fn_setSiteCode() {
    var paramObj = {
      V_P_DEBUG_MODE_YN: ''
      , V_P_LANG_ID: ''
      , V_P_COMP_CODE: gv_ma_selectedCorpCd
      , V_P_CLIENT_CODE: gv_ma_selectedClntCd
      , V_P_YYYY: ''
      , V_P_SEQ: ''
      , V_P_TAX_SITE_CODE: ''
      , V_P_TAX_SITE_NAME: ''
      , V_P_BIZ_REGNO: ''
      , V_P_FORM_ID: p_formId
      , V_P_MENU_ID: p_menuId
      , V_P_PROC_ID: ''
      , V_P_USERID: ''
      , V_P_PC: ''
    }
    let postFlag = gfnma_getTableElement("srchTable", "srch-", paramObj, "V_P_", ['taxSiteName', 'bizRegno']);
    paramObj.V_P_SEQ = gfnma_multiSelectGet('#src-btn-currencyCode');
    paramObj.V_P_TAX_SITE_CODE = jsonGrdList[grdListGrid.getRow() - 1].TX_SITE_CD;
 
    const postJsonPromise = gfn_postJSON("/fi/tax/vat/selectFit2330.do", {
      getType: 'json',
      cv_count: '5',
      workType: 'DETAIL',
      params: gfnma_objectToString(paramObj)
    });
    const data = await postJsonPromise;
  }
</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
