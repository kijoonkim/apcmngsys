<%
    /**
     * @Class Name        : sys3200.jsp
     * @Description       : 관리번호 채번 정보 화면
     * @author            : 인텔릭아이앤에스
     * @since             : 2024.05.14
     * @version           : 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.05.14   	표주완		최초 생성
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
    <title>title : 관리번호 채번 정보</title>
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
                </h3><!-- 국가정보 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button id="btnCreate" name="btnCreate" uitype="normal" text="신규"
                             class="btn btn-sm btn-outline-danger" onclick="fn_create"></sbux-button>
                <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-sm btn-outline-danger"
                             onclick="fn_save"></sbux-button>
                <!--
                <sbux-button id="btnDelete" name="btnDelete" 	uitype="normal" text="삭제" class="btn btn-sm btn-outline-danger" onclick="fn_delete"></sbux-button>
                 -->
                <sbux-button id="btnSearch" name="btnSearch" uitype="normal" text="조회"
                             class="btn btn-sm btn-outline-danger" onclick="fn_search"></sbux-button>
            </div>
        </div>

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
                <th scope="row" class="th_bg">채번그룹</th>
                <td colspan="" class="td_input" style="border-right:hidden;">
                    <sbux-select
                            unselected-text="전체"
                            uitype="single"
                            id="srch-numbering_group"
                            name="srch-numbering_group"
                            class="form-control input-sm"
                            jsondata-ref="jsonGroup"
                            readonly
                    />
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">채번 ID</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="search_numbering_id" uitype="text" style="width:200px" placeholder=""
                                class="form-control input-sm"></sbux-input>
                </td>
                <td style="border-right: hidden;">&nbsp;</td>
                <td style="border-right: hidden;">&nbsp;</td>
                <th scope="row" class="th_bg">채번명</th>
                <td class="td_input" style="border-right:hidden;">
                    <sbux-input id="search_numbering_name" uitype="text" style="width:200px" placeholder=""
                                class="form-control input-sm"></sbux-input>
                </td>
                </td>
            </tr>
            </tbody>
        </table>


        <div class="row">
            <div class="col-sm-4">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>소수점 유형 리스트</span>
                            <span style="font-size:12px">(조회건수 <span id="listCount">0</span>건)</span>
                        </li>
                    </ul>
                </div>
                <div>
                    <div id="sb-area-grwInfo" style="height:616px; width:100%;"></div>
                </div>
            </div>

            <div class="col-sm-8">
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>기본정보</span></li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:4%">
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:6%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">채번 ID</th>
                            <td class="td_input">
                                <sbux-input id="NUMBERING_ID" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">채번그룹</th>
                            <td class="td_input">
                                <sbux-select
                                        id="NUMBERING_GROUP"
                                        name="NUMBERING_GROUP"
                                        uitype="single"
                                        jsondata-ref="jsonNumberingGroup"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                ></sbux-select>
                            </td>
                            <th scope="row" class="th_bg">사용여부</th>
                            <td class="td_input">
                                <sbux-checkbox id="USE_YN" name="USE_YN" uitype="normal" true-value="Y"
                                               false-value="N"></sbux-checkbox>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">채 번 명</th>
                            <td colspan="3" class="td_input">
                                <sbux-input id="NUMBERING_NAME" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">채번길이</th>
                            <td class="td_input">
                                <sbux-input id="NUMBER_LENGTH" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">비고</th>
                            <td colspan="3" class="td_input">
                                <sbux-input id="descr" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">자동채번여부</th>
                            <td class="td_input">
                                <sbux-checkbox id="AUTO_NUM_YN" name="AUTO_NUM_YN" uitype="normal" true-value="Y"
                                               false-value="N"></sbux-checkbox>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>채번 구성 정보</span></li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:4%">
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:6%">
                            <col style="width:4%">
                            <col style="width:6%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">채번요소1</th>
                            <td class="td_input">
                                <sbux-select
                                        id="NUMBER_ELEMENT1"
                                        name="NUMBER_ELEMENT1"
                                        uitype="single"
                                        jsondata-ref="jsonNumberElement1"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                ></sbux-select>
                            </td>
                            <th scope="row" class="th_bg">채번요소값1</th>
                            <td class="td_input">
                                <sbux-input id="NUMBER_VALUE1" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소1</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_ELEMENT1" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소값1</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_VALUE1" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">채번요소2</th>
                            <td class="td_input">
                                <sbux-select
                                        id="NUMBER_ELEMENT2"
                                        name="NUMBER_ELEMENT2"
                                        uitype="single"
                                        jsondata-ref="jsonNumberElement2"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                ></sbux-select>
                            </td>
                            <th scope="row" class="th_bg">채번요소값2</th>
                            <td class="td_input">
                                <sbux-input id="NUMBER_VALUE2" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소2</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_ELEMENT2" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소값2</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_VALUE2" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">채번요소3</th>
                            <td class="td_input">
                                <sbux-select
                                        id="NUMBER_ELEMENT3"
                                        name="NUMBER_ELEMENT3"
                                        uitype="single"
                                        jsondata-ref="jsonNumberElement3"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                ></sbux-select>
                            </td>
                            <th scope="row" class="th_bg">채번요소값3</th>
                            <td class="td_input">
                                <sbux-input id="NUMBER_VALUE3" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소3</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_ELEMENT3" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소값3</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_VALUE3" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">채번요소4</th>
                            <td class="td_input">
                                <sbux-select
                                        id="NUMBER_ELEMENT4"
                                        name="NUMBER_ELEMENT4"
                                        uitype="single"
                                        jsondata-ref="jsonNumberElement4"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                ></sbux-select>
                            </td>
                            <th scope="row" class="th_bg">채번요소값4</th>
                            <td class="td_input">
                                <sbux-input id="NUMBER_VALUE4" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소4</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_ELEMENT4" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소값4</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_VALUE4" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">채번요소5</th>
                            <td class="td_input">
                                <sbux-select
                                        id="NUMBER_ELEMENT5"
                                        name="NUMBER_ELEMENT5"
                                        uitype="single"
                                        jsondata-ref="jsonNumberElement5"
                                        unselected-text="전체"
                                        class="form-control input-sm"
                                ></sbux-select>
                            </td>
                            <th scope="row" class="th_bg">채번요소값5</th>
                            <td class="td_input">
                                <sbux-input id="NUMBER_VALUE5" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소5</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_ELEMENT5" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">접미요소값5</th>
                            <td class="td_input">
                                <sbux-input id="SURFIX_VALUE5" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">시작채번연번</th>
                            <td class="td_input">
                                <sbux-input id="START_SERNO" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                            <th scope="row" class="th_bg">고유일련번호</th>
                            <td class="td_input">
                                <sbux-checkbox id="UNIQUE_YN" name="UNIQUE_YN" uitype="normal" true-value="Y"
                                               false-value="N"></sbux-checkbox>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>채번 샘플 보기</span></li>
                    </ul>
                </div>
                <div>
                    <table class="table table-bordered tbl_fixed">
                        <colgroup>
                            <col style="width:15%">
                            <col style="width:30%">
                        </colgroup>
                        <tr>
                            <th scope="row" class="th_bg">
                                <sbux-button id="btnSearchNumSP" name="btnSearchNumSP" uitype="normal" text="채번 샘플 보기"
                                             class="btn btn-sm btn-outline-danger"
                                             onclick="fn_searchFcltList"></sbux-button>
                            </th>
                            <td class="td_input">
                                <sbux-input id="numberSample" class="form-control input-sm" uitype="text" required
                                            style="width:100%"></sbux-input>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li><span>채번 이력</span></li>
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
                    </div>
                </div>
                <div>
                    <div class="table-responsive tbl_scroll_sm">
                        <div id="sb-area-gvwHistory" style="height:283px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>

<!-- inline scripts related to this page -->
<script type="text/javascript">

    // common ---------------------------------------------------
    var p_formId = gfnma_formIdStr('${comMenuVO.pageUrl}');
    var p_menuId = '${comMenuVO.menuId}';
    //-----------------------------------------------------------

    var editType = "N"; //신규, 수정 구분 ( N : 신규 , E : 수정 )

    //grid 초기화
    var gvwInfoGrid; 			    // 그리드를 담기위한 객체 선언      ( 채번리스트 )
    var jsonGvwInfoList = []; 	    // 그리드의 참조 데이터 주소 선언   ( 채번리스트 )
    var gvwHistoryGrid;	            // 그리드를 담기위한 객체 선언      ( 채번이력 )
    var jsonGvwHistoryList = []; 	// 그리드의 참조 데이터 주소 선언   ( 채번이력 )


    // only document
    window.addEventListener('DOMContentLoaded', function (e) {

        fn_init();

    });

    const fn_init = async function () {

        fn_createGrid();
        fn_createHistoryGrid();
        fn_search();
    }

    function fn_createGrid() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grwInfo';
        SBGridProperties.id = 'gvwInfoGrid';
        SBGridProperties.jsonref = 'jsonGvwInfoList';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'byrow';
        SBGridProperties.allowcopy = true; //복사
        SBGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        SBGridProperties.explorerbar = 'sortmove';
        /* SBGridProperties.rowheader = 'seq';*/
        /*SBGridProperties.rowheadercaption = {seq: 'No'};*/
        /*SBGridProperties.rowheaderwidth = {seq: '60'};*/
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.columns = [
            {caption: ["소수유형ID"], ref: 'DECIMAL_ID', type: 'input', width: '150px', style: 'text-align:left'},
            {caption: ["소수유형명"], ref: 'DECIMAL_NAME', type: 'input', width: '200px', style: 'text-align:left'},
            {caption: ["소수자리수"], ref: 'DECIMAL_LENGTH', type: 'input', width: '150px', style: 'text-align:left'},
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
            }
        ];

        gvwInfoGrid = _SBGrid.create(SBGridProperties);
        //gvwInfoGrid.bind('click', 'fn_view');
        /* gvwInfoGrid.bind('beforepagechanged', 'fn_pagingComMsgList');*/
    }

    function fn_createHistoryGrid() {
        var SBHistoryGridProperties = {};
        SBHistoryGridProperties.parentid = 'sb-area-gvwHistory';
        SBHistoryGridProperties.id = 'gvwHistoryGrid';
        SBHistoryGridProperties.jsonref = 'jsonGvwHistoryList';
        SBHistoryGridProperties.emptyrecords = '데이터가 없습니다.';
        SBHistoryGridProperties.selectmode = 'byrow';
        SBHistoryGridProperties.allowcopy = true; //복사
        SBHistoryGridProperties.allowpaste = true; //붙여넣기( true : 가능 , false : 불가능 )
        SBHistoryGridProperties.explorerbar = 'sortmove';
        /* SBGridProperties.rowheader = 'seq';*/
        /*SBGridProperties.rowheadercaption = {seq: 'No'};*/
        /*SBGridProperties.rowheaderwidth = {seq: '60'};*/
        SBHistoryGridProperties.extendlastcol = 'scroll';
        SBHistoryGridProperties.columns = [
            {caption: ["소수유형ID"], ref: 'DECIMAL_ID', type: 'input', width: '150px', style: 'text-align:left'},
            {caption: ["소수유형명"], ref: 'DECIMAL_NAME', type: 'input', width: '200px', style: 'text-align:left'},
            {caption: ["소수자리수"], ref: 'DECIMAL_LENGTH', type: 'input', width: '150px', style: 'text-align:left'},
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
            }
        ];

        gvwHistoryGrid = _SBGrid.create(SBHistoryGridProperties);
        //gvwHistoryGrid.bind('click', 'fn_view');
        /* gvwInfoGrid.bind('beforepagechanged', 'fn_pagingComMsgList');*/
    }


</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
