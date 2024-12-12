<%
  /**
   * @Class Name : pckgPrfmncRegSimp.jsp
   * @Description : 작업시간 관리화면
   * @author SI개발부
   * @since 2024.09.10
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2024.10.30   	손민성		최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 작업시간 관리</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
  <style>
    #tab_pckgPrfmncReg, #tab_pckgPrfmnc{
      border: 0;
      padding: 0;
    }
    .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-nor-bd > li.sbux-tabs-item > a:hover, .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-inbox-bd > li.sbux-tabs-item > a:hover {
      border-color : rgb(221, 221, 221) !important;
    }
    .tabBox{
      border: 1px solid black;
      font-size: 2vw;
      width: 15vw;
      text-align: center;
      padding: 10px 0px;
      text-wrap: nowrap;
      overflow: hidden;
      cursor: pointer;
      border-radius: 5px;
      background: white;
    }
    .tabBox_sm{
      border: 1px solid black;
      font-size: 1vw;
      width: 5vw;
      text-align: center;
      padding: 10px 0px;
      text-wrap: nowrap;
      overflow: hidden;
      cursor: pointer;
      background: white;

    }
    .tabBox.active, .tabBox_sm.active{
      /*background-color: #fdbf01;*/
      background-color: #1c54a2;
      font-weight: bold;
      color: white;
    }
    #tab_pckgPrfmncReg > li > div > table > tbody > tr > th {
      font-size: 28px;
      font-weight: bold;
    }
    .td_input_mob{
      padding: 10px 3vw !important;
      position: relative;
    }
    .cell{
      display: flex;
      gap: 5px;
      flex-wrap: wrap;
      flex: 0 0 100%;
      justify-content: center;
    }
    .carouselBtn{
      width: 100%;
      height: 100%;
      background-repeat: no-repeat;
      background-position: center;
      background-size: contain;
      background-color: initial;
      border: 0;
    }
    .btn-size {
      width: 10vw;
      font-size: 1.2vw;
    }
    table th{
      text-align : center;
    }
  </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background: white; z-index: 999" >
      <div ondblclick="fn_fullScreen()">
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 정산정보조회 -->
      </div>
      <div>
        <sbux-switch id="switch_single" name="switch_single" uitype="single" switch-speed="fast" glow-effect="false" checked label-front-back-text='확인메세지^켬'>
        </sbux-switch>
      </div>
      <div style="margin-left: auto;">
        <sbux-button
                id="btnReset"
                name="btnReset"
                uitype="normal"
                class="btn btn-sm btn-outline-danger"
                text="초기화"
                onclick="fn_reset"
        ></sbux-button>
        <sbux-button
                id="btnSearch"
                name="btnSearch"
                uitype="normal"
                class="btn btn-sm btn-outline-danger"
                text="조회"
                onclick="fn_search"
        ></sbux-button>
      </div>
    </div>
    <div class="box-body">
      <table class="table table-bordered tbl_fixed" style="margin-bottom: 10px">
        <caption>검색 조건 설정</caption>
        <colgroup>
          <col style="width: 20%">
          <col style="width: 30%">
          <col style="width: 20%">
          <col style="width: 30%">
        </colgroup>
        <tbody>
        <tr>
          <th scope="row" class="th_bg">APC명</th>
          <td class="td_input">
            <div style="display: flex">
              <sbux-input
                      id="gsb-slt-apcCd"
                      name="gsb-slt-apcCd"
                      uitype="text"
                      class="form-control input-sm"
                      style="flex-basis:60%"
                      readonly
                      value="${apcNm}"
              ></sbux-input>
            </div>
          </td>
          <th scope="row" class="th_bg">작업일자</th>
          <td class="td_input">
            <div style="display: flex; gap: 15px; align-items: center">
              <sbux-datepicker
                      id="srch-dtp-jobYmd"
                      name="srch-dtp-jobYmd"
                      uitype="popup"
                      date-format="yyyy-mm-dd"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      style="height: 28px"
              ></sbux-datepicker>
            </div>
          </td>
        </tr>
        </tbody>
      </table>

      <sbux-tabs id="tab_norm" name="tab_norm" uitype="webacc" is-scrollable="false" wrap-style="height:100%"
                 title-target-id-array="tab_pckgPrfmncReg^tab_pckgPrfmnc"
                 title-text-array="작업자등록^작업내역" onclick="fn_changeTab()"
                 title-style-array="{margin-right: 5px;width: 8vw;
                 text-align: center;font-weight: bold;border-radius:0}^{margin-right: 5px;width: 8vw;
                 text-align: center;font-weight: bold;border-radius:0}">
      </sbux-tabs>

      <div class="tab-content" style="height: 500px">
        <div id="tab_pckgPrfmncReg">
          <table class="table table-bordered tbl_fixed" style="margin-top: 10px">
            <colgroup>
              <col style="width: 15%">
              <col style="width: 85%">
            </colgroup>
            <tbody>
            <tr>
              <th scope="row" class="th_bg" style="background: color(srgb 0.8854 0.9386 0.8524);border-right: hidden;">작업구분</th>
              <td id="cnptInfoWrap" class="td_input_mob" style="background-color: color(srgb 0.8854 0.9386 0.8524)">
                <div class="carousel_container" style="width: 100%; overflow: hidden">
                  <div class="carousel" style="display: grid; grid-template-columns: repeat(5,1fr); grid-gap: 5px;width: 100%;">

                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <th scope="row" class="th_bg">작업자</th>
              <td id="prdcrInfoWrap" class="td_input_mob" style="background: #e8f1f9;">
                <div class="carousel_container" style="width: 100%; overflow: hidden">
                  <div class="carousel" style="display: grid; grid-template-columns: repeat(5,1fr); grid-gap: 5px;width: 100%;">

                  </div>
                </div>
              </td>
            </tr>
            <tr>
              <th scope="row" class="th_bg" style="background: #e8f1f9;border-right: hidden;">팔레트번호</th>
              <td id="itemInfoWrap" class="td_input_mob" style="background-color: #e8f1f9">
                <sbux-input
                        id="dtl-inp-pltno"
                        name="dtl-inp-pltno"
                        uitype="text"
                        wrap-style="flex-basis: 61%"
                        style="background-color: #e8f1f9;font-weight: bold;font-size: 28px;text-align: center; height: 100%;border: 0!important;"
                        class="input-sm-ast inpt_data_reqed inpt-mbl srch-pltno"
                        autocomplete="off"
                        onblur="fn_ipt_pltno"
                        onclick="fn_ipt_init"
                        readonly
                ></sbux-input>
                <sbux-input
                        id="dtl-inp-sortno"
                        name="dtl-inp-sortno"
                        uitype="text"
                        wrap-style="display:none"
                ></sbux-input>
                <sbux-input
                        id="dtl-inp-sortSn"
                        name="dtl-inp-sortSn"
                        uitype="text"
                        wrap-style="display:none"
                ></sbux-input>
              </td>
            </tr>
            <tr>
              <th scope="row" class="th_bg" style="background-color:color(srgb 0.9999 0.9492 0.8017)">현재시간</th>
              <td id="vrtyInfoWrap" class="td_input_mob" style="background: color(srgb 0.9999 0.9492 0.8017);">
                <div id="clock" style="padding: 20px 0px;font-size: 35px; font-weight: bold; text-align: center"></div>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <div id="tab_pckgPrfmnc">
          <div id="sb-area-pckgPrfmnc" style="height: 500px; padding: 10px 0px;overflow: scroll!important;"></div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
