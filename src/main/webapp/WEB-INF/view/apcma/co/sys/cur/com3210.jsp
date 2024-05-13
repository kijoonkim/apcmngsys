<%
    /**
     * @Class Name        : com3210.jsp
     * @Description    : 환율정보 화면
     * @author            : 인텔릭아이앤에스
     * @since            : 2024.05.13
     * @version        : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.05.13   	표주완		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 환율정보</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
</head>
<body>

<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3><!-- 통화정보 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="신규"
                             class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"
                             onclick="fn_save"></sbux-button>
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회"
                             class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
            </div>
        </div>

        <sbux-tabs id="idxTab_norm" name="tab_norm" uitype="inbox"
                   is-scrollable="false"
                   title-target-id-array="SBUx_JS^SBUx_IDE^SBUx_TERM"
                   title-text-array="일별환율^평균환율^기간별환율">
        </sbux-tabs>

        <div class="tab-content">
            <div id="SBUx_DATE" style="display: block">
                <div class="box-body">
                    <!--[pp] 검색 -->
                    <table class="table table-bordered tbl_fixed">
                        <caption>검색 조건 설정</caption>
                        <colgroup>
                            <col style="width: 5%">
                            <col style="width: 8%">
                            <col style="width: 3%">
                            <col style="width: 7%">
                            <col style="width: 6%">
                            <col style="width: 3%">
                            <col style="width: 7%">
                            <col style="width: 6%">
                            <col style="width: 3%">
                            <col style="width: 6%">
                            <col style="width: 7%">
                            <col style="width: 6%">

                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">법인</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="srch-nation-bi"
                                        name="srch-nation-bi"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonApcBx"
                                        readonly
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">통화</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="COLCURRENCY_CODE"
                                        name="COLCURRENCY_CODE"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonApcBx"
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">고시회차</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="COLEXCHANGE_SEQ"
                                        name="COLEXCHANGE_SEQ"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonApcBx"
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <td class="td_input td_input_dtl" style="border-left:hidden">
                                <sbux-button
                                        uitype="normal" id="srch-btn-mail" name="srch-btn-mail"
                                        class="btn btn-sm btn-outline-danger" text="메일링 리스트" onclick="">
                                </sbux-button>
                            </td>
                            <td class="td_input td_input_dtl" style="border-left:hidden">
                                <sbux-button
                                        uitype="normal" id="srch-btn-external" name="srch-btn-external"
                                        class="btn btn-sm btn-outline-danger" text="환율(외부)가져오기" onclick="">
                                </sbux-button>
                            </td>
                            <td class="td_input td_input_dtl" style="border-left:hidden">
                                <sbux-button
                                        uitype="normal" id="srch-btn-request" name="srch-btn-request"
                                        class="btn btn-sm btn-outline-danger" text="환율요청" onclick="">
                                </sbux-button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">기준일자</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-datepicker uitype="popup" id="picker_inline1"
                                                 name="picker_inline1" date-format="yyyy-mm-dd"
                                                 class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
                                <span> ~ </span>
                                <sbux-datepicker uitype="popup" id="picker_inline2"
                                                 name="picker_inline2" date-format="yyyy-mm-dd"
                                                 class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"/>
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">서비스</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="SERVICE"
                                        name="SERVICE"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonApcBx"
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">FBS대상</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="FBS"
                                        name="FBS"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonApcBx"
                                />
                            </td>
                            <td style="border-right: hidden;">&nbsp;</td>
                            <th scope="row" class="th_bg">사용여부</th>
                            <td class="td_input" style="border-right: hidden;">
                                <sbux-select
                                        unselected-text="전체"
                                        uitype="single"
                                        id="USE_YN"
                                        name="USE_YN"
                                        class="form-control input-sm"
                                        jsondata-ref="jsonApcBx"
                                />
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="ad_tbl_top2">
                        <ul class="ad_tbl_count">
                            <li>
                                <span>지급기준 관리</span>
                            </li>
                        </ul>
                        <div class="ad_tbl_toplist">
                            <sbux-button
                                    id="btnDel"
                                    name="btnDel"
                                    uitype="normal"
                                    text="행삭제"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_delRow"
                                    style="float: right;"
                            >
                            </sbux-button>
                            <sbux-button
                                    id="btnAdd"
                                    name="btnAdd"
                                    uitype="normal"
                                    text="행추가"
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_addRow"
                                    style="float: right;"
                            ></sbux-button>
                            <sbux-button
                                    id="btmCopyClear"
                                    name="btmCopyClear"
                                    uitype="normal"
                                    text="복사해제모드" <%--그리드 복사 불가. 붙여넣기 불가.--%>
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_gridCopyClear"
                                    style="float: right; display: block"
                            ></sbux-button>
                            <sbux-button
                                    id="btmCopyLine"
                                    name="btmCopyLine"
                                    uitype="normal"
                                    text="행복사모드" <%--행단위로 복사--%>
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_gridCopyLine"
                                    style="float: right; display: none;"
                            ></sbux-button>
                            <sbux-button
                                    id="btmCopyCell"
                                    name="btmCopyCell"
                                    uitype="normal"
                                    text="셀복사모드" <%--셀단위로 복사--%>
                                    class="btn btn-sm btn-outline-danger"
                                    onclick="fn_gridCopyCell"
                                    style="float: right; display: none;"
                            ></sbux-button>
                            </sbux-button>
                        </div>
                    </div>

                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-grdGvwDailyMsg" style="height:283px;"></div>
                    </div>
                </div>
            </div>
            <div id="SBUx_AVERAGE" style="display: none">
                <p>SBUx IDE 를 사용하여 손쉽게 개발하실 수 있습니다.(eclipse plug-in)</p>
            </div>
            <div id="SBUx_TERM" style="display: none">
                <p>SBGrid Version 2.1 을 많은 레퍼런스를 가진 제품입니다.</p>
            </div>
        </div>


    </div>
</section>
</body>
<script type="text/javascript">

    // ${comMenuVO.menuId}

    var jsonBaseCurrency = []; //기준통화 [ L_COM001 ]
    //var jsonCurrencyCode = []; //통화 [ L_COM001 ]

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    const fn_init = async function() {

        let rst = await Promise.all([
            //지역
            gfnma_setComSelect(['grdFimList'], jsonBaseCurrency, 'L_COM045', '', '', 'currency_code', 'currency_name', 'Y', ''),
        ]);

        fn_createGrid('clear');
    }

    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdGvwDailyMsg';
        SBGridProperties.id = 'gvwDaily';
        SBGridProperties.jsonref = 'jsonGvwDailyList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        SBGridProperties.explorerbar = 'sortmove';
        SBGridProperties.rowheader = 'seq';
        SBGridProperties.rowheadercaption = {seq: 'No'};
        SBGridProperties.rowheaderwidth = {seq: '60'};
        SBGridProperties.extendlastcol = 'scroll';
        /* SBGridProperties.paging = {
             'type': 'page',
             'count': 5,
             'size': 20,
             'sorttype': 'page',
             'showgoalpageui': true
         };*/
        SBGridProperties.columns = [
            {caption : ['이미지'], ref : 'name', width : '80px',	style : 'text-align:center',	type : 'image',
                typeinfo : {imageuri : '/static/images/ma/check.png', imagewidth : '30'}},
            {caption : ["기준통화"], ref : 'BASE_CURRENCY', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {
                    ref : 'jsonBaseCurrency',
                    displayui : true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption : ['기준일자'],	ref : 'BASE_DATE',	width : '120px',	style : 'text-align:center',	type : 'datepicker',	typeinfo : {dateformat :'yy-mm-dd'}},
            {caption: ["고시회차"], ref: 'EXCHANGE_SEQ', type: 'input', width: '100px', style: 'text-align:left'},
            {caption : ["통화"], ref : 'CURRENCY_CODE', width : '100px', style : 'text-align:center', type : 'combo', disabled: true,
                typeinfo : {
                    ref : 'jsonBaseCurrency',
                    displayui : true,
                    label : 'label',
                    value : 'value'
                }
            },
            {caption: ["비고"], ref: 'REMARK', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["환산기준"], ref: 'EXCHANGE_BASE_SCALE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["매매기준율"], ref: 'SLE_BSE_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["송금받을때"], ref: 'RCV_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["송금보낼때"], ref: 'SND_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["현찰팔때"], ref: 'SLE_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["현찰살때"], ref: 'BUY_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["T/C매도율"], ref: 'TC_SLE_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["대미환산율"], ref: 'USA_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["전신환 매입율"], ref: 'TT_BUY_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["전신환 매도율"], ref: 'TT_SLE_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["전신환 우대매입율"], ref: 'TT_BUY_PRM_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["전신환 우대매도율"], ref: 'TT_SLE_PRM_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["LIBOR 1개월"], ref: 'LIBOR_M1_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["LIBOR 3개월"], ref: 'LIBOR_M3_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["LIBOR 1년"], ref: 'LIBOR_Y1_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["환가료 1년"], ref: 'EX_COM_Y1_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["환가료 1개월"], ref: 'EX_COM_M1_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["환가료 3개월"], ref: 'EX_COM_M3_EX_RATE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["사용자 환율1"], ref: 'USER_EXCHANGE_RATE1', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["사용자 환율2"], ref: 'USER_EXCHANGE_RATE2', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["사용자 환율3"], ref: 'USER_EXCHANGE_RATE3', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["데이타구분"], ref: 'DATA_TYPE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["펌뱅킹서비스"], ref: 'FBS_SERVICE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["은행코드"], ref: 'BANK_CODE', type: 'input', width: '100px', style: 'text-align:left'},
        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        /*gvwInfoGrid.bind('click', 'fn_view');*/
        /* gvwInfoGrid.bind('beforepagechanged', 'fn_pagingComMsgList');*/
    }


    // 행 추가
    const fn_addRow = function () {
        let rowVal = gvwInfoGrid.getRow();

        if (rowVal == -1){ //데이터가 없고 행선택이 없을경우.

            gvwInfoGrid.addRow(true);
        }else{
            gvwInfoGrid.insertRow(rowVal);
        }
        //grdFimList.refresh();
    }

    // 행삭제
    const fn_delRow = async function () {

        let rowVal = gvwInfoGrid.getRow();

        if (rowVal == -1) {

            gfn_comAlert("W0003", "행삭제");			// W0003	{0}할 대상이 없습니다.
            return;
        } else {

            gvwInfoGrid.deleteRow(rowVal);

        }

    }

    const fn_gridCopyClear = function (){ /*셀복사 해제 (복사해제모드)*/
        $('#btmCopyClear').hide();
        $('#btmCopyLine').show();
        $('#btmCopyCell').hide();

        /*grdFimList.bind('selectmode', 'free');*/

        let datas = grdFimList.getGridDataAll();
        _SBGrid.destroy('grdFimList');

        let line = 'line'; //그리드 프로퍼티스 라인모드

        fn_createGrid(line, datas);


    }
    const fn_gridCopyLine = function () { /*행복사 (행복사모드)*/
        $('#btmCopyClear').hide();
        $('#btmCopyLine').hide();
        $('#btmCopyCell').show();

        let datas = grdFimList.getGridDataAll();
        _SBGrid.destroy('grdFimList');

        let cell = 'cell'; //그리드 프로퍼티스 셀모드

        fn_createGrid(cell, datas);

    }
    const fn_gridCopyCell = function () { /*셀복사 (셀복사모드)*/
        $('#btmCopyClear').show();
        $('#btmCopyLine').hide();
        $('#btmCopyCell').hide();

        let datas = grdFimList.getGridDataAll();
        _SBGrid.destroy('grdFimList');

        let clear = 'clear'; //그리드 프로퍼티스 클리어모드

        fn_createGrid(clear, datas);
    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
