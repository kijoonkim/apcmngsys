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
          <sbux-button id="btnReport" name="btnReport" uitype="normal" class="btn btn-sm btn-outline-danger" text="Excel" onclick="fn_excelReport()"></sbux-button>
          <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search()"></sbux-button>
        </div>
      </div>
      <div class="box-body">
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
      </div>


    </div>
  </section>
</body>
<script type="text/javascript">

  let statCrtrYmd = "";

  const statObjVisits = {
      visitsTitle: "총 방문자",
      visitsDay: 0,
      visitsMonth: 0,
      visitsLastMonth: 0,
      visitsDiff: 0,
      visitsDiffRatio: 0,
      visitsAvgTitle: "일 평균 방문자",
      visitsAvgDay: 0,
      visitsAvgMonth: 0,
      visitsAvgLastMonth: 0,
      visitsAvgDiff: 0,
      visitsAvgDiffRatio: 0,
      viewsTitle: "총 페이지뷰(PV)",
      viewsDay: 0,
      viewsMonth: 0,
      viewsLastMonth: 0,
      viewsDiff: 0,
      viewsDiffRatio: 0,
  };

  const statObjUsers = {
      usersTitle: "총 회원",
      usersDay: 0,
      usersMonth: 0,
      usersLastMonth: 0,
      usersDiff: 0,
      usersDiffRatio: 0,
      newUsersTitle: "신규가입자",
      newUsersDay: 0,
      newUsersMonth: 0,
      newUsersLastMonth: 0,
      newUsersDiff: 0,
      newUsersDiffRatio: 0,
      activeUsersTitle: "활성회원¹",
      activeUsersDay: 0,
      activeUsersMonth: 0,
      activeUsersLastMonth: 0,
      activeUsersDiff: 0,
      activeUsersDiffRatio: 0,
  }

  const statObjOrgns = {
      orgnsNH: 0,
      orgnsNotNH: 0,
      orgnsCTPV: 0,
      orgnsSGG: 0,
  }

  const statObjOrgnUsers = {
      orgnUsersNH: 0,
      orgnUsersNotNH: 0,
      orgnUsersGov: 0,
      orgnUsersPrivate: 0,
  }
  const statObjTaskAmUsers = {
      taskUsersTitle: "생산관리",
      taskUsersNH: 0,
      taskUsersNotNH: 0,
      taskUsersGov: 0,
  }
  const statObjTaskPdUsers = {
      taskUsersTitle: "생산유통통합조직",
      taskUsersNH: 0,
      taskUsersNotNH: 0,
      taskUsersGov: 0,
  }
  const statObjTaskCsUsers = {
      taskUsersTitle: "APC전수조사",
      taskUsersNH: 0,
      taskUsersNotNH: 0,
      taskUsersGov: 0,
  }


  const fn_initStatObj = function () {

      statObjVisits.visitsDay = 0;
      statObjVisits.visitsMonth = 0;
      statObjVisits.visitsLastMonth = 0;
      statObjVisits.visitsDiff = 0;
      statObjVisits.visitsDiffRatio = 0;
      statObjVisits.visitsAvgDay = 0;
      statObjVisits.visitsAvgMonth = 0;
      statObjVisits.visitsAvgLastMonth = 0;
      statObjVisits.visitsAvgDiff = 0;
      statObjVisits.visitsAvgDiffRatio = 0;
      statObjVisits.viewsDay = 0;
      statObjVisits.viewsMonth = 0;
      statObjVisits.viewsLastMonth = 0;
      statObjVisits.viewsDiff = 0;
      statObjVisits.viewsDiffRatio = 0;

      statObjUsers.usersDay = 0;
      statObjUsers.usersMonth = 0;
      statObjUsers.usersLastMonth = 0;
      statObjUsers.usersDiff = 0;
      statObjUsers.usersDiffRatio = 0;
      statObjUsers.newUsersDay = 0;
      statObjUsers.newUsersMonth = 0;
      statObjUsers.newUsersLastMonth = 0;
      statObjUsers.newUsersDiff = 0;
      statObjUsers.newUsersDiffRatio = 0;
      statObjUsers.activeUsersDay = 0;
      statObjUsers.activeUsersMonth = 0;
      statObjUsers.activeUsersLastMonth = 0;
      statObjUsers.activeUsersDiff = 0;
      statObjUsers.activeUsersDiffRatio = 0;

      statObjOrgns.orgnsNH = 0;
      statObjOrgns.orgnsNotNH = 0;
      statObjOrgns.orgnsCTPV = 0;
      statObjOrgns.orgnsSGG = 0;

      statObjOrgnUsers.orgnUsersNH = 0;
      statObjOrgnUsers.orgnUsersNotNH = 0;
      statObjOrgnUsers.orgnUsersGov = 0;
      statObjOrgnUsers.orgnUsersPrivate = 0;

      statObjTaskAmUsers.taskUsersNH = 0;
      statObjTaskAmUsers.taskUsersNotNH = 0;
      statObjTaskAmUsers.taskUsersGov = 0;

      statObjTaskPdUsers.taskUsersNH = 0;
      statObjTaskPdUsers.taskUsersNotNH = 0;
      statObjTaskPdUsers.taskUsersGov = 0;

      statObjTaskCsUsers.taskUsersNH =  0;
      statObjTaskCsUsers.taskUsersNotNH =  0;
      statObjTaskCsUsers.taskUsersGov =  0;
  }


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

    if ((newValue - oldValue) == 0 || (newValue == 0 && oldValue == 0)) {
      return "0";
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

    // 엑셀 리포트 작성용
    statCrtrYmd = getYmd;
    fn_initStatObj();


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

          statObjVisits.visitsDay = tsDayVstrCnt;
          statObjVisits.visitsAvgDay = tsDayVstrCnt;

          statObjVisits.activeUsersDay = tsDayCntUser;
        }

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

          vstrDiff.style.color = "black";
          vstrIcdc.style.color = "black";

          avgVstrDiff.style.color = "black";
          avgVstrIcdc.style.color = "black";

        } else {

          tsMmVstrCnt = data.resultList[1].cnt;
          prvMmVstrCnt = data.resultList[0].cnt;

          tsMmCntUser = data.resultList[1].cntUser;
          prvMmCntUser = data.resultList[0].cntUser;

          tsYr = parseInt(data.resultList[1].ym.substr(0,4));
          tsMm = parseInt(data.resultList[1].ym.substr(4,2));

          prvYr = parseInt(data.resultList[0].ym.substr(0,4));
          prvMm = parseInt(data.resultList[0].ym.substr(4,2));

          tsMmLastDate = new Date(tsYr, tsMm, 0).getDate();
          prvMmLastDate = new Date(prvYr, prvMm, 0).getDate();

          tsMmAvg = parseInt((tsMmVstrCnt / tsMmLastDate).toFixed(0));
          prvMmAvg = parseInt((prvMmVstrCnt / prvMmLastDate).toFixed(0));

          statObjVisits.visitsMonth = tsMmVstrCnt;
          statObjVisits.visitsLastMonth = prvMmVstrCnt;
          statObjVisits.visitsDiff = tsMmVstrCnt - prvMmVstrCnt;
          statObjVisits.visitsDiffRatio = prvMmVstrCnt > 0 ? ((tsMmVstrCnt - prvMmVstrCnt) / prvMmVstrCnt).toFixed(2) : 0;
          statObjVisits.visitsAvgMonth = tsMmAvg;
          statObjVisits.visitsAvgLastMonth = prvMmAvg;
          statObjVisits.visitsAvgDiff = tsMmAvg - prvMmAvg;
          statObjVisits.visitsAvgDiffRatio = prvMmAvg > 0 ? ((tsMmAvg - prvMmAvg) / prvMmAvg).toFixed(2) : 0;

          statObjUsers.activeUsersMonth = tsMmCntUser;
          statObjUsers.activeUsersLastMonth = prvMmCntUser;
          statObjUsers.activeUsersDiff = tsMmCntUser - prvMmCntUser;
          statObjUsers.activeUsersDiffRatio = prvMmCntUser > 0 ? ((tsMmCntUser - prvMmCntUser) / prvMmCntUser).toFixed(2) : 0;

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
          statObjVisits.viewsDay = tsDayTotPVCnt;
        }

        if (data.resultList.length == 0) {
          tsDayTotPV.textContent = "0";
          tsMmTotPV.textContent = "0";
          prvMmTotPV.textContent = "0";

          totPVDiff.textContent = "0";
          totPVIcdc.textContent = "0";

          totPVDiff.style.color = "black";
          totPVIcdc.style.color = "black";
        } else {
          tsMmPVCnt = data.resultList[1].pageViewCnt;
          prvMmPVCnt = data.resultList[0].pageViewCnt;

          statObjVisits.viewsMonth = tsMmPVCnt;
          statObjVisits.viewsLastMonth = prvMmPVCnt;
          statObjVisits.viewsDiff = tsMmPVCnt - prvMmPVCnt;
          statObjVisits.viewsDiffRatio = prvMmPVCnt > 0 ? ((tsMmPVCnt - prvMmPVCnt) / prvMmPVCnt).toFixed(2) : 0;

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


        statObjUsers.usersMonth = tsMmTotMbrCnt;
        statObjUsers.usersLastMonth = prvMmTotMbrCnt;
        statObjUsers.usersDiff = tsMmTotMbrCnt - prvMmTotMbrCnt;
        statObjUsers.usersDiffRatio = prvMmTotMbrCnt > 0 ? ((tsMmTotMbrCnt - prvMmTotMbrCnt) / prvMmTotMbrCnt).toFixed(2) : 0;

        statObjUsers.newUsersMonth = tsMmNewMbrCnt;
        statObjUsers.newUsersLastMonth = prvMmNewMbrCnt;
        statObjUsers.newUsersDiff = tsMmNewMbrCnt - prvMmNewMbrCnt;
        statObjUsers.newUsersDiffRatio = prvMmNewMbrCnt > 0 ? ((tsMmNewMbrCnt - prvMmNewMbrCnt) / prvMmNewMbrCnt).toFixed(2) : 0;

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
        statObjUsers.usersDay = tsDateTotMbr.resultList[0].cntUser;
        statObjUsers.newUsersDay = tsDateNewMbr.resultList[0].cntNewUser;
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

          statObjOrgns.orgnsNH = data.resultList[0].cntMB;
          statObjOrgns.orgnsNotNH = data.resultList[0].cntNotMB;
          statObjOrgns.orgnsCTPV = data.resultList[0].cntCtPv;
          statObjOrgns.orgnsSGG = data.resultList[0].cntSGG;
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
              if (item.mbYN == "Y") {

                statObjOrgnUsers.orgnUsersNH = item.cntUser;
                statObjTaskAmUsers.taskUsersNH = item.cntAM;
                statObjTaskPdUsers.taskUsersNH = item.cntPD;
                statObjTaskCsUsers.taskUsersNH = item.cntCS;

                /** Y: 농협, N: 농업법인 **/
                cntOgnzMB.textContent = (item.cntUser).toLocaleString();
                cntAMMB.textContent = (item.cntAM).toLocaleString();
                cntPDMB.textContent = (item.cntPD).toLocaleString();
                cntCSMB.textContent = (item.cntCS).toLocaleString();

              } else if (item.mbYN == "N") {

                statObjOrgnUsers.orgnUsersNotNH = item.cntUser;
                statObjTaskAmUsers.taskUsersNotNH = item.cntAM;
                statObjTaskPdUsers.taskUsersNotNH = item.cntPD;
                statObjTaskCsUsers.taskUsersNotNH = item.cntCS;

                cntOgnzNotMB.textContent = (item.cntUser).toLocaleString();
                cntAMNotMB.textContent = (item.cntAM).toLocaleString();
                cntPDNotMB.textContent = (item.cntPD).toLocaleString();
                cntCSNotMB.textContent = (item.cntCS).toLocaleString();
              }
            } else if (item.typeCd == "2") {

              statObjOrgnUsers.orgnUsersGov = item.cntUser;
              statObjTaskAmUsers.taskUsersGov = item.cntAM;
              statObjTaskPdUsers.taskUsersGov = item.cntPD;
              statObjTaskCsUsers.taskUsersGov = item.cntCS;

              cntOgnzCtPv.textContent = (item.cntUser).toLocaleString();
              cntAMCtPv.textContent = (item.cntAM).toLocaleString();
              cntPDCtPv.textContent = (item.cntPD).toLocaleString();
              cntCSCtPv.textContent = (item.cntCS).toLocaleString();
            } else if (item.typeCd == "3") {

              statObjOrgnUsers.orgnUsersPrivate = item.cntUser;

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


  // excel Report
  const fn_excelReport = async function() {

    if (gfn_isEmpty(statCrtrYmd)) {
        gfn_comAlert("W0005", "조회된 정보");
        return;
    }


    if (!gfn_comConfirm("Q0001", "엑셀출력")) {
        return;
    }

    const fileName = "APC정보지원시스템_현황(기준일자:" + statCrtrYmd + ").xlsx";
    const param = {
      fileName : fileName,
      axWorksheetList : [],
    }

    // sheet1 시스템현황
    {
      const axWorksheet = {
        sheetName: "시스템현황표",
        //defaultRowHeight:
        //defaultRowHeightInPoints:
        //defaultColumnWidth:
        columnList: [
          {columnIndex: 0, columnWidth: 20},
          {columnIndex: 1, columnWidth: 20},
          {columnIndex: 2, columnWidth: 20},
          {columnIndex: 3, columnWidth: 20},
          {columnIndex: 4, columnWidth: 20},
          {columnIndex: 5, columnWidth: 20},
          {columnIndex: 6, columnWidth: 20},
          {columnIndex: 7, columnWidth: 20},
        ],
        rowList: []
      }


      let rowIndex = -1;
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "H1",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "▣ 시스템 현황표",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 5,
                  }
                ]
              }
        );

      ++rowIndex;
      // 기준일자
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TH",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "기준일자",
                    numericCellValue: 0,
                  },
                  {
                    styleTypeName: "H3",
                    columnIndex: 1,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: statCrtrYmd,
                    numericCellValue: 0,
                  }
                ]
              },
        );

      ++rowIndex;
      // 1. 웹 시스템 사용 현황
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "H2",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "1. 웹 시스템 사용 현황",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 7,
                  }
                ]
              }
      );

      ++rowIndex;
      // 1.1. 사용자 및 트래픽
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "H3",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "▶ 사용자 및 트래픽",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 5,
                  },
                ]
              }
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TH",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "항목",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "금일",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 2,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "금월",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 3,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "전월",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 4,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "차이(전월대비)",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 4,
                    mergedLastCol: 5,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
            {
              rowIndex: ++rowIndex,
              styleTypeName: "TH",
              cellList: [
                {
                  columnIndex: 0,
                  cellType: 1,
                  cellTypeName: "String",
                  stringCellValue: "",
                  numericCellValue: 0,
                  mergedYn: "Y",
                  mergedFirstRow: rowIndex-1,
                  mergedLastRow: rowIndex,
                  mergedFirstCol: 0,
                  mergedLastCol: 0,
                },
                {
                  columnIndex: 1,
                  cellType: 1,
                  cellTypeName: "String",
                  stringCellValue: "",
                  numericCellValue: 0,
                  mergedYn: "Y",
                  mergedFirstRow: rowIndex-1,
                  mergedLastRow: rowIndex,
                  mergedFirstCol: 1,
                  mergedLastCol: 1,
                },
                {
                  columnIndex: 2,
                  cellType: 1,
                  cellTypeName: "String",
                  stringCellValue: "",
                  numericCellValue: 0,
                  mergedYn: "Y",
                  mergedFirstRow: rowIndex-1,
                  mergedLastRow: rowIndex,
                  mergedFirstCol: 2,
                  mergedLastCol: 2,
                },
                {
                  columnIndex: 3,
                  cellType: 1,
                  cellTypeName: "String",
                  stringCellValue: "",
                  numericCellValue: 0,
                  mergedYn: "Y",
                  mergedFirstRow: rowIndex-1,
                  mergedLastRow: rowIndex,
                  mergedFirstCol: 3,
                  mergedLastCol: 3,
                },
                {
                  columnIndex: 4,
                  cellType: 1,
                  cellTypeName: "String",
                  stringCellValue: "건수",
                  numericCellValue: 0,
                },
                {
                  columnIndex: 5,
                  cellType: 1,
                  cellTypeName: "String",
                  stringCellValue: "증감(%)",
                  numericCellValue: 0,
                },
              ]
            },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: statObjVisits.visitsTitle,
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.visitsDay,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.visitsMonth,
                  },
                  {
                    columnIndex: 3,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.visitsLastMonth,
                  },
                  {
                    columnIndex: 4,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.visitsDiff,
                    fontColorType: "STOCK",
                  },
                  {
                    columnIndex: 5,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.visitsDiffRatio,
                    fontColorType: "STOCK",
                    dataFormat: "0.00%",
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: statObjVisits.visitsAvgTitle,
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.visitsAvgDay,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.visitsAvgMonth,
                  },
                  {
                    columnIndex: 3,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.visitsAvgLastMonth,
                  },
                  {
                    columnIndex: 4,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.visitsAvgDiff,
                    fontColorType: "STOCK",
                  },
                  {
                    columnIndex: 5,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.visitsAvgDiffRatio,
                    fontColorType: "STOCK",
                    dataFormat: "0.00%",
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: statObjVisits.viewsTitle,
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.viewsDay,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.viewsMonth,
                  },
                  {
                    columnIndex: 3,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.viewsLastMonth,
                  },
                  {
                    columnIndex: 4,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.viewsDiff,
                    fontColorType: "STOCK",
                  },
                  {
                    columnIndex: 5,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjVisits.viewsDiffRatio,
                    fontColorType: "STOCK",
                    dataFormat: "0.00%",
                  },
                ]
              },
      );

      ++rowIndex;
      // 1.2. 회원 현황
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "H3",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "▶ 회원 현황",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 5,
                  },
                ]
              }
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TH",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "항목",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "금일",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 2,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "금월",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 3,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "전월",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 4,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "차이(전월대비)",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 4,
                    mergedLastCol: 5,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TH",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex-1,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex-1,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 1,
                    mergedLastCol: 1,
                  },
                  {
                    columnIndex: 2,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex-1,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 2,
                    mergedLastCol: 2,
                  },
                  {
                    columnIndex: 3,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex-1,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 3,
                    mergedLastCol: 3,
                  },
                  {
                    columnIndex: 4,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "건수",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 5,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "증감(%)",
                    numericCellValue: 0,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: statObjUsers.usersTitle,
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.usersDay,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.usersMonth,
                  },
                  {
                    columnIndex: 3,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.usersLastMonth,
                  },
                  {
                    columnIndex: 4,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.usersDiff,
                    fontColorType: "STOCK",
                  },
                  {
                    columnIndex: 5,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.usersDiffRatio,
                    fontColorType: "STOCK",
                    dataFormat: "0.00%",
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: statObjUsers.newUsersTitle,
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.newUsersDay,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.newUsersMonth,
                  },
                  {
                    columnIndex: 3,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.newUsersLastMonth,
                  },
                  {
                    columnIndex: 4,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.newUsersDiff,
                    fontColorType: "STOCK",
                  },
                  {
                    columnIndex: 5,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.newUsersDiffRatio,
                    fontColorType: "STOCK",
                    dataFormat: "0.00%",
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: statObjUsers.activeUsersTitle,
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.activeUsersDay,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.activeUsersMonth,
                  },
                  {
                    columnIndex: 3,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.activeUsersLastMonth,
                  },
                  {
                    columnIndex: 4,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.activeUsersDiff,
                    fontColorType: "STOCK",
                  },
                  {
                    columnIndex: 5,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjUsers.activeUsersDiffRatio,
                    fontColorType: "STOCK",
                    dataFormat: "0.00%",
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "D2",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "1) 활성회원 : 월 1회 이상 접속",
                    numericCellValue: 0,
                  }
                ]
              }
      );

      ++rowIndex;
      // 2. 회원 상세 현황
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "H2",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "2. 회원 상세 현황",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 7,
                  }
                ]
              }
      );

      ++rowIndex;
      // 2.1. 조직 현황
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "H3",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "▶ 조직현황",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 3,
                  },
                ]
              }
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TH",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "유형",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "구분",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 2,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "조직수",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 3,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "구분합",
                    numericCellValue: 0,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "법인",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "농협",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgns.orgnsNH,
                  },
                  {
                    columnIndex: 3,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgns.orgnsNH + statObjOrgns.orgnsNotNH,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex-1,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "농업법인",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgns.orgnsNotNH,
                  },
                  {
                    columnIndex: 3,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "",
                    numericCellValue: statObjOrgns.orgnsNH + statObjOrgns.orgnsNotNH,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex-1,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 3,
                    mergedLastCol: 3,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "지자체",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "시도",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgns.orgnsCTPV,
                  },
                  {
                    columnIndex: 3,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgns.orgnsCTPV + statObjOrgns.orgnsSGG,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex-1,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "시군구",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgns.orgnsSGG,
                  },
                  {
                    columnIndex: 3,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "",
                    numericCellValue: statObjOrgns.orgnsNH + statObjOrgns.orgnsNotNH,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex-1,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 3,
                    mergedLastCol: 3,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TH",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "합계",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 1,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgns.orgnsNH + statObjOrgns.orgnsNotNH + statObjOrgns.orgnsCTPV + statObjOrgns.orgnsSGG,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 2,
                    mergedLastCol: 3,
                  },
                ]
              },
      );

      ++rowIndex;
      // 2.2. 조직별 회원 현황
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "H3",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "▶ 조직별 회원 현황",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 2,
                  },
                ]
              }
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TH",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "구분",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "회원 수",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 2,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "구분별 합",
                    numericCellValue: 0,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "농협",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgnUsers.orgnUsersNH,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgnUsers.orgnUsersNH + statObjOrgnUsers.orgnUsersNotNH,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "농업법인",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgnUsers.orgnUsersNotNH,
                  },
                  {
                    columnIndex: 2,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "",
                    numericCellValue: statObjOrgnUsers.orgnUsersNH + statObjOrgnUsers.orgnUsersNotNH,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex-1,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 2,
                    mergedLastCol: 2,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "지자체",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgnUsers.orgnUsersGov,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgnUsers.orgnUsersGov,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "개인(농가)",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgnUsers.orgnUsersPrivate,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgnUsers.orgnUsersPrivate,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TH",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "합계",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjOrgnUsers.orgnUsersNH + statObjOrgnUsers.orgnUsersNotNH + statObjOrgnUsers.orgnUsersGov + statObjOrgnUsers.orgnUsersPrivate,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 1,
                    mergedLastCol: 2,
                  },
                ]
              },
      );

      ++rowIndex;
      // 2.3. 업무별 사용 현황
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "H3",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "▶ 업무별 사용 현황",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 4,
                  },
                ]
              }
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TH",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "업무 구분",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "업무별 사용 회원 수",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 1,
                    mergedLastCol: 4,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TH",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "업무 구분",
                    numericCellValue: 0,
                    mergedYn: "Y",
                    mergedFirstRow: rowIndex-1,
                    mergedLastRow: rowIndex,
                    mergedFirstCol: 0,
                    mergedLastCol: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "농협",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 2,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "농업법인",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 3,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "지자체",
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 4,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: "합계",
                    numericCellValue: 0,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: statObjTaskAmUsers.taskUsersTitle,
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjTaskAmUsers.taskUsersNH,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjTaskAmUsers.taskUsersNotNH,
                  },
                  {
                    columnIndex: 3,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjTaskAmUsers.taskUsersGov,
                  },
                  {
                    columnIndex: 4,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjTaskAmUsers.taskUsersNH + statObjTaskAmUsers.taskUsersNotNH + statObjTaskAmUsers.taskUsersGov,
                  },
                ]
              },
      );
      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: statObjTaskPdUsers.taskUsersTitle,
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjTaskPdUsers.taskUsersNH,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjTaskPdUsers.taskUsersNotNH,
                  },
                  {
                    columnIndex: 3,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjTaskPdUsers.taskUsersGov,
                  },
                  {
                    columnIndex: 4,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjTaskPdUsers.taskUsersNH + statObjTaskPdUsers.taskUsersNotNH + statObjTaskPdUsers.taskUsersGov,
                  },
                ]
              },
      );

      axWorksheet.rowList.push(
              {
                rowIndex: ++rowIndex,
                styleTypeName: "TD",
                cellList: [
                  {
                    columnIndex: 0,
                    cellType: 1,
                    cellTypeName: "String",
                    stringCellValue: statObjTaskCsUsers.taskUsersTitle,
                    numericCellValue: 0,
                  },
                  {
                    columnIndex: 1,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjTaskCsUsers.taskUsersNH,
                  },
                  {
                    columnIndex: 2,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjTaskCsUsers.taskUsersNotNH,
                  },
                  {
                    columnIndex: 3,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjTaskCsUsers.taskUsersGov,
                  },
                  {
                    columnIndex: 4,
                    cellType: 0,
                    cellTypeName: "Number",
                    stringCellValue: "",
                    numericCellValue: statObjTaskCsUsers.taskUsersNH + statObjTaskCsUsers.taskUsersNotNH + statObjTaskCsUsers.taskUsersGov,
                  },
                ]
              },
      );


      ++rowIndex;

      param.axWorksheetList.push(axWorksheet);
    }



    const postJsonPromise = gfn_postJsonForDownload("/exportExcelReport.do", param);

    const data = await postJsonPromise;

    try {

      if (data != null) {
        const a = document.createElement("a");
        a.href = URL.createObjectURL(data);
        a.setAttribute("download", fileName);
        a.click();
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



