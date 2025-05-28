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
        <sbux-button id="btnResetPckg" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" text="초기화" onclick="fn_resetPckg"></sbux-button>
        <sbux-button id="btnAddPckg" name="btnAdd" uitype="normal" class="btn btn-sm btn-outline-danger" text="추가" onclick="fn_addPckg"></sbux-button>
      </div>
    </div>
    <div class="box-body">
      <%--생산자 코드--%>
      <sbux-input id="srch-inp-pckgPrdcrCd" name="srch-inp-pckgPrdcrCd" uitype="hidden"></sbux-input>
      <table id="rawMtrPckgTable" class="table table-bordered tbl_fixed">
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
          <th scope="row" class="th_bg">포장일자</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-datepicker uitype="popup" id="srch-dtp-pckgYmd" name="srch-dtp-pckgYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"></sbux-datepicker>
            </div>
          </td>
          <th scope="row" class="th_bg">포장설비</th>
          <td class="td_input" style="border-right: hidden">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-pckgFcltCd"
                      name="srch-slt-pckgFcltCd"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      jsondata-ref="jsonComPckgFclt"
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">품목/품종</th>
          <td class="td_input">
            <div class="displayFlex">
              <div>
                <sbux-select
                        unselected-text="전체"
                        uitype="single"
                        id="srch-slt-pckgItemCd"
                        name="srch-slt-pckgItemCd"
                        class="form-control input-sm input-sm-ast"
                        jsondata-ref="jsonApcItem"
                        onchange="fn_onChangePckgSrchItemCd(this)">
                </sbux-select>
              </div>
              <div>
                <sbux-select
                        unselected-text="선택"
                        uitype="single"
                        id="srch-slt-pckgVrtyCd"
                        name="srch-slt-pckgVrtyCd"
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
          <th scope="row" class="th_bg">상품명</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-pckgUnitCd"
                      name="srch-slt-pckgUnitCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonSpmtPckgUnit"
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">저장창고</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-pckgStrgWrhusSeCd"
                      name="srch-slt-pckgStrgWrhusSeCd"
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
                      id="srch-slt-pckgInputWrhusSeCd"
                      name="srch-slt-pckgInputWrhusSeCd"
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
                      id="srch-inp-pckgInputQntt"
                      name="srch-inp-pckgInputQntt"
                      class="form-control input-sm input-sm-ast"
                      autocomplete="off"
                      mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
              <sbux-input
                      uitype="text"
                      id="srch-inp-pckgInputWght"
                      name="srch-inp-pckgInputWght"
                      class="form-control input-sm"
                      autocomplete="off"
                      mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
              <sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"></sbux-label>
            </div>
          </td>
          <th scope="row" class="th_bg">상품등급</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-pckgGrdSeCd"
                      name="srch-slt-pckgGrdSeCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonComPckgGrdSeCd"
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">표준등급</th>
          <td class="td_input">
            <div class="displayFlex" style="gap:20px">
              <sbux-checkbox
                      style="flex: 0"
                      id="srch-chk-pckgChck"
                      name="srch-chk-pckgChck"
                      uitype="normal"
                      text="사용"
              ></sbux-checkbox>
              <sbux-select
                      style="flex:1"
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-pckgStdGrd"
                      name="srch-slt-pckgStdGrd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange=""
              ></sbux-select>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">선별수량/중량</th>
          <td class="td_input"style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-input
                      uitype="text"
                      id="srch-inp-pckgSortQntt"
                      name="srch-inp-pckgSortQntt"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      autocomplete="off"
                      mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
              <sbux-input
                      uitype="text"
                      id="srch-inp-pckgSortWght"
                      name="srch-inp-pckgSortWght"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      autocomplete="off"
                      mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
              <sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"></sbux-label>
            </div>
          </td>
          <th scope="row" class="th_bg">규격</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-pckgSpcfctCd"
                      name="srch-slt-pckgSpcfctCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonApcSpcfct"
                      onchange="fn_onChangeSortSpcfctCd(this)">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">비고</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-input
                      style="flex-grow: 1"
                      uitype="text"
                      id="srch-inp-pckgRmrk"
                      name="srch-inp-pckgRmrk"
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
                        id="srch-inp-pckgPrdcrNm"
                        name="srch-inp-pckgPrdcrNm"
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
                        id="srch-inp-pckgPrdcrIdentno"
                        name="srch-inp-pckgPrdcrIdentno"
                        class="form-control input-sm"
                        maxlength="2"
                        autocomplete="off"
                        onchange="fn_onChangePckgSrchPrdcrIdentno(this)"
                ></sbux-input>
              </div>
              <div style="flex: 0">
                <sbux-button
                        id="btn-srch-pckgPrdcr"
                        name="btn-srch-pckgPrdcr"
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
                      id="srch-slt-pckgWrhsSeCd"
                      name="srch-slt-pckgWrhsSeCd"
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
                      id="srch-slt-pckgGdsSeCd"
                      name="srch-slt-pckgGdsSeCd"
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
          <sbux-button id="btnDel" name="btnDel" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delRow"></sbux-button>
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
</body>
<script type="text/javascript">

  /* SB Select */
  var jsonComPckgFclt = []; // 포장설비   PCKG_FCLT_CD

  /* Grid 생성 */
  var grdPckgRegList;
  var jsonPckgRegList = [];

  window.addEventListener('DOMContentLoaded', async function(e) {
    fn_initPckgReg();
    fn_createGridPckgReg();
  });

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
    SBGridProperties.explorerbar = 'sort';
    // SBGridProperties.allowcopy = true;

    SBGridProperties.columns = [
      {caption: ["선택", "선택"],	    ref: 'checkedYn',       type:'checkbox',  width:'50px',   style:'text-align:center', typeinfo : {fixedcellcheckbox : {usemode : true, rowindex : 0, deletecaption : false}, checkedvalue : 'Y', uncheckedvalue : 'N'}, sortable: false},
      {caption: ["그룹", "그룹"],		ref: 'group',           type:'output',    width:'50px',   style:'text-align:center', sortable: true},
      {caption: ["포장일자", "포장일자"],	ref: 'sortYmd',         type:'output',    width:'100px',  style:'text-align:center'},
      {caption: ["포장설비", "포장설비"],	ref: 'sortFclt',        type:'output',    width:'100px',  style:'text-align:center', sortable: true},
      {caption: ["품목", "품목"],		ref: 'itemNm',          type:'output',    width:'80px',   style:'text-align:center', sortable: true},
      {caption: ["품종", "품종"],		ref: 'vrtyNm',          type:'output',    width:'80px',   style:'text-align:center', sortable: true},
      {caption: ["투입", "투입창고"],		ref: 'inputWrhus',    	type:'output',    width:'80px',  style:'text-align:center'},
      {caption: ["투입", "수량"],		ref: 'inputQntt',       type:'output',    width:'70px',   style:'text-align:center', sortable: true,  format : {type:'number', rule:'#,###.###'}},
      {caption: ["투입", "중량(kg)"],	ref: 'inputWght',       type:'output',    width:'70px',   style:'text-align:center', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["포장", "저장창고"],		ref: 'strgWrhus',	    type:'output',    width:'80px',  style:'text-align:center'},
      {caption: ["포장", "수량"],	    ref: 'sortQntt',        type:'output',    width:'70px',   style:'text-align:right', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["포장", "중량(kg)"],	ref: 'sortWght',        type:'output',    width:'70px',   style:'text-align:right', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["규격", "규격"],		ref: 'spcfct',          type:'output',    width:'60px',  style:'text-align:center', sortable: true},
      {caption: ["등급", "등급"],		ref: 'grdNm',           type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["표준등급", "사용"],		ref: 'pckgChck',        type:'checkbox',  width:'50px',   style:'text-align:center', typeinfo: {checkedvalue : 'Y', uncheckedvalue : 'N'}, sortable: false, /*disabled: true*/},
      // {caption: ["표준등급", "상품명"],	ref: 'spmtPckgUnitNm',  type:'output',    width:'80px',   style:'text-align:center', sortable: true},
      {caption: ["표준등급", "등급"],	ref: 'spmtPckgGrdNm',   type:'output',    width:'60px',   style:'text-align:center', sortable: true},
      {caption: ["생산자", "생산자"],		ref: 'prdcrNm',         type:'output',    width:'60px',  style:'text-align:center', sortable: false},
      {caption: ["입고구분", "입고구분"],	ref: 'wrhsSeNm',        type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["상품구분", "상품구분"],	ref: 'gdsSeNm',         type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["비고", "비고"],		ref: 'rmrk',     	    type:'output',    width:'200px',  style:'text-align:left'},

      {caption: ["포장설비코드"], ref: 'sortFcltCd', type: 'output', hidden: true},
      {caption: ["품목코드"], ref: 'itemCd', type: 'output', hidden: true},
      {caption: ["품종코드"], ref: 'vrtyCd', type: 'output', hidden: true},
      {caption: ["투입창고코드"], ref: 'inputWrhusSeCd', type: 'output', hidden: true},
      {caption: ["저장창고코드"], ref: 'strgWrhusSeCd', type: 'output', hidden: true},
      {caption: ["규격코드"], ref: 'spcfctCd', type: 'output', hidden: true},
      {caption: ["등급", "등급"], ref: 'grdCd',  type: 'output', hidden: true},
      {caption: ["포장등록", "상품명"],  ref: 'spmtPckgUnitCd',  type: 'output', hidden: true},
      {caption: ["포장등록", "상품등급"], ref: 'spmtPckgGrdCd',   type: 'output', hidden: true},
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
    SBUxMethod.set("srch-dtp-pckgYmd", gfn_dateToYmd(new Date()));
    SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
    SBUxMethod.set("srch-dtp-prdctnYr", gfn_dateToYear(new Date()));


    let result = await Promise.all([
      fn_initPckgSBSelect(),
    ]);

    // fn_clearForm();
  }

  const fn_initPckgSBSelect = async function() {
    // 검색 SB select
    let result = await Promise.all([
      gfn_setApcItemSBSelect('srch-slt-pckgItemCd',       jsonApcItem, gv_selectedApcCd),		// 품목
      gfn_setApcVrtySBSelect('srch-slt-pckgVrtyCd',       jsonApcVrty, gv_selectedApcCd),		// 품종
      gfn_setComCdSBSelect('srch-slt-pckgFcltCd',         jsonComPckgFclt, 'PCKG_FCLT_CD', gv_selectedApcCd),		// 설비
      gfn_setComCdSBSelect('srch-slt-pckgStrgWrhusSeCd',  jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 저장창고
      gfn_setComCdSBSelect('srch-slt-pckgInputWrhusSeCd',  jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 투입창고
      gfn_setComCdSBSelect('srch-slt-pckgWrhsSeCd',       jsonComWrhsSeCd, 	'WRHS_SE_CD'),							// 입고구분
      gfn_setComCdSBSelect('srch-slt-pckgGdsSeCd',        jsonComGdsSeCd, 	'GDS_SE_CD', gv_selectedApcCd),							// 상품구분
      // gfn_setApcSpcfctsSBSelect('srch-slt-pckgSpcfctCd', 		jsonApcSpcfct,  gv_selectedApcCd),						// 규격(엑셀)
    ]);
  }

  /**
   * @name fn_clearPckgPrdcr
   * @description 생산자 폼 clear
   */
  const fn_clearPckgPrdcr = function() {
    SBUxMethod.set("srch-inp-pckgPrdcrCd", "");
    SBUxMethod.set("srch-inp-pckgPrdcrIdentno", "");
    SBUxMethod.attr("srch-inp-pckgPrdcrNm", "style", "background-color:''");
  }

  /**
   * @name fn_OnInputPckgPrdcrNm
   * @description 생산자명 입력 시 event : autocomplete
   */
  const fn_OnInputPckgPrdcrNm = function(prdcrNm){
    fn_clearPckgPrdcr();
    if(getByteLengthOfString(prdcrNm.target.value) > 100){
      SBUxMethod.set("srch-inp-pckgPrdcrNm", "");
      return;
    }
    jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);

    SBUxMethod.changeAutocompleteData('srch-inp-pckgPrdcrNm', true);
  }

  /**
   * @name fn_onSelectPckgPrdcrNm
   * @description 생산자 autocomplete 선택 callback
   */
  function fn_onSelectPckgPrdcrNm(value, label, item) {
    // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
    if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
      document.getElementById('btn-srch-pckgPrdcr').click();
    } else{
      SBUxMethod.set("srch-inp-pckgPrdcrCd", value);
      SBUxMethod.attr("srch-inp-pckgPrdcrNm", "style", "background-color:aquamarine");	//skyblue
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
    popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPckgPrdcr, SBUxMethod.get("srch-inp-pckgPrdcrNm"));
  }

  /**
   * @name fn_setPckgPrdcr
   * @description 생산자 선택 popup callback 처리
   */
  const fn_setPckgPrdcr = async function(prdcr) {

    await fn_getPrdcrs();

    if (!gfn_isEmpty(prdcr)) {
      SBUxMethod.set("srch-inp-pckgPrdcrCd", prdcr.prdcrCd);
      SBUxMethod.set("srch-inp-pckgPrdcrNm", prdcr.prdcrNm);
      SBUxMethod.attr("srch-inp-pckgPrdcrNm", "style", "background-color:aquamarine");	//skyblue

      await fn_setPckgPrdcrForm(prdcr);
    }
  }

  const fn_onChangePckgSrchPrdcrIdentno = function(obj) {

    if (gfn_isEmpty(SBUxMethod.get("srch-inp-pckgPrdcrIdentno"))) {
      return;
    }

    SBUxMethod.set("srch-inp-pckgPrdcrCd", "");
    SBUxMethod.set("srch-inp-pckgPrdcrNm", "");
    SBUxMethod.attr("srch-inp-pckgPrdcrNm", "style", "");	//skyblue

    let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-pckgPrdcrIdentno")) || 0;

    if (prdcrIdentno < 1) {
      return;
    }

    const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
    if (gfn_isEmpty(prdcrInfo)) {
      return;
    }

    SBUxMethod.set("srch-inp-pckgPrdcrCd", prdcrInfo.prdcrCd);
    SBUxMethod.set("srch-inp-pckgPrdcrNm", prdcrInfo.prdcrNm);
    SBUxMethod.attr("srch-inp-pckgPrdcrNm", "style", "background-color:aquamarine");	//skyblue

    fn_setPckgPrdcrForm(prdcrInfo);

  }

  const fn_setPckgPrdcrForm = async function(prdcr) {

    if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
      await gfn_setApcVrtySBSelect('srch-slt-pckgVrtyCd', jsonApcVrty, gv_selectedApcCd);
      SBUxMethod.set("srch-slt-pckgVrtyCd", prdcr.rprsItemCd + prdcr.rprsVrtyCd);
      fn_onChangePckgSrchVrtyCd({value : prdcr.rprsItemCd + prdcr.rprsVrtyCd});
    } else {
      if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
        const prvItemCd = SBUxMethod.get("srch-slt-pckgItemCd");

        if (prvItemCd != prdcr.rprsItemCd) {
          SBUxMethod.set("srch-slt-pckgItemCd", prdcr.rprsItemCd);
          fn_onChangePckgSrchItemCd({value:prdcr.rprsItemCd});
        }
      }
    }
    if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
      SBUxMethod.set("srch-inp-pckgPrdcrIdentno", prdcr.prdcrIdentno);
    } else {
      SBUxMethod.set("srch-inp-pckgPrdcrIdentno", "");
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
        gfn_setApcItemSBSelect('srch-slt-pckgItemCd',       jsonApcItem, gv_selectedApcCd),		// 품목
        gfn_setApcSpcfctsSBSelect('srch-slt-pckgSpcfctCd',	jsonApcSpcfct, 	""),  // 규격
        gfn_setApcVrtySBSelect('srch-slt-pckgVrtyCd', 		jsonApcVrty, 	gv_selectedApcCd),			// 품종

        SBUxMethod.refresh('srch-slt-pckgGrdCd'),
        SBUxMethod.refresh('srch-slt-pckgUnitCd'),
        SBUxMethod.refresh('srch-slt-pckgGrdSeCd'),
      ])

    } else {
      let result = await Promise.all([
        gfn_setApcSpcfctsSBSelect('srch-slt-pckgSpcfctCd',	jsonApcSpcfct, 	gv_selectedApcCd, itemCd),			// 규격
        gfn_setApcGdsGrdSBSelect('srch-slt-pckgGrdCd', 	jsonApcGrdDtl, 	gv_selectedApcCd, itemCd, _GRD_SE_CD_SORT),	// 등급상세
        gfn_setApcVrtySBSelect('srch-slt-pckgVrtyCd', 		jsonApcVrty, 	gv_selectedApcCd, itemCd),			// 품종
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

      SBUxMethod.set("srch-slt-pckgItemCd", itemCd);
      await fn_onChangePckgSrchItemCd({value: itemCd});
      SBUxMethod.set("srch-slt-pckgVrtyCd", vrtyCd);
      await gfn_setSpmtPckgUnitSBSelect("srch-slt-pckgUnitCd", jsonSpmtPckgUnit, gv_selectedApcCd, itemCd, vrtyCd.substring(4));
      await gfn_setApcGdsGrdSBSelect('srch-slt-pckgGrdSeCd', 	jsonComPckgGrdSeCd, 	gv_selectedApcCd, itemCd, _GRD_SE_CD_GDS);	// 포장상품등급

    } else {
      await fn_onChangePckgSrchItemCd({value: null});
    }
    // fn_onChangeInputQntt();
  }

  /**
   * @name fn_addPckg
   * @description 선별목록 추가 버튼
   */
  const fn_addPckg = async function () {

    let pckgYmd = SBUxMethod.get("srch-dtp-pckgYmd");                         // 선별일자
    let pckgFcltCd = SBUxMethod.get("srch-slt-pckgFcltCd");                   // 선별설비
    let pckgItemCd = SBUxMethod.get("srch-slt-pckgItemCd");			          // 품목
    let pckgVrtyCd = SBUxMethod.get("srch-slt-pckgVrtyCd");                   // 품종
    let pckgUnitCd = SBUxMethod.get("srch-slt-pckgUnitCd");                   // 상품명
    let pckgStrgWrhusSeCd = SBUxMethod.get("srch-slt-pckgStrgWrhusSeCd");     // 저장창고
    let pckgInputWrhusSeCd = SBUxMethod.get("srch-slt-pckgInputWrhusSeCd");   // 투입창고
    let pckgInputQntt = Number(SBUxMethod.get("srch-inp-pckgInputQntt"));     // 투입수량
    let pckgInputWght = Number(SBUxMethod.get("srch-inp-pckgInputWght"));     // 투입중량
    let pckgGrdSeCd = SBUxMethod.get("srch-slt-pckgGrdSeCd");                 // 상품등급
    let pckgSortQntt = Number(SBUxMethod.get("srch-inp-pckgSortQntt"));       // 선별수량
    let pckgSortWght = Number(SBUxMethod.get("srch-inp-pckgSortWght"));       // 선별중량
    let pckgSpcfctCd = SBUxMethod.get("srch-slt-pckgSpcfctCd");               // 규격
    let pckgRmrk = SBUxMethod.get("srch-inp-pckgRmrk");                       // 비고
    let pckgPrdcrNm = SBUxMethod.get("srch-inp-pckgPrdcrNm");                 // 생산자

    let pckgPrdcrCd = SBUxMethod.get("srch-inp-pckgPrdcrCd");                 // 생산자
    let pckgWrhsSeCd = SBUxMethod.get("srch-slt-pckgWrhsSeCd");               // 입고구분
    let pckgGdsSeCd = SBUxMethod.get("srch-slt-pckgGdsSeCd");                 // 상품구분

    let group = 0;
    let pckgFclt;
    let pckgItemNm;
    let pckgVrtyNm;
    let pckgUnitNm;
    let pckgStrgWrhus;
    let pckgInputWrhus;
    let pckgGrdNm;
    let pckgSpcfct;
    let pckgSpcfctWght;
    // let pckgChckYn = _.isEqual(pckgPckg["srch-chk-pckgPckg"], true) ? "Y" : "N";

    let pckgWrhsNm;
    let pckgGdsNm;

    let totSortWght = 0;  // 그룹별 선별중량 합

    if (gfn_isEmpty(pckgYmd)) {
      gfn_comAlert("W0005", "선별일자");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (gfn_isEmpty(pckgFcltCd)) {
      gfn_comAlert("W0005", "설비");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (gfn_isEmpty(pckgItemCd)) {
      gfn_comAlert("W0005", "품목");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (gfn_isEmpty(pckgVrtyCd)) {
      gfn_comAlert("W0005", "품종");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (gfn_isEmpty(pckgUnitCd)) {
      gfn_comAlert("W0005", "포장 상품명");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (gfn_isEmpty(pckgStrgWrhusSeCd)) {
      gfn_comAlert("W0005", "저장창고");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (gfn_isEmpty(pckgInputWrhusSeCd)) {
      gfn_comAlert("W0005", "투입창고");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (pckgInputQntt <= 0) {
      gfn_comAlert("W0005", "투입수량");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (pckgInputWght <= 0) {
      gfn_comAlert("W0005", "투입중량");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (gfn_isEmpty(pckgGrdSeCd)) {
      gfn_comAlert("W0005", "상품등급");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (pckgSortQntt <= 0) {
      gfn_comAlert("W0005", "선별수량");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (pckgSortWght <= 0) {
      gfn_comAlert("W0005", "선별중량");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (pckgSpcfctCd <= 0) {
      gfn_comAlert("W0005", "규격단중");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (pckgPrdcrCd <= 0) {
      gfn_comAlert("W0005", "생산자");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (pckgWrhsSeCd <= 0) {
      gfn_comAlert("W0005", "입고구분");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (pckgGdsSeCd <= 0) {
      gfn_comAlert("W0005", "상품구분");		//	W0005	{0}이/가 없습니다.
      return;
    }
    /*if (gfn_isEmpty(pckgInputQntt) || gfn_isEmpty(pckgInputWght)) {
      pckgInputQntt = '';
      pckgInputWght = '';
    }*/

    if (pckgWght > pckgInputWght) {
      gfn_comAlert("W0008", "재고수량", "투입수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
      return;
    }

    jsonComSortFclt.forEach((item) => {
      if (item.value == pckgFcltCd){
        pckgFclt = item.text;
      }
    });
    jsonApcSpcfct.forEach((item) => {
      if (item.spcfctCd == pckgSpcfctCd){
        pckgSpcfct = item.spcfctNm;
        pckgSpcfctWght = item.wght;
      }
    });
    jsonApcItem.forEach((item) => {
      if (item.itemCd == pckgItemCd){
        pckgItemNm = item.itemNm;
      }
    });
    jsonApcVrty.forEach((item) => {
      if (item.itemVrtyCd == pckgVrtyCd){
        pckgVrtyNm = item.vrtyNm;
      }
    });
    jsonComWarehouse.forEach((item) => {
      // 저장창고
      if (item.value == pckgStrgWrhusSeCd){
        pckgStrgWrhus = item.text;
      }
      // 투입창고
      if (item.value == pckgInputWrhusSeCd){
        pckgInputWrhus = item.text;
      }
    });
    jsonApcGrdDtl.forEach((item) => {
      if (item.grdCd == pckgGrdCd){
        pckgGrdNm = item.grdNm;
      }
    });
    jsonSpmtPckgUnit.forEach((item) => {
      if (item.spmtPckgUnitCd == spmtPckgUnitCd) {
        spmtPckgUnitNm = item.spmtPckgUnitNm;
      }
    });
    jsonComWrhsSeCd.forEach((item) => {
      if (item.value == pckgWrhsSeCd){
        pckgWrhsNm = item.text;
      }
    });
    jsonComGdsSeCd.forEach((item) => {
      if (item.value == pckgGdsSeCd){
        pckgGdsNm = item.text;
      }
    });
    jsonComPckgGrdSeCd.forEach((item) => {
      if (item.grdCd == spmtPckgGrdCd) {
        spmtPckgGrdNm = item.grdNm;
      }
    });

    const pckgRegInfoVO = {
      group: group,
      pckgYmd: pckgYmd,
      pckgFclt: pckgFclt,
      itemNm: pckgItemNm,
      vrtyNm: pckgVrtyNm,
      inputWrhus: pckgInputWrhus,
      inputQntt: pckgInputQntt,
      inputWght: pckgInputWght,
      strgWrhus: pckgStrgWrhus,
      pckgQntt: parseInt(pckgQntt) || 0,
      pckgWght: parseInt(pckgWght) || 0,
      spcfct: pckgSpcfct,
      grdNm: pckgGrdNm,
      pckgChck: pckgChckYn,
      spmtPckgUnitNm: spmtPckgUnitNm,
      spmtPckgGrdNm: spmtPckgGrdNm,
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
      grdCd: pckgGrdCd,
      spmtPckgUnitCd: spmtPckgUnitCd,
      spmtPckgGrdCd: spmtPckgGrdCd,
      prdcrCd: pckgPrdcrCd,
      wrhsSeCd: pckgWrhsSeCd,
      gdsSeCd: pckgGdsSeCd,

      spcfctWght: parseInt(pckgSpcfctWght) || 0,
      // pckgQntt: parseInt(pckgQntt) || 0,
      // pckgWght: parseInt(pckgWght) || 0,

      totSortWght: totSortWght,
    }

    if(!gfn_isEmpty(pckgRegInfoVO.vrtyCd)){
      pckgRegInfoVO.vrtyCd = pckgRegInfoVO.vrtyCd.substring(4,8);
    }

    // group 설정 (품종/품목, 투입창고, 투입수량/중량, 생산자, 입고구분, 상품구분 동일하면 같은 그룹)
    // (품종 / 품목)
    let prvSortRegInfo = jsonSortRegList.slice(-1)[0];  // 직전 선별등록 데이터

    const keysToCompare = ['pckgYmd', 'itemCd', 'vrtyCd', 'inputWrhusSeCd', 'inputQntt', 'inputWght', 'inputWrhus', 'prdcrCd', 'wrhsSeCd', 'gdsSeCd'];
    const prvSortData = _.pick(prvSortRegInfo, keysToCompare);
    const curSortData = _.pick(pckgRegInfoVO, keysToCompare);

    if (jsonSortRegList.length == 0) {
      // 초기 group num 1
      pckgRegInfoVO.group = 1;
      // 초기 group 선별중량 합
      pckgRegInfoVO.totSortWght = pckgRegInfoVO.pckgWght;
    } else {
      if (_.isEqual(prvSortData, curSortData)) {
        // 직전값과 같으면 같은그룹
        pckgRegInfoVO.group = prvSortRegInfo.group;
        // 투입그룹 선별중량 합 = 이전 까지의 합 + 현재 중량
        pckgRegInfoVO.totSortWght = prvSortRegInfo.totSortWght + pckgRegInfoVO.pckgWght;
      } else {
        // 직전값과 다르면 group num +1
        pckgRegInfoVO.group = prvSortRegInfo.group + 1;
        // 투입그룹 선별중량 합 초기화
        pckgRegInfoVO.totSortWght = pckgRegInfoVO.pckgWght;
      }
      // 그룹별 투입중량 < 선별중량 error
      if (pckgRegInfoVO.totSortWght > pckgRegInfoVO.inputWght && pckgRegInfoVO.inputWght > 0) {
        // gfn_comAlert("W0008", "투입량", "선별량");		// W0008	{0} 보다 {1}이/가 큽니다.
        // return;

        pckgRegInfoVO.group = prvSortRegInfo.group + 1;
        pckgRegInfoVO.totSortWght = pckgRegInfoVO.pckgWght;
      }
    }

    jsonSortRegList.push(pckgRegInfoVO);

    grdSortRegList.refresh();


  }

</script>
</html>
