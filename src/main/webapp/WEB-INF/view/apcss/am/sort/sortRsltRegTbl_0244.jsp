<%--
  Created by IntelliJ IDEA.
  User: sonminseong
  Date: 2/17/25
  Time: 10:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/interactjs/dist/interact.min.js"></script>
<%
    String userAgent = request.getHeader("User-Agent");
    boolean isMobile = userAgent.matches(".*(Mobile|Android|iPhone|iPad).*");
%>
<c:set var="isMobile" value="<%= isMobile %>" />
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

      .area-wrap{
      width: 100vw;
      height: 90vh;
      overflow: scroll;
    }
    .iner-wrap{
        margin: 5px;
        width: auto;
        height: auto;
        box-sizing: border-box;
    }
    .iner-wrap > table{
        width: 100%;
        height: 100%;
        user-select: none;
    }
    .iner-wrap > table th{
        text-align: center;
        border: 1px solid black !important;
        line-height: 2;
    }
    .iner-wrap > table td {
        border: 1px solid black !important;
        line-height: 2;
    }
    .selected {
      background-color: lightblue; /* 선택된 셀 강조 */
    }
      #sortTable > tbody > tr > td:first-child input{
          text-align: center;
      }
      #modal{
          display: none;
          height: auto;
          width: 500px;
          position: fixed;
          left: 50%;
          top: 20%;
          transform: translate(-50%, -50%);
          border: 1px solid black;
          z-index: 9999;
          background-color: white;
          cursor: grab;
      }
      #closeModal{
          display: flex;
          justify-content: flex-end;
          background-color: #37719c;
      }
      #close {
          text-align: right;
          margin-right: 7px;
          font-size: 2vh;
          font-weight: bold;
          box-sizing: border-box;
          cursor: pointer;
          color: white;
      }
      .searchBtn{
          background-color: #4A5672;
          border: none;
          color: white;
          font-size: small;
          text-wrap: nowrap;
      }
  </style>
</head>
<body style="overflow: hidden">
<div class="area-wrap">
    <div class="iner-wrap">
        <H1 id="mblTitle" ondblclick="fn_fullScreen();" style="text-align: center">
            <span id="yyyy"></span>년 공동선별작업일지(
            <select id="warehouse" onchange="fn_searchSortPrfmnc()" style="appearance: none; -webkit-appearance: none; -moz-appearance: none;border: none!important;">
            </select>
            )</H1>
        <div style="display: flex">
            <h5 style="margin-left: 1vw">일자 : </h5>
            <sbux-datepicker
                    id="srch-dtp-ymd"
                    name="srch-dtp-ymd"
                    uitype="popup"
                    wrap-style="border: hidden"
                    input-mask="undefined"
                    date-format="yyyy년 mm월 dd일"
                    style="background-color: initial; color: black; border: none!important;font-size: 1.7rem"
                    onchange="fn_searchSortPrfmnc()"
            ></sbux-datepicker>
        </div>
        <table id="sortTable">
            <colgroup>
                <col style="width: 9%">
            </colgroup>
            <thead style="border-bottom: 2px double black !important;">
                <tr>
                    <th colspan="15" style="letter-spacing: 3vw">작업량</th>
                </tr>
                <tr>
                    <th rowspan="2">생산자</th>
                </tr>
        </table>
    </div>
</div>
<div id="modal">
    <div id="closeModal">
        <p id="close" onclick="fn_modal()">&times;</p>
    </div>
    <div id="sb-area-rawMtrInvntr" style="width: 100%;"></div>
