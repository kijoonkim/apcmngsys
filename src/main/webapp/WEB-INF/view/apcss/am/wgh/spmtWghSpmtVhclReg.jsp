<%
  /**
   * @Class Name : wrhsVhclReg.jsp
   * @Description : 원물 출차등록 화면
   * @author SI개발부
   * @since 2024.12.18
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2024.12.18   	손민성		최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 원물 출차등록</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start;">
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물 출차등록 -->
      </div>
      <%--            /** 상단 버튼 **/--%>
      <div style="margin-left: auto;">
        <sbux-button id="btnCreate" name="btnCreate" uitype="normal" class="btn btn-sm btn-outline-danger" text="신규" onclick="fn_create"></sbux-button>
        <sbux-button disabled="true" id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save"></sbux-button>
        <sbux-button disabled="true" id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
        <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
        <%--    <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-sm btn-outline-danger" onclick="fn_reset"></sbux-button>--%>
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
          <th scope="row" class="th_bg">계량대</th>
          <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
            <sbux-select id="srch-slt-sortFcltCd"
                         name="srch-slt-sortFcltCd"
                         uitype="single"
                         unselected-text="선택"
                         class="form-control input-sm"
                         style="width: 80%"
                         jsondata-ref="jsonSortFclt">
            </sbux-select>
          </td>
          <th scope="row" class="th_bg">계량번호</th>
          <td class="td_input" colspan="4" style="border-right: hidden;border-top: hidden">
            <sbux-input id="srch-slt-wghno"
                        name="srch-slt-wghno"
                        uitype="text"
                        class="form-control input-sm"
                        style="width: 80%">
            </sbux-input>
          </td>
          <td colspan="4" style="border-top: hidden;"></td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">계량일자</th>
          <td class="td_input" colspan="3" style="border-right: hidden;">
            <sbux-datepicker id="srch-slt-wghYmd"
                             name="srch-slt-wghYmd"
                             class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                             wrap-style="width:80%"
                             uitype="popup">
            </sbux-datepicker>
          </td>
          <th scope="row" class="th_bg">차량번호</th>
          <td class="td_input" colspan="4" style="border-right: hidden">
            <sbux-input id="srch-slt-vhclno"
                        name="srch-slt-vhclno"
                        uitype="text"
                        class="form-control input-sm"
                        style="width: 80%">
            </sbux-input>
          </td>
          <td colspan="4"></td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">계량유형</th>
          <td class="td_input" colspan="3" style="border-right: hidden;">
            <sbux-select id="srch-slt-f"
                         name="srch-slt-sortFcltCd"
                         uitype="single"
                         unselected-text="선택"
                         class="form-control input-sm"
                         style="width: 80%"
                         jsondata-ref="jsonSortFclt">
            </sbux-select>
          </td>
          <td colspan="9"></td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">입차중량</th>
          <td class="td_input" colspan="3" style="border-right: hidden;">
            <sbux-input id="srch-slt-wght"
                        name="srch-slt-wght"
                        uitype="text"
                        class="form-control input-sm"
                        style="width: 80%">
            </sbux-input>
          </td>
          <th scope="row" class="th_bg">출차중량</th>
          <td class="td_input" colspan="4" style="border-right: hidden;">
            <sbux-input id="srch-slt-wght1"
                        name="srch-slt-wght1"
                        uitype="text"
                        class="form-control input-sm"
                        style="width: 80%">
            </sbux-input>
          </td>
          <td colspan="4"></td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">팔레트정보</th>
          <td class="td_input" colspan="3" style="border-right: hidden;">
            <sbux-input id="srch-slt-wght"
                        name="srch-slt-wght"
                        uitype="text"
                        class="form-control input-sm"
                        style="width: 80%">
            </sbux-input>
          </td>
          <td colspan="9"></td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">입차시각</th>
          <td class="td_input" colspan="3" style="border-right: hidden;">
            <sbux-input id="srch-slt-wght"
                        name="srch-slt-wght"
                        uitype="text"
                        class="form-control input-sm"
                        style="width: 80%">
            </sbux-input>
          </td>
          <th scope="row" class="th_bg">출차시각</th>
          <td class="td_input" colspan="4" style="border-right: hidden;">
            <sbux-input id="srch-slt-wght1"
                        name="srch-slt-wght1"
                        uitype="text"
                        class="form-control input-sm"
                        style="width: 80%">
            </sbux-input>
          </td>
          <td colspan="4"></td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">비고</th>
          <td class="td_input" colspan="3" style="border-right: hidden;">
            <sbux-input id="srch-slt-wght"
                        name="srch-slt-wght"
                        uitype="text"
                        class="form-control input-sm"
                        style="width: 80%">
            </sbux-input>
          </td>
          <td colspan="9"></td>
        </tr>
        </tbody>
      </table>
      <div class="ad_tbl_top">
        <ul class="ad_tbl_count">
          <li>
            <span>입출차 목록</span>
          </li>
        </ul>
      </div>
      <div id="sb-area-wghCurInq"></div>
    </div>
  </div>
