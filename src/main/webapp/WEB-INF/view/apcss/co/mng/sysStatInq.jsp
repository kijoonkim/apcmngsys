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

      <div class="col-md-6">
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

  // init
  const fn_init = async function () {

    let nowYmd = gfn_dateToYmd(new Date());
    SBUxMethod.set("sysStatInq-crtr-ym", nowYmd);
    SBUxMethod.setDatepickerMaxDate("sysStatInq-crtr-ym", nowYmd)
    await fn_search();
  }

  /** 증감률 계산 **/
  const fn_calcGrowthRate = function (newValue, oldValue) {
    let growthRate;

    if(oldValue === 0) {
      oldValue = 1
    }

    growthRate = ((((newValue - oldValue) / oldValue) * 100).toFixed(2));

    if ((newValue - oldValue) == 0) {
      return "-";
    }

    // 양수 일시 '+' 붙이기
    if (growthRate > 0) {
      return "+" + growthRate + "%";
    }
    else {
      return growthRate + "%";
    }
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
    await fn_userCnt();
    await fn_ognzPrst();
    await fn_ognzTaskMbrCnt();
  }

  /** 사용자 및 트래픽 (방문자 카운트) **/
  const fn_vstrCnt = async function () {

    let postJsonPromise = gfn_postJSON("/co/mng/selectVstrCnt.do", {
      ymdFrom  : ymdFrom
      , ymdTo : ymdTo
    });

    const data = await postJsonPromise;

    postJsonPromise = gfn_postJSON("/co/mng/selectVstrCnt.do", {
      ymdFrom  : dateFrom
      , ymdTo : dateTo
    });

    const tsDate = await postJsonPromise;

    console.log("ymdfrom: " + ymdFrom);
    console.log("ymdto: " + ymdTo);
    console.log(JSON.stringify(data));
    console.log(tsDate.resultList.length);
    console.log(JSON.stringify(tsDate));
    console.log("------------------------------")
    console.log(data.resultList.length)


    try {
      if (_.isEqual("S", data.resultStatus) && _.isEqual("S", tsDate.resultStatus)) {
        let tsDayVstr = document.getElementById('userTrfc-tsDayVstr');
        let tsMmVstr = document.getElementById('userTrfc-tsMmVstr');
        let prvMmVstr = document.getElementById('userTrfc-prvMmVstr');
        let tsDayAvgVstr = document.getElementById('userTrfc-tsDayAvgVstr');
        let tsMmAvgVstr = document.getElementById('userTrfc-tsMmAvgVstr');
        let prvMmAvgVstr = document.getElementById('userTrfc-prvMmAvgVstr');
        let vstrDiff = document.getElementById('userTrfc-vstrDiff');
        let vstrIcdc = document.getElementById('userTrfc-vstrIcdc');
        let avgVstrDiff = document.getElementById('userTrfc-avgVstrDiff');
        let avgVstrIcdc = document.getElementById('userTrfc-avgVstrIcdc');

        let tsMmVstrCnt;
        let prvMmVstrCnt;

        let tsDayVstrCnt;

        let tsYr;
        let tsMm;
        let prvYr;
        let prvMm;
        let tsMmLastDate;
        let prvMmLastDate;
        let tsMmAvg;
        let prvMmAvg;

        if (tsDate.resultList.length == 0) {
          tsDayVstrCnt = 0;
          tsDayCntUser = 0;
          tsDayVstr.textContent = "0";
        } else {
          tsDayVstrCnt = tsDate.resultList[0].cnt;
          tsDayCntUser = tsDate.resultList[0].cntUser;
        }

        console.log("------------------------------")
        console.log(data.resultList.length)
        if (data.resultList.length == 0) {
          tsMmCntUser = 0;
          prvMmCntUser = 0;

          tsDayVstr.textContent = "0";
          tsMmVstr.textContent = "0";
          prvMmVstr.textContent = "0";

          tsDayAvgVstr.textContent = "0";
          tsMmAvgVstr.textContent = "0";
          prvMmAvgVstr.textContent = "0";

          vstrDiff.textContent = "0";
          avgVstrDiff.textContent = "0";

          vstrIcdc.textContent = "0";
          avgVstrIcdc.textContent = "0";
        } else {
          tsMmVstrCnt = data.resultList[1].cnt;
          prvMmVstrCnt = data.resultList[0].cnt;

          tsMmCntUser = data.resultList[1].cntUser;
          prvMmCntUser = data.resultList[0].cntUser;

          tsYr = parseInt(data.resultList[1].ym.substr(0,4));
          tsMm = parseInt(data.resultList[1].ym.substr(4,2));

          prvYr = parseInt(data.resultList[0].ym.substr(0,4));
          prvMm = parseInt(data.resultList[0].ym.substr(4,2));

          tsMmLastDate = new Date(tsYr, tsMm + 1, 0).getDate();
          prvMmLastDate = new Date(prvYr, prvMm + 1, 0).getDate();

          tsMmAvg = parseInt((tsMmVstrCnt / tsMmLastDate).toFixed(0));
          prvMmAvg = parseInt((prvMmVstrCnt / prvMmLastDate).toFixed(0));

          tsDayVstr.textContent = tsDayVstrCnt.toLocaleString();
          tsMmVstr.textContent = tsMmVstrCnt.toLocaleString();
          prvMmVstr.textContent = prvMmVstrCnt.toLocaleString();

          tsDayAvgVstr.textContent = tsDayVstrCnt.toLocaleString();
          tsMmAvgVstr.textContent = tsMmAvg.toLocaleString();
          prvMmAvgVstr.textContent = prvMmAvg.toLocaleString();

          vstrDiff.textContent = (tsMmVstrCnt - prvMmVstrCnt).toLocaleString();
          avgVstrDiff.textContent = (tsMmAvg - prvMmAvg).toLocaleString();

          vstrIcdc.textContent = fn_calcGrowthRate(tsMmVstrCnt, prvMmVstrCnt);
          avgVstrIcdc.textContent = fn_calcGrowthRate(tsMmAvg, prvMmAvg);

          // 양수 blue, 음수 red
          if (parseInt(vstrDiff.textContent) > 0) {
            vstrDiff.style.color = "blue";
            vstrIcdc.style.color = "blue";
          } else if (parseInt(vstrDiff.textContent) < 0) {
            vstrDiff.style.color = "red";
            vstrIcdc.style.color = "red";
          }

          if (parseInt(avgVstrDiff.textContent) > 0) {
            avgVstrDiff.style.color = "blue";
            avgVstrIcdc.style.color = "blue";
          } else if (parseInt(avgVstrDiff.textContent) < 0) {
            avgVstrDiff.style.color = "red";
            avgVstrIcdc.style.color = "red";
          }
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

  /** 사용자 및 트래픽 (총 페이지뷰(PV)) **/
  const fn_pageViewCnt = async function() {

    let tsDayTotPV = document.getElementById('userTrfc-tsDayTotPV');
    let tsMmTotPV = document.getElementById('userTrfc-tsMmTotPV');
    let prvMmTotPV = document.getElementById('userTrfc-prvMmTotPV');
    let totPVDiff = document.getElementById('userTrfc-totPVDiff');
    let totPVIcdc = document.getElementById('userTrfc-totPVIcdc');

    let tsDayTotPVCnt;
    let tsMmPVCnt;
    let prvMmPVCnt;

    let postJsonPromise = gfn_postJSON("/co/mng/selectPageViewCnt.do", {
      ymdFrom  : ymdFrom
      , ymdTo : ymdTo
    });

    const data = await postJsonPromise;

    postJsonPromise = gfn_postJSON("/co/mng/selectPageViewCnt.do", {
      ymdFrom  : dateFrom
      , ymdTo : dateTo
    });

    const tsDate = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus) && _.isEqual("S", tsDate.resultStatus)) {

        if (tsDate.resultList.length == 0) {
          tsDayTotPVCnt = 0;
          tsDayTotPV.textContent = "0";
        } else {
          tsDayTotPVCnt = tsDate.resultList[0].pageViewCnt;
          tsDayTotPV.textContent = tsDayTotPVCnt.toLocaleString();
        }

        if (data.resultList.length == 0) {
          tsDayTotPV.textContent = "0";
          tsMmTotPV.textContent = "0";
          prvMmTotPV.textContent = "0";

          totPVDiff.textContent = "0";
          totPVIcdc.textContent = "0";
        } else {
          tsMmPVCnt = data.resultList[1].pageViewCnt;
          prvMmPVCnt = data.resultList[0].pageViewCnt;

          tsDayTotPV.textContent = tsDayTotPVCnt.toLocaleString();
          tsMmTotPV.textContent = tsMmPVCnt.toLocaleString();
          prvMmTotPV.textContent = prvMmPVCnt.toLocaleString();

          totPVDiff.textContent = (tsMmPVCnt - prvMmPVCnt).toLocaleString();
          totPVIcdc.textContent = fn_calcGrowthRate(tsMmPVCnt, prvMmPVCnt);

          if (parseInt(totPVDiff.textContent) > 0) {
            totPVDiff.style.color = "blue";
            totPVIcdc.style.color = "blue";
          } else if (parseInt(totPVDiff.textContent) < 0) {
            totPVDiff.style.color = "red";
            totPVIcdc.style.color = "red";
          }
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
        }

        if (parseInt(newMbrDiff.textContent) > 0) {
          newMbrDiff.style.color = "blue";
          newMbrIcdc.style.color = "blue";
        } else if (parseInt(newMbrDiff.textContent) < 0) {
          newMbrDiff.style.color = "red";
          newMbrIcdc.style.color = "red";
        }

        if (parseInt(actvtnMbrDiff.textContent) > 0) {
          actvtnMbrDiff.style.color = "blue";
          actvtnMbrIcdc.style.color = "blue";
        } else if (parseInt(actvtnMbrDiff.textContent) < 0) {
          actvtnMbrDiff.style.color = "red";
          actvtnMbrIcdc.style.color = "red";
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
    console.log("fn_ognzPrst");
    console.log(data);
    console.log(JSON.stringify(data));

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

  window.addEventListener('DOMContentLoaded', function () {
    fn_init();
  });

</script>
</html>



