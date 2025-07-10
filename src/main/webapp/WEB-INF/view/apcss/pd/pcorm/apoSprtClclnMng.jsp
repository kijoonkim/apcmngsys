<%
  /**
   * @Class Name : apoSprtClclnMng.jsp
   * @Description : 산지조직지원 정산관리
   * @author SI개발부
   * @since 2025.7.8
   * @version 1.0
   * @Modification Information
   * @
   * @ 수정일       	수정자      	수정내용
   * @ ----------	----------	---------------------------
   * @ 2025.07.07   유민지	    최초 생성
   * @see
   *
   */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>title : 산지조직지원정산관리</title>
  <%@ include file="../../../frame/inc/headerMeta.jsp" %>
  <%@ include file="../../../frame/inc/headerScript.jsp" %>
  <%@ include file="../../../frame/inc/clipreport.jsp" %>
</head>
<style>
  .btnClass {
    vertical-align: middle;
    line-height: normal;
    padding-top: 2px;
  }

  .btnClass:hover {
    background-color: #0d6efd;
    color: white;
  }
</style>
<body oncontextmenu="return false">
<section>
  <div class="box box-solid">
    <div class="box-header" style="display:flex; justify-content: flex-start;" >
      <div>
        <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
        <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 산지조직지원정산관리 -->
      </div>
      <div style="margin-left: auto;">
        <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회" class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
      </div>
    </div>
    <div class="box-body">

      <table class="table table-bordered tbl_fixed">
        <caption>교부관리 신청 목록</caption>
        <tbody>
        <tr>
          <th scope="row" class="th_bg">연도</th>
          <td class="td_input">
            <sbux-spinner id="dtl-spi-yr" name="dtl-spi-yr" uitype="normal" class="form-control input-sm" step-value="1" wrap-style="width:100%;"></sbux-spinner>
          </td>
          <th scope="row" class="th_bg">사업자번호</th>
          <td class="td_input">
            <sbux-input id="dtl-inp-brno" name="dtl-inp-brno" uitype="text" class="form-control input-sm" ></sbux-input>
          </td>
          <th scope="row" class="th_bg">법인명</th>
          <td class="td_input">
            <sbux-input id="dtl-inp-corpNm" name="dtl-inp-corpNm" uitype="text" class="form-control input-sm" ></sbux-input>
          </td>
        </tr>
        </tbody>
      </table>

      <div style="height: 10px"></div>

      <div class="ad_tbl_top">
        <ul class="ad_tbl_count">
          <li>
            <span>교부 관리</span>
            <span style="font-size:12px">(조회건수 <span id="dtbnMngList">0</span>건 )</span>
          </li>
        </ul>
        <%--저장버튼--%>
