<%--
  Created by IntelliJ IDEA.
  User: mycom
  Date: 2025-04-08
  Time: 오후 1:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 웹 시스템 사용 현황</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
  <meta charset="UTF-8">
</head>
<body oncontextmenu="return false">
  <section>
    <div class="box box-solid">
      <div class="box-header" style="display:flex; justify-content: flex-start;" >
        <div>
          <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
          <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 시스템현황 -->
        </div>
        <div style="margin-left: auto;">
          <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search()"></sbux-button>
        </div>
      </div>
      <div>
        <table class="table table-bordered tbl_fixed">
          <caption>검색 조건 설정</caption>
          <colgroup>
            <col style="width: 10%">
            <col style="width: 15%">
            <col style="width: 70%">
          </colgroup>
          <tbody>
            <tr>
              <th scope="row" class="th_bg" style="border-bottom:1px solid white"><span class="data_required"></span>기준일자</th>
              <td class="td_input" style="border-right: hidden;">
                <sbux-datepicker id="sysStatInq-crtr-ym" name="sysStatInq-crtr-ym" uitype="popup" date-format="yyyy-mm-dd" class="form-control input-sm input-sm-ast inpt_data_reqed sbux-pik-group-apc" open-on-input-selection="true"></sbux-datepicker>
              </td>
              <td></td>
            </tr>
          </tbody>
        </table>
        </div>
      <div class="box-header" style="display:flex; justify-content: flex-start;">
        <div>
          <h3 class="box-title"> ➡️ 웹 시스템 사용 현황</h3><!-- 웹 시스템 사용자 현황 -->
        </div>
      </div>

      <%--<div class="col-md-6">
        <h4> ▶ 사용자 및 트래픽</h4>
        <table class="table table-bordered tbl_fixed">
          <thead style="background-color: #e8f1f9">
            <tr style="text-align: center">
              <th scope="row" rowspan="2" style="text-align: center">항목</th>
              <th scope="row" rowspan="2" style="text-align: center">금일</th>
              <th scope="row" rowspan="2" style="text-align: center">금월</th>
              <th scope="row" rowspan="2" style="text-align: center">전월</th>
              <th scope="row" colspan="2" style="text-align: center">차이(전월대비)</th>
            </tr>
            <tr>
              <th style="text-align: center">건수</th>
              <th style="text-align: center">증감(%)</th>
            </tr>
          </thead>
          <tbody style="text-align: center">
            <tr>
              <td>총 방문자</td>
              <td id="userTrfc-tsDayVstr" name="userTrfc-tsDayVstr" style="text-align: center">-</td>
              <td id="userTrfc-tsMmVstr" name="userTrfc-tsMmVstr" style="text-align: center">-</td>
              <td id="userTrfc-prvMmVstr" name="userTrfc-prvMmVstr" style="text-align: center">-</td>
              <td id="userTrfc-vstrDiff" name="userTrfc-vstrDiff" style="text-align: center">-</td>
              <td id="userTrfc-vstrIcdc" name="userTrfc-vstrIcdc" style="text-align: center">-</td>
            </tr>
            <tr>
              <td>일 평균 방문자</td>
              <td id="userTrfc-tsDayAvgVstr" name="userTrfc-tsDayAvgVstr">-</td>
              <td id="userTrfc-tsMmAvgVstr" name="userTrfc-tsMmAvgVstr">-</td>
              <td id="userTrfc-prvMmAvgVstr" name="userTrfc-prvMmAvgVstr">-</td>
              <td id="userTrfc-avgVstrDiff" name="userTrfc-avgVstrDiff">-</td>
              <td id="userTrfc-avgVstrIcdc" name="userTrfc-avgVstrIcdc">-</td>
            </tr>
            <tr>
              <td>총 페이지뷰(PV)</td>
              <td id="userTrfc-tsDayTotPV" name="userTrfc-tsDayTotPV">-</td>
              <td id="userTrfc-tsMmTotPV" name="userTrfc-tsMmTotPV">-</td>
              <td id="userTrfc-prvMmTotPV" name="userTrfc-prvMmTotPV">-</td>
              <td id="userTrfc-totPVDiff" name="userTrfc-totPVDiff">-</td>
              <td id="userTrfc-totPVIcdc" name="userTrfc-totPVIcdc">-</td>
            </tr>
          </tbody>
        </table>
      </div>--%>

      <div class="col-md-6">
        <div class="ad_tbl_top">
          <ul class="ad_tbl_count">
            <li>
              <span>▶ 사용자 및 트래픽</span>
            </li>
          </ul>
        </div>
        <div id="sb-area-userTrfc"></div>
      </div>

      <div class="col-md-6">
        <h4> ▶ 회원 현황</h4>
        <table class="table table-bordered tbl_fixed" >
          <thead style="background-color: #e8f1f9">
            <tr style="text-align: center">
              <th scope="row" rowspan="2" style="text-align: center">항목</th>
              <th scope="row" rowspan="2" style="text-align: center">금일</th>
              <th scope="row" rowspan="2" style="text-align: center">금월</th>
              <th scope="row" rowspan="2" style="text-align: center">전월</th>
              <th scope="row" colspan="2" style="text-align: center">차이(전월대비)</th>
            </tr>
            <tr style="text-align: center">
              <th style="text-align: center">건수</th>
              <th style="text-align: center">증감(%)</th>
            </tr>
          </thead>
          <tbody style="text-align: center">
            <tr>
              <td>총 회원</td>
              <td id="mbrPrst-tsDayTotMbr" name="mbrPrst-tsDayTotMbr">-</td>
              <td id="mbrPrst-tsMmTotMbr" name="mbrPrst-tsMmTotMbr">-</td>
              <td id="mbrPrst-prvMmTotMbr" name="mbrPrst-prvMmTotMbr">-</td>
              <td id="mbrPrst-totMbrDiff" name="mbrPrst-totMbrDiff">-</td>
              <td id="mbrPrst-totMbrIcdc" name="mbrPrst-totMbrIcdc">-</td>
            </tr>
            <tr>
              <td>신규 가입자</td>
              <td id="mbrPrst-tsDayNewMbr" name="mbrPrst-tsDayNewMbr">-</td>
              <td id="mbrPrst-tsMmNewMbr" name="mbrPrst-tsMmNewMbr">-</td>
              <td id="mbrPrst-prvMmNewMbr" name="mbrPrst-prvMnNewMbr">-</td>
              <td id="mbrPrst-newMbrDiff" name="mbrPrst-newMbrDiff">-</td>
              <td id="mbrPrst-newMbrIcdc" name="mbrPrst-newMbrIcdc">-</td>
            </tr>
            <tr>
              <td>활성 회원<sup>1)</sup></td>
              <td id="mbrPrst-tsDayActvtnMbr" name="mbrPrst-tsDayActvtnMbr">-</td>
              <td id="mbrPrst-tsMmActvtnMbr" name="mbrPrst-tsMmActvtnMbr">-</td>
              <td id="mbrPrst-prvMmActvtnMbr" name="mbrPrst-prvMmActvtnMbr">-</td>
              <td id="mbrPrst-actvtnMbrDiff" name="mbrPrst-actvtnMbrDiff">-</td>
              <td id="mbrPrst-actvtnMbrIcdc" name="mbrPrst-actvtnMbrIcdc">-</td>
            </tr>
          </tbody>
        </table>
        <sup>1) 활성회원 : 월 1회 이상 접속</sup>
      </div>
    </div>

    <div>
      <div class="box-header" style="display:flex; justify-content: flex-start;">
        <h3 class="box-title"> ➡️ 회원 상세 현황</h3>
      </div>
      <div class="col-md-6">
        <h4> ▶ 조직 현황</h4>
        <table id="ognzPrstTbl" class="table table-bordered tbl_fixed">
          <thead style="background-color: #e8f1f9">
            <tr>
              <th scope="row" style="text-align: center">유형</th>
              <th scope="row" style="text-align: center">구분</th>
              <th scope="row" style="text-align: center">조직 수</th>
              <th scope="row" style="text-align: center">구분 합</th>
            </tr>
          </thead>
          <tbody style="text-align: center">
            <tr>
              <td rowspan="2">법인</td>
              <td>농협</td>
              <td id="ognzPrst-cntMB" name="ognzPrst-cntMB">-</td>
              <td rowspan="2" id="ognzPrst-sumCorp" name="ognzPrst-sumCorp">-</td>
            </tr>
            <tr>
              <td>농업법인</td>
              <td id="ognzPrst-cntNotMB" name="ognzPrst-cntNotMB">-</td>
            </tr>
            <tr>
              <td rowspan="2">지자체</td>
              <td>시도</td>
              <td id="ognzPrst-cntCtPv" name="ognzPrst-cntCtPv">-</td>
              <td rowspan="2" id="ognzPrst-sumLclGv" name="ognzPrst-sumLclGv">-</td>
            </tr>
            <tr>
              <td>시군구</td>
              <td id="ognzPrst-cntSGG" name="ognzPrst-cntSGG">-</td>
            </tr>
            <tr style="background-color: #FFF8DC">
              <td colspan="2">합계</td>
              <td colspan="2" id="ognzPrst-totSum" name="ognzPrst-totSum">-</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="col-md-6">
        <h4> ▶ 조직별 회원 현황</h4>
        <table id="ognzMbrTbl" class="table table-bordered tbl_fixed">
          <thead style="background-color: #e8f1f9">
            <tr>
              <th scope="row" style="text-align: center">구분</th>
              <th scope="row" style="text-align: center">회원 수</th>
              <th scope="row" style="text-align: center">구분별 합</th>
            </tr>
          </thead>
          <tbody style="text-align: center">
            <tr>
              <td>농협</td>
              <td id="ognzMbr-cntOgnzMB" name="ognzMbr-cntOgnzMB">-</td>
              <td id="ognzMbr-sumOgnzCorp" name="ognzMbr-sumOgnzCorp"rowspan="2">-</td>
            </tr>
            <tr>
              <td>농업법인</td>
              <td id="ognzMbr-cntOgnzNotMB" name="ognzMbr-cntOgnzNotMB">-</td>
            </tr>
            <tr>
              <td>지자체</td>
              <td id="ognzMbr-cntOgnzCtPv" name="ognzMbr-cntOgnzCtPv">-</td>
              <td id="ognzMbr-sumOgnzCtPv" name="ognzMbr-sumOgnzCtPv">-</td>
            </tr>
            <tr>
              <td>개인(농가)</td>
              <td id="ognzMbr-cntindvFrmhs" name="ognzMbr-cntindvFrmhs">-</td>
              <td id="ognzMbr-sumindvFrmhs" name="ognzMbr-sumindvFrmhs">-</td>
            </tr>
            <tr style="background-color: #FFF8DC">
              <td>합계</td>
              <td id="ognzMbr-sumTotMbr" name="ognzMbr-sumTotMbr">-</td>
              <td id="ognzMbr-sumTotSe" name="ognzMbr-sumTotSe">-</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="col-md-6">
        <h4> ▶ 업무별 사용 현황</h4>
        <table id="taskUseTbl" class="table table-bordered tbl_fixed">
          <thead style="background-color: #e8f1f9">
            <tr>
              <th scope="row" rowspan="2" style="text-align: center">업무 구분</th>
              <th scope="row" colspan="4" style="text-align: center">업무별 사용 회원 수</th>
            </tr>
            <tr>
              <th scope="row" style="text-align: center">농협</th>
              <th scope="row" style="text-align: center">농업법인</th>
              <th scope="row" style="text-align: center">지자체</th>
              <th scope="row" style="text-align: center">합계</th>
            </tr>
          </thead>
          <tbody style="text-align: center">
            <tr>
              <td>생산관리</td>
              <td id="taskUse-cntAMMB" name="taskUse-cntAMMB">-</td>
              <td id="taskUse-cntAMNotMB" name="taskUse-cntAMNotMB">-</td>
              <td id="taskUse-cntAMCtPv" name="taskUse-cntAMCtPv">-</td>
              <td id="taskUse-cntAMSum" name="taskUse-cntAMSum">-</td>
            </tr>
            <tr>
              <td>생산유통통합조직</td>
              <td id="taskUse-cntPDMB" name="taskUse-cntPDMB">-</td>
              <td id="taskUse-cntPDNotMB" name="taskUse-cntPDNotMB">-</td>
              <td id="taskUse-cntPDCtPv" name="taskUse-cntPDCtPv">-</td>
              <td id="taskUse-cntPDSum" name="taskUse-cntPDSum">-</td>
            </tr>
            <tr>
              <td>APC전수조사</td>
              <td id="taskUse-cntCSMB" name="taskUse-cntCSMB">-</td>
              <td id="taskUse-cntCSNotMB" name="taskUse-cntCSNotMB">-</td>
              <td id="taskUse-cntCSCtPv" name="taskUse-cntCSCtPv">-</td>
              <td id="taskUse-cntCSSum" name="taskUse-cntCSSum">-</td>
            </tr>
          </tbody>
        </table>
      </div>

    </div>
  </section>
