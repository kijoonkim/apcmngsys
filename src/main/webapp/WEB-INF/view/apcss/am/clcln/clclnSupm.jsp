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
   * @ 2024.09.10   	손민성		최초 생성
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
    #종자단가, #등급단가{
      border: 0;
      padding: 0;
    }
    .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-nor-bd > li.sbux-tabs-item > a:hover, .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-inbox-bd > li.sbux-tabs-item > a:hover {
      border-color : rgb(221, 221, 221) !important;
    }
    [id^="sb-area"] {
      padding: 10px;
    }
  </style>
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
                id="btnReset"
                name="btnReset"
                uitype="normal"
                class="btn btn-sm btn-outline-danger"
                text="초기화"
                onclick="fn_reset"
        ></sbux-button>
        <sbux-button
                id="btnSave"
                name="btnSave"
                uitype="normal"
                class="btn btn-sm btn-primary"
                text="저장"
                onclick="fn_search"
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
          <th scope="row" class="th_bg">정산년도/차수</th>
          <td class="td_input">
            <div style="display: flex;gap: 10px">
              <sbux-datepicker
                      id="srch-dtp-clclnY"
                      name="srch-dtp-clclnY"
                      uitype="popup"
                      date-format="yyyy"
                      datepicker-mode="year"
                      class="form-control input-sm input-sm-ast inpt_data_reqed"
                      style="height: 28px"
              ></sbux-datepicker>
              <sbux-spinner id="clclnNo" name="clclnNo"
                            wrap-style="flex-basis:30%"
                            uitype="normal"  number-min-value="1"
                            number-max-value="10" number-suffix-text="차수"
              ></sbux-spinner>
            </div>
          </td>
        </tr>
        <tr>
          <th scope="row" class="th_bg">정산구분</th>
          <td class="td_input">
            <div style="display: flex">
              <sbux-select
                      id="srch-slt-crtrCd"
                      name="srch-slt-crtrCd"
                      uitype="single"
                      unselected-text="전체"
                      class="form-control input-sm"
                      style="flex-basis: 50%"
                      jsondata-ref="comboData1"
                      jsondata-text="label"
              ></sbux-select>
            </div>
          </td>
          <th scope="row" class="th_bg">정산분류</th>
          <td class="td_input">
            <div style="display: flex">
              <sbux-select
                      id="srch-slt-crtrCd1"
                      name="srch-slt-crtrCd1"
                      uitype="single"
                      unselected-text="전체"
                      class="form-control input-sm"
                      style="flex-basis: 50%"
                      jsondata-ref="comboData2"
                      jsondata-text="label"
              ></sbux-select>
            </div>
          </td>
        </tr>
        </tbody>
      </table>

      <sbux-tabs id="tab_norm" name="tab_norm" uitype="webacc" is-scrollable="false" wrap-style="height:100%"
                 title-target-id-array="종자단가^등급단가"
                 title-text-array="종자단가^등급단가"
                 title-style-array="{margin-right: 5px;width: 8vw;
                 text-align: center;font-weight: bold;border-radius:0}^{margin-right: 5px;width: 8vw;
                 text-align: center;font-weight: bold;border-radius:0}">
      </sbux-tabs>

      <div class="tab-content">
        <div id="종자단가">
          <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
              <li>
                <span>단가 상세</span>
              </li>
            </ul>
          </div>
          <div id="sb-area-종자단가" style="height: 500px"></div>
        </div>
        <div id="등급단가">
          <div class="ad_tbl_top">
            <ul class="ad_tbl_count">
              <li>
                <span>단가 상세</span>
              </li>
            </ul>
          </div>
          <div id="sb-area-등급단가" style="height: 500px"></div>
        </div>
      </div>


      <div id="sb-area-1"></div>
      <div id="sb-area-2"></div>
    </div>
  </div>
