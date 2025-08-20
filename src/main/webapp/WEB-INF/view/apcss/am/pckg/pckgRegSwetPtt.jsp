<%
    /**
     * @Class Name : pckgRegSwetPtt.jsp
     * @Description : 포창 등록 (고구마) 화면
     * @author R&D사업본부
     * @since 2025.07.15
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일           수정자        수정내용
     * @ -----------    ---------    --------------------
     * @ 2025.07.15     최지호        최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 포장 등록 (고구마)</title>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <script src="/js/out/view.bundle.js"></script>

    <style>
        .div_header {
            background-color: #236475;
            font-weight: bold;
            padding: 8px 12px;
            border-bottom: 1px solid #000;
            color: white;
        }

        .div_body {
            background-color: #FFF;
            height: auto;
        }

        .carousel_container {
            width: 100%;
            overflow: hidden;
        }

        .carousel {
            display: grid;
            width: 100%;
            transition: all 0.5s;
            grid-template-columns: repeat(5,1fr);
            grid-gap: 5px;
        }
        .carousel.pckgGrd{
            display: grid;
            width: 100%;
            transition: all 0.5s;
            grid-template-columns: repeat(10,1fr);
            grid-template-rows: repeat(3,1fr);
            row-gap: 1vh;
            column-gap: 0.5vw;
        }

        .control_panel {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-left: 10px;
            width: 80px;
            flex-basis: 8%;
            padding : 5px;
            align-self: stretch;
        }

        #btnUp {
            width: 100%;
            background-color: #e74c3c;
            color: white;
            font-size: 32px;
            border: 1px solid #000;
            cursor: pointer;
            flex: 1;
        }

        #grdQntt {
            width: 100%;
            text-align: center;
            font-size: 32px;
            border: 1px solid #000;
            background-color: white;
            color: black;
        }

        #btnDown {
            width: 100%;
            background-color: #3498db;
            color: white;
            font-size: 32px;
            border: 1px solid #000;
            cursor: pointer;
            flex: 1;
        }

        #sumInfoTbody > tr > th,
        #sumInfoTbody > tr > td {
            border: 1px solid #000 !important;
        }

    </style>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display: flex; justify-content: flex-start;">
                <div ondblclick="fn_fullScreen()">
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 포장 등록 (고구마) -->
                </div>
                <div style="margin-left: auto;">
                    <sbux-button
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="조회"
                        onclick="fn_search"
                    ></sbux-button>
                    <sbux-button
                        id="btnInvcPblcn"
                        name="btnInvcPblcn"
                        uitype="normal"
                        class="btn btn-sm btn-mbl btn-primary"
                        text="송장발행"
                        onclick="fn_invcPblcn"
                    ></sbux-button>
                </div>
            </div>

            <div class="box-body">
                <table class="table table-bordered tbl_fixed">
                    <caption>검색 조건 설정</caption>
                    <colgroup>
                        <col style="width: 11%;">
                        <col style="width: 22%;">
                        <col style="width: 11%;">
                        <col style="width: 22%;">
                        <col style="width: 11%;">
                        <col style="width: 22%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="th_bg">포장일자</th>
                            <td class="td_input">
                                <div style="display: flex; gap: 15px; align-items: center;">
                                    <sbux-datepicker
                                        id="srch-dtp-pckgYmd"
                                        name="srch-dtp-pckgYmd"
                                        uitype="popup"
                                        date-format="yyyy-mm-dd"
                                        class="form-control input-sm input-sm-ast inpt_data_reqed"
                                    ></sbux-datepicker>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">포장라인</th>
                            <td class="td_input">
                                <div style="display: flex;">
                                    <sbux-input
                                        id="gsb-slt-pckgLine"
                                        name="gsb-slt-pckgLine"
                                        uitype="text"
                                        class="form-control input-sm"
                                        style="flex-basis: 70%;"
                                        readonly
                                        value="${apcNm}"
                                    ></sbux-input>
                                </div>
                            </td>
                            <th scope="row" class="th_bg">규격</th>
                            <td class="td_input">
                                <div style="display: flex;">
                                    <sbux-select
                                            id="gsb-slt-spcfct"
                                            name="gsb-slt-spcfct"
                                            uitype="single"
                                            class="form-control input-sm"
                                            jsondata-ref="jsonSpcfctCd"
                                            jsondata-value="spcfctCd"
                                            jsondata-text="text"
                                            style="flex-basis: 70%;"
                                    ></sbux-select>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="panel" style="border: 1px solid #000; width: 100%; box-sizing: border-box; margin-top: 10px">
                    <div class="div_header" onclick="fn_folding(this)">거래처</div>
                    <div class="div_body" style="padding: 5px;">
                        <div id="cnptInfoWrap">
                            <div class="carousel_container">
                                <div class="carousel"></div>
                            </div>
                        </div>
                    </div>

                    <div class="div_header">포장 등급 선택</div>
                    <div class="div_body" style="padding: 5px">
                        <div id="pckgGrdInfoWrap" style="display: flex; align-items: center; justify-content: space-between;">
                            <div class="carousel_container" style="flex: 1;">
                                <div class="carousel pckgGrd"></div>
                            </div>

                            <div class="control_panel">
                                <sbux-button
                                    id="btnUp"
                                    name="btnUp"
                                    uitype="normal"
                                    text="▲"
                                    onclick="fn_countUp"
                                ></sbux-button>
                                <sbux-input
                                    id="grdQntt"
                                    name="grdQntt"
                                    class="grd_qntt"
                                    uitype="text"
                                    wrap-style="flex:1"
                                    style="height: 100%"
                                    value="0"
                                    onblur="fn_updateGrdSum"
                                ></sbux-input>
                                <sbux-button
                                    id="btnDown"
                                    name="btnDown"
                                    uitype="normal"
                                    text="▼"
                                    onclick="fn_countDown"
                                ></sbux-button>
                            </div>
                        </div>
                    </div>

                    <div class="div_header">합계 정보</div>
                    <div id="sumInfoWrap">
                        <div class="table-scroller">
                            <table id="sumInfoTable" style="width: 100%;">
                                <caption>검색 조건 설정</caption>
                                <colgroup>
                                    <col style="width: 10%;">
                                    <col style="width: 10%;">
                                    <col style="width: 10%;">
                                    <col style="width: 10%;">
                                    <col style="width: 10%;">
                                    <col style="width: 10%;">
                                    <col style="width: 10%;">
                                    <col style="width: 10%;">
                                    <col style="width: 10%;">
                                    <col style="width: 10%;">
                                </colgroup>
                                <tbody id="sumInfoTbody"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script type="text/javascript">
    /** 선택된 거래처 **/
    let selectedCnpt = null;
    /** 선택된 포장 등급 **/
    let selectedPckgGrd = null;
    /** 거래처 Json **/
    let jsonCnptCd = [];
    /** 거래처별 임시 저장 obj **/
    var gv_cnptTemp = {};
    /** 규격 **/
    var jsonSpcfctCd = [];
    /** web sokect **/
    let ws;
    /** ws msg obj **/
    let patch = {
        type : '',
        code : gv_selectedApcCd,
        tableId : 'sumInfoTable',
        from : '',
        data : {},
        at : '',
        by : ''
    };



    window.addEventListener("DOMContentLoaded", function() {
        fn_init();

        const el = document.querySelector(".grd_qntt");
        el.addEventListener("keyup", (event) => {
            if(event.keyCode === 13 && !event.altKey && !event.ctrlKey && !event.shiftKey) {
                fn_updateGrdSum();
            }
        });
    });

    const fn_init = async function() {
        SBUxMethod.set('srch-dtp-pckgYmd', gfn_dateToYmd(new Date()));

        await fn_searchCnpt();
        await fn_searchPckgGrd();
        await gfn_setApcSpcfctsSBSelect("gsb-slt-spcfct",jsonSpcfctCd, gv_selectedApcCd, '0502');
        await fn_socket();
    }

    /**
     * 조회 버튼 클릭 시
     */
    const fn_search = async function() {
        let pckgYmd = SBUxMethod.get("srch-dtp-pckgYmd");

        const postJsonPromise = gfn_postJSON("/am/pckg/selectPckgPrfmnc.do",{
            apcCd:gv_selectedApcCd,
            pckgYmd: pckgYmd,
            cnptCd: _cnptCd});
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
        }
    }

    /**
     * 송장발행 버튼 클릭 시
     */
    const fn_invcPblcn = async function() {
        if(gfn_isEmpty(selectedCnpt)) {
            gfn_comAlert("W0005", "선택된 거래처");    // W0005    {0}이/가 없습니다.
            return;
        }
        /** 총합계 0인 경우 **/
        let total = $("td.pckg_grd_sum").text();
        if(total == 0){
            gfn_comAlert("W0005", "포장대상");
            return;
        }

        if(!gfn_comConfirm("Q0001", "송장발행")) {    // Q0001    {0} 하시겠습니까?
            return;
        }
        let saveTarget = gv_cnptTemp[selectedCnpt];
        let pckgYmd = SBUxMethod.get("srch-dtp-pckgYmd");
        let spcfctCd = SBUxMethod.get("gsb-slt-spcfct");
        let gdsInvntrVO = [];
        let pckgPrfmncVO = [];

        const filtered = saveTarget.filter(obj => {
            const [key,value] = Object.entries(obj)[0];
            if(key === 'pckg_grd_sum') return false;
            return parseInt(value) > 0;
        }).forEach(function(i,idx){
            const [key,value] = Object.entries(i)[0];
            let data = $("td." + key).data();
            let itemCd = data.itemCd;
            let vrtyCd = data.vrtyCd;
            let gdsGrd = data.grdCd;

            gdsInvntrVO.push({
                apcCd : gv_selectedApcCd,
                bxGdsQntt : value,
                cnptCd : selectedCnpt,
                invntrQntt : value,
                itemCd : itemCd,
                vrtyCd : vrtyCd,
                pckgYmd : pckgYmd,
                spcfctCd : spcfctCd,
                pckgSn : idx,
                gdsGrd : gdsGrd,
            });

            pckgPrfmncVO.push({
               apcCd : gv_selectedApcCd,
               pckgQntt : value,
               pckgSn : idx,
               pckgYmd : pckgYmd
            });
        });

        let param = {
            pckgPrfmncVO : pckgPrfmncVO,
            gdsInvntrVO : gdsInvntrVO,
        }

        const postJsonPromise = gfn_postJSON("/am/pckg/prfmnc/insertPckgPrfmncWithSpmt", param);
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
        }

        if(data.insertedCnt > 0){
            gfn_comAlert("I0001");
            let colGrdNm = {}
            let jsonData = {
                pckgYmd     : pckgYmd,
                cnptCd      : selectedCnpt,
                cnptNm      : jsonCnptCd.filter(i => i.cnptCd === selectedCnpt)[0].cnptNm,
                cnptAddr    : jsonCnptCd.filter(i => i.cnptCd === selectedCnpt)[0].addr,
                cnptTelno   : jsonCnptCd.filter(i => i.cnptCd === selectedCnpt)[0].telno,
            }
            gv_cnptTemp[selectedCnpt].forEach(obj => {
                Object.assign(jsonData, obj);
                let [key, value] = Object.entries(obj);
                let pckgGrdNm = document.querySelector("." + key[0]).innerText;
                colGrdNm[key[0]] = pckgGrdNm;
            });

            let rstlData = {
                "jsonData": jsonData,
                "colGrdNm": colGrdNm
            }

            let conn = [];

            conn.push(
                {
                    data: {
                        "root": [rstlData]
                    }
                }
            );

            await gfn_popClipReportPost("전표", "am/dlngDoc_0641.crf", null, conn );
        }


        fn_searchCnpt();
        fn_searchPckgGrd();

        SBUxMethod.set('srch-dtp-pckgYmd', gfn_dateToYmd(new Date()));
        SBUxMethod.set("grdQntt", 0);
    }

    /**
     * 거래처 목록 조회
     */
    const fn_searchCnpt = async function() {
        const postJsonPromise = gfn_postJSON(URL_CNPT_INFO, {
            apcCd: gv_apcCd,
            delYn: "N"
        }, null, true);
        const data = await postJsonPromise;
        jsonCnptCd = data.resultList;

        data.resultList.forEach((item,idx) => {
           gv_cnptTemp[item.cnptCd] = {};
        });
        data.resultList = data.resultList.filter((item) => item.useYn === 'Y');

        await fn_appendButton(data, "cnptInfoWrap", "cnptNm", "cnptCd");
    }

    /**
     * 포장 등급 목록 조회
     */
    const fn_searchPckgGrd = async function() {
        const postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdDtlList.do", {
            apcCd: gv_apcCd,
            grdSeCd: '03',
            itemCd: '0502'
        });
        const data = await postJsonPromise;

        await fn_appendButton(data, "pckgGrdInfoWrap", "grdNm", "grdCd");

        fn_grdSumInfoTable(data.resultList);
    }

    /**
     * 거래처 및 포장 등급 영역 내 버튼 추가
     */
    const fn_appendButton = async function(data, id, label, value, flag = false) {
        const wrapEl = document.getElementById(id);
        const carouselEl = wrapEl.querySelector(".carousel");

        carouselEl.innerHTML = "";

        if(!data.resultList || data.resultList.length === 0) return;

        if(id == "cnptInfoWrap") {
            data.resultList.forEach((item, idx) => {
                const btn = document.createElement("button");
                btn.innerText = item[label];
                btn.value = item[value];

                btn.style.border = "1px solid #1A4B80";
                btn.style.borderRadius = "4px";
                // btn.style.width = "19vw";
                btn.style.fontSize = "3rem";
                btn.style.height = "8vh";
                btn.style.padding = "10px";
                btn.style.backgroundColor = "#FFF";
                btn.style.color = "#000";
                btn.style.cursor = "pointer";
                btn.style.whiteSpace = "nowrap";

                carouselEl.appendChild(btn);

                selectedCnpt = null;

                btn.addEventListener("click", fn_selectButtonCnpt);
            });
        } else if(id == "pckgGrdInfoWrap") {
            data.resultList.forEach((item, idx) => {
                const btn = document.createElement("button");
                btn.innerText = item[label];
                btn.value = item[value];

                btn.className = "pckg_grd_" + (++idx);
                btn.style.border = "1px solid #1A4B80";
                btn.style.borderRadius = "4px";
                // btn.style.width = "14vw";
                btn.style.fontSize = "3rem";
                btn.style.height = "8vh";
                btn.style.backgroundColor = "#FFF";
                btn.style.color = "#000";
                btn.style.cursor = "pointer";
                btn.style.whiteSpace = "nowrap";

                carouselEl.appendChild(btn);

                btn.addEventListener("click", fn_selectButtonPckgGrd);
            });
        }
    }

    /**
     * 합계 정보 영역 내 테이블 추가
     */
    const fn_grdSumInfoTable = function(resultList) {
        const sumInfoArea = document.getElementById("sumInfoTbody");
        sumInfoArea.innerHTML = "";

        let headerRow = document.createElement("tr");
        let bodyRow = document.createElement("tr");
        let count = 0;

        resultList.forEach((item, idx) => {
            if(count === 10) {
                sumInfoArea.appendChild(headerRow);
                sumInfoArea.appendChild(bodyRow);

                headerRow = document.createElement("tr");
                bodyRow = document.createElement("tr");
                count = 0;
            }

            const th = document.createElement("th");
            th.innerText = item.grdNm;
            th.style.textAlign = "center";
            th.style.backgroundColor = "#3c84b7";
            th.style.color = '#FFF';
            th.style.padding = "6px";
            th.style.width = "10%";
            headerRow.appendChild(th);

            const td = document.createElement("td");
            td.className = "pckg_grd_" + (++idx);
            td.dataset.itemCd = item.itemCd;
            td.dataset.vrtyCd = item.vrtyCd;
            td.dataset.grdCd = item.grdCd;
            td.innerText = 0;
            td.style.textAlign = "center";
            td.style.backgroundColor = "#FFF";
            td.style.padding = "6px";
            td.style.width = "10%";
            bodyRow.appendChild(td);

            count++;
        });

        if(count > 0) {
            for(let i = count + 2; i < 10; i++) {
                const emptyTh = document.createElement("th");
                emptyTh.rowSpan = 2;
                // emptyTh.borderBttom = none;
                // emptyTh.style.backgroundColor = "#D9D9D9";
                headerRow.appendChild(emptyTh);

                // const emptyTd = document.createElement("td");
                // emptyTd.style.backgroundColor = "#FFF";
                // bodyRow.appendChild(emptyTd);
            }

            const sumTh = document.createElement("th");
            sumTh.innerText = "총합계";
            sumTh.colSpan = 2;
            sumTh.style.backgroundColor = "#333";
            sumTh.style.color = "#FFF";
            sumTh.style.textAlign = "center";
            sumTh.style.padding = "6px";
            headerRow.appendChild(sumTh);

            const sumTd = document.createElement("td");
            sumTd.className = "pckg_grd_sum";
            sumTd.innerText = 0;
            sumTd.colSpan = 2;
            sumTd.style.backgroundColor = "#FFF";
            sumTd.style.color = "#000";
            sumTd.style.textAlign = "center";
            sumTd.style.padding = "6px";
            bodyRow.appendChild(sumTd);

            sumInfoArea.appendChild(headerRow);
            sumInfoArea.appendChild(bodyRow);
        }
    };

    /**
     * 거래처 버튼 클릭 시
     */
    const fn_selectButtonCnpt = async function(_el) {
        const clickedBtn = _el.currentTarget;
        const carouselEl = clickedBtn.parentElement;
        const cnptNm = _el.currentTarget.textContent.trim();

        /** 거래처 헤더에 표기 **/
        let header = $(clickedBtn).closest("div.div_body").prev();
        let appendText = " - " + cnptNm;

        header.text("거래처" + appendText);

        const buttons = carouselEl.querySelectorAll("button");
        buttons.forEach(b => {
            b.style.backgroundColor = "#FFF";
            b.style.color = "#000";
        });

        clickedBtn.style.backgroundColor = "#FFB600";
        clickedBtn.style.color = "#FFF";

        /** 기존 합계정보 초기화 **/
        $('#sumInfoTbody td[class^="pckg_grd_"]').each(function () {
            this.innerText = '0';
        });

        selectedCnpt = clickedBtn.value;
        let prevData = gv_cnptTemp[selectedCnpt];
        if(prevData.length > 0){
            prevData.forEach(function(obj){
                const [key, value] = Object.entries(obj)[0];
                $('#sumInfoTbody td.' + key).text(value);
            });
        }
        $("#grdQntt").val(0);

        /** folding **/
        fn_folding(header);

        /** 색상으로 포장등급 선택된 요소 trigger (이렇게하면 안됨) **/
        const $selected = $("#pckgGrdInfoWrap button[class^='pckg_grd_']").filter(function () {
            const color = $(this).css("color");  // 또는 background-color
            return color === "rgb(255, 255, 255)";  // 원하는 색 비교
        });
        $selected[0]?.click();

        /** 현황판에 거래처 전달 **/
        ws.send(JSON.stringify({
            type: 'cell.patch_cnpt',
            code: gv_selectedApcCd,
            userId: gv_userId,
            value: cnptNm
        }));
    }

    /**
     * 포장 등급 버튼 클릭 시
     */
    const fn_selectButtonPckgGrd = async function(_el) {
        if(!selectedCnpt){
            await Swal.fire(
                '거래처를 선택해주세요.',
                '',
                'error'
            );
            return;
        }
        const clickedBtn = _el.currentTarget;
        const carouselEl = clickedBtn.parentElement;

        const buttons = carouselEl.querySelectorAll("button");
        buttons.forEach(b => {
            b.style.backgroundColor = "#FFF";
            b.style.color = "#000";
        });

        clickedBtn.style.backgroundColor = "#2c3e50";
        clickedBtn.style.color = "#FFF";

        selectedPckgGrd = clickedBtn.className;
        const td = document.querySelector("td." + selectedPckgGrd);
        // const td = $("#sumInfoTbody > td." + selectedPckgGrd);
        if(td) grdQntt.value = parseInt(td.innerText) || 0;
    }

    /**
     * 등급 수량 증가 버튼 클릭 시
     */
    const fn_countUp = async function() {
        let val = parseInt(grdQntt.value) || 0;
        val++;
        grdQntt.value = val;

        fn_updateGrdSum();
        fn_patchQntt(val);

    }
    /**
     * 전체 화면 모드
     */
    const fn_fullScreen =function(){

        if(!document.fullscreenElement){
            if(document.documentElement.requestFullscreen){
                document.documentElement.requestFullscreen();
            }else if(document.documentElement.webkitRequestFullscreen){
                document.documentElement.webkitRequestFullscreen()
            }else if(document.documentElement.msRequestFullscreen){
                document.documentElement.msRequestFullscreen();
            }
        }else{
            if(document.exitFullscreen){
                document.exitFullscreen();
            }else if(document.webkitExitFullscreen){
                document.webkitExitFullscreen();
            }else if(document.msExitFullscreen){
                document.msExitFullscreen();
            }
        }
    }

    /**
     * 등급 수량 감소 버튼 클릭 시
     */
    const fn_countDown = async function() {
        let val = parseInt(grdQntt.value) || 0;
        if(val > 0) val--;
        grdQntt.value = val;

        fn_updateGrdSum();
    }

    /**
     * 등급 수량 총합계 계산
     */
    const fn_updateGrdSum = function() {
        SBUxMethod.set("grdQntt", String(parseInt(grdQntt.value)));

        const td = document.querySelector("td." + selectedPckgGrd);
        if(td) td.innerText = String(parseInt(grdQntt.value));

        const tdList = document.querySelectorAll("td[class^='pckg_grd_']");
        let sum = 0;

        tdList.forEach(td => {
            if(td.classList.contains("pckg_grd_sum")) return;

            const val = parseInt(td.innerText) || 0;
            sum += val;
        });

        document.querySelector("td.pckg_grd_sum").innerText = sum;
        /** 거래처별 data Temp 반영 **/
        let prevData = $('#sumInfoTbody td[class^="pckg_grd_"]').map(function () {
            const className = Array.from(this.classList).find(cls => cls.startsWith('pckg_grd_'));
            return { [className]: this.textContent.trim() };
        }).get();

        gv_cnptTemp[selectedCnpt] = prevData;
    }

    /** 거래처 toggle **/
    const fn_folding = (_el) => {
        $(_el).next().slideToggle(200, function () {
            const $target = $(this); // 애니메이션 끝난 후
            if ($target.is(":visible")) {
                // 작게
                $("#sumInfoTbody").find("th, td").css('font-size', '2rem');
            } else {
                // 크게
                $("#sumInfoTbody").find("th, td").css('font-size', '3rem');
            }
        });
    };

    /**
     * 진입시 소켓 연결
     */
    const fn_socket = function(){
        // const code = gv_selectedApcCd; // 4자리 코드
        const code = encodeURIComponent(gv_selectedApcCd);
        const userId = encodeURIComponent(gv_userId);
        const url = (location.protocol === 'https:' ? 'wss://' : 'ws://')
            + location.host + `/ws/chat?code=${'${code}'}&userId=${'${userId}'}`
        ws = new WebSocket(url);
        ws.onopen = () => {};

        ws.onmessage = (e) => {
            let msg;
            try { msg = JSON.parse(e.data) } catch { return; }
            if (msg.tableId !== 'sumInfoTable' || msg.code !== gv_selectedApcCd) return;

            if (msg.type === 'init') {
                /** 현재 상태를 전달함 **/
                const snap = {};
                document.querySelectorAll('#sumInfoTbody td[class^="pckg_grd_"]').forEach(td=>{
                    const key = [...td.classList].find(c => c.startsWith('pckg_grd_'));
                    if (key) snap[key] = td.textContent.trim();
                });
                /** 거래처 정보 전달 **/
                let cnptNm = '';
                if(selectedCnpt){
                    cnptNm = jsonCnptCd.filter(i => i.cnptCd === selectedCnpt)[0].cnptNm;
                }
                ws.send(JSON.stringify({
                    type:'cell.snapshot', code: gv_selectedApcCd, from:'client',
                    data:snap, at: Date.now(), userId: gv_userId || '', cnptNm: cnptNm
                }));
            }

            // (원하면) 다른 사람이 보낸 patch도 반영
            <%--if (msg.type === 'cell.patch') {--%>
            <%--    Object.entries(msg.data || {}).forEach(([key, val]) => {--%>
            <%--        const td = document.querySelector(`#sumInfoTable td.${'${key}'}`);--%>
            <%--        if (td) td.textContent = val;--%>
            <%--    });--%>
            <%--}--%>
        };

        ws.onclose = (e) => {
        };

        ws.onerror = (err) => {
            console.error('WS ERROR', err);
        };
    }
    const fn_patchQntt = function(_qntt){
        ws.send(JSON.stringify({
            type: 'cell.patch',
            code: gv_selectedApcCd,
            userId: gv_userId,
            patchTarget: selectedPckgGrd,
            value: _qntt
        }));
    }


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>