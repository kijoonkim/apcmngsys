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
            height: 97%;
            user-select: none;
        }

        .iner-wrap > table th {
            text-align: center;
            border: 1px solid black !important;
            line-height: 2;
            font-weight: initial;
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
            position: relative;
        }

        td.selected.first {
            border-bottom-width: 1px !important;
        }

        td.selected.end {
            border-top-width: 1px !important;
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
        @media print {
            body{
                min-height: 90vh!important;
                height: 90vh!important;
            }
            .no-print {
                display: none !important;
            }
            span.sbux-pik-icon-span{
                display: none !important;
            }
            @page {
                size: A4;
                /*margin: 0;*/
                margin: 15px;
                /*margin-top: 5cm;*/
            }
            div.area-wrap {
                width: 100%;
                height: 100%;
                overflow: initial;
                margin-top: 5vh;
            }
            #sortTable *{
                font-size: 12px!important;
            }
            #sortTable{
                border-collapse: collapse!important;
            }
            #sortTable tbody span{
                width: 12px!important;
                height: 12px!important;
                font-size: 8px!important;
            }
            #sortTable colgroup col:nth-child(1) {
                width: 5.5% !important;
            }
            input.left, input.right{
                padding-left: 1px!important;
            }
            #mblTitle{
                margin: 1vh 0 0 0 !important;
                font-size: 28px!important;
                font-weight: bold;
            }
            .iner-wrap{
                border: 1px solid black !important;
            }
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
                    class="no-print"
                    is-change-text="true"
                    onclick="fn_spmtMode()"
            >
            </sbux-button>
            <sbux-button
                    id="decompositionMode"
                    name="decompositionMode"
                    uitype="normal"
                    text="재고분리 OFF"
                    class="btn_blue no-print"
                    is-change-text="true"
                    onclick="fn_decompositionMode()"
            >
            </sbux-button>
            <sbux-button
                    id="printButton"
                    name="printButton"
                    uitype="normal"
                    text="프린트"
                    class="no-print"
                    onclick="fn_printPage()"
            >
            </sbux-button>
            <sbux-button
                    id="itemVrtyButton"
                    name="itemVrtyButton"
                    uitype="normal"
                    text="품종선택"
                    class="no-print"
                    onclick="fn_changeVrty()"
            >
            </sbux-button>
            <sbux-button
                    id="addSoloSaleButton"
                    name="addSoloSaleButton"
                    uitype="normal"
                    text="시판추가"
                    class="no-print"
                    onclick="fn_addSoloSale()"
            >
            </sbux-button>
        </div>
        <table id="sortTable" style="border-collapse: separate">
            <colgroup>
                <col style="width: 9%">
            </colgroup>
            <thead style="border-bottom: 2px double black !important;">
            <tr>
                <th style="letter-spacing: 3vw; font-size: larger!important; line-height: 1.5!important;">작업량</th>
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
<div id="itemVrty" class="modal">
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
    //거래처목록
    var jsonCnptList = [];

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
    //itemCd
    let itemCd;
    //vrtyCd
    let vrtyCd;
    //border color
    const colorList = [
        'tomato',
        'gold',
        'skyblue',
        'salmon',
        'mediumseagreen',
        'orchid',
        'khaki',
        'cornflowerblue',
        'lightcoral',
        'palegreen',
        'plum'
    ];

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
        let warehouseSeCd = $("#warehouse").val();
        let postUrl = "/am/wrhs/selectRawMtrWrhsPrfmncList.do";

        const postJsonPromise = gfn_postJSON(postUrl, {
            apcCd: gv_selectedApcCd,
            wrhsYmdFrom: wrhsYmd,
            wrhsYmdTo: wrhsYmd,
            warehouseSeCd : warehouseSeCd,
            invntrYn: 'Y',
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
                /** 여백 등록 처리 **/
                let index = $(input).closest("tr").index();
                vo.rmrk = index;
                sortSaveList[index] = vo;

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
    const fn_closeItemVrtyModal = function(){
        $("#itemVrty").css("display","none");
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
            let col2 = document.createElement("col");

            col.style.width = `${'${ratio/2}'}%`;
            col2.style.width = `${'${ratio/2}'}%`;

            colgroup.appendChild(col);
            colgroup.appendChild(col2);
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
                    btn.classList.add("searchBtn", "no-print");
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
        let tfoot = document.createElement("tfoot");
        let tr = document.createElement("tr");
        tr.style.borderTop = '2px double black';
        let initSelectes = jsonCnptList.map(item => item.cnptCd);

        for (let k = 0; k <= size; k++) {
            let td = document.createElement("td");
            td.colSpan = k == 0 ? 1 : 2;
            td.style.position = 'relative';

            let select = document.createElement("select");
            const emptyOption = document.createElement('option');
            emptyOption.value = '';
            emptyOption.textContent = '';  // 또는 '선택하세요'
            select.appendChild(emptyOption);

            jsonCnptList.forEach(item => {
                const option = document.createElement('option');
                option.value = item.cnptCd;
                option.textContent = item.cnptNm;
                select.appendChild(option);
            });
            /** 거래처별 색상 안내 **/
            const colorBox = document.createElement('div');
            Object.assign(colorBox.style, {
                width: '1vw',
                height: '1vw',
                position: 'absolute',
                top: '4px',
                right: '4px',
                border: '1px solid white',
                borderRadius: '2px'
            });

            td.appendChild(colorBox);
            select.style.width = "100%";
            select.style.textAlign = 'center';
            select.style.border = 'none';

            /** select onchang **/
            select.onchange = function(event){
                let select = event.target;
                let cnptCd = event.target.value;
                let background = jsonCnptList.find(item => item.cnptCd === cnptCd).color;
                let colorbox = $(select).prev();
                colorbox.css('backgroundColor',background);
            };

            td.appendChild(select);
            tr.append(td);
        }

        Array.from($(tr).find('td')).forEach(function(item, idx) {
            const $td = $(item);
            const $select = $td.find('select');

            if ($select.length && initSelectes[idx]) {
                $select.val(initSelectes[idx]);
                $select.trigger('change');
            }
        });

        tfoot.appendChild(tr);
        tr = document.createElement("tr");
        Array.from($(tfoot).find('select')).forEach(function(selectEl, idx) {
            let td = document.createElement("td");
            td.colSpan = idx === 0 ? 1 : 2;

            let input = document.createElement("input");
            input.style.width = "100%";
            input.style.textAlign = 'center';

            const selectedCnptCd = $(selectEl).val();
            $(input).data('cnptCd', selectedCnptCd);

            td.appendChild(input);
            tr.append(td);
        });

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
                    rmrk: rowIndex,
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
        $container.empty();
        jsonCnptList = data.resultList.map((item, idx) => ({
            cnptCd: item.cnptCd,
            cnptNm: item.cnptNm,
            color: colorList[idx % colorList.length]
        }));

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
               console.log(spmtSaveList,"저장전");


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
               $(_el).siblings().removeClass("active");
               /** 등록 이후 원복처리 **/
               await fn_reset();
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
        select.innerText = '';

        jsonComWarehouse.forEach(function (item) {
            const option = document.createElement("option");
            option.value = item.cdVl;
            option.textContent = item.cdVlNm;
            select.appendChild(option);
        });
    }
    /** 품목, 품종 선택 **/
    const fn_selectItemVrty = function(){
        return new Promise(async resolve => {
            $("#itemVrty").css('display', 'block');
            let vrtyCd = await gfn_getApcVrty(gv_selectedApcCd);
            let $container = $("#itemVrty div.grd_container");

            /** main display:none **/
            $(".area-wrap").css("display","none");

            /** 기존 내용 비우기 (필요 시) **/
            $container.empty();

            vrtyCd.forEach(function(item){
                $container.append(`<div class="cell" data-vrty-cd="${'${item.vrtyCd}'}" data-item-cd="${'${item.itemCd}'}">${'${item.itemNm}/${item.vrtyNm}'}</div>`);
            });

            /** 동적 생성된 .cell 요소에 클릭 이벤트 **/
            $container.off('click', '.cell').on('click', '.cell', function(){
                // 예: 선택된 데이터 가져오기
                const vrtyCd = $(this).data('vrty-cd');
                const itemCd = $(this).data('item-cd');
                const text = $(this).text();

                $("#itemVrty").css('display', 'none');  // 선택 후 숨기기
                $(".area-wrap").css("display","block");
                resolve({ vrtyCd, itemCd, text });      // 원하는 값 resolve로 넘김
            });

        });
    }
    const fn_changeVrty = async function(){
        /** 기존 테이블 정리 **/
        const table = document.getElementById("sortTable");

        // 기존 내용 싹 비우기
        table.innerHTML = '';

        // 새 내용 추가
        table.innerHTML = `
        <colgroup>
            <col style="width: 9%">
        </colgroup>
        <thead style="border-bottom: 2px double black !important;">
            <tr>
                <th style="letter-spacing: 3vw; font-size: larger!important; line-height: 1.5!important;">작업량</th>
            </tr>
            <tr>
                <th rowspan="2">생산자</th>
            </tr>
        </thead>
    `;

        let itemVrty = await fn_selectItemVrty();
        itemCd = itemVrty.itemCd;
        vrtyCd = itemVrty.vrtyCd;

        await SBUxMethod.refresh("spmtMode", {text: '출하등록', onclick: 'fn_spmtMode'});
        await fn_init();

        let warehouseSeCd = gfn_getCookie("warehouseSeCd");
        console.log(warehouseSeCd);
        if(warehouseSeCd) {
            $("#warehouse").val(warehouseSeCd);
        }

        await fn_searchSortPrfmnc();
        await fn_searchGdsInvntr();
        await fn_searchSpmtPrfmncList();
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
            $(item).find("input").val("").prop({ disabled: false, readonly: false });
            $(item).find("td").removeClass("first end mid selected").css("pointer-events", "");

            /** 재고분리된 로우 처리 어케했지? **/
            let tds = Array.from($(item).find("input.left"));
            if(tds.length > 0){
                tds.forEach(function(item){
                   $(item).closest("td").attr("colspan","2");
                   $(item).closest("td").next().remove();
                   $(item).closest("td").get(0).style.removeProperty('border-color');
                });
            }
            $(item).find("input").removeClass("left right");
            /** span 삭제 **/
            var $spanElements = $(item).find('span');
            $spanElements.remove();

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
        /** 최상단 등급별 합계수량 초기화 **/
        $("#sortTable thead tr").eq(2).find('input').val("");

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

        let flag = SBUxMethod.get("decompositionMode");
        if(flag == '재고분리 ON'){
            /** 재고분리는 1회성인데 아직 처리 안한채로 취소할경우 **/
            $("#sortTable tbody td").off('pointerdown'); //이벤트 해제
            SBUxMethod.set("decompositionMode","재고분리 OFF");
            $("#decompositionMode").removeClass("btn_on");
            /** 출하등록 disabled **/
            SBUxMethod.refresh("spmtMode", {text: '출하등록', onclick: 'fn_spmtMode'});
            SBUxMethod.attr('spmtMode', 'disabled', 'false');
            return;
        }else{
            /** 출하등록 disabled **/
            SBUxMethod.refresh("spmtMode", {text: '출하등록', onclick: 'fn_spmtMode'});
            SBUxMethod.attr('spmtMode', 'disabled', 'true');
            SBUxMethod.set("decompositionMode","재고분리 ON");
            $("#decompositionMode").addClass("btn_on");
        }

        $("#sortTable tbody td").off('pointerdown').on('pointerdown', function (event) {
            fn_pointerDownDecomposition(event);
        });
    }

    /** td 선택 eventListener **/
    function fn_pointerDownSeleted(event) {
        /** 선별내역이 없을때 **/
        let $target = $(event.target);
        const colIdx = fn_getLogicalIndex(event.target);  // 현재 td가 속한 열의 인덱스
        const inputValue = $target.find('input').val();
        if (!inputValue) {
            return;
        };

        /** 총량 표시가 있다면 삭제 **/
        // $target.find("span").remove();

        if ($(event.target).is('input')) {
            event.stopPropagation();
            return;
        }
        event.preventDefault();

        /** 열을 등급별로 움직였을떄 **/
        if (nowColIdx > 0) {
            if (nowColIdx !== colIdx) {
                return;
            }
        };
        /** 현재 col 저장 **/
        nowColIdx = colIdx;

        if ($target.hasClass("selected")) {
            $target.removeClass("selected first end mid");

            const $input = $target.find('input');
            const isSplit = $input.hasClass('left') || $input.hasClass('right');
            const isLeft = $input.hasClass('left');
            const $pairTd = isLeft ? $target.next() : $target.prev();
            const pairInput = $pairTd.find('input');
            const merge = $target.data('decomposition');

            //  [1] 현재 선택 셀이 분리된 경우
            if (isSplit && !pairInput.data('spmt') && !merge) {
                let mergeTd = fn_mergeCell($target, false); // selected 제거
                mergeTd.off('pointerdown').on('pointerdown', function (event) {
                   fn_pointerDownSeleted(event);
               });
            }

            //  [2] 같은 colIdx에 남은 selected들 추림
            const sameColSelecteds = Array.from($("#sortTable tbody td.selected")).filter(item => {
                return fn_getLogicalIndex(item) === nowColIdx && (!$(item).find('input').data('spmt'));
            });

            if (sameColSelecteds.length === 0) {
                nowColIdx = 0;
                return;
            }

            //  [2-1] 중간 병합 조건 확인 + 예외 체크
            let safeSelecteds = [];
            let shouldAbort = false;

            sameColSelecteds.forEach(td => {
                const $td = $(td);
                const $input = $td.find('input');
                const val = $input.val();
                $td.removeClass("selected first end mid");

                if (val && val.trim() !== '') {
                    $td.addClass('selected');
                    safeSelecteds.push($td);
                } else if ($td.prop("colspan") === 1) {
                    const isLeft = $input.hasClass('left');
                    const $pair = isLeft ? $td.next() : $td.prev();
                    const pairInput = $pair.find('input');

                    if (!pairInput.data('spmt')) {
                        // 병합 가능한 빈 셀은 merge
                        fn_mergeCell($td, false);

                        //  2-1: 예외 상황 → 병합 불가능 상태인데 지나침
                        // shouldAbort = true;
                        // Swal.fire({
                        //     icon: 'warning',
                        //     title: '중간에 선택되지 않은 셀이 있습니다.',
                        //     text: '빈 셀 중 병합 가능한 셀이 누락되었습니다.',
                        // });
                    }
                }
            });
            /** 이미 클릭된 cell은 제거되고 정리되었으며 남은 safeSelecteds 를 기준으로 범위 지정 및 UI정리 **/
            // safeSelecteds 기준으로 영역 재계산
            const rebuiltRange = safeSelecteds.map(td => {
                return {
                    cell: $(td),
                    rowIndex: $(td).closest("tr").index(),
                    colIndex: fn_getLogicalIndex(td)
                };
            });

            // 중간 셀 포함한 범위 채움
            let filledRange = fillObjectRange(rebuiltRange);
            // split 방향 결정 (기존 split 판단 함수 활용 가능)
            let split = '';
            let mergeFlag = false;

            safeSelecteds.some($td => {
                const $input = $td.find('input');
                if ($input.hasClass('left')){
                    let $pair = $td.next();
                    let $pairVal = $pair.find('input').val();
                    let $pairSpmt = $pair.data('spmt');
                    if($pairVal > 0 || $pairSpmt){
                        split = 'left';
                        return true;
                    }else{
                        split = 'merge';
                    }
                }else if ($input.hasClass('right')) {
                    let $pair = $td.prev();
                    let $pairVal = $pair.find('input').val();
                    let $pairSpmt = $pair.data('spmt');
                    if($pairVal > 0 || $pairSpmt){
                        split = 'right';
                        return true;
                    }else{
                        split = 'merge';
                    }
                }
            });
            const splitDirection = split || 'merge';

            /** 재고이동, 실적이동에 의한 분리가 아닌 직접 선택한 분리 flag **/
            const decomposition = filledRange.some(item => $(item.cell).data('decomposition'));
            // 중간 셀에 대해 split 및 재선택
            filledRange.forEach((item, idx, arr) => {
                let $td = $(item.cell);
                const $input = $td.find('input');
                const isSelected = $td.hasClass("selected");
                const isMerged = $td.prop("colSpan") === 2;

                // 분리 필요 조건: splitDirection이 있고 머지 상태
                if (splitDirection !== 'merge' && isMerged) {
                    const originalValue = parseInt($input.val()) || 0;
                    const splitResult = fn_splitCell($td, splitDirection);
                    const resultTd = splitDirection === 'left' ? splitResult.leftInput.closest('td') : splitResult.rightInput.closest('td');

                    if (originalValue > 0) {
                        if (isSelected) {
                            // 선택된 셀이라면 자기쪽 유지
                            if (splitDirection === 'left') splitResult.leftInput.val(originalValue);
                            else splitResult.rightInput.val(originalValue);
                        } else {
                            // 미선택 셀이면 반대쪽에 잔량
                            if (splitDirection === 'left') splitResult.rightInput.val(originalValue);
                            else splitResult.leftInput.val(originalValue);
                        }
                    }
                    resultTd.off('pointerdown').on('pointerdown', function (event) {
                        fn_pointerDownSeleted(event);
                    });
                    resultTd.addClass('selected');
                    arr[idx].cell = resultTd;
                }else{
                    /** 선택이 1개 남을때 merge 판단 **/
                    const $input = $td.find('input');
                    const isSplit = $input.hasClass('left') || $input.hasClass('right');
                    const isLeft = $input.hasClass('left');
                    const $pairTd = isLeft ? $td.next() : $td.prev();
                    const pairInput = $pairTd.find('input');

                    if (isSplit && !pairInput.data('spmt') && !decomposition) {
                        // 병합 조건 충족 → merge 처리
                        $td = fn_mergeCell($td,true);
                    }
                    $td.off('pointerdown').on('pointerdown',function (event) {
                        fn_pointerDownSeleted(event);
                    });
                }
            });
        } else {
            $target.addClass("selected");
        }

        /**
         * 25.05.10 출하실적 대상 선택시 check
         * T. 출하실적이있는 열이라면 ?  >> 이미 최초 등록시 분리가 된 실적임을 보장함.
         * 1. 분리된 재고인가.
         * 1-1. 분리된 재고가 선택되지 않은 중간에 있다면 선택강요 alert
         * 2. 선택된 재고들 사이에 값이있는 영역이 있는가.
         * 2-1.
         * **/
        let selecteds = Array.from($("#sortTable tbody td.selected")).filter(function (item) {
            return fn_getLogicalIndex(item) === nowColIdx && (!$(item).find('input').data('spmt'));
        });

        /** 선택된 재고들중에 분리가 있다면 하나로 통합 및 방향성 validation **/
        // TODO: 25.05.11 분리가안된 재고도 중간 영역에 껴있는 재고를 분리 이후 중간 재고 사용해야함
        let selectedsSplit = '';
        selecteds.forEach(function(item, idx, arr){
            let $target = $(item).find('input');
            let split = '';
            if($target.hasClass('left')){
                split = 'left';
            }else if($target.hasClass('right')){
                split = 'right';
            }
            /** 전체 공통 idx 순서대로 set **/
            if(selectedsSplit == ''){
                selectedsSplit = split;
            }else {
                /** 불일치 **/
                if (selectedsSplit !== split) {
                    if (split !== '') {
                        Swal.fire({
                            title: '분리된 재고를 확인해주세요.',
                            icon: 'warning',
                        });
                        $(item).removeClass("selected first end mid");
                        return;
                    } else {
                        /** merge된 셀인 경우 분리후 selectedsSplit 방향에 맞춰 set **/
                        let value = $(item).find('input').val() || 0;
                        let splitResult = fn_splitCell($(item), selectedsSplit);

                        if(selectedsSplit == 'left'){
                            fn_applySplitState(splitResult, 'left', value, arr, idx);
                        }else{
                            fn_applySplitState(splitResult, 'right', value, arr, idx);
                        }
                        splitResult.leftInput.prop('disabled', true);
                        splitResult.rightInput.prop('disabled', true);
                    }
                }
            }
        });

        /** 범위내에 재고 위치 정리 및 UI정리 **/
        let uiTarget = fn_checkSplitRange(selecteds).map(item => item.cell);
        uiTarget.forEach(function(item, idx, arr){
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

            let $firstTd = $('<td>').css("position", "relative").data('decomposition',true);
            let $secondTd = $('<td>').data('decomposition',true);

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
            return fn_getLogicalIndex(item) === nowColIdx && (!$(item).find('input').data('spmt'));
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
        /** 출하량 표시 **/
        saveList.forEach(function (item, idx, arr) {
            if ($(item).hasClass("end") || arr.length === 1) {
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

        /** split check **/
        const splitRmrk = saveList.some(item => {
            const $input = $(item).find('input');
            const isEmpty = !$input.val() || $input.val().trim() === '';
            const isSplit = $input.hasClass('left') || $input.hasClass('right');
            if(saveList.length === 1){
                return true;
            }else{
                return !isEmpty && isSplit;
            }
        });
        const defaultRmrk = splitRmrk
            ? ($(splitRmrk).find('input').hasClass('left') ? 'left' : 'right')
            : 'merge';

        /** 출하실적 saveObj 포맷팅 **/
        saveList.forEach(function(item){
            const $td = $(item);
            const $input = $td.find('input');
            const $qntt = parseInt($input.val()) || 0;

            if ($qntt <= 0) return;

            const $tr = $td.closest('tr');
            const $identno = $tr.find('td:first input').val();

            const nGdsInfo = gdsList.filter(it => it.prdcrIdentno == $identno);
            const unitWght = nGdsInfo[0].invntrWght / nGdsInfo[0].invntrQntt;

            const vo = JSON.parse(JSON.stringify(nGdsInfo[0]));
            vo.spmtQntt = $qntt;
            vo.spmtWght = $qntt * unitWght;
            vo.spmtYmd = spmtYmd;
            vo.prdcrCd = vo.rprsPrdcrCd;
            vo.cnptCd = '';

            vo.rmrk = defaultRmrk;

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
                let warehouseSeCd = $("#warehouse").val();

                // saveObj.sortPrfmncList[0].rmrk = rowIndex;

                /** 선별실적 미입력 **/
                if(saveObj.sortPrfmncList.length === 0){
                    Swal.fire(
                        '선별실적 대상이 없습니다.',
                        '',
                        'error'
                    );
                    return;
                }
                /** 2025.05.20 재고 남김처리 **/
                let unit = parseInt(saveObj.rawMtrInvntrList[0].inptWght) / parseInt(saveObj.rawMtrInvntrList[0].inptQntt);
                let total = parseInt($("#sortTable tbody tr").eq(rowIndex).children('td:last').find('input').val());
                saveObj.rawMtrInvntrList[0].inptWght = total * unit;
                saveObj.rawMtrInvntrList[0].inptQntt = total;

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
                        gfn_setCookie('warehouseSeCd',warehouseSeCd);
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
            itemCd: itemCd,
            vrtyCd: vrtyCd
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

        /** 2025.05.07 순서보장 X => 등록한 인덱스체크 **/
        data.resultList.forEach(function (item) {
            /** 기존 fn_setPltno 와 같은 셋팅 **/
            let vo = JSON.parse(JSON.stringify(sortPrfmncVO));
            let idx = item.RMRK;
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
            sortSaveList[idx] = vo;
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
        let warehouseSeCd = $("#warehouse").val();

        let SpmtPrfmncVO = {
            apcCd: gv_selectedApcCd
            , spmtYmdFrom: wrhsYmd
            , spmtYmdTo: wrhsYmd
            , itemCd: itemCd
            , vrtyCd: vrtyCd
            , warehouseSeCd : warehouseSeCd
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
        console.log(groupedData,"시판정리");


        /** 하단 거래처별 출하수량 입력 **/
        const cnptData = data.resultList.reduce((acc, item) => {
            const key = item.cnptCd;
            const value = Number(item.spmtQntt) || 0;
            acc[key] = (acc[key] || 0) + value;
            return acc;
        }, {});
        const $cnptTr = $('#sortTable').find('tfoot tr').eq(1);
        $cnptTr.find('td').each(function () {
            const $td = $(this);
            const $input = $td.find('input');
            const cnptCd = $input.data('cnptCd');  // input의 data-cnpt-cd 값

            if (cnptCd && cnptData.hasOwnProperty(cnptCd)) {
                $input.val(cnptData[cnptCd]);  // 누적값 삽입
            }
        });


        Object.values(groupedData).forEach(arr => {
            nowColIdx = parseInt(arr[0].gdsGrd, 10);
            let split = arr[0].rmrk || 'merge';
            /** UI 정리용 **/
            let nArr = [];
            /** thead 출하 수량 **/
            let spmtTotal = 0;
            let rows = [];

            arr.forEach((item, idx, arr) => {
                /** 그룹된 실적에 대해서 열과 행 위치 **/
                let col = parseInt(item.gdsGrd,10);
                let row = Array.from($("tbody td:first-child input")).filter(inner => {
                    return $(inner).val() == item.prdcrIdentno;
                }).map(inner => $(inner).closest("tr").index());

                /** UI 정리용 rows **/
                rows.push(row[0]);
                /** 열과행으로 현재 셀에 대해서 지명 **/
                let logicalCol = fn_getTdIndexByLogicalCol(row[0],col);
                let cell = $("#sortTable tbody tr").eq(row).find("td").eq(logicalCol);
                let $target = $(cell);

                /** 재고 잔량을 위한 현재 수량 **/
                let spmtQntt = parseInt($(cell).find('input').val());
                /** 현재 조회된 출하 총량 **/
                spmtTotal += item.spmtQntt;

                /** 해당 실적 공통에 비고란에 left,right으로 판단 **/
                let splitResult;
                switch(split){
                    case "merge":
                        $target.addClass("selected");
                        break;
                    case "left":
                        splitResult = fn_splitCell($target,'left');
                        if(splitResult){
                            /** 출하실적은 disabled 처리 되며 요소대체 불가능 => css 체크보장 **/
                            let spmtFlag = splitResult.rightInput.data('spmt') === true;
                            /** 출하실적 자리엔 셋팅 **/
                            splitResult.leftInput.val(parseInt(item.spmtQntt));
                            /** 기존 반대편이 출하실적이 없는 경우 재고에서 차감한 수량 세팅 **/
                            if(!spmtFlag){
                                splitResult.rightInput.val((spmtQntt - parseInt(item.spmtQntt)) || '');
                            }

                            cell = splitResult.leftInput.closest('td');
                            cell.addClass('selected');
                        }
                        break;
                    case "right":
                        splitResult = fn_splitCell($target,'left');
                        if(splitResult){
                            /** 출하실적은 disabled 처리 되며 요소대체 불가능 => css 체크보장 **/
                            let spmtFlag = splitResult.leftInput.data('spmt') === true;
                            /** 출하실적 자리엔 셋팅 **/
                            splitResult.rightInput.val(parseInt(item.spmtQntt));
                            /** 기존 반대편이 출하실적이 없는 경우 재고에서 차감한 수량 세팅 **/
                            if(!spmtFlag){
                                splitResult.leftInput.val((spmtQntt - parseInt(item.spmtQntt)) || '');
                            }

                            cell = splitResult.rightInput.closest('td');
                            cell.addClass('selected');
                        }
                        break;
                }
                /** cell <- data.cnptCd **/
                const $cell = $(cell);
                $cell.data('cnptCd',item.cnptCd);
                nArr.push({cell : $(cell), rowIndex : row[0], colIndex : col});
            });
            /** UI 정리 **/
            let sum = 0;
            nArr = fillObjectRange(nArr);
            let cellArray = nArr.map(item => item.cell);

            cellArray.forEach(function (item, idx, arr) {
                if($(item).hasClass('selected'))return;

                if(split !== 'merge'){
                    let prevValue = $(item).find('input').val() || 0;
                    let splitResult = fn_splitCell($(item),split);

                    if(splitResult){
                        if(split == 'left'){
                            arr[idx] = splitResult.leftInput.closest('td');
                            if(prevValue > 0){
                                splitResult.rightInput.val(prevValue);
                            }
                        }else{
                            arr[idx] = splitResult.rightInput.closest('td');
                            if(prevValue > 0){
                                splitResult.leftInput.val(prevValue);
                            }
                        }
                    }
                }
            });
            const $found = cellArray.find(function(item) {
                return $(item).data('cnptCd');
            });
            let cnptCd = '';
            if(!gfn_isEmpty($found)){
                cnptCd = $found.data('cnptCd');
            }

            const match = jsonCnptList.find(item => item.cnptCd === cnptCd);
            const color = match ? match.color : null;

            cellArray.forEach(function(item, idx, arr){
                /** 출하실적 disable 처리 **/
                $(item).find("input").attr("readonly",true);
                $(item).addClass("selected");
                /** 2025.05.12 $data로 대체 **/
                // $(item).css("pointer-events","none");
                $(item).find("input").data('spmt',true);

                /** 초기화 **/
                $(item).removeClass("first end mid");

                if (idx == 0) {
                    $(item).addClass("first");
                    $(item).get(0).style.setProperty('border-color', color, 'important');
                    sum += parseInt($(item).find('input').val()) || 0;
                } else if (idx != arr.length - 1) {
                    $(item).addClass("mid");
                    $(item).get(0).style.setProperty('border-color', color, 'important');
                    sum += parseInt($(item).find('input').val()) || 0;
                } else {
                    $(item).addClass("end");
                    $(item).get(0).style.setProperty('border-color', color, 'important');
                    sum += parseInt($(item).find('input').val()) || 0;
                }

                if($(item).hasClass('end') || arr.length === 1){
                    /** 마지막 혹은 혼자인 cell **/
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
        /** 작업 col 초기화 **/
        nowColIdx = 0;
    }

    function fn_getLogicalIndex(td){
        let target = $(td);
        let previousSiblings = target.prevAll().not(':last');
        let result = 0;

        previousSiblings.each(function(index, el){
           let colspan = parseInt($(el).attr("colspan")) || 1;
           if(colspan === 1){
               result += 1;
           }
        });

        result = target.index() - (result / 2);
        return Math.floor(result);
    };
    function fn_printPage() {
        window.focus();
        window.print();
    }
    function fn_createTotal (target,sum) {
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
        $(target).append(span);
    }
    function fn_splitCell ($target,type){
        if ($target.attr('colspan') === '2') {
            let $firstTd = $('<td>');
            let $secondTd = $('<td>');
            const $inputLeft = $('<input>')
                .attr('type', 'number')
                .css("width", "100%")
                .prop('disabled', true)
                .addClass('left');
            const $inputRight = $('<input>')
                .attr('type', 'number')
                .css("width", "100%")
                .prop('disabled', true)
                .addClass('right');
            $firstTd.append($inputLeft)
            $secondTd.append($inputRight);
            $target.replaceWith($firstTd);
            $firstTd.after($secondTd);

            return {leftInput : $inputLeft, rightInput : $inputRight};
        }else{
            /** 이미 분리된 경우 **/
            if ($target.find('input').hasClass('left')) {
                let $pair = $target.next().find('input');
                return {leftInput: $target.find('input'), rightInput: $pair};
            } else if ($target.find('input').hasClass('right')) {
                let $pair = $target.prev().find('input');
                return {leftInput: $pair, rightInput: $target.find('input')}
            }
        }
    }
    function fillObjectRange(arr) {
        // colIndex는 전부 동일하다고 가정
        let colIndex = arr[0].colIndex;

        // 현재 rowIndex만 모음
        let rowIndexes = arr.map(item => item.rowIndex);

        // 최소/최대
        let minRow = Math.min(...rowIndexes);
        let maxRow = Math.max(...rowIndexes);

        let fullRowIndexes = [];
        for (let i = minRow; i <= maxRow; i++) {
            fullRowIndexes.push(i);
        }

        // 결과 객체배열 시작은 원본 복제
        let result = [...arr];

        // 없는 rowIndex 찾고 추가
        fullRowIndexes.forEach(rowIdx => {
            let exists = arr.some(item => item.rowIndex === rowIdx);
            if (!exists) {
                // cell 찾아서 새 객체 생성
                let logicalCol = fn_getTdIndexByLogicalCol(rowIdx,colIndex);
                let $cell = $("#sortTable tbody tr").eq(rowIdx).children("td").eq(logicalCol);
                let pushFlag = $cell.find('input').data('spmt');

                const $input = $cell.find('input');
                if ($input.hasClass('left') && $input.data('spmt')) {
                    $cell = $cell.next();
                }

                if ($cell.length && !pushFlag) { // 셀 존재하면 추가
                    result.push({
                        cell: $cell,
                        colIndex: colIndex,
                        rowIndex: rowIdx
                    });
                }
            }
        });

        // rowIndex 순으로 정렬 (필요 시)
        result.sort((a, b) => a.rowIndex - b.rowIndex);

        return result;
    }
    function fn_checkSplitRange(target){
        /** 1. target 내부 분리 확인 **/
        let split = '';
        let cellRange = [];
        target.forEach(item => {
            const $input = $(item).find('input');
            if ($input.hasClass('left')) {
                split = 'left';
            }else if($input.hasClass('right')){
                split = 'right';
            }
            /** 2. data push **/
            let rowIndex = $(item).closest("tr").index();
            let colIndex = fn_getLogicalIndex(item);
            cellRange.push({cell : $(item), rowIndex :rowIndex, colIndex : colIndex});
        });
        /** 2. target 범위 판단 및 중간 cell 특정 **/
        cellRange = fillObjectRange(cellRange);
        // 3. split 방향 없으면 기본 'left' (case 1, 2)
        let splitDirection = split || 'merge';

        // 4. 분리 및 값 처리
        cellRange.forEach(function(item, idx, arr){
            if (item.cell.hasClass('selected')) return;

            const value = parseInt(item.cell.find('input').val()) || 0;
            const splitResult = fn_splitCell(item.cell, splitDirection);

            if (split === 'left') {
                if (value > 0) splitResult.rightInput.val(value);
                arr[idx].cell = splitResult.leftInput.closest('td');
                arr[idx].cell.addClass('selected');
            } else if (split === 'right') {
                if (value > 0) splitResult.leftInput.val(value);
                arr[idx].cell = splitResult.rightInput.closest('td');
                arr[idx].cell.addClass('selected');
            } else { // split = merge
                if (value > 0) {
                    splitResult.rightInput.val(value);
                    arr[idx].cell = splitResult.leftInput.closest('td');
                    arr[idx].cell.addClass('selected');
                    /** merge인데 재고가 남아있어서 분리한 상황엔 방향을 지정해줘야함. **/
                    splitDirection = 'left';
                } else {
                    arr[idx].cell = fn_mergeCell(splitResult.leftInput.closest('td'), true);
                }
            }
        });
        // 5. 기존 선택된 cell도 방향 처리 이후 재고 재사용 대비
        cellRange.forEach((item, idx, arr) => {
            if(arr.length === 1) return;
            const $td = $(item.cell);
            const isMerged = $td.attr("colspan") === "2";

            if (splitDirection !== 'merge' && isMerged) {
                const originalValue = parseInt($td.find('input').val()) || 0;
                const splitResult = fn_splitCell($td, splitDirection);

                if (originalValue > 0) {
                    if (splitDirection === 'left') {
                        splitResult.leftInput.val(originalValue);
                        arr[idx].cell = splitResult.leftInput.closest('td');
                        arr[idx].cell.off('pointerdown').on('pointerdown', function (event) {
                            fn_pointerDownSeleted(event);
                        });
                    } else {
                        splitResult.rightInput.val(originalValue);
                        arr[idx].cell = splitResult.rightInput.closest('td');
                        arr[idx].cell.off('pointerdown').on('pointerdown', function (event) {
                            fn_pointerDownSeleted(event);
                        });
                    }
                } else {
                    // 값 없는 경우 위치만 지정
                    arr[idx].cell = (splitDirection === 'left' ? splitResult.leftInput : splitResult.rightInput).closest('td');
                }
                arr[idx].cell.addClass('selected');
            }
        });
        return cellRange;
    }
    /** row, col 인덱스로 논리적 객체[td] 특정 **/
    function fn_getTdIndexByLogicalCol(row, logicalCol) {
        const $tr = $("#sortTable tbody tr").eq(row);
        const $tds = $tr.children("td");
        let index = logicalCol;

        for (let i = 1; i < $tds.length && i < index; i++) {
            const $td = $tds.eq(i);
            const colspan = parseInt($td.attr("colspan") || "1");

            if (colspan === 1) {
                index++; // 분리된 셀이 있으므로 논리 col보다 실제 index는 뒤로 밀림
                i++;     // split된 셀 건너뛰기
            }
        }

        return index; // 실제 .eq(index)로 쓸 수 있는 td 위치
    }
    /** 분리된 td에 대해서 value 세팅, selected class, 이벤트 바인딩 **/
    function fn_applySplitState(splitResult, direction, value, arr, idx) {
        const input = direction === 'left' ? splitResult.leftInput : splitResult.rightInput;
        const td = input.closest('td');

        input.val(value);
        td.addClass('selected');

        // pointerdown 이벤트 바인딩
        td.off('pointerdown').on('pointerdown', function (event) {
            fn_pointerDownSeleted(event);
        });

        // 이후 로직에서 참조할 수 있도록 원본 배열 갱신
        arr[idx] = td.get(0);
    }
    /** 분리된 셀 merge 함수 **/
    function fn_mergeCell($td, shouldSelect = false) {
        if ($td.attr('colspan') === '2') return;

        const $input = $td.find('input');
        const isLeft = $input.hasClass('left');
        const isRight = $input.hasClass('right');

        if (!isLeft && !isRight) return;

        const $pairTd = isLeft ? $td.next() : $td.prev();
        const $pairInput = $pairTd.find('input');

        const thisVal = parseInt($input.val()) || 0;
        const pairVal = parseInt($pairInput.val()) || 0;
        const total = thisVal + pairVal;

        const $mergedTd = isLeft ? $td : $pairTd;

        const $mergedInput = $('<input type="number">')
            .css('width', '100%')
            .prop('disabled', true);
        // 0이면 비우고, 그 외엔 값 할당
        if (total > 0) {
            $mergedInput.val(total);
        }

        $mergedTd
            .html('')
            .append($mergedInput)
            .attr('colspan', 2)
            .off('pointerdown')
            .on('pointerdown', function (event) {
                fn_pointerDownSeleted(event);
            });

        if (shouldSelect) {
            $mergedTd.addClass('selected');
        } else {
            $mergedTd.removeClass('selected');
        }

        if (isLeft) {
            $pairTd.remove();
        } else {
            $td.remove();
        }
        return $td;
    }
    const fn_addSoloSale = async function(){
        $("#sortTable tbody input").hover(function(){
            $(this).css('backgroundColor','blue');
        });
    }

    window.addEventListener("DOMContentLoaded", async function () {
        /** 품목 품종 선택 **/
        let itemVrty = await fn_selectItemVrty();
        itemCd = itemVrty.itemCd;
        vrtyCd = itemVrty.vrtyCd;

        await SBUxMethod.set("srch-dtp-ymd",gfn_dateToYmd(new Date()));
        await fn_modalDrag();
        await fn_createRawMtrInvntrGrid();
        await fn_init();

        /** A,B동 작업장 cookie check **/
        let warehouseSeCd = gfn_getCookie("warehouseSeCd");
        if(warehouseSeCd){
            $("#warehouse").val(warehouseSeCd);
        }

        await fn_searchSortPrfmnc();
        await fn_searchGdsInvntr();
        await fn_searchSpmtPrfmncList();
    });

</script>
</html>
