<%
    /**
     * @Class Name : regSpmtPrfmncMbl.jsp
     * @Description : 출하실적등록 모바일 화면
     * @author SI개발부
     * @since 2024.4.18
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.4.18   	손민성		최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 출하실적등록 모바일</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button{
            -webkit-appearance: none;
        }
        .btn-mbl {
            height: 50px;
            font-size: 24px;
        }
        .btn-mbl span{
            padding-top: 5px;
        }
        .ma-bt {
            margin-bottom: 5px;
        }
        .ma-rt {
            margin-right: 10px;
        }
        .btn-text{
            font-size: 2vw;
            min-font-size: x-large;
            font-weight: 500;
            padding-top: 5px;
        }
        .btn-style{
            background-color : white;
            border-radius: 5px;
            border: 2px solid cornflowerblue;
            height: auto;
            flex: 3 0 30%;
            padding: 5px 0px;
            cursor : initial;
        }
        .inp-style{
            border: 1px solid #bbc4d1;
            height: auto;
            font-size: 2vw;
            min-font-size: 20px;
            line-height: 1.5;
            padding: 6px 12px;
            flex: 5 0 40%;
            border-radius: 5px;
        }
        .inp-select-nf-style{
            border: 1px solid #bbc4d1;
            height: auto;
            font-size: 2vw;
            min-font-size: 20px;
            line-height: 1.5;
            padding: 6px 12px;
            border-radius: 5px;
            width: calc(40% - 10px);
        }
        .inp-select-style{
            border: 1px solid #bbc4d1;
            height: auto;
            font-size: 2vw;
            min-font-size: 20px;
            line-height: 1.5;
            padding: 6px 12px;
            border-radius: 5px;
            flex: 0 0 60%
        }
        .sp-style{
            flex: 3 0 30%;
            margin-left: 10px;
        }
        .row-style{
            display:flex;
            flex-direction:row;
            width: 70vw;
        }

        #dtl-dtp-spmtYmd svg, #dtl-dtp-spmtNo svg{
            position: absolute; /* 절대 위치 설정 */
            right: 8px; /* 버튼의 오른쪽 끝으로 이동 */
            top: 50%; /* 수직 가운데 정렬 */
            transform: translateY(-50%);
        }
        select{
            background: url(/static/resource/sbux/assets/css/default/images/sbicons-selectbox.png)  no-repeat 95% 50% #fff;
        }
        @keyframes slideDown {
            0% {
                opacity: 0;
                transform: translateY(-100%);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes slideUp {
            0% {
                opacity: 1;
                transform: translateY(0);
            }
            100% {
                opacity: 0;
                transform: translateY(-100%);
            }
        }

        /** 모달 관련 스타일 **/
        table th{
            font-size: initial;
            vertical-align: middle;
            text-align: initial;
            overflow-wrap: initial;
            border-color: initial;
            border-bottom: initial;
        }
        .invnt_modal{
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            overflow: hidden;
            background: rgba(0,0,0,0.5);
        }
        .modal_popup{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background: #FFFFFF;
            border-radius: 20px;
            width: 90vw;
            height: 70vh;
        }
        #invnt_table, #reg_table{
            width: 100%;
            /*height: 85%;*/
            font-size: .9em;
            box-shadow: 0 2px 5px rgba(0,0,0,.25);
            overflow: hidden;
            border-radius: 5px;
            table-layout: fixed;
        }
        #invnt_table thead, #reg_table thead{
            font-width: bold;
            color:#fff;
            background: #255c91;
        }
        #invnt_table th{
            text-align: center;
            font-size: 1vw;
            padding: 5px 0px;
        }
        #reg_table th{
            text-align: center;
            font-size: 1vw;
            padding: 5px 0px;
        }
        #invnt_table tbody tr td, #reg_table tbody tr td{
            /*width: 100px;*/
            /*height: 100px;*/
            /*text-align: center;*/
                -webkit-text-size-adjust: 100%;
                -webkit-tap-highlight-color: rgba(0,0,0,0);
                color: #333;
                font-weight: 400;
                font-family: Notokr, Apple SD Gothic Neo, Arial, Tahoma, sans-serif;
                border-spacing: 0;
                border-collapse: collapse;
                box-sizing: border-box;
                margin: 0;
                font-size: 3vh;
                text-align: center;
                word-wrap: break-word;
                border-color: #e8f1f9 !important;
                padding: 3px !important;
                line-height: 1.42857143;
                border: 1px solid #f4f4f4;
                vertical-align: middle;
                border-right: hidden;

        }
        section *, .box-header button span{
        font-family: 'LeferiPoint', sans-serif
        }
        #invnt_table tbody tr:hover td{
            background-color: #84afff;
            color: white;
        }
        #reg_table thead tr th{
            border: 3px solid white;
            border-radius: 10px;
        }
        #reg_table{
            table-layout: fixed;
        }
        #reg_table tbody input{
            width: 100%;
            margin-right: 5px;
            border: 1px solid #bbc4d1;
            font-family: 'Font Awesome 5 Free';
            text-align: center;
        }
        #invntrTable{
            border: 14px solid black;
        }

        #invntrTable thead tr th{
            font-size: 3vh;
            text-align: center;
            background-color: #255c91;
            color: white;
        }
        #invntrTable td{
            text-align: center;
            font-size: 1vw;
        }
        #invntrTable tbody tr:hover td{
            background-color: #84afff;
            color: white;
        }





    </style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start; padding-bottom: 0px" >
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 출하실적등록 모바일 -->
        </div>
        <div style="margin-left: auto;padding-top: 0px" class="box-header">
            <sbux-button id="btnDocSpmt" name="btnDocSpmt" uitype="normal"   text="송품장" class="btn btn-sm btn-primary btn-mbl" onclick="fn_docSpmt"></sbux-button>
            <sbux-button id="btnReset" name="btnReset" uitype="normal" text="초기화" class="btn btn-mbl btn-outline-danger" onclick="fn_reset"></sbux-button>
            <sbux-button id="btnSave" name="btnSave" uitype="normal" text="저장" class="btn btn-mbl btn-outline-danger" onclick="fn_save"></sbux-button>
            <sbux-button id="btnClose" name="btnClose" uitype="normal" text="종료" class="btn btn-mbl btn-outline-danger" onclick="fn_popup()"></sbux-button>
        </div>
        <div class="box-body">
            <div style="display: flex;flex-direction: column;">
                <div class="ma-bt row-style">
                    <button class="ma-rt btn-style" id="dtl-dtp-spmtYmd" onclick="fn_showOption(this)" style=" position: relative; cursor: pointer">
                        <div class="btn-text">출하일자</div>
                        <svg xmlns="http://www.w3.org/2000/svg" height="20" width="15" viewBox="0 0 448 512">
                        <path fill="#6495ed" d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/>
                        </svg>
                    </button>
                    <input id="dtl-inp-spmtYmd" class="inp-style" type="date" required/>
                    <div class="sp-style" ></div>
                </div>
                <div id="_dtl-dtp-spmtYmd" style="display: none;" class="row-style">
                    <div class="ma-bt row-style">
                        <button class="ma-rt btn-style"  id="dtl-inp-trsprtCst" onclick="fn_showOption(this)">
                            <div class="btn-text">운임비</div>
                        </button>
                        <input class="inp-style" />
                        <div class="sp-style" ></div>
                    </div>
                    <div class="ma-bt row-style">
                        <button class="ma-rt btn-style" id="dtl-inp-vhclno" onclick="fn_showOption(this)">
                            <div class="btn-text">차량번호</div>
                        </button>
                        <input class="inp-style" />
                        <div class="sp-style" ></div>
                    </div>
                </div>
                <div class="ma-bt row-style" style="position: relative">
                    <button class="ma-rt btn-style" style="height: auto">
                        <div class="btn-text">거래처</div>
                    </button>
                    <sbux-select
                            id="dtl-dtp-cnpt"
                            name="dtl-dtp-cnpt"
                            uitype="single"
                            class="input-sm-ast inpt-mbl inp-style"
                            jsondata-ref="jsonApcCnpt"
                            unselected-text="선택"
                            onchange="fn_onchangeCnpt()"
                            style="position: relative">
                    </sbux-select>
                    <div class="sp-style" style="display: flex;flex-direction: row">
                        <button class="btn-style ma-rt"><div id="dlngShapCd" class="btn-text">위탁</div> </button>
                        <button class="btn-style"><div id="dlngMthdCd" class="btn-text">경매</div></button>
                    </div>
                </div>
