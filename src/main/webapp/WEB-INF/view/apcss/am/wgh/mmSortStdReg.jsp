<%
  /**
   * @Class Name : mmSortStdReg.jsp
   * @Description : 원물입고등록 - 선별등록 화면
   * @author SI개발부
   * @since 2025.04.25
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2025.04.25   김은총	    최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>title : 선별등록</title>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start; padding: 10px 15px 5px;" >
      <div style="margin-left: auto;">
        <sbux-button id="btnResetSort" name="btnResetSort" uitype="normal" class="btn btn-sm btn-outline-danger" text="초기화" onclick="fn_reset('sortStdRegTable')"></sbux-button>
        <sbux-button id="btnAddSort" name="btnAddSort" uitype="normal" class="btn btn-sm btn-outline-danger" text="추가" onclick="fn_addSort"></sbux-button>
        <sbux-button id="btnUpdateSort" name="btnUpdateSort" uitype="normal" class="btn btn-sm btn-outline-danger" text="수정" onclick="fn_updateSort"></sbux-button>
      </div>
    </div>
    <div class="box-body">
      <%--생산자 코드--%>
      <sbux-input id="dtl-inp-sortPrdcrCd" name="dtl-inp-sortPrdcrCd" uitype="hidden"></sbux-input>
      <table id="sortStdRegTable" class="table table-bordered tbl_fixed">
        <caption>선별 등록 조건 설정</caption>
        <colgroup>
          <col style="width: 11%">
          <col style="width: 22%">
          <col style="width: 11%">
          <col style="width: 22%">
          <col style="width: 11%">
          <col style="width: 22%">
        </colgroup>
        <tbody>
        <tr>
          <th scope="row" class="th_bg"><span class="data_required"></span>선별일자</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-datepicker uitype="popup" id="dtl-dtp-sortYmd" name="dtl-dtp-sortYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"></sbux-datepicker>
            </div>
          </td>
          <th scope="row" class="th_bg"><span class="data_required"></span>선별설비</th>
          <td class="td_input" style="border-right: hidden">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-sortFcltCd"
                      name="dtl-slt-sortFcltCd"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      jsondata-ref="jsonComSortFclt"
              ></sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg"><span class="data_required">품목/품종</span></th>
          <td class="td_input">
            <div class="displayFlex">
              <div>
                <sbux-select
                        unselected-text="전체"
                        uitype="single"
                        id="dtl-slt-sortItemCd"
                        name="dtl-slt-sortItemCd"
                        class="form-control input-sm input-sm-ast"
                        jsondata-ref="jsonApcItem"
                        onchange="fn_onChangeSortSrchItemCd(this)">
                </sbux-select>
              </div>
              <div>
                <sbux-select
                        unselected-text="선택"
                        uitype="single"
                        id="dtl-slt-sortVrtyCd"
                        name="dtl-slt-sortVrtyCd"
                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                        jsondata-ref="jsonApcVrty"
                        jsondata-value="itemVrtyCd"
                        onchange="fn_onChangeSortSrchVrtyCd(this)">
                </sbux-select>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg"><span class="data_required"></span>규격</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-sortSpcfctCd"
                      name="dtl-slt-sortSpcfctCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonApcSpcfct"
                      onchange="fn_onChangeSortQntt(this)"
              ></sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg"><span class="data_required"></span>저장창고</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-sortStrgWrhusSeCd"
                      name="dtl-slt-sortStrgWrhusSeCd"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      jsondata-ref="jsonComWarehouse"
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">투입창고</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-sortInptWrhusSeCd"
                      name="dtl-slt-sortInptWrhusSeCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonComWarehouse"
                      onchange="">
              </sbux-select>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">투입수량/중량</th>
          <td class="td_input"style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-input
                      uitype="text"
                      id="dtl-inp-sortInputQntt"
                      name="dtl-inp-sortInputQntt"
                      class="form-control input-sm input-sm-ast"
                      autocomplete="off"
                      mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange="fn_onChangeInptQntt(this)"
              ></sbux-input>
              <sbux-input
                      uitype="text"
                      id="dtl-inp-sortInputWght"
                      name="dtl-inp-sortInputWght"
                      class="form-control input-sm"
                      autocomplete="off"
                      mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
              <sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"></sbux-label>
            </div>
          </td>
          <th scope="row" class="th_bg"><span class="data_required"></span>선별등급</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-sortGrdCd"
                      name="dtl-slt-sortGrdCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonApcGrdDtl"
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">포장/상품명</th>
          <td class="td_input">
            <div class="displayFlex" style="gap: 20px">
              <sbux-checkbox
                      style="flex: 0"
                      id="dtl-chk-sortPckg"
                      name="dtl-chk-sortPckg"
                      uitype="normal"
                      text="포장"
              ></sbux-checkbox>
              <sbux-select
                      style="flex:1"
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-sortSpmtPckgUnitCd"
                      name="dtl-slt-sortSpmtPckgUnitCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonSpmtPckgUnit"
                      onchange=""
              ></sbux-select>
              <sbux-select
                      style="flex:1"
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-sortSpmtPckgGrdCd"
                      name="dtl-slt-sortSpmtPckgGrdCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonComPckgGrdSeCd"
                      onchange=""
              ></sbux-select>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg"><span class="data_required"></span>선별수량/중량</th>
          <td class="td_input"style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-input
                      uitype="text"
                      id="dtl-inp-sortQntt"
                      name="dtl-inp-sortQntt"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      autocomplete="off"
                      mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange="fn_onChangeSortQntt(this)"
              ></sbux-input>
              <sbux-input
                      uitype="text"
                      id="dtl-inp-sortWght"
                      name="dtl-inp-sortWght"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      autocomplete="off"
                      mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
              <sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"></sbux-label>
            </div>
          </td>

          <th scope="row" class="th_bg">비고</th>
          <td colspan="3" class="td_input">
            <div class="displayFlex">
              <sbux-input
                      style="flex-grow: 1"
                      uitype="text"
                      id="dtl-inp-sortRmrk"
                      name="dtl-inp-sortRmrk"
                      class="form-control input-sm"
                      autocomplete="off"
              ></sbux-input>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">생산자</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <div style="flex: 1 0 8em">
                <sbux-input
                        uitype="text"
                        id="dtl-inp-sortPrdcrNm"
                        name="dtl-inp-sortPrdcrNm"
                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                        placeholder="초성검색 가능"
                        autocomplete-ref="jsonPrdcrAutocomplete"
                        autocomplete-text="name"
                        autocomplete-height="270px"
                        oninput="fn_OnInputSortPrdcrNm(event)"
                        autocomplete-select-callback="fn_onSelectSortPrdcrNm"
                ></sbux-input>
              </div>
              <div style="flex: 1 0 8em">
                <sbux-input
                        uitype="text"
                        id="dtl-inp-sortPrdcrIdentno"
                        name="dtl-inp-sortPrdcrIdentno"
                        class="form-control input-sm"
                        maxlength="2"
                        autocomplete="off"
                        onchange="fn_onChangeSortSrchPrdcrIdentno(this)"
                ></sbux-input>
              </div>
              <div style="flex: 0">
                <sbux-button
                        id="btn-dtl-sortPrdcr"
                        name="btn-dtl-sortPrdcr"
                        class="btn btn-xs btn-outline-dark"
                        text="찾기" uitype="modal"
                        target-id="modal-prdcr"
                        onclick="fn_sortChoicePrdcr"
                ></sbux-button>
              </div>
            </div>
          </td>
          <th scope="row" class="th_bg">입고구분</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-sortWrhsSeCd"
                      name="dtl-slt-sortWrhsSeCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonComWrhsSeCd"
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">상품구분</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-sortGdsSeCd"
                      name="dtl-slt-sortGdsSeCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonComGdsSeCd"
                      onchange="">
              </sbux-select>
            </div>
          </td>
        </tr>
        </tbody>
      </table>

      <!--[pp] //등록 -->
      <!--[pp] 등록목록 -->
      <div class="ad_tbl_top2">
        <ul class="ad_tbl_count">
          <li>
            <span>선별 등록 목록</span>
          </li>
        </ul>
        <div class="ad_tbl_toplist">
          <sbux-button id="btnSortDel" name="btnSortDel" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger"
                       onclick="fn_delSortRow"
                       style="margin-right:5px"
                       image-src="/resource/svg/grdMinus.svg"
                       image-style="width:3rem;height:20px"
                       image-placement="front"
          ></sbux-button>
        </div>
      </div>
      <div class="table-responsive tbl_scroll_sm">
        <div id="sb-area-grdSortRegList" style="height: 430px"></div>
      </div>
      <%--<!-- <div class="exp-div-excel" style="display: none;width: 2000px;"> none block-->
      <div class="exp-div-excel" style="display: none;width: 1000px;">
        <div id="sbexp-area-grdExpRawMtrWrhs" style="height:1px; width: 100%;"></div>
        <div id="sbexp-area-grdExpItem" style="height:1px; width: 100%;"></div>
        <div id="sbexp-area-grdExpVrty" style="height:1px; width: 100%;"></div>
        <div id="sbexp-area-grdExpPrdcr" style="height:1px; width: 100%;"></div>
        <div id="sbexp-area-grdExpWrhsSeCd" style="height:1px; width: 100%;"></div>
        <div id="sbexp-area-grdExpGdsSeCd" style="height:1px; width: 100%;"></div>
        <div id="sbexp-area-grdExpTrsprtSeCd" style="height:1px; width: 100%;"></div>
        <div id="sbexp-area-grdExpWarehouseSeCd" style="height:1px; width: 100%;"></div>
        <div id="sbexp-area-grdExpBxKnd" style="height:1px; width: 100%;"></div>
        <div id="sbexp-area-grdExpStdGrd" style="height:1px; width: 100%;"></div>
        <div id="sbexp-area-grdExpStdGrdDtl" style="height:1px; width: 100%;"></div>
        <div id="sbexp-area-grdExpStdGrdJgmt" style="height:1px; width: 100%;"></div>
        <input type="file" id="btnFileUpload" name="btnFileUpload" style="visibility: hidden;" onchange="importExcelData(event)">
      </div>
      <!-- 엑셀 시트별 데이터 영역 -->--%>

    </div>
  </div>
</section>


</body>

<script type="text/javascript">

  /* SB Select */
  var jsonComSortFclt = [];	// 설비 		SORT_FCLT_CD

  /* Grid 생성 */
  var grdSortRegList;
  var jsonSortRegList = [];


  /*window.addEventListener('DOMContentLoaded', async function(e) {
    fn_initSortReg();
    fn_createGridSortReg();
  });*/

  /**
   * @name fn_createGridSortReg
   * @description 입고등록목록 그리드 생성
   */
  const fn_createGridSortReg = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdSortRegList';
    SBGridProperties.id = 'grdSortRegList';
    SBGridProperties.jsonref = 'jsonSortRegList';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.extendlastcol = 'none';
    // SBGridProperties.inputfocusscrollmove = 'true';
    // SBGridProperties.allowcopy = true;

    SBGridProperties.columns = [
      {caption: ["선택", ""],	        ref: 'checkedYn',       type:'checkbox',  width:'50px',   style:'text-align:center', typeinfo : {fixedcellcheckbox : {usemode : true, rowindex : 1, deletecaption : false}, checkedvalue : 'Y', uncheckedvalue : 'N'}},
      {caption: ["그룹", "그룹"],		ref: 'group',           type:'output',    width:'50px',   style:'text-align:center'},
      {caption: ["선별일자", "선별일자"],	ref: 'sortYmd',         type:'output',    width:'100px',  style:'text-align:center'},
      {caption: ["선별설비", "선별설비"],	ref: 'sortFclt',        type:'output',    width:'100px',  style:'text-align:center'},
      {caption: ["품목", "품목"],		ref: 'sortItemNm',          type:'output',    width:'80px',   style:'text-align:center'},
      {caption: ["품종", "품종"],		ref: 'sortVrtyNm',          type:'output',    width:'80px',   style:'text-align:center'},
      {caption: ["투입", "투입창고"],		ref: 'sortInputWrhus',    	type:'output',    width:'80px',  style:'text-align:center'},
      {caption: ["투입", "수량"],		ref: 'sortInputQntt',       type:'output',    width:'70px',   style:'text-align:center',  format : {type:'number', rule:'#,###.###'}},
      {caption: ["투입", "중량(kg)"],	ref: 'sortInputWght',       type:'output',    width:'70px',   style:'text-align:center', format : {type:'number', rule:'#,###.###'}},
      {caption: ["선별", "저장창고"],		ref: 'sortStrgWrhus',	    type:'output',    width:'80px',  style:'text-align:center'},
      {caption: ["선별", "수량"],	    ref: 'sortQntt',        type:'output',    width:'70px',   style:'text-align:right', format : {type:'number', rule:'#,###.###'}},
      {caption: ["선별", "중량(kg)"],	ref: 'sortWght',        type:'output',    width:'70px',   style:'text-align:right', format : {type:'number', rule:'#,###.###'}},
      {caption: ["규격", "규격"],		ref: 'sortSpcfct',          type:'output',    width:'60px',  style:'text-align:center'},
      {caption: ["선별등급", "선별등급"],	ref: 'sortGrdNm',           type:'output',    width:'80px',   style:'text-align:center'},
      {caption: ["포장등록", "포장"],		ref: 'pckgChck',        type:'checkbox',  width:'50px',   style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, disabled: true},
      {caption: ["포장등록", "상품명"],	ref: 'sortSpmtPckgUnitNm',  type:'output',    width:'80px',   style:'text-align:center'},
      {caption: ["포장등록", "상품등급"],	ref: 'sortSpmtPckgGrdNm',   type:'output',    width:'60px',   style:'text-align:center'},
      {caption: ["생산자", "생산자"],		ref: 'sortPrdcrNm',         type:'output',    width:'60px',  style:'text-align:center'},
      {caption: ["입고구분", "입고구분"],	ref: 'sortWrhsSeNm',        type:'output',    width:'80px',   style:'text-align:center'},
      {caption: ["상품구분", "상품구분"],	ref: 'sortGdsSeNm',         type:'output',    width:'80px',   style:'text-align:center'},
      {caption: ["비고", "비고"],		ref: 'sortRmrk',     	    type:'output',    width:'200px',  style:'text-align:left'},

      {caption: ["선별설비코드"], ref: 'sortFcltCd', type: 'output', hidden: true},
      {caption: ["품목코드"], ref: 'sortItemCd', type: 'output', hidden: true},
      {caption: ["품종코드"], ref: 'sortVrtyCd', type: 'output', hidden: true},
      {caption: ["투입창고코드"], ref: 'sortInptWrhusSeCd', type: 'output', hidden: true},
      {caption: ["저장창고코드"], ref: 'sortStrgWrhusSeCd', type: 'output', hidden: true},
      {caption: ["규격코드"], ref: 'sortSpcfctCd', type: 'output', hidden: true},
      {caption: ["등급코드"], ref: 'sortGrdCd',  type: 'output', hidden: true},
      {caption: ["포장상품코드"],  ref: 'sortSpmtPckgUnitCd',  type: 'output', hidden: true},
      {caption: ["포장상품등급코드"], ref: 'sortSpmtPckgGrdCd',   type: 'output', hidden: true},
      {caption: ["생산자코드"],  ref: 'sortPrdcrCd', type: 'output', hidden: true},
      {caption: ["입고구분코드"], ref: 'sortWrhsSeCd', type: 'output', hidden: true},
      {caption: ["상품구분코드"], ref: 'sortGdsSeCd', type: 'output', hidden: true},

      // {caption: ["선별설비코드"], ref: 'sortFcltCd', type: 'output', hidden: true},
      // {caption: ["품목코드"], ref: 'itemCd', type: 'output', hidden: true},
      // {caption: ["품종코드"], ref: 'vrtyCd', type: 'output', hidden: true},
      // {caption: ["투입창고코드"], ref: 'inputWrhusSeCd', type: 'output', hidden: true},
      // {caption: ["저장창고코드"], ref: 'strgWrhusSeCd', type: 'output', hidden: true},
      // {caption: ["규격코드"], ref: 'spcfctCd', type: 'output', hidden: true},
      // {caption: ["등급코드"], ref: 'grdCd',  type: 'output', hidden: true},
      // {caption: ["포장상품코드"],  ref: 'spmtPckgUnitCd',  type: 'output', hidden: true},
      // {caption: ["포장상품등급코드"], ref: 'spmtPckgGrdCd',   type: 'output', hidden: true},
      // {caption: ["생산자코드"],  ref: 'prdcrCd', type: 'output', hidden: true},
      // {caption: ["입고구분코드"], ref: 'wrhsSeCd', type: 'output', hidden: true},
      // {caption: ["상품구분코드"], ref: 'gdsSeCd', type: 'output', hidden: true},
    ];

    grdSortRegList = _SBGrid.create(SBGridProperties);
    grdSortRegList.bind('click', fn_view);
    
  }

  /**
   * @name fn_initSortReg
   * @description form init
   */
  const fn_initSortReg = async function() {
    SBUxMethod.show("btnAddSort");
    SBUxMethod.hide("btnUpdateSort");

    SBUxMethod.set("dtl-dtp-sortYmd", gfn_dateToYmd(new Date()));
    fn_createGridSortReg();

    let result = await Promise.all([
      fn_initSortSBSelect(),
      // fn_initSBRadio(),
      // fn_getPrdcrs()
    ]);

    // fn_clearForm();
  }

  const fn_initSortSBSelect = async function() {
    // 검색 SB select
    let result = await Promise.all([
      gfn_setApcItemSBSelect('dtl-slt-sortItemCd',       jsonApcItem, gv_selectedApcCd),		// 품목
      gfn_setApcVrtySBSelect('dtl-slt-sortVrtyCd',       jsonApcVrty, gv_selectedApcCd),		// 품종
      gfn_setComCdSBSelect('dtl-slt-sortFcltCd',         jsonComSortFclt, 'SORT_FCLT_CD', gv_selectedApcCd),		// 설비
      gfn_setComCdSBSelect('dtl-slt-sortStrgWrhusSeCd',  jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 저장창고
      gfn_setComCdSBSelect('dtl-slt-sortInptWrhusSeCd',  jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 투입창고
      gfn_setComCdSBSelect('dtl-slt-sortWrhsSeCd',       jsonComWrhsSeCd, 	'WRHS_SE_CD'),							// 입고구분
      gfn_setComCdSBSelect('dtl-slt-sortGdsSeCd',        jsonComGdsSeCd, 	'GDS_SE_CD', gv_selectedApcCd),							// 상품구분
      // gfn_setApcSpcfctsSBSelect('dtl-slt-sortSpcfctCd', 		jsonApcSpcfct,  gv_selectedApcCd),						// 규격(엑셀)
    ]);
  }

  /**
   * @name fn_clearSortPrdcr
   * @description 생산자 폼 clear
   */
  const fn_clearSortPrdcr = function() {
    SBUxMethod.set("dtl-inp-sortPrdcrCd", "");
    SBUxMethod.set("dtl-inp-sortPrdcrIdentno", "");
    SBUxMethod.attr("dtl-inp-sortPrdcrNm", "style", "background-color:''");
  }

  /**
   * @name fn_OnInputSortPrdcrNm
   * @description 생산자명 입력 시 event : autocomplete
   */
  const fn_OnInputSortPrdcrNm = function(prdcrNm){
    fn_clearSortPrdcr();
    if(getByteLengthOfString(prdcrNm.target.value) > 100){
      SBUxMethod.set("dtl-inp-sortPrdcrNm", "");
      return;
    }
    jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);

    SBUxMethod.changeAutocompleteData('dtl-inp-sortPrdcrNm', true);
  }

  /**
   * @name fn_onSelectSortPrdcrNm
   * @description 생산자 autocomplete 선택 callback
   */
  function fn_onSelectSortPrdcrNm(value, label, item) {
    // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
    if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
      document.getElementById('btn-dtl-sortPrdcr').click();
    } else{
      SBUxMethod.set("dtl-inp-sortPrdcrCd", value);
      SBUxMethod.attr("dtl-inp-sortPrdcrNm", "style", "background-color:aquamarine");	//skyblue
      let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
      prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;

      fn_setSortPrdcrForm(prdcr);

    }
  }

  const fn_setSortPrdcrForm = async function(prdcr) {

    /*if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
      await gfn_setApcVrtySBSelect('dtl-slt-sortVrtyCd', jsonApcVrty, gv_selectedApcCd);
      SBUxMethod.set("dtl-slt-sortVrtyCd", prdcr.rprsItemCd + prdcr.rprsVrtyCd);
      fn_onChangeSortSrchVrtyCd({value : prdcr.rprsItemCd + prdcr.rprsVrtyCd});
    } else {
      if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
        const prvItemCd = SBUxMethod.get("dtl-slt-sortItemCd");

        if (prvItemCd != prdcr.rprsItemCd) {
          SBUxMethod.set("dtl-slt-sortItemCd", prdcr.rprsItemCd);
          fn_onChangeSortSrchItemCd({value:prdcr.rprsItemCd});
        }
      }
    }*/

    if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
      SBUxMethod.set("dtl-inp-sortPrdcrIdentno", prdcr.prdcrIdentno);
    } else {
      SBUxMethod.set("dtl-inp-sortPrdcrIdentno", "");
    }

  }

  /**
   * @name fn_onChangeSortSrchItemCd
   * @description 품목 선택 변경 event
   */
  const fn_onChangeSortSrchItemCd = async function(obj) {
    let itemCd = obj.value;
    const itemInfo = _.find(jsonApcItem, {value: itemCd});

    if (gfn_isEmpty(itemCd)) {
      gfn_setApcItemSBSelect('dtl-slt-sortItemCd',       jsonApcItem, gv_selectedApcCd),		// 품목
      gfn_setApcSpcfctsSBSelect('dtl-slt-sortSpcfctCd',	jsonApcSpcfct, 	"");  // 규격
      gfn_setApcVrtySBSelect('dtl-slt-sortVrtyCd', 		jsonApcVrty, 	gv_selectedApcCd);			// 품종

      jsonApcGrdDtl.length = 0;
      jsonSpmtPckgUnit.length = 0;
      jsonComPckgGrdSeCd.length = 0;

      SBUxMethod.refresh('dtl-slt-sortGrdCd');
      SBUxMethod.refresh('dtl-slt-sortSpmtPckgUnitCd');
      SBUxMethod.refresh('dtl-slt-sortSpmtPckgGrdCd');

    } else {
      let result = await Promise.all([
        gfn_setApcSpcfctsSBSelect('dtl-slt-sortSpcfctCd',	jsonApcSpcfct, 	gv_selectedApcCd, itemCd),			// 규격
        gfn_setApcGdsGrdSBSelect('dtl-slt-sortGrdCd', 	jsonApcGrdDtl, 	gv_selectedApcCd, itemCd, _GRD_SE_CD_SORT),	// 등급상세
        gfn_setApcVrtySBSelect('dtl-slt-sortVrtyCd', 		jsonApcVrty, 	gv_selectedApcCd, itemCd),			// 품종
      ]);
    }
  }

  /**
   * @name fn_onChangeSortSrchVrtyCd
   * @description 품종 선택 변경 event
   */
  const fn_onChangeSortSrchVrtyCd = async function(obj) {
    let vrtyCd = obj.value;

    if(!gfn_isEmpty(vrtyCd)){
      const itemCd = vrtyCd.substring(0,4);

      SBUxMethod.set("dtl-slt-sortItemCd", itemCd);
      await fn_onChangeSortSrchItemCd({value: itemCd});
      SBUxMethod.set("dtl-slt-sortVrtyCd", vrtyCd);
      await gfn_setSpmtPckgUnitSBSelect("dtl-slt-sortSpmtPckgUnitCd", jsonSpmtPckgUnit, gv_selectedApcCd, itemCd, vrtyCd.substring(4));
      await gfn_setApcGdsGrdSBSelect('dtl-slt-sortSpmtPckgGrdCd', 	jsonComPckgGrdSeCd, 	gv_selectedApcCd, itemCd, _GRD_SE_CD_GDS);	// 포장상품등급

    } else {
      await fn_onChangeSortSrchItemCd({value: null});
    }
    fn_onChangeInptQntt();
  }

  /**
   * @name fn_onChangeInptQntt
   * @description 투입수량 변경 event
   */
  const fn_onChangeInptQntt = function(obj) {
    let inputQntt = parseInt(SBUxMethod.get("dtl-inp-sortInputQntt")) || 0;
    let vrtyCd = SBUxMethod.get("dtl-slt-sortVrtyCd");			// 품종

    let vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd.substring(4,8)});
    if (!gfn_isEmpty(vrtyInfo)) {
      const unitWght = parseFloat(vrtyInfo.unitWght) || 0;
      let inputWght = Math.round(inputQntt * unitWght);

      SBUxMethod.set("dtl-inp-sortInputWght", inputWght);
    } else {
      SBUxMethod.set("dtl-inp-sortInputWght", "");
    }

  }

  /**
   * @name fn_onChangeSortQntt
   * @description 선별수량 변경 event
   */
  const fn_onChangeSortQntt = function(obj) {
    let sortQntt = parseInt(SBUxMethod.get("dtl-inp-sortQntt")) || 0;
    let sortSpcfctCd = SBUxMethod.get("dtl-slt-sortSpcfctCd");

    if (!gfn_isEmpty(sortSpcfctCd)) {
      const spcfctInfo = _.find(jsonApcSpcfct, {spcfctCd: sortSpcfctCd});
      let spcfctWght = spcfctInfo.wght;

      if (spcfctWght > 0) {
        let sortWght = gfn_apcEstmtWght(sortQntt * spcfctWght, gv_selectedApcCd);
        SBUxMethod.set("dtl-inp-sortWght", sortWght);
      }
    }
    else {
      SBUxMethod.set("dtl-inp-sortWght", "");
    }
  }

  /**
   * @name fn_sortChoicePrdcr
   * @description 생산자 선택 popup 호출
   */
  const fn_sortChoicePrdcr = function() {
    popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setSortPrdcr, SBUxMethod.get("dtl-inp-sortPrdcrNm"));
  }

  /**
   * @name fn_setSortPrdcr
   * @description 생산자 선택 popup callback 처리
   */
  const fn_setSortPrdcr = async function(prdcr) {

    await fn_getPrdcrs();

    if (!gfn_isEmpty(prdcr)) {
      SBUxMethod.set("dtl-inp-sortPrdcrCd", prdcr.prdcrCd);
      SBUxMethod.set("dtl-inp-sortPrdcrNm", prdcr.prdcrNm);
      SBUxMethod.attr("dtl-inp-sortPrdcrNm", "style", "background-color:aquamarine");	//skyblue

      await fn_setSortPrdcrForm(prdcr);
    }
  }

  const fn_onChangeSortSrchPrdcrIdentno = function(obj) {

    if (gfn_isEmpty(SBUxMethod.get("dtl-inp-sortPrdcrIdentno"))) {
      return;
    }

    SBUxMethod.set("dtl-inp-sortPrdcrCd", "");
    SBUxMethod.set("dtl-inp-sortPrdcrNm", "");
    SBUxMethod.attr("dtl-inp-sortPrdcrNm", "style", "");	//skyblue

    let prdcrIdentno = parseInt(SBUxMethod.get("dtl-inp-sortPrdcrIdentno")) || 0;

    if (prdcrIdentno < 1) {
      return;
    }

    const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
    if (gfn_isEmpty(prdcrInfo)) {
      return;
    }

    SBUxMethod.set("dtl-inp-sortPrdcrCd", prdcrInfo.prdcrCd);
    SBUxMethod.set("dtl-inp-sortPrdcrNm", prdcrInfo.prdcrNm);
    SBUxMethod.attr("dtl-inp-sortPrdcrNm", "style", "background-color:aquamarine");	//skyblue

    fn_setSortPrdcrForm(prdcrInfo);

  }

  /**
   * @name fn_addSort
   * @description 선별목록 추가 버튼
   */
  const fn_addSort = async function () {

    let sortYmd = SBUxMethod.get("dtl-dtp-sortYmd");     // 선별일자
    let sortFcltCd = SBUxMethod.get("dtl-slt-sortFcltCd");  // 선별설비
    let sortItemCd = SBUxMethod.get("dtl-slt-sortItemCd");			// 품목
    let sortVrtyCd = SBUxMethod.get("dtl-slt-sortVrtyCd");			// 품종
    let sortSpcfctCd = SBUxMethod.get("dtl-slt-sortSpcfctCd");  // 규격
    let sortStrgWrhusSeCd = SBUxMethod.get("dtl-slt-sortStrgWrhusSeCd"); // 저장창고
    let sortInptWrhusSeCd = SBUxMethod.get("dtl-slt-sortInptWrhusSeCd"); // 투입창고
    let sortInputQntt = Number(SBUxMethod.get("dtl-inp-sortInputQntt")); // 투입수량
    let sortInputWght = Number(SBUxMethod.get("dtl-inp-sortInputWght")); // 투입중량
    let sortGrdCd = SBUxMethod.get("dtl-slt-sortGrdCd"); // 등급
    let sortPckg = SBUxMethod.get("dtl-chk-sortPckg"); // 포장
    let spmtPckgUnitCd = SBUxMethod.get("dtl-slt-sortSpmtPckgUnitCd"); // 포장상품명
    let spmtPckgGrdCd = SBUxMethod.get("dtl-slt-sortSpmtPckgGrdCd"); // 포장상품등급
    let sortQntt = Number(SBUxMethod.get("dtl-inp-sortQntt")); // 선별수량
    let sortWght = Number(SBUxMethod.get("dtl-inp-sortWght")); // 선별중량
    let sortRmrk = SBUxMethod.get("dtl-inp-sortRmrk"); // 비고
    let sortPrdcrNm = SBUxMethod.get("dtl-inp-sortPrdcrNm"); // 생산자

    let sortPrdcrCd = SBUxMethod.get("dtl-inp-sortPrdcrCd"); // 생산자
    let sortWrhsSeCd = SBUxMethod.get("dtl-slt-sortWrhsSeCd"); // 입고구분
    let sortGdsSeCd = SBUxMethod.get("dtl-slt-sortGdsSeCd"); // 상품구분

    // console.log(gfn_getTableElement("sortStdRegTable", "dtl-"))

    let group = 0;
    let sortFcltNm;
    let sortSpcfct;
    let sortSpcfctWght;
    let sortItemNm;
    let sortVrtyNm;
    let sortStrgWrhus;
    let sortInptWrhus;
    let sortGrdNm;
    let spmtPckgUnitNm;
    let sortWrhsNm;
    let pckgChckYn = _.isEqual(sortPckg["dtl-chk-sortPckg"], true) ? "Y" : "N";
    let spmtPckgGrdNm;
    let sortGdsNm;

    let totSortWght = 0;  // 그룹별 선별중량 합

    if (gfn_isEmpty(sortYmd)) {
      gfn_comAlert("W0005", "선별일자");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (gfn_isEmpty(sortFcltCd)) {
      gfn_comAlert("W0005", "설비");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      sortFcltNm = _.find(jsonComSortFclt, {value: sortFcltCd}).text;
    }
    if (gfn_isEmpty(sortItemCd)) {
      gfn_comAlert("W0005", "품목");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      sortItemNm = _.find(jsonApcItem, {itemCd: sortItemCd}).itemNm;
    }
    if (gfn_isEmpty(sortVrtyCd)) {
      gfn_comAlert("W0005", "품종");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      sortVrtyNm = _.find(jsonApcVrty, {itemVrtyCd: sortVrtyCd}).vrtyNm;
    }
    if (sortSpcfctCd <= 0) {
      gfn_comAlert("W0005", "규격단중");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      sortSpcfct = _.find(jsonApcSpcfct, {spcfctCd: sortSpcfctCd}).spcfctNm;
      sortSpcfctWght = _.find(jsonApcSpcfct, {spcfctCd: sortSpcfctCd}).wght;
    }
    if (gfn_isEmpty(sortStrgWrhusSeCd)) {
      gfn_comAlert("W0005", "저장창고");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      sortStrgWrhus = _.find(jsonComWarehouse, {value: sortStrgWrhusSeCd}).text;
    }
    if (gfn_isEmpty(sortInptWrhusSeCd)) {
      // gfn_comAlert("W0005", "투입창고");		//	W0005	{0}이/가 없습니다.
      // return;
    } else {
      sortInptWrhus = _.find(jsonComWarehouse, {value: sortInptWrhusSeCd}).text;
    }
    /*if (sortInputQntt <= 0) {
      gfn_comAlert("W0005", "투입수량");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (sortInputWght <= 0) {
      gfn_comAlert("W0005", "투입중량");		//	W0005	{0}이/가 없습니다.
      return;
    }*/
    if (gfn_isEmpty(sortGrdCd)) {
      gfn_comAlert("W0005", "선별등급");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      sortGrdNm = _.find(jsonApcGrdDtl, {grdCd: sortGrdCd}).grdNm;
    }
    if (sortQntt <= 0) {
      gfn_comAlert("W0005", "선별수량");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (sortWght <= 0) {
      gfn_comAlert("W0005", "선별중량");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (_.isEqual(pckgChckYn, "Y")) {
      // console.log("pckgChckYn", pckgChckYn, spmtPckgUnitCd);
      if (gfn_isEmpty(spmtPckgUnitCd)) {
        gfn_comAlert("W0005", "포장 상품명");		//	W0005	{0}이/가 없습니다.
        return;
      } else {
        spmtPckgUnitNm = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: spmtPckgUnitCd}).spmtPckgUnitNm;
      }
      if (gfn_isEmpty(spmtPckgGrdCd)) {
        gfn_comAlert("W0005", "포장 상품등급");		//	W0005	{0}이/가 없습니다.
        return;
      } else {
        spmtPckgGrdNm = _.find(jsonComPckgGrdSeCd, {grdCd: spmtPckgGrdCd}).grdNm;
      }
    }
    /*if (gfn_isEmpty(sortPrdcrCd)) {
      gfn_comAlert("W0005", "생산자");		//	W0005	{0}이/가 없습니다.
      return;
    }*/
    if (sortWrhsSeCd <= 0) {
      // gfn_comAlert("W0005", "입고구분");		//	W0005	{0}이/가 없습니다.
      // return;
    } else {
      sortWrhsNm = _.find(jsonComWrhsSeCd, {value: sortWrhsSeCd}).text;
    }
    if (sortGdsSeCd <= 0) {
      // gfn_comAlert("W0005", "상품구분");		//	W0005	{0}이/가 없습니다.
      // return;
    } else {
      sortGdsNm = _.find(jsonComGdsSeCd, {value: sortGdsSeCd}).text;
    }
    /*if (gfn_isEmpty(sortInputQntt) || gfn_isEmpty(sortInputWght)) {
      sortInputQntt = '';
      sortInputWght = '';
    }*/
    if (sortInputWght > 0) {
      if (sortWght > sortInputWght) {
        gfn_comAlert("W0008", "투입중량", "선별중량");		//	W0008	{0} 보다 {1}이/가 큽니다.
        return;
      }
    }

    const sortRegInfoVO = {
      group: group,
      sortYmd: sortYmd,
      sortFclt: sortFcltNm,
      sortItemNm: sortItemNm,
      sortVrtyNm: sortVrtyNm,
      sortInputWrhus: sortInptWrhus,
      sortInputQntt: parseInt(sortInputQntt) || '',
      sortInputWght: parseInt(sortInputWght) || '',
      sortStrgWrhus: sortStrgWrhus,
      sortQntt: parseInt(sortQntt) || 0,
      sortWght: parseInt(sortWght) || 0,
      sortSpcfct: sortSpcfct,
      sortGrdNm: sortGrdNm,
      pckgChck: pckgChckYn,
      sortSpmtPckgUnitNm: spmtPckgUnitNm,
      sortSpmtPckgGrdNm: spmtPckgGrdNm,
      sortPrdcrNm: sortPrdcrNm,
      sortWrhsSeNm: sortWrhsNm,
      soirtGdsSeNm: sortGdsNm,
      sortRmrk: sortRmrk,

      sortFcltCd: sortFcltCd,
      sortItemCd: sortItemCd,
      sortVrtyCd: sortVrtyCd,
      sortInptWrhusSeCd: sortInptWrhusSeCd,
      sortStrgWrhusSeCd: sortStrgWrhusSeCd,
      sortSpcfctCd: sortSpcfctCd,
      sortGrdCd: sortGrdCd,
      sortSpmtPckgUnitCd: spmtPckgUnitCd,
      sortSpmtPckgGrdCd: spmtPckgGrdCd,
      sortPrdcrCd: sortPrdcrCd,
      sortWrhsSeCd: sortWrhsSeCd,
      sortGdsSeCd: sortGdsSeCd,

      sortSpcfctWght: parseInt(sortSpcfctWght) || 0,
    }

    if(!gfn_isEmpty(sortRegInfoVO.vrtyCd)){
      sortRegInfoVO.vrtyCd = sortRegInfoVO.vrtyCd.substring(4,8);
    }

    // group 설정 (품종/품목, 투입창고, 투입수량/중량, 생산자, 입고구분, 상품구분 동일하면 같은 그룹)
    // (품종 / 품목)
    let prvSortRegInfo = jsonSortRegList.slice(-1)[0];  // 직전 선별등록 데이터

    // const keysToCompare = ['itemCd', 'vrtyCd', 'inputWrhusSeCd', 'inputQntt', 'inputWght', 'prdcrCd', 'wrhsSeCd', 'gdsSeCd'];
    const keysToCompare = ['itemCd', 'vrtyCd', 'inputQntt', 'inputWght'];
    const prvSortData = _.pick(prvSortRegInfo, keysToCompare);
    const curSortData = _.pick(sortRegInfoVO, keysToCompare);

    if (jsonSortRegList.length == 0) {
      // 초기 group num 1
      sortRegInfoVO.group = 1;
      // 초기 group 선별중량 합
      sortRegInfoVO.totSortWght = sortRegInfoVO.sortWght;
    } else {
      if (_.isEqual(prvSortData, curSortData)) {
        // 직전값과 같으면 같은그룹
        sortRegInfoVO.group = prvSortRegInfo.group;
        // 투입그룹 선별중량 합 = 이전 까지의 합 + 현재 중량
        sortRegInfoVO.totSortWght = prvSortRegInfo.totSortWght + sortRegInfoVO.sortWght;
      } else {
        // 직전값과 다르면 group num +1
        sortRegInfoVO.group = prvSortRegInfo.group + 1;
        // 투입그룹 선별중량 합 초기화
        sortRegInfoVO.totSortWght = sortRegInfoVO.sortWght;
      }
      // 그룹별 투입중량 < 선별중량 error
      if (sortRegInfoVO.totSortWght > sortRegInfoVO.inputWght && sortRegInfoVO.inputWght > 0) {
        // gfn_comAlert("W0008", "투입량", "선별량");		// W0008	{0} 보다 {1}이/가 큽니다.
        // return;

        sortRegInfoVO.group = prvSortRegInfo.group + 1;
        sortRegInfoVO.totSortWght = sortRegInfoVO.sortWght;
      }
    }

    console.log("sortRegInfoVO", sortRegInfoVO);

    jsonSortRegList.push(sortRegInfoVO);

    grdSortRegList.refresh();


  }

  const fn_saveSortInfo = async function() {

    const sortYmd = SBUxMethod.get("dtl-dtp-sortYmd");

    const sortMngList = [];

    let sortRegData = grdSortRegList.getGridDataAll();

    if (sortRegData.length == 0) {
      gfn_comAlert("W0005", "등록대상");
      return;
    }

    // 그룹별로 조건이 많은 출하상품 먼저 재고 처리
    // 정렬 키 정의
    const sortKey = ['group', 'sortYmd', 'itemCd', 'vrtyCd', 'inputWrhusSeCd', 'prdcrCd', 'wrhsSeCd', 'gdsSeCd'];
    sortRegData = fn_sortRegData(sortRegData, sortKey);

    let sortDataGroupBy = _.groupBy(sortRegData, 'group');

    console.log("sortDataGroupBy", sortDataGroupBy);

    Object.keys(sortDataGroupBy).forEach((groupKey) => {
      let groupData = sortDataGroupBy[groupKey];
      const sortPrfmncList = [];

      groupData.forEach((sortDataVO) => {
        const stdGrdList = [];  // 선별등급
        const gdsStdGrdList = []; // 포장상품등급
        jsonApcGrdDtl.forEach((item) => {
          if (item.grdCd == sortDataVO.sortGrdCd) {
            stdGrdList.push({
              grdSeCd: _GRD_SE_CD_GDS,
              itemCd: sortDataVO.sortItemCd,
              grdKnd: item.grdKnd,
              grdCd: item.grdCd,
            })
          }
        });

        jsonComPckgGrdSeCd.forEach((item) => {
          if (item.grdCd == sortDataVO.sortSpmtPckgGrdCd) {
            gdsStdGrdList.push({
              grdSeCd: _GRD_SE_CD_GDS,
              itemCd: sortDataVO.sortItemCd,
              grdKnd: item.grdKnd,
              grdCd: item.grdCd,
            });
          }
        });

        const sortReg = {
          inptYmd: sortDataVO.sortYmd,
          fcltCd: sortDataVO.sortFcltCd,
          itemCd: sortDataVO.sortItemCd,
          vrtyCd: sortDataVO.sortVrtyCd,
          spcfctCd: sortDataVO.sortSpcfctCd,
          warehouseSeCdFrom: sortDataVO.sortInputWrhusSeCd,
          warehouseSeCd: sortDataVO.sortStrgWrhusSeCd,
          grdCd: sortDataVO.sortGrdCd,
          sortQntt: sortDataVO.sortQntt,
          sortWght: sortDataVO.sortWght,
          autoPckgInptYn: sortDataVO.pckgChck,
          prdcrCd: sortDataVO.sortPrdcrCd,
          stdGrdList: stdGrdList,
          spmtPckgUnitCd: sortDataVO.sortSpmtPckgUnitCd,
          gdsGrd: sortDataVO.sortSpmtPckgGrdCd,
          gdsStdGrdList: gdsStdGrdList,
          wrhsSeCd: sortDataVO.sortWrhsSeCd,
          gdsSeCd: sortDataVO.sortGdsSeCd,
          rmrk: sortDataVO.sortRmrk,

          inptQntt : sortDataVO.sortInputQntt,
          inptWght : sortDataVO.sortInputWght,
        }
        sortPrfmncList.push(sortReg);
      });

      const sortMng = {
        apcCd: gv_selectedApcCd,
        sortYmd: sortYmd,
        sortPrfmncList: sortPrfmncList
      }
      sortMngList.push(sortMng);
    });

    console.log("sortMngList", sortMngList);
    return;

    const postJsonPromise = gfn_postJSON("/am/sort/insertSortRsltMonthly.do", sortMngList);
    const sortData = await postJsonPromise;

    if (_.isEqual("S", sortData.resultStatus)) {
      gfn_comAlert("I0001");	// I0001	처리 되었습니다.
    } else {
      gfn_comAlert(sortData.resultCode, sortData.resultMessage);	//	E0001	오류가 발생하였습니다.
    }

  }

  const fn_view = async function() {

    let nRow = grdSortRegList.getRow();
    console.log("nRow", nRow)
    if (nRow < 2) {
      // grdSortRegList.unbind('click');
      SBUxMethod.hide("btnUpdateSort");
      SBUxMethod.show("btnAddSort");
      return;
    }

    let rowData = grdSortRegList.getRowData(nRow);

    console.log("nRow", nRow);
    console.log("jsonSortRegList", jsonSortRegList);
    console.log("jsonSortRegList", jsonSortRegList[nRow-2]);
    gfn_setTableElement("sortStdRegTable", "dtl-", jsonSortRegList[nRow-2], true);

    // $("#btnAddSort span").text("수정");
    // SBUxMethod.set("btnAddSort", '수정');
    SBUxMethod.hide("btnAddSort");
    SBUxMethod.show("btnUpdateSort");

  }

  /**
   * @name fn_updateSort
   * @description 수정 버튼
   */
  const fn_updateSort = function () {
    const nRow = grdSortRegList.getRow();

    console.log("nRow", nRow);

    const ignoreKey = ["sortInptWrhusSeCd", "sortInputQntt", "sortInputWght",
                        "sortPrdcrCd", "sortPrdcrIdentno", "sortWrhsSeCd",
                        "sortGdsSeCd", "sortRmrk", "sortSpmtPckgUnitCd", "sortSpmtPckgGrdCd"]
    const jsonUpdateSortData = gfn_getTableElement("sortStdRegTable", "dtl-", ignoreKey);

    console.log("jsonUpdateSortData", jsonUpdateSortData);

    let sortPckg = SBUxMethod.get("dtl-chk-sortPckg"); // 포장
    let spmtPckgUnitCd = SBUxMethod.get("dtl-slt-sortSpmtPckgUnitCd"); // 포장상품명
    let spmtPckgGrdCd = SBUxMethod.get("dtl-slt-sortSpmtPckgGrdCd"); // 포장상품등급
    let pckgChckYn = _.isEqual(sortPckg["dtl-chk-sortPckg"], true) ? "Y" : "N";
    if (_.isEqual(pckgChckYn, "Y")) {
      if (gfn_isEmpty(spmtPckgUnitCd)) {
        gfn_comAlert("W0005", "포장 상품명");		//	W0005	{0}이/가 없습니다.
        return;
      } else {
        spmtPckgUnitNm = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: spmtPckgUnitCd}).spmtPckgUnitNm;
      }
      if (gfn_isEmpty(spmtPckgGrdCd)) {
        gfn_comAlert("W0005", "포장 상품등급");		//	W0005	{0}이/가 없습니다.
        return;
      } else {
        spmtPckgGrdNm = _.find(jsonComPckgGrdSeCd, {grdCd: spmtPckgGrdCd}).grdNm;
      }
    }


    // return;

    jsonSortRegList[nRow-2] = jsonUpdateSortData;

    grdSortRegList.refresh();


    SBUxMethod.hide("btnUpdateSort");
    SBUxMethod.show("btnAddSort");
  }

  /**
   * @name fn_delSortRow
   * @description 행삭제 버튼
   */
  const fn_delSortRow = function () {
    const chkCol = grdSortRegList.getColRef("checkedYn");

    if (chkCol < 0) {
      return;
    }

    const rows = grdSortRegList.getCheckedRows(chkCol);
    if (rows.length < 1) {
      gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
      return;
    }

    rows.reverse().forEach((row) => {
      grdSortRegList.deleteRow(row);
    });
  }


</script>
</html>
