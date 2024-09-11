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
        [id^="sb-area"] {
          padding: 10px;
        }
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
                    <sbux-button
                            id="btnPrint"
                            name="btnPrint"
                            uitype="normal"
                            class="btn btn-sm btn-outline-danger"
                            text="정산서발행"
                            onclick="fn_search"
                    ></sbux-button>
                </div>
            </div>
            <div class="box-body">
                <table class="table table-bordered tbl_fixed">
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
                                    <sbux-spinner id="spinner_normal" name="spinner_normal"
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
                                            jsondata-ref=""
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
                                            jsondata-ref=""
                                    ></sbux-select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">생산농가</th>
                            <td class="td_input">
                                <div style="display: flex;gap: 5px">
                                    <sbux-input
                                            uitype="text"
                                            id="srch-inp-prdcrNm"
                                            name="srch-inp-prdcrNm"
                                            class="form-control input-sm input-sm-ast inpt_data_reqed"
                                            placeholder="초성검색 가능"
                                            autocomplete-ref="jsonPrdcrAutocomplete"
                                            autocomplete-text="name"
                                            autocomplete-height="270px"
                                            oninput="fn_onInputPrdcrNm(event)"
                                            autocomplete-select-callback="fn_onSelectPrdcrNm"
                                    ></sbux-input>
                                    <sbux-button
                                            id="btn-srch-prdcr"
                                            name="btn-srch-prdcr"
                                            class="btn btn-xs btn-outline-dark"
                                            text="찾기" uitype="modal"
                                            target-id="modal-prdcr"
                                            onclick="fn_choicePrdcr"
                                    ></sbux-button>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">지역</th>
                            <td class="td_input">
                                <div style="display: flex">
                                    <sbux-select
                                            id="srch-slt-crtrCd2"
                                            name="srch-slt-crtrCd2"
                                            uitype="single"
                                            unselected-text="전체"
                                            class="form-control input-sm"
                                            style="flex-basis: 50%"
                                            jsondata-ref=""
                                    ></sbux-select>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="ad_tbl_top">
                    <ul class="ad_tbl_count">
                        <li>
                            <span>정산정보 상세</span>
                        </li>
                    </ul>
                </div>
                <div id="sb-area-1" style="display:flex;flex-wrap: wrap;"></div>
                <div id="sb-area-2"></div>
                <div id="sb-area-3"></div>
                <div id="sb-area-4" style="width: 30%"></div>
            </div>
        </div>
    </section>
    <div>
        <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1000px"></sbux-modal>
    </div>
    <div id="body-modal-prdcr">
        <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
    </div>
