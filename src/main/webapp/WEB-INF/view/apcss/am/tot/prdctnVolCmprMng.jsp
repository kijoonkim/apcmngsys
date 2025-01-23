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
        <%--                <sbux-button disabled="true" id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>--%>
        <%--                <sbux-button disabled="true" id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>--%>
        <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
        <%--                <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>--%>
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
          <th scope="row" class="th_bg">기준일자</th>
          <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
            <div style="display: flex;justify-content: left;align-items: center">
              <sbux-datepicker
                      uitype="popup"
                      id="srch-dtp-wrhsYmd"
                      name="srch-dtp-wrhsYmd"
                      date-format="yyyy-mm-dd"
                      class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
              ></sbux-datepicker>
            </div>
          </td>
          <th scope="row" class="th_bg">품목/품종</th>
          <td class="td_input" colspan="4" style="border-top: hidden;border-right: hidden">
            <div style="display: flex; gap: 5px">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-itemCd"
                      name="srch-slt-itemCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonApcItem"
                      onchange="fn_onChangeSrchItemCd(this)">
              </sbux-select>
              <sbux-select
                      unselected-text="선택"
                      uitype="single"
                      id="srch-slt-vrtyCd"
                      name="srch-slt-vrtyCd"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      jsondata-ref="jsonApcVrty"
                      jsondata-value="itemVrtyCd"
                      onchange="fn_onChangeSrchVrtyCd(this)">
              </sbux-select>
            </div>
          </td>
          <td colspan="4" style="border-top: hidden"></td>
        </tr>
        </tbody>
      </table>
      <div style="display: flex; flex-direction: column; gap: 10px">
        <div style="flex: 1">
          <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
              <li>
                <span>생산량 비교 목록</span>
              </li>
            </ul>
          </div>
          <div id="sb-area-rtnCrtr" style="height: 450px"></div>
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

  var jsonApcItem			= [];	// 품목 		itemCd		검색
  var jsonApcVrty			= [];	// 품종 		vrtyCd		검색

  window.addEventListener("DOMContentLoaded",function(){
    SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
    fn_init();
  });
  const fn_init = async function(){
    await fn_create_rtnCrtr();
    await fn_search();
    await fn_initSBSelect();

  }
  const fn_initSBSelect = async function() {
    // 검색 SB select
    let result = await Promise.all([
      gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),		// 품목
      gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),		// 품종
    ]);
  }


  const fn_create_rtnCrtr = async function(){
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-rtnCrtr';
    SBGridProperties.id = 'gridRtnCrtr';
    SBGridProperties.jsonref = 'jsonRtnCrtr';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.datamergefalseskip = true;
    SBGridProperties.columns = [
      {caption: ["품목","품목"],	ref: 'ITEM_NM',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["품종","품종"],	ref: 'VRTY_NM',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-12","중량"],	ref: 'W_12',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-12","증감"],	ref: 'W_12',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-11","중량"],	ref: 'W_11',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-11","증감"],	ref: 'D_11',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-10","중량"],	ref: 'W_10',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-10","증감"],	ref: 'D_10',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-9","중량"],	ref: 'W_9',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-9","증감"],	ref: 'D_9',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-8","중량"],	ref: 'W_8',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-8","증감"],	ref: 'D_8',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-7","중량"],	ref: 'W_7',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-7","증감"],	ref: 'D_7',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-6","중량"],	ref: 'W_6',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-6","증감"],	ref: 'D_6',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-5","중량"],	ref: 'W_5',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-5","증감"],	ref: 'D_5',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-4","중량"],	ref: 'W_4',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-4","증감"],	ref: 'D_4',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-3","중량"],	ref: 'W_3',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-3","증감"],	ref: 'D_3',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-2","중량"],	ref: 'W_2',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-2","증감"],	ref: 'D_2',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-1","중량"],	ref: 'W_1',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-1","증감"],	ref: 'D_1',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-0","중량"],	ref: 'W_0',		type:'output',  width:'100px', style: 'text-align:center;'},
      {caption: ["M-0","증감"],	ref: 'D_0',		type:'output',  width:'100px', style: 'text-align:center;'},
    ]
    gridRtnCrtr = _SBGrid.create(SBGridProperties);
  }
  const fn_search = async function(){
    let ymd = SBUxMethod.get("srch-dtp-wrhsYmd");
    let itemCd = SBUxMethod.get("srch-slt-itemCd") || '';
    let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd") || '';
    vrtyCd = vrtyCd !== '' ? vrtyCd.substring(4) : '';
    let param = {apcCd: gv_selectedApcCd, ymd:ymd, itemCd:itemCd, vrtyCd: vrtyCd}
    const postJsonPromise = gfn_postJSON("/am/tot/selectPrdctnVol.do",param);
    const data = await postJsonPromise;
    if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
    }
    jsonRtnCrtr = data.resultList;
    gridRtnCrtr.rebuild();
  }
  /**
   * @name fn_onChangeSrchItemCd
   * @description 품목 선택 변경 event
   */
  const fn_onChangeSrchItemCd = async function(obj) {
    let itemCd = obj.value;
    const itemInfo = _.find(jsonApcItem, {value: itemCd});
    let result = await Promise.all([
      gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),
    ]);
  }

  /**
   * @name fn_onChangeSrchVrtyCd
   * @description 품종 선택 변경 event
   */
  const fn_onChangeSrchVrtyCd = async function(obj) {
    let vrtyCd = obj.value;
    const itemCd = vrtyCd.substring(0,4);

    const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
    if(!gfn_isEmpty(vrtyCd)){
      if (itemCd != prvItemCd) {
        SBUxMethod.set("srch-slt-itemCd", itemCd);
        await fn_onChangeSrchItemCd({value: itemCd});
        SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
      } else{
        SBUxMethod.set("srch-slt-itemCd", itemCd);
        await fn_onChangeSrchItemCd({value: itemCd});
        SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
      }
    }
  }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>