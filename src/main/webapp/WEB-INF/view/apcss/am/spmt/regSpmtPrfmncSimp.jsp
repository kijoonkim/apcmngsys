<%
    /**
     * @Class Name : regSpmtPrfmncSimp.jsp
     * @Description : 출하 간편등록 화면
     * @author SI개발부
     * @since 2024.09.10
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.09.25   	손민성		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 출하 간편등록</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>
        #tab_pckgPrfmncReg, #tab_pckgPrfmnc{
            border: 0;
            padding: 0;
        }
        .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-nor-bd > li.sbux-tabs-item > a:hover, .sbux-tabs-wrap.sbux-tabs-webacc ul.sbux-tabs-inbox-bd > li.sbux-tabs-item > a:hover {
            border-color : rgb(221, 221, 221) !important;
        }
        .tabBox{
            border: 1px solid black;
            font-size: 2vw;
            width: 15vw;
            text-align: center;
            padding: 10px 0px;
            text-wrap: nowrap;
            overflow: hidden;
            cursor: pointer;
            /*border-radius: 5px;*/
        }
        .tabBox_sm{
            border: 1px solid black;
            font-size: 1vw;
            width: 5vw;
            text-align: center;
            padding: 10px 0px;
            text-wrap: nowrap;
            overflow: hidden;
            cursor: pointer;

        }
        .tabBox.active, .tabBox_sm.active{
            background-color: #fdbf01;
            /*background-color: #1c54a2;*/
            /*font-weight: bold;*/
            /*color: white;*/
        }
        #tab_pckgPrfmncReg > li > div > table > tbody > tr > th {
            font-size: 28px;
            font-weight: bold;
        }
        .td_input_mob{
            padding: 10px 3vw !important;
            position: relative;
        }
        .cell{
            display: flex;
            gap: 5px;
            flex-wrap: wrap;
            flex: 0 0 100%;
            justify-content: center;
        }
        .carouselBtn{
            width: 100%;
            height: 100%;
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            background-color: initial;
            border: 0;
        }
        .btn-size {
            width: 10vw;
            font-size: 1.2vw;
        }
        table th{
            text-align : center;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start; position: sticky; top:0; background: white; z-index: 999" >
            <div ondblclick="fn_fullScreen()">
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 정산정보조회 -->
            </div>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btnReset"
                        name="btnReset"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="신규"
                        onclick="fn_reset"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <table class="table table-bordered tbl_fixed" style="margin-bottom: 10px">
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
                    <th scope="row" class="th_bg">포장일자</th>
                    <td class="td_input">
                        <div style="display: flex;">
                            <sbux-datepicker
                                    id="srch-dtp-clclnY"
                                    name="srch-dtp-clclnY"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed"
                                    style="height: 28px"
                            ></sbux-datepicker>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>

            <sbux-tabs id="tab_norm" name="tab_norm" uitype="webacc" is-scrollable="false" wrap-style="height:100%"
                       title-target-id-array="tab_pckgPrfmncReg^tab_pckgPrfmnc"
                       title-text-array="출하선택^출하등록"
                       title-style-array="{margin-right: 5px;width: 8vw;
                 text-align: center;font-weight: bold;border-radius:0}^{margin-right: 5px;width: 8vw;
                 text-align: center;font-weight: bold;border-radius:0}">
            </sbux-tabs>

            <div class="tab-content">
                <div id="tab_pckgPrfmncReg">
                    <table class="table table-bordered tbl_fixed" style="margin-top: 10px">
                        <colgroup>
                            <col style="width: 15%">
                            <col style="width: 85%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row" class="th_bg">
                                <div style="display: flex;justify-content: center;flex-direction: column;">
                                    <div>거래처</div>
                                    <div>
                                        <span style="font-size: 15px">고정</span>
                                        <input type="checkbox" id="fixCnpt" />
                                    </div>
                                </div>
                            </th>
                            <td id="cnptInfoWrap" class="td_input_mob">
                                <button class="carouselBtn" onclick="fn_left('cnptInfoWrap')" style="width: 3vw; height: 5vh; position: absolute; top: 40%; left: 0; background-image: url('/static/resource/svg/arrowBack.svg')"></button>
                                <div class="carousel_container" style="width: 100%; overflow: hidden">
                                    <div class="carousel" style="display: flex; width: 100%; transition: all 0.5s;">

                                    </div>
                                </div>
                                <button class="carouselBtn" onclick="fn_right('cnptInfoWrap')" style="width: 3vw; height: 5vh; position: absolute; top: 40%; right: 0; background-image: url('/static/resource/svg/arrowForward.svg')"></button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">생산자</th>
                            <td id="prdcrInfoWrap" class="td_input_mob">
                                <button class="carouselBtn" onclick="fn_left('prdcrInfoWrap')" style="width: 3vw; height: 5vh; position: absolute; top: 40%; left: 0; background-image: url('/static/resource/svg/arrowBack.svg')"></button>
                                <div class="carousel_container" style="width: 100%; overflow: hidden">
                                    <div class="carousel" style="display: flex; width: 100%; transition: all 0.5s;">

                                    </div>
                                </div>
                                <button class="carouselBtn" onclick="fn_right('prdcrInfoWrap')" style="width: 3vw; height: 5vh; position: absolute; top: 40%; right: 0; background-image: url('/static/resource/svg/arrowForward.svg')"></button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">품목</th>
                            <td id="itemInfoWrap" class="td_input_mob">
                                <button class="carouselBtn" onclick="fn_left('itemInfoWrap')" style="width: 3vw; height: 5vh; position: absolute; top: 40%; left: 0; background-image: url('/static/resource/svg/arrowBack.svg')"></button>
                                <div class="carousel_container" style="width: 100%; overflow: hidden">
                                    <div class="carousel" style="display: flex; width: 100%; transition: all 0.5s;">

                                    </div>
                                </div>
                                <button class="carouselBtn" onclick="fn_right('itemInfoWrap')" style="width: 3vw; height: 5vh; position: absolute; top: 40%; right: 0; background-image: url('/static/resource/svg/arrowForward.svg')"></button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">품종</th>
                            <td id="vrtyInfoWrap" class="td_input_mob">
                                <button class="carouselBtn" onclick="fn_left('vrtyInfoWrap')" style="display: none; width: 3vw; height: 5vh; position: absolute; top: 40%; left: 0; background-image: url('/static/resource/svg/arrowBack.svg')"></button>
                                <div class="carousel_container" style="width: 100%; overflow: hidden">
                                    <div class="carousel" style="display: flex; width: 100%; transition: all 0.5s;">

                                    </div>
                                </div>
                                <button class="carouselBtn" onclick="fn_right('vrtyInfoWrap')" style="display: none; width: 3vw; height: 5vh; position: absolute; top: 40%; right: 0; background-image: url('/static/resource/svg/arrowForward.svg')"></button>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">규격</th>
                            <td id="spcfctInfoWrap"class="td_input_mob">
                                <button class="carouselBtn" onclick="fn_left('spcfctInfoWrap')" style="display: none; width: 3vw; height: 5vh; position: absolute; top: 40%; left: 0; background-image: url('/static/resource/svg/arrowBack.svg')"></button>
                                <div class="carousel_container" style="width: 100%; overflow: hidden">
                                    <div class="carousel" style="display: flex; width: 100%; transition: all 0.5s;">

                                    </div>
                                </div>
                                <button class="carouselBtn" onclick="fn_right('spcfctInfoWrap')" style="display: none; width: 3vw; height: 5vh; position: absolute; top: 40%; right: 0; background-image: url('/static/resource/svg/arrowForward.svg')"></button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding: 0; font-size: 28px; font-weight: bold;">
                                <div style="background: #c5e0b4;flex-shrink: 0; padding: 10px 5vw; display: flex;gap: 5vw">
                                    <div style="display: flex;gap: 10px; flex-shrink: 0;">재고 <input id="invntrQntt" type="number" style="color: #0a199e; border: 1px solid black;width: 10vw; background: white; padding-left: 10px" /></div>
                                    <div style="display: flex;gap: 2px; flex-shrink: 0;">거래처: <div id="cnptcd" type="text" style="color: #0a199e"></div></div>
                                    <div style="display: flex;gap: 2px; flex-shrink: 0;">생산자: <div id="prdcrcd" type="text" style="color: #0a199e"></div></div>
                                    <div style="display: flex;gap: 2px; flex-shrink: 0;">품종: <div id="vrtycd" type="text" style="color: #0a199e"></div></div>
                                    <div style="display: flex;gap: 2px; flex-shrink: 0;">규격: <div id="spcfctcd" type="text" style="color: #0a199e"></div></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="th_bg">수량</th>
                            <td class="td_input_mob">
                                <div style="display: flex; justify-content: space-between">
                                    <div style="display: flex; gap: 1.5vw">
                                        <div class="tabBox_sm" onclick="fn_cntAdd(this)" style="font-weight: bold; background: #8faadc;">1</div>
                                        <div class="tabBox_sm" onclick="fn_cntAdd(this)" style="font-weight: bold; background: #8faadc;">5</div>
                                        <div class="tabBox_sm" onclick="fn_cntAdd(this)" style="font-weight: bold; background: #8faadc;">10</div>
                                        <div class="tabBox_sm" onclick="fn_cntAdd(this)" style="font-weight: bold; background: #8faadc;">50</div>
                                        <div class="tabBox_sm" onclick="fn_cntAdd(this)" style="font-weight: bold; background: #8faadc;">100</div>
                                    </div>
                                    <div style="display: flex; gap: 1.5vw">
                                        <input id="pckgQntt" type="number" style="font-size: 1.5vw; text-align: center; background: #ffff00;border: 1px solid black"/>
                                        <sbux-button
                                                id="btnRegReset"
                                                name="btnRegReset"
                                                uitype="normal"
                                                class="btn btn-outline-danger btn-size"
                                                text="초기화"
                                                onclick="fn_RegReset"
                                        ></sbux-button>
                                        <sbux-button
                                                id="btnRegSave"
                                                name="btnRegSave"
                                                uitype="normal"
                                                class="btn btn-success btn-size"
                                                text="확인"
                                                onclick="fn_add"
                                        ></sbux-button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div id="tab_pckgPrfmnc">
                    <div id="sb-area-pckgPrfmnc" style="height: 500px; padding: 10px 0px">

                    </div>
                    <div style="display: flex; gap: 10px;justify-content: flex-end">
                        <button class="btn btn-success" onclick="fn_saveWithReport()">출하등록<span style="color: yellow"> + 출하통지서</span></button>
                        <button class="btn btn-success">출하등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- clip report direct print area  -->