</section>
</body>
<script type="text/javascript">
  var grdGdsInvntr;
  var grdGdsInvntr1;
  var jsonGrdGdsInvntr;
  var jsonGrdGdsInvntr1;



  var comboData1 = [
    {label:"만생",value:"만생"},
    {label:"조생",value:"조생"},
  ]
  var comboData2 = [
    {label:"관내",value:"관내"},
    {label:"구미하우스",value:"구미하우스"},
    {label:"전라도",value:"전라도"},
  ]
  var comboData3 = [
    {label:"뉴마르스",value:"뉴마르스"},
    {label:"카타마루",value:"카타마루"},
    {label:"케드스타",value:"케드스타"},
    {label:"페가수스",value:"페가수스"},
    {label:"에이스",value:"에이스"},
    {label:"체인지업",value:"체인지업"},
    {label:"조생에이스",value:"조생에이스"},
    {label:"하이키타플러스",value:"하이키타플러스"},
    {label:"썬파워",value:"썬파워"},
    {label:"옥풍",value:"옥풍"},
    {label:"쌩쌩볼",value:"쌩쌩볼"},
    {label:"케이파워",value:"케이파워"},
    {label:"젤빠른",value:"젤빠른"},
    {label:"신나는",value:"신나는"},
    {label:"하마에미",value:"하마에미"},
    {label:"하미노타키라",value:"하미노타키라"},
  ]
  var comboData4 = [
      {label:"1등급",value:"1등급"},
      {label:"2등급",value:"2등급"},
      {label:"소구",value:"소구"},
      {label:"기형",value:"기형"},
      {label:"적색 1등급",value:"적색 1등급"},
      {label:"적색 2등급",value:"적색 2등급"},
      {label:"적색 소구",value:"적색 소구"},
      {label:"적색 기형",value:"적색 기형"},
  ]


  window.addEventListener('DOMContentLoaded', async function(e) {
    fn_init();

    fn_createSmptPrfmncGrid();
    fn_createSmptPrfmncGrid1()
  });

  const fn_createSmptPrfmncGrid = async function() {
    var SBGridPropertiesGdsInvntr = {};
    SBGridPropertiesGdsInvntr.parentid = 'sb-area-종자단가';
    SBGridPropertiesGdsInvntr.id = 'grdGdsInvntr';
    SBGridPropertiesGdsInvntr.jsonref = 'jsonGrdGdsInvntr';
    SBGridPropertiesGdsInvntr.emptyrecords = '데이터가 없습니다.';
    SBGridPropertiesGdsInvntr.columns = [
      {caption: ["처리"],
        ref: 'itemCd',
        type:'button',
        width:'5%',
        style: 'text-align:center',
        renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
            return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
        }},
      {caption: '정산년도',ref: 'clclnY',width: '8%',type: 'output', style: 'text-align:center'},
      {caption: '차수',ref: 'clclnNo',width: '8%',type: 'output', style: 'text-align:center'},
      {caption: '정산구분',ref: 'crtrCd',width: '8%',type: 'combo',typeinfo : {ref:'comboData1', label:'label', value:'value', oneclickedit: true}, style: 'text-align:center'},
      {caption: '정산분류',ref: 'crtrCd1',width: '8%',type: 'combo',typeinfo : {ref:'comboData2', label:'label', value:'value', oneclickedit: true}, style: 'text-align:center'},
      {caption: '종자명',ref: 'crtrNm',width: '15%',type: 'combo',typeinfo : {ref:'comboData3', label:'label', value:'value', oneclickedit: true}, style: 'text-align:center'},
      {caption: '단가',ref: 'pay',width: '8%',type: 'output', style: 'text-align:center'},
      {caption: '비고',ref: 'rmrk',width: '40%',type: 'output', style: 'text-align:center'},
    ]
    grdGdsInvntr = _SBGrid.create(SBGridPropertiesGdsInvntr);
  }

  const fn_createSmptPrfmncGrid1 = async function() {
    var SBGridPropertiesGdsInvntr = {};
    SBGridPropertiesGdsInvntr.parentid = 'sb-area-등급단가';
    SBGridPropertiesGdsInvntr.id = 'grdGdsInvntr1';
    SBGridPropertiesGdsInvntr.jsonref = 'jsonGrdGdsInvntr1';
    SBGridPropertiesGdsInvntr.emptyrecords = '데이터가 없습니다.';
    SBGridPropertiesGdsInvntr.columns = [
      {caption: ["처리"],
        ref: 'itemCd',
        type:'button',
        width:'5%',
        style: 'text-align:center',
        renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
          return "<button type='button' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
        }},
      {caption: '정산년도',ref: 'clclnY',width: '8%',type: 'output', style: 'text-align:center'},
      {caption: '차수',ref: 'clclnNo',width: '8%',type: 'output', style: 'text-align:center'},
      {caption: '정산구분',ref: 'crtrCd',width: '8%',type : 'combo',typeinfo : {ref:'comboData1', label:'label', value:'value', oneclickedit: true}, style: 'text-align:center'},
      {caption: '정산분류',ref: 'crtrCd1',width: '8%',type: 'combo',typeinfo : {ref:'comboData2', label:'label', value:'value', oneclickedit: true}, style: 'text-align:center'},
      {caption: '입고등급',ref: 'crtrNm',width: '15%',type: 'combo',typeinfo : {ref:'comboData4', label:'label', value:'value', oneclickedit: true}, style: 'text-align:center'},
      {caption: '단가',ref: 'pay',width: '8%',type: 'output', style: 'text-align:center'},
      {caption: '비고',ref: 'rmrk',width: '40%',type: 'output', style: 'text-align:center'},
    ]
    grdGdsInvntr1 = _SBGrid.create(SBGridPropertiesGdsInvntr);
  }


  const fn_init = async function(){
    SBUxMethod.set("srch-dtp-clclnY",gfn_dateToYear(new Date()));
    SBUxMethod.set("clclnNo","1");
  }
  const fn_search = async function(){
    jsonGrdGdsInvntr = [
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "만생",
        crtrCd1 : "관내",
        crtrNm : "뉴마르스",
        pay : "120,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "만생",
        crtrCd1 : "관내",
        crtrNm : "카타마루",
        pay : "120,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "만생",
        crtrCd1 : "관내",
        crtrNm : "케드스타",
        pay : "100,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "만생",
        crtrCd1 : "관내",
        crtrNm : "페가수스",
        pay : "105,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "조생",
        crtrCd1 : "구미하우스",
        crtrNm : "에이스",
        pay : "90,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "조생",
        crtrCd1 : "구미하우스",
        crtrNm : "체인지업",
        pay : "125,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "조생",
        crtrCd1 : "구미하우스",
        crtrNm : "조생에이스",
        pay : "120,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "조생",
        crtrCd1 : "구미하우스",
        crtrNm : "하이키타플러스",
        pay : "150,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "조생",
        crtrCd1 : "전라도",
        crtrNm : "썬파워",
        pay : "82,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "조생",
        crtrCd1 : "전라도",
        crtrNm : "옥풍",
        pay : "110,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "조생",
        crtrCd1 : "전라도",
        crtrNm : "쌩쌩볼",
        pay : "85,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "조생",
        crtrCd1 : "전라도",
        crtrNm : "케이파워",
        pay : "100,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "조생",
        crtrCd1 : "전라도",
        crtrNm : "젤빠른",
        pay : "125,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "조생",
        crtrCd1 : "전라도",
        crtrNm : "신나는",
        pay : "135,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "조생",
        crtrCd1 : "전라도",
        crtrNm : "하마에미",
        pay : "170,000"
      },
      {
        clclnY : 2024,
        clclnNo : 1,
        crtrCd : "조생",
        crtrCd1 : "전라도",
        crtrNm : "하미노타키라",
        pay : "155,000"
      },
    ]
    grdGdsInvntr.rebuild();

      jsonGrdGdsInvntr1 =[
          {
              clclnY: 2024,
              clclnNo: 1,
              crtrCd : "만생",
              crtrCd1 : "관내",
              crtrNm : "1등급",
              pay : "13,700"
          },
          {
              clclnY: 2024,
              clclnNo: 1,
              crtrCd : "만생",
              crtrCd1 : "관내",
              crtrNm : "2등급",
              pay : "10,960"
          },
          {
              clclnY: 2024,
              clclnNo: 1,
              crtrCd : "만생",
              crtrCd1 : "관내",
              crtrNm : "소구",
              pay : "5,480"
          },
          {
              clclnY: 2024,
              clclnNo: 1,
              crtrCd : "만생",
              crtrCd1 : "관내",
              crtrNm : "기형",
              pay : "5,480"
          },
          {
              clclnY: 2024,
              clclnNo: 1,
              crtrCd : "만생",
              crtrCd1 : "관내",
              crtrNm : "적색 1등급",
              pay : "13,700"
          },
          {
              clclnY: 2024,
              clclnNo: 1,
              crtrCd : "만생",
              crtrCd1 : "관내",
              crtrNm : "적색 2등급",
              pay : "10,960"
          },
          {
              clclnY: 2024,
              clclnNo: 1,
              crtrCd : "만생",
              crtrCd1 : "관내",
              crtrNm : "적색 소구",
              pay : "5,480"
          },
          {
              clclnY: 2024,
              clclnNo: 1,
              crtrCd : "만생",
              crtrCd1 : "관내",
              crtrNm : "적색 기형",
              pay : "5,480"
          },
      ]
      grdGdsInvntr1.rebuild();
  }


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
