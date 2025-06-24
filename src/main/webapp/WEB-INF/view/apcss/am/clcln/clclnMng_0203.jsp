<%
  /**
   * @Class Name : clclnMng.jsp
   * @Description : 정산관리 화면
   * @author SI개발부
   * @since 2024.09.10
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2025.05.14   	손민성		최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 정산관리</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
  <style>
    .sbux-pik-icon-btn{
      height: 30px!important;
    }
  </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background: white; z-index: 999" >
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 정산정보조회 -->
      </div>
      <div style="margin-left: auto;">
        <sbux-button
                id="btnSearch"
                name="btnSearch"
                uitype="normal"
                class="btn btn-sm btn-outline-danger"
                text="조회"
                onclick="fn_search"
        ></sbux-button>
        <sbux-button
                id="btnCacluate"
                name="btnCacluate"
                uitype="normal"
                class="btn btn-sm btn-primary"
                text="자동계산"
                onclick="fn_cacluate"
                disabled
        ></sbux-button>
        <sbux-button
                id="btnSave"
                name="btnSave"
                uitype="normal"
                class="btn btn-sm btn-outline-danger"
                text="저장"
                onclick="fn_save"
        ></sbux-button>
        <sbux-button
                id="btnPrint"
                name="btnPrint"
                uitype="normal"
                class="btn btn-sm btn-primary"
                text="발행"
                onclick="fn_print"
                disabled
        ></sbux-button>
        <sbux-button
                id="btnExit"
                name="btnExit"
                uitype="normal"
                class="btn btn-sm btn-outline-danger"
                text="종료"
                onclick="fn_exit"
        ></sbux-button>
      </div>
    </div>
    <div class="box-body" style="height: calc(100% - 100px)!important;">
      <table class="table table-bordered tbl_fixed" style="margin-bottom: 1vh">
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
          <td class="td_input" style="border-right: hidden;">
            <div style="display: flex;">
              <%@ include file="../../../frame/inc/apcSelectComp.jsp" %>
            </div>
          </td>
          <td colspan="2"></td>
        </tr>
        <tr>
          <th scope="row" class="th_bg"><span class="data_required"></span>정산일자</th>
          <td class="td_input" style="border-right: hidden;">
            <div style="display:flex;">
              <sbux-datepicker
                      id="srch-dtp-sortYmd"
                      name="srch-dtp-sortYmd"
                      date-format="yyyy-mm-dd"
<%--                      style="width:100%;"--%>
                      class="sbux-pik-group-apc inpt_data_reqed input-sm-ast"
                      onchange="fn_searchSortRslt()"
              ></sbux-datepicker>
            </div>
          </td>
          <td colspan="2"></td>
        </tr>
        </tbody>
      </table>
      <sbux-tabs
              id="idxtabTopJson"
              name="idxtabTopJson"
              uitype="normal"
              jsondata-ref="tabJsonData"
              jsondata-css-style="cssstyleKey"
              onclick="fn_clickTab()"
      ></sbux-tabs>

      <div class="tab-content" style="height: 75%">
        <div id="tab_sortRslt">
          <div id="sb-area-sortRslt" style="height: 100%"></div>
        </div>
        <div id="tab_autoCal">
          <div id="sb-area-autoCal" style="height: 100%"></div>
        </div>
        <div id="tab_rsltSrch">
          <div id="sb-area-rsltSrch" style="height: 100%"></div>
        </div>
      </div>
    </div>
  </div>
</section>
<script src="${pageContext.request.contextPath}/js/out/view.bundle.js"></script>
</body>
<script type="text/javascript">
  /** tab json **/
  var tabJsonData  = [
    { "id" : "0", "pid" : "-1", "order" : "1", "text" : "선별결과", "targetid" : "tab_sortRslt" , "targetvalue" : "inptReg" , "cssstyleKey" : "{margin-right: 5px;width: 8vw;text-align: center;font-weight: bold;border-radius:0}"},
    { "id" : "1", "pid" : "-1", "order" : "2", "text" : "자동계산", "targetid" : "tab_autoCal" , "targetvalue" : "prfmncReg" , "cssstyleKey" : "{margin-right: 5px;width: 8vw;text-align: center;font-weight: bold;border-radius:0}"},
    { "id" : "2", "pid" : "-1", "order" : "3", "text" : "결과조회", "targetid" : "tab_rsltSrch" , "targetvalue" : "tot" , "cssstyleKey" : "{margin-right: 5px;width: 8vw;text-align: center;font-weight: bold;border-radius:0}"}]

  /** 선별결과 변수 **/
  var gridSortRslt;
  var jsonSortRslt = [];

  /** 자동계산 변수 **/
  var gridAutoCal;
  var jsonAutoCal = [];

  /** 결과조회 변수 **/
  var gridRsltSrch;
  var jsonGridRsltSrch = [];

  /** col 구분 **/
  var jsonGrdColumnData = [];

  /** 정산테이블 data **/
  var jsonClclnData = [];

  window.addEventListener('DOMContentLoaded', async function(e) {
    SBUxMethod.set('srch-dtp-sortYmd',gfn_dateToYmd(new Date()));

    await fn_init();
  });

  const fn_init = async function (){
     await fn_setGrdDsctnCol();
     await fn_createGrid();
     await fn_searchSortRslt();
  }

  /** 상품등급목록 조회 **/
  const fn_setGrdDsctnCol = async function() {
    let itemCd = SBUxMethod.get('srch-slt-itemCd');
    const param = {
      apcCd: gv_selectedApcCd
      , grdSeCd : '03'
      , itemCd : '0802'
    }
    jsonGrdColumnData.length = 0;
    try {
      const postJsonPromise = gfn_postJSON(
              "/am/sort/selectExhstDsctnCol.do",
              param,
              null,
              false
      );

      const data = await postJsonPromise;
      jsonGrdColumnData = data.resultList;

    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
    }

  }

  /** 선별결과 조회 **/
  const fn_searchSortRslt = async function(){
    let inptYmdFrom = SBUxMethod.get("srch-dtp-sortYmd");
    let inptYmdTo = SBUxMethod.get("srch-dtp-sortYmd");
    const param = {
      apcCd: gv_selectedApcCd,
      inptYmdFrom: inptYmdFrom,
      inptYmdTo: inptYmdTo,
    }
    jsonSortRslt.length = 0;
    let totalRecordCount = 0;
    try {
      const postJsonPromise = gfn_postJSON(
              "/am/sort/selectGrdDsctn.do",
              param,
              null,
              false
      );
      const data = await postJsonPromise;
      data.resultList.forEach(item => {
        const sortRsltVo = {
          prdcrNm : item.PRDCR_NM
          ,grd1 : item.WGHT_1
          ,grd2 : item.WGHT_2
          ,grd3 : item.WGHT_3
          ,grd4 : item.WGHT_4
          ,grd5 : item.WGHT_5
          ,grd6 : item.WGHT_6
          ,grd7 : item.WGHT_7
          ,grd8 : item.WGHT_8
          ,grd9 : item.WGHT_9
          ,grd10 : item.WGHT_10
          ,grd11 : item.WGHT_11
          ,grd12 : item.WGHT_12
          ,grd13 : item.WGHT_13
          ,grd14 : item.WGHT_14
          ,grd15 : item.WGHT_15
          ,grd16 : item.WGHT_16
          ,grd17 : item.WGHT_17
          ,prevTotal : item.SORT_WGHT
          ,editTotal : item.RMRK
          ,calTotal : parseInt(item.RMRK) ?(parseInt(item.SORT_WGHT) - parseInt(item.RMRK))||0 : ''
          ,itemCd : item.ITEM_CD
          ,vrtyCd : item.VRTY_CD
          ,prdcrCd : item.RPRS_PRDCR_CD
          ,spcfctCd : item.SPCFCT_CD
        };
        jsonSortRslt.push(sortRsltVo);
      });
      gridSortRslt.refresh();

      /** 정산처리 행 체크 **/
      // await fn_searchClclnList();

    }catch (e) {

    }
  }

  /** 정산처리 내역 조회 **/
  const fn_searchClclnList = async function(){
    let clclnYmd = SBUxMethod.get("srch-dtp-sortYmd");

    const postJsonPromise = gfn_postJSON("/am/clcln/selectSortClclnList.do",{apcCd:gv_selectedApcCd,clclnYmd:clclnYmd});
    const data = await postJsonPromise;

    if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
    }
    jsonClclnData.length = 0;
    jsonClclnData = [...data.resultList];
  }

  /** 탭별 grid 생성 **/
  const fn_createGrid = async function(){
    await fn_createSortRslt();
    await fn_createAutoCal();
    await fn_createRsltSrch();
  }

  /** 선별결과 grid **/
  const fn_createSortRslt = function (){
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-sortRslt';
    SBGridProperties.id = 'gridSortRslt';
    SBGridProperties.jsonref = 'jsonSortRslt';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.filtering = true;
    SBGridProperties.filteringtabname = {
      checklist: '체크리스트',
    };
    SBGridProperties.oneclickedit = true;
    SBGridProperties.columns = [
      {caption: ["성명"], ref: 'prdcrNm',type: 'output', width:'100px',filtering: {uitype : 'checklist^', listsearch: true},style: 'text-align:center'},
      {caption: ["실중량"], ref: 'editTotal',type: 'input', width:'100px', filtering: {displayui : false},style: 'text-align:center; background-color:#fff3cc'},
      {caption: ["세척중량"], ref: 'prevTotal',type: 'output', width:'100px',filtering: {displayui : false}, style: 'text-align:center'},
      {caption: ["오차"], ref: 'calTotal',type: 'output', width:'100px',filtering: {sort:'asc'}, style: 'text-align:center;color:red'},
    ];
    /** 상품등급별 컬럼 추가 **/
    let addSortRsltGrdCol = []
    jsonGrdColumnData.forEach(function(item,idx){
      const baseCol = {
        caption: [item.GRD_NM],
        ref: 'grd' + item.GRD_SN,
        type: 'output',
        width: '100px',
        filtering: { displayui: false },
        style: 'text-align:right; padding-right:5px;',
        format: { type: 'number', rule: '#,###', emptyvalue: '0' },
        merge: false,
        disabled: true
      };
      if(idx > 13){
        baseCol.fixedstyle = 'background-color:#ddebf7';
      }
      addSortRsltGrdCol.push(baseCol);
    });
    let originColumns = SBGridProperties.columns;
    originColumns.splice(1,0,...addSortRsltGrdCol);
    let cnt = originColumns.length;
    let avg = 100 / cnt;
    originColumns.forEach(item => item.width = avg + '%');

    SBGridProperties.columns = originColumns;
    gridSortRslt = _SBGrid.create(SBGridProperties);
    gridSortRslt.bind('valuechanged','fn_calTotal');

  }
  /** 자동계산 grid **/
  const fn_createAutoCal = function(){
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-autoCal';
    SBGridProperties.id = 'gridAutoCal';
    SBGridProperties.jsonref = 'jsonAutoCal';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.oneclickedit = true;
    SBGridProperties.columns = [
      {caption: ["성명"], ref: 'prdcrNm',type: 'output', width:'100px',filtering: {uitype : 'checklist^', listsearch: true},style: 'text-align:center'},
      {caption: ["기존중량"], ref: 'editTotal',type: 'output', width:'100px', filtering: {displayui : false},style: 'text-align:center;'},
      {caption: ["기존오차"], ref: 'calTotal',type: 'output', width:'100px',filtering: {sort:'asc'}, style: 'text-align:center;color:red'},
      {caption: ["계산중량"], ref: 'calWght',type: 'output', width:'100px',filtering: {sort:'asc'}, style: 'text-align:center;color:red'},
      {caption: ["계산오차"], ref: 'calDev',type: 'output', width:'100px',filtering: {sort:'asc'}, style: 'text-align:center;color:red'},
    ];
    /** 상품등급별 컬럼 추가 **/
    let addSortRsltGrdCol = []
    jsonGrdColumnData.forEach(function(item,idx){
      if(idx > 13){
        return;
      }
      const baseCol = {
        caption: [item.GRD_NM],
        ref: 'grd' + item.GRD_SN,
        type: 'output',
        width: '100px',
        filtering: { displayui: false },
        style: 'text-align:right; padding-right:5px;',
        format: { type: 'number', rule: '#,###', emptyvalue: '0' },
        merge: false,
        disabled: true
      };
      addSortRsltGrdCol.push(baseCol);
    });
    let originColumns = SBGridProperties.columns;
    originColumns.splice(1,0,...addSortRsltGrdCol);
    let cnt = originColumns.length;
    let avg = 100 / cnt;
    originColumns.forEach(item => item.width = avg + '%');
    SBGridProperties.columns = originColumns;
    gridAutoCal = _SBGrid.create(SBGridProperties);
  }
  /** 결과조회 grid **/
  const fn_createRsltSrch = function(){
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-rsltSrch';
    SBGridProperties.id = 'gridRsltSrch';
    SBGridProperties.jsonref = 'jsonGridRsltSrch';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.oneclickedit = true;
    SBGridProperties.columns = [
      {caption : [''],	ref : 'reportYn', width : '2%',	style : 'text-align:center;background-color:#fff3cc',	type : 'checkbox', typeinfo : {fixedcellcheckbox : { usemode : true , rowindex : 0 , deletecaption : false }}},
      {caption: ["성명"], ref: 'prdcrNm',type: 'output', width:'100px',filtering: {uitype : 'checklist^', listsearch: true},style: 'text-align:center'},
      {caption: ["실중량"], ref: 'originWght',type: 'output', width:'100px', filtering: {displayui : false},style: 'text-align:center;'},
      {caption: ["세척중량"], ref: 'prevTotal',type: 'output', width:'100px',filtering: {displayui : false}, style: 'text-align:center'},
      {caption: ["오차"], ref: 'calTotal',type: 'output', width:'100px',filtering: {sort:'asc'}, style: 'text-align:center;color:red'},
    ];
    let addSortRsltGrdCol = []
    jsonGrdColumnData.forEach(function(item,idx) {
      const baseCol = {
        caption: [item.GRD_NM],
        ref: 'grd' + item.GRD_SN,
        type: 'input',
        width: '100px',
        filtering: {displayui: false},
        style: 'text-align:right; padding-right:5px;background-color:#fff3cc;',
        format: {type: 'number', rule: '#,###', emptyvalue: '0'},
        merge: false
      };
      addSortRsltGrdCol.push(baseCol);
    });
    let originColumns = SBGridProperties.columns;
    originColumns.splice(2,0,...addSortRsltGrdCol);
    /** checkbox 고정 % **/
    let cnt = originColumns.length -1;
    let avg = 98 / cnt;
    originColumns.forEach(function(item,idx){
      if(idx == 0)return;
      item.width = avg + '%'
    })
    gridRsltSrch = _SBGrid.create(SBGridProperties);
    gridRsltSrch.bind('valuechanged','fn_resultCalTotal');
  }

  /** grid value Changed 오차 연산 **/
  const fn_calTotal = function(){
    var nRow = gridSortRslt.getRow();
    var nCol = gridSortRslt.getCol();
    let nRowData = gridSortRslt.getRowData(nRow);
    let prevTotal = nRowData.prevTotal;
    let editTotal = nRowData.editTotal;
    let calTotal = parseInt(prevTotal) - parseInt(editTotal);

    /** 연산실패시 되돌림 **/
    if(isNaN(calTotal) || calTotal == 0 ){
      gridSortRslt.setCellData(nRow,nCol,prevTotal);
    }else{
      nRowData.calTotal = calTotal;
      gridSortRslt.setRowData(nRow,nRowData);
      gridSortRslt.initFiltering();
      let lastFocusIdx = gridSortRslt.getLastFocusRow();
      gridSortRslt.clickCell(lastFocusIdx,18);
    }
  }
  /** 결과조회 계산중량 **/
  const fn_resultCalTotal = function(){
    let nRow = gridRsltSrch.getRow();
    let nRowData = gridRsltSrch.getRowData(nRow);
    let prevTotal = 0;
    Object.keys(nRowData).forEach(key => {
      if (/^grd\d+$/.test(key)) {
        prevTotal += Number(nRowData[key]);
      }
    });
    nRowData.prevTotal = prevTotal;
    nRowData.calTotal = prevTotal - nRowData.originWght;
    gridRsltSrch.setRowData(nRow,nRowData,true);
  }

  /** tab onclick handle **/
  const fn_clickTab = async function(){
    /** tab 이동시 버튼 활성화 유무 **/
    let tabId = SBUxMethod.get('idxtabTopJson');

    switch (tabId) {
      case 'tab_sortRslt':
        SBUxMethod.attr('btnSearch', 'disabled', 'false');
        SBUxMethod.attr('btnCacluate', 'disabled', 'true');
        SBUxMethod.attr('btnSave', 'disabled', 'false');
        SBUxMethod.attr('btnPrint', 'disabled', 'true');
        break;
      case 'tab_autoCal':
        SBUxMethod.attr('btnSearch', 'disabled', 'true');
        SBUxMethod.attr('btnCacluate', 'disabled', 'false');
        SBUxMethod.attr('btnSave', 'disabled', 'true');
        SBUxMethod.attr('btnPrint', 'disabled', 'true');
        break;
      case 'tab_rsltSrch':
        SBUxMethod.attr('btnSearch', 'disabled', 'false');
        SBUxMethod.attr('btnCacluate', 'disabled', 'true');
        SBUxMethod.attr('btnSave', 'disabled', 'false');
        SBUxMethod.attr('btnPrint', 'disabled', 'false');
        break;
    }

  }
  /** 수정이 일어난 대상 자동계산 **/
  const fn_autoCal = function(){
    let rowData = gridAutoCal.getGridDataAll();
    /** 자동계산 대상 == 1이상 **/
    rowData.forEach(obj =>{
      let editTotal = parseInt(obj.editTotal);
      let calTotal = parseInt(obj.calTotal);
      let calWght = 0;
      Object.keys(obj).forEach(key => {
        if (/^grd\d+$/.test(key)) {
          const num = parseInt(key.slice(3));
          if (num < 15) {
            let value = parseInt(obj[key]);
            let result = Math.round(value - (value * (calTotal / editTotal)));
            calWght += result;
            obj[key] = result;
          }
        }
      });
      obj.calWght = calWght;
      obj.calDev = parseInt(obj.editTotal) - parseInt(obj.calTotal) - calWght;
    });
    gridAutoCal.rebuild();
    fn_setRsltSrch();
  }
  const fn_setRsltSrch = async function(){
    let autoCalData = gridAutoCal.getGridDataAll(true);
    autoCalData.forEach(obj => {
      let total = 0;
      Object.keys(obj).forEach(key => {
        if (/^grd\d+$/.test(key)) {
          total += Number(obj[key]);
        }
      });
      obj.prevTotal = total;
      obj.calTotal = total - obj.originWght;
    });
    jsonGridRsltSrch = [...autoCalData];
    gridRsltSrch.rebuild();
  }
  //region 상단버튼
  const fn_search = async function(){
    let calTotalList = gridSortRslt.getGridDataAll().map(item => item.calTotal).filter(val => val != null);;

    // if (calTotalList.length > 0) {
    //   const result = await Swal.fire({
    //     title: '실중량 변경이 존재합니다.<br>재조회하시겠습니까?',
    //     icon: 'question',
    //     showCancelButton: true,
    //     confirmButtonColor: '#3085d6',
    //     cancelButtonColor: '#d33',
    //     confirmButtonText: '조회',
    //     cancelButtonText: '취소',
    //   });
    //
    //   if (!result.isConfirmed) return;
    // }
    await fn_searchSortRslt();
  }
  /** 자동계산 버튼 **/
  const fn_cacluate = function(){
    let tabId = SBUxMethod.get('idxtabTopJson');
    if(tabId !== 'tab_autoCal'){
      return;
    }
    let sortRsltData = gridSortRslt.getGridDataAll(true).filter(item => parseInt(item.calTotal) > 0);
    if(!sortRsltData.length > 0){
      return;
    }
    /** 폐기처리 합산 및 기존중량에서 제외 >> grdCd SN : 15,16,17 고정 **/
    sortRsltData.forEach(item => {
      /** 작성한 원 실중량 save **/
      item.originWght = item.editTotal;
      let destCnt = 0;
      destCnt += parseInt(item.grd15);
      destCnt += parseInt(item.grd16);
      destCnt += parseInt(item.grd17);
      let prevEditTotal = parseInt(item.prevTotal);
      item.editTotal = prevEditTotal - destCnt;
    });
    jsonAutoCal.length = 0;
    jsonAutoCal = [...sortRsltData];
    gridAutoCal.rebuild();

    fn_autoCal();
  }
  const fn_save = async function(){
    let tabId = SBUxMethod.get('idxtabTopJson');

    //tab_sortRslt 선별결과
    //tab_rsltSrch 결과조회
    /** save vo list **/
    let saveClclnMstrVoList = [];
    let saveClclnDtlVoList = [];

    let clclnYmd = SBUxMethod.get('srch-dtp-sortYmd');
    let sortRsltList = gridSortRslt.getGridDataAll(true);

    if(tabId === 'tab_sortRslt'){
      let paramList = [];

      sortRsltList.forEach(function(item,idx){
        if(gridSortRslt.getRowStatus(idx + 1) === 0 )return;

        let sortVo = {
          apcCd : gv_selectedApcCd,
          itemCd : item.itemCd,
          vrtyCd : item.vrtyCd,
          prdcrCd : item.prdcrCd,
          inptYmd : clclnYmd,
          rmrk : item.editTotal || ''
        }
        for(const [key, value] of Object.entries(item)){
          if(/grd/.test(key)){
            sortVo.grdCd = key.replace('grd','');
            paramList.push(sortVo);
          }
        }
      });
      const postJsonPromise = gfn_postJSON("/am/invntr/updateSortInvntrList.do",paramList);
      const data = await postJsonPromise;

      if (!_.isEqual("S", data.resultStatus)) {
              gfn_comAlert(data.resultCode, data.resultMessage);
              return;
      }
      await fn_search();

    }else if(tabId === 'tab_rsltSrch'){
      sortRsltList.forEach(function(item,idx,arr){
        let mstrVo = {
          apcCd : gv_selectedApcCd,
          clclnYmd : clclnYmd,
          clclnSn : idx,
          prdcrCd : item.prdcrCd,
          itemCd : item.itemCd,
          vrtyCd : item.vrtyCd,
          spcfctCd : item.spcfctCd,
          actlWght : item.editTotal,
          calWght : item.prevTotal,
          diffWght : item.calTotal,
        }
        saveClclnMstrVoList.push(mstrVo);
        /** dtl 용 각 grd push **/
        Object.keys(item).forEach(key => {
          if (/^grd\d+$/.test(key)) {
            let dtlVo = {...mstrVo};
            dtlVo.clclnDtlSn = parseInt(key.slice(3));
            dtlVo.clclnDtlKnd = 'GGRD';
            dtlVo.clclnDtlCd = key;
            dtlVo.sortWght = item[key];
            dtlVo.clclnYn = 'Y';
            saveClclnDtlVoList.push(dtlVo);
          }
        });
      });
      const postJsonPromise = gfn_postJSON("/am/clcln/insertSortClcln.do",{
        clclnMstrList: saveClclnMstrVoList,
        clclnDtlList: saveClclnDtlVoList
      });
      const data = await postJsonPromise;

      if (!_.isEqual("S", data.resultStatus)) {
        gfn_comAlert(data.resultCode, data.resultMessage);
        return;
      }
    }
  }
  //endregion
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
