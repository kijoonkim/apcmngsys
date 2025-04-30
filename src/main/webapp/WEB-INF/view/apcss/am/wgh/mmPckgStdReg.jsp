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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

  /* Grid 생성 */
  var grdPckgRegList;
  var jsonPckgRegList = [];

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
      {caption: ["선택", "선택"],	ref: 'chc',      	type:'checkbox',  width:'50px',    style:'text-align:center', typeinfo : {checkedvalue : 'T', uncheckedvalue : 'F'}, sortable: false},
      {caption: ["그룹", "그룹"],		ref: 'group',     type:'output',  width:'80px',    style:'text-align:center', sortable: false},
      {caption: ["입고일자", "입고일자"],		ref: 'wrhsYmd',      type:'output',  width:'100px',    style:'text-align:center'},
      {caption: ["팔레트", ""],		ref: 'pltChck',      type:'checkbox',  width:'50px',    style:'text-align:center', typeinfo : {checkedvalue : 'T', uncheckedvalue : 'F'}, sortable: false},
      {caption: ["팔레트", "번호"],		ref: 'pltno',     type:'output',  width:'120px',    style:'text-align:center', sortable: true},
      {caption: ["팔레트", "종류"],		ref: 'pltKnd',    type:'output',  width:'100px',    style:'text-align:center', sortable: false},
      {caption: ["생산자", "생산자"],		ref: 'prdcrNm',  type:'output',  width:'100px',    style:'text-align:center', sortable: true},
      {caption: ["품목", "품목"],		ref: 'itemNm',      	type:'output',  width:'80px',    style:'text-align:center', sortable: true},
      {caption: ["품종", "품종"],		ref: 'vrtyNm',      type:'output',  width:'80px',    style:'text-align:center', sortable: true},
      {caption: ["차량번호", "차량번호"],		ref: 'vhclno',      type:'output',  width:'120px',    style:'text-align:center', sortable: false},
      {caption: ["입고정보", "수량"],	ref: 'bxQntt',    type:'output',  width:'60px',    style:'text-align:right', sortable: false, format : {type:'number', rule:'#,###'}},
      {caption: ["입고정보", "중량"],		ref: 'wrhsWght',     type:'output',  width:'60px',    style:'text-align:right', sortable: false, format : {type:'number', rule:'#.###'}},
      {caption: ["입고정보", "박스종류"],		ref: 'bxKnd',	type:'output',  width:'100px',    style:'text-align:center'},
      {caption: ["창고", "창고"],		ref: 'warehouseSeNm',      	type:'output',  width:'100px',    style:'text-align:center', sortable: true},
      {caption: ["등급", "등급"],		ref: 'grdNm',    type:'output',  width:'80px',    style:'text-align:center', sortable: false},
      {caption: ["등급상세", "등급상세"],		ref: 'grdStd',  type:'output',  width:'100px',    style:'text-align:center', sortable: false},
      {caption: ["입고구분", "입고구분"],		ref: 'wrhsSeNm',    	type:'output',  width:'80px',    style:'text-align:center', sortable: false},
      {caption: ["상품구분", "상품구분"],		ref: 'gdsSeNm',      	type:'output',  width:'80px',    style:'text-align:center', sortable: false},
      {caption: ["운송구분", "운송구분"],	ref: 'trsprtSeNm',     	type:'output',  width:'80px', style:'text-align:center'},
      {caption: ["비고", "비고"],		ref: 'rmrk',     	type:'output',  width:'200px', style:'text-align:left'},

      {caption: ["APC코드"], ref: 'apcCd', type: 'output', hidden: true},
      {caption: ["입고번호"], ref: 'wrhsno', type: 'output', hidden: true},
      {caption: ["생산자코드"], ref: 'prdcrCd', type: 'output', hidden: true},
      {caption: ["품목코드"], ref: 'itemCd', type: 'output', hidden: true},
      {caption: ["품종코드"], ref: 'vrtyCd', type: 'output', hidden: true},
      {caption: ["상품구분코드"], ref: 'gdsSeCd', type: 'output', hidden: true},
      {caption: ["입고구분코드"], ref: 'wrhsSeCd', type: 'output', hidden: true},
      {caption: ["운송구분코드"], ref: 'trsprtSeCd', type: 'output', hidden: true},
      {caption: ["등급코드"], ref: 'grdCd', type: 'output', hidden: true},
      {caption: ["박스종류코드"], ref: 'bxKnd', type: 'output', hidden: true},
      {caption: ["보관창고코드"], ref: 'warehouseSeCd', type: 'output', hidden: true},
      {caption: ["상세등급코드"], ref: 'stdGrdCd', type: 'output', hidden: true},
      {caption: ["등급유형"], ref: 'stdGrdType', type: 'output', hidden: true},
      {caption: ["처리구분"], ref: 'prcsType', type: 'output', hidden: true},
    ];

    grdPckgRegList = _SBGrid.create(SBGridProperties);
    // grdPckgRegList.bind('click', fn_view);
  }

  /**
   * @name fn_initPckgReg
   * @description form init
   */
  const fn_initPckgReg = async function() {
    fn_createGridPckgReg();

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
<html>
<head>
  <meta charset="UTF-8">
  <title>title : 포장등록</title>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start;" >
      <div style="margin-left: auto;">
        <sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" text="초기화" onclick="fn_reset"></sbux-button>
        <sbux-button id="btnAdd" name="btnAdd" uitype="normal" class="btn btn-sm btn-outline-danger" text="추가" onclick="fn_add"></sbux-button>
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
                        id="srch-slt-itemCd"
                        name="srch-slt-itemCd"
                        class="form-control input-sm input-sm-ast"
                        jsondata-ref="jsonApcItem"
                        onchange="">
                </sbux-select>
              </div>
              <div>
                <sbux-select
                        unselected-text="선택"
                        uitype="single"
                        id="srch-slt-vrtyCd"
                        name="srch-slt-vrtyCd"
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
                      id="srch-slt-spcfct"
                      name="srch-slt-spcfct"
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
                      id="srch-slt-strgWrhus"
                      name="srch-slt-strgWrhus"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      jsondata-ref=""
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
                      id="srch-slt-inputWrhus"
                      name="srch-slt-inputWrhus"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref=""
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
                      id="srch-inp-inputQntt"
                      name="srch-inp-inputQntt"
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
                      id="srch-slt-gdsGrd"
                      name="srch-slt-gdsGrd"
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
                      id="srch-chk-pckg"
                      name="srch-chk-pckg"
                      uitype="normal"
                      text="사용"
              ></sbux-checkbox>
              <sbux-select
                      style="flex:1"
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-stdGrd"
                      name="srch-slt-stdGrd"
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
                      id="srch-inp-sortQntt"
                      name="srch-inp-sortQntt"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      autocomplete="off"
                      mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
              <sbux-input
                      uitype="text"
                      id="srch-inp-sortAvg"
                      name="srch-inp-sortAvg"
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
                      id="srch-slt-spcfct"
                      name="srch-slt-spcfct"
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
                      id="srch-inp-rmrk"
                      name="srch-inp-rmrk"
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
                        id="srch-inp-prdcrNm"
                        name="srch-inp-prdcrNm"
                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                        placeholder="초성검색 가능"
                        autocomplete-ref="jsonPrdcrAutocomplete"
                        autocomplete-text="name"
                        autocomplete-height="270px"
                        oninput="fn_onInputPrdcrNm(event)"
                        autocomplete-select-callback="fn_onSelectPrdcrNm"
                ></sbux-input>
              </div>
              <div style="flex: 1 0 8em">
                <sbux-input
                        uitype="text"
                        id="srch-inp-prdcrIdentno"
                        name="srch-inp-prdcrIdentno"
                        class="form-control input-sm"
                        maxlength="2"
                        autocomplete="off"
                        onchange="fn_onChangeSrchPrdcrIdentno(this)"
                ></sbux-input>
              </div>
              <div style="flex: 0">
                <sbux-button
                        id="btn-srch-prdcr"
                        name="btn-srch-prdcr"
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
                      id="srch-slt-wrhsSeCd"
                      name="srch-slt-wrhsSeCd"
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
                      id="srch-slt-gdsSeCd"
                      name="srch-slt-gdsSeCd"
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
</html>
