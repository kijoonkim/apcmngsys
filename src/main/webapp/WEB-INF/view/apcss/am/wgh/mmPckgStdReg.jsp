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
                      id="srch-chk-stdGrdChck"
                      name="srch-chk-stdGrdChck"
                      uitype="normal"
                      text="사용"
              ></sbux-checkbox>
              <sbux-select
                      style="flex:1"
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-pckgStdGrdSeCd"
                      name="srch-slt-pckgStdGrdSeCd"
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
                      onchange="fn_onChangePckgSortQntt(this)"
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
                      onchange="fn_onChangePckgSortQntt()">
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
    SBGridProperties.explorerbar = 'sort';
    // SBGridProperties.allowcopy = true;

    SBGridProperties.columns = [
      {caption: ["선택", "선택"],	    ref: 'checkedYn',       type:'checkbox',  width:'50px',   style:'text-align:center', typeinfo : {fixedcellcheckbox : {usemode : true, rowindex : 0, deletecaption : false}, checkedvalue : 'Y', uncheckedvalue : 'N'}, sortable: false},
      {caption: ["그룹", "그룹"],		ref: 'group',           type:'output',    width:'50px',   style:'text-align:center', sortable: true},
      {caption: ["포장일자", "포장일자"],	ref: 'pckgYmd',         type:'output',    width:'100px',  style:'text-align:center'},
      {caption: ["포장설비", "포장설비"],	ref: 'pckgFcltNm',        type:'output',    width:'100px',  style:'text-align:center', sortable: true},
      {caption: ["품목", "품목"],		ref: 'itemNm',          type:'output',    width:'80px',   style:'text-align:center', sortable: true},
      {caption: ["품종", "품종"],		ref: 'vrtyNm',          type:'output',    width:'80px',   style:'text-align:center', sortable: true},
      {caption: ["투입", "투입창고"],		ref: 'inputWrhus',    	type:'output',    width:'80px',  style:'text-align:center'},
      {caption: ["투입", "수량"],		ref: 'pckgInputQntt',       type:'output',    width:'70px',   style:'text-align:center', sortable: true,  format : {type:'number', rule:'#,###.###'}},
      {caption: ["투입", "중량(kg)"],	ref: 'pckgInputWght',       type:'output',    width:'70px',   style:'text-align:center', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["포장", "저장창고"],		ref: 'strgWrhus',	    type:'output',    width:'80px',  style:'text-align:center'},
      {caption: ["포장", "수량"],	    ref: 'pckgSortQntt',        type:'output',    width:'70px',   style:'text-align:right', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["포장", "중량(kg)"],	ref: 'pckgSortWght',        type:'output',    width:'70px',   style:'text-align:right', sortable: false, format : {type:'number', rule:'#,###.###'}},
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
    SBUxMethod.set("srch-dtp-pckgYmd", gfn_dateToYmd(new Date()));
    fn_createGridPckgReg();

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
    if (jsonPrdcr.filter(e => e.prdcrNm === label).length > 1) {
      document.getElementById('btn-srch-pckgPrdcr').click();
    } else {
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

        SBUxMethod.refresh('srch-slt-pckgStdGrdSeCd'),
        SBUxMethod.refresh('srch-slt-pckgUnitCd'),
        SBUxMethod.refresh('srch-slt-pckgGrdSeCd'),
      ])

    } else {
      let result = await Promise.all([
        gfn_setApcSpcfctsSBSelect('srch-slt-pckgSpcfctCd',	jsonApcSpcfct, 	gv_selectedApcCd, itemCd),			// 규격
        // gfn_setApcGdsGrdSBSelect('srch-slt-pckgStdGrdSeCd', 	jsonApcGrdDtl, 	gv_selectedApcCd, itemCd, _GRD_SE_CD_GDS),	// 등급상세
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
      await gfn_setSpmtPckgUnitSBSelect("srch-slt-pckgUnitCd", jsonSpmtPckgUnit, gv_selectedApcCd, itemCd, vrtyCd.substring(4));  // 상품명
      await gfn_setApcGdsGrdSBSelect('srch-slt-pckgGrdSeCd', 	jsonComPckgGrdSeCd, 	gv_selectedApcCd, itemCd, _GRD_SE_CD_GDS);	// 포장상품등급

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
    let inputQntt = parseInt(SBUxMethod.get("srch-inp-pckgInputQntt")) || 0;
    // let inputSpcfctCd;
    /*let vrtyCd = SBUxMethod.get("srch-slt-pckgVrtyCd");			// 품종

    let vrtyInfo = _.find(jsonApcVrty, {value: vrtyCd.substring(4,8)});
    if (!gfn_isEmpty(vrtyInfo)) {
      const unitWght = parseFloat(vrtyInfo.unitWght) || 0;
      let inputWght = Math.round(inputQntt * unitWght);

      SBUxMethod.set("srch-inp-pckgInputWght", inputWght);
    } else {
      SBUxMethod.set("srch-inp-pckgInputWght", "");
    }*/

  }

  /**
   * @name fn_onChangePckgSortQntt
   * @description 선별수량 변경 event
   */
  const fn_onChangePckgSortQntt = function (obj) {
    let sortQntt = parseInt(SBUxMethod.get("srch-inp-pckgSortQntt")) || 0;
    let pckgSpcfctCd = SBUxMethod.get("srch-slt-pckgSpcfctCd");

    if (!gfn_isEmpty(pckgSpcfctCd)) {
      const spcfctInfo = _.find(jsonApcSpcfct, {spcfctCd: pckgSpcfctCd});
      let spcfctWght = spcfctInfo.wght;

      if (spcfctWght > 0) {
        let pckgWght = gfn_apcEstmtWght(sortQntt * spcfctWght, gv_selectedApcCd);
        SBUxMethod.set("srch-inp-pckgSortWght", pckgWght);
      }
    } else {
      SBUxMethod.set("srch-inp-pckgSortWght", "");
    }
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
    let stdGrdChck = SBUxMethod.get("srch-chk-stdGrdChck");                   // 표준등급 사용 여부
    let pckgStdGrdSeCd = SBUxMethod.get("srch-slt-pckgStdGrdSeCd");           // 표준등급
    let pckgSortQntt = Number(SBUxMethod.get("srch-inp-pckgSortQntt"));       // 선별수량
    let pckgSortWght = Number(SBUxMethod.get("srch-inp-pckgSortWght"));       // 선별중량
    let pckgSpcfctCd = SBUxMethod.get("srch-slt-pckgSpcfctCd");               // 규격
    let pckgRmrk = SBUxMethod.get("srch-inp-pckgRmrk");                       // 비고
    let pckgPrdcrNm = SBUxMethod.get("srch-inp-pckgPrdcrNm");                 // 생산자

    let pckgPrdcrCd = SBUxMethod.get("srch-inp-pckgPrdcrCd");                 // 생산자
    let pckgWrhsSeCd = SBUxMethod.get("srch-slt-pckgWrhsSeCd");               // 입고구분
    let pckgGdsSeCd = SBUxMethod.get("srch-slt-pckgGdsSeCd");                 // 상품구분

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
    let stdGrdChckYn = _.isEqual(stdGrdChck["srch-chk-stdGrdChck"], true) ? "Y" : "N";  // 표준등급 사용 여부
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

    if (pckgSortWght > pckgInputWght) {
      gfn_comAlert("W0008", "재고수량", "투입수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
      return;
    }

    jsonComPckgFclt.forEach((item) => {
      if (item.value == pckgFcltCd){
        pckgFcltNm = item.text;
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
    jsonSpmtPckgUnit.forEach((item) => {
      if (item.spmtPckgUnitCd == pckgUnitCd) {
        pckgUnitNm = item.spmtPckgUnitNm;
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
    jsonComPckgGrdSeCd.forEach((item) => {
      if (item.grdCd == pckgGrdSeCd) {
        pckgGrdNm = item.grdNm;
      }
    });
    jsonApcGrdDtl.forEach((item) => {
      if (item.grdCd == pckgGrdSeCd){
        pckgGrdNm = item.grdNm;
      }
    });
    jsonApcSpcfct.forEach((item) => {
      if (item.spcfctCd == pckgSpcfctCd){
        pckgSpcfct = item.spcfctNm;
        pckgSpcfctWght = item.wght;
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

    const pckgRegInfoVO = {
      group: group,
      pckgYmd: pckgYmd,
      pckgFcltNm: pckgFcltNm,
      itemNm: pckgItemNm,
      vrtyNm: pckgVrtyNm,
      inputWrhus: pckgInputWrhus,
      pckgInputQntt: pckgInputQntt,
      pckgInputWght: pckgInputWght,
      strgWrhus: pckgStrgWrhus,
      pckgSortQntt: parseInt(pckgSortQntt) || 0,
      pckgSortWght: parseInt(pckgSortWght) || 0,
      spcfct: pckgSpcfct,
      pckgUnitNm: pckgUnitNm,
      pckgGrdNm: pckgGrdNm,
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

    const keysToCompare = ['pckgYmd', 'itemCd', 'vrtyCd', 'inputWrhusSeCd', 'pckgInputQntt', 'pckgInputWght', 'prdcrCd', 'wrhsSeCd', 'gdsSeCd'];
    const prvPckgData = _.pick(prvPckgRegInfo, keysToCompare);
    const curPckgData = _.pick(pckgRegInfoVO, keysToCompare);

    if (jsonPckgRegList.length == 0) {
      // 초기 group num 1
      pckgRegInfoVO.group = 1;
      // 초기 group 선별중량 합
      pckgRegInfoVO.totSortWght = pckgRegInfoVO.pckgSortWght;
    } else {
      if (_.isEqual(prvPckgData, curPckgData)) {
        // 직전값과 같으면 같은그룹
        pckgRegInfoVO.group = prvPckgRegInfo.group;
        // 투입그룹 선별중량 합 = 이전 까지의 합 + 현재 중량
        pckgRegInfoVO.totSortWght = prvPckgRegInfo.totSortWght + pckgRegInfoVO.pckgSortWght;
      } else {
        // 직전값과 다르면 group num +1
        pckgRegInfoVO.group = prvPckgRegInfo.group + 1;
        // 투입그룹 선별중량 합 초기화
        pckgRegInfoVO.totSortWght = pckgRegInfoVO.pckgSortWght;
      }
      // 그룹별 투입중량 < 선별중량 error
      if (pckgRegInfoVO.totSortWght > pckgRegInfoVO.pckgInputWght && pckgRegInfoVO.pckgInputWght > 0) {
        // gfn_comAlert("W0008", "투입량", "선별량");		// W0008	{0} 보다 {1}이/가 큽니다.
        // return;

        pckgRegInfoVO.group = prvPckgRegInfo.group + 1;
        pckgRegInfoVO.totSortWght = pckgRegInfoVO.pckgSortWght;
      }
    }


    jsonPckgRegList.push(pckgRegInfoVO);

    grdPckgRegList.refresh();

  }

  const fn_savePckgInfo = async function () {
    const sortInvntrList = [];  // 재고량
    const pckgPrfmncList = [];

    const cmprPckgData = [];  // 포장등록 데이터 비교용
    let checkItemList = []; // 선별재고목록조회용 품종/품목 리스트
    const setItem = new Set(checkItemList);

    let groupChck = 0;  // 그룹번호 체크

    let pckgRegData = grdPckgRegList.getGridDataAll();

    for (const pckgDataVO of pckgRegData) {
      const stdGrdList = [];  // 포장상품 등급

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
        spmtPckgUnitCd: pckgDataVO.pckgUnitCd,
        warehouseSeCd: pckgDataVO.strgWrhusSeCd,
        //pckgCmndno: pckgCmndno,
        rmrk: pckgDataVO.rmrk,
        pckgQntt: pckgDataVO.pckgSortQntt,
        pckgWght: pckgDataVO.pckgSortWght,
        stdGrdList: stdGrdList,
      }
      // 포장등록 데이터 비교용
      cmprPckgData.push({
        pckgYmd: pckgDataVO.pckgYmd,  // 선별일자
        group: pckgDataVO.group,
        warehouseSeCd: pckgDataVO.inputWrhusSeCd,
        inputQntt: pckgDataVO.pckgInputQntt,
        inputWght: pckgDataVO.pckgInputWght,
        prdcrCd: pckgDataVO.prdcrCd,
        wrhsSeCd: pckgDataVO.wrhsSeCd,
        gdsSeCd: pckgDataVO.gdsSeCd,
      });
      // 선별재고목록죄회용 품종/품목 리스트
      const checkItem = pckgDataVO.itemCd + pckgDataVO.vrtyCd;
      if (!setItem.has(checkItem)) {
        setItem.add(checkItem);
        checkItemList.push(checkItem);
      }
      pckgPrfmncList.push(pckgPrfmnc);
    }
    console.log("pckgPrfmncList", pckgPrfmncList);
    console.log("cmprPckgData", cmprPckgData);

    // 선별재고내역조회 (품종/품목)
    for (const item of checkItemList) {
      try {
        const postJsonPromise = gfn_postJSON("/am/invntr/selectSortInvntrListForRslt.do", {
          apcCd: gv_selectedApcCd,
          itemCd: item.substring(0, 4),
          vrtyCd: item.substring(4),
        });

        const data = await postJsonPromise;
        if (_.isEqual("S", data.resultStatus)) {
          let sortInvntr = data.resultList;
          console.log("sortInvntr", sortInvntr);

          for (const pckgRegInfo of cmprPckgData) {
            for(const obj of sortInvntr) {
              // obj 키값 변경 rprsPrdcrCd -> prdcrCd
              obj.prdcrCd = obj.rprsPrdcrCd;
              delete obj.rprsPrdcrCd;

              const chkKey = ['warehouseSeCd', 'prdcrCd', 'wrhsSeCd', 'gdsSeCd'];
              let curPckgData = _.pick(pckgRegInfo, chkKey);
              let invntrData = _.pick(obj, chkKey);

              if (_.isEqual(curPckgData, invntrData)) {
                console.log("pckgRegInfo", pckgRegInfo);
                console.log("obj", obj);

                // 선별재고 수량 확인
                if (pckgRegInfo.inputWght > obj.invntrWght) {
                  console.log("투입중량 > 선별재고중량.");
                  continue;
                }  // 선별재고 중량보다 투입중량이 크면 skip

                console.log("투입중량 <= 선별재고중량");

                // 그룹번호가 다르면 선별재고내역 추가, 같으면 선별 수량 합산
                // 선별재고는 입고된 순서로 처리. 투입 순서 주의
                if (groupChck != pckgRegInfo.group) {
                  sortInvntrList.push({
                    sortno: obj.sortno,
                    sortSn: obj.sortSn,
                    pckgCmndno: obj.pckgCmndno,
                    sortInptPrgrsYn: obj.sortInptPrgrsYn,

                    inptQntt: pckgRegInfo.inputQntt,
                    inptWght: pckgRegInfo.inputWght,
                  });

                  groupChck = pckgRegInfo.group;
                  // 재고목록 제외 - 중복저장 방지
                  sortInvntr = sortInvntr.filter(item => !_.isEqual(item, obj));
                }
              }
              if (parseFloat(obj.inptPrgrsWght) || 0 > 0) {
                rawMtrInvntrList.inptPrgrsYn = "Y";
              }
            }
          }

          if (sortInvntrList.length == 0) {
            gfn_comAlert("W0005", "선별재고대상");		//	W0005	{0}이/가 없습니다.
            return;
          }

          const pckgMng = {
            apcCd: gv_selectedApcCd,
            pckgYmd: SBUxMethod.get("srch-dtp-pckgYmd"),
            sortInvntrList: sortInvntrList,
            pckgPrfmncList: pckgPrfmncList,
          }
          console.log(pckgMng, "저장전");
          return;

          const postJsonPromise = gfn_postJSON("/am/pckg/insertPckgPrfmnc.do", pckgMng);
          const pckgData = await postJsonPromise;

          if (_.isEqual("S", pckgData.resultStatus)) {
            gfn_comAlert("I0001");	// I0001	처리 되었습니다.
          } else {
            gfn_comAlert(pckgData.resultCode, pckgData.resultMessage);	//	E0001	오류가 발생하였습니다.
            //gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
          }

          pckgPrfmncList.length = 0;  // 포장실적 목록 초기화
        } else {
          gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
        }
      } catch (e) {
        if (!(e instanceof Error)) {
          e = new Error(e);
        }
        console.error("failed", e.message);
        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
      }
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
