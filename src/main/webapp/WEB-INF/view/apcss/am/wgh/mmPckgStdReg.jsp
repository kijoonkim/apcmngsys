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
                      id="srch-slt-pckgFclt"
                      name="srch-slt-pckgFclt"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      jsondata-ref=""
                      onchange="">
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
                        onchange="">
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
                        onchange="">
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
                      id="srch-slt-pckgGrdCd"
                      name="srch-slt-pckgGrdCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
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
                      id="srch-slt-pckgStrgWrhus"
                      name="srch-slt-pckgStrgWrhus"
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
                      id="srch-slt-pckgInputWrhus"
                      name="srch-slt-pckgInputWrhus"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonComWarehouse"
                      onchange="">
              </sbux-select>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">투입량</th>
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
                      id="srch-inp-inputAvg"
                      name="srch-inp-inputAvg"
                      class="form-control input-sm"
                      autocomplete="off"
                      mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
            </div>
          </td>
          <th scope="row" class="th_bg">상품등급</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-pckgGdsGrd"
                      name="srch-slt-pckgGdsGrd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
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
          <th scope="row" class="th_bg">선별량</th>
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
                      id="srch-inp-pckgSortAvg"
                      name="srch-inp-pckgSortAvg"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      autocomplete="off"
                      mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
            </div>
          </td>
          <th scope="row" class="th_bg">규격</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-pckgSpcfct"
                      name="srch-slt-pckgSpcfct"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
                      onchange="">
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
                        oninput="/*fn_onInputPrdcrNm(event)*/"
                        autocomplete-select-callback="<%--fn_onSelectPrdcrNm--%>"
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
                        onchange="/*fn_onChangeSrchPrdcrIdentno(this)*/"
                ></sbux-input>
              </div>
              <div style="flex: 0">
                <sbux-button
                        id="btn-srch-pckgPrdcr"
                        name="btn-srch-pckgPrdcr"
                        class="btn btn-xs btn-outline-dark"
                        text="찾기" uitype="modal"
                        target-id="modal-prdcr"
                        onclick=""
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
                      jsondata-ref=""
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
                      jsondata-ref=""
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
    /*SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
    SBUxMethod.set("srch-dtp-prdctnYr", gfn_dateToYear(new Date()));


    let result = await Promise.all([
      fn_initSBSelect(),
      fn_initSBRadio(),
      fn_getPrdcrs()
    ]);

    fn_clearForm();*/
  }

</script>
</html>
