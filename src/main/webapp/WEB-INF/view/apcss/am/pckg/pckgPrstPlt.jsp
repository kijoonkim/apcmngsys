<%
    /**
     * @Class Name : pckgPrstPlt.jsp
     * @Description : 포창 현황판 화면
     * @author R&D사업본부
     * @since 2025.08.12
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일           수정자        수정내용
     * @ -----------    ---------    --------------------
     * @ 2025.08.12     손민성        최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>포장 현황판</title>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <style>
        div.box-body > div.wrap{
            display: grid;
            grid-template-rows: 1fr 1fr;
            grid-template-columns: 1fr 1fr;
        }
        div.board {
            background-color: #fcfcfc;
            border: 1px solid white;
        }
        table td, table th{
            font-size: 1.6rem!important;
            border: solid 1px black;
        }
    </style>
</head>
<body oncontextmenu="return false">
    <section>
        <div class="box box-solid">
            <div class="box-header" style="display: flex; justify-content: flex-start;">
                <div ondblclick="fn_fullScreen()">
                    <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                    <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 포장 현황판 -->
                </div>
            </div>
            <div class="box-body">
                <div class="wrap" style="width: 100%; height: 80vh">
                    <div class="board">
                        <div style="font-size: x-large; background-color: white">1번 작업자
                            <p id="1_cnpt" style="display: inline"></p>
                            <img id="1_check" src="/images/ma/check.png" width="24" height="24" loading="lazy">
                            <img id="1_unCheck" src="/images/ma/cancel.png" width="24" height="24" loading="lazy">
                        </div>
                        <table id="beodeul1" style="width: 100%;">
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
                            <tbody></tbody>
                        </table>
                    </div>
                    <div class="board">
                        <div style="font-size: x-large; background-color: white">2번 작업자
                            <p id="2_cnpt" style="display: inline"></p>
                            <img id="2_check" src="/images/ma/check.png" width="24" height="24" loading="lazy">
                            <img id="2_unCheck" src="/images/ma/cancel.png" width="24" height="24" loading="lazy">
                        </div>
                        <table id="beodeul2" style="width: 100%;">
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
                            <tbody></tbody>
                        </table>
                    </div>
                    <div class="board">
                        <div style="font-size: x-large; background-color: white">3번 작업자
                            <p id="3_cnpt" style="display: inline"></p>
                            <img id="3_check" src="/images/ma/check.png" width="24" height="24" loading="lazy">
                            <img id="3_unCheck" src="/images/ma/cancel.png" width="24" height="24" loading="lazy">
                        </div>
                        <table id="beodeul3" style="width: 100%;">
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
                            <tbody></tbody>
                        </table>
                    </div>
                    <div class="board">
                        <div style="font-size: x-large; background-color: white">4번 작업자
                            <p id="4_cnpt" style="display: inline"></p>
                            <img id="4_check" src="/images/ma/check.png" width="24" height="24" loading="lazy">
                            <img id="4_unCheck" src="/images/ma/cancel.png" width="24" height="24" loading="lazy">
                        </div>
                        <table id="beodeul4" style="width: 100%;">
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
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>
<script type="text/javascript">
    /** websoket 객체 **/
    let ws;

    window.addEventListener("DOMContentLoaded", function() {
      fn_init();

      /** socket 연결 **/

    });

    const fn_init = async function(){
        const postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdDtlList.do", {
            apcCd: gv_apcCd,
            grdSeCd: '03',
            itemCd: '0502'
        });
        const data = await postJsonPromise;
        if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
        }

        await fn_grdSumInfoTable(data.resultList);
        await fn_socket();
    }

    /**
     * 합계 정보 영역 내 테이블 추가
     */
    const fn_grdSumInfoTable = function (resultList) {
        // div.wrap 하위 table들 전부 순회
        document.querySelectorAll("div.wrap table").forEach((table) => {
            const sumInfoArea = table.querySelector("tbody");
            sumInfoArea.innerHTML = "";

            let headerRow = document.createElement("tr");
            let bodyRow = document.createElement("tr");
            let count = 0;

            resultList.forEach((item, idx) => {
                if (count === 10) {
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
                th.style.color = "#FFF";
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

            if (count > 0) {
                for (let i = count + 2; i < 10; i++) {
                    const emptyTh = document.createElement("th");
                    emptyTh.rowSpan = 2;
                    headerRow.appendChild(emptyTh);
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
            + location.host + `/ws/chat?roomId=${'${code}'}&userId=${'${userId}'}`
        ws = new WebSocket(url);
        ws.onopen = () => {
            ws.send(JSON.stringify({
                type:'init',
                roomId: gv_selectedApcCd,
                from:'dashboard',
                tableId: 'sumInfoTable',
                at: Date.now()
            }));
            [1,2,3,4].forEach(n => setWorkerConnected(n, false));
        };

        ws.onmessage = (e) => {
            let msg;
            try { msg = JSON.parse(e.data) } catch { return; }
            console.log(e.data,"@@@@@");
            if (msg.roomId !== gv_selectedApcCd) return;

            /** 현황판 최초 진입 **/
            if (msg.type === 'cell.snapshot') {
                let userId = msg.userId;
                /** 상태 체크 **/
                const workerId = getWorkerIdFromTableId(userId);
                setWorkerConnected(workerId, true);

                /** 최초 진입시 이미 작업자 데이터가 있다면 set **/
                Object.entries(msg.data || {}).forEach(([key, val]) => {
                    const td = document.querySelector(`${'#${userId}'} td.${'${key}'}`);
                    if (td) td.textContent = val;
                });
                /** 거래처 **/
                if(msg.cnptNm){
                    let cnptTarget ='#' + getWorkerIdFromTableId(userId) + "_cnpt";
                    let $target = $(cnptTarget);
                    $target.text("-" + msg.cnptNm);
                }

                /** sum **/
                updateTableSum(userId);
            /** 각 작업자 update **/
            }else if(msg.type === 'cell.patch'){
                const $root = $('#' + CSS.escape(msg.userId));
                const tdSel = 'td.' + CSS.escape(msg.patchTarget);
                const val   = msg.value;
                /** 텍스트 셀 **/
                $root.find(tdSel).text(val);
                /** sum **/
                updateTableSum(msg.userId);
            /** 거래처 선택 **/
            }else if(msg.type === 'cell.patch_cnpt'){
                let userId = msg.userId;
                let cnptTarget = '#' + getWorkerIdFromTableId(userId) + "_cnpt";
                let $target = $(cnptTarget);
                $target.text("-" + msg.value);
            }else if(msg.type === 'worker.online'){
                let userId = msg.userId;
                const workerId = getWorkerIdFromTableId(userId);
                setWorkerConnected(workerId, true);
            }else if(msg.type === 'worker.offline'){
                let userId = msg.userId;
                const workerId = getWorkerIdFromTableId(userId);
                setWorkerConnected(workerId, false);
                $(`${'#${userId}'} td[class^="pckg_grd_"]`).each(function () {
                    this.innerText = '0';
                });
            }
        };

        ws.onclose = (e) => {
        };

        ws.onerror = (err) => {
            console.error('WS ERROR', err);
        };
    }

    /**
     * sockect 연결 상태 update UI
     */
    const getWorkerIdFromTableId = (tableId) => {
            const m = String(tableId || "").match(/\d+/);
            return m ? m[0] : null;
        };

    const setWorkerConnected = (workerId, connected) => {
        if (!workerId) return;
        const okEl  = document.getElementById(`${'${workerId}'}_check`);
        const noEl  = document.getElementById(`${'${workerId}'}_unCheck`);
        if (!okEl || !noEl) return;

        if (connected) {
            okEl.classList.remove('hidden');
            noEl.classList.add('hidden');
        } else {
            okEl.classList.add('hidden');
            noEl.classList.remove('hidden');
        }
    };

    /** 각 패치마다 합계 연산 **/
    const updateTableSum = function(tableId) {
        const $root = $('#' + CSS.escape(tableId));
        if ($root.length === 0) return;

        let sum = 0;
        // pckg_grd_sum 은 제외하고 pckg_grd_숫자 만 합산
        $root
            .find('td[class^="pckg_grd_"]:not(.pckg_grd_sum)')
            .each(function () {
                const n = parseFloat($(this).text().replace(/[^\d.-]/g, '')) || 0;
                sum += n;
            });

        $root.find('td.pckg_grd_sum').text(sum.toLocaleString());
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
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
