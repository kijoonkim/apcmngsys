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
    .td_add{
      text-align: center;
      font-weight: bold;
      font-size: 25px;
    }
    #searchTable  tr:hover{
      background-color : #FFF8DC;
      cursor: pointer;
    }
    li.sbux-ui-menu-item{
      font-size: x-large;
    }

  </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start;">
      <div ondblclick="fn_fullScreen()">
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고등록(태블릿) -->
      </div>
    </div>
    <div class="box-body" style="padding: 0px 30px 15px;display: flex;flex-direction: column;position: relative;">
      <div style="margin-right: auto;position: absolute;left: 33vw;z-index: 9997;">
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
      </div>
      <sbux-tabs id="tab_norm" name="tab_norm" uitype="webacc" is-scrollable="false" wrap-style="height:100%"
                 title-target-id-array="tab_spmtPrfmncReg^tab_spmtPrfmnc"
                 title-text-array="입고등록^입고내역" onclick="fn_changeTab()"
                 title-style-array="{margin-right: 5px;width: 10vw;
                 text-align: center;font-weight: bold;border-radius:0}^{margin-right: 5px;width: 10vw;
                 text-align: center;font-weight: bold;border-radius:0}">
      </sbux-tabs>
      <div class="tab-content">
        <div id="tab_spmtPrfmncReg">
          <table id="regTable" class="table table-bordered tbl_fixed" style="margin-top: 10px; width: 100%">
            <colgroup>
              <col style="width: 25%">
              <col style="width: 30%">
              <col style="width: 20%">
              <col style="width: 25%">
            </colgroup>
            <tbody>
            <tr>
              <th scope="row" class="th_bg th-mbl">입고일자</th>
              <td class="td_input" colspan="3">
                <sbux-datepicker
                        uitype="popup"
                        id="reg-dtp-wrhsYmd"
                        name="reg-dtp-wrhsYmd"
                        class="form-control pull-right inpt_data_reqed inpt-mbl"
                        date-format="yyyy-mm-dd"
                        wrap-style="width: 50%"
                ></sbux-datepicker>
                <sbux-input
                        uitype="text"
                        id="reg-inp-pltno"
                        name="reg-inp-pltno"
                        style="display: none"
                ></sbux-input>
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
                          style="background-color:rgb(255, 248, 220); text-align: center"
                          wrap-style="flex-basis:10%;"
                          maxlength="2"
                          autocomplete="off"
                          onchange="fn_onChangeSrchPrdcrIdentno(this)"
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
                          style="text-align: center"
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
                          style="text-align: center"
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
          <div style="height: 600px">
            <table class="table table-bordered tbl_fixed" style="border: 0;margin-top: 10px; width: 100%">
                <colgroup>
                  <col style="width: 30%">
                  <col style="width: 30%">
                  <col style="width: 20%">
                  <col style="width: 20%">
                </colgroup>
                <tbody>
                  <tr>
                    <th scope="row" class="th_bg th-mbl">
                      입고일자
                    </th>
                    <td class="td_input" style="border: 0" colspan="3">
                      <sbux-datepicker
                      uitype="popup"
                      id="srch-dtp-wrhsYmd"
                      name="srch-dtp-wrhsYmd"
                      class="form-control pull-right inpt_data_reqed inpt-mbl"
                      date-format="yyyy-mm-dd"
                      ></sbux-datepicker>
                    </td>
                  </tr>
                </tbody>
              </table>
            <table id="searchTable"class="table table-bordered tbl_fixed" style="margin-top: 10px; width: 100%">
            <colgroup>
              <col style="width: 30%">
              <col style="width: 30%">
              <col style="width: 20%">
              <col style="width: 20%">
            </colgroup>
            <tbody>
            <tr>
              <th scope="row" class="th_bg th-mbl" style="text-align: center">전표번호</th>
              <th scope="row" class="th_bg th-mbl" style="text-align: center">입고일자</th>
              <th scope="row" class="th_bg th-mbl" style="text-align: center">농가</th>
              <th scope="row" class="th_bg th-mbl" style="text-align: center">상세</th>
            </tr>
            </tbody>
          </table>
          </div>
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

  /** 수정 대응 searchData **/
  var jsonSearchData = [];

  /** 박스별 중량 jsonData **/
  var jsonPltBxs = [];


  window.addEventListener("DOMContentLoaded",function(e){
    document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
      el.style.width = "50px";
      el.style.height = "50px";
   });
    document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
      el.style.fontSize = "24px";
    });
    fn_init();
    fn_search();
  });

  /**
   * @name fn_init
   * @description form init
   */
  const fn_init = async function() {
    SBUxMethod.set("reg-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
    SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
    SBUxMethod.set("reg-slt-chckr", gv_userNm);
    let rst = await Promise.all([
      gfn_setApcItemSBSelect('reg-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
      gfn_setApcVrtySBSelect('reg-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd,"0804"),	// 품종
      gfn_getApcGdsGrd(gv_selectedApcCd,"0804","01"),
      gfn_getPltBxs(gv_selectedApcCd),
      fn_getPrdcrs()
    ]);// 품종

    let stdGrdList = rst[2];
    jsonPltBxs = [...rst[3]];
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
        /** 품종별 단중 **/
        let unitWght = jsonApcVrty.find((el) => el.vrtyCd === grd.vrtyCd).unitWght;

        const innerDiv = document.createElement("div");
        innerDiv.style.flexBasis = "20%";
        const input = document.createElement('input');
        input.type = 'number';
        input.placeholder = grd.grdNm;
        input.classList.add("reg_data");
        input.setAttribute("data-item-cd",grd.itemCd);
        input.setAttribute("data-vrty-cd",grd.vrtyCd);
        input.setAttribute("data-grd-cd",grd.grdCd);
        input.setAttribute("data-unit-wght",unitWght);
        input.setAttribute("data-plt-bx-cd",parseInt(grd.grdCd) < 5?"0001":"0002");
        input.style.textAlign = 'center';
        input.style.fontSize = '28px';
        input.style.width = '100%';
        input.style.backgroundColor = 'rgb(255, 248, 220)';
        input.style.border = '1px solid #bbc4d1';
        input.style.borderRadius = '5px';
        input.style.padding = '6px 12px';
        input.style.lineHeight = '1.5';
        input.style.fontFamily = "'Malgun Gothic', 'Helvetica Neue', Helvetica, Arial, sans-serif";
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
   * @name fn_onInputPrdcrNm
   * @description 생산자명 입력 시 event : autocomplete
   */
  const fn_onInputPrdcrNm = function(prdcrNm){
    fn_clearPrdcr();
    if(getByteLengthOfString(prdcrNm.target.value) > 100){
      SBUxMethod.set("reg-inp-prdcrNm", "");
      return;
    }
    jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
    SBUxMethod.changeAutocompleteData('reg-inp-prdcrNm', true);
  }
  const fn_clearPrdcr = function() {
    SBUxMethod.set("reg-inp-prdcrCd", "");
    SBUxMethod.set("reg-inp-prdcrIdentno", "");
    SBUxMethod.attr("reg-inp-prdcrNm", "style", "background-color:''");
  }
  /**
   * @name getByteLengthOfString
   * @description 글자 byte 크기 계산
   */
  const getByteLengthOfString = function (s, b, i, c) {
    for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
    return b;
  }
  /**
   * @name fn_onSelectPrdcrNm
   * @description 생산자 autocomplete 선택 callback
   */
  function fn_onSelectPrdcrNm(value, label, item) {
    // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
    if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
      document.getElementById('reg-btn-prdcrCd').click();
    } else{
      SBUxMethod.set("reg-inp-prdcrCd", value);
      SBUxMethod.attr("reg-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
      let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
      prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;
    }
  }

  /**
   * @name fn_choicePrdcr
   * @description 생산자 선택 popup 호출
   */
  const fn_choicePrdcr = function() {
    popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("reg-inp-prdcrNm"));
  }

  /**
   * @name fn_setPrdcr
   * @description 생산자 선택 popup callback 처리
   */
  const fn_setPrdcr = async function(prdcr) {
    await fn_getPrdcrs();

    if (!gfn_isEmpty(prdcr)) {
      SBUxMethod.set("reg-inp-prdcrCd", prdcr.prdcrCd);
      SBUxMethod.set("reg-inp-prdcrNm", prdcr.prdcrNm);
      // SBUxMethod.set("srch-inp-bxQntt", "");
      $("#srch-inp-bxQntt").val("");
      SBUxMethod.attr("reg-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

    }
  }
  const fn_getPrdcrs = async function() {
    jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
    jsonPrdcr = gfn_setFrst(jsonPrdcr);
  }

  const fn_onChangeSrchPrdcrIdentno = function(obj) {

    if (gfn_isEmpty(SBUxMethod.get("reg-inp-prdcrIdentno"))) {
      return;
    }

    SBUxMethod.set("reg-inp-prdcrCd", "");
    SBUxMethod.set("reg-inp-prdcrNm", "");
    SBUxMethod.attr("reg-inp-prdcrNm", "style", "");	//skyblue

    let prdcrIdentno = parseInt(SBUxMethod.get("reg-inp-prdcrIdentno")) || 0;

    if (prdcrIdentno < 1) {
      return;
    }

    const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
    if (gfn_isEmpty(prdcrInfo)) {
      return;
    }

    SBUxMethod.set("reg-inp-prdcrCd", prdcrInfo.prdcrCd);
    SBUxMethod.set("reg-inp-prdcrNm", prdcrInfo.prdcrNm);
    SBUxMethod.attr("reg-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue


  }


  const fn_save = async function(){
    let wrhsYmd = SBUxMethod.get("reg-dtp-wrhsYmd");
    let regList = [];
    /** 수정모드 확인 **/
    let pltno = SBUxMethod.get("reg-inp-pltno");

    /** 1. pltno select **/
    if(gfn_isEmpty(pltno)){
      const data = await gfn_postJSON("/am/wrhs/selectWrhsno.do",{apcCd:gv_selectedApcCd,wrhsYmd:wrhsYmd});
      pltno = data.pltno;
    }

    /** 2. 공통정보 table get **/
    let regObj = gfn_getTableElement("regTable","reg-",["box","kingBox","pltno"]);
    /** 3. 품목 갯수별 obj **/
    let regEl = Array.from($("#regTable tbody tr td div div input"));
    regEl.forEach(function(item){
      if(gfn_isEmpty($(item).val())){
        return;
      }
      obj = {...regObj};
      obj.apcCd = gv_selectedApcCd;
      obj.pltno = pltno;
      obj.bxQntt = $(item).val();
      obj.wrhsWght = ($(item).data("unitWght") * obj.bxQntt).toFixed(1);
      obj.vrtyCd = $(item).data("vrtyCd");
      obj.grdCd = $(item).data("grdCd");

      obj.wrhsQntt = obj.bxQntt;
      obj.inptQntt = obj.bxQntt;
      obj.inptWght = obj.wrhsWght;
      obj.gdsSeCd = "1";
      obj.wrhsSeCd = "1";
      obj.trsprtSeCd = "1";
      regList.push(obj);
    });
    /** plt 반출 VO **/
    let kingPlt = SBUxMethod.get("reg-slt-kingBox") || 0;
    let box = SBUxMethod.get("reg-slt-box") || 0;
    let prdcrCd = SBUxMethod.get("reg-inp-prdcrCd");
    let pltWrhsSpmt = [];
    if(kingPlt > 0){
       pltWrhsSpmt.push({
        apcCd : gv_selectedApcCd,
        jobYmd : wrhsYmd,
        wrhsSpmtSeCd : "2",
        pltBxSeCd : "2",
        pltBxCd : "0001",
        prcsNo : pltno,
        prdcrCd : prdcrCd,
        qntt : kingPlt
      });
    }
    if(box > 0){
      pltWrhsSpmt.push({
        apcCd : gv_selectedApcCd,
        jobYmd : wrhsYmd,
        wrhsSpmtSeCd : "2",
        pltBxSeCd : "2",
        pltBxCd : "0002",
        prcsNo : pltno,
        prdcrCd : prdcrCd,
        qntt : box
      });
    }

    try{
      const postJsonPromise = gfn_postJSON("/am/wrhs/insertRawMtrWrhsListAndPlt.do",
              {rawMtrWrhsList:regList,pltWrhsSpmt:pltWrhsSpmt});
      const data = await postJsonPromise;
      if(data.resultStatus === 'S'){
        fn_reset();
      }
    }catch (e) {
      console.error(e);
    }
  }

  const fn_search = async function(){
    let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");
    const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsToPltno.do",
            {apcCd:gv_selectedApcCd,wrhsYmd:wrhsYmd});
    const data = await postJsonPromise;
    data.resultList.forEach(function(item){
      for (let key in item) {
        if (item[key] === null) {
          delete item[key];
        }
      }
     item.stdGrdList.forEach(function(inner){
       for (let key in inner) {
         if (inner[key] === null) {
           delete inner[key];
         }
       }
     });
    });
    const merged = data.resultList.reduce((acc, item) => {
      let group = acc.find(obj => obj.pltno === item.pltno);

      if (group) {
        group.list.push(item);
      } else {
        acc.push({
          pltno: item.pltno,
          wrhsYmd: item.wrhsYmd,
          prdcrCd: item.prdcrCd,
          prdcrNm: item.prdcrNm,
          prdcrIdentno: item.prdcrIdentno,
          list: [item]
        });
      }
      return acc;
    }, []);
    /** 박스분출 정보 **/
    merged.forEach(function(item){
      if(data.hasOwnProperty(item.pltno)){
        item.kingBox = data[item.pltno].find((el) => el.pltBxCd === '0001').qntt;
        item.box = data[item.pltno].find((el) => el.pltBxCd === '0002').qntt;
      }
    });
    jsonSearchData = [...merged];
    fn_setSearchTable();
  }

  const fn_setSearchTable = function(){
    $("#searchTable > tbody tr").slice(1).remove();
    jsonSearchData.forEach(function(item,idx){
      let el = `
        <tr>
            <td class="td_add">${'${item.pltno}'}</td>
            <td class="td_add">${'${item.wrhsYmd}'}</td>
            <td class="td_add">${'${item.prdcrNm}'}</td>
            <td><button class="btn btn-lg btn-primary" style="min-width:100% !important" onclick="fn_searchDetail(this)">조회</button></td>
        </tr>
        `;
      $("#searchTable > tbody").append(el);
    });
  }

  const fn_searchDetail = function(_el){
    let idx = $(_el).closest("tr").index()-1;
    let selectJson = jsonSearchData[idx];


    /** 저장했던 값 다시 입력 **/
    SBUxMethod.set("reg-inp-prdcrIdentno",selectJson.prdcrIdentno);
    SBUxMethod.set("reg-inp-prdcrNm",selectJson.prdcrNm);
    SBUxMethod.attr("reg-inp-prdcrNm", "style", "background-color:aquamarine");
    SBUxMethod.set("reg-inp-prdcrCd",selectJson.prdcrCd);

    SBUxMethod.set("reg-dtp-wrhsYmd",selectJson.wrhsYmd);
    /** 수정모드 플래그 > pltno **/
    SBUxMethod.set("reg-inp-pltno",selectJson.pltno);
    /** 팔레트 분출 정보 **/
    SBUxMethod.set("reg-slt-kingBox",selectJson.kingBox);
    SBUxMethod.set("reg-slt-box",selectJson.box);

    let regEl = Array.from($("#regTable tbody tr td div div input"));
    regEl.forEach((item) => $(item).val(''));
    /** 원물입고 등급에 관해 품종 지정없이 grdCd 로 구분이 가능함 좀이상함**/
    selectJson.list.forEach(function(item,idx){
      let EL = regEl.find((el) => $(el).data("grdCd") == item.grdCd);
      $(EL).val(item.wrhsQntt);
    });

    SBUxMethod.selectTab('tab_norm', 'tab_spmtPrfmncReg');
  }

  const fn_reset = function(){
    let regEl = Array.from($("#regTable tbody tr td div div input"));
    regEl.forEach((item) => $(item).val(''));
    SBUxMethod.set("reg-inp-prdcrNm",'');
    SBUxMethod.set("reg-inp-prdcrCd",'');
    SBUxMethod.set("reg-inp-prdcrIdentno",'');
    SBUxMethod.set("reg-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
    SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
    SBUxMethod.set("reg-slt-kingBox",'');
    SBUxMethod.set("reg-slt-box",'');
    SBUxMethod.set("reg-inp-pltno",'');
    $("#searchTable > tbody tr").slice(1).remove();
    jsonSearchData.length = 0;
  }
  const fn_fullScreen =function(){

    if(!document.fullscreenElement){
      if(document.documentElement.requestFullscreen){
        document.documentElement.requestFullscreen();
      }else if(document.documentElement.webkitRequestFullscreen){
        document.documentElement.webkitRequestFullscreen()
      }else if(document.documentElement.msRequestFullscreen){
        document.documentElement.msRequestFullscreen();
      }
    }else{
      if(document.exitFullscreen){
        document.exitFullscreen();
      }else if(document.webkitExitFullscreen){
        document.webkitExitFullscreen();
      }else if(document.msExitFullscreen){
        document.msExitFullscreen();
      }
    }
  }

</script>
</html>