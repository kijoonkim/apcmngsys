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
        #latestInfoBody > tr:hover{
            background-color : #FFF8DC;
            cursor: pointer;
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
                        onclick="fn_docRawMtrWrhs"
                        text="리포트 발행"
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
                                onchange="fn_onChangeSrchItemCd(this)"
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
<%--                                onchange="fn_onChangeSrchVrtyCd(this)"--%>
                        ></sbux-select>
                    </td>
                    <td colspan="2"class="td_input" style="border-right: hidden;">
                        <p class="ad_input_row chk-mbl" style="vertical-align:middle;">
                            <input
                                    style="width:20px;height:20px;"
                                    type="checkbox"
                                    id="fxngItem"
                                    checked
                            />
                            <label for="fxngItem">고정</label>
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
                                    class="input-sm-ast inpt_data_reqed inpt-mbl"
                                    jsondata-ref="jsonSpcfctCd">
                            </sbux-select>
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-bxQntt"
                                    name="srch-inp-bxQntt"
                                    class="inpt-mbl"
                                    maxlength="2"
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
                                class="input-sm-ast inpt_data_reqed inpt-mbl"
                                jsondata-ref="jsonComWarehouse">
                        </sbux-select>
                    </td>
                    <td colspan="2" class="td_input" style="border-right: hidden;">
                        <p class="ad_input_row chk-mbl" style="vertical-align:middle;">
                            <input
                                    style="width:20px;height:20px;"
                                    type="checkbox"
                                    id="fxngWarehouseSeCd"
                                    checked
                            />
                            <label for="fxngWarehouseSeCd">고정</label>
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
                                        id="fxngWarehouseSeCd1"
                                        checked
                                />
                                <label for="fxngWarehouseSeCd1">고정</label>
                            </p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row" class="th_bg th-mbl">팔레트번호</th>
                    <td colspan="3" class="td_input" style="border-right: hidden;">
                        <sbux-input uitype="text" id="srch-inp-pltno" name="srch-inp-pltno" class="inpt-mbl dsp-wght" style="border-right: hidden;" readonly></sbux-input>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="box-body" id="latestInfo">
            <table class="table table-bordered tbl_fixed tbl_mbl">
                <colgroup>
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 20%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
                    <col style="width: 10%">
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
            fn_initSBRadio(),
            fn_getPrdcrs(),
            fn_setLatestInfo()
        ]);

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
        console.log(rst[3],"검수자");
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
     * @name fn_save
     * @description 저장 버튼
     */
    const fn_save = async function() {
        let check = gfn_getTableElement("saveTable","srch-",["pltno"]);
        if(check){
            console.log("머가안댓다고");
        }
        let wrhsSeCd = "2";			// 입고구분 : 수탁
        let gdsSeCd = "1";			// 상품구분
        let trsprtSeCd = "1";		// 운송구분

        let wrhsno = check.wrhsno || '';
        check.apcCd = gv_selectedApcCd;
        check.wrhsSeCd = wrhsSeCd;
        check.gdsSeCd = gdsSeCd;
        check.trsprtSeCd = trsprtSeCd;
        check.vrtyCd = check.vrtyCd.slice(4,8);

        console.log(check,"저장전");


        let postJsonPromise;
        if(gfn_isEmpty(wrhsno)){
            let postUrl ="/am/wrhs/insertRawMtrWrhs.do";
            postJsonPromise = gfn_postJSON(postUrl, check);
        }else{
            let	postUrl ="/am/wrhs/updateRawMtrWrhs.do";
            let updateRawMtrWrhs = PrdcrLatestInfo.filter(el => el.wrhsno == wrhsno);
            let updateVo = {...updateRawMtrWrhs[0],...check};
            postJsonPromise = gfn_postJSON(postUrl, updateVo);
        }
        const data = await postJsonPromise;

        try {
            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                fn_clearForm();
                //fn_search();

                //if(SBUxMethod.get("srch-chk-autoPrint")["srch-chk-autoPrint"]){

                fn_autoPrint(data.resultMap);


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
        await fn_setLatestInfo();

    }


    /**
     * @name fn_autoPrint
     * @description 자동 리포트발행
     */
    const fn_autoPrint = async function(resultMap){
        const rptUrl = await gfn_getReportUrl(gv_selectedApcCd, 'RT_DOC');
        if(document.querySelector('#srch-chk-autoPrint').checked){
            if(!document.querySelector('#srch-chk-exePrint').checked){
                gfn_exeDirectPrint(rptUrl, {apcCd: gv_selectedApcCd, wrhsno: resultMap.wrhsno,element : 'div-rpt-clipReportPrint'});
            }else{
                gfn_DirectPrintClipReport(rptUrl, {apcCd: gv_selectedApcCd, wrhsno: resultMap.wrhsno,element : 'div-rpt-clipReportPrint'});
            }
        }else{
            gfn_popClipReport("원물인식표", rptUrl, {apcCd: gv_selectedApcCd, wrhsno: resultMap.wrhsno});
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
            prdcr.itemVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;

            fn_setPrdcrForm(prdcr);

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
            // SBUxMethod.set("srch-inp-bxQntt", "");
            $("#srch-inp-bxQntt").val("");
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

            fn_setPrdcrForm(prdcr);
        }
    }
    /**
     * @name fn_setPrdcrForm
     * @description 생산자 선택후 생산자 정보 셋팅s
     */
    const fn_setPrdcrForm = async function(prdcr) {

        if (!gfn_isEmpty(prdcr.rprsVrtyCd)) {	// 대표품종
            const rprsVrtyCd = prdcr.rprsItemCd + prdcr.rprsVrtyCd;
            await gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);
            SBUxMethod.set("srch-slt-vrtyCd", rprsVrtyCd);
            fn_onChangeSrchVrtyCd({value:rprsVrtyCd});
        } else {
            if (!gfn_isEmpty(prdcr.rprsItemCd)) {	// 대표품목
                const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
                if (prvItemCd != prdcr.rprsItemCd) {
                    SBUxMethod.set("srch-slt-itemCd", prdcr.rprsItemCd);
                    fn_onChangeSrchItemCd({value:prdcr.rprsItemCd});
                }
            }
        }

        if (!gfn_isEmpty(prdcr.wrhsSeCd)) {	// 입고구분
            SBUxMethod.set("srch-rdo-wrhsSeCd", prdcr.wrhsSeCd);
        }
        if (!gfn_isEmpty(prdcr.gdsSeCd)) {	// 상품구분
            SBUxMethod.set("srch-rdo-gdsSeCd", prdcr.gdsSeCd);
        }
        if (!gfn_isEmpty(prdcr.trsprtSeCd)) {	// 운송구분
            SBUxMethod.set("srch-rdo-trsprtSeCd", prdcr.trsprtSeCd);
        }
        if (!gfn_isEmpty(prdcr.vhclno)) {	// 차량번호
            SBUxMethod.set("srch-inp-vhclno", prdcr.vhclno);
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
        }

        SBUxMethod.set("srch-inp-prdcrCd", prdcrInfo.prdcrCd);
        SBUxMethod.set("srch-inp-prdcrNm", prdcrInfo.prdcrNm);
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue

        fn_setPrdcrForm(prdcrInfo);
    }


    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(obj) {
        let itemCd = obj.value;

        let result = await Promise.all([
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),			// 품종
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
            await fn_onChangeSrchItemCd({value: itemCd});
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

        //if (!SBUxMethod.get("srch-chk-fxngItem")["srch-chk-fxngItem"]) {
        if (!document.querySelector('#srch-chk-fxngItem').checked) {

            // 입고일자
            SBUxMethod.set("srch-dtp-wrhsYmd", gfn_dateToYmd(new Date()));
            // 생산연도
            // SBUxMethod.set("srch-dtp-prdctnYr", gfn_dateToYear(new Date()));

            // 생산자 clear
            SBUxMethod.set("srch-inp-prdcrCd", "");
            SBUxMethod.set("srch-inp-prdcrNm", "");
            SBUxMethod.set("srch-inp-prdcrIdentno", "");
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "");	//skyblue

            // 품목
            SBUxMethod.set("srch-slt-itemCd", "");
            // 품종
            SBUxMethod.set("srch-slt-vrtyCd", "");
            SBUxMethod.set("srch-inp-wghtAvg", "");

            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd);	// 품종
        }

        //if (!SBUxMethod.get("srch-chk-fxngWarehouseSeCd")["srch-chk-fxngWarehouseSeCd"]) {
        if (!document.querySelector('#srch-chk-fxngWarehouseSeCd').checked) {
            // 창고
            if (jsonComWarehouse.length > 0) {
                SBUxMethod.set("srch-slt-warehouseSeCd", jsonComWarehouse[0].value);
            }

        }

        // 수량
        // SBUxMethod.set("srch-inp-bxQntt", "");
        $("#srch-inp-bxQntt").val("");
        // 중량
        // SBUxMethod.set("srch-inp-wrhsWght", "");
        $("#srch-inp-wrhsWght").val("");
        // 입고번호
        SBUxMethod.set("srch-inp-wrhsno", "");
        // 팔레트번호
        SBUxMethod.set("srch-inp-pltno", "");

    }

    const fn_close = function(){
        parent.gfn_tabClose("TAB_AM_001_008");
    }

    /**
     * @name fn_setLatestInfo
     * @description 진입후 최근 3건 조회
     * @function
     */
    const fn_setLatestInfo = async function(){
        PrdcrLatestInfo.length = 0;
        $("#latestInfoBody").empty();
        let wrhsYmd = SBUxMethod.get("srch-dtp-wrhsYmd");	// 입고일자
        const postJsonPromise = gfn_postJSON("/am/wrhs/selectRawMtrWrhsLatestInfoList.do", {
            apcCd: gv_selectedApcCd,
            wrhsYmd: wrhsYmd,
            pagingYn : 'N',
        });
        try {

            const data = await postJsonPromise;

            if (!_.isEqual("S", data.resultStatus)) {
                gfn_comAlert(data.resultCode, data.resultMessage);
                return;
            }
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
                    prcsType: item.prcsType,
                    prcsTypeNm: item.prcsTypeNm,
                    stdGrd: item.stdGrd,
                    stdGrdCd: item.stdGrdCd,
                    prdcrIdentno: item.prdcrIdentno
                }
                PrdcrLatestInfo.push(rawMtrWrhs);
                let originalDate = item.wrhsYmd;
                let formattedDate = originalDate.slice(4, 6) + "-" + originalDate.slice(6);

                let originalTime = item.sysLastChgDt;
                let formattedTime = originalTime.substring(11, 16);

                let element = '<tr onclick="selectLatestInfo(this)">' +
                    '<td>' + (item.prdcrNm|| '') + '</td>' +
                    '<td style="display:none">' + (item.wrhsno|| '') + '</td>' +
                    '<td>' + (item.prdcrIdentno|| '0')+'</td>' +
                    '<td>' + (item.pltno|| '') + '</td>' +
                    '<td>' + (item.itemNm|| '') + '</td>' +
                    '<td>' + (item.vrtyNm|| '') + '</td>' +
                    '<td>' + (item.bxQntt|| '') + '</td>' +
                    '<td>' + (formattedDate|| '') + '</td>' +
                    '<td>' + (formattedTime|| '') + '</td>' +
                    '</tr>';
                $("#latestInfoBody").append(element);
            });


        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
            gfn_comAlert("E0001");	//	E0001	오류가 발생하였습니다.
        }
    }
    //최근목록 click event
    const selectLatestInfo = async function (element) {
        var cells = element.querySelectorAll('td');
        var rowData = Array.from(cells).map(cell => cell.innerText);
        rawMtrWrhs = await PrdcrLatestInfo.filter(el => el.wrhsno == rowData[1]);
        // 등록 상태 세팅
        SBUxMethod.set("srch-inp-prdcrCd", rawMtrWrhs[0].prdcrCd);
        SBUxMethod.set("srch-inp-prdcrNm", rawMtrWrhs[0].prdcrNm);
        SBUxMethod.set("srch-slt-warehouseSeCd", rawMtrWrhs[0].wrhsSeCd);
        // SBUxMethod.set("srch-inp-bxQntt", rawMtrWrhs[0].bxQntt);
        $("#srch-inp-bxQntt").val(rawMtrWrhs[0].bxQntt);
        SBUxMethod.set("srch-inp-wrhsno", rawMtrWrhs[0].wrhsno);
        SBUxMethod.set("srch-inp-pltno",rawMtrWrhs[0].pltno);
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");
        //품목 품종 세팅 필요값 설정
        rawMtrWrhs[0].rprsVrtyCd =rawMtrWrhs[0].vrtyCd;
        rawMtrWrhs[0].rprsItemCd =rawMtrWrhs[0].itemCd;
        await fn_setPrdcrForm(rawMtrWrhs[0]);
        fn_onChangeBxQntt();
    }

</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>