<div id="div-rpt-clipReportPrint" style="display:none;"></div>
</body>
<script type="text/javascript">
    /** 포장실적 grid 변수 **/
    var jsonPckgPrfmnc = [];
    let gridPckgPrfmnc;

    /** 출하선택용 Obj **/
    let spmtObj = {};

    window.addEventListener("DOMContentLoaded",function(){
        fn_init();
    });
    let carouselObj = {
        cnptInfoWrap : {
            CAROUSEL_LENGTH : 0,
            current : 0
        },
        prdcrInfoWrap : {
            CAROUSEL_LENGTH : 0,
            current : 0
        },
        itemInfoWrap : {
            CAROUSEL_LENGTH : 0,
            current : 0
        },
        vrtyInfoWrap : {
            CAROUSEL_LENGTH : 0,
            current : 0
        }
    };
    let CAROUSEL_LENGTH = 0;
    let current = 0;

    function fn_left(_el){
        let id = _el;

        if (carouselObj[id].current !== 0) {
            carouselObj[id].current--;
            $(`#${'${id}'} > div > div.carousel`).css('transform', `translateX(${'${current * -76.7}'}vw)`);
        }
    }
    function fn_right(_el){
        let id = _el;

        if (carouselObj[id].current !== carouselObj[id].CAROUSEL_LENGTH) {
            $(`#${'${id}'} > div > div.carousel`).css('transform', `translateX(${'${(current +1) * -76.7}'}vw)`);
            carouselObj[id].current++;
        }
    }

    const fn_init = async function(){
        SBUxMethod.set('srch-dtp-clclnY',gfn_dateToYmd(new Date()));
        /** 거래처 **/
        await fn_search_cnpt();
        /** 생산자 **/
        await fn_search_prdcr();
        /** 품목 **/
        await fn_search_item();

        /** 포장실적 grid 생성 **/
        await fn_create_pckgPrfmnc();
        fn_addDragEvn("cnptInfoWrap");
        fn_addDragEvn("prdcrInfoWrap");
        fn_addDragEvn("vrtyInfoWrap");
    }
    const fn_create_pckgPrfmnc = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-pckgPrfmnc';
        SBGridProperties.id = 'gridPckgPrfmnc';
        SBGridProperties.jsonref = 'jsonPckgPrfmnc';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ["처리"], ref: 'pckgno', type:'button', width:'5%',style: 'text-align:center;padding:5px',fixedstyle: 'font-size:20px;font-weight:bold',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                    return "<button type='button' style='font-size:15px' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                }
            },
            {caption: ["거래처"],	ref: 'cnptNm',		type:'output',  width:'20%', style: 'text-align:center; font-size:15px',fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["생산자"],	ref: 'prdcrNm',		type:'output',  width:'15%', style: 'text-align:center; font-size:15px',fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["품목"],	ref: 'itemNm',		type:'output',  width:'20%', style: 'text-align:center; font-size:15px',fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["품종"],	ref: 'vrtyNm',		type:'output',  width:'20%', style: 'text-align:center; font-size:15px',fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["규격"],	ref: 'spcfctNm',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px',fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["수량"],	ref: 'invntrQntt',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px',fixedstyle: 'font-size:20px;font-weight:bold'},
        ]
        gridPckgPrfmnc = _SBGrid.create(SBGridProperties);
    }

    const fn_search_cnpt = async function(){
        /** 거래처 **/
        const postJsonPromise = gfn_postJSON(URL_CNPT_INFO, {apcCd: gv_apcCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;
        await fn_append_button(data,"cnptInfoWrap","cnptNm","cnptCd");
        carouselObj.cnptInfoWrap.CAROUSEL_LENGTH = document.querySelectorAll("#cnptInfoWrap > div.carousel_container > div.carousel > div.cell").length - 1;
    }
    const fn_search_prdcr = async function(){
        const postJsonPromise = gfn_postJSON(URL_PRDCR_INFO, {apcCd: gv_apcCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;
        await fn_append_button(data,"prdcrInfoWrap","prdcrNm","prdcrCd");
        carouselObj.prdcrInfoWrap.CAROUSEL_LENGTH = document.querySelectorAll("#prdcrInfoWrap > div.carousel_container > div.carousel > div.cell").length - 1;
    }
    const fn_search_item = async function(){
        const postJsonPromise = gfn_postJSON(URL_APC_ITEMS, {apcCd: gv_apcCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;
        await fn_append_button(data,"itemInfoWrap","itemNm","itemCd");
        carouselObj.itemInfoWrap.CAROUSEL_LENGTH = document.querySelectorAll("#itemInfoWrap > div.carousel_container > div.carousel > div.cell").length - 1;
    }
    const fn_search_vrty = async function(_itemCd){
        const postJsonPromise = gfn_postJSON(URL_APC_VRTYS, {apcCd: gv_apcCd, itemCd: _itemCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;
        await fn_append_button(data,"vrtyInfoWrap","vrtyNm","vrtyCd", true);
        carouselObj.vrtyInfoWrap.CAROUSEL_LENGTH = document.querySelectorAll("#vrtyInfoWrap > div.carousel_container > div.carousel > div.cell").length - 1;
    }
    const fn_search_spcfct = async function(_itemCd){
        const postJsonPromise = gfn_postJSON(URL_APC_SPCFCTS, {apcCd: gv_apcCd, itemCd: _itemCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;
        await fn_append_button(data,"spcfctInfoWrap","spcfctNm","spcfctCd",true);
    }

    const fn_append_button = async function(data, id, label, value, flag = false){
        if(gfn_isEmpty(data)) return;

        let targetId = "#" + id;
        let triggerFlag = data.resultList.length == 1;

        /** 다음페이지 필요하지않을 경우 **/
        if(data.resultList.length < 11){
            $(`${'${targetId}'} > button`).css('display','none');
        }else{
            $(`${'${targetId}'} > button`).css('display','block');
        }

        if(!flag){
            if(data.resultList.length % 10 !== 0 && data.resultList.length > 5){
                let cnt = (Math.floor(data.resultList.length / 10) + 1) * 10;
                let originLength = data.resultList.length;
                data.resultList.length = cnt;
                data.resultList.fill({cnptNm:'null'},originLength);
            }
            if(data.resultList.length < 5){
                let cnt = (Math.floor(data.resultList.length / 5) + 1) * 5;
                let originLength = data.resultList.length;
                data.resultList.length = cnt;
                data.resultList.fill({cnptNm:'null'},originLength);
            }
        }else{
            /** 가변적 button clear **/
            $(`${'${targetId}'} > div > div`).empty();

            if(data.resultList.length == 0){
                /** 규격,품종이 없을떄 **/
                data.resultList.push({
                    [label] : '없음',
                    [value] : 'empty'
                });
            }
            if(data.resultList.length % 10 !== 0 && data.resultList.length > 10 ){
                let cnt = (Math.floor(data.resultList.length / 10) + 1) * 10;
                let originLength = data.resultList.length;
                data.resultList.length = cnt;
                data.resultList.fill({cnptNm:'null'},originLength);
            }
            if(data.resultList.length < 5){
                let originLength = data.resultList.length;
                data.resultList.length = 5;
                data.resultList.fill({cnptNm:'null'},originLength);
            }
        }

        for(let i = 0; i < data.resultList.length; i++){
            if(i != 0 && i % 10 != 0){
                let flag = data.resultList[i].cnptNm == 'null';
                let style = flag ? 'visibility:hidden;' : '';

                $(`${'${targetId}'} > .carousel_container > .carousel > :last-child`).append(`
                <div class="tabBox" style="${'${style}'}" onclick="fn_select_button(this)" data-${'${value}'}="${'${data.resultList[i][value]}'}">
                    ${'${data.resultList[i][label]}'}
                </div>
                `);
            }else{
                $(`${'${targetId}'} > .carousel_container > .carousel`).append(`
                    <div class="cell">
                        <div class="tabBox" onclick="fn_select_button(this)" data-${'${value}'}="${'${data.resultList[i][value]'}}">
                            ${'${data.resultList[i][label]}'}
                        </div>
                    </div>
                    `)
            }
        }
        if(triggerFlag){
            /** option이 한개 뿐일떄 **/
            $(`${'${targetId}'} > .carousel_container > .carousel > .cell > .tabBox`).eq(0).trigger('click');
        }
    }

    const fn_select_button = async function(_el){
        if($(_el).hasClass("active"))return;

        $(_el).closest('div.carousel').find("div.active").removeClass("active");
        $(_el).addClass("active");
        let dataObj = $(_el).data();
        /** 만약 정보 더 필요해서 data 추가되면 돌려서 집어야함 **/
        for(let key in dataObj){
            if(key == 'itemcd'){
                await fn_search_spcfct(dataObj[key]);
                await fn_search_vrty(dataObj[key]);
                /** 품목별 품종, 규격 셋팅시 active가 없으면 재고탭 refresh **/
                /** 품종 **/
                if(!$(`#vrtyInfoWrap > .carousel_container > .carousel > .cell > .tabBox`).hasClass('active')){
                    $("#vrtycd").html('');
                    if(spmtObj.hasOwnProperty("vrtyCd")|| spmtObj.hasOwnProperty("vrtyNm")){
                        delete spmtObj.vrtyCd;
                        delete spmtObj.vrtyNm;
                    }
                }
                /** 규격 **/
                if(!$(`#spcfctInfoWrap > .carousel_container > .carousel > .cell > .tabBox`).hasClass('active')){
                    $("#spcfctcd").html('');
                    if(spmtObj.hasOwnProperty("spcfctCd")|| spmtObj.hasOwnProperty("spcfctNm")){
                        delete spmtObj.spcfctCd;
                        delete spmtObj.spcfctNm;
                    }
                }
            }
            $(`#${'${key}'}`).html($(_el).html());

            let prefix = key.replace('cd','');
            spmtObj[prefix + 'Cd'] = String(dataObj[key]);
            spmtObj[prefix + 'Nm'] = String($(_el).text().trim());
            $(`#${'${key}'}`).val($(_el).data(key));
        }

        /** 모든 탭이 선택될시 재고 조회 **/
        fn_check_buttonAll();
    }
    const fn_cntAdd = function(_el){
        let value = parseInt($(_el).text());
        let originCnt = parseInt($("#pckgQntt").val()) || 0;
        $("#pckgQntt").val(originCnt + value);
    }
    const fn_reset = function(){
        let tabId = SBUxMethod.get("tab_norm");
        if(tabId =='tab_pckgPrfmnc'){
            jsonPckgPrfmnc.length = 0;
            gridPckgPrfmnc.rebuild();
        }else {
            let isChecked = $('#fixCnpt').is(':checked');
            /** 재고 선택 상태 초기화 **/
            $("#invntrQntt").val(null);
            $("#prdcrcd").html('');
            $("#vrtycd").html('');
            $("#spcfctcd").html('');

            if (isChecked) {
                $('div.tabBox.active').each(function (index) {
                    if (index !== 0) {
                        $(this).removeClass('active');
                    }
                });
                let cnptCd = spmtObj.cnptCd;
                let cnptNm = spmtObj.cnptNm;
                spmtObj = {};
                spmtObj.cnptCd = cnptCd;
                spmtObj.cnptNm = cnptNm;
            } else {
                $('div.tabBox.active').removeClass('active');
                $("#cnptcd").html('');
                spmtObj = {};
            }
            fn_RegReset();
        }
    }
    const fn_addDragEvn = function(_id) {
        let id = "#" + _id;
        const element = $(`${'${id}'} > div.carousel_container > div.carousel`).get(0);

        let isDragging = false;
        let startX = 0;
        let startY = 0;
        let threshold = 0;

        // 터치 시작 이벤트
        element.addEventListener('touchstart', (e) => {
            isDragging = true;
            startX = e.touches[0].clientX;  // 터치 좌표는 e.touches 배열에서 가져옴
            startY = e.touches[0].clientY;

            threshold = element.offsetWidth * 0.3;  // 40% 넓이 임계값 설정
        });

        // 터치 이동 이벤트
        element.addEventListener('touchmove', (e) => {
            if (isDragging) {
                const currentX = e.touches[0].clientX;  // 현재 터치 좌표
                const deltaX = currentX - startX;       // 드래그 이동 거리

                if (Math.abs(deltaX) > threshold) {     // 임계값 초과 시
                    isDragging = false;
                    if (deltaX > 0) {
                        fn_left(_id);                  // 오른쪽 드래그
                    } else if (deltaX < 0) {
                        fn_right(_id);                 // 왼쪽 드래그
                    }
                }
            }
        });

        // 터치 종료 이벤트
        element.addEventListener('touchend', () => {
            isDragging = false;   // 드래그 종료
        });
    };

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

    const fn_check_buttonAll = async function(){
        /** 재고 조회시 옆탭에 json에 있는가 확인해야함. **/
        let activeCnt = $("div.tabBox.active").length;
        if(activeCnt < 5)return;
    }

    const fn_add = async function(){
        /** validation **/
        let addCnt = $("#pckgQntt").val();
        let invntCnt = $("#invntrQntt").val();

        if(addCnt > invntCnt){
            gfn_comAlert("W0008","재고수량","등록수량");
            return;
        }
        if(addCnt == 0){
            gfn_comAlert("W0005","등록수량");
            return;
        }
        if(!gfn_comConfirm("Q0001","추가")){
            return;
        }
        spmtObj.invntrQntt = addCnt;
        jsonPckgPrfmnc.push(spmtObj);
        gridPckgPrfmnc.rebuild();

        fn_reset();
    }
    const fn_RegReset = function(){
        $("#pckgQntt").val('');
    }

    const fn_delRow = function(){
        if(!gfn_comConfirm("Q0001","삭제")){
            return;
        }

        let row = gridPckgPrfmnc.getRow()-1;
        jsonPckgPrfmnc.splice(row,1);
        gridPckgPrfmnc.rebuild();
    }
    const fn_saveWithReport = async function(){
        const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'DO_DOC');
        await gfn_popClipReport("출하통지서", rptUrl, {apcCd: gv_selectedApcCd});
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
