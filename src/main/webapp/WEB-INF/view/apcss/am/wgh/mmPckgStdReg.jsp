<%
  /**
   * @Class Name : mmPckgStdReg.jsp
   * @Description : 원물입고등록 - 포장등록 화면
   * @author SI개발부
   * @since 2025.04.25
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2025.04.25   	김은총			최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title : 포장등록</title>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start; padding: 10px 15px 5px;" >
      <div style="margin-left: auto;">
        <sbux-button id="btnResetPckg" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" text="초기화" onclick="fn_reset('pckgStdRegTable')"></sbux-button>
        <sbux-button id="btnAddPckg" name="btnAdd" uitype="normal" class="btn btn-sm btn-outline-danger" text="추가" onclick="fn_addPckg"></sbux-button>
      </div>
    </div>
    <div class="box-body">
      <%--생산자 코드--%>
      <sbux-input id="dtl-inp-pckgPrdcrCd" name="dtl-inp-pckgPrdcrCd" uitype="hidden"></sbux-input>
      <table id="pckgStdRegTable" class="table table-bordered tbl_fixed">
        <caption>포장 등록 조건 설정</caption>
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
          <th scope="row" class="th_bg"><span class="data_required"></span>포장일자</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-datepicker uitype="popup" id="dtl-dtp-pckgYmd" name="dtl-dtp-pckgYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"></sbux-datepicker>
            </div>
          </td>
          <th scope="row" class="th_bg"><span class="data_required"></span>포장설비</th>
          <td class="td_input" style="border-right: hidden">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-pckgFcltCd"
                      name="dtl-slt-pckgFcltCd"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      jsondata-ref="jsonComPckgFclt"
              ></sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg"><span class="data_required"></span>품목/품종</th>
          <td class="td_input">
            <div class="displayFlex">
              <div>
                <sbux-select
                        unselected-text="전체"
                        uitype="single"
                        id="dtl-slt-pckgItemCd"
                        name="dtl-slt-pckgItemCd"
                        class="form-control input-sm input-sm-ast"
                        jsondata-ref="jsonApcItem"
                        onchange="fn_onChangePckgSrchItemCd(this)">
                </sbux-select>
              </div>
              <div>
                <sbux-select
                        unselected-text="선택"
                        uitype="single"
                        id="dtl-slt-pckgVrtyCd"
                        name="dtl-slt-pckgVrtyCd"
                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                        jsondata-ref="jsonApcVrty"
                        jsondata-value="itemVrtyCd"
                        onchange="fn_onChangePckgSrchVrtyCd(this)">
                </sbux-select>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg"><span class="data_required"></span>상품명</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-pckgUnitCd"
                      name="dtl-slt-pckgUnitCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonSpmtPckgUnit"
                      onchange="fn_onChangePckgQntt(this)">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg"><span class="data_required"></span>저장창고</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-pckgStrgWrhusSeCd"
                      name="dtl-slt-pckgStrgWrhusSeCd"
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
                      id="dtl-slt-pckgInputWrhusSeCd"
                      name="dtl-slt-pckgInputWrhusSeCd"
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
                      id="dtl-inp-pckgInputQntt"
                      name="dtl-inp-pckgInputQntt"
                      class="form-control input-sm input-sm-ast"
                      autocomplete="off"
                      mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange="fn_onChangePckgInptQntt(this)"
              ></sbux-input>
              <sbux-input
                      uitype="text"
                      id="dtl-inp-pckgInputWght"
                      name="dtl-inp-pckgInputWght"
                      class="form-control input-sm"
                      autocomplete="off"
                      mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
              <sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"></sbux-label>
            </div>
          </td>
          <th scope="row" class="th_bg"><span class="data_required"></span>상품등급</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-pckgGrdSeCd"
                      name="dtl-slt-pckgGrdSeCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonComPckgGrdSeCd"
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <%--<th scope="row" class="th_bg"><span class="data_required"></span>선별등급</th>
          <td class="td_input">
            <div class="displayFlex" style="gap:20px">
              <sbux-select
                      style="flex:1"
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-pckgSortGrdCd"
                      name="dtl-slt-pckgStdGrdCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange=""
              ></sbux-select>
            </div>
          </td>--%>
          <th scope="row" class="th_bg">표준등급</th>
          <td class="td_input">
            <div class="displayFlex" style="gap:20px">
              <sbux-checkbox
                      style="flex: 0"
                      id="dtl-chk-stdGrdChck"
                      name="dtl-chk-stdGrdChck"
                      uitype="normal"
                      text="사용"
              ></sbux-checkbox>
              <sbux-select
                      style="flex:1"
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-pckgStdGrdSeCd"
                      name="dtl-slt-pckgStdGrdSeCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
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
                      id="dtl-inp-pckgQntt"
                      name="dtl-inp-pckgQntt"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      autocomplete="off"
                      mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange="fn_onChangePckgQntt(this)"
              ></sbux-input>
              <sbux-input
                      uitype="text"
                      id="dtl-inp-pckgWght"
                      name="dtl-inp-pckgWght"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      autocomplete="off"
                      mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
              <sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"></sbux-label>
            </div>
          </td>
          <th scope="row" class="th_bg"><span class="data_required"></span>규격</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="dtl-slt-pckgSpcfctCd"
                      name="dtl-slt-pckgSpcfctCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonApcSpcfct"
                      onchange="fn_onChangePckgInptQntt()">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">비고</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-input
                      style="flex-grow: 1"
                      uitype="text"
                      id="dtl-inp-pckgRmrk"
                      name="dtl-inp-pckgRmrk"
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
                        id="dtl-inp-pckgPrdcrNm"
                        name="dtl-inp-pckgPrdcrNm"
                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                        placeholder="초성검색 가능"
                        autocomplete-ref="jsonPrdcrAutocomplete"
                        autocomplete-text="name"
                        autocomplete-height="270px"
                        oninput="fn_OnInputPckgPrdcrNm(event)"
                        autocomplete-select-callback="fn_onSelectPckgPrdcrNm"
                ></sbux-input>
              </div>
              <div style="flex: 1 0 8em">
                <sbux-input
                        uitype="text"
                        id="dtl-inp-pckgPrdcrIdentno"
                        name="dtl-inp-pckgPrdcrIdentno"
                        class="form-control input-sm"
                        maxlength="2"
                        autocomplete="off"
                        onchange="fn_onChangePckgSrchPrdcrIdentno(this)"
                ></sbux-input>
              </div>
              <div style="flex: 0">
                <sbux-button
                        id="btn-dtl-pckgPrdcr"
                        name="btn-dtl-pckgPrdcr"
                        class="btn btn-xs btn-outline-dark"
                        text="찾기" uitype="modal"
                        target-id="modal-prdcr"
                        onclick="fn_pckgChoicePrdcr"
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
                      id="dtl-slt-pckgWrhsSeCd"
                      name="dtl-slt-pckgWrhsSeCd"
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
                      id="dtl-slt-pckgGdsSeCd"
                      name="dtl-slt-pckgGdsSeCd"
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
            <span>포장 등록 목록</span>
          </li>
        </ul>
        <div class="ad_tbl_toplist">
          <sbux-button id="btnPckgDel" name="btnPckgDel" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger"
                       onclick="fn_delPckgRow"
                       style="margin-right:5px"
                       image-src="/resource/svg/grdMinus.svg"
                       image-style="width:3rem;height:20px"
                       image-placement="front"
          ></sbux-button>
        </div>
      </div>
      <div class="table-responsive tbl_scroll_sm">
        <div id="sb-area-grdPckgRegList" style="height: 430px"></div>
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
<script type="text/javascript">

  /* SB Select */
  var jsonComPckgFclt = []; // 포장설비   PCKG_FCLT_CD

  /* Grid 생성 */
  var grdPckgRegList;
  var jsonPckgRegList = [];

  /*window.addEventListener('DOMContentLoaded', async function(e) {
    fn_initPckgReg();
    fn_createGridPckgReg();
  });*/

  /**
   * @name fn_createGridPckgReg
   * @description 입고등록목록 그리드 생성
   */
  const fn_createGridPckgReg = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdPckgRegList';
    SBGridProperties.id = 'grdPckgRegList';
    SBGridProperties.jsonref = 'jsonPckgRegList';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.extendlastcol = 'none';
    // SBGridProperties.allowcopy = true;

    SBGridProperties.columns = [
      {caption: ["선택", ""],	    ref: 'checkedYn',       type:'checkbox',  width:'50px',   style:'text-align:center', typeinfo : {fixedcellcheckbox : {usemode : true, rowindex : 1, deletecaption : false}, checkedvalue : 'Y', uncheckedvalue : 'N'}, sortable: false},
      {caption: ["그룹", "그룹"],		ref: 'group',           type:'output',    width:'50px',   style:'text-align:center', sortable: true},
      {caption: ["포장일자", "포장일자"],	ref: 'pckgYmd',         type:'output',    width:'100px',  style:'text-align:center'},
      {caption: ["포장설비", "포장설비"],	ref: 'pckgFcltNm',        type:'output',    width:'100px',  style:'text-align:center', sortable: true},
      {caption: ["품목", "품목"],		ref: 'itemNm',          type:'output',    width:'80px',   style:'text-align:center', sortable: true},
      {caption: ["품종", "품종"],		ref: 'vrtyNm',          type:'output',    width:'80px',   style:'text-align:center', sortable: true},
      // {caption: ["선별등급", "선별등급"],		ref: 'sortGrdNm',      type:'ouptput',  width:'60px',   style:'text-align:center', sortable: false},
      {caption: ["투입", "투입창고"],		ref: 'inputWrhus',    	type:'output',    width:'80px',  style:'text-align:center'},
      {caption: ["투입", "수량"],		ref: 'pckgInputQntt',       type:'output',    width:'70px',   style:'text-align:center', sortable: true,  format : {type:'number', rule:'#,###.###'}},
      {caption: ["투입", "중량(kg)"],	ref: 'pckgInputWght',       type:'output',    width:'70px',   style:'text-align:center', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["포장", "저장창고"],		ref: 'strgWrhus',	    type:'output',    width:'80px',  style:'text-align:center'},
      {caption: ["포장", "수량"],	    ref: 'pckgQntt',        type:'output',    width:'70px',   style:'text-align:right', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["포장", "중량(kg)"],	ref: 'pckgWght',        type:'output',    width:'70px',   style:'text-align:right', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["규격", "규격"],		ref: 'spcfct',          type:'output',    width:'60px',  style:'text-align:center', sortable: true},
      {caption: ["상품명", "상품명"],	    ref: 'pckgUnitNm',  type:'output',    width:'80px',   style:'text-align:center', sortable: true},
      {caption: ["상품등급", "상품등급"],	ref: 'pckgGrdNm',           type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["표준등급", "사용"],		ref: 'stdGrdChck',      type:'checkbox',  width:'50px',   style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, sortable: false, disabled: true},
      {caption: ["표준등급", "등급"],	    ref: 'stdGrdNm',        type:'output',    width:'60px',   style:'text-align:center', sortable: true},
      {caption: ["생산자", "생산자"],		ref: 'prdcrNm',         type:'output',    width:'60px',  style:'text-align:center', sortable: false},
      {caption: ["입고구분", "입고구분"],	ref: 'wrhsSeNm',        type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["상품구분", "상품구분"],	ref: 'gdsSeNm',         type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["비고", "비고"],		ref: 'rmrk',     	    type:'output',    width:'200px',  style:'text-align:left'},

      {caption: ["포장설비코드"], ref: 'pckgFcltCd', type: 'output', hidden: true},
      {caption: ["품목코드"], ref: 'itemCd', type: 'output', hidden: true},
      {caption: ["품종코드"], ref: 'vrtyCd', type: 'output', hidden: true},
      {caption: ["투입창고코드"], ref: 'inputWrhusSeCd', type: 'output', hidden: true},
      {caption: ["저장창고코드"], ref: 'strgWrhusSeCd', type: 'output', hidden: true},
      {caption: ["규격코드"], ref: 'spcfctCd', type: 'output', hidden: true},
      {caption: ["상품코드"], ref: 'pckgUnitCd',  type: 'output', hidden: true},
      {caption: ["상품등급코드"], ref: 'pckgGrdSeCd',   type: 'output', hidden: true},
      // {caption: ["선별등급코드"], ref: 'sortGrdCd',  type: 'output', hidden: true},
      {caption: ["표준등급코드"], ref: 'stdGrdSeCd',  type: 'output', hidden: true},
      {caption: ["생산자코드"],  ref: 'prdcrCd', type: 'output', hidden: true},
      {caption: ["입고구분코드"], ref: 'wrhsSeCd', type: 'output', hidden: true},
      {caption: ["상품구분코드"], ref: 'gdsSeCd', type: 'output', hidden: true},
    ];

    grdPckgRegList = _SBGrid.create(SBGridProperties);
    // grdPckgRegList.bind('click', fn_view);
  }

  /**
   * @name fn_initPckgReg
   * @description form init
   */
  const fn_initPckgReg = async function() {
    SBUxMethod.set("dtl-dtp-pckgYmd", gfn_dateToYmd(new Date()));
    fn_createGridPckgReg();

    let result = await Promise.all([
      fn_initPckgSBSelect(),
    ]);

    // fn_clearForm();
  }

  const fn_initPckgSBSelect = async function() {
    // 검색 SB select
    let result = await Promise.all([
      gfn_setApcItemSBSelect('dtl-slt-pckgItemCd',       jsonApcItem, gv_selectedApcCd),		// 품목
      gfn_setApcVrtySBSelect('dtl-slt-pckgVrtyCd',       jsonApcVrty, gv_selectedApcCd),		// 품종
      gfn_setComCdSBSelect('dtl-slt-pckgFcltCd',         jsonComPckgFclt, 'PCKG_FCLT_CD', gv_selectedApcCd),		// 설비
      gfn_setComCdSBSelect('dtl-slt-pckgStrgWrhusSeCd',  jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 저장창고
      gfn_setComCdSBSelect('dtl-slt-pckgInputWrhusSeCd',  jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 투입창고
      gfn_setComCdSBSelect('dtl-slt-pckgWrhsSeCd',       jsonComWrhsSeCd, 	'WRHS_SE_CD'),							// 입고구분
      gfn_setComCdSBSelect('dtl-slt-pckgGdsSeCd',        jsonComGdsSeCd, 	'GDS_SE_CD', gv_selectedApcCd),							// 상품구분
      // gfn_setApcSpcfctsSBSelect('dtl-slt-pckgSpcfctCd', 		jsonApcSpcfct,  gv_selectedApcCd),						// 규격(엑셀)
    ]);
  }

  /**
   * @name fn_clearPckgPrdcr
   * @description 생산자 폼 clear
   */
  const fn_clearPckgPrdcr = function() {
    SBUxMethod.set("dtl-inp-pckgPrdcrCd", "");
    SBUxMethod.set("dtl-inp-pckgPrdcrIdentno", "");
    SBUxMethod.attr("dtl-inp-pckgPrdcrNm", "style", "background-color:''");
  }

  /**
   * @name fn_OnInputPckgPrdcrNm
   * @description 생산자명 입력 시 event : autocomplete
   */
  const fn_OnInputPckgPrdcrNm = function(prdcrNm){
    fn_clearPckgPrdcr();
    if(getByteLengthOfString(prdcrNm.target.value) > 100){
      SBUxMethod.set("dtl-inp-pckgPrdcrNm", "");
      return;
    }
    jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);

    SBUxMethod.changeAutocompleteData('dtl-inp-pckgPrdcrNm', true);
  }

  /**
   * @name fn_onSelectPckgPrdcrNm
   * @description 생산자 autocomplete 선택 callback
   */
  function fn_onSelectPckgPrdcrNm(value, label, item) {
    // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
    if (jsonPrdcr.filter(e => e.prdcrNm === label).length > 1) {
      document.getElementById('btn-dtl-pckgPrdcr').click();
    } else {
      SBUxMethod.set("dtl-inp-pckgPrdcrCd", value);
      SBUxMethod.attr("dtl-inp-pckgPrdcrNm", "style", "background-color:aquamarine");	//skyblue
      let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
      prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;

      fn_setPckgPrdcrForm(prdcr);
    }
  }

  /**
   * @name fn_pckgChoicePrdcr
   * @description 생산자 선택 popup 호출
   */
  const fn_pckgChoicePrdcr = function() {
    popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPckgPrdcr, SBUxMethod.get("dtl-inp-pckgPrdcrNm"));
  }

  /**
   * @name fn_setPckgPrdcr
   * @description 생산자 선택 popup callback 처리
   */
  const fn_setPckgPrdcr = async function(prdcr) {

    await fn_getPrdcrs();

    if (!gfn_isEmpty(prdcr)) {
      SBUxMethod.set("dtl-inp-pckgPrdcrCd", prdcr.prdcrCd);
      SBUxMethod.set("dtl-inp-pckgPrdcrNm", prdcr.prdcrNm);
      SBUxMethod.attr("dtl-inp-pckgPrdcrNm", "style", "background-color:aquamarine");	//skyblue

      await fn_setPckgPrdcrForm(prdcr);
    }
  }

  const fn_onChangePckgSrchPrdcrIdentno = function(obj) {

    if (gfn_isEmpty(SBUxMethod.get("dtl-inp-pckgPrdcrIdentno"))) {
      return;
    }

    SBUxMethod.set("dtl-inp-pckgPrdcrCd", "");
    SBUxMethod.set("dtl-inp-pckgPrdcrNm", "");
    SBUxMethod.attr("dtl-inp-pckgPrdcrNm", "style", "");	//skyblue

    let prdcrIdentno = parseInt(SBUxMethod.get("dtl-inp-pckgPrdcrIdentno")) || 0;

    if (prdcrIdentno < 1) {
      return;
    }

    const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
    if (gfn_isEmpty(prdcrInfo)) {
      return;
    }

    SBUxMethod.set("dtl-inp-pckgPrdcrCd", prdcrInfo.prdcrCd);
    SBUxMethod.set("dtl-inp-pckgPrdcrNm", prdcrInfo.prdcrNm);
    SBUxMethod.attr("dtl-inp-pckgPrdcrNm", "style", "background-color:aquamarine");	//skyblue

    fn_setPckgPrdcrForm(prdcrInfo);

  }

  const fn_setPckgPrdcrForm = async function(prdcr) {

    /*if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
      await gfn_setApcVrtySBSelect('dtl-slt-pckgVrtyCd', jsonApcVrty, gv_selectedApcCd);
      SBUxMethod.set("dtl-slt-pckgVrtyCd", prdcr.rprsItemCd + prdcr.rprsVrtyCd);
      fn_onChangePckgSrchVrtyCd({value : prdcr.rprsItemCd + prdcr.rprsVrtyCd});
    } else {
      if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
        const prvItemCd = SBUxMethod.get("dtl-slt-pckgItemCd");

        if (prvItemCd != prdcr.rprsItemCd) {
          SBUxMethod.set("dtl-slt-pckgItemCd", prdcr.rprsItemCd);
          fn_onChangePckgSrchItemCd({value:prdcr.rprsItemCd});
        }
      }
    }*/
    if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
      SBUxMethod.set("dtl-inp-pckgPrdcrIdentno", prdcr.prdcrIdentno);
    } else {
      SBUxMethod.set("dtl-inp-pckgPrdcrIdentno", "");
    }

  }

  /**
   * @name fn_onChangePckgSrchItemCd
   * @description 품목 선택 변경 event
   */
  const fn_onChangePckgSrchItemCd = async function(obj) {
    let itemCd = obj.value;
    const itemInfo = _.find(jsonApcItem, {value: itemCd});

    jsonApcGrdDtl.length = 0;
    jsonSpmtPckgUnit.length = 0;
    jsonComPckgGrdSeCd.length = 0;

    if (gfn_isEmpty(itemCd)) {
      let result = await Promise.all([
        gfn_setApcItemSBSelect('dtl-slt-pckgItemCd',       jsonApcItem, gv_selectedApcCd),		// 품목
        gfn_setApcSpcfctsSBSelect('dtl-slt-pckgSpcfctCd',	jsonApcSpcfct, 	""),  // 규격
        gfn_setApcVrtySBSelect('dtl-slt-pckgVrtyCd', 		jsonApcVrty, 	gv_selectedApcCd),			// 품종

        SBUxMethod.refresh('dtl-slt-pckgStdGrdSeCd'),
        // SBUxMethod.refresh('dtl-slt-pckgSortGrdCd'),
        SBUxMethod.refresh('dtl-slt-pckgUnitCd'),
        SBUxMethod.refresh('dtl-slt-pckgGrdSeCd'),
      ])

    } else {
      let result = await Promise.all([
        gfn_setApcSpcfctsSBSelect('dtl-slt-pckgSpcfctCd',	jsonApcSpcfct, 	gv_selectedApcCd, itemCd),			// 규격
        // gfn_setApcGdsGrdSBSelect('dtl-slt-pckgSortGrdCd', 	jsonApcGrdDtl, 	gv_selectedApcCd, itemCd, _GRD_SE_CD_SORT),	// 등급상세
        gfn_setApcGdsGrdSBSelect('dtl-slt-pckgStdGrdSeCd', 	jsonApcGrdDtl, 	gv_selectedApcCd, itemCd, _GRD_SE_CD_GDS),	// 등급상세
        gfn_setApcVrtySBSelect('dtl-slt-pckgVrtyCd', 		jsonApcVrty, 	gv_selectedApcCd, itemCd),			// 품종
      ]);
    }
  }

  /**
   * @name fn_onChangePckgSrchVrtyCd
   * @description 품종 선택 변경 event
   */
  const fn_onChangePckgSrchVrtyCd = async function(obj) {
    let vrtyCd = obj.value;

    if(!gfn_isEmpty(vrtyCd)){
      const itemCd = vrtyCd.substring(0,4);

      SBUxMethod.set("dtl-slt-pckgItemCd", itemCd);
      await fn_onChangePckgSrchItemCd({value: itemCd});
      SBUxMethod.set("dtl-slt-pckgVrtyCd", vrtyCd);
      await gfn_setSpmtPckgUnitSBSelect("dtl-slt-pckgUnitCd", jsonSpmtPckgUnit, gv_selectedApcCd, itemCd, vrtyCd.substring(4));  // 상품명
      await gfn_setApcGdsGrdSBSelect('dtl-slt-pckgGrdSeCd', 	jsonComPckgGrdSeCd, 	gv_selectedApcCd, itemCd, _GRD_SE_CD_GDS);	// 포장상품등급

    } else {
      await fn_onChangePckgSrchItemCd({value: null});
    }
    // fn_onChangeInputQntt();
  }

  /**
   * @name fn_onChangePckgInptQntt
   * @description 투입수량 변경 event
   */
  const fn_onChangePckgInptQntt = function(obj) {
    let inputQntt = parseInt(SBUxMethod.get("dtl-inp-pckgInputQntt")) || 0;
    let vrtyCd = SBUxMethod.get("dtl-slt-pckgVrtyCd");			// 품종
    let pckgSpcfctCd = SBUxMethod.get("dtl-slt-pckgSpcfctCd");	// 규격
    let pckgSpcfctWght = _.find(jsonApcSpcfct, {spcfctCd: pckgSpcfctCd}).wght;

    // console.log("pckgSpcfctCd", pckgSpcfctCd, "pckgSpcfctWght", pckgSpcfctWght);

    /*let vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd.substring(4,8)});
    if (!gfn_isEmpty(vrtyInfo)) {
      const unitWght = parseFloat(vrtyInfo.unitWght) || 0;
      let inputWght = Math.round(inputQntt * unitWght);

      SBUxMethod.set("dtl-inp-pckgInputWght", inputWght);
    }*/
    if (pckgSpcfctWght > 0) {
      let inputWght = gfn_apcEstmtWght(inputQntt * pckgSpcfctWght, gv_selectedApcCd);
      SBUxMethod.set("dtl-inp-pckgInputWght", inputWght);
    }
    else {
      SBUxMethod.set("dtl-inp-pckgInputWght", "");
    }

  }

  /**
   * @name fn_onChangePckgQntt
   * @description 선별수량 변경 event
   */
  const fn_onChangePckgQntt = function (obj) {
    let sortQntt = parseInt(SBUxMethod.get("dtl-inp-pckgQntt")) || 0;
    let pckgUnitCd = SBUxMethod.get("dtl-slt-pckgUnitCd");

    if (!gfn_isEmpty(pckgUnitCd)) {
      const spcfctWght = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: pckgUnitCd}).spcfctWght;

      if (spcfctWght > 0) {
        let pckgWght = gfn_apcEstmtWght(sortQntt * spcfctWght, gv_selectedApcCd);
        SBUxMethod.set("dtl-inp-pckgWght", pckgWght);
      }
    } else {
      SBUxMethod.set("dtl-inp-pckgWght", "");
    }
  }


  /**
   * @name fn_addPckg
   * @description 선별목록 추가 버튼
   */
  const fn_addPckg = async function () {

    let pckgYmd = SBUxMethod.get("dtl-dtp-pckgYmd");                         // 선별일자
    let pckgFcltCd = SBUxMethod.get("dtl-slt-pckgFcltCd");                   // 선별설비
    let pckgItemCd = SBUxMethod.get("dtl-slt-pckgItemCd");			          // 품목
    let pckgVrtyCd = SBUxMethod.get("dtl-slt-pckgVrtyCd");                   // 품종
    let pckgUnitCd = SBUxMethod.get("dtl-slt-pckgUnitCd");                   // 상품명
    let pckgStrgWrhusSeCd = SBUxMethod.get("dtl-slt-pckgStrgWrhusSeCd");     // 저장창고
    let pckgInputWrhusSeCd = SBUxMethod.get("dtl-slt-pckgInputWrhusSeCd");   // 투입창고
    let pckgInputQntt = Number(SBUxMethod.get("dtl-inp-pckgInputQntt"));     // 투입수량
    let pckgInputWght = Number(SBUxMethod.get("dtl-inp-pckgInputWght"));     // 투입중량
    let pckgGrdSeCd = SBUxMethod.get("dtl-slt-pckgGrdSeCd");                 // 상품등급
    // let pckgSortGrdCd = SBUxMethod.get("dtl-slt-pckgSortGrdCd");           // 선별등급
    let stdGrdChck = SBUxMethod.get("dtl-chk-stdGrdChck");                   // 표준등급 사용 여부
    let pckgStdGrdSeCd = SBUxMethod.get("dtl-slt-pckgStdGrdSeCd");           // 표준등급
    let pckgQntt = Number(SBUxMethod.get("dtl-inp-pckgQntt"));       // 선별수량
    let pckgWght = Number(SBUxMethod.get("dtl-inp-pckgWght"));       // 선별중량
    let pckgSpcfctCd = SBUxMethod.get("dtl-slt-pckgSpcfctCd");               // 규격
    let pckgRmrk = SBUxMethod.get("dtl-inp-pckgRmrk");                       // 비고
    let pckgPrdcrNm = SBUxMethod.get("dtl-inp-pckgPrdcrNm");                 // 생산자

    let pckgPrdcrCd = SBUxMethod.get("dtl-inp-pckgPrdcrCd");                 // 생산자
    let pckgWrhsSeCd = SBUxMethod.get("dtl-slt-pckgWrhsSeCd");               // 입고구분
    let pckgGdsSeCd = SBUxMethod.get("dtl-slt-pckgGdsSeCd");                 // 상품구분

    let group = 0;
    let pckgFcltNm; // 포장설비
    let pckgItemNm; // 품목
    let pckgVrtyNm; // 품종
    let pckgInputWrhus; // 투입창고
    let pckgStrgWrhus;  // 저장창고
    let pckgSpcfct; // 규격
    let pckgSpcfctWght; // 규격단중
    let pckgUnitNm; // 상품명
    let pckgGrdNm;  // 상품등급
    // let pckgSortGrdNm; // 선별등급
    let stdGrdChckYn = _.isEqual(stdGrdChck["dtl-chk-stdGrdChck"], true) ? "Y" : "N";  // 표준등급 사용 여부
    let stdGrdNm; // 표준등급
    let pckgWrhsNm; // 입고구분
    let pckgGdsNm;  // 상품구분

    let totSortWght = 0;  // 그룹별 선별중량 합

    if (gfn_isEmpty(pckgYmd)) {
      gfn_comAlert("W0005", "선별일자");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (gfn_isEmpty(pckgFcltCd)) {
      gfn_comAlert("W0005", "설비");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      pckgFcltNm = _.find(jsonComPckgFclt, {value: pckgFcltCd}).text;
    }
    if (gfn_isEmpty(pckgItemCd)) {
      gfn_comAlert("W0005", "품목");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
        pckgItemNm = _.find(jsonApcItem, {itemCd: pckgItemCd}).itemNm;
    }
    if (gfn_isEmpty(pckgVrtyCd)) {
      gfn_comAlert("W0005", "품종");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
        pckgVrtyNm = _.find(jsonApcVrty, {itemVrtyCd: pckgVrtyCd}).vrtyNm;
    }
    if (gfn_isEmpty(pckgUnitCd)) {
      gfn_comAlert("W0005", "포장 상품명");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
        pckgUnitNm = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: pckgUnitCd}).spmtPckgUnitNm;
    }
    if (gfn_isEmpty(pckgStrgWrhusSeCd)) {
      gfn_comAlert("W0005", "저장창고");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      pckgStrgWrhus = _.find(jsonComWarehouse, {value: pckgStrgWrhusSeCd}).text;
    }
    if (gfn_isEmpty(pckgInputWrhusSeCd)) {
      // gfn_comAlert("W0005", "투입창고");		//	W0005	{0}이/가 없습니다.
      // return;
    } else {
      pckgInputWrhus = _.find(jsonComWarehouse, {value: pckgInputWrhusSeCd}).text;
    }
    if (gfn_isEmpty(pckgGrdSeCd)) {
      gfn_comAlert("W0005", "상품등급");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      pckgGrdNm = _.find(jsonComPckgGrdSeCd, {grdCd: pckgGrdSeCd}).grdNm;
    }
    /*if (gfn_isEmpty(pckgSortGrdCd)) {
      gfn_comAlert("W0005", "선별등급");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      pckgSortGrdNm = _.find(jsonApcGrdDtl, {grdCd: pckgSortGrdCd}).grdNm;
    }*/
    if (pckgQntt <= 0) {
      gfn_comAlert("W0005", "선별수량");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (pckgWght <= 0) {
      gfn_comAlert("W0005", "선별중량");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (pckgSpcfctCd <= 0) {
      gfn_comAlert("W0005", "규격단중");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      pckgSpcfct = _.find(jsonApcSpcfct, {spcfctCd: pckgSpcfctCd}).spcfctNm;
      pckgSpcfctWght = _.find(jsonApcSpcfct, {spcfctCd: pckgSpcfctCd}).wght;
    }
    if (pckgPrdcrCd <= 0) {
      // gfn_comAlert("W0005", "생산자");		//	W0005	{0}이/가 없습니다.
      // return;
    }
    if (pckgWrhsSeCd <= 0) {
      // gfn_comAlert("W0005", "입고구분");		//	W0005	{0}이/가 없습니다.
      // return;
    } else {
      pckgWrhsNm = _.find(jsonComWrhsSeCd, {value: pckgWrhsSeCd}).text;
    }
    if (pckgGdsSeCd <= 0) {
      // gfn_comAlert("W0005", "상품구분");		//	W0005	{0}이/가 없습니다.
      // return;
    } else {
      pckgGdsNm = _.find(jsonComGdsSeCd, {value: pckgGdsSeCd}).text;
    }

    if (pckgInputWght > 0) {
      if (pckgWght > pckgInputWght) {
        gfn_comAlert("W0008", "재고수량", "투입수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
        return;
      }
    }

    const pckgRegInfoVO = {
      group: group,
      pckgYmd: pckgYmd,
      pckgFcltNm: pckgFcltNm,
      itemNm: pckgItemNm,
      vrtyNm: pckgVrtyNm,
      inputWrhus: pckgInputWrhus,
      pckgInputQntt: parseInt(pckgInputQntt) || '',
      pckgInputWght: parseInt(pckgInputWght) || '',
      strgWrhus: pckgStrgWrhus,
      pckgQntt: parseInt(pckgQntt) || 0,
      pckgWght: parseInt(pckgWght) || 0,
      spcfct: pckgSpcfct,
      pckgUnitNm: pckgUnitNm,
      pckgGrdNm: pckgGrdNm,
      // sortGrdNm: pckgSortGrdNm,
      stdGrdChck: stdGrdChckYn,
      stdGrdNm: stdGrdNm,
      prdcrNm: pckgPrdcrNm,
      wrhsSeNm: pckgWrhsNm,
      gdsSeNm: pckgGdsNm,
      rmrk: pckgRmrk,

      pckgFcltCd: pckgFcltCd,
      itemCd: pckgItemCd,
      vrtyCd: pckgVrtyCd,
      inputWrhusSeCd: pckgInputWrhusSeCd,
      strgWrhusSeCd: pckgStrgWrhusSeCd,
      spcfctCd: pckgSpcfctCd,
      pckgUnitCd: pckgUnitCd,
      pckgGrdSeCd: pckgGrdSeCd,
      // sortGrdCd: pckgSortGrdCd,
      stdGrdSeCd: pckgStdGrdSeCd,
      prdcrCd: pckgPrdcrCd,
      wrhsSeCd: pckgWrhsSeCd,
      gdsSeCd: pckgGdsSeCd,

      // spcfctWght: parseInt(pckgSpcfctWght) || 0,
      // pckgQntt: parseInt(pckgQntt) || 0,
      // pckgWght: parseInt(pckgWght) || 0,

      totSortWght: totSortWght,
    }

    if(!gfn_isEmpty(pckgRegInfoVO.vrtyCd)){
      pckgRegInfoVO.vrtyCd = pckgRegInfoVO.vrtyCd.substring(4,8);
    }

    // group 설정 확인 필요
    // (품종/품목, 투입창고, 투입수량/중량, 생산자, 입고구분, 상품구분 동일하면 같은 그룹)
    // (품종 / 품목)
    let prvPckgRegInfo = jsonPckgRegList.slice(-1)[0];  // 직전 선별등록 데이터

    // const keysToCompare = ['pckgYmd', 'itemCd', 'vrtyCd', 'inputWrhusSeCd', 'pckgInputQntt', 'pckgInputWght', 'prdcrCd', 'wrhsSeCd', 'gdsSeCd'];
    const keysToCompare = ['itemCd', 'vrtyCd', 'pckgInputQntt', 'pckgInputWght'];
    const prvPckgData = _.pick(prvPckgRegInfo, keysToCompare);
    const curPckgData = _.pick(pckgRegInfoVO, keysToCompare);

    if (jsonPckgRegList.length == 0) {
      // 초기 group num 1
      pckgRegInfoVO.group = 1;
      // 초기 group 선별중량 합
      pckgRegInfoVO.totSortWght = pckgRegInfoVO.pckgWght;
    } else {
      if (_.isEqual(prvPckgData, curPckgData)) {
        // 직전값과 같으면 같은그룹
        pckgRegInfoVO.group = prvPckgRegInfo.group;
        // 투입그룹 선별중량 합 = 이전 까지의 합 + 현재 중량
        pckgRegInfoVO.totSortWght = prvPckgRegInfo.totSortWght + pckgRegInfoVO.pckgWght;
      } else {
        // 직전값과 다르면 group num +1
        pckgRegInfoVO.group = prvPckgRegInfo.group + 1;
        // 투입그룹 선별중량 합 초기화
        pckgRegInfoVO.totSortWght = pckgRegInfoVO.pckgWght;
      }
      // 그룹별 투입중량 < 선별중량 error
      if (pckgRegInfoVO.totSortWght > pckgRegInfoVO.pckgInputWght && pckgRegInfoVO.pckgInputWght > 0) {
        // gfn_comAlert("W0008", "투입량", "선별량");		// W0008	{0} 보다 {1}이/가 큽니다.
        // return;

        pckgRegInfoVO.group = prvPckgRegInfo.group + 1;
        pckgRegInfoVO.totSortWght = pckgRegInfoVO.pckgWght;
      }
    }


    jsonPckgRegList.push(pckgRegInfoVO);

    grdPckgRegList.refresh();

  }

  /**
   * @name fn_savePckgInfo
   * @description 포장등록 정보 저장 버튼
   */
  const fn_savePckgInfo = async function () {

    const pckgYmd = SBUxMethod.get("dtl-dtp-pckgYmd");	// 선별일자
    const pckgMngList = [];
    let pckgRegData = grdPckgRegList.getGridDataAll();

    // 그룹별로 조건이 많은 출하상품 먼저 재고 처리
    // 정렬 키 정의
    const sortKey = ['group', 'pckgYmd', 'itemCd', 'vrtyCd', 'inputWrhusSeCd', 'prdcrCd', 'wrhsSeCd', 'gdsSeCd'];
    pckgRegData = fn_sortRegData(pckgRegData, sortKey);

    let pckgDataGroupBy = _.groupBy(pckgRegData, 'group');

    Object.keys(pckgDataGroupBy).forEach((groupKey) => {
      let groupData = pckgDataGroupBy[groupKey];
      const pckgPrfmncList = [];

      groupData.forEach((pckgDataVO) => {
        const stdGrdList = [];  // 포장상품등급

        /*jsonApcGrdDtl.forEach((item) => {
          if (item.grdCd == pckgDataVO.sortGrdCd) {
            stdGrdList.push({
              grdSeCd: _GRD_SE_CD_GDS,
              itemCd: pckgDataVO.itemCd,
              grdKnd: item.grdKnd,
              grdCd: item.grdCd,
            })
          }
        });*/

        jsonComPckgGrdSeCd.forEach((item) => {
          if (item.grdCd == pckgDataVO.pckgGrdSeCd) {
            stdGrdList.push({
              grdSeCd: _GRD_SE_CD_GDS,
              itemCd: pckgDataVO.itemCd,
              grdKnd: item.grdKnd,
              grdCd: item.grdCd,
            })
          }
        });



        const pckgPrfmnc = {
          pckgYmd: pckgDataVO.pckgYmd,
          fcltCd: pckgDataVO.pckgFcltCd,
          itemCd: pckgDataVO.itemCd,
          vrtyCd: pckgDataVO.vrtyCd,
          spcfctCd: pckgDataVO.spcfctCd,
          gdsGrd: pckgDataVO.pckgGrdSeCd,
          // grdCd: pckgDataVO.sortGrdCd,
          spmtPckgUnitCd: pckgDataVO.pckgUnitCd,
          warehouseSeCd: pckgDataVO.strgWrhusSeCd,
          warehouseSeCdFrom: pckgDataVO.inputWrhusSeCd,
          //pckgCmndno: pckgCmndno,
          rmrk: pckgDataVO.rmrk,
          pckgQntt: pckgDataVO.pckgQntt,
          pckgWght: pckgDataVO.pckgWght,
          stdGrdList: stdGrdList,
          // gdsStdGrdList: gdsStdGrdList,
          prdcrCd: pckgDataVO.prdcrCd,
          wrhsSeCd: pckgDataVO.wrhsSeCd,
          gdsSeCd: pckgDataVO.gdsSeCd,

          inptQntt: pckgDataVO.pckgInputQntt,	// 투입수량
          inptWght: pckgDataVO.pckgInputWght,	// 투입중량
        }
        pckgPrfmncList.push(pckgPrfmnc);
      });

      const pckgMng = {
        apcCd: gv_selectedApcCd,
        pckgYmd: pckgYmd,
        pckgPrfmncList: pckgPrfmncList,
      }
      pckgMngList.push(pckgMng);
    });

    console.log("pckgMngList", pckgMngList);
    // return ;
    try {

      const postJsonPromise = gfn_postJSON("/am/pckg/insertPckgRsltMonthly.do", pckgMngList);
      const pckgData = await postJsonPromise;

      if (_.isEqual("S", pckgData.resultStatus)) {
        gfn_comAlert("I0001");	// I0001	처리 되었습니다.
      } else {
        gfn_comAlert(pckgData.resultCode, pckgData.resultMessage);	//	E0001	오류가 발생하였습니다.
        //gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
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
   * @name fn_delPckgRow
   * @description 행삭제 버튼
   */
  const fn_delPckgRow = function () {
    const chkCol = grdPckgRegList.getColRef("checkedYn");

    if (chkCol < 0) {
      return;
    }

    const rows = grdPckgRegList.getCheckedRows(chkCol);
    if (rows.length < 1) {
      gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
      return;
    }

    rows.reverse().forEach((row) => {
      grdPckgRegList.deleteRow(row);
    });
  }

</script>
</body>
</html>
