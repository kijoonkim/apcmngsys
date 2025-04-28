<%
  /**
   * @Class Name : rawMtrWrhsStdReg.jsp
   * @Description : 원물입고등록 - 입고등록 화면
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
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>title : 입고등록</title>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-body">
      <table id="rawMtrWrhsTable" class="table table-bordered tbl_fixed">
        <caption>입고 등록 조건 설정</caption>
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
          <th scope="row" class="th_bg"><span class="data_required"></span>입고일자</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-datepicker uitype="popup" id="srch-dtp-wrhsYmd" name="srch-dtp-wrhsYmd" date-format="yyyy-mm-dd" class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"></sbux-datepicker>
            </div>
          </td>
          <th scope="row" class="th_bg"><span class="data_required" ></span>생산자</th>
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
                        onclick="fn_choicePrdcr"
                ></sbux-button>
              </div>
            </div>
          </td>
          <th scope="row" class="th_bg"><span class="data_required" ></span>품목/품종</th>
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
                        onchange="fn_onChangeSrchItemCd(this)">
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
                        onchange="fn_onChangeSrchVrtyCd(this)">
                </sbux-select>
              </div>
            </div>
          </td>
        <tr>
          <th scope="row" class="th_bg">수량/<span class="data_required" ></span>중량</th>
          <td class="td_input"style="border-right: hidden;">
            <div class="displayFlex">
              <div style="flex: 1 12ch">
                <sbux-input
                        uitype="text"
                        id="srch-inp-bxQntt"
                        name="srch-inp-bxQntt"
                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                        maxlength="10"
                        autocomplete="off"
                        mask="{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                        onchange="fn_onChangeBxQntt(this)"
                ></sbux-input>
              </div>
              <div style="flex: 1 12ch">
                <sbux-input
                        uitype="text"
                        id="srch-inp-wghtAvg"
                        name="srch-inp-wghtAvg"
                        class="form-control input-sm"
                        placeholder="평균"
                        maxlength="6"
                        autocomplete="off"
                        mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                        onchange="fn_onChangeWghtAvg(this)"
                ></sbux-input>
              </div>
              <div style="flex: 1 12ch">
                <sbux-input
                        uitype="text"
                        id="srch-inp-wrhsWght"
                        name="srch-inp-wrhsWght"
                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                        maxlength="10"
                        autocomplete="off"
                        mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true}"
                        onchange="fn_onChangeWrhsWght(this)"
                ></sbux-input>
              </div>
              <div style="flex: 0; margin-right:10px">
                <sbux-label uitype="normal" id="lbl-chc" name="lbl-chc" class="blod" text="Kg"></sbux-label>
              </div>
            </div>
          </td>
          <th scope="row" class="th_bg">박스/팔레트</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <div>
                <sbux-select
                        unselected-text="전체"
                        uitype="single"
                        id="srch-slt-bxKnd"
                        name="srch-slt-bxKnd"
                        class="form-control input-sm"
                        jsondata-ref="jsonApcBx"
                ></sbux-select>
              </div>
              <div>
                <sbux-input
                        uitype="text"
                        id="srch-inp-pltno"
                        name="srch-inp-pltno"
                        class="form-control input-sm"
                        autocomplete="off"
                ></sbux-input>
              </div>
            </div>
          </td>
          <th scope="row" class="th_bg">차량/운임</th>
          <td class="td_input">
            <div class="displayFlex">
              <div style="display: flex;gap: 3px">
                <sbux-input
                        uitype="text"
                        id="srch-inp-vhclno"
                        name="srch-inp-vhclno"
                        class="form-control input-sm"
                        autocomplete="off"
                        readonly
                ></sbux-input>
                <sbux-button
                        id="srch-btn-vhcl"
                        name="srch-btn-vhcl"
                        class="btn btn-xs btn-outline-dark"
                        text="찾기"
                        uitype="modal"
                        target-id="modal-vhcl"
                        onclick="fn_choiceVhcl"
                ></sbux-button>
              </div>
              <div style="display: flex;gap: 3px">
                <sbux-input
                        uitype="text"
                        id="srch-inp-trsprtCst"
                        name="srch-inp-trsprtCst"
                        class="form-control input-sm"
                        maxlength="6"
                        autocomplete="off"
                        mask = "{'alias': 'numeric', 'autoGroup': 3, 'groupSeparator': ',', 'isShortcutChar': true, 'autoUnmask': true }"
                        readonly
                ></sbux-input>
                <sbux-button
                        id="srch-btn-trsprtCst"
                        name="srch-btn-trsprtCst"
                        class="btn btn-xs btn-outline-dark"
                        text="등록" uitype="modal"
                        target-id="modal-trsprtCst"
                        onclick="fn_choiceTrsprtCst"
                ></sbux-button>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg"><span class="data_required" ></span>창고</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <div style="flex-basis: 18rem">
                <sbux-select
                        unselected-text="선택"
                        uitype="single"
                        id="srch-slt-warehouseSeCd"
                        name="srch-slt-warehouseSeCd"
                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                        jsondata-ref="jsonComWarehouse"
                ></sbux-select>
              </div>
            </div>
          </td>
          <th scope="row" class="th_bg"><span class="data_required" ></span>등급</th>
          <td colspan="3" class="td_input">
            <div class="displayFlex">
              <jsp:include page="../../am/popup/apcStdGrdSelect.jsp"></jsp:include>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg"><span class="data_required" ></span>생산연도</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <sbux-datepicker
                      uitype="popup"
                      id="srch-dtp-prdctnYr"
                      name="srch-dtp-prdctnYr"
                      date-format="yyyy"
                      datepicker-mode="year"
                      class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
              ></sbux-datepicker>
            </div>
          </td>
          <th scope="row" class="th_bg">비고</th>
          <td colspan="3" class="td_input">
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
          <th scope="row" class="th_bg">입고구분</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <p class="ad_input_row">
                <sbux-radio
                        id="srch-rdo-wrhsSeCd"
                        name="srch-rdo-wrhsSeCd"
                        uitype="normal"
                        class="radio_label"
                        text-right-padding="10px"
                        jsondata-ref="jsonComWrhsSeCd"
                        jsondata-text="cdVlNm"
                        jsondata-value="cdVl"
                ></sbux-radio>
              </p>
            </div>
          </td>
          <th scope="row" class="th_bg">상품구분</th>
          <td class="td_input" style="border-right: hidden;">
            <div class="displayFlex">
              <p class="ad_input_row">
                <sbux-radio
                        id="srch-rdo-gdsSeCd"
                        name="srch-rdo-gdsSeCd"
                        uitype="normal"
                        class="radio_label"
                        text-right-padding="10px"
                        jsondata-ref="jsonComGdsSeCd"
                        jsondata-text="cdVlNm"
                        jsondata-value="cdVl"
                ></sbux-radio>
              </p>
            </div>
          </td>
          <th scope="row" class="th_bg">운송구분</th>
          <td class="td_input">
            <div class="displayFlex">
              <p class="ad_input_row">
                <sbux-radio
                        id="srch-rdo-trsprtSeCd"
                        name="srch-rdo-trsprtSeCd"
                        uitype="normal"
                        class="radio_label"
                        text-right-padding="10px"
                        jsondata-ref="jsonComTrsprtSeCd"
                        jsondata-text="cdVlNm"
                        jsondata-value="cdVl"
                ></sbux-radio>
              </p>
            </div>
          </td>
        </tr>
        </tbody>
      </table>


      <%--<!--[pp] //검색 -->
      <!--[pp] 검색결과 -->
      <div class="ad_tbl_top2">
        <ul class="ad_tbl_count">
          <li>
            <span>원물입고 내역</span>
            &lt;%&ndash;							<span style="font-size:12px">(기준일자 :&ndash;%&gt;
            &lt;%&ndash;								<sbux-label&ndash;%&gt;
            &lt;%&ndash;									id="crtr-ymd"&ndash;%&gt;
            &lt;%&ndash;									name="crtr-ymd"&ndash;%&gt;
            &lt;%&ndash;									uitype="normal"&ndash;%&gt;
            &lt;%&ndash;									text=""&ndash;%&gt;
            &lt;%&ndash;									class="bold"&ndash;%&gt;
            &lt;%&ndash;									mask = "{'alias': 'yyyy-mm-dd', 'autoUnmask': true}"&ndash;%&gt;
            &lt;%&ndash;								></sbux-label> , 조회건수 <span id="cnt-wrhs">0</span>건)&ndash;%&gt;
            &lt;%&ndash;							</span>&ndash;%&gt;
          </li>
        </ul>
        <div class="ad_tbl_toplist">
          <sbux-button id="btnDwnld" name="btnDwnld" uitype="normal" text="서식받기" class="btn btn-sm btn-outline-danger" onclick="fn_dwnld" ></sbux-button>
          <sbux-button id="btnUld" name="btnUld" uitype="normal" text="올리기" class="btn btn-sm btn-outline-danger" onclick="fn_uld"></sbux-button>
        </div>
      </div>
      <div class="table-responsive tbl_scroll_sm">
        <div id="sb-area-grdRawMtrWrhs" style="height:434px;"></div>
      </div>
      <!-- <div class="exp-div-excel" style="display: none;width: 2000px;"> none block-->
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
      <!-- 엑셀 시트별 데이터 영역 -->
    </div>
  </div>
  <sbux-progress id="idxProg" name="progNm" uitype="loading" show-openlayer="true">
  </sbux-progress>--%>

</section>

<!-- 생산자 선택 Modal -->
<div>
  <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-prdcr">
  <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
</div>
<!-- 차량 선택 Modal -->
<div>
  <sbux-modal id="modal-vhcl" name="modal-vhcl" uitype="middle" header-title="차량 선택" body-html-id="body-modal-vhcl" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-vhcl">
  <jsp:include page="../../am/popup/vhclPopup.jsp"></jsp:include>
</div>
<!-- 운임 선택 Modal -->
<div>
  <sbux-modal id="modal-trsprtCst" name="modal-trsprtCst" uitype="middle" header-title="원물운임비용등록" body-html-id="body-modal-trsprtCst" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-trsprtCst">
  <jsp:include page="../../am/popup/trsprtCstPopup.jsp"></jsp:include>
</div>

<!-- 원물입고 엑셀 등록 Modal -->
<div>
  <sbux-modal
          id="modal-imp"
          name="modal-imp"
          uitype="middle"
          header-title="원물입고등록(Excel)"
          body-html-id="body-modal-imp"
          footer-is-close-button="false"
          header-is-close-button="false"
          style="width:1000px"
  ></sbux-modal>
</div>
<div id="body-modal-imp">
  <jsp:include page="../../am/popup/importExcelPopup.jsp"></jsp:include>
</div>

<!-- clip report direct print area  -->
<div id="div-rpt-clipReportPrint" style="display:none;"></div>
</body>
<script type="text/javascript">

  /* SB Select */
  var jsonApcItem			= [];	// 품목 		itemCd		검색
  var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
  var jsonApcGrd			= [];	// 등급 		grdCd		검색
  var jsonApcSpcfct		= [];	// 규격 		spcfcCd		검색
  var jsonComWarehouse	= [];	// 창고 		warehouse	검색
  var jsonApcBx			= [];	// 팔레트/박스 	검색

  var jsonComWrhsSeCd		= [];	// 입고구분		WRHS_SE_CD
  var jsonComGdsSeCd		= [];	// 상품구분		GDS_SE_CD
  var jsonComTrsprtSeCd	= [];	// 운송구분		TRSPRT_SE_CD

  /**
   * @name fn_initSBSelect
   * @description SBSelect JSON 불러오기
   */
  const fn_initSBSelect = async function() {
    // 검색 SB select
    let result = await Promise.all([
      gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
      gfn_setPltBxSBSelect('srch-slt-bxKnd', 			jsonApcBx, gv_selectedApcCd, 'B'),	// 박스
      gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, gv_selectedApcCd),		// 품목
      gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, gv_selectedApcCd),		// 품종
    ]);
  }

  /**
   * @name fn_initSBRadio
   * @description SBRadio JSON 불러오기
   */
  const fn_initSBRadio = async function() {

    let result = await Promise.all([
      gfn_getComCdDtls('WRHS_SE_CD'),		// 입고구분
      gfn_getComCdDtls('GDS_SE_CD', gv_selectedApcCd),		// 상품구분
      gfn_getComCdDtls('TRSPRT_SE_CD'),	// 운송구분
    ]);

    jsonComWrhsSeCd = gfn_getJsonFilter(result[0], 'cdVl', ["1", "2", "3"]);
    jsonComGdsSeCd = result[1];
    jsonComTrsprtSeCd = result[2];

    SBUxMethod.refresh('srch-rdo-wrhsSeCd');
    SBUxMethod.refresh('srch-rdo-gdsSeCd');
    SBUxMethod.refresh('srch-rdo-trsprtSeCd');
  }

  /**
   * @name fn_getPrdcrs
   * @description 생산자 자동완성 JSON 설정
   */
  const fn_getPrdcrs = async function() {
    jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
    jsonPrdcr = gfn_setFrst(jsonPrdcr);
  }

  /**
   * @name fn_setPrdcr
   * @description 생산자 선택 popup callback 처리
   */
  const fn_setPrdcr = async function(prdcr) {

    await fn_getPrdcrs();

    if (!gfn_isEmpty(prdcr)) {
      SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
      SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
      SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

      fn_setPrdcrForm(prdcr);
    }
  }

  /**
   * @name fn_choicePrdcr
   * @description 생산자 선택 popup 호출
   */
  const fn_choicePrdcr = function() {
    popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
  }

  // only document
  window.addEventListener('DOMContentLoaded', async function(e) {
    fn_initSBRadio();
    fn_initSBSelect();
    fn_getPrdcrs();

  });



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>