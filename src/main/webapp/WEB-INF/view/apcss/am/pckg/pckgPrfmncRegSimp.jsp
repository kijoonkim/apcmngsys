<%
    /**
     * @Class Name : pckgPrfmncRegSimp.jsp
     * @Description : 포창 간편등록 화면
     * @author SI개발부
     * @since 2024.09.10
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.09.12   	손민성		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 포장 간편등록</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <script src="/js/out/view.bundle.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
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
            font-size: 2.5vw;
            width: 22vw;
            text-align: center;
            padding: 10px 0px;
            text-wrap: nowrap;
            overflow: hidden;
            cursor: pointer;
            border-radius: 5px;
            background: white;
        }

        .tabBox_sm, .tabBox_sm2, .tabBox_sm3{
            border: 1px solid black;
            font-size: 1.5vw;
            width: 15vw;
            text-align: center;
            padding: 10px 0px;
            text-wrap: nowrap;
            overflow: hidden;
            cursor: pointer;
            background: white;

        }
        .tabBox.active, .tabBox_sm.active, .tabBox_sm3.active{
            /*background-color: #fdbf01;*/
            background-color: #1c54a2;
            font-weight: bold;
            color: white;
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
            display: grid;
            grid-gap: 1.1vw;
            grid-template-columns: repeat(4,1fr);
            padding: 0px 5px;
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
            width: 9vw;
            font-size: 1.2vw;
        }
        table th{
            text-align : center;
        }

		.sbux-spi {
		    display: flex;
		    align-items: center;
		    height: 100%;
		}

		.sbux-spi-inp-wrap input {
		    height: 100%;
		    text-align: center;
		}

		.sbux-spi-btn-wrap {
		    display: flex;
		    flex-direction: column;
		    height: 100%;
		}

		.sbux-spi-btn {
		    flex: 1;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		}
        #smartwizard .tab-content {
            min-height: 400px; /* 필요한 만큼 조정 */
            height: auto !important;
        }
        .tab-content{
            padding: 0!important;
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
            <div>
                <sbux-switch id="switch_single" name="switch_single" uitype="single" switch-speed="fast" glow-effect="false" checked label-front-back-text='확인메세지^켬'>
                </sbux-switch>
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
                        id="btnSearch"
                        name="btnSearch"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="조회"
                        onclick="fn_search"
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
                        <div style="display: flex; gap: 15px; align-items: center">
                            <sbux-datepicker
                                    id="srch-dtp-pckgYmdFrom"
                                    name="srch-dtp-pckgYmdFrom"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed"
                                    style="height: 28px"
                            ></sbux-datepicker>
                            <sbux-datepicker
                                    id="srch-dtp-pckgYmdTo"
                                    name="srch-dtp-pckgYmdTo"
                                    uitype="popup"
                                    date-format="yyyy-mm-dd"
                                    class="form-control input-sm input-sm-ast inpt_data_reqed"
                                    style="height: 28px"
                            ></sbux-datepicker>
                            <sbux-checkbox id="chkbox_norm" name="chkbox_norm" uitype="normal" text="일일기준" onclick="fn_oneDay()">
                            </sbux-checkbox>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>

            <sbux-tabs id="tab_norm" name="tab_norm"
                       uitype="normal"
                       is-scrollable="false"
<%--                       wrap-style="height:calc(100% - 200px)"--%>
                       title-target-id-array="tab_pckgPrfmncReg^tab_pckgPrfmnc"
                       title-text-array="포장등록^실적조회" onclick="fn_changeTab()"
                       title-style-array="{margin-right: 5px;width: 8vw;
                 text-align: center;font-weight: bold;border-radius:0}^{margin-right: 5px;width: 8vw;
                 text-align: center;font-weight: bold;border-radius:0}">
            </sbux-tabs>

            <div class="tab-content" style="height: calc(100% - 100px)">
                <div id="tab_pckgPrfmncReg">
                    <div id="smartwizard">
                        <ul class="nav">
                            <li><a class="nav-link" href="#step-1">거래처<br/><small></small></a></li>
                            <li><a class="nav-link" href="#step-2">생산자<br/><small></small></a></li>
                            <li><a class="nav-link" href="#step-3">품목<br/><small></small></a></li>
                            <li><a class="nav-link" href="#step-4">품종<br/><small></small></a></li>
