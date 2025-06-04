<%
  /**
   * @Class Name : mmSpmtStdReg.jsp
   * @Description : 원물입고등록 - 출하등록 화면
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
<html>
<head>
  <meta charset="UTF-8">
  <title>title : 출하등록</title>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start; padding: 10px 15px 5px;" >
      <div style="margin-left: auto;">
        <sbux-button id="btnReset" name="btnReset" uitype="normal" class="btn btn-sm btn-outline-danger" text="초기화" onclick="fn_reset"></sbux-button>
        <sbux-button id="btnAdd" name="btnAdd" uitype="normal" class="btn btn-sm btn-outline-danger" text="추가" onclick="fn_addSpmt"></sbux-button>
      </div>
    </div>
    <div class="box-body">
      <%--생산자 코드--%>
      <sbux-input id="srch-inp-spmtPrdcrCd" name="srch-inp-spmtPrdcrCd" uitype="hidden"></sbux-input>
      <table id="rawMtrPckgTable" class="table table-bordered tbl_fixed">
        <caption>출하 등록 조건 설정</caption>
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
          <th scope="row" class="th_bg">출하일자</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-datepicker uitype="popup" id="srch-dtp-spmtYmd" name="srch-dtp-spmtYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"></sbux-datepicker>
            </div>
          </td>
          <th scope="row" class="th_bg">거래처</th>
          <td class="td_input" style="border-right: hidden">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-cnptCd"
                      name="srch-slt-cnptCd"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      jsondata-ref="jsonComCnptCd"
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">배송처</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-input
                      style="flex-grow: 1"
                      uitype="text"
                      id="srch-inp-dldtn"
                      name="srch-inp-dldtn"
                      class="form-control input-sm"
                      autocomplete="off"
              ></sbux-input>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">차량번호</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      style="flex:0 40%"
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-vhclno"
                      name="srch-slt-vhclno"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonVhcl"
                      onchange="fn_onChangeVhclNo(this)">
              </sbux-select>
              <sbux-input
                      style="flex:0 30%"
                      uitype="text"
                      id="srch-inp-drvrNm"
                      name="srch-inp-drvrNm"
                      class="form-control input-sm"
                      autocomplete="off"
              ></sbux-input>
            </div>
          </td>
          <th scope="row" class="th_bg">운송사</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-trsprtCoCd"
                      name="srch-slt-trsprtCoCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonComTrsprtCoCd"
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">운임비용</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-input
                      style="flex-grow:1"
                      uitype="text"
                      id="srch-inp-trsprtCst"
                      name="srch-inp-trsprtCst"
                      class="form-control input-sm"
                      autocomplete="off"
                      mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
                      maxlength="10"
              ></sbux-input>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">상품명</th>
          <td class="td_input"style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-spmtPckgUnitCd"
                      name="srch-slt-spmtPckgUnitCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonSpmtPckgUnit"
                      onchange="fn_onChangeSpmtPckgUnit(this)">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">상품정보</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-input
                      style="flex-grow:1"
                      uitype="text"
                      id="srch-inp-gdsInfo"
                      name="srch-inp-gdsInfo"
                      class="form-control input-sm"
                      autocomplete="off"
              ></sbux-input>
            </div>
          </td>
          <th scope="row" class="th_bg">상품등급</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-spmtGdsGrdSeCd"
                      name="srch-slt-spmtGdsGrdSeCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonComPckgGrdSeCd"
                      onchange="">
              </sbux-select>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">출하수량/중량</th>
          <td class="td_input"style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-input
                      uitype="text"
                      id="srch-inp-spmtQntt"
                      name="srch-inp-spmtQntt"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      autocomplete="off"
                      mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange="fn_onChangeSpmtQntt(this)"
              ></sbux-input>
              <sbux-input
                      uitype="text"
                      id="srch-inp-spmtWght"
                      name="srch-inp-spmtWght"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      autocomplete="off"
                      mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                      onchange=""
              ></sbux-input>
              <sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"></sbux-label>
            </div>
          </td>
          <th scope="row" class="th_bg">저장창고</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-spmtStrgWrhusSeCd"
                      name="srch-slt-spmtStrgWrhusSeCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonComWarehouse"
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
          <th scope="row" class="th_bg">거래형태</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-dlngShapCd"
                      name="srch-slt-dlngShapCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonDlngShapCd"
                      onchange=""
              ></sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">매매방법</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-dlngMthCd"
                      name="srch-slt-dlngMthCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonDlngMthdCd"
                      onchange="">
              </sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">팔레트불출</th>
          <td class="td_input">
            <div class="displayFlex">
              <sbux-select
                      style="flex: 0 40%"
                      unselected-text="전체"
                      uitype="single"
                      id="srch-slt-pltBxCd"
                      name="srch-slt-pltBxCd"
                      class="form-control input-sm input-sm-ast"
                      jsondata-ref="jsonApcBx"
                      onchange="">
              </sbux-select>
              <sbux-input
                      id="dtl-inp-bssInvntrQntt"
                      name="dtl-inp-bssInvntrQntt"
                      uitype="text"
                      class="form-control input-sm"
                      autocomplete="off"
                      mask = "{ 'alias': 'numeric' , 'autoGroup': 3 , 'groupSeparator': ',' , 'isShortcutChar': true, 'autoUnmask': true }"
                      maxlength="3"
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
                        id="srch-inp-spmtPrdcrNm"
                        name="srch-inp-spmtPrdcrNm"
                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                        placeholder="초성검색 가능"
                        autocomplete-ref="jsonPrdcrAutocomplete"
                        autocomplete-text="name"
                        autocomplete-height="270px"
                        oninput="fn_OnInputSpmtPrdcrNm(event)"
                        autocomplete-select-callback="fn_onSelectSpmtPrdcrNm"
                ></sbux-input>
              </div>
              <div style="flex: 1 0 8em">
                <sbux-input
                        uitype="text"
                        id="srch-inp-spmtPrdcrIdentno"
                        name="srch-inp-spmtPrdcrIdentno"
                        class="form-control input-sm"
                        maxlength="2"
                        autocomplete="off"
                        onchange="fn_onChangeSpmtSrchPrdcrIdentno(this)"
                ></sbux-input>
              </div>
              <div style="flex: 0">
                <sbux-button
                        id="btn-srch-spmtPrdcr"
                        name="btn-srch-spmtPrdcr"
                        class="btn btn-xs btn-outline-dark"
                        text="찾기" uitype="modal"
                        target-id="modal-prdcr"
                        onclick="fn_spmtChoicePrdcr"
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
                      id="srch-slt-spmtWrhsSeCd"
                      name="srch-slt-spmtWrhsSeCd"
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
                      id="srch-slt-spmtGdsSeCd"
                      name="srch-slt-spmtGdsSeCd"
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
            <span>출하 등록 목록</span>
          </li>
        </ul>
        <div class="ad_tbl_toplist">
          <sbux-button id="btnSpmtDel" name="btnSpmtDel" uitype="normal" text="행삭제" class="btn btn-sm btn-outline-danger"
                       onclick="fn_delSpmtRow"
                       style="margin-right:5px"
                       image-src="/resource/svg/grdMinus.svg"
                       image-style="width:3rem;height:20px"
                       image-placement="front"
          ></sbux-button>
        </div>
      </div>
      <div class="table-responsive tbl_scroll_sm">
        <div id="sb-area-grdSpmtRegList" style="height: 430px"></div>
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
  var jsonComCnptCd = []; // 거래처
  var jsonVhcl = []; // 차량번호
  var jsonComTrsprtCoCd		= [];	// 운송사 			trsprtCo		검색
  var jsonDlngShapCd = []; // 거래형태
  var jsonDlngMthdCd = []; // 매매방법

  /* Grid 생성 */
  var grdSpmtRegList;
  var jsonSpmtRegList = [];

  /*window.addEventListener('DOMContentLoaded', async function(e) {
    fn_initSpmtReg();
    fn_createGridSpmtReg();
  });*/

  /**
   * @name fn_createGridSpmtReg
   * @description 입고등록목록 그리드 생성
   */
  const fn_createGridSpmtReg = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-grdSpmtRegList';
    SBGridProperties.id = 'grdSpmtRegList';
    SBGridProperties.jsonref = 'jsonSpmtRegList';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.extendlastcol = 'none';
    SBGridProperties.explorerbar = 'sort';
    // SBGridProperties.allowcopy = true;

    SBGridProperties.columns = [
      {caption: ["선택", "선택"],	    ref: 'checkedYn',       type:'checkbox',  width:'50px',   style:'text-align:center', typeinfo : {fixedcellcheckbox : {usemode : true, rowindex : 0, deletecaption : false}, checkedvalue : 'Y', uncheckedvalue : 'N'}, sortable: false},
      {caption: ["그룹", "그룹"],		ref: 'group',           type:'output',    width:'50px',   style:'text-align:center', sortable: false},
      {caption: ["출하일자", "출하일자"],	ref: 'spmtYmd',         type:'output',    width:'80px',  style:'text-align:center'},
      {caption: ["거래처", "거래처"],	ref: 'cnptNm',        type:'output',    width:'80px',  style:'text-align:center', sortable: false},
      {caption: ["배송처", "배송처"],	ref: 'dldtn',        type:'output',    width:'80px',  style:'text-align:center', sortable: false},
      {caption: ["운송정보", "차량번호"],		ref: 'vhclNo',          type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["운송정보", "운송사"],		ref: 'trsprtCoNm',          type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["운송정보", "운임비(원)"],		ref: 'trsprtCst',          type:'output',    width:'80px',   style:'text-align:center', format : {type:'number', rule:'#,###.###'}, sortable: false},
      {caption: ["상품정보", "상품명"],	    ref: 'spmtPckgUnitNm',  type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["상품정보", "상품규격"],		ref: 'spcfctNm',          type:'output',    width:'60px',  style:'text-align:center', sortable: false},
      {caption: ["상품정보", "상품등급"],	ref: 'gdsGrdNm',           type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["출하정보", "창고"],		ref: 'strgWrhusSeNm',	    type:'output',    width:'80px',  style:'text-align:center'},
      {caption: ["출하정보", "수량"],	    ref: 'spmtQntt',        type:'output',    width:'70px',   style:'text-align:right', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["출하정보", "중량(kg)"],	ref: 'spmtWght',        type:'output',    width:'70px',   style:'text-align:right', sortable: false, format : {type:'number', rule:'#,###.###'}},
      {caption: ["거래형태", "거래형태"],		ref: 'dlngShapNm',      type:'output',  width:'50px',   style:'text-align:center', sortable: false},
      {caption: ["매매방법", "매매방법"],	    ref: 'dlngMthNm',        type:'output',    width:'60px',   style:'text-align:center', sortable: false},
      {caption: ["생산자", "생산자"],		ref: 'prdcrNm',         type:'output',    width:'60px',  style:'text-align:center', sortable: false},
      {caption: ["입고구분", "입고구분"],	ref: 'wrhsSeNm',        type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["상품구분", "상품구분"],	ref: 'gdsSeNm',         type:'output',    width:'80px',   style:'text-align:center', sortable: false},
      {caption: ["비고", "비고"],		ref: 'rmrk',     	    type:'output',    width:'200px',  style:'text-align:left'},
      {caption: ["팔레트 불출", "종류"],		ref: 'pltBxNm',     	    type:'output',    width:'80px',  style:'text-align:left'},
      {caption: ["팔레트 불출", "수량"],		ref: 'pltQntt',     	    type:'output',    width:'80px',  style:'text-align:left', format : {type:'number', rule:'#,###.###'}},

      {caption: ["거래처코드"], ref: 'cnptCd', type: 'output', hidden: true},
      {caption: ["운송사코드"], ref: 'trsprtCoCd', type: 'output', hidden: true},
      {caption: ["품목코드"], ref: 'itemCd', type: 'output', hidden: true},
      {caption: ["품종코드"], ref: 'vrtyCd', type: 'output', hidden: true},
      {caption: ["상품코드"], ref: 'spmtPckgUnitCd',  type: 'output', hidden: true},
      {caption: ["규격코드"], ref: 'spcfctCd', type: 'output', hidden: true},
      {caption: ["상품등급코드"], ref: 'gdsGrdCd',   type: 'output', hidden: true},
      {caption: ["투입창고코드"], ref: 'strgWrhusSeCd', type: 'output', hidden: true},
      {caption: ["거래형태코드"], ref: 'dlngShapCd', type: 'output', hidden: true},
      {caption: ["매매방법코드"], ref: 'dlngMthCd', type: 'output', hidden: true},
      {caption: ["생산자코드"],  ref: 'prdcrCd', type: 'output', hidden: true},
      {caption: ["입고구분코드"], ref: 'wrhsSeCd', type: 'output', hidden: true},
      {caption: ["상품구분코드"], ref: 'gdsSeCd', type: 'output', hidden: true},
      {caption: ["팔레트코드"], ref: 'pltBxCd',  type: 'output', hidden: true},
    ];

    grdSpmtRegList = _SBGrid.create(SBGridProperties);
    // grdSpmtRegList.bind('click', fn_view);
  }

  /**
   * @name fn_initSpmtReg
   * @description form init
   */
  const fn_initSpmtReg = async function() {

    SBUxMethod.set("srch-dtp-spmtYmd", gfn_dateToYmd(new Date()));
    fn_createGridSpmtReg();

    let result = await Promise.all([
      fn_initSpmtSBSelect(),
      // fn_initSBRadio(),
      // fn_getPrdcrs()
    ]);

    fn_clearForm();
  }

  /**
   * @name fn_initSpmtSBSelect
   * @description SBSelect JSON 불러오기
   */
  const fn_initSpmtSBSelect = async function() {
    // 검색 SB select
    let result = await Promise.all([
      gfn_setCpntSBSelect('srch-slt-cnptCd', jsonComCnptCd, gv_selectedApcCd),	// 거래처
      gfn_setTrsprtsSBSelect('srch-slt-trsprtCoCd', jsonComTrsprtCoCd,  gv_selectedApcCd),		// 운송사
      gfn_setSpmtPckgUnitSBSelect("srch-slt-spmtPckgUnitCd", jsonSpmtPckgUnit, gv_selectedApcCd),	// 출하포장단위
      gfn_setPltBxSBSelect('srch-slt-pltBxCd', jsonApcBx, gv_selectedApcCd, 'P'),	// 팔레트
      gfn_setSBSelectJson('srch-slt-vhclno', jsonVhcl, await gfn_getVhcls(gv_selectedApcCd)),        // 차량번호
      gfn_setComCdSBSelect('srch-slt-spmtStrgWrhusSeCd',  jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 저장창고
      gfn_setComCdSBSelect('srch-slt-spmtWrhsSeCd',       jsonComWrhsSeCd, 	'WRHS_SE_CD'),							// 입고구분
      gfn_setComCdSBSelect('srch-slt-spmtGdsSeCd',        jsonComGdsSeCd, 	'GDS_SE_CD', gv_selectedApcCd),							// 상품구분
      gfn_setComCdSBSelect('srch-slt-dlngShapCd', jsonDlngShapCd, 'DLNG_SHAP_CD'),		// 거래형태
      gfn_setComCdSBSelect('srch-slt-dlngMthCd',  jsonDlngMthdCd, 'DLNG_MTHD_CD'),		// 매매방법
    ]);

    jsonSpmtPckgUnit.forEach((item) => {
      item.text = "[" + item.itemNm + " " + item.vrtyNm + "] " + item.spmtPckgUnitNm;
    });
    SBUxMethod.refresh("srch-slt-spmtPckgUnitCd");
  }


  /**
   * @name fn_getvhcls
   * @description  APC별 차량 목록 가져오기
   * @function
   * @param {string} _apcCd		APC코드
   * @returns {any[]}
   */
  const gfn_getVhcls = async function(_apcCd) {
    const postJsonPromise = gfn_postJSON(URL_WRHS_VHCL, {apcCd: _apcCd, delYn: "N"});
    const data = await postJsonPromise;
    const sourceJson = [];
    data.resultList.forEach((item) => {
      sourceJson.push({
        vhclno: item.vhclno,
        drvrNm: item.drvrNm,
        cmnsNm: item.vhclno,
        cmnsCd: item.vhclno,
      });
    });

    return sourceJson;
  }

  /**
   * @name fn_onChangeVhclNo
   * @description  차량번호 변경 event
   */
  const fn_onChangeVhclNo = function(obj) {
    const vhclInfo = _.find(jsonVhcl, {vhclno: obj.value});
    SBUxMethod.set("srch-inp-drvrNm", vhclInfo.drvrNm || "");
  }

  /**
   * @name fn_onChangeSpmtPckgUnit
   * @description  상품명 변경 event
   */
  const fn_onChangeSpmtPckgUnit = async function(obj) {
    const spmtPckgUnitInfo = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: obj.value});
    const gdsInfo = spmtPckgUnitInfo.itemNm + " / " + spmtPckgUnitInfo.vrtyNm + " / " + spmtPckgUnitInfo.spcfctNm + " / " + spmtPckgUnitInfo.spmtPckgUnitNm;


    SBUxMethod.set("srch-inp-gdsInfo", gdsInfo);

    await gfn_setApcGdsGrdSBSelect('srch-slt-spmtGdsGrdSeCd', 	jsonComPckgGrdSeCd, 	gv_selectedApcCd, spmtPckgUnitInfo.itemCd, _GRD_SE_CD_GDS);	// 포장상품등급
    await fn_onChangeSpmtQntt();
  }

  /**
   * @name fn_onChangeSpmtQntt
   * @description  출하수량 변경 event
   */
  const fn_onChangeSpmtQntt = async function(obj) {
    const spmtPckgUnitCd = SBUxMethod.get("srch-slt-spmtPckgUnitCd");

    if (!gfn_isEmpty(spmtPckgUnitCd)) {
      let spmtQntt = parseInt(SBUxMethod.get("srch-inp-spmtQntt")) || 0;
      const spmtPckgUnitInfo = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: spmtPckgUnitCd});
      const spmtSpcfctWght = parseFloat(spmtPckgUnitInfo.spcfctWght) || 0;
      console.log("spmtPckgUnitInfo", spmtPckgUnitInfo);

      if (spmtSpcfctWght > 0) {
        let spmtWght = gfn_apcEstmtWght(spmtQntt * spmtSpcfctWght, gv_selectedApcCd);
        SBUxMethod.set("srch-inp-spmtWght", spmtWght);
      } else {
        SBUxMethod.set("srch-inp-spmtWght", "");
      }
    }
  }

  /**
   * @name fn_clearSpmtPrdcr
   * @description 생산자 폼 clear
   */
  const fn_clearSpmtPrdcr = function() {
    SBUxMethod.set("srch-inp-spmtPrdcrCd", "");
    SBUxMethod.set("srch-inp-spmtPrdcrIdentno", "");
    SBUxMethod.attr("srch-inp-spmtPrdcrNm", "style", "background-color:''");
  }

  /**
   * @name fn_OnInputSpmtPrdcrNm
   * @description 생산자명 입력 시 event : autocomplete
   */
  const fn_OnInputSpmtPrdcrNm = function(prdcrNm){
    fn_clearSpmtPrdcr();
    if(getByteLengthOfString(prdcrNm.target.value) > 100){
      SBUxMethod.set("srch-inp-spmtPrdcrNm", "");
      return;
    }
    jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);

    SBUxMethod.changeAutocompleteData('srch-inp-spmtPrdcrNm', true);
  }

  /**
   * @name fn_onSelectSpmtPrdcrNm
   * @description 생산자 autocomplete 선택 callback
   */
  function fn_onSelectSpmtPrdcrNm(value, label, item) {
    // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
    if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
      document.getElementById('btn-srch-spmtPrdcr').click();
    } else{
      SBUxMethod.set("srch-inp-spmtPrdcrCd", value);
      SBUxMethod.attr("srch-inp-spmtPrdcrNm", "style", "background-color:aquamarine");	//skyblue
      let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
      prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;

      fn_setSpmtPrdcrForm(prdcr);

    }
  }

  const fn_setSpmtPrdcrForm = async function(prdcr) {
    if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
      SBUxMethod.set("srch-inp-spmtPrdcrIdentno", prdcr.prdcrIdentno);
    } else {
      SBUxMethod.set("srch-inp-spmtPrdcrIdentno", "");
    }

  }

  /**
   * @name fn_spmtChoicePrdcr
   * @description 생산자 선택 popup 호출
   */
  const fn_spmtChoicePrdcr = function() {
    popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setSpmtPrdcr, SBUxMethod.get("srch-inp-spmtPrdcrNm"));
  }

  /**
   * @name fn_setSpmtPrdcr
   * @description 생산자 선택 popup callback 처리
   */
  const fn_setSpmtPrdcr = async function(prdcr) {

    await fn_getPrdcrs();

    if (!gfn_isEmpty(prdcr)) {
      SBUxMethod.set("srch-inp-spmtPrdcrCd", prdcr.prdcrCd);
      SBUxMethod.set("srch-inp-spmtPrdcrNm", prdcr.prdcrNm);
      SBUxMethod.attr("srch-inp-spmtPrdcrNm", "style", "background-color:aquamarine");	//skyblue

      await fn_setSpmtPrdcrForm(prdcr);
    }
  }

  const fn_onChangeSpmtSrchPrdcrIdentno = function(obj) {

    if (gfn_isEmpty(SBUxMethod.get("srch-inp-spmtPrdcrIdentno"))) {
      return;
    }

    SBUxMethod.set("srch-inp-spmtPrdcrCd", "");
    SBUxMethod.set("srch-inp-spmtPrdcrNm", "");
    SBUxMethod.attr("srch-inp-spmtPrdcrNm", "style", "");	//skyblue

    let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-spmtPrdcrIdentno")) || 0;

    if (prdcrIdentno < 1) {
      return;
    }

    const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
    if (gfn_isEmpty(prdcrInfo)) {
      return;
    }

    SBUxMethod.set("srch-inp-spmtPrdcrCd", prdcrInfo.prdcrCd);
    SBUxMethod.set("srch-inp-spmtPrdcrNm", prdcrInfo.prdcrNm);
    SBUxMethod.attr("srch-inp-spmtPrdcrNm", "style", "background-color:aquamarine");	//skyblue

    fn_setSpmtPrdcrForm(prdcrInfo);

  }

  /**
   * @name fn_reset
   * @description 초기화 버튼
   */
  const fn_resetSpmt = async function() {
    // fn_clearForm();
  }

  /**
   * @name fn_addSpmt
   * @description 출하목록 추가 버튼
   */
  const fn_addSpmt = async function () {
    let spmtYmd = SBUxMethod.get("srch-dtp-spmtYmd");   // 출하일자
    let cnptCd = SBUxMethod.get("srch-slt-cnptCd");   // 거래처코드
    let dldtn = SBUxMethod.get("srch-inp-dldtn");   // 배송처
    let vhclNo = SBUxMethod.get("srch-slt-vhclno");   // 차량번호
    let trsprtCoCd = SBUxMethod.get("srch-slt-trsprtCoCd");   // 운송사코드
    let trsprtCst = SBUxMethod.get("srch-inp-trsprtCst");   // 운임비
    let spmtPckgUnitCd = SBUxMethod.get("srch-slt-spmtPckgUnitCd");   // 상품명코드
    let spcfctCd = SBUxMethod.get("srch-slt-spmtPckgUnitCd");   // 규격코드
    let gdsGrdCd = SBUxMethod.get("srch-slt-spmtGdsGrdSeCd");   // 상품등급코드
    let strgWrhusSeCd = SBUxMethod.get("srch-slt-spmtStrgWrhusSeCd");   // 저장창고코드
    let spmtQntt = SBUxMethod.get("srch-inp-spmtQntt");   // 출하량
    let spmtWght = SBUxMethod.get("srch-inp-spmtWght");   // 출하중량
    let dlngShapCd = SBUxMethod.get("srch-slt-dlngShapCd");   // 거래형태코드
    let dlngMthCd = SBUxMethod.get("srch-slt-dlngMthCd");   // 매매방법코드
    let prdcrNm = SBUxMethod.get("srch-inp-spmtPrdcrNm");   // 생산자명
    let wrhsSeCd = SBUxMethod.get("srch-slt-spmtWrhsSeCd");   // 입고구분코드
    let gdsSeCd = SBUxMethod.get("srch-slt-spmtGdsSeCd");   // 상품구분코드
    let rmrk = SBUxMethod.get("srch-inp-rmrk");   // 비고
    let pltBxCd = SBUxMethod.get("srch-slt-pltBxCd");   // 팔레트코드
    let pltQntt = SBUxMethod.get("dtl-inp-bssInvntrQntt");   // 팔레트수량

    let prdcrCd = SBUxMethod.get("srch-inp-spmtPrdcrCd");   // 생산자코드

    let group = 0;  // 그룹
    let cnptNm = "";  // 거래처
    let trsprtCoNm = "";  // 운송사
    let itemCd = "";  // 품목코드
    let vrtyCd = "";  // 품종코드
    let spmtPckgUnitNm = "";  // 상품명
    let spcfctNm = "";  // 상품규격
    let gdsGrdNm = "";  // 상품등급
    let strgWrhusSeNm = "";  // 저장창고
    let dlngShapNm = "";  // 거래형태
    let dlngMthNm = "";  // 매매방법
    let wrhsSeNm = "";  // 입고구분
    let gdsSeNm = "";  // 상품구분
    let pltBxNm = "";  // 팔레트명

    // validation
    if (gfn_isEmpty(spmtYmd)) {
      gfn_comAlert("W0005", "선별일자");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (gfn_isEmpty(cnptCd)) {
      gfn_comAlert("W0005", "거래처");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      console.log("jsonComCnptCd", jsonComCnptCd);
      cnptNm = _.find(jsonComCnptCd, {cnptCd: cnptCd}).cnptNm;
    }
    if (gfn_isEmpty(spmtPckgUnitCd)) {
      gfn_comAlert("W0005", "상품명");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      let spmtPckgUnitInfo = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: spmtPckgUnitCd});
      itemCd = spmtPckgUnitInfo.itemCd;
      vrtyCd = spmtPckgUnitInfo.vrtyCd;
      spmtPckgUnitNm = spmtPckgUnitInfo.spmtPckgUnitNm;
      spcfctNm = spmtPckgUnitInfo.spcfctNm;
    }
    if (gfn_isEmpty(gdsGrdCd)) {
      gfn_comAlert("W0005", "상품등급");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      gdsGrdNm = _.find(jsonComPckgGrdSeCd, {grdCd: gdsGrdCd}).grdNm;
    }
    if (gfn_isEmpty(spmtQntt)) {
      gfn_comAlert("W0005", "출하수량");		//	W0005	{0}이/가 없습니다.
      return;
    }
    if (gfn_isEmpty(strgWrhusSeCd)) {
      gfn_comAlert("W0005", "저장창고");		//	W0005	{0}이/가 없습니다.
      return;
    } else {
      strgWrhusSeNm = _.find(jsonComWarehouse, {value: strgWrhusSeCd}).text;
    }
    if (gfn_isEmpty(prdcrCd)) {
      gfn_comAlert("W0005", "생산자");		//	W0005	{0}이/가 없습니다.
      return;
    }


    /*if (!gfn_isEmpty(cnptCd)) {
      cnptNm = _.find(jsonComCnptCd, {cnptCd: cnptCd}).cnptNm;
    }*/
    if (!gfn_isEmpty(trsprtCoCd)) {
      trsprtCoNm = _.find(jsonComTrsprtCoCd, {trsprtCoCd: trsprtCoCd}).trsprtCoNm;
    }
    /*if (!gfn_isEmpty(spmtPckgUnitCd)) {
      let spmtPckgUnitInfo = _.find(jsonSpmtPckgUnit, {spmtPckgUnitCd: spmtPckgUnitCd});
      itemCd = spmtPckgUnitInfo.itemCd;
      vrtyCd = spmtPckgUnitInfo.vrtyCd;
      spmtPckgUnitNm = spmtPckgUnitInfo.spmtPckgUnitNm;
      spcfctNm = spmtPckgUnitInfo.spcfctNm;
    }*/
    /*if (!gfn_isEmpty(gdsGrdCd)) {
      gdsGrdNm = _.find(jsonComPckgGrdSeCd, {grdCd: gdsGrdCd}).grdNm;
    }*/
    /*if (!gfn_isEmpty(strgWrhusSeCd)) {
      strgWrhusSeNm = _.find(jsonComWarehouse, {value: strgWrhusSeCd}).text;
    }*/
    if (!gfn_isEmpty(dlngShapCd)) {
      dlngShapNm = _.find(jsonDlngShapCd, {value: dlngShapCd}).text;
    }
    if (!gfn_isEmpty(dlngMthCd)) {
      dlngMthNm = _.find(jsonDlngMthdCd, {value: dlngMthCd}).text;
    }
    if (!gfn_isEmpty(wrhsSeCd)) {
      wrhsSeNm = _.find(jsonComWrhsSeCd, {value: wrhsSeCd}).text;
    }
    if (!gfn_isEmpty(gdsSeCd)) {
      gdsSeNm = _.find(jsonComGdsSeCd, {value: gdsSeCd}).text;
    }
    if (!gfn_isEmpty(pltBxCd)) {
      pltBxNm = _.find(jsonApcBx, {pltBxCd: pltBxCd}).pltBxNm;
    }

    const spmtRegInfoVO = {
      group: group,
      spmtYmd: spmtYmd,
      cnptNm: cnptNm,
      dldtn: dldtn,
      vhclNo: vhclNo,
      trsprtCoNm: trsprtCoNm,
      trsprtCst: trsprtCst,
      spmtPckgUnitNm: spmtPckgUnitNm,
      spcfctNm: spcfctNm,
      gdsGrdNm: gdsGrdNm,
      strgWrhusSeNm: strgWrhusSeNm,
      spmtQntt: spmtQntt,
      spmtWght: spmtWght,
      dlngShapNm: dlngShapNm,
      dlngMthNm: dlngMthNm,
      prdcrNm: prdcrNm,
      wrhsSeNm: wrhsSeNm,
      gdsSeNm: gdsSeNm,
      rmrk: rmrk,
      pltBxNm: pltBxNm,
      pltQntt: pltQntt,

      trsprtCoCd: trsprtCoCd,
      spmtPckgUnitCd: spmtPckgUnitCd,
      spcfctCd: spcfctCd,
      gdsGrdCd: gdsGrdCd,
      strgWrhusSeCd: strgWrhusSeCd,
      dlngShapCd: dlngShapCd,
      dlngMthCd: dlngMthCd,
      prdcrCd: prdcrCd,
      wrhsSeCd: wrhsSeCd,
      gdsSeCd: gdsSeCd,
      pltBxCd: pltBxCd,
      itemCd: itemCd,
      vrtyCd: vrtyCd,
      cnptCd: cnptCd,

    }

    // 그룹설정(출하일자, 거래처별로 그룹)
    let prvSpmtRegInfo = jsonSpmtRegList.slice(-1)[0];  // 직전 선별등록 데이터

    const keysToCompare = ['spmtYmd', 'cnptCd'];
    const prvSpmtData = _.pick(prvSpmtRegInfo, keysToCompare);
    const curSpmtData = _.pick(spmtRegInfoVO, keysToCompare);

    if (jsonSpmtRegList.length == 0) {
      // 초기 group num 1
      spmtRegInfoVO.group = 1;
    } else {
      if (_.isEqual(prvSpmtData, curSpmtData)) {
        // 직전값과 같으면 같은그룹
        spmtRegInfoVO.group = prvSpmtRegInfo.group;
      } else {
        // 직전값과 다르면 group num +1
        spmtRegInfoVO.group = prvSpmtRegInfo.group + 1;
      }
    }

    // 그룹설정(출하일자, 상품명, 상품등급, 창고, 생산자, 입고구분, 상품구분 동일하면 같은 그룹
    /*let prvSpmtRegInfo = jsonSpmtRegList.slice(-1)[0];  // 직전 선별등록 데이터

    const keysToCompare = ['spmtYmd', 'spmtPckgUnitCd', 'gdsGrdCd', 'strgWrhusSeCd', 'prdcrCd', 'wrhsSeCd', 'gdsSeCd'];
    const prvSpmtData = _.pick(prvSpmtRegInfo, keysToCompare);
    const curSpmtData = _.pick(spmtRegInfoVO, keysToCompare);

    if (jsonSpmtRegList.length == 0) {
      // 초기 group num 1
      spmtRegInfoVO.group = 1;
      // 초기 group 선별중량 합
      spmtRegInfoVO.totSpmtWght = spmtRegInfoVO.spmtWght;
    } else {
      if (_.isEqual(prvSpmtData, curSpmtData)) {
        // 직전값과 같으면 같은그룹
        spmtRegInfoVO.group = prvSpmtRegInfo.group;
        // 투입그룹 선별중량 합 = 이전 까지의 합 + 현재 중량
        spmtRegInfoVO.totSpmtWght = prvSpmtRegInfo.totSpmtWght + spmtRegInfoVO.spmtWght;
      } else {
        // 직전값과 다르면 group num +1
        spmtRegInfoVO.group = prvSpmtRegInfo.group + 1;
        // 투입그룹 선별중량 합 초기화
        spmtRegInfoVO.totSpmtWght = spmtRegInfoVO.spmtWght;
      }
      // 그룹별 투입중량 < 선별중량 error / group num +1
      if (spmtRegInfoVO.totSpmtWght > spmtRegInfoVO.inputWght && spmtRegInfoVO.inputWght > 0) {
        // gfn_comAlert("W0008", "투입량", "선별량");		// W0008	{0} 보다 {1}이/가 큽니다.
        // return;

        spmtRegInfoVO.group = prvSpmtRegInfo.group + 1;
        spmtRegInfoVO.totSpmtWght = spmtRegInfoVO.spmtWght;
      }
    }*/

    jsonSpmtRegList.push(spmtRegInfoVO);
    console.log("jsonSpmtRegList", jsonSpmtRegList);
    grdSpmtRegList.refresh();


  }


  /**
   * @name fn_saveSpmtInfo
   * @description 포장등록 정보 저장 버튼
   */
  const fn_saveSpmtInfo = async function () {
    const pckgInvntrList = [];    // 포장상품 재고량
    const spmtPrfmncList = [];    // 출하실적 목록

    const cmprSpmtData = [];    // 출하등록 데이터 비교용
    let checkItemList = [];    // 포장재고목록 조회용 품종/품목 리스트
    const setItem = new Set(checkItemList);    // 품목/품종 중복 제거용

    let groupChck = 0;    // 그룹 체크용

    let spmtRegData = grdSpmtRegList.getGridDataAll();  // 출하등록 데이터

    /*
    * 품종/품목별로 재고정보 조회 후, 품종/품목별로 재고량을 합산하여 pckgInvntrList에 추가
    * (입고, 상품구분은 선별이나 재고 합산시 등록 마지막 재고목록으로 일괄 저장됨)
    * 2025.06.04 todo
    * 출고일자 기준으로 정렬 필요(1. 그룹(거래처별) 2. 품종/품목 3. 출고일자 정렬(오름차순)
    * 그룹 구분 로직 분리 필요 - 선별, 포장
    * 투입 수량/중량 미입력시 재고량 전부 추가하는 로직 추가 필요
    * 월별 - 선별, 포장, 출하 등록시 입고/상품구분 조건 있을때와 없을때 재고 합산 로직 분리 필요
    * 투입창고 로직 분리 필요
    * */
    for (const spmtDataVO of spmtRegData) {
      // 재고목록 조회용 품목/품종 리스트
      const checkItem = spmtDataVO.itemCd + spmtDataVO.vrtyCd;
      if (!setItem.has(checkItem)) {
        setItem.add(checkItem);
        checkItemList.push(checkItem);
      }
    }

    // 상품재고 내역
    for (const item of checkItemList) {
      try {
        const postJsonPromise = gfn_postJSON("/am/invntr/selectGdsInvntrList.do", {
          apcCd: gv_selectedApcCd,
          itemCd: item.substring(0, 4),
          vrtyCd: item.substring(4),
        });

        const data = await postJsonPromise;
        if (_.isEqual("S", data.resultStatus)) {
          let spmtInvntr = data.resultList;
          console.log("data.resultList", data.resultList);

          for (const item of spmtInvntr) {
            const chkKey = ['warehouseSeCd', 'prdcrCd', 'wrhsSeCd', 'gdsSeCd'];
            // let curSpmtData = _.pick(spmtRegInfo, chkKey);
            // let pckgInvntrData = _.pick(obj, chkKey)
          }
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
   * @name fn_delSpmtRow
   * @description 행삭제 버튼
   */
  const fn_delSpmtRow = function () {
    const chkCol = grdSpmtRegList.getColRef("checkedYn");

    if (chkCol < 0) {
      return;
    }

    const rows = grdSpmtRegList.getCheckedRows(chkCol);
    if (rows.length < 1) {
      gfn_comAlert("W0003", "삭제");		//	W0003	{0}할 대상이 없습니다.
      return;
    }

    rows.reverse().forEach((row) => {
      grdSpmtRegList.deleteRow(row);
    });
  }


</script>
</html>
