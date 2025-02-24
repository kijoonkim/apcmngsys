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
<%
    String userAgent = request.getHeader("User-Agent");
    boolean isMobile = userAgent.matches(".*(Mobile|Android|iPhone|iPad).*");
%>
<c:set var="isMobile" value="<%= isMobile %>" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Title</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>

  <Style>
      input[type="number"] {
          -webkit-appearance: none;
          -moz-appearance: textfield; /* 파이어폭스에서 적용 */
          appearance: none;
          border: none !important;
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
  </Style>
</head>
<body style="overflow: hidden">
<div class="area-wrap">
    <div class="iner-wrap">
        <H1 ondblclick="fn_fullScreen();" style="text-align: center"><span id="yyyy"></span>년 공동선별작업일지(B동)</H1>
        <h5 style="margin-left: 1vw">일자 : <span id="ymd"></span></h5>
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

    window.addEventListener("DOMContentLoaded",function(){
        fn_modalDrag();
        fn_createRawMtrInvntrGrid();
        fn_searchRawMtrInvntr();
        fn_init();
    });
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
                input.style.width = "100%";
                td.appendChild(input);
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

        $("#ymd").text(gfn_dateToYmd(new Date(),"",true));
        $("#yyyy").text(gfn_dateToYear(new Date()));

        //table valueChg event
        fn_addChange();
    }
    const fn_addChange = function(){
        /** 입고번호(생산자라인) 입력시 **/
        $("#sortTable > tbody > tr > td:first-child input").on("input", function () {
            fn_searchInvntr($(this));
        });
        $("#sortTable > tbody > tr > td:first-child input").on("dblclick", function () {
            fn_modal();
        });

        /** save by row**/
        $("#sortTable tbody tr").on("focusout", function(event) {
            let tr = $(this);

            setTimeout(function() {
                if (!tr.is(":has(:focus)")) {
                    fn_saveSortPrfmnc(event);
                }
            }, 10);
        });
        /** 수량 입력시 saveJson 셋팅 **/
        $("#sortTable tbody tr td:not(:first-child) input").on("change", function () {
            fn_setSaveJson($(this));
        });
    }

    const fn_searchInvntr = async function(_el){
        const pattern = /^[A-Z]{2}\d{12}$/;
        let val = $(_el).val();
        console.log(val);

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

            console.log(data,"원물정보");
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
        // await Swal.fire({
        //     title: '저장하시겠습니까?',
        //     icon: 'warning',
        //     showCancelButton: true,
        //     confirmButtonColor: '#3085d6',
        //     cancelButtonColor: '#d33',
        //     confirmButtonText: '저장',
        //     cancelButtonText: '취소',
        // });
    }
    const fn_setSaveJson = function(_el){
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
        grdRawMtrInvntr.bind('click', 'fn_setPltno');

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
        console.log(jsonRawMtrInvntr);
        grdRawMtrInvntr.rebuild();
    }
    const fn_modal = function(){
        const displayValue = $('#modal').css('display');
        if(displayValue === 'none'){
            $("#modal").css("display","block");
        }else{
            $("#modal").css("display","none");
        }
    }
    const fn_modalDrag = function() {
        let isDragging = false;
        let startX, startY, translateX = 0, translateY = 0;
        let modalContent = document.getElementById("modal");

        const startDrag = (e) => {
            isDragging = true;
            $("#closeModal").css("cursor", "grabbing");

            let clientX = e.type.includes("touch") ? e.touches[0].clientX : e.clientX;
            let clientY = e.type.includes("touch") ? e.touches[0].clientY : e.clientY;

            startX = clientX - translateX;
            startY = clientY - translateY;
        };

        const moveDrag = (e) => {
            if (!isDragging) return;

            let clientX = e.type.includes("touch") ? e.touches[0].clientX : e.clientX;
            let clientY = e.type.includes("touch") ? e.touches[0].clientY : e.clientY;

            translateX = clientX - startX;
            translateY = clientY - startY;

            modalContent.style.transform = `translate(${'${translateX}'}px, ${'${translateY}'}px)`;
        };

        const stopDrag = () => {
            isDragging = false;
            $("#closeModal").css("cursor", "grab");
        };

        modalContent.addEventListener("mousedown", startDrag);
        modalContent.addEventListener("touchstart", startDrag, { passive: true });

        window.addEventListener("mousemove", moveDrag);
        window.addEventListener("touchmove", moveDrag, { passive: true });

        window.addEventListener("mouseup", stopDrag);
        window.addEventListener("touchend", stopDrag);
    };
    const fn_setPltno = async function(){

    }

    /** modal fn  --E **/


</script>
</html>
