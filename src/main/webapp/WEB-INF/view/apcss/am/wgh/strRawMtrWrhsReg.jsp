<%
  /**
   * @Class Name : strRawMtrWrhsReg.jsp
   * @Description : 딸기입고등록(모두) 화면
   * @author SI개발부
   * @since 2024.11.14
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2024.11.14   손민성		최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 딸기입고등록(모두)</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
  <style>
    .th-mbl {
      text-align: left;
      font-weight: bold;
      font-size: 28px;
    }
    .inpt-mbl {
    //padding: 8px;
      height: 50px;
      font-size: 28px;
      line-height: 1.5;
      color: #555;
      width: 100%;
    }
    /* Webkit 기반 브라우저 (Chrome, Safari 등) */
    input[type=number]::-webkit-outer-spin-button,
    input[type=number]::-webkit-inner-spin-button {
      -webkit-appearance: none;
      margin: 0;
    }

    /* Firefox */
    input[type=number] {
      -moz-appearance: textfield;
    }
    .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-nor-bd .sbux-tabs-content{
      padding: 16px 0px !important;
    }
    #tab_spmtPrfmncReg, #tab_spmtPrfmnc{
      border: 0 !important;
    }
  </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start;">
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고등록(태블릿) -->
      </div>
    </div>
    <div class="box-body" style="padding: 0px 30px 15px;">
      <sbux-tabs id="tab_norm" name="tab_norm" uitype="webacc" is-scrollable="false" wrap-style="height:100%"
                 title-target-id-array="tab_spmtPrfmncReg^tab_spmtPrfmnc"
                 title-text-array="입고등록^입고내역" onclick="fn_changeTab()"
                 title-style-array="{margin-right: 5px;width: 8vw;
                 text-align: center;font-weight: bold;border-radius:0}^{margin-right: 5px;width: 8vw;
                 text-align: center;font-weight: bold;border-radius:0}">
      </sbux-tabs>
      <div class="tab-content">
        <div id="tab_spmtPrfmncReg" style="height: 500px">
          <div style="margin-right: auto;">
            <sbux-button
                    id="btnCmndDocspmt"
                    name="btnCmndDocspmt"
                    uitype="normal"
                    class="btn btn-lg btn-primary"
                    style="padding: 7px 35px"
                    onclick="fn_docRawMtrWrhs"
                    text="입고전표"
            ></sbux-button>
            <sbux-button
                    id="btnReset"
                    name="btnReset"
                    uitype="normal"
                    class="btn btn-lg btn-outline-danger"
                    onclick="fn_reset"
                    text="초기화"
            ></sbux-button>
            <sbux-button
                    id="btnSave"
                    name="btnSave"
                    uitype="normal"
                    class="btn btn-lg btn-outline-danger"
                    onclick="fn_save"
                    text="저장"
            ></sbux-button>
            <sbux-button
                    id="btnSearch"
                    name="btnSearch"
                    uitype="normal"
                    class="btn btn-lg btn-outline-danger"
                    onclick="fn_search"
                    text="조회"
            ></sbux-button>
            <p class="ad_input_row chk-mbl" style="vertical-align:middle; display: inline-flex; align-items: center;">
              <input
                      style="width:20px;height:20px;"
                      type="checkbox"
                      id="reportChk"
              />
              <label for="reportChk">자동발행</label>
            </p>
          </div>
          <table id="regTable" class="table table-bordered tbl_fixed" style="margin-top: 10px; width: 70%">
            <colgroup>
              <col style="width: 25%">
              <col style="width: 30%">
              <col style="width: 20%">
              <col style="width: 25%">
            </colgroup>
            <tbody>
            <tr>
              <th scope="row" class="th_bg th-mbl">
                입고일자
              </th>
              <td class="td_input" colspan="3">
                <sbux-datepicker
                        uitype="popup"
                        id="reg-dtp-wghYmd"
                        name="reg-dtp-wghYmd"
                        class="form-control pull-right inpt_data_reqed inpt-mbl"
                        date-format="yyyy-mm-dd"
                        wrap-style="width: 50%"
                ></sbux-datepicker>
              </td>
            </tr>
            <tr>
              <th scope="row" class="th_bg th-mbl">품목</th>
              <td class="td_input" colspan="3">
                <div>
                  <sbux-select
                          unselected-text="전체"
                          uitype="single"
                          id="reg-slt-itemCd"
                          name="reg-slt-itemCd"
                          class="form-control inpt-mbl"
                          jsondata-ref="jsonApcItem"
                          unselected-text="선택"
                          style="width: 50%; font-size: 28px;"
                          readonly
                  ></sbux-select>
                </div>
              </td>
            </tr>
            <tr>
              <th scope="row" class="th_bg th-mbl">농가</th>
              <td class="td_input" colspan="3">
                <div style="display: flex; gap: 5px">
                  <sbux-input
                          uitype="text"
                          id="reg-inp-prdcrIdentno"
                          name="reg-inp-prdcrIdentno"
                          class="form-control inpt-mbl"
                          style="background-color:rgb(255, 248, 220)"
                          wrap-style="flex-basis:10%;"
                          maxlength="2"
                          autocomplete="off"
                  ></sbux-input>
                  <sbux-input
                          uitype="text"
                          id="reg-inp-prdcrNm"
                          name="reg-inp-prdcrNm"
                          class="form-control inpt_data_reqed inpt-mbl"
                          placeholder="초성검색 가능"
                          wrap-style="flex-basis:60%"
                          autocomplete-ref="jsonPrdcrAutocomplete"
                          autocomplete-text="name"
                          autocomplete-height="270px"
                          oninput="fn_onInputPrdcrNm(event)"
                          autocomplete-select-callback="fn_onSelectPrdcrNm"
                  ></sbux-input>
                  <sbux-input
                          uitype="text"
                          id="reg-inp-prdcrCd"
                          name="reg-inp-prdcrCd"
                          style="display: none"
                  ></sbux-input>
                  <sbux-button
                          id="reg-btn-prdcrCd"
                          name="reg-btn-prdcrCd"
                          class="btn btn-outline-dark"
                          style="padding: 0px 40px; font-size: 20px;"
                          text="찾기"
                          uitype="modal"
                          target-id="modal-prdcr"
                          onclick="fn_choicePrdcr"
                  ></sbux-button>
                  <sbux-input
                          uitype="text"
                          id="wghno"
                          name="wghno"
                          style="display: none"
                  ></sbux-input>

                </div>
              </td>
            </tr>
            <tr>
              <th scope="row" class="th_bg th-mbl">검수자</th>
              <td class="td_input" colspan="3">
                <div style="display: flex;">
                  <sbux-input
                          id="reg-slt-chckr"
                          name="reg-slt-chckr"
                          uitype="text"
                          style="background: 0; border: 0"
                          wrap-style="flex-basis:40%"
                          class="inpt_data_reqed inpt-mbl"
                          readonly
                  ></sbux-input>
                </div>
              </td>
            </tr>
            <tr>
              <th scope="row" class="th_bg th-mbl">킹박스 분출</th>
              <td class="td_input" colspan="3">
                <div style="display: flex;">
                  <sbux-input
                          id="reg-slt-kingBox"
                          name="reg-slt-kingBox"
                          uitype="text"
                          wrap-style="flex-basis:20%"
                          class="inpt_data_reqed inpt-mbl"
                  ></sbux-input>
                </div>
              </td>
            </tr>
            <tr>
              <th scope="row" class="th_bg th-mbl">일반박스 분출</th>
              <td class="td_input" colspan="3">
                <div style="display: flex;">
                  <sbux-input
                          id="reg-slt-box"
                          name="reg-slt-box"
                          uitype="text"
                          wrap-style="flex-basis:20%"
                          class="inpt_data_reqed inpt-mbl"
                  ></sbux-input>
                </div>
              </td>
            </tr>
            </tbody>
          </table>
          <!--[pp] 검색 -->
        </div>
        <div id="tab_spmtPrfmnc">

        </div>
      </div>

    </div>
  </div>
