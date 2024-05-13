<%
    /**
     * @Class Name        : com3200.jsp
     * @Description    : 통화정보 화면
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
    <title>title : 통화정보</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
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
        <div class="box-body">

            <!--[pp] 검색 -->
            <table class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">

                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">

                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">통화코드</th>
                    <td colspan="" class="td_input" style="border-right:hidden;">
                        <sbux-input
                                id="CURRENCY_CODE"
                                uitype="text" style="width:200px"
                                placeholder=""
                                class="form-control input-sm">

                        </sbux-input>
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg">통화명</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input
                                id="CURRENCY_NAME"
                                uitype="text" style="width:200px"
                                placeholder=""
                                class="form-control input-sm">

                        </sbux-input>
                    </td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <td style="border-right: hidden;">&nbsp;</td>
                    <th scope="row" class="th_bg" style="display: none"></th>
                    <td class="td_input" style="border-right: hidden;">
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="ad_tbl_top2">
                <ul class="ad_tbl_count">
                    <li>
                        <span>통화정보</span>
                        <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
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
                    </sbux-button>
                </div>
            </div>
            <div class="table-responsive tbl_scroll_sm">
                <div id="sb-area-grdComMsg" style="height:283px;"></div>
            </div>
        </div>
    </div>
</section>
</body>

<script type="text/javascript">

    // ${comMenuVO.menuId}

    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_createGrid();

    });

    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdComMsg';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonGvwInfoList';
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
            {caption: ["통화코드"],     ref: 'COLCURRENCY_CODE', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["통화명"],      ref: 'COLCURRENCY_NAME', type: 'input', width: '200px', style: 'text-align:left'},
            {caption: ["통화명(한글)"], ref: 'COLCURRENCY_NAME_CHN', type: 'input', width: '200px', style: 'text-align:left'},
            {
                caption: ["사용여부"], ref: 'USE_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {
                    ignoreupdate: true,
                    fixedcellcheckbox: {
                        usemode: true,
                        rowindex: 1,
                        deletecaption: false
                    },
                    checkedvalue: 'Y',
                    uncheckedvalue: 'N'
                }
            },
            {
                caption: ["펌뱅킹 여부"], ref: 'FBS_YN', type: 'checkbox', width: '100px', style: 'text-align:center',
                typeinfo: {
                    ignoreupdate: true,
                    fixedcellcheckbox: {
                        usemode: true,
                        rowindex: 1,
                        deletecaption: false
                    },
                    checkedvalue: 'Y',
                    uncheckedvalue: 'N'
                }
            },
            {caption: ["심볼"], ref: 'CURR_SYMBOL', type: 'input', width: '120px', style: 'text-align:left'},
            {caption: ["소수점자리"], ref: 'DECIMAL_LENGTH', type: 'input', width: '120px', style: 'text-align:left'},
            {caption: ["환산기준단위"], ref: 'EXCHANGE_BASE_SCALE', type: 'input', width: '150px', style: 'text-align:left'},
            {caption: ["정렬순서"], ref: 'SORT_SEQ', type: 'input', width: '100px', style: 'text-align:left'},
            {caption: ["비고"], ref: 'MEMO', type: 'input', width: '200px', style: 'text-align:left'}
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

    //신규 작성
    function fn_create() {

    }

    //저장
    const fn_save = async function () {

    }

    /**
     * 목록 조회
     */
    const fn_search = async function () {

    }

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
