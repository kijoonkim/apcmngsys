<%
    /**
     * @Class Name : shpgotRegRawMtr.jsp
     * @Description : 반품 원물화면
     * @author SI개발부
     * @since 2024.11.25
     * @version 1.0
     * @Modification Information
     * @
     * @ 수정일        수정자        수정내용
     * @ ---------- ---------- ---------------------------
     * @ 2024.11.25     손민성       최초 생성
     * @see
     *
     */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>title : 반품등록(원물)</title>
    <%@ include file="../../../frame/inc/headerMeta.jsp" %>
    <%@ include file="../../../frame/inc/headerScript.jsp" %>
</head>
<body oncontextmenu="return false">
<section class="content container-fluid">
    <div class="box box-solid">
        <div class="box-header" style="display:flex; justify-content: flex-start;">
            <div>
                <c:set scope="request" var="menuNm" value="${comMenuVO.menuNm}"></c:set>
                <h3 class="box-title"> ▶ <c:out value='${menuNm}'></c:out></h3><!-- 반품등록(원물) -->
            </div>
            <%--            /** 상단 버튼 **/--%>
            <div style="margin-left: auto;">
                <sbux-button
                        id="btn-reset"
                        name="btn-reset"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="초기화"
                        onclick="fn_reset"
                ></sbux-button>
                <sbux-button
                        id="btn-save"
                        name="btn-save"
                        uitype="normal"
                        class="btn btn-sm btn-success"
                        text="반품등록"
                        onclick="fn_save"
                ></sbux-button>
                <sbux-button
                        id="btn-search"
                        name="btn-search"
                        uitype="normal"
                        class="btn btn-sm btn-outline-danger"
                        text="재고조회"
                        onclick="fn_search"
                ></sbux-button>
            </div>
        </div>
        <div class="box-body">
            <%@ include file="../../../frame/inc/apcSelect.jsp" %>
            <table id="searchTable" class="table table-bordered tbl_fixed">
                <colgroup>
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 7%">
                    <col style="width: 6%">
                    <col style="width: 3%">
                    <col style="width: 6%">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row" class="th_bg">입고일자</th>
                        <td class="td_input" colspan="3" style="border-right: hidden;border-top: hidden">
                            <sbux-datepicker
                                    uitype="range"
                                    id="srch-dtp-wrhsYmd"
                                    name="srch-dtp-wrhsYmd"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right input-sm-ast inpt_data_reqed input-sm"
                                    wrap-class="displayFlex"
                                    wrap-style="border:0;padding:0;"
                            />
                        </td>
                        <th scope="row" class="th_bg">품목/품종</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-itemCd"
                                    name="srch-slt-itemCd"
                                    class="form-control input-sm input-sm-ast"
                                    jsondata-ref="jsonApcItem"
                                    onchange="fn_onChangeSrchItemCd(this)"
                            />
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-vrtyCd"
                                    name="srch-slt-vrtyCd"
                                    class="form-control input-sm"
                                    jsondata-ref="jsonApcVrty"
                                    jsondata-value="itemVrtyCd"
                                    jsondata-text="vrtyNm"
                                    onchange="fn_onChangeSrchVrtyCd(this)"
                            />
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg">생산자</th>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-prdcrNm"
                                    name="srch-inp-prdcrNm"
                                    class="form-control input-sm input-sm-ast"
                                    placeholder="초성검색 가능"
                                    autocomplete-ref="jsonPrdcrAutocomplete"
                                    autocomplete-text="name"
                                    autocomplete-height="270px"
                                    onkeyup="fn_onKeyUpPrdcrNm(srch-inp-prdcrNm)"
                                    autocomplete-select-callback="fn_onSelectPrdcrNm"
                            ></sbux-input>
                            <sbux-input id="srch-inp-prdcrCd" name="srch-inp-prdcrCd" uitype="hidden"></sbux-input>
                        </td>
                        <td class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-prdcrIdentno"
                                    name="srch-inp-prdcrIdentno"
                                    class="form-control input-sm"
                                    maxlength="2"
                                    autocomplete="off"
                                    onchange="fn_onChangeSrchPrdcrIdentno(this)"
                            />
                        </td>
                        <td class="td_input">
                            <sbux-button
                                    id="srch-btn-prdcrNm"
                                    name="srch-btn-prdcrNm"
                                    class="btn btn-xs btn-outline-dark"
                                    text="찾기"
                                    uitype="modal"
                                    target-id="modal-prdcr"
                                    onclick="fn_choicePrdcr"
                            ></sbux-button>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="th_bg">창고구분</th>
                        <td class="td_input" colspan="2" style="border-right: hidden">
                            <sbux-select
                                    unselected-text="전체"
                                    uitype="single"
                                    id="srch-slt-warehouseSeCd"
                                    name="srch-slt-warehouseSeCd"
                                    class="form-control input-sm"
                                    style="width: 80%"
                                    jsondata-ref="jsonComWarehouse">
                            </sbux-select>
                        </td>
                        <td></td>
                        <th scope="row" class="th_bg">컨테이너/팔레트</th>
                        <td colspan= "5" class="td_input" style="border-right: hidden;">
                            <sbux-input
                                    uitype="text"
                                    id="srch-inp-pltno"
                                    name="srch-inp-pltno"
                                    class="form-control input-sm"
                                    autocomplete="off"
                            />
                        </td>
                        <td colspan= "2">쉼표로 분리</td>
                    </tr>
                </tbody>
            </table>
            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>원물재고 목록</span>
                        <span style="font-size:12px">(조회건수 <span id="cnt-invntr">0</span>건)</span>
                    </li>
                </ul>
            </div>
            <div class="table-responsive tbl_scroll_sm">
                <div id="sb-area-grdInvntr" style="height:284px;"></div>
            </div>
            <br />

            <div class="ad_tbl_top">
                <ul class="ad_tbl_count">
                    <li>
                        <span>반품대상 목록</span>
                        <span style="font-size:12px">(조회건수 <span id="cnt-shpgot">0</span>건)</span>
                    </li>
                </ul>
                <div style="display:flex;vertical-align:middle;float:right;margin-right:auto">
                    <div style="display: flex">
                        <div style="font-size: 13px;text-align:right;width:150px;font-weight: 700;padding: 8px">
                            <span>반품일자</span>
                        </div>
                        <div class="td_input">
                            <sbux-datepicker
                                    uitype="popup"
                                    id="dtl-dtp-shpgotYmd"
                                    name="dtl-dtp-shpgotYmd"
                                    date-format="yyyy-mm-dd"
                                    class="form-control pull-right input-sm inpt_data_reqed input-sm-ast"
                            ></sbux-datepicker>
                        </div>
                    </div>
                    <sbux-button
                            id="btn-addTrgt"
                            name="btn-addTrgt"
                            uitype="normal"
                            class="btn btn-sm btn-outline-dark"
                            onclick="fn_addTrgt"
                            text="대상추가"
                    ></sbux-button>
                </div>
            </div>
            <div class="table-responsive tbl_scroll_sm">
                <div id="sb-area-grdShpgot" style="height:200px;"></div>
            </div>
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
<script type="application/javascript">

    /** select Json **/
    var jsonComWarehouse = [];
    var jsonApcItem = [];
    var jsonApcVrty = [];

    /** 생산자 자동완성 **/
    var jsonPrdcr			= [];
    var jsonPrdcrAutocomplete = [];

    /** 반품 불량,사유코드 **/
    var jsonShpgotCsCd      = [];   // 사유코드
    var jsonShpgotBadCd     = [];   // 불량코드

    var grdInvntr;
    var jsonInvntr = [];

    var grdShpgot;
    var jsonShpgot = [];

    window.addEventListener("DOMContentLoaded",function(){
        fn_init();
    });

    const fn_init = async function(){

        jsonInvntr.length = 0;
        jsonShpgot.length = 0;

        // 일자 설정
        const nowDate = new Date();

        let firstYmd = gfn_dateFirstYmd(nowDate);
        let lastYmd = gfn_dateToYmd(nowDate);

        SBUxMethod.set("srch-dtp-wrhsYmd", firstYmd + "," + lastYmd);
        SBUxMethod.set("dtl-dtp-shpgotYmd", lastYmd);

        let result = await Promise.all([
            gfn_setComCdSBSelect('srch-slt-warehouseSeCd',	jsonComWarehouse, 	'WAREHOUSE_SE_CD', gv_selectedApcCd),	// 창고
            gfn_setApcItemSBSelect('srch-slt-itemCd', jsonApcItem, 	gv_selectedApcCd),
            gfn_setApcVrtySBSelect("srch-slt-vrtyCd", jsonApcVrty, 	gv_selectedApcCd),
            fn_getPrdcrs(),
            fn_getShpgotCsCd(),
            fn_getShpgotBadCd()
        ]);

        await fn_createGridInvntr();
        await fn_createGridShpgot();
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
     * @name fn_getShpgotCsCd
     * @description 반품사유코드 설정
     */
    const fn_getShpgotCsCd = async function() {

        jsonShpgotCsCd.length = 0;
        const param = {
            apcCd: gv_selectedApcCd,
            shpgotCrtrType: 'SHPGOT_RSN',
            crtrCd: 'SHPGOT_CS_CD',
            crtrUseYn: 'Y',
            crtrDtlUseYn: 'Y',
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/shpgot/selectCrtrDtlList.do", param);
            const data = await postJsonPromise;
            if (_.isEqual("S", data.resultStatus)) {
                data.resultList.forEach((item) => {
                    jsonShpgotCsCd.push(item);
                });
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }
    }

    /**
     * @name fn_getShpgotBadCd
     * @description 반품불량코드 설정
     */
    const fn_getShpgotBadCd = async function() {

        jsonShpgotBadCd.length = 0;
        const param = {
            apcCd: gv_selectedApcCd,
            shpgotCrtrType: 'SHPGOT_RSN',
            crtrCd: 'SHPGOT_BAD_CD',
            crtrUseYn: 'Y',
            crtrDtlUseYn: 'Y',
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/shpgot/selectCrtrDtlList.do", param);
            const data = await postJsonPromise;
            if (_.isEqual("S", data.resultStatus)) {
                data.resultList.forEach((item) => {
                    jsonShpgotBadCd.push(item);
                });
            }
        } catch (e) {
            if (!(e instanceof Error)) {
                e = new Error(e);
            }
            console.error("failed", e.message);
        }
    }

    /**
     * @name fn_reset
     * @description 초기화
     * @function
     */
    const fn_reset = async function() {
        await fn_init();
    }

    /**
     * @name fn_createGridInvntr
     * @description 원물재고 그리드 생성
     * @function
     */
    const fn_createGridInvntr = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdInvntr';
        SBGridProperties.id = 'grdInvntr';
        SBGridProperties.jsonref = 'jsonInvntr';
        //SBGridProperties.rowheader = ['update'];
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.frozencols = 2;
        SBGridProperties.columns = [
            {
                caption : ["선택","선택"],
                ref: 'checkedYn', type: 'checkbox',  width:'50px',
                style: 'text-align:center',
                userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {   caption: ["입고일자","입고일자"],
                ref: 'wrhsYmd',
                type: 'output',
                width:'120px',
                style: 'text-align:center',
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
            },
            {
                caption: ["컨테이너<br>팔레트","컨테이너<br>팔레트"],
                ref: 'pltno',
                type: 'output',
                width:'120px',
                style: 'text-align:center'
            },
            {
                caption: ["생산자","생산자"],
                ref: 'prdcrNm',
                type: 'output',
                width:'80px',
                style: 'text-align:center'
            },
            {
                caption: ["품목","품목"],
                ref: 'itemNm',
                type: 'output',
                width:'80px',
                style: 'text-align:center'
            },
            {
                caption: ["품종","품종"],
                ref: 'vrtyNm',
                type: 'output',
                width:'100px',
                style: 'text-align:center'
            },
            {
                caption: ["등급","등급"],
                ref: 'grdNm',
                type: 'output',
                width:'80px',
                style: 'text-align:center'
            },
            {
                caption: ["창고","창고"],
                ref: 'warehouseSeCd',
                type: 'combo',
                width:'120px',
                style: 'text-align:center',
                typeinfo: {
                    ref:'jsonComWarehouse',
                    label:'label',
                    value:'value',
                    displayui : false,
                },
                disabled: true,
            },
            {
                caption: ["원물재고","수량"],
                ref: 'invntrQntt',
                type: 'output',
                width:'70px',
                style: 'text-align:right',
                format : {type:'number', rule:'#,###'}
            },
            {
                caption: ["원물재고","중량 (Kg)"],
                ref: 'invntrWght',
                type: 'output',
                width:'70px',
                style: 'text-align:right',
                format : {type:'number', rule:'#,###'}
            },
            {
                caption: ["반품등록","수량"],
                ref: 'shpgotQntt',
                type: 'input',
                width:'70px',
                style: 'text-align:right;background-color:#FFF8DC;',
                userattr: {colNm: "shpgotQntt"},
                typeinfo: {
                    mask : {alias : '#', repeat: '*', unmaskvalue : true},
                    maxlength: 13,
                    oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
            },
            {
                caption: ["반품등록","중량 (Kg)"],
                ref: 'shpgotWght',  		type:'input',  width:'70px', 	style: 'text-align:right;background-color:#FFF8DC;',
                userattr: {colNm: "shpgotWght"},
                typeinfo: {
                    mask : {alias : '#', repeat: '*', unmaskvalue : true},
                    maxlength: 20,
                    oneclickedit: true
                },
                format : {type:'number', rule:'#,###'}
            },
            { caption: [" "],		ref: '_',				type:'output', width:'1px'}
        ];

        grdInvntr = _SBGrid.create(SBGridProperties);
        grdInvntr.bind('valuechanged' , fn_grdInvntrValueChanged);
    }

    /**
     * @name fn_grdInvntrValueChanged
     * @description 원물재고 변경 event 처리
     * @function
     */
    const fn_grdInvntrValueChanged = function() {

        var nRow = grdInvntr.getRow();
        var nCol = grdInvntr.getCol();

        const usrAttr = grdInvntr.getColUserAttr(nCol);

        if (!gfn_isEmpty(usrAttr) && usrAttr.hasOwnProperty('colNm')) {

            const rowData = grdInvntr.getRowData(nRow, false);	// deep copy

            console.log("rowData", rowData);
            let invntrQntt = parseInt(rowData.invntrQntt) || 0;
            let invntrWght = parseInt(rowData.invntrWght) || 0;

            let qntt = parseInt(rowData.shpgotQntt) || 0;
            let wght = parseInt(rowData.shpgotWght) || 0;

            let wrhsQntt = parseInt(rowData.wrhsQntt) || 0;
            let wrhsWght = parseInt(rowData.wrhsWght) || 0;

            switch (usrAttr.colNm) {

                case "checkedYn":
                    if (_.isEqual("Y", rowData.checkedYn)) {
                        rowData.shpgotQntt = invntrQntt;
                        rowData.shpgotWght = invntrWght;
                    } else {
                        rowData.shpgotQntt = 0;
                        rowData.shpgotWght = 0;
                    }

                    grdInvntr.refresh({"focus":false});

                    break;

                case "shpgotQntt":

                    if (qntt <= 0) {
                        rowData.checkedYn = "N";
                        rowData.shpgotQntt = 0;
                        rowData.shpgotWght = 0;
                    } else if (invntrQntt === 0) {
                        if (qntt > invntrQntt) {
                            rowData.shpgotWght = invntrWght;
                            rowData.checkedYn = "Y";
                        }
                    } else {
                        if (qntt > invntrQntt) {
                            gfn_comAlert("W0008", "재고수량", "반품수량");		//	W0008	{0} 보다 {1}이/가 큽니다.
                            rowData.checkedYn = "N";
                            rowData.shpgotQntt = 0;
                            rowData.shpgotWght = 0;
                        } else {
                            rowData.checkedYn = "Y";

                            if (wrhsQntt > 0) {
                                rowData.shpgotWght = gfn_apcEstmtWght(wrhsWght * qntt / wrhsQntt, gv_selectedApcCd);
                            } else {
                                rowData.shpgotWght = gfn_apcEstmtWght(invntrWght * qntt / invntrQntt, gv_selectedApcCd);
                            }
                        }
                    }

                    grdInvntr.refresh({"focus":false});

                    break;

                case "shpgotWght":

                    if (invntrWght - wght < 0){
                        gfn_comAlert("W0008", "재고중량", "반품중량");		//	W0008	{0} 보다 {1}이/가 큽니다.
                        rowData.checkedYn = "N";
                        rowData.shpgotQntt = 0;
                        rowData.shpgotWght = 0;
                        grdInvntr.refresh({"focus":false});
                        return;
                    }

                    if (wght <= 0) {
                        rowData.checkedYn = "N";
                        rowData.shpgotQntt = 0;
                        rowData.shpgotWght = 0;
                    } else {
                        rowData.checkedYn = "Y";
                    }

                    grdInvntr.refresh({"focus":false});

                    break;

                default:
                    break;
            }
        }
    }

    /**
     * @name fn_createGridShpgot
     * @description 반품대상 그리드 생성
     * @function
     */
    const fn_createGridShpgot = function() {
        var SBGridProperties = {};
        SBGridProperties.parentid = 'sb-area-grdShpgot';
        SBGridProperties.id = 'grdShpgot';
        SBGridProperties.jsonref = 'jsonShpgot';
        SBGridProperties.emptyrecords = '데이터가 없습니다.';
        SBGridProperties.selectmode = 'free';
        SBGridProperties.allowcopy = true;
        SBGridProperties.extendlastcol = 'scroll';
        SBGridProperties.useinitsorting = true;
        SBGridProperties.scrollbubbling = false;
        SBGridProperties.frozencols = 2;
        SBGridProperties.columns = [
            {
                caption : ["선택","선택"],
                ref: 'checkedYn', type: 'checkbox',  width:'50px',
                style: 'text-align:center',
                userattr: {colNm: "checkedYn"},
                typeinfo : {checkedvalue: 'Y', uncheckedvalue: 'N'}
            },
            {   caption: ["입고일자","입고일자"],
                ref: 'wrhsYmd',
                type: 'output',
                width:'120px',
                style: 'text-align:center',
                format : {type:'date', rule:'yyyy-mm-dd', origin:'yyyymmdd'}
            },
            {
                caption: ["컨테이너<br>팔레트","컨테이너<br>팔레트"],
                ref: 'pltno',
                type: 'output',
                width:'120px',
                style: 'text-align:center'
            },
            {
                caption: ["생산자","생산자"],
                ref: 'prdcrNm',
                type: 'output',
                width:'80px',
                style: 'text-align:center'
            },
            {
                caption: ["품목","품목"],
                ref: 'itemNm',
                type: 'output',
                width:'80px',
                style: 'text-align:center'
            },
            {
                caption: ["품종","품종"],
                ref: 'vrtyNm',
                type: 'output',
                width:'100px',
                style: 'text-align:center'
            },
            {
                caption: ["등급","등급"],
                ref: 'grdNm',
                type: 'output',
                width:'80px',
                style: 'text-align:center'
            },
            {
                caption: ["창고","창고"],
                ref: 'warehouseSeCd',
                type: 'combo',
                width:'120px',
                style: 'text-align:center',
                typeinfo: {
                    ref:'jsonComWarehouse',
                    label:'label',
                    value:'value',
                    displayui : false,
                },
                disabled: true,
            },
            {
                caption: ["반품등록","수량"],
                ref: 'shpgotQntt',
                type: 'input',
                width:'70px',
                style: 'text-align:right;background-color:#FFF8DC;',
                userattr: {colNm: "shpgotQntt"},
                typeinfo: {
                    mask : {alias : '#', repeat: '*', unmaskvalue : true},
                    maxlength: 13,
                    oneclickedit: true
                },
                format : {type:'number', rule:'#,###'},
                disabled: true,
            },
            {
                caption: ["반품등록","중량 (Kg)"],
                ref: 'shpgotWght',  		type:'input',  width:'70px', 	style: 'text-align:right;background-color:#FFF8DC;',
                userattr: {colNm: "shpgotWght"},
                typeinfo: {
                    mask : {alias : '#', repeat: '*', unmaskvalue : true},
                    maxlength: 20,
                    oneclickedit: true
                },
                format : {type:'number', rule:'#,###'},
                disabled: true,
            },
            {
                caption: ["반품사유","원인코드"],
                ref: 'shpgotCsCd',
                type: 'combo',
                width:'120px',
                style: 'text-align:center',
                typeinfo: {
                    ref:'jsonShpgotCsCd',
                    label:'dtlIndctNm',
                    value:'dtlCd',
                    displayui : true,
                    oneclickedit: true,
                    unselect: {label: '', value: ''}
                },
            },
            {
                caption: ["반품사유","불량코드"],
                ref: 'shpgotBadCd',
                type: 'combo',
                width:'120px',
                style: 'text-align:center',
                typeinfo: {
                    ref:'jsonShpgotBadCd',
                    label:'dtlIndctNm',
                    value:'dtlCd',
                    displayui : true,
                    oneclickedit: true,
                    unselect: {label: '', value: ''}
                },
            },
            {
                caption: ["반품사유","비고"],
                ref: 'shpgotRmrk',
                type:'input',
                width:'200px',
                style: 'text-align:left',
                userattr: {colNm: "shpgotRmrk"},
            },
        ];

        grdShpgot = _SBGrid.create(SBGridProperties);
    }


    /**
     * @name fn_search
     * @description 재고조회 버튼
     * @function
     */
    const fn_search = async function() {
        jsonShpgot.length = 0;
        grdShpgot.refresh();
        document.querySelector('#cnt-shpgot').innerText = jsonShpgot.length;

        await fn_setGrdInvntr();
    }


    /**
     * @name fn_setGrdInvntr
     * @description 원물재고 조회
     * @function
     */
    const fn_setGrdInvntr = async function() {

        jsonInvntr.length = 0;

        // 재고 조회
        let wrhsYmdFrom = SBUxMethod.get('srch-dtp-wrhsYmd_from');    // 입고일자from
        let wrhsYmdTo = SBUxMethod.get('srch-dtp-wrhsYmd_to');        // 입고일자to
        let prdcrCd = gfn_nvl(SBUxMethod.get("srch-inp-prdcrCd"));		// 생산자
        let itemCd = SBUxMethod.get("srch-slt-itemCd");				    // 품목
        let vrtyCd = SBUxMethod.get("srch-slt-vrtyCd");                 // 품종
        let pltno = gfn_nvl(SBUxMethod.get("srch-inp-pltno"));
        if (!gfn_isEmpty(vrtyCd)) {
            vrtyCd = vrtyCd.substring(4);
        }

        try {
            const postJsonPromise = gfn_postJSON("/am/invntr/selectRawMtrInvntrListForRslt.do", {
                apcCd: gv_selectedApcCd,
                wrhsYmdFrom: wrhsYmdFrom,
                wrhsYmdTo: wrhsYmdTo,
                prdcrCd: prdcrCd,
                itemCd: itemCd,
                vrtyCd: vrtyCd,
                pltno: pltno,
            });

            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                data.resultList.forEach((item, index) => {
                    item.shpgotQntt = 0;
                    item.shpgotWght = 0;
                    jsonInvntr.push(item);
                });

                grdInvntr.rebuild();

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

        document.querySelector('#cnt-invntr').innerText = jsonInvntr.length;
    }


    /**
     * @name fn_addTrgt
     * @description 반품대상 추가
     * @function
     */
    const fn_addTrgt = async function() {

        const allData = grdInvntr.getGridDataAll();
        const rowsForAdd = [];

        for ( let i=0; i<allData.length; i++ ) {
            const invntr = allData[i];
            if (_.isEqual("Y", invntr.checkedYn)) {

                const qntt = parseFloat(invntr.shpgotQntt) || 0;
                const wght = parseFloat(invntr.shpgotWght) || 0;


                // 반품 수량, 중량 확인
                if (qntt <= 0 && wght <= 0) {
                    gfn_comAlert("W0005", "반품량");
                    return;
                }

                let isExist = false;
                for ( let iCheck=0; iCheck<jsonShpgot.length; iCheck++ ) {
                    const shpgot = jsonShpgot[iCheck];
                    if (_.isEqual(invntr.wrhsno, shpgot.wrhsno)) {
                        isExist = true;
                        break;
                    }
                }

                if (isExist) {
                    continue;
                }

                rowsForAdd.push(invntr);
            }
        }

        if (rowsForAdd.length > 0) {
            grdShpgot.addRows(rowsForAdd);
            grdShpgot.refresh();
        }

    }

    /**
     * @name fn_choicePrdcr
     * @description 생산자 팝업 호출
     */
    const fn_choicePrdcr = function() {
        popPrdcr.init(gv_selectedApcCd, gv_selectedApcNm, fn_setPrdcr, SBUxMethod.get("srch-inp-prdcrNm"));
    }

    /**
     * @name fn_setPrdcr
     * @description 생산자 선택 callback
     */
    const fn_setPrdcr = function(prdcr) {
        if (!gfn_isEmpty(prdcr)) {
            SBUxMethod.set("srch-inp-prdcrNm", prdcr.prdcrNm);		// callBack input
            SBUxMethod.set("srch-inp-prdcrCd", prdcr.prdcrCd);		// callBack input
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");
        } else {
            fn_clearPrdcr();
        }
    }

    /**
     * @name fn_onInputPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onInputPrdcrNm = function(prdcrNm){
        fn_clearPrdcr();
        if (gfn_getByteLengthOfString(prdcrNm.target.value) > 100){
            SBUxMethod.set("srch-inp-prdcrNm", "");
            return;
        }
        jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm.target.value, jsonPrdcr);
        SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

    /**
     * @name fn_clearPrdcr
     * @description 생산자 폼 clear
     */
    const fn_clearPrdcr = function() {
        SBUxMethod.set("srch-inp-prdcrCd", "");
        SBUxMethod.set("srch-inp-prdcrNm", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");
    }

    /**
     * @name fn_onKeyUpPrdcrNm
     * @description 생산자명 입력 시 event : autocomplete
     */
    const fn_onKeyUpPrdcrNm = function(prdcrNm){

        SBUxMethod.set("srch-inp-prdcrCd", "");
        SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:''");

        if (gfn_getByteLengthOfString(prdcrNm) > 100){
            SBUxMethod.set("srch-inp-prdcrNm", "");

            return;
        }
        jsonPrdcrAutocomplete = gfn_filterFrst(prdcrNm, jsonPrdcr);
        SBUxMethod.changeAutocompleteData('srch-inp-prdcrNm', true);
    }

    /**
     * @name fn_onSelectPrdcrNm
     * @description 생산자 autocomplete 선택 callback
     */
    function fn_onSelectPrdcrNm(value, label, item) {
        // 생산자 명 중복 체크. 중복일 경우 팝업 활성화.
        if (jsonPrdcr.filter(e => e.prdcrNm === label).length > 1){
            document.getElementById('srch-btn-prdcrNm').click();
        } else{
            SBUxMethod.set("srch-inp-prdcrCd", value);
            SBUxMethod.attr("srch-inp-prdcrNm", "style", "background-color:aquamarine");	//skyblue
            let prdcr = _.find(jsonPrdcr, {prdcrCd: value});
        }
    }

    /**
     * @name fn_onChangeSrchItemCd
     * @description 품목 선택 변경 event
     */
    const fn_onChangeSrchItemCd = async function(obj) {
        let itemCd = obj.value;
        let result = await Promise.all([
            gfn_setApcVrtySBSelect('srch-slt-vrtyCd', jsonApcVrty, gv_selectedApcCd, itemCd),
        ]);
    }

    /**
     * @name fn_onChangeSrchVrtyCd
     * @description 품종 선택 변경 event
     */
    const fn_onChangeSrchVrtyCd = async function(obj) {
        let vrtyCd = obj.value;
        const itemCd = vrtyCd.substring(0,4);

        const prvItemCd = SBUxMethod.get("srch-slt-itemCd");
        if(!gfn_isEmpty(vrtyCd)){
            if (itemCd != prvItemCd) {
                SBUxMethod.set("srch-slt-itemCd", itemCd);
                await fn_onChangeSrchItemCd({value: itemCd});
                SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
            } else{
                SBUxMethod.set("srch-slt-itemCd", itemCd);
                await fn_onChangeSrchItemCd({value: itemCd});
                SBUxMethod.set("srch-slt-vrtyCd", vrtyCd);
            }
        }
    }

    /**
     * @name fn_save
     * @description 반품등록
     * @function
     */
    const fn_save = async function(){

        const shpgotYmd = SBUxMethod.get("dtl-dtp-shpgotYmd");

        if (gfn_isEmpty(shpgotYmd)) {
            gfn_comAlert("W0001", "반품일자");		//	W0001	{0}을/를 선택하세요.
        }

        const shpgotList = []

        // 반품 수량, 중량 확인
        const allData = grdShpgot.getGridDataAll();

        for ( let i=0; i<allData.length; i++ ) {
            const shpgot = allData[i];

            if (shpgot.shpgotQntt <= 0 && shpgot.shpgotWght <= 0) {
                gfn_comAlert("W0005", "반품량");
                return;
            }

            shpgotList.push(shpgot);
        }

        if (shpgotList.length == 0) {
            gfn_comAlert("W0003", "반품등록");       // {0}할 대상이 없습니다.
            return;
        }

        if (!gfn_comConfirm("Q0001", "반품등록")){
            return;
        }

        const param = {
            apcCd: gv_selectedApcCd,
            shpgotYmd: shpgotYmd,
            rsltList: shpgotList
        }
        console.log(param);
        try {
            const postJsonPromise = gfn_postJSON("/am/shpgot/insertShpgotRsltRawMtr.do", param);
            const data = await postJsonPromise;

            if (_.isEqual("S", data.resultStatus)) {
                gfn_comAlert("I0001");	// I0001	처리 되었습니다.
                await fn_search();
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
</script>
<%@ include file="../../../frame/inc/bottomScript.jsp" %>
</html>