</body>
<script type="text/javascript">

  // 날짜 형식 변수
  var tsYM;
  var prvYM;
  var ymdFrom;
  var ymdTo;
  var dateFrom;
  var dateTo;

  // 활성회원수
  var tsDayCntUser;
  var tsMmCntUser;
  var prvMmCntUser;

  // Grid 생성 변수
  var grdUserTrfc;
  var jsonUserTrfc;

  window.addEventListener('DOMContentLoaded', function () {
    fn_init();
  });

  // init
  const fn_init = async function () {

    let nowYmd = gfn_dateToYmd(new Date());
    SBUxMethod.set("sysStatInq-crtr-ym", nowYmd);
    SBUxMethod.setDatepickerMaxDate("sysStatInq-crtr-ym", nowYmd)
    fn_createUserTrfc();
    await fn_search();
  }

  const fn_createUserTrfc = function () {
    var SBGridProperties = {};
    SBGridProperties.parentid = "sb-area-userTrfc";
    SBGridProperties.id = "grdUserTrfc";
    SBGridProperties.jsonref = "jsonUserTrfc";
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.extendlastcol = 'scroll';
    SBGridProperties.columns = [
      {caption : ['항목', "항목"],            ref: 'artcl',     type: 'output', width: '15%',  style:'text-align:center;'},
      {caption : ['금일', "금일"],            ref: 'thdy',      type: 'output', width: '17%',  style: 'text-align:center;', format : {type:'number', rule:'#,###'}},
      {caption : ['금월', "금월"],            ref: 'tsmm',      type: 'output', width: '17%',  style: 'text-align:center;', format : {type:'number', rule:'#,###'}},
      {caption : ['전월', "전월"],            ref: 'prvmm',     type: 'output', width: '17%',  style: 'text-align:center;', format : {type:'number', rule:'#,###'}},
      {caption : ['차이(전월대비)', "건수"],    ref: 'diffNocs',  type: 'output', width: '17%',  style: 'text-align:center;', format : {type:'string', rule:'+#,### ; #,###'}, calc: 'fn_calcDiffNocs'},
      {caption : ['차이(전월대비)', "증감(%)"], ref: 'diffIcdc',  type: 'output', width: '17%',  style: 'text-align:center;', calc: 'fn_calcGrowthRate'},
    ];
    grdUserTrfc = _SBGrid.create(SBGridProperties);
  }

  /** 조회 버튼 클릭 **/
  async function fn_search() {

    let getYmd = SBUxMethod.get("sysStatInq-crtr-ym");
    let getYm = getYmd.substr(0,6);

    /** 기준일자 **/
    dateFrom = getYmd;
    dateTo = gfn_addDate(dateFrom, 1);

    /** 시작일 **/
    ymdFrom = gfn_addMonth(getYm, -1);
    /** 종료일 **/
    ymdTo = gfn_addMonth(getYm, 1);

    tsYM = getYm;
    prvYM = ymdFrom.substring(0,6);

    await fn_vstrCnt();
    await fn_pageViewCnt();
    // await fn_userCnt();
    // await fn_ognzPrst();
    // await fn_ognzTaskMbrCnt();
  }

  const fn_zero = function(val) {

    if (gfn_isEmpty(val)) {
      return "";
    } else {
      if (val == 0) {
        return "";
      } else {
        return val;
      }
    }
  }

  /** 차이(전월대비) 건수 계산**/
  const fn_calcDiffNocs = function(objGrid, nRow, nCol) {
    let tsMm = objGrid.getData(Number(nRow), objGrid.getColRef('tsmm'));
    let prvMm = objGrid.getData(Number(nRow), objGrid.getColRef('prvmm'));

    let diff = Number(tsMm) - Number(prvMm);

    if (tsMm == "" && prvMm == "") {
      return "";
    }
    return diff;
  }

  /** 증감률 계산 **/
  const fn_calcGrowthRate = function (objGrid, nRow, nCol) {
    let growthRate = 0;
    let diff = objGrid.getData(Number(nRow), objGrid.getColRef('diffNocs'));
    let prvMm = objGrid.getData(Number(nRow), objGrid.getColRef('prvmm'));

    if(prvMm == 0) {
      return "-";
    } else {
      growthRate = parseFloat(((Number(diff) / Number(prvMm)) * 100).toFixed(2)).toLocaleString();
    }

    if (diff === 0) {
      return "0";
    } else if (diff == "") {
      return "-";
    }

    // 양수 일시 '+' 붙이기
    if (growthRate > 0) {
      console.log(growthRate);
      return "+" + growthRate + "%";
    }
    else {
      return growthRate + "%";
    }
  }

  /** 사용자 및 트래픽 (방문자 카운트) **/
  const fn_vstrCnt = async function () {

    let postJsonPromise = gfn_postJSON("/co/mng/selectVstrCnt.do", {
      ymdFrom  : ymdFrom
      , ymdTo : ymdTo
    });

    const prvTsMmData = await postJsonPromise;

    postJsonPromise = gfn_postJSON("/co/mng/selectVstrCnt.do", {
      ymdFrom  : dateFrom
      , ymdTo : dateTo
    });

    const thDyDate = await postJsonPromise;

    try {
      if (_.isEqual("S", prvTsMmData.resultStatus) && _.isEqual("S", thDyDate.resultStatus)) {

        jsonUserTrfc.length = 0;

        const userTrfcVO = [
          { artcl: '총 방문자', thdy: '', tsmm: '', prvmm: '', diffNocs: '', diffIcdc: ''},
          { artcl: '일 평균 방문자', thdy: '', tsmm: '', prvmm: '', diffNocs: '', diffIcdc: ''}
        ];

        thDyDate.resultList.forEach((vstr) => {
          userTrfcVO[0].thdy = vstr.cnt;
          userTrfcVO[1].thdy = vstr.cnt;
        });

        const data = prvTsMmData.resultList;
        const dataLen = data.length - 1;

        if (fn_zero(data) != "") {

          if (dataLen == 0) {
            data.unshift({
              cnt: ""
              , ym: ""
            });
          }

          let tsMmVstrCnt = data[1].cnt;
          let prvMmVstrCnt = data[0].cnt;

          let tsYr;
          let tsMm;
          let prvYr;
          let prvMm;
          let tsMmLastDate;
          let prvMmLastDate;
          let tsMmAvg;
          let prvMmAvg;

          userTrfcVO[0].tsmm = tsMmVstrCnt;
          userTrfcVO[0].prvmm = prvMmVstrCnt;

          tsYr = parseInt(data[1].ym.substr(0,4));
          tsMm = parseInt(data[1].ym.substr(4,2));

          prvYr = parseInt(data[0].ym.substr(0,4));
          prvMm = parseInt(data[0].ym.substr(4,2));

          tsMmLastDate = new Date(tsYr, tsMm + 1, 0).getDate();
          prvMmLastDate = new Date(prvYr, prvMm + 1, 0).getDate();

          tsMmAvg = Math.round(tsMmVstrCnt / tsMmLastDate);
          prvMmAvg = Math.round(prvMmVstrCnt / prvMmLastDate);

          if (prvMmVstrCnt == "" || prvMmVstrCnt == null) {
            prvMmAvg = "";
          }

          userTrfcVO[1].tsmm = tsMmAvg;
          userTrfcVO[1].prvmm = prvMmAvg;
        }

        jsonUserTrfc = userTrfcVO;
        grdUserTrfc.rebuild();
      }
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }
  }

  /** 사용자 및 트래픽 (총 페이지뷰(PV)) **/
  const fn_pageViewCnt = async function() {

    let postJsonPromise = gfn_postJSON("/co/mng/selectPageViewCnt.do", {
      ymdFrom  : ymdFrom
      , ymdTo : ymdTo
    });

    const prvTsMmData = await postJsonPromise;

    postJsonPromise = gfn_postJSON("/co/mng/selectPageViewCnt.do", {
      ymdFrom  : dateFrom
      , ymdTo : dateTo
    });

    const thDyData = await postJsonPromise;

    try {
      if (_.isEqual("S", prvTsMmData.resultStatus) && _.isEqual("S", thDyData.resultStatus)) {

        console.log(prvTsMmData);

        const userTrfcVO = { artcl: '총 페이지뷰(PV)', thdy: '', tsmm: '', prvmm: '', diffNocs: '', diffIcdc: ''};

        thDyData.resultList.forEach((pVCnt) => {
          userTrfcVO.thdy = pVCnt.pageViewCnt;
        });

        const data = prvTsMmData.resultList;
        const dataLen = data.length - 1;

        if (fn_zero(data) != "") {

          if (dataLen == 0) {
            data.unshift({
              pageViewCnt: ""
            });
          }

          userTrfcVO.tsmm = data[1].pageViewCnt;
          userTrfcVO.prvmm = data[0].pageViewCnt;
        }

        grdUserTrfc.addRow(true, userTrfcVO);
      }
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }
  }

  /** 회원 현황 **/
  const fn_userCnt = async function() {

    let tsDayTotMbr = document.getElementById("mbrPrst-tsDayTotMbr");
    let tsDayNewMbr = document.getElementById("mbrPrst-tsDayNewMbr");
    let tsDayActvtnMbr = document.getElementById("mbrPrst-tsDayActvtnMbr");

    let tsMmTotMbr = document.getElementById('mbrPrst-tsMmTotMbr');
    let tsMmNewMbr = document.getElementById('mbrPrst-tsMmNewMbr');
    let tsMmActvtnMbr = document.getElementById('mbrPrst-tsMmActvtnMbr');

    let totMbrDiff = document.getElementById('mbrPrst-totMbrDiff');
    let totMbrIcdc = document.getElementById('mbrPrst-totMbrIcdc');

    let prvMmTotMbr = document.getElementById('mbrPrst-prvMmTotMbr');
    let prvMmNewMbr = document.getElementById('mbrPrst-prvMmNewMbr');
    let prvMmActvtnMbr = document.getElementById('mbrPrst-prvMmActvtnMbr');

    let newMbrDiff = document.getElementById('mbrPrst-newMbrDiff');
    let newMbrIcdc = document.getElementById('mbrPrst-newMbrIcdc');

    let actvtnMbrDiff = document.getElementById('mbrPrst-actvtnMbrDiff');
    let actvtnMbrIcdc = document.getElementById('mbrPrst-actvtnMbrIcdc');

    let tsMmTotMbrCnt;
    let tsMmNewMbrCnt;

    let prvMmTotMbrCnt;
    let prvMmNewMbrCnt;

    tsDayActvtnMbr.textContent = tsDayCntUser.toLocaleString();

    const postJsonPromise_tsMm = gfn_postJSON("/co/mng/selectUserCnt.do", {
      yyyyMm  : tsYM
      , ymdTo : ymdTo
    });

    const tsMmdata = await postJsonPromise_tsMm;

    const postJsonPromise_prvMm = gfn_postJSON("/co/mng/selectUserCnt.do", {
      yyyyMm  : prvYM
      , ymdTo : gfn_addMonth(tsYM, 0)
    });

    const prvMmdata = await postJsonPromise_prvMm;


    let postJsonPromise = gfn_postJSON("/co/mng/selectUserCnt.do", {
      yyyyMm  : tsYM
      , ymdTo : dateTo
    });

    const tsDateTotMbr = await postJsonPromise;

    postJsonPromise = gfn_postJSON("/co/mng/selectUserCnt.do", {
      yyyyMm  : tsYM
      , ymdFrom : dateFrom
      , ymdTo : dateTo
    });

    const tsDateNewMbr = await postJsonPromise;

    try {
      if (_.isEqual("S", tsMmdata.resultStatus) && _.isEqual("S", prvMmdata.resultStatus)) {

        tsMmTotMbrCnt = tsMmdata.resultList[0].cntUser;
        tsMmNewMbrCnt = tsMmdata.resultList[0].cntNewUser;

        tsMmTotMbr.textContent = tsMmTotMbrCnt.toLocaleString();
        tsMmNewMbr.textContent = tsMmNewMbrCnt.toLocaleString();
        tsMmActvtnMbr.textContent = tsMmCntUser.toLocaleString();

        prvMmTotMbrCnt = prvMmdata.resultList[0].cntUser;
        prvMmNewMbrCnt = prvMmdata.resultList[0].cntNewUser;

        prvMmTotMbr.textContent = prvMmTotMbrCnt.toLocaleString();
        prvMmNewMbr.textContent = prvMmNewMbrCnt.toLocaleString();
        prvMmActvtnMbr.textContent = prvMmCntUser.toLocaleString();

        totMbrDiff.textContent = (tsMmTotMbrCnt - prvMmTotMbrCnt).toLocaleString();
        totMbrIcdc.textContent = fn_calcGrowthRate(tsMmTotMbrCnt, prvMmTotMbrCnt);

        newMbrDiff.textContent = (tsMmNewMbrCnt - prvMmNewMbrCnt).toLocaleString();
        newMbrIcdc.textContent = fn_calcGrowthRate(tsMmNewMbrCnt, prvMmNewMbrCnt);

        actvtnMbrDiff.textContent = (tsMmCntUser - prvMmCntUser).toLocaleString();
        actvtnMbrIcdc.textContent = fn_calcGrowthRate(tsMmCntUser, prvMmCntUser);

        if (parseInt(totMbrDiff.textContent) > 0) {
          totMbrDiff.style.color = "blue";
          totMbrIcdc.style.color = "blue";
        } else if (parseInt(totMbrDiff.textContent) < 0) {
          totMbrDiff.style.color = "red";
          totMbrIcdc.style.color = "red";
        } else if (parseInt(totMbrDiff.textContent) == 0) {
          totMbrIcdc.textContent = "0";
          totMbrIcdc.style.color = "black";
          totMbrDiff.style.color = "black";
        }

        if (parseInt(newMbrDiff.textContent) > 0) {
          newMbrDiff.style.color = "blue";
          newMbrIcdc.style.color = "blue";
        } else if (parseInt(newMbrDiff.textContent) < 0) {
          newMbrDiff.style.color = "red";
          newMbrIcdc.style.color = "red";
        } else if (parseInt(newMbrDiff.textContent) == 0) {
          newMbrIcdc.textContent = "0";
          newMbrIcdc.style.color = "black";
          newMbrDiff.style.color = "black";
        }

        if (parseInt(actvtnMbrDiff.textContent) > 0) {
          actvtnMbrDiff.style.color = "blue";
          actvtnMbrIcdc.style.color = "blue";
        } else if (parseInt(actvtnMbrDiff.textContent) < 0) {
          actvtnMbrDiff.style.color = "red";
          actvtnMbrIcdc.style.color = "red";
        } else if (parseInt(actvtnMbrDiff.textContent) == 0) {
          actvtnMbrIcdc.textContent = "0";
          actvtnMbrIcdc.style.color = "black";
          actvtnMbrDiff.style.color = "black";
        }

      }
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }

    try {
      if (_.isEqual("S", tsDateTotMbr.resultStatus) && _.isEqual("S", tsDateNewMbr.resultStatus)) {

        tsDayTotMbr.textContent = (tsDateTotMbr.resultList[0].cntUser).toLocaleString();
        tsDayNewMbr.textContent = (tsDateNewMbr.resultList[0].cntNewUser).toLocaleString();

      }
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }

  }

  /** 조직 현황 **/
  const fn_ognzPrst = async function() {

    let cntMB = document.getElementById("ognzPrst-cntMB");
    let cntNotMB = document.getElementById("ognzPrst-cntNotMB");
    let sumCorp = document.getElementById("ognzPrst-sumCorp");

    let cntCtPv = document.getElementById("ognzPrst-cntCtPv");
    let cntSGG = document.getElementById("ognzPrst-cntSGG");
    let sumLclGv = document.getElementById("ognzPrst-sumLclGv");

    let totSum = document.getElementById("ognzPrst-totSum");

    const postJsonPromise = gfn_postJSON("/co/mng/selectOgnzPrstCnt.do", {
      ymdFrom  : ymdFrom
      , ymdTo : ymdTo
    });
    const data = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus)) {

        if (data.resultList[0] == null) {

          cntMB.textContent = "0";
          cntNotMB.textContent = "0";

          sumCorp.textContent = "0";

          cntCtPv.textContent = "0";
          cntSGG.textContent = "0";

          sumLclGv.textContent = "0";

          totSum.textContent = "0";
        } else {
          cntMB.textContent = (data.resultList[0].cntMB).toLocaleString();
          cntNotMB.textContent = (data.resultList[0].cntNotMB).toLocaleString();

          sumCorp.textContent = (data.resultList[0].cntMB + data.resultList[0].cntNotMB).toLocaleString();

          cntCtPv.textContent = (data.resultList[0].cntCtPv).toLocaleString();
          cntSGG.textContent = (data.resultList[0].cntSGG).toLocaleString();

          sumLclGv.textContent = (data.resultList[0].cntCtPv + data.resultList[0].cntSGG).toLocaleString();

          totSum.textContent = (parseInt(sumCorp.textContent) + parseInt(sumLclGv.textContent)).toLocaleString();
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

  /** 조직별 회원 현황 및 업무별 사용 현황 **/
  const fn_ognzTaskMbrCnt = async function() {

    let cntOgnzMB = document.getElementById("ognzMbr-cntOgnzMB");
    let cntOgnzNotMB = document.getElementById("ognzMbr-cntOgnzNotMB");
    let sumOgnzCorp = document.getElementById("ognzMbr-sumOgnzCorp");

    let cntOgnzCtPv = document.getElementById("ognzMbr-cntOgnzCtPv");
    let sumOgnzCtPv = document.getElementById("ognzMbr-sumOgnzCtPv");

    let cntindvFrmhs = document.getElementById("ognzMbr-cntindvFrmhs");
    let sumindvFrmhs = document.getElementById("ognzMbr-sumindvFrmhs");

    let sumTotMbr = document.getElementById("ognzMbr-sumTotMbr");
    let sumTotSe = document.getElementById("ognzMbr-sumTotSe");

    let cntAMMB = document.getElementById("taskUse-cntAMMB");
    let cntAMNotMB = document.getElementById("taskUse-cntAMNotMB");
    let cntAMCtPv = document.getElementById("taskUse-cntAMCtPv");

    let cntPDMB = document.getElementById("taskUse-cntPDMB");
    let cntPDNotMB = document.getElementById("taskUse-cntPDNotMB");
    let cntPDCtPv = document.getElementById("taskUse-cntPDCtPv");

    let cntCSMB = document.getElementById("taskUse-cntCSMB");
    let cntCSNotMB = document.getElementById("taskUse-cntCSNotMB");
    let cntCSCtPv = document.getElementById("taskUse-cntCSCtPv");

    let cntAMSum = document.getElementById("taskUse-cntAMSum");
    let cntPDSum = document.getElementById("taskUse-cntPDSum");
    let cntCSSum = document.getElementById("taskUse-cntCSSum");

    let sumOgnzTot = 0;
    let sumCntAM = 0;
    let sumCntPD = 0;
    let sumCntCS = 0;

    const postJsonPromise = gfn_postJSON("/co/mng/selectOgnzTaskMbrCnt.do", {
      ymdFrom  : ymdFrom
      , ymdTo : ymdTo
    });
    const data = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus)) {

        if (data.resultList.length == 0) {
          cntOgnzMB.textContent = "0";
          cntAMMB.textContent = "0";
          cntPDMB.textContent = "0";
          cntCSMB.textContent = "0";

          cntOgnzNotMB.textContent = "0";
          cntAMNotMB.textContent = "0";
          cntPDNotMB.textContent = "0";
          cntCSNotMB.textContent = "0";

          cntOgnzCtPv.textContent = "0";
          cntAMCtPv.textContent = "0";
          cntPDCtPv.textContent = "0";
          cntCSCtPv.textContent = "0";

          cntindvFrmhs.textContent = "0";
        } else {
          data.resultList.forEach((item, index) => {

            if (item.typeCd == "1") {

              /** 1. 법인, 2. 지자체, 3. 개인(농가) **/
              if(item.mbYN == "Y") {

                /** Y: 농협, N: 농업법인 **/
                cntOgnzMB.textContent = (item.cntUser).toLocaleString();
                cntAMMB.textContent = (item.cntAM).toLocaleString();
                cntPDMB.textContent = (item.cntPD).toLocaleString();
                cntCSMB.textContent = (item.cntCS).toLocaleString();

              } else if (item.mbYN == "N") {
                cntOgnzNotMB.textContent = (item.cntUser).toLocaleString();
                cntAMNotMB.textContent = (item.cntAM).toLocaleString();
                cntPDNotMB.textContent = (item.cntPD).toLocaleString();
                cntCSNotMB.textContent = (item.cntCS).toLocaleString();
              }
            } else if (item.typeCd == "2") {
              cntOgnzCtPv.textContent = (item.cntUser).toLocaleString();
              cntAMCtPv.textContent = (item.cntAM).toLocaleString();
              cntPDCtPv.textContent = (item.cntPD).toLocaleString();
              cntCSCtPv.textContent = (item.cntCS).toLocaleString();
            } else if (item.typeCd == "3") {
              cntindvFrmhs.textContent = (item.cntUser).toLocaleString();
            }
            sumOgnzTot += item.cntUser;
            sumCntAM += item.cntAM;
            sumCntPD += item.cntPD;
            sumCntCS += item.cntCS;
          });
        }

        sumOgnzCorp.textContent = (parseInt(cntOgnzMB.textContent) + parseInt(cntOgnzNotMB.textContent)).toLocaleString();
        sumOgnzCtPv.textContent = parseInt(cntOgnzCtPv.textContent).toLocaleString();
        sumindvFrmhs.textContent = parseInt(cntindvFrmhs.textContent).toLocaleString();

        sumTotMbr.textContent = sumOgnzTot.toLocaleString();
        sumTotSe.textContent = sumOgnzTot.toLocaleString();

        cntAMSum.textContent = sumCntAM.toLocaleString();
        cntPDSum.textContent = sumCntPD.toLocaleString();
        cntCSSum.textContent = sumCntCS.toLocaleString();
      }
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }
  }

</script>
</html>