<%--                            <li><a class="nav-link" href="#step-5">규격<br/><small></small></a></li>--%>
                            <li><a class="nav-link" href="#step-5">규격 & 본수<br/><small></small></a></li>
                        </ul>

                        <div class="tab-content" style="height: calc(100% - 100px)!important;">
                            <div id="step-1" class="tab-pane" role="tabpanel">
                                <div id="cnptInfoWrap">
                                    <div class="carousel_container" style="width: 100%; overflow: hidden">
                                        <div class="carousel" style="display: flex; width: 100%; transition: all 0.5s;">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="step-2" class="tab-pane" role="tabpanel">
                                <div id="prdcrInfoWrap">
                                    <div class="carousel_container" style="width: 100%; overflow: hidden">
                                        <div class="carousel" style="display: flex; width: 100%; transition: all 0.5s;">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="step-3" class="tab-pane" role="tabpanel">
                                <div id="itemInfoWrap">
                                    <div class="carousel_container" style="width: 100%; overflow: hidden">
                                        <div class="carousel" style="display: flex; width: 100%; transition: all 0.5s;">

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="step-4" class="tab-pane" role="tabpanel">
                                <div id="vrtyInfoWrap" style="display: flex;flex-direction: column">
                                    <div style="display: flex;justify-content:center;gap: 2vw">
                                        <sbux-input
                                                uitype="text"
                                                id="srch-inp-vrtyInfo"
                                                name="srch-inp-vrtyInfo"
                                                class="form-control input-sm input-sm-ast"
                                                wrap-style="flex-basis:40%;"
                                                style="height:64px;background-color:white!important;font-size: 3rem"
                                                placeholder="초성검색 가능"
                                                autocomplete-ref="jsonVrtyList"
                                                autocomplete-text="name"
                                                autocomplete-height="270px"
                                                oninput="fn_onInputVrty(event)"
                                                readonly
                                        ></sbux-input>
                                        <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all" onclick="fn_delWord('one')">
                                            삭제
                                        </button>
                                        <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all" onclick="fn_delWord('all')">
                                            초기화
                                        </button>
                                    </div>
                                    <div>
                                        <div class="grid grid-cols-7 gap-4 p-4">
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㄱ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㄴ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㄷ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㄹ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㅁ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㅂ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㅅ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㅇ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㅈ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㅊ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㅋ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㅌ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㅍ
                                            </button>
                                            <button class="chosung-button bg-white border-2 border-gray-300 rounded-lg p-6 text-5xl font-bold hover:bg-blue-100 transition-all">
                                                ㅎ
                                            </button>
                                        </div>
                                    </div>
                                    <div id="vrtyBtnArea">
                                        <div class="carousel_container" style="width: 100%; overflow: hidden;">
                                            <div class="carousel" style="display: flex; width: 100%; transition: all 0.5s;">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--<div id="step-5" class="tab-pane" role="tabpanel">
                                <div id="spcfctInfoWrap">
                                    <div class="carousel_container" style="width: 100%; overflow: hidden">
                                        <div class="carousel" style="display: flex; width: 100%; transition: all 0.5s;">

                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div id="step-5" class="tab-pane" role="tabpanel">
                                <div style="display: flex;flex-direction: column;gap: 1vh">
                                    <div style="color: #3c6dbc; font-weight: 600;font-size: 1.5vw">규격</div>
                                    <div id="spcfctInfoWrap">
                                        <div class="carousel_container" style="width: 100%; overflow: hidden">
                                            <div class="carousel" style="display: flex;gap: 1.5vw">
                                                <div style="display: flex;gap: 1.5vw">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style="color: #3c6dbc; font-weight: 600;font-size: 1.5vw">본수</div>
                                    <div class="carousel">
                                        <div style="display: flex;gap: 1.5vw">
                                            <div class="tabBox_sm" onclick="fn_select_button(this)" data-cnt="1">1</div>
                                            <div class="tabBox_sm" onclick="fn_select_button(this)" data-cnt="2">2</div>
                                            <div class="tabBox_sm" onclick="fn_select_button(this)" data-cnt="3">3</div>
                                            <div class="tabBox_sm" onclick="fn_select_button(this)" data-cnt="4">4</div>
                                            <div class="tabBox_sm" onclick="fn_select_button(this)" data-cnt="5">5</div>
                                            <div class="tabBox_sm" onclick="fn_select_button(this)" data-cnt="6">6</div>
                                            <div class="tabBox_sm" onclick="fn_select_button(this)" data-cnt="7">7</div>
                                            <div class="tabBox_sm" onclick="fn_select_button(this)" data-cnt="8">8</div>
                                            <div class="tabBox_sm" onclick="fn_select_button(this)" data-cnt="9">9</div>
                                            <div class="tabBox_sm" onclick="fn_select_button(this)" data-cnt="10">10</div>
                                        </div>
                                    </div>
                                    <div style="display: flex;">
                                        <div style="color: #3c6dbc; font-weight: 600;font-size: 1.5vw; align-self: center">수량</div>
                                        <div style="width: 30%; margin-left: 2vw">
                                            <sbux-input
                                                    uitype="text"
                                                    id="spinner_normal_0"
                                                    name="spinner_normal_0"
                                                    wrap-style="flex-basis:40%;"
                                                    style="height:100%;text-align:center;background-color:white!important;font-size: 5rem"
                                                    readonly
                                            ></sbux-input>
                                        </div>

                                        <%--<div class="sbux-spi sbux-spi-nor sbux-spi-align-right sbux-comp-root sbux-uuid-spinner_normal" style="width: 30%; height: 6vh; margin-left: 2vw">
                                         	<span class="sbux-spi-inp-wrap" style="height:100%">
                                         		<input type="number"
                                                       id="spinner_normal_0"
                                                       maxlength="undefined"
                                                       class="sbux-spi-inp sbux-spi-type-num sbux-spi-txt-center sbux-exist"
                                                       data-sbux-name="spinner_normal"
                                                       data-sbux-model-name="spinner_normal"
                                                       data-sbux-storage-data="value"
                                                       style="height:100%;  font-size: 1.2vw">
                                   			</span>
                                            <span class="sbux-spi-btn-wrap sbux-spi-btn-vertical" style="height:100%">
                                   				<button type="button" id="buttonUp"class="sbux-spi-btn sbux-spi-up">
	                                   				<i class="fas fa-caret-up" aria-hidden="true"></i>
	                                   			</button>
	                                   			<button type="button" id="buttonDown" class="sbux-spi-btn sbux-spi-down">
	                                   				<i class="fas fa-caret-down" aria-hidden="true"></i>
                                   				</button>
                                   			</span>
                                            <input type="hidden" name="spinner_normal" style="display:none;" value="">
                                        </div>--%>
                                        <div style="display: flex;gap: 1vw;align-self: center; margin: 1vw">
                                            <sbux-button
                                                    id="btnRegDel"
                                                    name="btnRegDel"
                                                    uitype="normal"
                                                    class="btn btn-outline-danger btn-size"
                                                    text="지움"
                                                    onclick="fn_RegDel"
                                            ></sbux-button>
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
                                                    text="저장"
                                                    onclick="fn_save"
                                            ></sbux-button>
                                        </div>
                                    </div>
                                    <div class="carousel">
                                        <div style="display: flex;gap: 1.5vw;">
                                            <div class="tabBox_sm2" onclick="fn_select_qntt_button(this)" data-cnt="0">0</div>
                                            <div class="tabBox_sm2" onclick="fn_select_qntt_button(this)" data-cnt="1">1</div>
                                            <div class="tabBox_sm2" onclick="fn_select_qntt_button(this)" data-cnt="2">2</div>
                                            <div class="tabBox_sm2" onclick="fn_select_qntt_button(this)" data-cnt="3">3</div>
                                            <div class="tabBox_sm2" onclick="fn_select_qntt_button(this)" data-cnt="4">4</div>
                                            <div class="tabBox_sm2" onclick="fn_select_qntt_button(this)" data-cnt="5">5</div>
                                            <div class="tabBox_sm2" onclick="fn_select_qntt_button(this)" data-cnt="6">6</div>
                                            <div class="tabBox_sm2" onclick="fn_select_qntt_button(this)" data-cnt="7">7</div>
                                            <div class="tabBox_sm2" onclick="fn_select_qntt_button(this)" data-cnt="8">8</div>
                                            <div class="tabBox_sm2" onclick="fn_select_qntt_button(this)" data-cnt="9">9</div>
                                        </div>
                                    </div>

                                    <div id="sb-area-pckgPrfmncReg" style="height: 200px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab_pckgPrfmnc">
                    <div id="sb-area-pckgPrfmnc" style="height: 500px; padding: 10px 0px"></div>
                    <div style="display: flex; justify-content: flex-end">
                        <sbux-button
                                id="btnExportExcel"
                                name="btnExportExcel"
                                uitype="normal"
                                class="btn btn-sm btn-outline-danger"
                                text="엑셀다운로드"
                                onclick="fn_exportExcel"
                        ></sbux-button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