<%--        <div><sbux-button id="btnSaveDtbnMng" name="btnSaveDtbnMng" uitype="normal" text="저장" class="btn btn-sm btn-primary" onclick="fn_saveDtbnMng"></sbux-button></div>--%>
      </div>
      <div class="ad_tbl_toplist"></div>
      <div id="sb-area-dtbnMng" style="height: 300px"></div>

      <div style="height: 10px"></div>

      <div class="ad_tbl_top">
        <ul class="ad_tbl_count">
          <li><span>교부신청서 등록</span></li>
        </ul>
      </div>

      <table class="table table-bordered tbl_fixed">

        <caption>교부신청서 법인 정보</caption>
        <tbody>
        <tr>
          <th scope="row" class="th_bg">법인명</th>
          <td class="td_input">
            <sbux-input id="dtl-inp-dtbnMngCorpNm" name="dtl-inp-dtbnMngCorpNm" uitype="text" class="form-control input-sm" readonly></sbux-input>
          </td>
          <th scope="row" class="th_bg">사업자번호</th>
          <td class="td_input">
            <sbux-input id="dtl-inp-dtbnMngBrno" name="dtl-inp-dtbnMngBrno" uitype="text" class="form-control input-sm" mask = "{ 'alias': '999-99-99999' , 'autoUnmask': true}" readonly></sbux-input>
          </td>
          <%--<th scope="row" class="th_bg">법인등록번호</th>
          <td class="td_input">
            <sbux-input id="dtl-inp-dtbnMngCrno" name="dtl-inp-dtbnMngCrno" uitype="text" class="form-control input-sm" readonly></sbux-input>
          </td>--%>
          <sbux-input id="dtl-inp-dtbnSprtBizYr" name="dtl-inp-dtbnSprtBizYr" uitype="hidden"></sbux-input>
          <sbux-input id="dtl-inp-dtbnSprtBizCd" name="dtl-inp-dtbnSprtBizCd" uitype="hidden"></sbux-input>
          <sbux-input id="dtl-inp-dtbnSprtOgnzId" name="dtl-inp-dtbnSprtOgnzId" uitype="hidden"></sbux-input>
        </tr>
        </tbody>
      </table>

      <div style="height: 10px"></div>

      <table class="table table-bordered tbl_fixed">
        <caption>교부신청서 등록</caption>
        <colgroup>
          <col style="width: 20%">
          <col style="width: 30%">
          <col style="width: 10%">
          <col style="width: 35%">
          <col style="width: 5%">
        </colgroup>
        <tbody>
        <tr>
          <th scope="row" class="th_bg text-center">제출서류</th>
          <th scope="row" class="th_bg text-center">기제출서류</th>
          <th scope="row" class="th_bg text-center">확인여부</th>
          <th scope="row" class="th_bg text-center">신규(변경) 제출서류</th>
          <th scope="row" class="th_bg text-center"></th>
        </tr>
        <tr>
          <th scope="row" class="th_bg text-center">교부신청서(pdf)</th>
          <%--기제출서류--%>
          <td class="td_input">
            <sbux-input id="dtl-inp-exsDtbnAplyDoc" name="dtl-inp-exsDtbnAplyDoc" uitype="text" class="form-control input-sm" readonly></sbux-input>
          </td>
          <%--확인여부--%>
          <td class="td_input">
            <sbux-input id="dtl-inp-dtbnAplyDocIdntyYn" name="dtl-inp-dtbnAplyDocIdntyYn" uitype="text" class="form-control input-sm" readonly></sbux-input>
          </td>
          <%--파일선택--%>
          <td class="td_input" style="border-right: hidden">
            <input type="file" id="dtbnAplyDoc" accept=".pdf">
          </td>
          <td class="td_input text-center">
            <sbux-button id="btnSbmsnDtbnAplyDoc" name="btnSbmsnDtbnAplyDoc" uitype="normal" text="제출" class="btn btn-sm btn-primary" onclick="fn_sbmsnDtbnAply()"></sbux-button>
          </td>
        </tr>
        </tbody>
      </table>

    </div>
  </div>

</section>