</body>
<script type="text/javascript">
    var grdGdsInvntr;
    window.addEventListener('DOMContentLoaded', async function(e) {
        fn_init();

        fn_createSmptPrfmncGrid();
        fn_createSmptPrfmncGrid2();
        fn_createSmptPrfmncGrid3();
        fn_createSmptPrfmncGrid4();
    });
    /**
     * @name fn_choicePrdcr
     * @description 생산자 선택 popup 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }
    const fn_createSmptPrfmncGrid = async function() {
        var SBGridPropertiesGdsInvntr = {};
        SBGridPropertiesGdsInvntr.parentid = 'sb-area-1';
        SBGridPropertiesGdsInvntr.id = 'grdGdsInvntr';
        SBGridPropertiesGdsInvntr.jsonref = 'jsonGdsInvntr';
        SBGridPropertiesGdsInvntr.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesGdsInvntr.columns = [
            {caption: ['정산년도','정산년도'],ref: 'itemNm',width: '7%',type: 'output', style: 'text-align:center'},
            {caption: ['차수','차수'],ref: 'itemNm',width: '7%', 	type: 'output', style: 'text-align:center'},
            {caption: ['정산구분','정산구분'],ref: 'itemNm',width: '8%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['정산분류','정산분류'],ref: 'itemNm',width: '8%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['지역','지역'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center'},
            {caption: ['주소','주소'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center'},
            {caption: ['농가명','농가명'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center'},
            {caption: ['연락처','연락처'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center'},
            {caption: ['종자','1'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['종자','2'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['종자','3'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['종자','4'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['종자','5'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['종자','6'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['종자','7'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['종자','8'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['계약면적','평'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center'},
            {caption: ['계약면적','㎡'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center'},
        ]
        grdGdsInvntr = _SBGrid.create(SBGridPropertiesGdsInvntr);
    }
    const fn_createSmptPrfmncGrid2 = async function() {
        var SBGridPropertiesGdsInvntr = {};
        SBGridPropertiesGdsInvntr.parentid = 'sb-area-2';
        SBGridPropertiesGdsInvntr.id = 'grdGdsInvntr2';
        SBGridPropertiesGdsInvntr.jsonref = 'jsonGdsInvntr';
        SBGridPropertiesGdsInvntr.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesGdsInvntr.columns = [
            {caption: ['정식면적<br>(평)','정식면적<br>(평)'], 			ref: 'itemNm', 			width: '10%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['1등급','수량'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['1등급','금액'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['2등급','수량'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['2등급','금액'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['소구','수량'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['소구','금액'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['비규격','수량'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['비규격','금액'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['적색 1등급','수량'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['적색 1등급','금액'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['적색 2등급','수량'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['적색 2등급','금액'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['적색 소구','수량'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['적색 소구','금액'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['적색 기형','수량'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['적색 기형','금액'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['합계','수량'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center'},
            {caption: ['합계','금액'], 			ref: 'itemNm', 			width: '5%', 	type: 'output', style: 'text-align:center'},

        ]
        grdGdsInvntr2 = _SBGrid.create(SBGridPropertiesGdsInvntr);
    }
    const fn_createSmptPrfmncGrid3 = async function() {
        var SBGridPropertiesGdsInvntr = {};
        SBGridPropertiesGdsInvntr.parentid = 'sb-area-3';
        SBGridPropertiesGdsInvntr.id = 'grdGdsInvntr3';
        SBGridPropertiesGdsInvntr.jsonref = 'jsonGdsInvntr';
        SBGridPropertiesGdsInvntr.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesGdsInvntr.columns = [
            {caption: ['구가지급금','단가'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['구가지급금','금액'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['농협<br>수수료','농협<br>수수료'],ref: 'itemNm',width: '6%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['계약금','중지대'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['계약금','현금'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['계약금','계'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center'},
            {caption: ['농자재','농자재'],ref: 'itemNm',width: '6%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['농기구<br>구입<br>지원금','농기구<br>구입<br>지원금'],ref: 'itemNm',width: '6%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['콩<br>적자금','콩<br>적자금'],ref: 'itemNm',width: '6%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['양파<br>적자금','양파<br>적자금'],ref: 'itemNm',width: '6%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['운반비','운반비'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['양파<br>의무<br>자조금','양파<br>의무<br>자조금'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['백<br>대여료','백<br>대여료'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['작목반<br>자조금','작목반<br>자조금'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['백 미반납','수량'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['백 미반납','금액'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['중도금','중도금'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['수출<br>물류비','수출<br>물류비'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['공제계','공제계'],ref: 'itemNm',width: '5%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
        ]
        grdGdsInvntr3 = _SBGrid.create(SBGridPropertiesGdsInvntr);
    }
    const fn_createSmptPrfmncGrid4 = async function() {
        var SBGridPropertiesGdsInvntr = {};
        SBGridPropertiesGdsInvntr.parentid = 'sb-area-4';
        SBGridPropertiesGdsInvntr.id = 'grdGdsInvntr4';
        SBGridPropertiesGdsInvntr.jsonref = 'jsonGdsInvntr';
        SBGridPropertiesGdsInvntr.emptyrecords = '데이터가 없습니다.';
        SBGridPropertiesGdsInvntr.columns = [
            {caption: ['종자금<br>선입금','종자금<br>선입금'], 			ref: 'itemNm', 			width: '15%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['선입금','선입금'], 			ref: 'itemNm', 			width: '15%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['최종지급액','최종지급액'], 			ref: 'itemNm', 			width: '20%', 	type: 'output', style: 'text-align:center'},
            {caption: ['계좌번호','계좌번호'], 			ref: 'itemNm', 			width: '25%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
            {caption: ['비고','비고'], 			ref: 'itemNm', 			width: '25%', 	type: 'output', style: 'text-align:center', fixedstyle : 'background-color:#bdd7ee'},
        ]
        grdGdsInvntr4 = _SBGrid.create(SBGridPropertiesGdsInvntr);
    }

    const fn_init = async function(){
        SBUxMethod.set("srch-dtp-clclnY",gfn_dateToYear(new Date()));
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
