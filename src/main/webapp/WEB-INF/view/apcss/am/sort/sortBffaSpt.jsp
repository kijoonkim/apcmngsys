<%--
  Created by IntelliJ IDEA.
  User: huno
  Date: 24. 5. 13.
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%
    /**
     * @Class Name : sortBffaRegByGrd.jsp
     * @Description : 육안선별 등록(현장용)
     * @author SI개발부
     * @since 2024.04.22
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.05.13    김현호	최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 선별등록(모바일)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>
    <style>

        .sbux-pik-icon-btn{
            height: 50px !important;
        }
        .align-center {
            text-align: center;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .col-hd {
            background-color: #e8f1f9;
        }

        .th-mbl {
            text-align: right;
            font-weight: bold;
            font-size: 3vh;
        }

        .inpt-mbl {
            height: 50px;
            font-size: 3vh;
            line-height: 1.5;
            color: #555;
            width: 100%;
        }

        .btn-mbl {
            height: 50px;
            font-size: 24px;
        }

        .chk-mbl {
            height: 50px;
            font-size: 24px;
            width: 100%;
        }

        .chk-mbl input, label {
            vertical-align: bottom;
        }

        .fs-30 {
            font-size: 30px;
        }

        .tbl-sortGrd {

        }

        #searchHeadInfoBody > tr > th{
            -webkit-text-size-adjust: 100%;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
            color: #333;
            font-family: Notokr, Apple SD Gothic Neo, Arial, Tahoma, sans-serif;
            border-spacing: 0;
            border-collapse: collapse;
            box-sizing: border-box;
            margin: 0;
            border-color: #e8f1f9 !important;
            border-bottom: 1px solid #ffffff !important;
            word-wrap: break-word;
            background-color: #e8f1f9;
            text-align: center;
            font-weight: bold;
            font-size: 3vh;
            padding: 8px;
            line-height: 1.42857143;
            border: 1px solid #ddd;
            border-top: 1px solid #f4f4f4;
            vertical-align: middle;
        }
        #searchBodyInfoBody > tr > td:hover{
            background-color : #FFF8DCFF;
            cursor: pointer;
        }
        #GRD_TYPE_1:focus {
            border-color: #149FFF;
        }
        #GRD_TYPE_2:focus {
            border-color: #149FFF;
        }
        #GRD_WGHT:focus {
            border-color: #149FFF;
        }

        #searchBodyInfoBody > tr > td {
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
        #itemVrtyInp span{
            font-size : 28px;
            line-height : 1.5;
            color: red;
            margin-left : 5px;
        }
        #itemVrtyInp input{
            font-size: 28px;
            width: 100px;
            line-height: 1.5;
            color: red;
        }
    </style>
</head>
<body oncontextmenu="return false">
<section>
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 선별실적등록 모바일 -->
            </div>
        </div>
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div style="margin-right: auto;">
                <sbux-button
                        id="btnReset"
                        name="btnReset"
                        uitype="normal"
                        text="초기화"
                        class="btn btn-sm btn-outline-danger btn-mbl"
                        onclick="fn_reset"
                ></sbux-button>
                <sbux-button
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        text="저장"
                        class="btn btn-sm btn-outline-danger btn-mbl"
                        onclick="fn_save"
                ></sbux-button>
                <sbux-button
                        id="btn-search"
                        name="btn-search"
                        uitype="normal"
                        text="조회"
                        class="btn btn-sm btn-outline-danger btn-mbl"
                        onclick="fn_search"
                ></sbux-button>
                <sbux-button
                        id="btnClose"
                        name="btnClose"
                        uitype="normal"
                        text="종료"
                        class="btn btn-sm btn-outline-danger btn-mbl"
                        onclick="fn_close"
                ></sbux-button>
                <sbux-button
                        id="btnDelete"
                        name="btnDelete"
                        uitype="normal"
                        text="삭제"
                        class="btn btn-sm btn-outline-danger btn-mbl"
                        onclick="fn_delete"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <!--[APC] START -->
            <!--[APC] END -->
            <!--[pp] 검색 -->
            <table class="table table-bordered tbl_fixed">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 20%">
                    <col style="width: 10%">
                    <col style="width: 5%">
                    <col style="width: 5%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg th-mbl">
                        <span class="data_required" ></span>생산자
                    </th>
                    <td colspan="4" class="td_input"  style="border-right:hidden;">
                        <sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
                        <sbux-input
                                uitype="text"
                                id="srch-inp-prdcrNm"
                                name="srch-inp-prdcrNm"
                                class="input-sm-ast inpt_data_reqed inpt-mbl"
                                placeholder="초성검색 가능"
                                autocomplete-ref="jsonPrdcrAutocomplete"
                                autocomplete-text="name"
                                oninput="fn_onInputPrdcrNm(event)"
                                autocomplete-select-callback="fn_onSelectPrdcrNm"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
                        <sbux-input
                                uitype="text"
                                id="srch-inp-prdcrIdentno"
                                name="srch-inp-prdcrIdentno"
                                class="input-sm-ast inpt_data_reqed inpt-mbl"
                                maxlength="2"
                                autocomplete="off"
                                onchange="fn_onChangeSrchPrdcrIdentno(this)"
                        ></sbux-input>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-button
                                id="srch-btn-slt-prdcrNm"
                                name="srch-btn-slt-prdcrNm"
                                class="btn btn-xs btn-outline-dark btn-mbl"
                                text="찾기"
                                uitype="modal"
                                target-id="modal-prdcr"
                                onclick="fn_choicePrdcr"
                        ></sbux-button>
                    </td>
                    <td colspan="5"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">
                        <span class="data_required" ></span>품목/품종
                    </th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select
                                id="srch-slt-itemCd"
                                name="srch-slt-itemCd"
                                uitype="single"
                                class="inpt-mbl"
                                jsondata-ref="jsonApcItem"
                                unselected-text="전체"
                                onchange="fn_onChangeSrchItemCd(this)"
                        ></sbux-select>
                    </td>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select
                                id="srch-slt-vrtyCd"
                                name="srch-slt-vrtyCd"
                                uitype="single"
                                class="inpt-mbl"
                                jsondata-ref="jsonApcVrty"
                                jsondata-value="itemVrtyCd"
                                unselected-text="선택"
                                onchange="fn_onChangeSrchVrtyCd(this)"
                        ></sbux-select>
                    </td>
                    <td class="td_input" style="border-right:hidden;">
                        <p class="ad_input_row chk-mbl" style="vertical-align:middle;">
                            <input
                                    style="width:20px;height:20px;"
                                    type="checkbox"
                                    id="dtl-chk-itemFixed"
                                    name="dtl-chk-itemFixed"
                                    checked
                            />
                            <label for="dtl-chk-itemFixed">고정</label>
                        </p>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">
                        <span class="data_required" ></span>입고일자
                    </th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-datepicker
                                id="srch-dtp-wrhsYmd"
                                name="srch-dtp-wrhsYmd"
                                uitype="popup"
                                date-format="yyyy-mm-dd"
                                class="form-control input-sm sbux-pik-group-apc input-sm-ast inpt_data_reqed"
                                onchange="fn_dtpChange"
                                style="width:100%; height: 50px; font-size: 22px;"
                        ></sbux-datepicker>
                    </td>
                    <th colspan="2" scope="row" class="th_bg th-mbl">
                        <span class="data_required" ></span>선별기
                    </th>
                    <td colspan="2" class="td_input" style="border-right:hidden;">
                        <sbux-select
                                id="srch-slt-fcltCd"
                                name="srch-slt-fcltCd"
                                uitype="single"
                                class="inpt-mbl"
                                jsondata-ref="jsonApcFcltCd"
                                unselected-text="선택"
                        ></sbux-select>
                    </td>
                    <td colspan="4" class="td_input"></td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">박스수량/중량</th>
                    <td class="td_input" style="border-right:hidden;">
                        <sbux-input
                                id="srch-inp-wrhsQntt"
                                name="srch-inp-wrhsQntt"
                                uitype="text"
                                class="inpt-mbl"
                        ></sbux-input>
                    </td>

                    <td class="td_input" style="border-right:hidden;"><span class="sbux-lbl-span" style="font-size: 22pt; font-weight: bold;">개</span></td>
                    <td colspan="3" class="td_input" style="border-right:hidden;">
                        <sbux-input
                                id="srch-inp-wrhsWght"
                                name="srch-inp-wrhsWght"
                                uitype="text"
                                class="inpt-mbl"
                        ></sbux-input>
                    </td>
                    <td class="td_input" style="border-right:hidden;"><span class="sbux-lbl-span" style="font-size: 22pt; font-weight: bold;">Kg</span></td>
                    <td colspan="3"></td>
                </tr>
                </tbody>
            </table>
            <!-- 최근 실적 조회구간 -->
            <!--[pp] //검색 -->
        </div>
        <!--[pp] //검색결과 -->
        <div class="ad_tbl_top2">
            <ul class="ad_tbl_count">
                <li>
                    <span style="font-weight: bold; font-size: 22px; margin-left:15px">육안선별 결과</span>
                    <span style="font-size: 22px;"> (kg)</span>
                </li>
            </ul>
        </div>
        <div class="box-body" id="latestInfo">
            <table class="table table-bordered tbl_fixed tbl_mbl">
                <thead id="searchHeadInfoBody">
                </thead>
                <tbody id="searchBodyInfoBody">
                </tbody>
            </table>
        </div>

    </div>
</section>
<!-- 사용자 선택 Modal -->
<div>
    <sbux-modal id="modal-prdcr" name="modal-prdcr" uitype="middle" header-title="생산자 선택" body-html-id="body-modal-prdcr" header-is-close-button="false" footer-is-close-button="false" style="width:1000px"></sbux-modal>
</div>
<div id="body-modal-prdcr">
    <jsp:include page="../../am/popup/prdcrPopup.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">

    let flag = true;
    let searchFlag = false;
    let bffaWrhsno = "";

    var jsonOtrdEyeSort = [];
    var jsonApcItem = [];
    var jsonApcVrty = [];
    var jsonApcFcltCd = [];
    var jsonPrdcr = [];
    var jsonPrdcrAutocomplete = [];
    var jsonGrdColumnData = [];
    var jsonSearchData = [];

    const fn_initSBSelect = async function() {
        let rst = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-fcltCd', 		jsonApcFcltCd, 		'SORT_FCLT_CD', 	gv_selectedApcCd),	// 선별기
            gfn_setApcItemSBSelect('srch-slt-itemCd', 		jsonApcItem, 		gv_selectedApcCd),						// 품목
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', 		jsonApcVrty, 		gv_selectedApcCd),						// 품종
        ]);
    }

    window.addEventListener('DOMContentLoaded', function (e) {
        fn_initSBSelect();
        fn_getPrdcrs();
        fn_setGrdDsctnCol();

        SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
    });

    /* 테이블 헤더 그리기 */
    /*Start*/
    const fn_createTabelHeader = function () {
        $("#searchHeadInfoBody").empty();
        let html = "";
        let count = jsonGrdColumnData.length+2;
        html += '<tr>';
        html += '<th style="width: ' + 100/count +'%; color: red;">'+'열과'+'</th>';
        html += '<th style="width: ' + 100/count +'%; color: red;">'+'폐기'+'</th>';
        jsonGrdColumnData.forEach(function(item){
            html += '<th style=width:' +100/count+ '%;>'+item.GRD_NM+'</th>';
        });
        html += '</tr>';
        $("#searchHeadInfoBody").append(html);

        fn_createTabelBody();
    }
    /* End */
    /* 테이블 헤더 그리기 */
    /*Start*/
    const fn_createTabelBody = function () {
        $("#searchBodyInfoBody").empty();
        let html = "";
        let count = jsonGrdColumnData.length;
        html += '<tr>';
        html += '<td style="width:' + Math.floor(90 / count) + '%;">' + '<input style="width: 100%; border: 3px #E8F1F9 solid;" type="text" id="GRD_TYPE_1" name="GRD_TYPE_1" oninput="this.value = this.value.replace(/[^0-9]/g, \'\').replace(/\\d(?=(?:\\d{3})+$)/g, \'$&,\')"/>';
        html += '<td style="width:' + Math.floor(90 / count) + '%;">' + '<input style="width: 100%; border: 3px #E8F1F9 solid;" type="text" id="GRD_TYPE_2" name="GRD_TYPE_2" oninput="this.value = this.value.replace(/[^0-9]/g, \'\').replace(/\\d(?=(?:\\d{3})+$)/g, \'$&,\')"/>';
        for(var i=0; i<count; i++){
            let grdCd = "";
            grdCd = jsonGrdColumnData[i].GRD_CD;
            // html += '<td style=width:' +90/count+ '%;>'+'<input style="width: 100%; border: 3px #E8F1F9 solid;" type="text" id="GRD_WGHT" name="'+ grdCd +'"/>'+'</td>';
            html += '<td style="width:' + Math.floor(90 / count) + '%;">' +
                '<input style="width: 100%; border: 3px #E8F1F9 solid;" type="text" name="GRD_WGHT" id="' + grdCd + '" ' +
                'oninput="this.value = this.value.replace(/[^0-9]/g, \'\').replace(/\\d(?=(?:\\d{3})+$)/g, \'$&,\')"/>' +
                '</td>';
        }
        html += '</tr>';
        $("#searchBodyInfoBody").append(html);
    }
    /* End */

    /* header값 가져오기 */
    /*Start*/
    const fn_setGrdDsctnCol = async function() {
        let itemCd = SBUxMethod.get('srch-slt-itemCd');
        const param = {
            apcCd: gv_selectedApcCd
            , grdSeCd : '03'
            , itemCd : itemCd
        }
        jsonGrdColumnData.length = 0;
        try {
            const postJsonPromise = gfn_postJSON(
                "/am/sort/selectExhstDsctnCol.do",
                param,
                null,
                false
            );
            const data = await postJsonPromise;
            jsonGrdColumnData = data.resultList;
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }
    }
    /*End*/

    /* 품목/품종 변경 체크 및 변경 */
    /* Start */
    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(obj) {
        let itemCd = "";
        if(!gfn_isEmpty(obj)){
            itemCd = obj.value;
        }
        if(gfn_isEmpty(itemCd)){
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
            $("#searchHeadInfoBody").empty();
            $("#searchBodyInfoBody").empty();
            return;
        }
        let result = await Promise.all([
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd)			// 품종
        ]);
        fn_createTabelHeader();
    }

    /**
     * @name fn_onChangeSrchVrtyCd
     * @description 품종 선택 변경 event
     */
    const fn_onChangeSrchVrtyCd = async function(obj) {
        let vrtyCd = obj.value;
        const itemCd = vrtyCd.substring(0,4);

        if(!gfn_isEmpty(vrtyCd)){
            SBUxMethod.set("srch-slt-itemCd", itemCd);
            await fn_onChangeSrchItemCd({value: itemCd});
            SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
        }
    }
    /* End */


    /* 생산자 팝업 호출 필수 function  */
    /* Start */
    /**
     * @name fn_getPrdcrs
     * @description 생산자 리스트 호출
     */
    const fn_getPrdcrs = async function() {
        jsonPrdcr 		= await gfn_getPrdcrs(gv_selectedApcCd);
        jsonPrdcr 		= gfn_setFrst(jsonPrdcr);
    }

    /**
     * @name getByteLengthOfString
     * @description 글자 byte 크기 계산
     */
    const getByteLengthOfString = function (s, b, i, c) {
        for (b = i = 0; (c = s.charCodeAt(i++)); b += c >> 11 ? 3 : c >> 7 ? 2 : 1);
        return b;
    }
    /**
     * @name fn_onInputPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onInputPrdcrNm = function(prdcrNm){
        fn_clearPrdcr();
        if(getByteLengthOfString(prdcrNm.target.value) > 100){
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
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

        let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
        fn_setPrdcrForm(prdcr);
    }

    /**
     * @name fn_clearPrdcr
     * @description 생산자 폼 clear
     */
    const fn_clearPrdcr = function() {
        SBUxMethod.set("srch-inp-prdcrCd", "");
        SBUxMethod.set("srch-inp-prdcrIdentno", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
    }

    /**
     * @name fn_choicePrdcr
     * @description 생산자 선택 popup 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }

    /**
     * @name fn_setPrdcr
     * @description 생산자 선택 popup callback 처리
     */
    const fn_setPrdcr = async function(prdcr) {

        await fn_getPrdcrs();

        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

            fn_setPrdcrForm(prdcr);
        }
    }

    const fn_setPrdcrForm = async function(prdcr) {

        if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
            const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
            if (prvItemCd != prdcr.rprsItemCd) {
                SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
                await fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
            }
        }
        if (!gfn_isEmpty(prdcr.itemVrtyCd)) {	// 대표품종
            await gfn_setApcVrtySBSelect('srch-inp-vrtyCd', jsonApcVrty, gv_selectedApcCd);
            SBUxMethod.set("srch-slt-vrtyCd", prdcr.itemVrtyCd);
        }
        if (!gfn_isEmpty(prdcr.prdcrIdentno)) {
            SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
        } else {
            SBUxMethod.set("srch-inp-prdcrIdentno", "");
        }

    }

    const fn_onChangeSrchPrdcrIdentno = function(obj) {

        if (gfn_isEmpty(SBUxMethod.get("srch-inp-prdcrIdentno"))) {
            return;
        }

        SBUxMethod.set("srch-inp-prdcrCd", "");
        SBUxMethod.set("srch-inp-prdcrNm", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

        let prdcrIdentno = parseInt(SBUxMethod.get("srch-inp-prdcrIdentno")) || 0;

        if (prdcrIdentno < 1) {
            return;
        }

        const prdcrInfo = _.find(jsonPrdcr, {prdcrIdentno: prdcrIdentno});
        if (gfn_isEmpty(prdcrInfo)) {
            return;
        }else{
            prdcrInfo.itemVrtyCd = prdcrInfo.rprsItemCd + "" + prdcrInfo.rprsVrtyCd;
        }

        SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
        SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

        fn_setPrdcrForm(prdcrInfo);

    }
    /*
    * 조회조건 생산자 팝업 관련 function
    * End
    */

    /*초기화 버튼*/
    /*Start*/
    const fn_reset = function(){
        /*생산자 컴포넌트 초기화*/
        SBUxMethod.clear("srch-inp-prdcrCd");
        SBUxMethod.clear("srch-inp-prdcrNm");
        SBUxMethod.clear("srch-inp-prdcrIdentno");
        fn_clearPrdcr();

        /*입고일자 초기화*/
        SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
        /*수량/중량 초기화*/
        SBUxMethod.clear("srch-inp-wrhsQntt");
        SBUxMethod.clear("srch-inp-wrhsWght");
        /*선별기 초기화*/
        SBUxMethod.set("srch-slt-fcltCd", "");

        /*체크박스 고정여부*/
        let checkbox = document.getElementById('dtl-chk-itemFixed');
        let is_checked = checkbox.checked
        if(!is_checked){
            /*품목/품종, 육안선별 결과 컴포넌트 초기화*/

            SBUxMethod.set("srch-slt-itemCd", "");
            SBUxMethod.set("srch-slt-vrtyCd", "");
        }
    }
    /*End*/

    /*저장 버튼*/
    /*Start*/
    const fn_save = async function(){
        let jsonSrchData = [];

        let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");        // 생산자
        let itemCd = SBUxMethod.get("srch-slt-itemCd");         // 품목
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");         // 품종
        let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");       // 입고일자
        let fcltCd = SBUxMethod.get("srch-slt-fcltCd");         // 선별기
        let wrhsQntt = SBUxMethod.get("srch-inp-wrhsQntt");     // 박스 수량
        let wrhsWght = SBUxMethod.get("srch-inp-wrhsWght");     // 박스 중량
        let grdType1Wght = document.getElementById("GRD_TYPE_1").value;  // 열과
        let grdType2Wght = document.getElementById("GRD_TYPE_2").value;  // 폐기
        let rowSts = "I";

        if(flag === true){
            rowSts="U";
        }else{
            rowSts="I";
            bffaWrhsno="";
        }

        if(!gfn_isEmpty(vrtyCd)){
            vrtyCd = vrtyCd.substring(4,8);
        }
        if(gfn_isEmpty(prdcrCd)){
            gfn_comAlert("W0001", "생산자");
            return;
        }
        if(gfn_isEmpty(itemCd)){
            gfn_comAlert("W0001", "품목");
            return;
        }
        if(gfn_isEmpty(vrtyCd)){
            gfn_comAlert("W0001", "품종");
            return;
        }
        if(gfn_isEmpty(wrhsYmd)){
            gfn_comAlert("W0001", "입고일자");
            return;
        }
        if(gfn_isEmpty(fcltCd)){
            gfn_comAlert("W0001", "선별기");
            return;
        }
        if(gfn_isEmpty(wrhsQntt)){
            wrhsQntt = 0;
        }
        if(gfn_isEmpty(wrhsWght)){
            wrhsWght = 0;
        }

        // 검색조건에 있는 값 json에 입력
        jsonSrchData.push({
              apcCd: gv_selectedApcCd
            , bffaWrhsno: bffaWrhsno
            , prdcrCd:prdcrCd
            , itemCd:itemCd
            , vrtyCd:vrtyCd
            , wrhsYmd:wrhsYmd
            , fcltCd:fcltCd
            , wrhsQntt:wrhsQntt
            , wrhsWght:wrhsWght
            , grdType1Wght:grdType1Wght
            , grdType2Wght:grdType2Wght
            // 조회에서 받아서 같이 바꿔주기
            , rowSts:rowSts
            , grdKnd:"03"
        });
        // 윤안선별 결과 데이터
        let grdWghtInputs = document.querySelectorAll('[name="GRD_WGHT"]');
        let grdData = [];
        let count = 0;
        grdWghtInputs.forEach(input => {
            let value = input.value.replace(/,/g, ''); // 쉼표 제거
            let name = input.getAttribute("id"); // id 속성 값 가져오기
            // value가 0 인지 검사, rowSts 조회에서 바꿔주기 조회에서 false 나오면 I ture 나오면 U , 업데이트일때는 BFFA_WRHSNO 값을 같이 박아주기

            grdData[count] = {grdWght:value,rowSts:rowSts, grdCd:name, "grdKnd":"03", apcCd:gv_selectedApcCd, itemCd:itemCd, bffaWrhsno:bffaWrhsno};

            count++;
        });
        let allDataList = [];
        allDataList.push({apcCd:gv_selectedApcCd,ymd:wrhsYmd,rowSts:rowSts,'sortBffaVOList':jsonSrchData, 'wrhsSortGrdList':grdData});
        try {
            const postJsonPromise = gfn_postJSON("/am/sort/insertSortBffaSpt.do", allDataList);
            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                fn_search();
            } else {
                gfn_comAlert(data.resultCode, data.resultMessage);	//	E0001	오류가 발생하였습니다.
            }
        } catch(e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }

    }
    /*End*/

    /*조회 버튼*/
    /*Start*/
    const fn_search = async function (){
        let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");
        let itemCd = SBUxMethod.get("srch-slt-itemCd");
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");
        let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");
        let fcltCd = SBUxMethod.get("srch-slt-fcltCd");

        if(!gfn_isEmpty(vrtyCd)){
            vrtyCd = vrtyCd.substring(4,8);
        }
        if(gfn_isEmpty(prdcrCd)){
            gfn_comAlert("W0001", "생산자");
            return;
        }
        if(gfn_isEmpty(itemCd)){
            gfn_comAlert("W0001", "품목");
            return;
        }
        if(gfn_isEmpty(vrtyCd)){
            gfn_comAlert("W0001", "품종");
            return;
        }
        if(gfn_isEmpty(wrhsYmd)){
            gfn_comAlert("W0001", "입고일자");
            return;
        }
        if(gfn_isEmpty(fcltCd)){
            gfn_comAlert("W0001", "선별기");
            return;
        }

        const postJsonPromise = gfn_postJSON("/am/sort/selectSortBffaSpt.do", {
              apcCd: gv_selectedApcCd
            , prdcrCd: prdcrCd
            , itemCd: itemCd
            , vrtyCd: vrtyCd
            , wrhsYmd: wrhsYmd
            , fcltCd: fcltCd
        });

        const data = await postJsonPromise;
        try {
            if (_.isEqual("S", data.resultStatus)) {
                /** @type {number} **/
                if(gfn_isEmpty(data.resultList)){flag=false; bffaWrhsno="";}
                else{flag=true;bffaWrhsno="";}
                let totalRecordCount = 0;

                jsonSearchData.length = 0;
                bffaWrhsno = data.resultList.bffaWrhsno;
                let fcltCd = data.resultList.fcltCd;
                let grdCd1 = data.resultList.grdCd1;
                let grdCd2 = data.resultList.grdCd2;
                let grdCd3 = data.resultList.grdCd3;
                let grdCd4 = data.resultList.grdCd4;
                let grdCd5 = data.resultList.grdCd5;
                let grdCd6 = data.resultList.grdCd6;
                let grdCd7 = data.resultList.grdCd7;
                let grdCd8 = data.resultList.grdCd8;
                let grdCd9 = data.resultList.grdCd9;
                let grdCd10 = data.resultList.grdCd10;
                let grdCd11 = data.resultList.grdCd11;
                let grdCd12 = data.resultList.grdCd12;
                let grdCd13 = data.resultList.grdCd13;
                let grdCd14 = data.resultList.grdCd14;
                let grdCd15 = data.resultList.grdCd15;
                let grdCd16 = data.resultList.grdCd16;
                let grdCd17 = data.resultList.grdCd17;
                let grdCd18 = data.resultList.grdCd18;
                let grdCd19 = data.resultList.grdCd19;
                let grdCd20 = data.resultList.grdCd20;
                let grdType1Wght = data.resultList.grdType1Wght;
                let grdType2Wght = data.resultList.grdType2Wght;
                let grdWrht1 = data.resultList.grdWrht1;
                let grdWrht2 = data.resultList.grdWrht2;
                let grdWrht3 = data.resultList.grdWrht3;
                let grdWrht4 = data.resultList.grdWrht4;
                let grdWrht5 = data.resultList.grdWrht5;
                let grdWrht6 = data.resultList.grdWrht6;
                let grdWrht7 = data.resultList.grdWrht7;
                let grdWrht8 = data.resultList.grdWrht8;
                let grdWrht9 = data.resultList.grdWrht9;
                let grdWrht10 = data.resultList.grdWrht10;
                let grdWrht11 = data.resultList.grdWrht11;
                let grdWrht12 = data.resultList.grdWrht12;
                let grdWrht13 = data.resultList.grdWrht13;
                let grdWrht14 = data.resultList.grdWrht14;
                let grdWrht15 = data.resultList.grdWrht15;
                let grdWrht16 = data.resultList.grdWrht16;
                let grdWrht17 = data.resultList.grdWrht17;
                let grdWrht18 = data.resultList.grdWrht18;
                let grdWrht19 = data.resultList.grdWrht19;
                let grdWrht20 = data.resultList.grdWrht20;
                let itemCd = data.resultList.itemCd;
                let prdcrCd = data.resultList.prdcrCd;
                let wrhsQntt = data.resultList.wrhsQntt;
                let wrhsWght = data.resultList.wrhsWght;
                let wrhsYmd = data.resultList.wrhsYmd;

                SBUxMethod.set("srch-inp-wrhsQntt", wrhsQntt);
                SBUxMethod.set("srch-inp-wrhsWght", wrhsWght);
                $("#GRD_TYPE_1").val(grdType1Wght);
                $("#GRD_TYPE_2").val(grdType2Wght);

                let searchGrdCd1DataActl1 = [];
                for(let i=1; i<=jsonGrdColumnData.length; i++){
                    let grdCdKey = 'grdCd'+i;
                    let grdWghtKey = 'grdWrht'+i;
                    if(!gfn_isEmpty(data.resultList[grdCdKey])){
                        searchGrdCd1DataActl1.push({"grdCd":data.resultList[grdCdKey], "grdWght":data.resultList[grdWghtKey]});
                    }
                }
                await fn_setSearchData(searchGrdCd1DataActl1);
                totalRecordCount = jsonSearchData.length;
            } else {
                return;
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
        }
    }

    /*End*/

    const fn_setSearchData = async function(data){
        if(gfn_isEmpty(data)){
            flag = true;
            return;
        }
        for(let i=0; i<=data.length;i++){
            $("#"+data[i].grdCd).val(data[i].grdWght);
        }
        flag = false;
    }

    const fn_delete = async function (){
        let apcCd = gv_selectedApcCd;
        let itemCd = SBUxMethod.get("srch-slt-itemCd");
        let grdKnd = "03";

        if(gfn_isEmpty(bffaWrhsno)){
            gfn_comAlert("W0005", "삭제대상");
            return;
        }

        if (gfn_comConfirm("Q0001", "삭제")) {		//	Q0001	{0} 하시겠습니까?

            const postJsonPromise = gfn_postJSON("/am/sort/deleteSortBffaSpt.do", {
                  apcCd
                , itemCd
                , grdKnd
                , bffaWrhsno
            });
            const data = await postJsonPromise;

            try {
                if (_.isEqual("S", data.resultStatus)) {
                    gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                    // fn_search();
                    flag=false;
                    fn_reset();
                } else {
                    gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
                }
            } catch (e) {
                if (!(e instanceof Error)) {
                    e = new Error(e);
                }
                console.error("failed", e.message);
                gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
            }
        }
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>