<script type="text/javascript">

  /** 포장실적 grid 변수 **/
  var jsonPckgPrfmnc = [];
  let gridPckgPrfmnc;

  /** 작업구분 **/
  var jsonApcJobClsfCd = [];

  /** 포장 실적 Obj **/
  let pckgObj = {};

  /** 작업자 원본 **/
  let jsonOprtr = [];

  window.addEventListener('message', async function(e) {
    let obj = e.data;
    if(obj){
      let pltno = obj.pltno;
      let sortno = obj.sortno;
      let sortSn = obj.sort
      SBUxMethod.set("dtl-inp-pltno",pltno);
      SBUxMethod.set("dtl-inp-sortno",sortno);
      SBUxMethod.set("dtl-inp-sortSn",sortSn);
      SBUxMethod.selectTab('tab_norm','tab_pckgPrfmncReg');
      fn_init();
      }
  });

  window.addEventListener("DOMContentLoaded",function(){
    let mainParam = localStorage.getItem("callMain");
    if(mainParam){
      mainParam = JSON.parse(mainParam);
      let pltno = mainParam.pltno;
      let sortno = mainParam.sortno;
      let sortSn = mainParam.sortSn;
      SBUxMethod.set("dtl-inp-pltno",pltno);
      SBUxMethod.set("dtl-inp-sortno",sortno);
      SBUxMethod.set("dtl-inp-sortSn",sortSn);
    }
    localStorage.removeItem("callMain");

    fn_init();
    /** 포장등록시 일일기준 강제처리 **/
    fn_changeTab();
  });

  const fn_init = async function(){
    SBUxMethod.set('srch-dtp-jobYmd',gfn_dateToYmd(new Date()));
    /** 작업구분 **/
    await fn_search_cnpt();
    /** 작업자 **/
    await fn_search_prdcr();
    /** 포장실적 grid 생성 **/
    await fn_create_pckgPrfmnc();
    await fn_search();
    /** 생산자 활성화만 남기기 **/
    $("#prdcrInfoWrap > div > div > div.tabBox:not(.active)").hide();

  }
  const fn_create_pckgPrfmnc = async function(){
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-pckgPrfmnc';
    SBGridProperties.id = 'gridPckgPrfmnc';
    SBGridProperties.jsonref = 'jsonPckgPrfmnc';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.columns = [
      {caption: ["처리"], ref: 'apcCd', type:'button', width:'5%',style: 'text-align:center;padding:5px',fixedstyle: 'font-size:20px;font-weight:bold',
        renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
          return "<button type='button'style='font-size:15px' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
        }
      },
      {caption: ["구분"],	ref: 'jobClsfNm',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
      {caption: ["작업자"],	ref: 'flnm',		type:'output',  width:'15%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
      {caption: ["시작시간"],	ref: 'jobBgngHr',		type:'input',  width:'20%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
      {caption: ["종료시간"],	ref: 'jobEndHr',		type:'input',  width:'20%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
      {caption: ["작업시간"],	ref: 'jobHr',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
      {caption: ["팔레트번호"],	ref: 'sortno',		type:'output',  width:'30%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
    ]
    gridPckgPrfmnc = _SBGrid.create(SBGridProperties);
  }
  /** 작업구분 **/
  const fn_search_cnpt = async function(){
    /** reset **/
    $("#cnptInfoWrap > div > div").empty();
    let data = await gfn_getComCdDtls("JOB_CLSF_CD", gv_apcCd);
    data = data.filter((item) => item.cdVl !== '12');
    await fn_append_button(data,"cnptInfoWrap","cdVlNm","cdVl","job-clsf-cd");
  }
  /** 작업자 **/
  const fn_search_prdcr = async function(_jobClsfCd = ''){
    $("#prdcrInfoWrap > div > div").empty();
    let postJsonPromise = gfn_postJSON("/am/oprtr/selectOprtrList.do", {
        apcCd 		: gv_selectedApcCd,
      ...( _jobClsfCd ? { jobClsfCd: _jobClsfCd } : {} )
    });
    let data = await postJsonPromise;
    jsonOprtr = [...data.resultList];
    await fn_append_button(data.resultList,"prdcrInfoWrap","flnm","jobClsfCd","oprtr");
  }
  /** btn append **/
  const fn_append_button = async function(data, id, label, value, dataName){
    if(gfn_isEmpty(data)) return;
    let targetId = "#" + id;
    for(let i = 0; i < data.length; i++){
      let chk = `${'${data[i][value]}'}`;
        $(`${'${targetId}'} > .carousel_container > .carousel`).append(`
                <div class="tabBox" onclick="fn_select_button(this)" data-${'${dataName}'}="${'${data[i][value]}'}">
                    ${'${data[i][label]}'}
                </div>
                `);
    }
  }
  /** btn click **/
  const fn_select_button = async function(_el){
    let dataObj = $(_el).data();
    /** 만약 정보 더 필요해서 data 추가되면 돌려서 집어야함 **/
    for(let key in dataObj){
      /** 선택된 버튼이 작업분류일때 분기 **/
      if(key == 'jobClsfCd') {
        if ($(_el).hasClass("active")) {
          return;
        } else {
          /** 이외 버튼 OFF 및 분류에 대한 작업자 필터링 **/
          $(_el).closest('div.carousel').find("div.active").removeClass("active");
          $(_el).addClass("active");

          let btns = document.querySelectorAll("#prdcrInfoWrap > .carousel_container > .carousel > div.tabBox");
          let jobClsfCd = dataObj[key];
          btns.forEach(function (item) {
          if ($(item).data('oprtr') !== jobClsfCd) {
            $(item).hide();
          } else {
            if(!$(item).hasClass("notMatch")){
              $(item).show();
            }
          }
        });
      }
        // $("#prdcrInfoWrap > .carousel_container > .carousel").empty();
        // await fn_search_prdcr(dataObj[key]);
        /** 선택된 버튼이 작업자일때 분기 **/
      }else if(key == 'oprtr'){
        // let jobClsfCd = $("#cnptInfoWrap > div > div > div.tabBox.active").data("jobClsfCd");
        let jobClsfCd = $(_el).data("oprtr");
        let jobClsfNm = $("#cnptInfoWrap > div > div > div.tabBox.active").text().trim();
        let oprtrNm = $(_el).text().trim();
        let jobYmd = SBUxMethod.get("srch-dtp-jobYmd");
        let pltno = SBUxMethod.get('dtl-inp-pltno');
        let jobBgngHr = $("#clock").text();
        let sortno = SBUxMethod.get('dtl-inp-sortno');
        jobBgngHr = formatTimeToKorean(jobBgngHr);

        /** 작업 종료 Update **/
        if($(_el).hasClass("active")){
          const idx = jsonPckgPrfmnc.findIndex(obj =>
                  obj.jobClsfCd === jobClsfCd && obj.oprtrNm === oprtrNm
          );
          if(idx !== -1){
            jsonPckgPrfmnc[idx].jobEndHr = jobBgngHr;
            jsonPckgPrfmnc[idx].jobHr = calculateTimeDifference(jsonPckgPrfmnc[idx].jobBgngHr,jobBgngHr);
            gridPckgPrfmnc.rebuild();
            let obj = {...jsonPckgPrfmnc[idx]};
            obj.jobBgngHr = formatTime(obj.jobBgngHr);
            obj.jobEndHr = formatTime(obj.jobEndHr);
            obj.jobHr = parseAndFormatToHHmm(obj.jobHr);
            obj.sortno = pltno;
            obj.jobYmd = jobYmd;
            obj.brdt = jsonOprtr.find(item => item.flnm === obj.flnm && item.jobClsfCd === obj.jobClsfCd)?.brdt;
            /** 작업시간 1분미만 미저장 및 행삭제처리 **/
            if(obj.jobHr < 2){
              jsonPckgPrfmnc.slice(idx,1);
              gridPckgPrfmnc.rebuild();
              obj.prfmncSn = '';
              let data = await gfn_postJSON("/am/cmns/deleteOprtrPrfmnc.do",obj);
            }else{
              /** 해당 실적 저장 반영 **/
              let data = await gfn_postJSON("/am/oprtr/updateOprtrSortPrfmnc",obj);
            }
            $(_el).removeClass("active");
          }
          /** 작업 시작 Insert **/
        }else{
          $(_el).addClass("active");
          if(gfn_isEmpty(pltno)){
            gfn_comAlert("W0005","팔레트번호");
            return;
          }

          let obj = {
            apcCd : gv_selectedApcCd,
            jobClsfCd : jobClsfCd,
            jobClsfNm : jobClsfNm,
            oprtrNm : oprtrNm,
            pltno : pltno,
            jobBgngHr : jobBgngHr,
            flnm : oprtrNm,
            jobYmd : jobYmd,
            sortno : pltno
          }
          let brdt = jsonOprtr.find(item => item.flnm === obj.flnm && item.jobClsfCd === obj.jobClsfCd)?.brdt;
          obj.brdt = brdt;
          let saveJson = {...obj};
          saveJson.jobBgngHr = formatTime(obj.jobBgngHr);
          jsonPckgPrfmnc.push(obj);
          gridPckgPrfmnc.rebuild();
          let data = await gfn_postJSON("/am/oprtr/insertOprtrSortPrfmnc",saveJson);
        }
      }

    }
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

  const fn_search = async function(){
    let jobYmd = SBUxMethod.get("srch-dtp-jobYmd");
    postJsonPromise = gfn_postJSON("/am/oprtr/selectOprtrSortPrfmncList",{apcCd: gv_apcCd,jobYmd: jobYmd});

    const data = await postJsonPromise;
    try {
      if(data.resultStatus === 'S'){
        let pltno = SBUxMethod.get("dtl-inp-pltno");
        let oprtrBtn = Array.from(document.querySelectorAll("#prdcrInfoWrap >  .carousel_container > .carousel > div.tabBox"));
        /** btn acvice reset **/
        oprtrBtn.forEach(item => $(item).removeClass("active"));

        data.resultList.forEach(function(obj,idx){
          /** date format **/
          obj.jobBgngHr = formatTimeToKorean(obj.jobBgngHr);
          obj.jobEndHr = obj.jobEndHr ? formatTimeToKorean(obj.jobEndHr) : '';
          obj.jobHr = obj.jobHr > 0 ? convertToHourMinute(String(obj.jobHr)) : '';
          obj.oprtrNm = obj.flnm;

          let el = oprtrBtn.find(element => {
            return $(element).data('oprtr') === obj.jobClsfCd && $(element).text().trim() === obj.flnm;
          });

          if(gfn_isEmpty(obj.jobEndHr)){
            $(el).addClass("active");
            $(el).hide();
          }

          // /** 다른 팔레트에서 작업중인 작업자 제외 **/
          // if(obj.sortno === pltno){
          //   $(el).hide();
          //   $(el).addClass("notMatch");
          // }else{
          //   /** 목록에 있지만 작업종료된 작업자 **/
          //   if(!obj.jobEndHr){
          //     $(el).addClass("active");
          //   }
          // }
        });
        jsonPckgPrfmnc = data.resultList;
        gridPckgPrfmnc.rebuild();
      }
    }catch (e) {
      console.error(e);
    }
  }

  const fn_delRow = async function(_nRow){
    if(!gfn_comConfirm("Q0001","삭제")){
        return;
      }
    let delObj = gridPckgPrfmnc.getRowData(_nRow);
    delObj.jobHr = parseAndFormatToHHmm(delObj.jobHr);

    const postJsonPromise = gfn_postJSON("/am/cmns/deleteOprtrPrfmnc.do",delObj);
    const data = await postJsonPromise;
    try {
      if(data.resultStatus === 'S'){
        gfn_comAlert("I0001");
        fn_search();
      }
    }catch (e) {
      console.error(e);
    }
  }

  const fn_reset = function(){
    $(".tabBox.active").removeClass('active');
    $(".tabBox_sm.active").removeClass('active');
    fn_RegReset();
  }

  const fn_oneDay = function(){
    let checked = SBUxMethod.getCheckbox('chkbox_norm', {trueValueOnly:true, ignoreDisabledValue:false});
    const isEmpty = (obj) => Object.keys(obj).length === 0;

    if(isEmpty(checked)){
      SBUxMethod.show('srch-dtp-pckgYmdTo');
    }else{
      SBUxMethod.hide('srch-dtp-pckgYmdTo');
    }
  }

  const fn_changeTab = function(){
    let searchTab = SBUxMethod.get('tab_norm');
    if(searchTab === 'tab_pckgPrfmncReg'){
      SBUxMethod.hide('srch-dtp-pckgYmdTo');
      SBUxMethod.attr('chkbox_norm','checked',true);
      SBUxMethod.attr('chkbox_norm','readonly',true);
    }else{
      SBUxMethod.attr('chkbox_norm','readonly',false);
    }
  }

  /** 시간관련 함수**/
  function formatTime(time) {
    const [period, timeStr] = time.split(' ');
    let [hour, minute] = timeStr.split(':').map(Number);

    // 오전/오후에 따른 시간 변환
    if (period === '오후' && hour !== 12) {
      hour += 12; // 오후는 12시가 아니면 12시간을 더해줌
    }
    if (period === '오전' && hour === 12) {
      hour = 0; // 오전 12시는 00시로 변환
    }

    // HH:mm 포맷으로 반환
    return `${'${String(hour).padStart(2, "0")}'}:${'${String(minute).padStart(2, "0")}'}`;
  }

  function parseAndFormatToHHmm(timeString) {
    let hours = 0;
    let minutes = 0;

    // 시간과 분이 포함된 경우, 시간과 분을 추출
    if (timeString.includes("시간") && timeString.includes("분")) {
      const [hourPart, minutePart] = timeString.split("시간");
      hours = parseInt(hourPart.trim(), 10);
      minutes = parseInt(minutePart.replace("분", "").trim(), 10);
    }
    // 시간만 포함된 경우
    else if (timeString.includes("시간")) {
      hours = parseInt(timeString.replace("시간", "").trim(), 10);
    }
    // 분만 포함된 경우
    else if (timeString.includes("분")) {
      minutes = parseInt(timeString.replace("분", "").trim(), 10);
    }

    // 두 자리로 포맷
    const formattedHours = String(hours).padStart(2, '0');
    const formattedMinutes = String(minutes).padStart(2, '0');

    // HHmm 형식으로 반환
    return `${'${formattedHours}'}${'${formattedMinutes}'}`;
  }

  function calculateTimeDifference(time1, time2) {
    // 시간을 Date 객체로 변환하기
    const parseTime = (time) => {
      const [period, hourMinute] = time.split(' ');
      let [hour, minute] = hourMinute.split(':').map(Number);

      // 오전/오후에 따라 시간 조정
      if (period === '오후' && hour !== 12) hour += 12;
      if (period === '오전' && hour === 12) hour = 0;

      return new Date(0, 0, 0, hour, minute);
    };

    // Date 객체로 변환 후 시간 차이 계산 (밀리초 단위)
    const date1 = parseTime(time1);
    const date2 = parseTime(time2);
    const diffMs = Math.abs(date2 - date1);

    // 시간과 분으로 변환
    const diffHours = Math.floor(diffMs / (1000 * 60 * 60));
    const diffMinutes = Math.floor((diffMs % (1000 * 60 * 60)) / (1000 * 60));

    // 조건에 따라 시간과 분 조합하여 반환
    let result = "";
    if (diffHours > 0) result += `${'${diffHours}'}시간`;
    if (diffMinutes >= 0) result += (result ? " " : "") + `${'${diffMinutes}'}분`;

    return result;
  }

  function formatTimeToKorean(time) {
    const [hourStr, minuteStr] = time.split(":").map(part => part.trim());
    let hour = parseInt(hourStr, 10);
    const minute = parseInt(minuteStr, 10);
    const period = hour < 12 ? "오전" : "오후";

    // 12시간제로 변경
    if (hour === 0) hour = 12;        // 자정
    else if (hour > 12) hour -= 12;    // 오후 시간

    // 두 자리 숫자로 포맷팅
    const formattedHour = String(hour).padStart(2, "0");
    const formattedMinute = String(minute).padStart(2, "0");

    return `${'${period}'} ${'${formattedHour}'}:${'${formattedMinute}'}`;
  }
  function convertToHourMinute(timeString) {
    let hours = 0;
    let minutes = 0;

    if (timeString.length === 4) {
      // 4자리 숫자의 경우: 앞 2자리 = 시간, 뒤 2자리 = 분
      hours = parseInt(timeString.slice(0, 2), 10);
      minutes = parseInt(timeString.slice(2, 4), 10);
    } else if (timeString.length === 3) {
      // 3자리 숫자의 경우: 첫 번째 자리 = 시간, 뒤 2자리 = 분
      hours = parseInt(timeString.slice(0, 1), 10);
      minutes = parseInt(timeString.slice(1, 3), 10);
    } else if (timeString.length === 2) {
      // 2자리 숫자의 경우: 분으로 간주
      minutes = parseInt(timeString, 10);
    } else if (timeString.length === 1) {
      // 1자리 숫자의 경우: 분으로 간주
      minutes = parseInt(timeString, 10);
    }

    // 결과를 저장할 배열
    let result = [];

    // 시간이 0이 아닐 때만 추가
    if (hours > 0) {
      result.push(`${'${hours}'}시간`);
    }

    // 분이 0이 아닐 때만 추가
    if (minutes > 0) {
      result.push(`${'${minutes}'}분`);
    }

    // 결과 배열을 공백으로 구분하여 문자열로 반환
    return result.join(" ");
  }

  function updateClock() {
    var now = new Date();
    var hours = now.getHours().toString().padStart(2, '0');
    var minutes = now.getMinutes().toString().padStart(2, '0');
    var seconds = now.getSeconds().toString().padStart(2, '0');

    var timeString = `${'${hours}'} : ${'${minutes}'} : ${'${seconds}'}`;
    document.getElementById('clock').textContent = timeString;
  }

  // 매 초마다 시계 업데이트
  setInterval(updateClock, 1000);

  // 페이지 로드 시에도 시계 업데이트
  updateClock();



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