</div>
</body>
<script type="text/javascript">
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
    //TABLE JSON
    var saveJson = [];
    //출하포장단위
    var jsonSpmtPckgUnit = [];
    //SORT SAVE
    var sortPrfmncVO = {
        apcCd: gv_selectedApcCd,
        sortYmd: '',
        sortno: '',
        rawMtrVlType: lv_rawMtrVlType,
        rawMtrInvntrList: [],
        sortPrfmncList: [],
        itemCd : ''
    };


    const fn_fullScreen =function(){
        // window.parent.mfn_fullScreen();
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
    const fn_init = async function(){
        /** common **/
        //등급 목록
        await fn_selectGrdList();

        //창고 옵션 선택
        await fn_setWarehouse();

        /** thead **/
        //colgroup
        let table = document.getElementById("sortTable");
        let colgroup = table.querySelector("colgroup");
        if(!colgroup){
            colgroup = document.createElement("colgroup");
            table.prepend(colgroup);
        }
        //col ratio
        let size = grdList.length;
        let ratio = 91 / size;
        let thead = table.querySelector("thead");
        //최상단 colspan
        thead.querySelectorAll("tr")[0].querySelector("th").setAttribute("colspan", size + 1);
        //최상단 여백
        thead.appendChild(document.createElement("tr"));
        Array.from({ length : size}, () => {
           let th = document.createElement("th");
           let input = document.createElement("input");
           input.style.width = "100%";
           th.appendChild(input);
           thead.querySelectorAll("tr")[2].appendChild(th);
        });

        grdList.forEach(function(item){
            //colgroup set
            let col = document.createElement("col");
            col.style.width = `${'${ratio}'}%`;
            colgroup.appendChild(col);
            //thead set
            let th = document.createElement("th");
            th.innerHTML = item.grdNm;
            th.dataset.grdCd = item.grdCd;
            thead.querySelectorAll("tr")[1].appendChild(th);
        });
        /** tbody **/
        let tbody = document.createElement("tbody");
        for(let i = 0 ; i < 25; i++){
            let tr = document.createElement("tr");
            for(let j = 0; j <= size; j++){
                let td = document.createElement("td");
                let input = document.createElement("input");
                input.type = j === 0 ? 'text' : 'number';
                if(j === 0){
                    let wrap = document.createElement("div");
                    wrap.style.display = 'flex';

                    Object.assign(input.style,{flex:'2',width:'100%'});
                    input.readOnly = true;

                    let btn = document.createElement("button");
                    Object.assign(btn.style,{flex:'1',width:'100%'});
                    btn.classList.add("searchBtn");
                    btn.textContent = "조회";
                    wrap.appendChild(input);
                    wrap.appendChild(btn);
                    td.appendChild(wrap);
                }else{
                    input.style.width = "100%";
                    td.appendChild(input);
                }
                tr.append(td);
                tbody.appendChild(tr);
            }
            table.appendChild(tbody);
        }
        /** foot word **/
        let words = ["강서","영진","상주","한국","서운","시판","이월"];
        let tfoot = document.createElement("tfoot");
        let tr = document.createElement("tr");
        tr.style.borderTop = '2px double black';
        for(let k = 0 ; k <= size; k++){
            let td = document.createElement("td");
            let input = document.createElement("input");
            input.style.width = "100%";
            if(k % 2 > 0){
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
        for(let l = 0 ; l <= size; l++){
            let td = document.createElement("td");
            let input = document.createElement("input");
            input.style.width = "100%";
            if(l === 13){
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
    const fn_addChange = function(){
        /** 입고번호(생산자라인) 입력시 **/
        //input 스캐너 사용시 대비
        // $("#sortTable > tbody > tr > td:first-child input").on("input", function () {
        //     fn_searchInvntr($(this));
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
        /** 수량 입력시 saveJson 셋팅 **/
        $("#sortTable tbody tr td:not(:first-child) input").on("change", function () {
            fn_setSaveJson($(this));
        });
    }

    const fn_searchInvntr = async function(_el){
        /** 스캐너 사용 가정 **/
        const pattern = /^[A-Z]{2}\d{12}$/;
        let val = $(_el).val();

        if(!pattern.test(val)){
            return;
        }
        const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsList.do", {
            apcCd: gv_selectedApcCd,
            pltno: val,
            pagingYn : 'N',
        },null,true);
        const data = await postJsonPromise;
        if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
        }
        if(data.resultList.length > 0){
            rawMtrInvntr.push(data.resultList[0]);

            /** set identno **/
            let prdcrIdentno = data.resultList[0].prdcrIdentno;
            $(_el).val(prdcrIdentno);
        }else{
            /** 해당 pltno로 목록없을경우 **/
            Swal.fire({
                title:"재고정보 없음",
                text:"입고실적을 확인해주세요.",
                icon:"error"
            });
            $(_el).val("");
            $(_el).focus();
        }

    }
    const fn_saveSortPrfmnc = async function(_el){
        let rowIndex =  $(_el).closest("tr").index();

        await Swal.fire({
            title: '저장하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '저장',
            cancelButtonText: '취소',
        }).then(async result => {
            if (result.isConfirmed) {
                let saveObj = saveJson[rowIndex];
                console.log(saveObj);
                let sortno = saveObj.sortno;
                const postUrl = gfn_isEmpty(sortno) ?
                    "/am/sort/insertSortPrfmnc.do" : "/am/sort/updateSortPrfmnc.do";
                try {
                    const postJsonPromise = gfn_postJSON(postUrl, saveObj);
                    const data = await postJsonPromise;

                    if (_.isEqual("S", data.resultStatus)) {
                        gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                        fn_reset();
                    } else {
                        gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
                    }
                } catch (e) {
                    if (!(e instanceof Error)) {
                        e = new Error(e);
                    }
                    console.error("failed", e.message);
                    gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
                }
            }
        });
    }
    const fn_setSaveJson = function(_el){
        /** nRow idx **/
        let rowIndex =  $(_el).closest("tr").index();
        /** nCol idx **/
        let colIndex = $(_el).closest("td").index();
        /** 생산자 미선택시 **/
        if(!saveJson[rowIndex]){
            Swal.fire({
                title: '생산자를 선택해주세요',
                icon: 'warning',
            });
            $(_el).val("");
            return;
        }
        /** saveJson 참조 => 해당 로우의 sortPrfmncList push **/
        let grdVO = grdList[colIndex -1];
        let rowVO = saveJson[rowIndex];
        /** 출하포장단위 필터링 **/
        let spmtVO = jsonSpmtPckgUnit.filter(item => {
           return item.gdsGrd == grdVO.aftrGrdCd && item.itemCd == grdVO.itemCd;
        })[0];
        /** 수량,중량,창고구분 **/
        let qntt = $(_el).val();
        let wght = parseInt(qntt) * spmtVO.spcfctWght;
        let warehouseSeCd = $("#warehouse").val();

        if(rowVO){
            /** 실적이 있다가 공백이 된 경우 **/
            /** 선별실적 상세 리스트 포맷 **/
            rowVO.sortPrfmncList.push({
                autoPckgInptYn: 'Y',
                warehouseSeCd : warehouseSeCd,
                fcltCd : '01', //설비없음
                inptYmd: rowVO.sortYmd,
                itemCd : rowVO.itemCd,
                vrtyCd : rowVO.vrtyCd,
                grdCd : grdVO.grdCd,
                spcfctCd :spmtVO.spcfctCd,
                spmtPckgUnitCd : spmtVO.spmtPckgUnitCd,
                gdsGrd : spmtVO.gdsGrd,
                sortQntt : parseInt(qntt),
                sortWght : wght,
                gdsStdGrdList : [{
                    grdSeCd : '03',
                    itemCd : rowVO.itemCd,
                    grdKnd : grdVO.aftrGrdKnd,
                    grdCd : grdVO.aftrGrdCd
                }],
                stdGrdList : [{
                    grdSeCd : grdVO.grdSeCd,
                    itemCd : rowVO.itemCd,
                    grdKnd : grdVO.grdKnd,
                    grdCd : grdVO.grdCd
                }]
            });
        }

        /** tatal ++ **/
        let prev = $(_el).closest('tr').children('td:last').find('input').val() || 0;
        let add = $(_el).val();
        let result = parseInt(prev) + parseInt(add);

        $(_el).closest('tr').children('td:last').find('input').val(result);

    }

    const fn_selectGrdList = async function(){
        let apcCd = gv_selectedApcCd;
        let itemCd = '0901';
        let grdSeCd = '02';
        let grdKnd = '01';

        let postJsonPromise = gfn_postJSON("/am/cmns/selectStdGrdDtlList.do", {apcCd : apcCd, itemCd : itemCd, grdSeCd : grdSeCd, grdKnd : grdKnd});
        let data = await postJsonPromise;
        if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
        }
        /** 총계 추가 **/
        data.resultList.push({grdNm : "총계"});
        grdList = data.resultList;
    }

    /** modal fn  --S **/
    const fn_createRawMtrInvntrGrid = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-rawMtrInvntr';
        SBGridProperties.id = 'grdRawMtrInvntr';
        SBGridProperties.jsonref = 'jsonRawMtrInvntr';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ['원물번호'],	ref: 'pltno',width: '25%', type:'output',	style:'text-align:center;'},
            {caption: ['생산자'],	ref: 'prdcrNm',width: '25%', type:'output',	style:'text-align:center;'},
            {caption: ['번호'],	ref: 'prdcrIdentno',width: '25%', type:'output',	style:'text-align:center;'},
            {caption: ['입고수량'],	ref: 'invntrQntt',width: '25%', type:'output',	style:'text-align:center;'},
        ];
        grdRawMtrInvntr = _SBGrid.create(SBGridProperties);
        // grdRawMtrInvntr.bind('click', 'fn_setPltno');
    }
    const fn_searchRawMtrInvntr = async function(){
        let ymd = gfn_dateToYmd(new Date());

        let postUrl = "/am/wrhs/selectRawMtrWrhsPrfmncList.do";
        const postJsonPromise = gfn_postJSON(postUrl, {
            apcCd : gv_selectedApcCd,
            wrhsYmdFrom : ymd,
            wrhsYmdTo : ymd,
        });
        const data = await postJsonPromise;
        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }
        jsonRawMtrInvntr = data.resultList;
        grdRawMtrInvntr.rebuild();
    }
    const fn_modal = async function(_this = null){
        const displayValue = $('#modal').css('display');
        $("#modal").css("display", displayValue === 'none' ? "block" : "none");

        let wrhsYmd = SBUxMethod.get("srch-dtp-ymd");
        let postUrl = "/am/wrhs/selectRawMtrWrhsPrfmncList.do";

        const postJsonPromise = gfn_postJSON(postUrl, {
            apcCd: gv_selectedApcCd,
            wrhsYmdFrom: wrhsYmd,
            wrhsYmdTo: wrhsYmd,
            invntrYn : 'Y'
        }, '', true);

        const data = await postJsonPromise;

        if (!_.isEqual("S", data.resultStatus)) {
            gfn_comAlert(data.resultCode, data.resultMessage);
            return;
        }

        jsonRawMtrInvntr = data.resultList.filter(item => {
            return !saveJson.some(savedItem => savedItem.prdcrIdentno === item.prdcrIdentno);
        });
        grdRawMtrInvntr.rebuild();

        if (_this) {
            let input = _this.previousElementSibling;
            fn_setPltno = async function() {
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
                    inptQntt : rowData.invntrQntt,
                    inptWght : rowData.invntrWght,
                    wrhsno : rowData.wrhsno
                });
                vo.itemCd = rowData.itemCd;
                /** 화면내 사용할 필드 추후 간섭여부 확인해야함 **/
                vo.prdcrIdentno = rowData.prdcrIdentno;
                vo.vrtyCd = rowData.vrtyCd;
                saveJson.push(vo);

                /** btn 재사용 **/
                $(_this).text("저장");
                $(_this).off("click").on("click", function(){
                   fn_saveSortPrfmnc(this);
                });

                /** 출하포장단위 조회 상품에대한 **/
                if(jsonSpmtPckgUnit.length == 0){
                    jsonSpmtPckgUnit = await gfn_getSpmtPckgUnits(gv_selectedApcCd, rowData.itemCd, rowData.vrtyCd);
                }

            };
            grdRawMtrInvntr.bind('click','fn_setPltno');
        }
    };

    let fn_setPltno = () => {};

    const fn_modalDrag = function () {
        let isDragging = false;
        let startX, startY, translateX = 0, translateY = 0;
        let modalContent = document.getElementById("modal");

        // 현재 transform 값을 가져와서 translateX, translateY 초기화
        const updateTransform = () => {
            let transform = window.getComputedStyle(modalContent).transform;
            if (transform !== "none") {
                let matrix = new DOMMatrix(transform);
                translateX = matrix.m41; // translateX 값
                translateY = matrix.m42; // translateY 값
            }
        };

        // 현재 iframe의 위치를 구하는 함수
        const getIframeOffset = () => {
            let iframe = window.frameElement; // 현재 스크립트가 실행 중인 iframe
            if (!iframe) return { left: 0, top: 0 };

            let rect = iframe.getBoundingClientRect();
            return { left: rect.left, top: rect.top };
        };

        const startDrag = (e) => {
            isDragging = true;
            $("#closeModal").css("cursor", "grabbing");

            let clientX = e.type.includes("touch") ? e.touches[0].clientX : e.clientX;
            let clientY = e.type.includes("touch") ? e.touches[0].clientY : e.clientY;

            // 아이프레임 위치 보정
            let { left: iframeLeft, top: iframeTop } = getIframeOffset();
            clientX += iframeLeft;
            clientY += iframeTop;

            startX = clientX - translateX;
            startY = clientY - translateY;
        };

        const moveDrag = (e) => {
            if (!isDragging) return;

            let clientX = e.type.includes("touch") ? e.touches[0].clientX : e.clientX;
            let clientY = e.type.includes("touch") ? e.touches[0].clientY : e.clientY;

            // 아이프레임 위치 보정
            let { left: iframeLeft, top: iframeTop } = getIframeOffset();
            clientX += iframeLeft;
            clientY += iframeTop;

            translateX = clientX - startX;
            translateY = clientY - startY;

            modalContent.style.transform = `translate(${'${translateX}'}px, ${'${translateY}'}px)`;
        };

        const stopDrag = () => {
            isDragging = false;
            $("#closeModal").css("cursor", "grab");
        };

        // 풀스크린 모드 변경 감지 -> 위치 업데이트
        const handleFullscreenChange = () => {
            setTimeout(updateTransform, 100); // transform 값 갱신
        };

        // 이벤트 리스너 등록
        modalContent.addEventListener("mousedown", startDrag);
        modalContent.addEventListener("touchstart", startDrag, { passive: true });

        window.addEventListener("mousemove", moveDrag);
        window.addEventListener("touchmove", moveDrag, { passive: true });

        window.addEventListener("mouseup", stopDrag);
        window.addEventListener("touchend", stopDrag);

        document.addEventListener("fullscreenchange", handleFullscreenChange);
        document.addEventListener("webkitfullscreenchange", handleFullscreenChange);
        document.addEventListener("mozfullscreenchange", handleFullscreenChange);
        document.addEventListener("MSFullscreenChange", handleFullscreenChange);

        // 초기 transform 값을 가져옴
        updateTransform();
    };


    /** modal fn  --E **/

    /** 환경설정 **/
    const fn_setApcForm = async function () {
        await gfn_getApcStng(gv_selectedApcCd);

        if (!gfn_isEmpty(gv_apcStng)) {
            lv_rawMtrVlType = gv_apcStng.rawMtrVlType;
        }
    }

    /** 창고선택 **/
    const fn_setWarehouse = async function(){
        jsonComWarehouse = await gfn_getComCdDtls("WAREHOUSE_SE_CD", gv_selectedApcCd);
        const select = document.getElementById("warehouse");
        jsonComWarehouse.forEach(function(item){
           const option  = document.createElement("option");
           option.value = item.cdVl;
           option.textContent = item.cdVlNm;
           select.appendChild(option);
        });
    }

    /** 실적 조회 **/
      async function fn_searchSortPrfmnc(){
        /** 표 초기화 **/
        fn_reset();

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
        if(data.resultList.length > 0){
            let itemCd = data.resultList[0].ITEM_CD;
            let vrtyCd = data.resultList[0].VRTY_CD;
            /** 출하포장단위 조회 상품에대한 **/
            if(jsonSpmtPckgUnit.length == 0){
                jsonSpmtPckgUnit = await gfn_getSpmtPckgUnits(gv_selectedApcCd, itemCd, vrtyCd);
            }
        }

        /** table tbody get **/
        let trs = $("#sortTable > tbody tr");

        /** 조회결과 idx 로 table set (order by sortno 보장 O) **/
        data.resultList.forEach(function(item, idx){
            /** 기존 fn_setPltno 와 같은 셋팅 **/
           let vo = JSON.parse(JSON.stringify(sortPrfmncVO));
           vo.sortYmd = ymd;
           vo.rawMtrInvntrList.push({
              inptQntt : item.QNTT,
              inptWght : item.WGHT,
              wrhsno   : item.WRHSNO
           });
           vo.itemCd = item.ITEM_CD;
           vo.vrtyCd = item.VRTY_CD;
           vo.prdcrIdentno = item.PRDCR_IDENTNO;
           /** 수정조건 선별번호 **/
           vo.sortno = item.SORTNO;
           saveJson.push(vo);
           /** idx 선별 실적 이력으로 table tr 추적 **/
           let tr = trs[idx];
           $(tr).find("td:first").find("button").text("수정");
           $(tr).find("td:first").find("button").off("click").on("click", function(){
               fn_saveSortPrfmnc(this);
           });
           /** 생산자 identno **/
           $(tr).find("td:first").find("input").val(item.PRDCR_IDENTNO);

           /** 등급별 수량 입력 **/
           let sortPrfmncJson = JSON.parse(item.GRD_JSON);
           console.log(sortPrfmncJson,idx,"json");
           sortPrfmncJson.forEach(function(item){
               let colIdx = grdList.findIndex(value => value.grdCd == item.GRD_CD);
               let input = $(tr).children("td").eq(colIdx + 1).find("input");
               $(input).val(item.SORT_QNTT).trigger("change");
               console.log(colIdx);
           });
        });
    }

    /** 표 초기화 **/
    const fn_reset = function(){
       let trs = $("#sortTable > tbody tr").toArray();
       trs.forEach(function(item){
          $(item).find("td:first").find("button").text("조회");
          $(item).find("td:first").find("button").off("click").on("click",function(){
              fn_modal(this);
          });
          $(item).find("input").val("");
       });
    }

    window.addEventListener("DOMContentLoaded",function(){
        fn_modalDrag();
        fn_createRawMtrInvntrGrid();
        fn_searchRawMtrInvntr();
        fn_init();
        setTimeout(() => {
            // SBUxMethod.set("srch-dtp-ymd",gfn_dateToYmd(new Date()));
            SBUxMethod.refresh("srch-dtp-ymd",{'init':gfn_dateToYmd(new Date())});
        },1000)
        console.log(gfn_dateToYmd(new Date()));
    });

</script>
</html>
