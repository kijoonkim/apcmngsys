<%
    /**
     * @Class Name : rawMtrWrhsRegMbl.jsp
     * @Description : 원물입고 실적등록 모바일 화면(상주원예전용)
     * @author SI개발부
     * @since 2024.09.03
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일       	수정자      	수정내용
     * @ ----------	----------	---------------------------
     * @ 2024.09.03   	손민성	    최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 원물입고등록(모바일)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
    <%@ include file="../../../frame/inc/clipreport.jsp" %>

    <style>

        .col-hd {
            background-color: #e8f1f9;
        }

        .th-mbl {
            text-align: right;
            font-weight: bold;
            font-size: 28px;
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .inpt-mbl {
        //padding: 8px;
            height: 50px;
            font-size: 28px;
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

        . chk-mbl input, label {
            vertical-align: bottom;
        }

        .fs-30 {
            font-size: 30px;
        }
        #latestInfo > table > thead > tr >th{
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
            font-size: 28px;
            padding: 8px;
            line-height: 1.42857143;
            border: 1px solid #ddd;
            border-top: 1px solid #f4f4f4;
            vertical-align: middle;
        }
        input:focus{
            border:1px solid red;
        }

        #latestInfoBody > tr > td {
            -webkit-text-size-adjust: 100%;
            -webkit-tap-highlight-color: rgba(0,0,0,0);
            color: #333;
            font-weight: 400;
            font-family: Notokr, Apple SD Gothic Neo, Arial, Tahoma, sans-serif;
            border-spacing: 0;
            border-collapse: collapse;
            box-sizing: border-box;
            margin: 0;
            font-size: 28px;
            text-align: center;
            word-wrap: break-word;
            border-color: #e8f1f9 !important;
            padding: 3px !important;
            line-height: 1.42857143;
            border: 1px solid #f4f4f4;
            vertical-align: middle;
            border-right: hidden;
        }
        li.sbux-ui-menu-item{
            font-size: x-large;
        }

    </style>

</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 원물입고등록 태블릿 -->
            </div>
        </div>
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div style="margin-right: auto;">

                <sbux-button
                        id="btnCmndDocPckg"
                        name="btnCmndDocPckg"
                        uitype="normal"
                        class="btn btn-sm btn-primary btn-mbl"
                        onclick="fn_report"
                        text="리포트 발행"
                        disabled
                ></sbux-button>
                <sbux-button
                        id="btnReset"
                        name="btnReset"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger btn-mbl"
                        onclick="fn_reset"
                        text="초기화"
                ></sbux-button>
                <sbux-button
                        id="btnAdd"
                        name="btnAdd"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger btn-mbl"
                        onclick="fn_add"
                        text="확인"
                ></sbux-button>
                <sbux-button
                        id="btnSave"
                        name="btnSave"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger btn-mbl"
                        onclick="fn_save"
                        text="저장"
                ></sbux-button>
                <sbux-button
                        id="btnClose"
                        name="btnClose"
                        uitype="normal"
                        text="종료"
                        class="btn btn-sm btn-outline-danger btn-mbl"
                        onclick="fn_close"
                ></sbux-button>
                <div style="float:right;margin-left:10px;">
                    <p class="ad_input_row chk-mbl" style="vertical-align:middle;">
                        <input style="width:20px;height:20px;" type="checkbox" id="srch-chk-autoPrint" name="srch-chk-autoPrint" checked />
                        <label for="srch-chk-autoPrint">자동출력</label>
                        <input style="width:20px;height:20px;" type="checkbox" id="srch-chk-exePrint" name="srch-chk-exePrint" />
                        <label for="srch-chk-exePrint">미리보기</label>
                    </p>
                </div>
            </div>
        </div>
        <div class="box-body">
            <!--[APC] START -->
            <!--[APC] END -->
            <!--[pp] 검색 -->

            <table id="saveTable" class="table table-bordered tbl_fixed tbl_mbl">
                <caption>검색 조건 설정</caption>
                <colgroup>
                    <col style="width: 20%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row" class="th_bg th-mbl"><span class="data_required"></span>생산자</th>
                    <td class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="srch-inp-prdcrIdentno"
                                name="srch-inp-prdcrIdentno"
                                class="inpt-mbl"
                                maxlength="2"
                                autocomplete="off"
                                onchange="fn_onChangeSrchPrdcrIdentno(this)">
                        </sbux-input>
                    </td>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-input
                                uitype="text"
                                id="srch-inp-prdcrNm"
                                name="srch-inp-prdcrNm"
                                class="input-sm-ast inpt_data_reqed inpt-mbl"
                                placeholder="초성검색 가능"
                                autocomplete-ref="jsonPrdcrAutocomplete"
                                autocomplete-text="name"
                                autocomplete-height="270px"
                                oninput="fn_onInputPrdcrNm(event)"
                                autocomplete-select-callback="fn_onSelectPrdcrNm"
                        ></sbux-input>
                        <sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                        <sbux-button
                                id="btn-srch-prdcr"
                                name="btn-srch-prdcr"
                                class="btn btn-xs btn-outline-dark btn-mbl"
                                text="찾기" uitype="modal"
                                target-id="modal-prdcr"
                                onclick="fn_choicePrdcr"
                        ></sbux-button>
                    </td>
                    <td colspan="3" style="border-left: hidden;">
                        <sbux-input uitype="hidden" id="srch-inp-wrhsno" name="srch-inp-wrhsno"></sbux-input>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl"><span class="data_required"></span>품목/품종</th>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                        <sbux-select
                                id="srch-slt-itemCd"
                                name="srch-slt-itemCd"
                                uitype="single"
                                jsondata-ref="jsonApcItem"
                                unselected-text="전체"
                                class="input-sm-ast inpt_data_reqed inpt-mbl"
<%--                                onchange="fn_onChangeSrchItemCd(this)"--%>
                        ></sbux-select>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                        <sbux-select
                                id="srch-slt-vrtyCd"
                                name="srch-slt-vrtyCd"
                                uitype="single"
                                jsondata-ref="jsonApcVrty"
                                jsondata-value="itemVrtyCd"
                                unselected-text="선택"
                                class="input-sm-ast inpt_data_reqed inpt-mbl"
                                onchange="fn_onChangeSrchVrtyCd(this)"
                        ></sbux-select>
                    </td>
                    <td colspan="2"class="td_input" style="border-right: hidden;">
                        <p class="ad_input_row chk-mbl" style="vertical-align:middle;">
                            <input
                                    style="width:20px;height:20px;"
                                    type="checkbox"
                                    id="filterVrtyCd"
                                    onchange="fn_filterVrtyList()"
                                    checked
                            />
                            <label for="filterVrtyCd">기존등록</label>
                        </p>
                    </td>
                    <td colspan="2" style="border-left: hidden;">

                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl"><span class="data_required"></span>입고일자</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-datepicker
                                uitype="popup"
                                id="srch-dtp-wrhsYmd"
                                name="srch-dtp-wrhsYmd"
                                date-format="yyyy-mm-dd"
                                class="pull-right sbux-pik-group-apc inpt-mbl inpt_data_reqed input-sm-ast"
                                style="width:100%;">
                        </sbux-datepicker>
                    </td>
                    <td colspan="5" style="border-left: hidden;">&nbsp;</td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl"><span class="data_required"></span>규격/수량</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <div style="display: flex; gap: 10px">
                            <sbux-select
                                    uitype="single"
                                    id="srch-slt-spcfctCd"
                                    name="srch-slt-spcfctCd"
                                    unselected-text="선택"
                                    class="input-sm-ast inpt_data_reqed inpt-mbl"
                                    jsondata-ref="jsonSpcfctCd">
                            </sbux-select>
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-bxQntt"
                                    name="srch-inp-bxQntt"
                                    class="inpt-mbl"
                                    autocomplete="off">
                            </sbux-input>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl"><span class="data_required"></span>입고창고</th>
                    <td colspan="4" class="td_input" style="border-right: hidden;">
                        <sbux-select
                                uitype="single"
                                id="srch-slt-warehouseSeCd"
                                name="srch-slt-warehouseSeCd"
                                unselected-text="선택"
                                class="input-sm-ast inpt_data_reqed inpt-mbl"
                                jsondata-ref="jsonComWarehouse">
                        </sbux-select>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                        <p class="ad_input_row chk-mbl" style="vertical-align:middle;">
                            <input
                                    style="width:20px;height:20px;"
                                    type="checkbox"
                                    id="warehouseSeCdChk"
                                    checked
                            />
                            <label for="warehouseSeCdChk">고정</label>
                        </p>
                    </td>
                    <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">검수자</th>
                    <td class="td_input" colspan="8">
                        <div style="display: flex;">
                            <sbux-select
                                    id="srch-slt-chckr"
                                    name="srch-slt-chckr"
                                    uitype="single"
                                    wrap-style="flex-basis:40%"
                                    jsondata-ref="jsonJobClsf"
                                    unselected-text="전체"
                                    jsondata-text="flnm"
                                    jsondata-value="flnm"
                                    class="input-sm-ast inpt_data_reqed inpt-mbl"
                            ></sbux-select>
                            <p class="ad_input_row chk-mbl" style="vertical-align:middle;">
                                <input
                                        style="width:20px;height:20px;"
                                        type="checkbox"
                                        id="chckrChk"
                                        checked
                                />
                                <label for="chckrChk">고정</label>
                            </p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">팔레트번호</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-input uitype="text" id="srch-inp-pltno" name="srch-inp-pltno" class="inpt-mbl dsp-wght" readonly></sbux-input>
                    </td>
                    <td colspan="5"></td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="box-body" id="latestInfo">
            <table class="table table-bordered tbl_fixed tbl_mbl">
                <colgroup>
                    <col style="width: 6%">
                    <col style="width: 10%">
                    <col style="width: 20%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 5%">
                    <col style="width: 10%">
                    <col style="width: 19%">
                </colgroup>
                <thead>
                <tr>
                    <th>처리</th>
                    <th>생산자</th>
                    <th>팔레트 번호</th>
                    <th>품목/품종</th>
                    <th>규격</th>
                    <th>수량</th>
                    <th>입고일자</th>
                    <th>등록일시</th>
                </tr>
                </thead>
                <tbody id="latestInfoBody">
                </tbody>

            </table>
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
<!-- clip report direct print area  -->
<div id="div-rpt-clipReportPrint" style="display:none;"></div>
</body>
<script type="text/javascript">

    var jsonApcItem			= [];	// 품목 		itemCd		검색
    var jsonApcVrty			= [];	// 품종 		vrtyCd		검색
    var jsonApcVrtyTemp		= [];	// 품종temp 	vrtyCd		검색
    var jsonApcGrd			= [];	// 등급 		vrtyCd		검색
    var jsonComWarehouse	= [];	// 창고 		warehouse	검색
    var jsonApcBx			= [];	// 팔레트/박스 	검색
    var jsonSpcfctCd        = [];   // 규격
    var jsonJobClsf         = [];   // 검수자

    var jsonComWrhsSeCd		= [];	// 입고구분		WRHS_SE_CD
    var jsonComGdsSeCd		= [];	// 상품구분		GDS_SE_CD
    var jsonComTrsprtSeCd	= [];	// 운송구분		TRSPRT_SE_CD

    /* 생산자 자동완성 */
    var jsonPrdcr				= [];
    var jsonPrdcrAutocomplete 	= [];

    /* SBGrid */
    var grdRawMtrWrhs;
    /* SBGrid Data (JSON) */
    var jsonRawMtrWrhs = [];

    /*최근조회 데이터List*/
    var RawMtrWrhsLatestInfoList = [];
    var PrdcrLatestInfo = [];
    var rawMtrWrhs = [];

    /** save Json **/
    var jsonSave = [];

    // only document
    window.addEventListener('DOMContentLoaded', function(e) {
        document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
            el.style.width = "50px";
            el.style.height = "50px";
        });
        document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
            el.style.fontSize = "24px";
        });
        fn_init();
    });

    /**
     * @name fn_init
     * @description form init
     */
    const fn_init = async function() {
        SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
        let result = await Promise.all([
            fn_initSBSelect(),
            fn_getPrdcrs(),
            // fn_searchWrhsPrfmncList(),
        ]);
    }

    const fn_searchWrhsPrfmncList = async function(){
        let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");
        let postUrl = "/am/wrhs/selectRawMtrWrhsPrfmncList.do";
        const postJsonPromise = gfn_postJSON(postUrl, {
            apcCd: gv_selectedApcCd,
            wrhsYmdFrom: wrhsYmd,
            wrhsYmdTo: wrhsYmd,
            // invntrYn: 'Y'
        });

        const data = await postJsonPromise;

        if (_.isEqual("S", data.resultStatus)) {
            await fn_setSaveTable(data.resultList);
            return;
        }
    }

    /**
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {
        let postJsonPromise;
        let postUrl ="/am/wrhs/insertRawMtrWrhsList.do";

        /** vrtyCd 포맷 **/
        jsonSave.forEach(function(item,idx){
            jsonSave[idx].vrtyCd = item.vrtyCd.slice(4,8);
            jsonSave[idx].wrhsQntt = item.bxQntt;
            jsonSave[idx].wrhsWght = item.wght * parseInt(item.bxQntt);
        });

        postJsonPromise = gfn_postJSON(postUrl, jsonSave);
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                data.returnList.forEach(function(item,index){
                    const idx = jsonSave.findIndex(obj =>
                        obj.prdcrNm === item.prdcrNm && obj.itemCd === item.itemCd && obj.vrtyCd === item.vrtyCd && obj.wrhsYmd === item.wrhsYmd
                    );
                    jsonSave[idx].pltno = item.pltno;
                    jsonSave[idx].wrhsno = item.wrhsno;
                    updateCell(idx,2,item.pltno);
                });
                if(!gfn_isEmpty(jsonSave[0].wrhsno)){
                    SBUxMethod.attr("btnCmndDocPckg","disabled","false");
                }
                // await fn_autoPrint(jsonSave);
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

    /**
     * 조회 조건 select combo 설정
     */
    const fn_initSBSelect = async function() {
        // 검색 SB select
        let rst = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-warehouseSeCd', jsonComWarehouse, 'WAREHOUSE_SE_CD', gv_selectedApcCd),			// 창고
            gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, gv_selectedApcCd),	// 품목
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd),	// 품종
            gfn_postJSON("/am/oprtr/selectOprtrList.do",{apcCd:gv_selectedApcCd,jobClsfCd:12}),
        ]);
        let oprtrData = rst[3];
        if(oprtrData.resultStatus === 'S'){
            jsonJobClsf = oprtrData.resultList;
            SBUxMethod.refresh("srch-slt-chckr");
        }
    }
    /**
     * @name fn_docRawMtrWrhs
     * @description 원물확인서 발행 버튼
     */
    const fn_docRawMtrWrhs = function() {
        const wrhsno = SBUxMethod.get("srch-inp-wrhsno");
        if(wrhsno === ""){
            alert("팔레트번호를 선택해주세요");
            return;
        }
        let printData = {wrhsno : wrhsno};
        fn_autoPrint(printData);
        //gfn_popClipReport("원물인식표", "am/rawMtrIdntyDoc.crf", {apcCd: gv_selectedApcCd, wrhsno: wrhsno});
    }

    /**
     * @name fn_reset
     * @description 초기화 버튼
     */
    const fn_reset = function() {
        fn_clearForm();
    }


    /**
     * @name fn_autoPrint
     * @description 자동 리포트발행
     */
    const fn_autoPrint = async function(resultMap){
        const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'RT_DOC');
        const pltno = resultMap.map(item => item.pltno).join(',');
        if(document.querySelector('#srch-chk-autoPrint').checked){
            if(!document.querySelector('#srch-chk-exePrint').checked){
                gfn_exeDirectPrint(rptUrl, {apcCd: gv_selectedApcCd, wrhsno: pltno,element : 'div-rpt-clipReportPrint'});
            }else{
                gfn_DirectPrintClipReport(rptUrl, {apcCd: gv_selectedApcCd, wrhsno: pltno,element : 'div-rpt-clipReportPrint'});
            }
        }else{
            gfn_popClipReport("원물인식표", rptUrl, {apcCd: gv_selectedApcCd, wrhsno: pltno});
        }

        //gfn_popClipReport("원물인식표", "am/rawMtrIdntyDoc.crf", {apcCd: gv_selectedApcCd, wrhsno: resultMap.wrhsno});
    }

    /**
     * @name fn_search
     * @description 조회 버튼
     */
    const fn_search = async function() {

        if (gfn_isEmpty(SBUxMethod.get("srch-dtp-wrhsYmd"))) {
            gfn_comAlert("W0001", "입고일자");		//	W0002	{0}을/를 입력하세요.
            return;
        }

        var getColRef = grdRawMtrWrhs.getColRef("checkedYn");
        grdRawMtrWrhs.setFixedcellcheckboxChecked(0, getColRef, false);

        // grid clear
        jsonRawMtrWrhs.length = 0;
        fn_setGrdRawMtrWrhs();
    }

    /** ui event */

    const fn_onChangeApc = async function() {
        fn_init();
    }

    /**
     * @name fn_getPrdcrs
     * @description 생산자 자동완성 JSON 설정
     */
    const fn_getPrdcrs = async function() {
        jsonPrdcr = await gfn_getPrdcrs(gv_selectedApcCd);
        jsonPrdcr = gfn_setFrst(jsonPrdcr);
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
        // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
        if(jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
            document.getElementById('btn-srch-prdcr').click();
        } else{
            SBUxMethod.set("srch-inp-prdcrCd", value);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
            let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
            SBUxMethod.set("srch-inp-prdcrIdentno",prdcr.prdcrIdentno);
            prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;
            /** 생산자 변경시 원복 **/
            if(!gfn_isEmpty(jsonApcVrtyTemp)) {
                jsonApcVrty = [...jsonApcVrtyTemp];
            }
            fn_filterVrtyList();
        }
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
        SBUxMethod.set("srch-inp-wrhsno", "");
        await fn_getPrdcrs();

        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);
            SBUxMethod.set("srch-inp-prdcrIdentno", prdcr.prdcrIdentno);
            // SBUxMethod.set("srch-inp-bxQntt", "");
            $("#srch-inp-bxQntt").val("");
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

            /** 생산자 변경시 원복 **/
            if(!gfn_isEmpty(jsonApcVrtyTemp)){
                jsonApcVrty = [...jsonApcVrtyTemp];
                SBUxMethod.refresh('srch-slt-vrtyCd');
                SBUxMethod.set("srch-slt-itemCd", '');
            }
            await fn_filterVrtyList();
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
        }

        SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
        SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

         /** 생산자 변경시 원복 **/
         if(!gfn_isEmpty(jsonApcVrtyTemp)) {
             jsonApcVrty = [...jsonApcVrtyTemp];
         }
         fn_filterVrtyList();
    }


    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(obj) {
        let itemCd = obj.value;

        let result = await Promise.all([
            gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonSpcfctCd,gv_selectedApcCd,itemCd),			// 품종
        ]);

        if (gfn_isEmpty(itemCd)) {
            SBUxMethod.set("srch-inp-wghtAvg", "");
        }
    }

    /**
     * @name fn_onChangeSrchVrtyCd
     * @description 품종 선택 변경 event
     */
    const fn_onChangeSrchVrtyCd = async function(obj) {
        let vrtyCd = obj.value;
        let itemCd = "";
        const vrtyInfo = _.find(jsonApcVrty, {itemVrtyCd: vrtyCd});

        if (!gfn_isEmpty(vrtyCd)) {
            itemCd = vrtyInfo.mastervalue;
        } else {
            itemCd = SBUxMethod.get("srch-slt-itemCd");
            SBUxMethod.set("srch-inp-wghtAvg", "");
            fn_onChangeWghtAvg();
        }

        const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
        if (itemCd != prvItemCd) {
            SBUxMethod.set("srch-slt-itemCd", itemCd);
            gfn_setApcSpcfctsSBSelect('srch-slt-spcfctCd', jsonSpcfctCd,gv_selectedApcCd,itemCd),			// 품종
            SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
        }
        const wghtRkngSeCd = vrtyInfo.wghtRkngSeCd;
        const unitWght = parseInt(vrtyInfo.unitWght) || 0;
        SBUxMethod.set("srch-inp-wghtAvg", unitWght);
        fn_onChangeWghtAvg();
    }
    const fn_numberFmt = function(obj){
        let $obj = "#" + obj.id;
        let $origin = "#" + obj.id.substr(1);

        $($obj).hide();
        $($origin).show();
        $($origin).focus();
    }

    const fn_onChangeBxQntt = function(obj) {
        // let bxQntt = parseInt(SBUxMethod.get("srch-inp-bxQntt")) || 0;
        let bxQntt = parseInt($("#srch-inp-bxQntt").val()) || 0;
        let wghtAvg = parseInt(SBUxMethod.get("srch-inp-wghtAvg")) || 0;

        if (wghtAvg > 0) {
            let wrhsWght = Math.round(bxQntt * wghtAvg);
            // SBUxMethod.set("srch-inp-wrhsWght", wrhsWght);
            $("#srch-inp-wrhsWght").val(wrhsWght);
            $("#_srch-inp-wrhsWght").val(wrhsWght.toLocaleString('ko-KR'));
            $("#srch-inp-bxQntt").hide();
            // $("#_srch-inp-bxQntt").val(parseInt($("#srch-inp-bxQntt").val()).toLocaleString('ko-KR'));
            // $("#_srch-inp-bxQntt").show();
        }
    }

    const fn_onChangeWghtAvg = function(obj) {

        // let bxQntt = parseInt(SBUxMethod.get("srch-inp-bxQntt")) || 0;
        let bxQntt = parseInt($("#srch-inp-bxQntt").val()) || 0;
        let wghtAvg = parseInt(SBUxMethod.get("srch-inp-wghtAvg")) || 0;

        if (wghtAvg > 0) {
            let wrhsWght = Math.round(bxQntt * wghtAvg);
            // SBUxMethod.set("srch-inp-wrhsWght", wrhsWght);
            $("#srch-inp-wrhsWght").val(wrhsWght);
        }
    }

    const fn_onChangeWrhsWght = function(obj) {
        $("#srch-inp-wrhsWght").hide();
        $("#_srch-inp-wrhsWght").val(parseInt($("#srch-inp-wrhsWght").val()).toLocaleString('ko-KR'));
        $("#_srch-inp-wrhsWght").show();
    }

    /**
     * @name fn_setGrdRawMtrWrhs
     * @description 입고내역 조회
     */
    const fn_setGrdRawMtrWrhs = async function() {
        let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");	// 입고일자
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");	// 품종

        const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsList.do", {
            apcCd: gv_selectedApcCd,
            wrhsYmd: wrhsYmd,
            vrtyCd: vrtyCd
        });

        const data = await postJsonPromise;

        try {
            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }

            /** @type {number} **/
            let totalRecordCount = 0;

            jsonRawMtrWrhs.length = 0;
            data.resultList.forEach((item, index) => {
                const rawMtrWrhs = {
                    rowSeq: item.rowSeq,
                    apcCd: item.apcCd,
                    apcNm: item.apcNm,
                    wrhsno: item.wrhsno,
                    wghno: item.wghno,
                    pltno: item.pltno,
                    wrhsYmd: item.wrhsYmd,
                    prdcrCd: item.prdcrCd,
                    prdcrNm: item.prdcrNm,
                    itemCd: item.itemCd,
                    itemNm: item.itemNm,
                    vrtyCd: item.vrtyCd,
                    vrtyNm: item.vrtyNm,
                    gdsSeCd: item.gdsSeCd,
                    gdsSeNm: item.gdsSeNm,
                    wrhsSeCd: item.wrhsSeCd,
                    wrhsSeNm: item.wrhsSeNm,
                    trsprtSeCd: item.trsprtSeCd,
                    trsprtSeNm: item.trsprtSeNm,
                    grdCd: item.grdCd,
                    grdNm: item.grdNm,
                    vhclno: item.vhclno,
                    bxQntt: item.bxQntt,
                    wrhsWght: item.wrhsWght,
                    bxKnd: item.bxKnd,
                    bxKndNm: item.bxKndNm,
                    warehouseSeCd: item.warehouseSeCd,
                    warehouseSeNm: item.warehouseSeNm,
                    prdctnYr: item.prdctnYr,
                    rmrk: item.rmrk,
                    stdGrd: item.stdGrd,
                    stdGrdCd: item.stdGrdCd,
                }
                jsonRawMtrWrhs.push(rawMtrWrhs);
            });
            totalRecordCount = jsonRawMtrWrhs.length;

            grdRawMtrWrhs.rebuild();
            document.querySelector('#cnt-wrhs').innerText = totalRecordCount;
            SBUxMethod.set("crtr-ymd", wrhsYmd);

        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }

    const fn_inputClear = function() {
        // 수량
        // SBUxMethod.set("srch-inp-wrhsQntt", "");
        // // 중량
        // SBUxMethod.set("srch-inp-wrhsWght", "");
        $("#srch-inp-wrhsQntt").val("")
        $("#srch-inp-wrhsWght").val("")
        // 평균
        SBUxMethod.set("srch-inp-wghtAvg", "");
    }

    /**
     * @name fn_clearForm
     * @description form 초기화
     * @function
     */
    const fn_clearForm = function() {
        $("#latestInfoBody").empty();
        jsonSave.length = 0;

        let table = document.getElementById("saveTable");
        let elements = table.querySelectorAll('[id^="srch-"]');
        elements = Array.from(elements);

        for(let element of elements){
            let key = element.id.split('-').pop();
            let chk = '#' + key + 'Chk';
            if(!$(chk).prop('checked')){
                SBUxMethod.set(element.id,"");
            }
        }
        document.querySelectorAll(".sbux-pik-icon-btn").forEach((el) => {
            el.style.width = "50px";
            el.style.height = "50px";
        });
        document.querySelectorAll(".sbux-pik-icon").forEach((el) => {
            el.style.fontSize = "24px";
        });

        SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
        SBUxMethod.attr("srch-slt-itemCd","readonly","false");
        SBUxMethod.attr("srch-slt-vrtyCd","readonly","false");
        SBUxMethod.attr("srch-slt-spcfctCd","readonly","false");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:#FFF8DC");
    }

    const fn_close = function(){
        parent.gfn_tabClose("TAB_AM_001_008");
    }

    function updateCell(rowIndex, cellIndex, newValue){
        const $tbody = $("#latestInfoBody");

        // 해당 행(rowIndex)와 셀(cellIndex)에 접근하여 값 변경
        const $targetCell = $tbody.find("tr").eq(rowIndex).find("td").eq(cellIndex);

        if ($targetCell.length) {
            $targetCell.text(newValue); // 값 업데이트
        } else {
            console.error("해당 행 또는 셀 인덱스가 유효하지 않습니다.");
        }
    }
    /**
     * @name fn_setLatestInfo
     * @description jsonSave를 테이블에 append
     * @function
     */
    const fn_setSaveTable = async function(item){

        function getTime(){
            const now = new Date();
            const options = {
                year: 'numeric',
                month: '2-digit',
                day: '2-digit',
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
                hour12: false, // 24시간 형식 사용
            };
            const date = now.toLocaleString('ko-KR', options)
                .replace(/\.\s*/g, '')
                .replace(/(\d{8})(\d{2}:\d{2}:\d{2})/, '$1 $2');
            return date;
        }
        function addRow(item){
            const formattedDate = getTime();
            let el = `
           <tr onclick="selectLatestInfo(this)">
            <td>
                <input  type="button" value="삭제" onclick="fn_deleteRow(this, event)" class="btn-primary btn btn-mbl">
            </td>
            <td>
                ${'${item.prdcrNm}'}
            </td>
             <td>
                ${'${item.wrhsno || ""}'}
            </td>
             <td>
                ${'${item.itemNm}'}${'${item.vrtyNm ? "/" + item.vrtyNm :""}'}
            </td>
             <td>
                ${'${item.spcfctNm}'}
            </td>
             <td>
                ${'${item.bxQntt}'}
            </td>
             <td>
                ${'${item.wrhsYmd}'}
            </td>
             <td>
                ${'${formattedDate}'}
            </td>
           </tr>
           `
            $("#latestInfoBody").append(el);
            item.regDt = formattedDate;
            jsonSave.push(item);
        }

        /** 기존데이터에 있을시 confirm **/
        const idx = jsonSave.findIndex(obj =>
            obj.prdcrNm === item.prdcrNm && obj.itemNm === item.itemNm
            && obj.vrtyNm === item.vrtyNm && obj.wrhsYmd === item.wrhsYmd
            && obj.spcfctCd === item.spcfctCd
        );
        if(idx !== -1){
            if(gfn_comConfirm("Q0002","등록내역","추가")){
                let pre = jsonSave[idx].bxQntt;
                let add = item.bxQntt;
                jsonSave[idx].bxQntt = parseInt(pre) + parseInt(add);
                jsonSave[idx].regDt = getTime();

                updateCell(idx,5,jsonSave[idx].bxQntt);
                updateCell(idx,7,jsonSave[idx].regDt);
            }else{
            }
        }else{
            addRow(item);
        }
    }
    /**
     * @name fn_setLatestInfo
     * @description 하위 테이블 클릭시 상단으로 셋팅
     * @function
     */
    const selectLatestInfo = async function (element) {
        let idx = $(element).index();
        let jsonData = jsonSave[idx];

        let table = document.getElementById("saveTable");
        let elements = table.querySelectorAll('[id^="srch-"]');
        elements = Array.from(elements);

        for(let element of elements){
            let key = element.id.split('-').pop();
            SBUxMethod.set(element.id,jsonData[key]);
        }
    }
    const fn_add = async function(){
        let check = gfn_getTableElement("saveTable","srch-",["pltno","wrhsno","vrtyCd"]);
        if(!check){
            return;
        }
        let wrhsSeCd = "2";			// 입고구분 : 수탁
        let gdsSeCd = "1";			// 상품구분
        let trsprtSeCd = "1";		// 운송구분
        /** 해당 규격의 단중 **/
        let itemSpcfctCd = check.itemCd + check.spcfctCd;
        check.wght = jsonSpcfctCd.filter((item) => item.itemSpcfctCd === itemSpcfctCd)[0].wght;

        let wrhsno = check.wrhsno || '';
        check.apcCd = gv_selectedApcCd;
        check.wrhsSeCd = wrhsSeCd;
        check.gdsSeCd = gdsSeCd;
        check.trsprtSeCd = trsprtSeCd;
        check.vrtyCd = check.vrtyCd || '';
        // const data = await gfn_postJSON("/am/wrhs/selectWrhsno.do",{apcCd:gv_selectedApcCd,wrhsYmd:check.wrhsYmd});
        // if(data.resultStatus === 'S'){
        //     check.wrhsno = data.wrhsno;
        //     check.pltno = data.pltno;
        // }
        let itemNm = SBUxMethod.getText("srch-slt-itemCd");
        let vrtyNm = check.vrtyCd ? SBUxMethod.getText("srch-slt-vrtyCd") : '';
        let spcfctNm = SBUxMethod.getText("srch-slt-spcfctCd");

        check.itemNm = itemNm;
        check.vrtyNm = vrtyNm;
        check.spcfctNm = spcfctNm;

        await fn_setSaveTable(check);

        SBUxMethod.attr("srch-slt-itemCd","readonly","true");
        SBUxMethod.attr("srch-slt-vrtyCd","readonly","true");
        SBUxMethod.attr("srch-slt-spcfctCd","readonly","true");
    }

    const fn_deleteRow = async function(_el,event){
        event.stopPropagation();
        var row = $(_el).closest('tr');
        let idx = row.index();
        if(jsonSave[idx].wrhsno){
            if(!gfn_comConfirm("Q0001","저장된 입고실적입니다 삭제")){
                return;
            }
            const postJsonPromise = gfn_postJSON("/am/wrhs/deleteRawMtrWrhs.do", jsonSave[idx]);
            const data = await postJsonPromise;
            if(data.resultStatus === 'S'){
                gfn_comAlert("I0001");
            }
        }
        jsonSave.splice(idx,1);
        row.remove();
        fn_reset();
    }
    const fn_filterVrtyList = async function(){
        let flag = $("#filterVrtyCd").prop("checked");
        let prdcrCd = SBUxMethod.get("srch-inp-prdcrCd");

        if(flag){
           await fn_setVrtyHistory({apcCd:gv_selectedApcCd,prdcrCd:prdcrCd});
        }else{
            jsonApcVrty = [...jsonApcVrtyTemp];
            SBUxMethod.refresh('srch-slt-vrtyCd');
            SBUxMethod.set("srch-slt-itemCd", '');
        }
    }
    const fn_setVrtyHistory = async function(prdcr){
        if(gfn_isEmpty(prdcr))return;

        const postJsonPromise = gfn_postJSON("/am/wrhs/selectVrtyHistoryByPrdcr.do", prdcr);
        const data = await postJsonPromise;
        let history = data.resultList;
        /** 해제 대비 **/
        jsonApcVrtyTemp = [...jsonApcVrty];
        jsonApcVrty = jsonApcVrty.filter((item) => {
            return history.includes(item.itemVrtyCd);
        });
        SBUxMethod.refresh('srch-slt-vrtyCd');
        SBUxMethod.set("srch-slt-itemCd", '');
    }
    const fn_report = async function(){
        try{
            fn_autoPrint(jsonSave);
        }catch(e){
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
        }
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>