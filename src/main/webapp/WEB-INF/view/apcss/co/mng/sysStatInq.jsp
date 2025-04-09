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
      <div>
        <table>
          <tbody>
            <tr>
              <th scope="row" class="th_bg"><span class="data_required"></span>기준일자</th>
              <td>
                <sbux-datepicker id="sysStatInq-crtr-ym" name="sysStatInq-crtr-ym" uitype="popup" date-format="yyyy-mm" datepicker-mode="month" open-on-input-selection="true"></sbux-datepicker>
              </td>
              <td>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" class="btn btn-sm btn-outline-danger" text="조회" onclick="fn_search()"></sbux-button>
              </td>
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
          <thead>
            <tr style="text-align: center">
              <th scope="row" rowspan="2" style="text-align: center">항목</th>
              <th scope="row" rowspan="2" style="text-align: center">현월</th>
              <th scope="row" rowspan="2" style="text-align: center">전월</th>
              <th scope="row" colspan="2" style="text-align: center">차이(전월대비)</th>
            </tr>
            <tr>
              <th style="text-align: center">건수</th>
              <th style="text-align: center">증감(%)</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>총 방문자</td>
              <td id="userTrfc-tsMmVstr" name="userTrfc-tsMmVstr">0</td>
              <td id="userTrfc-prvMmVstr" name="userTrfc-prvMmVstr">0</td>
              <td id="">0</td>
              <td>0</td>
            </tr>
            <tr>
              <td>일 평균 방문자</td>
              <td id="userTrfc-tsMmAvgVstr" name="userTrfc-tsMmAvgVstr">0</td>
              <td id="userTrfc-prvMnAvgVstr" name="userTrfc-prvMnAvgVstr">0</td>
              <td>0</td>
              <td>0</td>
            </tr>
            <tr>
              <td>총 페이지뷰(PV)</td>
              <td id="userTrfc-tsMmTotPV" name="userTrfc-tsMmTotPV">0</td>
              <td id="userTrfc-prvMmTotPV" name="userTrfc-prvMmTotPV">0</td>
              <td>0</td>
              <td>0</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="col-md-6">
        <h4> ▶ 회원 현황</h4>
        <table class="table table-bordered tbl_fixed" >
          <thead>
            <tr>
              <th scope="row" rowspan="2">항목</th>
              <th scope="row" rowspan="2">현월</th>
              <th scope="row" rowspan="2">전월</th>
              <th scope="row" colspan="2">차이(전월대비)</th>
            </tr>
            <tr>
              <th>건수</th>
              <th>증감(%)</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>총 회원</td>
              <td id="mbrPrst-tsMmTotMbr" name="mbrPrst-tsMmTotMbr">0</td>
              <td id="mbrPrst-prvMmTotMbr" name="mbrPrst-prvMmTotMbr">0</td>
              <td id="">0</td>
              <td>0</td>
            </tr>
            <tr>
              <td>신규 가입자</td>
              <td id="mbrPrst-tsMmNewMbr" name="tsMmNewMbr">0</td>
              <td id="mbrPrst-prvMmNewMbr" name="prvMnNewMbr">0</td>
              <td>0</td>
              <td>0</td>
            </tr>
            <tr>
              <td>활성 회원<sup>1)</sup></td>
              <td id="mbrPrst-tsMmActvtnPV" name="mbrPrst-tsMmActvtnPV">0</td>
              <td id="mbrPrst-prvMmActvtnPV" name="mbrPrst-prvMmActvtnPV">0</td>
              <td>0</td>
              <td>0</td>
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
        <table class="table table-bordered tbl_fixed">
          <thead>
            <tr>
              <th>유형</th>
              <th>구분</th>
              <th>조직 수</th>
              <th>구분 합</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td rowspan="2">법인</td>
              <td>농협</td>
              <td>0</td>
              <td rowspan="2">0</td>
            </tr>
            <tr>
              <td>농업법인</td>
              <td>0</td>
            </tr>
            <tr>
              <td rowspan="2">지자체</td>
              <td>시도</td>
              <td>0</td>
              <td rowspan="2">0</td>
            </tr>
            <tr>
              <td>시군구</td>
              <td>0</td>
            </tr>
            <tr style="background-color: #FFF8DC">
              <td colspan="2">합계</td>
              <td colspan="2">0</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="col-md-6">
        <h4> ▶ 조직별 회원 현황</h4>
        <table class="table table-bordered tbl_fixed">
          <thead>
            <tr>
              <th>구분</th>
              <th>회원 수</th>
              <th>구분별 합</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>농협</td>
              <td>0</td>
              <td rowspan="2">0</td>
            </tr>
            <tr>
              <td>농업법인</td>
              <td>0</td>
            </tr>
            <tr>
              <td>지자체</td>
              <td>0</td>
              <td>0</td>
            </tr>
            <tr>
              <td>개인(농가)</td>
              <td>0</td>
              <td>0</td>
            </tr>
            <tr style="background-color: #FFF8DC">
              <td>합계</td>
              <td>0</td>
              <td>0</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="col-md-6">
        <h4> ▶ 업무별 사용 현황</h4>
        <table class="table table-bordered tbl_fixed">
          <thead>
            <tr>
              <th scope="row" rowspan="2">업무 구분</th>
              <th scope="row" colspan="4">업무별 사용 회원 수</th>
            </tr>
            <tr>
              <th>농협</th>
              <th>농업법인</th>
              <th>지자체</th>
              <th>합계</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>생산관리</td>
              <td>0</td>
              <td>0</td>
              <td>0</td>
              <td>0</td>
            </tr>
            <tr>
              <td>생산유통통합조직</td>
              <td>0</td>
              <td>0</td>
              <td>0</td>
              <td>0</td>
            </tr>
            <tr>
              <td>APC전수조사</td>
              <td>0</td>
              <td>0</td>
              <td>0</td>
              <td>0</td>
            </tr>
          </tbody>
        </table>
      </div>

    </div>
  </section>
</body>
<script type="text/javascript">

  var userYmdFrom;
  var userYmdTo;

  async function fn_search() {
    const getYM = SBUxMethod.get("sysStatInq-crtr-ym");

    console.log(getYM);

    userYmdFrom = getYM + '01';
    userYmdTo = getOneMonthBefore(userYmdFrom) + '01';

    console.log('ymdFrom: ' + userYmdFrom);
    console.log('ymdTo: ' + userYmdTo);

    fn_selectUserCnt();
  }

  function getOneMonthBefore(yyyymm) {
    const year = parseInt(yyyymm.substring(0, 4));
    const month = parseInt(yyyymm.substring(4,6));

    const currentDate = new Date(year, month - 1, 1);

    const prevMonth = new Date(currentDate);
    prevMonth.setMonth(prevMonth.getMonth() - 1);

    const prvYY = prevMonth.getFullYear();
    const prvMM = String(prevMonth.getMonth() + 1).padStart(2, '0');

    console.log("yyyymm: " + prvYY + prvMM);
    return (prvYY + prvMM);
  }

  /** 사용자 및 트래픽 조회 **/
  const fn_selectUserCnt = async function () {

    let postJsonPromise = gfn_postJSON("/co/mng/selectUserCnt.do", {
      userYmdFrom : userYmdFrom
      , userYmdTo   : userYmdTo
    });

    let data = await postJsonPromise;
    console.log(data);


  }




</script>
</html>