</section>
<!-- 생산자 Modal -->
<div>
  <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1100px"></sbux-modal>
</div>
<div id="body-modal-prdcr">
  <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
  var jsonApcItem			= [];	// 품목 		itemCd		검색
  var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
  var jsonApcGrd			= [];	// 등급 		vrtyCd		검색
  var jsonJobClsf           = [];   // 검수자

  /* 생산자 자동완성 */
  var jsonPrdcr				= [];
  var jsonPrdcrAutocomplete	= [];


  window.addEventListener("DOMContentLoaded",function(e){
    document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
      el.style.width = "50px";
      el.style.height = "50px";
    });
    document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
      el.style.fontSize = "24px";
    });
    fn_init();
  });

  /**
   * @name fn_init
   * @description form init
   */
  const fn_init = async function() {
    SBUxMethod.set("reg-dtp-wghYmd", gfn_dateToYmd(new Date()));
    SBUxMethod.set("reg-slt-chckr", gv_userNm);
    let rst = await Promise.all([
      gfn_setApcItemSBSelect('reg-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
      gfn_setApcVrtySBSelect('reg-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
      gfn_getApcGdsGrd(gv_selectedApcCd,"0804","01")
    ]);// 품종

    let stdGrdList = rst[2];
    /** 딸기고정 **/
    if(jsonApcItem.some((item) => item.itemCd === "0804")){
      SBUxMethod.set("reg-slt-itemCd","0804");
    }

    const result = Object.values(
            stdGrdList.reduce((acc, item) => {
              // 'vrtyCd' 키로 그룹화
              if (!acc[item.vrtyCd]){
                acc[item.vrtyCd] = [];
              }
              acc[item.vrtyCd].push(item);
              return acc;
            }, {})
    );
    let idx = 4;
    console.log(result,"ㅎ");
    result.forEach(function(item){
      item.sort((a,b) => {
        if(parseInt(a.grdCd) < parseInt(b.grdCd)) return -1
        if(parseInt(a.grdCd) > parseInt(b.grdCd)) return 1
        return 0;
      });
      /** 공통 부분 셋팅 **/
      const table = document.querySelector('#regTable > tbody');
      const newRow = document.createElement('tr');

      const th = document.createElement('th');
      th.setAttribute('scope', 'row');
      th.classList.add('th_bg', 'th-mbl');
      th.style.backgroundColor = "rgb(180, 198, 231)";
      th.textContent = item[0].vrtyNm;
      newRow.appendChild(th); // <th>를 <tr>에 추가

      const td = document.createElement('td');
      td.classList.add('td_input');
      td.setAttribute('colspan', '3');
      newRow.appendChild(td); // <td>를 <tr>에 추가

      const div = document.createElement('div');
      div.style.display = 'flex';
      div.style.gap = '3%';
      div.style.justifyContent = 'left';
      td.appendChild(div); // <div>를 <td>에 추가

      item.forEach(function(grd){
        const innerDiv = document.createElement("div");
        innerDiv.style.flexBasis = "20%";
        const input = document.createElement('input');
        input.type = 'number';
        input.placeholder = grd.grdNm;
        input.classList.add("reg_data");
        input.setAttribute("data-item-cd",grd.itemCd);
        input.setAttribute("data-vrty-cd",grd.vrtyCd);
        input.setAttribute("data-grd-cd",grd.grdCd);
        input.style.textAlign = 'center';
        input.style.fontSize = '28px';
        input.style.width = '100%';
        input.style.backgroundColor = 'rgb(255, 248, 220)';
        innerDiv.appendChild(input);
        div.appendChild(innerDiv);
      });
      const targetRow = table.querySelectorAll("tr")[idx];
      table.insertBefore(newRow,targetRow);
      idx++;
      // table.appendChild(newRow);
    });
  }

  /**
   * @name fn_choicePrdcr
   * @description 생산자 선택 popup 호출
   */
  const fn_choicePrdcr = function() {
    popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
  }

  /**
   * @name fn_setPrdcr
   * @description 생산자 선택 popup callback 처리
   */
  const fn_setPrdcr = async function(prdcr) {
    SBUxMethod.set("srch-inp-wrhsno", "");

    if (!gfn_isEmpty(prdcr)) {
      SBUxMethod.set("reg-inp-prdcrCd", prdcr.prdcrCd);
      SBUxMethod.set("reg-inp-prdcrNm", prdcr.prdcrNm);
      // SBUxMethod.set("srch-inp-bxQntt", "");
      $("#srch-inp-bxQntt").val("");
      SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

      fn_setPrdcrForm(prdcr);
    }
  }
  /**
   * @name fn_setPrdcrForm
   * @description 생산자 선택후 생산자 정보 셋팅s
   */
  const fn_setPrdcrForm = async function(prdcr) {

    if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
      const rprsVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;
      await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
      SBUxMethod.set("srch-slt-vrtyCd", rprsVrtyCd);
      fn_onChangeSrchVrtyCd({value:rprsVrtyCd});
    } else {
      if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
        const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
        if (prvItemCd != prdcr.rprsItemCd) {
          SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
          fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
        }
      }
    }

    if (!gfn_isEmpty(prdcr.wrhsSeCd)) {	// 입고구분
      SBUxMethod.set("srch-rdo-wrhsSeCd", prdcr.wrhsSeCd);
    }
    if (!gfn_isEmpty(prdcr.gdsSeCd)) {	// 상품구분
      SBUxMethod.set("srch-rdo-gdsSeCd", prdcr.gdsSeCd);
    }
    if (!gfn_isEmpty(prdcr.trsprtSeCd)) {	// 운송구분
      SBUxMethod.set("srch-rdo-trsprtSeCd", prdcr.trsprtSeCd);
    }
    if (!gfn_isEmpty(prdcr.vhclno)) {	// 차량번호
      SBUxMethod.set("srch-inp-vhclno", prdcr.vhclno);
    }

    if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
      SBUxMethod.set("reg-inp-prdcrIdentno", prdcr.prdcrIdentno);
    } else {
      SBUxMethod.set("srch-inp-prdcrIdentno", "");
    }

  }


  const fn_save = async function(){
    let regObj = gfn_getTableElement("regTable","reg-",[]);
    console.log(regObj);
    let regEl = Array.from($("#regTable tbody tr td div div input"));
    console.log(Array.from(regEl),"regEl");
  }


</script>
</html>