<%--                <div class="ma-bt row-style"  style="position: relative"> &lt;%&ndash;//&ndash;%&gt;--%>
<%--                    <button class="ma-rt btn-style" style="height: auto">--%>
<%--                        <div class="btn-text">품목/품종</div>--%>
<%--                    </button>--%>
<%--                    <div style="flex: 0 0 40%; display: flex">--%>
<%--                        <sbux-select--%>
<%--                                id="srch-slt-itemCd"--%>
<%--                                name="srch-slt-itemCd"--%>
<%--                                uitype="single"--%>
<%--                                wrap-style="height: 100%;flex: 1;font-size: 3vh;vertical-align: middle;margin-right:10px;font-weight:500"--%>
<%--                                jsondata-ref="jsonApcItem"--%>
<%--                                unselected-text="전체"--%>
<%--&lt;%&ndash;                                class="input-sm-ast inpt-mbl"&ndash;%&gt;--%>
<%--                                onchange="fn_onChangeSrchItemCd(this)"--%>
<%--                        ></sbux-select>--%>
<%--                        <sbux-select--%>
<%--                                id="srch-slt-vrtyCd"--%>
<%--                                name="srch-slt-vrtyCd"--%>
<%--                                uitype="single"--%>
<%--                                wrap-style="height: 100%;flex: 1;font-size: 3vh;vertical-align: middle;font-weight:500"--%>
<%--                                jsondata-ref="jsonApcVrty"--%>
<%--                                unselected-text="선택"--%>
<%--&lt;%&ndash;                                class="input-sm-ast inpt-mbl"&ndash;%&gt;--%>
<%--                                onchange="fn_onChangeSrchVrtyCd(this)"--%>
<%--                        ></sbux-select>--%>
<%--                    </div>--%>
<%--                    <div class="sp-style"></div>--%>
<%--                </div>--%>
<%--                <div class="ma-bt row-style" style="position: relative">--%>
<%--                    <button id="dtl-dtp-spmtNo" class="ma-rt btn-style" style="height: auto; position: relative;cursor: pointer" onclick="fn_popup()">--%>
<%--                        <div class="btn-text">출하번호</div>--%>
<%--                        <svg xmlns="http://www.w3.org/2000/svg" height="20" width="15" viewBox="0 0 448 512">--%>
<%--                            <path fill="#6495ed" d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/>--%>
<%--                        </svg>--%>
<%--                    </button>--%>
<%--                    <div style="flex: 0 0 40%; display: flex; flex-direction: row">--%>
<%--                        <sbux-input--%>
<%--                                uitype="text"--%>
<%--                                id="srch-slt-sortGrdCd"--%>
<%--                                name="srch-slt-sortGrdCd"--%>
<%--                                class="inp-select-style"--%>
<%--                                style="position: relative;font-weight: initial"--%>
<%--                                wrap-style="flex:1;margin-right:10px"--%>
<%--                                readonly--%>
<%--                        >--%>
<%--                        </sbux-input>--%>
<%--                        <sbux-input--%>
<%--                                uitype="text"--%>
<%--                                id="srch-slt-prdcrNm"--%>
<%--                                name="srch-slt-prdcrNm"--%>
<%--                                class="inp-select-nf-style"--%>
<%--                                style="position: relative;font-weight: initial"--%>
<%--                                wrap-style="flex:1;"--%>
<%--                                readonly--%>
<%--                        >--%>
<%--                        </sbux-input>--%>
<%--                    </div>--%>
<%--                    <div class="sp-style" style="display: flex;">--%>
<%--                        <button class="btn-style ma-rt"><div class="btn-text">5Kg</div> </button>--%>
<%--                        <button style="cursor:initial;flex: 3 0 30%; border: none; background: none"></button>--%>
<%--                    </div>--%>
<%--                    <div class="sp-style" ></div>--%>
<%--                </div>--%>
<%--                <div class="ma-bt row-style" style="position: relative">--%>
<%--                    <button id="dtl-dtp-grdQntt" class="ma-rt btn-style" style="flex:0 0 30%;height: auto; position: relative">--%>
<%--                        <div class="btn-text">등급/수량</div>--%>
<%--                    </button>--%>
<%--                    <div style="flex: 0 0 40%; display: flex; flex-direction: row">--%>
<%--                        <sbux-input--%>
<%--                                uitype="text"--%>
<%--                                id="srch-slt-gdsGrdNm"--%>
<%--                                name="srch-slt-gdsGrdNm"--%>
<%--                                class="inp-select-style"--%>
<%--                                style="position: relative;font-weight: initial"--%>
<%--                                wrap-style="flex:1;margin-right:10px"--%>
<%--                                readonly--%>
<%--                        >--%>
<%--                        </sbux-input>--%>
<%--                        <sbux-input--%>
<%--                            uitype="hidden"--%>
<%--                            id="srch-slt-gdsGrd"--%>
<%--                            name="srch-slt-gdsGrd"--%>
<%--                        ></sbux-input>--%>
<%--                        <span style="flex:1">--%>
<%--                            <input id="srch-slt-invntrQntt" class="inp-select-nf-style"--%>
<%--                                   style="font-weight: initial;width: 100%" type="number"--%>
<%--                            onchange="fn_valiQntt(this.value)">--%>
<%--                            </input>--%>
<%--                        </span>--%>
<%--                    </div>--%>
<%--                    <div class="sp-style" style="display: flex;">--%>
<%--                        <sbux-button--%>
<%--                        id="srch-slt-regBtn"--%>
<%--                        name="srch-slt-regBtn"--%>
<%--                        uitype="normal"--%>
<%--                        class="btn-style"--%>
<%--                        style="flex: 0 0 49%;margin-right: 10px"--%>
<%--                        wrap-style="font-size:2vw;font-weight:500;padding-top:5px;flex: 0 0 49%;margin-right: 10px;"--%>
<%--                        text="등록" uitype="normal"--%>
<%--                        onclick="fn_regSpmtSave"--%>
<%--                        >--%>
<%--                        </sbux-button>--%>
<%--                        <div>--%>
<%--                            <span style="font-size: 3vh;margin-top: 10px;font-width: bold;">--%>
<%--                                재고 :--%>
<%--                            </span>--%>
<%--                            <span id="invntrQntt" style="font-size: 3vh;margin-top: 10px;font-width: bold">--%>
<%--                            </span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
            <hr>
            <div style="overflow: hidden">
                <table id="reg_table">
                    <colgroup>
                        <col style="width: 20%">
                        <col style="width: 10%">
                        <col style="width: 10%">
                        <col style="width: 10%">
                        <col style="width: 7%">
                        <col style="width: 7%">
                        <col style="width: 7%">
                        <col style="width: 7%">
                        <col style="width: 7%">
                        <col style="width: 15%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th rowspan="2" style="font-size: 2vw;">출하번호</th>
                        <th rowspan="2" style="font-size: 2vw;">품목</th>
                        <th rowspan="2" style="font-size: 2vw;">품종</th>
                        <th rowspan="2" style="font-size: 2vw;">단량</th>
                        <th colspan="5">등급 및 수량</th>
                        <th rowspan="2" style="font-size: 2vw;">비고</th>
                    </tr>
                    <tr>
                        <th>특</th>
                        <th>상</th>
                        <th>보통</th>
                        <th></th>
                        <th>계</th>
                    </tr>

                    </thead>
                    <tbody style="overflow-y: scroll">
                    <tr>
                        <td>
                            <div style="display: flex">
                                <div style="flex: 2; font-family: 'Font Awesome 5 Free';margin-right: 10px;position: relative">
                                    <input type="number" onChange="fn_onChangesortGds(this)"/>
                                    <span onclick="fn_searchInvntrQntt(this)" style="position: absolute;top: 6px;left: 210px" class='glyphicon sbux-inp-icon glyphicon-search'></span>
                                </div>
                                <div style="flex: 1; font-family: 'Font Awesome 5 Free';">
                                    <input type="number" onchange="fn_onChangePrdcr(this)" />
                                </div>
                            </div>
                        </td>
                        <td>
                            <div style="font-family: 'Font Awesome 5 Free';">
                                <input type="text" />
                            </div>
                        </td>
                        <td>
                            <div style="font-family: 'Font Awesome 5 Free';">
                                <input type="text" />
                            </div>
                        </td>
                        <td>
                            <div style="font-family: 'Font Awesome 5 Free';">
                                <input type="text" />
                            </div>
                        </td>
                        <td>
                            <input type="number" class="qnttInp" onchange="fn_onchangeQntt(this)"/>
                        </td>
                        <td>
                            <input type="number" class="qnttInp" onchange="fn_onchangeQntt(this)"/>
                        </td>
                        <td>
                            <input type="number" class="qnttInp" onchange="fn_onchangeQntt(this)"/>
                        </td>
                        <td>
                            <input readonly />
                        </td>
                        <td>
                            <input readonly/>
                        </td>
                        <td>
                            <input/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<!-- 생산자 Modal -->