<script type="text/javascript">

	let nowPrdcrNm = "";
    /** 포장실적 grid 변수 **/
    var jsonPckgPrfmnc = [];
    let gridPckgPrfmnc;

    let gridPckgPrfmncReg;
    var jsonPckgPrfmncReg = [];

    let jsonSearchItemVrty = [];
    /** 포장 실적 Obj **/
    let pckgObj = {};

    /** 품종 json **/
    let jsonVrtyList = [];
    let jsonVrtyListTemp = [];


    window.addEventListener("DOMContentLoaded",function(){
       fn_init();
       /** 포장등록시 일일기준 강제처리 **/
       fn_changeTab();

       // 초기값 설정
        SBUxMethod.set("spinner_normal_0", "0");
       /*const inputField = document.getElementById("spinner_normal_0");
       const buttonUp = document.getElementById("buttonUp");
       const buttonDown = document.getElementById("buttonDown");

       // 초기값 설정
       inputField.value = inputField.value || 0;

       buttonUp.addEventListener("click", function () {
           inputField.value = parseInt(inputField.value, 10) + 1;
       });

       buttonDown.addEventListener("click", function () {
           let currentValue = parseInt(inputField.value, 10);
           if (currentValue > 0) {
               inputField.value = currentValue - 1;
           }
       });*/
        $('#smartwizard').smartWizard({
            theme: 'arrows', // 'default', 'arrows', 'dots', 'circles'
            toolbar: {
                showNextButton: false,  // "Next" 버튼 숨기기
                showPreviousButton: false,  // "Previous" 버튼 숨기기
                position: 'none' // 툴바 자체 숨기기
            },
            autoAdjustHeight: false,
            transition: {
                animation: 'slideHorizontal',
                speed: '400',
            },
            enableAnchorOnDoneStep: true // 완료된 단계는 클릭 가능하게
        });

        $('#smartwizard').on('showStep', function(e, anchorObject, stepIndex, stepDirection) {
            if (stepIndex === 5) {
                fn_search();
            }
        });

        $("#vrtyInfoWrap div.grid button").on("click",function(event){
            let target = event.target.innerText;
            // let prev = SBUxMethod.get("srch-inp-vrtyInfo")||'';
            // let result = prev + target;
            let result = target;
            SBUxMethod.set("srch-inp-vrtyInfo",result);
            fn_onInputVrty(result);
        });

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
    //let current = 0;

    function fn_left(_el){
        let id = _el;

        if (carouselObj[id].current !== 0) {
            carouselObj[id].current--;
            let current =  carouselObj[id].current;
            $(`#${'${id}'} > div > div.carousel`).css('transform', `translateX(${'${current * - 74.7}'}vw)`);
        }
    }
    function fn_right(_el){
        let id = _el;
		let current =  carouselObj[id].current;
        if (carouselObj[id].current !== carouselObj[id].CAROUSEL_LENGTH) {
            $(`#${'${id}'} > div > div.carousel`).css('transform', `translateX(${'${(current +1) * - 74.7}'}vw)`);
            carouselObj[id].current++;
        }
    }

    const fn_init = async function(){
        SBUxMethod.set('srch-dtp-pckgYmdFrom',gfn_dateToYmd(new Date()));
        SBUxMethod.set('srch-dtp-pckgYmdTo',gfn_dateToYmd(new Date()));
        /** 거래처 **/
        await fn_search_cnpt();
        /** 생산자 **/
        await fn_search_prdcr();
        /** 품목 **/
        await fn_search_item();

        /** 포장실적 grid 생성 **/
        await fn_create_pckgPrfmnc();
        await fn_create_pckgPrfmncReg();

        await fn_setcomSearchItemVrty();
        // fn_addDragEvn("cnptInfoWrap");
        // fn_addDragEvn("prdcrInfoWrap");
        // fn_addDragEvn("vrtyInfoWrap");

        await fn_search();
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
                return "<button type='button'style='font-size:15px' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                }
            },
            {caption: ["거래처"],	ref: 'cnptNm',		type:'output',  width:'15%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["생산자"],	ref: 'rprsPrdcrNm',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["품목"],	ref: 'itemNm',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["품종"],	ref: 'vrtyNm',		type:'output',  width:'20%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["규격"],	ref: 'spcfctNm',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["본수"],	ref: 'bxGdsQntt',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["수량"],	ref: 'invntrQntt',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["합계"],	ref: 'sum',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
        ]
        gridPckgPrfmnc = _SBGrid.create(SBGridProperties);
    }

    const fn_create_pckgPrfmncReg = async function(){
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-pckgPrfmncReg';
        SBGridProperties.id = 'gridPckgPrfmncReg';
        SBGridProperties.jsonref = 'jsonPckgPrfmncReg';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.columns = [
            {caption: ["처리"], ref: 'pckgno', type:'button', width:'5%',style: 'text-align:center;padding:5px',fixedstyle: 'font-size:20px;font-weight:bold',
                renderer: function(objGrid, nRow, nCol, strValue, objRowData) {
                return "<button type='button'style='font-size:15px' class='btn btn-xs btn-outline-danger' onClick='fn_delRow(" + nRow + ")'>삭제</button>";
                }
            },
            {caption: ["거래처"],	ref: 'cnptNm',		type:'output',  width:'15%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["생산자"],	ref: 'rprsPrdcrNm',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["품목"],	ref: 'itemNm',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["품종"],	ref: 'vrtyNm',		type:'output',  width:'20%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["규격"],	ref: 'spcfctNm',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["본수"],	ref: 'bxGdsQntt',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["수량"],	ref: 'invntrQntt',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'},
            {caption: ["합계"],	ref: 'sum',		type:'output',  width:'10%', style: 'text-align:center; font-size:15px', fixedstyle: 'font-size:20px;font-weight:bold'}
        ]
        gridPckgPrfmncReg = _SBGrid.create(SBGridProperties);
    }

    const fn_search_cnpt = async function(){
        /** 거래처 **/
        const postJsonPromise = gfn_postJSON(URL_CNPT_INFO, {apcCd: gv_apcCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;
        let useYn = data.resultList.filter((item) => item.useYn ==='Y');
        data.resultList = useYn;
        await fn_append_button(data,"cnptInfoWrap","cnptNm","cnptCd");
        carouselObj.cnptInfoWrap.CAROUSEL_LENGTH = document.querySelectorAll("#cnptInfoWrap > div.carousel_container > div.carousel > div.cell").length - 1;
    }
    const fn_search_prdcr = async function(){
        const postJsonPromise = gfn_postJSON(URL_PRDCR_INFO, {apcCd: gv_apcCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;
        let useYn = data.resultList.filter((item) => item.useYn ==='Y');
        data.resultList = useYn;
        await fn_append_button(data,"prdcrInfoWrap","prdcrNm","prdcrCd");
        carouselObj.prdcrInfoWrap.CAROUSEL_LENGTH = document.querySelectorAll("#prdcrInfoWrap > div.carousel_container > div.carousel > div.cell").length - 1;
    }
    const fn_search_item = async function(){
        const postJsonPromise = gfn_postJSON(URL_APC_ITEMS, {apcCd: gv_apcCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;
        let useYn = data.resultList.filter((item) => item.useYn ==='Y');
        data.resultList = useYn;
        await fn_append_button(data,"itemInfoWrap","itemNm","itemCd");
        carouselObj.itemInfoWrap.CAROUSEL_LENGTH = document.querySelectorAll("#itemInfoWrap > div.carousel_container > div.carousel > div.cell").length - 1;
    }
    const fn_search_vrty = async function(_itemCd,_prdcrCd){
        const postJsonPromise = gfn_postJSON("/am/cmns/selectPrdcrTypeDtlVrty.do", {apcCd: gv_apcCd,prdcrCd : _prdcrCd ,crtrCd: _itemCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;

        jsonVrtyList = data.resultList.map(item => {
            const cleaned = {};
            Object.entries(item).forEach(([key, value]) => {
                if (value != null) {
                    cleaned[key] = value;
                }
            });
            if (!cleaned.name && cleaned.vrtyNm) {
                cleaned.name = cleaned.vrtyNm;
                cleaned.value = cleaned.vrtyCd;
                cleaned.label = cleaned.vrtyNm;
            }
            if (cleaned.name) {
                cleaned.diassembled = Hangul.disassemble(cleaned.name, true)
                    .filter(char => Array.isArray(char))
                    .map(([cho]) => cho)
                    .join('');
            }
            return cleaned;
        });
        /** 일단 최상위 8개 노출 **/
        jsonVrtyListTemp = data.resultList.slice(0, 8);
        data.resultList = jsonVrtyListTemp;
        SBUxMethod.set("srch-inp-vrtyInfo","");
        await fn_append_button(data,"vrtyBtnArea","vrtyNm","vrtyCd",true);
    }
    const fn_search_spcfct = async function(_itemCd){
        const postJsonPromise = gfn_postJSON(URL_APC_SPCFCTS, {apcCd: gv_apcCd, itemCd: _itemCd, delYn: "N"}, null, true);
        const data = await postJsonPromise;
        // await fn_append_button(data,"spcfctInfoWrap","spcfctNm","spcfctCd",true);

        for (let i = 0; i < data.resultList.length; i++) {
            $(`#spcfctInfoWrap > .carousel_container> .carousel > :last-child`).append(`
                    <div class="tabBox_sm3" onclick="fn_select_button(this)" data-${'${"spcfctCd"}'}="${'${data.resultList[i]["spcfctCd"]}'}">
                        ${'${data.resultList[i]["spcfctNm"]}'}
                    </div>
            `);
        }
    }

    const fn_append_button = async function(data, id, label, value, flag = false){
        //if(gfn_isEmpty(data)) return;

        let targetId = "#" + id;

        /** 다음페이지 필요하지않을 경우 **/
        if(data.resultList.length < 18){
            $(`${'${targetId}'} > button`).css('display','none');
        }else{
            $(`${'${targetId}'} > button`).css('display','block');
        }

        if(!flag){
            if(data.resultList.length % 18 !== 0 && data.resultList.length > 9){
                let cnt = (Math.floor(data.resultList.length / 18) + 1) * 18;
                let originLength = data.resultList.length;
                data.resultList.length = cnt;
                data.resultList.fill({cnptNm:'null'},originLength);
            }
            if(data.resultList.length < 9){
                let cnt = (Math.floor(data.resultList.length / 9) + 1) * 9;
                let originLength = data.resultList.length;
                data.resultList.length = cnt;
                data.resultList.fill({cnptNm:'null'},originLength);
            }
        }else{
            /** 가변적 button clear **/
            $(`${'${targetId}'} > div > div`).empty();

            if(data.resultList.length == 0){
                /** 규격이 없을떄 **/
                data.resultList.push({
                    [label] : '없음',
                    [value] : 'empty'
                });
            }
            if(data.resultList.length == 1){
                /** option이 한개 뿐일떄 **/
                if(id !== "vrtyBtnArea"){
                    data.resultList[0].active = 'active';
                }
            }

            if(id === "vrtyBtnArea"){
            	if(data.resultList.length % 18 !== 0 && data.resultList.length > 36 ){
                    let cnt = (Math.floor(data.resultList.length / 36) + 1) * 36;
                    let originLength = data.resultList.length;
                    data.resultList.length = cnt;
                    data.resultList.fill({cnptNm:'null'},originLength);
                }
            }else{
            	if(data.resultList.length % 18 !== 0 && data.resultList.length > 18 ){
                    let cnt = (Math.floor(data.resultList.length / 18) + 1) * 18;
                    let originLength = data.resultList.length;
                    data.resultList.length = cnt;
                    data.resultList.fill({cnptNm:'null'},originLength);
                }
            }

            if(data.resultList.length < 9){
                let originLength = data.resultList.length;
                data.resultList.length = 9;
                data.resultList.fill({cnptNm:'null'},originLength);
            }
        }

        for(let i = 0; i < data.resultList.length; i++){
        	if(id === "vrtyBtnArea"){
        		if(i != 0 && i % 36 != 0){
                    let flag = data.resultList[i].cnptNm == 'null';
                    let style = flag ? 'visibility:hidden;' : '';

                    $(`${'${targetId}'} > .carousel_container > .carousel > :last-child`).append(`
                    <div class="tabBox" style="${'${style}'}" onclick="fn_select_button(this)" data-${'${value}'}="${'${data.resultList[i][value]}'}">
                        ${'${data.resultList[i][label]}'}
                    </div>
                    `);
                }else{
                    let active = data.resultList[i].active || '';
                        $(`${'${targetId}'} > .carousel_container > .carousel`).append(`
                        <div class="cell">
                            <div class="tabBox  ${'${active}'}" onclick="fn_select_button(this)" data-${'${value}'}="${'${data.resultList[i][value]'}}">
                                ${'${data.resultList[i][label]}'}
                            </div>
                        </div>
                        `)
                    }
        	}else{
        		if(i != 0 && i % 18 != 0){
                    let flag = data.resultList[i].cnptNm == 'null';
                    let style = flag ? 'visibility:hidden;' : '';

                    $(`${'${targetId}'} > .carousel_container > .carousel > :last-child`).append(`
                    <div class="tabBox" style="${'${style}'}" onclick="fn_select_button(this)" data-${'${value}'}="${'${data.resultList[i][value]}'}">
                        ${'${data.resultList[i][label]}'}
                    </div>
                    `);
                }else{
                    let active = data.resultList[i].active || '';
                        $(`${'${targetId}'} > .carousel_container > .carousel`).append(`
                        <div class="cell">
                            <div class="tabBox  ${'${active}'}" onclick="fn_select_button(this)" data-${'${value}'}="${'${data.resultList[i][value]'}}">
                                ${'${data.resultList[i][label]}'}
                            </div>
                        </div>
                        `)
               }
            }
        }

    }

    const fn_append_button_new = async function(data, id, label, value, flag = false){

    }

    const fn_select_qntt_button = async function(_el){
        const qntt = _el.getAttribute('data-cnt');
        let prev = SBUxMethod.get("spinner_normal_0")||'';

        prev = (prev == 0) ? '' : prev;
        let result = prev + qntt;

        SBUxMethod.set("spinner_normal_0", result);
    }

    const fn_select_button = async function(_el){
        if($(_el).hasClass("active"))return;

        $(_el).closest('div.carousel').find("div.active").removeClass("active");
        $(_el).addClass("active");
        let dataObj = $(_el).data();
        /** 그대로 유지 확대 화면에 사용될 네임 **/
        let clickedText = $(_el).text();
        const stepIndex = $('#smartwizard .nav .nav-link.active').parent().index();
        const navSmall = $('#smartwizard .nav .nav-link').eq(stepIndex).find('small');

        if(_.isEqual(stepIndex, 4)){
            clickedText = $(".tabBox_sm3.active").text() + ", " + $(".tabBox_sm.active").text();
        }

        navSmall.text(clickedText);
        $('#smartwizard').smartWizard("next");

        /** 만약 정보 더 필요해서 data 추가되면 돌려서 집어야함 **/
        for(let key in dataObj){
            if(key == 'itemcd' || key == 'prdcrcd'){
            		//품목 변경시 0페이지로 이동
            		carouselObj.vrtyInfoWrap.current = 0;
                	$(`#vrtyInfoWrap > div > div.carousel`).css('transform', `translateX(0vw)`);
                	if(key == 'itemcd'){
                		await fn_search_spcfct(dataObj[key]);
                	}

                	let nowPrdcrNm = "";
                	let nowPrdcrCd = "";
                	let prdcrInfo = document.querySelector("#prdcrInfoWrap > div > div > div > div.tabBox.active");

                	if (prdcrInfo !== null){
                		nowPrdcrNm = document.querySelector("#prdcrInfoWrap > div > div > div > div.tabBox.active").outerText;
                		nowPrdcrCd = document.querySelector("#prdcrInfoWrap > div > div > div > div.tabBox.active").dataset['prdcrcd'];
                	}else{
                		continue
                	}

                	if(key == 'prdcrcd'){
                		let active = document.querySelector("#itemInfoWrap > div > div > div > div.tabBox.active");
                        let itemCd = "";

                        if(active !== null) {
                            itemCd = active.dataset.itemcd;
                        }
                		await fn_search_vrty(itemCd,nowPrdcrCd);
                	}else if(key == 'itemcd'){
                		await fn_search_vrty(dataObj[key],nowPrdcrCd);
                	}


                /** 품목별 품종, 규격 셋팅시 active가 없으면 재고탭 refresh **/
                /** 품종 **/
                if(!$(`#vrtyInfoWrap > .carousel_container > .carousel > .cell > .tabBox`).hasClass('active')){
                    $("#vrtycd").html('');
                    if(pckgObj.hasOwnProperty("vrtyCd")|| pckgObj.hasOwnProperty("vrtyNm")){
                        delete pckgObj.vrtyCd;
                        delete pckgObj.vrtyNm;
                    }
                }

                // 규격, 본수 통합으로 미사용 처리
                // /** 규격 **/
                // if(!$(`#spcfctInfoWrap > .carousel_container > .carousel > .cell > .tabBox`).hasClass('active')){
                //     $("#spcfctcd").html('');
                //     if(pckgObj.hasOwnProperty("spcfctCd")|| pckgObj.hasOwnProperty("spcfctNm")){
                //         delete pckgObj.spcfctCd;
                //         delete pckgObj.spcfctNm;
                //     }
                // }
            }
            //if(key == 'prdcrcd'){
            	//nowPrdcrNm = _el.outerText;
            	//생산자코드 변경시 품목 active 제거
            	//document.querySelector("#itemInfoWrap > div > div > div > div.tabBox.active")?.classList.remove("active");
            //}

            /** saveparam format **/
            let prefix = key.replace('cd','');
            pckgObj[prefix + 'Cd'] = String(dataObj[key]);
            pckgObj[prefix + 'Nm'] = String($(_el).text().trim());
        }
    }
    const fn_cntAdd = function(_el){

        let value = parseInt($(_el).text());
        let originCnt = document.getElementById("spinner_normal_0").value || 0;
        $("#spinner_normal_0").val(parseInt(originCnt) + value);
        //$("#pckgQntt").val(originCnt + value);
    }
    const fn_RegReset = function(){
        // $("#spinner_normal_0").val(0);
        SBUxMethod.set("spinner_normal_0", "0");
    }
    const fn_RegDel = function(){
        let prev = SBUxMethod.get("spinner_normal_0");
        let result = prev.slice(0,-1);

        if(result.length == 0){
            SBUxMethod.set("spinner_normal_0", "0");
        }else{
            SBUxMethod.set("spinner_normal_0", result);
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

            threshold = element.offsetWidth * 0.4;  // 40% 넓이 임계값 설정
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
    const fn_save = async function(){
        pckgObj.apcCd = gv_apcCd;
        pckgObj.pckgYmd = SBUxMethod.get('srch-dtp-pckgYmdFrom');
        pckgObj.invntrQntt = parseInt($("#spinner_normal_0").val());
        pckgObj.bxGdsQntt = parseInt($("div.tabBox_sm.active").text());

        pckgObj.rprsPrdcrCd = pckgObj.prdcrCd;
        //delete pckgObj.prdcrCd;

        let invntrObj = {...pckgObj};
        let pckgPrfmncObj = {
            apcCd : gv_apcCd,
            pckgSn : 0,
            pckgQntt : pckgObj.invntrQntt,
            pckgYmd : pckgObj.pckgYmd
        }
        let param = {
            pckgPrfmncVO : pckgPrfmncObj,
            gdsInvntrVO : invntrObj,
        }

        if(SBUxMethod.getSwitchStatus('switch_single') === 'on'){
            await Swal.fire({
                title: `포장실적 등록하시겠습니까?`,
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '저장',
                cancelButtonText: '취소',
            }).then(async result => {
                if(result.isConfirmed){
                    const postJsonPromise = gfn_postJSON("/am/pckg/prfmnc/insertPckgPrfmncSc.do", param);
                    const data = await postJsonPromise;
                    try{
                        if(data.resultStatus === 'S'){
                            if(SBUxMethod.getSwitchStatus('switch_single') === 'on'){
                                Swal.fire(
                                    '처리되었습니다.',
                                    '',
                                    'success'
                                );
                            }
                        }
                    }catch (e) {
                        console.error(e);
                    }
                    await fn_search();
                }
            })
        }else{
            const postJsonPromise = gfn_postJSON("/am/pckg/prfmnc/insertPckgPrfmncSc.do", param);
            const data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert(data.resultCode, data.resultMessage);
                    return;
            }
            await fn_search();
        }

        fn_RegReset();

    }

    const fn_search = async function(){
        let checked = SBUxMethod.getCheckbox('chkbox_norm', {trueValueOnly:true, ignoreDisabledValue:false});
        const isEmpty = (obj) => Object.keys(obj).length === 0;
        let saveFlag = SBUxMethod.get("tab_norm") === "tab_pckgPrfmncReg"? false : true;

        let postJsonPromise;

        if(isEmpty(checked)){
            /** 조회화면상 그리드 **/
            let pckgYmdFrom = SBUxMethod.get("srch-dtp-pckgYmdFrom");
            let pckgYmdTo = SBUxMethod.get("srch-dtp-pckgYmdTo");
            postJsonPromise = gfn_postJSON("/am/pckg/selectPckgPrfmnc.do",{apcCd: gv_apcCd,pckgYmdFrom:pckgYmdFrom,pckgYmdTo:pckgYmdTo});
        }else{
            /** 등록화면상 그리드 **/
            let pckgYmd = SBUxMethod.get("srch-dtp-pckgYmdFrom");
            postJsonPromise = gfn_postJSON("/am/pckg/selectPckgPrfmnc.do",{apcCd: gv_apcCd,pckgYmd:pckgYmd});
        }

        const data = await postJsonPromise;
        try {
            if(data.resultStatus === 'S'){
                let result = data.resultList.map(item => {
                    let data = item.invntrQntt * parseInt(item.bxGdsQntt);
                    item['sum'] = data;
                    return item;
                }).sort((a, b) => b.pckgno.localeCompare(a.pckgno));
                if(saveFlag){
                    jsonPckgPrfmnc = result;
                    gridPckgPrfmnc.rebuild();
                }else{
                    jsonPckgPrfmncReg = result;
                    gridPckgPrfmncReg.rebuild();
                }
            }
        }catch (e) {
            console.error(e);
        }
    }

    const fn_delRow = async function(_nRow) {

        let delObj = {};
        let saveFlag = SBUxMethod.get("tab_norm") === "tab_pckgPrfmncReg"? false : true;

        if (saveFlag) {
            delObj = gridPckgPrfmnc.getRowData(_nRow);
        } else {
            delObj = gridPckgPrfmncReg.getRowData(_nRow);
        }

        if (SBUxMethod.getSwitchStatus('switch_single') === 'on') {
            await Swal.fire({
                title: '삭제 하시겠습니까?',
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '삭제',
                cancelButtonText: '취소',
                width: '500px'
            }).then(async result => {
                if (result.isConfirmed) {
                    const postJsonPromise = gfn_postJSON("/am/pckg/prfmnc/deletePckgPrfmncSc.do", delObj);
                    const data = await postJsonPromise;
                    try {
                        if (data.resultStatus === 'S') {
                            if (SBUxMethod.getSwitchStatus('switch_single') === 'on') {
                                Swal.fire(
                                    '처리되었습니다.',
                                    '',
                                    'success'
                                );
                            }
                        }
                    } catch (e) {
                        console.error(e);
                    }
                    await fn_search();
                }
            })
        } else {
            const postJsonPromise = gfn_postJSON("/am/pckg/prfmnc/deletePckgPrfmncSc.do", delObj);
            const data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
            await fn_search();
        }
    }

    const fn_reset = function(){
        $(".tabBox.active").removeClass('active');
        $(".tabBox_sm.active").removeClass('active');
        fn_RegReset();
    }

    const fn_exportExcel = function(){
        if(jsonPckgPrfmnc.length == 0){
            gfn_comAlert("W0005","다운로드 목록");
            return;
        }else{
            gridPckgPrfmnc.deleteColumn(0);
            gridPckgPrfmnc.insertColumn(0, {type:'output', caption:['포장일자'] ,ref:'pckgYmd', width:'150px', style: 'text-align:center;padding:5px',fixedstyle: 'font-size:20px;font-weight:bold'});
            let checked = SBUxMethod.getCheckbox('chkbox_norm', {trueValueOnly:true, ignoreDisabledValue:false});
            const isEmpty = (obj) => Object.keys(obj).length === 0;

            let title ="";
            if(isEmpty(checked)){
                let to = SBUxMethod.get("srch-dtp-pckgYmdTo");
                let from = SBUxMethod.get("srch-dtp-pckgYmdFrom");
                title = from + " ~ " + to + "_포장실적";
            }else{
                let from = SBUxMethod.get("srch-dtp-pckgYmdFrom");
                title = from + "_포장실적";
            }
            gridPckgPrfmnc.exportLocalExcel(title);

            if(SBUxMethod.getSwitchStatus('switch_single') === 'on'){
                gfn_comAlert("I0001");
                jsonPckgPrfmnc.length = 0;
                gridPckgPrfmnc.rebuild();
                fn_search();
            }
        }
    }

    const fn_oneDay = function(){
        let checked = SBUxMethod.getCheckbox('chkbox_norm', {trueValueOnly:true, ignoreDisabledValue:false});
        const isEmpty = (obj) => Object.keys(obj).length === 0;

        if(isEmpty(checked)){
            SBUxMethod.show('srch-dtp-pckgYmdTo');
        }else{
            SBUxMethod.hide('srch-dtp-pckgYmdTo');
        }
    }
    const fn_changeTab = function(){
        let searchTab = SBUxMethod.get('tab_norm');
        if(searchTab === 'tab_pckgPrfmncReg'){
            SBUxMethod.hide('srch-dtp-pckgYmdTo');
            SBUxMethod.attr('chkbox_norm','checked',true);
            SBUxMethod.attr('chkbox_norm','readonly',true);
        }else{
            SBUxMethod.attr('chkbox_norm','readonly',false);
        }
    }


    const fn_setcomSearchItemVrty = async function() {



		let postJsonPromise = gfn_postJSON("/am/cmns/selectPrdcrTypeDtlList.do", {
			apcCd : gv_apcCd
			}, null, true);

        let data = await postJsonPromise;
        try{
        	let totalRecordCount = 0;
        	jsonSearchItemVrty.lenght = 0;
        	data.resultList.forEach((item, index) => {
				let comCdDtlList = {
						prdcrNm : item.prdcrNm
						, prdcrCrtrType : item.prdcrCrtrType
						, itemCd : item.crtrCd.substring(0,4)
						, vrtyCd : item.crtrDtlCd
						, itemVrtyCd : item.crtrCd
						, indctSeq : item.indctSeq
						, delYn : item.delYn

				}
				jsonSearchItemVrty.push(comCdDtlList);
				if (index === 0) {
	  					totalRecordCount = item.totalRecordCount;
				}
        	});

        } catch (e) {
    		if (!(e instanceof Error)) {
    			e = new Error(e);
    		}
    		console.error("failed", e.message);
        	gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_onInputVrty = async function(_search){
        let result = gfn_filterFrstStartsWith(_search, jsonVrtyList);
        result = result.map(item => ({
            ...item,
            label: item.name,
            vrtyNm : item.name,
            vrtyCd : item.value
        }));
       await fn_append_button({resultList:result},"vrtyBtnArea","vrtyNm","vrtyCd",true);
    }
    const fn_delWord = async function(_type){
        if(_type == 'one'){
            let prev = SBUxMethod.get("srch-inp-vrtyInfo")||'';
            let result = prev.slice(0,-1);
            SBUxMethod.set("srch-inp-vrtyInfo",result);
            await fn_onInputVrty(result);
        }else{
            SBUxMethod.set("srch-inp-vrtyInfo","");
            await fn_append_button({resultList:jsonVrtyListTemp},"vrtyBtnArea","vrtyNm","vrtyCd",true);
        }
    }




</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>