</body>
<script type="text/javascript">

  /** 정산 신청 **/
  var gridClclnAply;
  var jsonClclnAply = [];

  /** 정산 결과 **/
  var gridClclnRslt;
  var jsonClclnRslt = [];

  /** 교부 관리 **/
  var gridDtbnMng;
  var jsonDtbnMng = [];

  window.addEventListener('DOMContentLoaded', async function(e) {
    await fn_init()
  });

  /**
   * @name fn_init
   * @description fn_init
   */
  const fn_init = async function() {
    fn_createDtbnMng(); // 신청목록 그리드
    SBUxMethod.set('dtl-spi-yr',gfn_dateToYear(new Date())); // 연도
    fn_search();
  }

  /**
   * @name fn_createClclnAplyGrid
   * @description 정산신청 그리드
   */
  const fn_createClclnAplyGrid = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-clcln';
    SBGridProperties.id = 'gridClclnAply';
    SBGridProperties.jsonref = 'jsonClclnAply';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.allowcopy = true;
    SBGridProperties.extendlastcol = 'scroll';

    SBGridProperties.columns = [
      {caption: ['연도','연도'],			ref: 'yr', 	    width: '5%', type: 'output',style: 'text-align:center'},
      {caption: ['법인명','법인명'], 			ref: 'corpNm', 	width: '15%', type: 'output', style: 'text-align:left'},
      {caption: ['교부신청서','제출여부'], 			ref: 'dtbnAplyDocSbmsnYn', 		width: '5%', type: 'output', style: 'text-align:center'},
      {caption: ['교부신청서','확인여부'], 			ref: 'dtbnAplyDocAprvYn', 		width: '5%', type: 'output', style: 'text-align:center'},
      {caption: ['교부신청서','미리보기'], 			ref: 'dtbnAplyDocPrvw', 		width: '5%', type: 'button', style: 'text-align:center',typeinfo : {buttonclass:'btnClass', buttonvalue: '팝업 열기', callback: fn_openDtbnAplyDocPrvw}},
      {caption: ['배정예산(국고 50)','배정예산(국고 50)'], 			ref: 'rpnAmtNe', 		width: '8%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}, userattr : {colNm :"rpnAmtNe"}},
      {caption: ['1차 교부결정액','금액'], 			ref: 'dtbnDcsnAmt1', 		width: '8%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'},userattr : {colNm :"dtbnDcsnAmt1"}},
      {caption: ['1차 교부결정액','교부결정서 다운로드'], 			ref: 'dtbnDcsnDoc1', 		width: '7%', type: 'button', style: 'text-align:center',typeinfo : {buttonvalue: '다운로드', callback: fn_dwnldDtbnDcsnDoc}},
      {caption: ['2차 교부결정액','금액'], 			ref: 'dtbnDcsnAmt2', 		width: '8%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'},userattr : {colNm :"dtbnDcsnAmt2"}},
      {caption: ['2차 교부결정액','교부결정서 다운로드'], 			ref: 'dtbnDcsnDoc2', 		width: '7%', type: 'button', style: 'text-align:center',typeinfo : {buttonvalue: '다운로드', callback: fn_dwnldDtbnDcsnDoc}},
      {caption: ['잔액','잔액'], 			ref: 'blnc', 		width: '7%', type: 'output', style: 'text-align:right',userattr : {colNm :"blnc"}},
      {caption: ['비고','비고'], 			ref: 'rmrk', 		width: '20%', type: 'input', style: 'text-align:center'},
    ];
    gridClclnAply = _SBGrid.create(SBGridProperties);
  }


  /**
   * @name fn_createDtbnMng
   * @description 교부관리 그리드
   */
  const fn_createDtbnMng = function() {
    var SBGridProperties = {};
    SBGridProperties.parentid = 'sb-area-dtbnMng';
    SBGridProperties.id = 'gridDtbnMng';
    SBGridProperties.jsonref = 'jsonDtbnMng';
    SBGridProperties.emptyrecords = '데이터가 없습니다.';
    SBGridProperties.selectmode = 'free';
    SBGridProperties.allowcopy = true;
    SBGridProperties.extendlastcol = 'scroll';

    SBGridProperties.columns = [
      {caption: ['연도','연도'],			ref: 'yr', 	    width: '5%', type: 'output',style: 'text-align:center'},
      {caption: ['법인명','법인명'], 			ref: 'corpNm', 	width: '12%', type: 'output', style: 'text-align:left'},
      {caption: ['사업자번호','사업자번호'], 			ref: 'brno', 	width: '7%', type: 'output', style: 'text-align:center'},
      {caption: ['교부신청서','제출여부'], 			ref: 'dtbnAplyDocSbmsnYn', 		width: '5%', type: 'output', style: 'text-align:center'},
      {caption: ['교부신청서','확인여부'], 			ref: 'dtbnAplyDocAprvYn', 		width: '5%', type: 'output', style: 'text-align:center'},
      {caption: ['교부신청서','미리보기'], 			ref: 'dtbnAplyDocPrvw', 		width: '5%', type: 'button', style: 'text-align:center',typeinfo : {buttonclass:'btn btn-sm btn-outline-danger btnClass', buttonvalue: '팝업 열기', callback: fn_openDtbnAplyDocPrvw}},
      {caption: ['배정예산(국고 50)','배정예산(국고 50)'], 			ref: 'rpnAmtNe', 		width: '8%', type: 'input', style: 'text-align:right',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'}, userattr : {colNm :"rpnAmtNe"}},
      {caption: ['1차 교부결정액','금액'], 			ref: 'dtbnDcsnAmt1', 		width: '8%', type: 'input', style: 'text-align:right;background:#efefef',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'},userattr : {colNm :"dtbnDcsnAmt1"},disabled : true},
      {caption: ['1차 교부결정액','교부결정서'], 			ref: 'dtbnDcsnDoc1', 		width: '7%', type: 'button', style: 'text-align:center;background:#efefef',typeinfo : {buttonvalue: '다운로드', callback: fn_dwnldDtbnDcsnDoc},disabled : true},
      {caption: ['2차 교부결정액','금액'], 			ref: 'dtbnDcsnAmt2', 		width: '8%', type: 'input', style: 'text-align:right;background:#efefef',typeinfo :{mask : {alias :'numeric'}}, format : {type:'number',rule:'#,###'},userattr : {colNm :"dtbnDcsnAmt2"},disabled : true},
      {caption: ['2차 교부결정액','교부결정서'], 			ref: 'dtbnDcsnDoc2', 		width: '7%', type: 'button', style: 'text-align:center;background:#efefef',typeinfo : {buttonvalue: '다운로드', callback: fn_dwnldDtbnDcsnDoc},disabled : true},
      {caption: ['잔액','잔액'], 			ref: 'blnc', 		width: '7%', type: 'output', style: 'text-align:right;background:#efefef',userattr : {colNm :"blnc"},disabled : true},
      {caption: ['비고','비고'], 			ref: 'rmrk', 		width: '16%', type: 'input', style: 'text-align:center;background:#efefef',disabled : true},
    ];
    gridDtbnMng = _SBGrid.create(SBGridProperties);
    gridDtbnMng.bind('valuechanged','fn_gridDtbnMngValueChange');
    gridDtbnMng.bind('click','fn_clickDtbnMngGrid')
  }

  const fn_clear = function () {
    // 교부 관리
    SBUxMethod.set('dtl-inp-dtbnMngCorpNm',null);
    SBUxMethod.set('dtl-inp-dtbnMngBrno',null);
    SBUxMethod.set('dtl-inp-dtbnSprtBizYr',null);
    SBUxMethod.set('dtl-inp-dtbnSprtBizCd',null);
    SBUxMethod.set('dtl-inp-dtbnSprtOgnzId',null);
    SBUxMethod.set('dtl-inp-exsDtbnAplyDoc',null);
    SBUxMethod.set('dtl-inp-dtbnAplyDocIdntyYn',null);

    document.querySelector('#dtbnAplyDoc').value = null;

    SBUxMethod.attr('btnSbmsnDtbnAplyDoc','disabled','true');
  }


  const fn_search = async function () {
    await fn_searchDtbnMng();
  }
  /**
   * @name fn_searchDtbnMng
   * @description 교부신청 조회
   */
  const fn_searchDtbnMng = async function () {
    fn_clear();
    jsonDtbnMng.length = 0;
    const crtrYr = SBUxMethod.get('dtl-spi-yr');
    const brno = SBUxMethod.get('dtl-inp-brno');
    const corpNm = SBUxMethod.get('dtl-inp-corpNm');

    const postJsonPromise = gfn_postJSON("/pd/sprt/selectSprtBizClclnList.do", {
      crtrYr: crtrYr,
      brno: brno,
      corpNm: corpNm,
    });

    const data = await postJsonPromise;

    try {
      if (_.isEqual("S", data.resultStatus)) {
        data.resultList.forEach(item => {
          // 제출
          let sbmsnYn;
          let atchFileSn = item.atchFileSn
          if (gfn_isEmpty(atchFileSn) || _.isEqual(atchFileSn,0)) {
            sbmsnYn = "미제출";
          } else if (atchFileSn > 0 && _.isEqual(item.chgYn, "Y")) {
            sbmsnYn = "제출(변경)";
          } else {
            sbmsnYn = "제출";
          }

          // 확인여부
          let aprvYnNm;
          if (gfn_isEmpty(atchFileSn) || _.isEqual(atchFileSn,0)) {
            aprvYnNm = null;
          } else if (atchFileSn > 0 && gfn_isEmpty(item.aprvYn)) {
            aprvYnNm = "미확인";
          } else if (atchFileSn > 0 && _.isEqual(item.aprvYn,"Y")) {
            aprvYnNm = "확인";
          } else if (atchFileSn > 0 && _.isEqual(item.aprvYn,"N")) {
            aprvYnNm = "수정요청";
          }

          const vo = {
            yr : item.sprtBizYr,
            sprtBizCd : item.sprtBizCd,
            sprtOgnzId : item.sprtOgnzId,
            aplyDocCd : item.aplyDocCd,
            corpNm : item.corpNm,
            brno : item.brno,
            crno : item.crno,
            dtbnAplyDocSbmsnYn : sbmsnYn,
            atchFileSn : item.atchFileSn,
            dtbnAplyDocAprvYn : aprvYnNm,
            aprvYn : item.aprvYn,
            rpnAmtNe : item.rpnAmtNe,
            rmrk : item.dtbnRmrk,
            lgcFileNm : item.lgcFileNm,

            rgtr : item.rgtr,
            regDt : item.regDt,
            idfr : item.idfr,
            idfrDt : item.idfrDt
          }
          jsonDtbnMng.push(vo);
        });

        document.querySelector('#dtbnMngList').innerText = data.resultList.length;
      } else {
        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
      }
      gridDtbnMng.refresh();
    } catch (e) {
      if (!(e instanceof Error)) {
        e = new Error(e);
      }
      console.error("failed", e.message);
      gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
    }

  }

  /**
   * @name fn_gridDtbnMngValueChange
   * @description 교부관리그리드 값 변경
   */
  function fn_gridDtbnMngValueChange() {
    const row = gridDtbnMng.getRow();
    const col = gridDtbnMng.getCol();
    const colNm = gridDtbnMng.getColUserAttr(col).colNm;
    const rowData = gridDtbnMng.getRowData(row,false); // false : 'call by refrence'로 반환

    if (gfn_isEmpty(rowData)) {
      return;
    }
    if (gfn_isEmpty(colNm)) {
      return;
    }

    if (_.isEqual(colNm,"dtbnDcsnAmt1") || _.isEqual(colNm,"dtbnDcsnAmt2")) {
      const rpnAmtNe = rowData.rpnAmtNe;
      const dtbnDcsnAmt1 = rowData.dtbnDcsnAmt1;
      const dtbnDcsnAmt2 = rowData.dtbnDcsnAmt2;
      const blnc = rpnAmtNe - dtbnDcsnAmt1 - dtbnDcsnAmt2;
      rowData.blnc = blnc;
      gridDtbnMng.refresh();
    }
  }

  /**
   * @name fn_clickDtbnMngGrid
   * @description 교부관리그리드 클릭 이벤트
   */
  const fn_clickDtbnMngGrid = function () {
    fn_clear();

    const row = gridDtbnMng.getRow();
    const rowData = gridDtbnMng.getRowData(row);

    if (gfn_isEmpty(rowData)) {
      return;
    }

    SBUxMethod.set('dtl-inp-dtbnMngCorpNm',rowData.corpNm); // 법인명
    SBUxMethod.set('dtl-inp-dtbnMngBrno',rowData.brno); // 사업자번호
    SBUxMethod.set('dtl-inp-dtbnSprtBizYr',rowData.yr); // 지업사업연도
    SBUxMethod.set('dtl-inp-dtbnSprtBizCd',rowData.sprtBizCd); // 지업사업코드
    SBUxMethod.set('dtl-inp-dtbnSprtOgnzId',rowData.sprtOgnzId); // 지업조직아이디

    SBUxMethod.set('dtl-inp-exsDtbnAplyDoc',rowData.lgcFileNm); // 기제출서류
    SBUxMethod.set('dtl-inp-dtbnAplyDocIdntyYn',rowData.dtbnAplyDocAprvYn); // 확인여부

    const aprvYn = rowData.aprvYn;

    if (_.isEqual(aprvYn,"Y")) {
      SBUxMethod.attr('btnSbmsnDtbnAplyDoc','disabled','true');
    } else {
      SBUxMethod.attr('btnSbmsnDtbnAplyDoc','disabled','false');
    }
  }

  /**
   * @name fn_openDtbnAplyDocPrvw
   * @description 교부신청서 미리보기
   */
  const fn_openDtbnAplyDocPrvw = function (){
    const row = gridDtbnMng.getRow();
    const rowData = gridDtbnMng.getRowData(row);

    if (gfn_isEmpty(rowData)) {
      return;
    }

    const brno = rowData.brno;

    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
      return;
    }

    const url = "/pd/sprt/dtbnAplyPrvwPopup.do";
    const title = "교부신청서 미리보기";
    window.open(url, title, "width=1000px,height=900px");
  }

  const fn_sbmsnDtbnAply = function (){
    const corpNm = SBUxMethod.get('dtl-inp-dtbnMngCorpNm'); // 법인명
    const brno = SBUxMethod.get('dtl-inp-dtbnMngBrno'); // 사업자번호
    const sprtBizYr = SBUxMethod.get('dtl-inp-dtbnSprtBizYr'); // 지업사업연도
    const sprtBizCd = SBUxMethod.get('dtl-inp-dtbnSprtBizCd'); // 지업사업코드
    const sprtOgnzId = SBUxMethod.get('dtl-inp-dtbnSprtOgnzId'); // 지업조직아이디

    if (gfn_isEmpty(brno)) {
      gfn_comAlert("W0005", "사업자번호"); // W0005 {0}이/가 없습니다.
      return;
    }

    var formData = new FormData();

    const dtbnAplyDocFile = $('#dtbnAplyDoc')[0].files; // 교부신청서

    // 제출허용 확장자
    const allowExtn = ['pdf'];

    if (dtbnAplyDocFile.length == 0) {
      gfn_comAlert("W0005","교부신청서 제출할 파일"); // W0005  {0}이/가 없습니다.
      return;
    }

    if (dtbnAplyDocFile.length > 0) {
      for (var i = 0; i < dtbnAplyDocFile.length; i++) {
        const extension = dtbnAplyDocFile[i].name.split('.').pop().toLowerCase();
        if (allowExtn.includes(extension)) {
          formData.append('dtbnAplyFiles', dtbnAplyDocFile[i]);
        } else {
          gfn_comAlert("W0021","교부신청서 확장자","pdf"); // W0021 {0}은/는 {1}만 가능합니다.
          return;
        }
      }
    }

    formData.append('sprtBizYr',gfn_nvl(sprtBizYr));
    formData.append('sprtBizCd',gfn_nvl(sprtBizCd));
    formData.append('sprtOgnzId',gfn_nvl(sprtOgnzId));
    formData.append('brno',gfn_nvl(brno));

    /*const obj = {};
    formData.forEach((value,key) => {
      obj[key] = value;
    });
    console.log("제출할때",obj);*/

    if (!gfn_comConfirm("Q0001", "교부신청서 제출")) {	//	Q0001	{0} 하시겠습니까?
      return;
    }

    $.ajax({
      type: 'POST',
      url: '/pd/sprt/dtbnAplyDocReg.do',
      data: formData,
      processData: false,
      contentType: false,
      success: function (response) {
        gfn_comAlert("I0001");	// I0001	처리 되었습니다.
        fn_searchDtbnMng();
      },
      error: function (error) {
        gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        //gfn_comAlert(error.resultCode, error.resultMessage);
      }
    });

  }

  function fn_getDtbnMngRowData(){
    const rowData = gridDtbnMng.getRowData(gridDtbnMng.getRow());
    if (gfn_isEmpty(rowData)) {
      return;
    }
    return rowData;
  }

  /**
   * @name fn_dwnldDtbnDcsnDoc
   * @description 교부결정서 다운로드
   */
  function fn_dwnldDtbnDcsnDoc() {


  }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
