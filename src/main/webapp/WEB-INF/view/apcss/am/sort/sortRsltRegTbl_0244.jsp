<%--
  Created by IntelliJ IDEA.
  User: sonminseong
  Date: 2/17/25
  Time: 10:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/interactjs/dist/interact.min.js"></script>
<%
    String userAgent = request.getHeader("User-Agent");
    boolean isMobile = userAgent.matches(".*(Mobile|Android|iPhone|iPad).*");
%>
<c:set var="isMobile" value="<%= isMobile %>"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>

    <style>
        input[type="number"] {
            -webkit-appearance: none;
            -moz-appearance: textfield; /* 파이어폭스에서 적용 */
            appearance: none;
            border: none !important;
            text-align: center;
        }

        /* 숫자 입력 필드에서 화살표 제거 */
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .area-wrap {
            width: 100vw;
            height: 90vh;
            overflow: scroll;
        }

        .iner-wrap {
            margin: 5px;
            width: auto;
            height: auto;
            box-sizing: border-box;
        }

        .iner-wrap > table {
            width: 100%;
            height: 100%;
            user-select: none;
        }

        .iner-wrap > table th {
            text-align: center;
            border: 1px solid black !important;
            line-height: 2;
        }

        .iner-wrap > table td {
            border-width: 1px;
            border-style: solid;
            border-color: black !important;
            line-height: 2;
        }

        #sortTable > tbody > tr > td:first-child input {
            text-align: center;
        }

        #sortTable input {
            border: none !important;
        }

        #sortTable tbody td input:disabled {
            pointer-events: none;
        }

        .modal {
            display: none;
            height: 450px;
            width: 500px;
            position: fixed;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            border: 1px solid black;
            z-index: 1050;
            background-color: white;
            cursor: grab;
            touch-action: none;
            user-select: none;
        }

        .closeModal {
            display: flex;
            justify-content: flex-end;
            background-color: #37719c;
        }

        .close {
            text-align: right;
            margin-right: 7px;
            font-size: 2vh;
            font-weight: bold;
            box-sizing: border-box;
            cursor: pointer;
            color: white;
        }

        .searchBtn {
            background-color: #4A5672;
            border: none;
            color: white;
            font-size: small;
            text-wrap: nowrap;
        }

        td.selected {
            border: 3px solid black !important;
            border-collapse: separate;
            border-spacing: 0;
        }

        td.selected.first {
            border-bottom-width: 1px !important;
        }

        td.selected.end {
            border-top-width: 1px !important;
            position: relative;
        }

        td.selected.mid {
            border-top-width: 1px !important;
            border-bottom-width: 1px !important;
        }

        .btn_blue {
            color: white;
            background-color: #4A5672;
            border-color: #4A5672;
        }

        .swal2-toast .swal2-title.custom-toast-title {
            font-size: 20px; /* 원하는 텍스트 크기 */
            font-weight: bold; /* 글자 두껍게 */
            padding: 5px 10px; /* 여백 */
        }
        #decompositionMode.btn_on{
            background-color: #B5A98D;
            border-color: #B5A98D;
        }
        .sbux-btn:hover{
            color: white!important;
            background-color: #4A5672;
            border-color: #4A5672;
        }
        .grd_container{
            display: grid;
            width: 100%;
            height: 95%;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); /* 자동으로 아이템 개수에 맞게 조정 */
            grid-template-rows: auto; /* 각 행의 높이를 자동으로 조정 */
            padding         : 10px;         /* 나와 자식간에 10px 의 gap 을 만들어줘! */
            box-sizing      : border-box;
            gap: 10px;
        }
        .cell{
            border: 1px solid black;
            display: flex;
            align-content: center;
            justify-content: center;
            align-items: center;
            font-size: 2rem;
            border-radius: 10px;
            background-color: white;
            text-wrap: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .cell.active{
            background-color: #1c54a2;
            font-weight: bold;
            color: white;
        }
        input.left, input.right{
            text-align: left;
            padding-left: 5px;
        }
    </style>
</head>
<body style="overflow: hidden">
<div class="area-wrap">
    <div class="iner-wrap">
        <H1 id="mblTitle" ondblclick="fn_fullScreen();" style="text-align: center">
            <span id="yyyy"></span>년 공동선별작업일지(
            <select id="warehouse" onchange="fn_reset()"
                    style="appearance: none; -webkit-appearance: none; -moz-appearance: none;border: none!important;">
            </select>
            )</H1>
        <div style="display: flex; gap: 6px; align-items: center">
            <h5 style="margin-left: 1vw">일자 : </h5>
            <sbux-datepicker
                    id="srch-dtp-ymd"
                    name="srch-dtp-ymd"
                    uitype="popup"
                    wrap-style="border: hidden"
                    input-mask="undefined"
                    date-format="yyyy년 mm월 dd일"
                    style="background-color: initial; color: black; border: none!important;font-size: 1.7rem"
                    onchange="fn_reset()"
            ></sbux-datepicker>
            <sbux-button
                    id="spmtMode"
                    name="spmtMode"
                    uitype="normal"
                    text="출하등록"
                    is-change-text="true"
                    onclick="fn_spmtMode()"
            >
            </sbux-button>
            <sbux-button
                    id="decompositionMode"
                    name="decompositionMode"
                    uitype="normal"
                    text="재고분리 OFF"
                    class="btn_blue"
                    is-change-text="true"
                    onclick="fn_decompositionMode()"
            >
            </sbux-button>
        </div>
        <table id="sortTable" style="border-collapse: separate">
            <colgroup>
                <col style="width: 9%">
            </colgroup>
            <thead style="border-bottom: 2px double black !important;">
            <tr>
                <th style="letter-spacing: 3vw">작업량</th>
            </tr>
            <tr>
                <th rowspan="2">생산자</th>
            </tr>
        </table>
    </div>
</div>
<div id="modal" class="modal">
    <div class="closeModal">
        <p class="close" onclick="fn_modal()">&times;</p>
    </div>
    <div id="sb-area-rawMtrInvntr" style="width: 100%;height: 450px"></div>
</div>
<div id="cnpt" class="modal">
    <div class="closeModal">
        <p class="close" onclick="fn_closeCnptModal()">&times;</p>
    </div>
    <div class="grd_container">
    </div>
</div>
</body>
<script type="text/javascript">
    //region var
    var isMobile = ${isMobile};
    //등급목록
    var grdList = [];
    //생산자목록
    var prdcrList = [];
    //원물재고정보
    var rawMtrInvntr = [];
    //GRID
    var grdRawMtrInvntr;
    var jsonRawMtrInvntr = [];
    //창고목록
    var jsonComWarehouse = [];
    //환경설정
    let lv_rawMtrVlType;
    //출하포장단위
    var jsonSpmtPckgUnit = [];

    //TABLE JSON
    var sortSaveList = [];
    //SORT SAVE
    var sortPrfmncVO = {
        apcCd: gv_selectedApcCd,
        sortYmd: '',
        sortno: '',
        rawMtrVlType: lv_rawMtrVlType,
        rawMtrInvntrList: [],
        sortPrfmncList: [],
        itemCd: ''
    };
    //상품재고 정보
    var gdsInvntrList = [];
    //출하실적 정보 OBJ
    var spmtSaveList = [];
    //현재 colIndex
    let nowColIdx = 0;

    //endregion var
    //region utill
    const fn_fullScreen = function () {
        // window.parent.mfn_fullScreen();
        if (!document.fullscreenElement) {
            if (document.documentElement.requestFullscreen) {
                document.documentElement.requestFullscreen();
            } else if (document.documentElement.webkitRequestFullscreen) {
                document.documentElement.webkitRequestFullscreen()
            } else if (document.documentElement.msRequestFullscreen) {
                document.documentElement.msRequestFullscreen();
            }
        } else {
            if (document.exitFullscreen) {
                document.exitFullscreen();
            } else if (document.webkitExitFullscreen) {
                document.webkitExitFullscreen();
            } else if (document.msExitFullscreen) {
                document.msExitFullscreen();
            }
        }
    }
    //region drag interact
    const spmtHandle = {
        startCell: null,
        isDragging: false,
        init: () => {
            interact('#sortTable')
                .on('down', (event) => {
                    if (event.target.tagName === 'TD') {
                        spmtHandle.isDragging = true;
                        clearSelection();
                        spmtHandle.startCell = event.target;
                        spmtHandle.startCell.classList.add('selected');
                    }
                })
                .on('move', (event) => {
                    if (!spmtHandle.isDragging || !spmtHandle.startCell) return;

                    const pointerX = event.client.x;
                    const pointerY = event.client.y;
                    const currentElement = document.elementFromPoint(pointerX, pointerY);

                    if (currentElement && currentElement.tagName === 'TD') {
                        const selectedCells = getCellsBetween(spmtHandle.startCell, currentElement);
                        clearSelection();
                        selectedCells.forEach(cell => cell.classList.add('selected'));
                    }
                })
                .on('up', () => {
                    spmtHandle.isDragging = false;
                    spmtHandle.startCell = null;
                });
        },
        switch: (flag) => {
            spmtHandle.isDragging = false;
        }
    };

    /** cell 선택 fn **/
    function getCellsBetween(start, end) {
        const rows = Array.from(document.querySelectorAll('#sortTable tbody tr'));

        const startRowIdx = rows.indexOf(start.parentElement);
        const endRowIdx = rows.indexOf(end.parentElement);

        const startCellIdx = Array.from(start.parentElement.children).indexOf(start);
        const endCellIdx = Array.from(end.parentElement.children).indexOf(end);

        const rowStart = Math.min(startRowIdx, endRowIdx);
        const rowEnd = Math.max(startRowIdx, endRowIdx);
        const cellStart = Math.min(startCellIdx, endCellIdx);
        const cellEnd = Math.max(startCellIdx, endCellIdx);

        const selected = [];
        for (let i = rowStart; i <= rowEnd; i++) {
            const cells = rows[i].children;
            for (let j = cellStart; j <= cellEnd; j++) {
                selected.push(cells[j]);
            }
        }
        return selected;
    }

    /** cell clear **/
    function clearSelection() {
        document.querySelectorAll('#sortTable td.selected').forEach(cell =>
            cell.classList.remove('selected')
        );
    }

    //endregion drag interact
    //region modal fn
    const fn_createRawMtrInvntrGrid = async function () {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-rawMtrInvntr';
        SBGridProperties.id = 'grdRawMtrInvntr';
        SBGridProperties.jsonref = 'jsonRawMtrInvntr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ['원물번호'], ref: 'pltno', width: '25%', type: 'output', style: 'text-align:center;'},
            {caption: ['생산자'], ref: 'prdcrNm', width: '25%', type: 'output', style: 'text-align:center;'},
            {caption: ['번호'], ref: 'prdcrIdentno', width: '25%', type: 'output', style: 'text-align:center;'},
            {caption: ['입고수량'], ref: 'invntrQntt', width: '25%', type: 'output', style: 'text-align:center;'},
        ];
        grdRawMtrInvntr = _SBGrid.create(SBGridProperties);
        // grdRawMtrInvntr.bind('click', 'fn_setPltno');
    }
    const fn_searchRawMtrInvntr = async function () {
        let ymd = gfn_dateToYmd(new Date());

        let postUrl = "/am/wrhs/selectRawMtrWrhsPrfmncList.do";
        const postJsonPromise = gfn_postJSON(postUrl, {
            apcCd: gv_selectedApcCd,
            wrhsYmdFrom: ymd,
            wrhsYmdTo: ymd,
        });
        const data = await postJsonPromise;
        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }
        jsonRawMtrInvntr = data.resultList;
        grdRawMtrInvntr.rebuild();
    }
    const fn_modal = async function (_this = null) {
        const displayValue = $('#modal').css('display');
        if (displayValue === 'none') {
            $("#modal").css("display", "block");
        } else {
            $("#modal").css("display", "none");
            return;
        }

        let wrhsYmd = SBUxMethod.get("srch-dtp-ymd");
        let postUrl = "/am/wrhs/selectRawMtrWrhsPrfmncList.do";

        const postJsonPromise = gfn_postJSON(postUrl, {
            apcCd: gv_selectedApcCd,
            wrhsYmdFrom: wrhsYmd,
            wrhsYmdTo: wrhsYmd,
            invntrYn: 'Y'
        }, '', true);

        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        jsonRawMtrInvntr = data.resultList.filter(item => {
            return !sortSaveList.some(savedItem => savedItem.prdcrIdentno === item.prdcrIdentno);
        });
        grdRawMtrInvntr.rebuild();

        if (_this) {
            let input = _this.previousElementSibling;
            fn_setPltno = async function () {
                /** 재고정보 json push **/
                let nRow = grdRawMtrInvntr.getRow();
                let rowData = grdRawMtrInvntr.getRowData(nRow);

                /** 생산자번호 set **/
                $(input).val(rowData.prdcrIdentno);
                $("#modal").css("display", "none");
                /** 선별실적 VO 공통정보 set **/
                let vo = JSON.parse(JSON.stringify(sortPrfmncVO));
                vo.sortYmd = wrhsYmd;
                vo.rawMtrInvntrList.push({
                    inptQntt: rowData.invntrQntt,
                    inptWght: rowData.invntrWght,
                    wrhsno: rowData.wrhsno
                });
                vo.itemCd = rowData.itemCd;
                /** 화면내 사용할 필드 추후 간섭여부 확인해야함 **/
                vo.prdcrIdentno = rowData.prdcrIdentno;
                vo.vrtyCd = rowData.vrtyCd;
                sortSaveList.push(vo);

                /** btn 재사용 **/
                $(_this).text("저장");
                $(_this).off("click").on("click", function () {
                    fn_saveSortPrfmnc(this);
                });

                /** 출하포장단위 조회 상품에대한 **/
                if (jsonSpmtPckgUnit.length == 0) {
                    jsonSpmtPckgUnit = await gfn_getSpmtPckgUnits(gv_selectedApcCd, rowData.itemCd, rowData.vrtyCd);
                }

            };
            grdRawMtrInvntr.bind('click', 'fn_setPltno');
        }
    };
    const fn_closeCnptModal = function(){
        /** 출하 저장내역 삭제 **/
        spmtSaveList.length = 0;
        $("#cnpt").css("display","none");
    }
    let fn_setPltno = () => {
    };
    const fn_modalDrag = function () {
        const position = {x: 0, y: 0};
        interact('#modal').draggable({
            listeners: {
                start(event) {
                    const style = window.getComputedStyle(event.target);
                    const matrix = new DOMMatrixReadOnly(style.transform);

                    position.x = matrix.m41;
                    position.y = matrix.m42;
                },
                move(event) {
                    position.x += event.dx
                    position.y += event.dy

                    event.target.style.transform = `translate(${'${position.x}'}px, ${'${position.y}'}px`;
                },
            }
        })
    };
    //endregion modal fn
    //endregion utill
    
    /** init **/
    const fn_init = async function () {
        /** common **/
        //등급 목록
        await fn_selectGrdList();

        //창고 옵션 선택
        await fn_selectWarehouse();

        //거래처 목록
        await fn_selectCnptList();

        /** thead **/
            //colgroup
        let table = document.getElementById("sortTable");
        let colgroup = table.querySelector("colgroup");
        if (!colgroup) {
            colgroup = document.createElement("colgroup");
            table.prepend(colgroup);
        }
        //col ratio
        let size = grdList.length;
        let ratio = 91 / size;
        let thead = table.querySelector("thead");
        //최상단 colspan
        thead.querySelectorAll("tr")[0].querySelector("th").setAttribute("colspan", (size * 2) + 1);
        //최상단 여백
        thead.appendChild(document.createElement("tr"));
        Array.from({length: size}, () => {
            let th = document.createElement("th");
            th.colSpan = 2;
            let input = document.createElement("input");
            input.style.width = "100%";
            input.style.textAlign = "center";
            input.readOnly = true;
            th.appendChild(input);
            thead.querySelectorAll("tr")[2].appendChild(th);
        });

        grdList.forEach(function (item) {
            //colgroup set
            let col = document.createElement("col");
            col.style.width = `${'${ratio/2}'}%`;
            colgroup.appendChild(col);
            colgroup.appendChild(col);
            //thead set
            let th = document.createElement("th");
            th.innerHTML = item.grdNm;
            th.dataset.grdCd = item.grdCd;
            th.colSpan = 2;
            thead.querySelectorAll("tr")[1].appendChild(th);
        });
        /** tbody **/
        let tbody = document.createElement("tbody");
        for (let i = 0; i < 25; i++) {
            let tr = document.createElement("tr");
            for (let j = 0; j <= size; j++) {
                let td = document.createElement("td");
                let input = document.createElement("input");
                input.type = j === 0 ? 'text' : 'number';
                if (j === 0) {
                    let wrap = document.createElement("div");
                    wrap.style.display = 'flex';

                    Object.assign(input.style, {flex: '2', width: '100%'});
                    input.readOnly = true;

                    let btn = document.createElement("button");
                    Object.assign(btn.style, {flex: '1', width: '100%'});
                    btn.classList.add("searchBtn");
                    btn.textContent = "조회";
                    wrap.appendChild(input);
                    wrap.appendChild(btn);
                    td.appendChild(wrap);
                } else {
                    td.colSpan = 2;
                    input.style.width = "100%";
                    td.appendChild(input);
                }
                tr.append(td);
                tbody.appendChild(tr);
            }
            table.appendChild(tbody);
        }
        /** foot word **/
        let words = ["강서", "영진", "상주", "한국", "서운", "시판", "이월"];
        let tfoot = document.createElement("tfoot");
        let tr = document.createElement("tr");
        tr.style.borderTop = '2px double black';
        for (let k = 0; k <= size; k++) {
            let td = document.createElement("td");
            td.colSpan = k == 0 ? 1 : 2;
            let input = document.createElement("input");
            input.style.width = "100%";
            if (k % 2 > 0) {
                let word = words.shift();
                input.value = word;
                input.readOnly = true;
                input.style.textAlign = 'center';
            }
            td.appendChild(input);
            tr.append(td);
        }
        tfoot.appendChild(tr);
        tr = document.createElement("tr");
        for (let l = 0; l <= size; l++) {
            let td = document.createElement("td");
            td.colSpan = l == 0 ? 1 : 2;
            let input = document.createElement("input");
            input.style.width = "100%";
            if (l === 13) {
                input.value = '총계';
                input.readOnly = true;
                input.style.textAlign = 'center';
            }
            td.appendChild(input);
            tr.append(td);
        }
        tfoot.appendChild(tr);
        table.appendChild(tfoot);

        $("#yyyy").text(gfn_dateToYear(new Date()));

        //table valueChg event
        fn_addChange();
    }
    /** 생산자 입력 이벤트 핸들러 **/
    const fn_addChange = function () {
        /** 입고번호(생산자라인) 입력시 **/
        //input 스캐너 사용시 대비
        // $("#sortTable > tbody > tr > td:first-child input").on("input", function () {
        //     fn_searchRawMtrInvntr($(this));
        // });
        /** save by row**/
        // $("#sortTable tbody tr").on("focusout", function(event) {
        //     let tr = $(this);
        //
        //     setTimeout(function() {
        //         if (!tr.is(":has(:focus)")) {
        //             fn_saveSortPrfmnc(event);
        //         }
        //     }, 10);
        // });

        $("#sortTable > tbody > tr > td:first-child button").on("click", function () {
            fn_modal(this);
        });
        /** 수량 입력시 sortSaveList 셋팅 **/
        $("#sortTable tbody tr td:not(:first-child) input").on("change", function () {
            fn_setJsonSortPrfmnc($(this));
        });
    }
    /** sortPrfmnc 저장 list set **/
    const fn_setJsonSortPrfmnc = function (_el) {
        /** nRow idx **/
        let rowIndex = $(_el).closest("tr").index();
        /** nCol idx **/
        let colIndex = $(_el).closest("td").index();
        /** 생산자 미선택시 **/
        if (!sortSaveList[rowIndex]) {
            Swal.fire({
                title: '생산자를 선택해주세요',
                icon: 'warning',
            });
            $(_el).val("");
            return;
        }
        /** sortSaveList 참조 => 해당 로우의 sortPrfmncList push **/
        let grdVO = {...grdList[colIndex - 1]};
        let rowVO = {...sortSaveList[rowIndex]};
        /** 출하포장단위 필터링 **/
        let spmtVO = jsonSpmtPckgUnit.filter(item => {
            return item.gdsGrd == grdVO.aftrGrdCd && item.itemCd == grdVO.itemCd;
        })[0];
        /** 수량,중량,창고구분 **/
        let qntt = parseInt($(_el).val());
        let wght = parseInt(qntt) * spmtVO.spcfctWght;
        let warehouseSeCd = $("#warehouse").val();

        if (rowVO) {
            /** 실적이 있다가 공백이 된 경우 **/
            let index = rowVO.sortPrfmncList.findIndex(item => item.grdCd === grdVO.grdCd);
            if (index !== -1) {
                if (qntt === 0) {
                    rowVO.sortPrfmncList.splice(index, 1);
                } else {
                    rowVO.sortPrfmncList[index].sortQntt = qntt;
                    rowVO.sortPrfmncList[index].sortWght = wght;
                }
            }else{
                /** 선별실적 상세 리스트 포맷 **/
                rowVO.sortPrfmncList.push({
                    autoPckgInptYn: 'Y',
                    warehouseSeCd: warehouseSeCd,
                    fcltCd: '01', //설비없음
                    inptYmd: rowVO.sortYmd,
                    itemCd: rowVO.itemCd,
                    vrtyCd: rowVO.vrtyCd,
                    grdCd: grdVO.grdCd,
                    spcfctCd: spmtVO.spcfctCd,
                    spmtPckgUnitCd: spmtVO.spmtPckgUnitCd,
                    gdsGrd: spmtVO.gdsGrd,
                    sortQntt: qntt,
                    sortWght: wght,
                    gdsStdGrdList: [{
                        grdSeCd: '03',
                        itemCd: rowVO.itemCd,
                        grdKnd: grdVO.aftrGrdKnd,
                        grdCd: grdVO.aftrGrdCd
                    }],
                    stdGrdList: [{
                        grdSeCd: grdVO.grdSeCd,
                        itemCd: rowVO.itemCd,
                        grdKnd: grdVO.grdKnd,
                        grdCd: grdVO.grdCd
                    }]
                });
            }
        }

        /** tatal ++ **/
        let result = rowVO.sortPrfmncList.reduce((acc, item) => acc + item.sortQntt, 0);
        $(_el).closest('tr').children('td:last').find('input').val(result);
    }

    /** 선별등급 목록조회**/
    const fn_selectGrdList = async function () {
        let apcCd = gv_selectedApcCd;
        let itemCd = '0901';
        let grdSeCd = '02';
        let grdKnd = '01';

        let postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdDtlList.do", {
            apcCd: apcCd,
            itemCd: itemCd,
            grdSeCd: grdSeCd,
            grdKnd: grdKnd
        });
        let data = await postJsonPromise;
        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }
        /** 총계 추가 **/
        data.resultList.push({grdNm: "총계"});
        grdList = data.resultList;
    }
    /** 거래처 목록 조회 **/
    const fn_selectCnptList = async function () {
        const postJsonPromise = gfn_postJSON(URL_CNPT_INFO, {apcCd: gv_selectedApcCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }
        let $container = $("#cnpt div.grd_container");

        data.resultList.forEach(function(item,idx){
            $container.append(`<div onclick="fn_selectCnpt(this)" class="cell" data-idx="${'${idx}'}" data-cnpt-cd="${'${item.cnptCd}'}">${'${item.cnptNm}'}</div>`);
        });
    }
    /** 출하실적 등록시 거래처 팝업내 선택 function **/
    const fn_selectCnpt = async function(_el){
        $(_el).siblings().removeClass("active");
        $(_el).addClass("active");
        await Swal.fire({
            title: `출하실적 등록하시겠습니까?`,
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '저장',
            cancelButtonText: '취소',
        }).then(async result => {
           if(result.isConfirmed){
               $("#cnpt").css("display","none");
               let cnptCd = $(_el).data('cnptCd');
               spmtSaveList.forEach(item => item.cnptCd = cnptCd);

               const postJsonPromise = gfn_postJSON("/am/spmt/insertSpmtPrfmncList.do", spmtSaveList);
               const data = await postJsonPromise;

               if (!_.isEqual("S", data.resultStatus)) {
                       gfn_comAlert(data.resultCode, data.resultMessage);
                       return;
               }
               Swal.fire(
                   '처리되었습니다.',
                   '',
                   'success'
               );
               /** 등록 이후 원복처리 **/
               fn_reset();
           }else{
               fn_closeCnptModal();
           }
        });
    }
    /** 선별실적 등록시 필요한 VlType(환경설정) **/
    const fn_selectApcStng = async function () {
        await gfn_getApcStng(gv_selectedApcCd);

        if (!gfn_isEmpty(gv_apcStng)) {
            lv_rawMtrVlType = gv_apcStng.rawMtrVlType;
        }
    }
    /** 창고리스트 set **/
    const fn_selectWarehouse = async function () {
        jsonComWarehouse = await gfn_getComCdDtls("WAREHOUSE_SE_CD", gv_selectedApcCd);
        const select = document.getElementById("warehouse");
        jsonComWarehouse.forEach(function (item) {
            const option = document.createElement("option");
            option.value = item.cdVl;
            option.textContent = item.cdVlNm;
            select.appendChild(option);
        });
    }
   
    /** 전체 초기화 **/
    const fn_reset = async function () {
        /** table 초기화 **/
        let trs = $("#sortTable > tbody tr").toArray();
        trs.forEach(function (item) {
            $(item).find("td:first").find("button").text("조회");
            /** 재고조회 버튼 이벤트핸들러 초기화 **/
            $(item).find("td:first").find("button").off("click").on("click", function () {
                fn_modal(this);
            });
            $(item).find("td:not(:first-child)").find('input').off("change").on("change",function () {
                fn_setJsonSortPrfmnc($(this));
            });
            $(item).find("input").val("").prop("disabled", false);
            $(item).find("td").removeClass("first end mid selected");

            /** 재고분리된 로우 처리 어케했지? **/
            let tds = Array.from($(item).find("input.left"));
            if(tds.length > 0){
                tds.forEach(function(item){
                   $(item).closest("td").attr("colspan","2");
                   $(item).closest("td").next().remove();
                });
            }

            $(item).find("input").removeClass("left right");

        });
        /** modal 노출된 경우 **/
        $("#modal").css("display", "none");
        $("#cnpt").css("display", "none");
        /** td eventListner 초기화 **/
        $("#sortTable tbody td").off('pointerdown');
        /** 출하등록 버튼 초기화 **/
        SBUxMethod.refresh("spmtMode", {text: '출하등록', onclick: 'fn_spmtMode'});
        /** 작업중 colIdx 초기화 **/
        nowColIdx = 0;
        /** 출하 저장대상 리스트 초기화 **/
        spmtSaveList.length = 0;
        /** 선별 저장대상 리스트 초기화 **/
        sortSaveList.length = 0;
        /** 상품재고 정보 초기화 **/
        gdsInvntrList.length = 0;

        /** 선별실적 조회 **/
        await fn_searchSortPrfmnc();
        /** 출하실적 조회 **/
        await fn_searchSpmtPrfmncList();
        /** 상품재고 조회 **/
        await fn_searchGdsInvntr();
    }

    /** btn- 출하등록,저장 스위치 **/
    function fn_spmtMode() {
        /** input stop **/
        let flag = SBUxMethod.get("spmtMode");
        flag = flag == '저장' ? false : true;
        fn_inputDisabled(flag);
    };
    /** 출하등록 모드 진입시 input 비활성화 **/
    async function fn_inputDisabled(flag) {
        document.querySelectorAll('#sortTable tbody input').forEach(input => {
            input.disabled = flag;
        });
        if (flag) {
            await fn_addTdSelected();
            SBUxMethod.refresh("spmtMode", {text: '저장', onclick: 'fn_saveSpmt'});
        } else {
            SBUxMethod.refresh("spmtMode", {text: '출하등록', onclick: 'fn_spmtMode'});
        }
    };
    /** 출하등록 모드 on  **/
    function fn_addTdSelected() {
        $("#sortTable tbody td").off('pointerdown').on('pointerdown', function (event) {
            fn_pointerDownSeleted(event);
        });
    };
    /** 상품재고 분리 모드 on **/
    function fn_decompositionMode() {
        document.querySelectorAll('#sortTable tbody input').forEach(input => {
            input.disabled = true;
        });
        /** 출하등록 disabled **/
        SBUxMethod.refresh("spmtMode", {text: '출하등록', onclick: 'fn_spmtMode'});
        SBUxMethod.attr('spmtMode', 'disabled', 'true');

        let flag = SBUxMethod.get("decompositionMode");
        if(flag == '재고분리 ON'){
            /** 재고분리는 1회성인데 아직 처리 안한채로 취소할경우 **/
            $("#sortTable tbody td").off('pointerdown'); //이벤트 해제
            SBUxMethod.set("decompositionMode","재고분리 OFF");
            $("#decompositionMode").removeClass("btn_on");
            return;
        }else{
            SBUxMethod.set("decompositionMode","재고분리 ON");
            $("#decompositionMode").addClass("btn_on");
        }
        
        $("#sortTable tbody td").off('pointerdown').on('pointerdown', function (event) {
            fn_pointerDownDecomposition(event);
        });
    }
    
    /** td 선택 eventListener **/
    function fn_pointerDownSeleted(event) {

        /** 총량 표시가 있다면 삭제 **/
        // $target.find("span").remove();

        if ($(event.target).is('input')) {
            event.stopPropagation();
            return;
        }
        event.preventDefault();
        const $target = $(event.target);
        const rowIdx = $target.closest('tr').index();  // 현재 td가 속한 행의 인덱스
        const colIdx = $target.index();  // 현재 td가 속한 열의 인덱스
        const inputValue = $target.find('input').val();

        /** 선별내역이 없을때 **/
        if (!inputValue) {
            return;
        };

        if ($target.find('input').is('.left, .right')) {
            nowColIdx = $target.find('input').hasClass('right') ? colIdx - 1 : colIdx;
        } else {
            /** 열을 등급별로 움직였을떄 **/
            if (nowColIdx > 0) {
                if (nowColIdx !== colIdx) {
                    return;
                }
            };
            /** 현재 col 저장 **/
            nowColIdx = colIdx;
        }

        if ($target.hasClass("selected")) {
            $target.removeClass("selected first end mid");
            /** 마지막 셀이였다면 ? **/
            let selecteds = Array.from($("#sortTable tbody td.selected")).filter(function (item) {
                return $(item).index() === nowColIdx;
            }).length;
            if (selecteds == 0) {
                nowColIdx = 0;
            }
        } else {
            $target.addClass("selected");
        }

        /** UI 정리 **/
        Array.from($("#sortTable tbody td.selected")).filter(function (item) {
            var index = $(item).index();

            // right 분리된 재고일 경우 필터 조건 부적합
            if ($(item).find("input").hasClass("right")) {
                return index - 1 === nowColIdx && $(item).css('pointer-events') !== 'none';
            } else {
                return index === nowColIdx && $(item).css('pointer-events') !== 'none';
            }
        }).forEach(function (item, idx, arr) {
            /* 초기화 */
            $(item).removeClass("first end mid");
            /* 한개뿐이면 생략 */
            if (arr.length == 1) {
                return;
            }

            if (idx == 0) {
                $(item).addClass("first");
            } else if (idx == arr.length - 1) {
                $(item).addClass("end");
            } else {
                $(item).addClass("mid");
            }
        });
    }
    /** td 분리 eventListener **/
    function fn_pointerDownDecomposition(event) {
        if ($(event.target).is('input')) {
            event.stopPropagation();
            return;
        }
        event.preventDefault();
        const $target = $(event.target);

        if ($target.attr('colspan') === '2') {
            /**재고가 없거나 1인데 분리시킬떄 **/
            let invntrCnt = parseInt($target.find('input').val()) || 0;
            if(invntrCnt == 0){
                return;
            }

            if(invntrCnt < 2){
                Swal.fire({
                    title: "분리할 재고수량이 부족합니다",
                    icon: "error",
                    width:"500px"
                });
                return;
            }

            const inputValue = $target.find('input').val();

            let $firstTd = $('<td>').css("position", "relative");
            let $secondTd = $('<td>');

            const $inputLeft = $('<input>')
                .attr('type', 'number')
                .css("width", "100%")
                .addClass('left');
            const $inputRight = $('<input>')
                .attr('type', 'number')
                .css("width", "100%")
                .addClass('right');
            const $invntrToolTip = $('<span>')
                .css("position", "absolute")
                .css("left", "0")
                .css("top", "0")
                .text(inputValue);

            $firstTd.append($inputLeft)
            $firstTd.append($invntrToolTip);
            $secondTd.append($inputRight);

            $target.replaceWith($firstTd);
            $firstTd.after($secondTd);


            $inputLeft.focus();
            $inputLeft.on('focusout', function (event) {
                if (!$(event.target).val()) {
                    $(event.target).focus();
                } else {
                    let inputCnt = $(event.target).val();
                    let invntrCnt = parseInt($($invntrToolTip).text());
                    if (invntrCnt - inputCnt <= 0) {
                        Swal.fire({
                            icon: 'info',
                            title: '재고가 부족합니다.',
                            toast: true,
                            position: 'top',
                            showConfirmButton: false,
                            timer: 1500,
                            timerProgressBar: true,
                            customClass: {
                                title: 'custom-toast-title'
                            },
                        });
                        $(event.target).val(null);
                        $(event.target).focus();
                    } else {
                        $($inputRight).val(null);
                        $($inputRight).focus();
                    }
                }
            });
            $inputRight.on('focusout', function (event) {
                let inputCnt = $(event.target).val();
                let currentTd = $(event.target).closest('td');
                let leftTd = currentTd.prev();
                let leftInput = parseInt(leftTd.find('input').val()) || 0;
                let invntrCnt = parseInt(leftTd.find('span').text()) || 0;

                if (!$(event.target).val()) {
                    //1안 $(event.target).focus();
                    //2안
                    $(event.target).val(invntrCnt - leftInput);
                    //정상입력
                    leftTd.find('span').css('display', 'none');
                    $(leftTd).find('input').attr('disabled', true);
                    $(event.target).attr('disabled', true);
                } else {
                    if (invntrCnt - leftInput - inputCnt < 0) {
                        Swal.fire({
                            icon: 'info',
                            title: '재고가 부족합니다.',
                            toast: true,
                            position: 'top',
                            showConfirmButton: false,
                            timer: 1500,
                            timerProgressBar: true,
                            customClass: {
                                title: 'custom-toast-title'
                            },
                        });
                        $(event.target).val(invntrCnt - leftInput);
                        $(event.target).focus();
                    } else {
                        //정상입력
                        leftTd.find('span').css('display', 'none');
                        $(leftTd).find('input').attr('disabled', true);
                        $(event.target).attr('disabled', true);
                    }
                }
            });
        } else {
            Swal.fire({
                title: '분리된 재고입니다 병합하시겠습니까?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '병합',
                cancelButtonText: '취소',
                width: '500px'
            }).then(async result => {
                if (result.isConfirmed) {
                    /** target의 left right 판단 **/
                    var $input = $target.find("input");
                    var classList = $input.prop("classList");
                    let total = $input.val();
                    let $td = $input.closest('td');

                    if ([...classList].includes("left")) {
                        let cnt = parseInt($input.val());
                        cnt += parseInt($td.next().find('input').val());
                        $td.attr("colspan", "2");
                        $td.find('input').val(cnt);
                        $td.next().remove();
                    } else if ([...classList].includes("right")) {
                        let cnt = parseInt($input.val());
                        cnt += parseInt($td.prev().find('input').val());
                        $td.prev().find('input').val(cnt);
                        $td.prev().attr("colspan", "2");
                        $td.remove();
                    }
                }

            });
        }

        $("#sortTable tbody td").off('pointerdown');
        SBUxMethod.set("decompositionMode","재고분리 OFF");
        $("#decompositionMode").removeClass("btn_on");

        SBUxMethod.attr('spmtMode', 'disabled', 'false');
        document.querySelectorAll('#sortTable tbody input').forEach(input => {
            input.disabled = false;
        });
    }
    
    /** 출하실적 저장 **/
    async function fn_saveSpmt() {
        let saveList = Array.from($("#sortTable tbody td.selected")).filter(function (item) {
            var index = $(item).index();

            if ($(item).find("input").hasClass("right")) {
                return index - 1 === nowColIdx && $(item).css('pointer-events') !== 'none';
            } else {
                return index === nowColIdx && $(item).css('pointer-events') !== 'none';
            }
        });
        const sum = saveList.reduce((total, item) => {
            const inputValue = $(item).find("input").val();
            return total + (parseFloat(inputValue) || 0); // 숫자로 변환 후 합산 (빈 값은 0 처리)
        }, 0);

        if(saveList.length < 1){
            Swal.fire({
                title: "출하실적 대상이 없습니다.",
                text: "입고실적을 확인해주세요.",
                icon: "error"
            });
            $("#sortTable tbody td").off('pointerdown');
            SBUxMethod.refresh("spmtMode", {text: '출하등록', onclick: 'fn_spmtMode'});
            return;
        }
       saveList.forEach(function (item, idx, arr) {
            if ($(item).hasClass("end")) {
                const span = document.createElement("span");
                span.innerText = sum + "";
                Object.assign(span.style, {
                    position: "absolute",
                    right: 0,
                    top: 0,
                    zIndex: "1000",
                    border: "1px solid black",
                    borderRadius: "50%",
                    width: "20px",
                    height: "20px",
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "center",
                    textAlign: "center"
                });
                $(item).append(span);
            }
        });
        /** 저장 대상의 상품정보 **/
        let gdsList = gdsInvntrList[String(nowColIdx)];
        /** 출하일자 **/
        let spmtYmd = SBUxMethod.get("srch-dtp-ymd");

        /** 출하실적 saveObj 포맷팅 **/
        saveList.forEach(function(item){
           let $tr = $(item).closest('tr');
           let $identno = $tr.find('td:first').find('input').val();
           let $qntt = $(item).find('input').val();

           let nGdsInfo = gdsList.filter(item => item.prdcrIdentno == $identno);
           let unitWght = nGdsInfo[0].invntrWght / nGdsInfo[0].invntrQntt;

            let vo = JSON.parse(JSON.stringify(nGdsInfo[0]));
            vo.spmtQntt = $qntt;
            vo.spmtWght = $qntt * unitWght;
            vo.spmtYmd = spmtYmd;
            vo.prdcrCd = vo.rprsPrdcrCd;
            vo.cnptCd = '';
            spmtSaveList.push(vo);
        });
        /** 거래처 선택 팝업 **/
        $("#cnpt").css("display","block");
    }
    /** 선별실적 저장 **/
    const fn_saveSortPrfmnc = async function (_el) {
        let rowIndex = $(_el).closest("tr").index();
        let word = $(_el).text();

        await Swal.fire({
            title: `${'${word}'}하시겠습니까?`,
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '저장',
            cancelButtonText: '취소',
        }).then(async result => {
            if (result.isConfirmed) {
                let saveObj = sortSaveList[rowIndex];

                let sortno = saveObj.sortno;
                const postUrl = gfn_isEmpty(sortno) ?
                    "/am/sort/insertSortPrfmnc.do" : "/am/sort/updateSortPrfmnc.do";
                try {
                    const postJsonPromise = gfn_postJSON(postUrl, saveObj);
                    const data = await postJsonPromise;

                    if (_.isEqual("S", data.resultStatus)) {
                        Swal.fire(
                            '처리되었습니다.',
                            '',
                            'success'
                        );
                        fn_reset();
                    } else {
                        Swal.fire(
                            '오류가발생했습니다.',
                            '',
                            'error'
                        );
                    }
                } catch (e) {
                    if (!(e instanceof Error)) {
                        e = new Error(e);
                    }
                    console.error("failed", e.message);
                    Swal.fire(
                        '오류가발생했습니다.',
                        '',
                        'error'
                    );
                }
            }
        });
    }
    
    /** 원물재고 조회 - 미사용 **/
    // const fn_searchRawMtrInvntr = async function (_el) {
    //     /** 스캐너 사용 가정 **/
    //     const pattern = /^[A-Z]{2}\d{12}$/;
    //     let val = $(_el).val();
    //
    //     if (!pattern.test(val)) {
    //         return;
    //     }
    //     const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsList.do", {
    //         apcCd: gv_selectedApcCd,
    //         pltno: val,
    //         pagingYn: 'N',
    //     }, null, true);
    //     const data = await postJsonPromise;
    //     if (!_.isEqual("S", data.resultStatus)) {
    //         gfn_comAlert(data.resultCode, data.resultMessage);
    //         return;
    //     }
    //     if (data.resultList.length > 0) {
    //         rawMtrInvntr.push(data.resultList[0]);
    //
    //         /** set identno **/
    //         let prdcrIdentno = data.resultList[0].prdcrIdentno;
    //         $(_el).val(prdcrIdentno);
    //     } else {
    //         /** 해당 pltno로 목록없을경우 **/
    //         Swal.fire({
    //             title: "재고정보 없음",
    //             text: "입고실적을 확인해주세요.",
    //             icon: "error"
    //         });
    //         $(_el).val("");
    //         $(_el).focus();
    //     }
    //
    // }
    /** 선별실적 조회 **/
    async function fn_searchSortPrfmnc() {
        let ymd = SBUxMethod.get("srch-dtp-ymd");
        let warehouseSeCd = $("#warehouse").val();

        const postJsonPromise = gfn_postJSON("/am/sort/selectSortPrfmnc0244.do", {
            apcCd: gv_selectedApcCd,
            inptYmd: ymd,
            warehouseSeCd: warehouseSeCd,
        });
        const data = await postJsonPromise;
        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }
        if (data.resultList.length > 0) {
            let itemCd = data.resultList[0].ITEM_CD;
            let vrtyCd = data.resultList[0].VRTY_CD;
            /** 출하포장단위 조회 상품에대한 **/
            if (jsonSpmtPckgUnit.length == 0) {
                jsonSpmtPckgUnit = await gfn_getSpmtPckgUnits(gv_selectedApcCd, itemCd, vrtyCd);
            }
        }

        /** table tbody get **/
        let trs = $("#sortTable > tbody tr");

        /** 조회결과 idx 로 table set (order by sortno 보장 O) **/
        data.resultList.forEach(function (item, idx) {
            /** 기존 fn_setPltno 와 같은 셋팅 **/
            let vo = JSON.parse(JSON.stringify(sortPrfmncVO));
            vo.sortYmd = ymd;
            vo.rawMtrInvntrList.push({
                inptQntt: item.QNTT,
                inptWght: item.WGHT,
                wrhsno: item.WRHSNO
            });
            vo.itemCd = item.ITEM_CD;
            vo.vrtyCd = item.VRTY_CD;
            vo.prdcrIdentno = item.PRDCR_IDENTNO;
            /** 수정조건 선별번호 **/
            vo.sortno = item.SORTNO;
            sortSaveList.push(vo);
            /** idx 선별 실적 이력으로 table tr 추적 **/
            let tr = trs[idx];
            $(tr).find("td:first").find("button").text("수정");
            $(tr).find("td:first").find("button").off("click").on("click", function () {
                fn_saveSortPrfmnc(this);
            });
            /** 생산자 identno **/
            $(tr).find("td:first").find("input").val(item.PRDCR_IDENTNO);

            /** 등급별 수량 입력 **/
            let sortPrfmncJson = JSON.parse(item.GRD_JSON);
            sortPrfmncJson.forEach(function (item) {
                let colIdx = grdList.findIndex(value => value.grdCd == item.GRD_CD);
                let input = $(tr).children("td").eq(colIdx + 1).find("input");
                $(input).val(item.SORT_QNTT).trigger("change");
            });
        });
    }
    /** 상품재고 조회 (출하실적 등록시 필요한 정보) **/
    async function fn_searchGdsInvntr(){
        let wrhsYmd = SBUxMethod.get("srch-dtp-ymd");
        let warehouseSeCd = $("#warehouse").val();
        let itemCd = '0901';
        let vrtyCd = '0200';
        let gdsSeCd = '1';

        const postJsonPromise = gfn_postJSON("/am/invntr/selectGdsInvntrList.do", {
            apcCd			: gv_selectedApcCd,
            pckgYmdFrom		: wrhsYmd,
            pckgYmdTo		: wrhsYmd,
            warehouseSeCd	: warehouseSeCd,
            itemCd			: itemCd,
            vrtyCd			: vrtyCd,
            gdsSeCd 		: gdsSeCd,
        });
        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
        }
        const groupedData = data.resultList.reduce((acc, item) => {
            let key = parseInt(item.sortGrdCd, 10);
            (acc[key] = acc[key] || []).push(item);
            return acc;
        }, {});
        gdsInvntrList = groupedData;
    }
    /** 출하실적 조회 **/
    async function fn_searchSpmtPrfmncList(){
        let wrhsYmd = SBUxMethod.get("srch-dtp-ymd");
        let itemCd = '0901';
        let vrtyCd = '0200';

        let SpmtPrfmncVO = {
            apcCd: gv_selectedApcCd
            , spmtYmdFrom: wrhsYmd
            , spmtYmdTo: wrhsYmd
            , itemCd: itemCd
            , vrtyCd: vrtyCd
        }
        let postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncList.do", SpmtPrfmncVO);
        let data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
        }

        const groupedData = data.resultList.reduce((acc, item) => {
            let key = item.spmtno;
            (acc[key] = acc[key] || []).push(item);
            return acc;
        }, {});
        Object.values(groupedData).forEach(arr => {
            nowColIdx = parseInt(arr[0].gdsGrd, 10);
            /** UI 정리용 **/
            let nArr = [];
            /** thead 출하 수량 **/
            let spmtTotal = 0;

            arr.forEach((item,idx) => {
                let col = parseInt(item.gdsGrd,10);
                let row = Array.from($("tbody td:first-child input")).filter(inner => {
                    return $(inner).val() == item.prdcrIdentno;
                }).map(inner => $(inner).closest("tr").index());
                let cell = $("#sortTable tbody tr").eq(row).find("td").eq(col);
                let spmtQntt = parseInt($(cell).find('input').val());
                spmtTotal += item.spmtQntt;
                if(spmtQntt !== item.spmtQntt){
                    //TODO:: 근데 또 이미 분해되어있는데 하나 더 들어간다 ? colspan으로 계산해서 반대쪽에 set
                    let $target = $(cell);
                    if ($target.attr('colspan') === '2') {
                        let $firstTd = $('<td>');
                        let $secondTd = $('<td>');
                        const $inputLeft = $('<input>')
                            .attr('type', 'number')
                            .css("width", "100%")
                            .addClass('left');
                        $inputLeft.val(parseInt(item.spmtQntt));

                        const $inputRight = $('<input>')
                            .attr('type', 'number')
                            .css("width", "100%")
                            .addClass('right');
                        $inputRight.val(spmtQntt - parseInt(item.spmtQntt));

                        $firstTd.append($inputLeft)
                        $secondTd.append($inputRight);
                        $target.replaceWith($firstTd);
                        $firstTd.after($secondTd);
                        /** 첫 실적일때 왼쪽이 기준이됨 **/
                        cell = $firstTd;
                    }else{ //이미 분해된 경우 right에 삽입
                        /** 조회시에 분해되어있는건 좌항에 이미 값이 있을떄 **/
                        if($target.find('input').val() > 0){
                            $target.next().find('input').val(item.spmtQntt);
                            cell = $target.next();
                        }
                    }
                }
                $(cell).find("input").attr("readonly",true);
                $(cell).addClass("selected");
                $(cell).css("pointer-events","none");
                nArr.push($(cell));
            });
            /** UI 정리 **/
            let sum = 0;
            nArr.forEach(function (item, idx, arr) {
                /* 초기화 */
                $(item).removeClass("first end mid");
                /* 한개뿐이면 생략 */
                if (arr.length == 1) {
                    return;
                }

                if (idx == 0) {
                    $(item).addClass("first");
                    sum += parseInt($(item).find('input').val());
                } else if (idx != arr.length - 1) {
                    $(item).addClass("mid");
                    sum += parseInt($(item).find('input').val());
                } else {
                    $(item).addClass("end");
                    sum += parseInt($(item).find('input').val());
                    /** 마지막 지정 **/

                    const span = document.createElement("span");
                    span.innerText = sum + "";
                    Object.assign(span.style, {
                        position: "absolute",
                        right: 0,
                        top: 0,
                        zIndex: "1000",
                        border: "1px solid black",
                        borderRadius: "50%",
                        width: "20px",
                        height: "20px",
                        display: "flex",
                        alignItems: "center",
                        justifyContent: "center",
                        textAlign: "center"
                    });
                    $(item).append(span);
                }
            });

            /** thead **/
            let spmtTotalEl = $("#sortTable thead tr").eq(2).find('input').eq(nowColIdx -1);
            let prevCnt = parseInt($(spmtTotalEl).val());

            if(prevCnt > 0){
                $(spmtTotalEl).val(spmtTotal + prevCnt);
            }else{
                $(spmtTotalEl).val(spmtTotal);
            }
        });

        spmtTotalEl.forEach(function(item,idx){

        });
        /** 작업 col 초기화 **/
        nowColIdx = 0;
    }

    window.addEventListener("DOMContentLoaded", async function () {
        await SBUxMethod.set("srch-dtp-ymd",gfn_dateToYmd(new Date()));
        await fn_modalDrag();
        await fn_createRawMtrInvntrGrid();
        await fn_init();

        await fn_searchSortPrfmnc();
        await fn_searchGdsInvntr();
        await fn_searchSpmtPrfmncList();
    });

</script>
</html>