<div>
    <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" footer-is-close-button="false" header-is-close-button="false" style="width:1100px"></sbux-modal>
</div>
<div id="body-modal-prdcr">
    <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
</div>

<div class="invnt_modal">
    <div class="modal_popup">
        <div style="display: flex">
        <h3 class="box-title" style="padding-right: 15px;font-size: 2vw;color: #1c54a2; font-family: 'LeferiPoint', sans-serif;font-weight: 600;">▶ 재고 조회</h3>
        <div style="margin-left: auto;display: flex" class="box-header">
            <sbux-button id="btnModalReset" name="btnModalReset" uitype="normal" text="초기화" class="btn btn-sm btn-primary btn-mbl" onclick="fn_reset"></sbux-button>
            <sbux-button id="btnModalInvtrSelect" name="btnModalInvtrSelect" uitype="normal" text="조회" class="btn btn-mbl btn-outline-danger" onclick="fn_search" wrap-style="margin:0px 10px"></sbux-button>
            <sbux-button id="btnModalClose" name="btnModalClose" uitype="normal" text="종료" class="btn btn-mbl btn-outline-danger" onclick="fn_popup"></sbux-button>
        </div>
        </div>

        <div style="width: 100%;height: 10%; display: flex;">
            <div style="flex: 3; display: flex; align-items: center">
                <div style="border: none;font-size: 3vh;font-weight: bold;flex: 0 0 30%;text-align: center;background: #255c91;color: white; padding: 5px 1px;margin: 0px 5px">품목/품종</div>
                <div style="flex: 1; display: flex; flex-direction: row">
                    <div style="display: flex;width: 100%">
                    <sbux-select
                            id="srch-mod-itemCd"
                            name="srch-mod-itemCd"
                            uitype="single"
                            style="position: relative;font-size: 3vh;line-height: initial;flex:1;margin-right: 10px"
                            jsondata-ref="jsonApcItem"
                            unselected-text="전체"
                            class="inp-select-style"
                            onchange="fn_onChangeSrchItemCd(this)"
                    ></sbux-select>
                    <sbux-select
                            id="srch-mod-vrtyCd"
                            name="srch-mod-vrtyCd"
                            uitype="single"
                            style="position: relative;font-size: 3vh;line-height: initial;flex:1"
                            jsondata-ref="jsonApcVrty"
                            jsondata-value="itemVrtyCd"
                            unselected-text="선택"
                            class="inp-select-style"
                            onchange="fn_onChangeSrchVrtyCd(this)"
                    ></sbux-select>
                    </div>
                </div>
            </div>
            <div style="flex: 2;display: flex; align-items: center">
                    <div style="border: none;font-size: 3vh;font-weight: bold;flex: 0 0 30%;text-align: center;background: #255c91;color: white; padding: 5px 1px;margin: 0px 5px">생산자</div>
                    <div style="flex:1;display: flex">
                        <sbux-input
                                uitype="text"
                                id="srch-mod-prdcrNm"
                                name="srch-mod-prdcrNm"
                                class="input-sm-ast inpt-mbl"
                                style="height: 100%;font-size:3vh"
                                wrap-style="flex:1;margin-right:5px"
                                placeholder="초성검색 가능"
                                autocomplete-ref="jsonPrdcrAutocomplete"
                                autocomplete-text="name"
                                oninput="fn_onInputPrdcrNm(event)"
                                autocomplete-select-callback="fn_onSelectPrdcrNm"
                        ></sbux-input>
                        <sbux-button
                        id="btn-srch-prdcr"
                        name="btn-srch-prdcr"
                        class="btn btn-xs btn-outline-dark btn-mbl"
                        style="font-size: small;padding: 0px 10px; height: 5vh; margin: 3px;"
                        text="찾기" uitype="modal"
                        target-id="modal-prdcr"
                        onclick="fn_choicePrdcr"
                        ></sbux-button>
                    </div>
                <sbux-input uitype="hidden" id="srch-mod-prdcrCd" name="srch-mod-prdcrCd" style="display: none" ></sbux-input>

            </div>
            <div style="flex: 2;display: flex; align-items: center">
                <div style="border: none;font-size: 3vh;font-weight: bold;flex: 1 0 30%;text-align: center;background: #255c91;color: white; padding: 5px 1px;margin: 0px 5px">선별등급</div>
                <sbux-select
                        id="srch-mod-gdsSeCd"
                        name="srch-mod-gdsSeCd"
                        uitype="single"
                        jsondata-ref="jsonGdsSeCd"
                        class="inp-select-style"
                        style="position: relative;font-size: 3vh;line-height: initial"
                        unselected-text="선택">
                </sbux-select>
            </div>
        </div>
        <div style="width: 100%;height: 10%; display: flex;">
            <div style="flex: 3; display: flex; align-items: center">
                <div style="margin-left: 5px ; border: none;font-size: 3vh;font-weight: bold;flex: 0 0 30%;text-align: center;background: #255c91;color: white; padding: 5px 1px;margin-right: 5px">선별일자</div>
                <div style="display: flex; width: 100%">
                    <input id="srch-mod-pckgYmdFrom" type="date" style="border-radius: 5px;border: 1px solid cornflowerblue;flex: 1;text-align: left;font-size: 3vh;font-weight: bold;padding: 5px 1px;padding-left:10px; margin-right: 10px"></input>
                    <input id="srch-mod-pckgYmdTo" type="date" style="border-radius: 5px;border: 1px solid cornflowerblue;flex: 1;text-align: left;font-size: 3vh;font-weight: bold;padding: 5px 1px;padding-left: 10px; "></input>
                </div>
            </div>
            <div style="flex: 2;display: flex; align-items: center">
                <div style="border: none;font-size: 3vh;font-weight: bold;flex: 0 0 30%;text-align: center;background: #255c91;color: white; padding: 5px 1px;margin: 0px 5px">규격</div>
                <sbux-select
                        id="srch-mod-spcfct"
                        name="srch-mod-spcfct"
                        uitype="single"
                        jsondata-ref="jsonSpcfct"
                        class="inp-select-style"
                        style="position: relative;font-size: 3vh;line-height: initial;flex: 1"
                        unselected-text="선택">
                </sbux-select>
            </div>
            <div style="flex: 2;display: flex; align-items: center">
                <div style="border: none;font-size: 3vh;font-weight: bold;flex: 1 0 38%;text-align: center;background: #255c91;color: white; padding: 5px 1px;margin: 0px 5px">상품등급</div>
                <sbux-select
                        id="srch-mod-gdsGrd"
                        name="srch-mod-gdsGrd"
                        uitype="single"
                        jsondata-ref="jsonGdsGrd"
                        class="inp-select-style"
                        style="position: relative;font-size: 3vh;line-height: initial"
                        unselected-text="선택">
                </sbux-select>
            </div>
        </div>
        <hr/>
        <table id="invnt_table">
            <colgroup>
                <col style="width: 12%">
                <col style="width: 12%">
                <col style="width: 12%">
                <col style="width: 11%">
                <col style="width: 5%">
                <col style="width: 24%">
                <col style="width: 8%">
                <col style="width: 8%">
                <col style="width: 8%">
            </colgroup>
            <thead>
                <tr>
                    <th rowspan="2">품목</th>
                    <th rowspan="2">품종</th>
                    <th rowspan="2">선별등급</th>
                    <th rowspan="2">생산자</th>
                    <th rowspan="2">번호</th>
                    <th colspan="5">상품재고</th>
                </tr>
                <tr>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>중량</th>
                    <th>등급</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>
