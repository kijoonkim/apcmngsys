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
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>

    <style>
        .div_header {
            background-color: #CCE0B5;
            font-weight: bold;
            padding: 8px 12px;
            border-bottom: 1px solid #000;
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
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            width: 100%;
            transition: all 0.5s;
        }

        .control_panel {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-left: 16px;
            width: 80px;
        }

        #btnUp {
            width: 100%;
            height: 80px;
            background-color: red;
            color: white;
            font-size: 32px;
            border: 1px solid #000;
            cursor: pointer;
        }

        #grdQntt {
            width: 100%;
            height: 80px;
            text-align: center;
            font-size: 32px;
            border: 1px solid #000;
            background-color: white;
            color: black;
        }

        #btnDown {
            width: 100%;
            height: 80px;
            background-color: blue;
            color: white;
            font-size: 32px;
            border: 1px solid #000;
            cursor: pointer;
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
                <div>
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
                        <col style="width: 20%;">
                        <col style="width: 30%;">
                        <col style="width: 20%;">
                        <col style="width: 30%;">
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
                        </tr>
                    </tbody>
                </table>

                <div style="border: 1px solid #000; width: 100%; box-sizing: border-box; margin-top: 10px">
                    <div class="div_header">거래처</div>
                    <div class="div_body" style="padding: 12px;">
                        <div id="cnptInfoWrap">
                            <div class="carousel_container">
                                <div class="carousel"></div>
                            </div>
                        </div>
                    </div>

                    <div class="div_header">포장 등급 선택</div>
                    <div class="div_body" style="padding: 15px;">
                        <div id="pckgGrdInfoWrap" style="display: flex; align-items: center; justify-content: space-between;">
                            <div class="carousel_container" style="flex: 1;">
                                <div class="carousel" style="display: flex; flex-wrap: wrap; gap: 8px;"></div>
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
    </section>
</body>
<script type="text/javascript">
    /** 선택된 거래처 **/
    let selectedCnpt = null;
    /** 선택된 포장 등급 **/
    let selectedPckgGrd = null;

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
    }

    /**
     * 조회 버튼 클릭 시
     */
    const fn_search = async function() {
        const pckgYmd = SBUxMethod.get("srch-dtp-pckgYmd");
    }

    /**
     * 송장발행 버튼 클릭 시
     */
    const fn_invcPblcn = async function() {
        if(gfn_isEmpty(selectedCnpt)) {
            gfn_comAlert("W0005", "선택된 거래처");    // W0005    {0}이/가 없습니다.
            return;
        }
        
        if(!gfn_comConfirm("Q0001", "송장발행")) {    // Q0001    {0} 하시겠습니까?
            return;
        }

        // const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'DO_DOC');

        const spmtTot = document.querySelector("td.pckg_grd_sum").innerText;
        const tdList = document.querySelectorAll("td[class^='pckg_grd_']");

        let totInfo = [];

        tdList.forEach(td => {
            const qntt = td.innerText;
            const itemGrdCd = td.dataset.itemGrdCd;

            if(itemGrdCd) {
                totInfo.push({
                    itemGrdCd: itemGrdCd,
                    qntt: qntt
                });
            }
        });

        let obj = {
            apcCd: gv_selectedApcCd,
            cnptCd: selectedCnpt,
            totInfo: totInfo,
            spmtTot: spmtTot
        };

        // await gfn_popClipReport("송장", rptUrl, obj);

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

        data.resultList = data.resultList.filter((item) => item.useYn === 'Y');

        await fn_appendButton(data, "cnptInfoWrap", "cnptNm", "cnptCd");
    }

    /**
     * 포장 등급 목록 조회
     */
    const fn_searchPckgGrd = async function() {
        const postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdDtlList.do", {
            apcCd: gv_apcCd,
            grdSeCd: '03'
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
                btn.style.width = "130px";
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
                btn.style.width = "130px";
                btn.style.padding = "12px";
                btn.style.margin = "10px";
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
            th.style.backgroundColor = "#D9D9D9";
            th.style.padding = "6px";
            th.style.width = "10%";
            headerRow.appendChild(th);

            const td = document.createElement("td");
            td.className = "pckg_grd_" + (++idx);
            td.dataset.itemGrdCd = item.itemGrdCd;
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
                emptyTh.style.backgroundColor = "#D9D9D9";
                headerRow.appendChild(emptyTh);

                const emptyTd = document.createElement("td");
                emptyTd.style.backgroundColor = "#FFF";
                bodyRow.appendChild(emptyTd);
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

        const buttons = carouselEl.querySelectorAll("button");
        buttons.forEach(b => {
            b.style.backgroundColor = "#FFF";
            b.style.color = "#000";
        });

        clickedBtn.style.backgroundColor = "#FFB600";
        clickedBtn.style.color = "#FFF";
        
        selectedCnpt = clickedBtn.value;
    }

    /**
     * 포장 등급 버튼 클릭 시
     */
    const fn_selectButtonPckgGrd = async function(_el) {
        const clickedBtn = _el.currentTarget;
        const carouselEl = clickedBtn.parentElement;

        const buttons = carouselEl.querySelectorAll("button");
        buttons.forEach(b => {
            b.style.backgroundColor = "#FFF";
            b.style.color = "#000";
        });

        clickedBtn.style.backgroundColor = "#000";
        clickedBtn.style.color = "#FFF";

        selectedPckgGrd = clickedBtn.className;
        const td = document.querySelector("td." + selectedPckgGrd);
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
    }
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>