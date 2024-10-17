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
            <div id="sb-area-report" style="height: 500px; margin-bottom: 10px; margin-top: 10px"></div>
            <table class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width: 10%">
                    <col style="width: 20%">
                    <col style="width: 10%">

                    <col style="width: 20%">
                    <col style="width: 10%">
                    <col style="width: 20%">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row" class="th_bg">
                            입고
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="info-inp-crtrCd"
                                    name="info-inp-crtrCd"
                                    class="form-control input-sm"
                                    autocomplete="off"
                            />
                        </td>
                        <th scope="row" class="th_bg">
                            출고
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-crtrCd1"
                                    name="srch-inp-crtrCd1"
                                    class="form-control input-sm"
                                    autocomplete="off"
                            />
                        </td>
                        <th scope="row" class="th_bg">
                            현 재고
                        </th>
                        <td class="td_input">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-crtrCd2"
                                    name="srch-inp-crtrCd2"
                                    class="form-control input-sm"
                                    autocomplete="off"
                            />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
</body>
<script type="text/javascript">

    window.addEventListener('DOMContentLoaded', function(e) {
        fn_init();
    });

    const fn_init = async function(){
        fn_createGrid();
        SBUxMethod.set("srch-dtp-wrhsYmd",gfn_dateToYmd(new Date()));
        await fn_onchangeYmd();
    }

    var jsonReport = [];
    var grdReport;

    const fn_createGrid = function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-report';
        SBGridProperties.id = 'grdReport';
        SBGridProperties.jsonref = 'jsonClclnCrtr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption : ['구분','구분'],	ref : "col0",	width : '8%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/15 월','거래처'],	ref : "col0",	width : '9%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/15 월','수량'],	ref : "col0",	width : '3%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/16 월','거래처'],	ref : "col0",	width : '9%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/16 월','수량'],	ref : "col0",	width : '3%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/17 월','거래처'],	ref : "col0",	width : '9%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/17 월','수량'],	ref : "col0",	width : '3%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/18 월','거래처'],	ref : "col0",	width : '9%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/18 월','수량'],	ref : "col0",	width : '3%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/19 월','거래처'],	ref : "col0",	width : '9%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/19 월','수량'],	ref : "col0",	width : '3%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/20 월','거래처'],	ref : "col0",	width : '9%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/20 월','수량'],	ref : "col0",	width : '3%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/21 월','거래처'],	ref : "col0",	width : '9%',		style : 'text-align:center',	type : 'input'},
            {caption : ['4/21 월','수량'],	ref : "col0",	width : '3%',		style : 'text-align:center',	type : 'input'},
            {caption : ['재고','재고'],	ref : "col0",	width : '8%',		style : 'text-align:center',	type : 'input'},
        ]
        grdReport = _SBGrid.create(SBGridProperties);
    }

    const fn_search = async function(){
        console.log("지이이잉 서치중");
        await fn_onchangeYmd();
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
        const startDate = new Date(date.substr(0,4) + "-" + date.substr(4,2) + "-" + date.substr(6,2));

        for (let i = -3; i <= 3; i++) {
            const currentDate = new Date(startDate);
            currentDate.setDate(startDate.getDate() + i);
            result.push(formatDateWithDay(currentDate));
            result.push(formatDateWithDay(currentDate));
        }

        return result;
    }
    const fn_onchangeYmd = function(){
        const givenDate = SBUxMethod.get("srch-dtp-wrhsYmd"); // 주어진 날짜
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

    /** 마지막 셀 병합 수정 **/
    $('table:first tr:first td:last').remove();

    /** apc 명 옆 append **/
    $('table:first tr:first').append(`<th scope="row" class="th_bg" ><span class="data_required" ></span>계량일자</th>
							<td colspan="3" class="td_input"style="border-right: hidden;">
								<sbux-datepicker
									uitype="popup"
									id="srch-dtp-wrhsYmd"
									name="srch-dtp-wrhsYmd"
									date-format="yyyy-mm-dd"
									class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
									onchange="fn_dtpChange(srch-dtp-wrhsYmdFrom)"
								></sbux-datepicker>
							</td>
							<td colspan="4"></td>
`);

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>