<sbux-modal id="searchQntt" name="searchQntt" uitype="large" header-title="상품재고조회"
            dlg-class="sbuxClass">
</sbux-modal>
</body>
<script type="text/javascript">
    /** 품목 json **/
    jsonApcItem = [];
    /** 품종 json **/
    jsonApcVrty = [];
    /** 거래처 json **/
    jsonApcCnpt = [];

    /** 생산자 자동완성 **/
    let jsonPrdcr = [];
    let jsonPrdcrAutocomplete = [];
    /** 선별등급 **/
    jsonGdsSeCd = []
    jsonGdsGrd = []
    jsonSpcfct = []
    /** 현재 선택 상품 정보 **/
    jsonTepObj = {};
    /** 추가 선별번호만 입력 **/
    jsonNewGdsGrd = [];
    /** 재고 임시 json **/
    let tempJson = [];
    let prdcrTempJson = [];
    let mapInvntQntt = new Map();
    /** 최종 저장용 JSON **/
    let saveRegSpmtJson = [];
    /** 등록 테이블 EL **/
    let regTableEl =
    `<tr>
        <td>
            <div style="display: flex">
                <div style="flex: 2; font-family: 'Font Awesome 5 Free';margin-right: 10px;position: relative">
                    <input type="number" onChange="fn_onChangesortGds(this)"/>
                    <span onclick="fn_searchInvntrQntt(this)" style="position: absolute;top: 6px;left: 210px" class='glyphicon sbux-inp-icon glyphicon-search'></span>
                </div>
                <div style="flex: 1; font-family: 'Font Awesome 5 Free';">
                    <input type="number" onChange="fn_onChangePrdcr(this)"/>
                </div>
            </div>
        </td>
        <td>
            <div style="font-family: 'Font Awesome 5 Free';">
                <input type="text"/>
            </div>
        </td>
        <td>
            <div style="font-family: 'Font Awesome 5 Free';">
                <input type="text"/>
            </div>
        </td>
        <td>
            <div style="font-family: 'Font Awesome 5 Free';">
                <input type="text"/>
            </div>
        </td>
        <td>
            <input type="number" class="qnttInp" onchange="fn_onchangeQntt(this)"/>
        </td>
        <td>
            <input type="number" class="qnttInp" onchange="fn_onchangeQntt(this)"/>
        </td>
        <td>
            <input type="number" class="qnttInp" onchange="fn_onchangeQntt(this)"/>
        </td>
        <td>
            <input readOnly/>
        </td>
        <td>
            <input readOnly/>
        </td>
        <td>
            <input/>
        </td>
    </tr>`


    window.document.addEventListener("DOMContentLoaded", function () {
        $("#dtl-inp-spmtYmd").val(gfn_dateToYmd(new Date(), '-'));
        let promise = Promise.all([
            gfn_setCpntRgnSBSelect('dtl-dtp-cnpt', jsonApcCnpt, gv_selectedApcCd),       // 거래처
            gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
            gfn_setApcItemSBSelect('srch-mod-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
            gfn_setApcVrtySBSelect('srch-mod-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
            gfn_setComCdSBSelect("srch-mod-gdsSeCd", jsonGdsSeCd, 'SORT_GRD', gv_selectedApcCd),
            fn_search()
        ]);
        $(".qnttInp").on('focus', fn_showInvntQntt.bind(this));
        $(".qnttInp").on('blur', () => {
                $("#invntQnttEl").remove();
        });
        /** main.jsp msg push**/
        window.parent.postMessage("sideMenuOff", "*");

    });
    /** 거래처 json 조회 **/
    const fn_set_cnpt = async function () {
        let apcCd = gv_apcCd;
        let postJsonPromise = gfn_postJSON("/am/cmns/selectCnptList.do", {
            apcCd: apcCd,
        });
        let data = await postJsonPromise;
        if (data.resultStatus == "S") {
            $("#dtl-dtp-cnpt").empty();
            data.resultList.forEach(function (item) {
                let cnptNm = "<option>" + item.cnptNm + "</option>"
                $("#dtl-dtp-cnpt").append(cnptNm);
            });
        }
    }

    const fn_showOption = function (obj) {
        let test = document.getElementById("_" + obj.id);
        let display = test.style.display;
        if (display == 'none') {
            test.style.display = 'block';
            test.style.animation = 'slideDown 0.5s ease-out';
        } else {
            test.style.animation = 'slideUp 0.5s ease-out';
            setTimeout(function () {
                test.style.display = 'none';
            }, 400);
        }
    }
    /** 팝업 관련 함수 **/
    const fn_popup = async function () {
        let itemCd = SBUxMethod.get("srch-slt-itemCd");
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");

        let view = document.querySelector('.invnt_modal');
        let display = view.style.display;
        if (display == 'none' || gfn_isEmpty(display)) {
            if (gfn_isEmpty(itemCd)) {
                gfn_comAlert("W0001", "품목");
                return;
            }
            view.style.display = 'block';
        } else {
            view.style.display = 'none';
            return;
        }
        /** 품목 변경 **/
        await SBUxMethod.set("srch-mod-itemCd", itemCd);
        await gfn_setApcVrtySBSelect('srch-mod-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd);	// 품종
        /** 품종 변경 **/
        if (!gfn_isEmpty(vrtyCd)) {
            SBUxMethod.set("srch-mod-vrtyCd", vrtyCd);
        }

        jsonGdsSeCd.length = 0;
        jsonGdsGrd.length = 0;
        let gdsSeCd = await gfn_getStdGrdDtls(gv_apcCd, "02", itemCd);
        gdsSeCd.forEach(function (item) {
            jsonGdsSeCd.push({text: item.grdNm, value: item.grdCd});
        });

        let gdsGrd = await gfn_getStdGrdDtls(gv_apcCd, "02", itemCd);
        gdsGrd.forEach(function (item) {
            jsonGdsGrd.push({text: item.grdNm, value: item.grdCd});
        });
        await gfn_setApcSpcfctsSBSelect("srch-mod-spcfct", jsonSpcfct, gv_apcCd, itemCd);

        SBUxMethod.refresh("srch-mod-gdsSeCd");
        SBUxMethod.refresh("srch-mod-gdsGrd");

    }
    /** 재고조회 **/
    const fn_search = async function () {
        let pckgYmdFrom = $("#srch-mod-pckgYmdFrom").val().replaceAll("-", '');
        let pckgYmdTo = $("#srch-mod-pckgYmdTo").val().replaceAll("-", '');
        let itemCd = SBUxMethod.get("srch-mod-itemCd");
        let vrtyCd = SBUxMethod.get("srch-mod-vrtyCd");
        let prdcrCd = SBUxMethod.get('srch-mod-prdcrCd');
        let spcfct = SBUxMethod.get("srch-mod-spcfct");
        let gdsSeCd = SBUxMethod.get("srch-mod-gdsSeCd");
        let gdsGrd = SBUxMethod.get("srch-mod-gdsGrd");


        // if (gfn_isEmpty(itemCd)) {
        //     gfn_comAlert("W0001", "품목");				//	W0002	{0}을/를 선택하세요.
        //     return false;
        // }

        try {
            const postJsonPromise = gfn_postJSON("/am/cmns/selectGrdNmList.do", {
                apcCd: gv_selectedApcCd,
                grdSeCd : '02'
            });
            const data = await postJsonPromise;

            data.resultList.forEach(function(item){
               for(let key in item){
                   if(item[key] == null){
                       delete item[key];
                   }
               }
            });
            jsonNewGdsGrd = data.resultList;



        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
    /** 재고 선택 **/
    const fn_select = function (el) {
        let rowObj = {};
        let invntData = $(el).find('td');
        invntData.each(function () {
            var key = $(this).attr('id');
            var value = $(this).text();
            rowObj[key] = value;
        });
        fn_popup();

        SBUxMethod.set("srch-slt-sortGrdCd", rowObj.sortGrdNm);
        SBUxMethod.attr("srch-slt-sortGrdCd", 'readonly', 'true');
        SBUxMethod.set("srch-slt-prdcrNm", rowObj.prdcr);
        SBUxMethod.attr("srch-slt-prdcrNm", 'readonly', 'true');
        SBUxMethod.set("srch-slt-gdsGrdNm", rowObj.gdsGrdNm);
        SBUxMethod.attr("srch-slt-gdsGrdNm", 'readonly', 'true');
        SBUxMethod.set("srch-slt-vrtyCd", rowObj.vrtyCd);
        SBUxMethod.set("srch-slt-gdsGrd", rowObj.gdsGrd);

        let invntrQntt = parseInt(rowObj.invntrQntt);

        let jsonKey = rowObj.itemCd + rowObj.vrtyCd + rowObj.sortGrdCd;
        if (jsonRegTableData.hasOwnProperty(jsonKey)) {
            let el = jsonRegTableData[jsonKey];
            el.forEach(function (item) {
                if (item.gdsGrd == rowObj.gdsGrd) {
                    let gdsKey = 'gdsGrd' + item.gdsGrd;
                    invntrQntt = parseInt(item.invntrQntt) - parseInt(item[gdsKey]);
                }
            });
        }

        $("#invntrQntt").text(invntrQntt);

        jsonTepObj = rowObj;

    }

    /**
     * @name fn_onInputPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onInputPrdcrNm = function (prdcrNm) {
        fn_clearPrdcr();
        if (getByteLengthOfString(prdcrNm.target.value) > 100) {
            SBUxMethod.set("srch-inp-prdcrNm", "");
            return;
        }
        jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
        SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

    /**
     * @name fn_onSelectPrdcrNm
     * @description 생산자 autocomplete 선택 callback
     */
    function fn_onSelectPrdcrNm(value, label, item) {
        SBUxMethod.set("srch-inp-prdcrCd", value);

        let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
        fn_setPrdcrForm(prdcr);
    }

    /**
     * @name fn_choicePrdcr
     * @description 생산자 선택 popup 호출
     */
    const fn_choicePrdcr = function () {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }
    /**
     * @name fn_setPrdcr
     * @description 생산자 선택 popup callback 처리
     */
    const fn_setPrdcr = async function (prdcr) {
        SBUxMethod.set("srch-inp-wrhsno", "");
        await fn_getPrdcrs();

        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-mod-prdcrCd", prdcr.prdcrCd);
            SBUxMethod.set("srch-mod-prdcrNm", prdcr.prdcrNm);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "font-size:3vh;height:100%;font-weight:bold");
        }
    }
    /**
     * @name fn_getPrdcrs
     * @description 생산자 자동완성 JSON 설정
     */
    const fn_getPrdcrs = async function () {
        jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
        jsonPrdcr = gfn_setFrst(jsonPrdcr);
    }
    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 변경시 품종 set
     */
    const fn_onChangeSrchItemCd = async function (obj) {
        let elId = obj.id.substring(0, 9);
        let itemCd = obj.value;
        await gfn_setApcVrtySBSelect(elId + 'vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd);	// 품종

        SBUxMethod.set("srch-slt-sortGrdCd", "");
        SBUxMethod.set("srch-slt-prdcrNm", "");
        SBUxMethod.set("srch-slt-gdsGrdNm", "");
        SBUxMethod.set("srch-slt-gdsGrdCd", "");
        $("#srch-slt-invntrQntt").val('');
        $("#invntrQntt").text("");
    }
    let jsonRegTableData = [];
    /**
     * @name fn_refreshReg
     * @description 실제 저장되는 데이터 JSON
     */
    const fn_refreshReg = async function (_arr) {
        $("#reg_table tbody").empty();
        if (!gfn_isEmpty(_arr)) {
            jsonRegTableData = _arr.reduce((acc, curr) => {
                let flag = false;
                let curKey = 'gdsGrd' + curr.gdsGrd;
                let spmtQntt = parseInt(curr.spmtQntt);
                let itemVrtyKey = curr.itemCd + curr.vrtyCd + curr.sortGrdCd;

                /** 1depth true **/
                for (let key in acc) {
                    if (key == itemVrtyKey) {
                        acc[itemVrtyKey].forEach(function (item) {
                            if (item.gdsGrd == curr.gdsGrd && item.sortGrdCd == curr.sortGrdCd) flag = true;
                        });
                    }
                }

                if (flag) {
                    acc[itemVrtyKey].forEach(function (item) {
                        if (item.hasOwnProperty(curKey)) {
                            item[curKey] += spmtQntt;
                        }
                    });
                } else {
                    const newObj = {
                        [curKey]: spmtQntt,
                        ...curr,
                    };
                    if (!acc.hasOwnProperty(itemVrtyKey)) {
                        acc[itemVrtyKey] = [];
                    }
                    acc[itemVrtyKey].push(newObj);

                }
                return acc;

            }, jsonRegTableData);
            for (let key in jsonRegTableData) {
                let item = jsonRegTableData[key];
                let gdsGrd01 = "";
                let gdsGrd02 = "";
                let gdsGrd03 = "";
                let sum = 0;
                item.forEach(function (el) {
                    let key = 'gdsGrd' + el.gdsGrd;
                    sum += el[key];
                    key == 'gdsGrd01' ? gdsGrd01 = el[key] : key == 'gdsGrd02' ? gdsGrd02 = el[key] : gdsGrd03 = el[key]
                });

                $("#reg_table tbody").append(
                    `<tr>
                    <td>
                        <div style="display: flex">
                            <div style="flex: 2; border: 1px solid #bbc4d1;font-family: 'Font Awesome 5 Free';margin-right: 10px">` + item[0].sortGrdNm + `</div>
                            <div style="flex: 1; border: 1px solid #bbc4d1;font-family: 'Font Awesome 5 Free';">` + item[0].prdcr + `</div>
                        </div>
                    </td>
                    <td>
                        <div style="border: 1px solid #bbc4d1;font-family: 'Font Awesome 5 Free';">` + item[0].itemNm + `</div>
                    </td>
                    <td>
                        <div style="border: 1px solid #bbc4d1;font-family: 'Font Awesome 5 Free';">` + item[0].spcfctNm + `</div>
                    </td>
                    <td>
                        <input type="number" jsonRef="` + key + `" gdsGrd="01" value="` + (gdsGrd01 != "" ? parseInt(gdsGrd01) : "") + `" onchange="fn_updateQntt(this,this.value)"` + (gdsGrd01 != "" ? "" : "readonly") + `/>
                    </td>
                    <td>
                        <input type="number" jsonRef="` + key + `" gdsGrd="02" value="` + (gdsGrd02 != "" ? parseInt(gdsGrd02) : "") + `" onchange="fn_updateQntt(this,this.value)" ` + (gdsGrd02 != "" ? "" : "readonly") + `/>
                    </td>
                    <td>
                        <input type="number" jsonRef="` + key + `" gdsGrd="03" value="` + (gdsGrd03 != "" ? parseInt(gdsGrd03) : "") + `" onchange="fn_updateQntt(this,this.value)" ` + (gdsGrd03 != "" ? "" : "readonly") + `/>
                    </td>
                    <td>
                        <input readonly />
                    </td>
                    <td>
                        <input value="` + sum + `" readonly/>
                    </td>
                    <td>
                        <input/>
                    </td>
                </tr>`
                )
            }
        }


    };
    /**
     * @name fn_valiQntt
     * @description 수량입력시 재고 허용가능여부
     */
    const fn_valiQntt = function (qntt) {
        let maxQntt = parseInt($("#invntrQntt").text());
        if (qntt > maxQntt) {

        }
    }
    /**
     * @name fn_regSpmtSave
     * @description 수량입력후 출하등록
     */
    //TODO: 여기서 뭔가 포맷팅을 다해야하는데 특상보통의 합계와 현재 등록하는 상품이 존재하는지에대하여..
    /** 포맷은 jsonRegTableData에 다 밀어넣고 테이블이 실질적으로 렌더링될때는 저 객체배열만을 참조하게
     * result >> 다 떄려박고 테이블 렌더링할때 정의 하는걸로**/
    const fn_regSpmtSave = function () {
        let spmtQntt = $("#srch-slt-invntrQntt").val();
        if (gfn_isEmpty(spmtQntt)) {
            gfn_comAlert("W0002", "수량");
            return;
        }
        let qnt = parseInt($("#invntrQntt").text());
        if (qnt - spmtQntt < 0) {
            gfn_comAlert("W0017", "수량");
            return;
        }
        let grdCd = SBUxMethod.get('srch-slt-sortGrdCd');
        if (gfn_isEmpty(grdCd)) {
            gfn_comAlert("W0002", "출하번호");
            return;
        }
        $("#invntrQntt").text(qnt - spmtQntt);

        jsonTepObj.spmtQntt = spmtQntt;

        let key = 'gdsGrd' + jsonTepObj.gdsGrd;
        jsonTepObj[key] = parseInt(spmtQntt);
        let arr = [];
        arr.push(jsonTepObj);

        fn_refreshReg(arr);
        $("#srch-slt-invntrQntt").val('');
    };

    /**
     * @name fn_updateQntt
     * @description 수량입력후 수정
     */
    const fn_updateQntt = function (_el, _val) {
        let jsonRef = _el.getAttribute("jsonRef");
        let gdsGrd = _el.getAttribute("gdsGrd");

        let itemCd = SBUxMethod.get("srch-slt-itemCd");
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
        let grdCd = SBUxMethod.get("srch-slt-sortGrdCd");

        if (jsonRegTableData.hasOwnProperty(jsonRef)) {
            let jsonEl = jsonRegTableData[jsonRef];
            jsonEl.forEach(function (item) {
                if (item.gdsGrd == gdsGrd) {
                    let key = "gdsGrd" + gdsGrd;
                    if (parseInt(item.invntrQntt) < parseInt(_val)) {
                        gfn_comAlert("W0017", "수량");
                        let originQntt = item[key];
                        _el.value = originQntt;
                        return;
                    }
                    item[key] = parseInt(_val);
                    if (item.itemCd == itemCd && item.vrtyCd == vrtyCd && item.sortGrdNm == grdCd) {
                        let invntrQntt = parseInt(item.invntrQntt) - parseInt(item[key]);
                        $("#invntrQntt").text(invntrQntt);
                    }
                }
            });
        }
    }
    /**
     * @name fn_updateInvtr
     * @description 수량입력후 수정
     */
    const fn_updateInvtr = function (obj = null) {

        /** obj == 직접 수정한 rowData **/

        if (!gfn_isEmpty(obj)) {
            jsonRegTableData.forEach(function (item) {
                if (item.itemCd == obj.itemCd && item.vrtyCd == obj.vrtyCd) {
                    for (let key in obj) {
                        if (key.startsWith("gdsGrd")) {
                            item[key] = parseInt(obj[key]);

                            /** 현재 선택된 재고가 직접 수정한 재고와 같은 상품일경우 재고 변경처리. **/

                            if (obj.itemCd == itemCd && obj.vrtyCd == vrtyCd) {
                                let invtrQntt = parseInt($("#invntrQntt").text()) - parseInt(obj[key]);
                                $("#invntrQntt").text(invtrQntt);
                            }
                        }
                    }
                }
            });

        } else {
            /** 등록 버튼으로 인한 재고 반영 **/
        }

        let itemCd = SBUxMethod.get("srch-slt-itemCd");
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
    }
    /**
     * @name fn_sumQntt
     * @description row 수량 등록시 합계 연산
     */
    const fn_sumQntt = function (_tr) {
    }
    /**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = function () {
        SBUxMethod.set("dtl-dtp-cnpt", "");
        SBUxMethod.set("srch-slt-itemCd", "");
        SBUxMethod.set("srch-slt-vrtyCd", "");
        SBUxMethod.set("srch-slt-sortGrdCd", "");
        SBUxMethod.set("srch-slt-prdcrNm", "");
        SBUxMethod.set("srch-slt-gdsGrdNm", "");
        SBUxMethod.set("srch-slt-gdsGrdCd", "");
        $("#srch-slt-invntrQntt").val('');
        $("#invntrQntt").text("");

        $("#reg_table tbody").empty();
        jsonRegTableData = [];
    }
    /**
     * @name fn_onchangeCnpt
     * @description 거래처 변경
     */
    const fn_onchangeCnpt = async function () {
        let val = SBUxMethod.get("dtl-dtp-cnpt");
        let jsonSelectCnpt = jsonApcCnpt.filter(function (item) {
            return item.cmnsCd == val;
        });
        let dlngShapCd = await gfn_getComCdDtls("DLNG_SHAP_CD");
        let dlngMthdCd = await gfn_getComCdDtls("DLNG_MTHD_CD");

        if (jsonSelectCnpt.length != 0) {
            dlngShapCd = dlngShapCd.filter(function (item) {
                return item.cdVl == jsonSelectCnpt[0].dlngShapCd;
            });
            dlngMthdCd = dlngMthdCd.filter(function (item) {
                return item.cdVl == jsonSelectCnpt[0].dlngMthdCd;
            });
            $("#dlngShapCd").text(dlngShapCd[0].cdVlNm);
            $("#dlngMthdCd").text(dlngMthdCd[0].cdVlNm);
        }
    }
    /** 출하번호 입력시 품목, 품종,단량 셋팅 및 생산자번호 선입력시 재고 셋팅 **/
    const fn_onChangesortGds = function (_el) {
        let _val = _el.value;
        let parentTr = $(_el).closest('tr');
        let lastInput = parentTr.children(':last');
        lastInput.find("input").eq(0).attr('type') == "hidden" ? lastInput.remove():"";

        let _prdcr =$(_el).parent().next('div').children();
        _prdcr.val('');
        $(_prdcr).attr("type", "number");
        $(_prdcr).attr("readonly", false);
        $(_prdcr).css("color", "initial");
        $(_prdcr).css("background-color", "initial");
        $(_prdcr).val("");
        // let _prdcr = $(_el).parent().next('div').children().val();

        jsonNewGdsGrd.forEach(function (item) {
            for (let key in item) {
                if (item[key] === null) {
                    delete item[key];
                }
            }
        });

        tempJson = jsonNewGdsGrd.filter(function (item) {
            return item.grdNm.includes(_val);
        });

        let rowData = JSON.stringify(tempJson[0]);
        parentTr.append(`<td><input type="hidden" value='`+rowData+`' /></td>`);

        if (tempJson.length == 0) {
            parentTr.children().eq(1).find('input').val('');
            parentTr.children().eq(2).find('input').val('');
            parentTr.children().eq(3).find('input').val('');
            /** 출하번호에 대한 정보가 없는데 생산자전용 임시 JSON이 있을수있음. **/
            prdcrTempJson.length = 0;
        } else {
            /** 품목 단량 세팅 0번 인덱스로 없으면 어쩌지? **/
            parentTr.children().eq(1).find('input').val(tempJson[0].itemNm);
            parentTr.children().eq(2).find('input').val(tempJson[0].vrtyNm);
            parentTr.children().eq(3).find('input').val(tempJson[0].spcfctNm);
            /** 없는 출하번호로 인해 생산자전용 임시 JSON이 지워진경우 **/
            fn_onChangePrdcr($(_el).parent().next('div').children());

            /** 등록 테이블 로우 추가 **/
            if (parentTr.next().length == 0 ) {
                if(tempJson.length > 0) {
                    $("#reg_table > tbody").append(regTableEl);
                    $(".qnttInp").on('focus', fn_showInvntQntt.bind(this));
                    $(".qnttInp").on('blur', () => {
                        $("#invntQnttEl").remove();
                    });
                }
            }
        }
        fn_setInvntQntt(parentTr);
    }
    /** 생산자 번호 입력시 2차 필터링 **/
    const fn_onChangePrdcr = function (_el) {
        let _val = $(_el).val();
        let parentTr = $(_el).closest('tr');
        /** 현재 출하번호에 맞는 상품리스트중에 생산자번호까지 일치하는 재고만 추림 2차 필터링 **/
        /** 생산자 번호만 바뀔가능성이 있음. **/
        if(!gfn_isEmpty(tempJson)){
            prdcrTempJson = tempJson;
            prdcrTempJson = prdcrTempJson.filter(function (item) {
                return item.prdcr == _val;
            });
            /** 각 재고 인풋에 재고 현황 셋팅 **/
            fn_setInvntQntt(parentTr);
        }
    }

    /** 현재 row의 Element 정보가 반드시 필요함. **/
    const fn_setInvntQntt = function (parentTr) {
        /** 재고 tooltip 추가 및 input max 한정 **/
        if(!gfn_isEmpty(prdcrTempJson)){

        /** max 셋팅 **/
        prdcrTempJson.forEach(function (item) {
            let idx = parseInt(item.gdsGrd) + 3;
            let el = parentTr.children().eq(idx).find('input');
            el.attr('max', (item.invntrQntt - (item.useQntt || 0)));
            // el.attr('max', (item.invntrQntt - (gfn_isEmpty(item.useQntt)?0:item.useQntt)));
        });

        /** 해당 row css적용 [max 존재 유무] **/
        $(parentTr).find("input.qnttInp").each(function () {
            let inputEl = $(this)[0];
            let max = inputEl.getAttribute('max');

            if (gfn_isEmpty(max)) {
                $(inputEl).attr("type", "text");
                $(inputEl).attr("readonly", true);
                $(inputEl).css("color", "white");
                $(inputEl).css("background-color", "#999");
                $(inputEl).val("X");
            }else{
                $(inputEl).attr("type", "number");
                $(inputEl).attr("readonly", false);
                $(inputEl).css("color", "initial");
                $(inputEl).css("background-color", "initial");
                $(inputEl).val("");
            }
        })
        }else{
            $(parentTr).find("input.qnttInp").each(function () {
                let inputEl = $(this)[0];
                inputEl.removeAttribute("max");
                $(inputEl).attr("type", "number");
                $(inputEl).attr("readonly", false);
                $(inputEl).css("color", "initial");
                $(inputEl).css("background-color", "initial");
                $(inputEl).val("");
            })
        }
    }

    const fn_showInvntQntt = async function (_el) { //top: 99.4062px; left: 233.5px;
        let max = _el.target.getAttribute("max");
        if (!gfn_isEmpty(max)) {
            let _el = document.activeElement;
            let rect = _el.getBoundingClientRect();
            let parentTd = $(_el).closest('td');


            /** 재고 툴팁 element **/
            let invntQnttEl = `<div id="invntQnttEl"class="sbux-pop sbux-fade sbux-pop-bottom sbux-in" role="tooltip"
                    style="display: block; top:` + (rect.top + 31) + `px; left:` + (rect.left + 15) + `px"
                        onclick="fn_selectInvntQntt(`+max+`,this)">
                        <div class="sbux-pop-arrow" style="left: 50%;"></div>
                        <h3 class="sbux-pop-title" style="display: none;"></h3>
                        <div class="sbux-pop-content">
                            재고: ` + max + `
                        </div>
                    </div>`;

            $(parentTd).append(invntQnttEl);
        }
    }

    const fn_selectInvntQntt = function(_max,_el){
    }

    /** 수량 수정시 fn **/
    const fn_onchangeQntt = function(_el){

        let val = parseInt($(_el).val());
        let max = parseInt($(_el).attr("max"));

        if(val > max){
            gfn_comAlert("W0008","재고","수량");
            $(_el).val(max);
        }
        let rowData = JSON.parse($(_el).closest('tr').children(":last").find("input").eq(1).val());
        if(mapInvntQntt.has(rowData.spmtInvId)){
            let originQnttMap = mapInvntQntt.get(rowData.spmtInvId);
            let originTrIdx = $(_el).closest('tr').index();
            originQnttMap.set(originTrIdx,(val));
        }
    }

    const fn_searchInvntrQntt = async function(_el){
        let tr = $(_el).closest('tr');
        let rowData = tr.find('td > input[type=hidden]').val();
        let originTridx = $(tr).index();

        try{
            rowData = JSON.parse(rowData);
        }catch (e){
            gfn_comAlert("W0001","출하번호");
            $(_el).prev().focus();
            return;
        }

        let postJsonPromise = gfn_postJSON("/am/spmt/selectSpmtPrfmncInvntList.do",rowData);

        const data = await postJsonPromise;
        data.resultList.forEach(function(item){
            for(let key in item){
                if(item[key] == null){
                    delete item[key];
                }
            }
        });
        data.resultList.map(function(item){
            //TODO: 재고현황 파악해서 재고 마이너스처리
            if(mapInvntQntt.has(item.spmtInvId)){
                let maps = mapInvntQntt.get(item.spmtInvId).values();
                let originQntt = 0;
                for(const value of maps){
                    originQntt += value;
                }
                item.invntrQntt -= originQntt;
            }
        });


        let fn_invntrModalEl = function(_list){
            let prdcrFlag = !_list[0].hasOwnProperty('prdcrNm');
            let invntrModalEl = !prdcrFlag ? `<h2>`+(_list[0].sortGrdNm) + " " + (_list[0].spmtPckgUnitNm) +`</h2>`:`<h2>`+(_list[0].sortGrdNm) + " " + (_list[0].spcfctNm) +`</h2>`;
                invntrModalEl += `
                <table id="invntrTable" style="width:100%">
                    <colgroup>`;
            if(!prdcrFlag){
                invntrModalEl += `
                        <col style="width: 17%">
                        <col style="width: 11%">
                        <col style="width: 17%">
                        <col style="width: 11%">
                        <col style="width: 11%">
                        <col style="width: 11%">
                        <col style="width: 11%">
                        <col style="width: 11%">`
            }else{
                invntrModalEl += `
                        <col style="width: 20%">
                        <col style="width: 14%">
                        <col style="width: 20%">
                        <col style="width: 14%">
                        <col style="width: 14%">
                        <col style="width: 14%">`
            };

            invntrModalEl += `
                    </colgroup>
                    <thead>
                        <tr>
                            <th>선별일자</th>
                            <th>품목</th>
                            <th>품종</th>`;
                        if(!prdcrFlag) {
                            invntrModalEl +=
                            `<th>생산자명</th>
                            <th>번호</th>`
                        }
                invntrModalEl +=
                        `<th>상품등급</th>
                            <th>수량</th>
                            <th>중량</th>
                        </tr>
                    </thead>
                    <tbody>`;
                        let rowCount = 0;
            _list.forEach(function(item,idx){
                if(item.invntrQntt <= 0)return;

               invntrModalEl += `<tr onclick="fn_selectInvnt(this,`+originTridx+`)">
                            <td>`+item.pckgYmd.replace(/(\d{4})(\d{2})(\d{2})/,"$1-$2-$3")+`</td>
                            <td>`+item.itemNm+`</td>
                            <td>`+item.vrtyNm+`</td>`;
                            if(!prdcrFlag){
                                invntrModalEl +=
                                `<td>`+item.prdcrNm+`</td>`+
                                `<td>`+item.prdcrIdentno+`</td>`
                            }
                invntrModalEl +=
                            `<td>`+item.gdsGrdNm+`</td>
                            <td>`+item.invntrQntt+`</td>
                            <td>`+item.invntrWght+`</td>
                            <input type="hidden" value='`+JSON.stringify(item)+`'/>
                        </tr>`;
                            rowCount++;
            });
            if(rowCount == 0){
                invntrModalEl += prdcrFlag?`<tr><td colspan="6" style="height:10vh">상품재고가 없습니다.</td></tr>`:`<tr><td colspan="8" style="height:10vh">상품재고가 없습니다.</td></tr>`
            }
            invntrModalEl += `</tbody></table>`;

            return invntrModalEl;
        }
        let el = fn_invntrModalEl(data.resultList);
        SBUxMethod.setModalBody('searchQntt', el);

        SBUxMethod.openModal('searchQntt');
    }

    /** 재고선택 **/
    const fn_selectInvnt = function(_row,_idx){
        SBUxMethod.closeModal('searchQntt');
        let originTr = $("#reg_table tbody").children().eq(_idx);

        let rowData = JSON.parse($(_row).children(":last").val());
        originTr.children(":last").find("input").eq(1).attr('type') == "hidden" ? originTr.children(":last").find("input").eq(1).remove():"";
        originTr.children(':last').append(`<td><input type="hidden" value='`+$(_row).children(":last").val()+`' /></td>`);

        let prdcrTd = originTr.children().eq(0).find('input').eq(1);
        if(rowData.hasOwnProperty("prdcrIdentno")){
            $(prdcrTd).attr("type", "number");
            $(prdcrTd).attr("readonly", false);
            $(prdcrTd).css("color", "initial");
            $(prdcrTd).css("background-color", "initial");
            $(prdcrTd).val("");
            prdcrTd.val(rowData.prdcrIdentno);
        }else{
            $(prdcrTd).attr("type", "text");
            $(prdcrTd).attr("readonly", true);
            $(prdcrTd).css("color", "white");
            $(prdcrTd).css("background-color", "#999");
            $(prdcrTd).val("X");
        }

        originTr.children().eq(3).find('input').val(rowData.spcfctNm);

        //gdsGrd
        let originInput =  originTr.children().eq(parseInt(rowData.gdsGrd) + 3).find('input');
        originInput.val(rowData.invntrQntt);
        originInput.attr('max',rowData.invntrQntt);

        $(originTr).find("input.qnttInp").each(function () {
            let inputEl = $(this)[0];
            let max = inputEl.getAttribute('max');

            if (gfn_isEmpty(max)) {
                $(inputEl).attr("type", "text");
                $(inputEl).attr("readonly", true);
                $(inputEl).css("color", "white");
                $(inputEl).css("background-color", "#999");
                $(inputEl).val("X");
            }else{
                $(inputEl).attr("type", "number");
                $(inputEl).attr("readonly", false);
                $(inputEl).css("color", "initial");
                $(inputEl).css("background-color", "initial");
            }
        });
        mapInvntQntt.set(rowData.spmtInvId,new Map().set(originTr.index(),rowData.invntrQntt));
        fn_onchangeQntt(originInput);
    }


</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>