</section>
</body>
<script type="application/javascript">
  var jsonWghCurInq = [];
  let gridWghCurInq;
  var jsonSortFclt = [];

  /* SB Select */
  var jsonApcItem			= [];	// 품목 		itemCd		검색
  var jsonApcVrty			= [];	// 품종 		vrtyCd		검색

  window.addEventListener("DOMContentLoaded", function(){
    fn_init();
  });
  const fn_init = async function(){
    await gfn_setComCdSBSelect('srch-slt-sortFcltCd',	jsonSortFclt, 	'WGH_FCLT_CD', 	gv_selectedApcCd),
            await fn_create_wghCurInq();
    await fn_initSBSelect();
  }
  /**
   * @name fn_initSBSelect
   * @description SBSelect JSON 불러오기
   */
  const fn_initSBSelect = async function() {
    // 검색 SB select
    let result = await Promise.all([
      gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),		// 품목
      gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, gv_selectedApcCd),		// 품종
    ]);
  }

  const fn_create_wghCurInq = async function(){
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-wghCurInq';
    SBGridProperties.id = 'gridWghCurInq';
    SBGridProperties.jsonref = 'jsonWghCurInq';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.datamergefalseskip = true;
    SBGridProperties.columns = [
      {caption: ["계량대"],	ref: 'fcltCd',		type:'output',  width:'8%', style: 'text-align:center;'},
      {caption: ["차량번호"],	ref: 'itemNm',		type:'output',  width:'8%', style: 'text-align:center;'},
      {caption: ["계량구분"],	ref: 'vrtyNm',		type:'output',  width:'8%', style: 'text-align:center;'},
      {caption: ["입차시각"],	ref: 'wghYmd',		type:'output',  width:'10%', style: 'text-align:center;'},
      {caption: ["출차시각"],	ref: 'wghFcltCd',		type:'output',  width:'10%', style: 'text-align:center;'},
      {caption: ["입차중량"],	ref: 'wghno',	type:'output',  width:'8%', style: 'text-align:center;'},
      {caption: ["출차중량"],	ref: 'vhclno',		type:'output',  width:'8%', style: 'text-align:center;'},
      {caption: ["차이"],	ref: 'qntt',		type:'output',  width:'8%', style: 'text-align:center;'},
      {caption: ["계량번호"],	ref: 'qntt',		type:'output',  width:'8%', style: 'text-align:center;'},
      {caption: ["처리업무"],	ref: 'qntt',		type:'output',  width:'8%', style: 'text-align:center;'},
      {caption: ["완료일시"],	ref: 'qntt',		type:'output',  width:'8%', style: 'text-align:center;'},
      {caption: ["비고"],	ref: 'qntt',		type:'output',  width:'8%', style: 'text-align:center;'},
    ]
    gridWghCurInq = _SBGrid.create(SBGridProperties);
  }
  const fn_search = async function(){
    let fcltCd = SBUxMethod.get("srch-slt-sortFcltCd");
    console.log(fcltCd,"?");
    let postJsonPromise = gfn_postJSON("/am/wgh/selectWghFclt.do",{apcCd:gv_apcCd,fcltCd:fcltCd});
    let data = await postJsonPromise;
    if(data.resultStatus === 'S'){
      jsonWghCurInq = data.resultList;
      jsonWghCurInq.forEach(function(item){
        if(item.bgngYmd){
          if(item.endYmd){
            item.status = 'OFF';
          }else{
            item.status = 'ON';
          }
        }
      });
      gridWghCurInq.rebuild();
    }
    console.log(data);
  }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
