<%
  /**
   * @Class Name : acinspInvntrMng.jsp
   * @Description : 실사재고관리 화면
   * @author SI개발부
   * @since 2025.01.20
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일        수정자        수정내용
   * @ ---------- ---------- ---------------------------
   * @ 2025.01.20     박승진       최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 실사재고관리</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
  <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start;">
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 실사재고관리 -->
      </div>
      <%--            /** 상단 버튼 **/--%>
      <div style="margin-left: auto;">
        <sbux-button id="btnDocAiPrfmnc" name="btnDocAiPrfmnc" uitype="normal" text="실사결과" class="btn btn-sm btn-success" onclick="fn_docAiPrfmnc"></sbux-button>
        <sbux-button id="btnSave" name="btnSave" uitype="normal" class="btn btn-sm btn-outline-danger" text="저장" onclick="fn_save('insert')"></sbux-button>
        <sbux-button id="btnDelete" name="btnDelete" uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
        <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search"></sbux-button>
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
            <sbux-datepicker id="srch-slt-planYmd"
                             name="srch-slt-planYmd"
                             class="form-control pull-right input-sm  input-sm-ast"
                             wrap-style="width:80%"
                             uitype="popup">
            </sbux-datepicker>
          </td>
          <th scope="row" class="th_bg">계획번호</th>
          <td class="td_input" colspan="4" style="border-right: hidden;border-top: hidden">
            <sbux-input id="srch-slt-planno"
                         name="srch-slt-planno"
                         unselected-text="전체"
                         class="form-control input-sm"
                         style="width: 80%">
            </sbux-input>
          </td>
          <td colspan="4" style="border-top: hidden"></td>
        </tr>
        </tbody>
      </table>
      <div style="display: flex; flex-direction: column; gap: 10px;margin-top: 15px">
        <div style="flex: 1">
          <div style="display: flex; justify-content: space-between;margin-bottom: 10px">
          	  <div>
	              <span style="margin-right: 3px; font-weight: 600; color: #3c6dbc;align-content: end">
	                 실사 계획 목록
	              </span>
              </div>
              <div>
				   <sbux-button
				        id="srch-btn-aiPrfmncCmplt"
                        name="srch-btn-aiPrfmncCmplt"
                        class="btn btn-xs btn-outline-dark"
                        text="실사완료"
                        onclick="fn_aiPrfmncCmplt">
          			</sbux-button>
			  </div>
          </div>
          <div id="sb-area-aiInvntrPlan"></div>
        </div>
        <div style="flex: 1">
          <table class="table table-bordered tbl_fixed">
	        <colgroup>
	          <col style="width: 7%">
	          <col style="width: 6%">
	          <col style="width: 6%">
	          <col style="width: 3%">
	          <col style="width: 7%">
	          <col style="width: 6%">
	          <col style="width: 6%">
	          <col style="width: 3%">
	          <col style="width: 7%">
	          <col style="width: 6%">
	          <col style="width: 6%">
	          <col style="width: 3%">
	        </colgroup>
	        <tbody>
	        <tr>
	          <th scope="row" class="th_bg">생산자</th>
	          <td class="td_input" colspan="2" style="border-right: hidden;border-top: hidden">
	             <sbux-input id="srch-slt-prdcrNm"
	                         name="srch-slt-prdcrNm"
	                         class="form-control input-sm"
	                         group-id="group1"
	                         readonly>
	            </sbux-input>
	            <sbux-input id="srch-slt-prdcrCd"
	                         name="srch-slt-prdcrCd"
	                         class="form-control input-sm"
	                         uitype="hidden"
	                         group-id="group1"
	                         readonly>
	            </sbux-input>
	          </td>
	          <td class="td_input" style="border-right: hidden;">
	            <sbux-button id="srch-btn-prdcr"
	                         name="srch-btn-prdcr"
	                         class="btn btn-xs btn-outline-dark"
	                         text="찾기"
	                         onclick="fn_prdcrCallback">
	            </sbux-button>
	           </td>
	           <th scope="row" class="th_bg">입고구분</th>
	           <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
	           		<sbux-select
						unselected-text="선택"
						uitype="single"
						id="srch-slt-wrhsSeCd"
						name="srch-slt-wrhsSeCd"
						class="form-control input-sm input-sm-ast "
						jsondata-ref="jsonWrhsSeCd"
						style="width: 80%"
						group-id="group1">
					</sbux-select>
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
				<td class="td_input" style="border-right: hidden;">
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

	        </tr>
	        <tr>
	        	<th scope="row" class="th_bg">재고구분</th>
				<td class="td_input" colspan="3" style="border-right: hidden;">
					<sbux-select
						unselected-text="선택"
						uitype="single"
						id="srch-slt-invntrSeCd"
						name="srch-slt-invntrSeCd"
						class="form-control input-sm input-sm-ast "
						jsondata-ref="jsonInvntrSeCd"
						style="width: 80%"
						group-id="group1"
						onchange="fn_grdInvntrSeChange">
					</sbux-select>
				</td>
				<th scope="row" class="th_bg">등급</th>
				<td class="td_input" colspan="3" style="border-right: hidden;">
					<sbux-select
						unselected-text="선택"
						uitype="single"
						id="srch-slt-grdCd"
						name="srch-slt-grdCd"
						class="form-control input-sm input-sm-ast "
						jsondata-ref="jsonStdGrd"
						jsondata-text="grdNm"
						jsondata-value="grdCd"
						style="width: 80%"
						group-id="group1"
						>
					</sbux-select>
				</td>
				<th scope="row" class="th_bg">규격</th>
				<td class="td_input" colspan="3" style="border-right: hidden;">
					<sbux-select
						unselected-text="선택"
						uitype="single"
						id="srch-slt-spcfctCd"
						name="srch-slt-spcfctCd"
						class="form-control input-sm input-sm-ast "
						jsondata-ref="jsonApcSpcfct"
						filter-source-name="srch-slt-itemCd"
						jsondata-filter="itemCd"
						jsondata-text="spcfctNm"
						jsondata-value="spcfctCd"
						style="width: 80%"
						group-id="group1">
					</sbux-select>
				</td>
	        </tr>
	        <tr>
	        	<th scope="row" class="th_bg">포장단위</th>
				<td class="td_input" colspan="3" style="border-right: hidden;">
					<sbux-select
						unselected-text="선택"
						uitype="single"
						id="srch-slt-spmtPckgUnitCd"
						name="srch-slt-spmtPckgUnitCd"
						class="form-control input-sm input-sm-ast "
						jsondata-ref="jsonSpmtPckgUnit"
						filter-source-name="srch-slt-itemCd"
						jsondata-filter="itemCd"
						jsondata-text="spcfctNm"
						jsondata-value="spmtPckgUnitCd"
						style="width: 80%"
						group-id="group1">
					</sbux-select>
				</td>
				<th scope="row" class="th_bg">상품구분</th>
				<td class="td_input" colspan="3" style="border-right: hidden;">
					<sbux-select
						unselected-text="선택"
						uitype="single"
						id="srch-slt-gdsSeCd"
						name="srch-slt-gdsSeCd"
						class="form-control input-sm input-sm-ast "
						jsondata-ref="jsonGdsSeCd"
						style="width: 80%"
						group-id="group1">
					</sbux-select>
				</td>
				<th scope="row" class="th_bg">저장위치</th>
				<td class="td_input" colspan="3" style="border-right: hidden;">
					<sbux-select
						unselected-text="선택"
						uitype="single"
						id="srch-slt-warehouseSeCd"
						name="srch-slt-warehouseSeCd"
						class="form-control input-sm input-sm-ast "
						jsondata-ref="jsonComWarehouse"
						style="width: 80%"
						group-id="group1">
					</sbux-select>
				</td>

	        </tr>
	        <tr>
	        	<th scope="row" class="th_bg">실사일자</th>
	        	<td class="td_input" colspan="3" style="border-right: hidden;">
		        	<sbux-datepicker
	                	id="srch-dtl-aiYmd"
	                    name="srch-dtl-aiYmd"
	                    class="form-control pull-right input-sm  input-sm-ast"
	                    uitype="popup">
	                </sbux-datepicker>
                </td>
                <th scope="row" class="th_bg">수량</th>
				<td class="td_input" colspan="3" style="border-right: hidden;">
					<sbux-input
						id="srch-inp-qntt"
						name="srch-inp-qntt"
						class="form-control input-sm input-sm-ast "
						style="width: 80%"
						group-id="group1">
					</sbux-input>
				</td>
				<th scope="row" class="th_bg">중량</th>
				<td class="td_input" colspan="3" style="border-right: hidden;">
					<sbux-input
						id="srch-inp-wght"
						name="srch-inp-wght"
						class="form-control input-sm input-sm-ast "
						style="width: 80%"
						group-id="group1">
					</sbux-input>
				</td>
	        </tr>
	        </tbody>
	      </table>
        </div>
        <div style="flex: 1">
          <div style="display: flex; justify-content: space-between;margin-bottom: 10px">
          				<div style="align-content: center;">
	                        <span style="margin-right: 3px; font-weight: 600; color: #3c6dbc;align-content: end">
	                           실사 재고 목록
	                        </span>
	                        <sbux-label id="srch-lbl-planNm" name="srch-lbl-planno" uitype="normal" text="">
							</sbux-label>
							<sbux-input id="srch-inp-planno"
	                         name="srch-inp-planno"
	                         uitype="hidden"
	                         group-id="group1"
	                         readonly>
	            			</sbux-input>
						</div>
						<div>
							<sbux-button id="srch-btn-update"
		                         name="srch-btn-update"
		                         class="btn btn-xs btn-outline-dark"
		                         text="실사재고수정"
		                         onclick="fn_save('update')">
	            			</sbux-button>
						</div>
          </div>
          <div id="sb-area-aiInvntrMng" style="height:200px"></div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- 생산자 선택 Modal -->
    <div>
        <sbux-modal
        	id="modal-prdcr"
        	name="modal-prdcr"
        	uitype="middle"
        	header-title="생산자 선택"
        	body-html-id="body-modal-prdcr"
        	header-is-close-button="false"
        	footer-is-close-button="false"
        	style="width:1000px"
       	></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
    	<jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="application/javascript">

  /** 창고 **/
  var jsonComWarehouse = [];

  /** 품목 **/
  var jsonApcItemCd = [];

  /** 품종 **/
  var jsonApcVrtyCd = [];

  /** 계획 **/
  var jsonAiPlan = [];

  /** 출하포장단위 **/
  var jsonSpmtPckgUnit = [];
  var jsonSpmtPckgUnitTemp = [];

  /** 규격 **/
  var jsonApcSpcfct = [];

  /** 입고구분 **/
  var jsonWrhsSeCd =[];

  /** 상품구분 **/
  var jsonGdsSeCd = [];

  /** 표준등급 **/
  var jsonStdGrd = [];
  var jsonStdGrdTemp = [];

  /** 재고구분 **/
  var jsonInvntrSeCd = [];





  /** grid 변수 셋팅 **/
  var jsonAiInvntrMng = [];
  var jsonAiInvntrMngTemp = [];
  let grdAiInvntrMng;

  var jsonAiInvntrPlan = [];
  let grdAiInvntrPlan;



  window.addEventListener("DOMContentLoaded",function(){
    fn_init();
  });

  const fn_initSBselect = async function(){

      let result = await Promise.all([
      	gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
      	gfn_setComCdSBSelect('grdAiInvntrMng',	jsonInvntrSeCd, 'INVNTR_SE_CD'),
      	gfn_setComCdSBSelect('grdAiInvntrMng',	jsonWrhsSeCd, 	'WRHS_SE_CD'),
      	gfn_setComCdSBSelect('grdAiInvntrMng',	jsonGdsSeCd, 	'GDS_SE_CD',gv_apcCd),
		gfn_setApcItemSBSelect('grdAiInvntrMng', 		jsonApcItemCd, gv_apcCd),		// 품목
		gfn_setApcVrtySBSelect("grdAiInvntrMng", 		jsonApcVrtyCd, 	gv_apcCd),			// APC 품종(저장)
		fn_selectStdGrd(),
		fn_selectSpmtPckgUnit(),
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, "")
      ]);

      jsonApcSpcfct = await gfn_getApcSpcfcts(gv_selectedApcCd,'');
      SBUxMethod.refreshGroup("group1");
      SBUxMethod.attr('srch-btn-update', 'disabled', 'true');
      SBUxMethod.attr('srch-btn-aiPrfmncCmplt', 'disabled', 'true');

  }

  const fn_init = async function(){
	await fn_initSBselect();
	await fn_createAiInvntrPlan();
    await fn_createAiInvntrMng();
    await fn_search();
  }

  const fn_createAiInvntrPlan = async function(){
	    var SBGridProperties = {};
	    SBGridProperties.parentid = 'sb-area-aiInvntrPlan';
	    SBGridProperties.id = 'grdAiInvntrPlan';
	    SBGridProperties.jsonref = 'jsonAiInvntrPlan';
	    SBGridProperties.emptyrecords = '데이터가 없습니다.';
	    SBGridProperties.datamergefalseskip = true;
	    SBGridProperties.columns = [
	      {caption: ["계획일자"],	ref: 'planYmd',		type:'output',  width:'150px', style: 'text-align:center;'},
          {caption: ["계획번호"],	ref: 'planno',		type:'output',  width:'150px', style: 'text-align:center;'},
	      {caption: ["계획명"],	ref: 'planNm',		type:'output',  width:'150px', style: 'text-align:center;'},
	      {caption: ['대상품목'], ref: 'itemCd', width: '150px', type: 'combo', typeinfo : {ref:'jsonApcItemCd', label:'label', value:'value', oneclickedit : true}, style:'text-align:center',disabled : {uihidden : true}},
          {caption: ['대상품종'], ref: 'itemVrtyCd', width: '150px', type: 'combo', typeinfo : {ref:'jsonApcVrtyCd', label:'label', value:'itemVrtyCd', oneclickedit : true, filtering: {usemode : true, uppercol : 'itemCd', attrname : 'itemCd', listall: false}}, style:'text-align:center', disabled : {uihidden : true}},
	      {caption: ['저장위치'], ref: 'warehouseSeCd', width: '150px', type: 'combo', typeinfo : {ref:'jsonComWarehouse', label:'label', value:'value', oneclickedit : true}, style:'text-align:center',disabled : {uihidden : true}},
	      {caption: ["실사여부"],	ref: 'aiYn',		type:'output',  width:'150px', style: 'text-align:center;'},
          {caption: ["비고"],	ref: 'planRmrk',		type:'output',  width:'150px', style: 'text-align:center;'},
	    ]
	    grdAiInvntrPlan = _SBGrid.create(SBGridProperties);
	    grdAiInvntrPlan.bind('click',fn_grdAiInvntrPlanClick);
	  }

  const fn_createAiInvntrMng = async function(){
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-aiInvntrMng';
    SBGridProperties.id = 'grdAiInvntrMng';
    SBGridProperties.jsonref = 'jsonAiInvntrMng';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.datamergefalseskip = true;
    SBGridProperties.columns = [
      {caption: ['생산자'], ref: 'prdcrCd', width: '130px',  type : 'combo', type: 'combo', typeinfo : {ref:'jsonPrdcrPop', label:'prdcrNm', value:'prdcrCd',  oneclickedit : true} , style:'text-align:center', disabled : {uihidden : true}},
      {caption: ['입고구분'], ref: 'wrhsSeCd', width: '130px', type: 'combo', typeinfo : {ref:'jsonWrhsSeCd', label:'label', value:'value',  oneclickedit : true}, style:'text-align:center', disabled : {uihidden : true}},
      {caption: ['대상품목'], ref: 'itemCd', width: '130px', type: 'combo', typeinfo : {ref:'jsonApcItemCd', label:'label', value:'value',  oneclickedit : true}, style:'text-align:center', disabled : {uihidden : true}},
      {caption: ['대상품종'], ref: 'itemVrtyCd', width: '130px', type: 'combo', typeinfo : {ref:'jsonApcVrtyCd', label:'label', value:'itemVrtyCd',  oneclickedit : true, filtering: {usemode : true, uppercol : 'itemCd', attrname : 'itemCd', listall: false}}, style:'text-align:center', disabled : {uihidden : true}},

      {caption: ['재고구분'], ref: 'invntrSeCd', width: '130px', type: 'combo', typeinfo : {ref:'jsonInvntrSeCd', label:'label', value:'value',  oneclickedit : true}, style:'text-align:center', disabled : {uihidden : true}},
      {caption: ['등급'], ref: 'grdNm', width: '130px', type: 'output',  style:'text-align:center', disabled : {uihidden : true}},

      {caption: ['규격'], ref: 'spcfctCd', width: '130px', type : 'combo', typeinfo : {ref:'jsonApcSpcfct', label:'spcfctNm', value:'spcfctCd',  filtering: {usemode: true, uppercol: 'itemCd', attrname: 'itemCd', listall: false} }, style:'text-align:center', disabled : {uihidden : true}},
      {caption: ['포장단위'], ref: 'spmtPckgUnitNm', width: '130px', type : 'output', style:'text-align:center', disabled : {uihidden : true}},
      {caption: ['상품구분'], ref: 'gdsSeCd', width: '130px', type: 'combo', typeinfo : {ref:'jsonGdsSeCd', label:'label', value:'value',  oneclickedit : true}, style:'text-align:center', disabled : {uihidden : true}},
      {caption: ['저장위치'], ref: 'warehouseSeCd', width: '130px', type: 'combo', typeinfo : {ref:'jsonComWarehouse', label:'label', value:'value',  oneclickedit : true}, style:'text-align:center', disabled : {uihidden : true}},
      {caption: ["수량"],	ref: 'invntrQntt',		type:'input',  width:'130px', style: 'text-align:center;'},
      {caption: ["중량"],	ref: 'invntrWght',		type:'input',  width:'130px', style: 'text-align:center;'}, //중량은 자동계산 되도록
    ]
    grdAiInvntrMng = _SBGrid.create(SBGridProperties);
    grdAiInvntrMng.bind('click',fn_grdAiInvntrMngClick);
  }

  const fn_grdAiInvntrPlanClick = async function(){
	  let row = grdAiInvntrPlan.getRow();
	  if(row === -1){
		  SBUxMethod.set("srch-lbl-planno","");
		  SBUxMethod.set("srch-inp-planno","");
		  SBUxMethod.attr('btnSave', 'disabled', 'true');
		  SBUxMethod.attr('srch-btn-aiPrfmncCmplt', 'disabled', 'true');
		  return;
	  }
	  let rowData = grdAiInvntrPlan.getRowData(row);

	  SBUxMethod.set("srch-lbl-planno","계획번호 : " + rowData.planno);
	  SBUxMethod.set("srch-inp-planno",rowData.planno);
	  SBUxMethod.attr('btnSave', 'disabled', 'false');
	  SBUxMethod.attr('srch-btn-aiPrfmncCmplt', 'disabled', 'false');

	  jsonAiInvntrMng = jsonAiInvntrMngTemp.filter(item => item.planno === rowData.planno);
	  grdAiInvntrMng.rebuild();
  }

  const fn_grdAiInvntrMngClick = async function(){
	  let row = grdAiInvntrMng.getRow();
	  if(row === -1){
		  SBUxMethod.attr('srch-btn-update', 'disabled', 'true');
		  return;
	  }

	  SBUxMethod.attr('srch-btn-update', 'disabled', 'false');

  }

  const fn_grdInvntrSeChange = async function(){

	  let itemCd = SBUxMethod.get("srch-slt-itemCd");
	  let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");

	  if(gfn_nvl(itemCd) === "" || gfn_nvl(invntrSeCd) === ""){
		  return;
	  }

	  if(gfn_nvl(invntrSeCd.padLeft(2,"0")) === "01"){
		  jsonStdGrd.length = 0;
		  SBUxMethod.refresh("srch-slt-grdCd");
		  return;
	  }else{
		  jsonStdGrd = jsonStdGrdTemp.filter(item => item.itemCd === itemCd && item.grdSeCd === invntrSeCd.padLeft(2,"0"));
		  SBUxMethod.refresh("srch-slt-grdCd");
	  }

  }

  const fn_itemChange = async function(){
	  SBUxMethod.set("srch-slt-vrtyCd","")
  }

  const fn_vrtyChange = async function(args){

	  let itemCd = SBUxMethod.get("srch-slt-itemCd");
	  let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");

	  if(gfn_nvl(itemCd) === "" || gfn_nvl(vrtyCd) === ""){
		  return;
	  }
	  jsonSpmtPckgUnit = jsonSpmtPckgUnitTemp.filter(item => item.itemCd === itemCd && item.vrtyCd === vrtyCd );
	  SBUxMethod.refresh("srch-slt-spmtPckgUnitCd");
  }

  const fn_search = async function(){
	  jsonAiInvntrMng.length = 0;
	  jsonAiInvntrMngTemp.length = 0;
		let apcCd = gv_apcCd;
		let planYmd = SBUxMethod.get("srch-dtl-aiYmd");


		let obj = {
				apcCd : apcCd
				//, aiYmd : planYmd
				};

		let postJsonPromise = gfn_postJSON("/am/invntr/selectInvntrAiMng.do",obj );
	    let data = await postJsonPromise;
	    try{
			if (_.isEqual("S", data.resultStatus)) {
				jsonAiInvntrMng.length = 0;
				jsonAiInvntrMngTemp.length = 0;
		    	data.resultList.forEach((item, index) => {
					let spmtPckgUnitVO = {
						apcCd : item.apcCd
						, planno : item.planno
						, aiYmd : item.aiYmd
						, prdcrCd : item.prdcrCd
						, wrhsSeCd : item.wrhsSeCd
						, itemCd : item.itemCd
						, vrtyCd : item.vrtyCd
						, itemVrtyCd : item.itemCd + item.vrtyCd
						, invntrSeCd : item.invntrSeCd
						, grdCd : item.grdCd
						, grdNm : item.grdNm
						, spcfctCd : item.spcfctCd
						, spmtPckgUnitCd : item.spmtPckgUnitCd
						, spmtPckgUnitNm : item.spmtPckgUnitNm
						, gdsSeCd : item.gdsSeCd
						, warehouseSeCd : item.warehouseSeCd
						, invntrQntt : item.invntrQntt
						, invntrWght : item.invntrWght
						, aiSn : item.aiSn
						, dtlSn : item.dtlSn

					}
					jsonAiInvntrMngTemp.push(spmtPckgUnitVO);
				});
		    	await fn_searchAiPlan();
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


  const fn_searchAiPlan = async function(){
	    jsonAiInvntrPlan.length = 0;
		let apcCd = gv_apcCd;
		let planYmd = SBUxMethod.get("srch-slt-planYmd");
		let planno = SBUxMethod.get("srch-slt-planno");


		let obj = {
				apcCd : apcCd
				, planYmd : planYmd
				, planno  : planno
				};

		let postJsonPromise = gfn_postJSON("/am/invntr/selectInvntrAiPlan.do",obj );
	    let data = await postJsonPromise;
	    try{
			if (_.isEqual("S", data.resultStatus)) {
				jsonAiPlan.length = 0;
				jsonAiInvntrMng.length = 0;
				SBUxMethod.set("srch-lbl-planno","");
			    SBUxMethod.set("srch-inp-planno","");
		    	data.resultList.forEach((item, index) => {
					let spmtPckgUnitVO = {
					  apcCd : item.apcCd
					  ,	aiCrtrType 		: item.aiCrtrType
					  , crtrIndctNm 	: item.crtrIndctNm
					  , crtrCd      	: item.crtrCd
					  , crtrVl        	: item.crtrVl
					  , delYn 			: item.delYn
					  , gubun			: "update"
					  , aiYn     		: item.aiYn
					  , delYn			: item.delYn
					  , planYmd			: item.planYmd
					  , planno			: item.planno
					  , planRmrk		: item.planRmrk
					  , warehouseSeCd	: item.warehouseSeCd
					  , itemCd 			: item.itemCd
					  , vrtyCd			: item.vrtyCd
					  , itemVrtyCd		: item.itemCd + item.vrtyCd
					  , planNm			: item.planNm
					}
					jsonAiInvntrPlan.push(spmtPckgUnitVO);
				});
		    	grdAiInvntrPlan.rebuild();


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

  const fn_save = async function(gubun){
		let apcCd = gv_apcCd;
		let planno = SBUxMethod.get("srch-inp-planno");
		let aiYmd = SBUxMethod.get("srch-dtl-aiYmd")
		let prdcrCd = SBUxMethod.get("srch-slt-prdcrCd")
		let wrhsSeCd = SBUxMethod.get("srch-slt-wrhsSeCd");
		let itemCd = SBUxMethod.get("srch-slt-itemCd");
		let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
		let invntrSeCd = SBUxMethod.get("srch-slt-invntrSeCd");
		let grdCd = SBUxMethod.get("srch-slt-grdCd");
		let spcfctCd = SBUxMethod.get("srch-slt-spcfctCd");
		let spmtPckgUnitCd = SBUxMethod.get("srch-slt-spmtPckgUnitCd");
		let gdsSeCd = SBUxMethod.get("srch-slt-gdsSeCd");
		let warehouseSeCd = SBUxMethod.get("srch-slt-warehouseSeCd");
		let qntt = SBUxMethod.get("srch-inp-qntt");
		let wght = SBUxMethod.get("srch-inp-wght")

		let obj = {
				apcCd : apcCd
				, planno : planno
				, aiYmd : aiYmd
				, prdcrCd : prdcrCd
				, wrhsSeCd : wrhsSeCd
				, itemCd : itemCd
				, vrtyCd : vrtyCd
				, invntrSeCd : invntrSeCd
				, grdCd : grdCd
				, spcfctCd : spcfctCd
				, spmtPckgUnitCd : spmtPckgUnitCd
				, gdsSeCd : gdsSeCd
				, warehouseSeCd : warehouseSeCd
				, invntrQntt : qntt
				, invntrWght : wght
				, gubun      : gubun
		}
		let row = grdAiInvntrMng.getRow();
		if(gubun === "update" && row === -1){
			return;
		}else if(gubun === "update" && row !== -1){
			let rowData = grdAiInvntrMng.getRowData(row);
			obj['aiSn'] = rowData.aiSn;
			obj['dtlSn'] = rowData.dtlSn;
			obj['aiYmd'] = rowData.aiYmd;
			obj['invntrQntt'] = rowData.invntrQntt;
			obj['invntrWght'] = rowData.invntrWght;
		}

		let postJsonPromise = gfn_postJSON("/am/invntr/insertInvntrAiMng.do",obj );
	    let data = await postJsonPromise;
	    try{
			if (_.isEqual("S", data.resultStatus)) {
				fn_search();
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

  const fn_aiPrfmncCmplt = async function(){


		let row = grdAiInvntrPlan.getRow();
		if(row === -1){
			return;
		}
		let rowData = grdAiInvntrPlan.getRowData(row);

		let obj = {
				apcCd : gv_apcCd
				, planno : rowData.planno
				, aiYn : 'Y'
		}

		let postJsonPromise = gfn_postJSON("/am/invntr/updateInvntrAiPlanYn.do",obj );
	    let data = await postJsonPromise;
	    try{
			if (_.isEqual("S", data.resultStatus)) {
				fn_search();
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


  const fn_delete = async function(){
		let apcCd = gv_apcCd;
		let row = grdAiInvntrMng.getRow();
		if(row === -1){
			return;
		}
		let rowData = grdAiInvntrMng.getRowData(row);



		let obj = {
				apcCd : apcCd
				, planno : rowData.planno
				, aiYmd : rowData.aiYmd
				, aiSn : rowData.aiSn
				, dtlSn : rowData.dtlSn
		}

		let postJsonPromise = gfn_postJSON("/am/invntr/deleteInvntrAiMng.do",obj );
	    let data = await postJsonPromise;
	    try{
			if (_.isEqual("S", data.resultStatus)) {
				fn_search();
				grdAiInvntrMng.refresh();
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


  /**
   * @name fn_addRow
   * @description 행추가
   * @param {number} nRow
   */
  const fn_addRow = async function(grd, nRow, nCol) {

      const editableRow = grd.getRowData(nRow, false);	// call by reference(deep copy)

      editableRow['delYn'] = "N";
      editableRow['gubun'] = "insert";

      //grd.rebuild();
      grd.addRow(true);
      grd.addStatus(nRow,"insert");

      nRow++;
      grd.setCellDisabled(nRow, 0, nRow, grd.getCols() - 1, true);
  }



   const fn_selectSpmtPckgUnit = async function(){
		let apcCd = gv_apcCd;
		let postJsonPromise = gfn_postJSON("/am/cmns/selectSpmtPckgUnitList.do", {apcCd : apcCd});
	    let data = await postJsonPromise;
	    try{
  			if (_.isEqual("S", data.resultStatus)) {
  		    	jsonSpmtPckgUnit.length = 0;
  		    	jsonSpmtPckgUnitTemp.length = 0;
  		    	data.resultList.forEach((item, index) => {
  					let spmtPckgUnitVO = {
  						itemCd 			: item.itemCd
  					  , vrtyCd 			: item.vrtyCd
  					  , spcfctCd		: item.spcfctCd
  					  , spmtPckgUnitNm	: item.spmtPckgUnitNm
  					  , ntslUntprc		: item.ntslUntprc
  					  , brndNm			: item.brndNm
  					  , delYn			: item.delYn
  					  , apcCd			: item.apcCd
  					  , spmtPckgUnitCd	: item.spmtPckgUnitCd
  					  , itemNm			: item.itemNm
  					  , vrtyNm			: item.vrtyNm
  					  , spcfctNm		: item.spcfctNm
  					  , gdsGrd			: item.gdsGrd
  					  , gdsGrdNm		: item.gdsGrdNm
					  , extrnlLnkgCd	: item.extrnlLnkgCd
					  , plorCd			: item.plorCd
					  , addRow			: "N"
					  , stdPckgCd      : item.stdPckgCd
					  , stdGrdCd      : item.stdGrdCd
					  , stdUnitCd      : item.stdUnitCd
					  , stdEcfrdCd      : item.stdEcfrdCd
  					}
  					jsonSpmtPckgUnitTemp.push(spmtPckgUnitVO);
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



	const fn_prdcrCallback = async function() {
		popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, "");
		SBUxMethod.openModal("modal-prdcr");
	}

	  /**
 	 * @name fn_setPrdcr
 	 * @description 생산자 선택 popup callback
 	 */
 	const fn_setPrdcr = function(prdcr) {
 		if (!gfn_isEmpty(prdcr)) {
 			let row = grdAiInvntrMng.getRow();
 			let rowData = grdAiInvntrMng.getRowData(row);
 			SBUxMethod.set("srch-slt-prdcrNm",prdcr.prdcrNm);
 			SBUxMethod.set("srch-slt-prdcrCd",prdcr.prdcrCd);
 		}
 	}

 	/**
	 * @name fn_docAiPrfmnc
	 * @description 실사결과 발행
	 */
	const fn_docAiPrfmnc = async function() {
		const rptUrl = await gfn_getReportUrl('0000', 'AI_DOC');
		let row = grdAiInvntrPlan.getRow()

 		if (row === -1) {
 			gfn_comAlert("W0001", "발행대상");		//	W0001	{0}을/를 선택하세요.
			return;
 		}
		const rowData = grdAiInvntrPlan.getRowData(row);
		let planno = rowData.planno

 		gfn_popClipReport("실사결과", rptUrl, {apcCd: gv_selectedApcCd, planno : planno });
 	}



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>