<%
    /**
     * @Class Name 		: fit2140.jsp
     * @Description 	: 건물등감가상각자산취득명세서 화면
     * @author 			: 인텔릭아이앤에스
     * @since 			: 2024.07.18
     * @version 		: 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      수정내용
     * @ ----------		----------	---------------------------
     * @ 2024.07.18   	이경한		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Title</title><title>title : 건물등감가상각자산취득명세서</title>
    <%@ include file="../../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../../frame/inc/headerScript.jsp" %>
    <style>
        #Sales > table > tbody > tr > td{
            text-align: center;
            border: 1px solid #e8f1f9 !important;
        }
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        input[type="number"] {
            border: hidden;
            text-align: right;
            font-size: 15px;
            width: 100%;
        }
        table[id="신용카드"] td{
            text-align: center;
            border: solid 1px blue;
            padding: 5px;
        }
        #신용카드 > tbody > tr > td:nth-child(1){
            font-size: 15px;
        }
        #신용카드 > tbody > tr:nth-child(1) > td{
            font-size: 15px;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out>
                </h3>
            </div>
        </div>
        <div class="box-body">
            <!-- content_header start -->
            <table class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width: 15%">
                    <col style="width: 10%">
                    <col style="width: 8%">
                    <col style="width: 15%">
                    <col style="width: 10%">
                    <col style="width: 8%">
                    <col style="width: 15%">
                    <col style="width: 10%">
                    <col style="width: 8%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg">법인</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-select id="법인" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">기준연도</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-select id="기준연도" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">신고구분명</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-select id="신고구분명" uitype="single" jsondata-ref="jsonSiteCode" unselected-text="선택" class="form-control input-sm"></sbux-select>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg">신고사업장</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input id="신고사업장" uitype="text" class="form-control input-sm"></sbux-input>
                    </td>
                    <td></td>
                    <th scope="row" class="th_bg">사업자번호</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input id="사업자번호" uitype="text" class="form-control input-sm"></sbux-input>
                    </td>
                    <td colspan="4"></td>
                </tr>
                </tbody>
            </table>
            <div style=" height: 80vh; display: flex">
                <div style="width: 30%;padding: 10px">
                    <div class="ad_tbl_top">
                        <ul class="ad_tbl_count">
                            <li><span>사업장 리스트</span></li>
                        </ul>
                    </div>
                    <div id="사업장리스트그리드" style="width: 100%"></div>
                </div>
                <div id="resizer"style="cursor:ew-resize;background-color: #cbd5e0;height: 100%; width: 2px;display: flex;align-items: center;justify-content: center">
                    <?xml version="1.0" ?><svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><defs><style>.cls-1{fill:none;}</style></defs><title/>
                    <g data-name="Layer 2" id="Layer_2">
                        <path d="M16,7a2,2,0,1,1,2-2A2,2,0,0,1,16,7Zm0-2h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Z" fill="#cbd5e066"/>
                        <path d="M16,18a2,2,0,1,1,2-2A2,2,0,0,1,16,18Zm0-2h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Z" fill="#cbd5e066"/>
                        <path d="M16,29a2,2,0,1,1,2-2A2,2,0,0,1,16,29Zm0-2h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Z" fill="#cbd5e066"/>
                        <path d="M16,40a2,2,0,1,1,2-2A2,2,0,0,1,16,40Zm0-2h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Zm0,0h0Z" fill="#cbd5e066"/>
                    </g><g id="frame"><rect class="cls-1" height="32" width="32"/></g></svg>
                </div>
                <div style="padding: 10px;flex: 1;display: flex;flex-direction: column">
                    <div style="flex: 1">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>제출자 인적사항</span></li>
                            </ul>
                        </div>
                        <table id="신용카드" style="width: 100%; height: auto">
                            <colgroup>
                                <col style="width: 25%">
                                <col style="width: 25%">
                                <col style="width: 25%">
                                <col style="width: 25%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>상호(법인명)</td>
                                    <td><input type="text"/></td>
                                    <td>사업자번호</td>
                                    <td><input type="text"/></td>
                                </tr>
                                <tr>
                                    <td>업태</td>
                                    <td><input type="text"/></td>
                                    <td>종목</td>
                                    <td><input type="text"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="flex: 1">
                        <div style="flex: 1">
                            <div class="ad_tbl_top">
                                <ul class="ad_tbl_count">
                                    <li><span>감가상각자산 취득명세 합계</span></li>
                                </ul>
                            </div>
                            <table id="감가상각자산" style="width: 100%; height: auto">
                                <colgroup>
                                    <col style="width: 25%">
                                    <col style="width: 25%">
                                    <col style="width: 25%">
                                    <col style="width: 25%">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <td>감가상각자산 종류</td>
                                    <td>건&emsp;&emsp;수</td>
                                    <td>공급가액</td>
                                    <td>세&emsp;&emsp;액</td>
                                </tr>
                                <tr>
                                    <td>합&emsp;&emsp;계</td>
                                    <td><input type="number" value="0"/></td>
                                    <td><input type="number" value="0"/></td>
                                    <td><input type="number" value="0"/></td>
                                </tr>
                                <tr>
                                    <td>건물, 구축물</td>
                                    <td><input type="number" value="0"/></td>
                                    <td><input type="number" value="0"/></td>
                                    <td><input type="number" value="0"/></td>
                                </tr>
                                <tr>
                                    <td>기 계 장 치</td>
                                    <td><input type="number" value="0"/></td>
                                    <td><input type="number" value="0"/></td>
                                    <td><input type="number" value="0"/></td>
                                </tr>
                                <tr>
                                    <td>차 량 운 반 구</td>
                                    <td><input type="number" value="0"/></td>
                                    <td><input type="number" value="0"/></td>
                                    <td><input type="number" value="0"/></td>
                                </tr>
                                <tr>
                                    <td>그 밖의 감가상각자산</td>
                                    <td><input type="number" value="0"/></td>
                                    <td><input type="number" value="0"/></td>
                                    <td><input type="number" value="0"/></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div style="flex:1">
                        <div class="ad_tbl_top">
                            <ul class="ad_tbl_count">
                                <li><span>수취구분별 합계</span></li>
                            </ul>
                        </div>
                        <table id="감가상각자산" style="width: 100%; height: auto">
                            <colgroup>
                                <col style="width: 25%">
                                <col style="width: 25%">
                                <col style="width: 25%">
                                <col style="width: 25%">
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>구분</td>
                                <td>건&emsp;&emsp;수</td>
                                <td>공급가액</td>
                                <td>세&emsp;&emsp;액</td>
                            </tr>
                            <tr>
                                <td>합&emsp;&emsp;계</td>
                                <td><input type="number" value="0"/></td>
                                <td><input type="number" value="0"/></td>
                                <td><input type="number" value="0"/></td>
                            </tr>
                            <tr>
                                <td>세금계산서 수취분</td>
                                <td><input type="number" value="0"/></td>
                                <td><input type="number" value="0"/></td>
                                <td><input type="number" value="0"/></td>
                            </tr>
                            <tr>
                                <td>신용카드매출전표 등<br>수취명세서 제출분</td>
                                <td><input type="number" value="0"/></td>
                                <td><input type="number" value="0"/></td>
                                <td><input type="number" value="0"/></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">
    let json사업장리스트 =[];
    let 사업장grid;

    let json메인그리드 = [];
    let 메인grid;

    /** DOM load **/
    window.addEventListener('DOMContentLoaded', function(e) {
        fn_createGrid();
        fn_createGrid2();
    });
    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = '사업장리스트그리드';
        SBGridProperties.id = '사업장리스트그리드';
        SBGridProperties.jsonref = 'json사업장리스트';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['신고사업장명'],               ref : 'check',        width : '50%',    style : 'text-align:center',    type : 'checkbox'},
            {caption : ['사업자번호'],          ref : 'academy',      width : '50%',   style : 'text-align:center',    type : 'input'},
        ];
        사업장grid = _SBGrid.create(SBGridProperties);
    }
    const fn_createGrid2 = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = '메인그리드';
        SBGridProperties.id = '메인그리드';
        SBGridProperties.jsonref = 'json메인그리드';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['NO','NO'], ref : 'check', width : '5%', style : 'text-align:center',    type : 'checkbox'},
            {caption : ['⑩ 카드회원번호','⑩ 카드회원번호'], ref : 'check', width : '20%', style : 'text-align:center',    type : 'checkbox'},
            {caption : ['거래처명','거래처명'], ref : 'check', width : '15%', style : 'text-align:center',    type : 'checkbox'},
            {caption : ['⑪ 공급자 사업자등록번호','⑪ 공급자 사업자등록번호'], ref : 'check', width : '20%', style : 'text-align:center',    type : 'checkbox'},
            {caption : ['⑫ 그 밖의 신용카드 등 거래명세 합계','거래건수'], ref : 'check', width : '10%', style : 'text-align:center',    type : 'checkbox'},
            {caption : ['⑫ 그 밖의 신용카드 등 거래명세 합계','공급가액'], ref : 'check', width : '15%', style : 'text-align:center',    type : 'checkbox'},
            {caption : ['⑫ 그 밖의 신용카드 등 거래명세 합계','세액'], ref : 'check', width : '15%', style : 'text-align:center',    type : 'checkbox'},
        ];
        메인grid = _SBGrid.create(SBGridProperties);
    }
    const resizer = document.getElementById('resizer');
    const leftSide = resizer.previousElementSibling;
    const rightSide = resizer.nextElementSibling;

    let x = 0;
    let y = 0;

    let leftWidth = 0;

    const mouseDownHandler = function (e) {
        x = e.clientX;
        y = e.clientY;
        leftWidth = leftSide.getBoundingClientRect().width;

        document.addEventListener('mousemove', mouseMoveHandler);
        document.addEventListener('mouseup', mouseUpHandler);
    };

    const mouseMoveHandler = function (e) {
        const dx = e.clientX - x;
        const dy = e.clientY - y;

        document.body.style.cursor = 'col-resize';

        leftSide.style.userSelect = 'none';
        leftSide.style.pointerEvents = 'none';

        rightSide.style.userSelect = 'none';
        rightSide.style.pointerEvents = 'none';

        const newLeftWidth = ((leftWidth + dx) * 100) / resizer.parentNode.getBoundingClientRect().width;
        leftSide.style.width = `${'${newLeftWidth}'}%`;
        사업장grid.resize();
        메인grid.resize();
    };

    const mouseUpHandler = function () {
        // resizer.style.removeProperty('cursor');
        document.body.style.removeProperty('cursor');

        leftSide.style.removeProperty('user-select');
        leftSide.style.removeProperty('pointer-events');

        rightSide.style.removeProperty('user-select');
        rightSide.style.removeProperty('pointer-events');

        document.removeEventListener('mousemove', mouseMoveHandler);
        document.removeEventListener('mouseup', mouseUpHandler);
    };
    resizer.addEventListener('mousedown', mouseDownHandler);

</script>
<%@ include file="../../../../frame/inc/bottomScript.jsp" %>
</html>
