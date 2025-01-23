<%
  /**
   * @Class Name : itemClsfSortPrfmncAnls.jsp
   * @Description : 품목별 선별 실적 분석 화면
   * @author SI개발부
   * @since 2025.01.22
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일        수정자        수정내용
   * @ ---------- ---------- ---------------------------
   * @ 2025.01.22     박승진       최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 품목별 선별 실적 분석</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start;">
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 품목별 선별 실적 분석 -->
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
          <th scope="row" class="th_bg">투입일자</th>
          <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
            <div style="display: flex;justify-content: center;align-items: center">
              <sbux-datepicker
                      uitype="range"
                      id="srch-dtp-inptYmd"
                      name="srch-dtp-inptYmd"
                      date-format="yyyy-mm-dd"
                      class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
              ></sbux-datepicker>
          </td>
          <th scope="row" class="th_bg">품목/품종</th>
				<td class="td_input" style="border-right: hidden;">
					<sbux-select
						unselected-text="전체"
						uitype="single"
						id="srch-slt-itemCd"
						name="srch-slt-itemCd"
						class="form-control input-sm input-sm-ast"
						jsondata-ref="jsonApcItemCd"
						onchange="fn_itemChange"
						group-id="group1">
					</sbux-select>
				</td>
				<td class="td_input" colspan="2"style="border-right: hidden;">
					<sbux-select
						unselected-text="선택"
						uitype="single"
						id="srch-slt-vrtyCd"
						name="srch-slt-vrtyCd"
						class="form-control input-sm input-sm-ast "
						jsondata-ref="jsonApcVrtyCd"
						jsondata-value="vrtyCd"
						filter-source-name="srch-slt-itemCd"
						jsondata-filter="itemCd"
						onchange="fn_vrtyChange(srch-slt-vrtyCd)"
						group-id="group1">
					</sbux-select>
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
                <span>선별 실적 분석 목록</span>
              </li>
            </ul>
          </div>
          <div id="sb-area-itemClsSortPrfmncAnls" style="height:400px"></div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
<script type="application/javascript">
  /** grid 변수 셋팅 **/
  var jsonItemClsSortPrfmncAnls = [];
  let grdItemClsSortPrfmncAnls;

  /** 품목 **/
  var jsonApcItemCd = [];

  /** 품종 **/
  var jsonApcVrtyCd = [];

  /** 규격 **/
  var jsonApcSpcfct = [];

  /** 표준등급 **/
  var jsonStdGrd = [];
  var jsonStdGrdTemp = [];

  window.addEventListener("DOMContentLoaded",function(){
    fn_init();
  });
  const fn_init = async function(){
	  await fn_initSBselect();
      await fn_createItemClsSortPrfmncAnls();
  }

  const fn_initSBselect = async function(){

      let result = await Promise.all([
		gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItemCd, gv_apcCd),		// 품목
		gfn_setApcVrtySBSelect("srch-slt-vrtyCd", 		jsonApcVrtyCd, 	gv_apcCd),			// APC 품종(저장)
		fn_selectStdGrd(),
      ]);

      jsonApcSpcfct = await gfn_getApcSpcfcts(gv_selectedApcCd,'');
  }

  const fn_createItemClsSortPrfmncAnls = async function(){
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-itemClsSortPrfmncAnls';
    SBGridProperties.id = 'grdItemClsSortPrfmncAnls';
    SBGridProperties.jsonref = 'jsonItemClsSortPrfmncAnls';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.datamergefalseskip = true;
    SBGridProperties.columns = [
      {caption: ['품목'], ref: 'ITEM_CD', width: '120px', type: 'combo', typeinfo : {ref:'jsonApcItemCd', label:'label', value:'value',  oneclickedit : true}, style:'text-align:center', disabled : {uihidden : true}},
      {caption: ['품종'], ref: 'VRTY_NM', width: '120px', type: 'output', style:'text-align:center', disabled : {uihidden : true}},
      {caption: ['규격'], ref: 'SPCFCT_CD', width: '120px', type : 'combo', typeinfo : {ref:'jsonApcSpcfct', label:'spcfctNm', value:'spcfctCd',  filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd', listall: false} }, style:'text-align:center', disabled : {uihidden : true}},
      {caption: ['등급'], ref: 'GRD_NM', width: '120px', type: 'output',  style:'text-align:center', disabled : {uihidden : true}},
      {caption: ["투입수량"],	ref: 'INPT_QNTT',		type:'output',  width:'120px', style: 'text-align:right;',format : {type:'number', rule:'#,###'}},
      {caption: ["투입중량"],	ref: 'INPT_WGHT',		type:'output',  width:'120px', style: 'text-align:right;',format : {type:'number', rule:'#,###'}},
      {caption: ["총선별수량"],	ref: 'TOT_QNTT',		type:'output',  width:'120px', style: 'text-align:right;',format : {type:'number', rule:'#,###'}},
      {caption: ["총선별중량"],	ref: 'TOT_WGHT',		type:'output',  width:'120px', style: 'text-align:right;',format : {type:'number', rule:'#,###'}},
      {caption: ["차이(수량)"],	ref: 'DIFF_QNTT',		type:'output',  width:'120px', style: 'text-align:right;',format : {type:'number', rule:'#,###'}},
      {caption: ["차이(중량)"],	ref: 'DIFF_WGHT',		type:'output',  width:'120px', style: 'text-align:right;',format : {type:'number', rule:'#,###'}},
      {caption: ["선별수량"],	ref: 'QNTT',		type:'output',  width:'120px', style: 'text-align:right;',format : {type:'number', rule:'#,###'}},
      {caption: ["선별중량"],	ref: 'WGHT',		type:'output',  width:'120px', style: 'text-align:right;',format : {type:'number', rule:'#,###'}},
      {caption: ["구성비율"],	ref: 'RT_PART_WGHT',		type:'output',  width:'120px', style: 'text-align:right;',format : {type:'string', rule:'@"%"'}}
    ]
    grdItemClsSortPrfmncAnls = _SBGrid.create(SBGridProperties);
  }

  const fn_search = async function(){
	  jsonItemClsSortPrfmncAnls.length = 0;
	  let apcCd = gv_apcCd;
	  let inptYmd = SBUxMethod.get("srch-dtp-inptYmd");
	  let itemCd = SBUxMethod.get("srch-slt-itemCd");
	  let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");

	  if( inptYmd === "undefined"){
		  return;
	  }
	  if(gfn_nvl(inptYmd[0]) === "" || gfn_nvl(inptYmd[1]) === ""){
		  return;
	  }


		let obj = {
				apcCd : apcCd
				, inptYmdFrom : inptYmd[0]
				, inptYmdTo   : inptYmd[1]
				, itemCd 	  : itemCd
				, vrtyCd	  : vrtyCd
				};

		let postJsonPromise = gfn_postJSON("/am/tot/selectItemClsSortPrfmncAnls.do",obj );
	    let data = await postJsonPromise;
	    try{
			if (_.isEqual("S", data.resultStatus)) {
				jsonItemClsSortPrfmncAnls.length = 0;
				jsonItemClsSortPrfmncAnls = data.resultList;
		    	grdItemClsSortPrfmncAnls.rebuild();
      	} else {
      		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
      	}
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}


  const fn_selectStdGrd = async function(){
		let apcCd = gv_apcCd;
		let postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdDtlList.do", {apcCd : apcCd});
	    let data = await postJsonPromise;
	    try{
			if (_.isEqual("S", data.resultStatus)) {
				jsonStdGrd.length = 0;
				jsonStdGrdTemp.length = 0;
		    	data.resultList.forEach((item, index) => {
					let spmtPckgUnitVO = {
						itemCd : item.itemCd
						, grdSeCd : item.grdSeCd
						, grdKnd : item.grdKnd
						, grdCd : item.grdCd
						, grdNm : item.grdNm
						, grdVl : item.grdVl
						, stdGrdType : item.stdGrdType
						, itemGrdSeCd : item.itemCd + item.grdSeCd
					}
					jsonStdGrdTemp.push(spmtPckgUnitVO);
				});

     	} else {
     		gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
     	}
	    }catch (e) {
			if (!(e instanceof Error)) {
				e = new Error(e);
			}
			console.error("failed", e.message);
	    }
	}





</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>