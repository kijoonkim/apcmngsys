<%
    /**
     * @Class Name : clclnCrtrMng.jsp
     * @Description : 정산기준관리 화면
     * @author SI개발부
     * @since 2024.08.31
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.08.31   	신정철			최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <style>
        .th_bg{
            padding: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별실적등록 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btn-reset"
                        name="btn-reset"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="초기화"
                        onclick="fn_reset"
                ></sbux-button>
                <sbux-button
                        id="btn-search"
                        name="btn-search"
                        uitype="normal"
                        class="btn btn-sm btn-outline-dark"
                        onclick="fn_onchangeYmd"
                        text="조회"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <!--[APC] START -->
            <%@ include file="../../../frame/inc/apcSelect.jsp" %>
            <!--[APC] END -->
            <table class="table table-bordered tbl_fixed" style="margin-bottom: 10px;">
                <colgroup>
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 3%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 6%">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row" class="th_bg">
                            조회구분
                        </th>
                        <td class="td_input" style="border-right: hidden">
                            <sbux-select unselected-text="전체" uitype="single" id="srch-slt-itemCd" name="srch-slt-itemCd" class="form-control input-sm" jsondata-ref="jsonComItem" onchange="fn_selectItem"></sbux-select>
                        </td>
                        <td colspan="11" style="border-top: hidden"></td>
                    </tr>
                </tbody>
            </table>
            <div class="content-wrap" style="display: flex">
                <div id="sb-area-wrhspaner" style="flex-basis: 70%; padding: 0px 10px"></div>
                <div id="infoTable" style="flex: 1; padding: 0px 10px">
                    <table>
                        <colgroup>
                            <col style="width: 30%">
                            <col style="width: 30%">
                            <col style="width: 40%">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th colspan="2" scope="row" class="th_bg" style="background-color: #bdd7ee;font-weight: bold">
                                    창고
                                </th>
                                <th scope="row" class="th_bg">
                                    1호실
                                </th>
                            </tr>
                            <tr>
                                <th colspan="2" scope="row" class="th_bg" style="background-color: #bdd7ee;font-weight: bold">
                                    위치
                                </th>
                                <th scope="row" class="th_bg">
                                    ???
                                </th>
                            </tr>
                            <tr>
                                <th colspan="2" scope="row" class="th_bg" style="background-color: #bdd7ee;font-weight: bold">
                                    총 수량
                                </th>
                                <td class="td_input">
                                    352
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="3" scope="row" class="th_bg" style="font-weight: bold; text-align: center;border: 1px solid">
                                    3단
                                </th>
                                <th scope="row" class="th_bg" style="font-weight: bold">
                                    수량
                                </th>
                                <td class="td_input">
                                    80
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg" style="font-weight: bold">
                                    입고일자
                                </th>
                                <td class="td_input">
                                    2024-09-20
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg" style="font-weight: bold">
                                    생산자
                                </th>
                                <td class="td_input">
                                    홍길동
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="3" scope="row" class="th_bg" style="font-weight: bold; text-align: center;border: 1px solid">
                                    2단
                                </th>
                                <th scope="row" class="th_bg" style="font-weight: bold">
                                    수량
                                </th>
                                <td class="td_input">
                                    80
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg" style="font-weight: bold">
                                    입고일자
                                </th>
                                <td class="td_input">
                                    2024-09-20
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg" style="font-weight: bold">
                                    생산자
                                </th>
                                <td class="td_input">
                                    홍길동
                                </td>
                            </tr>
                            <tr>
                                <th rowspan="3" scope="row" class="th_bg" style="font-weight: bold; text-align: center;border: 1px solid">
                                    1단
                                </th>
                                <th scope="row" class="th_bg" style="font-weight: bold">
                                    수량
                                </th>
                                <td class="td_input">
                                    80
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg" style="font-weight: bold">
                                    입고일자
                                </th>
                                <td class="td_input">
                                    2024-09-20
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg" style="font-weight: bold">
                                    생산자
                                </th>
                                <td class="td_input">
                                    홍길동
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="th_bg" colspan="2" style="background-color: #bdd7ee;font-weight: bold">
                                    위치 합계
                                </th>
                                <td class="td_input">
                                    208
                                </td>
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

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    const fn_init = function(){
        fn_createGrid();
    }

    var jsonReport = [{
        col0 : '',
        col1 : '',
        col2 : '',
        col3 : '',
        col4 : '',
        col5 : '',
        col6 : '',
        col7 : '',
        col8 : '',
        col9 : '',
        col10 : '',
        col11 : '',
        col12 : '',
    },{
        col0 : '',
        col1 : '',
        col2 : '',
        col3 : '',
        col4 : '',
        col5 : '',
        col6 : '',
        col7 : '',
        col8 : '',
        col9 : '',
        col10 : '',
        col11 : '',
        col12 : '',
    },{
        col0 : '',
        col1 : '',
        col2 : '',
        col3 : '',
        col4 : '',
        col5 : '',
        col6 : '',
        col7 : '',
        col8 : '',
        col9 : '',
        col10 : '',
        col11 : '',
        col12 : '',
    }];
    var grdReport;

    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-wrhspaner';
        SBGridProperties.id = 'grdReport';
        SBGridProperties.jsonref = 'jsonReport';
        SBGridProperties.fixedrowheight = '10';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.mergecells = 'bycol';
        SBGridProperties.columns = [
            {caption : '',	ref : "col0",	width : '4%',		style : 'text-align:center',	type : 'input'},
            {caption : ['A','A'],	ref : "col1",	width : '8%',		style : 'text-align:center',	type : 'input', merge:false},
            {caption : ['A','A'],	ref : "col2",	width : '8%',		style : 'text-align:center',	type : 'input', },
            {caption : ['B','B'],	ref : "col3",	width : '8%',		style : 'text-align:center',	type : 'input', merge:false},
            {caption : ['B','B'],	ref : "col4",	width : '8%',		style : 'text-align:center',	type : 'input', },
            {caption : ['C','C'],	ref : "col5",	width : '8%',		style : 'text-align:center',	type : 'input', merge:false},
            {caption : ['C','C'],	ref : "col6",	width : '8%',		style : 'text-align:center',	type : 'input', },
            {caption : ['D','D'],	ref : "col7",	width : '8%',		style : 'text-align:center',	type : 'input', merge:false},
            {caption : ['D','D'],	ref : "col8",	width : '8%',		style : 'text-align:center',	type : 'input', },
            {caption : ['E','E'],	ref : "col9",	width : '8%',		style : 'text-align:center',	type : 'input', merge:false},
            {caption : ['E','E'],	ref : "col10",	width : '8%',		style : 'text-align:center',	type : 'input', },
            {caption : ['F','F'],	ref : "col11",	width : '8%',		style : 'text-align:center',	type : 'input', merge:false},
            {caption : ['F','F'],	ref : "col12",	width : '8%',		style : 'text-align:center',	type : 'input', },
        ]
        grdReport = _SBGrid.create(SBGridProperties);
    }

    const fn_search = async function(){

    }
    function formatDateWithDay(date) {
        const month = date.getMonth() + 1;
        const day = date.getDate();

        const daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
        const dayOfWeek = daysOfWeek[date.getDay()];

        return `${'${month}/${day} ${dayOfWeek}'}`
    }

    function getDateRange(date) {
        const result = [];
        const startDate = new Date(date);

        for (let i = -3; i <= 3; i++) {
            const currentDate = new Date(startDate);
            currentDate.setDate(startDate.getDate() + i);
            result.push(formatDateWithDay(currentDate));
            result.push(formatDateWithDay(currentDate));
        }

        return result;
    }
    const fn_onchangeYmd = function(){
        const givenDate = '2024-10-15'; // 주어진 날짜
        const dateRange = getDateRange(givenDate);
        dateRange.push("재고");
        dateRange.unshift("구분");
        console.log(dateRange,"날짜 포맷팅한거 받은거");
        console.log(grdReport.getCaption('array'));

        let prevCaptions = grdReport.getCaption('array')[1];
        let caption = prevCaptions.map((item,index) => [dateRange[index],item]);

        console.log(caption,"포맷끝");
        /** 근본적인 해결이 아님
         * rebuild 하면 원복 단순 조회 페이지니깐 json data바인딩 후에 caption만 바꾸는걸로 **/
        grdReport.setCaption(caption);
        // grdReport.setCaption([newCaptions,newArray]);
        // grdReport.rebuild();
    }



</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>