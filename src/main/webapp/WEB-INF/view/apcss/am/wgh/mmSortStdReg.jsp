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
                      id="dtl-slt-sortPckgUnitCd"
                      name="dtl-slt-sortPckgUnitCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonSpmtPckgUnit"
                      onchange=""
              ></sbux-select>
              <sbux-select
                      style="flex:1"
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-sortPckgGrdSeCd"
                      name="dtl-slt-sortPckgGrdSeCd"
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
    SBGridProperties.explorerbar = 'sort';
    // SBGridProperties.inputfocusscrollmove = 'true';
    // SBGridProperties.allowcopy = true;

    SBGridProperties.columns = [
      {caption: ["선택", ""],	    ref: 'checkedYn',       type:'checkbox',  width:'50px',   style:'text-align:center', typeinfo : {fixedcellcheckbox : {usemode : true, rowindex : 1, deletecaption : false}, checkedvalue : 'Y', uncheckedvalue : 'N'}, sortable: false},
      {caption: ["그룹", "그룹"],		ref: 'group',           type:'output',    width:'50px',   style:'text-align:center', sortable: true},
      {caption: ["선별일자", "선별일자"],	ref: 'sortYmd',         type:'output',    width:'100px',  style:'text-align:center'},
      {caption: ["선별설비", "선별설비"],	ref: 'sortFclt',        type:'output',    width:'100px',  style:'text-align:center', sortable: true},
      {caption: ["품목", "품목"],		ref: 'itemNm',          type:'output',    width:'80px',   style:'text-align:center', sortable: true},
      {caption: ["품종", "품종"],		ref: 'vrtyNm',          type:'output',    width:'80px',   style:'text-align:center', sortable: true},
      {caption: ["투입", "투입창고"],		ref: 'inputWrhus',    	type:'output',    width:'80px',  style:'text-align:center'},
      {caption: ["투입", "수량"],		ref: 'inputQntt',       type:'output',    width:'70px',   style:'text-align:center', sortable: true,  format : {type:'number', rule:'#,###.###'}},
      {caption: ["투입", "중량(kg)"],	ref: 'inputWght',       type:'output',    width:'70px',   style:'text-align:center', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["선별", "저장창고"],		ref: 'strgWrhus',	    type:'output',    width:'80px',  style:'text-align:center'},
      {caption: ["선별", "수량"],	    ref: 'sortQntt',        type:'output',    width:'70px',   style:'text-align:right', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["선별", "중량(kg)"],	ref: 'sortWght',        type:'output',    width:'70px',   style:'text-align:right', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["규격", "규격"],		ref: 'spcfct',          type:'output',    width:'60px',  style:'text-align:center', sortable: true},
      {caption: ["선별등급", "선별등급"],		ref: 'grdNm',           type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["포장등록", "포장"],		ref: 'pckgChck',        type:'checkbox',  width:'50px',   style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, sortable: false, disabled: true},
      {caption: ["포장등록", "상품명"],	ref: 'spmtPckgUnitNm',  type:'output',    width:'80px',   style:'text-align:center', sortable: true},
      {caption: ["포장등록", "상품등급"],	ref: 'spmtPckgGrdNm',   type:'output',    width:'60px',   style:'text-align:center', sortable: true},
      {caption: ["생산자", "생산자"],		ref: 'prdcrNm',         type:'output',    width:'60px',  style:'text-align:center', sortable: false},
      {caption: ["입고구분", "입고구분"],	ref: 'wrhsSeNm',        type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["상품구분", "상품구분"],	ref: 'gdsSeNm',         type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["비고", "비고"],		ref: 'rmrk',     	    type:'output',    width:'200px',  style:'text-align:left'},

      {caption: ["선별설비코드"], ref: 'sortFcltCd', type: 'output', hidden: true},
      {caption: ["품목코드"], ref: 'itemCd', type: 'output', hidden: true},
      {caption: ["품종코드"], ref: 'vrtyCd', type: 'output', hidden: true},
      {caption: ["투입창고코드"], ref: 'inputWrhusSeCd', type: 'output', hidden: true},
      {caption: ["저장창고코드"], ref: 'strgWrhusSeCd', type: 'output', hidden: true},
      {caption: ["규격코드"], ref: 'spcfctCd', type: 'output', hidden: true},
      {caption: ["등급코드"], ref: 'grdCd',  type: 'output', hidden: true},
      {caption: ["포장상품코드"],  ref: 'spmtPckgUnitCd',  type: 'output', hidden: true},
      {caption: ["포장상품등급코드"], ref: 'spmtPckgGrdCd',   type: 'output', hidden: true},
      {caption: ["생산자코드"],  ref: 'prdcrCd', type: 'output', hidden: true},
      {caption: ["입고구분코드"], ref: 'wrhsSeCd', type: 'output', hidden: true},
      {caption: ["상품구분코드"], ref: 'gdsSeCd', type: 'output', hidden: true},

      /*{caption: ["APC코드"], ref: 'apcCd', type: 'output', hidden: true},
      {caption: ["입고번호"], ref: 'wrhsno', type: 'output', hidden: true},
      {caption: ["운송구분코드"], ref: 'trsprtSeCd', type: 'output', hidden: true},
      {caption: ["등급코드"], ref: 'grdCd', type: 'output', hidden: true},
      {caption: ["박스종류코드"], ref: 'bxKnd', type: 'output', hidden: true},
      {caption: ["상세등급코드"], ref: 'stdGrdCd', type: 'output', hidden: true},
      {caption: ["등급유형"], ref: 'stdGrdType', type: 'output', hidden: true},
      {caption: ["처리구분"], ref: 'prcsType', type: 'output', hidden: true},*/
    ];

    grdSortRegList = _SBGrid.create(SBGridProperties);
    // grdSortRegList.bind('click', fn_view);
    
  }

  /**
   * @name fn_initSortReg
   * @description form init
   */
  const fn_initSortReg = async function() {
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
      SBUxMethod.refresh('dtl-slt-sortPckgUnitCd');
      SBUxMethod.refresh('dtl-slt-sortPckgGrdSeCd');

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
      await gfn_setSpmtPckgUnitSBSelect("dtl-slt-sortPckgUnitCd", jsonSpmtPckgUnit, gv_selectedApcCd, itemCd, vrtyCd.substring(4));
      await gfn_setApcGdsGrdSBSelect('dtl-slt-sortPckgGrdSeCd', 	jsonComPckgGrdSeCd, 	gv_selectedApcCd, itemCd, _GRD_SE_CD_GDS);	// 포장상품등급

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
    let spmtPckgUnitCd = SBUxMethod.get("dtl-slt-sortPckgUnitCd"); // 포장상품명
    let spmtPckgGrdCd = SBUxMethod.get("dtl-slt-sortPckgGrdSeCd"); // 포장상품등급
    let sortQntt = Number(SBUxMethod.get("dtl-inp-sortQntt")); // 선별수량
    let sortWght = Number(SBUxMethod.get("dtl-inp-sortWght")); // 선별중량
    let sortRmrk = SBUxMethod.get("dtl-inp-sortRmrk"); // 비고
    let sortPrdcrNm = SBUxMethod.get("dtl-inp-sortPrdcrNm"); // 생산자

    let sortPrdcrCd = SBUxMethod.get("dtl-inp-sortPrdcrCd"); // 생산자
    let sortWrhsSeCd = SBUxMethod.get("dtl-slt-sortWrhsSeCd"); // 입고구분
    let sortGdsSeCd = SBUxMethod.get("dtl-slt-sortGdsSeCd"); // 상품구분

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
    if (gfn_isEmpty(sortStrgWrhusSeCd)) {
      gfn_comAlert("W0005", "저장창고");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      sortStrgWrhus = _.find(jsonComWarehouse, {value: sortStrgWrhusSeCd}).text;
    }
    if (gfn_isEmpty(sortInptWrhusSeCd)) {
      gfn_comAlert("W0005", "투입창고");		//	W0005	{0}이/가 없습니다.
      return;
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
      gfn_comAlert("W0005", "등급");		//	W0005	{0}이/가 없습니다.
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
    if (sortSpcfctCd <= 0) {
      gfn_comAlert("W0005", "규격단중");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      sortSpcfct = _.find(jsonApcSpcfct, {spcfctCd: sortSpcfctCd}).spcfctNm;
      sortSpcfctWght = _.find(jsonApcSpcfct, {spcfctCd: sortSpcfctCd}).wght;
    }
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
      itemNm: sortItemNm,
      vrtyNm: sortVrtyNm,
      inputWrhus: sortInptWrhus,
      inputQntt: parseInt(sortInputQntt) || '',
      inputWght: parseInt(sortInputWght) || '',
      strgWrhus: sortStrgWrhus,
      sortQntt: parseInt(sortQntt) || 0,
      sortWght: parseInt(sortWght) || 0,
      spcfct: sortSpcfct,
      grdNm: sortGrdNm,
      pckgChck: pckgChckYn,
      spmtPckgUnitNm: spmtPckgUnitNm,
      spmtPckgGrdNm: spmtPckgGrdNm,
      prdcrNm: sortPrdcrNm,
      wrhsSeNm: sortWrhsNm,
      gdsSeNm: sortGdsNm,
      rmrk: sortRmrk,

      sortFcltCd: sortFcltCd,
      itemCd: sortItemCd,
      vrtyCd: sortVrtyCd,
      inputWrhusSeCd: sortInptWrhusSeCd,
      strgWrhusSeCd: sortStrgWrhusSeCd,
      spcfctCd: sortSpcfctCd,
      grdCd: sortGrdCd,
      spmtPckgUnitCd: spmtPckgUnitCd,
      spmtPckgGrdCd: spmtPckgGrdCd,
      prdcrCd: sortPrdcrCd,
      wrhsSeCd: sortWrhsSeCd,
      gdsSeCd: sortGdsSeCd,

      spcfctWght: parseInt(sortSpcfctWght) || 0,
      // sortQntt: parseInt(sortQntt) || 0,
      // sortWght: parseInt(sortWght) || 0,

      // totSortWght: totSortWght,
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

    jsonSortRegList.push(sortRegInfoVO);

    grdSortRegList.refresh();


  }

  const fn_saveSortInfo = async function() {

    const sortYmd = SBUxMethod.get("dtl-dtp-sortYmd");

    // const sortPrfmncList = [];
    const sortMngList = [];

    let groupChck = 1;  // 그룹번호 체크

    let sortRegData = grdSortRegList.getGridDataAll();

    // 그룹별로 조건이 많은 출하상품 먼저 재고 처리
    // 정렬 키 정의
    const sortKey = ['group', 'sortYmd', 'itemCd', 'vrtyCd', 'inputWrhusSeCd', 'prdcrCd', 'wrhsSeCd', 'gdsSeCd'];
    sortRegData = fn_sortRegData(sortRegData, sortKey);

    let sortDataGroupBy = _.groupBy(sortRegData, 'group');

    Object.keys(sortDataGroupBy).forEach((groupKey) => {
      let groupItems = sortDataGroupBy[groupKey];
      const sortPrfmncList = [];

      groupItems.forEach((sortDataVO) => {
        const stdGrdList = [];  // 선별등급
        const gdsStdGrdList = []; // 포장상품등급
        jsonApcGrdDtl.forEach((item) => {
          if (item.grdCd == sortDataVO.grdCd) {
            stdGrdList.push({
              grdSeCd: _GRD_SE_CD_GDS,
              itemCd: sortDataVO.itemCd,
              grdKnd: item.grdKnd,
              grdCd: item.grdCd,
            })
          }
        });

        jsonComPckgGrdSeCd.forEach((item) => {
          if (item.grdCd == sortDataVO.spmtPckgGrdCd) {
            gdsStdGrdList.push({
              grdSeCd: _GRD_SE_CD_GDS,
              itemCd: sortDataVO.itemCd,
              grdKnd: item.grdKnd,
              grdCd: item.grdCd,
            });
          }
        });

        const sortReg = {
          inptYmd: sortDataVO.sortYmd,
          fcltCd: sortDataVO.sortFcltCd,
          itemCd: sortDataVO.itemCd,
          vrtyCd: sortDataVO.vrtyCd,
          spcfctCd: sortDataVO.spcfctCd,
          warehouseSeCdFrom: sortDataVO.inputWrhusSeCd,
          warehouseSeCd: sortDataVO.strgWrhusSeCd,
          grdCd: sortDataVO.grdCd,
          sortQntt: sortDataVO.sortQntt,
          sortWght: sortDataVO.sortWght,
          autoPckgInptYn: sortDataVO.pckgChck,
          prdcrCd: sortDataVO.prdcrCd,
          stdGrdList: stdGrdList,
          spmtPckgUnitCd: sortDataVO.spmtPckgUnitCd,
          gdsGrd: sortDataVO.spmtPckgGrdCd,
          gdsStdGrdList: gdsStdGrdList,
          wrhsSeCd: sortDataVO.wrhsSeCd,
          gdsSeCd: sortDataVO.gdsSeCd,
          rmrk: sortDataVO.rmrk,

          inptQntt : sortDataVO.inputQntt,
          inptWght : sortDataVO.inputWght,
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
    // return;

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
    if (nRow < 1) {
      return;
    }

    // let prvWrhsno = SBUxMethod.get("dtl-inp-wrhsno");
    //
    let rowData = grdSortRegList.getRowData(nRow);
    //
    // if (_.isEqual(prvWrhsno, rowData.wrhsno)) {
    //   return;
    // }

    // 입고번호
    SBUxMethod.set("dtl-dtp-sortYmd", rowData.sortYmd);     // 선별일자
    SBUxMethod.set("dtl-slt-sortFcltCd", rowData.sortFclt);  // 선별설비
    // SBUxMethod.set("dtl-slt-sortItemCd", rowData.itemCd);			// 품목
    // SBUxMethod.set("dtl-slt-sortVrtyCd", rowData.vrtyCd);			// 품종
    SBUxMethod.set("dtl-slt-sortSpcfctCd", rowData.spcfctCd);  // 규격
    SBUxMethod.set("dtl-slt-sortStrgWrhusSeCd", rowData.strgWrhusSeCd); // 저장창고
    SBUxMethod.set("dtl-slt-sortInptWrhusSeCd", rowData.inputWrhusSeCd); // 투입창고
    SBUxMethod.set("dtl-inp-sortInputQntt", rowData.inputQntt); // 투입수량
    SBUxMethod.set("dtl-inp-sortInputWght", rowData.inputWght); // 투입중량
    SBUxMethod.set("dtl-slt-sortGrdCd", rowData.grdCd); // 등급
    SBUxMethod.set("dtl-chk-sortPckg", rowData.pckgChck); // 포장
    SBUxMethod.set("dtl-slt-sortPckgUnitCd", rowData.spmtPckgUnitCd); // 포장상품명
    SBUxMethod.set("dtl-slt-sortPckgGrdSeCd", rowData.spmtPckgGrdCd); // 포장상품등급
    SBUxMethod.set("dtl-inp-sortQntt", rowData.sortQntt); // 선별수량
    SBUxMethod.set("dtl-inp-sortWght", rowData.sortWght); // 선별중량
    SBUxMethod.set("dtl-inp-sortRmrk", rowData.rmrk); // 비고
    SBUxMethod.set("dtl-inp-sortPrdcrNm", rowData.prdcrNm); // 생산자

    SBUxMethod.set("dtl-inp-sortPrdcrCd", rowData.prdcrCd); // 생산자
    SBUxMethod.set("dtl-slt-sortWrhsSeCd", rowData.wrhsSeCd); // 입고구분
    SBUxMethod.set("dtl-slt-sortGdsSeCd", rowData.gdsSeCd); // 상품구분



    // 품목/품종
    await fn_onChangeSortSrchVrtyCd({value: rowData.itemCd + rowData.vrtyCd});

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
